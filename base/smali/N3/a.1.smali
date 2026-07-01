.class public abstract LN3/a;
.super LN3/Y;
.source "SourceFile"

# interfaces
.implements LA3/d;
.implements LN3/t;


# instance fields
.field public final g:LA3/i;


# direct methods
.method public constructor <init>(LA3/i;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, LN3/Y;-><init>(Z)V

    .line 2
    .line 3
    .line 4
    sget-object p2, LN3/s;->f:LN3/s;

    .line 5
    .line 6
    invoke-interface {p1, p2}, LA3/i;->m(LA3/h;)LA3/g;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, LN3/P;

    .line 11
    .line 12
    invoke-virtual {p0, p2}, LN3/Y;->H(LN3/P;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p1, p0}, LA3/i;->h(LA3/i;)LA3/i;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, LN3/a;->g:LA3/i;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public final G(LD1/n;)V
    .locals 1

    .line 1
    iget-object v0, p0, LN3/a;->g:LA3/i;

    .line 2
    .line 3
    invoke-static {v0, p1}, LN3/v;->e(LA3/i;Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final O(Ljava/lang/Object;)V
    .locals 2

    .line 1
    instance-of v0, p1, LN3/o;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    check-cast p1, LN3/o;

    .line 6
    .line 7
    iget-object v0, p1, LN3/o;->a:Ljava/lang/Throwable;

    .line 8
    .line 9
    sget-object v1, LN3/o;->b:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 10
    .line 11
    invoke-virtual {v1, p1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/4 v1, 0x1

    .line 16
    if-ne p1, v1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v1, 0x0

    .line 20
    :goto_0
    invoke-virtual {p0, v0, v1}, LN3/a;->W(Ljava/lang/Throwable;Z)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    invoke-virtual {p0, p1}, LN3/a;->X(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public W(Ljava/lang/Throwable;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public X(Ljava/lang/Object;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final Y(LN3/u;LN3/a;LH3/p;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    sget-object v0, Ly3/h;->a:Ly3/h;

    .line 6
    .line 7
    if-eqz p1, :cond_4

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-eq p1, v1, :cond_3

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    if-eq p1, v1, :cond_2

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-ne p1, v0, :cond_1

    .line 17
    .line 18
    :try_start_0
    iget-object p1, p0, LN3/a;->g:LA3/i;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-static {p1, v0}, LS3/b;->m(LA3/i;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :try_start_1
    invoke-static {v1, p3}, LI3/s;->a(ILjava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {p3, p2, p0}, LH3/p;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 32
    :try_start_2
    invoke-static {p1, v0}, LS3/b;->g(LA3/i;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 33
    .line 34
    .line 35
    sget-object p1, LB3/a;->e:LB3/a;

    .line 36
    .line 37
    if-eq p2, p1, :cond_3

    .line 38
    .line 39
    invoke-virtual {p0, p2}, LN3/a;->g(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :catchall_0
    move-exception p1

    .line 44
    goto :goto_0

    .line 45
    :catchall_1
    move-exception p2

    .line 46
    :try_start_3
    invoke-static {p1, v0}, LS3/b;->g(LA3/i;Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    throw p2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 50
    :goto_0
    instance-of p2, p1, LN3/z;

    .line 51
    .line 52
    if-eqz p2, :cond_0

    .line 53
    .line 54
    check-cast p1, LN3/z;

    .line 55
    .line 56
    iget-object p1, p1, LN3/z;->e:Ljava/lang/Throwable;

    .line 57
    .line 58
    :cond_0
    invoke-static {p1}, LV0/g;->n(Ljava/lang/Throwable;)Ly3/d;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0, p1}, LN3/a;->g(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    new-instance p1, LD1/n;

    .line 67
    .line 68
    invoke-direct {p1}, Ljava/lang/RuntimeException;-><init>()V

    .line 69
    .line 70
    .line 71
    throw p1

    .line 72
    :cond_2
    check-cast p3, LC3/a;

    .line 73
    .line 74
    invoke-virtual {p3, p0, p2}, LC3/a;->j(LA3/d;Ljava/lang/Object;)LA3/d;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-static {p1}, LV0/g;->s(LA3/d;)LA3/d;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-interface {p1, v0}, LA3/d;->g(Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    :cond_3
    return-void

    .line 86
    :cond_4
    :try_start_4
    check-cast p3, LC3/a;

    .line 87
    .line 88
    invoke-virtual {p3, p0, p2}, LC3/a;->j(LA3/d;Ljava/lang/Object;)LA3/d;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-static {p1}, LV0/g;->s(LA3/d;)LA3/d;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-static {p1, v0}, LS3/b;->h(LA3/d;Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :catchall_2
    move-exception p1

    .line 101
    instance-of p2, p1, LN3/z;

    .line 102
    .line 103
    if-eqz p2, :cond_5

    .line 104
    .line 105
    check-cast p1, LN3/z;

    .line 106
    .line 107
    iget-object p1, p1, LN3/z;->e:Ljava/lang/Throwable;

    .line 108
    .line 109
    :cond_5
    invoke-static {p1}, LV0/g;->n(Ljava/lang/Throwable;)Ly3/d;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    invoke-virtual {p0, p2}, LN3/a;->g(Ljava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    throw p1
.end method

.method public final e()LA3/i;
    .locals 1

    .line 1
    iget-object v0, p0, LN3/a;->g:LA3/i;

    .line 2
    .line 3
    return-object v0
.end method

.method public final f()LA3/i;
    .locals 1

    .line 1
    iget-object v0, p0, LN3/a;->g:LA3/i;

    .line 2
    .line 3
    return-object v0
.end method

.method public final g(Ljava/lang/Object;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ly3/e;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    new-instance p1, LN3/o;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-direct {p1, v0, v1}, LN3/o;-><init>(Ljava/lang/Throwable;Z)V

    .line 12
    .line 13
    .line 14
    :goto_0
    invoke-virtual {p0, p1}, LN3/Y;->L(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget-object v0, LN3/v;->d:LE/i;

    .line 19
    .line 20
    if-ne p1, v0, :cond_1

    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    invoke-virtual {p0, p1}, LN3/a;->t(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final x()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, " was cancelled"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    return-object v0
.end method
