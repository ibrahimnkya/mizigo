.class public final Lv3/p;
.super LC3/g;
.source "SourceFile"

# interfaces
.implements LH3/p;


# instance fields
.field public i:LI3/p;

.field public j:I

.field public final synthetic k:Ljava/lang/String;

.field public final synthetic l:Lv3/J;

.field public final synthetic m:LI3/p;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lv3/J;LI3/p;LA3/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv3/p;->k:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lv3/p;->l:Lv3/J;

    .line 4
    .line 5
    iput-object p3, p0, Lv3/p;->m:LI3/p;

    .line 6
    .line 7
    const/4 p1, 0x2

    .line 8
    invoke-direct {p0, p1, p4}, LC3/g;-><init>(ILA3/d;)V

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
    invoke-virtual {p0, p2, p1}, Lv3/p;->j(LA3/d;Ljava/lang/Object;)LA3/d;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lv3/p;

    .line 10
    .line 11
    sget-object p2, Ly3/h;->a:Ly3/h;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lv3/p;->m(Ljava/lang/Object;)Ljava/lang/Object;

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
    new-instance p2, Lv3/p;

    .line 2
    .line 3
    iget-object v0, p0, Lv3/p;->l:Lv3/J;

    .line 4
    .line 5
    iget-object v1, p0, Lv3/p;->m:LI3/p;

    .line 6
    .line 7
    iget-object v2, p0, Lv3/p;->k:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p2, v2, v0, v1, p1}, Lv3/p;-><init>(Ljava/lang/String;Lv3/J;LI3/p;LA3/d;)V

    .line 10
    .line 11
    .line 12
    return-object p2
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    iget v0, p0, Lv3/p;->j:I

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
    iget-object v0, p0, Lv3/p;->i:LI3/p;

    .line 9
    .line 10
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 15
    .line 16
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 17
    .line 18
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    throw p1

    .line 22
    :cond_1
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lv3/p;->k:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p1}, LV0/g;->c(Ljava/lang/String;)LM/d;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget-object v0, p0, Lv3/p;->l:Lv3/J;

    .line 32
    .line 33
    iget-object v0, v0, Lv3/J;->e:Landroid/content/Context;

    .line 34
    .line 35
    if-eqz v0, :cond_3

    .line 36
    .line 37
    invoke-static {v0}, Lv3/K;->a(Landroid/content/Context;)LI/i;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, LE/i;

    .line 42
    .line 43
    iget-object v0, v0, LE/i;->f:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v0, LI/i;

    .line 46
    .line 47
    invoke-interface {v0}, LI/i;->d()LQ3/d;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v2, Lv3/o;

    .line 52
    .line 53
    const/4 v3, 0x0

    .line 54
    invoke-direct {v2, v0, p1, v3}, Lv3/o;-><init>(LQ3/d;LM/d;I)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lv3/p;->m:LI3/p;

    .line 58
    .line 59
    iput-object v0, p0, Lv3/p;->i:LI3/p;

    .line 60
    .line 61
    iput v1, p0, Lv3/p;->j:I

    .line 62
    .line 63
    invoke-static {v2, p0}, LQ3/r;->c(LQ3/d;LC3/c;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    sget-object v1, LB3/a;->e:LB3/a;

    .line 68
    .line 69
    if-ne p1, v1, :cond_2

    .line 70
    .line 71
    return-object v1

    .line 72
    :cond_2
    :goto_0
    iput-object p1, v0, LI3/p;->e:Ljava/lang/Object;

    .line 73
    .line 74
    sget-object p1, Ly3/h;->a:Ly3/h;

    .line 75
    .line 76
    return-object p1

    .line 77
    :cond_3
    const-string p1, "context"

    .line 78
    .line 79
    invoke-static {p1}, LI3/h;->g(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    const/4 p1, 0x0

    .line 83
    throw p1
.end method
