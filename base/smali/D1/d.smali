.class public interface abstract LD1/d;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public a(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-static {p1}, LD1/v;->a(Ljava/lang/Class;)LD1/v;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p0, p1}, LD1/d;->d(LD1/v;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    return-object p1
.end method

.method public abstract b(LD1/v;)LP1/a;
.end method

.method public c(LD1/v;)Ljava/util/Set;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, LD1/d;->b(LD1/v;)LP1/a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, LP1/a;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ljava/util/Set;

    .line 10
    .line 11
    return-object p1
.end method

.method public d(LD1/v;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, LD1/d;->e(LD1/v;)LP1/a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    return-object p1

    .line 9
    :cond_0
    invoke-interface {p1}, LP1/a;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    return-object p1
.end method

.method public abstract e(LD1/v;)LP1/a;
.end method

.method public f(Ljava/lang/Class;)LP1/a;
    .locals 0

    .line 1
    invoke-static {p1}, LD1/v;->a(Ljava/lang/Class;)LD1/v;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p0, p1}, LD1/d;->e(LD1/v;)LP1/a;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    return-object p1
.end method
