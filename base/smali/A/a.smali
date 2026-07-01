.class public final LA/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:I

.field public f:Ljava/lang/Object;

.field public final synthetic g:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, LA/a;->e:I

    iput-object p2, p0, LA/a;->f:Ljava/lang/Object;

    iput-object p3, p0, LA/a;->g:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(LE1/k;)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, LA/a;->e:I

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LA/a;->g:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V
    .locals 0

    .line 2
    iput p3, p0, LA/a;->e:I

    iput-object p1, p0, LA/a;->g:Ljava/lang/Object;

    iput-object p2, p0, LA/a;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a()V
    .locals 3

    .line 1
    iget-object v0, p0, LA/a;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Li1/l;

    .line 4
    .line 5
    iget-object v0, v0, Li1/l;->g:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, LA/a;->g:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v1, Li1/l;

    .line 11
    .line 12
    iget-object v1, v1, Li1/l;->h:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v1, Li1/c;

    .line 15
    .line 16
    iget-object v2, p0, LA/a;->f:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v2, Li1/h;

    .line 19
    .line 20
    invoke-interface {v1, v2}, Li1/c;->f(Li1/h;)V

    .line 21
    .line 22
    .line 23
    monitor-exit v0

    .line 24
    return-void

    .line 25
    :catchall_0
    move-exception v1

    .line 26
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    throw v1
.end method

.method private final b()V
    .locals 3

    .line 1
    iget-object v0, p0, LA/a;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Li1/l;

    .line 4
    .line 5
    iget-object v0, v0, Li1/l;->g:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, LA/a;->g:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v1, Li1/l;

    .line 11
    .line 12
    iget-object v1, v1, Li1/l;->h:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v1, Li1/d;

    .line 15
    .line 16
    iget-object v2, p0, LA/a;->f:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v2, Li1/h;

    .line 19
    .line 20
    invoke-virtual {v2}, Li1/h;->b()Ljava/lang/Exception;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-static {v2}, LN0/n;->e(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    invoke-interface {v1, v2}, Li1/d;->d(Ljava/lang/Exception;)V

    .line 28
    .line 29
    .line 30
    monitor-exit v0

    .line 31
    return-void

    .line 32
    :catchall_0
    move-exception v1

    .line 33
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    throw v1
.end method

.method private final c()V
    .locals 3

    .line 1
    iget-object v0, p0, LA/a;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Li1/l;

    .line 4
    .line 5
    iget-object v0, v0, Li1/l;->g:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, LA/a;->g:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v1, Li1/l;

    .line 11
    .line 12
    iget-object v1, v1, Li1/l;->h:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v1, Li1/e;

    .line 15
    .line 16
    iget-object v2, p0, LA/a;->f:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v2, Li1/h;

    .line 19
    .line 20
    invoke-virtual {v2}, Li1/h;->c()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-interface {v1, v2}, Li1/e;->b(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    monitor-exit v0

    .line 28
    return-void

    .line 29
    :catchall_0
    move-exception v1

    .line 30
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw v1
.end method


# virtual methods
.method public d()V
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    :try_start_0
    iget-object v2, p0, LA/a;->g:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v2, LE1/k;

    .line 6
    .line 7
    iget-object v2, v2, LE1/k;->f:Ljava/util/ArrayDeque;

    .line 8
    .line 9
    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 10
    const/4 v3, 0x1

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    :try_start_1
    iget-object v0, p0, LA/a;->g:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, LE1/k;

    .line 16
    .line 17
    iget v4, v0, LE1/k;->g:I

    .line 18
    .line 19
    const/4 v5, 0x4

    .line 20
    if-ne v4, v5, :cond_0

    .line 21
    .line 22
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    :goto_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 30
    .line 31
    .line 32
    goto :goto_2

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    goto :goto_5

    .line 35
    :cond_0
    :try_start_2
    iget-wide v6, v0, LE1/k;->h:J

    .line 36
    .line 37
    const-wide/16 v8, 0x1

    .line 38
    .line 39
    add-long/2addr v6, v8

    .line 40
    iput-wide v6, v0, LE1/k;->h:J

    .line 41
    .line 42
    iput v5, v0, LE1/k;->g:I

    .line 43
    .line 44
    move v0, v3

    .line 45
    :cond_1
    iget-object v4, p0, LA/a;->g:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast v4, LE1/k;

    .line 48
    .line 49
    iget-object v4, v4, LE1/k;->f:Ljava/util/ArrayDeque;

    .line 50
    .line 51
    invoke-virtual {v4}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    check-cast v4, Ljava/lang/Runnable;

    .line 56
    .line 57
    iput-object v4, p0, LA/a;->f:Ljava/lang/Object;

    .line 58
    .line 59
    if-nez v4, :cond_3

    .line 60
    .line 61
    iget-object v0, p0, LA/a;->g:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast v0, LE1/k;

    .line 64
    .line 65
    iput v3, v0, LE1/k;->g:I

    .line 66
    .line 67
    monitor-exit v2

    .line 68
    if-eqz v1, :cond_2

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_2
    :goto_2
    return-void

    .line 72
    :cond_3
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 73
    :try_start_3
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 74
    .line 75
    .line 76
    move-result v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 77
    or-int/2addr v1, v2

    .line 78
    const/4 v2, 0x0

    .line 79
    :try_start_4
    iget-object v3, p0, LA/a;->f:Ljava/lang/Object;

    .line 80
    .line 81
    check-cast v3, Ljava/lang/Runnable;

    .line 82
    .line 83
    invoke-interface {v3}, Ljava/lang/Runnable;->run()V
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 84
    .line 85
    .line 86
    :goto_3
    :try_start_5
    iput-object v2, p0, LA/a;->f:Ljava/lang/Object;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :catchall_1
    move-exception v0

    .line 90
    goto :goto_6

    .line 91
    :catchall_2
    move-exception v0

    .line 92
    goto :goto_4

    .line 93
    :catch_0
    move-exception v3

    .line 94
    :try_start_6
    sget-object v4, LE1/k;->j:Ljava/util/logging/Logger;

    .line 95
    .line 96
    sget-object v5, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    .line 97
    .line 98
    new-instance v6, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 101
    .line 102
    .line 103
    const-string v7, "Exception while executing runnable "

    .line 104
    .line 105
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget-object v7, p0, LA/a;->f:Ljava/lang/Object;

    .line 109
    .line 110
    check-cast v7, Ljava/lang/Runnable;

    .line 111
    .line 112
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v6

    .line 119
    invoke-virtual {v4, v5, v6, v3}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 120
    .line 121
    .line 122
    goto :goto_3

    .line 123
    :goto_4
    :try_start_7
    iput-object v2, p0, LA/a;->f:Ljava/lang/Object;

    .line 124
    .line 125
    throw v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 126
    :goto_5
    :try_start_8
    monitor-exit v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 127
    :try_start_9
    throw v0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 128
    :goto_6
    if-eqz v1, :cond_4

    .line 129
    .line 130
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 135
    .line 136
    .line 137
    :cond_4
    throw v0
.end method

.method public final run()V
    .locals 6

    .line 1
    iget v0, p0, LA/a;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LA/a;->f:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lm/g;

    .line 9
    .line 10
    iget-object v1, p0, LA/a;->g:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v1, Lm/j;

    .line 13
    .line 14
    iget-object v2, v1, Lm/j;->g:Ll/i;

    .line 15
    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    iget-object v3, v2, Ll/i;->e:Lj3/b;

    .line 19
    .line 20
    if-eqz v3, :cond_0

    .line 21
    .line 22
    invoke-virtual {v3, v2}, Lj3/b;->s(Ll/i;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v2, v1, Lm/j;->k:Landroidx/appcompat/widget/ActionMenuView;

    .line 26
    .line 27
    if-eqz v2, :cond_3

    .line 28
    .line 29
    invoke-virtual {v2}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    if-eqz v2, :cond_3

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/m;->b()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    iget-object v2, v0, Ll/m;->e:Landroid/view/View;

    .line 43
    .line 44
    if-nez v2, :cond_2

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    const/4 v2, 0x0

    .line 48
    invoke-virtual {v0, v2, v2, v2, v2}, Ll/m;->d(IIZZ)V

    .line 49
    .line 50
    .line 51
    :goto_0
    iput-object v0, v1, Lm/j;->v:Lm/g;

    .line 52
    .line 53
    :cond_3
    :goto_1
    const/4 v0, 0x0

    .line 54
    iput-object v0, v1, Lm/j;->x:LA/a;

    .line 55
    .line 56
    return-void

    .line 57
    :pswitch_0
    iget-object v0, p0, LA/a;->f:Ljava/lang/Object;

    .line 58
    .line 59
    check-cast v0, Li1/p;

    .line 60
    .line 61
    :try_start_0
    iget-object v1, p0, LA/a;->g:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast v1, Ljava/util/concurrent/Callable;

    .line 64
    .line 65
    invoke-interface {v1}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v0, v1}, Li1/p;->l(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    .line 71
    .line 72
    goto :goto_4

    .line 73
    :catchall_0
    move-exception v1

    .line 74
    goto :goto_2

    .line 75
    :catch_0
    move-exception v1

    .line 76
    goto :goto_3

    .line 77
    :goto_2
    new-instance v2, Ljava/lang/RuntimeException;

    .line 78
    .line 79
    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, v2}, Li1/p;->k(Ljava/lang/Exception;)V

    .line 83
    .line 84
    .line 85
    goto :goto_4

    .line 86
    :goto_3
    invoke-virtual {v0, v1}, Li1/p;->k(Ljava/lang/Exception;)V

    .line 87
    .line 88
    .line 89
    :goto_4
    return-void

    .line 90
    :pswitch_1
    iget-object v0, p0, LA/a;->g:Ljava/lang/Object;

    .line 91
    .line 92
    check-cast v0, Li1/l;

    .line 93
    .line 94
    :try_start_1
    iget-object v1, v0, Li1/l;->g:Ljava/lang/Object;

    .line 95
    .line 96
    check-cast v1, Li1/g;

    .line 97
    .line 98
    iget-object v2, p0, LA/a;->f:Ljava/lang/Object;

    .line 99
    .line 100
    check-cast v2, Li1/h;

    .line 101
    .line 102
    invoke-virtual {v2}, Li1/h;->c()Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    invoke-interface {v1, v2}, Li1/g;->a(Ljava/lang/Object;)Li1/p;

    .line 107
    .line 108
    .line 109
    move-result-object v1
    :try_end_1
    .catch Li1/f; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/util/concurrent/CancellationException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 110
    if-nez v1, :cond_4

    .line 111
    .line 112
    new-instance v1, Ljava/lang/NullPointerException;

    .line 113
    .line 114
    const-string v2, "Continuation returned null"

    .line 115
    .line 116
    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0, v1}, Li1/l;->d(Ljava/lang/Exception;)V

    .line 120
    .line 121
    .line 122
    goto :goto_7

    .line 123
    :cond_4
    iget-object v2, v1, Li1/p;->b:LM0/t;

    .line 124
    .line 125
    sget-object v3, Li1/j;->b:Li1/n;

    .line 126
    .line 127
    invoke-virtual {v1, v3, v0}, Li1/p;->a(Ljava/util/concurrent/Executor;Li1/e;)Li1/p;

    .line 128
    .line 129
    .line 130
    new-instance v4, Li1/l;

    .line 131
    .line 132
    invoke-direct {v4, v3, v0}, Li1/l;-><init>(Ljava/util/concurrent/Executor;Li1/d;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v2, v4}, LM0/t;->d(Li1/m;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v1}, Li1/p;->o()V

    .line 139
    .line 140
    .line 141
    new-instance v4, Li1/l;

    .line 142
    .line 143
    invoke-direct {v4, v3, v0}, Li1/l;-><init>(Ljava/util/concurrent/Executor;Li1/b;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v2, v4}, LM0/t;->d(Li1/m;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v1}, Li1/p;->o()V

    .line 150
    .line 151
    .line 152
    goto :goto_7

    .line 153
    :catch_1
    move-exception v1

    .line 154
    goto :goto_5

    .line 155
    :catch_2
    move-exception v1

    .line 156
    goto :goto_6

    .line 157
    :goto_5
    invoke-virtual {v0, v1}, Li1/l;->d(Ljava/lang/Exception;)V

    .line 158
    .line 159
    .line 160
    goto :goto_7

    .line 161
    :catch_3
    invoke-virtual {v0}, Li1/l;->a()V

    .line 162
    .line 163
    .line 164
    goto :goto_7

    .line 165
    :goto_6
    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    instance-of v2, v2, Ljava/lang/Exception;

    .line 170
    .line 171
    if-eqz v2, :cond_5

    .line 172
    .line 173
    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    check-cast v1, Ljava/lang/Exception;

    .line 178
    .line 179
    invoke-virtual {v0, v1}, Li1/l;->d(Ljava/lang/Exception;)V

    .line 180
    .line 181
    .line 182
    goto :goto_7

    .line 183
    :cond_5
    invoke-virtual {v0, v1}, Li1/l;->d(Ljava/lang/Exception;)V

    .line 184
    .line 185
    .line 186
    :goto_7
    return-void

    .line 187
    :pswitch_2
    invoke-direct {p0}, LA/a;->c()V

    .line 188
    .line 189
    .line 190
    return-void

    .line 191
    :pswitch_3
    invoke-direct {p0}, LA/a;->b()V

    .line 192
    .line 193
    .line 194
    return-void

    .line 195
    :pswitch_4
    invoke-direct {p0}, LA/a;->a()V

    .line 196
    .line 197
    .line 198
    return-void

    .line 199
    :pswitch_5
    iget-object v0, p0, LA/a;->g:Ljava/lang/Object;

    .line 200
    .line 201
    check-cast v0, Li1/k;

    .line 202
    .line 203
    iget-object v1, v0, Li1/k;->h:Li1/p;

    .line 204
    .line 205
    :try_start_2
    iget-object v2, v0, Li1/k;->g:Li1/a;

    .line 206
    .line 207
    iget-object v3, p0, LA/a;->f:Ljava/lang/Object;

    .line 208
    .line 209
    check-cast v3, Li1/h;

    .line 210
    .line 211
    invoke-interface {v2, v3}, Li1/a;->e(Li1/h;)Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    check-cast v2, Li1/h;
    :try_end_2
    .catch Li1/f; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4

    .line 216
    .line 217
    if-nez v2, :cond_6

    .line 218
    .line 219
    new-instance v1, Ljava/lang/NullPointerException;

    .line 220
    .line 221
    const-string v2, "Continuation returned null"

    .line 222
    .line 223
    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 224
    .line 225
    .line 226
    invoke-virtual {v0, v1}, Li1/k;->d(Ljava/lang/Exception;)V

    .line 227
    .line 228
    .line 229
    goto :goto_a

    .line 230
    :cond_6
    sget-object v1, Li1/j;->b:Li1/n;

    .line 231
    .line 232
    invoke-virtual {v2, v1, v0}, Li1/h;->a(Ljava/util/concurrent/Executor;Li1/e;)Li1/p;

    .line 233
    .line 234
    .line 235
    check-cast v2, Li1/p;

    .line 236
    .line 237
    iget-object v3, v2, Li1/p;->b:LM0/t;

    .line 238
    .line 239
    new-instance v4, Li1/l;

    .line 240
    .line 241
    invoke-direct {v4, v1, v0}, Li1/l;-><init>(Ljava/util/concurrent/Executor;Li1/d;)V

    .line 242
    .line 243
    .line 244
    invoke-virtual {v3, v4}, LM0/t;->d(Li1/m;)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {v2}, Li1/p;->o()V

    .line 248
    .line 249
    .line 250
    new-instance v4, Li1/l;

    .line 251
    .line 252
    invoke-direct {v4, v1, v0}, Li1/l;-><init>(Ljava/util/concurrent/Executor;Li1/b;)V

    .line 253
    .line 254
    .line 255
    invoke-virtual {v3, v4}, LM0/t;->d(Li1/m;)V

    .line 256
    .line 257
    .line 258
    invoke-virtual {v2}, Li1/p;->o()V

    .line 259
    .line 260
    .line 261
    goto :goto_a

    .line 262
    :catch_4
    move-exception v0

    .line 263
    goto :goto_8

    .line 264
    :catch_5
    move-exception v0

    .line 265
    goto :goto_9

    .line 266
    :goto_8
    invoke-virtual {v1, v0}, Li1/p;->k(Ljava/lang/Exception;)V

    .line 267
    .line 268
    .line 269
    goto :goto_a

    .line 270
    :goto_9
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 271
    .line 272
    .line 273
    move-result-object v2

    .line 274
    instance-of v2, v2, Ljava/lang/Exception;

    .line 275
    .line 276
    if-eqz v2, :cond_7

    .line 277
    .line 278
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    check-cast v0, Ljava/lang/Exception;

    .line 283
    .line 284
    invoke-virtual {v1, v0}, Li1/p;->k(Ljava/lang/Exception;)V

    .line 285
    .line 286
    .line 287
    goto :goto_a

    .line 288
    :cond_7
    invoke-virtual {v1, v0}, Li1/p;->k(Ljava/lang/Exception;)V

    .line 289
    .line 290
    .line 291
    :goto_a
    return-void

    .line 292
    :pswitch_6
    iget-object v0, p0, LA/a;->f:Ljava/lang/Object;

    .line 293
    .line 294
    check-cast v0, Li1/h;

    .line 295
    .line 296
    check-cast v0, Li1/p;

    .line 297
    .line 298
    iget-boolean v0, v0, Li1/p;->d:Z

    .line 299
    .line 300
    if-eqz v0, :cond_8

    .line 301
    .line 302
    iget-object v0, p0, LA/a;->g:Ljava/lang/Object;

    .line 303
    .line 304
    check-cast v0, Li1/k;

    .line 305
    .line 306
    iget-object v0, v0, Li1/k;->h:Li1/p;

    .line 307
    .line 308
    invoke-virtual {v0}, Li1/p;->m()V

    .line 309
    .line 310
    .line 311
    goto :goto_d

    .line 312
    :cond_8
    :try_start_3
    iget-object v0, p0, LA/a;->g:Ljava/lang/Object;

    .line 313
    .line 314
    check-cast v0, Li1/k;

    .line 315
    .line 316
    iget-object v0, v0, Li1/k;->g:Li1/a;

    .line 317
    .line 318
    iget-object v1, p0, LA/a;->f:Ljava/lang/Object;

    .line 319
    .line 320
    check-cast v1, Li1/h;

    .line 321
    .line 322
    invoke-interface {v0, v1}, Li1/a;->e(Li1/h;)Ljava/lang/Object;

    .line 323
    .line 324
    .line 325
    move-result-object v0
    :try_end_3
    .catch Li1/f; {:try_start_3 .. :try_end_3} :catch_7
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_6

    .line 326
    iget-object v1, p0, LA/a;->g:Ljava/lang/Object;

    .line 327
    .line 328
    check-cast v1, Li1/k;

    .line 329
    .line 330
    iget-object v1, v1, Li1/k;->h:Li1/p;

    .line 331
    .line 332
    invoke-virtual {v1, v0}, Li1/p;->l(Ljava/lang/Object;)V

    .line 333
    .line 334
    .line 335
    goto :goto_d

    .line 336
    :catch_6
    move-exception v0

    .line 337
    goto :goto_b

    .line 338
    :catch_7
    move-exception v0

    .line 339
    goto :goto_c

    .line 340
    :goto_b
    iget-object v1, p0, LA/a;->g:Ljava/lang/Object;

    .line 341
    .line 342
    check-cast v1, Li1/k;

    .line 343
    .line 344
    iget-object v1, v1, Li1/k;->h:Li1/p;

    .line 345
    .line 346
    invoke-virtual {v1, v0}, Li1/p;->k(Ljava/lang/Exception;)V

    .line 347
    .line 348
    .line 349
    goto :goto_d

    .line 350
    :goto_c
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 351
    .line 352
    .line 353
    move-result-object v1

    .line 354
    instance-of v1, v1, Ljava/lang/Exception;

    .line 355
    .line 356
    if-eqz v1, :cond_9

    .line 357
    .line 358
    iget-object v1, p0, LA/a;->g:Ljava/lang/Object;

    .line 359
    .line 360
    check-cast v1, Li1/k;

    .line 361
    .line 362
    iget-object v1, v1, Li1/k;->h:Li1/p;

    .line 363
    .line 364
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 365
    .line 366
    .line 367
    move-result-object v0

    .line 368
    check-cast v0, Ljava/lang/Exception;

    .line 369
    .line 370
    invoke-virtual {v1, v0}, Li1/p;->k(Ljava/lang/Exception;)V

    .line 371
    .line 372
    .line 373
    goto :goto_d

    .line 374
    :cond_9
    iget-object v1, p0, LA/a;->g:Ljava/lang/Object;

    .line 375
    .line 376
    check-cast v1, Li1/k;

    .line 377
    .line 378
    iget-object v1, v1, Li1/k;->h:Li1/p;

    .line 379
    .line 380
    invoke-virtual {v1, v0}, Li1/p;->k(Ljava/lang/Exception;)V

    .line 381
    .line 382
    .line 383
    :goto_d
    return-void

    .line 384
    :pswitch_7
    const/4 v0, 0x0

    .line 385
    :cond_a
    :try_start_4
    iget-object v1, p0, LA/a;->f:Ljava/lang/Object;

    .line 386
    .line 387
    check-cast v1, Ljava/lang/Runnable;

    .line 388
    .line 389
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 390
    .line 391
    .line 392
    goto :goto_e

    .line 393
    :catchall_1
    move-exception v1

    .line 394
    :try_start_5
    sget-object v2, LA3/j;->e:LA3/j;

    .line 395
    .line 396
    invoke-static {v2, v1}, LN3/v;->e(LA3/i;Ljava/lang/Throwable;)V

    .line 397
    .line 398
    .line 399
    :goto_e
    iget-object v1, p0, LA/a;->g:Ljava/lang/Object;

    .line 400
    .line 401
    check-cast v1, LS3/h;

    .line 402
    .line 403
    invoke-virtual {v1}, LS3/h;->g()Ljava/lang/Runnable;

    .line 404
    .line 405
    .line 406
    move-result-object v1

    .line 407
    if-nez v1, :cond_b

    .line 408
    .line 409
    goto :goto_f

    .line 410
    :cond_b
    iput-object v1, p0, LA/a;->f:Ljava/lang/Object;

    .line 411
    .line 412
    add-int/lit8 v0, v0, 0x1

    .line 413
    .line 414
    const/16 v1, 0x10

    .line 415
    .line 416
    if-lt v0, v1, :cond_a

    .line 417
    .line 418
    iget-object v1, p0, LA/a;->g:Ljava/lang/Object;

    .line 419
    .line 420
    check-cast v1, LS3/h;

    .line 421
    .line 422
    iget-object v2, v1, LS3/h;->g:LN3/r;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 423
    .line 424
    :try_start_6
    invoke-virtual {v2, v1}, LN3/r;->e(LA3/i;)Z

    .line 425
    .line 426
    .line 427
    move-result v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 428
    if-eqz v1, :cond_a

    .line 429
    .line 430
    :try_start_7
    iget-object v0, p0, LA/a;->g:Ljava/lang/Object;

    .line 431
    .line 432
    check-cast v0, LS3/h;

    .line 433
    .line 434
    iget-object v1, v0, LS3/h;->g:LN3/r;

    .line 435
    .line 436
    invoke-static {v1, v0, p0}, LS3/b;->i(LN3/r;LA3/i;Ljava/lang/Runnable;)V

    .line 437
    .line 438
    .line 439
    :goto_f
    return-void

    .line 440
    :catchall_2
    move-exception v0

    .line 441
    goto :goto_10

    .line 442
    :catchall_3
    move-exception v0

    .line 443
    new-instance v3, LN3/z;

    .line 444
    .line 445
    invoke-direct {v3, v0, v2, v1}, LN3/z;-><init>(Ljava/lang/Throwable;LN3/r;LA3/i;)V

    .line 446
    .line 447
    .line 448
    throw v3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 449
    :goto_10
    iget-object v1, p0, LA/a;->g:Ljava/lang/Object;

    .line 450
    .line 451
    check-cast v1, LS3/h;

    .line 452
    .line 453
    iget-object v2, v1, LS3/h;->j:Ljava/lang/Object;

    .line 454
    .line 455
    monitor-enter v2

    .line 456
    :try_start_8
    sget-object v3, LS3/h;->k:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 457
    .line 458
    invoke-virtual {v3, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->decrementAndGet(Ljava/lang/Object;)I
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 459
    .line 460
    .line 461
    monitor-exit v2

    .line 462
    throw v0

    .line 463
    :catchall_4
    move-exception v0

    .line 464
    monitor-exit v2

    .line 465
    throw v0

    .line 466
    :pswitch_8
    iget-object v0, p0, LA/a;->f:Ljava/lang/Object;

    .line 467
    .line 468
    check-cast v0, LK0/a;

    .line 469
    .line 470
    iget-object v1, p0, LA/a;->g:Ljava/lang/Object;

    .line 471
    .line 472
    check-cast v1, LM0/l;

    .line 473
    .line 474
    iget-object v2, v1, LM0/l;->a:LL0/a;

    .line 475
    .line 476
    iget-object v3, v1, LM0/l;->f:LM0/d;

    .line 477
    .line 478
    iget-object v3, v3, LM0/d;->j:Ljava/util/concurrent/ConcurrentHashMap;

    .line 479
    .line 480
    iget-object v4, v1, LM0/l;->b:LM0/a;

    .line 481
    .line 482
    invoke-virtual {v3, v4}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 483
    .line 484
    .line 485
    move-result-object v3

    .line 486
    check-cast v3, LM0/j;

    .line 487
    .line 488
    if-nez v3, :cond_c

    .line 489
    .line 490
    goto :goto_11

    .line 491
    :cond_c
    iget v4, v0, LK0/a;->f:I

    .line 492
    .line 493
    const/4 v5, 0x0

    .line 494
    if-nez v4, :cond_e

    .line 495
    .line 496
    const/4 v0, 0x1

    .line 497
    iput-boolean v0, v1, LM0/l;->e:Z

    .line 498
    .line 499
    invoke-interface {v2}, LL0/a;->n()Z

    .line 500
    .line 501
    .line 502
    move-result v0

    .line 503
    if-eqz v0, :cond_d

    .line 504
    .line 505
    iget-boolean v0, v1, LM0/l;->e:Z

    .line 506
    .line 507
    if-eqz v0, :cond_f

    .line 508
    .line 509
    iget-object v0, v1, LM0/l;->c:LN0/d;

    .line 510
    .line 511
    if-eqz v0, :cond_f

    .line 512
    .line 513
    iget-object v1, v1, LM0/l;->d:Ljava/util/Set;

    .line 514
    .line 515
    invoke-interface {v2, v0, v1}, LL0/a;->f(LN0/d;Ljava/util/Set;)V

    .line 516
    .line 517
    .line 518
    goto :goto_11

    .line 519
    :cond_d
    :try_start_9
    invoke-interface {v2}, LL0/a;->c()Ljava/util/Set;

    .line 520
    .line 521
    .line 522
    move-result-object v0

    .line 523
    invoke-interface {v2, v5, v0}, LL0/a;->f(LN0/d;Ljava/util/Set;)V
    :try_end_9
    .catch Ljava/lang/SecurityException; {:try_start_9 .. :try_end_9} :catch_8

    .line 524
    .line 525
    .line 526
    goto :goto_11

    .line 527
    :catch_8
    move-exception v0

    .line 528
    const-string v1, "GoogleApiManager"

    .line 529
    .line 530
    const-string v4, "Failed to get service from broker. "

    .line 531
    .line 532
    invoke-static {v1, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 533
    .line 534
    .line 535
    const-string v0, "Failed to get service from broker."

    .line 536
    .line 537
    invoke-interface {v2, v0}, LL0/a;->e(Ljava/lang/String;)V

    .line 538
    .line 539
    .line 540
    new-instance v0, LK0/a;

    .line 541
    .line 542
    const/16 v1, 0xa

    .line 543
    .line 544
    invoke-direct {v0, v1, v5, v5}, LK0/a;-><init>(ILandroid/app/PendingIntent;Ljava/lang/String;)V

    .line 545
    .line 546
    .line 547
    invoke-virtual {v3, v0, v5}, LM0/j;->o(LK0/a;Ljava/lang/RuntimeException;)V

    .line 548
    .line 549
    .line 550
    goto :goto_11

    .line 551
    :cond_e
    invoke-virtual {v3, v0, v5}, LM0/j;->o(LK0/a;Ljava/lang/RuntimeException;)V

    .line 552
    .line 553
    .line 554
    :cond_f
    :goto_11
    return-void

    .line 555
    :pswitch_9
    iget-object v0, p0, LA/a;->f:Ljava/lang/Object;

    .line 556
    .line 557
    check-cast v0, LJ0/m;

    .line 558
    .line 559
    iget-object v1, p0, LA/a;->g:Ljava/lang/Object;

    .line 560
    .line 561
    check-cast v1, LJ0/n;

    .line 562
    .line 563
    iget v1, v1, LJ0/n;->a:I

    .line 564
    .line 565
    const-string v2, "Timing out request: "

    .line 566
    .line 567
    monitor-enter v0

    .line 568
    :try_start_a
    iget-object v3, v0, LJ0/m;->e:Landroid/util/SparseArray;

    .line 569
    .line 570
    invoke-virtual {v3, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 571
    .line 572
    .line 573
    move-result-object v3

    .line 574
    check-cast v3, LJ0/n;

    .line 575
    .line 576
    if-eqz v3, :cond_10

    .line 577
    .line 578
    new-instance v4, Ljava/lang/StringBuilder;

    .line 579
    .line 580
    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 581
    .line 582
    .line 583
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 584
    .line 585
    .line 586
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 587
    .line 588
    .line 589
    move-result-object v2

    .line 590
    const-string v4, "MessengerIpcClient"

    .line 591
    .line 592
    invoke-static {v4, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 593
    .line 594
    .line 595
    iget-object v2, v0, LJ0/m;->e:Landroid/util/SparseArray;

    .line 596
    .line 597
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->remove(I)V

    .line 598
    .line 599
    .line 600
    const-string v1, "Timed out waiting for response"

    .line 601
    .line 602
    new-instance v2, LJ0/o;

    .line 603
    .line 604
    const/4 v4, 0x0

    .line 605
    invoke-direct {v2, v1, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 606
    .line 607
    .line 608
    invoke-virtual {v3, v2}, LJ0/n;->b(LJ0/o;)V

    .line 609
    .line 610
    .line 611
    invoke-virtual {v0}, LJ0/m;->c()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    .line 612
    .line 613
    .line 614
    :cond_10
    monitor-exit v0

    .line 615
    goto :goto_12

    .line 616
    :catchall_5
    move-exception v1

    .line 617
    goto :goto_13

    .line 618
    :goto_12
    return-void

    .line 619
    :goto_13
    :try_start_b
    monitor-exit v0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    .line 620
    throw v1

    .line 621
    :pswitch_a
    iget-object v0, p0, LA/a;->f:Ljava/lang/Object;

    .line 622
    .line 623
    check-cast v0, LJ0/m;

    .line 624
    .line 625
    iget-object v1, p0, LA/a;->g:Ljava/lang/Object;

    .line 626
    .line 627
    check-cast v1, Landroid/os/IBinder;

    .line 628
    .line 629
    monitor-enter v0

    .line 630
    if-nez v1, :cond_11

    .line 631
    .line 632
    :try_start_c
    const-string v1, "Null service connection"

    .line 633
    .line 634
    invoke-virtual {v0, v1}, LJ0/m;->a(Ljava/lang/String;)V

    .line 635
    .line 636
    .line 637
    monitor-exit v0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_6

    .line 638
    goto :goto_14

    .line 639
    :catchall_6
    move-exception v1

    .line 640
    goto :goto_15

    .line 641
    :cond_11
    :try_start_d
    new-instance v2, LA/c;

    .line 642
    .line 643
    invoke-direct {v2, v1}, LA/c;-><init>(Landroid/os/IBinder;)V

    .line 644
    .line 645
    .line 646
    iput-object v2, v0, LJ0/m;->c:LA/c;
    :try_end_d
    .catch Landroid/os/RemoteException; {:try_start_d .. :try_end_d} :catch_9
    .catchall {:try_start_d .. :try_end_d} :catchall_6

    .line 647
    .line 648
    const/4 v1, 0x2

    .line 649
    :try_start_e
    iput v1, v0, LJ0/m;->a:I

    .line 650
    .line 651
    iget-object v1, v0, LJ0/m;->f:LJ0/p;

    .line 652
    .line 653
    iget-object v1, v1, LJ0/p;->d:Ljava/lang/Object;

    .line 654
    .line 655
    check-cast v1, Ljava/util/concurrent/ScheduledExecutorService;

    .line 656
    .line 657
    new-instance v2, LJ0/k;

    .line 658
    .line 659
    const/4 v3, 0x0

    .line 660
    invoke-direct {v2, v0, v3}, LJ0/k;-><init>(LJ0/m;I)V

    .line 661
    .line 662
    .line 663
    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 664
    .line 665
    .line 666
    monitor-exit v0

    .line 667
    goto :goto_14

    .line 668
    :catch_9
    move-exception v1

    .line 669
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 670
    .line 671
    .line 672
    move-result-object v1

    .line 673
    invoke-virtual {v0, v1}, LJ0/m;->a(Ljava/lang/String;)V

    .line 674
    .line 675
    .line 676
    monitor-exit v0

    .line 677
    :goto_14
    return-void

    .line 678
    :goto_15
    monitor-exit v0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_6

    .line 679
    throw v1

    .line 680
    :pswitch_b
    :try_start_f
    invoke-virtual {p0}, LA/a;->d()V
    :try_end_f
    .catch Ljava/lang/Error; {:try_start_f .. :try_end_f} :catch_a

    .line 681
    .line 682
    .line 683
    return-void

    .line 684
    :catch_a
    move-exception v0

    .line 685
    iget-object v1, p0, LA/a;->g:Ljava/lang/Object;

    .line 686
    .line 687
    check-cast v1, LE1/k;

    .line 688
    .line 689
    iget-object v1, v1, LE1/k;->f:Ljava/util/ArrayDeque;

    .line 690
    .line 691
    monitor-enter v1

    .line 692
    :try_start_10
    iget-object v2, p0, LA/a;->g:Ljava/lang/Object;

    .line 693
    .line 694
    check-cast v2, LE1/k;

    .line 695
    .line 696
    const/4 v3, 0x1

    .line 697
    iput v3, v2, LE1/k;->g:I

    .line 698
    .line 699
    monitor-exit v1
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_7

    .line 700
    throw v0

    .line 701
    :catchall_7
    move-exception v0

    .line 702
    :try_start_11
    monitor-exit v1
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_7

    .line 703
    throw v0

    .line 704
    :pswitch_c
    iget-object v0, p0, LA/a;->f:Ljava/lang/Object;

    .line 705
    .line 706
    check-cast v0, LA/i;

    .line 707
    .line 708
    iget-object v1, p0, LA/a;->g:Ljava/lang/Object;

    .line 709
    .line 710
    invoke-virtual {v0, v1}, LA/i;->accept(Ljava/lang/Object;)V

    .line 711
    .line 712
    .line 713
    return-void

    .line 714
    :pswitch_d
    iget-object v0, p0, LA/a;->f:Ljava/lang/Object;

    .line 715
    .line 716
    check-cast v0, Lio/flutter/plugin/editing/j;

    .line 717
    .line 718
    iget-object v1, p0, LA/a;->g:Ljava/lang/Object;

    .line 719
    .line 720
    check-cast v1, Landroid/graphics/Typeface;

    .line 721
    .line 722
    iget-object v0, v0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 723
    .line 724
    check-cast v0, Lm/v;

    .line 725
    .line 726
    if-eqz v0, :cond_12

    .line 727
    .line 728
    invoke-virtual {v0, v1}, Lm/v;->b(Landroid/graphics/Typeface;)V

    .line 729
    .line 730
    .line 731
    :cond_12
    return-void

    .line 732
    nop

    .line 733
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    iget v0, p0, LA/a;->e:I

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
    iget-object v0, p0, LA/a;->f:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Ljava/lang/Runnable;

    .line 14
    .line 15
    const-string v1, "}"

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    new-instance v2, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v3, "SequentialExecutorWorker{running="

    .line 22
    .line 23
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v2, "SequentialExecutorWorker{state="

    .line 40
    .line 41
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object v2, p0, LA/a;->g:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast v2, LE1/k;

    .line 47
    .line 48
    iget v2, v2, LE1/k;->g:I

    .line 49
    .line 50
    const/4 v3, 0x1

    .line 51
    if-eq v2, v3, :cond_4

    .line 52
    .line 53
    const/4 v3, 0x2

    .line 54
    if-eq v2, v3, :cond_3

    .line 55
    .line 56
    const/4 v3, 0x3

    .line 57
    if-eq v2, v3, :cond_2

    .line 58
    .line 59
    const/4 v3, 0x4

    .line 60
    if-eq v2, v3, :cond_1

    .line 61
    .line 62
    const-string v2, "null"

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    const-string v2, "RUNNING"

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    const-string v2, "QUEUED"

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_3
    const-string v2, "QUEUING"

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    const-string v2, "IDLE"

    .line 75
    .line 76
    :goto_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    :goto_1
    return-object v0

    .line 87
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method
