.class public final LZ2/w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LZ2/x;


# instance fields
.field public final e:Lk3/f;

.field public final f:Ljava/util/HashMap;

.field public final g:Ljava/util/HashMap;

.field public final h:LV0/k;


# direct methods
.method public constructor <init>(Lk3/f;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, LZ2/w;->f:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, LZ2/w;->g:Ljava/util/HashMap;

    .line 17
    .line 18
    new-instance v1, LV0/k;

    .line 19
    .line 20
    invoke-direct {v1}, LV0/k;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, LZ2/w;->h:LV0/k;

    .line 24
    .line 25
    iput-object p1, p0, LZ2/w;->e:Lk3/f;

    .line 26
    .line 27
    sget-object p1, LZ2/C;->a:LZ2/z;

    .line 28
    .line 29
    new-instance p1, LZ2/B;

    .line 30
    .line 31
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 32
    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    iput-boolean v1, p1, LZ2/B;->a:Z

    .line 36
    .line 37
    filled-new-array {p1}, [LZ2/B;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    aget-object p1, p1, v1

    .line 42
    .line 43
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 44
    .line 45
    .line 46
    const-wide v1, 0x100000104L

    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    return-void
.end method


# virtual methods
.method public final a(Landroid/view/KeyEvent;LI2/h;)V
    .locals 29

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v7, p2

    .line 4
    .line 5
    const-wide/16 v1, 0x0

    .line 6
    .line 7
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v8

    .line 11
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getScanCode()I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-nez v3, :cond_0

    .line 16
    .line 17
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-nez v3, :cond_0

    .line 22
    .line 23
    goto/16 :goto_1e

    .line 24
    .line 25
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getScanCode()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    int-to-long v3, v3

    .line 30
    cmp-long v1, v3, v1

    .line 31
    .line 32
    const-wide v5, 0xffffffffL

    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    const-wide v10, 0x1100000000L

    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    if-nez v1, :cond_1

    .line 43
    .line 44
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    int-to-long v1, v1

    .line 49
    and-long/2addr v1, v5

    .line 50
    or-long/2addr v1, v10

    .line 51
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    :goto_0
    move-object v12, v1

    .line 56
    goto :goto_1

    .line 57
    :cond_1
    sget-object v1, LZ2/C;->a:LZ2/z;

    .line 58
    .line 59
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    check-cast v1, Ljava/lang/Long;

    .line 68
    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getScanCode()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    int-to-long v1, v1

    .line 77
    and-long/2addr v1, v5

    .line 78
    or-long/2addr v1, v10

    .line 79
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    goto :goto_0

    .line 84
    :goto_1
    sget-object v1, LZ2/C;->b:LZ2/z;

    .line 85
    .line 86
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    int-to-long v2, v2

    .line 91
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    check-cast v1, Ljava/lang/Long;

    .line 100
    .line 101
    if-eqz v1, :cond_3

    .line 102
    .line 103
    :goto_2
    move-object v10, v1

    .line 104
    goto :goto_3

    .line 105
    :cond_3
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    int-to-long v1, v1

    .line 110
    and-long/2addr v1, v5

    .line 111
    or-long/2addr v1, v10

    .line 112
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    goto :goto_2

    .line 117
    :goto_3
    new-instance v11, Ljava/util/ArrayList;

    .line 118
    .line 119
    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 120
    .line 121
    .line 122
    sget-object v13, LZ2/C;->c:[LA/l;

    .line 123
    .line 124
    array-length v14, v13

    .line 125
    const/4 v1, 0x0

    .line 126
    :goto_4
    const/4 v2, 0x2

    .line 127
    iget-object v4, v0, LZ2/w;->f:Ljava/util/HashMap;

    .line 128
    .line 129
    if-ge v1, v14, :cond_1a

    .line 130
    .line 131
    aget-object v5, v13, v1

    .line 132
    .line 133
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getMetaState()I

    .line 134
    .line 135
    .line 136
    move-result v6

    .line 137
    iget v3, v5, LA/l;->a:I

    .line 138
    .line 139
    and-int/2addr v3, v6

    .line 140
    if-eqz v3, :cond_4

    .line 141
    .line 142
    const/16 v17, 0x1

    .line 143
    .line 144
    goto :goto_5

    .line 145
    :cond_4
    const/16 v17, 0x0

    .line 146
    .line 147
    :goto_5
    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    .line 148
    .line 149
    .line 150
    move-result-wide v18

    .line 151
    invoke-virtual {v12}, Ljava/lang/Long;->longValue()J

    .line 152
    .line 153
    .line 154
    move-result-wide v20

    .line 155
    iget-object v3, v5, LA/l;->b:Ljava/lang/Object;

    .line 156
    .line 157
    move-object/from16 v22, v3

    .line 158
    .line 159
    check-cast v22, [LZ2/A;

    .line 160
    .line 161
    new-array v3, v2, [Z

    .line 162
    .line 163
    new-array v5, v2, [Ljava/lang/Boolean;

    .line 164
    .line 165
    const/4 v6, 0x0

    .line 166
    const/16 v23, 0x0

    .line 167
    .line 168
    :goto_6
    if-ge v6, v2, :cond_11

    .line 169
    .line 170
    const/16 v24, 0x0

    .line 171
    .line 172
    aget-object v15, v22, v6

    .line 173
    .line 174
    move-object/from16 v25, v3

    .line 175
    .line 176
    iget-wide v2, v15, LZ2/A;->a:J

    .line 177
    .line 178
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    invoke-virtual {v4, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    move-result v2

    .line 186
    aput-boolean v2, v25, v6

    .line 187
    .line 188
    move-object/from16 v27, v10

    .line 189
    .line 190
    iget-wide v9, v15, LZ2/A;->b:J

    .line 191
    .line 192
    cmp-long v3, v9, v18

    .line 193
    .line 194
    if-nez v3, :cond_e

    .line 195
    .line 196
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getRepeatCount()I

    .line 197
    .line 198
    .line 199
    move-result v2

    .line 200
    if-lez v2, :cond_5

    .line 201
    .line 202
    const/4 v2, 0x1

    .line 203
    goto :goto_7

    .line 204
    :cond_5
    move/from16 v2, v24

    .line 205
    .line 206
    :goto_7
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getAction()I

    .line 207
    .line 208
    .line 209
    move-result v3

    .line 210
    if-eqz v3, :cond_7

    .line 211
    .line 212
    const/4 v9, 0x1

    .line 213
    if-ne v3, v9, :cond_6

    .line 214
    .line 215
    const/16 v26, 0x2

    .line 216
    .line 217
    goto :goto_8

    .line 218
    :cond_6
    new-instance v1, Ljava/lang/AssertionError;

    .line 219
    .line 220
    const-string v2, "Unexpected event type"

    .line 221
    .line 222
    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 223
    .line 224
    .line 225
    throw v1

    .line 226
    :cond_7
    const/4 v9, 0x1

    .line 227
    if-eqz v2, :cond_8

    .line 228
    .line 229
    const/16 v26, 0x3

    .line 230
    .line 231
    goto :goto_8

    .line 232
    :cond_8
    move/from16 v26, v9

    .line 233
    .line 234
    :goto_8
    invoke-static/range {v26 .. v26}, LL/i;->b(I)I

    .line 235
    .line 236
    .line 237
    move-result v2

    .line 238
    if-eqz v2, :cond_d

    .line 239
    .line 240
    if-eq v2, v9, :cond_c

    .line 241
    .line 242
    const/4 v3, 0x2

    .line 243
    if-eq v2, v3, :cond_9

    .line 244
    .line 245
    move v15, v1

    .line 246
    move v9, v3

    .line 247
    move-object/from16 v28, v4

    .line 248
    .line 249
    move-object v10, v5

    .line 250
    move/from16 v16, v6

    .line 251
    .line 252
    move-wide/from16 v3, v20

    .line 253
    .line 254
    goto/16 :goto_d

    .line 255
    .line 256
    :cond_9
    if-nez v17, :cond_a

    .line 257
    .line 258
    new-instance v0, LZ2/v;

    .line 259
    .line 260
    move v2, v6

    .line 261
    const/4 v6, 0x1

    .line 262
    move/from16 v16, v2

    .line 263
    .line 264
    move v9, v3

    .line 265
    move-object/from16 v28, v4

    .line 266
    .line 267
    move-object v10, v5

    .line 268
    move-object v2, v15

    .line 269
    move-wide/from16 v3, v20

    .line 270
    .line 271
    move-object/from16 v5, p1

    .line 272
    .line 273
    move v15, v1

    .line 274
    move-object/from16 v1, p0

    .line 275
    .line 276
    invoke-direct/range {v0 .. v6}, LZ2/v;-><init>(LZ2/w;LZ2/A;JLandroid/view/KeyEvent;I)V

    .line 277
    .line 278
    .line 279
    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 280
    .line 281
    .line 282
    goto :goto_9

    .line 283
    :cond_a
    move v15, v1

    .line 284
    move v9, v3

    .line 285
    move-object/from16 v28, v4

    .line 286
    .line 287
    move-object v10, v5

    .line 288
    move/from16 v16, v6

    .line 289
    .line 290
    move-wide/from16 v3, v20

    .line 291
    .line 292
    :goto_9
    aget-boolean v0, v25, v16

    .line 293
    .line 294
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 295
    .line 296
    .line 297
    move-result-object v0

    .line 298
    aput-object v0, v10, v16

    .line 299
    .line 300
    :cond_b
    :goto_a
    const/16 v23, 0x1

    .line 301
    .line 302
    goto :goto_d

    .line 303
    :cond_c
    move v15, v1

    .line 304
    move-object/from16 v28, v4

    .line 305
    .line 306
    move-object v10, v5

    .line 307
    move/from16 v16, v6

    .line 308
    .line 309
    move-wide/from16 v3, v20

    .line 310
    .line 311
    const/4 v9, 0x2

    .line 312
    aget-boolean v0, v25, v16

    .line 313
    .line 314
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 315
    .line 316
    .line 317
    move-result-object v0

    .line 318
    aput-object v0, v10, v16

    .line 319
    .line 320
    goto :goto_d

    .line 321
    :cond_d
    move-object/from16 v28, v4

    .line 322
    .line 323
    move-object v10, v5

    .line 324
    move/from16 v16, v6

    .line 325
    .line 326
    move-object v2, v15

    .line 327
    move-wide/from16 v3, v20

    .line 328
    .line 329
    const/4 v9, 0x2

    .line 330
    move v15, v1

    .line 331
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 332
    .line 333
    aput-object v0, v10, v16

    .line 334
    .line 335
    if-nez v17, :cond_b

    .line 336
    .line 337
    new-instance v0, LZ2/v;

    .line 338
    .line 339
    const/4 v6, 0x0

    .line 340
    move-object/from16 v1, p0

    .line 341
    .line 342
    move-object/from16 v5, p1

    .line 343
    .line 344
    invoke-direct/range {v0 .. v6}, LZ2/v;-><init>(LZ2/w;LZ2/A;JLandroid/view/KeyEvent;I)V

    .line 345
    .line 346
    .line 347
    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 348
    .line 349
    .line 350
    goto :goto_a

    .line 351
    :cond_e
    move v15, v1

    .line 352
    move-object/from16 v28, v4

    .line 353
    .line 354
    move-object v10, v5

    .line 355
    move/from16 v16, v6

    .line 356
    .line 357
    move-wide/from16 v3, v20

    .line 358
    .line 359
    const/4 v9, 0x2

    .line 360
    if-nez v23, :cond_10

    .line 361
    .line 362
    if-eqz v2, :cond_f

    .line 363
    .line 364
    goto :goto_b

    .line 365
    :cond_f
    move/from16 v0, v24

    .line 366
    .line 367
    goto :goto_c

    .line 368
    :cond_10
    :goto_b
    const/4 v0, 0x1

    .line 369
    :goto_c
    move/from16 v23, v0

    .line 370
    .line 371
    :goto_d
    add-int/lit8 v6, v16, 0x1

    .line 372
    .line 373
    move-object/from16 v0, p0

    .line 374
    .line 375
    move-wide/from16 v20, v3

    .line 376
    .line 377
    move v2, v9

    .line 378
    move-object v5, v10

    .line 379
    move v1, v15

    .line 380
    move-object/from16 v3, v25

    .line 381
    .line 382
    move-object/from16 v10, v27

    .line 383
    .line 384
    move-object/from16 v4, v28

    .line 385
    .line 386
    goto/16 :goto_6

    .line 387
    .line 388
    :cond_11
    move v15, v1

    .line 389
    move v9, v2

    .line 390
    move-object/from16 v25, v3

    .line 391
    .line 392
    move-object/from16 v27, v10

    .line 393
    .line 394
    const/16 v24, 0x0

    .line 395
    .line 396
    move-object v10, v5

    .line 397
    if-eqz v17, :cond_15

    .line 398
    .line 399
    move/from16 v0, v24

    .line 400
    .line 401
    :goto_e
    if-ge v0, v9, :cond_14

    .line 402
    .line 403
    aget-object v1, v10, v0

    .line 404
    .line 405
    if-eqz v1, :cond_12

    .line 406
    .line 407
    goto :goto_f

    .line 408
    :cond_12
    if-eqz v23, :cond_13

    .line 409
    .line 410
    aget-boolean v1, v25, v0

    .line 411
    .line 412
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 413
    .line 414
    .line 415
    move-result-object v1

    .line 416
    aput-object v1, v10, v0

    .line 417
    .line 418
    goto :goto_f

    .line 419
    :cond_13
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 420
    .line 421
    aput-object v1, v10, v0

    .line 422
    .line 423
    const/16 v23, 0x1

    .line 424
    .line 425
    :goto_f
    add-int/lit8 v0, v0, 0x1

    .line 426
    .line 427
    goto :goto_e

    .line 428
    :cond_14
    if-nez v23, :cond_17

    .line 429
    .line 430
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 431
    .line 432
    aput-object v0, v10, v24

    .line 433
    .line 434
    goto :goto_12

    .line 435
    :cond_15
    move/from16 v0, v24

    .line 436
    .line 437
    :goto_10
    if-ge v0, v9, :cond_17

    .line 438
    .line 439
    aget-object v1, v10, v0

    .line 440
    .line 441
    if-eqz v1, :cond_16

    .line 442
    .line 443
    goto :goto_11

    .line 444
    :cond_16
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 445
    .line 446
    aput-object v1, v10, v0

    .line 447
    .line 448
    :goto_11
    add-int/lit8 v0, v0, 0x1

    .line 449
    .line 450
    goto :goto_10

    .line 451
    :cond_17
    :goto_12
    move/from16 v6, v24

    .line 452
    .line 453
    :goto_13
    if-ge v6, v9, :cond_19

    .line 454
    .line 455
    aget-boolean v0, v25, v6

    .line 456
    .line 457
    aget-object v1, v10, v6

    .line 458
    .line 459
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 460
    .line 461
    .line 462
    move-result v1

    .line 463
    if-eq v0, v1, :cond_18

    .line 464
    .line 465
    aget-object v0, v22, v6

    .line 466
    .line 467
    aget-object v1, v10, v6

    .line 468
    .line 469
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 470
    .line 471
    .line 472
    move-result v1

    .line 473
    iget-wide v2, v0, LZ2/A;->b:J

    .line 474
    .line 475
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 476
    .line 477
    .line 478
    move-result-object v2

    .line 479
    iget-wide v3, v0, LZ2/A;->a:J

    .line 480
    .line 481
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 482
    .line 483
    .line 484
    move-result-object v3

    .line 485
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getEventTime()J

    .line 486
    .line 487
    .line 488
    move-result-wide v4

    .line 489
    move-object/from16 v0, p0

    .line 490
    .line 491
    invoke-virtual/range {v0 .. v5}, LZ2/w;->c(ZLjava/lang/Long;Ljava/lang/Long;J)V

    .line 492
    .line 493
    .line 494
    goto :goto_14

    .line 495
    :cond_18
    move-object/from16 v0, p0

    .line 496
    .line 497
    :goto_14
    add-int/lit8 v6, v6, 0x1

    .line 498
    .line 499
    goto :goto_13

    .line 500
    :cond_19
    move-object/from16 v0, p0

    .line 501
    .line 502
    add-int/lit8 v1, v15, 0x1

    .line 503
    .line 504
    move-object/from16 v10, v27

    .line 505
    .line 506
    goto/16 :goto_4

    .line 507
    .line 508
    :cond_1a
    move v9, v2

    .line 509
    move-object/from16 v28, v4

    .line 510
    .line 511
    move-object/from16 v27, v10

    .line 512
    .line 513
    const/16 v24, 0x0

    .line 514
    .line 515
    iget-object v6, v0, LZ2/w;->g:Ljava/util/HashMap;

    .line 516
    .line 517
    invoke-virtual {v6}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 518
    .line 519
    .line 520
    move-result-object v1

    .line 521
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 522
    .line 523
    .line 524
    move-result-object v10

    .line 525
    :goto_15
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    .line 526
    .line 527
    .line 528
    move-result v1

    .line 529
    if-eqz v1, :cond_20

    .line 530
    .line 531
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 532
    .line 533
    .line 534
    move-result-object v1

    .line 535
    move-object v13, v1

    .line 536
    check-cast v13, LZ2/B;

    .line 537
    .line 538
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getMetaState()I

    .line 539
    .line 540
    .line 541
    move-result v1

    .line 542
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 543
    .line 544
    .line 545
    const/high16 v2, 0x100000

    .line 546
    .line 547
    and-int/2addr v1, v2

    .line 548
    if-eqz v1, :cond_1b

    .line 549
    .line 550
    const/4 v1, 0x1

    .line 551
    goto :goto_16

    .line 552
    :cond_1b
    move/from16 v1, v24

    .line 553
    .line 554
    :goto_16
    invoke-virtual/range {v27 .. v27}, Ljava/lang/Long;->longValue()J

    .line 555
    .line 556
    .line 557
    move-result-wide v2

    .line 558
    const-wide/32 v4, 0x70039

    .line 559
    .line 560
    .line 561
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 562
    .line 563
    .line 564
    move-result-object v4

    .line 565
    const-wide v14, 0x100000104L

    .line 566
    .line 567
    .line 568
    .line 569
    .line 570
    move-wide/from16 v16, v2

    .line 571
    .line 572
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 573
    .line 574
    .line 575
    move-result-object v2

    .line 576
    cmp-long v3, v14, v16

    .line 577
    .line 578
    if-nez v3, :cond_1d

    .line 579
    .line 580
    :cond_1c
    move-object/from16 v14, v28

    .line 581
    .line 582
    goto :goto_19

    .line 583
    :cond_1d
    iget-boolean v3, v13, LZ2/B;->a:Z

    .line 584
    .line 585
    if-eq v3, v1, :cond_1c

    .line 586
    .line 587
    move-object/from16 v14, v28

    .line 588
    .line 589
    invoke-virtual {v14, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 590
    .line 591
    .line 592
    move-result v15

    .line 593
    xor-int/lit8 v1, v15, 0x1

    .line 594
    .line 595
    if-nez v15, :cond_1e

    .line 596
    .line 597
    iget-boolean v3, v13, LZ2/B;->a:Z

    .line 598
    .line 599
    const/16 v26, 0x1

    .line 600
    .line 601
    xor-int/lit8 v3, v3, 0x1

    .line 602
    .line 603
    iput-boolean v3, v13, LZ2/B;->a:Z

    .line 604
    .line 605
    :goto_17
    move-object v3, v4

    .line 606
    goto :goto_18

    .line 607
    :cond_1e
    const/16 v26, 0x1

    .line 608
    .line 609
    goto :goto_17

    .line 610
    :goto_18
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getEventTime()J

    .line 611
    .line 612
    .line 613
    move-result-wide v4

    .line 614
    invoke-virtual/range {v0 .. v5}, LZ2/w;->c(ZLjava/lang/Long;Ljava/lang/Long;J)V

    .line 615
    .line 616
    .line 617
    if-eqz v15, :cond_1f

    .line 618
    .line 619
    iget-boolean v0, v13, LZ2/B;->a:Z

    .line 620
    .line 621
    xor-int/lit8 v0, v0, 0x1

    .line 622
    .line 623
    iput-boolean v0, v13, LZ2/B;->a:Z

    .line 624
    .line 625
    :cond_1f
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getEventTime()J

    .line 626
    .line 627
    .line 628
    move-result-wide v4

    .line 629
    move-object/from16 v0, p0

    .line 630
    .line 631
    move v1, v15

    .line 632
    invoke-virtual/range {v0 .. v5}, LZ2/w;->c(ZLjava/lang/Long;Ljava/lang/Long;J)V

    .line 633
    .line 634
    .line 635
    :goto_19
    move-object/from16 v0, p0

    .line 636
    .line 637
    move-object/from16 v28, v14

    .line 638
    .line 639
    goto :goto_15

    .line 640
    :cond_20
    move-object/from16 v14, v28

    .line 641
    .line 642
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getAction()I

    .line 643
    .line 644
    .line 645
    move-result v0

    .line 646
    if-eqz v0, :cond_22

    .line 647
    .line 648
    const/4 v1, 0x1

    .line 649
    if-eq v0, v1, :cond_21

    .line 650
    .line 651
    move-object/from16 v0, p0

    .line 652
    .line 653
    goto :goto_1e

    .line 654
    :cond_21
    move/from16 v10, v24

    .line 655
    .line 656
    goto :goto_1a

    .line 657
    :cond_22
    const/4 v10, 0x1

    .line 658
    :goto_1a
    invoke-virtual {v14, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 659
    .line 660
    .line 661
    move-result-object v0

    .line 662
    move-object v2, v0

    .line 663
    check-cast v2, Ljava/lang/Long;

    .line 664
    .line 665
    const/4 v13, 0x0

    .line 666
    if-eqz v10, :cond_26

    .line 667
    .line 668
    if-nez v2, :cond_23

    .line 669
    .line 670
    const/4 v2, 0x1

    .line 671
    :goto_1b
    move-object/from16 v0, p0

    .line 672
    .line 673
    move-object v3, v12

    .line 674
    goto :goto_1c

    .line 675
    :cond_23
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getRepeatCount()I

    .line 676
    .line 677
    .line 678
    move-result v0

    .line 679
    if-lez v0, :cond_24

    .line 680
    .line 681
    const/4 v2, 0x3

    .line 682
    goto :goto_1b

    .line 683
    :cond_24
    const/4 v1, 0x0

    .line 684
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getEventTime()J

    .line 685
    .line 686
    .line 687
    move-result-wide v4

    .line 688
    move-object/from16 v0, p0

    .line 689
    .line 690
    move-object v3, v12

    .line 691
    invoke-virtual/range {v0 .. v5}, LZ2/w;->c(ZLjava/lang/Long;Ljava/lang/Long;J)V

    .line 692
    .line 693
    .line 694
    const/4 v2, 0x1

    .line 695
    :goto_1c
    iget-object v1, v0, LZ2/w;->h:LV0/k;

    .line 696
    .line 697
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getUnicodeChar()I

    .line 698
    .line 699
    .line 700
    move-result v4

    .line 701
    invoke-virtual {v1, v4}, LV0/k;->a(I)Ljava/lang/Character;

    .line 702
    .line 703
    .line 704
    move-result-object v1

    .line 705
    invoke-virtual {v1}, Ljava/lang/Character;->charValue()C

    .line 706
    .line 707
    .line 708
    move-result v1

    .line 709
    if-eqz v1, :cond_25

    .line 710
    .line 711
    new-instance v4, Ljava/lang/StringBuilder;

    .line 712
    .line 713
    const-string v5, ""

    .line 714
    .line 715
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 716
    .line 717
    .line 718
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 719
    .line 720
    .line 721
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 722
    .line 723
    .line 724
    move-result-object v1

    .line 725
    goto :goto_1d

    .line 726
    :cond_25
    move-object v1, v13

    .line 727
    :goto_1d
    move v4, v2

    .line 728
    move-object v2, v1

    .line 729
    const/4 v5, 0x3

    .line 730
    const/4 v1, 0x1

    .line 731
    goto :goto_1f

    .line 732
    :cond_26
    move-object/from16 v0, p0

    .line 733
    .line 734
    move-object v3, v12

    .line 735
    if-nez v2, :cond_27

    .line 736
    .line 737
    :goto_1e
    const/4 v1, 0x1

    .line 738
    const-wide/16 v4, 0x0

    .line 739
    .line 740
    move-object v3, v8

    .line 741
    move-object v2, v8

    .line 742
    invoke-virtual/range {v0 .. v5}, LZ2/w;->c(ZLjava/lang/Long;Ljava/lang/Long;J)V

    .line 743
    .line 744
    .line 745
    const/4 v1, 0x1

    .line 746
    invoke-virtual {v7, v1}, LI2/h;->a(Z)V

    .line 747
    .line 748
    .line 749
    return-void

    .line 750
    :cond_27
    move v4, v9

    .line 751
    move-object v2, v13

    .line 752
    const/4 v1, 0x1

    .line 753
    const/4 v5, 0x3

    .line 754
    :goto_1f
    if-eq v4, v5, :cond_29

    .line 755
    .line 756
    if-eqz v10, :cond_28

    .line 757
    .line 758
    move-object/from16 v13, v27

    .line 759
    .line 760
    :cond_28
    invoke-virtual {v0, v3, v13}, LZ2/w;->d(Ljava/lang/Long;Ljava/lang/Long;)V

    .line 761
    .line 762
    .line 763
    :cond_29
    move-object/from16 v8, v27

    .line 764
    .line 765
    if-ne v4, v1, :cond_2a

    .line 766
    .line 767
    invoke-virtual {v6, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 768
    .line 769
    .line 770
    move-result-object v6

    .line 771
    check-cast v6, LZ2/B;

    .line 772
    .line 773
    if-eqz v6, :cond_2a

    .line 774
    .line 775
    iget-boolean v10, v6, LZ2/B;->a:Z

    .line 776
    .line 777
    xor-int/2addr v10, v1

    .line 778
    iput-boolean v10, v6, LZ2/B;->a:Z

    .line 779
    .line 780
    :cond_2a
    new-instance v1, LZ2/t;

    .line 781
    .line 782
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 783
    .line 784
    .line 785
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getSource()I

    .line 786
    .line 787
    .line 788
    move-result v6

    .line 789
    const/16 v10, 0x201

    .line 790
    .line 791
    if-eq v6, v10, :cond_2e

    .line 792
    .line 793
    const/16 v9, 0x401

    .line 794
    .line 795
    if-eq v6, v9, :cond_2d

    .line 796
    .line 797
    const v5, 0x1000010

    .line 798
    .line 799
    .line 800
    if-eq v6, v5, :cond_2c

    .line 801
    .line 802
    const v5, 0x2000001

    .line 803
    .line 804
    .line 805
    if-eq v6, v5, :cond_2b

    .line 806
    .line 807
    const/4 v9, 0x1

    .line 808
    iput v9, v1, LZ2/t;->f:I

    .line 809
    .line 810
    goto :goto_20

    .line 811
    :cond_2b
    const/4 v5, 0x5

    .line 812
    iput v5, v1, LZ2/t;->f:I

    .line 813
    .line 814
    goto :goto_20

    .line 815
    :cond_2c
    const/4 v5, 0x4

    .line 816
    iput v5, v1, LZ2/t;->f:I

    .line 817
    .line 818
    goto :goto_20

    .line 819
    :cond_2d
    iput v5, v1, LZ2/t;->f:I

    .line 820
    .line 821
    goto :goto_20

    .line 822
    :cond_2e
    iput v9, v1, LZ2/t;->f:I

    .line 823
    .line 824
    :goto_20
    invoke-virtual/range {p1 .. p1}, Landroid/view/KeyEvent;->getEventTime()J

    .line 825
    .line 826
    .line 827
    move-result-wide v5

    .line 828
    iput-wide v5, v1, LZ2/t;->a:J

    .line 829
    .line 830
    iput v4, v1, LZ2/t;->b:I

    .line 831
    .line 832
    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    .line 833
    .line 834
    .line 835
    move-result-wide v4

    .line 836
    iput-wide v4, v1, LZ2/t;->d:J

    .line 837
    .line 838
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 839
    .line 840
    .line 841
    move-result-wide v3

    .line 842
    iput-wide v3, v1, LZ2/t;->c:J

    .line 843
    .line 844
    iput-object v2, v1, LZ2/t;->g:Ljava/lang/String;

    .line 845
    .line 846
    move/from16 v2, v24

    .line 847
    .line 848
    iput-boolean v2, v1, LZ2/t;->e:Z

    .line 849
    .line 850
    invoke-virtual {v0, v1, v7}, LZ2/w;->b(LZ2/t;LI2/h;)V

    .line 851
    .line 852
    .line 853
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    .line 854
    .line 855
    .line 856
    move-result v1

    .line 857
    move v15, v2

    .line 858
    :goto_21
    if-ge v15, v1, :cond_2f

    .line 859
    .line 860
    invoke-virtual {v11, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 861
    .line 862
    .line 863
    move-result-object v2

    .line 864
    add-int/lit8 v15, v15, 0x1

    .line 865
    .line 866
    check-cast v2, Ljava/lang/Runnable;

    .line 867
    .line 868
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    .line 869
    .line 870
    .line 871
    goto :goto_21

    .line 872
    :cond_2f
    return-void
.end method

.method public final b(LZ2/t;LI2/h;)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    move-object v1, v0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    new-instance v1, LZ2/u;

    .line 7
    .line 8
    invoke-direct {v1, p2}, LZ2/u;-><init>(LI2/h;)V

    .line 9
    .line 10
    .line 11
    :goto_0
    :try_start_0
    iget-object p2, p1, LZ2/t;->g:Ljava/lang/String;

    .line 12
    .line 13
    if-nez p2, :cond_1

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_1
    const-string v0, "UTF-8"

    .line 17
    .line 18
    invoke-virtual {p2, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 19
    .line 20
    .line 21
    move-result-object v0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    :goto_1
    if-nez v0, :cond_2

    .line 23
    .line 24
    const/4 p2, 0x0

    .line 25
    goto :goto_2

    .line 26
    :cond_2
    array-length p2, v0

    .line 27
    :goto_2
    add-int/lit8 v2, p2, 0x38

    .line 28
    .line 29
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 34
    .line 35
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 36
    .line 37
    .line 38
    int-to-long v3, p2

    .line 39
    invoke-virtual {v2, v3, v4}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 40
    .line 41
    .line 42
    iget-wide v3, p1, LZ2/t;->a:J

    .line 43
    .line 44
    invoke-virtual {v2, v3, v4}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 45
    .line 46
    .line 47
    iget p2, p1, LZ2/t;->b:I

    .line 48
    .line 49
    const/4 v3, 0x1

    .line 50
    if-eq p2, v3, :cond_5

    .line 51
    .line 52
    const/4 v3, 0x2

    .line 53
    if-eq p2, v3, :cond_4

    .line 54
    .line 55
    const/4 v3, 0x3

    .line 56
    if-ne p2, v3, :cond_3

    .line 57
    .line 58
    const-wide/16 v3, 0x2

    .line 59
    .line 60
    goto :goto_3

    .line 61
    :cond_3
    const/4 p1, 0x0

    .line 62
    throw p1

    .line 63
    :cond_4
    const-wide/16 v3, 0x1

    .line 64
    .line 65
    goto :goto_3

    .line 66
    :cond_5
    const-wide/16 v3, 0x0

    .line 67
    .line 68
    :goto_3
    invoke-virtual {v2, v3, v4}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 69
    .line 70
    .line 71
    iget-wide v3, p1, LZ2/t;->c:J

    .line 72
    .line 73
    invoke-virtual {v2, v3, v4}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 74
    .line 75
    .line 76
    iget-wide v3, p1, LZ2/t;->d:J

    .line 77
    .line 78
    invoke-virtual {v2, v3, v4}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 79
    .line 80
    .line 81
    iget-boolean p2, p1, LZ2/t;->e:Z

    .line 82
    .line 83
    if-eqz p2, :cond_6

    .line 84
    .line 85
    const-wide/16 v3, 0x1

    .line 86
    .line 87
    goto :goto_4

    .line 88
    :cond_6
    const-wide/16 v3, 0x0

    .line 89
    .line 90
    :goto_4
    invoke-virtual {v2, v3, v4}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 91
    .line 92
    .line 93
    iget p1, p1, LZ2/t;->f:I

    .line 94
    .line 95
    const/4 p2, 0x1

    .line 96
    if-eq p1, p2, :cond_b

    .line 97
    .line 98
    const/4 p2, 0x2

    .line 99
    if-eq p1, p2, :cond_a

    .line 100
    .line 101
    const/4 p2, 0x3

    .line 102
    if-eq p1, p2, :cond_9

    .line 103
    .line 104
    const/4 p2, 0x4

    .line 105
    if-eq p1, p2, :cond_8

    .line 106
    .line 107
    const/4 p2, 0x5

    .line 108
    if-ne p1, p2, :cond_7

    .line 109
    .line 110
    const-wide/16 p1, 0x4

    .line 111
    .line 112
    goto :goto_5

    .line 113
    :cond_7
    const/4 p1, 0x0

    .line 114
    throw p1

    .line 115
    :cond_8
    const-wide/16 p1, 0x3

    .line 116
    .line 117
    goto :goto_5

    .line 118
    :cond_9
    const-wide/16 p1, 0x2

    .line 119
    .line 120
    goto :goto_5

    .line 121
    :cond_a
    const-wide/16 p1, 0x1

    .line 122
    .line 123
    goto :goto_5

    .line 124
    :cond_b
    const-wide/16 p1, 0x0

    .line 125
    .line 126
    :goto_5
    invoke-virtual {v2, p1, p2}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 127
    .line 128
    .line 129
    if-eqz v0, :cond_c

    .line 130
    .line 131
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 132
    .line 133
    .line 134
    :cond_c
    iget-object p1, p0, LZ2/w;->e:Lk3/f;

    .line 135
    .line 136
    const-string p2, "flutter/keydata"

    .line 137
    .line 138
    invoke-interface {p1, p2, v2, v1}, Lk3/f;->h(Ljava/lang/String;Ljava/nio/ByteBuffer;Lk3/e;)V

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    :catch_0
    new-instance p1, Ljava/lang/AssertionError;

    .line 143
    .line 144
    const-string p2, "UTF-8 not supported"

    .line 145
    .line 146
    invoke-direct {p1, p2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 147
    .line 148
    .line 149
    throw p1
.end method

.method public final c(ZLjava/lang/Long;Ljava/lang/Long;J)V
    .locals 5

    .line 1
    new-instance v0, LZ2/t;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-wide p4, v0, LZ2/t;->a:J

    .line 7
    .line 8
    const/4 p4, 0x1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    move p5, p4

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p5, 0x2

    .line 14
    :goto_0
    iput p5, v0, LZ2/t;->b:I

    .line 15
    .line 16
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 17
    .line 18
    .line 19
    move-result-wide v1

    .line 20
    iput-wide v1, v0, LZ2/t;->d:J

    .line 21
    .line 22
    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    .line 23
    .line 24
    .line 25
    move-result-wide v1

    .line 26
    iput-wide v1, v0, LZ2/t;->c:J

    .line 27
    .line 28
    const/4 p5, 0x0

    .line 29
    iput-object p5, v0, LZ2/t;->g:Ljava/lang/String;

    .line 30
    .line 31
    iput-boolean p4, v0, LZ2/t;->e:Z

    .line 32
    .line 33
    iput p4, v0, LZ2/t;->f:I

    .line 34
    .line 35
    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    .line 36
    .line 37
    .line 38
    move-result-wide v1

    .line 39
    const-wide/16 v3, 0x0

    .line 40
    .line 41
    cmp-long p4, v1, v3

    .line 42
    .line 43
    if-eqz p4, :cond_2

    .line 44
    .line 45
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 46
    .line 47
    .line 48
    move-result-wide v1

    .line 49
    cmp-long p4, v1, v3

    .line 50
    .line 51
    if-eqz p4, :cond_2

    .line 52
    .line 53
    if-eqz p1, :cond_1

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    move-object p2, p5

    .line 57
    :goto_1
    invoke-virtual {p0, p3, p2}, LZ2/w;->d(Ljava/lang/Long;Ljava/lang/Long;)V

    .line 58
    .line 59
    .line 60
    :cond_2
    invoke-virtual {p0, v0, p5}, LZ2/w;->b(LZ2/t;LI2/h;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final d(Ljava/lang/Long;Ljava/lang/Long;)V
    .locals 1

    .line 1
    iget-object v0, p0, LZ2/w;->f:Ljava/util/HashMap;

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ljava/lang/Long;

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance p1, Ljava/lang/AssertionError;

    .line 15
    .line 16
    const-string p2, "The key was not empty"

    .line 17
    .line 18
    invoke-direct {p1, p2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    throw p1

    .line 22
    :cond_1
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Ljava/lang/Long;

    .line 27
    .line 28
    if-eqz p1, :cond_2

    .line 29
    .line 30
    :goto_0
    return-void

    .line 31
    :cond_2
    new-instance p1, Ljava/lang/AssertionError;

    .line 32
    .line 33
    const-string p2, "The key was empty"

    .line 34
    .line 35
    invoke-direct {p1, p2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    throw p1
.end method
