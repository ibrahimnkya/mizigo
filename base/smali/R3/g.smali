.class public final LR3/g;
.super LR3/e;
.source "SourceFile"


# instance fields
.field public final h:LQ3/d;


# direct methods
.method public constructor <init>(LQ3/d;LA3/i;ILP3/a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2, p3, p4}, LR3/e;-><init>(LA3/i;ILP3/a;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LR3/g;->h:LQ3/d;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(LP3/r;LA3/d;)Ljava/lang/Object;
    .locals 1

    .line 1
    new-instance v0, LR3/o;

    .line 2
    .line 3
    invoke-direct {v0, p1}, LR3/o;-><init>(LP3/r;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, LR3/g;->h:LQ3/d;

    .line 7
    .line 8
    invoke-interface {p1, v0, p2}, LQ3/d;->c(LQ3/e;LA3/d;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget-object p2, Ly3/h;->a:Ly3/h;

    .line 13
    .line 14
    sget-object v0, LB3/a;->e:LB3/a;

    .line 15
    .line 16
    if-ne p1, v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move-object p1, p2

    .line 20
    :goto_0
    if-ne p1, v0, :cond_1

    .line 21
    .line 22
    return-object p1

    .line 23
    :cond_1
    return-object p2
.end method

.method public final c(LQ3/e;LA3/d;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget v0, p0, LR3/e;->f:I

    .line 2
    .line 3
    const/4 v1, -0x3

    .line 4
    sget-object v2, LB3/a;->e:LB3/a;

    .line 5
    .line 6
    sget-object v3, Ly3/h;->a:Ly3/h;

    .line 7
    .line 8
    if-ne v0, v1, :cond_4

    .line 9
    .line 10
    invoke-interface {p2}, LA3/d;->e()LA3/i;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 15
    .line 16
    new-instance v4, LA3/b;

    .line 17
    .line 18
    const/4 v5, 0x2

    .line 19
    invoke-direct {v4, v5}, LA3/b;-><init>(I)V

    .line 20
    .line 21
    .line 22
    iget-object v5, p0, LR3/e;->e:LA3/i;

    .line 23
    .line 24
    invoke-interface {v5, v1, v4}, LA3/i;->i(Ljava/lang/Object;LH3/p;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_0

    .line 35
    .line 36
    invoke-interface {v0, v5}, LA3/i;->h(LA3/i;)LA3/i;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const/4 v1, 0x0

    .line 42
    invoke-static {v0, v5, v1}, LN3/v;->b(LA3/i;LA3/i;Z)LA3/i;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    :goto_0
    invoke-static {v1, v0}, LI3/h;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    if-eqz v4, :cond_2

    .line 51
    .line 52
    iget-object v0, p0, LR3/g;->h:LQ3/d;

    .line 53
    .line 54
    invoke-interface {v0, p1, p2}, LQ3/d;->c(LQ3/e;LA3/d;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    if-ne p1, v2, :cond_1

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_1
    move-object p1, v3

    .line 62
    :goto_1
    if-ne p1, v2, :cond_5

    .line 63
    .line 64
    return-object p1

    .line 65
    :cond_2
    sget-object v4, LA3/e;->e:LA3/e;

    .line 66
    .line 67
    invoke-interface {v1, v4}, LA3/i;->m(LA3/h;)LA3/g;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    invoke-interface {v0, v4}, LA3/i;->m(LA3/h;)LA3/g;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {v5, v0}, LI3/h;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_4

    .line 80
    .line 81
    invoke-interface {p2}, LA3/d;->e()LA3/i;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    instance-of v4, p1, LR3/o;

    .line 86
    .line 87
    if-nez v4, :cond_3

    .line 88
    .line 89
    new-instance v4, LQ3/l;

    .line 90
    .line 91
    invoke-direct {v4, p1, v0}, LQ3/l;-><init>(LQ3/e;LA3/i;)V

    .line 92
    .line 93
    .line 94
    move-object p1, v4

    .line 95
    :cond_3
    new-instance v0, LR3/f;

    .line 96
    .line 97
    const/4 v4, 0x0

    .line 98
    invoke-direct {v0, p0, v4}, LR3/f;-><init>(LR3/g;LA3/d;)V

    .line 99
    .line 100
    .line 101
    invoke-static {v1}, LS3/b;->l(LA3/i;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    invoke-static {v1, p1, v4, v0, p2}, LR3/k;->b(LA3/i;Ljava/lang/Object;Ljava/lang/Object;LH3/p;LA3/d;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    if-ne p1, v2, :cond_5

    .line 110
    .line 111
    return-object p1

    .line 112
    :cond_4
    invoke-super {p0, p1, p2}, LR3/e;->c(LQ3/e;LA3/d;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    if-ne p1, v2, :cond_5

    .line 117
    .line 118
    return-object p1

    .line 119
    :cond_5
    return-object v3
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, LR3/g;->h:LQ3/d;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " -> "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-super {p0}, LR3/e;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    return-object v0
.end method
