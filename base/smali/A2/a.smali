.class public final LA2/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr2/k;


# static fields
.field public static final b:[Lr2/o;


# instance fields
.field public final a:LB2/d;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Lr2/o;

    .line 3
    .line 4
    sput-object v0, LA2/a;->b:[Lr2/o;

    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, LB2/d;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, LB2/d;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, LA2/a;->a:LB2/d;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a(Lr2/b;Ljava/util/Map;)Lr2/m;
    .locals 26

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    iget-object v2, v0, LA2/a;->a:LB2/d;

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    const/4 v4, 0x0

    .line 9
    if-eqz v1, :cond_8

    .line 10
    .line 11
    sget-object v5, Lr2/d;->f:Lr2/d;

    .line 12
    .line 13
    invoke-interface {v1, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_8

    .line 18
    .line 19
    invoke-virtual/range {p1 .. p1}, Lr2/b;->a()Lx2/b;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Lx2/b;->e()[I

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    invoke-virtual {v1}, Lx2/b;->c()[I

    .line 28
    .line 29
    .line 30
    move-result-object v6

    .line 31
    if-eqz v5, :cond_7

    .line 32
    .line 33
    if-eqz v6, :cond_7

    .line 34
    .line 35
    iget v7, v1, Lx2/b;->e:I

    .line 36
    .line 37
    aget v8, v5, v4

    .line 38
    .line 39
    aget v9, v5, v3

    .line 40
    .line 41
    :goto_0
    if-ge v8, v7, :cond_0

    .line 42
    .line 43
    invoke-virtual {v1, v8, v9}, Lx2/b;->b(II)Z

    .line 44
    .line 45
    .line 46
    move-result v10

    .line 47
    if-eqz v10, :cond_0

    .line 48
    .line 49
    add-int/lit8 v8, v8, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    if-eq v8, v7, :cond_6

    .line 53
    .line 54
    aget v7, v5, v4

    .line 55
    .line 56
    sub-int/2addr v8, v7

    .line 57
    if-eqz v8, :cond_5

    .line 58
    .line 59
    aget v5, v5, v3

    .line 60
    .line 61
    aget v9, v6, v3

    .line 62
    .line 63
    aget v6, v6, v4

    .line 64
    .line 65
    sub-int/2addr v6, v7

    .line 66
    add-int/2addr v6, v3

    .line 67
    div-int/2addr v6, v8

    .line 68
    sub-int/2addr v9, v5

    .line 69
    add-int/2addr v9, v3

    .line 70
    div-int/2addr v9, v8

    .line 71
    if-lez v6, :cond_4

    .line 72
    .line 73
    if-lez v9, :cond_4

    .line 74
    .line 75
    div-int/lit8 v3, v8, 0x2

    .line 76
    .line 77
    add-int/2addr v5, v3

    .line 78
    add-int/2addr v7, v3

    .line 79
    new-instance v3, Lx2/b;

    .line 80
    .line 81
    invoke-direct {v3, v6, v9}, Lx2/b;-><init>(II)V

    .line 82
    .line 83
    .line 84
    move v10, v4

    .line 85
    :goto_1
    if-ge v10, v9, :cond_3

    .line 86
    .line 87
    mul-int v11, v10, v8

    .line 88
    .line 89
    add-int/2addr v11, v5

    .line 90
    move v12, v4

    .line 91
    :goto_2
    if-ge v12, v6, :cond_2

    .line 92
    .line 93
    mul-int v13, v12, v8

    .line 94
    .line 95
    add-int/2addr v13, v7

    .line 96
    invoke-virtual {v1, v13, v11}, Lx2/b;->b(II)Z

    .line 97
    .line 98
    .line 99
    move-result v13

    .line 100
    if-eqz v13, :cond_1

    .line 101
    .line 102
    invoke-virtual {v3, v12, v10}, Lx2/b;->h(II)V

    .line 103
    .line 104
    .line 105
    :cond_1
    add-int/lit8 v12, v12, 0x1

    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_2
    add-int/lit8 v10, v10, 0x1

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_3
    invoke-virtual {v2, v3}, LB2/d;->c(Lx2/b;)Lx2/d;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    sget-object v2, LA2/a;->b:[Lr2/o;

    .line 116
    .line 117
    goto/16 :goto_7

    .line 118
    .line 119
    :cond_4
    invoke-static {}, Lr2/i;->a()Lr2/i;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    throw v1

    .line 124
    :cond_5
    invoke-static {}, Lr2/i;->a()Lr2/i;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    throw v1

    .line 129
    :cond_6
    invoke-static {}, Lr2/i;->a()Lr2/i;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    throw v1

    .line 134
    :cond_7
    invoke-static {}, Lr2/i;->a()Lr2/i;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    throw v1

    .line 139
    :cond_8
    new-instance v1, LA/c;

    .line 140
    .line 141
    invoke-virtual/range {p1 .. p1}, Lr2/b;->a()Lx2/b;

    .line 142
    .line 143
    .line 144
    move-result-object v5

    .line 145
    const/4 v6, 0x1

    .line 146
    invoke-direct {v1, v5, v6}, LA/c;-><init>(Lx2/b;I)V

    .line 147
    .line 148
    .line 149
    iget-object v6, v1, LA/c;->g:Ljava/lang/Object;

    .line 150
    .line 151
    check-cast v6, Ld3/d;

    .line 152
    .line 153
    invoke-virtual {v6}, Ld3/d;->b()[Lr2/o;

    .line 154
    .line 155
    .line 156
    move-result-object v6

    .line 157
    aget-object v7, v6, v4

    .line 158
    .line 159
    aget-object v8, v6, v3

    .line 160
    .line 161
    const/4 v9, 0x3

    .line 162
    aget-object v10, v6, v9

    .line 163
    .line 164
    const/4 v11, 0x2

    .line 165
    aget-object v6, v6, v11

    .line 166
    .line 167
    invoke-virtual {v1, v7, v8}, LA/c;->U(Lr2/o;Lr2/o;)I

    .line 168
    .line 169
    .line 170
    move-result v12

    .line 171
    invoke-virtual {v1, v8, v10}, LA/c;->U(Lr2/o;Lr2/o;)I

    .line 172
    .line 173
    .line 174
    move-result v13

    .line 175
    invoke-virtual {v1, v10, v6}, LA/c;->U(Lr2/o;Lr2/o;)I

    .line 176
    .line 177
    .line 178
    move-result v14

    .line 179
    invoke-virtual {v1, v6, v7}, LA/c;->U(Lr2/o;Lr2/o;)I

    .line 180
    .line 181
    .line 182
    move-result v15

    .line 183
    move/from16 v16, v4

    .line 184
    .line 185
    const/4 v4, 0x4

    .line 186
    move/from16 p1, v9

    .line 187
    .line 188
    new-array v9, v4, [Lr2/o;

    .line 189
    .line 190
    aput-object v6, v9, v16

    .line 191
    .line 192
    aput-object v7, v9, v3

    .line 193
    .line 194
    aput-object v8, v9, v11

    .line 195
    .line 196
    aput-object v10, v9, p1

    .line 197
    .line 198
    if-le v12, v13, :cond_9

    .line 199
    .line 200
    aput-object v7, v9, v16

    .line 201
    .line 202
    aput-object v8, v9, v3

    .line 203
    .line 204
    aput-object v10, v9, v11

    .line 205
    .line 206
    aput-object v6, v9, p1

    .line 207
    .line 208
    move v12, v13

    .line 209
    :cond_9
    if-le v12, v14, :cond_a

    .line 210
    .line 211
    aput-object v8, v9, v16

    .line 212
    .line 213
    aput-object v10, v9, v3

    .line 214
    .line 215
    aput-object v6, v9, v11

    .line 216
    .line 217
    aput-object v7, v9, p1

    .line 218
    .line 219
    goto :goto_3

    .line 220
    :cond_a
    move v14, v12

    .line 221
    :goto_3
    if-le v14, v15, :cond_b

    .line 222
    .line 223
    aput-object v10, v9, v16

    .line 224
    .line 225
    aput-object v6, v9, v3

    .line 226
    .line 227
    aput-object v7, v9, v11

    .line 228
    .line 229
    aput-object v8, v9, p1

    .line 230
    .line 231
    :cond_b
    aget-object v6, v9, v16

    .line 232
    .line 233
    aget-object v7, v9, v3

    .line 234
    .line 235
    aget-object v8, v9, v11

    .line 236
    .line 237
    aget-object v10, v9, p1

    .line 238
    .line 239
    invoke-virtual {v1, v6, v10}, LA/c;->U(Lr2/o;Lr2/o;)I

    .line 240
    .line 241
    .line 242
    move-result v12

    .line 243
    add-int/2addr v12, v3

    .line 244
    mul-int/2addr v12, v4

    .line 245
    invoke-static {v7, v8, v12}, LA/c;->Q(Lr2/o;Lr2/o;I)Lr2/o;

    .line 246
    .line 247
    .line 248
    move-result-object v13

    .line 249
    invoke-static {v8, v7, v12}, LA/c;->Q(Lr2/o;Lr2/o;I)Lr2/o;

    .line 250
    .line 251
    .line 252
    move-result-object v12

    .line 253
    invoke-virtual {v1, v13, v6}, LA/c;->U(Lr2/o;Lr2/o;)I

    .line 254
    .line 255
    .line 256
    move-result v13

    .line 257
    invoke-virtual {v1, v12, v10}, LA/c;->U(Lr2/o;Lr2/o;)I

    .line 258
    .line 259
    .line 260
    move-result v12

    .line 261
    if-ge v13, v12, :cond_c

    .line 262
    .line 263
    aput-object v6, v9, v16

    .line 264
    .line 265
    aput-object v7, v9, v3

    .line 266
    .line 267
    aput-object v8, v9, v11

    .line 268
    .line 269
    aput-object v10, v9, p1

    .line 270
    .line 271
    goto :goto_4

    .line 272
    :cond_c
    aput-object v7, v9, v16

    .line 273
    .line 274
    aput-object v8, v9, v3

    .line 275
    .line 276
    aput-object v10, v9, v11

    .line 277
    .line 278
    aput-object v6, v9, p1

    .line 279
    .line 280
    :goto_4
    aget-object v6, v9, v16

    .line 281
    .line 282
    aget-object v7, v9, v3

    .line 283
    .line 284
    aget-object v8, v9, v11

    .line 285
    .line 286
    aget-object v10, v9, p1

    .line 287
    .line 288
    invoke-virtual {v1, v6, v10}, LA/c;->U(Lr2/o;Lr2/o;)I

    .line 289
    .line 290
    .line 291
    move-result v12

    .line 292
    invoke-virtual {v1, v7, v10}, LA/c;->U(Lr2/o;Lr2/o;)I

    .line 293
    .line 294
    .line 295
    move-result v13

    .line 296
    add-int/2addr v13, v3

    .line 297
    mul-int/2addr v13, v4

    .line 298
    invoke-static {v6, v7, v13}, LA/c;->Q(Lr2/o;Lr2/o;I)Lr2/o;

    .line 299
    .line 300
    .line 301
    move-result-object v13

    .line 302
    add-int/2addr v12, v3

    .line 303
    mul-int/2addr v12, v4

    .line 304
    invoke-static {v8, v7, v12}, LA/c;->Q(Lr2/o;Lr2/o;I)Lr2/o;

    .line 305
    .line 306
    .line 307
    move-result-object v12

    .line 308
    invoke-virtual {v1, v13, v10}, LA/c;->U(Lr2/o;Lr2/o;)I

    .line 309
    .line 310
    .line 311
    move-result v14

    .line 312
    invoke-virtual {v1, v12, v10}, LA/c;->U(Lr2/o;Lr2/o;)I

    .line 313
    .line 314
    .line 315
    move-result v15

    .line 316
    move/from16 p2, v4

    .line 317
    .line 318
    new-instance v4, Lr2/o;

    .line 319
    .line 320
    move/from16 v17, v11

    .line 321
    .line 322
    iget v11, v10, Lr2/o;->a:F

    .line 323
    .line 324
    move/from16 v18, v3

    .line 325
    .line 326
    iget v3, v8, Lr2/o;->a:F

    .line 327
    .line 328
    iget v0, v7, Lr2/o;->a:F

    .line 329
    .line 330
    sub-float/2addr v3, v0

    .line 331
    add-int/lit8 v14, v14, 0x1

    .line 332
    .line 333
    int-to-float v14, v14

    .line 334
    div-float/2addr v3, v14

    .line 335
    add-float/2addr v3, v11

    .line 336
    iget v10, v10, Lr2/o;->b:F

    .line 337
    .line 338
    iget v8, v8, Lr2/o;->b:F

    .line 339
    .line 340
    iget v7, v7, Lr2/o;->b:F

    .line 341
    .line 342
    sub-float/2addr v8, v7

    .line 343
    div-float/2addr v8, v14

    .line 344
    add-float/2addr v8, v10

    .line 345
    invoke-direct {v4, v3, v8}, Lr2/o;-><init>(FF)V

    .line 346
    .line 347
    .line 348
    new-instance v3, Lr2/o;

    .line 349
    .line 350
    iget v8, v6, Lr2/o;->a:F

    .line 351
    .line 352
    sub-float/2addr v8, v0

    .line 353
    add-int/lit8 v15, v15, 0x1

    .line 354
    .line 355
    int-to-float v0, v15

    .line 356
    div-float/2addr v8, v0

    .line 357
    add-float/2addr v8, v11

    .line 358
    iget v6, v6, Lr2/o;->b:F

    .line 359
    .line 360
    sub-float/2addr v6, v7

    .line 361
    div-float/2addr v6, v0

    .line 362
    add-float/2addr v6, v10

    .line 363
    invoke-direct {v3, v8, v6}, Lr2/o;-><init>(FF)V

    .line 364
    .line 365
    .line 366
    invoke-virtual {v1, v4}, LA/c;->E(Lr2/o;)Z

    .line 367
    .line 368
    .line 369
    move-result v0

    .line 370
    if-nez v0, :cond_e

    .line 371
    .line 372
    invoke-virtual {v1, v3}, LA/c;->E(Lr2/o;)Z

    .line 373
    .line 374
    .line 375
    move-result v0

    .line 376
    if-eqz v0, :cond_d

    .line 377
    .line 378
    goto :goto_5

    .line 379
    :cond_d
    const/4 v4, 0x0

    .line 380
    goto :goto_6

    .line 381
    :cond_e
    invoke-virtual {v1, v3}, LA/c;->E(Lr2/o;)Z

    .line 382
    .line 383
    .line 384
    move-result v0

    .line 385
    if-nez v0, :cond_f

    .line 386
    .line 387
    goto :goto_6

    .line 388
    :cond_f
    invoke-virtual {v1, v13, v4}, LA/c;->U(Lr2/o;Lr2/o;)I

    .line 389
    .line 390
    .line 391
    move-result v0

    .line 392
    invoke-virtual {v1, v12, v4}, LA/c;->U(Lr2/o;Lr2/o;)I

    .line 393
    .line 394
    .line 395
    move-result v6

    .line 396
    add-int/2addr v6, v0

    .line 397
    invoke-virtual {v1, v13, v3}, LA/c;->U(Lr2/o;Lr2/o;)I

    .line 398
    .line 399
    .line 400
    move-result v0

    .line 401
    invoke-virtual {v1, v12, v3}, LA/c;->U(Lr2/o;Lr2/o;)I

    .line 402
    .line 403
    .line 404
    move-result v7

    .line 405
    add-int/2addr v7, v0

    .line 406
    if-le v6, v7, :cond_10

    .line 407
    .line 408
    goto :goto_6

    .line 409
    :cond_10
    :goto_5
    move-object v4, v3

    .line 410
    :goto_6
    aput-object v4, v9, p1

    .line 411
    .line 412
    if-eqz v4, :cond_18

    .line 413
    .line 414
    aget-object v0, v9, v16

    .line 415
    .line 416
    aget-object v3, v9, v18

    .line 417
    .line 418
    aget-object v6, v9, v17

    .line 419
    .line 420
    invoke-virtual {v1, v0, v4}, LA/c;->U(Lr2/o;Lr2/o;)I

    .line 421
    .line 422
    .line 423
    move-result v7

    .line 424
    add-int/lit8 v7, v7, 0x1

    .line 425
    .line 426
    invoke-virtual {v1, v6, v4}, LA/c;->U(Lr2/o;Lr2/o;)I

    .line 427
    .line 428
    .line 429
    move-result v8

    .line 430
    add-int/lit8 v8, v8, 0x1

    .line 431
    .line 432
    mul-int/lit8 v8, v8, 0x4

    .line 433
    .line 434
    invoke-static {v0, v3, v8}, LA/c;->Q(Lr2/o;Lr2/o;I)Lr2/o;

    .line 435
    .line 436
    .line 437
    move-result-object v8

    .line 438
    mul-int/lit8 v7, v7, 0x4

    .line 439
    .line 440
    invoke-static {v6, v3, v7}, LA/c;->Q(Lr2/o;Lr2/o;I)Lr2/o;

    .line 441
    .line 442
    .line 443
    move-result-object v7

    .line 444
    invoke-virtual {v1, v8, v4}, LA/c;->U(Lr2/o;Lr2/o;)I

    .line 445
    .line 446
    .line 447
    move-result v8

    .line 448
    add-int/lit8 v9, v8, 0x1

    .line 449
    .line 450
    invoke-virtual {v1, v7, v4}, LA/c;->U(Lr2/o;Lr2/o;)I

    .line 451
    .line 452
    .line 453
    move-result v7

    .line 454
    add-int/lit8 v10, v7, 0x1

    .line 455
    .line 456
    and-int/lit8 v11, v9, 0x1

    .line 457
    .line 458
    move/from16 v12, v18

    .line 459
    .line 460
    if-ne v11, v12, :cond_11

    .line 461
    .line 462
    add-int/lit8 v9, v8, 0x2

    .line 463
    .line 464
    :cond_11
    and-int/lit8 v8, v10, 0x1

    .line 465
    .line 466
    if-ne v8, v12, :cond_12

    .line 467
    .line 468
    add-int/lit8 v10, v7, 0x2

    .line 469
    .line 470
    :cond_12
    iget v7, v0, Lr2/o;->a:F

    .line 471
    .line 472
    iget v8, v3, Lr2/o;->a:F

    .line 473
    .line 474
    add-float/2addr v7, v8

    .line 475
    iget v8, v6, Lr2/o;->a:F

    .line 476
    .line 477
    add-float/2addr v7, v8

    .line 478
    iget v8, v4, Lr2/o;->a:F

    .line 479
    .line 480
    add-float/2addr v7, v8

    .line 481
    const/high16 v8, 0x40800000    # 4.0f

    .line 482
    .line 483
    div-float/2addr v7, v8

    .line 484
    iget v11, v0, Lr2/o;->b:F

    .line 485
    .line 486
    iget v12, v3, Lr2/o;->b:F

    .line 487
    .line 488
    add-float/2addr v11, v12

    .line 489
    iget v12, v6, Lr2/o;->b:F

    .line 490
    .line 491
    add-float/2addr v11, v12

    .line 492
    iget v12, v4, Lr2/o;->b:F

    .line 493
    .line 494
    add-float/2addr v11, v12

    .line 495
    div-float/2addr v11, v8

    .line 496
    invoke-static {v0, v7, v11}, LA/c;->H(Lr2/o;FF)Lr2/o;

    .line 497
    .line 498
    .line 499
    move-result-object v0

    .line 500
    invoke-static {v3, v7, v11}, LA/c;->H(Lr2/o;FF)Lr2/o;

    .line 501
    .line 502
    .line 503
    move-result-object v3

    .line 504
    invoke-static {v6, v7, v11}, LA/c;->H(Lr2/o;FF)Lr2/o;

    .line 505
    .line 506
    .line 507
    move-result-object v6

    .line 508
    invoke-static {v4, v7, v11}, LA/c;->H(Lr2/o;FF)Lr2/o;

    .line 509
    .line 510
    .line 511
    move-result-object v4

    .line 512
    mul-int/lit8 v10, v10, 0x4

    .line 513
    .line 514
    invoke-static {v0, v3, v10}, LA/c;->Q(Lr2/o;Lr2/o;I)Lr2/o;

    .line 515
    .line 516
    .line 517
    move-result-object v7

    .line 518
    mul-int/lit8 v9, v9, 0x4

    .line 519
    .line 520
    invoke-static {v7, v4, v9}, LA/c;->Q(Lr2/o;Lr2/o;I)Lr2/o;

    .line 521
    .line 522
    .line 523
    move-result-object v7

    .line 524
    invoke-static {v3, v0, v10}, LA/c;->Q(Lr2/o;Lr2/o;I)Lr2/o;

    .line 525
    .line 526
    .line 527
    move-result-object v8

    .line 528
    invoke-static {v8, v6, v9}, LA/c;->Q(Lr2/o;Lr2/o;I)Lr2/o;

    .line 529
    .line 530
    .line 531
    move-result-object v8

    .line 532
    invoke-static {v6, v4, v10}, LA/c;->Q(Lr2/o;Lr2/o;I)Lr2/o;

    .line 533
    .line 534
    .line 535
    move-result-object v11

    .line 536
    invoke-static {v11, v3, v9}, LA/c;->Q(Lr2/o;Lr2/o;I)Lr2/o;

    .line 537
    .line 538
    .line 539
    move-result-object v3

    .line 540
    invoke-static {v4, v6, v10}, LA/c;->Q(Lr2/o;Lr2/o;I)Lr2/o;

    .line 541
    .line 542
    .line 543
    move-result-object v4

    .line 544
    invoke-static {v4, v0, v9}, LA/c;->Q(Lr2/o;Lr2/o;I)Lr2/o;

    .line 545
    .line 546
    .line 547
    move-result-object v0

    .line 548
    filled-new-array {v7, v8, v3, v0}, [Lr2/o;

    .line 549
    .line 550
    .line 551
    move-result-object v0

    .line 552
    aget-object v3, v0, v16

    .line 553
    .line 554
    const/4 v12, 0x1

    .line 555
    aget-object v4, v0, v12

    .line 556
    .line 557
    aget-object v6, v0, v17

    .line 558
    .line 559
    aget-object v0, v0, p1

    .line 560
    .line 561
    invoke-virtual {v1, v3, v0}, LA/c;->U(Lr2/o;Lr2/o;)I

    .line 562
    .line 563
    .line 564
    move-result v7

    .line 565
    add-int/lit8 v8, v7, 0x1

    .line 566
    .line 567
    invoke-virtual {v1, v6, v0}, LA/c;->U(Lr2/o;Lr2/o;)I

    .line 568
    .line 569
    .line 570
    move-result v1

    .line 571
    add-int/lit8 v9, v1, 0x1

    .line 572
    .line 573
    and-int/lit8 v10, v8, 0x1

    .line 574
    .line 575
    if-ne v10, v12, :cond_13

    .line 576
    .line 577
    add-int/lit8 v8, v7, 0x2

    .line 578
    .line 579
    :cond_13
    and-int/lit8 v7, v9, 0x1

    .line 580
    .line 581
    if-ne v7, v12, :cond_14

    .line 582
    .line 583
    add-int/lit8 v9, v1, 0x2

    .line 584
    .line 585
    :cond_14
    mul-int/lit8 v1, v8, 0x4

    .line 586
    .line 587
    mul-int/lit8 v7, v9, 0x6

    .line 588
    .line 589
    if-ge v1, v7, :cond_15

    .line 590
    .line 591
    mul-int/lit8 v1, v9, 0x4

    .line 592
    .line 593
    mul-int/lit8 v7, v8, 0x6

    .line 594
    .line 595
    if-ge v1, v7, :cond_15

    .line 596
    .line 597
    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    .line 598
    .line 599
    .line 600
    move-result v8

    .line 601
    move v9, v8

    .line 602
    :cond_15
    int-to-float v1, v8

    .line 603
    const/high16 v7, 0x3f000000    # 0.5f

    .line 604
    .line 605
    sub-float v12, v1, v7

    .line 606
    .line 607
    int-to-float v1, v9

    .line 608
    sub-float v15, v1, v7

    .line 609
    .line 610
    iget v1, v3, Lr2/o;->a:F

    .line 611
    .line 612
    iget v7, v3, Lr2/o;->b:F

    .line 613
    .line 614
    iget v10, v0, Lr2/o;->a:F

    .line 615
    .line 616
    iget v11, v0, Lr2/o;->b:F

    .line 617
    .line 618
    iget v13, v6, Lr2/o;->a:F

    .line 619
    .line 620
    iget v14, v6, Lr2/o;->b:F

    .line 621
    .line 622
    move/from16 v18, v1

    .line 623
    .line 624
    iget v1, v4, Lr2/o;->a:F

    .line 625
    .line 626
    move/from16 v24, v1

    .line 627
    .line 628
    iget v1, v4, Lr2/o;->b:F

    .line 629
    .line 630
    move/from16 v20, v10

    .line 631
    .line 632
    const/high16 v10, 0x3f000000    # 0.5f

    .line 633
    .line 634
    move/from16 v21, v11

    .line 635
    .line 636
    const/high16 v11, 0x3f000000    # 0.5f

    .line 637
    .line 638
    move/from16 v22, v13

    .line 639
    .line 640
    const/high16 v13, 0x3f000000    # 0.5f

    .line 641
    .line 642
    const/high16 v16, 0x3f000000    # 0.5f

    .line 643
    .line 644
    move/from16 v23, v14

    .line 645
    .line 646
    move v14, v12

    .line 647
    move/from16 v17, v15

    .line 648
    .line 649
    move/from16 v25, v1

    .line 650
    .line 651
    move/from16 v19, v7

    .line 652
    .line 653
    invoke-static/range {v10 .. v25}, Lx2/f;->a(FFFFFFFFFFFFFFFF)Lx2/f;

    .line 654
    .line 655
    .line 656
    move-result-object v1

    .line 657
    invoke-static {v5, v8, v9, v1}, LT0/a;->H(Lx2/b;IILx2/f;)Lx2/b;

    .line 658
    .line 659
    .line 660
    move-result-object v1

    .line 661
    filled-new-array {v3, v4, v6, v0}, [Lr2/o;

    .line 662
    .line 663
    .line 664
    move-result-object v0

    .line 665
    invoke-virtual {v2, v1}, LB2/d;->c(Lx2/b;)Lx2/d;

    .line 666
    .line 667
    .line 668
    move-result-object v1

    .line 669
    move-object v2, v0

    .line 670
    :goto_7
    new-instance v0, Lr2/m;

    .line 671
    .line 672
    iget-object v3, v1, Lx2/d;->b:Ljava/lang/String;

    .line 673
    .line 674
    iget-object v4, v1, Lx2/d;->a:[B

    .line 675
    .line 676
    sget-object v5, Lr2/a;->j:Lr2/a;

    .line 677
    .line 678
    invoke-direct {v0, v3, v4, v2, v5}, Lr2/m;-><init>(Ljava/lang/String;[B[Lr2/o;Lr2/a;)V

    .line 679
    .line 680
    .line 681
    iget-object v2, v1, Lx2/d;->c:Ljava/util/List;

    .line 682
    .line 683
    if-eqz v2, :cond_16

    .line 684
    .line 685
    sget-object v3, Lr2/n;->f:Lr2/n;

    .line 686
    .line 687
    invoke-virtual {v0, v3, v2}, Lr2/m;->b(Lr2/n;Ljava/lang/Object;)V

    .line 688
    .line 689
    .line 690
    :cond_16
    iget-object v2, v1, Lx2/d;->d:Ljava/lang/String;

    .line 691
    .line 692
    if-eqz v2, :cond_17

    .line 693
    .line 694
    sget-object v3, Lr2/n;->g:Lr2/n;

    .line 695
    .line 696
    invoke-virtual {v0, v3, v2}, Lr2/m;->b(Lr2/n;Ljava/lang/Object;)V

    .line 697
    .line 698
    .line 699
    :cond_17
    sget-object v2, Lr2/n;->h:Lr2/n;

    .line 700
    .line 701
    iget-object v3, v1, Lx2/d;->e:Ljava/lang/Integer;

    .line 702
    .line 703
    invoke-virtual {v0, v2, v3}, Lr2/m;->b(Lr2/n;Ljava/lang/Object;)V

    .line 704
    .line 705
    .line 706
    new-instance v2, Ljava/lang/StringBuilder;

    .line 707
    .line 708
    const-string v3, "]d"

    .line 709
    .line 710
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 711
    .line 712
    .line 713
    iget v1, v1, Lx2/d;->j:I

    .line 714
    .line 715
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 716
    .line 717
    .line 718
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 719
    .line 720
    .line 721
    move-result-object v1

    .line 722
    sget-object v2, Lr2/n;->q:Lr2/n;

    .line 723
    .line 724
    invoke-virtual {v0, v2, v1}, Lr2/m;->b(Lr2/n;Ljava/lang/Object;)V

    .line 725
    .line 726
    .line 727
    return-object v0

    .line 728
    :cond_18
    invoke-static {}, Lr2/i;->a()Lr2/i;

    .line 729
    .line 730
    .line 731
    move-result-object v0

    .line 732
    throw v0
.end method

.method public final reset()V
    .locals 0

    .line 1
    return-void
.end method
