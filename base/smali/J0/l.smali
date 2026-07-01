.class public final synthetic LJ0/l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, LJ0/l;->a:I

    iput-object p2, p0, LJ0/l;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)Z
    .locals 24

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    iget v2, v1, LJ0/l;->a:I

    .line 6
    .line 7
    const/4 v3, 0x3

    .line 8
    const/4 v5, 0x1

    .line 9
    packed-switch v2, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    iget v0, v0, Landroid/os/Message;->what:I

    .line 13
    .line 14
    iget-object v2, v1, LJ0/l;->b:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v2, LU2/b;

    .line 17
    .line 18
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    if-ne v0, v5, :cond_0

    .line 22
    .line 23
    invoke-virtual {v2}, LU2/b;->b()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v5, 0x0

    .line 28
    :goto_0
    return v5

    .line 29
    :pswitch_0
    iget-object v2, v1, LJ0/l;->b:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast v2, LT2/o;

    .line 32
    .line 33
    iget-object v3, v2, LT2/o;->j:LE/i;

    .line 34
    .line 35
    iget v7, v0, Landroid/os/Message;->what:I

    .line 36
    .line 37
    const v8, 0x7f0800fc

    .line 38
    .line 39
    .line 40
    if-ne v7, v8, :cond_14

    .line 41
    .line 42
    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v0, LT2/v;

    .line 45
    .line 46
    iget-object v7, v2, LT2/o;->e:Landroid/os/Handler;

    .line 47
    .line 48
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 49
    .line 50
    .line 51
    move-result-wide v8

    .line 52
    iget-object v10, v2, LT2/o;->f:Landroid/graphics/Rect;

    .line 53
    .line 54
    iput-object v10, v0, LT2/v;->d:Landroid/graphics/Rect;

    .line 55
    .line 56
    iget-object v11, v0, LT2/v;->a:LT2/s;

    .line 57
    .line 58
    if-nez v10, :cond_1

    .line 59
    .line 60
    const/4 v4, 0x0

    .line 61
    goto/16 :goto_8

    .line 62
    .line 63
    :cond_1
    iget v10, v0, LT2/v;->c:I

    .line 64
    .line 65
    iget-object v12, v11, LT2/s;->a:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast v12, [B

    .line 68
    .line 69
    iget v13, v11, LT2/s;->c:I

    .line 70
    .line 71
    iget v14, v11, LT2/s;->b:I

    .line 72
    .line 73
    const/16 v15, 0x5a

    .line 74
    .line 75
    if-eq v10, v15, :cond_7

    .line 76
    .line 77
    const/16 v15, 0xb4

    .line 78
    .line 79
    if-eq v10, v15, :cond_5

    .line 80
    .line 81
    const/16 v15, 0x10e

    .line 82
    .line 83
    if-eq v10, v15, :cond_2

    .line 84
    .line 85
    move-object v10, v11

    .line 86
    goto :goto_6

    .line 87
    :cond_2
    new-instance v10, LT2/s;

    .line 88
    .line 89
    mul-int v15, v14, v13

    .line 90
    .line 91
    new-array v6, v15, [B

    .line 92
    .line 93
    sub-int/2addr v15, v5

    .line 94
    const/4 v5, 0x0

    .line 95
    :goto_1
    if-ge v5, v14, :cond_4

    .line 96
    .line 97
    add-int/lit8 v17, v13, -0x1

    .line 98
    .line 99
    :goto_2
    if-ltz v17, :cond_3

    .line 100
    .line 101
    mul-int v18, v17, v14

    .line 102
    .line 103
    add-int v18, v18, v5

    .line 104
    .line 105
    aget-byte v18, v12, v18

    .line 106
    .line 107
    aput-byte v18, v6, v15

    .line 108
    .line 109
    add-int/lit8 v15, v15, -0x1

    .line 110
    .line 111
    add-int/lit8 v17, v17, -0x1

    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_3
    add-int/lit8 v5, v5, 0x1

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_4
    invoke-direct {v10, v6, v13, v14}, LT2/s;-><init>([BII)V

    .line 118
    .line 119
    .line 120
    goto :goto_6

    .line 121
    :cond_5
    new-instance v10, LT2/s;

    .line 122
    .line 123
    mul-int v5, v14, v13

    .line 124
    .line 125
    new-array v6, v5, [B

    .line 126
    .line 127
    add-int/lit8 v15, v5, -0x1

    .line 128
    .line 129
    const/4 v4, 0x0

    .line 130
    :goto_3
    if-ge v4, v5, :cond_6

    .line 131
    .line 132
    aget-byte v18, v12, v4

    .line 133
    .line 134
    aput-byte v18, v6, v15

    .line 135
    .line 136
    add-int/lit8 v15, v15, -0x1

    .line 137
    .line 138
    add-int/lit8 v4, v4, 0x1

    .line 139
    .line 140
    goto :goto_3

    .line 141
    :cond_6
    invoke-direct {v10, v6, v14, v13}, LT2/s;-><init>([BII)V

    .line 142
    .line 143
    .line 144
    goto :goto_6

    .line 145
    :cond_7
    new-instance v10, LT2/s;

    .line 146
    .line 147
    mul-int v4, v14, v13

    .line 148
    .line 149
    new-array v4, v4, [B

    .line 150
    .line 151
    const/4 v5, 0x0

    .line 152
    const/4 v6, 0x0

    .line 153
    :goto_4
    if-ge v5, v14, :cond_9

    .line 154
    .line 155
    add-int/lit8 v15, v13, -0x1

    .line 156
    .line 157
    :goto_5
    if-ltz v15, :cond_8

    .line 158
    .line 159
    mul-int v18, v15, v14

    .line 160
    .line 161
    add-int v18, v18, v5

    .line 162
    .line 163
    aget-byte v18, v12, v18

    .line 164
    .line 165
    aput-byte v18, v4, v6

    .line 166
    .line 167
    add-int/lit8 v6, v6, 0x1

    .line 168
    .line 169
    add-int/lit8 v15, v15, -0x1

    .line 170
    .line 171
    goto :goto_5

    .line 172
    :cond_8
    add-int/lit8 v5, v5, 0x1

    .line 173
    .line 174
    goto :goto_4

    .line 175
    :cond_9
    invoke-direct {v10, v4, v13, v14}, LT2/s;-><init>([BII)V

    .line 176
    .line 177
    .line 178
    :goto_6
    iget-object v4, v0, LT2/v;->d:Landroid/graphics/Rect;

    .line 179
    .line 180
    iget-object v5, v10, LT2/s;->a:Ljava/lang/Object;

    .line 181
    .line 182
    check-cast v5, [B

    .line 183
    .line 184
    iget v6, v10, LT2/s;->b:I

    .line 185
    .line 186
    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    .line 187
    .line 188
    .line 189
    move-result v10

    .line 190
    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    .line 191
    .line 192
    .line 193
    move-result v12

    .line 194
    iget v13, v4, Landroid/graphics/Rect;->top:I

    .line 195
    .line 196
    mul-int v14, v10, v12

    .line 197
    .line 198
    new-array v14, v14, [B

    .line 199
    .line 200
    mul-int/2addr v13, v6

    .line 201
    iget v4, v4, Landroid/graphics/Rect;->left:I

    .line 202
    .line 203
    add-int/2addr v13, v4

    .line 204
    const/4 v4, 0x0

    .line 205
    :goto_7
    if-ge v4, v12, :cond_a

    .line 206
    .line 207
    mul-int v15, v4, v10

    .line 208
    .line 209
    invoke-static {v5, v13, v14, v15, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 210
    .line 211
    .line 212
    add-int/2addr v13, v6

    .line 213
    add-int/lit8 v4, v4, 0x1

    .line 214
    .line 215
    goto :goto_7

    .line 216
    :cond_a
    new-instance v18, Lr2/j;

    .line 217
    .line 218
    move/from16 v22, v10

    .line 219
    .line 220
    move/from16 v23, v12

    .line 221
    .line 222
    move/from16 v20, v10

    .line 223
    .line 224
    move/from16 v21, v12

    .line 225
    .line 226
    move-object/from16 v19, v14

    .line 227
    .line 228
    invoke-direct/range {v18 .. v23}, Lr2/j;-><init>([BIIII)V

    .line 229
    .line 230
    .line 231
    move-object/from16 v4, v18

    .line 232
    .line 233
    :goto_8
    if-eqz v4, :cond_d

    .line 234
    .line 235
    iget-object v5, v2, LT2/o;->d:LT2/l;

    .line 236
    .line 237
    invoke-virtual {v5, v4}, LT2/l;->b(Lr2/j;)Lr2/b;

    .line 238
    .line 239
    .line 240
    move-result-object v4

    .line 241
    iget-object v6, v5, LT2/l;->a:Lr2/h;

    .line 242
    .line 243
    iget-object v5, v5, LT2/l;->b:Ljava/util/ArrayList;

    .line 244
    .line 245
    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 246
    .line 247
    .line 248
    if-eqz v6, :cond_c

    .line 249
    .line 250
    :try_start_0
    iget-object v5, v6, Lr2/h;->b:[Lr2/k;

    .line 251
    .line 252
    if-nez v5, :cond_b

    .line 253
    .line 254
    const/4 v5, 0x0

    .line 255
    invoke-virtual {v6, v5}, Lr2/h;->c(Ljava/util/Map;)V

    .line 256
    .line 257
    .line 258
    goto :goto_9

    .line 259
    :catchall_0
    move-exception v0

    .line 260
    goto :goto_b

    .line 261
    :cond_b
    :goto_9
    invoke-virtual {v6, v4}, Lr2/h;->b(Lr2/b;)Lr2/m;

    .line 262
    .line 263
    .line 264
    move-result-object v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 265
    :goto_a
    invoke-virtual {v6}, Lr2/h;->reset()V

    .line 266
    .line 267
    .line 268
    goto :goto_c

    .line 269
    :cond_c
    const/4 v5, 0x0

    .line 270
    :try_start_1
    invoke-virtual {v6, v5}, Lr2/h;->c(Ljava/util/Map;)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {v6, v4}, Lr2/h;->b(Lr2/b;)Lr2/m;

    .line 274
    .line 275
    .line 276
    move-result-object v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 277
    goto :goto_a

    .line 278
    :goto_b
    invoke-virtual {v6}, Lr2/h;->reset()V

    .line 279
    .line 280
    .line 281
    throw v0

    .line 282
    :catch_0
    invoke-virtual {v6}, Lr2/h;->reset()V

    .line 283
    .line 284
    .line 285
    :cond_d
    const/4 v4, 0x0

    .line 286
    :goto_c
    if-eqz v4, :cond_e

    .line 287
    .line 288
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 289
    .line 290
    .line 291
    move-result-wide v5

    .line 292
    const-string v10, "o"

    .line 293
    .line 294
    new-instance v12, Ljava/lang/StringBuilder;

    .line 295
    .line 296
    const-string v13, "Found barcode in "

    .line 297
    .line 298
    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 299
    .line 300
    .line 301
    sub-long/2addr v5, v8

    .line 302
    invoke-virtual {v12, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 303
    .line 304
    .line 305
    const-string v5, " ms"

    .line 306
    .line 307
    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 308
    .line 309
    .line 310
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 311
    .line 312
    .line 313
    move-result-object v5

    .line 314
    invoke-static {v10, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 315
    .line 316
    .line 317
    if-eqz v7, :cond_f

    .line 318
    .line 319
    new-instance v5, LT2/b;

    .line 320
    .line 321
    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    .line 322
    .line 323
    .line 324
    iput-object v4, v5, LT2/b;->a:Lr2/m;

    .line 325
    .line 326
    iput-object v0, v5, LT2/b;->b:LT2/v;

    .line 327
    .line 328
    const v4, 0x7f0800fe

    .line 329
    .line 330
    .line 331
    invoke-static {v7, v4, v5}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    .line 332
    .line 333
    .line 334
    move-result-object v4

    .line 335
    new-instance v5, Landroid/os/Bundle;

    .line 336
    .line 337
    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 338
    .line 339
    .line 340
    invoke-virtual {v4, v5}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 341
    .line 342
    .line 343
    invoke-virtual {v4}, Landroid/os/Message;->sendToTarget()V

    .line 344
    .line 345
    .line 346
    goto :goto_d

    .line 347
    :cond_e
    if-eqz v7, :cond_f

    .line 348
    .line 349
    const v4, 0x7f0800fd

    .line 350
    .line 351
    .line 352
    invoke-static {v7, v4}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    .line 353
    .line 354
    .line 355
    move-result-object v4

    .line 356
    invoke-virtual {v4}, Landroid/os/Message;->sendToTarget()V

    .line 357
    .line 358
    .line 359
    :cond_f
    :goto_d
    if-eqz v7, :cond_12

    .line 360
    .line 361
    iget-object v4, v2, LT2/o;->d:LT2/l;

    .line 362
    .line 363
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 364
    .line 365
    .line 366
    new-instance v5, Ljava/util/ArrayList;

    .line 367
    .line 368
    iget-object v4, v4, LT2/l;->b:Ljava/util/ArrayList;

    .line 369
    .line 370
    invoke-direct {v5, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 371
    .line 372
    .line 373
    new-instance v4, Ljava/util/ArrayList;

    .line 374
    .line 375
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 376
    .line 377
    .line 378
    move-result v6

    .line 379
    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 380
    .line 381
    .line 382
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 383
    .line 384
    .line 385
    move-result v6

    .line 386
    const/4 v8, 0x0

    .line 387
    :goto_e
    if-ge v8, v6, :cond_11

    .line 388
    .line 389
    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 390
    .line 391
    .line 392
    move-result-object v9

    .line 393
    add-int/lit8 v8, v8, 0x1

    .line 394
    .line 395
    check-cast v9, Lr2/o;

    .line 396
    .line 397
    iget v10, v9, Lr2/o;->a:F

    .line 398
    .line 399
    const/4 v12, 0x1

    .line 400
    int-to-float v13, v12

    .line 401
    mul-float/2addr v10, v13

    .line 402
    iget-object v12, v0, LT2/v;->d:Landroid/graphics/Rect;

    .line 403
    .line 404
    iget v14, v12, Landroid/graphics/Rect;->left:I

    .line 405
    .line 406
    int-to-float v14, v14

    .line 407
    add-float/2addr v10, v14

    .line 408
    iget v9, v9, Lr2/o;->b:F

    .line 409
    .line 410
    mul-float/2addr v9, v13

    .line 411
    iget v12, v12, Landroid/graphics/Rect;->top:I

    .line 412
    .line 413
    int-to-float v12, v12

    .line 414
    add-float/2addr v9, v12

    .line 415
    iget-boolean v12, v0, LT2/v;->e:Z

    .line 416
    .line 417
    if-eqz v12, :cond_10

    .line 418
    .line 419
    iget v12, v11, LT2/s;->b:I

    .line 420
    .line 421
    int-to-float v12, v12

    .line 422
    sub-float v10, v12, v10

    .line 423
    .line 424
    :cond_10
    new-instance v12, Lr2/o;

    .line 425
    .line 426
    invoke-direct {v12, v10, v9}, Lr2/o;-><init>(FF)V

    .line 427
    .line 428
    .line 429
    invoke-virtual {v4, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 430
    .line 431
    .line 432
    goto :goto_e

    .line 433
    :cond_11
    const v0, 0x7f0800ff

    .line 434
    .line 435
    .line 436
    invoke-static {v7, v0, v4}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    .line 437
    .line 438
    .line 439
    move-result-object v0

    .line 440
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 441
    .line 442
    .line 443
    :cond_12
    iget-object v0, v2, LT2/o;->a:LU2/g;

    .line 444
    .line 445
    iget-object v2, v0, LU2/g;->h:Landroid/os/Handler;

    .line 446
    .line 447
    new-instance v4, LU2/d;

    .line 448
    .line 449
    const/4 v5, 0x0

    .line 450
    invoke-direct {v4, v0, v3, v5}, LU2/d;-><init>(LU2/g;LE/i;I)V

    .line 451
    .line 452
    .line 453
    invoke-virtual {v2, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 454
    .line 455
    .line 456
    :cond_13
    :goto_f
    const/4 v12, 0x1

    .line 457
    goto :goto_10

    .line 458
    :cond_14
    const/4 v5, 0x0

    .line 459
    const v0, 0x7f080100

    .line 460
    .line 461
    .line 462
    if-ne v7, v0, :cond_13

    .line 463
    .line 464
    iget-object v0, v2, LT2/o;->a:LU2/g;

    .line 465
    .line 466
    iget-object v2, v0, LU2/g;->h:Landroid/os/Handler;

    .line 467
    .line 468
    new-instance v4, LU2/d;

    .line 469
    .line 470
    invoke-direct {v4, v0, v3, v5}, LU2/d;-><init>(LU2/g;LE/i;I)V

    .line 471
    .line 472
    .line 473
    invoke-virtual {v2, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 474
    .line 475
    .line 476
    goto :goto_f

    .line 477
    :goto_10
    return v12

    .line 478
    :pswitch_1
    move v12, v5

    .line 479
    iget v2, v0, Landroid/os/Message;->what:I

    .line 480
    .line 481
    const-string v4, "Timeout waiting for ServiceConnection callback "

    .line 482
    .line 483
    if-eqz v2, :cond_19

    .line 484
    .line 485
    if-eq v2, v12, :cond_15

    .line 486
    .line 487
    const/4 v5, 0x0

    .line 488
    goto/16 :goto_15

    .line 489
    .line 490
    :cond_15
    iget-object v2, v1, LJ0/l;->b:Ljava/lang/Object;

    .line 491
    .line 492
    check-cast v2, LN0/y;

    .line 493
    .line 494
    iget-object v5, v2, LN0/y;->a:Ljava/util/HashMap;

    .line 495
    .line 496
    monitor-enter v5

    .line 497
    :try_start_2
    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 498
    .line 499
    check-cast v0, LN0/w;

    .line 500
    .line 501
    iget-object v2, v2, LN0/y;->a:Ljava/util/HashMap;

    .line 502
    .line 503
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 504
    .line 505
    .line 506
    move-result-object v2

    .line 507
    check-cast v2, LN0/x;

    .line 508
    .line 509
    if-eqz v2, :cond_18

    .line 510
    .line 511
    iget v6, v2, LN0/x;->b:I

    .line 512
    .line 513
    if-ne v6, v3, :cond_18

    .line 514
    .line 515
    const-string v3, "GmsClientSupervisor"

    .line 516
    .line 517
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 518
    .line 519
    .line 520
    move-result-object v6

    .line 521
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 522
    .line 523
    .line 524
    move-result v7

    .line 525
    add-int/lit8 v7, v7, 0x2f

    .line 526
    .line 527
    new-instance v8, Ljava/lang/StringBuilder;

    .line 528
    .line 529
    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 530
    .line 531
    .line 532
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 533
    .line 534
    .line 535
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 536
    .line 537
    .line 538
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 539
    .line 540
    .line 541
    move-result-object v4

    .line 542
    new-instance v6, Ljava/lang/Exception;

    .line 543
    .line 544
    invoke-direct {v6}, Ljava/lang/Exception;-><init>()V

    .line 545
    .line 546
    .line 547
    invoke-static {v3, v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 548
    .line 549
    .line 550
    iget-object v3, v2, LN0/x;->f:Landroid/content/ComponentName;

    .line 551
    .line 552
    if-nez v3, :cond_16

    .line 553
    .line 554
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 555
    .line 556
    .line 557
    const/4 v4, 0x0

    .line 558
    goto :goto_11

    .line 559
    :catchall_1
    move-exception v0

    .line 560
    goto :goto_13

    .line 561
    :cond_16
    move-object v4, v3

    .line 562
    :goto_11
    if-nez v4, :cond_17

    .line 563
    .line 564
    new-instance v4, Landroid/content/ComponentName;

    .line 565
    .line 566
    iget-object v0, v0, LN0/w;->b:Ljava/lang/String;

    .line 567
    .line 568
    invoke-static {v0}, LN0/n;->e(Ljava/lang/Object;)V

    .line 569
    .line 570
    .line 571
    const-string v3, "unknown"

    .line 572
    .line 573
    invoke-direct {v4, v0, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 574
    .line 575
    .line 576
    :cond_17
    invoke-virtual {v2, v4}, LN0/x;->onServiceDisconnected(Landroid/content/ComponentName;)V

    .line 577
    .line 578
    .line 579
    :cond_18
    monitor-exit v5

    .line 580
    :goto_12
    const/4 v5, 0x1

    .line 581
    goto :goto_15

    .line 582
    :goto_13
    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 583
    throw v0

    .line 584
    :cond_19
    iget-object v2, v1, LJ0/l;->b:Ljava/lang/Object;

    .line 585
    .line 586
    check-cast v2, LN0/y;

    .line 587
    .line 588
    iget-object v4, v2, LN0/y;->a:Ljava/util/HashMap;

    .line 589
    .line 590
    monitor-enter v4

    .line 591
    :try_start_3
    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 592
    .line 593
    check-cast v0, LN0/w;

    .line 594
    .line 595
    iget-object v3, v2, LN0/y;->a:Ljava/util/HashMap;

    .line 596
    .line 597
    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 598
    .line 599
    .line 600
    move-result-object v3

    .line 601
    check-cast v3, LN0/x;

    .line 602
    .line 603
    if-eqz v3, :cond_1b

    .line 604
    .line 605
    iget-object v5, v3, LN0/x;->a:Ljava/util/HashMap;

    .line 606
    .line 607
    invoke-virtual {v5}, Ljava/util/HashMap;->isEmpty()Z

    .line 608
    .line 609
    .line 610
    move-result v5

    .line 611
    if-eqz v5, :cond_1b

    .line 612
    .line 613
    iget-boolean v5, v3, LN0/x;->c:Z

    .line 614
    .line 615
    if-eqz v5, :cond_1a

    .line 616
    .line 617
    iget-object v5, v3, LN0/x;->e:LN0/w;

    .line 618
    .line 619
    iget-object v6, v3, LN0/x;->g:LN0/y;

    .line 620
    .line 621
    iget-object v7, v6, LN0/y;->c:LW0/e;

    .line 622
    .line 623
    const/4 v12, 0x1

    .line 624
    invoke-virtual {v7, v12, v5}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    .line 625
    .line 626
    .line 627
    iget-object v5, v6, LN0/y;->d:LQ0/a;

    .line 628
    .line 629
    iget-object v6, v6, LN0/y;->b:Landroid/content/Context;

    .line 630
    .line 631
    invoke-virtual {v5, v6, v3}, LQ0/a;->b(Landroid/content/Context;Landroid/content/ServiceConnection;)V

    .line 632
    .line 633
    .line 634
    const/4 v5, 0x0

    .line 635
    iput-boolean v5, v3, LN0/x;->c:Z

    .line 636
    .line 637
    const/4 v5, 0x2

    .line 638
    iput v5, v3, LN0/x;->b:I

    .line 639
    .line 640
    :cond_1a
    iget-object v2, v2, LN0/y;->a:Ljava/util/HashMap;

    .line 641
    .line 642
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 643
    .line 644
    .line 645
    goto :goto_14

    .line 646
    :catchall_2
    move-exception v0

    .line 647
    goto :goto_16

    .line 648
    :cond_1b
    :goto_14
    monitor-exit v4

    .line 649
    goto :goto_12

    .line 650
    :goto_15
    return v5

    .line 651
    :goto_16
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 652
    throw v0

    .line 653
    :pswitch_2
    const-string v2, "Received response for unknown request: "

    .line 654
    .line 655
    const-string v4, "MessengerIpcClient"

    .line 656
    .line 657
    iget v5, v0, Landroid/os/Message;->arg1:I

    .line 658
    .line 659
    invoke-static {v4, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 660
    .line 661
    .line 662
    move-result v3

    .line 663
    if-eqz v3, :cond_1c

    .line 664
    .line 665
    new-instance v3, Ljava/lang/StringBuilder;

    .line 666
    .line 667
    const-string v4, "Received response to request: "

    .line 668
    .line 669
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 670
    .line 671
    .line 672
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 673
    .line 674
    .line 675
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 676
    .line 677
    .line 678
    move-result-object v3

    .line 679
    const-string v4, "MessengerIpcClient"

    .line 680
    .line 681
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 682
    .line 683
    .line 684
    :cond_1c
    iget-object v3, v1, LJ0/l;->b:Ljava/lang/Object;

    .line 685
    .line 686
    check-cast v3, LJ0/m;

    .line 687
    .line 688
    monitor-enter v3

    .line 689
    :try_start_4
    iget-object v4, v3, LJ0/m;->e:Landroid/util/SparseArray;

    .line 690
    .line 691
    invoke-virtual {v4, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 692
    .line 693
    .line 694
    move-result-object v4

    .line 695
    check-cast v4, LJ0/n;

    .line 696
    .line 697
    if-nez v4, :cond_1d

    .line 698
    .line 699
    const-string v0, "MessengerIpcClient"

    .line 700
    .line 701
    new-instance v4, Ljava/lang/StringBuilder;

    .line 702
    .line 703
    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 704
    .line 705
    .line 706
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 707
    .line 708
    .line 709
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 710
    .line 711
    .line 712
    move-result-object v2

    .line 713
    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 714
    .line 715
    .line 716
    monitor-exit v3

    .line 717
    :goto_17
    const/16 v16, 0x1

    .line 718
    .line 719
    goto :goto_18

    .line 720
    :catchall_3
    move-exception v0

    .line 721
    goto :goto_19

    .line 722
    :cond_1d
    iget-object v2, v3, LJ0/m;->e:Landroid/util/SparseArray;

    .line 723
    .line 724
    invoke-virtual {v2, v5}, Landroid/util/SparseArray;->remove(I)V

    .line 725
    .line 726
    .line 727
    invoke-virtual {v3}, LJ0/m;->c()V

    .line 728
    .line 729
    .line 730
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 731
    invoke-virtual {v0}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    .line 732
    .line 733
    .line 734
    move-result-object v0

    .line 735
    const-string v2, "unsupported"

    .line 736
    .line 737
    const/4 v5, 0x0

    .line 738
    invoke-virtual {v0, v2, v5}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 739
    .line 740
    .line 741
    move-result v2

    .line 742
    if-eqz v2, :cond_1e

    .line 743
    .line 744
    const-string v0, "Not supported by GmsCore"

    .line 745
    .line 746
    new-instance v2, LJ0/o;

    .line 747
    .line 748
    const/4 v5, 0x0

    .line 749
    invoke-direct {v2, v0, v5}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 750
    .line 751
    .line 752
    invoke-virtual {v4, v2}, LJ0/n;->b(LJ0/o;)V

    .line 753
    .line 754
    .line 755
    goto :goto_17

    .line 756
    :cond_1e
    iget v2, v4, LJ0/n;->e:I

    .line 757
    .line 758
    packed-switch v2, :pswitch_data_1

    .line 759
    .line 760
    .line 761
    const-string v2, "data"

    .line 762
    .line 763
    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 764
    .line 765
    .line 766
    move-result-object v0

    .line 767
    if-nez v0, :cond_1f

    .line 768
    .line 769
    sget-object v0, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    .line 770
    .line 771
    :cond_1f
    invoke-virtual {v4, v0}, LJ0/n;->c(Landroid/os/Bundle;)V

    .line 772
    .line 773
    .line 774
    goto :goto_17

    .line 775
    :pswitch_3
    const-string v2, "ack"

    .line 776
    .line 777
    const/4 v5, 0x0

    .line 778
    invoke-virtual {v0, v2, v5}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 779
    .line 780
    .line 781
    move-result v0

    .line 782
    if-eqz v0, :cond_20

    .line 783
    .line 784
    const/4 v5, 0x0

    .line 785
    invoke-virtual {v4, v5}, LJ0/n;->c(Landroid/os/Bundle;)V

    .line 786
    .line 787
    .line 788
    goto :goto_17

    .line 789
    :cond_20
    const/4 v5, 0x0

    .line 790
    const-string v0, "Invalid response to one way request"

    .line 791
    .line 792
    new-instance v2, LJ0/o;

    .line 793
    .line 794
    invoke-direct {v2, v0, v5}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 795
    .line 796
    .line 797
    invoke-virtual {v4, v2}, LJ0/n;->b(LJ0/o;)V

    .line 798
    .line 799
    .line 800
    goto :goto_17

    .line 801
    :goto_18
    return v16

    .line 802
    :goto_19
    :try_start_5
    monitor-exit v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 803
    throw v0

    .line 804
    nop

    .line 805
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 806
    .line 807
    .line 808
    .line 809
    .line 810
    .line 811
    .line 812
    .line 813
    .line 814
    .line 815
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_3
    .end packed-switch
.end method
