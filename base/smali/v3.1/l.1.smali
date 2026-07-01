.class public final Lv3/l;
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
    iput-object p1, p0, Lv3/l;->j:Lv3/J;

    .line 2
    .line 3
    iput-object p2, p0, Lv3/l;->k:Ljava/util/List;

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
    invoke-virtual {p0, p2, p1}, Lv3/l;->j(LA3/d;Ljava/lang/Object;)LA3/d;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lv3/l;

    .line 10
    .line 11
    sget-object p2, Ly3/h;->a:Ly3/h;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lv3/l;->m(Ljava/lang/Object;)Ljava/lang/Object;

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
    new-instance p2, Lv3/l;

    .line 2
    .line 3
    iget-object v0, p0, Lv3/l;->j:Lv3/J;

    .line 4
    .line 5
    iget-object v1, p0, Lv3/l;->k:Ljava/util/List;

    .line 6
    .line 7
    invoke-direct {p2, v0, v1, p1}, Lv3/l;-><init>(Lv3/J;Ljava/util/List;LA3/d;)V

    .line 8
    .line 9
    .line 10
    return-object p2
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget v0, p0, Lv3/l;->i:I

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
    iput v1, p0, Lv3/l;->i:I

    .line 24
    .line 25
    iget-object p1, p0, Lv3/l;->j:Lv3/J;

    .line 26
    .line 27
    iget-object v0, p0, Lv3/l;->k:Ljava/util/List;

    .line 28
    .line 29
    invoke-static {p1, v0, p0}, Lv3/J;->j(Lv3/J;Ljava/util/List;LC3/c;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    sget-object v0, LB3/a;->e:LB3/a;

    .line 34
    .line 35
    if-ne p1, v0, :cond_2

    .line 36
    .line 37
    return-object v0

    .line 38
    :cond_2
    return-object p1
.end method
