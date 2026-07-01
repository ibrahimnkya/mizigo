.class public final Lq3/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lk3/s;


# instance fields
.field public e:LE0/j;

.field public f:Z


# virtual methods
.method public final onRequestPermissionsResult(I[Ljava/lang/String;[I)Z
    .locals 2

    .line 1
    iget-boolean p2, p0, Lq3/f;->f:Z

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p2, :cond_1

    .line 5
    .line 6
    const/16 p2, 0xf0

    .line 7
    .line 8
    if-ne p1, p2, :cond_1

    .line 9
    .line 10
    iget-object p1, p0, Lq3/f;->e:LE0/j;

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    iput-boolean v0, p0, Lq3/f;->f:Z

    .line 15
    .line 16
    array-length p2, p3

    .line 17
    const/4 v1, 0x1

    .line 18
    if-lez p2, :cond_0

    .line 19
    .line 20
    aget p2, p3, v0

    .line 21
    .line 22
    if-nez p2, :cond_0

    .line 23
    .line 24
    move v0, v1

    .line 25
    :cond_0
    iget-object p2, p1, LE0/j;->f:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast p2, Ljava/util/HashMap;

    .line 28
    .line 29
    iget-object p1, p1, LE0/j;->g:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast p1, Li1/i;

    .line 32
    .line 33
    const-string p3, "authorizationStatus"

    .line 34
    .line 35
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p2, p3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, p2}, Li1/i;->b(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    return v1

    .line 46
    :cond_1
    return v0
.end method
