.class public final Lh0/i;
.super LC3/g;
.source "SourceFile"

# interfaces
.implements LH3/p;


# instance fields
.field public i:I

.field public synthetic j:Ljava/lang/Object;

.field public final synthetic k:Lh0/b;

.field public final synthetic l:Landroid/app/Activity;


# direct methods
.method public constructor <init>(Lh0/b;Landroid/app/Activity;LA3/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lh0/i;->k:Lh0/b;

    .line 2
    .line 3
    iput-object p2, p0, Lh0/i;->l:Landroid/app/Activity;

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
    check-cast p1, LP3/r;

    .line 2
    .line 3
    check-cast p2, LA3/d;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, Lh0/i;->j(LA3/d;Ljava/lang/Object;)LA3/d;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lh0/i;

    .line 10
    .line 11
    sget-object p2, Ly3/h;->a:Ly3/h;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lh0/i;->m(Ljava/lang/Object;)Ljava/lang/Object;

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
    new-instance v0, Lh0/i;

    .line 2
    .line 3
    iget-object v1, p0, Lh0/i;->k:Lh0/b;

    .line 4
    .line 5
    iget-object v2, p0, Lh0/i;->l:Landroid/app/Activity;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2, p1}, Lh0/i;-><init>(Lh0/b;Landroid/app/Activity;LA3/d;)V

    .line 8
    .line 9
    .line 10
    iput-object p2, v0, Lh0/i;->j:Ljava/lang/Object;

    .line 11
    .line 12
    return-object v0
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget v0, p0, Lh0/i;->i:I

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
    goto :goto_0

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
    iget-object p1, p0, Lh0/i;->j:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast p1, LP3/r;

    .line 26
    .line 27
    new-instance v0, LZ2/l;

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    invoke-direct {v0, v2, p1}, LZ2/l;-><init>(ILjava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    iget-object v2, p0, Lh0/i;->k:Lh0/b;

    .line 34
    .line 35
    iget-object v3, v2, Lh0/b;->f:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast v3, Li0/a;

    .line 38
    .line 39
    new-instance v4, LV/c;

    .line 40
    .line 41
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 42
    .line 43
    .line 44
    iget-object v5, p0, Lh0/i;->l:Landroid/app/Activity;

    .line 45
    .line 46
    invoke-interface {v3, v5, v4, v0}, Li0/a;->b(Landroid/content/Context;LV/c;LZ2/l;)V

    .line 47
    .line 48
    .line 49
    new-instance v3, LK/a;

    .line 50
    .line 51
    const/4 v4, 0x2

    .line 52
    invoke-direct {v3, v4, v2, v0}, LK/a;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    iput v1, p0, Lh0/i;->i:I

    .line 56
    .line 57
    invoke-static {p1, v3, p0}, LP3/j;->b(LP3/r;LK/a;LC3/c;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    sget-object v0, LB3/a;->e:LB3/a;

    .line 62
    .line 63
    if-ne p1, v0, :cond_2

    .line 64
    .line 65
    return-object v0

    .line 66
    :cond_2
    :goto_0
    sget-object p1, Ly3/h;->a:Ly3/h;

    .line 67
    .line 68
    return-object p1
.end method
