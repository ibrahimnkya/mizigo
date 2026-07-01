.class public final LN3/j0;
.super LS3/r;
.source "SourceFile"


# instance fields
.field public final i:Ljava/lang/ThreadLocal;

.field private volatile threadLocalIsSet:Z


# direct methods
.method public constructor <init>(LA3/i;LC3/g;)V
    .locals 2

    .line 1
    sget-object v0, LN3/k0;->e:LN3/k0;

    .line 2
    .line 3
    invoke-interface {p1, v0}, LA3/i;->m(LA3/h;)LA3/g;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-interface {p1, v0}, LA3/i;->h(LA3/i;)LA3/i;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move-object v0, p1

    .line 15
    :goto_0
    invoke-direct {p0, p2, v0}, LS3/r;-><init>(LA3/d;LA3/i;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ljava/lang/ThreadLocal;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, LN3/j0;->i:Ljava/lang/ThreadLocal;

    .line 24
    .line 25
    iget-object p2, p2, LC3/c;->f:LA3/i;

    .line 26
    .line 27
    invoke-static {p2}, LI3/h;->b(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    sget-object v0, LA3/e;->e:LA3/e;

    .line 31
    .line 32
    invoke-interface {p2, v0}, LA3/i;->m(LA3/h;)LA3/g;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    instance-of p2, p2, LN3/r;

    .line 37
    .line 38
    if-nez p2, :cond_1

    .line 39
    .line 40
    const/4 p2, 0x0

    .line 41
    invoke-static {p1, p2}, LS3/b;->m(LA3/i;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-static {p1, p2}, LS3/b;->g(LA3/i;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p1, p2}, LN3/j0;->c0(LA3/i;Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void
.end method


# virtual methods
.method public final Z()V
    .locals 0

    .line 1
    invoke-virtual {p0}, LN3/j0;->b0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final a0()Z
    .locals 3

    .line 1
    iget-boolean v0, p0, LN3/j0;->threadLocalIsSet:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, LN3/j0;->i:Ljava/lang/ThreadLocal;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    move v0, v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    iget-object v2, p0, LN3/j0;->i:Ljava/lang/ThreadLocal;

    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->remove()V

    .line 20
    .line 21
    .line 22
    xor-int/2addr v0, v1

    .line 23
    return v0
.end method

.method public final b0()V
    .locals 2

    .line 1
    iget-boolean v0, p0, LN3/j0;->threadLocalIsSet:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, LN3/j0;->i:Ljava/lang/ThreadLocal;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ly3/c;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v1, v0, Ly3/c;->e:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v1, LA3/i;

    .line 18
    .line 19
    iget-object v0, v0, Ly3/c;->f:Ljava/lang/Object;

    .line 20
    .line 21
    invoke-static {v1, v0}, LS3/b;->g(LA3/i;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, LN3/j0;->i:Ljava/lang/ThreadLocal;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public final c0(LA3/i;Ljava/lang/Object;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, LN3/j0;->threadLocalIsSet:Z

    .line 3
    .line 4
    iget-object v0, p0, LN3/j0;->i:Ljava/lang/ThreadLocal;

    .line 5
    .line 6
    new-instance v1, Ly3/c;

    .line 7
    .line 8
    invoke-direct {v1, p1, p2}, Ly3/c;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final t(Ljava/lang/Object;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, LN3/j0;->b0()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, LN3/v;->h(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object v0, p0, LS3/r;->h:LA3/d;

    .line 9
    .line 10
    invoke-interface {v0}, LA3/d;->e()LA3/i;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-static {v1, v2}, LS3/b;->m(LA3/i;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    sget-object v4, LS3/b;->d:LE/i;

    .line 20
    .line 21
    if-eq v3, v4, :cond_0

    .line 22
    .line 23
    invoke-static {v0, v1, v3}, LN3/v;->m(LA3/d;LA3/i;Ljava/lang/Object;)LN3/j0;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    :cond_0
    :try_start_0
    invoke-interface {v0, p1}, LA3/d;->g(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    .line 29
    .line 30
    if-eqz v2, :cond_2

    .line 31
    .line 32
    invoke-virtual {v2}, LN3/j0;->a0()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    return-void

    .line 40
    :cond_2
    :goto_0
    invoke-static {v1, v3}, LS3/b;->g(LA3/i;Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :catchall_0
    move-exception p1

    .line 45
    if-eqz v2, :cond_3

    .line 46
    .line 47
    invoke-virtual {v2}, LN3/j0;->a0()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_4

    .line 52
    .line 53
    :cond_3
    invoke-static {v1, v3}, LS3/b;->g(LA3/i;Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    :cond_4
    throw p1
.end method
