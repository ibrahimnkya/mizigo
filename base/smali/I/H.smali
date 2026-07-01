.class public final LI/H;
.super LC3/g;
.source "SourceFile"

# interfaces
.implements LH3/p;


# instance fields
.field public i:I

.field public final synthetic j:LI/O;


# direct methods
.method public constructor <init>(LI/O;LA3/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, LI/H;->j:LI/O;

    .line 2
    .line 3
    const/4 p1, 0x2

    .line 4
    invoke-direct {p0, p1, p2}, LC3/g;-><init>(ILA3/d;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, LN3/t;

    .line 2
    .line 3
    check-cast p2, LA3/d;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, LI/H;->j(LA3/d;Ljava/lang/Object;)LA3/d;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, LI/H;

    .line 10
    .line 11
    sget-object p2, Ly3/h;->a:Ly3/h;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, LI/H;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    return-object p1
.end method

.method public final j(LA3/d;Ljava/lang/Object;)LA3/d;
    .locals 1

    .line 1
    new-instance p2, LI/H;

    .line 2
    .line 3
    iget-object v0, p0, LI/H;->j:LI/O;

    .line 4
    .line 5
    invoke-direct {p2, v0, p1}, LI/H;-><init>(LI/O;LA3/d;)V

    .line 6
    .line 7
    .line 8
    return-object p2
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, LI/H;->j:LI/O;

    .line 2
    .line 3
    iget-object v1, v0, LI/O;->l:LE/i;

    .line 4
    .line 5
    iget v2, p0, LI/H;->i:I

    .line 6
    .line 7
    const/4 v3, 0x2

    .line 8
    const/4 v4, 0x1

    .line 9
    sget-object v5, LB3/a;->e:LB3/a;

    .line 10
    .line 11
    if-eqz v2, :cond_2

    .line 12
    .line 13
    if-eq v2, v4, :cond_1

    .line 14
    .line 15
    if-ne v2, v3, :cond_0

    .line 16
    .line 17
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    goto :goto_2

    .line 21
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 22
    .line 23
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 24
    .line 25
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    throw p1

    .line 29
    :cond_1
    :try_start_0
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception p1

    .line 34
    goto :goto_3

    .line 35
    :cond_2
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, LE/i;->l()LI/k0;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    instance-of p1, p1, LI/a0;

    .line 43
    .line 44
    if-eqz p1, :cond_3

    .line 45
    .line 46
    invoke-virtual {v1}, LE/i;->l()LI/k0;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    return-object p1

    .line 51
    :cond_3
    :try_start_1
    iput v4, p0, LI/H;->i:I

    .line 52
    .line 53
    invoke-virtual {v0, p0}, LI/O;->i(LC3/c;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    if-ne p1, v5, :cond_4

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_4
    :goto_0
    iput v3, p0, LI/H;->i:I

    .line 61
    .line 62
    const/4 p1, 0x0

    .line 63
    invoke-static {v0, p1, p0}, LI/O;->f(LI/O;ZLA3/d;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    if-ne p1, v5, :cond_5

    .line 68
    .line 69
    :goto_1
    return-object v5

    .line 70
    :cond_5
    :goto_2
    check-cast p1, LI/k0;

    .line 71
    .line 72
    return-object p1

    .line 73
    :goto_3
    new-instance v0, LI/c0;

    .line 74
    .line 75
    const/4 v1, -0x1

    .line 76
    invoke-direct {v0, p1, v1}, LI/c0;-><init>(Ljava/lang/Throwable;I)V

    .line 77
    .line 78
    .line 79
    return-object v0
.end method
