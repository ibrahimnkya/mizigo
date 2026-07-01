.class public final Lv3/C;
.super LC3/g;
.source "SourceFile"

# interfaces
.implements LH3/p;


# instance fields
.field public i:I

.field public final synthetic j:Lv3/J;

.field public final synthetic k:Ljava/lang/String;

.field public final synthetic l:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lv3/J;Ljava/lang/String;Ljava/lang/String;LA3/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv3/C;->j:Lv3/J;

    .line 2
    .line 3
    iput-object p2, p0, Lv3/C;->k:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lv3/C;->l:Ljava/lang/String;

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
    invoke-virtual {p0, p2, p1}, Lv3/C;->j(LA3/d;Ljava/lang/Object;)LA3/d;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lv3/C;

    .line 10
    .line 11
    sget-object p2, Ly3/h;->a:Ly3/h;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lv3/C;->m(Ljava/lang/Object;)Ljava/lang/Object;

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
    new-instance p2, Lv3/C;

    .line 2
    .line 3
    iget-object v0, p0, Lv3/C;->k:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v1, p0, Lv3/C;->l:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v2, p0, Lv3/C;->j:Lv3/J;

    .line 8
    .line 9
    invoke-direct {p2, v2, v0, v1, p1}, Lv3/C;-><init>(Lv3/J;Ljava/lang/String;Ljava/lang/String;LA3/d;)V

    .line 10
    .line 11
    .line 12
    return-object p2
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget v0, p0, Lv3/C;->i:I

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
    iput v1, p0, Lv3/C;->i:I

    .line 24
    .line 25
    iget-object p1, p0, Lv3/C;->j:Lv3/J;

    .line 26
    .line 27
    iget-object v0, p0, Lv3/C;->k:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v1, p0, Lv3/C;->l:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p1, v0, v1, p0}, Lv3/J;->c(Lv3/J;Ljava/lang/String;Ljava/lang/String;LC3/g;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    sget-object v0, LB3/a;->e:LB3/a;

    .line 36
    .line 37
    if-ne p1, v0, :cond_2

    .line 38
    .line 39
    return-object v0

    .line 40
    :cond_2
    :goto_0
    sget-object p1, Ly3/h;->a:Ly3/h;

    .line 41
    .line 42
    return-object p1
.end method
