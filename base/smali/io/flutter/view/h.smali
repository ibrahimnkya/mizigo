.class public final Lio/flutter/view/h;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public A:Ljava/lang/String;

.field public B:Ljava/lang/String;

.field public C:I

.field public D:I

.field public E:Z

.field public F:J

.field public G:I

.field public H:I

.field public I:I

.field public J:F

.field public K:Ljava/lang/String;

.field public L:Ljava/lang/String;

.field public M:F

.field public N:F

.field public O:F

.field public P:F

.field public Q:[F

.field public R:[F

.field public S:Lio/flutter/view/h;

.field public final T:Ljava/util/ArrayList;

.field public final U:Ljava/util/ArrayList;

.field public V:Ljava/util/ArrayList;

.field public W:Lio/flutter/view/g;

.field public X:Lio/flutter/view/g;

.field public Y:Z

.field public Z:[F

.field public final a:Lio/flutter/view/i;

.field public a0:Z

.field public b:I

.field public b0:[F

.field public c:J

.field public c0:Landroid/graphics/Rect;

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:F

.field public m:F

.field public n:F

.field public o:Ljava/lang/String;

.field public p:Ljava/lang/String;

.field public q:Ljava/util/ArrayList;

.field public r:Ljava/lang/String;

.field public s:Ljava/util/List;

.field public t:Ljava/lang/String;

.field public u:Ljava/util/ArrayList;

.field public v:Ljava/lang/String;

.field public w:Ljava/util/ArrayList;

.field public x:Ljava/lang/String;

.field public y:Ljava/util/ArrayList;

.field public z:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lio/flutter/view/i;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lio/flutter/view/h;->b:I

    .line 6
    .line 7
    iput v0, p0, Lio/flutter/view/h;->D:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lio/flutter/view/h;->E:Z

    .line 11
    .line 12
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lio/flutter/view/h;->T:Ljava/util/ArrayList;

    .line 18
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lio/flutter/view/h;->U:Ljava/util/ArrayList;

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    iput-boolean v0, p0, Lio/flutter/view/h;->Y:Z

    .line 28
    .line 29
    iput-boolean v0, p0, Lio/flutter/view/h;->a0:Z

    .line 30
    .line 31
    iput-object p1, p0, Lio/flutter/view/h;->a:Lio/flutter/view/i;

    .line 32
    .line 33
    return-void
.end method

.method public static a(Lio/flutter/view/h;Lio/flutter/view/f;)Z
    .locals 0

    .line 1
    iget p0, p0, Lio/flutter/view/h;->d:I

    .line 2
    .line 3
    iget p1, p1, Lio/flutter/view/f;->e:I

    .line 4
    .line 5
    and-int/2addr p0, p1

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public static b(Lio/flutter/view/h;)Ljava/lang/CharSequence;
    .locals 8

    .line 1
    new-instance v0, LV1/y;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, LV1/y;-><init>(IZ)V

    .line 7
    .line 8
    .line 9
    iget-object v3, p0, Lio/flutter/view/h;->r:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v3, v0, LV1/y;->f:Ljava/lang/Object;

    .line 12
    .line 13
    iget-object v3, p0, Lio/flutter/view/h;->s:Ljava/util/List;

    .line 14
    .line 15
    iput-object v3, v0, LV1/y;->g:Ljava/lang/Object;

    .line 16
    .line 17
    invoke-virtual {p0}, Lio/flutter/view/h;->d()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    iput-object v3, v0, LV1/y;->h:Ljava/lang/Object;

    .line 22
    .line 23
    invoke-virtual {v0}, LV1/y;->d()Landroid/text/SpannableString;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v3, LV1/y;

    .line 28
    .line 29
    invoke-direct {v3, v1, v2}, LV1/y;-><init>(IZ)V

    .line 30
    .line 31
    .line 32
    iget-object v4, p0, Lio/flutter/view/h;->p:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v4, v3, LV1/y;->f:Ljava/lang/Object;

    .line 35
    .line 36
    iget-object v4, p0, Lio/flutter/view/h;->q:Ljava/util/ArrayList;

    .line 37
    .line 38
    iput-object v4, v3, LV1/y;->g:Ljava/lang/Object;

    .line 39
    .line 40
    iget-object v4, p0, Lio/flutter/view/h;->A:Ljava/lang/String;

    .line 41
    .line 42
    iput-object v4, v3, LV1/y;->i:Ljava/lang/Object;

    .line 43
    .line 44
    invoke-virtual {p0}, Lio/flutter/view/h;->d()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    iput-object v4, v3, LV1/y;->h:Ljava/lang/Object;

    .line 49
    .line 50
    invoke-virtual {v3}, LV1/y;->d()Landroid/text/SpannableString;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    new-instance v4, LV1/y;

    .line 55
    .line 56
    invoke-direct {v4, v1, v2}, LV1/y;-><init>(IZ)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lio/flutter/view/h;->x:Ljava/lang/String;

    .line 60
    .line 61
    iput-object v1, v4, LV1/y;->f:Ljava/lang/Object;

    .line 62
    .line 63
    iget-object v1, p0, Lio/flutter/view/h;->y:Ljava/util/ArrayList;

    .line 64
    .line 65
    iput-object v1, v4, LV1/y;->g:Ljava/lang/Object;

    .line 66
    .line 67
    invoke-virtual {p0}, Lio/flutter/view/h;->d()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    iput-object p0, v4, LV1/y;->h:Ljava/lang/Object;

    .line 72
    .line 73
    invoke-virtual {v4}, LV1/y;->d()Landroid/text/SpannableString;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const/4 v1, 0x3

    .line 78
    new-array v4, v1, [Ljava/lang/CharSequence;

    .line 79
    .line 80
    aput-object v0, v4, v2

    .line 81
    .line 82
    const/4 v0, 0x1

    .line 83
    aput-object v3, v4, v0

    .line 84
    .line 85
    const/4 v3, 0x2

    .line 86
    aput-object p0, v4, v3

    .line 87
    .line 88
    const/4 p0, 0x0

    .line 89
    move v5, v2

    .line 90
    :goto_0
    if-ge v5, v1, :cond_3

    .line 91
    .line 92
    aget-object v6, v4, v5

    .line 93
    .line 94
    if-eqz v6, :cond_2

    .line 95
    .line 96
    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    .line 97
    .line 98
    .line 99
    move-result v7

    .line 100
    if-lez v7, :cond_2

    .line 101
    .line 102
    if-eqz p0, :cond_1

    .line 103
    .line 104
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 105
    .line 106
    .line 107
    move-result v7

    .line 108
    if-nez v7, :cond_0

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_0
    new-array v7, v1, [Ljava/lang/CharSequence;

    .line 112
    .line 113
    aput-object p0, v7, v2

    .line 114
    .line 115
    const-string p0, ", "

    .line 116
    .line 117
    aput-object p0, v7, v0

    .line 118
    .line 119
    aput-object v6, v7, v3

    .line 120
    .line 121
    invoke-static {v7}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    goto :goto_2

    .line 126
    :cond_1
    :goto_1
    move-object p0, v6

    .line 127
    :cond_2
    :goto_2
    add-int/lit8 v5, v5, 0x1

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_3
    return-object p0
.end method

.method public static f(Ljava/nio/ByteBuffer;[Ljava/nio/ByteBuffer;)Ljava/util/ArrayList;
    .locals 8

    .line 1
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 13
    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    :goto_0
    if-ge v2, v0, :cond_3

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    const/4 v5, 0x2

    .line 27
    invoke-static {v5}, LL/i;->c(I)[I

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 32
    .line 33
    .line 34
    move-result v6

    .line 35
    aget v5, v5, v6

    .line 36
    .line 37
    invoke-static {v5}, LL/i;->b(I)I

    .line 38
    .line 39
    .line 40
    move-result v6

    .line 41
    if-eqz v6, :cond_2

    .line 42
    .line 43
    const/4 v7, 0x1

    .line 44
    if-eq v6, v7, :cond_1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 48
    .line 49
    .line 50
    move-result v6

    .line 51
    aget-object v6, p1, v6

    .line 52
    .line 53
    new-instance v7, Lio/flutter/view/j;

    .line 54
    .line 55
    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    .line 56
    .line 57
    .line 58
    iput v3, v7, Lio/flutter/view/l;->a:I

    .line 59
    .line 60
    iput v4, v7, Lio/flutter/view/l;->b:I

    .line 61
    .line 62
    iput v5, v7, Lio/flutter/view/l;->c:I

    .line 63
    .line 64
    sget-object v3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 65
    .line 66
    invoke-virtual {v3, v6}, Ljava/nio/charset/Charset;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-virtual {v3}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    iput-object v3, v7, Lio/flutter/view/j;->d:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_2
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 81
    .line 82
    .line 83
    new-instance v6, Lio/flutter/view/k;

    .line 84
    .line 85
    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    .line 86
    .line 87
    .line 88
    iput v3, v6, Lio/flutter/view/l;->a:I

    .line 89
    .line 90
    iput v4, v6, Lio/flutter/view/l;->b:I

    .line 91
    .line 92
    iput v5, v6, Lio/flutter/view/l;->c:I

    .line 93
    .line 94
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_3
    return-object v1
.end method

.method public static j([F[F[F)V
    .locals 6

    .line 1
    const/4 v3, 0x0

    .line 2
    const/4 v5, 0x0

    .line 3
    const/4 v1, 0x0

    .line 4
    move-object v0, p0

    .line 5
    move-object v2, p1

    .line 6
    move-object v4, p2

    .line 7
    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMV([FI[FI[FI)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x3

    .line 11
    aget p1, v0, p0

    .line 12
    .line 13
    const/4 p2, 0x0

    .line 14
    aget v1, v0, p2

    .line 15
    .line 16
    div-float/2addr v1, p1

    .line 17
    aput v1, v0, p2

    .line 18
    .line 19
    const/4 p2, 0x1

    .line 20
    aget v1, v0, p2

    .line 21
    .line 22
    div-float/2addr v1, p1

    .line 23
    aput v1, v0, p2

    .line 24
    .line 25
    const/4 p2, 0x2

    .line 26
    aget v1, v0, p2

    .line 27
    .line 28
    div-float/2addr v1, p1

    .line 29
    aput v1, v0, p2

    .line 30
    .line 31
    const/4 p1, 0x0

    .line 32
    aput p1, v0, p0

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public final c(Ljava/util/ArrayList;)V
    .locals 4

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lio/flutter/view/h;->g(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lio/flutter/view/h;->T:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x0

    .line 19
    :goto_0
    if-ge v2, v1, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    add-int/lit8 v2, v2, 0x1

    .line 26
    .line 27
    check-cast v3, Lio/flutter/view/h;

    .line 28
    .line 29
    invoke-virtual {v3, p1}, Lio/flutter/view/h;->c(Ljava/util/ArrayList;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    return-void
.end method

.method public final d()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lio/flutter/view/h;->B:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lio/flutter/view/h;->B:Ljava/lang/String;

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_0
    iget-object v0, p0, Lio/flutter/view/h;->a:Lio/flutter/view/i;

    .line 15
    .line 16
    iget-object v0, v0, Lio/flutter/view/i;->m:Ljava/lang/String;

    .line 17
    .line 18
    return-object v0
.end method

.method public final e()Ljava/lang/String;
    .locals 5

    .line 1
    const/16 v0, 0xd

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lio/flutter/view/h;->g(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lio/flutter/view/h;->p:Ljava/lang/String;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lio/flutter/view/h;->p:Ljava/lang/String;

    .line 20
    .line 21
    return-object v0

    .line 22
    :cond_0
    iget-object v0, p0, Lio/flutter/view/h;->T:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    const/4 v2, 0x0

    .line 29
    :cond_1
    if-ge v2, v1, :cond_2

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    add-int/lit8 v2, v2, 0x1

    .line 36
    .line 37
    check-cast v3, Lio/flutter/view/h;

    .line 38
    .line 39
    invoke-virtual {v3}, Lio/flutter/view/h;->e()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    if-eqz v3, :cond_1

    .line 44
    .line 45
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    if-nez v4, :cond_1

    .line 50
    .line 51
    return-object v3

    .line 52
    :cond_2
    const/4 v0, 0x0

    .line 53
    return-object v0
.end method

.method public final g(I)Z
    .locals 4

    .line 1
    iget-wide v0, p0, Lio/flutter/view/h;->c:J

    .line 2
    .line 3
    invoke-static {p1}, LE1/j;->g(I)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    int-to-long v2, p1

    .line 8
    and-long/2addr v0, v2

    .line 9
    const-wide/16 v2, 0x0

    .line 10
    .line 11
    cmp-long p1, v0, v2

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    return p1

    .line 17
    :cond_0
    const/4 p1, 0x0

    .line 18
    return p1
.end method

.method public final h([FZ)Lio/flutter/view/h;
    .locals 12

    .line 1
    const/4 v0, 0x3

    .line 2
    aget v0, p1, v0

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    aget v2, p1, v1

    .line 6
    .line 7
    div-float/2addr v2, v0

    .line 8
    const/4 v3, 0x1

    .line 9
    aget v4, p1, v3

    .line 10
    .line 11
    div-float/2addr v4, v0

    .line 12
    iget v0, p0, Lio/flutter/view/h;->M:F

    .line 13
    .line 14
    cmpg-float v0, v2, v0

    .line 15
    .line 16
    if-ltz v0, :cond_9

    .line 17
    .line 18
    iget v0, p0, Lio/flutter/view/h;->O:F

    .line 19
    .line 20
    cmpl-float v0, v2, v0

    .line 21
    .line 22
    if-gez v0, :cond_9

    .line 23
    .line 24
    iget v0, p0, Lio/flutter/view/h;->N:F

    .line 25
    .line 26
    cmpg-float v0, v4, v0

    .line 27
    .line 28
    if-ltz v0, :cond_9

    .line 29
    .line 30
    iget v0, p0, Lio/flutter/view/h;->P:F

    .line 31
    .line 32
    cmpl-float v0, v4, v0

    .line 33
    .line 34
    if-ltz v0, :cond_0

    .line 35
    .line 36
    goto/16 :goto_3

    .line 37
    .line 38
    :cond_0
    const/4 v0, 0x4

    .line 39
    new-array v4, v0, [F

    .line 40
    .line 41
    iget-object v0, p0, Lio/flutter/view/h;->U:Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    move v5, v1

    .line 48
    :goto_0
    if-ge v5, v2, :cond_6

    .line 49
    .line 50
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    add-int/lit8 v10, v5, 0x1

    .line 55
    .line 56
    move-object v11, v6

    .line 57
    check-cast v11, Lio/flutter/view/h;

    .line 58
    .line 59
    const/16 v5, 0xe

    .line 60
    .line 61
    invoke-virtual {v11, v5}, Lio/flutter/view/h;->g(I)Z

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    if-eqz v5, :cond_1

    .line 66
    .line 67
    :goto_1
    move v5, v10

    .line 68
    goto :goto_0

    .line 69
    :cond_1
    iget-boolean v5, v11, Lio/flutter/view/h;->Y:Z

    .line 70
    .line 71
    if-nez v5, :cond_2

    .line 72
    .line 73
    goto :goto_2

    .line 74
    :cond_2
    iput-boolean v1, v11, Lio/flutter/view/h;->Y:Z

    .line 75
    .line 76
    iget-object v5, v11, Lio/flutter/view/h;->Z:[F

    .line 77
    .line 78
    if-nez v5, :cond_3

    .line 79
    .line 80
    const/16 v5, 0x10

    .line 81
    .line 82
    new-array v5, v5, [F

    .line 83
    .line 84
    iput-object v5, v11, Lio/flutter/view/h;->Z:[F

    .line 85
    .line 86
    :cond_3
    iget-object v5, v11, Lio/flutter/view/h;->Z:[F

    .line 87
    .line 88
    iget-object v6, v11, Lio/flutter/view/h;->R:[F

    .line 89
    .line 90
    invoke-static {v5, v1, v6, v1}, Landroid/opengl/Matrix;->invertM([FI[FI)Z

    .line 91
    .line 92
    .line 93
    move-result v5

    .line 94
    if-nez v5, :cond_4

    .line 95
    .line 96
    iget-object v5, v11, Lio/flutter/view/h;->Z:[F

    .line 97
    .line 98
    const/4 v6, 0x0

    .line 99
    invoke-static {v5, v6}, Ljava/util/Arrays;->fill([FF)V

    .line 100
    .line 101
    .line 102
    :cond_4
    :goto_2
    iget-object v6, v11, Lio/flutter/view/h;->Z:[F

    .line 103
    .line 104
    const/4 v7, 0x0

    .line 105
    const/4 v9, 0x0

    .line 106
    const/4 v5, 0x0

    .line 107
    move-object v8, p1

    .line 108
    invoke-static/range {v4 .. v9}, Landroid/opengl/Matrix;->multiplyMV([FI[FI[FI)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v11, v4, p2}, Lio/flutter/view/h;->h([FZ)Lio/flutter/view/h;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    if-eqz p1, :cond_5

    .line 116
    .line 117
    return-object p1

    .line 118
    :cond_5
    move-object p1, v8

    .line 119
    goto :goto_1

    .line 120
    :cond_6
    if-eqz p2, :cond_7

    .line 121
    .line 122
    iget p1, p0, Lio/flutter/view/h;->i:I

    .line 123
    .line 124
    const/4 p2, -0x1

    .line 125
    if-eq p1, p2, :cond_7

    .line 126
    .line 127
    move v1, v3

    .line 128
    :cond_7
    invoke-virtual {p0}, Lio/flutter/view/h;->i()Z

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    if-nez p1, :cond_8

    .line 133
    .line 134
    if-eqz v1, :cond_9

    .line 135
    .line 136
    :cond_8
    return-object p0

    .line 137
    :cond_9
    :goto_3
    const/4 p1, 0x0

    .line 138
    return-object p1
.end method

.method public final i()Z
    .locals 4

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lio/flutter/view/h;->g(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/16 v0, 0x16

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lio/flutter/view/h;->g(I)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    const/16 v0, 0x20

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lio/flutter/view/h;->g(I)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_2
    iget v0, p0, Lio/flutter/view/h;->d:I

    .line 29
    .line 30
    sget v1, Lio/flutter/view/i;->y:I

    .line 31
    .line 32
    and-int/lit8 v0, v0, -0x3d

    .line 33
    .line 34
    if-nez v0, :cond_6

    .line 35
    .line 36
    iget-wide v0, p0, Lio/flutter/view/h;->c:J

    .line 37
    .line 38
    const v2, 0xa301f7

    .line 39
    .line 40
    .line 41
    int-to-long v2, v2

    .line 42
    and-long/2addr v0, v2

    .line 43
    const-wide/16 v2, 0x0

    .line 44
    .line 45
    cmp-long v0, v0, v2

    .line 46
    .line 47
    if-nez v0, :cond_6

    .line 48
    .line 49
    iget-object v0, p0, Lio/flutter/view/h;->p:Ljava/lang/String;

    .line 50
    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_6

    .line 58
    .line 59
    :cond_3
    iget-object v0, p0, Lio/flutter/view/h;->r:Ljava/lang/String;

    .line 60
    .line 61
    if-eqz v0, :cond_4

    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_6

    .line 68
    .line 69
    :cond_4
    iget-object v0, p0, Lio/flutter/view/h;->x:Ljava/lang/String;

    .line 70
    .line 71
    if-eqz v0, :cond_5

    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-nez v0, :cond_5

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_5
    :goto_0
    const/4 v0, 0x0

    .line 81
    return v0

    .line 82
    :cond_6
    :goto_1
    const/4 v0, 0x1

    .line 83
    return v0
.end method

.method public final k([FLjava/util/HashSet;Z)V
    .locals 12

    .line 1
    invoke-virtual {p2, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lio/flutter/view/h;->a0:Z

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    move p3, v1

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    if-eqz p3, :cond_4

    .line 12
    .line 13
    iget-object v2, p0, Lio/flutter/view/h;->b0:[F

    .line 14
    .line 15
    const/16 v3, 0x10

    .line 16
    .line 17
    if-nez v2, :cond_1

    .line 18
    .line 19
    new-array v2, v3, [F

    .line 20
    .line 21
    iput-object v2, p0, Lio/flutter/view/h;->b0:[F

    .line 22
    .line 23
    :cond_1
    iget-object v2, p0, Lio/flutter/view/h;->Q:[F

    .line 24
    .line 25
    if-nez v2, :cond_2

    .line 26
    .line 27
    new-array v2, v3, [F

    .line 28
    .line 29
    iput-object v2, p0, Lio/flutter/view/h;->Q:[F

    .line 30
    .line 31
    :cond_2
    iget-object v3, p0, Lio/flutter/view/h;->b0:[F

    .line 32
    .line 33
    iget-object v7, p0, Lio/flutter/view/h;->Q:[F

    .line 34
    .line 35
    const/4 v8, 0x0

    .line 36
    const/4 v4, 0x0

    .line 37
    const/4 v6, 0x0

    .line 38
    move-object v5, p1

    .line 39
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 40
    .line 41
    .line 42
    const/4 p1, 0x4

    .line 43
    new-array v2, p1, [F

    .line 44
    .line 45
    const/4 v3, 0x2

    .line 46
    const/4 v4, 0x0

    .line 47
    aput v4, v2, v3

    .line 48
    .line 49
    const/4 v3, 0x3

    .line 50
    const/high16 v4, 0x3f800000    # 1.0f

    .line 51
    .line 52
    aput v4, v2, v3

    .line 53
    .line 54
    new-array v3, p1, [F

    .line 55
    .line 56
    new-array v4, p1, [F

    .line 57
    .line 58
    new-array v5, p1, [F

    .line 59
    .line 60
    new-array p1, p1, [F

    .line 61
    .line 62
    iget v6, p0, Lio/flutter/view/h;->M:F

    .line 63
    .line 64
    aput v6, v2, v0

    .line 65
    .line 66
    iget v6, p0, Lio/flutter/view/h;->N:F

    .line 67
    .line 68
    aput v6, v2, v1

    .line 69
    .line 70
    iget-object v6, p0, Lio/flutter/view/h;->b0:[F

    .line 71
    .line 72
    invoke-static {v3, v6, v2}, Lio/flutter/view/h;->j([F[F[F)V

    .line 73
    .line 74
    .line 75
    iget v6, p0, Lio/flutter/view/h;->O:F

    .line 76
    .line 77
    aput v6, v2, v0

    .line 78
    .line 79
    iget v6, p0, Lio/flutter/view/h;->N:F

    .line 80
    .line 81
    aput v6, v2, v1

    .line 82
    .line 83
    iget-object v6, p0, Lio/flutter/view/h;->b0:[F

    .line 84
    .line 85
    invoke-static {v4, v6, v2}, Lio/flutter/view/h;->j([F[F[F)V

    .line 86
    .line 87
    .line 88
    iget v6, p0, Lio/flutter/view/h;->O:F

    .line 89
    .line 90
    aput v6, v2, v0

    .line 91
    .line 92
    iget v6, p0, Lio/flutter/view/h;->P:F

    .line 93
    .line 94
    aput v6, v2, v1

    .line 95
    .line 96
    iget-object v6, p0, Lio/flutter/view/h;->b0:[F

    .line 97
    .line 98
    invoke-static {v5, v6, v2}, Lio/flutter/view/h;->j([F[F[F)V

    .line 99
    .line 100
    .line 101
    iget v6, p0, Lio/flutter/view/h;->M:F

    .line 102
    .line 103
    aput v6, v2, v0

    .line 104
    .line 105
    iget v6, p0, Lio/flutter/view/h;->P:F

    .line 106
    .line 107
    aput v6, v2, v1

    .line 108
    .line 109
    iget-object v6, p0, Lio/flutter/view/h;->b0:[F

    .line 110
    .line 111
    invoke-static {p1, v6, v2}, Lio/flutter/view/h;->j([F[F[F)V

    .line 112
    .line 113
    .line 114
    iget-object v2, p0, Lio/flutter/view/h;->c0:Landroid/graphics/Rect;

    .line 115
    .line 116
    if-nez v2, :cond_3

    .line 117
    .line 118
    new-instance v2, Landroid/graphics/Rect;

    .line 119
    .line 120
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 121
    .line 122
    .line 123
    iput-object v2, p0, Lio/flutter/view/h;->c0:Landroid/graphics/Rect;

    .line 124
    .line 125
    :cond_3
    iget-object v2, p0, Lio/flutter/view/h;->c0:Landroid/graphics/Rect;

    .line 126
    .line 127
    aget v6, v3, v0

    .line 128
    .line 129
    aget v7, v4, v0

    .line 130
    .line 131
    aget v8, v5, v0

    .line 132
    .line 133
    aget v9, p1, v0

    .line 134
    .line 135
    invoke-static {v8, v9}, Ljava/lang/Math;->min(FF)F

    .line 136
    .line 137
    .line 138
    move-result v8

    .line 139
    invoke-static {v7, v8}, Ljava/lang/Math;->min(FF)F

    .line 140
    .line 141
    .line 142
    move-result v7

    .line 143
    invoke-static {v6, v7}, Ljava/lang/Math;->min(FF)F

    .line 144
    .line 145
    .line 146
    move-result v6

    .line 147
    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    .line 148
    .line 149
    .line 150
    move-result v6

    .line 151
    aget v7, v3, v1

    .line 152
    .line 153
    aget v8, v4, v1

    .line 154
    .line 155
    aget v9, v5, v1

    .line 156
    .line 157
    aget v10, p1, v1

    .line 158
    .line 159
    invoke-static {v9, v10}, Ljava/lang/Math;->min(FF)F

    .line 160
    .line 161
    .line 162
    move-result v9

    .line 163
    invoke-static {v8, v9}, Ljava/lang/Math;->min(FF)F

    .line 164
    .line 165
    .line 166
    move-result v8

    .line 167
    invoke-static {v7, v8}, Ljava/lang/Math;->min(FF)F

    .line 168
    .line 169
    .line 170
    move-result v7

    .line 171
    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    .line 172
    .line 173
    .line 174
    move-result v7

    .line 175
    aget v8, v3, v0

    .line 176
    .line 177
    aget v9, v4, v0

    .line 178
    .line 179
    aget v10, v5, v0

    .line 180
    .line 181
    aget v11, p1, v0

    .line 182
    .line 183
    invoke-static {v10, v11}, Ljava/lang/Math;->max(FF)F

    .line 184
    .line 185
    .line 186
    move-result v10

    .line 187
    invoke-static {v9, v10}, Ljava/lang/Math;->max(FF)F

    .line 188
    .line 189
    .line 190
    move-result v9

    .line 191
    invoke-static {v8, v9}, Ljava/lang/Math;->max(FF)F

    .line 192
    .line 193
    .line 194
    move-result v8

    .line 195
    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    .line 196
    .line 197
    .line 198
    move-result v8

    .line 199
    aget v3, v3, v1

    .line 200
    .line 201
    aget v4, v4, v1

    .line 202
    .line 203
    aget v5, v5, v1

    .line 204
    .line 205
    aget p1, p1, v1

    .line 206
    .line 207
    invoke-static {v5, p1}, Ljava/lang/Math;->max(FF)F

    .line 208
    .line 209
    .line 210
    move-result p1

    .line 211
    invoke-static {v4, p1}, Ljava/lang/Math;->max(FF)F

    .line 212
    .line 213
    .line 214
    move-result p1

    .line 215
    invoke-static {v3, p1}, Ljava/lang/Math;->max(FF)F

    .line 216
    .line 217
    .line 218
    move-result p1

    .line 219
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 220
    .line 221
    .line 222
    move-result p1

    .line 223
    invoke-virtual {v2, v6, v7, v8, p1}, Landroid/graphics/Rect;->set(IIII)V

    .line 224
    .line 225
    .line 226
    iput-boolean v0, p0, Lio/flutter/view/h;->a0:Z

    .line 227
    .line 228
    :cond_4
    iget-object p1, p0, Lio/flutter/view/h;->T:Ljava/util/ArrayList;

    .line 229
    .line 230
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 231
    .line 232
    .line 233
    move-result v1

    .line 234
    const/4 v2, -0x1

    .line 235
    :goto_0
    if-ge v0, v1, :cond_5

    .line 236
    .line 237
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    move-result-object v3

    .line 241
    add-int/lit8 v0, v0, 0x1

    .line 242
    .line 243
    check-cast v3, Lio/flutter/view/h;

    .line 244
    .line 245
    iput v2, v3, Lio/flutter/view/h;->D:I

    .line 246
    .line 247
    iget v2, v3, Lio/flutter/view/h;->b:I

    .line 248
    .line 249
    iget-object v4, p0, Lio/flutter/view/h;->b0:[F

    .line 250
    .line 251
    invoke-virtual {v3, v4, p2, p3}, Lio/flutter/view/h;->k([FLjava/util/HashSet;Z)V

    .line 252
    .line 253
    .line 254
    goto :goto_0

    .line 255
    :cond_5
    return-void
.end method
