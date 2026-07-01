.class public final synthetic LD1/o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, LD1/o;->e:I

    iput-object p2, p0, LD1/o;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/util/Map$Entry;LM1/a;)V
    .locals 0

    .line 2
    const/4 p2, 0x0

    iput p2, p0, LD1/o;->e:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LD1/o;->f:Ljava/lang/Object;

    return-void
.end method

.method private final a()V
    .locals 7

    .line 1
    iget-object v0, p0, LD1/o;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LD0/d;

    .line 4
    .line 5
    iget-object v1, v0, LD0/d;->i:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ljava/util/ArrayDeque;

    .line 8
    .line 9
    monitor-enter v1

    .line 10
    :try_start_0
    iget-object v2, v0, LD0/d;->f:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v2, Landroid/content/SharedPreferences;

    .line 13
    .line 14
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    iget-object v3, v0, LD0/d;->g:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v3, Ljava/lang/String;

    .line 21
    .line 22
    new-instance v4, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    iget-object v5, v0, LD0/d;->i:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast v5, Ljava/util/ArrayDeque;

    .line 30
    .line 31
    invoke-virtual {v5}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v6

    .line 39
    if-eqz v6, :cond_0

    .line 40
    .line 41
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    check-cast v6, Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget-object v6, v0, LD0/d;->h:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast v6, Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-interface {v2, v3, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 67
    .line 68
    .line 69
    monitor-exit v1

    .line 70
    return-void

    .line 71
    :catchall_0
    move-exception v0

    .line 72
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 73
    throw v0
.end method


# virtual methods
.method public final run()V
    .locals 8

    .line 1
    iget v0, p0, LD1/o;->e:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/16 v2, 0xb

    .line 5
    .line 6
    const/4 v3, 0x1

    .line 7
    const/4 v4, 0x0

    .line 8
    packed-switch v0, :pswitch_data_0

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, LD1/o;->f:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Lm/v;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :pswitch_0
    iget-object v0, p0, LD1/o;->f:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v0, Lk2/i;

    .line 22
    .line 23
    invoke-virtual {v0, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :pswitch_1
    iget-object v0, p0, LD1/o;->f:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast v0, Lk2/i;

    .line 30
    .line 31
    invoke-virtual {v0, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :pswitch_2
    iget-object v0, p0, LD1/o;->f:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast v0, Lio/flutter/plugin/platform/p;

    .line 38
    .line 39
    invoke-virtual {v0, v4}, Lio/flutter/plugin/platform/p;->f(Z)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :pswitch_3
    iget-object v0, p0, LD1/o;->f:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v0, Le3/c;

    .line 46
    .line 47
    iget-object v0, v0, Le3/c;->b:Le3/e;

    .line 48
    .line 49
    iget-object v0, v0, Le3/e;->e:Lio/flutter/embedding/engine/FlutterJNI;

    .line 50
    .line 51
    invoke-virtual {v0}, Lio/flutter/embedding/engine/FlutterJNI;->prefetchDefaultFontManager()V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :pswitch_4
    iget-object v0, p0, LD1/o;->f:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast v0, Lb3/h;

    .line 58
    .line 59
    iget-object v1, v0, Lb3/h;->a:Ljava/util/concurrent/ExecutorService;

    .line 60
    .line 61
    iget-object v5, v0, Lb3/h;->b:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 62
    .line 63
    iget-object v6, v0, Lb3/h;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 64
    .line 65
    invoke-virtual {v6, v4, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-eqz v3, :cond_2

    .line 70
    .line 71
    :try_start_0
    invoke-virtual {v5}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    check-cast v3, Ljava/lang/Runnable;

    .line 76
    .line 77
    if-eqz v3, :cond_0

    .line 78
    .line 79
    invoke-interface {v3}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :catchall_0
    move-exception v3

    .line 84
    goto :goto_1

    .line 85
    :cond_0
    :goto_0
    invoke-virtual {v6, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v5}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    if-nez v3, :cond_2

    .line 93
    .line 94
    new-instance v3, LD1/o;

    .line 95
    .line 96
    invoke-direct {v3, v2, v0}, LD1/o;-><init>(ILjava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    invoke-interface {v1, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 100
    .line 101
    .line 102
    goto :goto_2

    .line 103
    :goto_1
    invoke-virtual {v6, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v5}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    if-nez v4, :cond_1

    .line 111
    .line 112
    new-instance v4, LD1/o;

    .line 113
    .line 114
    invoke-direct {v4, v2, v0}, LD1/o;-><init>(ILjava/lang/Object;)V

    .line 115
    .line 116
    .line 117
    invoke-interface {v1, v4}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 118
    .line 119
    .line 120
    :cond_1
    throw v3

    .line 121
    :cond_2
    :goto_2
    return-void

    .line 122
    :pswitch_5
    iget-object v0, p0, LD1/o;->f:Ljava/lang/Object;

    .line 123
    .line 124
    check-cast v0, Landroidx/lifecycle/A;

    .line 125
    .line 126
    iget-object v1, v0, Landroidx/lifecycle/A;->j:Landroidx/lifecycle/s;

    .line 127
    .line 128
    iget v2, v0, Landroidx/lifecycle/A;->f:I

    .line 129
    .line 130
    if-nez v2, :cond_3

    .line 131
    .line 132
    iput-boolean v3, v0, Landroidx/lifecycle/A;->g:Z

    .line 133
    .line 134
    sget-object v2, Landroidx/lifecycle/j;->ON_PAUSE:Landroidx/lifecycle/j;

    .line 135
    .line 136
    invoke-virtual {v1, v2}, Landroidx/lifecycle/s;->e(Landroidx/lifecycle/j;)V

    .line 137
    .line 138
    .line 139
    :cond_3
    iget v2, v0, Landroidx/lifecycle/A;->e:I

    .line 140
    .line 141
    if-nez v2, :cond_4

    .line 142
    .line 143
    iget-boolean v2, v0, Landroidx/lifecycle/A;->g:Z

    .line 144
    .line 145
    if-eqz v2, :cond_4

    .line 146
    .line 147
    sget-object v2, Landroidx/lifecycle/j;->ON_STOP:Landroidx/lifecycle/j;

    .line 148
    .line 149
    invoke-virtual {v1, v2}, Landroidx/lifecycle/s;->e(Landroidx/lifecycle/j;)V

    .line 150
    .line 151
    .line 152
    iput-boolean v3, v0, Landroidx/lifecycle/A;->h:Z

    .line 153
    .line 154
    :cond_4
    return-void

    .line 155
    :pswitch_6
    iget-object v0, p0, LD1/o;->f:Ljava/lang/Object;

    .line 156
    .line 157
    check-cast v0, LW3/f;

    .line 158
    .line 159
    :try_start_1
    new-array v5, v3, [Z

    .line 160
    .line 161
    aput-boolean v3, v5, v4

    .line 162
    .line 163
    const/16 v3, 0xbb8

    .line 164
    .line 165
    :cond_5
    :goto_3
    aget-boolean v6, v5, v4

    .line 166
    .line 167
    if-eqz v6, :cond_7

    .line 168
    .line 169
    new-instance v6, Landroid/os/Handler;

    .line 170
    .line 171
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 172
    .line 173
    .line 174
    move-result-object v7

    .line 175
    invoke-direct {v6, v7}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 176
    .line 177
    .line 178
    new-instance v7, LD1/h;

    .line 179
    .line 180
    invoke-direct {v7, v2, v0, v5}, LD1/h;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {v6, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 184
    .line 185
    .line 186
    add-int/lit8 v3, v3, -0x1

    .line 187
    .line 188
    if-lez v3, :cond_6

    .line 189
    .line 190
    aget-boolean v6, v5, v4

    .line 191
    .line 192
    if-eqz v6, :cond_5

    .line 193
    .line 194
    const-wide/16 v6, 0xc8

    .line 195
    .line 196
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V

    .line 197
    .line 198
    .line 199
    goto :goto_3

    .line 200
    :catch_0
    move-exception v2

    .line 201
    goto :goto_4

    .line 202
    :cond_6
    new-instance v2, Ljava/lang/Exception;

    .line 203
    .line 204
    const-string v3, "Timeout waiting for the job to finish"

    .line 205
    .line 206
    invoke-direct {v2, v3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    throw v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 210
    :goto_4
    new-instance v3, Landroid/os/Handler;

    .line 211
    .line 212
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 213
    .line 214
    .line 215
    move-result-object v4

    .line 216
    invoke-direct {v3, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 217
    .line 218
    .line 219
    new-instance v4, LD1/h;

    .line 220
    .line 221
    const/16 v5, 0xc

    .line 222
    .line 223
    invoke-direct {v4, v5, v0, v2}, LD1/h;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 224
    .line 225
    .line 226
    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 227
    .line 228
    .line 229
    :cond_7
    iput-object v1, v0, LW3/f;->c:Landroid/print/PrintJob;

    .line 230
    .line 231
    return-void

    .line 232
    :pswitch_7
    iget-object v0, p0, LD1/o;->f:Ljava/lang/Object;

    .line 233
    .line 234
    check-cast v0, LV2/e;

    .line 235
    .line 236
    iget-object v1, v0, LV2/e;->f:Ljava/util/ArrayList;

    .line 237
    .line 238
    :goto_5
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 239
    .line 240
    .line 241
    move-result v2

    .line 242
    if-nez v2, :cond_9

    .line 243
    .line 244
    iget-object v2, v0, LV2/e;->l:Ljava/lang/Integer;

    .line 245
    .line 246
    if-eqz v2, :cond_8

    .line 247
    .line 248
    goto :goto_6

    .line 249
    :cond_8
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 250
    .line 251
    .line 252
    move-result-object v2

    .line 253
    check-cast v2, LW2/e;

    .line 254
    .line 255
    iget-object v2, v2, LW2/e;->a:Ljava/lang/Runnable;

    .line 256
    .line 257
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    .line 258
    .line 259
    .line 260
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    goto :goto_5

    .line 264
    :cond_9
    :goto_6
    return-void

    .line 265
    :pswitch_8
    iget-object v0, p0, LD1/o;->f:Ljava/lang/Object;

    .line 266
    .line 267
    check-cast v0, LV1/J;

    .line 268
    .line 269
    const-string v2, "FirebaseMessaging"

    .line 270
    .line 271
    new-instance v3, Ljava/lang/StringBuilder;

    .line 272
    .line 273
    const-string v4, "Service took too long to process intent: "

    .line 274
    .line 275
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    iget-object v4, v0, LV1/J;->a:Landroid/content/Intent;

    .line 279
    .line 280
    invoke-virtual {v4}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v4

    .line 284
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    const-string v4, " finishing."

    .line 288
    .line 289
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 290
    .line 291
    .line 292
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v3

    .line 296
    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 297
    .line 298
    .line 299
    iget-object v0, v0, LV1/J;->b:Li1/i;

    .line 300
    .line 301
    invoke-virtual {v0, v1}, Li1/i;->d(Ljava/lang/Object;)V

    .line 302
    .line 303
    .line 304
    return-void

    .line 305
    :pswitch_9
    invoke-direct {p0}, LD1/o;->a()V

    .line 306
    .line 307
    .line 308
    return-void

    .line 309
    :pswitch_a
    iget-object v0, p0, LD1/o;->f:Ljava/lang/Object;

    .line 310
    .line 311
    check-cast v0, LU2/a;

    .line 312
    .line 313
    iget-object v0, v0, LU2/a;->a:LU2/b;

    .line 314
    .line 315
    iput-boolean v4, v0, LU2/b;->b:Z

    .line 316
    .line 317
    invoke-virtual {v0}, LU2/b;->a()V

    .line 318
    .line 319
    .line 320
    return-void

    .line 321
    :pswitch_b
    iget-object v0, p0, LD1/o;->f:Ljava/lang/Object;

    .line 322
    .line 323
    check-cast v0, LE/i;

    .line 324
    .line 325
    iget-object v0, v0, LE/i;->f:Ljava/lang/Object;

    .line 326
    .line 327
    check-cast v0, Lcom/journeyapps/barcodescanner/BarcodeView;

    .line 328
    .line 329
    invoke-static {v0}, LT2/g;->a(Lcom/journeyapps/barcodescanner/BarcodeView;)V

    .line 330
    .line 331
    .line 332
    return-void

    .line 333
    :pswitch_c
    iget-object v0, p0, LD1/o;->f:Ljava/lang/Object;

    .line 334
    .line 335
    check-cast v0, Lk3/n;

    .line 336
    .line 337
    invoke-interface {v0}, Lk3/n;->b()V

    .line 338
    .line 339
    .line 340
    return-void

    .line 341
    :pswitch_d
    iget-object v0, p0, LD1/o;->f:Ljava/lang/Object;

    .line 342
    .line 343
    check-cast v0, LN/q;

    .line 344
    .line 345
    const-string v1, "fetchFonts result is not OK. ("

    .line 346
    .line 347
    iget-object v2, v0, LN/q;->d:Ljava/lang/Object;

    .line 348
    .line 349
    monitor-enter v2

    .line 350
    :try_start_2
    iget-object v3, v0, LN/q;->h:Ld1/d;

    .line 351
    .line 352
    if-nez v3, :cond_a

    .line 353
    .line 354
    monitor-exit v2

    .line 355
    goto/16 :goto_d

    .line 356
    .line 357
    :catchall_1
    move-exception v0

    .line 358
    goto/16 :goto_f

    .line 359
    .line 360
    :cond_a
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 361
    :try_start_3
    invoke-virtual {v0}, LN/q;->c()LA/m;

    .line 362
    .line 363
    .line 364
    move-result-object v2

    .line 365
    iget v3, v2, LA/m;->f:I

    .line 366
    .line 367
    const/4 v5, 0x2

    .line 368
    if-ne v3, v5, :cond_b

    .line 369
    .line 370
    iget-object v5, v0, LN/q;->d:Ljava/lang/Object;

    .line 371
    .line 372
    monitor-enter v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 373
    :try_start_4
    monitor-exit v5

    .line 374
    goto :goto_7

    .line 375
    :catchall_2
    move-exception v1

    .line 376
    monitor-exit v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 377
    :try_start_5
    throw v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 378
    :catchall_3
    move-exception v1

    .line 379
    goto/16 :goto_b

    .line 380
    .line 381
    :cond_b
    :goto_7
    if-nez v3, :cond_e

    .line 382
    .line 383
    :try_start_6
    const-string v1, "EmojiCompat.FontRequestEmojiCompatConfig.buildTypeface"

    .line 384
    .line 385
    sget v3, Lz/b;->a:I

    .line 386
    .line 387
    invoke-static {v1}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 388
    .line 389
    .line 390
    iget-object v1, v0, LN/q;->c:LK0/h;

    .line 391
    .line 392
    iget-object v3, v0, LN/q;->a:Landroid/content/Context;

    .line 393
    .line 394
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 395
    .line 396
    .line 397
    filled-new-array {v2}, [LA/m;

    .line 398
    .line 399
    .line 400
    move-result-object v1

    .line 401
    sget-object v5, Lw/d;->a:LT0/a;

    .line 402
    .line 403
    const-string v5, "TypefaceCompat.createFromFontInfo"

    .line 404
    .line 405
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/i0;->N(Ljava/lang/String;)Ljava/lang/String;

    .line 406
    .line 407
    .line 408
    move-result-object v5

    .line 409
    invoke-static {v5}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_6

    .line 410
    .line 411
    .line 412
    :try_start_7
    sget-object v5, Lw/d;->a:LT0/a;

    .line 413
    .line 414
    invoke-virtual {v5, v3, v1, v4}, LT0/a;->g(Landroid/content/Context;[LA/m;I)Landroid/graphics/Typeface;

    .line 415
    .line 416
    .line 417
    move-result-object v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_7

    .line 418
    :try_start_8
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 419
    .line 420
    .line 421
    iget-object v3, v0, LN/q;->a:Landroid/content/Context;

    .line 422
    .line 423
    iget-object v2, v2, LA/m;->a:Landroid/net/Uri;

    .line 424
    .line 425
    invoke-static {v3, v2}, LV0/g;->w(Landroid/content/Context;Landroid/net/Uri;)Ljava/nio/MappedByteBuffer;

    .line 426
    .line 427
    .line 428
    move-result-object v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_6

    .line 429
    if-eqz v2, :cond_d

    .line 430
    .line 431
    if-eqz v1, :cond_d

    .line 432
    .line 433
    :try_start_9
    const-string v3, "EmojiCompat.MetadataRepo.create"

    .line 434
    .line 435
    invoke-static {v3}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 436
    .line 437
    .line 438
    new-instance v3, LV1/y;

    .line 439
    .line 440
    invoke-static {v2}, LV0/g;->A(Ljava/nio/MappedByteBuffer;)LO/b;

    .line 441
    .line 442
    .line 443
    move-result-object v2

    .line 444
    invoke-direct {v3, v1, v2}, LV1/y;-><init>(Landroid/graphics/Typeface;LO/b;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    .line 445
    .line 446
    .line 447
    :try_start_a
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_6

    .line 448
    .line 449
    .line 450
    :try_start_b
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 451
    .line 452
    .line 453
    iget-object v1, v0, LN/q;->d:Ljava/lang/Object;

    .line 454
    .line 455
    monitor-enter v1
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    .line 456
    :try_start_c
    iget-object v2, v0, LN/q;->h:Ld1/d;

    .line 457
    .line 458
    if-eqz v2, :cond_c

    .line 459
    .line 460
    invoke-virtual {v2, v3}, Ld1/d;->s(LV1/y;)V

    .line 461
    .line 462
    .line 463
    goto :goto_8

    .line 464
    :catchall_4
    move-exception v2

    .line 465
    goto :goto_9

    .line 466
    :cond_c
    :goto_8
    monitor-exit v1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    .line 467
    :try_start_d
    invoke-virtual {v0}, LN/q;->b()V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    .line 468
    .line 469
    .line 470
    goto :goto_d

    .line 471
    :goto_9
    :try_start_e
    monitor-exit v1
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_4

    .line 472
    :try_start_f
    throw v2
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_3

    .line 473
    :catchall_5
    move-exception v1

    .line 474
    :try_start_10
    sget v2, Lz/b;->a:I

    .line 475
    .line 476
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 477
    .line 478
    .line 479
    throw v1

    .line 480
    :cond_d
    new-instance v1, Ljava/lang/RuntimeException;

    .line 481
    .line 482
    const-string v2, "Unable to open file."

    .line 483
    .line 484
    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 485
    .line 486
    .line 487
    throw v1

    .line 488
    :catchall_6
    move-exception v1

    .line 489
    goto :goto_a

    .line 490
    :catchall_7
    move-exception v1

    .line 491
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 492
    .line 493
    .line 494
    throw v1
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_6

    .line 495
    :goto_a
    :try_start_11
    sget v2, Lz/b;->a:I

    .line 496
    .line 497
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 498
    .line 499
    .line 500
    throw v1

    .line 501
    :cond_e
    new-instance v2, Ljava/lang/RuntimeException;

    .line 502
    .line 503
    new-instance v4, Ljava/lang/StringBuilder;

    .line 504
    .line 505
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 506
    .line 507
    .line 508
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 509
    .line 510
    .line 511
    const-string v1, ")"

    .line 512
    .line 513
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 514
    .line 515
    .line 516
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 517
    .line 518
    .line 519
    move-result-object v1

    .line 520
    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 521
    .line 522
    .line 523
    throw v2
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_3

    .line 524
    :goto_b
    iget-object v3, v0, LN/q;->d:Ljava/lang/Object;

    .line 525
    .line 526
    monitor-enter v3

    .line 527
    :try_start_12
    iget-object v2, v0, LN/q;->h:Ld1/d;

    .line 528
    .line 529
    if-eqz v2, :cond_f

    .line 530
    .line 531
    invoke-virtual {v2, v1}, Ld1/d;->r(Ljava/lang/Throwable;)V

    .line 532
    .line 533
    .line 534
    goto :goto_c

    .line 535
    :catchall_8
    move-exception v0

    .line 536
    goto :goto_e

    .line 537
    :cond_f
    :goto_c
    monitor-exit v3
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_8

    .line 538
    invoke-virtual {v0}, LN/q;->b()V

    .line 539
    .line 540
    .line 541
    :goto_d
    return-void

    .line 542
    :goto_e
    :try_start_13
    monitor-exit v3
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_8

    .line 543
    throw v0

    .line 544
    :goto_f
    :try_start_14
    monitor-exit v2
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_1

    .line 545
    throw v0

    .line 546
    :pswitch_e
    iget-object v0, p0, LD1/o;->f:Ljava/lang/Object;

    .line 547
    .line 548
    check-cast v0, LE0/m;

    .line 549
    .line 550
    iget-object v1, v0, LE0/m;->d:LG0/c;

    .line 551
    .line 552
    new-instance v2, LD1/a;

    .line 553
    .line 554
    const/4 v3, 0x4

    .line 555
    invoke-direct {v2, v3, v0}, LD1/a;-><init>(ILjava/lang/Object;)V

    .line 556
    .line 557
    .line 558
    check-cast v1, LF0/h;

    .line 559
    .line 560
    invoke-virtual {v1, v2}, LF0/h;->f(LG0/b;)Ljava/lang/Object;

    .line 561
    .line 562
    .line 563
    return-void

    .line 564
    :pswitch_f
    iget-object v0, p0, LD1/o;->f:Ljava/lang/Object;

    .line 565
    .line 566
    check-cast v0, Ljava/util/Map$Entry;

    .line 567
    .line 568
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 569
    .line 570
    .line 571
    move-result-object v0

    .line 572
    check-cast v0, LV1/p;

    .line 573
    .line 574
    iget-object v0, v0, LV1/p;->a:LV1/q;

    .line 575
    .line 576
    invoke-virtual {v0}, LV1/q;->b()Z

    .line 577
    .line 578
    .line 579
    move-result v1

    .line 580
    if-eqz v1, :cond_10

    .line 581
    .line 582
    iget-object v0, v0, LV1/q;->e:Ljava/lang/Object;

    .line 583
    .line 584
    check-cast v0, Lcom/google/firebase/messaging/FirebaseMessaging;

    .line 585
    .line 586
    sget-object v1, Lcom/google/firebase/messaging/FirebaseMessaging;->l:LA0/c;

    .line 587
    .line 588
    invoke-virtual {v0}, Lcom/google/firebase/messaging/FirebaseMessaging;->k()V

    .line 589
    .line 590
    .line 591
    :cond_10
    return-void

    .line 592
    nop

    .line 593
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_f
        :pswitch_e
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
