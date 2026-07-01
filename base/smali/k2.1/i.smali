.class public final Lk2/i;
.super Landroid/os/Handler;
.source "SourceFile"


# instance fields
.field public final synthetic a:I

.field public b:Z

.field public c:Ljava/lang/Runnable;

.field public final synthetic d:Lk2/a;


# direct methods
.method public synthetic constructor <init>(Lk2/a;I)V
    .locals 0

    .line 1
    iput p2, p0, Lk2/i;->a:I

    iput-object p1, p0, Lk2/i;->d:Lk2/a;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lk2/i;->b:Z

    const/4 p1, 0x0

    iput-object p1, p0, Lk2/i;->c:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 6

    .line 1
    iget v0, p0, Lk2/i;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget p1, p1, Landroid/os/Message;->what:I

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-ne p1, v1, :cond_0

    .line 11
    .line 12
    iput-boolean v0, p0, Lk2/i;->b:Z

    .line 13
    .line 14
    iget-object p1, p0, Lk2/i;->c:Ljava/lang/Runnable;

    .line 15
    .line 16
    check-cast p1, Lk2/h;

    .line 17
    .line 18
    if-eqz p1, :cond_3

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 25
    .line 26
    .line 27
    iget-boolean p1, p0, Lk2/i;->b:Z

    .line 28
    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    iget-object p1, p0, Lk2/i;->c:Ljava/lang/Runnable;

    .line 33
    .line 34
    check-cast p1, Lk2/h;

    .line 35
    .line 36
    if-nez p1, :cond_2

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    iget-object p1, p0, Lk2/i;->d:Lk2/a;

    .line 40
    .line 41
    check-cast p1, Lk2/o;

    .line 42
    .line 43
    iget-object p1, p1, Lk2/o;->a:LB2/a;

    .line 44
    .line 45
    invoke-virtual {p1}, LB2/a;->C()LE/i;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    monitor-enter p0

    .line 50
    :try_start_0
    iget-object v0, p0, Lk2/i;->c:Ljava/lang/Runnable;

    .line 51
    .line 52
    check-cast v0, Lk2/h;

    .line 53
    .line 54
    const/4 v2, 0x0

    .line 55
    iput-object v2, p0, Lk2/i;->c:Ljava/lang/Runnable;

    .line 56
    .line 57
    iput-boolean v1, p0, Lk2/i;->b:Z

    .line 58
    .line 59
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    new-instance v1, LD1/o;

    .line 61
    .line 62
    const/16 v2, 0xf

    .line 63
    .line 64
    invoke-direct {v1, v2, p0}, LD1/o;-><init>(ILjava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    iput-object v1, v0, Lk2/h;->j:Ljava/lang/Runnable;

    .line 68
    .line 69
    iput-object p1, v0, Lk2/h;->g:LE/i;

    .line 70
    .line 71
    iget-object p1, p0, Lk2/i;->d:Lk2/a;

    .line 72
    .line 73
    check-cast p1, Lk2/o;

    .line 74
    .line 75
    iget-object p1, p1, Lk2/o;->a:LB2/a;

    .line 76
    .line 77
    invoke-virtual {p1}, LB2/a;->x()Lcom/google/android/gms/maps/model/CameraPosition;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    iget p1, p1, Lcom/google/android/gms/maps/model/CameraPosition;->f:F

    .line 82
    .line 83
    iput p1, v0, Lk2/h;->i:F

    .line 84
    .line 85
    new-instance v1, Lo2/b;

    .line 86
    .line 87
    iget-object v2, v0, Lk2/h;->k:Lk2/a;

    .line 88
    .line 89
    check-cast v2, Lk2/o;

    .line 90
    .line 91
    iget v2, v2, Lk2/o;->n:F

    .line 92
    .line 93
    invoke-static {p1, v2}, Ljava/lang/Math;->min(FF)F

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    float-to-double v2, p1

    .line 98
    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    .line 99
    .line 100
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->pow(DD)D

    .line 101
    .line 102
    .line 103
    move-result-wide v2

    .line 104
    const-wide/high16 v4, 0x4070000000000000L    # 256.0

    .line 105
    .line 106
    mul-double/2addr v2, v4

    .line 107
    invoke-direct {v1, v2, v3}, Lo2/b;-><init>(D)V

    .line 108
    .line 109
    .line 110
    iput-object v1, v0, Lk2/h;->h:Lo2/b;

    .line 111
    .line 112
    iget-object p1, p0, Lk2/i;->d:Lk2/a;

    .line 113
    .line 114
    check-cast p1, Lk2/o;

    .line 115
    .line 116
    iget-object p1, p1, Lk2/o;->f:Ljava/util/concurrent/ExecutorService;

    .line 117
    .line 118
    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 119
    .line 120
    .line 121
    :cond_3
    :goto_0
    return-void

    .line 122
    :catchall_0
    move-exception p1

    .line 123
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 124
    throw p1

    .line 125
    :pswitch_0
    iget p1, p1, Landroid/os/Message;->what:I

    .line 126
    .line 127
    const/4 v0, 0x0

    .line 128
    const/4 v1, 0x1

    .line 129
    if-ne p1, v1, :cond_4

    .line 130
    .line 131
    iput-boolean v0, p0, Lk2/i;->b:Z

    .line 132
    .line 133
    iget-object p1, p0, Lk2/i;->c:Ljava/lang/Runnable;

    .line 134
    .line 135
    check-cast p1, Lk2/h;

    .line 136
    .line 137
    if-eqz p1, :cond_7

    .line 138
    .line 139
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 140
    .line 141
    .line 142
    goto :goto_1

    .line 143
    :cond_4
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 144
    .line 145
    .line 146
    iget-boolean p1, p0, Lk2/i;->b:Z

    .line 147
    .line 148
    if-eqz p1, :cond_5

    .line 149
    .line 150
    goto :goto_1

    .line 151
    :cond_5
    iget-object p1, p0, Lk2/i;->c:Ljava/lang/Runnable;

    .line 152
    .line 153
    check-cast p1, Lk2/h;

    .line 154
    .line 155
    if-nez p1, :cond_6

    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_6
    iget-object p1, p0, Lk2/i;->d:Lk2/a;

    .line 159
    .line 160
    check-cast p1, Lk2/j;

    .line 161
    .line 162
    iget-object p1, p1, Lk2/j;->a:LB2/a;

    .line 163
    .line 164
    invoke-virtual {p1}, LB2/a;->C()LE/i;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    monitor-enter p0

    .line 169
    :try_start_2
    iget-object v0, p0, Lk2/i;->c:Ljava/lang/Runnable;

    .line 170
    .line 171
    check-cast v0, Lk2/h;

    .line 172
    .line 173
    const/4 v2, 0x0

    .line 174
    iput-object v2, p0, Lk2/i;->c:Ljava/lang/Runnable;

    .line 175
    .line 176
    iput-boolean v1, p0, Lk2/i;->b:Z

    .line 177
    .line 178
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 179
    new-instance v1, LD1/o;

    .line 180
    .line 181
    const/16 v2, 0xe

    .line 182
    .line 183
    invoke-direct {v1, v2, p0}, LD1/o;-><init>(ILjava/lang/Object;)V

    .line 184
    .line 185
    .line 186
    iput-object v1, v0, Lk2/h;->j:Ljava/lang/Runnable;

    .line 187
    .line 188
    iput-object p1, v0, Lk2/h;->g:LE/i;

    .line 189
    .line 190
    iget-object p1, p0, Lk2/i;->d:Lk2/a;

    .line 191
    .line 192
    check-cast p1, Lk2/j;

    .line 193
    .line 194
    iget-object p1, p1, Lk2/j;->a:LB2/a;

    .line 195
    .line 196
    invoke-virtual {p1}, LB2/a;->x()Lcom/google/android/gms/maps/model/CameraPosition;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    iget p1, p1, Lcom/google/android/gms/maps/model/CameraPosition;->f:F

    .line 201
    .line 202
    iput p1, v0, Lk2/h;->i:F

    .line 203
    .line 204
    new-instance v1, Lo2/b;

    .line 205
    .line 206
    iget-object v2, v0, Lk2/h;->k:Lk2/a;

    .line 207
    .line 208
    check-cast v2, Lk2/j;

    .line 209
    .line 210
    iget v2, v2, Lk2/j;->n:F

    .line 211
    .line 212
    invoke-static {p1, v2}, Ljava/lang/Math;->min(FF)F

    .line 213
    .line 214
    .line 215
    move-result p1

    .line 216
    float-to-double v2, p1

    .line 217
    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    .line 218
    .line 219
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->pow(DD)D

    .line 220
    .line 221
    .line 222
    move-result-wide v2

    .line 223
    const-wide/high16 v4, 0x4070000000000000L    # 256.0

    .line 224
    .line 225
    mul-double/2addr v2, v4

    .line 226
    invoke-direct {v1, v2, v3}, Lo2/b;-><init>(D)V

    .line 227
    .line 228
    .line 229
    iput-object v1, v0, Lk2/h;->h:Lo2/b;

    .line 230
    .line 231
    iget-object p1, p0, Lk2/i;->d:Lk2/a;

    .line 232
    .line 233
    check-cast p1, Lk2/j;

    .line 234
    .line 235
    iget-object p1, p1, Lk2/j;->f:Ljava/util/concurrent/ExecutorService;

    .line 236
    .line 237
    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 238
    .line 239
    .line 240
    :cond_7
    :goto_1
    return-void

    .line 241
    :catchall_1
    move-exception p1

    .line 242
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 243
    throw p1

    .line 244
    nop

    .line 245
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
