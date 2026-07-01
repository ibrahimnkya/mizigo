.class public final LW2/c;
.super LT0/a;
.source "SourceFile"


# instance fields
.field public final j:LW2/b;

.field public final k:Lk3/l;


# direct methods
.method public constructor <init>(Lk3/l;Lk3/n;)V
    .locals 1

    .line 1
    const/4 v0, 0x7

    .line 2
    invoke-direct {p0, v0}, LT0/a;-><init>(I)V

    .line 3
    .line 4
    .line 5
    iput-object p1, p0, LW2/c;->k:Lk3/l;

    .line 6
    .line 7
    new-instance p1, LW2/b;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-direct {p1, p2, v0}, LW2/b;-><init>(Lk3/n;I)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, LW2/c;->j:LW2/b;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final B()Z
    .locals 3

    .line 1
    iget-object v0, p0, LW2/c;->k:Lk3/l;

    .line 2
    .line 3
    iget-object v0, v0, Lk3/l;->b:Ljava/lang/Object;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    return v0

    .line 9
    :cond_0
    instance-of v1, v0, Ljava/util/Map;

    .line 10
    .line 11
    const-string v2, "transactionId"

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    check-cast v0, Ljava/util/Map;

    .line 16
    .line 17
    invoke-interface {v0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    return v0

    .line 22
    :cond_1
    instance-of v1, v0, Lorg/json/JSONObject;

    .line 23
    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    check-cast v0, Lorg/json/JSONObject;

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    return v0

    .line 33
    :cond_2
    new-instance v0, Ljava/lang/ClassCastException;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/lang/ClassCastException;-><init>()V

    .line 36
    .line 37
    .line 38
    throw v0
.end method

.method public final q(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, LW2/c;->k:Lk3/l;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    return-object p1
.end method

.method public final v()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, LW2/c;->k:Lk3/l;

    .line 2
    .line 3
    iget-object v0, v0, Lk3/l;->a:Ljava/lang/String;

    .line 4
    .line 5
    return-object v0
.end method

.method public final x()LW2/d;
    .locals 1

    .line 1
    iget-object v0, p0, LW2/c;->j:LW2/b;

    .line 2
    .line 3
    return-object v0
.end method
