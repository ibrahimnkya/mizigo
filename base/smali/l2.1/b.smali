.class public final Ll2/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lc1/b;
.implements Lc1/d;
.implements Lc1/e;
.implements Lc1/c;


# instance fields
.field public final e:Ljava/util/HashMap;

.field public f:LB2/a;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Ll2/b;->e:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(LB2/a;)V
    .locals 2

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 5
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Ll2/b;->e:Ljava/util/HashMap;

    .line 6
    iput-object p1, p0, Ll2/b;->f:LB2/a;

    .line 7
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v0, LA/b;

    const/16 v1, 0xd

    invoke-direct {v0, v1, p0}, LA/b;-><init>(ILjava/lang/Object;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public static d(Ljava/lang/Object;)V
    .locals 2

    .line 1
    check-cast p0, Le1/o;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object p0, p0, Le1/o;->a:LZ0/f;

    .line 7
    .line 8
    check-cast p0, LZ0/d;

    .line 9
    .line 10
    invoke-virtual {p0}, LY0/a;->c()Landroid/os/Parcel;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-virtual {p0, v0, v1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catch_0
    move-exception p0

    .line 20
    new-instance v0, Le1/x;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    throw v0
.end method


# virtual methods
.method public a(Le1/o;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll2/b;->e:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll2/a;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, v0, Ll2/a;->d:Lc1/c;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {v0, p1}, Lc1/c;->a(Le1/o;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public b(Ljava/util/List;)V
    .locals 8

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ls3/f0;

    .line 16
    .line 17
    new-instance v1, Lj3/b;

    .line 18
    .line 19
    const/16 v2, 0x10

    .line 20
    .line 21
    invoke-direct {v1, v2}, Lj3/b;-><init>(I)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1}, Landroid/support/v4/media/session/a;->v(Ls3/f0;Ls3/s;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, v1, Lj3/b;->f:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v1, Ln2/b;

    .line 31
    .line 32
    iget-object v2, v1, Ln2/b;->a:Ljava/util/ArrayList;

    .line 33
    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    const/4 v3, 0x1

    .line 41
    xor-int/2addr v2, v3

    .line 42
    if-ne v2, v3, :cond_0

    .line 43
    .line 44
    new-instance v2, Ln2/d;

    .line 45
    .line 46
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 47
    .line 48
    .line 49
    iget-object v3, v1, Ln2/b;->a:Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-static {v3}, LI3/h;->b(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    iput-object v3, v2, Ln2/d;->e:Ljava/util/Collection;

    .line 55
    .line 56
    iget v3, v1, Ln2/b;->b:I

    .line 57
    .line 58
    iput v3, v2, Ln2/d;->f:I

    .line 59
    .line 60
    iget-object v4, v1, Ln2/b;->c:LM2/b;

    .line 61
    .line 62
    iput-object v4, v2, Ln2/d;->g:LM2/b;

    .line 63
    .line 64
    iget-wide v4, v1, Ln2/b;->d:D

    .line 65
    .line 66
    iput-wide v4, v2, Ln2/d;->h:D

    .line 67
    .line 68
    iget-wide v4, v1, Ln2/b;->e:D

    .line 69
    .line 70
    iput-wide v4, v2, Ln2/d;->i:D

    .line 71
    .line 72
    int-to-double v4, v3

    .line 73
    const-wide/high16 v6, 0x4008000000000000L    # 3.0

    .line 74
    .line 75
    div-double/2addr v4, v6

    .line 76
    invoke-static {v3, v4, v5}, LV0/g;->p(ID)[D

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    iput-object v1, v2, Ln2/d;->m:[D

    .line 81
    .line 82
    iget-object v1, v2, Ln2/d;->g:LM2/b;

    .line 83
    .line 84
    invoke-virtual {v2, v1}, Ln2/d;->b(LM2/b;)V

    .line 85
    .line 86
    .line 87
    iget-object v1, v2, Ln2/d;->e:Ljava/util/Collection;

    .line 88
    .line 89
    invoke-virtual {v2, v1}, Ln2/d;->c(Ljava/util/Collection;)V

    .line 90
    .line 91
    .line 92
    iget-object v1, p0, Ll2/b;->f:LB2/a;

    .line 93
    .line 94
    new-instance v3, Le1/D;

    .line 95
    .line 96
    invoke-direct {v3}, Le1/D;-><init>()V

    .line 97
    .line 98
    .line 99
    new-instance v4, Le1/H;

    .line 100
    .line 101
    invoke-direct {v4, v3, v2}, Le1/H;-><init>(Le1/D;Le1/E;)V

    .line 102
    .line 103
    .line 104
    iput-object v4, v3, Le1/D;->e:LZ0/q;

    .line 105
    .line 106
    invoke-virtual {v1, v3}, LB2/a;->g(Le1/D;)Le1/C;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    new-instance v3, Ls3/r;

    .line 111
    .line 112
    invoke-direct {v3, v2, v1}, Ls3/r;-><init>(Ln2/d;Le1/C;)V

    .line 113
    .line 114
    .line 115
    iget-object v1, p0, Ll2/b;->e:Ljava/util/HashMap;

    .line 116
    .line 117
    invoke-virtual {v1, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 122
    .line 123
    const-string v0, "No input data: you must use either .data or .weightedData before building."

    .line 124
    .line 125
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    throw p1

    .line 129
    :cond_1
    return-void
.end method

.method public c(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll2/b;->e:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll2/a;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v1, v0, Ll2/a;->b:Ll2/b;

    .line 12
    .line 13
    iget-object v0, v0, Ll2/a;->a:Ljava/util/LinkedHashSet;

    .line 14
    .line 15
    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, v1, Ll2/b;->e:Ljava/util/HashMap;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    invoke-static {p1}, Ll2/b;->d(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public e(Le1/o;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll2/b;->e:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll2/a;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, v0, Ll2/a;->c:Lc1/b;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {v0, p1}, Lc1/b;->e(Le1/o;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public i(Le1/o;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll2/b;->e:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll2/a;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, v0, Ll2/a;->f:Ls3/j;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ls3/j;->i(Le1/o;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public j(Le1/o;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll2/b;->e:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll2/a;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, v0, Ll2/a;->f:Ls3/j;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ls3/j;->j(Le1/o;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public v(Le1/o;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll2/b;->e:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll2/a;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, v0, Ll2/a;->e:Lc1/d;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {v0, p1}, Lc1/d;->v(Le1/o;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    return p1

    .line 20
    :cond_0
    const/4 p1, 0x0

    .line 21
    return p1
.end method

.method public w(Le1/o;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll2/b;->e:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll2/a;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, v0, Ll2/a;->f:Ls3/j;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ls3/j;->w(Le1/o;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
