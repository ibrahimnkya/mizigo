.class public final synthetic LD1/h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Ljava/lang/Object;

.field public final synthetic g:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, LD1/h;->e:I

    iput-object p2, p0, LD1/h;->g:Ljava/lang/Object;

    iput-object p3, p0, LD1/h;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 19

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget v0, v1, LD1/h;->e:I

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    const/4 v4, 0x0

    .line 8
    packed-switch v0, :pswitch_data_0

    .line 9
    .line 10
    .line 11
    iget-object v0, v1, LD1/h;->g:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Lm/v;

    .line 14
    .line 15
    iget-object v2, v1, LD1/h;->f:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v2, Landroid/graphics/Typeface;

    .line 18
    .line 19
    invoke-virtual {v0, v2}, Lm/v;->b(Landroid/graphics/Typeface;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :pswitch_0
    iget-object v0, v1, LD1/h;->g:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v0, LN/p;

    .line 26
    .line 27
    iget-object v2, v1, LD1/h;->f:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast v2, Ls3/u0;

    .line 30
    .line 31
    iget-object v3, v0, LN/p;->f:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v3, Lm/x0;

    .line 34
    .line 35
    iget-object v5, v3, Lm/x0;->g:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast v5, LZ2/s;

    .line 38
    .line 39
    iget-object v3, v3, Lm/x0;->f:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast v3, Ljava/lang/String;

    .line 42
    .line 43
    iget v6, v0, LN/p;->c:I

    .line 44
    .line 45
    int-to-long v6, v6

    .line 46
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 47
    .line 48
    .line 49
    move-result-object v6

    .line 50
    new-instance v7, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v8, "dev.flutter.pigeon.google_maps_flutter_android.MapsCallbackApi.getTileOverlayTile"

    .line 53
    .line 54
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object v8, v5, LZ2/s;->g:Ljava/lang/Object;

    .line 58
    .line 59
    check-cast v8, Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v7

    .line 68
    new-instance v8, LV1/y;

    .line 69
    .line 70
    iget-object v5, v5, LZ2/s;->f:Ljava/lang/Object;

    .line 71
    .line 72
    check-cast v5, Lk3/f;

    .line 73
    .line 74
    sget-object v9, Ls3/B;->d:Ls3/B;

    .line 75
    .line 76
    invoke-direct {v8, v5, v7, v9, v4}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 77
    .line 78
    .line 79
    new-instance v4, Ljava/util/ArrayList;

    .line 80
    .line 81
    filled-new-array {v3, v2, v6}, [Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-direct {v4, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 90
    .line 91
    .line 92
    new-instance v2, LE0/j;

    .line 93
    .line 94
    const/16 v3, 0x9

    .line 95
    .line 96
    invoke-direct {v2, v3, v0, v7}, LE0/j;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v8, v4, v2}, LV1/y;->v(Ljava/io/Serializable;Lk3/c;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :pswitch_1
    iget-object v0, v1, LD1/h;->g:Ljava/lang/Object;

    .line 104
    .line 105
    check-cast v0, Landroid/content/Intent;

    .line 106
    .line 107
    iget-object v2, v1, LD1/h;->f:Ljava/lang/Object;

    .line 108
    .line 109
    check-cast v2, Ljava/util/concurrent/CountDownLatch;

    .line 110
    .line 111
    sget-object v3, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;->m:Lm/x0;

    .line 112
    .line 113
    invoke-virtual {v3, v0, v2}, Lm/x0;->B(Landroid/content/Intent;Ljava/util/concurrent/CountDownLatch;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :pswitch_2
    iget-object v0, v1, LD1/h;->g:Ljava/lang/Object;

    .line 118
    .line 119
    check-cast v0, Ljava/lang/String;

    .line 120
    .line 121
    iget-object v2, v1, LD1/h;->f:Ljava/lang/Object;

    .line 122
    .line 123
    check-cast v2, Li1/i;

    .line 124
    .line 125
    sget-object v3, Lp3/d;->g:Ljava/util/HashMap;

    .line 126
    .line 127
    :try_start_0
    invoke-static {v0}, LA1/g;->e(Ljava/lang/String;)LA1/g;

    .line 128
    .line 129
    .line 130
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 131
    :try_start_1
    invoke-virtual {v0}, LA1/g;->b()V
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 132
    .line 133
    .line 134
    goto :goto_0

    .line 135
    :catch_0
    move-exception v0

    .line 136
    goto :goto_1

    .line 137
    :catch_1
    :goto_0
    :try_start_2
    invoke-virtual {v2, v4}, Li1/i;->b(Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 138
    .line 139
    .line 140
    goto :goto_2

    .line 141
    :goto_1
    invoke-virtual {v2, v0}, Li1/i;->a(Ljava/lang/Exception;)V

    .line 142
    .line 143
    .line 144
    :goto_2
    return-void

    .line 145
    :pswitch_3
    iget-object v0, v1, LD1/h;->g:Ljava/lang/Object;

    .line 146
    .line 147
    check-cast v0, LW3/f;

    .line 148
    .line 149
    iget-object v4, v1, LD1/h;->f:Ljava/lang/Object;

    .line 150
    .line 151
    check-cast v4, Ljava/lang/Exception;

    .line 152
    .line 153
    iget-object v5, v0, LW3/f;->b:LA/c;

    .line 154
    .line 155
    iget-object v6, v0, LW3/f;->c:Landroid/print/PrintJob;

    .line 156
    .line 157
    if-eqz v6, :cond_0

    .line 158
    .line 159
    invoke-virtual {v6}, Landroid/print/PrintJob;->isCompleted()Z

    .line 160
    .line 161
    .line 162
    move-result v6

    .line 163
    if-eqz v6, :cond_0

    .line 164
    .line 165
    goto :goto_3

    .line 166
    :cond_0
    move v2, v3

    .line 167
    :goto_3
    invoke-virtual {v4}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    invoke-virtual {v5, v0, v2, v3}, LA/c;->K(LW3/f;ZLjava/lang/String;)V

    .line 172
    .line 173
    .line 174
    return-void

    .line 175
    :pswitch_4
    iget-object v0, v1, LD1/h;->g:Ljava/lang/Object;

    .line 176
    .line 177
    check-cast v0, LW3/f;

    .line 178
    .line 179
    iget-object v5, v1, LD1/h;->f:Ljava/lang/Object;

    .line 180
    .line 181
    check-cast v5, [Z

    .line 182
    .line 183
    iget-object v6, v0, LW3/f;->b:LA/c;

    .line 184
    .line 185
    iget-object v7, v0, LW3/f;->c:Landroid/print/PrintJob;

    .line 186
    .line 187
    const/4 v8, 0x6

    .line 188
    if-nez v7, :cond_1

    .line 189
    .line 190
    move v7, v8

    .line 191
    goto :goto_4

    .line 192
    :cond_1
    invoke-virtual {v7}, Landroid/print/PrintJob;->getInfo()Landroid/print/PrintJobInfo;

    .line 193
    .line 194
    .line 195
    move-result-object v7

    .line 196
    invoke-virtual {v7}, Landroid/print/PrintJobInfo;->getState()I

    .line 197
    .line 198
    .line 199
    move-result v7

    .line 200
    :goto_4
    const/4 v9, 0x5

    .line 201
    if-ne v7, v9, :cond_2

    .line 202
    .line 203
    invoke-virtual {v6, v0, v2, v4}, LA/c;->K(LW3/f;ZLjava/lang/String;)V

    .line 204
    .line 205
    .line 206
    aput-boolean v3, v5, v3

    .line 207
    .line 208
    goto :goto_5

    .line 209
    :cond_2
    const/4 v2, 0x7

    .line 210
    if-ne v7, v2, :cond_3

    .line 211
    .line 212
    invoke-virtual {v6, v0, v3, v4}, LA/c;->K(LW3/f;ZLjava/lang/String;)V

    .line 213
    .line 214
    .line 215
    aput-boolean v3, v5, v3

    .line 216
    .line 217
    goto :goto_5

    .line 218
    :cond_3
    if-ne v7, v8, :cond_4

    .line 219
    .line 220
    const-string v2, "Unable to print"

    .line 221
    .line 222
    invoke-virtual {v6, v0, v3, v2}, LA/c;->K(LW3/f;ZLjava/lang/String;)V

    .line 223
    .line 224
    .line 225
    aput-boolean v3, v5, v3

    .line 226
    .line 227
    :cond_4
    :goto_5
    return-void

    .line 228
    :pswitch_5
    iget-object v0, v1, LD1/h;->g:Ljava/lang/Object;

    .line 229
    .line 230
    move-object v2, v0

    .line 231
    check-cast v2, LD1/b;

    .line 232
    .line 233
    iget-object v0, v1, LD1/h;->f:Ljava/lang/Object;

    .line 234
    .line 235
    check-cast v0, LV2/g;

    .line 236
    .line 237
    monitor-enter v2

    .line 238
    :try_start_3
    new-instance v3, Ljava/util/HashSet;

    .line 239
    .line 240
    iget-object v5, v2, LD1/b;->d:Ljava/io/Serializable;

    .line 241
    .line 242
    check-cast v5, Ljava/util/HashSet;

    .line 243
    .line 244
    invoke-direct {v3, v5}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 245
    .line 246
    .line 247
    iget-object v5, v2, LD1/b;->e:Ljava/io/Serializable;

    .line 248
    .line 249
    check-cast v5, Ljava/util/HashSet;

    .line 250
    .line 251
    invoke-virtual {v5, v0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 252
    .line 253
    .line 254
    iget-object v5, v2, LD1/b;->d:Ljava/io/Serializable;

    .line 255
    .line 256
    check-cast v5, Ljava/util/HashSet;

    .line 257
    .line 258
    invoke-virtual {v5, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 259
    .line 260
    .line 261
    iget-object v5, v0, LV2/g;->f:LV2/f;

    .line 262
    .line 263
    if-eqz v5, :cond_5

    .line 264
    .line 265
    iget-object v5, v5, LV2/f;->a:LE/i;

    .line 266
    .line 267
    if-eqz v5, :cond_5

    .line 268
    .line 269
    iget-object v5, v5, LE/i;->f:Ljava/lang/Object;

    .line 270
    .line 271
    check-cast v5, LV2/e;

    .line 272
    .line 273
    invoke-virtual {v5}, LV2/e;->k()Z

    .line 274
    .line 275
    .line 276
    move-result v5

    .line 277
    if-eqz v5, :cond_5

    .line 278
    .line 279
    goto :goto_7

    .line 280
    :cond_5
    iget-object v5, v0, LV2/g;->f:LV2/f;

    .line 281
    .line 282
    if-eqz v5, :cond_6

    .line 283
    .line 284
    invoke-virtual {v5}, LV2/f;->a()Ljava/lang/Integer;

    .line 285
    .line 286
    .line 287
    move-result-object v5

    .line 288
    goto :goto_6

    .line 289
    :cond_6
    move-object v5, v4

    .line 290
    :goto_6
    if-eqz v5, :cond_8

    .line 291
    .line 292
    iget-object v5, v2, LD1/b;->g:Ljava/lang/Object;

    .line 293
    .line 294
    check-cast v5, Ljava/util/HashMap;

    .line 295
    .line 296
    iget-object v6, v0, LV2/g;->f:LV2/f;

    .line 297
    .line 298
    if-eqz v6, :cond_7

    .line 299
    .line 300
    invoke-virtual {v6}, LV2/f;->a()Ljava/lang/Integer;

    .line 301
    .line 302
    .line 303
    move-result-object v4

    .line 304
    :cond_7
    invoke-virtual {v5, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    .line 306
    .line 307
    goto :goto_7

    .line 308
    :catchall_0
    move-exception v0

    .line 309
    goto :goto_9

    .line 310
    :cond_8
    :goto_7
    invoke-virtual {v2, v0}, LD1/b;->g(LV2/g;)V

    .line 311
    .line 312
    .line 313
    invoke-virtual {v3}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 318
    .line 319
    .line 320
    move-result v3

    .line 321
    if-eqz v3, :cond_9

    .line 322
    .line 323
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 324
    .line 325
    .line 326
    move-result-object v3

    .line 327
    check-cast v3, LV2/g;

    .line 328
    .line 329
    invoke-virtual {v2, v3}, LD1/b;->g(LV2/g;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 330
    .line 331
    .line 332
    goto :goto_8

    .line 333
    :cond_9
    monitor-exit v2

    .line 334
    return-void

    .line 335
    :goto_9
    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 336
    throw v0

    .line 337
    :pswitch_6
    iget-object v0, v1, LD1/h;->g:Ljava/lang/Object;

    .line 338
    .line 339
    check-cast v0, LV2/g;

    .line 340
    .line 341
    iget-object v2, v1, LD1/h;->f:Ljava/lang/Object;

    .line 342
    .line 343
    check-cast v2, LV2/f;

    .line 344
    .line 345
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 346
    .line 347
    .line 348
    iget-object v3, v2, LV2/f;->b:Ljava/lang/Runnable;

    .line 349
    .line 350
    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    .line 351
    .line 352
    .line 353
    iput-object v2, v0, LV2/g;->f:LV2/f;

    .line 354
    .line 355
    iget-object v0, v0, LV2/g;->e:LD1/h;

    .line 356
    .line 357
    invoke-virtual {v0}, LD1/h;->run()V

    .line 358
    .line 359
    .line 360
    return-void

    .line 361
    :pswitch_7
    iget-object v0, v1, LD1/h;->g:Ljava/lang/Object;

    .line 362
    .line 363
    check-cast v0, LV1/r;

    .line 364
    .line 365
    iget-object v2, v1, LD1/h;->f:Ljava/lang/Object;

    .line 366
    .line 367
    check-cast v2, Li1/i;

    .line 368
    .line 369
    :try_start_5
    invoke-virtual {v0}, LV1/r;->a()Landroid/graphics/Bitmap;

    .line 370
    .line 371
    .line 372
    move-result-object v0

    .line 373
    invoke-virtual {v2, v0}, Li1/i;->b(Ljava/lang/Object;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 374
    .line 375
    .line 376
    goto :goto_a

    .line 377
    :catch_2
    move-exception v0

    .line 378
    invoke-virtual {v2, v0}, Li1/i;->a(Ljava/lang/Exception;)V

    .line 379
    .line 380
    .line 381
    :goto_a
    return-void

    .line 382
    :pswitch_8
    iget-object v0, v1, LD1/h;->g:Ljava/lang/Object;

    .line 383
    .line 384
    check-cast v0, LV1/k;

    .line 385
    .line 386
    iget-object v2, v1, LD1/h;->f:Ljava/lang/Object;

    .line 387
    .line 388
    check-cast v2, Landroid/content/Intent;

    .line 389
    .line 390
    invoke-virtual {v0, v2}, LV1/k;->a(Landroid/content/Intent;)V

    .line 391
    .line 392
    .line 393
    return-void

    .line 394
    :pswitch_9
    iget-object v0, v1, LD1/h;->g:Ljava/lang/Object;

    .line 395
    .line 396
    check-cast v0, LA0/c;

    .line 397
    .line 398
    iget-object v5, v1, LD1/h;->f:Ljava/lang/Object;

    .line 399
    .line 400
    check-cast v5, LT2/b;

    .line 401
    .line 402
    iget-object v0, v0, LA0/c;->f:Ljava/lang/Object;

    .line 403
    .line 404
    move-object v6, v0

    .line 405
    check-cast v6, LT2/k;

    .line 406
    .line 407
    iget-object v7, v6, LT2/k;->a:Lcom/journeyapps/barcodescanner/CaptureActivity;

    .line 408
    .line 409
    iget-boolean v0, v6, LT2/k;->d:Z

    .line 410
    .line 411
    if-eqz v0, :cond_b

    .line 412
    .line 413
    iget-object v0, v5, LT2/b;->b:LT2/v;

    .line 414
    .line 415
    iget-object v8, v0, LT2/v;->a:LT2/s;

    .line 416
    .line 417
    iget v9, v0, LT2/v;->c:I

    .line 418
    .line 419
    new-instance v10, Landroid/graphics/Rect;

    .line 420
    .line 421
    iget v11, v8, LT2/s;->b:I

    .line 422
    .line 423
    iget v12, v8, LT2/s;->c:I

    .line 424
    .line 425
    invoke-direct {v10, v3, v3, v11, v12}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 426
    .line 427
    .line 428
    new-instance v13, Landroid/graphics/YuvImage;

    .line 429
    .line 430
    iget-object v11, v8, LT2/s;->a:Ljava/lang/Object;

    .line 431
    .line 432
    move-object v14, v11

    .line 433
    check-cast v14, [B

    .line 434
    .line 435
    iget v15, v0, LT2/v;->b:I

    .line 436
    .line 437
    iget v0, v8, LT2/s;->b:I

    .line 438
    .line 439
    iget v8, v8, LT2/s;->c:I

    .line 440
    .line 441
    const/16 v18, 0x0

    .line 442
    .line 443
    move/from16 v16, v0

    .line 444
    .line 445
    move/from16 v17, v8

    .line 446
    .line 447
    invoke-direct/range {v13 .. v18}, Landroid/graphics/YuvImage;-><init>([BIII[I)V

    .line 448
    .line 449
    .line 450
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 451
    .line 452
    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 453
    .line 454
    .line 455
    const/16 v8, 0x5a

    .line 456
    .line 457
    invoke-virtual {v13, v10, v8, v0}, Landroid/graphics/YuvImage;->compressToJpeg(Landroid/graphics/Rect;ILjava/io/OutputStream;)Z

    .line 458
    .line 459
    .line 460
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 461
    .line 462
    .line 463
    move-result-object v0

    .line 464
    new-instance v8, Landroid/graphics/BitmapFactory$Options;

    .line 465
    .line 466
    invoke-direct {v8}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 467
    .line 468
    .line 469
    const/4 v10, 0x2

    .line 470
    iput v10, v8, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 471
    .line 472
    array-length v10, v0

    .line 473
    invoke-static {v0, v3, v10, v8}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 474
    .line 475
    .line 476
    move-result-object v11

    .line 477
    if-eqz v9, :cond_a

    .line 478
    .line 479
    new-instance v0, Landroid/graphics/Matrix;

    .line 480
    .line 481
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 482
    .line 483
    .line 484
    int-to-float v8, v9

    .line 485
    invoke-virtual {v0, v8}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 486
    .line 487
    .line 488
    invoke-virtual {v11}, Landroid/graphics/Bitmap;->getWidth()I

    .line 489
    .line 490
    .line 491
    move-result v14

    .line 492
    invoke-virtual {v11}, Landroid/graphics/Bitmap;->getHeight()I

    .line 493
    .line 494
    .line 495
    move-result v15

    .line 496
    const/16 v17, 0x0

    .line 497
    .line 498
    const/4 v12, 0x0

    .line 499
    const/4 v13, 0x0

    .line 500
    move-object/from16 v16, v0

    .line 501
    .line 502
    invoke-static/range {v11 .. v17}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 503
    .line 504
    .line 505
    move-result-object v11

    .line 506
    :cond_a
    :try_start_6
    const-string v0, "barcodeimage"

    .line 507
    .line 508
    const-string v8, ".jpg"

    .line 509
    .line 510
    invoke-virtual {v7}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    .line 511
    .line 512
    .line 513
    move-result-object v9

    .line 514
    invoke-static {v0, v8, v9}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    .line 515
    .line 516
    .line 517
    move-result-object v0

    .line 518
    new-instance v8, Ljava/io/FileOutputStream;

    .line 519
    .line 520
    invoke-direct {v8, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 521
    .line 522
    .line 523
    sget-object v9, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 524
    .line 525
    const/16 v10, 0x64

    .line 526
    .line 527
    invoke-virtual {v11, v9, v10, v8}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 528
    .line 529
    .line 530
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V

    .line 531
    .line 532
    .line 533
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 534
    .line 535
    .line 536
    move-result-object v4
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    .line 537
    goto :goto_b

    .line 538
    :catch_3
    move-exception v0

    .line 539
    const-string v8, "k"

    .line 540
    .line 541
    new-instance v9, Ljava/lang/StringBuilder;

    .line 542
    .line 543
    const-string v10, "Unable to create temporary file and store bitmap! "

    .line 544
    .line 545
    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 546
    .line 547
    .line 548
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 549
    .line 550
    .line 551
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 552
    .line 553
    .line 554
    move-result-object v0

    .line 555
    invoke-static {v8, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 556
    .line 557
    .line 558
    :cond_b
    :goto_b
    new-instance v0, Landroid/content/Intent;

    .line 559
    .line 560
    const-string v8, "com.google.zxing.client.android.SCAN"

    .line 561
    .line 562
    invoke-direct {v0, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 563
    .line 564
    .line 565
    const/high16 v8, 0x80000

    .line 566
    .line 567
    invoke-virtual {v0, v8}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 568
    .line 569
    .line 570
    const-string v8, "SCAN_RESULT"

    .line 571
    .line 572
    iget-object v9, v5, LT2/b;->a:Lr2/m;

    .line 573
    .line 574
    iget-object v9, v9, Lr2/m;->a:Ljava/lang/String;

    .line 575
    .line 576
    invoke-virtual {v0, v8, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 577
    .line 578
    .line 579
    const-string v8, "SCAN_RESULT_FORMAT"

    .line 580
    .line 581
    iget-object v5, v5, LT2/b;->a:Lr2/m;

    .line 582
    .line 583
    iget-object v9, v5, Lr2/m;->d:Lr2/a;

    .line 584
    .line 585
    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 586
    .line 587
    .line 588
    move-result-object v9

    .line 589
    invoke-virtual {v0, v8, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 590
    .line 591
    .line 592
    iget-object v8, v5, Lr2/m;->b:[B

    .line 593
    .line 594
    if-eqz v8, :cond_c

    .line 595
    .line 596
    array-length v9, v8

    .line 597
    if-lez v9, :cond_c

    .line 598
    .line 599
    const-string v9, "SCAN_RESULT_BYTES"

    .line 600
    .line 601
    invoke-virtual {v0, v9, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 602
    .line 603
    .line 604
    :cond_c
    iget-object v5, v5, Lr2/m;->e:Ljava/util/Map;

    .line 605
    .line 606
    if-eqz v5, :cond_10

    .line 607
    .line 608
    sget-object v8, Lr2/n;->m:Lr2/n;

    .line 609
    .line 610
    invoke-interface {v5, v8}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 611
    .line 612
    .line 613
    move-result v9

    .line 614
    if-eqz v9, :cond_d

    .line 615
    .line 616
    const-string v9, "SCAN_RESULT_UPC_EAN_EXTENSION"

    .line 617
    .line 618
    invoke-interface {v5, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 619
    .line 620
    .line 621
    move-result-object v8

    .line 622
    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 623
    .line 624
    .line 625
    move-result-object v8

    .line 626
    invoke-virtual {v0, v9, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 627
    .line 628
    .line 629
    :cond_d
    sget-object v8, Lr2/n;->e:Lr2/n;

    .line 630
    .line 631
    invoke-interface {v5, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 632
    .line 633
    .line 634
    move-result-object v8

    .line 635
    check-cast v8, Ljava/lang/Number;

    .line 636
    .line 637
    if-eqz v8, :cond_e

    .line 638
    .line 639
    const-string v9, "SCAN_RESULT_ORIENTATION"

    .line 640
    .line 641
    invoke-virtual {v8}, Ljava/lang/Number;->intValue()I

    .line 642
    .line 643
    .line 644
    move-result v8

    .line 645
    invoke-virtual {v0, v9, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 646
    .line 647
    .line 648
    :cond_e
    sget-object v8, Lr2/n;->g:Lr2/n;

    .line 649
    .line 650
    invoke-interface {v5, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 651
    .line 652
    .line 653
    move-result-object v8

    .line 654
    check-cast v8, Ljava/lang/String;

    .line 655
    .line 656
    if-eqz v8, :cond_f

    .line 657
    .line 658
    const-string v9, "SCAN_RESULT_ERROR_CORRECTION_LEVEL"

    .line 659
    .line 660
    invoke-virtual {v0, v9, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 661
    .line 662
    .line 663
    :cond_f
    sget-object v8, Lr2/n;->f:Lr2/n;

    .line 664
    .line 665
    invoke-interface {v5, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 666
    .line 667
    .line 668
    move-result-object v5

    .line 669
    check-cast v5, Ljava/lang/Iterable;

    .line 670
    .line 671
    if-eqz v5, :cond_10

    .line 672
    .line 673
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 674
    .line 675
    .line 676
    move-result-object v5

    .line 677
    :goto_c
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 678
    .line 679
    .line 680
    move-result v8

    .line 681
    if-eqz v8, :cond_10

    .line 682
    .line 683
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 684
    .line 685
    .line 686
    move-result-object v8

    .line 687
    check-cast v8, [B

    .line 688
    .line 689
    new-instance v9, Ljava/lang/StringBuilder;

    .line 690
    .line 691
    const-string v10, "SCAN_RESULT_BYTE_SEGMENTS_"

    .line 692
    .line 693
    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 694
    .line 695
    .line 696
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 697
    .line 698
    .line 699
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 700
    .line 701
    .line 702
    move-result-object v9

    .line 703
    invoke-virtual {v0, v9, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 704
    .line 705
    .line 706
    add-int/2addr v3, v2

    .line 707
    goto :goto_c

    .line 708
    :cond_10
    if-eqz v4, :cond_11

    .line 709
    .line 710
    const-string v2, "SCAN_RESULT_IMAGE_PATH"

    .line 711
    .line 712
    invoke-virtual {v0, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 713
    .line 714
    .line 715
    :cond_11
    const/4 v2, -0x1

    .line 716
    invoke-virtual {v7, v2, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 717
    .line 718
    .line 719
    invoke-virtual {v6}, LT2/k;->a()V

    .line 720
    .line 721
    .line 722
    return-void

    .line 723
    :pswitch_a
    iget-object v0, v1, LD1/h;->g:Ljava/lang/Object;

    .line 724
    .line 725
    check-cast v0, LQ2/g;

    .line 726
    .line 727
    iget-object v2, v1, LD1/h;->f:Ljava/lang/Object;

    .line 728
    .line 729
    iget-object v0, v0, LQ2/g;->b:Ljava/lang/Object;

    .line 730
    .line 731
    check-cast v0, LQ2/g;

    .line 732
    .line 733
    invoke-virtual {v0, v2}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 734
    .line 735
    .line 736
    return-void

    .line 737
    :pswitch_b
    iget-object v0, v1, LD1/h;->g:Ljava/lang/Object;

    .line 738
    .line 739
    check-cast v0, Ljava/util/concurrent/Callable;

    .line 740
    .line 741
    iget-object v2, v1, LD1/h;->f:Ljava/lang/Object;

    .line 742
    .line 743
    check-cast v2, LA0/c;

    .line 744
    .line 745
    :try_start_7
    invoke-interface {v0}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    .line 746
    .line 747
    .line 748
    move-result-object v0

    .line 749
    iget-object v3, v2, LA0/c;->f:Ljava/lang/Object;

    .line 750
    .line 751
    check-cast v3, LE1/h;

    .line 752
    .line 753
    if-nez v0, :cond_12

    .line 754
    .line 755
    sget-object v0, Lr/i;->k:Ljava/lang/Object;

    .line 756
    .line 757
    :cond_12
    sget-object v5, Lr/i;->j:LV0/g;

    .line 758
    .line 759
    invoke-virtual {v5, v3, v4, v0}, LV0/g;->f(Lr/i;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 760
    .line 761
    .line 762
    move-result v0

    .line 763
    if-eqz v0, :cond_13

    .line 764
    .line 765
    invoke-static {v3}, Lr/i;->c(Lr/i;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4

    .line 766
    .line 767
    .line 768
    goto :goto_d

    .line 769
    :catch_4
    move-exception v0

    .line 770
    invoke-virtual {v2, v0}, LA0/c;->A(Ljava/lang/Exception;)V

    .line 771
    .line 772
    .line 773
    :cond_13
    :goto_d
    return-void

    .line 774
    :pswitch_c
    iget-object v0, v1, LD1/h;->g:Ljava/lang/Object;

    .line 775
    .line 776
    check-cast v0, LE1/a;

    .line 777
    .line 778
    iget-object v2, v1, LD1/h;->f:Ljava/lang/Object;

    .line 779
    .line 780
    check-cast v2, Ljava/lang/Runnable;

    .line 781
    .line 782
    iget v3, v0, LE1/a;->c:I

    .line 783
    .line 784
    invoke-static {v3}, Landroid/os/Process;->setThreadPriority(I)V

    .line 785
    .line 786
    .line 787
    iget-object v0, v0, LE1/a;->d:Landroid/os/StrictMode$ThreadPolicy;

    .line 788
    .line 789
    if-eqz v0, :cond_14

    .line 790
    .line 791
    invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 792
    .line 793
    .line 794
    :cond_14
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    .line 795
    .line 796
    .line 797
    return-void

    .line 798
    :pswitch_d
    iget-object v0, v1, LD1/h;->g:Ljava/lang/Object;

    .line 799
    .line 800
    check-cast v0, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/JobInfoSchedulerService;

    .line 801
    .line 802
    iget-object v2, v1, LD1/h;->f:Ljava/lang/Object;

    .line 803
    .line 804
    check-cast v2, Landroid/app/job/JobParameters;

    .line 805
    .line 806
    sget v4, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/JobInfoSchedulerService;->e:I

    .line 807
    .line 808
    invoke-virtual {v0, v2, v3}, Landroid/app/job/JobService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    .line 809
    .line 810
    .line 811
    return-void

    .line 812
    :pswitch_e
    iget-object v0, v1, LD1/h;->g:Ljava/lang/Object;

    .line 813
    .line 814
    move-object v2, v0

    .line 815
    check-cast v2, LD1/s;

    .line 816
    .line 817
    iget-object v0, v1, LD1/h;->f:Ljava/lang/Object;

    .line 818
    .line 819
    check-cast v0, LP1/a;

    .line 820
    .line 821
    monitor-enter v2

    .line 822
    :try_start_8
    iget-object v3, v2, LD1/s;->b:Ljava/util/Set;

    .line 823
    .line 824
    if-nez v3, :cond_15

    .line 825
    .line 826
    iget-object v3, v2, LD1/s;->a:Ljava/util/Set;

    .line 827
    .line 828
    invoke-interface {v3, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 829
    .line 830
    .line 831
    goto :goto_e

    .line 832
    :catchall_1
    move-exception v0

    .line 833
    goto :goto_f

    .line 834
    :cond_15
    iget-object v3, v2, LD1/s;->b:Ljava/util/Set;

    .line 835
    .line 836
    invoke-interface {v0}, LP1/a;->get()Ljava/lang/Object;

    .line 837
    .line 838
    .line 839
    move-result-object v0

    .line 840
    invoke-interface {v3, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 841
    .line 842
    .line 843
    :goto_e
    monitor-exit v2

    .line 844
    return-void

    .line 845
    :goto_f
    :try_start_9
    monitor-exit v2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 846
    throw v0

    .line 847
    :pswitch_f
    iget-object v0, v1, LD1/h;->g:Ljava/lang/Object;

    .line 848
    .line 849
    move-object v2, v0

    .line 850
    check-cast v2, LD1/t;

    .line 851
    .line 852
    iget-object v0, v1, LD1/h;->f:Ljava/lang/Object;

    .line 853
    .line 854
    check-cast v0, LP1/a;

    .line 855
    .line 856
    iget-object v3, v2, LD1/t;->b:LP1/a;

    .line 857
    .line 858
    sget-object v5, LD1/t;->d:LD1/g;

    .line 859
    .line 860
    if-ne v3, v5, :cond_16

    .line 861
    .line 862
    monitor-enter v2

    .line 863
    :try_start_a
    iget-object v3, v2, LD1/t;->a:LA1/h;

    .line 864
    .line 865
    iput-object v4, v2, LD1/t;->a:LA1/h;

    .line 866
    .line 867
    iput-object v0, v2, LD1/t;->b:LP1/a;

    .line 868
    .line 869
    monitor-exit v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 870
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 871
    .line 872
    .line 873
    return-void

    .line 874
    :catchall_2
    move-exception v0

    .line 875
    :try_start_b
    monitor-exit v2
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 876
    throw v0

    .line 877
    :cond_16
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 878
    .line 879
    const-string v2, "provide() can be called only once."

    .line 880
    .line 881
    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 882
    .line 883
    .line 884
    throw v0

    .line 885
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
