.class public final LI/j0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:LV3/c;

.field public final b:LE/i;

.field public final c:LE/i;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p1, LV3/c;

    .line 5
    .line 6
    invoke-direct {p1}, LV3/c;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, LI/j0;->a:LV3/c;

    .line 10
    .line 11
    new-instance p1, LE/i;

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    invoke-direct {p1, v0}, LE/i;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, LI/j0;->b:LE/i;

    .line 18
    .line 19
    new-instance p1, LI/i0;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-direct {p1, v0, v1}, LC3/g;-><init>(ILA3/d;)V

    .line 23
    .line 24
    .line 25
    new-instance v0, LE/i;

    .line 26
    .line 27
    invoke-direct {v0, p1}, LE/i;-><init>(LH3/p;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, LI/j0;->c:LE/i;

    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Integer;
    .locals 2

    .line 1
    iget-object v0, p0, LI/j0;->b:LE/i;

    .line 2
    .line 3
    iget-object v0, v0, LE/i;->f:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    new-instance v1, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-direct {v1, v0}, Ljava/lang/Integer;-><init>(I)V

    .line 14
    .line 15
    .line 16
    return-object v1
.end method

.method public final b(LH3/l;LC3/c;)Ljava/lang/Object;
    .locals 7

    .line 1
    instance-of v0, p2, LI/g0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, LI/g0;

    .line 7
    .line 8
    iget v1, v0, LI/g0;->l:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, LI/g0;->l:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LI/g0;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, LI/g0;-><init>(LI/j0;LC3/c;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, LI/g0;->j:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, LI/g0;->l:I

    .line 28
    .line 29
    const/4 v2, 0x2

    .line 30
    const/4 v3, 0x1

    .line 31
    const/4 v4, 0x0

    .line 32
    sget-object v5, LB3/a;->e:LB3/a;

    .line 33
    .line 34
    if-eqz v1, :cond_3

    .line 35
    .line 36
    if-eq v1, v3, :cond_2

    .line 37
    .line 38
    if-ne v1, v2, :cond_1

    .line 39
    .line 40
    iget-object p1, v0, LI/g0;->h:Ljava/lang/Object;

    .line 41
    .line 42
    check-cast p1, LV3/a;

    .line 43
    .line 44
    :try_start_0
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    .line 47
    goto :goto_3

    .line 48
    :catchall_0
    move-exception p2

    .line 49
    goto :goto_4

    .line 50
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 51
    .line 52
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 53
    .line 54
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    throw p1

    .line 58
    :cond_2
    iget-object p1, v0, LI/g0;->i:LV3/c;

    .line 59
    .line 60
    iget-object v1, v0, LI/g0;->h:Ljava/lang/Object;

    .line 61
    .line 62
    check-cast v1, LH3/l;

    .line 63
    .line 64
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    move-object p2, p1

    .line 68
    move-object p1, v1

    .line 69
    goto :goto_1

    .line 70
    :cond_3
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    iput-object p1, v0, LI/g0;->h:Ljava/lang/Object;

    .line 74
    .line 75
    iget-object p2, p0, LI/j0;->a:LV3/c;

    .line 76
    .line 77
    iput-object p2, v0, LI/g0;->i:LV3/c;

    .line 78
    .line 79
    iput v3, v0, LI/g0;->l:I

    .line 80
    .line 81
    invoke-virtual {p2, v0}, LV3/c;->c(LC3/c;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    if-ne v1, v5, :cond_4

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_4
    :goto_1
    :try_start_1
    iput-object p2, v0, LI/g0;->h:Ljava/lang/Object;

    .line 89
    .line 90
    iput-object v4, v0, LI/g0;->i:LV3/c;

    .line 91
    .line 92
    iput v2, v0, LI/g0;->l:I

    .line 93
    .line 94
    invoke-interface {p1, v0}, LH3/l;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 98
    if-ne p1, v5, :cond_5

    .line 99
    .line 100
    :goto_2
    return-object v5

    .line 101
    :cond_5
    move-object v6, p2

    .line 102
    move-object p2, p1

    .line 103
    move-object p1, v6

    .line 104
    :goto_3
    check-cast p1, LV3/c;

    .line 105
    .line 106
    invoke-virtual {p1, v4}, LV3/c;->e(Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    return-object p2

    .line 110
    :catchall_1
    move-exception p1

    .line 111
    move-object v6, p2

    .line 112
    move-object p2, p1

    .line 113
    move-object p1, v6

    .line 114
    :goto_4
    check-cast p1, LV3/c;

    .line 115
    .line 116
    invoke-virtual {p1, v4}, LV3/c;->e(Ljava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    throw p2
.end method

.method public final c(LH3/p;LC3/c;)Ljava/lang/Object;
    .locals 5

    .line 1
    instance-of v0, p2, LI/h0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, LI/h0;

    .line 7
    .line 8
    iget v1, v0, LI/h0;->l:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, LI/h0;->l:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LI/h0;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, LI/h0;-><init>(LI/j0;LC3/c;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, LI/h0;->j:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, LI/h0;->l:I

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    const/4 v3, 0x0

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    if-ne v1, v2, :cond_1

    .line 34
    .line 35
    iget-boolean p1, v0, LI/h0;->i:Z

    .line 36
    .line 37
    iget-object v0, v0, LI/h0;->h:LV3/c;

    .line 38
    .line 39
    :try_start_0
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    .line 41
    .line 42
    goto :goto_1

    .line 43
    :catchall_0
    move-exception p2

    .line 44
    goto :goto_2

    .line 45
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 46
    .line 47
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 48
    .line 49
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    throw p1

    .line 53
    :cond_2
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    iget-object p2, p0, LI/j0;->a:LV3/c;

    .line 57
    .line 58
    invoke-virtual {p2}, LV3/c;->d()Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    :try_start_1
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    iput-object p2, v0, LI/h0;->h:LV3/c;

    .line 67
    .line 68
    iput-boolean v1, v0, LI/h0;->i:Z

    .line 69
    .line 70
    iput v2, v0, LI/h0;->l:I

    .line 71
    .line 72
    invoke-interface {p1, v4, v0}, LH3/p;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 76
    sget-object v0, LB3/a;->e:LB3/a;

    .line 77
    .line 78
    if-ne p1, v0, :cond_3

    .line 79
    .line 80
    return-object v0

    .line 81
    :cond_3
    move-object v0, p2

    .line 82
    move-object p2, p1

    .line 83
    move p1, v1

    .line 84
    :goto_1
    if-eqz p1, :cond_4

    .line 85
    .line 86
    invoke-virtual {v0, v3}, LV3/c;->e(Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    :cond_4
    return-object p2

    .line 90
    :catchall_1
    move-exception p1

    .line 91
    move-object v0, p2

    .line 92
    move-object p2, p1

    .line 93
    move p1, v1

    .line 94
    :goto_2
    if-eqz p1, :cond_5

    .line 95
    .line 96
    invoke-virtual {v0, v3}, LV3/c;->e(Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    :cond_5
    throw p2
.end method
