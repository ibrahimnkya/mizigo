import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LegalDocumentScreen extends StatelessWidget {
  final String title;

  const LegalDocumentScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
        title: Text(
          title,
          style: GoogleFonts.outfit(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1E293B),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Text(
          '''Last updated: March 2026

Welcome to Mizigo.

1. Introduction
These terms and conditions outline the rules and regulations for the use of Mizigo's Mobile Application.
By accessing this app we assume you accept these terms and conditions.

2. License
Unless otherwise stated, Mizigo and/or its licensors own the intellectual property rights for all material on Mizigo. All intellectual property rights are reserved.

3. User Responsibilities
You must not:
• Republish material from Mizigo
• Sell, rent or sub-license material from Mizigo
• Reproduce, duplicate or copy material from Mizigo

4. Limitation of Liability
In no event shall Mizigo, nor any of its officers, directors, and employees, be held liable for anything arising out of or in any way connected with your use of this app.

5. Modifications
Mizigo is permitted to revise these Terms at any time as it sees fit, and by using this app you are expected to review these Terms on a regular basis.
''',
          style: GoogleFonts.inter(
            fontSize: 14,
            height: 1.6,
            color: const Color(0xFF475569),
          ),
        ),
      ),
    );
  }
}
