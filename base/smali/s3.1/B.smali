.class public final Ls3/B;
.super Lk3/u;
.source "SourceFile"


# static fields
.field public static final d:Ls3/B;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ls3/B;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ls3/B;->d:Ls3/B;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final f(BLjava/nio/ByteBuffer;)Ljava/lang/Object;
    .locals 26

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    const-string v2, "Nonnull field \"consumeTapEvents\" is null."

    .line 6
    .line 7
    const-string v3, "Nonnull field \"fillColor\" is null."

    .line 8
    .line 9
    const-string v4, "Nonnull field \"strokeColor\" is null."

    .line 10
    .line 11
    const-string v5, "Nonnull field \"strokeWidth\" is null."

    .line 12
    .line 13
    const-string v6, "Nonnull field \"consumesTapEvents\" is null."

    .line 14
    .line 15
    const-string v7, "Nonnull field \"bounds\" is null."

    .line 16
    .line 17
    const-string v8, "Nonnull field \"position\" is null."

    .line 18
    .line 19
    const-string v9, "Nonnull field \"bearing\" is null."

    .line 20
    .line 21
    const-string v10, "Nonnull field \"y\" is null."

    .line 22
    .line 23
    const-string v11, "Nonnull field \"x\" is null."

    .line 24
    .line 25
    const-string v12, "Nonnull field \"fadeIn\" is null."

    .line 26
    .line 27
    const-string v13, "Nonnull field \"imagePixelRatio\" is null."

    .line 28
    .line 29
    const-string v14, "Nonnull field \"bitmapScaling\" is null."

    .line 30
    .line 31
    const-string v15, "Nonnull field \"byteData\" is null."

    .line 32
    .line 33
    move-object/from16 v16, v2

    .line 34
    .line 35
    const-string v2, "Nonnull field \"zoom\" is null."

    .line 36
    .line 37
    move-object/from16 v17, v2

    .line 38
    .line 39
    const-string v2, "Nonnull field \"transparency\" is null."

    .line 40
    .line 41
    move-object/from16 v18, v3

    .line 42
    .line 43
    const-string v3, "Nonnull field \"geodesic\" is null."

    .line 44
    .line 45
    move-object/from16 v19, v4

    .line 46
    .line 47
    const-string v4, "Nonnull field \"points\" is null."

    .line 48
    .line 49
    move-object/from16 v20, v5

    .line 50
    .line 51
    const-string v5, "Nonnull field \"type\" is null."

    .line 52
    .line 53
    move-object/from16 v21, v6

    .line 54
    .line 55
    const-string v6, "Nonnull field \"width\" is null."

    .line 56
    .line 57
    move-object/from16 v22, v3

    .line 58
    .line 59
    const-string v3, "Nonnull field \"name\" is null."

    .line 60
    .line 61
    move-object/from16 v23, v4

    .line 62
    .line 63
    const-string v4, "Nonnull field \"zIndex\" is null."

    .line 64
    .line 65
    move-object/from16 v24, v5

    .line 66
    .line 67
    const-string v5, "Nonnull field \"visible\" is null."

    .line 68
    .line 69
    move-object/from16 v25, v6

    .line 70
    .line 71
    const/4 v6, 0x0

    .line 72
    packed-switch p1, :pswitch_data_0

    .line 73
    .line 74
    .line 75
    invoke-super/range {p0 .. p2}, Lk3/u;->f(BLjava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    return-object v1

    .line 80
    :pswitch_0
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    check-cast v1, Ljava/util/ArrayList;

    .line 85
    .line 86
    new-instance v2, Ls3/J;

    .line 87
    .line 88
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    check-cast v3, Ls3/b0;

    .line 96
    .line 97
    iput-object v3, v2, Ls3/J;->a:Ls3/b0;

    .line 98
    .line 99
    const/4 v3, 0x1

    .line 100
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    check-cast v3, Ls3/b0;

    .line 105
    .line 106
    iput-object v3, v2, Ls3/J;->b:Ls3/b0;

    .line 107
    .line 108
    const/4 v3, 0x2

    .line 109
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    check-cast v3, Ls3/b0;

    .line 114
    .line 115
    iput-object v3, v2, Ls3/J;->c:Ls3/b0;

    .line 116
    .line 117
    const/4 v3, 0x3

    .line 118
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    check-cast v3, Ls3/C;

    .line 123
    .line 124
    iput-object v3, v2, Ls3/J;->d:Ls3/C;

    .line 125
    .line 126
    const/4 v3, 0x4

    .line 127
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    check-cast v3, Ljava/lang/String;

    .line 132
    .line 133
    iput-object v3, v2, Ls3/J;->e:Ljava/lang/String;

    .line 134
    .line 135
    const/4 v3, 0x5

    .line 136
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    check-cast v1, Ls3/b0;

    .line 141
    .line 142
    iput-object v1, v2, Ls3/J;->f:Ls3/b0;

    .line 143
    .line 144
    return-object v2

    .line 145
    :pswitch_1
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    check-cast v1, Ljava/util/ArrayList;

    .line 150
    .line 151
    new-instance v2, Ls3/H;

    .line 152
    .line 153
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v3

    .line 160
    check-cast v3, [B

    .line 161
    .line 162
    if-eqz v3, :cond_2

    .line 163
    .line 164
    iput-object v3, v2, Ls3/H;->a:[B

    .line 165
    .line 166
    const/4 v3, 0x1

    .line 167
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    check-cast v3, Ls3/l0;

    .line 172
    .line 173
    if-eqz v3, :cond_1

    .line 174
    .line 175
    iput-object v3, v2, Ls3/H;->b:Ls3/l0;

    .line 176
    .line 177
    const/4 v3, 0x2

    .line 178
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v3

    .line 182
    check-cast v3, Ljava/lang/Double;

    .line 183
    .line 184
    if-eqz v3, :cond_0

    .line 185
    .line 186
    iput-object v3, v2, Ls3/H;->c:Ljava/lang/Double;

    .line 187
    .line 188
    const/4 v3, 0x3

    .line 189
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    check-cast v3, Ljava/lang/Double;

    .line 194
    .line 195
    iput-object v3, v2, Ls3/H;->d:Ljava/lang/Double;

    .line 196
    .line 197
    const/4 v3, 0x4

    .line 198
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    check-cast v1, Ljava/lang/Double;

    .line 203
    .line 204
    iput-object v1, v2, Ls3/H;->e:Ljava/lang/Double;

    .line 205
    .line 206
    return-object v2

    .line 207
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 208
    .line 209
    invoke-direct {v1, v13}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    throw v1

    .line 213
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 214
    .line 215
    invoke-direct {v1, v14}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    throw v1

    .line 219
    :cond_2
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 220
    .line 221
    invoke-direct {v1, v15}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    throw v1

    .line 225
    :pswitch_2
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    check-cast v1, Ljava/util/ArrayList;

    .line 230
    .line 231
    new-instance v2, Ls3/F;

    .line 232
    .line 233
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 234
    .line 235
    .line 236
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 237
    .line 238
    .line 239
    move-result-object v3

    .line 240
    check-cast v3, Ljava/lang/String;

    .line 241
    .line 242
    if-eqz v3, :cond_5

    .line 243
    .line 244
    iput-object v3, v2, Ls3/F;->a:Ljava/lang/String;

    .line 245
    .line 246
    const/4 v3, 0x1

    .line 247
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    move-result-object v3

    .line 251
    check-cast v3, Ls3/l0;

    .line 252
    .line 253
    if-eqz v3, :cond_4

    .line 254
    .line 255
    iput-object v3, v2, Ls3/F;->b:Ls3/l0;

    .line 256
    .line 257
    const/4 v3, 0x2

    .line 258
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 259
    .line 260
    .line 261
    move-result-object v3

    .line 262
    check-cast v3, Ljava/lang/Double;

    .line 263
    .line 264
    if-eqz v3, :cond_3

    .line 265
    .line 266
    iput-object v3, v2, Ls3/F;->c:Ljava/lang/Double;

    .line 267
    .line 268
    const/4 v3, 0x3

    .line 269
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 270
    .line 271
    .line 272
    move-result-object v3

    .line 273
    check-cast v3, Ljava/lang/Double;

    .line 274
    .line 275
    iput-object v3, v2, Ls3/F;->d:Ljava/lang/Double;

    .line 276
    .line 277
    const/4 v3, 0x4

    .line 278
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 279
    .line 280
    .line 281
    move-result-object v1

    .line 282
    check-cast v1, Ljava/lang/Double;

    .line 283
    .line 284
    iput-object v1, v2, Ls3/F;->e:Ljava/lang/Double;

    .line 285
    .line 286
    return-object v2

    .line 287
    :cond_3
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 288
    .line 289
    invoke-direct {v1, v13}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    throw v1

    .line 293
    :cond_4
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 294
    .line 295
    invoke-direct {v1, v14}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 296
    .line 297
    .line 298
    throw v1

    .line 299
    :cond_5
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 300
    .line 301
    const-string v2, "Nonnull field \"assetName\" is null."

    .line 302
    .line 303
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 304
    .line 305
    .line 306
    throw v1

    .line 307
    :pswitch_3
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 308
    .line 309
    .line 310
    move-result-object v1

    .line 311
    check-cast v1, Ljava/util/ArrayList;

    .line 312
    .line 313
    new-instance v2, Ls3/E;

    .line 314
    .line 315
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 316
    .line 317
    .line 318
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 319
    .line 320
    .line 321
    move-result-object v4

    .line 322
    check-cast v4, Ljava/lang/String;

    .line 323
    .line 324
    if-eqz v4, :cond_7

    .line 325
    .line 326
    iput-object v4, v2, Ls3/E;->a:Ljava/lang/String;

    .line 327
    .line 328
    const/4 v3, 0x1

    .line 329
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 330
    .line 331
    .line 332
    move-result-object v3

    .line 333
    check-cast v3, Ljava/lang/Double;

    .line 334
    .line 335
    if-eqz v3, :cond_6

    .line 336
    .line 337
    iput-object v3, v2, Ls3/E;->b:Ljava/lang/Double;

    .line 338
    .line 339
    const/4 v3, 0x2

    .line 340
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 341
    .line 342
    .line 343
    move-result-object v1

    .line 344
    check-cast v1, Ls3/c0;

    .line 345
    .line 346
    iput-object v1, v2, Ls3/E;->c:Ls3/c0;

    .line 347
    .line 348
    return-object v2

    .line 349
    :cond_6
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 350
    .line 351
    const-string v2, "Nonnull field \"scale\" is null."

    .line 352
    .line 353
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 354
    .line 355
    .line 356
    throw v1

    .line 357
    :cond_7
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 358
    .line 359
    invoke-direct {v1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 360
    .line 361
    .line 362
    throw v1

    .line 363
    :pswitch_4
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 364
    .line 365
    .line 366
    move-result-object v1

    .line 367
    check-cast v1, Ljava/util/ArrayList;

    .line 368
    .line 369
    new-instance v2, Ls3/D;

    .line 370
    .line 371
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 372
    .line 373
    .line 374
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 375
    .line 376
    .line 377
    move-result-object v4

    .line 378
    check-cast v4, Ljava/lang/String;

    .line 379
    .line 380
    if-eqz v4, :cond_8

    .line 381
    .line 382
    iput-object v4, v2, Ls3/D;->a:Ljava/lang/String;

    .line 383
    .line 384
    const/4 v3, 0x1

    .line 385
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 386
    .line 387
    .line 388
    move-result-object v1

    .line 389
    check-cast v1, Ljava/lang/String;

    .line 390
    .line 391
    iput-object v1, v2, Ls3/D;->b:Ljava/lang/String;

    .line 392
    .line 393
    return-object v2

    .line 394
    :cond_8
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 395
    .line 396
    invoke-direct {v1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 397
    .line 398
    .line 399
    throw v1

    .line 400
    :pswitch_5
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 401
    .line 402
    .line 403
    move-result-object v1

    .line 404
    check-cast v1, Ljava/util/ArrayList;

    .line 405
    .line 406
    new-instance v2, Ls3/G;

    .line 407
    .line 408
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 409
    .line 410
    .line 411
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 412
    .line 413
    .line 414
    move-result-object v3

    .line 415
    check-cast v3, [B

    .line 416
    .line 417
    if-eqz v3, :cond_9

    .line 418
    .line 419
    iput-object v3, v2, Ls3/G;->a:[B

    .line 420
    .line 421
    const/4 v3, 0x1

    .line 422
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 423
    .line 424
    .line 425
    move-result-object v1

    .line 426
    check-cast v1, Ls3/c0;

    .line 427
    .line 428
    iput-object v1, v2, Ls3/G;->b:Ls3/c0;

    .line 429
    .line 430
    return-object v2

    .line 431
    :cond_9
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 432
    .line 433
    invoke-direct {v1, v15}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 434
    .line 435
    .line 436
    throw v1

    .line 437
    :pswitch_6
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 438
    .line 439
    .line 440
    move-result-object v1

    .line 441
    check-cast v1, Ljava/util/ArrayList;

    .line 442
    .line 443
    new-instance v2, Ls3/I;

    .line 444
    .line 445
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 446
    .line 447
    .line 448
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 449
    .line 450
    .line 451
    move-result-object v1

    .line 452
    check-cast v1, Ljava/lang/Double;

    .line 453
    .line 454
    iput-object v1, v2, Ls3/I;->a:Ljava/lang/Double;

    .line 455
    .line 456
    return-object v2

    .line 457
    :pswitch_7
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 458
    .line 459
    .line 460
    move-result-object v1

    .line 461
    check-cast v1, Ljava/util/ArrayList;

    .line 462
    .line 463
    new-instance v2, Ls3/C;

    .line 464
    .line 465
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 466
    .line 467
    .line 468
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 469
    .line 470
    .line 471
    move-result-object v1

    .line 472
    if-eqz v1, :cond_a

    .line 473
    .line 474
    iput-object v1, v2, Ls3/C;->a:Ljava/lang/Object;

    .line 475
    .line 476
    return-object v2

    .line 477
    :cond_a
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 478
    .line 479
    const-string v2, "Nonnull field \"bitmap\" is null."

    .line 480
    .line 481
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 482
    .line 483
    .line 484
    throw v1

    .line 485
    :pswitch_8
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 486
    .line 487
    .line 488
    move-result-object v1

    .line 489
    check-cast v1, Ljava/util/ArrayList;

    .line 490
    .line 491
    new-instance v2, Ls3/C0;

    .line 492
    .line 493
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 494
    .line 495
    .line 496
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 497
    .line 498
    .line 499
    move-result-object v3

    .line 500
    check-cast v3, Ljava/lang/Double;

    .line 501
    .line 502
    iput-object v3, v2, Ls3/C0;->a:Ljava/lang/Double;

    .line 503
    .line 504
    const/4 v3, 0x1

    .line 505
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 506
    .line 507
    .line 508
    move-result-object v1

    .line 509
    check-cast v1, Ljava/lang/Double;

    .line 510
    .line 511
    iput-object v1, v2, Ls3/C0;->b:Ljava/lang/Double;

    .line 512
    .line 513
    return-object v2

    .line 514
    :pswitch_9
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 515
    .line 516
    .line 517
    move-result-object v1

    .line 518
    check-cast v1, Ljava/util/ArrayList;

    .line 519
    .line 520
    new-instance v3, Ls3/z0;

    .line 521
    .line 522
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 523
    .line 524
    .line 525
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 526
    .line 527
    .line 528
    move-result-object v6

    .line 529
    check-cast v6, Ljava/lang/Boolean;

    .line 530
    .line 531
    if-eqz v6, :cond_e

    .line 532
    .line 533
    iput-object v6, v3, Ls3/z0;->a:Ljava/lang/Boolean;

    .line 534
    .line 535
    const/4 v5, 0x1

    .line 536
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 537
    .line 538
    .line 539
    move-result-object v5

    .line 540
    check-cast v5, Ljava/lang/Boolean;

    .line 541
    .line 542
    if-eqz v5, :cond_d

    .line 543
    .line 544
    iput-object v5, v3, Ls3/z0;->b:Ljava/lang/Boolean;

    .line 545
    .line 546
    const/4 v5, 0x2

    .line 547
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 548
    .line 549
    .line 550
    move-result-object v5

    .line 551
    check-cast v5, Ljava/lang/Double;

    .line 552
    .line 553
    if-eqz v5, :cond_c

    .line 554
    .line 555
    iput-object v5, v3, Ls3/z0;->c:Ljava/lang/Double;

    .line 556
    .line 557
    const/4 v2, 0x3

    .line 558
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 559
    .line 560
    .line 561
    move-result-object v1

    .line 562
    check-cast v1, Ljava/lang/Double;

    .line 563
    .line 564
    if-eqz v1, :cond_b

    .line 565
    .line 566
    iput-object v1, v3, Ls3/z0;->d:Ljava/lang/Double;

    .line 567
    .line 568
    return-object v3

    .line 569
    :cond_b
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 570
    .line 571
    invoke-direct {v1, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 572
    .line 573
    .line 574
    throw v1

    .line 575
    :cond_c
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 576
    .line 577
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 578
    .line 579
    .line 580
    throw v1

    .line 581
    :cond_d
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 582
    .line 583
    invoke-direct {v1, v12}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 584
    .line 585
    .line 586
    throw v1

    .line 587
    :cond_e
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 588
    .line 589
    invoke-direct {v1, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 590
    .line 591
    .line 592
    throw v1

    .line 593
    :pswitch_a
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 594
    .line 595
    .line 596
    move-result-object v1

    .line 597
    check-cast v1, Ljava/util/ArrayList;

    .line 598
    .line 599
    new-instance v2, Ls3/u0;

    .line 600
    .line 601
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 602
    .line 603
    .line 604
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 605
    .line 606
    .line 607
    move-result-object v3

    .line 608
    check-cast v3, Ljava/lang/Long;

    .line 609
    .line 610
    if-eqz v3, :cond_10

    .line 611
    .line 612
    iput-object v3, v2, Ls3/u0;->a:Ljava/lang/Long;

    .line 613
    .line 614
    const/4 v3, 0x1

    .line 615
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 616
    .line 617
    .line 618
    move-result-object v1

    .line 619
    check-cast v1, Ljava/lang/Long;

    .line 620
    .line 621
    if-eqz v1, :cond_f

    .line 622
    .line 623
    iput-object v1, v2, Ls3/u0;->b:Ljava/lang/Long;

    .line 624
    .line 625
    return-object v2

    .line 626
    :cond_f
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 627
    .line 628
    invoke-direct {v1, v10}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 629
    .line 630
    .line 631
    throw v1

    .line 632
    :cond_10
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 633
    .line 634
    invoke-direct {v1, v11}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 635
    .line 636
    .line 637
    throw v1

    .line 638
    :pswitch_b
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 639
    .line 640
    .line 641
    move-result-object v1

    .line 642
    check-cast v1, Ljava/util/ArrayList;

    .line 643
    .line 644
    new-instance v2, Ls3/m0;

    .line 645
    .line 646
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 647
    .line 648
    .line 649
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 650
    .line 651
    .line 652
    move-result-object v3

    .line 653
    check-cast v3, Ljava/lang/Boolean;

    .line 654
    .line 655
    iput-object v3, v2, Ls3/m0;->a:Ljava/lang/Boolean;

    .line 656
    .line 657
    const/4 v3, 0x1

    .line 658
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 659
    .line 660
    .line 661
    move-result-object v3

    .line 662
    check-cast v3, Ls3/L;

    .line 663
    .line 664
    iput-object v3, v2, Ls3/m0;->b:Ls3/L;

    .line 665
    .line 666
    const/4 v3, 0x2

    .line 667
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 668
    .line 669
    .line 670
    move-result-object v3

    .line 671
    check-cast v3, Ls3/n0;

    .line 672
    .line 673
    iput-object v3, v2, Ls3/m0;->c:Ls3/n0;

    .line 674
    .line 675
    const/4 v3, 0x3

    .line 676
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 677
    .line 678
    .line 679
    move-result-object v3

    .line 680
    check-cast v3, Ls3/C0;

    .line 681
    .line 682
    iput-object v3, v2, Ls3/m0;->d:Ls3/C0;

    .line 683
    .line 684
    const/4 v3, 0x4

    .line 685
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 686
    .line 687
    .line 688
    move-result-object v3

    .line 689
    check-cast v3, Ljava/lang/Boolean;

    .line 690
    .line 691
    iput-object v3, v2, Ls3/m0;->e:Ljava/lang/Boolean;

    .line 692
    .line 693
    const/4 v3, 0x5

    .line 694
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 695
    .line 696
    .line 697
    move-result-object v3

    .line 698
    check-cast v3, Ljava/lang/Boolean;

    .line 699
    .line 700
    iput-object v3, v2, Ls3/m0;->f:Ljava/lang/Boolean;

    .line 701
    .line 702
    const/4 v3, 0x6

    .line 703
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 704
    .line 705
    .line 706
    move-result-object v3

    .line 707
    check-cast v3, Ljava/lang/Boolean;

    .line 708
    .line 709
    iput-object v3, v2, Ls3/m0;->g:Ljava/lang/Boolean;

    .line 710
    .line 711
    const/4 v3, 0x7

    .line 712
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 713
    .line 714
    .line 715
    move-result-object v3

    .line 716
    check-cast v3, Ljava/lang/Boolean;

    .line 717
    .line 718
    iput-object v3, v2, Ls3/m0;->h:Ljava/lang/Boolean;

    .line 719
    .line 720
    const/16 v3, 0x8

    .line 721
    .line 722
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 723
    .line 724
    .line 725
    move-result-object v3

    .line 726
    check-cast v3, Ljava/lang/Boolean;

    .line 727
    .line 728
    iput-object v3, v2, Ls3/m0;->i:Ljava/lang/Boolean;

    .line 729
    .line 730
    const/16 v3, 0x9

    .line 731
    .line 732
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 733
    .line 734
    .line 735
    move-result-object v3

    .line 736
    check-cast v3, Ljava/lang/Boolean;

    .line 737
    .line 738
    iput-object v3, v2, Ls3/m0;->j:Ljava/lang/Boolean;

    .line 739
    .line 740
    const/16 v3, 0xa

    .line 741
    .line 742
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 743
    .line 744
    .line 745
    move-result-object v3

    .line 746
    check-cast v3, Ljava/lang/Boolean;

    .line 747
    .line 748
    iput-object v3, v2, Ls3/m0;->k:Ljava/lang/Boolean;

    .line 749
    .line 750
    const/16 v3, 0xb

    .line 751
    .line 752
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 753
    .line 754
    .line 755
    move-result-object v3

    .line 756
    check-cast v3, Ljava/lang/Boolean;

    .line 757
    .line 758
    iput-object v3, v2, Ls3/m0;->l:Ljava/lang/Boolean;

    .line 759
    .line 760
    const/16 v3, 0xc

    .line 761
    .line 762
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 763
    .line 764
    .line 765
    move-result-object v3

    .line 766
    check-cast v3, Ljava/lang/Boolean;

    .line 767
    .line 768
    iput-object v3, v2, Ls3/m0;->m:Ljava/lang/Boolean;

    .line 769
    .line 770
    const/16 v3, 0xd

    .line 771
    .line 772
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 773
    .line 774
    .line 775
    move-result-object v3

    .line 776
    check-cast v3, Ls3/d0;

    .line 777
    .line 778
    iput-object v3, v2, Ls3/m0;->n:Ls3/d0;

    .line 779
    .line 780
    const/16 v3, 0xe

    .line 781
    .line 782
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 783
    .line 784
    .line 785
    move-result-object v3

    .line 786
    check-cast v3, Ljava/lang/Boolean;

    .line 787
    .line 788
    iput-object v3, v2, Ls3/m0;->o:Ljava/lang/Boolean;

    .line 789
    .line 790
    const/16 v3, 0xf

    .line 791
    .line 792
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 793
    .line 794
    .line 795
    move-result-object v3

    .line 796
    check-cast v3, Ljava/lang/Boolean;

    .line 797
    .line 798
    iput-object v3, v2, Ls3/m0;->p:Ljava/lang/Boolean;

    .line 799
    .line 800
    const/16 v3, 0x10

    .line 801
    .line 802
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 803
    .line 804
    .line 805
    move-result-object v3

    .line 806
    check-cast v3, Ljava/lang/Boolean;

    .line 807
    .line 808
    iput-object v3, v2, Ls3/m0;->q:Ljava/lang/Boolean;

    .line 809
    .line 810
    const/16 v3, 0x11

    .line 811
    .line 812
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 813
    .line 814
    .line 815
    move-result-object v3

    .line 816
    check-cast v3, Ljava/lang/Boolean;

    .line 817
    .line 818
    iput-object v3, v2, Ls3/m0;->r:Ljava/lang/Boolean;

    .line 819
    .line 820
    const/16 v3, 0x12

    .line 821
    .line 822
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 823
    .line 824
    .line 825
    move-result-object v3

    .line 826
    check-cast v3, Ls3/r0;

    .line 827
    .line 828
    if-eqz v3, :cond_11

    .line 829
    .line 830
    iput-object v3, v2, Ls3/m0;->s:Ls3/r0;

    .line 831
    .line 832
    const/16 v3, 0x13

    .line 833
    .line 834
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 835
    .line 836
    .line 837
    move-result-object v3

    .line 838
    check-cast v3, Ljava/lang/String;

    .line 839
    .line 840
    iput-object v3, v2, Ls3/m0;->t:Ljava/lang/String;

    .line 841
    .line 842
    const/16 v3, 0x14

    .line 843
    .line 844
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 845
    .line 846
    .line 847
    move-result-object v1

    .line 848
    check-cast v1, Ljava/lang/String;

    .line 849
    .line 850
    iput-object v1, v2, Ls3/m0;->u:Ljava/lang/String;

    .line 851
    .line 852
    return-object v2

    .line 853
    :cond_11
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 854
    .line 855
    const-string v2, "Nonnull field \"markerType\" is null."

    .line 856
    .line 857
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 858
    .line 859
    .line 860
    throw v1

    .line 861
    :pswitch_c
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 862
    .line 863
    .line 864
    move-result-object v1

    .line 865
    check-cast v1, Ljava/util/ArrayList;

    .line 866
    .line 867
    new-instance v2, Ls3/o0;

    .line 868
    .line 869
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 870
    .line 871
    .line 872
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 873
    .line 874
    .line 875
    move-result-object v3

    .line 876
    check-cast v3, Ls3/K;

    .line 877
    .line 878
    if-eqz v3, :cond_1b

    .line 879
    .line 880
    iput-object v3, v2, Ls3/o0;->a:Ls3/K;

    .line 881
    .line 882
    const/4 v3, 0x1

    .line 883
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 884
    .line 885
    .line 886
    move-result-object v3

    .line 887
    check-cast v3, Ls3/m0;

    .line 888
    .line 889
    if-eqz v3, :cond_1a

    .line 890
    .line 891
    iput-object v3, v2, Ls3/o0;->b:Ls3/m0;

    .line 892
    .line 893
    const/4 v3, 0x2

    .line 894
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 895
    .line 896
    .line 897
    move-result-object v3

    .line 898
    check-cast v3, Ljava/util/List;

    .line 899
    .line 900
    if-eqz v3, :cond_19

    .line 901
    .line 902
    iput-object v3, v2, Ls3/o0;->c:Ljava/util/List;

    .line 903
    .line 904
    const/4 v3, 0x3

    .line 905
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 906
    .line 907
    .line 908
    move-result-object v3

    .line 909
    check-cast v3, Ljava/util/List;

    .line 910
    .line 911
    if-eqz v3, :cond_18

    .line 912
    .line 913
    iput-object v3, v2, Ls3/o0;->d:Ljava/util/List;

    .line 914
    .line 915
    const/4 v3, 0x4

    .line 916
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 917
    .line 918
    .line 919
    move-result-object v3

    .line 920
    check-cast v3, Ljava/util/List;

    .line 921
    .line 922
    if-eqz v3, :cond_17

    .line 923
    .line 924
    iput-object v3, v2, Ls3/o0;->e:Ljava/util/List;

    .line 925
    .line 926
    const/4 v3, 0x5

    .line 927
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 928
    .line 929
    .line 930
    move-result-object v3

    .line 931
    check-cast v3, Ljava/util/List;

    .line 932
    .line 933
    if-eqz v3, :cond_16

    .line 934
    .line 935
    iput-object v3, v2, Ls3/o0;->f:Ljava/util/List;

    .line 936
    .line 937
    const/4 v3, 0x6

    .line 938
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 939
    .line 940
    .line 941
    move-result-object v3

    .line 942
    check-cast v3, Ljava/util/List;

    .line 943
    .line 944
    if-eqz v3, :cond_15

    .line 945
    .line 946
    iput-object v3, v2, Ls3/o0;->g:Ljava/util/List;

    .line 947
    .line 948
    const/4 v3, 0x7

    .line 949
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 950
    .line 951
    .line 952
    move-result-object v3

    .line 953
    check-cast v3, Ljava/util/List;

    .line 954
    .line 955
    if-eqz v3, :cond_14

    .line 956
    .line 957
    iput-object v3, v2, Ls3/o0;->h:Ljava/util/List;

    .line 958
    .line 959
    const/16 v3, 0x8

    .line 960
    .line 961
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 962
    .line 963
    .line 964
    move-result-object v3

    .line 965
    check-cast v3, Ljava/util/List;

    .line 966
    .line 967
    if-eqz v3, :cond_13

    .line 968
    .line 969
    iput-object v3, v2, Ls3/o0;->i:Ljava/util/List;

    .line 970
    .line 971
    const/16 v3, 0x9

    .line 972
    .line 973
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 974
    .line 975
    .line 976
    move-result-object v1

    .line 977
    check-cast v1, Ljava/util/List;

    .line 978
    .line 979
    if-eqz v1, :cond_12

    .line 980
    .line 981
    iput-object v1, v2, Ls3/o0;->j:Ljava/util/List;

    .line 982
    .line 983
    return-object v2

    .line 984
    :cond_12
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 985
    .line 986
    const-string v2, "Nonnull field \"initialGroundOverlays\" is null."

    .line 987
    .line 988
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 989
    .line 990
    .line 991
    throw v1

    .line 992
    :cond_13
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 993
    .line 994
    const-string v2, "Nonnull field \"initialClusterManagers\" is null."

    .line 995
    .line 996
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 997
    .line 998
    .line 999
    throw v1

    .line 1000
    :cond_14
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1001
    .line 1002
    const-string v2, "Nonnull field \"initialTileOverlays\" is null."

    .line 1003
    .line 1004
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1005
    .line 1006
    .line 1007
    throw v1

    .line 1008
    :cond_15
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1009
    .line 1010
    const-string v2, "Nonnull field \"initialHeatmaps\" is null."

    .line 1011
    .line 1012
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1013
    .line 1014
    .line 1015
    throw v1

    .line 1016
    :cond_16
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1017
    .line 1018
    const-string v2, "Nonnull field \"initialPolylines\" is null."

    .line 1019
    .line 1020
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1021
    .line 1022
    .line 1023
    throw v1

    .line 1024
    :cond_17
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1025
    .line 1026
    const-string v2, "Nonnull field \"initialPolygons\" is null."

    .line 1027
    .line 1028
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1029
    .line 1030
    .line 1031
    throw v1

    .line 1032
    :cond_18
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1033
    .line 1034
    const-string v2, "Nonnull field \"initialMarkers\" is null."

    .line 1035
    .line 1036
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1037
    .line 1038
    .line 1039
    throw v1

    .line 1040
    :cond_19
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1041
    .line 1042
    const-string v2, "Nonnull field \"initialCircles\" is null."

    .line 1043
    .line 1044
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1045
    .line 1046
    .line 1047
    throw v1

    .line 1048
    :cond_1a
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1049
    .line 1050
    const-string v2, "Nonnull field \"mapConfiguration\" is null."

    .line 1051
    .line 1052
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1053
    .line 1054
    .line 1055
    throw v1

    .line 1056
    :cond_1b
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1057
    .line 1058
    const-string v2, "Nonnull field \"initialCameraPosition\" is null."

    .line 1059
    .line 1060
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1061
    .line 1062
    .line 1063
    throw v1

    .line 1064
    :pswitch_d
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 1065
    .line 1066
    .line 1067
    move-result-object v1

    .line 1068
    check-cast v1, Ljava/util/ArrayList;

    .line 1069
    .line 1070
    new-instance v2, Ls3/L;

    .line 1071
    .line 1072
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 1073
    .line 1074
    .line 1075
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1076
    .line 1077
    .line 1078
    move-result-object v1

    .line 1079
    check-cast v1, Ls3/k0;

    .line 1080
    .line 1081
    iput-object v1, v2, Ls3/L;->a:Ls3/k0;

    .line 1082
    .line 1083
    return-object v2

    .line 1084
    :pswitch_e
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 1085
    .line 1086
    .line 1087
    move-result-object v1

    .line 1088
    check-cast v1, Ljava/util/ArrayList;

    .line 1089
    .line 1090
    new-instance v3, Ls3/e0;

    .line 1091
    .line 1092
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 1093
    .line 1094
    .line 1095
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1096
    .line 1097
    .line 1098
    move-result-object v6

    .line 1099
    check-cast v6, Ljava/lang/String;

    .line 1100
    .line 1101
    if-eqz v6, :cond_22

    .line 1102
    .line 1103
    iput-object v6, v3, Ls3/e0;->a:Ljava/lang/String;

    .line 1104
    .line 1105
    const/4 v6, 0x1

    .line 1106
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1107
    .line 1108
    .line 1109
    move-result-object v6

    .line 1110
    check-cast v6, Ls3/C;

    .line 1111
    .line 1112
    if-eqz v6, :cond_21

    .line 1113
    .line 1114
    iput-object v6, v3, Ls3/e0;->b:Ls3/C;

    .line 1115
    .line 1116
    const/4 v6, 0x2

    .line 1117
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1118
    .line 1119
    .line 1120
    move-result-object v6

    .line 1121
    check-cast v6, Ls3/j0;

    .line 1122
    .line 1123
    iput-object v6, v3, Ls3/e0;->c:Ls3/j0;

    .line 1124
    .line 1125
    const/4 v6, 0x3

    .line 1126
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1127
    .line 1128
    .line 1129
    move-result-object v6

    .line 1130
    check-cast v6, Ls3/k0;

    .line 1131
    .line 1132
    iput-object v6, v3, Ls3/e0;->d:Ls3/k0;

    .line 1133
    .line 1134
    const/4 v6, 0x4

    .line 1135
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1136
    .line 1137
    .line 1138
    move-result-object v6

    .line 1139
    check-cast v6, Ljava/lang/Double;

    .line 1140
    .line 1141
    iput-object v6, v3, Ls3/e0;->e:Ljava/lang/Double;

    .line 1142
    .line 1143
    const/4 v6, 0x5

    .line 1144
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1145
    .line 1146
    .line 1147
    move-result-object v6

    .line 1148
    check-cast v6, Ljava/lang/Double;

    .line 1149
    .line 1150
    iput-object v6, v3, Ls3/e0;->f:Ljava/lang/Double;

    .line 1151
    .line 1152
    const/4 v6, 0x6

    .line 1153
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1154
    .line 1155
    .line 1156
    move-result-object v6

    .line 1157
    check-cast v6, Ls3/c0;

    .line 1158
    .line 1159
    iput-object v6, v3, Ls3/e0;->g:Ls3/c0;

    .line 1160
    .line 1161
    const/4 v6, 0x7

    .line 1162
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1163
    .line 1164
    .line 1165
    move-result-object v6

    .line 1166
    check-cast v6, Ljava/lang/Double;

    .line 1167
    .line 1168
    if-eqz v6, :cond_20

    .line 1169
    .line 1170
    iput-object v6, v3, Ls3/e0;->h:Ljava/lang/Double;

    .line 1171
    .line 1172
    const/16 v2, 0x8

    .line 1173
    .line 1174
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1175
    .line 1176
    .line 1177
    move-result-object v2

    .line 1178
    check-cast v2, Ljava/lang/Double;

    .line 1179
    .line 1180
    if-eqz v2, :cond_1f

    .line 1181
    .line 1182
    iput-object v2, v3, Ls3/e0;->i:Ljava/lang/Double;

    .line 1183
    .line 1184
    const/16 v2, 0x9

    .line 1185
    .line 1186
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1187
    .line 1188
    .line 1189
    move-result-object v2

    .line 1190
    check-cast v2, Ljava/lang/Long;

    .line 1191
    .line 1192
    if-eqz v2, :cond_1e

    .line 1193
    .line 1194
    iput-object v2, v3, Ls3/e0;->j:Ljava/lang/Long;

    .line 1195
    .line 1196
    const/16 v2, 0xa

    .line 1197
    .line 1198
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1199
    .line 1200
    .line 1201
    move-result-object v2

    .line 1202
    check-cast v2, Ljava/lang/Boolean;

    .line 1203
    .line 1204
    if-eqz v2, :cond_1d

    .line 1205
    .line 1206
    iput-object v2, v3, Ls3/e0;->k:Ljava/lang/Boolean;

    .line 1207
    .line 1208
    const/16 v2, 0xb

    .line 1209
    .line 1210
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1211
    .line 1212
    .line 1213
    move-result-object v1

    .line 1214
    check-cast v1, Ljava/lang/Boolean;

    .line 1215
    .line 1216
    if-eqz v1, :cond_1c

    .line 1217
    .line 1218
    iput-object v1, v3, Ls3/e0;->l:Ljava/lang/Boolean;

    .line 1219
    .line 1220
    return-object v3

    .line 1221
    :cond_1c
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1222
    .line 1223
    const-string v2, "Nonnull field \"clickable\" is null."

    .line 1224
    .line 1225
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1226
    .line 1227
    .line 1228
    throw v1

    .line 1229
    :cond_1d
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1230
    .line 1231
    invoke-direct {v1, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1232
    .line 1233
    .line 1234
    throw v1

    .line 1235
    :cond_1e
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1236
    .line 1237
    invoke-direct {v1, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1238
    .line 1239
    .line 1240
    throw v1

    .line 1241
    :cond_1f
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1242
    .line 1243
    invoke-direct {v1, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1244
    .line 1245
    .line 1246
    throw v1

    .line 1247
    :cond_20
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1248
    .line 1249
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1250
    .line 1251
    .line 1252
    throw v1

    .line 1253
    :cond_21
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1254
    .line 1255
    const-string v2, "Nonnull field \"image\" is null."

    .line 1256
    .line 1257
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1258
    .line 1259
    .line 1260
    throw v1

    .line 1261
    :cond_22
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1262
    .line 1263
    const-string v2, "Nonnull field \"groundOverlayId\" is null."

    .line 1264
    .line 1265
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1266
    .line 1267
    .line 1268
    throw v1

    .line 1269
    :pswitch_f
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 1270
    .line 1271
    .line 1272
    move-result-object v1

    .line 1273
    check-cast v1, Ljava/util/ArrayList;

    .line 1274
    .line 1275
    new-instance v2, Ls3/Z;

    .line 1276
    .line 1277
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 1278
    .line 1279
    .line 1280
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1281
    .line 1282
    .line 1283
    move-result-object v3

    .line 1284
    check-cast v3, Ljava/lang/String;

    .line 1285
    .line 1286
    if-eqz v3, :cond_26

    .line 1287
    .line 1288
    iput-object v3, v2, Ls3/Z;->a:Ljava/lang/String;

    .line 1289
    .line 1290
    const/4 v3, 0x1

    .line 1291
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1292
    .line 1293
    .line 1294
    move-result-object v3

    .line 1295
    check-cast v3, Ls3/j0;

    .line 1296
    .line 1297
    if-eqz v3, :cond_25

    .line 1298
    .line 1299
    iput-object v3, v2, Ls3/Z;->b:Ls3/j0;

    .line 1300
    .line 1301
    const/4 v3, 0x2

    .line 1302
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1303
    .line 1304
    .line 1305
    move-result-object v3

    .line 1306
    check-cast v3, Ls3/k0;

    .line 1307
    .line 1308
    if-eqz v3, :cond_24

    .line 1309
    .line 1310
    iput-object v3, v2, Ls3/Z;->c:Ls3/k0;

    .line 1311
    .line 1312
    const/4 v3, 0x3

    .line 1313
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1314
    .line 1315
    .line 1316
    move-result-object v1

    .line 1317
    check-cast v1, Ljava/util/List;

    .line 1318
    .line 1319
    if-eqz v1, :cond_23

    .line 1320
    .line 1321
    iput-object v1, v2, Ls3/Z;->d:Ljava/util/List;

    .line 1322
    .line 1323
    return-object v2

    .line 1324
    :cond_23
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1325
    .line 1326
    const-string v2, "Nonnull field \"markerIds\" is null."

    .line 1327
    .line 1328
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1329
    .line 1330
    .line 1331
    throw v1

    .line 1332
    :cond_24
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1333
    .line 1334
    invoke-direct {v1, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1335
    .line 1336
    .line 1337
    throw v1

    .line 1338
    :cond_25
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1339
    .line 1340
    invoke-direct {v1, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1341
    .line 1342
    .line 1343
    throw v1

    .line 1344
    :cond_26
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1345
    .line 1346
    const-string v2, "Nonnull field \"clusterManagerId\" is null."

    .line 1347
    .line 1348
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1349
    .line 1350
    .line 1351
    throw v1

    .line 1352
    :pswitch_10
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 1353
    .line 1354
    .line 1355
    move-result-object v1

    .line 1356
    check-cast v1, Ljava/util/ArrayList;

    .line 1357
    .line 1358
    new-instance v2, Ls3/k0;

    .line 1359
    .line 1360
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 1361
    .line 1362
    .line 1363
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1364
    .line 1365
    .line 1366
    move-result-object v3

    .line 1367
    check-cast v3, Ls3/j0;

    .line 1368
    .line 1369
    if-eqz v3, :cond_28

    .line 1370
    .line 1371
    iput-object v3, v2, Ls3/k0;->a:Ls3/j0;

    .line 1372
    .line 1373
    const/4 v3, 0x1

    .line 1374
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1375
    .line 1376
    .line 1377
    move-result-object v1

    .line 1378
    check-cast v1, Ls3/j0;

    .line 1379
    .line 1380
    if-eqz v1, :cond_27

    .line 1381
    .line 1382
    iput-object v1, v2, Ls3/k0;->b:Ls3/j0;

    .line 1383
    .line 1384
    return-object v2

    .line 1385
    :cond_27
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1386
    .line 1387
    const-string v2, "Nonnull field \"southwest\" is null."

    .line 1388
    .line 1389
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1390
    .line 1391
    .line 1392
    throw v1

    .line 1393
    :cond_28
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1394
    .line 1395
    const-string v2, "Nonnull field \"northeast\" is null."

    .line 1396
    .line 1397
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1398
    .line 1399
    .line 1400
    throw v1

    .line 1401
    :pswitch_11
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 1402
    .line 1403
    .line 1404
    move-result-object v1

    .line 1405
    check-cast v1, Ljava/util/ArrayList;

    .line 1406
    .line 1407
    new-instance v2, Ls3/j0;

    .line 1408
    .line 1409
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 1410
    .line 1411
    .line 1412
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1413
    .line 1414
    .line 1415
    move-result-object v3

    .line 1416
    check-cast v3, Ljava/lang/Double;

    .line 1417
    .line 1418
    if-eqz v3, :cond_2a

    .line 1419
    .line 1420
    iput-object v3, v2, Ls3/j0;->a:Ljava/lang/Double;

    .line 1421
    .line 1422
    const/4 v3, 0x1

    .line 1423
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1424
    .line 1425
    .line 1426
    move-result-object v1

    .line 1427
    check-cast v1, Ljava/lang/Double;

    .line 1428
    .line 1429
    if-eqz v1, :cond_29

    .line 1430
    .line 1431
    iput-object v1, v2, Ls3/j0;->b:Ljava/lang/Double;

    .line 1432
    .line 1433
    return-object v2

    .line 1434
    :cond_29
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1435
    .line 1436
    const-string v2, "Nonnull field \"longitude\" is null."

    .line 1437
    .line 1438
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1439
    .line 1440
    .line 1441
    throw v1

    .line 1442
    :cond_2a
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1443
    .line 1444
    const-string v2, "Nonnull field \"latitude\" is null."

    .line 1445
    .line 1446
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1447
    .line 1448
    .line 1449
    throw v1

    .line 1450
    :pswitch_12
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 1451
    .line 1452
    .line 1453
    move-result-object v1

    .line 1454
    check-cast v1, Ljava/util/ArrayList;

    .line 1455
    .line 1456
    new-instance v2, Ls3/d0;

    .line 1457
    .line 1458
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 1459
    .line 1460
    .line 1461
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1462
    .line 1463
    .line 1464
    move-result-object v3

    .line 1465
    check-cast v3, Ljava/lang/Double;

    .line 1466
    .line 1467
    if-eqz v3, :cond_2e

    .line 1468
    .line 1469
    iput-object v3, v2, Ls3/d0;->a:Ljava/lang/Double;

    .line 1470
    .line 1471
    const/4 v3, 0x1

    .line 1472
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1473
    .line 1474
    .line 1475
    move-result-object v3

    .line 1476
    check-cast v3, Ljava/lang/Double;

    .line 1477
    .line 1478
    if-eqz v3, :cond_2d

    .line 1479
    .line 1480
    iput-object v3, v2, Ls3/d0;->b:Ljava/lang/Double;

    .line 1481
    .line 1482
    const/4 v3, 0x2

    .line 1483
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1484
    .line 1485
    .line 1486
    move-result-object v3

    .line 1487
    check-cast v3, Ljava/lang/Double;

    .line 1488
    .line 1489
    if-eqz v3, :cond_2c

    .line 1490
    .line 1491
    iput-object v3, v2, Ls3/d0;->c:Ljava/lang/Double;

    .line 1492
    .line 1493
    const/4 v3, 0x3

    .line 1494
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1495
    .line 1496
    .line 1497
    move-result-object v1

    .line 1498
    check-cast v1, Ljava/lang/Double;

    .line 1499
    .line 1500
    if-eqz v1, :cond_2b

    .line 1501
    .line 1502
    iput-object v1, v2, Ls3/d0;->d:Ljava/lang/Double;

    .line 1503
    .line 1504
    return-object v2

    .line 1505
    :cond_2b
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1506
    .line 1507
    const-string v2, "Nonnull field \"right\" is null."

    .line 1508
    .line 1509
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1510
    .line 1511
    .line 1512
    throw v1

    .line 1513
    :cond_2c
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1514
    .line 1515
    const-string v2, "Nonnull field \"left\" is null."

    .line 1516
    .line 1517
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1518
    .line 1519
    .line 1520
    throw v1

    .line 1521
    :cond_2d
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1522
    .line 1523
    const-string v2, "Nonnull field \"bottom\" is null."

    .line 1524
    .line 1525
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1526
    .line 1527
    .line 1528
    throw v1

    .line 1529
    :cond_2e
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1530
    .line 1531
    const-string v2, "Nonnull field \"top\" is null."

    .line 1532
    .line 1533
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1534
    .line 1535
    .line 1536
    throw v1

    .line 1537
    :pswitch_13
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 1538
    .line 1539
    .line 1540
    move-result-object v1

    .line 1541
    check-cast v1, Ljava/util/ArrayList;

    .line 1542
    .line 1543
    new-instance v3, Ls3/A0;

    .line 1544
    .line 1545
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 1546
    .line 1547
    .line 1548
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1549
    .line 1550
    .line 1551
    move-result-object v6

    .line 1552
    check-cast v6, Ljava/lang/String;

    .line 1553
    .line 1554
    if-eqz v6, :cond_34

    .line 1555
    .line 1556
    iput-object v6, v3, Ls3/A0;->a:Ljava/lang/String;

    .line 1557
    .line 1558
    const/4 v6, 0x1

    .line 1559
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1560
    .line 1561
    .line 1562
    move-result-object v6

    .line 1563
    check-cast v6, Ljava/lang/Boolean;

    .line 1564
    .line 1565
    if-eqz v6, :cond_33

    .line 1566
    .line 1567
    iput-object v6, v3, Ls3/A0;->b:Ljava/lang/Boolean;

    .line 1568
    .line 1569
    const/4 v6, 0x2

    .line 1570
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1571
    .line 1572
    .line 1573
    move-result-object v6

    .line 1574
    check-cast v6, Ljava/lang/Double;

    .line 1575
    .line 1576
    if-eqz v6, :cond_32

    .line 1577
    .line 1578
    iput-object v6, v3, Ls3/A0;->c:Ljava/lang/Double;

    .line 1579
    .line 1580
    const/4 v2, 0x3

    .line 1581
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1582
    .line 1583
    .line 1584
    move-result-object v2

    .line 1585
    check-cast v2, Ljava/lang/Long;

    .line 1586
    .line 1587
    if-eqz v2, :cond_31

    .line 1588
    .line 1589
    iput-object v2, v3, Ls3/A0;->d:Ljava/lang/Long;

    .line 1590
    .line 1591
    const/4 v6, 0x4

    .line 1592
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1593
    .line 1594
    .line 1595
    move-result-object v2

    .line 1596
    check-cast v2, Ljava/lang/Boolean;

    .line 1597
    .line 1598
    if-eqz v2, :cond_30

    .line 1599
    .line 1600
    iput-object v2, v3, Ls3/A0;->e:Ljava/lang/Boolean;

    .line 1601
    .line 1602
    const/4 v6, 0x5

    .line 1603
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1604
    .line 1605
    .line 1606
    move-result-object v1

    .line 1607
    check-cast v1, Ljava/lang/Long;

    .line 1608
    .line 1609
    if-eqz v1, :cond_2f

    .line 1610
    .line 1611
    iput-object v1, v3, Ls3/A0;->f:Ljava/lang/Long;

    .line 1612
    .line 1613
    return-object v3

    .line 1614
    :cond_2f
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1615
    .line 1616
    const-string v2, "Nonnull field \"tileSize\" is null."

    .line 1617
    .line 1618
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1619
    .line 1620
    .line 1621
    throw v1

    .line 1622
    :cond_30
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1623
    .line 1624
    invoke-direct {v1, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1625
    .line 1626
    .line 1627
    throw v1

    .line 1628
    :cond_31
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1629
    .line 1630
    invoke-direct {v1, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1631
    .line 1632
    .line 1633
    throw v1

    .line 1634
    :cond_32
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1635
    .line 1636
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1637
    .line 1638
    .line 1639
    throw v1

    .line 1640
    :cond_33
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1641
    .line 1642
    invoke-direct {v1, v12}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1643
    .line 1644
    .line 1645
    throw v1

    .line 1646
    :cond_34
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1647
    .line 1648
    const-string v2, "Nonnull field \"tileOverlayId\" is null."

    .line 1649
    .line 1650
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1651
    .line 1652
    .line 1653
    throw v1

    .line 1654
    :pswitch_14
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 1655
    .line 1656
    .line 1657
    move-result-object v1

    .line 1658
    check-cast v1, Ljava/util/ArrayList;

    .line 1659
    .line 1660
    new-instance v2, Ls3/y0;

    .line 1661
    .line 1662
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 1663
    .line 1664
    .line 1665
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1666
    .line 1667
    .line 1668
    move-result-object v3

    .line 1669
    check-cast v3, Ljava/lang/Long;

    .line 1670
    .line 1671
    if-eqz v3, :cond_36

    .line 1672
    .line 1673
    iput-object v3, v2, Ls3/y0;->a:Ljava/lang/Long;

    .line 1674
    .line 1675
    const/4 v3, 0x1

    .line 1676
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1677
    .line 1678
    .line 1679
    move-result-object v3

    .line 1680
    check-cast v3, Ljava/lang/Long;

    .line 1681
    .line 1682
    if-eqz v3, :cond_35

    .line 1683
    .line 1684
    iput-object v3, v2, Ls3/y0;->b:Ljava/lang/Long;

    .line 1685
    .line 1686
    const/4 v3, 0x2

    .line 1687
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1688
    .line 1689
    .line 1690
    move-result-object v1

    .line 1691
    check-cast v1, [B

    .line 1692
    .line 1693
    iput-object v1, v2, Ls3/y0;->c:[B

    .line 1694
    .line 1695
    return-object v2

    .line 1696
    :cond_35
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1697
    .line 1698
    const-string v2, "Nonnull field \"height\" is null."

    .line 1699
    .line 1700
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1701
    .line 1702
    .line 1703
    throw v1

    .line 1704
    :cond_36
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1705
    .line 1706
    move-object/from16 v2, v25

    .line 1707
    .line 1708
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1709
    .line 1710
    .line 1711
    throw v1

    .line 1712
    :pswitch_15
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 1713
    .line 1714
    .line 1715
    move-result-object v1

    .line 1716
    check-cast v1, Ljava/util/ArrayList;

    .line 1717
    .line 1718
    new-instance v2, Ls3/s0;

    .line 1719
    .line 1720
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 1721
    .line 1722
    .line 1723
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1724
    .line 1725
    .line 1726
    move-result-object v3

    .line 1727
    check-cast v3, Ls3/t0;

    .line 1728
    .line 1729
    if-eqz v3, :cond_37

    .line 1730
    .line 1731
    iput-object v3, v2, Ls3/s0;->a:Ls3/t0;

    .line 1732
    .line 1733
    const/4 v3, 0x1

    .line 1734
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1735
    .line 1736
    .line 1737
    move-result-object v1

    .line 1738
    check-cast v1, Ljava/lang/Double;

    .line 1739
    .line 1740
    iput-object v1, v2, Ls3/s0;->b:Ljava/lang/Double;

    .line 1741
    .line 1742
    return-object v2

    .line 1743
    :cond_37
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1744
    .line 1745
    move-object/from16 v2, v24

    .line 1746
    .line 1747
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1748
    .line 1749
    .line 1750
    throw v1

    .line 1751
    :pswitch_16
    move-object/from16 v2, v24

    .line 1752
    .line 1753
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 1754
    .line 1755
    .line 1756
    move-result-object v1

    .line 1757
    check-cast v1, Ljava/util/ArrayList;

    .line 1758
    .line 1759
    new-instance v3, Ls3/W;

    .line 1760
    .line 1761
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 1762
    .line 1763
    .line 1764
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1765
    .line 1766
    .line 1767
    move-result-object v4

    .line 1768
    check-cast v4, Ls3/X;

    .line 1769
    .line 1770
    if-eqz v4, :cond_38

    .line 1771
    .line 1772
    iput-object v4, v3, Ls3/W;->a:Ls3/X;

    .line 1773
    .line 1774
    const/4 v6, 0x1

    .line 1775
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1776
    .line 1777
    .line 1778
    move-result-object v2

    .line 1779
    check-cast v2, Ls3/C;

    .line 1780
    .line 1781
    iput-object v2, v3, Ls3/W;->b:Ls3/C;

    .line 1782
    .line 1783
    const/4 v6, 0x2

    .line 1784
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1785
    .line 1786
    .line 1787
    move-result-object v1

    .line 1788
    check-cast v1, Ljava/lang/Double;

    .line 1789
    .line 1790
    iput-object v1, v3, Ls3/W;->c:Ljava/lang/Double;

    .line 1791
    .line 1792
    return-object v3

    .line 1793
    :cond_38
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1794
    .line 1795
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1796
    .line 1797
    .line 1798
    throw v1

    .line 1799
    :pswitch_17
    move-object/from16 v2, v25

    .line 1800
    .line 1801
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 1802
    .line 1803
    .line 1804
    move-result-object v1

    .line 1805
    check-cast v1, Ljava/util/ArrayList;

    .line 1806
    .line 1807
    new-instance v3, Ls3/w0;

    .line 1808
    .line 1809
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 1810
    .line 1811
    .line 1812
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1813
    .line 1814
    .line 1815
    move-result-object v6

    .line 1816
    check-cast v6, Ljava/lang/String;

    .line 1817
    .line 1818
    if-eqz v6, :cond_44

    .line 1819
    .line 1820
    iput-object v6, v3, Ls3/w0;->a:Ljava/lang/String;

    .line 1821
    .line 1822
    const/4 v6, 0x1

    .line 1823
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1824
    .line 1825
    .line 1826
    move-result-object v6

    .line 1827
    check-cast v6, Ljava/lang/Boolean;

    .line 1828
    .line 1829
    if-eqz v6, :cond_43

    .line 1830
    .line 1831
    iput-object v6, v3, Ls3/w0;->b:Ljava/lang/Boolean;

    .line 1832
    .line 1833
    const/4 v6, 0x2

    .line 1834
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1835
    .line 1836
    .line 1837
    move-result-object v6

    .line 1838
    check-cast v6, Ls3/b0;

    .line 1839
    .line 1840
    if-eqz v6, :cond_42

    .line 1841
    .line 1842
    iput-object v6, v3, Ls3/w0;->c:Ls3/b0;

    .line 1843
    .line 1844
    const/4 v6, 0x3

    .line 1845
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1846
    .line 1847
    .line 1848
    move-result-object v6

    .line 1849
    check-cast v6, Ljava/lang/Boolean;

    .line 1850
    .line 1851
    if-eqz v6, :cond_41

    .line 1852
    .line 1853
    iput-object v6, v3, Ls3/w0;->d:Ljava/lang/Boolean;

    .line 1854
    .line 1855
    const/4 v6, 0x4

    .line 1856
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1857
    .line 1858
    .line 1859
    move-result-object v6

    .line 1860
    check-cast v6, Ls3/i0;

    .line 1861
    .line 1862
    if-eqz v6, :cond_40

    .line 1863
    .line 1864
    iput-object v6, v3, Ls3/w0;->e:Ls3/i0;

    .line 1865
    .line 1866
    const/4 v6, 0x5

    .line 1867
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1868
    .line 1869
    .line 1870
    move-result-object v6

    .line 1871
    check-cast v6, Ljava/util/List;

    .line 1872
    .line 1873
    if-eqz v6, :cond_3f

    .line 1874
    .line 1875
    iput-object v6, v3, Ls3/w0;->f:Ljava/util/List;

    .line 1876
    .line 1877
    const/4 v6, 0x6

    .line 1878
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1879
    .line 1880
    .line 1881
    move-result-object v6

    .line 1882
    check-cast v6, Ljava/util/List;

    .line 1883
    .line 1884
    if-eqz v6, :cond_3e

    .line 1885
    .line 1886
    iput-object v6, v3, Ls3/w0;->g:Ljava/util/List;

    .line 1887
    .line 1888
    const/4 v6, 0x7

    .line 1889
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1890
    .line 1891
    .line 1892
    move-result-object v6

    .line 1893
    check-cast v6, Ls3/W;

    .line 1894
    .line 1895
    if-eqz v6, :cond_3d

    .line 1896
    .line 1897
    iput-object v6, v3, Ls3/w0;->h:Ls3/W;

    .line 1898
    .line 1899
    const/16 v6, 0x8

    .line 1900
    .line 1901
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1902
    .line 1903
    .line 1904
    move-result-object v6

    .line 1905
    check-cast v6, Ls3/W;

    .line 1906
    .line 1907
    if-eqz v6, :cond_3c

    .line 1908
    .line 1909
    iput-object v6, v3, Ls3/w0;->i:Ls3/W;

    .line 1910
    .line 1911
    const/16 v6, 0x9

    .line 1912
    .line 1913
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1914
    .line 1915
    .line 1916
    move-result-object v6

    .line 1917
    check-cast v6, Ljava/lang/Boolean;

    .line 1918
    .line 1919
    if-eqz v6, :cond_3b

    .line 1920
    .line 1921
    iput-object v6, v3, Ls3/w0;->j:Ljava/lang/Boolean;

    .line 1922
    .line 1923
    const/16 v5, 0xa

    .line 1924
    .line 1925
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1926
    .line 1927
    .line 1928
    move-result-object v5

    .line 1929
    check-cast v5, Ljava/lang/Long;

    .line 1930
    .line 1931
    if-eqz v5, :cond_3a

    .line 1932
    .line 1933
    iput-object v5, v3, Ls3/w0;->k:Ljava/lang/Long;

    .line 1934
    .line 1935
    const/16 v2, 0xb

    .line 1936
    .line 1937
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1938
    .line 1939
    .line 1940
    move-result-object v1

    .line 1941
    check-cast v1, Ljava/lang/Long;

    .line 1942
    .line 1943
    if-eqz v1, :cond_39

    .line 1944
    .line 1945
    iput-object v1, v3, Ls3/w0;->l:Ljava/lang/Long;

    .line 1946
    .line 1947
    return-object v3

    .line 1948
    :cond_39
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1949
    .line 1950
    invoke-direct {v1, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1951
    .line 1952
    .line 1953
    throw v1

    .line 1954
    :cond_3a
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1955
    .line 1956
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1957
    .line 1958
    .line 1959
    throw v1

    .line 1960
    :cond_3b
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1961
    .line 1962
    invoke-direct {v1, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1963
    .line 1964
    .line 1965
    throw v1

    .line 1966
    :cond_3c
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1967
    .line 1968
    const-string v2, "Nonnull field \"endCap\" is null."

    .line 1969
    .line 1970
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1971
    .line 1972
    .line 1973
    throw v1

    .line 1974
    :cond_3d
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1975
    .line 1976
    const-string v2, "Nonnull field \"startCap\" is null."

    .line 1977
    .line 1978
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1979
    .line 1980
    .line 1981
    throw v1

    .line 1982
    :cond_3e
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1983
    .line 1984
    move-object/from16 v2, v23

    .line 1985
    .line 1986
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1987
    .line 1988
    .line 1989
    throw v1

    .line 1990
    :cond_3f
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1991
    .line 1992
    const-string v2, "Nonnull field \"patterns\" is null."

    .line 1993
    .line 1994
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1995
    .line 1996
    .line 1997
    throw v1

    .line 1998
    :cond_40
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 1999
    .line 2000
    const-string v2, "Nonnull field \"jointType\" is null."

    .line 2001
    .line 2002
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2003
    .line 2004
    .line 2005
    throw v1

    .line 2006
    :cond_41
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2007
    .line 2008
    move-object/from16 v3, v22

    .line 2009
    .line 2010
    invoke-direct {v1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2011
    .line 2012
    .line 2013
    throw v1

    .line 2014
    :cond_42
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2015
    .line 2016
    const-string v2, "Nonnull field \"color\" is null."

    .line 2017
    .line 2018
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2019
    .line 2020
    .line 2021
    throw v1

    .line 2022
    :cond_43
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2023
    .line 2024
    move-object/from16 v7, v21

    .line 2025
    .line 2026
    invoke-direct {v1, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2027
    .line 2028
    .line 2029
    throw v1

    .line 2030
    :cond_44
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2031
    .line 2032
    const-string v2, "Nonnull field \"polylineId\" is null."

    .line 2033
    .line 2034
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2035
    .line 2036
    .line 2037
    throw v1

    .line 2038
    :pswitch_18
    move-object/from16 v7, v21

    .line 2039
    .line 2040
    move-object/from16 v3, v22

    .line 2041
    .line 2042
    move-object/from16 v2, v23

    .line 2043
    .line 2044
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 2045
    .line 2046
    .line 2047
    move-result-object v1

    .line 2048
    check-cast v1, Ljava/util/ArrayList;

    .line 2049
    .line 2050
    new-instance v8, Ls3/v0;

    .line 2051
    .line 2052
    invoke-direct {v8}, Ljava/lang/Object;-><init>()V

    .line 2053
    .line 2054
    .line 2055
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2056
    .line 2057
    .line 2058
    move-result-object v6

    .line 2059
    check-cast v6, Ljava/lang/String;

    .line 2060
    .line 2061
    if-eqz v6, :cond_4e

    .line 2062
    .line 2063
    iput-object v6, v8, Ls3/v0;->a:Ljava/lang/String;

    .line 2064
    .line 2065
    const/4 v6, 0x1

    .line 2066
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2067
    .line 2068
    .line 2069
    move-result-object v6

    .line 2070
    check-cast v6, Ljava/lang/Boolean;

    .line 2071
    .line 2072
    if-eqz v6, :cond_4d

    .line 2073
    .line 2074
    iput-object v6, v8, Ls3/v0;->b:Ljava/lang/Boolean;

    .line 2075
    .line 2076
    const/4 v6, 0x2

    .line 2077
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2078
    .line 2079
    .line 2080
    move-result-object v6

    .line 2081
    check-cast v6, Ls3/b0;

    .line 2082
    .line 2083
    if-eqz v6, :cond_4c

    .line 2084
    .line 2085
    iput-object v6, v8, Ls3/v0;->c:Ls3/b0;

    .line 2086
    .line 2087
    const/4 v6, 0x3

    .line 2088
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2089
    .line 2090
    .line 2091
    move-result-object v6

    .line 2092
    check-cast v6, Ljava/lang/Boolean;

    .line 2093
    .line 2094
    if-eqz v6, :cond_4b

    .line 2095
    .line 2096
    iput-object v6, v8, Ls3/v0;->d:Ljava/lang/Boolean;

    .line 2097
    .line 2098
    const/4 v3, 0x4

    .line 2099
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2100
    .line 2101
    .line 2102
    move-result-object v3

    .line 2103
    check-cast v3, Ljava/util/List;

    .line 2104
    .line 2105
    if-eqz v3, :cond_4a

    .line 2106
    .line 2107
    iput-object v3, v8, Ls3/v0;->e:Ljava/util/List;

    .line 2108
    .line 2109
    const/4 v3, 0x5

    .line 2110
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2111
    .line 2112
    .line 2113
    move-result-object v2

    .line 2114
    check-cast v2, Ljava/util/List;

    .line 2115
    .line 2116
    if-eqz v2, :cond_49

    .line 2117
    .line 2118
    iput-object v2, v8, Ls3/v0;->f:Ljava/util/List;

    .line 2119
    .line 2120
    const/4 v3, 0x6

    .line 2121
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2122
    .line 2123
    .line 2124
    move-result-object v2

    .line 2125
    check-cast v2, Ljava/lang/Boolean;

    .line 2126
    .line 2127
    if-eqz v2, :cond_48

    .line 2128
    .line 2129
    iput-object v2, v8, Ls3/v0;->g:Ljava/lang/Boolean;

    .line 2130
    .line 2131
    const/4 v3, 0x7

    .line 2132
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2133
    .line 2134
    .line 2135
    move-result-object v2

    .line 2136
    check-cast v2, Ls3/b0;

    .line 2137
    .line 2138
    if-eqz v2, :cond_47

    .line 2139
    .line 2140
    iput-object v2, v8, Ls3/v0;->h:Ls3/b0;

    .line 2141
    .line 2142
    const/16 v3, 0x8

    .line 2143
    .line 2144
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2145
    .line 2146
    .line 2147
    move-result-object v2

    .line 2148
    check-cast v2, Ljava/lang/Long;

    .line 2149
    .line 2150
    if-eqz v2, :cond_46

    .line 2151
    .line 2152
    iput-object v2, v8, Ls3/v0;->i:Ljava/lang/Long;

    .line 2153
    .line 2154
    const/16 v3, 0x9

    .line 2155
    .line 2156
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2157
    .line 2158
    .line 2159
    move-result-object v1

    .line 2160
    check-cast v1, Ljava/lang/Long;

    .line 2161
    .line 2162
    if-eqz v1, :cond_45

    .line 2163
    .line 2164
    iput-object v1, v8, Ls3/v0;->j:Ljava/lang/Long;

    .line 2165
    .line 2166
    return-object v8

    .line 2167
    :cond_45
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2168
    .line 2169
    invoke-direct {v1, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2170
    .line 2171
    .line 2172
    throw v1

    .line 2173
    :cond_46
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2174
    .line 2175
    move-object/from16 v2, v20

    .line 2176
    .line 2177
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2178
    .line 2179
    .line 2180
    throw v1

    .line 2181
    :cond_47
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2182
    .line 2183
    move-object/from16 v3, v19

    .line 2184
    .line 2185
    invoke-direct {v1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2186
    .line 2187
    .line 2188
    throw v1

    .line 2189
    :cond_48
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2190
    .line 2191
    invoke-direct {v1, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2192
    .line 2193
    .line 2194
    throw v1

    .line 2195
    :cond_49
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2196
    .line 2197
    const-string v2, "Nonnull field \"holes\" is null."

    .line 2198
    .line 2199
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2200
    .line 2201
    .line 2202
    throw v1

    .line 2203
    :cond_4a
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2204
    .line 2205
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2206
    .line 2207
    .line 2208
    throw v1

    .line 2209
    :cond_4b
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2210
    .line 2211
    invoke-direct {v1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2212
    .line 2213
    .line 2214
    throw v1

    .line 2215
    :cond_4c
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2216
    .line 2217
    move-object/from16 v7, v18

    .line 2218
    .line 2219
    invoke-direct {v1, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2220
    .line 2221
    .line 2222
    throw v1

    .line 2223
    :cond_4d
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2224
    .line 2225
    invoke-direct {v1, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2226
    .line 2227
    .line 2228
    throw v1

    .line 2229
    :cond_4e
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2230
    .line 2231
    const-string v2, "Nonnull field \"polygonId\" is null."

    .line 2232
    .line 2233
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2234
    .line 2235
    .line 2236
    throw v1

    .line 2237
    :pswitch_19
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 2238
    .line 2239
    .line 2240
    move-result-object v1

    .line 2241
    check-cast v1, Ljava/util/ArrayList;

    .line 2242
    .line 2243
    new-instance v2, Ls3/p0;

    .line 2244
    .line 2245
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 2246
    .line 2247
    .line 2248
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2249
    .line 2250
    .line 2251
    move-result-object v3

    .line 2252
    check-cast v3, Ljava/lang/Double;

    .line 2253
    .line 2254
    if-eqz v3, :cond_5b

    .line 2255
    .line 2256
    iput-object v3, v2, Ls3/p0;->a:Ljava/lang/Double;

    .line 2257
    .line 2258
    const/4 v3, 0x1

    .line 2259
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2260
    .line 2261
    .line 2262
    move-result-object v3

    .line 2263
    check-cast v3, Ls3/c0;

    .line 2264
    .line 2265
    if-eqz v3, :cond_5a

    .line 2266
    .line 2267
    iput-object v3, v2, Ls3/p0;->b:Ls3/c0;

    .line 2268
    .line 2269
    const/4 v3, 0x2

    .line 2270
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2271
    .line 2272
    .line 2273
    move-result-object v3

    .line 2274
    check-cast v3, Ljava/lang/Boolean;

    .line 2275
    .line 2276
    if-eqz v3, :cond_59

    .line 2277
    .line 2278
    iput-object v3, v2, Ls3/p0;->c:Ljava/lang/Boolean;

    .line 2279
    .line 2280
    const/4 v3, 0x3

    .line 2281
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2282
    .line 2283
    .line 2284
    move-result-object v3

    .line 2285
    check-cast v3, Ljava/lang/Boolean;

    .line 2286
    .line 2287
    if-eqz v3, :cond_58

    .line 2288
    .line 2289
    iput-object v3, v2, Ls3/p0;->d:Ljava/lang/Boolean;

    .line 2290
    .line 2291
    const/4 v3, 0x4

    .line 2292
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2293
    .line 2294
    .line 2295
    move-result-object v3

    .line 2296
    check-cast v3, Ljava/lang/Boolean;

    .line 2297
    .line 2298
    if-eqz v3, :cond_57

    .line 2299
    .line 2300
    iput-object v3, v2, Ls3/p0;->e:Ljava/lang/Boolean;

    .line 2301
    .line 2302
    const/4 v3, 0x5

    .line 2303
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2304
    .line 2305
    .line 2306
    move-result-object v3

    .line 2307
    check-cast v3, Ls3/C;

    .line 2308
    .line 2309
    if-eqz v3, :cond_56

    .line 2310
    .line 2311
    iput-object v3, v2, Ls3/p0;->f:Ls3/C;

    .line 2312
    .line 2313
    const/4 v3, 0x6

    .line 2314
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2315
    .line 2316
    .line 2317
    move-result-object v3

    .line 2318
    check-cast v3, Ls3/h0;

    .line 2319
    .line 2320
    if-eqz v3, :cond_55

    .line 2321
    .line 2322
    iput-object v3, v2, Ls3/p0;->g:Ls3/h0;

    .line 2323
    .line 2324
    const/4 v3, 0x7

    .line 2325
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2326
    .line 2327
    .line 2328
    move-result-object v3

    .line 2329
    check-cast v3, Ls3/j0;

    .line 2330
    .line 2331
    if-eqz v3, :cond_54

    .line 2332
    .line 2333
    iput-object v3, v2, Ls3/p0;->h:Ls3/j0;

    .line 2334
    .line 2335
    const/16 v3, 0x8

    .line 2336
    .line 2337
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2338
    .line 2339
    .line 2340
    move-result-object v3

    .line 2341
    check-cast v3, Ljava/lang/Double;

    .line 2342
    .line 2343
    if-eqz v3, :cond_53

    .line 2344
    .line 2345
    iput-object v3, v2, Ls3/p0;->i:Ljava/lang/Double;

    .line 2346
    .line 2347
    const/16 v3, 0x9

    .line 2348
    .line 2349
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2350
    .line 2351
    .line 2352
    move-result-object v3

    .line 2353
    check-cast v3, Ljava/lang/Boolean;

    .line 2354
    .line 2355
    if-eqz v3, :cond_52

    .line 2356
    .line 2357
    iput-object v3, v2, Ls3/p0;->j:Ljava/lang/Boolean;

    .line 2358
    .line 2359
    const/16 v3, 0xa

    .line 2360
    .line 2361
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2362
    .line 2363
    .line 2364
    move-result-object v3

    .line 2365
    check-cast v3, Ljava/lang/Double;

    .line 2366
    .line 2367
    if-eqz v3, :cond_51

    .line 2368
    .line 2369
    iput-object v3, v2, Ls3/p0;->k:Ljava/lang/Double;

    .line 2370
    .line 2371
    const/16 v3, 0xb

    .line 2372
    .line 2373
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2374
    .line 2375
    .line 2376
    move-result-object v3

    .line 2377
    check-cast v3, Ljava/lang/String;

    .line 2378
    .line 2379
    if-eqz v3, :cond_50

    .line 2380
    .line 2381
    iput-object v3, v2, Ls3/p0;->l:Ljava/lang/String;

    .line 2382
    .line 2383
    const/16 v3, 0xc

    .line 2384
    .line 2385
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2386
    .line 2387
    .line 2388
    move-result-object v3

    .line 2389
    check-cast v3, Ljava/lang/String;

    .line 2390
    .line 2391
    iput-object v3, v2, Ls3/p0;->m:Ljava/lang/String;

    .line 2392
    .line 2393
    const/16 v3, 0xd

    .line 2394
    .line 2395
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2396
    .line 2397
    .line 2398
    move-result-object v1

    .line 2399
    check-cast v1, Ls3/q0;

    .line 2400
    .line 2401
    if-eqz v1, :cond_4f

    .line 2402
    .line 2403
    iput-object v1, v2, Ls3/p0;->n:Ls3/q0;

    .line 2404
    .line 2405
    return-object v2

    .line 2406
    :cond_4f
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2407
    .line 2408
    const-string v2, "Nonnull field \"collisionBehavior\" is null."

    .line 2409
    .line 2410
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2411
    .line 2412
    .line 2413
    throw v1

    .line 2414
    :cond_50
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2415
    .line 2416
    const-string v2, "Nonnull field \"markerId\" is null."

    .line 2417
    .line 2418
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2419
    .line 2420
    .line 2421
    throw v1

    .line 2422
    :cond_51
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2423
    .line 2424
    invoke-direct {v1, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2425
    .line 2426
    .line 2427
    throw v1

    .line 2428
    :cond_52
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2429
    .line 2430
    invoke-direct {v1, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2431
    .line 2432
    .line 2433
    throw v1

    .line 2434
    :cond_53
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2435
    .line 2436
    const-string v2, "Nonnull field \"rotation\" is null."

    .line 2437
    .line 2438
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2439
    .line 2440
    .line 2441
    throw v1

    .line 2442
    :cond_54
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2443
    .line 2444
    invoke-direct {v1, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2445
    .line 2446
    .line 2447
    throw v1

    .line 2448
    :cond_55
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2449
    .line 2450
    const-string v2, "Nonnull field \"infoWindow\" is null."

    .line 2451
    .line 2452
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2453
    .line 2454
    .line 2455
    throw v1

    .line 2456
    :cond_56
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2457
    .line 2458
    const-string v2, "Nonnull field \"icon\" is null."

    .line 2459
    .line 2460
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2461
    .line 2462
    .line 2463
    throw v1

    .line 2464
    :cond_57
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2465
    .line 2466
    const-string v2, "Nonnull field \"flat\" is null."

    .line 2467
    .line 2468
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2469
    .line 2470
    .line 2471
    throw v1

    .line 2472
    :cond_58
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2473
    .line 2474
    const-string v2, "Nonnull field \"draggable\" is null."

    .line 2475
    .line 2476
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2477
    .line 2478
    .line 2479
    throw v1

    .line 2480
    :cond_59
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2481
    .line 2482
    move-object/from16 v8, v16

    .line 2483
    .line 2484
    invoke-direct {v1, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2485
    .line 2486
    .line 2487
    throw v1

    .line 2488
    :cond_5a
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2489
    .line 2490
    const-string v2, "Nonnull field \"anchor\" is null."

    .line 2491
    .line 2492
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2493
    .line 2494
    .line 2495
    throw v1

    .line 2496
    :cond_5b
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2497
    .line 2498
    const-string v2, "Nonnull field \"alpha\" is null."

    .line 2499
    .line 2500
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2501
    .line 2502
    .line 2503
    throw v1

    .line 2504
    :pswitch_1a
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 2505
    .line 2506
    .line 2507
    move-result-object v1

    .line 2508
    check-cast v1, Ljava/util/ArrayList;

    .line 2509
    .line 2510
    new-instance v2, Ls3/h0;

    .line 2511
    .line 2512
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 2513
    .line 2514
    .line 2515
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2516
    .line 2517
    .line 2518
    move-result-object v3

    .line 2519
    check-cast v3, Ljava/lang/String;

    .line 2520
    .line 2521
    iput-object v3, v2, Ls3/h0;->a:Ljava/lang/String;

    .line 2522
    .line 2523
    const/4 v3, 0x1

    .line 2524
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2525
    .line 2526
    .line 2527
    move-result-object v3

    .line 2528
    check-cast v3, Ljava/lang/String;

    .line 2529
    .line 2530
    iput-object v3, v2, Ls3/h0;->b:Ljava/lang/String;

    .line 2531
    .line 2532
    const/4 v3, 0x2

    .line 2533
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2534
    .line 2535
    .line 2536
    move-result-object v1

    .line 2537
    check-cast v1, Ls3/c0;

    .line 2538
    .line 2539
    if-eqz v1, :cond_5c

    .line 2540
    .line 2541
    iput-object v1, v2, Ls3/h0;->c:Ls3/c0;

    .line 2542
    .line 2543
    return-object v2

    .line 2544
    :cond_5c
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2545
    .line 2546
    const-string v2, "Nonnull field \"anchor\" is null."

    .line 2547
    .line 2548
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2549
    .line 2550
    .line 2551
    throw v1

    .line 2552
    :pswitch_1b
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 2553
    .line 2554
    .line 2555
    move-result-object v1

    .line 2556
    check-cast v1, Ljava/util/ArrayList;

    .line 2557
    .line 2558
    new-instance v2, Ls3/b0;

    .line 2559
    .line 2560
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 2561
    .line 2562
    .line 2563
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2564
    .line 2565
    .line 2566
    move-result-object v1

    .line 2567
    check-cast v1, Ljava/lang/Long;

    .line 2568
    .line 2569
    if-eqz v1, :cond_5d

    .line 2570
    .line 2571
    iput-object v1, v2, Ls3/b0;->a:Ljava/lang/Long;

    .line 2572
    .line 2573
    return-object v2

    .line 2574
    :cond_5d
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2575
    .line 2576
    const-string v2, "Nonnull field \"argbValue\" is null."

    .line 2577
    .line 2578
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2579
    .line 2580
    .line 2581
    throw v1

    .line 2582
    :pswitch_1c
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 2583
    .line 2584
    .line 2585
    move-result-object v1

    .line 2586
    check-cast v1, Ljava/util/ArrayList;

    .line 2587
    .line 2588
    new-instance v2, Ls3/c0;

    .line 2589
    .line 2590
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 2591
    .line 2592
    .line 2593
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2594
    .line 2595
    .line 2596
    move-result-object v3

    .line 2597
    check-cast v3, Ljava/lang/Double;

    .line 2598
    .line 2599
    if-eqz v3, :cond_5f

    .line 2600
    .line 2601
    iput-object v3, v2, Ls3/c0;->a:Ljava/lang/Double;

    .line 2602
    .line 2603
    const/4 v3, 0x1

    .line 2604
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2605
    .line 2606
    .line 2607
    move-result-object v1

    .line 2608
    check-cast v1, Ljava/lang/Double;

    .line 2609
    .line 2610
    if-eqz v1, :cond_5e

    .line 2611
    .line 2612
    iput-object v1, v2, Ls3/c0;->b:Ljava/lang/Double;

    .line 2613
    .line 2614
    return-object v2

    .line 2615
    :cond_5e
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2616
    .line 2617
    invoke-direct {v1, v10}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2618
    .line 2619
    .line 2620
    throw v1

    .line 2621
    :cond_5f
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2622
    .line 2623
    invoke-direct {v1, v11}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2624
    .line 2625
    .line 2626
    throw v1

    .line 2627
    :pswitch_1d
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 2628
    .line 2629
    .line 2630
    move-result-object v1

    .line 2631
    check-cast v1, Ljava/util/ArrayList;

    .line 2632
    .line 2633
    new-instance v2, Ls3/a0;

    .line 2634
    .line 2635
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 2636
    .line 2637
    .line 2638
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2639
    .line 2640
    .line 2641
    move-result-object v1

    .line 2642
    check-cast v1, Ljava/lang/String;

    .line 2643
    .line 2644
    if-eqz v1, :cond_60

    .line 2645
    .line 2646
    iput-object v1, v2, Ls3/a0;->a:Ljava/lang/String;

    .line 2647
    .line 2648
    return-object v2

    .line 2649
    :cond_60
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2650
    .line 2651
    const-string v2, "Nonnull field \"identifier\" is null."

    .line 2652
    .line 2653
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2654
    .line 2655
    .line 2656
    throw v1

    .line 2657
    :pswitch_1e
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 2658
    .line 2659
    .line 2660
    move-result-object v1

    .line 2661
    check-cast v1, Ljava/util/ArrayList;

    .line 2662
    .line 2663
    new-instance v2, Ls3/B0;

    .line 2664
    .line 2665
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 2666
    .line 2667
    .line 2668
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2669
    .line 2670
    .line 2671
    move-result-object v3

    .line 2672
    check-cast v3, Ls3/j0;

    .line 2673
    .line 2674
    if-eqz v3, :cond_62

    .line 2675
    .line 2676
    iput-object v3, v2, Ls3/B0;->a:Ls3/j0;

    .line 2677
    .line 2678
    const/4 v3, 0x1

    .line 2679
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2680
    .line 2681
    .line 2682
    move-result-object v1

    .line 2683
    check-cast v1, Ljava/lang/Double;

    .line 2684
    .line 2685
    if-eqz v1, :cond_61

    .line 2686
    .line 2687
    iput-object v1, v2, Ls3/B0;->b:Ljava/lang/Double;

    .line 2688
    .line 2689
    return-object v2

    .line 2690
    :cond_61
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2691
    .line 2692
    const-string v2, "Nonnull field \"weight\" is null."

    .line 2693
    .line 2694
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2695
    .line 2696
    .line 2697
    throw v1

    .line 2698
    :cond_62
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2699
    .line 2700
    const-string v2, "Nonnull field \"point\" is null."

    .line 2701
    .line 2702
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2703
    .line 2704
    .line 2705
    throw v1

    .line 2706
    :pswitch_1f
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 2707
    .line 2708
    .line 2709
    move-result-object v1

    .line 2710
    check-cast v1, Ljava/util/ArrayList;

    .line 2711
    .line 2712
    new-instance v2, Ls3/g0;

    .line 2713
    .line 2714
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 2715
    .line 2716
    .line 2717
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2718
    .line 2719
    .line 2720
    move-result-object v3

    .line 2721
    check-cast v3, Ljava/util/List;

    .line 2722
    .line 2723
    if-eqz v3, :cond_65

    .line 2724
    .line 2725
    iput-object v3, v2, Ls3/g0;->a:Ljava/util/List;

    .line 2726
    .line 2727
    const/4 v3, 0x1

    .line 2728
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2729
    .line 2730
    .line 2731
    move-result-object v3

    .line 2732
    check-cast v3, Ljava/util/List;

    .line 2733
    .line 2734
    if-eqz v3, :cond_64

    .line 2735
    .line 2736
    iput-object v3, v2, Ls3/g0;->b:Ljava/util/List;

    .line 2737
    .line 2738
    const/4 v3, 0x2

    .line 2739
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2740
    .line 2741
    .line 2742
    move-result-object v1

    .line 2743
    check-cast v1, Ljava/lang/Long;

    .line 2744
    .line 2745
    if-eqz v1, :cond_63

    .line 2746
    .line 2747
    iput-object v1, v2, Ls3/g0;->c:Ljava/lang/Long;

    .line 2748
    .line 2749
    return-object v2

    .line 2750
    :cond_63
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2751
    .line 2752
    const-string v2, "Nonnull field \"colorMapSize\" is null."

    .line 2753
    .line 2754
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2755
    .line 2756
    .line 2757
    throw v1

    .line 2758
    :cond_64
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2759
    .line 2760
    const-string v2, "Nonnull field \"startPoints\" is null."

    .line 2761
    .line 2762
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2763
    .line 2764
    .line 2765
    throw v1

    .line 2766
    :cond_65
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2767
    .line 2768
    const-string v2, "Nonnull field \"colors\" is null."

    .line 2769
    .line 2770
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2771
    .line 2772
    .line 2773
    throw v1

    .line 2774
    :pswitch_20
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 2775
    .line 2776
    .line 2777
    move-result-object v1

    .line 2778
    check-cast v1, Ljava/util/ArrayList;

    .line 2779
    .line 2780
    new-instance v2, Ls3/f0;

    .line 2781
    .line 2782
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 2783
    .line 2784
    .line 2785
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2786
    .line 2787
    .line 2788
    move-result-object v3

    .line 2789
    check-cast v3, Ljava/lang/String;

    .line 2790
    .line 2791
    if-eqz v3, :cond_69

    .line 2792
    .line 2793
    iput-object v3, v2, Ls3/f0;->a:Ljava/lang/String;

    .line 2794
    .line 2795
    const/4 v3, 0x1

    .line 2796
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2797
    .line 2798
    .line 2799
    move-result-object v3

    .line 2800
    check-cast v3, Ljava/util/List;

    .line 2801
    .line 2802
    if-eqz v3, :cond_68

    .line 2803
    .line 2804
    iput-object v3, v2, Ls3/f0;->b:Ljava/util/List;

    .line 2805
    .line 2806
    const/4 v3, 0x2

    .line 2807
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2808
    .line 2809
    .line 2810
    move-result-object v3

    .line 2811
    check-cast v3, Ls3/g0;

    .line 2812
    .line 2813
    iput-object v3, v2, Ls3/f0;->c:Ls3/g0;

    .line 2814
    .line 2815
    const/4 v3, 0x3

    .line 2816
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2817
    .line 2818
    .line 2819
    move-result-object v3

    .line 2820
    check-cast v3, Ljava/lang/Double;

    .line 2821
    .line 2822
    if-eqz v3, :cond_67

    .line 2823
    .line 2824
    iput-object v3, v2, Ls3/f0;->d:Ljava/lang/Double;

    .line 2825
    .line 2826
    const/4 v3, 0x4

    .line 2827
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2828
    .line 2829
    .line 2830
    move-result-object v3

    .line 2831
    check-cast v3, Ljava/lang/Long;

    .line 2832
    .line 2833
    if-eqz v3, :cond_66

    .line 2834
    .line 2835
    iput-object v3, v2, Ls3/f0;->e:Ljava/lang/Long;

    .line 2836
    .line 2837
    const/4 v3, 0x5

    .line 2838
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2839
    .line 2840
    .line 2841
    move-result-object v1

    .line 2842
    check-cast v1, Ljava/lang/Double;

    .line 2843
    .line 2844
    iput-object v1, v2, Ls3/f0;->f:Ljava/lang/Double;

    .line 2845
    .line 2846
    return-object v2

    .line 2847
    :cond_66
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2848
    .line 2849
    const-string v2, "Nonnull field \"radius\" is null."

    .line 2850
    .line 2851
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2852
    .line 2853
    .line 2854
    throw v1

    .line 2855
    :cond_67
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2856
    .line 2857
    const-string v2, "Nonnull field \"opacity\" is null."

    .line 2858
    .line 2859
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2860
    .line 2861
    .line 2862
    throw v1

    .line 2863
    :cond_68
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2864
    .line 2865
    const-string v2, "Nonnull field \"data\" is null."

    .line 2866
    .line 2867
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2868
    .line 2869
    .line 2870
    throw v1

    .line 2871
    :cond_69
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2872
    .line 2873
    const-string v2, "Nonnull field \"heatmapId\" is null."

    .line 2874
    .line 2875
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 2876
    .line 2877
    .line 2878
    throw v1

    .line 2879
    :pswitch_21
    move-object/from16 v8, v16

    .line 2880
    .line 2881
    move-object/from16 v7, v18

    .line 2882
    .line 2883
    move-object/from16 v3, v19

    .line 2884
    .line 2885
    move-object/from16 v2, v20

    .line 2886
    .line 2887
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 2888
    .line 2889
    .line 2890
    move-result-object v1

    .line 2891
    check-cast v1, Ljava/util/ArrayList;

    .line 2892
    .line 2893
    new-instance v9, Ls3/Y;

    .line 2894
    .line 2895
    invoke-direct {v9}, Ljava/lang/Object;-><init>()V

    .line 2896
    .line 2897
    .line 2898
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2899
    .line 2900
    .line 2901
    move-result-object v6

    .line 2902
    check-cast v6, Ljava/lang/Boolean;

    .line 2903
    .line 2904
    if-eqz v6, :cond_72

    .line 2905
    .line 2906
    iput-object v6, v9, Ls3/Y;->a:Ljava/lang/Boolean;

    .line 2907
    .line 2908
    const/4 v6, 0x1

    .line 2909
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2910
    .line 2911
    .line 2912
    move-result-object v6

    .line 2913
    check-cast v6, Ls3/b0;

    .line 2914
    .line 2915
    if-eqz v6, :cond_71

    .line 2916
    .line 2917
    iput-object v6, v9, Ls3/Y;->b:Ls3/b0;

    .line 2918
    .line 2919
    const/4 v6, 0x2

    .line 2920
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2921
    .line 2922
    .line 2923
    move-result-object v6

    .line 2924
    check-cast v6, Ls3/b0;

    .line 2925
    .line 2926
    if-eqz v6, :cond_70

    .line 2927
    .line 2928
    iput-object v6, v9, Ls3/Y;->c:Ls3/b0;

    .line 2929
    .line 2930
    const/4 v3, 0x3

    .line 2931
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2932
    .line 2933
    .line 2934
    move-result-object v3

    .line 2935
    check-cast v3, Ljava/lang/Boolean;

    .line 2936
    .line 2937
    if-eqz v3, :cond_6f

    .line 2938
    .line 2939
    iput-object v3, v9, Ls3/Y;->d:Ljava/lang/Boolean;

    .line 2940
    .line 2941
    const/4 v3, 0x4

    .line 2942
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2943
    .line 2944
    .line 2945
    move-result-object v3

    .line 2946
    check-cast v3, Ljava/lang/Long;

    .line 2947
    .line 2948
    if-eqz v3, :cond_6e

    .line 2949
    .line 2950
    iput-object v3, v9, Ls3/Y;->e:Ljava/lang/Long;

    .line 2951
    .line 2952
    const/4 v3, 0x5

    .line 2953
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2954
    .line 2955
    .line 2956
    move-result-object v2

    .line 2957
    check-cast v2, Ljava/lang/Double;

    .line 2958
    .line 2959
    if-eqz v2, :cond_6d

    .line 2960
    .line 2961
    iput-object v2, v9, Ls3/Y;->f:Ljava/lang/Double;

    .line 2962
    .line 2963
    const/4 v3, 0x6

    .line 2964
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2965
    .line 2966
    .line 2967
    move-result-object v2

    .line 2968
    check-cast v2, Ls3/j0;

    .line 2969
    .line 2970
    if-eqz v2, :cond_6c

    .line 2971
    .line 2972
    iput-object v2, v9, Ls3/Y;->g:Ls3/j0;

    .line 2973
    .line 2974
    const/4 v3, 0x7

    .line 2975
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2976
    .line 2977
    .line 2978
    move-result-object v2

    .line 2979
    check-cast v2, Ljava/lang/Double;

    .line 2980
    .line 2981
    if-eqz v2, :cond_6b

    .line 2982
    .line 2983
    iput-object v2, v9, Ls3/Y;->h:Ljava/lang/Double;

    .line 2984
    .line 2985
    const/16 v3, 0x8

    .line 2986
    .line 2987
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 2988
    .line 2989
    .line 2990
    move-result-object v1

    .line 2991
    check-cast v1, Ljava/lang/String;

    .line 2992
    .line 2993
    if-eqz v1, :cond_6a

    .line 2994
    .line 2995
    iput-object v1, v9, Ls3/Y;->i:Ljava/lang/String;

    .line 2996
    .line 2997
    return-object v9

    .line 2998
    :cond_6a
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 2999
    .line 3000
    const-string v2, "Nonnull field \"circleId\" is null."

    .line 3001
    .line 3002
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 3003
    .line 3004
    .line 3005
    throw v1

    .line 3006
    :cond_6b
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 3007
    .line 3008
    const-string v2, "Nonnull field \"radius\" is null."

    .line 3009
    .line 3010
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 3011
    .line 3012
    .line 3013
    throw v1

    .line 3014
    :cond_6c
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 3015
    .line 3016
    const-string v2, "Nonnull field \"center\" is null."

    .line 3017
    .line 3018
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 3019
    .line 3020
    .line 3021
    throw v1

    .line 3022
    :cond_6d
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 3023
    .line 3024
    invoke-direct {v1, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 3025
    .line 3026
    .line 3027
    throw v1

    .line 3028
    :cond_6e
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 3029
    .line 3030
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 3031
    .line 3032
    .line 3033
    throw v1

    .line 3034
    :cond_6f
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 3035
    .line 3036
    invoke-direct {v1, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 3037
    .line 3038
    .line 3039
    throw v1

    .line 3040
    :cond_70
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 3041
    .line 3042
    invoke-direct {v1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 3043
    .line 3044
    .line 3045
    throw v1

    .line 3046
    :cond_71
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 3047
    .line 3048
    invoke-direct {v1, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 3049
    .line 3050
    .line 3051
    throw v1

    .line 3052
    :cond_72
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 3053
    .line 3054
    invoke-direct {v1, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 3055
    .line 3056
    .line 3057
    throw v1

    .line 3058
    :pswitch_22
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 3059
    .line 3060
    .line 3061
    move-result-object v1

    .line 3062
    check-cast v1, Ljava/util/ArrayList;

    .line 3063
    .line 3064
    new-instance v2, Ls3/V;

    .line 3065
    .line 3066
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 3067
    .line 3068
    .line 3069
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 3070
    .line 3071
    .line 3072
    move-result-object v1

    .line 3073
    check-cast v1, Ljava/lang/Double;

    .line 3074
    .line 3075
    if-eqz v1, :cond_73

    .line 3076
    .line 3077
    iput-object v1, v2, Ls3/V;->a:Ljava/lang/Double;

    .line 3078
    .line 3079
    return-object v2

    .line 3080
    :cond_73
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 3081
    .line 3082
    move-object/from16 v2, v17

    .line 3083
    .line 3084
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 3085
    .line 3086
    .line 3087
    throw v1

    .line 3088
    :pswitch_23
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 3089
    .line 3090
    .line 3091
    move-result-object v1

    .line 3092
    check-cast v1, Ljava/util/ArrayList;

    .line 3093
    .line 3094
    new-instance v2, Ls3/T;

    .line 3095
    .line 3096
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 3097
    .line 3098
    .line 3099
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 3100
    .line 3101
    .line 3102
    move-result-object v1

    .line 3103
    check-cast v1, Ljava/lang/Boolean;

    .line 3104
    .line 3105
    if-eqz v1, :cond_74

    .line 3106
    .line 3107
    iput-object v1, v2, Ls3/T;->a:Ljava/lang/Boolean;

    .line 3108
    .line 3109
    return-object v2

    .line 3110
    :cond_74
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 3111
    .line 3112
    const-string v2, "Nonnull field \"out\" is null."

    .line 3113
    .line 3114
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 3115
    .line 3116
    .line 3117
    throw v1

    .line 3118
    :pswitch_24
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 3119
    .line 3120
    .line 3121
    move-result-object v1

    .line 3122
    check-cast v1, Ljava/util/ArrayList;

    .line 3123
    .line 3124
    new-instance v2, Ls3/U;

    .line 3125
    .line 3126
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 3127
    .line 3128
    .line 3129
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 3130
    .line 3131
    .line 3132
    move-result-object v3

    .line 3133
    check-cast v3, Ljava/lang/Double;

    .line 3134
    .line 3135
    if-eqz v3, :cond_75

    .line 3136
    .line 3137
    iput-object v3, v2, Ls3/U;->a:Ljava/lang/Double;

    .line 3138
    .line 3139
    const/4 v3, 0x1

    .line 3140
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 3141
    .line 3142
    .line 3143
    move-result-object v1

    .line 3144
    check-cast v1, Ls3/c0;

    .line 3145
    .line 3146
    iput-object v1, v2, Ls3/U;->b:Ls3/c0;

    .line 3147
    .line 3148
    return-object v2

    .line 3149
    :cond_75
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 3150
    .line 3151
    const-string v2, "Nonnull field \"amount\" is null."

    .line 3152
    .line 3153
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 3154
    .line 3155
    .line 3156
    throw v1

    .line 3157
    :pswitch_25
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 3158
    .line 3159
    .line 3160
    move-result-object v1

    .line 3161
    check-cast v1, Ljava/util/ArrayList;

    .line 3162
    .line 3163
    new-instance v2, Ls3/S;

    .line 3164
    .line 3165
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 3166
    .line 3167
    .line 3168
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 3169
    .line 3170
    .line 3171
    move-result-object v3

    .line 3172
    check-cast v3, Ljava/lang/Double;

    .line 3173
    .line 3174
    if-eqz v3, :cond_77

    .line 3175
    .line 3176
    iput-object v3, v2, Ls3/S;->a:Ljava/lang/Double;

    .line 3177
    .line 3178
    const/4 v3, 0x1

    .line 3179
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 3180
    .line 3181
    .line 3182
    move-result-object v1

    .line 3183
    check-cast v1, Ljava/lang/Double;

    .line 3184
    .line 3185
    if-eqz v1, :cond_76

    .line 3186
    .line 3187
    iput-object v1, v2, Ls3/S;->b:Ljava/lang/Double;

    .line 3188
    .line 3189
    return-object v2

    .line 3190
    :cond_76
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 3191
    .line 3192
    const-string v2, "Nonnull field \"dy\" is null."

    .line 3193
    .line 3194
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 3195
    .line 3196
    .line 3197
    throw v1

    .line 3198
    :cond_77
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 3199
    .line 3200
    const-string v2, "Nonnull field \"dx\" is null."

    .line 3201
    .line 3202
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 3203
    .line 3204
    .line 3205
    throw v1

    .line 3206
    :pswitch_26
    move-object/from16 v2, v17

    .line 3207
    .line 3208
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 3209
    .line 3210
    .line 3211
    move-result-object v1

    .line 3212
    check-cast v1, Ljava/util/ArrayList;

    .line 3213
    .line 3214
    new-instance v3, Ls3/Q;

    .line 3215
    .line 3216
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 3217
    .line 3218
    .line 3219
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 3220
    .line 3221
    .line 3222
    move-result-object v4

    .line 3223
    check-cast v4, Ls3/j0;

    .line 3224
    .line 3225
    if-eqz v4, :cond_79

    .line 3226
    .line 3227
    iput-object v4, v3, Ls3/Q;->a:Ls3/j0;

    .line 3228
    .line 3229
    const/4 v6, 0x1

    .line 3230
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 3231
    .line 3232
    .line 3233
    move-result-object v1

    .line 3234
    check-cast v1, Ljava/lang/Double;

    .line 3235
    .line 3236
    if-eqz v1, :cond_78

    .line 3237
    .line 3238
    iput-object v1, v3, Ls3/Q;->b:Ljava/lang/Double;

    .line 3239
    .line 3240
    return-object v3

    .line 3241
    :cond_78
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 3242
    .line 3243
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 3244
    .line 3245
    .line 3246
    throw v1

    .line 3247
    :cond_79
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 3248
    .line 3249
    const-string v2, "Nonnull field \"latLng\" is null."

    .line 3250
    .line 3251
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 3252
    .line 3253
    .line 3254
    throw v1

    .line 3255
    :pswitch_27
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 3256
    .line 3257
    .line 3258
    move-result-object v1

    .line 3259
    check-cast v1, Ljava/util/ArrayList;

    .line 3260
    .line 3261
    new-instance v2, Ls3/P;

    .line 3262
    .line 3263
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 3264
    .line 3265
    .line 3266
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 3267
    .line 3268
    .line 3269
    move-result-object v3

    .line 3270
    check-cast v3, Ls3/k0;

    .line 3271
    .line 3272
    if-eqz v3, :cond_7b

    .line 3273
    .line 3274
    iput-object v3, v2, Ls3/P;->a:Ls3/k0;

    .line 3275
    .line 3276
    const/4 v3, 0x1

    .line 3277
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 3278
    .line 3279
    .line 3280
    move-result-object v1

    .line 3281
    check-cast v1, Ljava/lang/Double;

    .line 3282
    .line 3283
    if-eqz v1, :cond_7a

    .line 3284
    .line 3285
    iput-object v1, v2, Ls3/P;->b:Ljava/lang/Double;

    .line 3286
    .line 3287
    return-object v2

    .line 3288
    :cond_7a
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 3289
    .line 3290
    const-string v2, "Nonnull field \"padding\" is null."

    .line 3291
    .line 3292
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 3293
    .line 3294
    .line 3295
    throw v1

    .line 3296
    :cond_7b
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 3297
    .line 3298
    invoke-direct {v1, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 3299
    .line 3300
    .line 3301
    throw v1

    .line 3302
    :pswitch_28
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 3303
    .line 3304
    .line 3305
    move-result-object v1

    .line 3306
    check-cast v1, Ljava/util/ArrayList;

    .line 3307
    .line 3308
    new-instance v2, Ls3/O;

    .line 3309
    .line 3310
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 3311
    .line 3312
    .line 3313
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 3314
    .line 3315
    .line 3316
    move-result-object v1

    .line 3317
    check-cast v1, Ls3/j0;

    .line 3318
    .line 3319
    if-eqz v1, :cond_7c

    .line 3320
    .line 3321
    iput-object v1, v2, Ls3/O;->a:Ls3/j0;

    .line 3322
    .line 3323
    return-object v2

    .line 3324
    :cond_7c
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 3325
    .line 3326
    const-string v2, "Nonnull field \"latLng\" is null."

    .line 3327
    .line 3328
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 3329
    .line 3330
    .line 3331
    throw v1

    .line 3332
    :pswitch_29
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 3333
    .line 3334
    .line 3335
    move-result-object v1

    .line 3336
    check-cast v1, Ljava/util/ArrayList;

    .line 3337
    .line 3338
    new-instance v2, Ls3/N;

    .line 3339
    .line 3340
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 3341
    .line 3342
    .line 3343
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 3344
    .line 3345
    .line 3346
    move-result-object v1

    .line 3347
    check-cast v1, Ls3/K;

    .line 3348
    .line 3349
    if-eqz v1, :cond_7d

    .line 3350
    .line 3351
    iput-object v1, v2, Ls3/N;->a:Ls3/K;

    .line 3352
    .line 3353
    return-object v2

    .line 3354
    :cond_7d
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 3355
    .line 3356
    const-string v2, "Nonnull field \"cameraPosition\" is null."

    .line 3357
    .line 3358
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 3359
    .line 3360
    .line 3361
    throw v1

    .line 3362
    :pswitch_2a
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 3363
    .line 3364
    .line 3365
    move-result-object v1

    .line 3366
    check-cast v1, Ljava/util/ArrayList;

    .line 3367
    .line 3368
    new-instance v2, Ls3/M;

    .line 3369
    .line 3370
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 3371
    .line 3372
    .line 3373
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 3374
    .line 3375
    .line 3376
    move-result-object v1

    .line 3377
    if-eqz v1, :cond_7e

    .line 3378
    .line 3379
    iput-object v1, v2, Ls3/M;->a:Ljava/lang/Object;

    .line 3380
    .line 3381
    return-object v2

    .line 3382
    :cond_7e
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 3383
    .line 3384
    const-string v2, "Nonnull field \"cameraUpdate\" is null."

    .line 3385
    .line 3386
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 3387
    .line 3388
    .line 3389
    throw v1

    .line 3390
    :pswitch_2b
    move-object/from16 v2, v17

    .line 3391
    .line 3392
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 3393
    .line 3394
    .line 3395
    move-result-object v1

    .line 3396
    check-cast v1, Ljava/util/ArrayList;

    .line 3397
    .line 3398
    new-instance v3, Ls3/K;

    .line 3399
    .line 3400
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 3401
    .line 3402
    .line 3403
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 3404
    .line 3405
    .line 3406
    move-result-object v4

    .line 3407
    check-cast v4, Ljava/lang/Double;

    .line 3408
    .line 3409
    if-eqz v4, :cond_82

    .line 3410
    .line 3411
    iput-object v4, v3, Ls3/K;->a:Ljava/lang/Double;

    .line 3412
    .line 3413
    const/4 v6, 0x1

    .line 3414
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 3415
    .line 3416
    .line 3417
    move-result-object v4

    .line 3418
    check-cast v4, Ls3/j0;

    .line 3419
    .line 3420
    if-eqz v4, :cond_81

    .line 3421
    .line 3422
    iput-object v4, v3, Ls3/K;->b:Ls3/j0;

    .line 3423
    .line 3424
    const/4 v6, 0x2

    .line 3425
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 3426
    .line 3427
    .line 3428
    move-result-object v4

    .line 3429
    check-cast v4, Ljava/lang/Double;

    .line 3430
    .line 3431
    if-eqz v4, :cond_80

    .line 3432
    .line 3433
    iput-object v4, v3, Ls3/K;->c:Ljava/lang/Double;

    .line 3434
    .line 3435
    const/4 v6, 0x3

    .line 3436
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 3437
    .line 3438
    .line 3439
    move-result-object v1

    .line 3440
    check-cast v1, Ljava/lang/Double;

    .line 3441
    .line 3442
    if-eqz v1, :cond_7f

    .line 3443
    .line 3444
    iput-object v1, v3, Ls3/K;->d:Ljava/lang/Double;

    .line 3445
    .line 3446
    return-object v3

    .line 3447
    :cond_7f
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 3448
    .line 3449
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 3450
    .line 3451
    .line 3452
    throw v1

    .line 3453
    :cond_80
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 3454
    .line 3455
    const-string v2, "Nonnull field \"tilt\" is null."

    .line 3456
    .line 3457
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 3458
    .line 3459
    .line 3460
    throw v1

    .line 3461
    :cond_81
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 3462
    .line 3463
    const-string v2, "Nonnull field \"target\" is null."

    .line 3464
    .line 3465
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 3466
    .line 3467
    .line 3468
    throw v1

    .line 3469
    :cond_82
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 3470
    .line 3471
    invoke-direct {v1, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 3472
    .line 3473
    .line 3474
    throw v1

    .line 3475
    :pswitch_2c
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 3476
    .line 3477
    .line 3478
    move-result-object v1

    .line 3479
    if-nez v1, :cond_83

    .line 3480
    .line 3481
    goto/16 :goto_0

    .line 3482
    .line 3483
    :cond_83
    invoke-static {}, Ls3/l0;->values()[Ls3/l0;

    .line 3484
    .line 3485
    .line 3486
    move-result-object v2

    .line 3487
    check-cast v1, Ljava/lang/Long;

    .line 3488
    .line 3489
    invoke-virtual {v1}, Ljava/lang/Long;->intValue()I

    .line 3490
    .line 3491
    .line 3492
    move-result v1

    .line 3493
    aget-object v1, v2, v1

    .line 3494
    .line 3495
    return-object v1

    .line 3496
    :pswitch_2d
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 3497
    .line 3498
    .line 3499
    move-result-object v1

    .line 3500
    if-nez v1, :cond_84

    .line 3501
    .line 3502
    goto/16 :goto_0

    .line 3503
    .line 3504
    :cond_84
    invoke-static {}, Ls3/r0;->values()[Ls3/r0;

    .line 3505
    .line 3506
    .line 3507
    move-result-object v2

    .line 3508
    check-cast v1, Ljava/lang/Long;

    .line 3509
    .line 3510
    invoke-virtual {v1}, Ljava/lang/Long;->intValue()I

    .line 3511
    .line 3512
    .line 3513
    move-result v1

    .line 3514
    aget-object v1, v2, v1

    .line 3515
    .line 3516
    return-object v1

    .line 3517
    :pswitch_2e
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 3518
    .line 3519
    .line 3520
    move-result-object v1

    .line 3521
    if-nez v1, :cond_85

    .line 3522
    .line 3523
    goto :goto_0

    .line 3524
    :cond_85
    invoke-static {}, Ls3/t0;->values()[Ls3/t0;

    .line 3525
    .line 3526
    .line 3527
    move-result-object v2

    .line 3528
    check-cast v1, Ljava/lang/Long;

    .line 3529
    .line 3530
    invoke-virtual {v1}, Ljava/lang/Long;->intValue()I

    .line 3531
    .line 3532
    .line 3533
    move-result v1

    .line 3534
    aget-object v1, v2, v1

    .line 3535
    .line 3536
    return-object v1

    .line 3537
    :pswitch_2f
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 3538
    .line 3539
    .line 3540
    move-result-object v1

    .line 3541
    if-nez v1, :cond_86

    .line 3542
    .line 3543
    goto :goto_0

    .line 3544
    :cond_86
    invoke-static {}, Ls3/X;->values()[Ls3/X;

    .line 3545
    .line 3546
    .line 3547
    move-result-object v2

    .line 3548
    check-cast v1, Ljava/lang/Long;

    .line 3549
    .line 3550
    invoke-virtual {v1}, Ljava/lang/Long;->intValue()I

    .line 3551
    .line 3552
    .line 3553
    move-result v1

    .line 3554
    aget-object v1, v2, v1

    .line 3555
    .line 3556
    return-object v1

    .line 3557
    :pswitch_30
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 3558
    .line 3559
    .line 3560
    move-result-object v1

    .line 3561
    if-nez v1, :cond_87

    .line 3562
    .line 3563
    goto :goto_0

    .line 3564
    :cond_87
    invoke-static {}, Ls3/i0;->values()[Ls3/i0;

    .line 3565
    .line 3566
    .line 3567
    move-result-object v2

    .line 3568
    check-cast v1, Ljava/lang/Long;

    .line 3569
    .line 3570
    invoke-virtual {v1}, Ljava/lang/Long;->intValue()I

    .line 3571
    .line 3572
    .line 3573
    move-result v1

    .line 3574
    aget-object v1, v2, v1

    .line 3575
    .line 3576
    return-object v1

    .line 3577
    :pswitch_31
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 3578
    .line 3579
    .line 3580
    move-result-object v1

    .line 3581
    if-nez v1, :cond_88

    .line 3582
    .line 3583
    goto :goto_0

    .line 3584
    :cond_88
    invoke-static {}, Ls3/q0;->values()[Ls3/q0;

    .line 3585
    .line 3586
    .line 3587
    move-result-object v2

    .line 3588
    check-cast v1, Ljava/lang/Long;

    .line 3589
    .line 3590
    invoke-virtual {v1}, Ljava/lang/Long;->intValue()I

    .line 3591
    .line 3592
    .line 3593
    move-result v1

    .line 3594
    aget-object v1, v2, v1

    .line 3595
    .line 3596
    return-object v1

    .line 3597
    :pswitch_32
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 3598
    .line 3599
    .line 3600
    move-result-object v1

    .line 3601
    if-nez v1, :cond_89

    .line 3602
    .line 3603
    goto :goto_0

    .line 3604
    :cond_89
    invoke-static {}, Ls3/x0;->values()[Ls3/x0;

    .line 3605
    .line 3606
    .line 3607
    move-result-object v2

    .line 3608
    check-cast v1, Ljava/lang/Long;

    .line 3609
    .line 3610
    invoke-virtual {v1}, Ljava/lang/Long;->intValue()I

    .line 3611
    .line 3612
    .line 3613
    move-result v1

    .line 3614
    aget-object v1, v2, v1

    .line 3615
    .line 3616
    return-object v1

    .line 3617
    :pswitch_33
    invoke-virtual {v0, v1}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 3618
    .line 3619
    .line 3620
    move-result-object v1

    .line 3621
    if-nez v1, :cond_8a

    .line 3622
    .line 3623
    :goto_0
    const/4 v1, 0x0

    .line 3624
    return-object v1

    .line 3625
    :cond_8a
    invoke-static {}, Ls3/n0;->values()[Ls3/n0;

    .line 3626
    .line 3627
    .line 3628
    move-result-object v2

    .line 3629
    check-cast v1, Ljava/lang/Long;

    .line 3630
    .line 3631
    invoke-virtual {v1}, Ljava/lang/Long;->intValue()I

    .line 3632
    .line 3633
    .line 3634
    move-result v1

    .line 3635
    aget-object v1, v2, v1

    .line 3636
    .line 3637
    return-object v1

    .line 3638
    nop

    :pswitch_data_0
    .packed-switch -0x7f
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
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

.method public final k(Lk3/t;Ljava/lang/Object;)V
    .locals 8

    .line 1
    instance-of v0, p2, Ls3/n0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    const/16 v0, 0x81

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 9
    .line 10
    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    check-cast p2, Ls3/n0;

    .line 15
    .line 16
    iget p2, p2, Ls3/n0;->e:I

    .line 17
    .line 18
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    :goto_0
    invoke-virtual {p0, p1, v1}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    instance-of v0, p2, Ls3/x0;

    .line 27
    .line 28
    if-eqz v0, :cond_3

    .line 29
    .line 30
    const/16 v0, 0x82

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 33
    .line 34
    .line 35
    if-nez p2, :cond_2

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_2
    check-cast p2, Ls3/x0;

    .line 39
    .line 40
    iget p2, p2, Ls3/x0;->e:I

    .line 41
    .line 42
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    :goto_1
    invoke-virtual {p0, p1, v1}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_3
    instance-of v0, p2, Ls3/q0;

    .line 51
    .line 52
    if-eqz v0, :cond_5

    .line 53
    .line 54
    const/16 v0, 0x83

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 57
    .line 58
    .line 59
    if-nez p2, :cond_4

    .line 60
    .line 61
    goto :goto_2

    .line 62
    :cond_4
    check-cast p2, Ls3/q0;

    .line 63
    .line 64
    iget p2, p2, Ls3/q0;->e:I

    .line 65
    .line 66
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    :goto_2
    invoke-virtual {p0, p1, v1}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_5
    instance-of v0, p2, Ls3/i0;

    .line 75
    .line 76
    if-eqz v0, :cond_7

    .line 77
    .line 78
    const/16 v0, 0x84

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 81
    .line 82
    .line 83
    if-nez p2, :cond_6

    .line 84
    .line 85
    goto :goto_3

    .line 86
    :cond_6
    check-cast p2, Ls3/i0;

    .line 87
    .line 88
    iget p2, p2, Ls3/i0;->e:I

    .line 89
    .line 90
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    :goto_3
    invoke-virtual {p0, p1, v1}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_7
    instance-of v0, p2, Ls3/X;

    .line 99
    .line 100
    if-eqz v0, :cond_9

    .line 101
    .line 102
    const/16 v0, 0x85

    .line 103
    .line 104
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 105
    .line 106
    .line 107
    if-nez p2, :cond_8

    .line 108
    .line 109
    goto :goto_4

    .line 110
    :cond_8
    check-cast p2, Ls3/X;

    .line 111
    .line 112
    iget p2, p2, Ls3/X;->e:I

    .line 113
    .line 114
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    :goto_4
    invoke-virtual {p0, p1, v1}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :cond_9
    instance-of v0, p2, Ls3/t0;

    .line 123
    .line 124
    if-eqz v0, :cond_b

    .line 125
    .line 126
    const/16 v0, 0x86

    .line 127
    .line 128
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 129
    .line 130
    .line 131
    if-nez p2, :cond_a

    .line 132
    .line 133
    goto :goto_5

    .line 134
    :cond_a
    check-cast p2, Ls3/t0;

    .line 135
    .line 136
    iget p2, p2, Ls3/t0;->e:I

    .line 137
    .line 138
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    :goto_5
    invoke-virtual {p0, p1, v1}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_b
    instance-of v0, p2, Ls3/r0;

    .line 147
    .line 148
    if-eqz v0, :cond_d

    .line 149
    .line 150
    const/16 v0, 0x87

    .line 151
    .line 152
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 153
    .line 154
    .line 155
    if-nez p2, :cond_c

    .line 156
    .line 157
    goto :goto_6

    .line 158
    :cond_c
    check-cast p2, Ls3/r0;

    .line 159
    .line 160
    iget p2, p2, Ls3/r0;->e:I

    .line 161
    .line 162
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    :goto_6
    invoke-virtual {p0, p1, v1}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 167
    .line 168
    .line 169
    return-void

    .line 170
    :cond_d
    instance-of v0, p2, Ls3/l0;

    .line 171
    .line 172
    if-eqz v0, :cond_f

    .line 173
    .line 174
    const/16 v0, 0x88

    .line 175
    .line 176
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 177
    .line 178
    .line 179
    if-nez p2, :cond_e

    .line 180
    .line 181
    goto :goto_7

    .line 182
    :cond_e
    check-cast p2, Ls3/l0;

    .line 183
    .line 184
    iget p2, p2, Ls3/l0;->e:I

    .line 185
    .line 186
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    :goto_7
    invoke-virtual {p0, p1, v1}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 191
    .line 192
    .line 193
    return-void

    .line 194
    :cond_f
    instance-of v0, p2, Ls3/K;

    .line 195
    .line 196
    const/4 v1, 0x4

    .line 197
    if-eqz v0, :cond_10

    .line 198
    .line 199
    const/16 v0, 0x89

    .line 200
    .line 201
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 202
    .line 203
    .line 204
    check-cast p2, Ls3/K;

    .line 205
    .line 206
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 207
    .line 208
    .line 209
    new-instance v0, Ljava/util/ArrayList;

    .line 210
    .line 211
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 212
    .line 213
    .line 214
    iget-object v1, p2, Ls3/K;->a:Ljava/lang/Double;

    .line 215
    .line 216
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    iget-object v1, p2, Ls3/K;->b:Ls3/j0;

    .line 220
    .line 221
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    iget-object v1, p2, Ls3/K;->c:Ljava/lang/Double;

    .line 225
    .line 226
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 227
    .line 228
    .line 229
    iget-object p2, p2, Ls3/K;->d:Ljava/lang/Double;

    .line 230
    .line 231
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 232
    .line 233
    .line 234
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 235
    .line 236
    .line 237
    return-void

    .line 238
    :cond_10
    instance-of v0, p2, Ls3/M;

    .line 239
    .line 240
    const/4 v2, 0x1

    .line 241
    if-eqz v0, :cond_11

    .line 242
    .line 243
    const/16 v0, 0x8a

    .line 244
    .line 245
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 246
    .line 247
    .line 248
    check-cast p2, Ls3/M;

    .line 249
    .line 250
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 251
    .line 252
    .line 253
    new-instance v0, Ljava/util/ArrayList;

    .line 254
    .line 255
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 256
    .line 257
    .line 258
    iget-object p2, p2, Ls3/M;->a:Ljava/lang/Object;

    .line 259
    .line 260
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 261
    .line 262
    .line 263
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 264
    .line 265
    .line 266
    return-void

    .line 267
    :cond_11
    instance-of v0, p2, Ls3/N;

    .line 268
    .line 269
    if-eqz v0, :cond_12

    .line 270
    .line 271
    const/16 v0, 0x8b

    .line 272
    .line 273
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 274
    .line 275
    .line 276
    check-cast p2, Ls3/N;

    .line 277
    .line 278
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 279
    .line 280
    .line 281
    new-instance v0, Ljava/util/ArrayList;

    .line 282
    .line 283
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 284
    .line 285
    .line 286
    iget-object p2, p2, Ls3/N;->a:Ls3/K;

    .line 287
    .line 288
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 289
    .line 290
    .line 291
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 292
    .line 293
    .line 294
    return-void

    .line 295
    :cond_12
    instance-of v0, p2, Ls3/O;

    .line 296
    .line 297
    if-eqz v0, :cond_13

    .line 298
    .line 299
    const/16 v0, 0x8c

    .line 300
    .line 301
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 302
    .line 303
    .line 304
    check-cast p2, Ls3/O;

    .line 305
    .line 306
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 307
    .line 308
    .line 309
    new-instance v0, Ljava/util/ArrayList;

    .line 310
    .line 311
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 312
    .line 313
    .line 314
    iget-object p2, p2, Ls3/O;->a:Ls3/j0;

    .line 315
    .line 316
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 317
    .line 318
    .line 319
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 320
    .line 321
    .line 322
    return-void

    .line 323
    :cond_13
    instance-of v0, p2, Ls3/P;

    .line 324
    .line 325
    const/4 v3, 0x2

    .line 326
    if-eqz v0, :cond_14

    .line 327
    .line 328
    const/16 v0, 0x8d

    .line 329
    .line 330
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 331
    .line 332
    .line 333
    check-cast p2, Ls3/P;

    .line 334
    .line 335
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 336
    .line 337
    .line 338
    new-instance v0, Ljava/util/ArrayList;

    .line 339
    .line 340
    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 341
    .line 342
    .line 343
    iget-object v1, p2, Ls3/P;->a:Ls3/k0;

    .line 344
    .line 345
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 346
    .line 347
    .line 348
    iget-object p2, p2, Ls3/P;->b:Ljava/lang/Double;

    .line 349
    .line 350
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 351
    .line 352
    .line 353
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 354
    .line 355
    .line 356
    return-void

    .line 357
    :cond_14
    instance-of v0, p2, Ls3/Q;

    .line 358
    .line 359
    if-eqz v0, :cond_15

    .line 360
    .line 361
    const/16 v0, 0x8e

    .line 362
    .line 363
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 364
    .line 365
    .line 366
    check-cast p2, Ls3/Q;

    .line 367
    .line 368
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 369
    .line 370
    .line 371
    new-instance v0, Ljava/util/ArrayList;

    .line 372
    .line 373
    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 374
    .line 375
    .line 376
    iget-object v1, p2, Ls3/Q;->a:Ls3/j0;

    .line 377
    .line 378
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 379
    .line 380
    .line 381
    iget-object p2, p2, Ls3/Q;->b:Ljava/lang/Double;

    .line 382
    .line 383
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 384
    .line 385
    .line 386
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 387
    .line 388
    .line 389
    return-void

    .line 390
    :cond_15
    instance-of v0, p2, Ls3/S;

    .line 391
    .line 392
    if-eqz v0, :cond_16

    .line 393
    .line 394
    const/16 v0, 0x8f

    .line 395
    .line 396
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 397
    .line 398
    .line 399
    check-cast p2, Ls3/S;

    .line 400
    .line 401
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 402
    .line 403
    .line 404
    new-instance v0, Ljava/util/ArrayList;

    .line 405
    .line 406
    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 407
    .line 408
    .line 409
    iget-object v1, p2, Ls3/S;->a:Ljava/lang/Double;

    .line 410
    .line 411
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 412
    .line 413
    .line 414
    iget-object p2, p2, Ls3/S;->b:Ljava/lang/Double;

    .line 415
    .line 416
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 417
    .line 418
    .line 419
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 420
    .line 421
    .line 422
    return-void

    .line 423
    :cond_16
    instance-of v0, p2, Ls3/U;

    .line 424
    .line 425
    if-eqz v0, :cond_17

    .line 426
    .line 427
    const/16 v0, 0x90

    .line 428
    .line 429
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 430
    .line 431
    .line 432
    check-cast p2, Ls3/U;

    .line 433
    .line 434
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 435
    .line 436
    .line 437
    new-instance v0, Ljava/util/ArrayList;

    .line 438
    .line 439
    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 440
    .line 441
    .line 442
    iget-object v1, p2, Ls3/U;->a:Ljava/lang/Double;

    .line 443
    .line 444
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 445
    .line 446
    .line 447
    iget-object p2, p2, Ls3/U;->b:Ls3/c0;

    .line 448
    .line 449
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 450
    .line 451
    .line 452
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 453
    .line 454
    .line 455
    return-void

    .line 456
    :cond_17
    instance-of v0, p2, Ls3/T;

    .line 457
    .line 458
    if-eqz v0, :cond_18

    .line 459
    .line 460
    const/16 v0, 0x91

    .line 461
    .line 462
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 463
    .line 464
    .line 465
    check-cast p2, Ls3/T;

    .line 466
    .line 467
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 468
    .line 469
    .line 470
    new-instance v0, Ljava/util/ArrayList;

    .line 471
    .line 472
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 473
    .line 474
    .line 475
    iget-object p2, p2, Ls3/T;->a:Ljava/lang/Boolean;

    .line 476
    .line 477
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 478
    .line 479
    .line 480
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 481
    .line 482
    .line 483
    return-void

    .line 484
    :cond_18
    instance-of v0, p2, Ls3/V;

    .line 485
    .line 486
    if-eqz v0, :cond_19

    .line 487
    .line 488
    const/16 v0, 0x92

    .line 489
    .line 490
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 491
    .line 492
    .line 493
    check-cast p2, Ls3/V;

    .line 494
    .line 495
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 496
    .line 497
    .line 498
    new-instance v0, Ljava/util/ArrayList;

    .line 499
    .line 500
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 501
    .line 502
    .line 503
    iget-object p2, p2, Ls3/V;->a:Ljava/lang/Double;

    .line 504
    .line 505
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 506
    .line 507
    .line 508
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 509
    .line 510
    .line 511
    return-void

    .line 512
    :cond_19
    instance-of v0, p2, Ls3/Y;

    .line 513
    .line 514
    if-eqz v0, :cond_1a

    .line 515
    .line 516
    const/16 v0, 0x93

    .line 517
    .line 518
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 519
    .line 520
    .line 521
    check-cast p2, Ls3/Y;

    .line 522
    .line 523
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 524
    .line 525
    .line 526
    new-instance v0, Ljava/util/ArrayList;

    .line 527
    .line 528
    const/16 v1, 0x9

    .line 529
    .line 530
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 531
    .line 532
    .line 533
    iget-object v1, p2, Ls3/Y;->a:Ljava/lang/Boolean;

    .line 534
    .line 535
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 536
    .line 537
    .line 538
    iget-object v1, p2, Ls3/Y;->b:Ls3/b0;

    .line 539
    .line 540
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 541
    .line 542
    .line 543
    iget-object v1, p2, Ls3/Y;->c:Ls3/b0;

    .line 544
    .line 545
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 546
    .line 547
    .line 548
    iget-object v1, p2, Ls3/Y;->d:Ljava/lang/Boolean;

    .line 549
    .line 550
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 551
    .line 552
    .line 553
    iget-object v1, p2, Ls3/Y;->e:Ljava/lang/Long;

    .line 554
    .line 555
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 556
    .line 557
    .line 558
    iget-object v1, p2, Ls3/Y;->f:Ljava/lang/Double;

    .line 559
    .line 560
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 561
    .line 562
    .line 563
    iget-object v1, p2, Ls3/Y;->g:Ls3/j0;

    .line 564
    .line 565
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 566
    .line 567
    .line 568
    iget-object v1, p2, Ls3/Y;->h:Ljava/lang/Double;

    .line 569
    .line 570
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 571
    .line 572
    .line 573
    iget-object p2, p2, Ls3/Y;->i:Ljava/lang/String;

    .line 574
    .line 575
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 576
    .line 577
    .line 578
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 579
    .line 580
    .line 581
    return-void

    .line 582
    :cond_1a
    instance-of v0, p2, Ls3/f0;

    .line 583
    .line 584
    const/4 v4, 0x6

    .line 585
    if-eqz v0, :cond_1b

    .line 586
    .line 587
    const/16 v0, 0x94

    .line 588
    .line 589
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 590
    .line 591
    .line 592
    check-cast p2, Ls3/f0;

    .line 593
    .line 594
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 595
    .line 596
    .line 597
    new-instance v0, Ljava/util/ArrayList;

    .line 598
    .line 599
    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 600
    .line 601
    .line 602
    iget-object v1, p2, Ls3/f0;->a:Ljava/lang/String;

    .line 603
    .line 604
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 605
    .line 606
    .line 607
    iget-object v1, p2, Ls3/f0;->b:Ljava/util/List;

    .line 608
    .line 609
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 610
    .line 611
    .line 612
    iget-object v1, p2, Ls3/f0;->c:Ls3/g0;

    .line 613
    .line 614
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 615
    .line 616
    .line 617
    iget-object v1, p2, Ls3/f0;->d:Ljava/lang/Double;

    .line 618
    .line 619
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 620
    .line 621
    .line 622
    iget-object v1, p2, Ls3/f0;->e:Ljava/lang/Long;

    .line 623
    .line 624
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 625
    .line 626
    .line 627
    iget-object p2, p2, Ls3/f0;->f:Ljava/lang/Double;

    .line 628
    .line 629
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 630
    .line 631
    .line 632
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 633
    .line 634
    .line 635
    return-void

    .line 636
    :cond_1b
    instance-of v0, p2, Ls3/g0;

    .line 637
    .line 638
    const/4 v5, 0x3

    .line 639
    if-eqz v0, :cond_1c

    .line 640
    .line 641
    const/16 v0, 0x95

    .line 642
    .line 643
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 644
    .line 645
    .line 646
    check-cast p2, Ls3/g0;

    .line 647
    .line 648
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 649
    .line 650
    .line 651
    new-instance v0, Ljava/util/ArrayList;

    .line 652
    .line 653
    invoke-direct {v0, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 654
    .line 655
    .line 656
    iget-object v1, p2, Ls3/g0;->a:Ljava/util/List;

    .line 657
    .line 658
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 659
    .line 660
    .line 661
    iget-object v1, p2, Ls3/g0;->b:Ljava/util/List;

    .line 662
    .line 663
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 664
    .line 665
    .line 666
    iget-object p2, p2, Ls3/g0;->c:Ljava/lang/Long;

    .line 667
    .line 668
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 669
    .line 670
    .line 671
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 672
    .line 673
    .line 674
    return-void

    .line 675
    :cond_1c
    instance-of v0, p2, Ls3/B0;

    .line 676
    .line 677
    if-eqz v0, :cond_1d

    .line 678
    .line 679
    const/16 v0, 0x96

    .line 680
    .line 681
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 682
    .line 683
    .line 684
    check-cast p2, Ls3/B0;

    .line 685
    .line 686
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 687
    .line 688
    .line 689
    new-instance v0, Ljava/util/ArrayList;

    .line 690
    .line 691
    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 692
    .line 693
    .line 694
    iget-object v1, p2, Ls3/B0;->a:Ls3/j0;

    .line 695
    .line 696
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 697
    .line 698
    .line 699
    iget-object p2, p2, Ls3/B0;->b:Ljava/lang/Double;

    .line 700
    .line 701
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 702
    .line 703
    .line 704
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 705
    .line 706
    .line 707
    return-void

    .line 708
    :cond_1d
    instance-of v0, p2, Ls3/a0;

    .line 709
    .line 710
    if-eqz v0, :cond_1e

    .line 711
    .line 712
    const/16 v0, 0x97

    .line 713
    .line 714
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 715
    .line 716
    .line 717
    check-cast p2, Ls3/a0;

    .line 718
    .line 719
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 720
    .line 721
    .line 722
    new-instance v0, Ljava/util/ArrayList;

    .line 723
    .line 724
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 725
    .line 726
    .line 727
    iget-object p2, p2, Ls3/a0;->a:Ljava/lang/String;

    .line 728
    .line 729
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 730
    .line 731
    .line 732
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 733
    .line 734
    .line 735
    return-void

    .line 736
    :cond_1e
    instance-of v0, p2, Ls3/c0;

    .line 737
    .line 738
    if-eqz v0, :cond_1f

    .line 739
    .line 740
    const/16 v0, 0x98

    .line 741
    .line 742
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 743
    .line 744
    .line 745
    check-cast p2, Ls3/c0;

    .line 746
    .line 747
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 748
    .line 749
    .line 750
    new-instance v0, Ljava/util/ArrayList;

    .line 751
    .line 752
    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 753
    .line 754
    .line 755
    iget-object v1, p2, Ls3/c0;->a:Ljava/lang/Double;

    .line 756
    .line 757
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 758
    .line 759
    .line 760
    iget-object p2, p2, Ls3/c0;->b:Ljava/lang/Double;

    .line 761
    .line 762
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 763
    .line 764
    .line 765
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 766
    .line 767
    .line 768
    return-void

    .line 769
    :cond_1f
    instance-of v0, p2, Ls3/b0;

    .line 770
    .line 771
    if-eqz v0, :cond_20

    .line 772
    .line 773
    const/16 v0, 0x99

    .line 774
    .line 775
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 776
    .line 777
    .line 778
    check-cast p2, Ls3/b0;

    .line 779
    .line 780
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 781
    .line 782
    .line 783
    new-instance v0, Ljava/util/ArrayList;

    .line 784
    .line 785
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 786
    .line 787
    .line 788
    iget-object p2, p2, Ls3/b0;->a:Ljava/lang/Long;

    .line 789
    .line 790
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 791
    .line 792
    .line 793
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 794
    .line 795
    .line 796
    return-void

    .line 797
    :cond_20
    instance-of v0, p2, Ls3/h0;

    .line 798
    .line 799
    if-eqz v0, :cond_21

    .line 800
    .line 801
    const/16 v0, 0x9a

    .line 802
    .line 803
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 804
    .line 805
    .line 806
    check-cast p2, Ls3/h0;

    .line 807
    .line 808
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 809
    .line 810
    .line 811
    new-instance v0, Ljava/util/ArrayList;

    .line 812
    .line 813
    invoke-direct {v0, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 814
    .line 815
    .line 816
    iget-object v1, p2, Ls3/h0;->a:Ljava/lang/String;

    .line 817
    .line 818
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 819
    .line 820
    .line 821
    iget-object v1, p2, Ls3/h0;->b:Ljava/lang/String;

    .line 822
    .line 823
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 824
    .line 825
    .line 826
    iget-object p2, p2, Ls3/h0;->c:Ls3/c0;

    .line 827
    .line 828
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 829
    .line 830
    .line 831
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 832
    .line 833
    .line 834
    return-void

    .line 835
    :cond_21
    instance-of v0, p2, Ls3/p0;

    .line 836
    .line 837
    if-eqz v0, :cond_22

    .line 838
    .line 839
    const/16 v0, 0x9b

    .line 840
    .line 841
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 842
    .line 843
    .line 844
    check-cast p2, Ls3/p0;

    .line 845
    .line 846
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 847
    .line 848
    .line 849
    new-instance v0, Ljava/util/ArrayList;

    .line 850
    .line 851
    const/16 v1, 0xe

    .line 852
    .line 853
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 854
    .line 855
    .line 856
    iget-object v1, p2, Ls3/p0;->a:Ljava/lang/Double;

    .line 857
    .line 858
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 859
    .line 860
    .line 861
    iget-object v1, p2, Ls3/p0;->b:Ls3/c0;

    .line 862
    .line 863
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 864
    .line 865
    .line 866
    iget-object v1, p2, Ls3/p0;->c:Ljava/lang/Boolean;

    .line 867
    .line 868
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 869
    .line 870
    .line 871
    iget-object v1, p2, Ls3/p0;->d:Ljava/lang/Boolean;

    .line 872
    .line 873
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 874
    .line 875
    .line 876
    iget-object v1, p2, Ls3/p0;->e:Ljava/lang/Boolean;

    .line 877
    .line 878
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 879
    .line 880
    .line 881
    iget-object v1, p2, Ls3/p0;->f:Ls3/C;

    .line 882
    .line 883
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 884
    .line 885
    .line 886
    iget-object v1, p2, Ls3/p0;->g:Ls3/h0;

    .line 887
    .line 888
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 889
    .line 890
    .line 891
    iget-object v1, p2, Ls3/p0;->h:Ls3/j0;

    .line 892
    .line 893
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 894
    .line 895
    .line 896
    iget-object v1, p2, Ls3/p0;->i:Ljava/lang/Double;

    .line 897
    .line 898
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 899
    .line 900
    .line 901
    iget-object v1, p2, Ls3/p0;->j:Ljava/lang/Boolean;

    .line 902
    .line 903
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 904
    .line 905
    .line 906
    iget-object v1, p2, Ls3/p0;->k:Ljava/lang/Double;

    .line 907
    .line 908
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 909
    .line 910
    .line 911
    iget-object v1, p2, Ls3/p0;->l:Ljava/lang/String;

    .line 912
    .line 913
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 914
    .line 915
    .line 916
    iget-object v1, p2, Ls3/p0;->m:Ljava/lang/String;

    .line 917
    .line 918
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 919
    .line 920
    .line 921
    iget-object p2, p2, Ls3/p0;->n:Ls3/q0;

    .line 922
    .line 923
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 924
    .line 925
    .line 926
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 927
    .line 928
    .line 929
    return-void

    .line 930
    :cond_22
    instance-of v0, p2, Ls3/v0;

    .line 931
    .line 932
    const/16 v6, 0xa

    .line 933
    .line 934
    if-eqz v0, :cond_23

    .line 935
    .line 936
    const/16 v0, 0x9c

    .line 937
    .line 938
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 939
    .line 940
    .line 941
    check-cast p2, Ls3/v0;

    .line 942
    .line 943
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 944
    .line 945
    .line 946
    new-instance v0, Ljava/util/ArrayList;

    .line 947
    .line 948
    invoke-direct {v0, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 949
    .line 950
    .line 951
    iget-object v1, p2, Ls3/v0;->a:Ljava/lang/String;

    .line 952
    .line 953
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 954
    .line 955
    .line 956
    iget-object v1, p2, Ls3/v0;->b:Ljava/lang/Boolean;

    .line 957
    .line 958
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 959
    .line 960
    .line 961
    iget-object v1, p2, Ls3/v0;->c:Ls3/b0;

    .line 962
    .line 963
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 964
    .line 965
    .line 966
    iget-object v1, p2, Ls3/v0;->d:Ljava/lang/Boolean;

    .line 967
    .line 968
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 969
    .line 970
    .line 971
    iget-object v1, p2, Ls3/v0;->e:Ljava/util/List;

    .line 972
    .line 973
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 974
    .line 975
    .line 976
    iget-object v1, p2, Ls3/v0;->f:Ljava/util/List;

    .line 977
    .line 978
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 979
    .line 980
    .line 981
    iget-object v1, p2, Ls3/v0;->g:Ljava/lang/Boolean;

    .line 982
    .line 983
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 984
    .line 985
    .line 986
    iget-object v1, p2, Ls3/v0;->h:Ls3/b0;

    .line 987
    .line 988
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 989
    .line 990
    .line 991
    iget-object v1, p2, Ls3/v0;->i:Ljava/lang/Long;

    .line 992
    .line 993
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 994
    .line 995
    .line 996
    iget-object p2, p2, Ls3/v0;->j:Ljava/lang/Long;

    .line 997
    .line 998
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 999
    .line 1000
    .line 1001
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 1002
    .line 1003
    .line 1004
    return-void

    .line 1005
    :cond_23
    instance-of v0, p2, Ls3/w0;

    .line 1006
    .line 1007
    const/16 v7, 0xc

    .line 1008
    .line 1009
    if-eqz v0, :cond_24

    .line 1010
    .line 1011
    const/16 v0, 0x9d

    .line 1012
    .line 1013
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1014
    .line 1015
    .line 1016
    check-cast p2, Ls3/w0;

    .line 1017
    .line 1018
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1019
    .line 1020
    .line 1021
    new-instance v0, Ljava/util/ArrayList;

    .line 1022
    .line 1023
    invoke-direct {v0, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 1024
    .line 1025
    .line 1026
    iget-object v1, p2, Ls3/w0;->a:Ljava/lang/String;

    .line 1027
    .line 1028
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1029
    .line 1030
    .line 1031
    iget-object v1, p2, Ls3/w0;->b:Ljava/lang/Boolean;

    .line 1032
    .line 1033
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1034
    .line 1035
    .line 1036
    iget-object v1, p2, Ls3/w0;->c:Ls3/b0;

    .line 1037
    .line 1038
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1039
    .line 1040
    .line 1041
    iget-object v1, p2, Ls3/w0;->d:Ljava/lang/Boolean;

    .line 1042
    .line 1043
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1044
    .line 1045
    .line 1046
    iget-object v1, p2, Ls3/w0;->e:Ls3/i0;

    .line 1047
    .line 1048
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1049
    .line 1050
    .line 1051
    iget-object v1, p2, Ls3/w0;->f:Ljava/util/List;

    .line 1052
    .line 1053
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1054
    .line 1055
    .line 1056
    iget-object v1, p2, Ls3/w0;->g:Ljava/util/List;

    .line 1057
    .line 1058
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1059
    .line 1060
    .line 1061
    iget-object v1, p2, Ls3/w0;->h:Ls3/W;

    .line 1062
    .line 1063
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1064
    .line 1065
    .line 1066
    iget-object v1, p2, Ls3/w0;->i:Ls3/W;

    .line 1067
    .line 1068
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1069
    .line 1070
    .line 1071
    iget-object v1, p2, Ls3/w0;->j:Ljava/lang/Boolean;

    .line 1072
    .line 1073
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1074
    .line 1075
    .line 1076
    iget-object v1, p2, Ls3/w0;->k:Ljava/lang/Long;

    .line 1077
    .line 1078
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1079
    .line 1080
    .line 1081
    iget-object p2, p2, Ls3/w0;->l:Ljava/lang/Long;

    .line 1082
    .line 1083
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1084
    .line 1085
    .line 1086
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 1087
    .line 1088
    .line 1089
    return-void

    .line 1090
    :cond_24
    instance-of v0, p2, Ls3/W;

    .line 1091
    .line 1092
    if-eqz v0, :cond_25

    .line 1093
    .line 1094
    const/16 v0, 0x9e

    .line 1095
    .line 1096
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1097
    .line 1098
    .line 1099
    check-cast p2, Ls3/W;

    .line 1100
    .line 1101
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1102
    .line 1103
    .line 1104
    new-instance v0, Ljava/util/ArrayList;

    .line 1105
    .line 1106
    invoke-direct {v0, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 1107
    .line 1108
    .line 1109
    iget-object v1, p2, Ls3/W;->a:Ls3/X;

    .line 1110
    .line 1111
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1112
    .line 1113
    .line 1114
    iget-object v1, p2, Ls3/W;->b:Ls3/C;

    .line 1115
    .line 1116
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1117
    .line 1118
    .line 1119
    iget-object p2, p2, Ls3/W;->c:Ljava/lang/Double;

    .line 1120
    .line 1121
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1122
    .line 1123
    .line 1124
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 1125
    .line 1126
    .line 1127
    return-void

    .line 1128
    :cond_25
    instance-of v0, p2, Ls3/s0;

    .line 1129
    .line 1130
    if-eqz v0, :cond_26

    .line 1131
    .line 1132
    const/16 v0, 0x9f

    .line 1133
    .line 1134
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1135
    .line 1136
    .line 1137
    check-cast p2, Ls3/s0;

    .line 1138
    .line 1139
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1140
    .line 1141
    .line 1142
    new-instance v0, Ljava/util/ArrayList;

    .line 1143
    .line 1144
    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 1145
    .line 1146
    .line 1147
    iget-object v1, p2, Ls3/s0;->a:Ls3/t0;

    .line 1148
    .line 1149
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1150
    .line 1151
    .line 1152
    iget-object p2, p2, Ls3/s0;->b:Ljava/lang/Double;

    .line 1153
    .line 1154
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1155
    .line 1156
    .line 1157
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 1158
    .line 1159
    .line 1160
    return-void

    .line 1161
    :cond_26
    instance-of v0, p2, Ls3/y0;

    .line 1162
    .line 1163
    if-eqz v0, :cond_27

    .line 1164
    .line 1165
    const/16 v0, 0xa0

    .line 1166
    .line 1167
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1168
    .line 1169
    .line 1170
    check-cast p2, Ls3/y0;

    .line 1171
    .line 1172
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1173
    .line 1174
    .line 1175
    new-instance v0, Ljava/util/ArrayList;

    .line 1176
    .line 1177
    invoke-direct {v0, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 1178
    .line 1179
    .line 1180
    iget-object v1, p2, Ls3/y0;->a:Ljava/lang/Long;

    .line 1181
    .line 1182
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1183
    .line 1184
    .line 1185
    iget-object v1, p2, Ls3/y0;->b:Ljava/lang/Long;

    .line 1186
    .line 1187
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1188
    .line 1189
    .line 1190
    iget-object p2, p2, Ls3/y0;->c:[B

    .line 1191
    .line 1192
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1193
    .line 1194
    .line 1195
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 1196
    .line 1197
    .line 1198
    return-void

    .line 1199
    :cond_27
    instance-of v0, p2, Ls3/A0;

    .line 1200
    .line 1201
    if-eqz v0, :cond_28

    .line 1202
    .line 1203
    const/16 v0, 0xa1

    .line 1204
    .line 1205
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1206
    .line 1207
    .line 1208
    check-cast p2, Ls3/A0;

    .line 1209
    .line 1210
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1211
    .line 1212
    .line 1213
    new-instance v0, Ljava/util/ArrayList;

    .line 1214
    .line 1215
    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 1216
    .line 1217
    .line 1218
    iget-object v1, p2, Ls3/A0;->a:Ljava/lang/String;

    .line 1219
    .line 1220
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1221
    .line 1222
    .line 1223
    iget-object v1, p2, Ls3/A0;->b:Ljava/lang/Boolean;

    .line 1224
    .line 1225
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1226
    .line 1227
    .line 1228
    iget-object v1, p2, Ls3/A0;->c:Ljava/lang/Double;

    .line 1229
    .line 1230
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1231
    .line 1232
    .line 1233
    iget-object v1, p2, Ls3/A0;->d:Ljava/lang/Long;

    .line 1234
    .line 1235
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1236
    .line 1237
    .line 1238
    iget-object v1, p2, Ls3/A0;->e:Ljava/lang/Boolean;

    .line 1239
    .line 1240
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1241
    .line 1242
    .line 1243
    iget-object p2, p2, Ls3/A0;->f:Ljava/lang/Long;

    .line 1244
    .line 1245
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1246
    .line 1247
    .line 1248
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 1249
    .line 1250
    .line 1251
    return-void

    .line 1252
    :cond_28
    instance-of v0, p2, Ls3/d0;

    .line 1253
    .line 1254
    if-eqz v0, :cond_29

    .line 1255
    .line 1256
    const/16 v0, 0xa2

    .line 1257
    .line 1258
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1259
    .line 1260
    .line 1261
    check-cast p2, Ls3/d0;

    .line 1262
    .line 1263
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1264
    .line 1265
    .line 1266
    new-instance v0, Ljava/util/ArrayList;

    .line 1267
    .line 1268
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 1269
    .line 1270
    .line 1271
    iget-object v1, p2, Ls3/d0;->a:Ljava/lang/Double;

    .line 1272
    .line 1273
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1274
    .line 1275
    .line 1276
    iget-object v1, p2, Ls3/d0;->b:Ljava/lang/Double;

    .line 1277
    .line 1278
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1279
    .line 1280
    .line 1281
    iget-object v1, p2, Ls3/d0;->c:Ljava/lang/Double;

    .line 1282
    .line 1283
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1284
    .line 1285
    .line 1286
    iget-object p2, p2, Ls3/d0;->d:Ljava/lang/Double;

    .line 1287
    .line 1288
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1289
    .line 1290
    .line 1291
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 1292
    .line 1293
    .line 1294
    return-void

    .line 1295
    :cond_29
    instance-of v0, p2, Ls3/j0;

    .line 1296
    .line 1297
    if-eqz v0, :cond_2a

    .line 1298
    .line 1299
    const/16 v0, 0xa3

    .line 1300
    .line 1301
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1302
    .line 1303
    .line 1304
    check-cast p2, Ls3/j0;

    .line 1305
    .line 1306
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1307
    .line 1308
    .line 1309
    new-instance v0, Ljava/util/ArrayList;

    .line 1310
    .line 1311
    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 1312
    .line 1313
    .line 1314
    iget-object v1, p2, Ls3/j0;->a:Ljava/lang/Double;

    .line 1315
    .line 1316
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1317
    .line 1318
    .line 1319
    iget-object p2, p2, Ls3/j0;->b:Ljava/lang/Double;

    .line 1320
    .line 1321
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1322
    .line 1323
    .line 1324
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 1325
    .line 1326
    .line 1327
    return-void

    .line 1328
    :cond_2a
    instance-of v0, p2, Ls3/k0;

    .line 1329
    .line 1330
    if-eqz v0, :cond_2b

    .line 1331
    .line 1332
    const/16 v0, 0xa4

    .line 1333
    .line 1334
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1335
    .line 1336
    .line 1337
    check-cast p2, Ls3/k0;

    .line 1338
    .line 1339
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1340
    .line 1341
    .line 1342
    new-instance v0, Ljava/util/ArrayList;

    .line 1343
    .line 1344
    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 1345
    .line 1346
    .line 1347
    iget-object v1, p2, Ls3/k0;->a:Ls3/j0;

    .line 1348
    .line 1349
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1350
    .line 1351
    .line 1352
    iget-object p2, p2, Ls3/k0;->b:Ls3/j0;

    .line 1353
    .line 1354
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1355
    .line 1356
    .line 1357
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 1358
    .line 1359
    .line 1360
    return-void

    .line 1361
    :cond_2b
    instance-of v0, p2, Ls3/Z;

    .line 1362
    .line 1363
    if-eqz v0, :cond_2c

    .line 1364
    .line 1365
    const/16 v0, 0xa5

    .line 1366
    .line 1367
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1368
    .line 1369
    .line 1370
    check-cast p2, Ls3/Z;

    .line 1371
    .line 1372
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1373
    .line 1374
    .line 1375
    new-instance v0, Ljava/util/ArrayList;

    .line 1376
    .line 1377
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 1378
    .line 1379
    .line 1380
    iget-object v1, p2, Ls3/Z;->a:Ljava/lang/String;

    .line 1381
    .line 1382
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1383
    .line 1384
    .line 1385
    iget-object v1, p2, Ls3/Z;->b:Ls3/j0;

    .line 1386
    .line 1387
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1388
    .line 1389
    .line 1390
    iget-object v1, p2, Ls3/Z;->c:Ls3/k0;

    .line 1391
    .line 1392
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1393
    .line 1394
    .line 1395
    iget-object p2, p2, Ls3/Z;->d:Ljava/util/List;

    .line 1396
    .line 1397
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1398
    .line 1399
    .line 1400
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 1401
    .line 1402
    .line 1403
    return-void

    .line 1404
    :cond_2c
    instance-of v0, p2, Ls3/e0;

    .line 1405
    .line 1406
    if-eqz v0, :cond_2d

    .line 1407
    .line 1408
    const/16 v0, 0xa6

    .line 1409
    .line 1410
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1411
    .line 1412
    .line 1413
    check-cast p2, Ls3/e0;

    .line 1414
    .line 1415
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1416
    .line 1417
    .line 1418
    new-instance v0, Ljava/util/ArrayList;

    .line 1419
    .line 1420
    invoke-direct {v0, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 1421
    .line 1422
    .line 1423
    iget-object v1, p2, Ls3/e0;->a:Ljava/lang/String;

    .line 1424
    .line 1425
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1426
    .line 1427
    .line 1428
    iget-object v1, p2, Ls3/e0;->b:Ls3/C;

    .line 1429
    .line 1430
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1431
    .line 1432
    .line 1433
    iget-object v1, p2, Ls3/e0;->c:Ls3/j0;

    .line 1434
    .line 1435
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1436
    .line 1437
    .line 1438
    iget-object v1, p2, Ls3/e0;->d:Ls3/k0;

    .line 1439
    .line 1440
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1441
    .line 1442
    .line 1443
    iget-object v1, p2, Ls3/e0;->e:Ljava/lang/Double;

    .line 1444
    .line 1445
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1446
    .line 1447
    .line 1448
    iget-object v1, p2, Ls3/e0;->f:Ljava/lang/Double;

    .line 1449
    .line 1450
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1451
    .line 1452
    .line 1453
    iget-object v1, p2, Ls3/e0;->g:Ls3/c0;

    .line 1454
    .line 1455
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1456
    .line 1457
    .line 1458
    iget-object v1, p2, Ls3/e0;->h:Ljava/lang/Double;

    .line 1459
    .line 1460
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1461
    .line 1462
    .line 1463
    iget-object v1, p2, Ls3/e0;->i:Ljava/lang/Double;

    .line 1464
    .line 1465
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1466
    .line 1467
    .line 1468
    iget-object v1, p2, Ls3/e0;->j:Ljava/lang/Long;

    .line 1469
    .line 1470
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1471
    .line 1472
    .line 1473
    iget-object v1, p2, Ls3/e0;->k:Ljava/lang/Boolean;

    .line 1474
    .line 1475
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1476
    .line 1477
    .line 1478
    iget-object p2, p2, Ls3/e0;->l:Ljava/lang/Boolean;

    .line 1479
    .line 1480
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1481
    .line 1482
    .line 1483
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 1484
    .line 1485
    .line 1486
    return-void

    .line 1487
    :cond_2d
    instance-of v0, p2, Ls3/L;

    .line 1488
    .line 1489
    if-eqz v0, :cond_2e

    .line 1490
    .line 1491
    const/16 v0, 0xa7

    .line 1492
    .line 1493
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1494
    .line 1495
    .line 1496
    check-cast p2, Ls3/L;

    .line 1497
    .line 1498
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1499
    .line 1500
    .line 1501
    new-instance v0, Ljava/util/ArrayList;

    .line 1502
    .line 1503
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 1504
    .line 1505
    .line 1506
    iget-object p2, p2, Ls3/L;->a:Ls3/k0;

    .line 1507
    .line 1508
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1509
    .line 1510
    .line 1511
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 1512
    .line 1513
    .line 1514
    return-void

    .line 1515
    :cond_2e
    instance-of v0, p2, Ls3/o0;

    .line 1516
    .line 1517
    if-eqz v0, :cond_2f

    .line 1518
    .line 1519
    const/16 v0, 0xa8

    .line 1520
    .line 1521
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1522
    .line 1523
    .line 1524
    check-cast p2, Ls3/o0;

    .line 1525
    .line 1526
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1527
    .line 1528
    .line 1529
    new-instance v0, Ljava/util/ArrayList;

    .line 1530
    .line 1531
    invoke-direct {v0, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 1532
    .line 1533
    .line 1534
    iget-object v1, p2, Ls3/o0;->a:Ls3/K;

    .line 1535
    .line 1536
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1537
    .line 1538
    .line 1539
    iget-object v1, p2, Ls3/o0;->b:Ls3/m0;

    .line 1540
    .line 1541
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1542
    .line 1543
    .line 1544
    iget-object v1, p2, Ls3/o0;->c:Ljava/util/List;

    .line 1545
    .line 1546
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1547
    .line 1548
    .line 1549
    iget-object v1, p2, Ls3/o0;->d:Ljava/util/List;

    .line 1550
    .line 1551
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1552
    .line 1553
    .line 1554
    iget-object v1, p2, Ls3/o0;->e:Ljava/util/List;

    .line 1555
    .line 1556
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1557
    .line 1558
    .line 1559
    iget-object v1, p2, Ls3/o0;->f:Ljava/util/List;

    .line 1560
    .line 1561
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1562
    .line 1563
    .line 1564
    iget-object v1, p2, Ls3/o0;->g:Ljava/util/List;

    .line 1565
    .line 1566
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1567
    .line 1568
    .line 1569
    iget-object v1, p2, Ls3/o0;->h:Ljava/util/List;

    .line 1570
    .line 1571
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1572
    .line 1573
    .line 1574
    iget-object v1, p2, Ls3/o0;->i:Ljava/util/List;

    .line 1575
    .line 1576
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1577
    .line 1578
    .line 1579
    iget-object p2, p2, Ls3/o0;->j:Ljava/util/List;

    .line 1580
    .line 1581
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1582
    .line 1583
    .line 1584
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 1585
    .line 1586
    .line 1587
    return-void

    .line 1588
    :cond_2f
    instance-of v0, p2, Ls3/m0;

    .line 1589
    .line 1590
    if-eqz v0, :cond_30

    .line 1591
    .line 1592
    const/16 v0, 0xa9

    .line 1593
    .line 1594
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1595
    .line 1596
    .line 1597
    check-cast p2, Ls3/m0;

    .line 1598
    .line 1599
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1600
    .line 1601
    .line 1602
    new-instance v0, Ljava/util/ArrayList;

    .line 1603
    .line 1604
    const/16 v1, 0x15

    .line 1605
    .line 1606
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 1607
    .line 1608
    .line 1609
    iget-object v1, p2, Ls3/m0;->a:Ljava/lang/Boolean;

    .line 1610
    .line 1611
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1612
    .line 1613
    .line 1614
    iget-object v1, p2, Ls3/m0;->b:Ls3/L;

    .line 1615
    .line 1616
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1617
    .line 1618
    .line 1619
    iget-object v1, p2, Ls3/m0;->c:Ls3/n0;

    .line 1620
    .line 1621
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1622
    .line 1623
    .line 1624
    iget-object v1, p2, Ls3/m0;->d:Ls3/C0;

    .line 1625
    .line 1626
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1627
    .line 1628
    .line 1629
    iget-object v1, p2, Ls3/m0;->e:Ljava/lang/Boolean;

    .line 1630
    .line 1631
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1632
    .line 1633
    .line 1634
    iget-object v1, p2, Ls3/m0;->f:Ljava/lang/Boolean;

    .line 1635
    .line 1636
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1637
    .line 1638
    .line 1639
    iget-object v1, p2, Ls3/m0;->g:Ljava/lang/Boolean;

    .line 1640
    .line 1641
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1642
    .line 1643
    .line 1644
    iget-object v1, p2, Ls3/m0;->h:Ljava/lang/Boolean;

    .line 1645
    .line 1646
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1647
    .line 1648
    .line 1649
    iget-object v1, p2, Ls3/m0;->i:Ljava/lang/Boolean;

    .line 1650
    .line 1651
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1652
    .line 1653
    .line 1654
    iget-object v1, p2, Ls3/m0;->j:Ljava/lang/Boolean;

    .line 1655
    .line 1656
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1657
    .line 1658
    .line 1659
    iget-object v1, p2, Ls3/m0;->k:Ljava/lang/Boolean;

    .line 1660
    .line 1661
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1662
    .line 1663
    .line 1664
    iget-object v1, p2, Ls3/m0;->l:Ljava/lang/Boolean;

    .line 1665
    .line 1666
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1667
    .line 1668
    .line 1669
    iget-object v1, p2, Ls3/m0;->m:Ljava/lang/Boolean;

    .line 1670
    .line 1671
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1672
    .line 1673
    .line 1674
    iget-object v1, p2, Ls3/m0;->n:Ls3/d0;

    .line 1675
    .line 1676
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1677
    .line 1678
    .line 1679
    iget-object v1, p2, Ls3/m0;->o:Ljava/lang/Boolean;

    .line 1680
    .line 1681
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1682
    .line 1683
    .line 1684
    iget-object v1, p2, Ls3/m0;->p:Ljava/lang/Boolean;

    .line 1685
    .line 1686
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1687
    .line 1688
    .line 1689
    iget-object v1, p2, Ls3/m0;->q:Ljava/lang/Boolean;

    .line 1690
    .line 1691
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1692
    .line 1693
    .line 1694
    iget-object v1, p2, Ls3/m0;->r:Ljava/lang/Boolean;

    .line 1695
    .line 1696
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1697
    .line 1698
    .line 1699
    iget-object v1, p2, Ls3/m0;->s:Ls3/r0;

    .line 1700
    .line 1701
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1702
    .line 1703
    .line 1704
    iget-object v1, p2, Ls3/m0;->t:Ljava/lang/String;

    .line 1705
    .line 1706
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1707
    .line 1708
    .line 1709
    iget-object p2, p2, Ls3/m0;->u:Ljava/lang/String;

    .line 1710
    .line 1711
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1712
    .line 1713
    .line 1714
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 1715
    .line 1716
    .line 1717
    return-void

    .line 1718
    :cond_30
    instance-of v0, p2, Ls3/u0;

    .line 1719
    .line 1720
    if-eqz v0, :cond_31

    .line 1721
    .line 1722
    const/16 v0, 0xaa

    .line 1723
    .line 1724
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1725
    .line 1726
    .line 1727
    check-cast p2, Ls3/u0;

    .line 1728
    .line 1729
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1730
    .line 1731
    .line 1732
    new-instance v0, Ljava/util/ArrayList;

    .line 1733
    .line 1734
    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 1735
    .line 1736
    .line 1737
    iget-object v1, p2, Ls3/u0;->a:Ljava/lang/Long;

    .line 1738
    .line 1739
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1740
    .line 1741
    .line 1742
    iget-object p2, p2, Ls3/u0;->b:Ljava/lang/Long;

    .line 1743
    .line 1744
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1745
    .line 1746
    .line 1747
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 1748
    .line 1749
    .line 1750
    return-void

    .line 1751
    :cond_31
    instance-of v0, p2, Ls3/z0;

    .line 1752
    .line 1753
    if-eqz v0, :cond_32

    .line 1754
    .line 1755
    const/16 v0, 0xab

    .line 1756
    .line 1757
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1758
    .line 1759
    .line 1760
    check-cast p2, Ls3/z0;

    .line 1761
    .line 1762
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1763
    .line 1764
    .line 1765
    new-instance v0, Ljava/util/ArrayList;

    .line 1766
    .line 1767
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 1768
    .line 1769
    .line 1770
    iget-object v1, p2, Ls3/z0;->a:Ljava/lang/Boolean;

    .line 1771
    .line 1772
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1773
    .line 1774
    .line 1775
    iget-object v1, p2, Ls3/z0;->b:Ljava/lang/Boolean;

    .line 1776
    .line 1777
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1778
    .line 1779
    .line 1780
    iget-object v1, p2, Ls3/z0;->c:Ljava/lang/Double;

    .line 1781
    .line 1782
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1783
    .line 1784
    .line 1785
    iget-object p2, p2, Ls3/z0;->d:Ljava/lang/Double;

    .line 1786
    .line 1787
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1788
    .line 1789
    .line 1790
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 1791
    .line 1792
    .line 1793
    return-void

    .line 1794
    :cond_32
    instance-of v0, p2, Ls3/C0;

    .line 1795
    .line 1796
    if-eqz v0, :cond_33

    .line 1797
    .line 1798
    const/16 v0, 0xac

    .line 1799
    .line 1800
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1801
    .line 1802
    .line 1803
    check-cast p2, Ls3/C0;

    .line 1804
    .line 1805
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1806
    .line 1807
    .line 1808
    new-instance v0, Ljava/util/ArrayList;

    .line 1809
    .line 1810
    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 1811
    .line 1812
    .line 1813
    iget-object v1, p2, Ls3/C0;->a:Ljava/lang/Double;

    .line 1814
    .line 1815
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1816
    .line 1817
    .line 1818
    iget-object p2, p2, Ls3/C0;->b:Ljava/lang/Double;

    .line 1819
    .line 1820
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1821
    .line 1822
    .line 1823
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 1824
    .line 1825
    .line 1826
    return-void

    .line 1827
    :cond_33
    instance-of v0, p2, Ls3/C;

    .line 1828
    .line 1829
    if-eqz v0, :cond_34

    .line 1830
    .line 1831
    const/16 v0, 0xad

    .line 1832
    .line 1833
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1834
    .line 1835
    .line 1836
    check-cast p2, Ls3/C;

    .line 1837
    .line 1838
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1839
    .line 1840
    .line 1841
    new-instance v0, Ljava/util/ArrayList;

    .line 1842
    .line 1843
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 1844
    .line 1845
    .line 1846
    iget-object p2, p2, Ls3/C;->a:Ljava/lang/Object;

    .line 1847
    .line 1848
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1849
    .line 1850
    .line 1851
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 1852
    .line 1853
    .line 1854
    return-void

    .line 1855
    :cond_34
    instance-of v0, p2, Ls3/I;

    .line 1856
    .line 1857
    if-eqz v0, :cond_35

    .line 1858
    .line 1859
    const/16 v0, 0xae

    .line 1860
    .line 1861
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1862
    .line 1863
    .line 1864
    check-cast p2, Ls3/I;

    .line 1865
    .line 1866
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1867
    .line 1868
    .line 1869
    new-instance v0, Ljava/util/ArrayList;

    .line 1870
    .line 1871
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 1872
    .line 1873
    .line 1874
    iget-object p2, p2, Ls3/I;->a:Ljava/lang/Double;

    .line 1875
    .line 1876
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1877
    .line 1878
    .line 1879
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 1880
    .line 1881
    .line 1882
    return-void

    .line 1883
    :cond_35
    instance-of v0, p2, Ls3/G;

    .line 1884
    .line 1885
    if-eqz v0, :cond_36

    .line 1886
    .line 1887
    const/16 v0, 0xaf

    .line 1888
    .line 1889
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1890
    .line 1891
    .line 1892
    check-cast p2, Ls3/G;

    .line 1893
    .line 1894
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1895
    .line 1896
    .line 1897
    new-instance v0, Ljava/util/ArrayList;

    .line 1898
    .line 1899
    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 1900
    .line 1901
    .line 1902
    iget-object v1, p2, Ls3/G;->a:[B

    .line 1903
    .line 1904
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1905
    .line 1906
    .line 1907
    iget-object p2, p2, Ls3/G;->b:Ls3/c0;

    .line 1908
    .line 1909
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1910
    .line 1911
    .line 1912
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 1913
    .line 1914
    .line 1915
    return-void

    .line 1916
    :cond_36
    instance-of v0, p2, Ls3/D;

    .line 1917
    .line 1918
    if-eqz v0, :cond_37

    .line 1919
    .line 1920
    const/16 v0, 0xb0

    .line 1921
    .line 1922
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1923
    .line 1924
    .line 1925
    check-cast p2, Ls3/D;

    .line 1926
    .line 1927
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1928
    .line 1929
    .line 1930
    new-instance v0, Ljava/util/ArrayList;

    .line 1931
    .line 1932
    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 1933
    .line 1934
    .line 1935
    iget-object v1, p2, Ls3/D;->a:Ljava/lang/String;

    .line 1936
    .line 1937
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1938
    .line 1939
    .line 1940
    iget-object p2, p2, Ls3/D;->b:Ljava/lang/String;

    .line 1941
    .line 1942
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1943
    .line 1944
    .line 1945
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 1946
    .line 1947
    .line 1948
    return-void

    .line 1949
    :cond_37
    instance-of v0, p2, Ls3/E;

    .line 1950
    .line 1951
    if-eqz v0, :cond_38

    .line 1952
    .line 1953
    const/16 v0, 0xb1

    .line 1954
    .line 1955
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1956
    .line 1957
    .line 1958
    check-cast p2, Ls3/E;

    .line 1959
    .line 1960
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1961
    .line 1962
    .line 1963
    new-instance v0, Ljava/util/ArrayList;

    .line 1964
    .line 1965
    invoke-direct {v0, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 1966
    .line 1967
    .line 1968
    iget-object v1, p2, Ls3/E;->a:Ljava/lang/String;

    .line 1969
    .line 1970
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1971
    .line 1972
    .line 1973
    iget-object v1, p2, Ls3/E;->b:Ljava/lang/Double;

    .line 1974
    .line 1975
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1976
    .line 1977
    .line 1978
    iget-object p2, p2, Ls3/E;->c:Ls3/c0;

    .line 1979
    .line 1980
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1981
    .line 1982
    .line 1983
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 1984
    .line 1985
    .line 1986
    return-void

    .line 1987
    :cond_38
    instance-of v0, p2, Ls3/F;

    .line 1988
    .line 1989
    const/4 v1, 0x5

    .line 1990
    if-eqz v0, :cond_39

    .line 1991
    .line 1992
    const/16 v0, 0xb2

    .line 1993
    .line 1994
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1995
    .line 1996
    .line 1997
    check-cast p2, Ls3/F;

    .line 1998
    .line 1999
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2000
    .line 2001
    .line 2002
    new-instance v0, Ljava/util/ArrayList;

    .line 2003
    .line 2004
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 2005
    .line 2006
    .line 2007
    iget-object v1, p2, Ls3/F;->a:Ljava/lang/String;

    .line 2008
    .line 2009
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2010
    .line 2011
    .line 2012
    iget-object v1, p2, Ls3/F;->b:Ls3/l0;

    .line 2013
    .line 2014
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2015
    .line 2016
    .line 2017
    iget-object v1, p2, Ls3/F;->c:Ljava/lang/Double;

    .line 2018
    .line 2019
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2020
    .line 2021
    .line 2022
    iget-object v1, p2, Ls3/F;->d:Ljava/lang/Double;

    .line 2023
    .line 2024
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2025
    .line 2026
    .line 2027
    iget-object p2, p2, Ls3/F;->e:Ljava/lang/Double;

    .line 2028
    .line 2029
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2030
    .line 2031
    .line 2032
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 2033
    .line 2034
    .line 2035
    return-void

    .line 2036
    :cond_39
    instance-of v0, p2, Ls3/H;

    .line 2037
    .line 2038
    if-eqz v0, :cond_3a

    .line 2039
    .line 2040
    const/16 v0, 0xb3

    .line 2041
    .line 2042
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2043
    .line 2044
    .line 2045
    check-cast p2, Ls3/H;

    .line 2046
    .line 2047
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2048
    .line 2049
    .line 2050
    new-instance v0, Ljava/util/ArrayList;

    .line 2051
    .line 2052
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 2053
    .line 2054
    .line 2055
    iget-object v1, p2, Ls3/H;->a:[B

    .line 2056
    .line 2057
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2058
    .line 2059
    .line 2060
    iget-object v1, p2, Ls3/H;->b:Ls3/l0;

    .line 2061
    .line 2062
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2063
    .line 2064
    .line 2065
    iget-object v1, p2, Ls3/H;->c:Ljava/lang/Double;

    .line 2066
    .line 2067
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2068
    .line 2069
    .line 2070
    iget-object v1, p2, Ls3/H;->d:Ljava/lang/Double;

    .line 2071
    .line 2072
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2073
    .line 2074
    .line 2075
    iget-object p2, p2, Ls3/H;->e:Ljava/lang/Double;

    .line 2076
    .line 2077
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2078
    .line 2079
    .line 2080
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 2081
    .line 2082
    .line 2083
    return-void

    .line 2084
    :cond_3a
    instance-of v0, p2, Ls3/J;

    .line 2085
    .line 2086
    if-eqz v0, :cond_3b

    .line 2087
    .line 2088
    const/16 v0, 0xb4

    .line 2089
    .line 2090
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2091
    .line 2092
    .line 2093
    check-cast p2, Ls3/J;

    .line 2094
    .line 2095
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2096
    .line 2097
    .line 2098
    new-instance v0, Ljava/util/ArrayList;

    .line 2099
    .line 2100
    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 2101
    .line 2102
    .line 2103
    iget-object v1, p2, Ls3/J;->a:Ls3/b0;

    .line 2104
    .line 2105
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2106
    .line 2107
    .line 2108
    iget-object v1, p2, Ls3/J;->b:Ls3/b0;

    .line 2109
    .line 2110
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2111
    .line 2112
    .line 2113
    iget-object v1, p2, Ls3/J;->c:Ls3/b0;

    .line 2114
    .line 2115
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2116
    .line 2117
    .line 2118
    iget-object v1, p2, Ls3/J;->d:Ls3/C;

    .line 2119
    .line 2120
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2121
    .line 2122
    .line 2123
    iget-object v1, p2, Ls3/J;->e:Ljava/lang/String;

    .line 2124
    .line 2125
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2126
    .line 2127
    .line 2128
    iget-object p2, p2, Ls3/J;->f:Ls3/b0;

    .line 2129
    .line 2130
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2131
    .line 2132
    .line 2133
    invoke-virtual {p0, p1, v0}, Ls3/B;->k(Lk3/t;Ljava/lang/Object;)V

    .line 2134
    .line 2135
    .line 2136
    return-void

    .line 2137
    :cond_3b
    invoke-super {p0, p1, p2}, Lk3/u;->k(Lk3/t;Ljava/lang/Object;)V

    .line 2138
    .line 2139
    .line 2140
    return-void
.end method
