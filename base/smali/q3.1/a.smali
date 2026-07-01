.class public final synthetic Lq3/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:Lm/x0;

.field public final synthetic f:Le3/e;

.field public final synthetic g:Landroid/os/Handler;

.field public final synthetic h:LX1/c;

.field public final synthetic i:J


# direct methods
.method public synthetic constructor <init>(Lm/x0;Le3/e;Landroid/os/Handler;LX1/c;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lq3/a;->e:Lm/x0;

    iput-object p2, p0, Lq3/a;->f:Le3/e;

    iput-object p3, p0, Lq3/a;->g:Landroid/os/Handler;

    iput-object p4, p0, Lq3/a;->h:LX1/c;

    iput-wide p5, p0, Lq3/a;->i:J

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    .line 1
    sget-object v0, Ld1/d;->a:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v2, p0, Lq3/a;->f:Le3/e;

    .line 4
    .line 5
    invoke-virtual {v2, v0}, Le3/e;->d(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ld1/d;->a:Landroid/content/Context;

    .line 9
    .line 10
    new-instance v1, LZ2/v;

    .line 11
    .line 12
    move-object v3, v2

    .line 13
    iget-object v2, p0, Lq3/a;->e:Lm/x0;

    .line 14
    .line 15
    iget-object v4, p0, Lq3/a;->h:LX1/c;

    .line 16
    .line 17
    iget-wide v5, p0, Lq3/a;->i:J

    .line 18
    .line 19
    invoke-direct/range {v1 .. v6}, LZ2/v;-><init>(Lm/x0;Le3/e;LX1/c;J)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    if-ne v2, v4, :cond_2

    .line 31
    .line 32
    iget-object v2, v3, Le3/e;->b:LK0/h;

    .line 33
    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    iget-boolean v2, v3, Le3/e;->a:Z

    .line 37
    .line 38
    iget-object v4, p0, Lq3/a;->g:Landroid/os/Handler;

    .line 39
    .line 40
    if-eqz v2, :cond_0

    .line 41
    .line 42
    invoke-virtual {v4, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    iget-object v7, v3, Le3/e;->f:Ljava/util/concurrent/ExecutorService;

    .line 47
    .line 48
    move-object v5, v1

    .line 49
    new-instance v1, Le3/b;

    .line 50
    .line 51
    const/4 v6, 0x0

    .line 52
    move-object v2, v3

    .line 53
    move-object v3, v0

    .line 54
    invoke-direct/range {v1 .. v6}, Le3/b;-><init>(Le3/e;Landroid/content/Context;Landroid/os/Handler;LZ2/v;I)V

    .line 55
    .line 56
    .line 57
    invoke-interface {v7, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 62
    .line 63
    const-string v1, "ensureInitializationComplete must be called after startInitialization"

    .line 64
    .line 65
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    throw v0

    .line 69
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 70
    .line 71
    const-string v1, "ensureInitializationComplete must be called on the main thread"

    .line 72
    .line 73
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    throw v0
.end method
