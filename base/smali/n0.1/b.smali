.class public final Ln0/b;
.super LC3/g;
.source "SourceFile"

# interfaces
.implements LH3/p;


# instance fields
.field public i:I

.field public final synthetic j:Ln0/d;

.field public final synthetic k:LQ2/g;


# direct methods
.method public constructor <init>(Ln0/d;LQ2/g;LA3/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ln0/b;->j:Ln0/d;

    .line 2
    .line 3
    iput-object p2, p0, Ln0/b;->k:LQ2/g;

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
    check-cast p1, LN3/t;

    .line 2
    .line 3
    check-cast p2, LA3/d;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, Ln0/b;->j(LA3/d;Ljava/lang/Object;)LA3/d;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ln0/b;

    .line 10
    .line 11
    sget-object p2, Ly3/h;->a:Ly3/h;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Ln0/b;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    return-object p1
.end method

.method public final j(LA3/d;Ljava/lang/Object;)LA3/d;
    .locals 2

    .line 1
    new-instance p2, Ln0/b;

    .line 2
    .line 3
    iget-object v0, p0, Ln0/b;->j:Ln0/d;

    .line 4
    .line 5
    iget-object v1, p0, Ln0/b;->k:LQ2/g;

    .line 6
    .line 7
    invoke-direct {p2, v0, v1, p1}, Ln0/b;-><init>(Ln0/d;LQ2/g;LA3/d;)V

    .line 8
    .line 9
    .line 10
    return-object p2
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .line 1
    iget v0, p0, Ln0/b;->i:I

    .line 2
    .line 3
    iget-object v1, p0, Ln0/b;->k:LQ2/g;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iget-object v3, p0, Ln0/b;->j:Ln0/d;

    .line 7
    .line 8
    const/4 v4, 0x1

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    if-ne v0, v4, :cond_0

    .line 12
    .line 13
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 18
    .line 19
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 20
    .line 21
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    throw p1

    .line 25
    :cond_1
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    sget-object p1, LT0/a;->h:Ljava/io/OutputStream;

    .line 29
    .line 30
    if-nez p1, :cond_4

    .line 31
    .line 32
    iput v4, p0, Ln0/b;->i:I

    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    iput-boolean p1, v3, Ln0/d;->g:Z

    .line 36
    .line 37
    sget-object p1, LN3/C;->a:LU3/e;

    .line 38
    .line 39
    sget-object p1, LU3/d;->g:LU3/d;

    .line 40
    .line 41
    new-instance v0, Ln0/a;

    .line 42
    .line 43
    invoke-direct {v0, v3, v2}, Ln0/a;-><init>(Ln0/d;LA3/d;)V

    .line 44
    .line 45
    .line 46
    invoke-static {p1, v0, p0}, LN3/v;->n(LA3/i;LH3/p;LC3/g;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    sget-object v0, LB3/a;->e:LB3/a;

    .line 51
    .line 52
    if-ne p1, v0, :cond_2

    .line 53
    .line 54
    return-object v0

    .line 55
    :cond_2
    :goto_0
    check-cast p1, Ljava/io/OutputStream;

    .line 56
    .line 57
    if-eqz p1, :cond_3

    .line 58
    .line 59
    move-object v2, p1

    .line 60
    :cond_3
    iget-boolean p1, v3, Ln0/d;->g:Z

    .line 61
    .line 62
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {v1, p1}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    sput-object v2, LT0/a;->h:Ljava/io/OutputStream;

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_4
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 73
    .line 74
    invoke-virtual {v1, p1}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    :goto_1
    sget-object p1, Ly3/h;->a:Ly3/h;

    .line 78
    .line 79
    return-object p1
.end method
