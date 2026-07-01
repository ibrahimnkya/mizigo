.class public final Le1/m;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:D

.field public b:D

.field public c:D

.field public d:D


# virtual methods
.method public final a()Lcom/google/android/gms/maps/model/LatLngBounds;
    .locals 7

    .line 1
    iget-wide v0, p0, Le1/m;->c:D

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    const-string v1, "no included points"

    .line 10
    .line 11
    invoke-static {v1, v0}, LN0/n;->g(Ljava/lang/String;Z)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Lcom/google/android/gms/maps/model/LatLngBounds;

    .line 15
    .line 16
    new-instance v1, Lcom/google/android/gms/maps/model/LatLng;

    .line 17
    .line 18
    iget-wide v2, p0, Le1/m;->a:D

    .line 19
    .line 20
    iget-wide v4, p0, Le1/m;->c:D

    .line 21
    .line 22
    invoke-direct {v1, v2, v3, v4, v5}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 23
    .line 24
    .line 25
    new-instance v2, Lcom/google/android/gms/maps/model/LatLng;

    .line 26
    .line 27
    iget-wide v3, p0, Le1/m;->b:D

    .line 28
    .line 29
    iget-wide v5, p0, Le1/m;->d:D

    .line 30
    .line 31
    invoke-direct {v2, v3, v4, v5, v6}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 32
    .line 33
    .line 34
    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/maps/model/LatLngBounds;-><init>(Lcom/google/android/gms/maps/model/LatLng;Lcom/google/android/gms/maps/model/LatLng;)V

    .line 35
    .line 36
    .line 37
    return-object v0
.end method

.method public final b(Lcom/google/android/gms/maps/model/LatLng;)V
    .locals 8

    .line 1
    const-string v0, "point must not be null"

    .line 2
    .line 3
    invoke-static {p1, v0}, LN0/n;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-wide v0, p0, Le1/m;->a:D

    .line 7
    .line 8
    iget-wide v2, p1, Lcom/google/android/gms/maps/model/LatLng;->e:D

    .line 9
    .line 10
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(DD)D

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    iput-wide v0, p0, Le1/m;->a:D

    .line 15
    .line 16
    iget-wide v0, p0, Le1/m;->b:D

    .line 17
    .line 18
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(DD)D

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    iput-wide v0, p0, Le1/m;->b:D

    .line 23
    .line 24
    iget-wide v0, p1, Lcom/google/android/gms/maps/model/LatLng;->f:D

    .line 25
    .line 26
    iget-wide v2, p0, Le1/m;->c:D

    .line 27
    .line 28
    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    iput-wide v0, p0, Le1/m;->c:D

    .line 35
    .line 36
    iput-wide v0, p0, Le1/m;->d:D

    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    iget-wide v2, p0, Le1/m;->c:D

    .line 40
    .line 41
    iget-wide v4, p0, Le1/m;->d:D

    .line 42
    .line 43
    cmpg-double p1, v2, v4

    .line 44
    .line 45
    if-gtz p1, :cond_1

    .line 46
    .line 47
    cmpg-double p1, v2, v0

    .line 48
    .line 49
    if-gtz p1, :cond_2

    .line 50
    .line 51
    cmpg-double p1, v0, v4

    .line 52
    .line 53
    if-lez p1, :cond_4

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    cmpg-double p1, v2, v0

    .line 57
    .line 58
    if-lez p1, :cond_4

    .line 59
    .line 60
    cmpg-double p1, v0, v4

    .line 61
    .line 62
    if-gtz p1, :cond_2

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    :goto_0
    sub-double/2addr v2, v0

    .line 66
    sub-double v4, v0, v4

    .line 67
    .line 68
    const-wide v6, 0x4076800000000000L    # 360.0

    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    add-double/2addr v4, v6

    .line 74
    add-double/2addr v2, v6

    .line 75
    rem-double/2addr v2, v6

    .line 76
    rem-double/2addr v4, v6

    .line 77
    cmpg-double p1, v2, v4

    .line 78
    .line 79
    if-gez p1, :cond_3

    .line 80
    .line 81
    iput-wide v0, p0, Le1/m;->c:D

    .line 82
    .line 83
    return-void

    .line 84
    :cond_3
    iput-wide v0, p0, Le1/m;->d:D

    .line 85
    .line 86
    :cond_4
    :goto_1
    return-void
.end method
