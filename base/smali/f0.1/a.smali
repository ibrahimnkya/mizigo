.class public final Lf0/a;
.super LC3/g;
.source "SourceFile"

# interfaces
.implements LH3/p;


# instance fields
.field public i:I

.field public final synthetic j:LQ3/d;

.field public final synthetic k:LC/a;


# direct methods
.method public constructor <init>(LQ3/d;LC/a;LA3/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lf0/a;->j:LQ3/d;

    .line 2
    .line 3
    iput-object p2, p0, Lf0/a;->k:LC/a;

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
    invoke-virtual {p0, p2, p1}, Lf0/a;->j(LA3/d;Ljava/lang/Object;)LA3/d;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lf0/a;

    .line 10
    .line 11
    sget-object p2, Ly3/h;->a:Ly3/h;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lf0/a;->m(Ljava/lang/Object;)Ljava/lang/Object;

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
    new-instance p2, Lf0/a;

    .line 2
    .line 3
    iget-object v0, p0, Lf0/a;->j:LQ3/d;

    .line 4
    .line 5
    iget-object v1, p0, Lf0/a;->k:LC/a;

    .line 6
    .line 7
    invoke-direct {p2, v0, v1, p1}, Lf0/a;-><init>(LQ3/d;LC/a;LA3/d;)V

    .line 8
    .line 9
    .line 10
    return-object p2
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget v0, p0, Lf0/a;->i:I

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
    new-instance p1, LI/y;

    .line 24
    .line 25
    iget-object v0, p0, Lf0/a;->k:LC/a;

    .line 26
    .line 27
    const/4 v2, 0x2

    .line 28
    invoke-direct {p1, v2, v0}, LI/y;-><init>(ILjava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    iput v1, p0, Lf0/a;->i:I

    .line 32
    .line 33
    iget-object v0, p0, Lf0/a;->j:LQ3/d;

    .line 34
    .line 35
    invoke-interface {v0, p1, p0}, LQ3/d;->c(LQ3/e;LA3/d;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    sget-object v0, LB3/a;->e:LB3/a;

    .line 40
    .line 41
    if-ne p1, v0, :cond_2

    .line 42
    .line 43
    return-object v0

    .line 44
    :cond_2
    :goto_0
    sget-object p1, Ly3/h;->a:Ly3/h;

    .line 45
    .line 46
    return-object p1
.end method
