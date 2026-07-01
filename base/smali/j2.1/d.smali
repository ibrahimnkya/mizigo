.class public final Lj2/d;
.super LS/b;
.source "SourceFile"


# instance fields
.field public b:Lj2/c;


# virtual methods
.method public final h()V
    .locals 4

    .line 1
    iget-object v0, p0, Lj2/d;->b:Lj2/c;

    .line 2
    .line 3
    iget-object v1, v0, Lj2/c;->b:Lj2/b;

    .line 4
    .line 5
    iget-object v2, v1, Lj2/b;->d:Lp2/b;

    .line 6
    .line 7
    monitor-enter v2

    .line 8
    :try_start_0
    iget-object v3, v1, Lj2/b;->c:Ljava/util/LinkedHashSet;

    .line 9
    .line 10
    invoke-interface {v3}, Ljava/util/Collection;->clear()V

    .line 11
    .line 12
    .line 13
    iget-object v1, v1, Lj2/b;->d:Lp2/b;

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    iput-object v3, v1, Lp2/b;->d:Ljava/util/ArrayList;

    .line 17
    .line 18
    iget-object v1, v1, Lp2/b;->c:Ljava/util/LinkedHashSet;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-interface {v1}, Ljava/util/Set;->clear()V

    .line 23
    .line 24
    .line 25
    :cond_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    iget-object v0, v0, Lj2/c;->c:Lp/i;

    .line 27
    .line 28
    const/4 v1, -0x1

    .line 29
    invoke-virtual {v0, v1}, Lp/i;->c(I)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    throw v0
.end method
