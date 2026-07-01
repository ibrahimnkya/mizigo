.class public final LI/D;
.super LC3/g;
.source "SourceFile"

# interfaces
.implements LH3/p;


# instance fields
.field public i:Ljava/lang/Throwable;

.field public j:I

.field public synthetic k:Z

.field public final synthetic l:LI/O;

.field public final synthetic m:I


# direct methods
.method public constructor <init>(LI/O;ILA3/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, LI/D;->l:LI/O;

    .line 2
    .line 3
    iput p2, p0, LI/D;->m:I

    .line 4
    .line 5
    const/4 p1, 0x2

    .line 6
    invoke-direct {p0, p1, p3}, LC3/g;-><init>(ILA3/d;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    check-cast p2, LA3/d;

    .line 7
    .line 8
    invoke-virtual {p0, p2, p1}, LI/D;->j(LA3/d;Ljava/lang/Object;)LA3/d;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, LI/D;

    .line 13
    .line 14
    sget-object p2, Ly3/h;->a:Ly3/h;

    .line 15
    .line 16
    invoke-virtual {p1, p2}, LI/D;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    return-object p1
.end method

.method public final j(LA3/d;Ljava/lang/Object;)LA3/d;
    .locals 3

    .line 1
    new-instance v0, LI/D;

    .line 2
    .line 3
    iget-object v1, p0, LI/D;->l:LI/O;

    .line 4
    .line 5
    iget v2, p0, LI/D;->m:I

    .line 6
    .line 7
    invoke-direct {v0, v1, v2, p1}, LI/D;-><init>(LI/O;ILA3/d;)V

    .line 8
    .line 9
    .line 10
    check-cast p2, Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iput-boolean p1, v0, LI/D;->k:Z

    .line 17
    .line 18
    return-object v0
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget v0, p0, LI/D;->j:I

    .line 2
    .line 3
    iget-object v1, p0, LI/D;->l:LI/O;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    const/4 v3, 0x1

    .line 7
    sget-object v4, LB3/a;->e:LB3/a;

    .line 8
    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    if-eq v0, v3, :cond_1

    .line 12
    .line 13
    if-ne v0, v2, :cond_0

    .line 14
    .line 15
    iget-boolean v0, p0, LI/D;->k:Z

    .line 16
    .line 17
    iget-object v1, p0, LI/D;->i:Ljava/lang/Throwable;

    .line 18
    .line 19
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    goto :goto_3

    .line 23
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 24
    .line 25
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 26
    .line 27
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    throw p1

    .line 31
    :cond_1
    iget-boolean v0, p0, LI/D;->k:Z

    .line 32
    .line 33
    :try_start_0
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception p1

    .line 38
    goto :goto_1

    .line 39
    :cond_2
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    iget-boolean v0, p0, LI/D;->k:Z

    .line 43
    .line 44
    :try_start_1
    iput-boolean v0, p0, LI/D;->k:Z

    .line 45
    .line 46
    iput v3, p0, LI/D;->j:I

    .line 47
    .line 48
    invoke-static {v1, v0, p0}, LI/O;->g(LI/O;ZLC3/c;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    if-ne p1, v4, :cond_3

    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_3
    :goto_0
    check-cast p1, LI/k0;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    .line 57
    goto :goto_5

    .line 58
    :goto_1
    if-eqz v0, :cond_5

    .line 59
    .line 60
    invoke-virtual {v1}, LI/O;->h()LI/j0;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iput-object p1, p0, LI/D;->i:Ljava/lang/Throwable;

    .line 65
    .line 66
    iput-boolean v0, p0, LI/D;->k:Z

    .line 67
    .line 68
    iput v2, p0, LI/D;->j:I

    .line 69
    .line 70
    invoke-virtual {v1}, LI/j0;->a()Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    if-ne v1, v4, :cond_4

    .line 75
    .line 76
    :goto_2
    return-object v4

    .line 77
    :cond_4
    move-object v5, v1

    .line 78
    move-object v1, p1

    .line 79
    move-object p1, v5

    .line 80
    :goto_3
    check-cast p1, Ljava/lang/Number;

    .line 81
    .line 82
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    goto :goto_4

    .line 87
    :cond_5
    iget v1, p0, LI/D;->m:I

    .line 88
    .line 89
    move v5, v1

    .line 90
    move-object v1, p1

    .line 91
    move p1, v5

    .line 92
    :goto_4
    new-instance v2, LI/c0;

    .line 93
    .line 94
    invoke-direct {v2, v1, p1}, LI/c0;-><init>(Ljava/lang/Throwable;I)V

    .line 95
    .line 96
    .line 97
    move-object p1, v2

    .line 98
    :goto_5
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    new-instance v1, Ly3/c;

    .line 103
    .line 104
    invoke-direct {v1, p1, v0}, Ly3/c;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    return-object v1
.end method
