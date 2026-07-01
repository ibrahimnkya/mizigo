.class public final LO2/a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lx2/b;

.field public b:LO2/g;

.field public c:LO2/d;

.field public d:Z


# direct methods
.method public constructor <init>(Lx2/b;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget v0, p1, Lx2/b;->f:I

    .line 5
    .line 6
    const/16 v1, 0x15

    .line 7
    .line 8
    if-lt v0, v1, :cond_0

    .line 9
    .line 10
    and-int/lit8 v0, v0, 0x3

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    iput-object p1, p0, LO2/a;->a:Lx2/b;

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    throw p1
.end method


# virtual methods
.method public final a(III)I
    .locals 2

    .line 1
    iget-boolean v0, p0, LO2/a;->d:Z

    .line 2
    .line 3
    iget-object v1, p0, LO2/a;->a:Lx2/b;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v1, p2, p1}, Lx2/b;->b(II)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {v1, p1, p2}, Lx2/b;->b(II)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    :goto_0
    if-eqz p1, :cond_1

    .line 17
    .line 18
    shl-int/lit8 p1, p3, 0x1

    .line 19
    .line 20
    or-int/lit8 p1, p1, 0x1

    .line 21
    .line 22
    return p1

    .line 23
    :cond_1
    shl-int/lit8 p1, p3, 0x1

    .line 24
    .line 25
    return p1
.end method

.method public final b()LO2/d;
    .locals 6

    .line 1
    iget-object v0, p0, LO2/a;->c:LO2/d;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    move v1, v0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    const/4 v3, 0x6

    .line 10
    const/16 v4, 0x8

    .line 11
    .line 12
    if-ge v1, v3, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0, v1, v4, v2}, LO2/a;->a(III)I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    add-int/lit8 v1, v1, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const/4 v1, 0x7

    .line 22
    invoke-virtual {p0, v1, v4, v2}, LO2/a;->a(III)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-virtual {p0, v4, v4, v2}, LO2/a;->a(III)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-virtual {p0, v4, v1, v2}, LO2/a;->a(III)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    const/4 v2, 0x5

    .line 35
    :goto_1
    if-ltz v2, :cond_2

    .line 36
    .line 37
    invoke-virtual {p0, v4, v2, v1}, LO2/a;->a(III)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    add-int/lit8 v2, v2, -0x1

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_2
    iget-object v2, p0, LO2/a;->a:Lx2/b;

    .line 45
    .line 46
    iget v2, v2, Lx2/b;->f:I

    .line 47
    .line 48
    add-int/lit8 v3, v2, -0x7

    .line 49
    .line 50
    add-int/lit8 v5, v2, -0x1

    .line 51
    .line 52
    :goto_2
    if-lt v5, v3, :cond_3

    .line 53
    .line 54
    invoke-virtual {p0, v4, v5, v0}, LO2/a;->a(III)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    add-int/lit8 v5, v5, -0x1

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_3
    add-int/lit8 v3, v2, -0x8

    .line 62
    .line 63
    :goto_3
    if-ge v3, v2, :cond_4

    .line 64
    .line 65
    invoke-virtual {p0, v3, v4, v0}, LO2/a;->a(III)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/lit8 v3, v3, 0x1

    .line 70
    .line 71
    goto :goto_3

    .line 72
    :cond_4
    invoke-static {v1, v0}, LO2/d;->a(II)LO2/d;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    if-eqz v2, :cond_5

    .line 77
    .line 78
    goto :goto_4

    .line 79
    :cond_5
    xor-int/lit16 v1, v1, 0x5412

    .line 80
    .line 81
    xor-int/lit16 v0, v0, 0x5412

    .line 82
    .line 83
    invoke-static {v1, v0}, LO2/d;->a(II)LO2/d;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    :goto_4
    iput-object v2, p0, LO2/a;->c:LO2/d;

    .line 88
    .line 89
    if-eqz v2, :cond_6

    .line 90
    .line 91
    return-object v2

    .line 92
    :cond_6
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    throw v0
.end method

.method public final c()LO2/g;
    .locals 7

    .line 1
    iget-object v0, p0, LO2/a;->b:LO2/g;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    iget-object v0, p0, LO2/a;->a:Lx2/b;

    .line 7
    .line 8
    iget v0, v0, Lx2/b;->f:I

    .line 9
    .line 10
    add-int/lit8 v1, v0, -0x11

    .line 11
    .line 12
    div-int/lit8 v1, v1, 0x4

    .line 13
    .line 14
    const/4 v2, 0x6

    .line 15
    if-gt v1, v2, :cond_1

    .line 16
    .line 17
    invoke-static {v1}, LO2/g;->c(I)LO2/g;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    return-object v0

    .line 22
    :cond_1
    add-int/lit8 v1, v0, -0xb

    .line 23
    .line 24
    const/4 v2, 0x5

    .line 25
    const/4 v3, 0x0

    .line 26
    move v4, v2

    .line 27
    move v5, v3

    .line 28
    :goto_0
    if-ltz v4, :cond_3

    .line 29
    .line 30
    add-int/lit8 v6, v0, -0x9

    .line 31
    .line 32
    :goto_1
    if-lt v6, v1, :cond_2

    .line 33
    .line 34
    invoke-virtual {p0, v6, v4, v5}, LO2/a;->a(III)I

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    add-int/lit8 v6, v6, -0x1

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_2
    add-int/lit8 v4, v4, -0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_3
    invoke-static {v5}, LO2/g;->b(I)LO2/g;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    if-eqz v4, :cond_4

    .line 49
    .line 50
    iget v5, v4, LO2/g;->a:I

    .line 51
    .line 52
    mul-int/lit8 v5, v5, 0x4

    .line 53
    .line 54
    add-int/lit8 v5, v5, 0x11

    .line 55
    .line 56
    if-ne v5, v0, :cond_4

    .line 57
    .line 58
    iput-object v4, p0, LO2/a;->b:LO2/g;

    .line 59
    .line 60
    return-object v4

    .line 61
    :cond_4
    :goto_2
    if-ltz v2, :cond_6

    .line 62
    .line 63
    add-int/lit8 v4, v0, -0x9

    .line 64
    .line 65
    :goto_3
    if-lt v4, v1, :cond_5

    .line 66
    .line 67
    invoke-virtual {p0, v2, v4, v3}, LO2/a;->a(III)I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    add-int/lit8 v4, v4, -0x1

    .line 72
    .line 73
    goto :goto_3

    .line 74
    :cond_5
    add-int/lit8 v2, v2, -0x1

    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_6
    invoke-static {v3}, LO2/g;->b(I)LO2/g;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    if-eqz v1, :cond_7

    .line 82
    .line 83
    iget v2, v1, LO2/g;->a:I

    .line 84
    .line 85
    mul-int/lit8 v2, v2, 0x4

    .line 86
    .line 87
    add-int/lit8 v2, v2, 0x11

    .line 88
    .line 89
    if-ne v2, v0, :cond_7

    .line 90
    .line 91
    iput-object v1, p0, LO2/a;->b:LO2/g;

    .line 92
    .line 93
    return-object v1

    .line 94
    :cond_7
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    throw v0
.end method

.method public final d()V
    .locals 7

    .line 1
    iget-object v0, p0, LO2/a;->c:LO2/d;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_2

    .line 6
    :cond_0
    const/16 v0, 0x8

    .line 7
    .line 8
    invoke-static {v0}, LL/i;->c(I)[I

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, LO2/a;->c:LO2/d;

    .line 13
    .line 14
    iget-byte v1, v1, LO2/d;->b:B

    .line 15
    .line 16
    aget v0, v0, v1

    .line 17
    .line 18
    iget-object v1, p0, LO2/a;->a:Lx2/b;

    .line 19
    .line 20
    iget v2, v1, Lx2/b;->f:I

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    move v4, v3

    .line 24
    :goto_0
    if-ge v4, v2, :cond_3

    .line 25
    .line 26
    move v5, v3

    .line 27
    :goto_1
    if-ge v5, v2, :cond_2

    .line 28
    .line 29
    invoke-static {v0, v4, v5}, LO2/c;->a(III)Z

    .line 30
    .line 31
    .line 32
    move-result v6

    .line 33
    if-eqz v6, :cond_1

    .line 34
    .line 35
    invoke-virtual {v1, v5, v4}, Lx2/b;->a(II)V

    .line 36
    .line 37
    .line 38
    :cond_1
    add-int/lit8 v5, v5, 0x1

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_3
    :goto_2
    return-void
.end method
