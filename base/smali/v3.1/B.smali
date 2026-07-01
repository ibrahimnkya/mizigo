.class public final Lv3/B;
.super LC3/g;
.source "SourceFile"

# interfaces
.implements LH3/p;


# instance fields
.field public i:I

.field public final synthetic j:Ljava/lang/String;

.field public final synthetic k:Lv3/J;

.field public final synthetic l:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Lv3/J;ZLA3/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv3/B;->j:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lv3/B;->k:Lv3/J;

    .line 4
    .line 5
    iput-boolean p3, p0, Lv3/B;->l:Z

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
    invoke-virtual {p0, p2, p1}, Lv3/B;->j(LA3/d;Ljava/lang/Object;)LA3/d;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lv3/B;

    .line 10
    .line 11
    sget-object p2, Ly3/h;->a:Ly3/h;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lv3/B;->m(Ljava/lang/Object;)Ljava/lang/Object;

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
    new-instance p2, Lv3/B;

    .line 2
    .line 3
    iget-object v0, p0, Lv3/B;->k:Lv3/J;

    .line 4
    .line 5
    iget-boolean v1, p0, Lv3/B;->l:Z

    .line 6
    .line 7
    iget-object v2, p0, Lv3/B;->j:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p2, v2, v0, v1, p1}, Lv3/B;-><init>(Ljava/lang/String;Lv3/J;ZLA3/d;)V

    .line 10
    .line 11
    .line 12
    return-object p2
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .line 1
    iget v0, p0, Lv3/B;->i:I

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
    iget-object p1, p0, Lv3/B;->j:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p1}, LV0/g;->c(Ljava/lang/String;)LM/d;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object v0, p0, Lv3/B;->k:Lv3/J;

    .line 30
    .line 31
    iget-object v0, v0, Lv3/J;->e:Landroid/content/Context;

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    invoke-static {v0}, Lv3/K;->a(Landroid/content/Context;)LI/i;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v3, Lv3/A;

    .line 41
    .line 42
    iget-boolean v4, p0, Lv3/B;->l:Z

    .line 43
    .line 44
    invoke-direct {v3, p1, v4, v2}, Lv3/A;-><init>(LM/d;ZLA3/d;)V

    .line 45
    .line 46
    .line 47
    iput v1, p0, Lv3/B;->i:I

    .line 48
    .line 49
    invoke-static {v0, v3, p0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->n(LI/i;LH3/p;LC3/g;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    sget-object v0, LB3/a;->e:LB3/a;

    .line 54
    .line 55
    if-ne p1, v0, :cond_2

    .line 56
    .line 57
    return-object v0

    .line 58
    :cond_2
    :goto_0
    sget-object p1, Ly3/h;->a:Ly3/h;

    .line 59
    .line 60
    return-object p1

    .line 61
    :cond_3
    const-string p1, "context"

    .line 62
    .line 63
    invoke-static {p1}, LI3/h;->g(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    throw v2
.end method
