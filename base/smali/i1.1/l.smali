.class public final Li1/l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Li1/m;
.implements Li1/e;
.implements Li1/d;
.implements Li1/b;


# instance fields
.field public final synthetic e:I

.field public final f:Ljava/util/concurrent/Executor;

.field public final g:Ljava/lang/Object;

.field public final h:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;Li1/b;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Li1/l;->e:I

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Li1/l;->g:Ljava/lang/Object;

    iput-object p1, p0, Li1/l;->f:Ljava/util/concurrent/Executor;

    iput-object p2, p0, Li1/l;->h:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;Li1/c;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Li1/l;->e:I

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Li1/l;->g:Ljava/lang/Object;

    iput-object p1, p0, Li1/l;->f:Ljava/util/concurrent/Executor;

    iput-object p2, p0, Li1/l;->h:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;Li1/d;)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, Li1/l;->e:I

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Li1/l;->g:Ljava/lang/Object;

    iput-object p1, p0, Li1/l;->f:Ljava/util/concurrent/Executor;

    iput-object p2, p0, Li1/l;->h:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;Li1/e;)V
    .locals 1

    const/4 v0, 0x3

    iput v0, p0, Li1/l;->e:I

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Li1/l;->g:Ljava/lang/Object;

    iput-object p1, p0, Li1/l;->f:Ljava/util/concurrent/Executor;

    iput-object p2, p0, Li1/l;->h:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;Li1/g;Li1/p;)V
    .locals 1

    const/4 v0, 0x4

    iput v0, p0, Li1/l;->e:I

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Li1/l;->f:Ljava/util/concurrent/Executor;

    iput-object p2, p0, Li1/l;->g:Ljava/lang/Object;

    iput-object p3, p0, Li1/l;->h:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Li1/l;->h:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Li1/p;

    .line 4
    .line 5
    invoke-virtual {v0}, Li1/p;->m()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Li1/l;->h:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Li1/p;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Li1/p;->l(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final c(Li1/h;)V
    .locals 4

    .line 1
    iget v0, p0, Li1/l;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    new-instance v0, LA/a;

    .line 7
    .line 8
    const/16 v1, 0xc

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-direct {v0, p0, p1, v1, v2}, LA/a;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Li1/l;->f:Ljava/util/concurrent/Executor;

    .line 15
    .line 16
    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :pswitch_0
    invoke-virtual {p1}, Li1/h;->e()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Li1/l;->g:Ljava/lang/Object;

    .line 27
    .line 28
    monitor-enter v0

    .line 29
    :try_start_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    iget-object v0, p0, Li1/l;->f:Ljava/util/concurrent/Executor;

    .line 31
    .line 32
    new-instance v1, LA/a;

    .line 33
    .line 34
    const/16 v2, 0xb

    .line 35
    .line 36
    const/4 v3, 0x0

    .line 37
    invoke-direct {v1, p0, p1, v2, v3}, LA/a;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 38
    .line 39
    .line 40
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception p1

    .line 45
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 46
    throw p1

    .line 47
    :cond_0
    :goto_0
    return-void

    .line 48
    :pswitch_1
    invoke-virtual {p1}, Li1/h;->e()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_1

    .line 53
    .line 54
    move-object v0, p1

    .line 55
    check-cast v0, Li1/p;

    .line 56
    .line 57
    iget-boolean v0, v0, Li1/p;->d:Z

    .line 58
    .line 59
    if-nez v0, :cond_1

    .line 60
    .line 61
    iget-object v0, p0, Li1/l;->g:Ljava/lang/Object;

    .line 62
    .line 63
    monitor-enter v0

    .line 64
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 65
    iget-object v0, p0, Li1/l;->f:Ljava/util/concurrent/Executor;

    .line 66
    .line 67
    new-instance v1, LA/a;

    .line 68
    .line 69
    const/16 v2, 0xa

    .line 70
    .line 71
    const/4 v3, 0x0

    .line 72
    invoke-direct {v1, p0, p1, v2, v3}, LA/a;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 73
    .line 74
    .line 75
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :catchall_1
    move-exception p1

    .line 80
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 81
    throw p1

    .line 82
    :cond_1
    :goto_1
    return-void

    .line 83
    :pswitch_2
    iget-object v0, p0, Li1/l;->g:Ljava/lang/Object;

    .line 84
    .line 85
    monitor-enter v0

    .line 86
    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 87
    iget-object v0, p0, Li1/l;->f:Ljava/util/concurrent/Executor;

    .line 88
    .line 89
    new-instance v1, LA/a;

    .line 90
    .line 91
    const/16 v2, 0x9

    .line 92
    .line 93
    const/4 v3, 0x0

    .line 94
    invoke-direct {v1, p0, p1, v2, v3}, LA/a;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 95
    .line 96
    .line 97
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :catchall_2
    move-exception p1

    .line 102
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 103
    throw p1

    .line 104
    :pswitch_3
    check-cast p1, Li1/p;

    .line 105
    .line 106
    iget-boolean p1, p1, Li1/p;->d:Z

    .line 107
    .line 108
    if-eqz p1, :cond_2

    .line 109
    .line 110
    iget-object p1, p0, Li1/l;->g:Ljava/lang/Object;

    .line 111
    .line 112
    monitor-enter p1

    .line 113
    :try_start_6
    monitor-exit p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 114
    iget-object p1, p0, Li1/l;->f:Ljava/util/concurrent/Executor;

    .line 115
    .line 116
    new-instance v0, LA/b;

    .line 117
    .line 118
    const/16 v1, 0xc

    .line 119
    .line 120
    invoke-direct {v0, v1, p0}, LA/b;-><init>(ILjava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 124
    .line 125
    .line 126
    goto :goto_2

    .line 127
    :catchall_3
    move-exception v0

    .line 128
    :try_start_7
    monitor-exit p1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 129
    throw v0

    .line 130
    :cond_2
    :goto_2
    return-void

    .line 131
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public d(Ljava/lang/Exception;)V
    .locals 1

    .line 1
    iget-object v0, p0, Li1/l;->h:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Li1/p;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Li1/p;->k(Ljava/lang/Exception;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
