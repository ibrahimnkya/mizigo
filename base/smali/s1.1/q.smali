.class public final Ls1/q;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Ls1/q;


# instance fields
.field public final a:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ls1/q;

    .line 2
    .line 3
    invoke-direct {v0}, Ls1/q;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ls1/q;->b:Ls1/q;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 5
    .line 6
    new-instance v1, Lk2/e;

    .line 7
    .line 8
    const/4 v2, 0x2

    .line 9
    invoke-direct {v1, v2}, Lk2/e;-><init>(I)V

    .line 10
    .line 11
    .line 12
    new-instance v2, Ls1/E;

    .line 13
    .line 14
    invoke-direct {v2, v1}, Ls1/E;-><init>(Lk2/e;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ls1/q;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final a(Landroid/support/v4/media/session/a;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ls1/q;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ls1/E;

    .line 8
    .line 9
    invoke-virtual {v0, p1, p2}, Ls1/E;->a(Landroid/support/v4/media/session/a;Ljava/lang/Class;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    return-object p1
.end method

.method public final declared-synchronized b(Ls1/B;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ls1/q;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ls1/E;

    .line 9
    .line 10
    new-instance v1, Lk2/e;

    .line 11
    .line 12
    invoke-direct {v1, v0}, Lk2/e;-><init>(Ls1/E;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, p1}, Lk2/e;->a(Ls1/B;)V

    .line 16
    .line 17
    .line 18
    new-instance p1, Ls1/E;

    .line 19
    .line 20
    invoke-direct {p1, v1}, Ls1/E;-><init>(Lk2/e;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ls1/q;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    .line 28
    monitor-exit p0

    .line 29
    return-void

    .line 30
    :catchall_0
    move-exception p1

    .line 31
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    throw p1
.end method

.method public final declared-synchronized c(Ls1/F;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ls1/q;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ls1/E;

    .line 9
    .line 10
    new-instance v1, Lk2/e;

    .line 11
    .line 12
    invoke-direct {v1, v0}, Lk2/e;-><init>(Ls1/E;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, p1}, Lk2/e;->b(Ls1/F;)V

    .line 16
    .line 17
    .line 18
    new-instance p1, Ls1/E;

    .line 19
    .line 20
    invoke-direct {p1, v1}, Ls1/E;-><init>(Lk2/e;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ls1/q;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    .line 28
    monitor-exit p0

    .line 29
    return-void

    .line 30
    :catchall_0
    move-exception p1

    .line 31
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    throw p1
.end method
