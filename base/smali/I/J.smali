.class public final LI/J;
.super LC3/g;
.source "SourceFile"

# interfaces
.implements LH3/p;


# instance fields
.field public i:I

.field public synthetic j:Ljava/lang/Object;

.field public final synthetic k:LI/O;

.field public final synthetic l:LC3/g;


# direct methods
.method public constructor <init>(LI/O;LH3/p;LA3/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, LI/J;->k:LI/O;

    .line 2
    .line 3
    check-cast p2, LC3/g;

    .line 4
    .line 5
    iput-object p2, p0, LI/J;->l:LC3/g;

    .line 6
    .line 7
    const/4 p1, 0x2

    .line 8
    invoke-direct {p0, p1, p3}, LC3/g;-><init>(ILA3/d;)V

    .line 9
    .line 10
    .line 11
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
    invoke-virtual {p0, p2, p1}, LI/J;->j(LA3/d;Ljava/lang/Object;)LA3/d;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, LI/J;

    .line 10
    .line 11
    sget-object p2, Ly3/h;->a:Ly3/h;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, LI/J;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    return-object p1
.end method

.method public final j(LA3/d;Ljava/lang/Object;)LA3/d;
    .locals 3

    .line 1
    new-instance v0, LI/J;

    .line 2
    .line 3
    iget-object v1, p0, LI/J;->k:LI/O;

    .line 4
    .line 5
    iget-object v2, p0, LI/J;->l:LC3/g;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2, p1}, LI/J;-><init>(LI/O;LH3/p;LA3/d;)V

    .line 8
    .line 9
    .line 10
    iput-object p2, v0, LI/J;->j:Ljava/lang/Object;

    .line 11
    .line 12
    return-object v0
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    iget v0, p0, LI/J;->i:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-object p1

    .line 12
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 13
    .line 14
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 15
    .line 16
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    throw p1

    .line 20
    :cond_1
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, LI/J;->j:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast p1, LN3/t;

    .line 26
    .line 27
    new-instance v0, LN3/m;

    .line 28
    .line 29
    invoke-direct {v0, v1}, LN3/Y;-><init>(Z)V

    .line 30
    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-virtual {v0, v2}, LN3/Y;->H(LN3/P;)V

    .line 34
    .line 35
    .line 36
    iget-object v3, p0, LI/J;->k:LI/O;

    .line 37
    .line 38
    iget-object v4, v3, LI/O;->l:LE/i;

    .line 39
    .line 40
    invoke-virtual {v4}, LE/i;->l()LI/k0;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    new-instance v5, LI/b0;

    .line 45
    .line 46
    iget-object v6, p0, LI/J;->l:LC3/g;

    .line 47
    .line 48
    invoke-interface {p1}, LN3/t;->f()LA3/i;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-direct {v5, v6, v0, v4, p1}, LI/b0;-><init>(LH3/p;LN3/m;LI/k0;LA3/i;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, v3, LI/O;->p:LV1/y;

    .line 56
    .line 57
    iget-object v3, p1, LV1/y;->h:Ljava/lang/Object;

    .line 58
    .line 59
    check-cast v3, LP3/c;

    .line 60
    .line 61
    invoke-interface {v3, v5}, LP3/t;->n(Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    instance-of v4, v3, LP3/h;

    .line 66
    .line 67
    if-eqz v4, :cond_5

    .line 68
    .line 69
    check-cast v3, LP3/h;

    .line 70
    .line 71
    if-eqz v3, :cond_2

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    move-object v3, v2

    .line 75
    :goto_0
    if-eqz v3, :cond_3

    .line 76
    .line 77
    iget-object v2, v3, LP3/h;->a:Ljava/lang/Throwable;

    .line 78
    .line 79
    :cond_3
    if-nez v2, :cond_4

    .line 80
    .line 81
    new-instance v2, LP3/m;

    .line 82
    .line 83
    const-string p1, "Channel was closed normally"

    .line 84
    .line 85
    invoke-direct {v2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :cond_4
    throw v2

    .line 89
    :cond_5
    instance-of v3, v3, LP3/i;

    .line 90
    .line 91
    if-nez v3, :cond_8

    .line 92
    .line 93
    iget-object v3, p1, LV1/y;->i:Ljava/lang/Object;

    .line 94
    .line 95
    check-cast v3, LE/i;

    .line 96
    .line 97
    iget-object v3, v3, LE/i;->f:Ljava/lang/Object;

    .line 98
    .line 99
    check-cast v3, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 100
    .line 101
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    if-nez v3, :cond_6

    .line 106
    .line 107
    iget-object v3, p1, LV1/y;->f:Ljava/lang/Object;

    .line 108
    .line 109
    check-cast v3, LN3/t;

    .line 110
    .line 111
    new-instance v4, LI/f0;

    .line 112
    .line 113
    invoke-direct {v4, p1, v2}, LI/f0;-><init>(LV1/y;LA3/d;)V

    .line 114
    .line 115
    .line 116
    const/4 p1, 0x3

    .line 117
    invoke-static {v3, v2, v4, p1}, LN3/v;->g(LN3/t;LO3/c;LH3/p;I)LN3/e0;

    .line 118
    .line 119
    .line 120
    :cond_6
    iput v1, p0, LI/J;->i:I

    .line 121
    .line 122
    invoke-virtual {v0, p0}, LN3/m;->W(LC3/g;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    sget-object v0, LB3/a;->e:LB3/a;

    .line 127
    .line 128
    if-ne p1, v0, :cond_7

    .line 129
    .line 130
    return-object v0

    .line 131
    :cond_7
    return-object p1

    .line 132
    :cond_8
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 133
    .line 134
    const-string v0, "Check failed."

    .line 135
    .line 136
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    throw p1
.end method
