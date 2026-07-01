.class public abstract LZ1/s;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public final a()LZ1/r;
    .locals 1

    .line 1
    instance-of v0, p0, LZ1/r;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, LZ1/r;

    .line 6
    .line 7
    invoke-direct {v0, p0}, LZ1/r;-><init>(LZ1/s;)V

    .line 8
    .line 9
    .line 10
    return-object v0

    .line 11
    :cond_0
    move-object v0, p0

    .line 12
    check-cast v0, LZ1/r;

    .line 13
    .line 14
    return-object v0
.end method

.method public abstract b(Lh2/a;)Ljava/lang/Object;
.end method

.method public abstract c(Lh2/b;Ljava/lang/Object;)V
.end method
