.class public final Lv3/k;
.super LC3/g;
.source "SourceFile"

# interfaces
.implements LH3/p;


# instance fields
.field public synthetic i:Ljava/lang/Object;

.field public final synthetic j:LM/d;

.field public final synthetic k:Ljava/lang/String;


# direct methods
.method public constructor <init>(LM/d;Ljava/lang/String;LA3/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv3/k;->j:LM/d;

    .line 2
    .line 3
    iput-object p2, p0, Lv3/k;->k:Ljava/lang/String;

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
    check-cast p1, LM/b;

    .line 2
    .line 3
    check-cast p2, LA3/d;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, Lv3/k;->j(LA3/d;Ljava/lang/Object;)LA3/d;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lv3/k;

    .line 10
    .line 11
    sget-object p2, Ly3/h;->a:Ly3/h;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lv3/k;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    return-object p2
.end method

.method public final j(LA3/d;Ljava/lang/Object;)LA3/d;
    .locals 3

    .line 1
    new-instance v0, Lv3/k;

    .line 2
    .line 3
    iget-object v1, p0, Lv3/k;->j:LM/d;

    .line 4
    .line 5
    iget-object v2, p0, Lv3/k;->k:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2, p1}, Lv3/k;-><init>(LM/d;Ljava/lang/String;LA3/d;)V

    .line 8
    .line 9
    .line 10
    iput-object p2, v0, Lv3/k;->i:Ljava/lang/Object;

    .line 11
    .line 12
    return-object v0
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Lv3/k;->i:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LM/b;

    .line 4
    .line 5
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lv3/k;->j:LM/d;

    .line 9
    .line 10
    iget-object v1, p0, Lv3/k;->k:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, p1, v1}, LM/b;->e(LM/d;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    sget-object p1, Ly3/h;->a:Ly3/h;

    .line 16
    .line 17
    return-object p1
.end method
