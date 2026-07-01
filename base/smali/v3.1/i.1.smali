.class public final Lv3/i;
.super LC3/g;
.source "SourceFile"

# interfaces
.implements LH3/p;


# instance fields
.field public synthetic i:Ljava/lang/Object;

.field public final synthetic j:Ljava/util/List;


# direct methods
.method public constructor <init>(Ljava/util/List;LA3/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv3/i;->j:Ljava/util/List;

    .line 2
    .line 3
    const/4 p1, 0x2

    .line 4
    invoke-direct {p0, p1, p2}, LC3/g;-><init>(ILA3/d;)V

    .line 5
    .line 6
    .line 7
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
    invoke-virtual {p0, p2, p1}, Lv3/i;->j(LA3/d;Ljava/lang/Object;)LA3/d;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lv3/i;

    .line 10
    .line 11
    sget-object p2, Ly3/h;->a:Ly3/h;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lv3/i;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    return-object p2
.end method

.method public final j(LA3/d;Ljava/lang/Object;)LA3/d;
    .locals 2

    .line 1
    new-instance v0, Lv3/i;

    .line 2
    .line 3
    iget-object v1, p0, Lv3/i;->j:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {v0, v1, p1}, Lv3/i;-><init>(Ljava/util/List;LA3/d;)V

    .line 6
    .line 7
    .line 8
    iput-object p2, v0, Lv3/i;->i:Ljava/lang/Object;

    .line 9
    .line 10
    return-object v0
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Lv3/i;->i:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LM/b;

    .line 4
    .line 5
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lv3/i;->j:Ljava/util/List;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v1}, LV0/g;->c(Ljava/lang/String;)LM/d;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, LM/b;->d(LM/d;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-virtual {v0}, LM/b;->b()V

    .line 37
    .line 38
    .line 39
    iget-object p1, v0, LM/b;->a:Ljava/util/LinkedHashMap;

    .line 40
    .line 41
    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->clear()V

    .line 42
    .line 43
    .line 44
    :cond_1
    sget-object p1, Ly3/h;->a:Ly3/h;

    .line 45
    .line 46
    return-object p1
.end method
