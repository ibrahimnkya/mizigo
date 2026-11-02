import 'package:intl/intl.dart';

import '../models/parcel_model.dart';

/// Natural-language search over parcels already loaded on the device.
///
/// Every query word must match somewhere (AND), so "dar dodoma express"
/// narrows instead of widening. Understands:
/// - `from PLACE` / `to PLACE` to target origin or destination,
/// - status words and synonyms ("on the way", "arrived", "cancelled"…),
/// - "express"/"urgent", dates ("today", "yesterday", "march", "12 mar"),
/// - phone numbers in either local (07…) or international (2557…) form.
/// Results are ranked: exact tracking-number hits first, then by relevance,
/// then newest first.
List<ParcelModel> searchParcels(List<ParcelModel> parcels, String query) {
  final tokens = _tokenize(query);
  if (tokens.isEmpty) return parcels;

  final scored = <(ParcelModel, int)>[];
  for (final p in parcels) {
    final doc = _ParcelDoc(p);
    var total = 0;
    var matchedAll = true;
    for (final t in tokens) {
      final s = doc.score(t);
      if (s == 0) {
        matchedAll = false;
        break;
      }
      total += s;
    }
    if (matchedAll) scored.add((p, total));
  }
  scored.sort((a, b) {
    final byScore = b.$2.compareTo(a.$2);
    return byScore != 0 ? byScore : b.$1.createdAt.compareTo(a.$1.createdAt);
  });
  return [for (final s in scored) s.$1];
}

enum _Field { any, from, to }

class _Token {
  const _Token(this.text, this.field);
  final String text;
  final _Field field;
}

const _stopWords = {'the', 'a', 'an', 'of', 'for', 'parcel', 'parcels', 'booking', 'bookings', 'and', 'with', 'by'};

/// Phrases that mean a status, mapped to a single canonical word.
const _phrases = {
  'on the way': 'intransit',
  'in transit': 'intransit',
  'at station': 'atstation',
  'at the station': 'atstation',
  'last week': 'lastweek',
};

List<_Token> _tokenize(String raw) {
  var q = raw.toLowerCase().trim();
  _phrases.forEach((k, v) => q = q.replaceAll(k, v));
  final words = q.split(RegExp(r'[\s,]+')).where((w) => w.isNotEmpty).toList();
  final out = <_Token>[];
  for (var i = 0; i < words.length; i++) {
    final w = words[i];
    if ((w == 'from' || w == 'to') && i + 1 < words.length) {
      out.add(_Token(words[++i], w == 'from' ? _Field.from : _Field.to));
    } else if (!_stopWords.contains(w) && w != 'from' && w != 'to') {
      out.add(_Token(w, _Field.any));
    }
  }
  return out;
}

/// Status synonyms → statuses they match.
const _statusWords = <String, Set<ParcelStatus>>{
  'received': {ParcelStatus.received},
  'booked': {ParcelStatus.received},
  'new': {ParcelStatus.received},
  'pending': {ParcelStatus.received},
  'dispatched': {ParcelStatus.dispatched, ParcelStatus.inTransit},
  'sent': {ParcelStatus.dispatched, ParcelStatus.inTransit},
  'intransit': {ParcelStatus.inTransit, ParcelStatus.dispatched},
  'transit': {ParcelStatus.inTransit, ParcelStatus.dispatched},
  'moving': {ParcelStatus.inTransit, ParcelStatus.dispatched},
  'atstation': {ParcelStatus.atStation, ParcelStatus.offloaded},
  'station': {ParcelStatus.atStation, ParcelStatus.offloaded},
  'arrived': {ParcelStatus.atStation, ParcelStatus.offloaded},
  'offloaded': {ParcelStatus.offloaded, ParcelStatus.atStation},
  'ready': {ParcelStatus.atStation},
  'delivered': {ParcelStatus.delivered},
  'collected': {ParcelStatus.delivered},
  'done': {ParcelStatus.delivered},
  'completed': {ParcelStatus.delivered},
  'canceled': {ParcelStatus.canceled},
  'cancelled': {ParcelStatus.canceled},
  'cancel': {ParcelStatus.canceled},
  'rejected': {ParcelStatus.canceled},
};

class _ParcelDoc {
  _ParcelDoc(this.p)
      : tracking = (p.trackingNumber ?? '').toLowerCase(),
        from = p.fromAddress.toLowerCase(),
        to = p.toAddress.toLowerCase(),
        people = [
          p.receiverName,
          p.senderName ?? '',
          p.agentName ?? '',
        ].join(' ').toLowerCase(),
        phones = [p.receiverPhone, p.senderPhone ?? '', p.agentPhone ?? '']
            .map((x) => x.replaceAll(RegExp(r'\D'), ''))
            .where((x) => x.isNotEmpty)
            .toList(),
        details = [p.parcelType, p.parcelSize, p.serviceType, p.urgency, p.condition].join(' ').toLowerCase(),
        created = p.createdAt.toLocal();

  final ParcelModel p;
  final String tracking;
  final String from;
  final String to;
  final String people;
  final List<String> phones;
  final String details;
  final DateTime created;

  int score(_Token t) {
    final w = t.text;
    if (t.field == _Field.from) return _place(from, w);
    if (t.field == _Field.to) return _place(to, w);

    var best = 0;
    void take(int s) => best = s > best ? s : best;

    // Tracking number / id
    if (tracking.isNotEmpty) {
      if (tracking == w) take(100);
      if (tracking.startsWith(w)) take(60);
      if (w.length >= 3 && tracking.contains(w)) take(40);
    }
    if (w.length >= 6 && p.id.toLowerCase().startsWith(w)) take(50);

    // Places
    take(_place(from, w));
    take(_place(to, w));

    // People
    if (_wordMatch(people, w)) take(25);

    // Phones: compare in both local (0…) and international (255…) forms
    final digits = w.replaceAll(RegExp(r'\D'), '');
    if (digits.length >= 3) {
      final variants = {digits, if (digits.startsWith('0')) '255${digits.substring(1)}', if (digits.startsWith('255')) '0${digits.substring(3)}'};
      if (phones.any((ph) => variants.any(ph.contains))) take(35);
    }

    // Status
    final statuses = _statusWords[w];
    if (statuses != null && statuses.contains(p.status)) take(30);

    // Priority / parcel details
    if ((w == 'express' || w == 'urgent' || w == 'fast') && _isExpress) take(30);
    if (w.length >= 3 && _wordMatch(details, w)) take(15);

    // Dates
    take(_date(w));

    return best;
  }

  bool get _isExpress {
    final u = p.urgency.toLowerCase();
    return u.contains('express') || u.contains('urgent') || u == 'mgr';
  }

  static int _place(String field, String w) {
    if (field.isEmpty || w.length < 2) return 0;
    final city = field.split(',').first.trim();
    if (city == w) return 45;
    if (city.startsWith(w)) return 35;
    if (_wordMatch(field, w)) return 20;
    return 0;
  }

  /// Any word in [text] starting with [w] (so "dod" matches "Dodoma").
  static bool _wordMatch(String text, String w) =>
      text.split(RegExp(r'[^a-z0-9]+')).any((word) => word.isNotEmpty && word.startsWith(w));

  int _date(String w) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final day = DateTime(created.year, created.month, created.day);
    switch (w) {
      case 'today':
        return day == today ? 20 : 0;
      case 'yesterday':
        return day == today.subtract(const Duration(days: 1)) ? 20 : 0;
      case 'week':
      case 'lastweek':
        return today.difference(day).inDays <= 7 ? 15 : 0;
      case 'month':
        return today.difference(day).inDays <= 30 ? 10 : 0;
    }
    if (w.length >= 3) {
      final month = DateFormat('MMMM').format(created).toLowerCase();
      if (month.startsWith(w)) return 15;
      final weekday = DateFormat('EEEE').format(created).toLowerCase();
      if (weekday.startsWith(w)) return 10;
    }
    final n = int.tryParse(w);
    if (n != null && n >= 1 && n <= 31 && created.day == n) return 8;
    if (n != null && w.length == 4 && created.year == n) return 8;
    return 0;
  }
}
