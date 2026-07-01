.class public final LM/h;
.super LC3/g;
.source "SourceFile"

# interfaces
.implements LH3/p;


# instance fields
.field public i:I

.field public synthetic j:Ljava/lang/Object;

.field public final synthetic k:LC3/g;


# direct methods
.method public constructor <init>(LH3/p;LA3/d;)V
    .locals 0

    .line 1
    check-cast p1, LC3/g;

    .line 2
    .line 3
    iput-object p1, p0, LM/h;->k:LC3/g;

    .line 4
    .line 5
    const/4 p1, 0x2

    .line 6
    invoke-direct {p0, p1, p2}, LC3/g;-><init>(ILA3/d;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, LM/b;

    .line 2
    .line 3
    check-cast p2, LA3/d;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, LM/h;->j(LA3/d;Ljava/lang/Object;)LA3/d;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, LM/h;

    .line 10
    .line 11
    sget-object p2, Ly3/h;->a:Ly3/h;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, LM/h;->m(Ljava/lang/Object;)Ljava/lang/Object;

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
    new-instance v0, LM/h;

    .line 2
    .line 3
    iget-object v1, p0, LM/h;->k:LC3/g;

    .line 4
    .line 5
    invoke-direct {v0, v1, p1}, LM/h;-><init>(LH3/p;LA3/d;)V

    .line 6
    .line 7
    .line 8
    iput-object p2, v0, LM/h;->j:Ljava/lang/Object;

    .line 9
    .line 10
    return-object v0
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget v0, p0, LM/h;->i:I

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
    iget-object v0, p0, LM/h;->j:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v0, LM/b;

    .line 11
    .line 12
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 17
    .line 18
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 19
    .line 20
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    throw p1

    .line 24
    :cond_1
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, LM/h;->j:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast p1, LM/b;

    .line 30
    .line 31
    new-instance v0, LM/b;

    .line 32
    .line 33
    invoke-virtual {p1}, LM/b;->a()Ljava/util/Map;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance v2, Ljava/util/LinkedHashMap;

    .line 38
    .line 39
    invoke-direct {v2, p1}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    .line 40
    .line 41
    .line 42
    const/4 p1, 0x0

    .line 43
    invoke-direct {v0, v2, p1}, LM/b;-><init>(Ljava/util/LinkedHashMap;Z)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, LM/h;->j:Ljava/lang/Object;

    .line 47
    .line 48
    iput v1, p0, LM/h;->i:I

    .line 49
    .line 50
    iget-object p1, p0, LM/h;->k:LC3/g;

    .line 51
    .line 52
    invoke-interface {p1, v0, p0}, LH3/p;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    sget-object v1, LB3/a;->e:LB3/a;

    .line 57
    .line 58
    if-ne p1, v1, :cond_2

    .line 59
    .line 60
    return-object v1

    .line 61
    :cond_2
    return-object v0
.end method
