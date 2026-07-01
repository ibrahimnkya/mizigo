.class public final Lv3/j;
.super LC3/g;
.source "SourceFile"

# interfaces
.implements LH3/p;


# instance fields
.field public i:I

.field public final synthetic j:Lv3/J;

.field public final synthetic k:Ljava/util/List;


# direct methods
.method public constructor <init>(Lv3/J;Ljava/util/List;LA3/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv3/j;->j:Lv3/J;

    .line 2
    .line 3
    iput-object p2, p0, Lv3/j;->k:Ljava/util/List;

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
    invoke-virtual {p0, p2, p1}, Lv3/j;->j(LA3/d;Ljava/lang/Object;)LA3/d;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lv3/j;

    .line 10
    .line 11
    sget-object p2, Ly3/h;->a:Ly3/h;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lv3/j;->m(Ljava/lang/Object;)Ljava/lang/Object;

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
    new-instance p2, Lv3/j;

    .line 2
    .line 3
    iget-object v0, p0, Lv3/j;->j:Lv3/J;

    .line 4
    .line 5
    iget-object v1, p0, Lv3/j;->k:Ljava/util/List;

    .line 6
    .line 7
    invoke-direct {p2, v0, v1, p1}, Lv3/j;-><init>(Lv3/J;Ljava/util/List;LA3/d;)V

    .line 8
    .line 9
    .line 10
    return-object p2
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    iget v0, p0, Lv3/j;->i:I

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
    iget-object p1, p0, Lv3/j;->j:Lv3/J;

    .line 24
    .line 25
    iget-object p1, p1, Lv3/J;->e:Landroid/content/Context;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    if-eqz p1, :cond_3

    .line 29
    .line 30
    invoke-static {p1}, Lv3/K;->a(Landroid/content/Context;)LI/i;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance v2, Lv3/i;

    .line 35
    .line 36
    iget-object v3, p0, Lv3/j;->k:Ljava/util/List;

    .line 37
    .line 38
    invoke-direct {v2, v3, v0}, Lv3/i;-><init>(Ljava/util/List;LA3/d;)V

    .line 39
    .line 40
    .line 41
    iput v1, p0, Lv3/j;->i:I

    .line 42
    .line 43
    invoke-static {p1, v2, p0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->n(LI/i;LH3/p;LC3/g;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    sget-object v0, LB3/a;->e:LB3/a;

    .line 48
    .line 49
    if-ne p1, v0, :cond_2

    .line 50
    .line 51
    return-object v0

    .line 52
    :cond_2
    return-object p1

    .line 53
    :cond_3
    const-string p1, "context"

    .line 54
    .line 55
    invoke-static {p1}, LI3/h;->g(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    throw v0
.end method
