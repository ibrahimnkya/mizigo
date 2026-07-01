.class public final LF1/g;
.super LC3/g;
.source "SourceFile"

# interfaces
.implements LH3/p;


# instance fields
.field public i:I

.field public final synthetic j:LF1/h;

.field public final synthetic k:LM/d;

.field public final synthetic l:Ljava/lang/Long;


# direct methods
.method public constructor <init>(LF1/h;LM/d;Ljava/lang/Long;LA3/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, LF1/g;->j:LF1/h;

    .line 2
    .line 3
    iput-object p2, p0, LF1/g;->k:LM/d;

    .line 4
    .line 5
    iput-object p3, p0, LF1/g;->l:Ljava/lang/Long;

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
    invoke-virtual {p0, p2, p1}, LF1/g;->j(LA3/d;Ljava/lang/Object;)LA3/d;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, LF1/g;

    .line 10
    .line 11
    sget-object p2, Ly3/h;->a:Ly3/h;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, LF1/g;->m(Ljava/lang/Object;)Ljava/lang/Object;

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
    new-instance p2, LF1/g;

    .line 2
    .line 3
    iget-object v0, p0, LF1/g;->k:LM/d;

    .line 4
    .line 5
    iget-object v1, p0, LF1/g;->l:Ljava/lang/Long;

    .line 6
    .line 7
    iget-object v2, p0, LF1/g;->j:LF1/h;

    .line 8
    .line 9
    invoke-direct {p2, v2, v0, v1, p1}, LF1/g;-><init>(LF1/h;LM/d;Ljava/lang/Long;LA3/d;)V

    .line 10
    .line 11
    .line 12
    return-object p2
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .line 1
    iget v0, p0, LF1/g;->i:I

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
    iget-object p1, p0, LF1/g;->j:LF1/h;

    .line 24
    .line 25
    iget-object p1, p1, LF1/h;->c:LI/i;

    .line 26
    .line 27
    new-instance v0, LF1/f;

    .line 28
    .line 29
    iget-object v2, p0, LF1/g;->l:Ljava/lang/Long;

    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    iget-object v4, p0, LF1/g;->k:LM/d;

    .line 33
    .line 34
    invoke-direct {v0, v4, v2, v3}, LF1/f;-><init>(LM/d;Ljava/lang/Long;LA3/d;)V

    .line 35
    .line 36
    .line 37
    iput v1, p0, LF1/g;->i:I

    .line 38
    .line 39
    invoke-static {p1, v0, p0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->n(LI/i;LH3/p;LC3/g;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    sget-object v0, LB3/a;->e:LB3/a;

    .line 44
    .line 45
    if-ne p1, v0, :cond_2

    .line 46
    .line 47
    return-object v0

    .line 48
    :cond_2
    return-object p1
.end method
