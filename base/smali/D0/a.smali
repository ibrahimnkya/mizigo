.class public final synthetic LD0/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Ljava/lang/Object;

.field public final synthetic g:Ljava/lang/Object;

.field public final synthetic h:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(LD0/c;Ly0/i;Ls1/r;Ly0/h;)V
    .locals 0

    .line 1
    const/4 p3, 0x0

    iput p3, p0, LD0/a;->e:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LD0/a;->f:Ljava/lang/Object;

    iput-object p2, p0, LD0/a;->g:Ljava/lang/Object;

    iput-object p4, p0, LD0/a;->h:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 0

    .line 2
    iput p4, p0, LD0/a;->e:I

    iput-object p1, p0, LD0/a;->f:Ljava/lang/Object;

    iput-object p2, p0, LD0/a;->g:Ljava/lang/Object;

    iput-object p3, p0, LD0/a;->h:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget v0, p0, LD0/a;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LD0/a;->f:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, LV1/g;

    .line 9
    .line 10
    iget-object v1, p0, LD0/a;->g:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v1, Landroid/content/Intent;

    .line 13
    .line 14
    iget-object v2, p0, LD0/a;->h:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v2, Li1/i;

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    :try_start_0
    invoke-virtual {v0, v1}, LV1/g;->b(Landroid/content/Intent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    .line 22
    invoke-virtual {v2, v3}, Li1/i;->b(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :catchall_0
    move-exception v0

    .line 27
    invoke-virtual {v2, v3}, Li1/i;->b(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    throw v0

    .line 31
    :pswitch_0
    iget-object v0, p0, LD0/a;->f:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v0, LN/m;

    .line 34
    .line 35
    iget-object v1, p0, LD0/a;->g:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast v1, Ld1/d;

    .line 38
    .line 39
    iget-object v2, p0, LD0/a;->h:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast v2, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 42
    .line 43
    :try_start_1
    iget-object v0, v0, LN/m;->a:Landroid/content/Context;

    .line 44
    .line 45
    invoke-static {v0}, Lc1/g;->e(Landroid/content/Context;)LN/r;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    iget-object v3, v0, LN/r;->a:LN/i;

    .line 52
    .line 53
    check-cast v3, LN/q;

    .line 54
    .line 55
    iget-object v4, v3, LN/q;->d:Ljava/lang/Object;

    .line 56
    .line 57
    monitor-enter v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 58
    :try_start_2
    iput-object v2, v3, LN/q;->f:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 59
    .line 60
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 61
    :try_start_3
    iget-object v0, v0, LN/r;->a:LN/i;

    .line 62
    .line 63
    new-instance v3, LN/l;

    .line 64
    .line 65
    invoke-direct {v3, v1, v2}, LN/l;-><init>(Ld1/d;Ljava/util/concurrent/ThreadPoolExecutor;)V

    .line 66
    .line 67
    .line 68
    invoke-interface {v0, v3}, LN/i;->a(Ld1/d;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :catchall_1
    move-exception v0

    .line 73
    goto :goto_0

    .line 74
    :catchall_2
    move-exception v0

    .line 75
    :try_start_4
    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 76
    :try_start_5
    throw v0

    .line 77
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    .line 78
    .line 79
    const-string v3, "EmojiCompat font provider not available on this device."

    .line 80
    .line 81
    invoke-direct {v0, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 85
    :goto_0
    invoke-virtual {v1, v0}, Ld1/d;->r(Ljava/lang/Throwable;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v2}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdown()V

    .line 89
    .line 90
    .line 91
    :goto_1
    return-void

    .line 92
    :pswitch_1
    iget-object v0, p0, LD0/a;->f:Ljava/lang/Object;

    .line 93
    .line 94
    check-cast v0, LD0/c;

    .line 95
    .line 96
    iget-object v1, p0, LD0/a;->g:Ljava/lang/Object;

    .line 97
    .line 98
    check-cast v1, Ly0/i;

    .line 99
    .line 100
    iget-object v2, v1, Ly0/i;->a:Ljava/lang/String;

    .line 101
    .line 102
    iget-object v3, p0, LD0/a;->h:Ljava/lang/Object;

    .line 103
    .line 104
    check-cast v3, Ly0/h;

    .line 105
    .line 106
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 107
    .line 108
    .line 109
    sget-object v4, LD0/c;->f:Ljava/util/logging/Logger;

    .line 110
    .line 111
    const-string v5, "Transport backend \'"

    .line 112
    .line 113
    :try_start_6
    iget-object v6, v0, LD0/c;->c:Lz0/e;

    .line 114
    .line 115
    invoke-virtual {v6, v2}, Lz0/e;->a(Ljava/lang/String;)Lz0/f;

    .line 116
    .line 117
    .line 118
    move-result-object v6

    .line 119
    if-nez v6, :cond_1

    .line 120
    .line 121
    new-instance v0, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    const-string v1, "\' is not registered"

    .line 130
    .line 131
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {v4, v0}, Ljava/util/logging/Logger;->warning(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 142
    .line 143
    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    goto :goto_3

    .line 147
    :catch_0
    move-exception v0

    .line 148
    goto :goto_2

    .line 149
    :cond_1
    check-cast v6, Lw0/c;

    .line 150
    .line 151
    invoke-virtual {v6, v3}, Lw0/c;->a(Ly0/h;)Ly0/h;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    iget-object v3, v0, LD0/c;->e:LG0/c;

    .line 156
    .line 157
    new-instance v5, LD0/b;

    .line 158
    .line 159
    const/4 v6, 0x0

    .line 160
    invoke-direct {v5, v0, v1, v2, v6}, LD0/b;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 161
    .line 162
    .line 163
    check-cast v3, LF0/h;

    .line 164
    .line 165
    invoke-virtual {v3, v5}, LF0/h;->f(LG0/b;)Ljava/lang/Object;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 166
    .line 167
    .line 168
    goto :goto_3

    .line 169
    :goto_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 170
    .line 171
    const-string v2, "Error scheduling event "

    .line 172
    .line 173
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    invoke-virtual {v4, v0}, Ljava/util/logging/Logger;->warning(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    :goto_3
    return-void

    .line 191
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
