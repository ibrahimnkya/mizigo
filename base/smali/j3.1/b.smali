.class public Lj3/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lk3/m;
.implements Lc1/b;
.implements Lm/B;
.implements Ls3/s;
.implements LQ3/d;
.implements Ly1/h;
.implements LA0/b;


# static fields
.field public static g:Lj3/b;


# instance fields
.field public final synthetic e:I

.field public f:Ljava/lang/Object;


# direct methods
.method public constructor <init>(I)V
    .locals 2

    iput p1, p0, Lj3/b;->e:I

    packed-switch p1, :pswitch_data_0

    .line 13
    :pswitch_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p1, p0, Lj3/b;->f:Ljava/lang/Object;

    return-void

    .line 15
    :pswitch_1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    new-instance p1, Ln2/b;

    .line 17
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x14

    .line 18
    iput v0, p1, Ln2/b;->b:I

    .line 19
    sget-object v0, Ln2/d;->o:LM2/b;

    iput-object v0, p1, Ln2/b;->c:LM2/b;

    const-wide v0, 0x3fe6666666666666L    # 0.7

    .line 20
    iput-wide v0, p1, Ln2/b;->d:D

    .line 21
    iput-object p1, p0, Lj3/b;->f:Ljava/lang/Object;

    return-void

    .line 22
    :pswitch_2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xe
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, Lj3/b;->e:I

    iput-object p2, p0, Lj3/b;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lb3/b;I)V
    .locals 4

    iput p2, p0, Lj3/b;->e:I

    packed-switch p2, :pswitch_data_0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    new-instance p2, LN1/e;

    const/16 v0, 0xe

    .line 4
    invoke-direct {p2, v0}, LN1/e;-><init>(I)V

    .line 5
    new-instance v0, Lk3/o;

    sget-object v1, Lk3/j;->a:Lk3/j;

    const/4 v2, 0x0

    .line 6
    const-string v3, "flutter/navigation"

    invoke-direct {v0, p1, v3, v1, v2}, Lk3/o;-><init>(Lk3/f;Ljava/lang/String;Lk3/p;LN1/e;)V

    .line 7
    iput-object v0, p0, Lj3/b;->f:Ljava/lang/Object;

    .line 8
    invoke-virtual {v0, p2}, Lk3/o;->b(Lk3/m;)V

    return-void

    .line 9
    :pswitch_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    new-instance p2, LV1/y;

    sget-object v0, Lk3/i;->a:Lk3/i;

    const/4 v1, 0x0

    .line 11
    const-string v2, "flutter/system"

    invoke-direct {p2, p1, v2, v0, v1}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 12
    iput-object p2, p0, Lj3/b;->f:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x6
        :pswitch_0
    .end packed-switch
.end method

.method public static n()Lj3/b;
    .locals 2

    .line 1
    sget-object v0, Lj3/b;->g:Lj3/b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lj3/b;

    .line 6
    .line 7
    const/16 v1, 0xe

    .line 8
    .line 9
    invoke-direct {v0, v1}, Lj3/b;-><init>(I)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lj3/b;->g:Lj3/b;

    .line 13
    .line 14
    :cond_0
    sget-object v0, Lj3/b;->g:Lj3/b;

    .line 15
    .line 16
    return-object v0
.end method

.method public static q(Lorg/json/JSONArray;)Ljava/util/ArrayList;
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-ge v1, v2, :cond_2

    .line 12
    .line 13
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    instance-of v3, v2, Lorg/json/JSONArray;

    .line 18
    .line 19
    if-eqz v3, :cond_0

    .line 20
    .line 21
    check-cast v2, Lorg/json/JSONArray;

    .line 22
    .line 23
    invoke-static {v2}, Lj3/b;->q(Lorg/json/JSONArray;)Ljava/util/ArrayList;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    instance-of v3, v2, Lorg/json/JSONObject;

    .line 29
    .line 30
    if-eqz v3, :cond_1

    .line 31
    .line 32
    check-cast v2, Lorg/json/JSONObject;

    .line 33
    .line 34
    invoke-static {v2}, Lj3/b;->r(Lorg/json/JSONObject;)Ljava/util/HashMap;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    :cond_1
    :goto_1
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    add-int/lit8 v1, v1, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    return-object v0
.end method

.method public static r(Lorg/json/JSONObject;)Ljava/util/HashMap;
    .locals 5

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eqz v2, :cond_2

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    instance-of v4, v3, Lorg/json/JSONArray;

    .line 27
    .line 28
    if-eqz v4, :cond_0

    .line 29
    .line 30
    check-cast v3, Lorg/json/JSONArray;

    .line 31
    .line 32
    invoke-static {v3}, Lj3/b;->q(Lorg/json/JSONArray;)Ljava/util/ArrayList;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    instance-of v4, v3, Lorg/json/JSONObject;

    .line 38
    .line 39
    if-eqz v4, :cond_1

    .line 40
    .line 41
    check-cast v3, Lorg/json/JSONObject;

    .line 42
    .line 43
    invoke-static {v3}, Lj3/b;->r(Lorg/json/JSONObject;)Ljava/util/HashMap;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    :cond_1
    :goto_1
    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    return-object v0
.end method


# virtual methods
.method public a(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public b(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lj3/b;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ln2/b;

    .line 4
    .line 5
    iput p1, v0, Ln2/b;->b:I

    .line 6
    .line 7
    const/16 v0, 0xa

    .line 8
    .line 9
    if-gt v0, p1, :cond_0

    .line 10
    .line 11
    const/16 v0, 0x33

    .line 12
    .line 13
    if-ge p1, v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 17
    .line 18
    const-string v0, "Radius not within bounds."

    .line 19
    .line 20
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    throw p1
.end method

.method public c(LQ3/e;LA3/d;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Lj3/b;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LQ3/d;

    .line 4
    .line 5
    new-instance v1, LI/t;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-direct {v1, p1, v2}, LI/t;-><init>(LQ3/e;I)V

    .line 9
    .line 10
    .line 11
    invoke-interface {v0, v1, p2}, LQ3/d;->c(LQ3/e;LA3/d;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    sget-object p2, LB3/a;->e:LB3/a;

    .line 16
    .line 17
    if-ne p1, p2, :cond_0

    .line 18
    .line 19
    return-object p1

    .line 20
    :cond_0
    sget-object p1, Ly3/h;->a:Ly3/h;

    .line 21
    .line 22
    return-object p1
.end method

.method public d(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Lj3/b;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ly1/j;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {v0, p1, v1}, Ly1/j;->a(Ljava/lang/String;Ljava/security/Provider;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    return-object p1
.end method

.method public e(Le1/o;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lj3/b;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Lk2/j;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f(Ljava/util/ArrayList;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lj3/b;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ln2/b;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    iput-object p1, v0, Ln2/b;->a:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/4 v0, 0x1

    .line 15
    xor-int/2addr p1, v0

    .line 16
    if-ne p1, v0, :cond_0

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 20
    .line 21
    const-string v0, "No input points."

    .line 22
    .line 23
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    throw p1
.end method

.method public g(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public get()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Lj3/b;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LA0/c;

    .line 4
    .line 5
    iget-object v0, v0, LA0/c;->f:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, Landroid/content/Context;

    .line 8
    .line 9
    new-instance v1, LK0/h;

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    invoke-direct {v1, v2}, LK0/h;-><init>(I)V

    .line 13
    .line 14
    .line 15
    new-instance v2, LN1/e;

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    invoke-direct {v2, v3}, LN1/e;-><init>(I)V

    .line 19
    .line 20
    .line 21
    new-instance v3, Lz0/d;

    .line 22
    .line 23
    invoke-direct {v3, v0, v1, v2}, Lz0/d;-><init>(Landroid/content/Context;LH0/a;LH0/a;)V

    .line 24
    .line 25
    .line 26
    return-object v3
.end method

.method public h(LM2/b;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lj3/b;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ln2/b;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    iput-object p1, v0, Ln2/b;->c:LM2/b;

    .line 9
    .line 10
    return-void
.end method

.method public i(D)V
    .locals 1

    .line 1
    iget-object v0, p0, Lj3/b;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ln2/b;

    .line 4
    .line 5
    iput-wide p1, v0, Ln2/b;->e:D

    .line 6
    .line 7
    return-void
.end method

.method public j(IF)V
    .locals 0

    .line 1
    return-void
.end method

.method public k(D)V
    .locals 2

    .line 1
    iget-object v0, p0, Lj3/b;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ln2/b;

    .line 4
    .line 5
    iput-wide p1, v0, Ln2/b;->d:D

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    cmpg-double v0, v0, p1

    .line 10
    .line 11
    if-gtz v0, :cond_0

    .line 12
    .line 13
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 14
    .line 15
    cmpg-double p1, p1, v0

    .line 16
    .line 17
    if-gtz p1, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 21
    .line 22
    const-string p2, "Opacity must be in range [0, 1]"

    .line 23
    .line 24
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    throw p1
.end method

.method public l([II)I
    .locals 21

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p0

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    iget-object v3, v1, Lj3/b;->f:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v3, Lz2/a;

    .line 10
    .line 11
    array-length v4, v0

    .line 12
    if-eqz v4, :cond_26

    .line 13
    .line 14
    array-length v4, v0

    .line 15
    const/4 v5, 0x0

    .line 16
    const/4 v6, 0x1

    .line 17
    if-le v4, v6, :cond_2

    .line 18
    .line 19
    aget v7, v0, v5

    .line 20
    .line 21
    if-nez v7, :cond_2

    .line 22
    .line 23
    move v7, v6

    .line 24
    :goto_0
    if-ge v7, v4, :cond_0

    .line 25
    .line 26
    aget v8, v0, v7

    .line 27
    .line 28
    if-nez v8, :cond_0

    .line 29
    .line 30
    add-int/lit8 v7, v7, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    if-ne v7, v4, :cond_1

    .line 34
    .line 35
    filled-new-array {v5}, [I

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    sub-int/2addr v4, v7

    .line 41
    new-array v8, v4, [I

    .line 42
    .line 43
    invoke-static {v0, v7, v8, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 44
    .line 45
    .line 46
    move-object v4, v8

    .line 47
    goto :goto_1

    .line 48
    :cond_2
    move-object v4, v0

    .line 49
    :goto_1
    new-array v7, v2, [I

    .line 50
    .line 51
    move v8, v5

    .line 52
    move v9, v6

    .line 53
    :goto_2
    if-ge v8, v2, :cond_7

    .line 54
    .line 55
    iget v10, v3, Lz2/a;->g:I

    .line 56
    .line 57
    add-int/2addr v10, v8

    .line 58
    iget-object v11, v3, Lz2/a;->a:[I

    .line 59
    .line 60
    aget v10, v11, v10

    .line 61
    .line 62
    if-nez v10, :cond_3

    .line 63
    .line 64
    array-length v10, v4

    .line 65
    sub-int/2addr v10, v6

    .line 66
    aget v10, v4, v10

    .line 67
    .line 68
    goto :goto_5

    .line 69
    :cond_3
    if-ne v10, v6, :cond_5

    .line 70
    .line 71
    array-length v10, v4

    .line 72
    move v11, v5

    .line 73
    move v12, v11

    .line 74
    :goto_3
    if-ge v12, v10, :cond_4

    .line 75
    .line 76
    aget v13, v4, v12

    .line 77
    .line 78
    sget-object v14, Lz2/a;->h:Lz2/a;

    .line 79
    .line 80
    xor-int/2addr v11, v13

    .line 81
    add-int/lit8 v12, v12, 0x1

    .line 82
    .line 83
    goto :goto_3

    .line 84
    :cond_4
    move v10, v11

    .line 85
    goto :goto_5

    .line 86
    :cond_5
    aget v11, v4, v5

    .line 87
    .line 88
    array-length v12, v4

    .line 89
    move v13, v6

    .line 90
    :goto_4
    if-ge v13, v12, :cond_4

    .line 91
    .line 92
    invoke-virtual {v3, v10, v11}, Lz2/a;->b(II)I

    .line 93
    .line 94
    .line 95
    move-result v11

    .line 96
    aget v14, v4, v13

    .line 97
    .line 98
    xor-int/2addr v11, v14

    .line 99
    add-int/lit8 v13, v13, 0x1

    .line 100
    .line 101
    goto :goto_4

    .line 102
    :goto_5
    add-int/lit8 v11, v2, -0x1

    .line 103
    .line 104
    sub-int/2addr v11, v8

    .line 105
    aput v10, v7, v11

    .line 106
    .line 107
    if-eqz v10, :cond_6

    .line 108
    .line 109
    move v9, v5

    .line 110
    :cond_6
    add-int/lit8 v8, v8, 0x1

    .line 111
    .line 112
    goto :goto_2

    .line 113
    :cond_7
    if-eqz v9, :cond_8

    .line 114
    .line 115
    return v5

    .line 116
    :cond_8
    new-instance v4, Lw1/b;

    .line 117
    .line 118
    invoke-direct {v4, v3, v7}, Lw1/b;-><init>(Lz2/a;[I)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 122
    .line 123
    .line 124
    iget-object v7, v3, Lz2/a;->c:Lw1/b;

    .line 125
    .line 126
    if-ltz v2, :cond_25

    .line 127
    .line 128
    add-int/lit8 v8, v2, 0x1

    .line 129
    .line 130
    new-array v8, v8, [I

    .line 131
    .line 132
    aput v6, v8, v5

    .line 133
    .line 134
    new-instance v9, Lw1/b;

    .line 135
    .line 136
    invoke-direct {v9, v3, v8}, Lw1/b;-><init>(Lz2/a;[I)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v9}, Lw1/b;->f()I

    .line 140
    .line 141
    .line 142
    move-result v8

    .line 143
    invoke-virtual {v4}, Lw1/b;->f()I

    .line 144
    .line 145
    .line 146
    move-result v10

    .line 147
    if-ge v8, v10, :cond_9

    .line 148
    .line 149
    goto :goto_6

    .line 150
    :cond_9
    move-object/from16 v20, v9

    .line 151
    .line 152
    move-object v9, v4

    .line 153
    move-object/from16 v4, v20

    .line 154
    .line 155
    :goto_6
    iget-object v8, v3, Lz2/a;->d:Lw1/b;

    .line 156
    .line 157
    move-object v10, v8

    .line 158
    move-object v8, v4

    .line 159
    move-object v4, v9

    .line 160
    move-object v9, v10

    .line 161
    move-object v10, v7

    .line 162
    :goto_7
    invoke-virtual {v4}, Lw1/b;->f()I

    .line 163
    .line 164
    .line 165
    move-result v11

    .line 166
    mul-int/lit8 v11, v11, 0x2

    .line 167
    .line 168
    if-lt v11, v2, :cond_17

    .line 169
    .line 170
    invoke-virtual {v4}, Lw1/b;->g()Z

    .line 171
    .line 172
    .line 173
    move-result v11

    .line 174
    if-nez v11, :cond_16

    .line 175
    .line 176
    invoke-virtual {v4}, Lw1/b;->f()I

    .line 177
    .line 178
    .line 179
    move-result v11

    .line 180
    invoke-virtual {v4, v11}, Lw1/b;->e(I)I

    .line 181
    .line 182
    .line 183
    move-result v11

    .line 184
    invoke-virtual {v3, v11}, Lz2/a;->a(I)I

    .line 185
    .line 186
    .line 187
    move-result v11

    .line 188
    move-object v12, v7

    .line 189
    :goto_8
    invoke-virtual {v8}, Lw1/b;->f()I

    .line 190
    .line 191
    .line 192
    move-result v13

    .line 193
    invoke-virtual {v4}, Lw1/b;->f()I

    .line 194
    .line 195
    .line 196
    move-result v14

    .line 197
    if-lt v13, v14, :cond_f

    .line 198
    .line 199
    invoke-virtual {v8}, Lw1/b;->g()Z

    .line 200
    .line 201
    .line 202
    move-result v13

    .line 203
    if-nez v13, :cond_f

    .line 204
    .line 205
    invoke-virtual {v8}, Lw1/b;->f()I

    .line 206
    .line 207
    .line 208
    move-result v13

    .line 209
    invoke-virtual {v4}, Lw1/b;->f()I

    .line 210
    .line 211
    .line 212
    move-result v14

    .line 213
    sub-int/2addr v13, v14

    .line 214
    invoke-virtual {v8}, Lw1/b;->f()I

    .line 215
    .line 216
    .line 217
    move-result v14

    .line 218
    invoke-virtual {v8, v14}, Lw1/b;->e(I)I

    .line 219
    .line 220
    .line 221
    move-result v14

    .line 222
    invoke-virtual {v3, v14, v11}, Lz2/a;->b(II)I

    .line 223
    .line 224
    .line 225
    move-result v14

    .line 226
    if-ltz v13, :cond_e

    .line 227
    .line 228
    if-nez v14, :cond_a

    .line 229
    .line 230
    move/from16 v16, v6

    .line 231
    .line 232
    move-object v6, v7

    .line 233
    goto :goto_9

    .line 234
    :cond_a
    add-int/lit8 v15, v13, 0x1

    .line 235
    .line 236
    new-array v15, v15, [I

    .line 237
    .line 238
    aput v14, v15, v5

    .line 239
    .line 240
    move/from16 v16, v6

    .line 241
    .line 242
    new-instance v6, Lw1/b;

    .line 243
    .line 244
    invoke-direct {v6, v3, v15}, Lw1/b;-><init>(Lz2/a;[I)V

    .line 245
    .line 246
    .line 247
    :goto_9
    invoke-virtual {v12, v6}, Lw1/b;->b(Lw1/b;)Lw1/b;

    .line 248
    .line 249
    .line 250
    move-result-object v12

    .line 251
    iget-object v6, v4, Lw1/b;->g:Ljava/lang/Object;

    .line 252
    .line 253
    check-cast v6, [I

    .line 254
    .line 255
    iget-object v15, v4, Lw1/b;->f:Ljava/lang/Object;

    .line 256
    .line 257
    check-cast v15, Lz2/a;

    .line 258
    .line 259
    if-ltz v13, :cond_d

    .line 260
    .line 261
    if-nez v14, :cond_b

    .line 262
    .line 263
    iget-object v6, v15, Lz2/a;->c:Lw1/b;

    .line 264
    .line 265
    goto :goto_b

    .line 266
    :cond_b
    array-length v5, v6

    .line 267
    add-int/2addr v13, v5

    .line 268
    new-array v13, v13, [I

    .line 269
    .line 270
    const/4 v1, 0x0

    .line 271
    :goto_a
    if-ge v1, v5, :cond_c

    .line 272
    .line 273
    move/from16 v17, v1

    .line 274
    .line 275
    aget v1, v6, v17

    .line 276
    .line 277
    invoke-virtual {v15, v1, v14}, Lz2/a;->b(II)I

    .line 278
    .line 279
    .line 280
    move-result v1

    .line 281
    aput v1, v13, v17

    .line 282
    .line 283
    add-int/lit8 v1, v17, 0x1

    .line 284
    .line 285
    goto :goto_a

    .line 286
    :cond_c
    new-instance v6, Lw1/b;

    .line 287
    .line 288
    invoke-direct {v6, v15, v13}, Lw1/b;-><init>(Lz2/a;[I)V

    .line 289
    .line 290
    .line 291
    :goto_b
    invoke-virtual {v8, v6}, Lw1/b;->b(Lw1/b;)Lw1/b;

    .line 292
    .line 293
    .line 294
    move-result-object v8

    .line 295
    move-object/from16 v1, p0

    .line 296
    .line 297
    move/from16 v6, v16

    .line 298
    .line 299
    const/4 v5, 0x0

    .line 300
    goto :goto_8

    .line 301
    :cond_d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 302
    .line 303
    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 304
    .line 305
    .line 306
    throw v0

    .line 307
    :cond_e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 308
    .line 309
    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 310
    .line 311
    .line 312
    throw v0

    .line 313
    :cond_f
    move/from16 v16, v6

    .line 314
    .line 315
    iget-object v1, v12, Lw1/b;->f:Ljava/lang/Object;

    .line 316
    .line 317
    check-cast v1, Lz2/a;

    .line 318
    .line 319
    iget-object v5, v9, Lw1/b;->f:Ljava/lang/Object;

    .line 320
    .line 321
    check-cast v5, Lz2/a;

    .line 322
    .line 323
    invoke-virtual {v1, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 324
    .line 325
    .line 326
    move-result v5

    .line 327
    if-eqz v5, :cond_15

    .line 328
    .line 329
    invoke-virtual {v12}, Lw1/b;->g()Z

    .line 330
    .line 331
    .line 332
    move-result v5

    .line 333
    if-nez v5, :cond_13

    .line 334
    .line 335
    invoke-virtual {v9}, Lw1/b;->g()Z

    .line 336
    .line 337
    .line 338
    move-result v5

    .line 339
    if-eqz v5, :cond_10

    .line 340
    .line 341
    goto :goto_e

    .line 342
    :cond_10
    iget-object v5, v12, Lw1/b;->g:Ljava/lang/Object;

    .line 343
    .line 344
    check-cast v5, [I

    .line 345
    .line 346
    array-length v6, v5

    .line 347
    iget-object v11, v9, Lw1/b;->g:Ljava/lang/Object;

    .line 348
    .line 349
    check-cast v11, [I

    .line 350
    .line 351
    array-length v12, v11

    .line 352
    add-int v13, v6, v12

    .line 353
    .line 354
    add-int/lit8 v13, v13, -0x1

    .line 355
    .line 356
    new-array v13, v13, [I

    .line 357
    .line 358
    const/4 v14, 0x0

    .line 359
    :goto_c
    if-ge v14, v6, :cond_12

    .line 360
    .line 361
    aget v15, v5, v14

    .line 362
    .line 363
    const/4 v2, 0x0

    .line 364
    :goto_d
    if-ge v2, v12, :cond_11

    .line 365
    .line 366
    add-int v17, v14, v2

    .line 367
    .line 368
    aget v18, v13, v17

    .line 369
    .line 370
    move/from16 v19, v2

    .line 371
    .line 372
    aget v2, v11, v19

    .line 373
    .line 374
    invoke-virtual {v1, v15, v2}, Lz2/a;->b(II)I

    .line 375
    .line 376
    .line 377
    move-result v2

    .line 378
    xor-int v2, v18, v2

    .line 379
    .line 380
    aput v2, v13, v17

    .line 381
    .line 382
    add-int/lit8 v2, v19, 0x1

    .line 383
    .line 384
    goto :goto_d

    .line 385
    :cond_11
    add-int/lit8 v14, v14, 0x1

    .line 386
    .line 387
    move/from16 v2, p2

    .line 388
    .line 389
    goto :goto_c

    .line 390
    :cond_12
    new-instance v2, Lw1/b;

    .line 391
    .line 392
    invoke-direct {v2, v1, v13}, Lw1/b;-><init>(Lz2/a;[I)V

    .line 393
    .line 394
    .line 395
    goto :goto_f

    .line 396
    :cond_13
    :goto_e
    iget-object v2, v1, Lz2/a;->c:Lw1/b;

    .line 397
    .line 398
    :goto_f
    invoke-virtual {v2, v10}, Lw1/b;->b(Lw1/b;)Lw1/b;

    .line 399
    .line 400
    .line 401
    move-result-object v1

    .line 402
    invoke-virtual {v8}, Lw1/b;->f()I

    .line 403
    .line 404
    .line 405
    move-result v2

    .line 406
    invoke-virtual {v4}, Lw1/b;->f()I

    .line 407
    .line 408
    .line 409
    move-result v5

    .line 410
    if-ge v2, v5, :cond_14

    .line 411
    .line 412
    move-object v2, v8

    .line 413
    move-object v8, v4

    .line 414
    move-object v4, v2

    .line 415
    move/from16 v2, p2

    .line 416
    .line 417
    move-object v10, v9

    .line 418
    move/from16 v6, v16

    .line 419
    .line 420
    const/4 v5, 0x0

    .line 421
    move-object v9, v1

    .line 422
    move-object/from16 v1, p0

    .line 423
    .line 424
    goto/16 :goto_7

    .line 425
    .line 426
    :cond_14
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 427
    .line 428
    new-instance v1, Ljava/lang/StringBuilder;

    .line 429
    .line 430
    const-string v2, "Division algorithm failed to reduce polynomial? r: "

    .line 431
    .line 432
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 433
    .line 434
    .line 435
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 436
    .line 437
    .line 438
    const-string v2, ", rLast: "

    .line 439
    .line 440
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 441
    .line 442
    .line 443
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 444
    .line 445
    .line 446
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 447
    .line 448
    .line 449
    move-result-object v1

    .line 450
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 451
    .line 452
    .line 453
    throw v0

    .line 454
    :cond_15
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 455
    .line 456
    const-string v1, "GenericGFPolys do not have same GenericGF field"

    .line 457
    .line 458
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 459
    .line 460
    .line 461
    throw v0

    .line 462
    :cond_16
    new-instance v0, Lz2/b;

    .line 463
    .line 464
    const-string v1, "r_{i-1} was zero"

    .line 465
    .line 466
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 467
    .line 468
    .line 469
    throw v0

    .line 470
    :cond_17
    move v1, v5

    .line 471
    move/from16 v16, v6

    .line 472
    .line 473
    invoke-virtual {v9, v1}, Lw1/b;->e(I)I

    .line 474
    .line 475
    .line 476
    move-result v2

    .line 477
    if-eqz v2, :cond_24

    .line 478
    .line 479
    invoke-virtual {v3, v2}, Lz2/a;->a(I)I

    .line 480
    .line 481
    .line 482
    move-result v2

    .line 483
    invoke-virtual {v9, v2}, Lw1/b;->h(I)Lw1/b;

    .line 484
    .line 485
    .line 486
    move-result-object v5

    .line 487
    invoke-virtual {v4, v2}, Lw1/b;->h(I)Lw1/b;

    .line 488
    .line 489
    .line 490
    move-result-object v2

    .line 491
    filled-new-array {v5, v2}, [Lw1/b;

    .line 492
    .line 493
    .line 494
    move-result-object v2

    .line 495
    aget-object v4, v2, v1

    .line 496
    .line 497
    aget-object v2, v2, v16

    .line 498
    .line 499
    invoke-virtual {v4}, Lw1/b;->f()I

    .line 500
    .line 501
    .line 502
    move-result v5

    .line 503
    move/from16 v6, v16

    .line 504
    .line 505
    if-ne v5, v6, :cond_18

    .line 506
    .line 507
    invoke-virtual {v4, v6}, Lw1/b;->e(I)I

    .line 508
    .line 509
    .line 510
    move-result v4

    .line 511
    filled-new-array {v4}, [I

    .line 512
    .line 513
    .line 514
    move-result-object v4

    .line 515
    goto :goto_11

    .line 516
    :cond_18
    new-array v6, v5, [I

    .line 517
    .line 518
    move v8, v1

    .line 519
    const/4 v7, 0x1

    .line 520
    :goto_10
    iget v9, v3, Lz2/a;->e:I

    .line 521
    .line 522
    if-ge v7, v9, :cond_1a

    .line 523
    .line 524
    if-ge v8, v5, :cond_1a

    .line 525
    .line 526
    invoke-virtual {v4, v7}, Lw1/b;->c(I)I

    .line 527
    .line 528
    .line 529
    move-result v9

    .line 530
    if-nez v9, :cond_19

    .line 531
    .line 532
    invoke-virtual {v3, v7}, Lz2/a;->a(I)I

    .line 533
    .line 534
    .line 535
    move-result v9

    .line 536
    aput v9, v6, v8

    .line 537
    .line 538
    add-int/lit8 v8, v8, 0x1

    .line 539
    .line 540
    :cond_19
    add-int/lit8 v7, v7, 0x1

    .line 541
    .line 542
    goto :goto_10

    .line 543
    :cond_1a
    if-ne v8, v5, :cond_23

    .line 544
    .line 545
    move-object v4, v6

    .line 546
    :goto_11
    array-length v5, v4

    .line 547
    new-array v6, v5, [I

    .line 548
    .line 549
    move v7, v1

    .line 550
    :goto_12
    if-ge v7, v5, :cond_1f

    .line 551
    .line 552
    aget v8, v4, v7

    .line 553
    .line 554
    invoke-virtual {v3, v8}, Lz2/a;->a(I)I

    .line 555
    .line 556
    .line 557
    move-result v8

    .line 558
    move v10, v1

    .line 559
    const/4 v9, 0x1

    .line 560
    :goto_13
    if-ge v10, v5, :cond_1d

    .line 561
    .line 562
    if-eq v7, v10, :cond_1c

    .line 563
    .line 564
    aget v11, v4, v10

    .line 565
    .line 566
    invoke-virtual {v3, v11, v8}, Lz2/a;->b(II)I

    .line 567
    .line 568
    .line 569
    move-result v11

    .line 570
    and-int/lit8 v12, v11, 0x1

    .line 571
    .line 572
    if-nez v12, :cond_1b

    .line 573
    .line 574
    or-int/lit8 v11, v11, 0x1

    .line 575
    .line 576
    goto :goto_14

    .line 577
    :cond_1b
    and-int/lit8 v11, v11, -0x2

    .line 578
    .line 579
    :goto_14
    invoke-virtual {v3, v9, v11}, Lz2/a;->b(II)I

    .line 580
    .line 581
    .line 582
    move-result v9

    .line 583
    :cond_1c
    add-int/lit8 v10, v10, 0x1

    .line 584
    .line 585
    goto :goto_13

    .line 586
    :cond_1d
    invoke-virtual {v2, v8}, Lw1/b;->c(I)I

    .line 587
    .line 588
    .line 589
    move-result v10

    .line 590
    invoke-virtual {v3, v9}, Lz2/a;->a(I)I

    .line 591
    .line 592
    .line 593
    move-result v9

    .line 594
    invoke-virtual {v3, v10, v9}, Lz2/a;->b(II)I

    .line 595
    .line 596
    .line 597
    move-result v9

    .line 598
    aput v9, v6, v7

    .line 599
    .line 600
    iget v10, v3, Lz2/a;->g:I

    .line 601
    .line 602
    if-eqz v10, :cond_1e

    .line 603
    .line 604
    invoke-virtual {v3, v9, v8}, Lz2/a;->b(II)I

    .line 605
    .line 606
    .line 607
    move-result v8

    .line 608
    aput v8, v6, v7

    .line 609
    .line 610
    :cond_1e
    add-int/lit8 v7, v7, 0x1

    .line 611
    .line 612
    goto :goto_12

    .line 613
    :cond_1f
    move v5, v1

    .line 614
    :goto_15
    array-length v1, v4

    .line 615
    if-ge v5, v1, :cond_22

    .line 616
    .line 617
    array-length v1, v0

    .line 618
    const/16 v16, 0x1

    .line 619
    .line 620
    add-int/lit8 v1, v1, -0x1

    .line 621
    .line 622
    aget v2, v4, v5

    .line 623
    .line 624
    if-eqz v2, :cond_21

    .line 625
    .line 626
    iget-object v7, v3, Lz2/a;->b:[I

    .line 627
    .line 628
    aget v2, v7, v2

    .line 629
    .line 630
    sub-int/2addr v1, v2

    .line 631
    if-ltz v1, :cond_20

    .line 632
    .line 633
    aget v2, v0, v1

    .line 634
    .line 635
    aget v7, v6, v5

    .line 636
    .line 637
    xor-int/2addr v2, v7

    .line 638
    aput v2, v0, v1

    .line 639
    .line 640
    add-int/lit8 v5, v5, 0x1

    .line 641
    .line 642
    goto :goto_15

    .line 643
    :cond_20
    new-instance v0, Lz2/b;

    .line 644
    .line 645
    const-string v1, "Bad error location"

    .line 646
    .line 647
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 648
    .line 649
    .line 650
    throw v0

    .line 651
    :cond_21
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 652
    .line 653
    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 654
    .line 655
    .line 656
    throw v0

    .line 657
    :cond_22
    array-length v0, v4

    .line 658
    return v0

    .line 659
    :cond_23
    new-instance v0, Lz2/b;

    .line 660
    .line 661
    const-string v1, "Error locator degree does not match number of roots"

    .line 662
    .line 663
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 664
    .line 665
    .line 666
    throw v0

    .line 667
    :cond_24
    new-instance v0, Lz2/b;

    .line 668
    .line 669
    const-string v1, "sigmaTilde(0) was zero"

    .line 670
    .line 671
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 672
    .line 673
    .line 674
    throw v0

    .line 675
    :cond_25
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 676
    .line 677
    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 678
    .line 679
    .line 680
    throw v0

    .line 681
    :cond_26
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 682
    .line 683
    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 684
    .line 685
    .line 686
    throw v0
.end method

.method public m(Ljava/lang/String;)Ljava/util/HashMap;
    .locals 4

    .line 1
    invoke-virtual {p0}, Lj3/b;->o()Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    :try_start_0
    new-instance v2, Ljava/util/HashMap;

    .line 13
    .line 14
    const/4 v3, 0x1

    .line 15
    invoke-direct {v2, v3}, Ljava/util/HashMap;-><init>(I)V

    .line 16
    .line 17
    .line 18
    new-instance v3, Lorg/json/JSONObject;

    .line 19
    .line 20
    invoke-direct {v3, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v3}, Lj3/b;->r(Lorg/json/JSONObject;)Ljava/util/HashMap;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v3, "to"

    .line 28
    .line 29
    invoke-virtual {v0, v3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    const-string p1, "message"

    .line 33
    .line 34
    invoke-virtual {v2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    return-object v2

    .line 38
    :catch_0
    move-exception p1

    .line 39
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-object v1
.end method

.method public o()Landroid/content/SharedPreferences;
    .locals 3

    .line 1
    iget-object v0, p0, Lj3/b;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/content/SharedPreferences;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ld1/d;->a:Landroid/content/Context;

    .line 8
    .line 9
    const-string v1, "io.flutter.plugins.firebase.messaging"

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lj3/b;->f:Ljava/lang/Object;

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Lj3/b;->f:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v0, Landroid/content/SharedPreferences;

    .line 21
    .line 22
    return-object v0
.end method

.method public onMethodCall(Lk3/l;Lk3/n;)V
    .locals 37

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    iget v2, v1, Lj3/b;->e:I

    .line 6
    .line 7
    const/4 v3, 0x3

    .line 8
    const/4 v4, -0x1

    .line 9
    const/4 v5, 0x0

    .line 10
    const-string v6, "error"

    .line 11
    .line 12
    const/4 v7, 0x2

    .line 13
    const/4 v8, 0x1

    .line 14
    const/4 v9, 0x0

    .line 15
    packed-switch v2, :pswitch_data_0

    .line 16
    .line 17
    .line 18
    iget-object v2, v1, Lj3/b;->f:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v2, Lio/flutter/plugin/editing/j;

    .line 21
    .line 22
    iget-object v3, v2, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v3, Lio/flutter/plugin/editing/g;

    .line 25
    .line 26
    if-nez v3, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object v3, v0, Lk3/l;->a:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v0, v0, Lk3/l;->b:Ljava/lang/Object;

    .line 32
    .line 33
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    const-string v4, "SpellCheck.initiateSpellCheck"

    .line 37
    .line 38
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-nez v3, :cond_1

    .line 43
    .line 44
    move-object/from16 v0, p2

    .line 45
    .line 46
    check-cast v0, LQ2/g;

    .line 47
    .line 48
    invoke-virtual {v0}, LQ2/g;->b()V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    :try_start_0
    check-cast v0, Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    check-cast v3, Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    check-cast v0, Ljava/lang/String;

    .line 65
    .line 66
    iget-object v2, v2, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 67
    .line 68
    check-cast v2, Lio/flutter/plugin/editing/g;

    .line 69
    .line 70
    move-object/from16 v4, p2

    .line 71
    .line 72
    check-cast v4, LQ2/g;

    .line 73
    .line 74
    invoke-virtual {v2, v3, v0, v4}, Lio/flutter/plugin/editing/g;->a(Ljava/lang/String;Ljava/lang/String;LQ2/g;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :catch_0
    move-exception v0

    .line 79
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    move-object/from16 v2, p2

    .line 84
    .line 85
    check-cast v2, LQ2/g;

    .line 86
    .line 87
    invoke-virtual {v2, v6, v0, v5}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    :goto_0
    return-void

    .line 91
    :pswitch_0
    iget-object v2, v1, Lj3/b;->f:Ljava/lang/Object;

    .line 92
    .line 93
    check-cast v2, Lio/flutter/plugin/editing/j;

    .line 94
    .line 95
    iget-object v10, v2, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 96
    .line 97
    check-cast v10, LM2/b;

    .line 98
    .line 99
    if-nez v10, :cond_2

    .line 100
    .line 101
    goto/16 :goto_7

    .line 102
    .line 103
    :cond_2
    iget-object v10, v0, Lk3/l;->a:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v10}, Ljava/lang/String;->hashCode()I

    .line 109
    .line 110
    .line 111
    move-result v11

    .line 112
    sparse-switch v11, :sswitch_data_0

    .line 113
    .line 114
    .line 115
    goto :goto_1

    .line 116
    :sswitch_0
    const-string v11, "SensitiveContent.isSupported"

    .line 117
    .line 118
    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result v10

    .line 122
    if-nez v10, :cond_3

    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_3
    move v4, v7

    .line 126
    goto :goto_1

    .line 127
    :sswitch_1
    const-string v11, "SensitiveContent.setContentSensitivity"

    .line 128
    .line 129
    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v10

    .line 133
    if-nez v10, :cond_4

    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_4
    move v4, v8

    .line 137
    goto :goto_1

    .line 138
    :sswitch_2
    const-string v11, "SensitiveContent.getContentSensitivity"

    .line 139
    .line 140
    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v10

    .line 144
    if-nez v10, :cond_5

    .line 145
    .line 146
    goto :goto_1

    .line 147
    :cond_5
    move v4, v9

    .line 148
    :goto_1
    packed-switch v4, :pswitch_data_1

    .line 149
    .line 150
    .line 151
    move-object/from16 v0, p2

    .line 152
    .line 153
    check-cast v0, LQ2/g;

    .line 154
    .line 155
    invoke-virtual {v0}, LQ2/g;->b()V

    .line 156
    .line 157
    .line 158
    goto/16 :goto_7

    .line 159
    .line 160
    :pswitch_1
    iget-object v0, v2, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 161
    .line 162
    check-cast v0, LM2/b;

    .line 163
    .line 164
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 165
    .line 166
    .line 167
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 168
    .line 169
    const/16 v2, 0x23

    .line 170
    .line 171
    if-lt v0, v2, :cond_6

    .line 172
    .line 173
    goto :goto_2

    .line 174
    :cond_6
    move v8, v9

    .line 175
    :goto_2
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    move-object/from16 v2, p2

    .line 180
    .line 181
    check-cast v2, LQ2/g;

    .line 182
    .line 183
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 184
    .line 185
    .line 186
    goto/16 :goto_7

    .line 187
    .line 188
    :pswitch_2
    iget-object v0, v0, Lk3/l;->b:Ljava/lang/Object;

    .line 189
    .line 190
    check-cast v0, Ljava/lang/Integer;

    .line 191
    .line 192
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    :try_start_1
    iget-object v2, v2, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 197
    .line 198
    check-cast v2, LM2/b;

    .line 199
    .line 200
    if-eqz v0, :cond_9

    .line 201
    .line 202
    if-eq v0, v8, :cond_8

    .line 203
    .line 204
    if-ne v0, v7, :cond_7

    .line 205
    .line 206
    goto :goto_3

    .line 207
    :cond_7
    new-instance v2, Ljava/lang/IllegalArgumentException;

    .line 208
    .line 209
    const-string v3, "contentSensitivityIndex "

    .line 210
    .line 211
    const-string v4, " not known to the SensitiveContentChannel."

    .line 212
    .line 213
    invoke-static {v0, v3, v4}, LE1/j;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    invoke-direct {v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    throw v2

    .line 221
    :cond_8
    move v7, v8

    .line 222
    goto :goto_3

    .line 223
    :cond_9
    move v7, v9

    .line 224
    :goto_3
    invoke-virtual {v2, v7}, LM2/b;->g(I)V
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    .line 225
    .line 226
    .line 227
    goto :goto_7

    .line 228
    :catch_1
    move-exception v0

    .line 229
    goto :goto_4

    .line 230
    :catch_2
    move-exception v0

    .line 231
    :goto_4
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    move-object/from16 v2, p2

    .line 236
    .line 237
    check-cast v2, LQ2/g;

    .line 238
    .line 239
    invoke-virtual {v2, v6, v0, v5}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 240
    .line 241
    .line 242
    goto :goto_7

    .line 243
    :pswitch_3
    :try_start_2
    iget-object v0, v2, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 244
    .line 245
    check-cast v0, LM2/b;

    .line 246
    .line 247
    invoke-virtual {v0}, LM2/b;->e()I

    .line 248
    .line 249
    .line 250
    move-result v0

    .line 251
    if-eqz v0, :cond_c

    .line 252
    .line 253
    if-eq v0, v8, :cond_b

    .line 254
    .line 255
    if-eq v0, v7, :cond_a

    .line 256
    .line 257
    goto :goto_5

    .line 258
    :cond_a
    move v3, v7

    .line 259
    goto :goto_5

    .line 260
    :cond_b
    move v3, v8

    .line 261
    goto :goto_5

    .line 262
    :cond_c
    move v3, v9

    .line 263
    :goto_5
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    move-object/from16 v2, p2

    .line 268
    .line 269
    check-cast v2, LQ2/g;

    .line 270
    .line 271
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_3

    .line 272
    .line 273
    .line 274
    goto :goto_7

    .line 275
    :catch_3
    move-exception v0

    .line 276
    goto :goto_6

    .line 277
    :catch_4
    move-exception v0

    .line 278
    :goto_6
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    move-object/from16 v2, p2

    .line 283
    .line 284
    check-cast v2, LQ2/g;

    .line 285
    .line 286
    invoke-virtual {v2, v6, v0, v5}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 287
    .line 288
    .line 289
    :goto_7
    return-void

    .line 290
    :pswitch_4
    iget-object v2, v1, Lj3/b;->f:Ljava/lang/Object;

    .line 291
    .line 292
    check-cast v2, Lio/flutter/plugin/editing/j;

    .line 293
    .line 294
    iget-object v3, v2, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 295
    .line 296
    check-cast v3, LZ2/s;

    .line 297
    .line 298
    if-nez v3, :cond_d

    .line 299
    .line 300
    goto/16 :goto_a

    .line 301
    .line 302
    :cond_d
    iget-object v0, v0, Lk3/l;->a:Ljava/lang/String;

    .line 303
    .line 304
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 305
    .line 306
    .line 307
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 308
    .line 309
    .line 310
    move-result v3

    .line 311
    sparse-switch v3, :sswitch_data_1

    .line 312
    .line 313
    .line 314
    goto :goto_8

    .line 315
    :sswitch_3
    const-string v3, "Scribe.isStylusHandwritingAvailable"

    .line 316
    .line 317
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 318
    .line 319
    .line 320
    move-result v0

    .line 321
    if-nez v0, :cond_e

    .line 322
    .line 323
    goto :goto_8

    .line 324
    :cond_e
    move v4, v7

    .line 325
    goto :goto_8

    .line 326
    :sswitch_4
    const-string v3, "Scribe.startStylusHandwriting"

    .line 327
    .line 328
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 329
    .line 330
    .line 331
    move-result v0

    .line 332
    if-nez v0, :cond_f

    .line 333
    .line 334
    goto :goto_8

    .line 335
    :cond_f
    move v4, v8

    .line 336
    goto :goto_8

    .line 337
    :sswitch_5
    const-string v3, "Scribe.isFeatureAvailable"

    .line 338
    .line 339
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 340
    .line 341
    .line 342
    move-result v0

    .line 343
    if-nez v0, :cond_10

    .line 344
    .line 345
    goto :goto_8

    .line 346
    :cond_10
    move v4, v9

    .line 347
    :goto_8
    const/16 v0, 0x22

    .line 348
    .line 349
    packed-switch v4, :pswitch_data_2

    .line 350
    .line 351
    .line 352
    move-object/from16 v0, p2

    .line 353
    .line 354
    check-cast v0, LQ2/g;

    .line 355
    .line 356
    invoke-virtual {v0}, LQ2/g;->b()V

    .line 357
    .line 358
    .line 359
    goto/16 :goto_a

    .line 360
    .line 361
    :pswitch_5
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 362
    .line 363
    if-ge v3, v0, :cond_11

    .line 364
    .line 365
    const-string v0, "Requires API level 34 or higher."

    .line 366
    .line 367
    move-object/from16 v2, p2

    .line 368
    .line 369
    check-cast v2, LQ2/g;

    .line 370
    .line 371
    invoke-virtual {v2, v6, v0, v5}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 372
    .line 373
    .line 374
    goto/16 :goto_a

    .line 375
    .line 376
    :cond_11
    :try_start_3
    iget-object v0, v2, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 377
    .line 378
    check-cast v0, LZ2/s;

    .line 379
    .line 380
    iget-object v0, v0, LZ2/s;->f:Ljava/lang/Object;

    .line 381
    .line 382
    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 383
    .line 384
    invoke-static {v0}, LD/U;->e(Landroid/view/inputmethod/InputMethodManager;)Z

    .line 385
    .line 386
    .line 387
    move-result v0

    .line 388
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 389
    .line 390
    .line 391
    move-result-object v0

    .line 392
    move-object/from16 v2, p2

    .line 393
    .line 394
    check-cast v2, LQ2/g;

    .line 395
    .line 396
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/IllegalStateException; {:try_start_3 .. :try_end_3} :catch_5

    .line 397
    .line 398
    .line 399
    goto/16 :goto_a

    .line 400
    .line 401
    :catch_5
    move-exception v0

    .line 402
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 403
    .line 404
    .line 405
    move-result-object v0

    .line 406
    move-object/from16 v2, p2

    .line 407
    .line 408
    check-cast v2, LQ2/g;

    .line 409
    .line 410
    invoke-virtual {v2, v6, v0, v5}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 411
    .line 412
    .line 413
    goto :goto_a

    .line 414
    :pswitch_6
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 415
    .line 416
    const/16 v3, 0x21

    .line 417
    .line 418
    if-ge v0, v3, :cond_12

    .line 419
    .line 420
    const-string v0, "Requires API level 33 or higher."

    .line 421
    .line 422
    move-object/from16 v2, p2

    .line 423
    .line 424
    check-cast v2, LQ2/g;

    .line 425
    .line 426
    invoke-virtual {v2, v6, v0, v5}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 427
    .line 428
    .line 429
    goto :goto_a

    .line 430
    :cond_12
    :try_start_4
    iget-object v0, v2, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 431
    .line 432
    check-cast v0, LZ2/s;

    .line 433
    .line 434
    iget-object v2, v0, LZ2/s;->f:Ljava/lang/Object;

    .line 435
    .line 436
    check-cast v2, Landroid/view/inputmethod/InputMethodManager;

    .line 437
    .line 438
    iget-object v0, v0, LZ2/s;->g:Ljava/lang/Object;

    .line 439
    .line 440
    check-cast v0, Landroid/view/View;

    .line 441
    .line 442
    invoke-static {v2, v0}, LE/c;->u(Landroid/view/inputmethod/InputMethodManager;Landroid/view/View;)V

    .line 443
    .line 444
    .line 445
    move-object/from16 v0, p2

    .line 446
    .line 447
    check-cast v0, LQ2/g;

    .line 448
    .line 449
    invoke-virtual {v0, v5}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_4
    .catch Ljava/lang/IllegalStateException; {:try_start_4 .. :try_end_4} :catch_6

    .line 450
    .line 451
    .line 452
    goto :goto_a

    .line 453
    :catch_6
    move-exception v0

    .line 454
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 455
    .line 456
    .line 457
    move-result-object v0

    .line 458
    move-object/from16 v2, p2

    .line 459
    .line 460
    check-cast v2, LQ2/g;

    .line 461
    .line 462
    invoke-virtual {v2, v6, v0, v5}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 463
    .line 464
    .line 465
    goto :goto_a

    .line 466
    :pswitch_7
    :try_start_5
    iget-object v2, v2, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 467
    .line 468
    check-cast v2, LZ2/s;

    .line 469
    .line 470
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 471
    .line 472
    if-lt v3, v0, :cond_13

    .line 473
    .line 474
    iget-object v0, v2, LZ2/s;->f:Ljava/lang/Object;

    .line 475
    .line 476
    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 477
    .line 478
    invoke-static {v0}, LD/U;->e(Landroid/view/inputmethod/InputMethodManager;)Z

    .line 479
    .line 480
    .line 481
    move-result v0

    .line 482
    if-eqz v0, :cond_14

    .line 483
    .line 484
    goto :goto_9

    .line 485
    :cond_13
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 486
    .line 487
    .line 488
    :cond_14
    move v8, v9

    .line 489
    :goto_9
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 490
    .line 491
    .line 492
    move-result-object v0

    .line 493
    move-object/from16 v2, p2

    .line 494
    .line 495
    check-cast v2, LQ2/g;

    .line 496
    .line 497
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_5
    .catch Ljava/lang/IllegalStateException; {:try_start_5 .. :try_end_5} :catch_7

    .line 498
    .line 499
    .line 500
    goto :goto_a

    .line 501
    :catch_7
    move-exception v0

    .line 502
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 503
    .line 504
    .line 505
    move-result-object v0

    .line 506
    move-object/from16 v2, p2

    .line 507
    .line 508
    check-cast v2, LQ2/g;

    .line 509
    .line 510
    invoke-virtual {v2, v6, v0, v5}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 511
    .line 512
    .line 513
    :goto_a
    return-void

    .line 514
    :pswitch_8
    iget-object v2, v1, Lj3/b;->f:Ljava/lang/Object;

    .line 515
    .line 516
    check-cast v2, LZ2/s;

    .line 517
    .line 518
    iget-object v3, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 519
    .line 520
    check-cast v3, Ln3/a;

    .line 521
    .line 522
    if-nez v3, :cond_15

    .line 523
    .line 524
    goto :goto_b

    .line 525
    :cond_15
    iget-object v3, v0, Lk3/l;->a:Ljava/lang/String;

    .line 526
    .line 527
    iget-object v0, v0, Lk3/l;->b:Ljava/lang/Object;

    .line 528
    .line 529
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 530
    .line 531
    .line 532
    const-string v4, "ProcessText.processTextAction"

    .line 533
    .line 534
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 535
    .line 536
    .line 537
    move-result v4

    .line 538
    if-nez v4, :cond_17

    .line 539
    .line 540
    const-string v0, "ProcessText.queryTextActions"

    .line 541
    .line 542
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 543
    .line 544
    .line 545
    move-result v0

    .line 546
    if-nez v0, :cond_16

    .line 547
    .line 548
    move-object/from16 v0, p2

    .line 549
    .line 550
    check-cast v0, LQ2/g;

    .line 551
    .line 552
    invoke-virtual {v0}, LQ2/g;->b()V

    .line 553
    .line 554
    .line 555
    goto :goto_b

    .line 556
    :cond_16
    :try_start_6
    iget-object v0, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 557
    .line 558
    check-cast v0, Ln3/a;

    .line 559
    .line 560
    invoke-virtual {v0}, Ln3/a;->b()Ljava/util/HashMap;

    .line 561
    .line 562
    .line 563
    move-result-object v0

    .line 564
    move-object/from16 v2, p2

    .line 565
    .line 566
    check-cast v2, LQ2/g;

    .line 567
    .line 568
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_6
    .catch Ljava/lang/IllegalStateException; {:try_start_6 .. :try_end_6} :catch_8

    .line 569
    .line 570
    .line 571
    goto :goto_b

    .line 572
    :catch_8
    move-exception v0

    .line 573
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 574
    .line 575
    .line 576
    move-result-object v0

    .line 577
    move-object/from16 v2, p2

    .line 578
    .line 579
    check-cast v2, LQ2/g;

    .line 580
    .line 581
    invoke-virtual {v2, v6, v0, v5}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 582
    .line 583
    .line 584
    goto :goto_b

    .line 585
    :cond_17
    :try_start_7
    check-cast v0, Ljava/util/ArrayList;

    .line 586
    .line 587
    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 588
    .line 589
    .line 590
    move-result-object v3

    .line 591
    check-cast v3, Ljava/lang/String;

    .line 592
    .line 593
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 594
    .line 595
    .line 596
    move-result-object v4

    .line 597
    check-cast v4, Ljava/lang/String;

    .line 598
    .line 599
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 600
    .line 601
    .line 602
    move-result-object v0

    .line 603
    check-cast v0, Ljava/lang/Boolean;

    .line 604
    .line 605
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 606
    .line 607
    .line 608
    move-result v0

    .line 609
    iget-object v2, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 610
    .line 611
    check-cast v2, Ln3/a;

    .line 612
    .line 613
    move-object/from16 v7, p2

    .line 614
    .line 615
    check-cast v7, LQ2/g;

    .line 616
    .line 617
    invoke-virtual {v2, v3, v4, v0, v7}, Ln3/a;->a(Ljava/lang/String;Ljava/lang/String;ZLQ2/g;)V
    :try_end_7
    .catch Ljava/lang/IllegalStateException; {:try_start_7 .. :try_end_7} :catch_9

    .line 618
    .line 619
    .line 620
    goto :goto_b

    .line 621
    :catch_9
    move-exception v0

    .line 622
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 623
    .line 624
    .line 625
    move-result-object v0

    .line 626
    move-object/from16 v2, p2

    .line 627
    .line 628
    check-cast v2, LQ2/g;

    .line 629
    .line 630
    invoke-virtual {v2, v6, v0, v5}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 631
    .line 632
    .line 633
    :goto_b
    return-void

    .line 634
    :pswitch_9
    iget-object v2, v1, Lj3/b;->f:Ljava/lang/Object;

    .line 635
    .line 636
    check-cast v2, LZ2/s;

    .line 637
    .line 638
    iget-object v10, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 639
    .line 640
    check-cast v10, Lj3/i;

    .line 641
    .line 642
    if-nez v10, :cond_18

    .line 643
    .line 644
    goto/16 :goto_13

    .line 645
    .line 646
    :cond_18
    iget-object v10, v0, Lk3/l;->a:Ljava/lang/String;

    .line 647
    .line 648
    iget-object v0, v0, Lk3/l;->b:Ljava/lang/Object;

    .line 649
    .line 650
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 651
    .line 652
    .line 653
    invoke-virtual {v10}, Ljava/lang/String;->hashCode()I

    .line 654
    .line 655
    .line 656
    move-result v11

    .line 657
    sparse-switch v11, :sswitch_data_2

    .line 658
    .line 659
    .line 660
    goto/16 :goto_c

    .line 661
    .line 662
    :sswitch_6
    const-string v11, "dispose"

    .line 663
    .line 664
    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 665
    .line 666
    .line 667
    move-result v10

    .line 668
    if-nez v10, :cond_19

    .line 669
    .line 670
    goto :goto_c

    .line 671
    :cond_19
    const/4 v4, 0x7

    .line 672
    goto :goto_c

    .line 673
    :sswitch_7
    const-string v11, "setDirection"

    .line 674
    .line 675
    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 676
    .line 677
    .line 678
    move-result v10

    .line 679
    if-nez v10, :cond_1a

    .line 680
    .line 681
    goto :goto_c

    .line 682
    :cond_1a
    const/4 v4, 0x6

    .line 683
    goto :goto_c

    .line 684
    :sswitch_8
    const-string v11, "touch"

    .line 685
    .line 686
    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 687
    .line 688
    .line 689
    move-result v10

    .line 690
    if-nez v10, :cond_1b

    .line 691
    .line 692
    goto :goto_c

    .line 693
    :cond_1b
    const/4 v4, 0x5

    .line 694
    goto :goto_c

    .line 695
    :sswitch_9
    const-string v11, "synchronizeToNativeViewHierarchy"

    .line 696
    .line 697
    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 698
    .line 699
    .line 700
    move-result v10

    .line 701
    if-nez v10, :cond_1c

    .line 702
    .line 703
    goto :goto_c

    .line 704
    :cond_1c
    const/4 v4, 0x4

    .line 705
    goto :goto_c

    .line 706
    :sswitch_a
    const-string v11, "clearFocus"

    .line 707
    .line 708
    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 709
    .line 710
    .line 711
    move-result v10

    .line 712
    if-nez v10, :cond_1d

    .line 713
    .line 714
    goto :goto_c

    .line 715
    :cond_1d
    move v4, v3

    .line 716
    goto :goto_c

    .line 717
    :sswitch_b
    const-string v11, "resize"

    .line 718
    .line 719
    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 720
    .line 721
    .line 722
    move-result v10

    .line 723
    if-nez v10, :cond_1e

    .line 724
    .line 725
    goto :goto_c

    .line 726
    :cond_1e
    move v4, v7

    .line 727
    goto :goto_c

    .line 728
    :sswitch_c
    const-string v11, "offset"

    .line 729
    .line 730
    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 731
    .line 732
    .line 733
    move-result v10

    .line 734
    if-nez v10, :cond_1f

    .line 735
    .line 736
    goto :goto_c

    .line 737
    :cond_1f
    move v4, v8

    .line 738
    goto :goto_c

    .line 739
    :sswitch_d
    const-string v11, "create"

    .line 740
    .line 741
    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 742
    .line 743
    .line 744
    move-result v10

    .line 745
    if-nez v10, :cond_20

    .line 746
    .line 747
    goto :goto_c

    .line 748
    :cond_20
    move v4, v9

    .line 749
    :goto_c
    const-string v10, "left"

    .line 750
    .line 751
    const-string v11, "top"

    .line 752
    .line 753
    const-string v12, "height"

    .line 754
    .line 755
    const-string v13, "width"

    .line 756
    .line 757
    const-string v14, "direction"

    .line 758
    .line 759
    const-string v15, "id"

    .line 760
    .line 761
    packed-switch v4, :pswitch_data_3

    .line 762
    .line 763
    .line 764
    move-object/from16 v0, p2

    .line 765
    .line 766
    check-cast v0, LQ2/g;

    .line 767
    .line 768
    invoke-virtual {v0}, LQ2/g;->b()V

    .line 769
    .line 770
    .line 771
    goto/16 :goto_13

    .line 772
    .line 773
    :pswitch_a
    check-cast v0, Ljava/util/Map;

    .line 774
    .line 775
    invoke-interface {v0, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 776
    .line 777
    .line 778
    move-result-object v0

    .line 779
    check-cast v0, Ljava/lang/Integer;

    .line 780
    .line 781
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 782
    .line 783
    .line 784
    move-result v0

    .line 785
    :try_start_8
    iget-object v2, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 786
    .line 787
    check-cast v2, Lj3/i;

    .line 788
    .line 789
    invoke-interface {v2, v0}, Lj3/i;->n(I)V

    .line 790
    .line 791
    .line 792
    move-object/from16 v0, p2

    .line 793
    .line 794
    check-cast v0, LQ2/g;

    .line 795
    .line 796
    invoke-virtual {v0, v5}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_8
    .catch Ljava/lang/IllegalStateException; {:try_start_8 .. :try_end_8} :catch_a

    .line 797
    .line 798
    .line 799
    goto/16 :goto_13

    .line 800
    .line 801
    :catch_a
    move-exception v0

    .line 802
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 803
    .line 804
    .line 805
    move-result-object v0

    .line 806
    move-object/from16 v2, p2

    .line 807
    .line 808
    check-cast v2, LQ2/g;

    .line 809
    .line 810
    invoke-virtual {v2, v6, v0, v5}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 811
    .line 812
    .line 813
    goto/16 :goto_13

    .line 814
    .line 815
    :pswitch_b
    check-cast v0, Ljava/util/Map;

    .line 816
    .line 817
    invoke-interface {v0, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 818
    .line 819
    .line 820
    move-result-object v3

    .line 821
    check-cast v3, Ljava/lang/Integer;

    .line 822
    .line 823
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 824
    .line 825
    .line 826
    move-result v3

    .line 827
    invoke-interface {v0, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 828
    .line 829
    .line 830
    move-result-object v0

    .line 831
    check-cast v0, Ljava/lang/Integer;

    .line 832
    .line 833
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 834
    .line 835
    .line 836
    move-result v0

    .line 837
    :try_start_9
    iget-object v2, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 838
    .line 839
    check-cast v2, Lj3/i;

    .line 840
    .line 841
    invoke-interface {v2, v3, v0}, Lj3/i;->e(II)V

    .line 842
    .line 843
    .line 844
    move-object/from16 v0, p2

    .line 845
    .line 846
    check-cast v0, LQ2/g;

    .line 847
    .line 848
    invoke-virtual {v0, v5}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_9
    .catch Ljava/lang/IllegalStateException; {:try_start_9 .. :try_end_9} :catch_b

    .line 849
    .line 850
    .line 851
    goto/16 :goto_13

    .line 852
    .line 853
    :catch_b
    move-exception v0

    .line 854
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 855
    .line 856
    .line 857
    move-result-object v0

    .line 858
    move-object/from16 v2, p2

    .line 859
    .line 860
    check-cast v2, LQ2/g;

    .line 861
    .line 862
    invoke-virtual {v2, v6, v0, v5}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 863
    .line 864
    .line 865
    goto/16 :goto_13

    .line 866
    .line 867
    :pswitch_c
    check-cast v0, Ljava/util/List;

    .line 868
    .line 869
    new-instance v19, Lj3/f;

    .line 870
    .line 871
    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 872
    .line 873
    .line 874
    move-result-object v4

    .line 875
    check-cast v4, Ljava/lang/Integer;

    .line 876
    .line 877
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 878
    .line 879
    .line 880
    move-result v20

    .line 881
    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 882
    .line 883
    .line 884
    move-result-object v4

    .line 885
    move-object/from16 v21, v4

    .line 886
    .line 887
    check-cast v21, Ljava/lang/Number;

    .line 888
    .line 889
    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 890
    .line 891
    .line 892
    move-result-object v4

    .line 893
    move-object/from16 v22, v4

    .line 894
    .line 895
    check-cast v22, Ljava/lang/Number;

    .line 896
    .line 897
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 898
    .line 899
    .line 900
    move-result-object v3

    .line 901
    check-cast v3, Ljava/lang/Integer;

    .line 902
    .line 903
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 904
    .line 905
    .line 906
    move-result v23

    .line 907
    const/4 v3, 0x4

    .line 908
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 909
    .line 910
    .line 911
    move-result-object v3

    .line 912
    check-cast v3, Ljava/lang/Integer;

    .line 913
    .line 914
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 915
    .line 916
    .line 917
    move-result v24

    .line 918
    const/4 v3, 0x5

    .line 919
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 920
    .line 921
    .line 922
    move-result-object v25

    .line 923
    const/4 v3, 0x6

    .line 924
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 925
    .line 926
    .line 927
    move-result-object v26

    .line 928
    const/4 v3, 0x7

    .line 929
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 930
    .line 931
    .line 932
    move-result-object v3

    .line 933
    check-cast v3, Ljava/lang/Integer;

    .line 934
    .line 935
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 936
    .line 937
    .line 938
    move-result v27

    .line 939
    const/16 v3, 0x8

    .line 940
    .line 941
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 942
    .line 943
    .line 944
    move-result-object v3

    .line 945
    check-cast v3, Ljava/lang/Integer;

    .line 946
    .line 947
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 948
    .line 949
    .line 950
    move-result v28

    .line 951
    const/16 v3, 0x9

    .line 952
    .line 953
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 954
    .line 955
    .line 956
    move-result-object v3

    .line 957
    check-cast v3, Ljava/lang/Double;

    .line 958
    .line 959
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    .line 960
    .line 961
    .line 962
    move-result-wide v3

    .line 963
    double-to-float v3, v3

    .line 964
    const/16 v4, 0xa

    .line 965
    .line 966
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 967
    .line 968
    .line 969
    move-result-object v4

    .line 970
    check-cast v4, Ljava/lang/Double;

    .line 971
    .line 972
    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    .line 973
    .line 974
    .line 975
    move-result-wide v7

    .line 976
    double-to-float v4, v7

    .line 977
    const/16 v7, 0xb

    .line 978
    .line 979
    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 980
    .line 981
    .line 982
    move-result-object v7

    .line 983
    check-cast v7, Ljava/lang/Integer;

    .line 984
    .line 985
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 986
    .line 987
    .line 988
    move-result v31

    .line 989
    const/16 v7, 0xc

    .line 990
    .line 991
    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 992
    .line 993
    .line 994
    move-result-object v7

    .line 995
    check-cast v7, Ljava/lang/Integer;

    .line 996
    .line 997
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 998
    .line 999
    .line 1000
    move-result v32

    .line 1001
    const/16 v7, 0xd

    .line 1002
    .line 1003
    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1004
    .line 1005
    .line 1006
    move-result-object v7

    .line 1007
    check-cast v7, Ljava/lang/Integer;

    .line 1008
    .line 1009
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 1010
    .line 1011
    .line 1012
    move-result v33

    .line 1013
    const/16 v7, 0xe

    .line 1014
    .line 1015
    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1016
    .line 1017
    .line 1018
    move-result-object v7

    .line 1019
    check-cast v7, Ljava/lang/Integer;

    .line 1020
    .line 1021
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 1022
    .line 1023
    .line 1024
    move-result v34

    .line 1025
    const/16 v7, 0xf

    .line 1026
    .line 1027
    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1028
    .line 1029
    .line 1030
    move-result-object v0

    .line 1031
    check-cast v0, Ljava/lang/Number;

    .line 1032
    .line 1033
    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    .line 1034
    .line 1035
    .line 1036
    move-result-wide v35

    .line 1037
    move/from16 v29, v3

    .line 1038
    .line 1039
    move/from16 v30, v4

    .line 1040
    .line 1041
    invoke-direct/range {v19 .. v36}, Lj3/f;-><init>(ILjava/lang/Number;Ljava/lang/Number;IILjava/lang/Object;Ljava/lang/Object;IIFFIIIIJ)V

    .line 1042
    .line 1043
    .line 1044
    move-object/from16 v0, v19

    .line 1045
    .line 1046
    :try_start_a
    iget-object v2, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 1047
    .line 1048
    check-cast v2, Lj3/i;

    .line 1049
    .line 1050
    invoke-interface {v2, v0}, Lj3/i;->m(Lj3/f;)V

    .line 1051
    .line 1052
    .line 1053
    move-object/from16 v0, p2

    .line 1054
    .line 1055
    check-cast v0, LQ2/g;

    .line 1056
    .line 1057
    invoke-virtual {v0, v5}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_a
    .catch Ljava/lang/IllegalStateException; {:try_start_a .. :try_end_a} :catch_c

    .line 1058
    .line 1059
    .line 1060
    goto/16 :goto_13

    .line 1061
    .line 1062
    :catch_c
    move-exception v0

    .line 1063
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 1064
    .line 1065
    .line 1066
    move-result-object v0

    .line 1067
    move-object/from16 v2, p2

    .line 1068
    .line 1069
    check-cast v2, LQ2/g;

    .line 1070
    .line 1071
    invoke-virtual {v2, v6, v0, v5}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1072
    .line 1073
    .line 1074
    goto/16 :goto_13

    .line 1075
    .line 1076
    :pswitch_d
    check-cast v0, Ljava/lang/Boolean;

    .line 1077
    .line 1078
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 1079
    .line 1080
    .line 1081
    move-result v0

    .line 1082
    :try_start_b
    iget-object v2, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 1083
    .line 1084
    check-cast v2, Lj3/i;

    .line 1085
    .line 1086
    invoke-interface {v2, v0}, Lj3/i;->b(Z)V

    .line 1087
    .line 1088
    .line 1089
    move-object/from16 v0, p2

    .line 1090
    .line 1091
    check-cast v0, LQ2/g;

    .line 1092
    .line 1093
    invoke-virtual {v0, v5}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_b
    .catch Ljava/lang/IllegalStateException; {:try_start_b .. :try_end_b} :catch_d

    .line 1094
    .line 1095
    .line 1096
    goto/16 :goto_13

    .line 1097
    .line 1098
    :catch_d
    move-exception v0

    .line 1099
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 1100
    .line 1101
    .line 1102
    move-result-object v0

    .line 1103
    move-object/from16 v2, p2

    .line 1104
    .line 1105
    check-cast v2, LQ2/g;

    .line 1106
    .line 1107
    invoke-virtual {v2, v6, v0, v5}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1108
    .line 1109
    .line 1110
    goto/16 :goto_13

    .line 1111
    .line 1112
    :pswitch_e
    check-cast v0, Ljava/lang/Integer;

    .line 1113
    .line 1114
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 1115
    .line 1116
    .line 1117
    move-result v0

    .line 1118
    :try_start_c
    iget-object v2, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 1119
    .line 1120
    check-cast v2, Lj3/i;

    .line 1121
    .line 1122
    invoke-interface {v2, v0}, Lj3/i;->j(I)V

    .line 1123
    .line 1124
    .line 1125
    move-object/from16 v0, p2

    .line 1126
    .line 1127
    check-cast v0, LQ2/g;

    .line 1128
    .line 1129
    invoke-virtual {v0, v5}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_c
    .catch Ljava/lang/IllegalStateException; {:try_start_c .. :try_end_c} :catch_e

    .line 1130
    .line 1131
    .line 1132
    goto/16 :goto_13

    .line 1133
    .line 1134
    :catch_e
    move-exception v0

    .line 1135
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 1136
    .line 1137
    .line 1138
    move-result-object v0

    .line 1139
    move-object/from16 v2, p2

    .line 1140
    .line 1141
    check-cast v2, LQ2/g;

    .line 1142
    .line 1143
    invoke-virtual {v2, v6, v0, v5}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1144
    .line 1145
    .line 1146
    goto/16 :goto_13

    .line 1147
    .line 1148
    :pswitch_f
    check-cast v0, Ljava/util/Map;

    .line 1149
    .line 1150
    new-instance v16, Lj3/h;

    .line 1151
    .line 1152
    invoke-interface {v0, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1153
    .line 1154
    .line 1155
    move-result-object v3

    .line 1156
    check-cast v3, Ljava/lang/Integer;

    .line 1157
    .line 1158
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 1159
    .line 1160
    .line 1161
    move-result v17

    .line 1162
    invoke-interface {v0, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1163
    .line 1164
    .line 1165
    move-result-object v3

    .line 1166
    check-cast v3, Ljava/lang/Double;

    .line 1167
    .line 1168
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    .line 1169
    .line 1170
    .line 1171
    move-result-wide v18

    .line 1172
    invoke-interface {v0, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1173
    .line 1174
    .line 1175
    move-result-object v0

    .line 1176
    check-cast v0, Ljava/lang/Double;

    .line 1177
    .line 1178
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 1179
    .line 1180
    .line 1181
    move-result-wide v20

    .line 1182
    invoke-direct/range {v16 .. v21}, Lj3/h;-><init>(IDD)V

    .line 1183
    .line 1184
    .line 1185
    move-object/from16 v0, v16

    .line 1186
    .line 1187
    :try_start_d
    iget-object v2, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 1188
    .line 1189
    check-cast v2, Lj3/i;

    .line 1190
    .line 1191
    new-instance v3, Lj3/g;

    .line 1192
    .line 1193
    move-object/from16 v4, p2

    .line 1194
    .line 1195
    check-cast v4, LQ2/g;

    .line 1196
    .line 1197
    invoke-direct {v3, v4}, Lj3/g;-><init>(LQ2/g;)V

    .line 1198
    .line 1199
    .line 1200
    invoke-interface {v2, v0, v3}, Lj3/i;->f(Lj3/h;Lj3/g;)V
    :try_end_d
    .catch Ljava/lang/IllegalStateException; {:try_start_d .. :try_end_d} :catch_f

    .line 1201
    .line 1202
    .line 1203
    goto/16 :goto_13

    .line 1204
    .line 1205
    :catch_f
    move-exception v0

    .line 1206
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 1207
    .line 1208
    .line 1209
    move-result-object v0

    .line 1210
    move-object/from16 v2, p2

    .line 1211
    .line 1212
    check-cast v2, LQ2/g;

    .line 1213
    .line 1214
    invoke-virtual {v2, v6, v0, v5}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1215
    .line 1216
    .line 1217
    goto/16 :goto_13

    .line 1218
    .line 1219
    :pswitch_10
    check-cast v0, Ljava/util/Map;

    .line 1220
    .line 1221
    :try_start_e
    iget-object v2, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 1222
    .line 1223
    move-object/from16 v16, v2

    .line 1224
    .line 1225
    check-cast v16, Lj3/i;

    .line 1226
    .line 1227
    invoke-interface {v0, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1228
    .line 1229
    .line 1230
    move-result-object v2

    .line 1231
    check-cast v2, Ljava/lang/Integer;

    .line 1232
    .line 1233
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 1234
    .line 1235
    .line 1236
    move-result v17

    .line 1237
    invoke-interface {v0, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1238
    .line 1239
    .line 1240
    move-result-object v2

    .line 1241
    check-cast v2, Ljava/lang/Double;

    .line 1242
    .line 1243
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    .line 1244
    .line 1245
    .line 1246
    move-result-wide v18

    .line 1247
    invoke-interface {v0, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1248
    .line 1249
    .line 1250
    move-result-object v0

    .line 1251
    check-cast v0, Ljava/lang/Double;

    .line 1252
    .line 1253
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 1254
    .line 1255
    .line 1256
    move-result-wide v20

    .line 1257
    invoke-interface/range {v16 .. v21}, Lj3/i;->d(IDD)V

    .line 1258
    .line 1259
    .line 1260
    move-object/from16 v0, p2

    .line 1261
    .line 1262
    check-cast v0, LQ2/g;

    .line 1263
    .line 1264
    invoke-virtual {v0, v5}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_e
    .catch Ljava/lang/IllegalStateException; {:try_start_e .. :try_end_e} :catch_10

    .line 1265
    .line 1266
    .line 1267
    goto/16 :goto_13

    .line 1268
    .line 1269
    :catch_10
    move-exception v0

    .line 1270
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 1271
    .line 1272
    .line 1273
    move-result-object v0

    .line 1274
    move-object/from16 v2, p2

    .line 1275
    .line 1276
    check-cast v2, LQ2/g;

    .line 1277
    .line 1278
    invoke-virtual {v2, v6, v0, v5}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1279
    .line 1280
    .line 1281
    goto/16 :goto_13

    .line 1282
    .line 1283
    :pswitch_11
    const-string v3, "hybridFallback"

    .line 1284
    .line 1285
    check-cast v0, Ljava/util/Map;

    .line 1286
    .line 1287
    const-string v4, "hybrid"

    .line 1288
    .line 1289
    invoke-interface {v0, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 1290
    .line 1291
    .line 1292
    move-result v16

    .line 1293
    if-eqz v16, :cond_21

    .line 1294
    .line 1295
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1296
    .line 1297
    .line 1298
    move-result-object v4

    .line 1299
    check-cast v4, Ljava/lang/Boolean;

    .line 1300
    .line 1301
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 1302
    .line 1303
    .line 1304
    move-result v4

    .line 1305
    if-eqz v4, :cond_21

    .line 1306
    .line 1307
    move v4, v8

    .line 1308
    goto :goto_d

    .line 1309
    :cond_21
    move v4, v9

    .line 1310
    :goto_d
    const-string v7, "params"

    .line 1311
    .line 1312
    invoke-interface {v0, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 1313
    .line 1314
    .line 1315
    move-result v17

    .line 1316
    if-eqz v17, :cond_22

    .line 1317
    .line 1318
    invoke-interface {v0, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1319
    .line 1320
    .line 1321
    move-result-object v7

    .line 1322
    check-cast v7, [B

    .line 1323
    .line 1324
    invoke-static {v7}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 1325
    .line 1326
    .line 1327
    move-result-object v7

    .line 1328
    move-object/from16 v30, v7

    .line 1329
    .line 1330
    goto :goto_e

    .line 1331
    :cond_22
    move-object/from16 v30, v5

    .line 1332
    .line 1333
    :goto_e
    const-string v7, "viewType"

    .line 1334
    .line 1335
    if-eqz v4, :cond_23

    .line 1336
    .line 1337
    :try_start_f
    invoke-interface {v0, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1338
    .line 1339
    .line 1340
    move-result-object v3

    .line 1341
    check-cast v3, Ljava/lang/Integer;

    .line 1342
    .line 1343
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 1344
    .line 1345
    .line 1346
    move-result v18

    .line 1347
    invoke-interface {v0, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1348
    .line 1349
    .line 1350
    move-result-object v3

    .line 1351
    move-object/from16 v19, v3

    .line 1352
    .line 1353
    check-cast v19, Ljava/lang/String;

    .line 1354
    .line 1355
    invoke-interface {v0, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1356
    .line 1357
    .line 1358
    move-result-object v0

    .line 1359
    check-cast v0, Ljava/lang/Integer;

    .line 1360
    .line 1361
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 1362
    .line 1363
    .line 1364
    move-result v28

    .line 1365
    new-instance v17, Lj3/e;

    .line 1366
    .line 1367
    const-wide/16 v26, 0x0

    .line 1368
    .line 1369
    const/16 v29, 0x3

    .line 1370
    .line 1371
    const-wide/16 v20, 0x0

    .line 1372
    .line 1373
    const-wide/16 v22, 0x0

    .line 1374
    .line 1375
    const-wide/16 v24, 0x0

    .line 1376
    .line 1377
    invoke-direct/range {v17 .. v30}, Lj3/e;-><init>(ILjava/lang/String;DDDDIILjava/nio/ByteBuffer;)V

    .line 1378
    .line 1379
    .line 1380
    move-object/from16 v0, v17

    .line 1381
    .line 1382
    iget-object v2, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 1383
    .line 1384
    check-cast v2, Lj3/i;

    .line 1385
    .line 1386
    invoke-interface {v2, v0}, Lj3/i;->i(Lj3/e;)V

    .line 1387
    .line 1388
    .line 1389
    move-object/from16 v0, p2

    .line 1390
    .line 1391
    check-cast v0, LQ2/g;

    .line 1392
    .line 1393
    invoke-virtual {v0, v5}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 1394
    .line 1395
    .line 1396
    goto/16 :goto_13

    .line 1397
    .line 1398
    :catch_11
    move-exception v0

    .line 1399
    goto/16 :goto_12

    .line 1400
    .line 1401
    :cond_23
    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 1402
    .line 1403
    .line 1404
    move-result v4

    .line 1405
    if-eqz v4, :cond_24

    .line 1406
    .line 1407
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1408
    .line 1409
    .line 1410
    move-result-object v3

    .line 1411
    check-cast v3, Ljava/lang/Boolean;

    .line 1412
    .line 1413
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 1414
    .line 1415
    .line 1416
    move-result v3

    .line 1417
    if-eqz v3, :cond_24

    .line 1418
    .line 1419
    move v9, v8

    .line 1420
    :cond_24
    invoke-interface {v0, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1421
    .line 1422
    .line 1423
    move-result-object v3

    .line 1424
    check-cast v3, Ljava/lang/Integer;

    .line 1425
    .line 1426
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 1427
    .line 1428
    .line 1429
    move-result v18

    .line 1430
    invoke-interface {v0, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1431
    .line 1432
    .line 1433
    move-result-object v3

    .line 1434
    move-object/from16 v19, v3

    .line 1435
    .line 1436
    check-cast v19, Ljava/lang/String;

    .line 1437
    .line 1438
    invoke-interface {v0, v11}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 1439
    .line 1440
    .line 1441
    move-result v3

    .line 1442
    const-wide/16 v20, 0x0

    .line 1443
    .line 1444
    if-eqz v3, :cond_25

    .line 1445
    .line 1446
    invoke-interface {v0, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1447
    .line 1448
    .line 1449
    move-result-object v3

    .line 1450
    check-cast v3, Ljava/lang/Double;

    .line 1451
    .line 1452
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    .line 1453
    .line 1454
    .line 1455
    move-result-wide v3

    .line 1456
    goto :goto_f

    .line 1457
    :cond_25
    move-wide/from16 v3, v20

    .line 1458
    .line 1459
    :goto_f
    invoke-interface {v0, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 1460
    .line 1461
    .line 1462
    move-result v7

    .line 1463
    if-eqz v7, :cond_26

    .line 1464
    .line 1465
    invoke-interface {v0, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1466
    .line 1467
    .line 1468
    move-result-object v7

    .line 1469
    check-cast v7, Ljava/lang/Double;

    .line 1470
    .line 1471
    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    .line 1472
    .line 1473
    .line 1474
    move-result-wide v20

    .line 1475
    :cond_26
    move-wide/from16 v22, v20

    .line 1476
    .line 1477
    invoke-interface {v0, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1478
    .line 1479
    .line 1480
    move-result-object v7

    .line 1481
    check-cast v7, Ljava/lang/Double;

    .line 1482
    .line 1483
    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    .line 1484
    .line 1485
    .line 1486
    move-result-wide v24

    .line 1487
    invoke-interface {v0, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1488
    .line 1489
    .line 1490
    move-result-object v7

    .line 1491
    check-cast v7, Ljava/lang/Double;

    .line 1492
    .line 1493
    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    .line 1494
    .line 1495
    .line 1496
    move-result-wide v26

    .line 1497
    invoke-interface {v0, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1498
    .line 1499
    .line 1500
    move-result-object v0

    .line 1501
    check-cast v0, Ljava/lang/Integer;

    .line 1502
    .line 1503
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 1504
    .line 1505
    .line 1506
    move-result v28

    .line 1507
    new-instance v17, Lj3/e;

    .line 1508
    .line 1509
    if-eqz v9, :cond_27

    .line 1510
    .line 1511
    const/16 v29, 0x2

    .line 1512
    .line 1513
    :goto_10
    move-wide/from16 v20, v3

    .line 1514
    .line 1515
    goto :goto_11

    .line 1516
    :cond_27
    move/from16 v29, v8

    .line 1517
    .line 1518
    goto :goto_10

    .line 1519
    :goto_11
    invoke-direct/range {v17 .. v30}, Lj3/e;-><init>(ILjava/lang/String;DDDDIILjava/nio/ByteBuffer;)V

    .line 1520
    .line 1521
    .line 1522
    move-object/from16 v0, v17

    .line 1523
    .line 1524
    iget-object v2, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 1525
    .line 1526
    check-cast v2, Lj3/i;

    .line 1527
    .line 1528
    invoke-interface {v2, v0}, Lj3/i;->k(Lj3/e;)J

    .line 1529
    .line 1530
    .line 1531
    move-result-wide v2

    .line 1532
    const-wide/16 v7, -0x2

    .line 1533
    .line 1534
    cmp-long v0, v2, v7

    .line 1535
    .line 1536
    if-nez v0, :cond_29

    .line 1537
    .line 1538
    if-eqz v9, :cond_28

    .line 1539
    .line 1540
    move-object/from16 v0, p2

    .line 1541
    .line 1542
    check-cast v0, LQ2/g;

    .line 1543
    .line 1544
    invoke-virtual {v0, v5}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 1545
    .line 1546
    .line 1547
    goto :goto_13

    .line 1548
    :cond_28
    new-instance v0, Ljava/lang/AssertionError;

    .line 1549
    .line 1550
    const-string v2, "Platform view attempted to fall back to hybrid mode when not requested."

    .line 1551
    .line 1552
    invoke-direct {v0, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 1553
    .line 1554
    .line 1555
    throw v0

    .line 1556
    :cond_29
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 1557
    .line 1558
    .line 1559
    move-result-object v0

    .line 1560
    move-object/from16 v2, p2

    .line 1561
    .line 1562
    check-cast v2, LQ2/g;

    .line 1563
    .line 1564
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_f
    .catch Ljava/lang/IllegalStateException; {:try_start_f .. :try_end_f} :catch_11

    .line 1565
    .line 1566
    .line 1567
    goto :goto_13

    .line 1568
    :goto_12
    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 1569
    .line 1570
    .line 1571
    move-result-object v0

    .line 1572
    move-object/from16 v2, p2

    .line 1573
    .line 1574
    check-cast v2, LQ2/g;

    .line 1575
    .line 1576
    invoke-virtual {v2, v6, v0, v5}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1577
    .line 1578
    .line 1579
    :goto_13
    return-void

    .line 1580
    nop

    .line 1581
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
        :pswitch_4
        :pswitch_0
    .end packed-switch

    .line 1582
    .line 1583
    .line 1584
    .line 1585
    .line 1586
    .line 1587
    .line 1588
    .line 1589
    .line 1590
    .line 1591
    .line 1592
    .line 1593
    :sswitch_data_0
    .sparse-switch
        -0x7383582f -> :sswitch_2
        0x23a829dd -> :sswitch_1
        0x604c7e59 -> :sswitch_0
    .end sparse-switch

    .line 1594
    .line 1595
    .line 1596
    .line 1597
    .line 1598
    .line 1599
    .line 1600
    .line 1601
    .line 1602
    .line 1603
    .line 1604
    .line 1605
    .line 1606
    .line 1607
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch

    .line 1608
    .line 1609
    .line 1610
    .line 1611
    .line 1612
    .line 1613
    .line 1614
    .line 1615
    .line 1616
    .line 1617
    :sswitch_data_1
    .sparse-switch
        -0x2a11fcff -> :sswitch_5
        0x68dc8e5d -> :sswitch_4
        0x7e58a2bc -> :sswitch_3
    .end sparse-switch

    .line 1618
    .line 1619
    .line 1620
    .line 1621
    .line 1622
    .line 1623
    .line 1624
    .line 1625
    .line 1626
    .line 1627
    .line 1628
    .line 1629
    .line 1630
    .line 1631
    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
    .end packed-switch

    .line 1632
    .line 1633
    .line 1634
    .line 1635
    .line 1636
    .line 1637
    .line 1638
    .line 1639
    .line 1640
    .line 1641
    :sswitch_data_2
    .sparse-switch
        -0x509a5f04 -> :sswitch_d
        -0x3cc89b6d -> :sswitch_c
        -0x37b2634c -> :sswitch_b
        -0x2d106975 -> :sswitch_a
        -0x126acbb2 -> :sswitch_9
        0x696df3f -> :sswitch_8
        0x2261393d -> :sswitch_7
        0x63a5261f -> :sswitch_6
    .end sparse-switch

    .line 1642
    .line 1643
    .line 1644
    .line 1645
    .line 1646
    .line 1647
    .line 1648
    .line 1649
    .line 1650
    .line 1651
    .line 1652
    .line 1653
    .line 1654
    .line 1655
    .line 1656
    .line 1657
    .line 1658
    .line 1659
    .line 1660
    .line 1661
    .line 1662
    .line 1663
    .line 1664
    .line 1665
    .line 1666
    .line 1667
    .line 1668
    .line 1669
    .line 1670
    .line 1671
    .line 1672
    .line 1673
    .line 1674
    .line 1675
    :pswitch_data_3
    .packed-switch 0x0
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
    .end packed-switch
.end method

.method public p(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Lj3/b;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ll3/a;

    .line 4
    .line 5
    iget-object v1, v0, Ll3/a;->b:Landroid/content/Context;

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    invoke-static {p2}, Ll3/a;->a(Ljava/lang/String;)Ljava/util/Locale;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    new-instance v1, Landroid/content/res/Configuration;

    .line 14
    .line 15
    iget-object v2, v0, Ll3/a;->b:Landroid/content/Context;

    .line 16
    .line 17
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-direct {v1, v2}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, p2}, Landroid/content/res/Configuration;->setLocale(Ljava/util/Locale;)V

    .line 29
    .line 30
    .line 31
    iget-object p2, v0, Ll3/a;->b:Landroid/content/Context;

    .line 32
    .line 33
    invoke-virtual {p2, v1}, Landroid/content/Context;->createConfigurationContext(Landroid/content/res/Configuration;)Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    :cond_0
    iget-object p2, v0, Ll3/a;->b:Landroid/content/Context;

    .line 38
    .line 39
    invoke-virtual {p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const-string v2, "string"

    .line 48
    .line 49
    invoke-virtual {v0, p1, v2, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-eqz p1, :cond_1

    .line 54
    .line 55
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    invoke-virtual {p2, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    return-object p1

    .line 64
    :cond_1
    const/4 p1, 0x0

    .line 65
    return-object p1
.end method

.method public s(Ll/i;)V
    .locals 1

    .line 1
    iget v0, p0, Lj3/b;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lj3/b;->f:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p1, Landroidx/appcompat/widget/Toolbar;

    .line 9
    .line 10
    iget-object v0, p1, Landroidx/appcompat/widget/Toolbar;->e:Landroidx/appcompat/widget/ActionMenuView;

    .line 11
    .line 12
    iget-object v0, v0, Landroidx/appcompat/widget/ActionMenuView;->w:Lm/j;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, v0, Lm/j;->v:Lm/g;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/m;->b()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object p1, p1, Landroidx/appcompat/widget/Toolbar;->K:LA0/c;

    .line 28
    .line 29
    iget-object p1, p1, LA0/c;->f:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast p1, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    :goto_0
    return-void

    .line 44
    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, LR/h;

    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 51
    .line 52
    .line 53
    const/4 p1, 0x0

    .line 54
    throw p1

    .line 55
    :pswitch_0
    iget-object v0, p0, Lj3/b;->f:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast v0, Landroidx/appcompat/widget/ActionMenuView;

    .line 58
    .line 59
    iget-object v0, v0, Landroidx/appcompat/widget/ActionMenuView;->x:Lj3/b;

    .line 60
    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    invoke-virtual {v0, p1}, Lj3/b;->s(Ll/i;)V

    .line 64
    .line 65
    .line 66
    :cond_2
    return-void

    .line 67
    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_0
    .end packed-switch
.end method

.method public t(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lj3/b;->o()Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lj3/b;->o()Landroid/content/SharedPreferences;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "notification_ids"

    .line 21
    .line 22
    const-string v2, ""

    .line 23
    .line 24
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-nez v3, :cond_0

    .line 33
    .line 34
    const-string v3, ","

    .line 35
    .line 36
    invoke-virtual {p1, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {v0, p1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0}, Lj3/b;->o()Landroid/content/SharedPreferences;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method
