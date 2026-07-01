.class public final Ls3/F;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ls3/l0;

.field public c:Ljava/lang/Double;

.field public d:Ljava/lang/Double;

.field public e:Ljava/lang/Double;


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    const-class v2, Ls3/F;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    if-eq v2, v3, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    check-cast p1, Ls3/F;

    .line 18
    .line 19
    iget-object v2, p0, Ls3/F;->a:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v3, p1, Ls3/F;->a:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_2

    .line 28
    .line 29
    iget-object v2, p0, Ls3/F;->b:Ls3/l0;

    .line 30
    .line 31
    iget-object v3, p1, Ls3/F;->b:Ls3/l0;

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_2

    .line 38
    .line 39
    iget-object v2, p0, Ls3/F;->c:Ljava/lang/Double;

    .line 40
    .line 41
    iget-object v3, p1, Ls3/F;->c:Ljava/lang/Double;

    .line 42
    .line 43
    invoke-virtual {v2, v3}, Ljava/lang/Double;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_2

    .line 48
    .line 49
    iget-object v2, p0, Ls3/F;->d:Ljava/lang/Double;

    .line 50
    .line 51
    iget-object v3, p1, Ls3/F;->d:Ljava/lang/Double;

    .line 52
    .line 53
    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_2

    .line 58
    .line 59
    iget-object v2, p0, Ls3/F;->e:Ljava/lang/Double;

    .line 60
    .line 61
    iget-object p1, p1, Ls3/F;->e:Ljava/lang/Double;

    .line 62
    .line 63
    invoke-static {v2, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_2

    .line 68
    .line 69
    return v0

    .line 70
    :cond_2
    :goto_0
    return v1
.end method

.method public final hashCode()I
    .locals 5

    .line 1
    iget-object v0, p0, Ls3/F;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Ls3/F;->b:Ls3/l0;

    .line 4
    .line 5
    iget-object v2, p0, Ls3/F;->c:Ljava/lang/Double;

    .line 6
    .line 7
    iget-object v3, p0, Ls3/F;->d:Ljava/lang/Double;

    .line 8
    .line 9
    iget-object v4, p0, Ls3/F;->e:Ljava/lang/Double;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, v4}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    return v0
.end method
