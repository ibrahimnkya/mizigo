.class public final synthetic LJ0/k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:LJ0/m;


# direct methods
.method public synthetic constructor <init>(LJ0/m;I)V
    .locals 0

    .line 1
    iput p2, p0, LJ0/k;->e:I

    iput-object p1, p0, LJ0/k;->f:LJ0/m;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget v0, p0, LJ0/k;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const-string v0, "Service disconnected"

    .line 7
    .line 8
    iget-object v1, p0, LJ0/k;->f:LJ0/m;

    .line 9
    .line 10
    invoke-virtual {v1, v0}, LJ0/m;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :pswitch_0
    iget-object v0, p0, LJ0/k;->f:LJ0/m;

    .line 15
    .line 16
    monitor-enter v0

    .line 17
    :try_start_0
    iget v1, v0, LJ0/m;->a:I

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    if-ne v1, v2, :cond_0

    .line 21
    .line 22
    const-string v1, "Timed out while binding"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, LJ0/m;->a(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    .line 27
    :cond_0
    monitor-exit v0

    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception v1

    .line 30
    goto :goto_1

    .line 31
    :goto_0
    return-void

    .line 32
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    throw v1

    .line 34
    :goto_2
    :pswitch_1
    iget-object v0, p0, LJ0/k;->f:LJ0/m;

    .line 35
    .line 36
    monitor-enter v0

    .line 37
    :try_start_2
    iget v1, v0, LJ0/m;->a:I

    .line 38
    .line 39
    const/4 v2, 0x2

    .line 40
    if-eq v1, v2, :cond_1

    .line 41
    .line 42
    monitor-exit v0

    .line 43
    goto :goto_3

    .line 44
    :catchall_1
    move-exception v1

    .line 45
    goto/16 :goto_4

    .line 46
    .line 47
    :cond_1
    iget-object v1, v0, LJ0/m;->d:Ljava/util/ArrayDeque;

    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    invoke-virtual {v0}, LJ0/m;->c()V

    .line 56
    .line 57
    .line 58
    monitor-exit v0

    .line 59
    :goto_3
    return-void

    .line 60
    :cond_2
    iget-object v1, v0, LJ0/m;->d:Ljava/util/ArrayDeque;

    .line 61
    .line 62
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    check-cast v1, LJ0/n;

    .line 67
    .line 68
    iget-object v2, v0, LJ0/m;->e:Landroid/util/SparseArray;

    .line 69
    .line 70
    iget v3, v1, LJ0/n;->a:I

    .line 71
    .line 72
    invoke-virtual {v2, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    iget-object v2, v0, LJ0/m;->f:LJ0/p;

    .line 76
    .line 77
    iget-object v2, v2, LJ0/p;->d:Ljava/lang/Object;

    .line 78
    .line 79
    check-cast v2, Ljava/util/concurrent/ScheduledExecutorService;

    .line 80
    .line 81
    new-instance v3, LA/a;

    .line 82
    .line 83
    const/4 v4, 0x4

    .line 84
    invoke-direct {v3, v4, v0, v1}, LA/a;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 88
    .line 89
    const-wide/16 v5, 0x1e

    .line 90
    .line 91
    invoke-interface {v2, v3, v5, v6, v4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 92
    .line 93
    .line 94
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 95
    const-string v2, "MessengerIpcClient"

    .line 96
    .line 97
    const/4 v3, 0x3

    .line 98
    invoke-static {v2, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    if-eqz v2, :cond_3

    .line 103
    .line 104
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    const-string v3, "Sending "

    .line 109
    .line 110
    const-string v4, "MessengerIpcClient"

    .line 111
    .line 112
    invoke-virtual {v3, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-static {v4, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    .line 118
    .line 119
    :cond_3
    iget-object v2, v0, LJ0/m;->f:LJ0/p;

    .line 120
    .line 121
    iget-object v3, v0, LJ0/m;->b:Landroid/os/Messenger;

    .line 122
    .line 123
    iget v4, v1, LJ0/n;->c:I

    .line 124
    .line 125
    iget-object v2, v2, LJ0/p;->c:Ljava/lang/Object;

    .line 126
    .line 127
    check-cast v2, Landroid/content/Context;

    .line 128
    .line 129
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 130
    .line 131
    .line 132
    move-result-object v5

    .line 133
    iput v4, v5, Landroid/os/Message;->what:I

    .line 134
    .line 135
    iget v4, v1, LJ0/n;->a:I

    .line 136
    .line 137
    iput v4, v5, Landroid/os/Message;->arg1:I

    .line 138
    .line 139
    iput-object v3, v5, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    .line 140
    .line 141
    new-instance v3, Landroid/os/Bundle;

    .line 142
    .line 143
    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v1}, LJ0/n;->a()Z

    .line 147
    .line 148
    .line 149
    move-result v4

    .line 150
    const-string v6, "oneWay"

    .line 151
    .line 152
    invoke-virtual {v3, v6, v4}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    const-string v4, "pkg"

    .line 160
    .line 161
    invoke-virtual {v3, v4, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    iget-object v1, v1, LJ0/n;->d:Landroid/os/Bundle;

    .line 165
    .line 166
    const-string v2, "data"

    .line 167
    .line 168
    invoke-virtual {v3, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v5, v3}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 172
    .line 173
    .line 174
    :try_start_3
    iget-object v1, v0, LJ0/m;->c:LA/c;

    .line 175
    .line 176
    iget-object v2, v1, LA/c;->f:Ljava/lang/Object;

    .line 177
    .line 178
    check-cast v2, Landroid/os/Messenger;

    .line 179
    .line 180
    if-eqz v2, :cond_4

    .line 181
    .line 182
    invoke-virtual {v2, v5}, Landroid/os/Messenger;->send(Landroid/os/Message;)V

    .line 183
    .line 184
    .line 185
    goto/16 :goto_2

    .line 186
    .line 187
    :cond_4
    iget-object v1, v1, LA/c;->g:Ljava/lang/Object;

    .line 188
    .line 189
    check-cast v1, LJ0/g;

    .line 190
    .line 191
    if-eqz v1, :cond_5

    .line 192
    .line 193
    iget-object v1, v1, LJ0/g;->e:Landroid/os/Messenger;

    .line 194
    .line 195
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 196
    .line 197
    .line 198
    invoke-virtual {v1, v5}, Landroid/os/Messenger;->send(Landroid/os/Message;)V

    .line 199
    .line 200
    .line 201
    goto/16 :goto_2

    .line 202
    .line 203
    :cond_5
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 204
    .line 205
    const-string v2, "Both messengers are null"

    .line 206
    .line 207
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    throw v1
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_0

    .line 211
    :catch_0
    move-exception v1

    .line 212
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v1

    .line 216
    invoke-virtual {v0, v1}, LJ0/m;->a(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    goto/16 :goto_2

    .line 220
    .line 221
    :goto_4
    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 222
    throw v1

    .line 223
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
