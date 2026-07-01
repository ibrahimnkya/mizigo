.class public final LJ0/p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LT2/m;


# static fields
.field public static f:LJ0/p;

.field public static g:LJ0/p;


# instance fields
.field public final synthetic a:I

.field public b:I

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x4

    iput v0, p0, LJ0/p;->a:I

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 10
    iput v0, p0, LJ0/p;->b:I

    .line 11
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, LJ0/p;->e:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, LJ0/p;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(LK2/a;LK2/c;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, LJ0/p;->a:I

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, LJ0/p;->c:Ljava/lang/Object;

    .line 14
    iget p1, p1, LK2/a;->b:I

    .line 15
    iput p1, p0, LJ0/p;->b:I

    .line 16
    iput-object p2, p0, LJ0/p;->e:Ljava/lang/Object;

    add-int/lit8 p1, p1, 0x2

    .line 17
    new-array p1, p1, [LA/c;

    iput-object p1, p0, LJ0/p;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/concurrent/ScheduledExecutorService;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, LJ0/p;->a:I

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, LJ0/m;

    invoke-direct {v0, p0}, LJ0/m;-><init>(LJ0/p;)V

    iput-object v0, p0, LJ0/p;->e:Ljava/lang/Object;

    const/4 v0, 0x1

    iput v0, p0, LJ0/p;->b:I

    iput-object p2, p0, LJ0/p;->d:Ljava/lang/Object;

    .line 3
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, LJ0/p;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/util/Collection;Ljava/util/EnumMap;Ljava/lang/String;I)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, LJ0/p;->a:I

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    iput-object p1, p0, LJ0/p;->c:Ljava/lang/Object;

    .line 6
    iput-object p2, p0, LJ0/p;->d:Ljava/lang/Object;

    .line 7
    iput-object p3, p0, LJ0/p;->e:Ljava/lang/Object;

    .line 8
    iput p4, p0, LJ0/p;->b:I

    return-void
.end method

.method public static declared-synchronized d(Landroid/content/Context;)LJ0/p;
    .locals 4

    .line 1
    const-class v0, LJ0/p;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, LJ0/p;->f:LJ0/p;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, LJ0/p;

    .line 9
    .line 10
    new-instance v2, LS0/a;

    .line 11
    .line 12
    const-string v3, "MessengerIpcClient"

    .line 13
    .line 14
    invoke-direct {v2, v3}, LS0/a;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    invoke-static {v3, v2}, Ljava/util/concurrent/Executors;->newScheduledThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-static {v2}, Ljava/util/concurrent/Executors;->unconfigurableScheduledExecutorService(Ljava/util/concurrent/ScheduledExecutorService;)Ljava/util/concurrent/ScheduledExecutorService;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-direct {v1, p0, v2}, LJ0/p;-><init>(Landroid/content/Context;Ljava/util/concurrent/ScheduledExecutorService;)V

    .line 27
    .line 28
    .line 29
    sput-object v1, LJ0/p;->f:LJ0/p;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    :goto_0
    sget-object p0, LJ0/p;->f:LJ0/p;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    .line 36
    monitor-exit v0

    .line 37
    return-object p0

    .line 38
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    throw p0
.end method


# virtual methods
.method public a(LA/c;)V
    .locals 13

    .line 1
    if-eqz p1, :cond_e

    .line 2
    .line 3
    check-cast p1, LK2/e;

    .line 4
    .line 5
    iget-object v0, p0, LJ0/p;->c:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, LK2/a;

    .line 8
    .line 9
    iget-object v1, p1, LA/c;->g:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v1, [LK2/a;

    .line 12
    .line 13
    array-length v2, v1

    .line 14
    const/4 v3, 0x0

    .line 15
    move v4, v3

    .line 16
    :goto_0
    if-ge v4, v2, :cond_1

    .line 17
    .line 18
    aget-object v5, v1, v4

    .line 19
    .line 20
    if-eqz v5, :cond_0

    .line 21
    .line 22
    invoke-virtual {v5}, LK2/a;->c()V

    .line 23
    .line 24
    .line 25
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    invoke-virtual {p1, v1, v0}, LK2/e;->W([LK2/a;LK2/a;)V

    .line 29
    .line 30
    .line 31
    iget-object v2, p1, LA/c;->f:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v2, LK2/c;

    .line 34
    .line 35
    iget-boolean v4, p1, LK2/e;->h:Z

    .line 36
    .line 37
    if-eqz v4, :cond_2

    .line 38
    .line 39
    iget-object v5, v2, LK2/c;->b:Lr2/o;

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_2
    iget-object v5, v2, LK2/c;->d:Lr2/o;

    .line 43
    .line 44
    :goto_1
    if-eqz v4, :cond_3

    .line 45
    .line 46
    iget-object v2, v2, LK2/c;->c:Lr2/o;

    .line 47
    .line 48
    goto :goto_2

    .line 49
    :cond_3
    iget-object v2, v2, LK2/c;->e:Lr2/o;

    .line 50
    .line 51
    :goto_2
    iget v4, v5, Lr2/o;->b:F

    .line 52
    .line 53
    float-to-int v4, v4

    .line 54
    invoke-virtual {p1, v4}, LA/c;->C(I)I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    iget v2, v2, Lr2/o;->b:F

    .line 59
    .line 60
    float-to-int v2, v2

    .line 61
    invoke-virtual {p1, v2}, LA/c;->C(I)I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    const/4 v2, 0x1

    .line 66
    const/4 v5, -0x1

    .line 67
    move v7, v2

    .line 68
    move v6, v3

    .line 69
    :goto_3
    if-ge v4, p1, :cond_e

    .line 70
    .line 71
    aget-object v8, v1, v4

    .line 72
    .line 73
    if-nez v8, :cond_4

    .line 74
    .line 75
    goto :goto_9

    .line 76
    :cond_4
    iget v9, v8, LK2/a;->f:I

    .line 77
    .line 78
    sub-int v10, v9, v5

    .line 79
    .line 80
    if-nez v10, :cond_5

    .line 81
    .line 82
    add-int/lit8 v6, v6, 0x1

    .line 83
    .line 84
    goto :goto_9

    .line 85
    :cond_5
    if-ne v10, v2, :cond_6

    .line 86
    .line 87
    invoke-static {v7, v6}, Ljava/lang/Math;->max(II)I

    .line 88
    .line 89
    .line 90
    move-result v7

    .line 91
    iget v5, v8, LK2/a;->f:I

    .line 92
    .line 93
    :goto_4
    move v6, v2

    .line 94
    goto :goto_9

    .line 95
    :cond_6
    const/4 v11, 0x0

    .line 96
    if-ltz v10, :cond_d

    .line 97
    .line 98
    iget v12, v0, LK2/a;->f:I

    .line 99
    .line 100
    if-ge v9, v12, :cond_d

    .line 101
    .line 102
    if-le v10, v4, :cond_7

    .line 103
    .line 104
    goto :goto_8

    .line 105
    :cond_7
    const/4 v9, 0x2

    .line 106
    if-le v7, v9, :cond_8

    .line 107
    .line 108
    add-int/lit8 v9, v7, -0x2

    .line 109
    .line 110
    mul-int/2addr v10, v9

    .line 111
    :cond_8
    if-lt v10, v4, :cond_9

    .line 112
    .line 113
    move v9, v2

    .line 114
    goto :goto_5

    .line 115
    :cond_9
    move v9, v3

    .line 116
    :goto_5
    move v12, v2

    .line 117
    :goto_6
    if-gt v12, v10, :cond_b

    .line 118
    .line 119
    if-nez v9, :cond_b

    .line 120
    .line 121
    sub-int v9, v4, v12

    .line 122
    .line 123
    aget-object v9, v1, v9

    .line 124
    .line 125
    if-eqz v9, :cond_a

    .line 126
    .line 127
    move v9, v2

    .line 128
    goto :goto_7

    .line 129
    :cond_a
    move v9, v3

    .line 130
    :goto_7
    add-int/lit8 v12, v12, 0x1

    .line 131
    .line 132
    goto :goto_6

    .line 133
    :cond_b
    if-eqz v9, :cond_c

    .line 134
    .line 135
    aput-object v11, v1, v4

    .line 136
    .line 137
    goto :goto_9

    .line 138
    :cond_c
    iget v5, v8, LK2/a;->f:I

    .line 139
    .line 140
    goto :goto_4

    .line 141
    :cond_d
    :goto_8
    aput-object v11, v1, v4

    .line 142
    .line 143
    :goto_9
    add-int/lit8 v4, v4, 0x1

    .line 144
    .line 145
    goto :goto_3

    .line 146
    :cond_e
    return-void
.end method

.method public b()V
    .locals 3

    .line 1
    iget-object v0, p0, LJ0/p;->e:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, LJ0/p;->c:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v1, Landroid/os/Handler;

    .line 7
    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    iget v1, p0, LJ0/p;->b:I

    .line 11
    .line 12
    if-lez v1, :cond_0

    .line 13
    .line 14
    new-instance v1, Landroid/os/HandlerThread;

    .line 15
    .line 16
    const-string v2, "CameraThread"

    .line 17
    .line 18
    invoke-direct {v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, LJ0/p;->d:Ljava/lang/Object;

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 24
    .line 25
    .line 26
    new-instance v1, Landroid/os/Handler;

    .line 27
    .line 28
    iget-object v2, p0, LJ0/p;->d:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v2, Landroid/os/HandlerThread;

    .line 31
    .line 32
    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 37
    .line 38
    .line 39
    iput-object v1, p0, LJ0/p;->c:Ljava/lang/Object;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catchall_0
    move-exception v1

    .line 43
    goto :goto_1

    .line 44
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 45
    .line 46
    const-string v2, "CameraThread is not open"

    .line 47
    .line 48
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    throw v1

    .line 52
    :cond_1
    :goto_0
    monitor-exit v0

    .line 53
    return-void

    .line 54
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    throw v1
.end method

.method public c(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    iget-object v0, p0, LJ0/p;->e:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-virtual {p0}, LJ0/p;->b()V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, LJ0/p;->c:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v1, Landroid/os/Handler;

    .line 10
    .line 11
    invoke-virtual {v1, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 12
    .line 13
    .line 14
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p1

    .line 17
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    throw p1
.end method

.method public declared-synchronized e(LJ0/n;)Li1/p;
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "MessengerIpcClient"

    .line 3
    .line 4
    const/4 v1, 0x3

    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, LJ0/n;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "Queueing "

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "MessengerIpcClient"

    .line 22
    .line 23
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :goto_0
    iget-object v0, p0, LJ0/p;->e:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast v0, LJ0/m;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, LJ0/m;->d(LJ0/n;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    new-instance v0, LJ0/m;

    .line 40
    .line 41
    invoke-direct {v0, p0}, LJ0/m;-><init>(LJ0/p;)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, LJ0/p;->e:Ljava/lang/Object;

    .line 45
    .line 46
    invoke-virtual {v0, p1}, LJ0/m;->d(LJ0/n;)Z

    .line 47
    .line 48
    .line 49
    :cond_1
    iget-object p1, p1, LJ0/n;->b:Li1/i;

    .line 50
    .line 51
    iget-object p1, p1, Li1/i;->a:Li1/p;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    .line 53
    monitor-exit p0

    .line 54
    return-object p1

    .line 55
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    throw p1
.end method

.method public toString()Ljava/lang/String;
    .locals 10

    .line 1
    iget v0, p0, LJ0/p;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    return-object v0

    .line 11
    :pswitch_0
    iget v0, p0, LJ0/p;->b:I

    .line 12
    .line 13
    iget-object v1, p0, LJ0/p;->d:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v1, [LA/c;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    aget-object v3, v1, v2

    .line 19
    .line 20
    if-nez v3, :cond_0

    .line 21
    .line 22
    add-int/lit8 v3, v0, 0x1

    .line 23
    .line 24
    aget-object v3, v1, v3

    .line 25
    .line 26
    :cond_0
    new-instance v4, Ljava/util/Formatter;

    .line 27
    .line 28
    invoke-direct {v4}, Ljava/util/Formatter;-><init>()V

    .line 29
    .line 30
    .line 31
    move v5, v2

    .line 32
    :goto_0
    :try_start_0
    iget-object v6, v3, LA/c;->g:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v6, [LK2/a;

    .line 35
    .line 36
    array-length v6, v6

    .line 37
    if-ge v5, v6, :cond_4

    .line 38
    .line 39
    const-string v6, "CW %3d:"

    .line 40
    .line 41
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object v7

    .line 45
    filled-new-array {v7}, [Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v7

    .line 49
    invoke-virtual {v4, v6, v7}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 50
    .line 51
    .line 52
    move v6, v2

    .line 53
    :goto_1
    add-int/lit8 v7, v0, 0x2

    .line 54
    .line 55
    if-ge v6, v7, :cond_3

    .line 56
    .line 57
    aget-object v7, v1, v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    .line 59
    const-string v8, "    |   "

    .line 60
    .line 61
    if-nez v7, :cond_1

    .line 62
    .line 63
    :try_start_1
    new-array v7, v2, [Ljava/lang/Object;

    .line 64
    .line 65
    invoke-virtual {v4, v8, v7}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 66
    .line 67
    .line 68
    goto :goto_2

    .line 69
    :catchall_0
    move-exception v0

    .line 70
    goto :goto_3

    .line 71
    :cond_1
    iget-object v7, v7, LA/c;->g:Ljava/lang/Object;

    .line 72
    .line 73
    check-cast v7, [LK2/a;

    .line 74
    .line 75
    aget-object v7, v7, v5

    .line 76
    .line 77
    if-nez v7, :cond_2

    .line 78
    .line 79
    new-array v7, v2, [Ljava/lang/Object;

    .line 80
    .line 81
    invoke-virtual {v4, v8, v7}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 82
    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_2
    const-string v8, " %3d|%3d"

    .line 86
    .line 87
    iget v9, v7, LK2/a;->f:I

    .line 88
    .line 89
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 90
    .line 91
    .line 92
    move-result-object v9

    .line 93
    iget v7, v7, LK2/a;->e:I

    .line 94
    .line 95
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 96
    .line 97
    .line 98
    move-result-object v7

    .line 99
    filled-new-array {v9, v7}, [Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v7

    .line 103
    invoke-virtual {v4, v8, v7}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 104
    .line 105
    .line 106
    :goto_2
    add-int/lit8 v6, v6, 0x1

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_3
    const-string v6, "%n"

    .line 110
    .line 111
    new-array v7, v2, [Ljava/lang/Object;

    .line 112
    .line 113
    invoke-virtual {v4, v6, v7}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 114
    .line 115
    .line 116
    add-int/lit8 v5, v5, 0x1

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_4
    invoke-virtual {v4}, Ljava/util/Formatter;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 123
    invoke-virtual {v4}, Ljava/util/Formatter;->close()V

    .line 124
    .line 125
    .line 126
    return-object v0

    .line 127
    :goto_3
    :try_start_2
    invoke-virtual {v4}, Ljava/util/Formatter;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 128
    .line 129
    .line 130
    goto :goto_4

    .line 131
    :catchall_1
    move-exception v1

    .line 132
    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 133
    .line 134
    .line 135
    :goto_4
    throw v0

    .line 136
    nop

    .line 137
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
