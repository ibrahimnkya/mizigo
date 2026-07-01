.class public final LE0/l;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lz0/e;

.field public final c:LF0/d;

.field public final d:LE0/d;

.field public final e:Ljava/util/concurrent/Executor;

.field public final f:LG0/c;

.field public final g:LH0/a;

.field public final h:LH0/a;

.field public final i:LF0/c;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lz0/e;LF0/d;LE0/d;Ljava/util/concurrent/Executor;LG0/c;LH0/a;LH0/a;LF0/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LE0/l;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, LE0/l;->b:Lz0/e;

    .line 7
    .line 8
    iput-object p3, p0, LE0/l;->c:LF0/d;

    .line 9
    .line 10
    iput-object p4, p0, LE0/l;->d:LE0/d;

    .line 11
    .line 12
    iput-object p5, p0, LE0/l;->e:Ljava/util/concurrent/Executor;

    .line 13
    .line 14
    iput-object p6, p0, LE0/l;->f:LG0/c;

    .line 15
    .line 16
    iput-object p7, p0, LE0/l;->g:LH0/a;

    .line 17
    .line 18
    iput-object p8, p0, LE0/l;->h:LH0/a;

    .line 19
    .line 20
    iput-object p9, p0, LE0/l;->i:LF0/c;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final a(Ly0/i;I)V
    .locals 44

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v3, p1

    .line 4
    .line 5
    iget-object v2, v3, Ly0/i;->b:[B

    .line 6
    .line 7
    iget-object v0, v1, LE0/l;->b:Lz0/e;

    .line 8
    .line 9
    iget-object v4, v3, Ly0/i;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v4}, Lz0/e;->a(Ljava/lang/String;)Lz0/f;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    const-wide/16 v5, 0x0

    .line 16
    .line 17
    move-wide v7, v5

    .line 18
    move-object v6, v4

    .line 19
    move-wide v4, v7

    .line 20
    :goto_0
    new-instance v0, LE0/h;

    .line 21
    .line 22
    const/4 v9, 0x0

    .line 23
    invoke-direct {v0, v1, v3, v9}, LE0/h;-><init>(LE0/l;Ly0/i;I)V

    .line 24
    .line 25
    .line 26
    iget-object v10, v1, LE0/l;->f:LG0/c;

    .line 27
    .line 28
    check-cast v10, LF0/h;

    .line 29
    .line 30
    invoke-virtual {v10, v0}, LF0/h;->f(LG0/b;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ljava/lang/Boolean;

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_21

    .line 41
    .line 42
    new-instance v0, LE0/h;

    .line 43
    .line 44
    const/4 v11, 0x1

    .line 45
    invoke-direct {v0, v1, v3, v11}, LE0/h;-><init>(LE0/l;Ly0/i;I)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v10, v0}, LF0/h;->f(LG0/b;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    move-object v12, v0

    .line 53
    check-cast v12, Ljava/lang/Iterable;

    .line 54
    .line 55
    invoke-interface {v12}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_0

    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    const/4 v14, 0x3

    .line 67
    const-wide/16 v7, -0x1

    .line 68
    .line 69
    if-nez v6, :cond_1

    .line 70
    .line 71
    const-string v0, "Uploader"

    .line 72
    .line 73
    const-string v13, "Unknown backend for %s, deleting event batch for it..."

    .line 74
    .line 75
    invoke-static {v0, v13, v3}, Landroid/support/v4/media/session/a;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    new-instance v0, Lz0/a;

    .line 79
    .line 80
    invoke-direct {v0, v7, v8, v14}, Lz0/a;-><init>(JI)V

    .line 81
    .line 82
    .line 83
    move-object/from16 v30, v2

    .line 84
    .line 85
    move-wide/from16 v31, v4

    .line 86
    .line 87
    :goto_1
    const/4 v1, 0x2

    .line 88
    goto/16 :goto_11

    .line 89
    .line 90
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    .line 91
    .line 92
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 93
    .line 94
    .line 95
    invoke-interface {v12}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 96
    .line 97
    .line 98
    move-result-object v13

    .line 99
    :goto_2
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    .line 100
    .line 101
    .line 102
    move-result v16

    .line 103
    if-eqz v16, :cond_2

    .line 104
    .line 105
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v16

    .line 109
    move-object/from16 v15, v16

    .line 110
    .line 111
    check-cast v15, LF0/b;

    .line 112
    .line 113
    iget-object v15, v15, LF0/b;->c:Ly0/h;

    .line 114
    .line 115
    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_2
    const-string v13, "proto"

    .line 120
    .line 121
    if-eqz v2, :cond_3

    .line 122
    .line 123
    iget-object v15, v1, LE0/l;->i:LF0/c;

    .line 124
    .line 125
    invoke-static {v15}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    new-instance v7, LD1/a;

    .line 129
    .line 130
    invoke-direct {v7, v11, v15}, LD1/a;-><init>(ILjava/lang/Object;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v10, v7}, LF0/h;->f(LG0/b;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v7

    .line 137
    check-cast v7, LB0/a;

    .line 138
    .line 139
    new-instance v8, LD1/x;

    .line 140
    .line 141
    invoke-direct {v8}, Ljava/lang/Object;-><init>()V

    .line 142
    .line 143
    .line 144
    new-instance v15, Ljava/util/HashMap;

    .line 145
    .line 146
    invoke-direct {v15}, Ljava/util/HashMap;-><init>()V

    .line 147
    .line 148
    .line 149
    iput-object v15, v8, LD1/x;->f:Ljava/lang/Object;

    .line 150
    .line 151
    iget-object v15, v1, LE0/l;->g:LH0/a;

    .line 152
    .line 153
    invoke-interface {v15}, LH0/a;->e()J

    .line 154
    .line 155
    .line 156
    move-result-wide v17

    .line 157
    invoke-static/range {v17 .. v18}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 158
    .line 159
    .line 160
    move-result-object v15

    .line 161
    iput-object v15, v8, LD1/x;->d:Ljava/lang/Object;

    .line 162
    .line 163
    iget-object v15, v1, LE0/l;->h:LH0/a;

    .line 164
    .line 165
    invoke-interface {v15}, LH0/a;->e()J

    .line 166
    .line 167
    .line 168
    move-result-wide v17

    .line 169
    invoke-static/range {v17 .. v18}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 170
    .line 171
    .line 172
    move-result-object v15

    .line 173
    iput-object v15, v8, LD1/x;->e:Ljava/lang/Object;

    .line 174
    .line 175
    const-string v15, "GDT_CLIENT_METRICS"

    .line 176
    .line 177
    iput-object v15, v8, LD1/x;->a:Ljava/lang/Object;

    .line 178
    .line 179
    new-instance v15, Ly0/l;

    .line 180
    .line 181
    new-instance v11, Lv0/c;

    .line 182
    .line 183
    invoke-direct {v11, v13}, Lv0/c;-><init>(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 187
    .line 188
    .line 189
    sget-object v14, Ly0/n;->a:LB2/a;

    .line 190
    .line 191
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 192
    .line 193
    .line 194
    new-instance v9, Ljava/io/ByteArrayOutputStream;

    .line 195
    .line 196
    invoke-direct {v9}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 197
    .line 198
    .line 199
    :try_start_0
    invoke-virtual {v14, v7, v9}, LB2/a;->s(Ljava/lang/Object;Ljava/io/ByteArrayOutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 200
    .line 201
    .line 202
    :catch_0
    invoke-virtual {v9}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 203
    .line 204
    .line 205
    move-result-object v7

    .line 206
    invoke-direct {v15, v11, v7}, Ly0/l;-><init>(Lv0/c;[B)V

    .line 207
    .line 208
    .line 209
    iput-object v15, v8, LD1/x;->c:Ljava/lang/Object;

    .line 210
    .line 211
    invoke-virtual {v8}, LD1/x;->j()Ly0/h;

    .line 212
    .line 213
    .line 214
    move-result-object v7

    .line 215
    move-object v8, v6

    .line 216
    check-cast v8, Lw0/c;

    .line 217
    .line 218
    invoke-virtual {v8, v7}, Lw0/c;->a(Ly0/h;)Ly0/h;

    .line 219
    .line 220
    .line 221
    move-result-object v7

    .line 222
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    :cond_3
    move-object v7, v6

    .line 226
    check-cast v7, Lw0/c;

    .line 227
    .line 228
    new-instance v8, Ljava/util/HashMap;

    .line 229
    .line 230
    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 231
    .line 232
    .line 233
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 234
    .line 235
    .line 236
    move-result v9

    .line 237
    const/4 v11, 0x0

    .line 238
    :goto_3
    if-ge v11, v9, :cond_5

    .line 239
    .line 240
    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    move-result-object v14

    .line 244
    add-int/lit8 v11, v11, 0x1

    .line 245
    .line 246
    check-cast v14, Ly0/h;

    .line 247
    .line 248
    iget-object v15, v14, Ly0/h;->a:Ljava/lang/String;

    .line 249
    .line 250
    invoke-virtual {v8, v15}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    move-result v19

    .line 254
    if-nez v19, :cond_4

    .line 255
    .line 256
    move-object/from16 v19, v0

    .line 257
    .line 258
    new-instance v0, Ljava/util/ArrayList;

    .line 259
    .line 260
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 261
    .line 262
    .line 263
    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 264
    .line 265
    .line 266
    invoke-virtual {v8, v15, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    .line 268
    .line 269
    goto :goto_4

    .line 270
    :cond_4
    move-object/from16 v19, v0

    .line 271
    .line 272
    invoke-virtual {v8, v15}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    check-cast v0, Ljava/util/List;

    .line 277
    .line 278
    invoke-interface {v0, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 279
    .line 280
    .line 281
    :goto_4
    move-object/from16 v0, v19

    .line 282
    .line 283
    goto :goto_3

    .line 284
    :cond_5
    new-instance v0, Ljava/util/ArrayList;

    .line 285
    .line 286
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 287
    .line 288
    .line 289
    invoke-virtual {v8}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 290
    .line 291
    .line 292
    move-result-object v8

    .line 293
    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 294
    .line 295
    .line 296
    move-result-object v8

    .line 297
    :goto_5
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 298
    .line 299
    .line 300
    move-result v9

    .line 301
    const-string v15, "CctTransportBackend"

    .line 302
    .line 303
    if-eqz v9, :cond_10

    .line 304
    .line 305
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 306
    .line 307
    .line 308
    move-result-object v9

    .line 309
    check-cast v9, Ljava/util/Map$Entry;

    .line 310
    .line 311
    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    move-result-object v19

    .line 315
    move-object/from16 v11, v19

    .line 316
    .line 317
    check-cast v11, Ljava/util/List;

    .line 318
    .line 319
    const/4 v14, 0x0

    .line 320
    invoke-interface {v11, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 321
    .line 322
    .line 323
    move-result-object v11

    .line 324
    check-cast v11, Ly0/h;

    .line 325
    .line 326
    sget-object v14, Lx0/w;->e:Lx0/w;

    .line 327
    .line 328
    iget-object v14, v7, Lw0/c;->f:LH0/a;

    .line 329
    .line 330
    invoke-interface {v14}, LH0/a;->e()J

    .line 331
    .line 332
    .line 333
    move-result-wide v22

    .line 334
    iget-object v14, v7, Lw0/c;->e:LH0/a;

    .line 335
    .line 336
    invoke-interface {v14}, LH0/a;->e()J

    .line 337
    .line 338
    .line 339
    move-result-wide v24

    .line 340
    const-string v14, "sdk-version"

    .line 341
    .line 342
    invoke-virtual {v11, v14}, Ly0/h;->b(Ljava/lang/String;)I

    .line 343
    .line 344
    .line 345
    move-result v14

    .line 346
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 347
    .line 348
    .line 349
    move-result-object v27

    .line 350
    const-string v14, "model"

    .line 351
    .line 352
    invoke-virtual {v11, v14}, Ly0/h;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 353
    .line 354
    .line 355
    move-result-object v28

    .line 356
    const-string v14, "hardware"

    .line 357
    .line 358
    invoke-virtual {v11, v14}, Ly0/h;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v29

    .line 362
    const-string v14, "device"

    .line 363
    .line 364
    invoke-virtual {v11, v14}, Ly0/h;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 365
    .line 366
    .line 367
    move-result-object v30

    .line 368
    const-string v14, "product"

    .line 369
    .line 370
    invoke-virtual {v11, v14}, Ly0/h;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 371
    .line 372
    .line 373
    move-result-object v31

    .line 374
    const-string v14, "os-uild"

    .line 375
    .line 376
    invoke-virtual {v11, v14}, Ly0/h;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 377
    .line 378
    .line 379
    move-result-object v32

    .line 380
    const-string v14, "manufacturer"

    .line 381
    .line 382
    invoke-virtual {v11, v14}, Ly0/h;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 383
    .line 384
    .line 385
    move-result-object v33

    .line 386
    const-string v14, "fingerprint"

    .line 387
    .line 388
    invoke-virtual {v11, v14}, Ly0/h;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 389
    .line 390
    .line 391
    move-result-object v34

    .line 392
    const-string v14, "country"

    .line 393
    .line 394
    invoke-virtual {v11, v14}, Ly0/h;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 395
    .line 396
    .line 397
    move-result-object v36

    .line 398
    const-string v14, "locale"

    .line 399
    .line 400
    invoke-virtual {v11, v14}, Ly0/h;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 401
    .line 402
    .line 403
    move-result-object v35

    .line 404
    const-string v14, "mcc_mnc"

    .line 405
    .line 406
    invoke-virtual {v11, v14}, Ly0/h;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 407
    .line 408
    .line 409
    move-result-object v37

    .line 410
    const-string v14, "application_build"

    .line 411
    .line 412
    invoke-virtual {v11, v14}, Ly0/h;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 413
    .line 414
    .line 415
    move-result-object v38

    .line 416
    new-instance v26, Lx0/h;

    .line 417
    .line 418
    invoke-direct/range {v26 .. v38}, Lx0/h;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 419
    .line 420
    .line 421
    move-object/from16 v11, v26

    .line 422
    .line 423
    new-instance v14, Lx0/j;

    .line 424
    .line 425
    invoke-direct {v14, v11}, Lx0/j;-><init>(Lx0/h;)V

    .line 426
    .line 427
    .line 428
    :try_start_1
    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 429
    .line 430
    .line 431
    move-result-object v11

    .line 432
    check-cast v11, Ljava/lang/String;

    .line 433
    .line 434
    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 435
    .line 436
    .line 437
    move-result v11

    .line 438
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 439
    .line 440
    .line 441
    move-result-object v11
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 442
    move-object/from16 v27, v11

    .line 443
    .line 444
    const/16 v28, 0x0

    .line 445
    .line 446
    goto :goto_6

    .line 447
    :catch_1
    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 448
    .line 449
    .line 450
    move-result-object v11

    .line 451
    check-cast v11, Ljava/lang/String;

    .line 452
    .line 453
    move-object/from16 v28, v11

    .line 454
    .line 455
    const/16 v27, 0x0

    .line 456
    .line 457
    :goto_6
    new-instance v11, Ljava/util/ArrayList;

    .line 458
    .line 459
    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 460
    .line 461
    .line 462
    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 463
    .line 464
    .line 465
    move-result-object v9

    .line 466
    check-cast v9, Ljava/util/List;

    .line 467
    .line 468
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 469
    .line 470
    .line 471
    move-result-object v9

    .line 472
    :goto_7
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 473
    .line 474
    .line 475
    move-result v20

    .line 476
    if-eqz v20, :cond_f

    .line 477
    .line 478
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 479
    .line 480
    .line 481
    move-result-object v20

    .line 482
    move-object/from16 v1, v20

    .line 483
    .line 484
    check-cast v1, Ly0/h;

    .line 485
    .line 486
    move-object/from16 v30, v2

    .line 487
    .line 488
    iget-object v2, v1, Ly0/h;->c:Ly0/l;

    .line 489
    .line 490
    iget-object v3, v2, Ly0/l;->a:Lv0/c;

    .line 491
    .line 492
    iget-object v2, v2, Ly0/l;->b:[B

    .line 493
    .line 494
    move-wide/from16 v31, v4

    .line 495
    .line 496
    new-instance v4, Lv0/c;

    .line 497
    .line 498
    invoke-direct {v4, v13}, Lv0/c;-><init>(Ljava/lang/String;)V

    .line 499
    .line 500
    .line 501
    invoke-virtual {v3, v4}, Lv0/c;->equals(Ljava/lang/Object;)Z

    .line 502
    .line 503
    .line 504
    move-result v4

    .line 505
    if-eqz v4, :cond_6

    .line 506
    .line 507
    new-instance v3, Lm/J0;

    .line 508
    .line 509
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 510
    .line 511
    .line 512
    iput-object v2, v3, Lm/J0;->h:Ljava/lang/Object;

    .line 513
    .line 514
    goto :goto_8

    .line 515
    :cond_6
    new-instance v4, Lv0/c;

    .line 516
    .line 517
    const-string v5, "json"

    .line 518
    .line 519
    invoke-direct {v4, v5}, Lv0/c;-><init>(Ljava/lang/String;)V

    .line 520
    .line 521
    .line 522
    invoke-virtual {v3, v4}, Lv0/c;->equals(Ljava/lang/Object;)Z

    .line 523
    .line 524
    .line 525
    move-result v4

    .line 526
    if-eqz v4, :cond_e

    .line 527
    .line 528
    new-instance v3, Ljava/lang/String;

    .line 529
    .line 530
    const-string v4, "UTF-8"

    .line 531
    .line 532
    invoke-static {v4}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    .line 533
    .line 534
    .line 535
    move-result-object v4

    .line 536
    invoke-direct {v3, v2, v4}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 537
    .line 538
    .line 539
    new-instance v2, Lm/J0;

    .line 540
    .line 541
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 542
    .line 543
    .line 544
    iput-object v3, v2, Lm/J0;->i:Ljava/lang/Object;

    .line 545
    .line 546
    move-object v3, v2

    .line 547
    :goto_8
    iget-wide v4, v1, Ly0/h;->d:J

    .line 548
    .line 549
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 550
    .line 551
    .line 552
    move-result-object v2

    .line 553
    iput-object v2, v3, Lm/J0;->e:Ljava/lang/Object;

    .line 554
    .line 555
    iget-wide v4, v1, Ly0/h;->e:J

    .line 556
    .line 557
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 558
    .line 559
    .line 560
    move-result-object v2

    .line 561
    iput-object v2, v3, Lm/J0;->g:Ljava/lang/Object;

    .line 562
    .line 563
    const-string v2, "tz-offset"

    .line 564
    .line 565
    iget-object v4, v1, Ly0/h;->f:Ljava/util/Map;

    .line 566
    .line 567
    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 568
    .line 569
    .line 570
    move-result-object v2

    .line 571
    check-cast v2, Ljava/lang/String;

    .line 572
    .line 573
    if-nez v2, :cond_7

    .line 574
    .line 575
    const-wide/16 v4, 0x0

    .line 576
    .line 577
    goto :goto_9

    .line 578
    :cond_7
    invoke-static {v2}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 579
    .line 580
    .line 581
    move-result-object v2

    .line 582
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 583
    .line 584
    .line 585
    move-result-wide v4

    .line 586
    :goto_9
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 587
    .line 588
    .line 589
    move-result-object v2

    .line 590
    iput-object v2, v3, Lm/J0;->j:Ljava/lang/Object;

    .line 591
    .line 592
    const-string v2, "net-type"

    .line 593
    .line 594
    invoke-virtual {v1, v2}, Ly0/h;->b(Ljava/lang/String;)I

    .line 595
    .line 596
    .line 597
    move-result v2

    .line 598
    sget-object v4, Lx0/u;->e:Landroid/util/SparseArray;

    .line 599
    .line 600
    invoke-virtual {v4, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 601
    .line 602
    .line 603
    move-result-object v2

    .line 604
    check-cast v2, Lx0/u;

    .line 605
    .line 606
    const-string v4, "mobile-subtype"

    .line 607
    .line 608
    invoke-virtual {v1, v4}, Ly0/h;->b(Ljava/lang/String;)I

    .line 609
    .line 610
    .line 611
    move-result v4

    .line 612
    sget-object v5, Lx0/t;->e:Landroid/util/SparseArray;

    .line 613
    .line 614
    invoke-virtual {v5, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 615
    .line 616
    .line 617
    move-result-object v4

    .line 618
    check-cast v4, Lx0/t;

    .line 619
    .line 620
    new-instance v5, Lx0/n;

    .line 621
    .line 622
    invoke-direct {v5, v2, v4}, Lx0/n;-><init>(Lx0/u;Lx0/t;)V

    .line 623
    .line 624
    .line 625
    iput-object v5, v3, Lm/J0;->k:Ljava/lang/Object;

    .line 626
    .line 627
    iget-object v1, v1, Ly0/h;->b:Ljava/lang/Integer;

    .line 628
    .line 629
    if-eqz v1, :cond_8

    .line 630
    .line 631
    iput-object v1, v3, Lm/J0;->f:Ljava/lang/Object;

    .line 632
    .line 633
    :cond_8
    iget-object v1, v3, Lm/J0;->e:Ljava/lang/Object;

    .line 634
    .line 635
    check-cast v1, Ljava/lang/Long;

    .line 636
    .line 637
    if-nez v1, :cond_9

    .line 638
    .line 639
    const-string v1, " eventTimeMs"

    .line 640
    .line 641
    goto :goto_a

    .line 642
    :cond_9
    const-string v1, ""

    .line 643
    .line 644
    :goto_a
    iget-object v2, v3, Lm/J0;->g:Ljava/lang/Object;

    .line 645
    .line 646
    check-cast v2, Ljava/lang/Long;

    .line 647
    .line 648
    if-nez v2, :cond_a

    .line 649
    .line 650
    const-string v2, " eventUptimeMs"

    .line 651
    .line 652
    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 653
    .line 654
    .line 655
    move-result-object v1

    .line 656
    :cond_a
    iget-object v2, v3, Lm/J0;->j:Ljava/lang/Object;

    .line 657
    .line 658
    check-cast v2, Ljava/lang/Long;

    .line 659
    .line 660
    if-nez v2, :cond_b

    .line 661
    .line 662
    const-string v2, " timezoneOffsetSeconds"

    .line 663
    .line 664
    invoke-static {v1, v2}, Lr/a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 665
    .line 666
    .line 667
    move-result-object v1

    .line 668
    :cond_b
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 669
    .line 670
    .line 671
    move-result v2

    .line 672
    if-eqz v2, :cond_d

    .line 673
    .line 674
    new-instance v33, Lx0/k;

    .line 675
    .line 676
    iget-object v1, v3, Lm/J0;->e:Ljava/lang/Object;

    .line 677
    .line 678
    check-cast v1, Ljava/lang/Long;

    .line 679
    .line 680
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 681
    .line 682
    .line 683
    move-result-wide v34

    .line 684
    iget-object v1, v3, Lm/J0;->f:Ljava/lang/Object;

    .line 685
    .line 686
    move-object/from16 v36, v1

    .line 687
    .line 688
    check-cast v36, Ljava/lang/Integer;

    .line 689
    .line 690
    iget-object v1, v3, Lm/J0;->g:Ljava/lang/Object;

    .line 691
    .line 692
    check-cast v1, Ljava/lang/Long;

    .line 693
    .line 694
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 695
    .line 696
    .line 697
    move-result-wide v37

    .line 698
    iget-object v1, v3, Lm/J0;->h:Ljava/lang/Object;

    .line 699
    .line 700
    move-object/from16 v39, v1

    .line 701
    .line 702
    check-cast v39, [B

    .line 703
    .line 704
    iget-object v1, v3, Lm/J0;->i:Ljava/lang/Object;

    .line 705
    .line 706
    move-object/from16 v40, v1

    .line 707
    .line 708
    check-cast v40, Ljava/lang/String;

    .line 709
    .line 710
    iget-object v1, v3, Lm/J0;->j:Ljava/lang/Object;

    .line 711
    .line 712
    check-cast v1, Ljava/lang/Long;

    .line 713
    .line 714
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 715
    .line 716
    .line 717
    move-result-wide v41

    .line 718
    iget-object v1, v3, Lm/J0;->k:Ljava/lang/Object;

    .line 719
    .line 720
    move-object/from16 v43, v1

    .line 721
    .line 722
    check-cast v43, Lx0/n;

    .line 723
    .line 724
    invoke-direct/range {v33 .. v43}, Lx0/k;-><init>(JLjava/lang/Integer;J[BLjava/lang/String;JLx0/v;)V

    .line 725
    .line 726
    .line 727
    move-object/from16 v1, v33

    .line 728
    .line 729
    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 730
    .line 731
    .line 732
    :cond_c
    :goto_b
    move-object/from16 v1, p0

    .line 733
    .line 734
    move-object/from16 v3, p1

    .line 735
    .line 736
    move-object/from16 v2, v30

    .line 737
    .line 738
    move-wide/from16 v4, v31

    .line 739
    .line 740
    goto/16 :goto_7

    .line 741
    .line 742
    :cond_d
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 743
    .line 744
    const-string v2, "Missing required properties:"

    .line 745
    .line 746
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 747
    .line 748
    .line 749
    move-result-object v1

    .line 750
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 751
    .line 752
    .line 753
    throw v0

    .line 754
    :cond_e
    invoke-static {v15}, Landroid/support/v4/media/session/a;->s(Ljava/lang/String;)Ljava/lang/String;

    .line 755
    .line 756
    .line 757
    move-result-object v1

    .line 758
    const/4 v2, 0x5

    .line 759
    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 760
    .line 761
    .line 762
    move-result v4

    .line 763
    if-eqz v4, :cond_c

    .line 764
    .line 765
    new-instance v4, Ljava/lang/StringBuilder;

    .line 766
    .line 767
    const-string v5, "Received event of unsupported encoding "

    .line 768
    .line 769
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 770
    .line 771
    .line 772
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 773
    .line 774
    .line 775
    const-string v3, ". Skipping..."

    .line 776
    .line 777
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 778
    .line 779
    .line 780
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 781
    .line 782
    .line 783
    move-result-object v3

    .line 784
    invoke-static {v1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 785
    .line 786
    .line 787
    goto :goto_b

    .line 788
    :cond_f
    move-object/from16 v30, v2

    .line 789
    .line 790
    move-wide/from16 v31, v4

    .line 791
    .line 792
    new-instance v21, Lx0/l;

    .line 793
    .line 794
    move-object/from16 v29, v11

    .line 795
    .line 796
    move-object/from16 v26, v14

    .line 797
    .line 798
    invoke-direct/range {v21 .. v29}, Lx0/l;-><init>(JJLx0/j;Ljava/lang/Integer;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 799
    .line 800
    .line 801
    move-object/from16 v1, v21

    .line 802
    .line 803
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 804
    .line 805
    .line 806
    move-object/from16 v1, p0

    .line 807
    .line 808
    move-object/from16 v3, p1

    .line 809
    .line 810
    goto/16 :goto_5

    .line 811
    .line 812
    :cond_10
    move-object/from16 v30, v2

    .line 813
    .line 814
    move-wide/from16 v31, v4

    .line 815
    .line 816
    const/4 v2, 0x5

    .line 817
    new-instance v1, Lx0/i;

    .line 818
    .line 819
    invoke-direct {v1, v0}, Lx0/i;-><init>(Ljava/util/ArrayList;)V

    .line 820
    .line 821
    .line 822
    iget-object v0, v7, Lw0/c;->d:Ljava/net/URL;

    .line 823
    .line 824
    if-eqz v30, :cond_12

    .line 825
    .line 826
    :try_start_2
    invoke-static/range {v30 .. v30}, Lw0/a;->a([B)Lw0/a;

    .line 827
    .line 828
    .line 829
    move-result-object v3

    .line 830
    iget-object v4, v3, Lw0/a;->b:Ljava/lang/String;

    .line 831
    .line 832
    if-eqz v4, :cond_11

    .line 833
    .line 834
    goto :goto_c

    .line 835
    :cond_11
    const/4 v4, 0x0

    .line 836
    :goto_c
    iget-object v3, v3, Lw0/a;->a:Ljava/lang/String;

    .line 837
    .line 838
    if-eqz v3, :cond_13

    .line 839
    .line 840
    invoke-static {v3}, Lw0/c;->b(Ljava/lang/String;)Ljava/net/URL;

    .line 841
    .line 842
    .line 843
    move-result-object v0
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_2

    .line 844
    goto :goto_d

    .line 845
    :catch_2
    new-instance v0, Lz0/a;

    .line 846
    .line 847
    const/4 v1, 0x3

    .line 848
    const-wide/16 v2, -0x1

    .line 849
    .line 850
    invoke-direct {v0, v2, v3, v1}, Lz0/a;-><init>(JI)V

    .line 851
    .line 852
    .line 853
    goto/16 :goto_1

    .line 854
    .line 855
    :cond_12
    const/4 v4, 0x0

    .line 856
    :cond_13
    :goto_d
    :try_start_3
    new-instance v3, Lm/x0;

    .line 857
    .line 858
    const/16 v5, 0xc

    .line 859
    .line 860
    invoke-direct {v3, v0, v1, v4, v5}, Lm/x0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 861
    .line 862
    .line 863
    new-instance v0, LD1/a;

    .line 864
    .line 865
    const/16 v1, 0xf

    .line 866
    .line 867
    invoke-direct {v0, v1, v7}, LD1/a;-><init>(ILjava/lang/Object;)V

    .line 868
    .line 869
    .line 870
    move v14, v2

    .line 871
    :cond_14
    invoke-virtual {v0, v3}, LD1/a;->d(Lm/x0;)Lw0/b;

    .line 872
    .line 873
    .line 874
    move-result-object v1

    .line 875
    iget-object v2, v1, Lw0/b;->b:Ljava/net/URL;

    .line 876
    .line 877
    if-eqz v2, :cond_15

    .line 878
    .line 879
    const-string v4, "Following redirect to: %s"

    .line 880
    .line 881
    invoke-static {v15, v4, v2}, Landroid/support/v4/media/session/a;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 882
    .line 883
    .line 884
    new-instance v4, Lm/x0;

    .line 885
    .line 886
    iget-object v7, v3, Lm/x0;->g:Ljava/lang/Object;

    .line 887
    .line 888
    check-cast v7, Lx0/i;

    .line 889
    .line 890
    iget-object v3, v3, Lm/x0;->h:Ljava/lang/Object;

    .line 891
    .line 892
    check-cast v3, Ljava/lang/String;

    .line 893
    .line 894
    invoke-direct {v4, v2, v7, v3, v5}, Lm/x0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 895
    .line 896
    .line 897
    move-object v3, v4

    .line 898
    goto :goto_e

    .line 899
    :cond_15
    const/4 v3, 0x0

    .line 900
    :goto_e
    if-eqz v3, :cond_16

    .line 901
    .line 902
    add-int/lit8 v14, v14, -0x1

    .line 903
    .line 904
    const/4 v2, 0x1

    .line 905
    if-ge v14, v2, :cond_14

    .line 906
    .line 907
    :cond_16
    iget v0, v1, Lw0/b;->a:I

    .line 908
    .line 909
    const/16 v2, 0xc8

    .line 910
    .line 911
    if-ne v0, v2, :cond_17

    .line 912
    .line 913
    iget-wide v0, v1, Lw0/b;->c:J

    .line 914
    .line 915
    new-instance v2, Lz0/a;

    .line 916
    .line 917
    const/4 v3, 0x1

    .line 918
    invoke-direct {v2, v0, v1, v3}, Lz0/a;-><init>(JI)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    .line 919
    .line 920
    .line 921
    move-object v0, v2

    .line 922
    goto/16 :goto_1

    .line 923
    .line 924
    :catch_3
    move-exception v0

    .line 925
    goto :goto_10

    .line 926
    :cond_17
    const/16 v1, 0x1f4

    .line 927
    .line 928
    if-ge v0, v1, :cond_18

    .line 929
    .line 930
    const/16 v1, 0x194

    .line 931
    .line 932
    if-ne v0, v1, :cond_19

    .line 933
    .line 934
    :cond_18
    const-wide/16 v2, -0x1

    .line 935
    .line 936
    goto :goto_f

    .line 937
    :cond_19
    const/16 v1, 0x190

    .line 938
    .line 939
    if-ne v0, v1, :cond_1a

    .line 940
    .line 941
    :try_start_4
    new-instance v0, Lz0/a;
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    .line 942
    .line 943
    const/4 v1, 0x4

    .line 944
    const-wide/16 v2, -0x1

    .line 945
    .line 946
    :try_start_5
    invoke-direct {v0, v2, v3, v1}, Lz0/a;-><init>(JI)V

    .line 947
    .line 948
    .line 949
    goto/16 :goto_1

    .line 950
    .line 951
    :catch_4
    move-exception v0

    .line 952
    const-wide/16 v2, -0x1

    .line 953
    .line 954
    goto :goto_10

    .line 955
    :cond_1a
    const-wide/16 v2, -0x1

    .line 956
    .line 957
    new-instance v0, Lz0/a;

    .line 958
    .line 959
    const/4 v1, 0x3

    .line 960
    invoke-direct {v0, v2, v3, v1}, Lz0/a;-><init>(JI)V

    .line 961
    .line 962
    .line 963
    goto/16 :goto_1

    .line 964
    .line 965
    :goto_f
    new-instance v0, Lz0/a;

    .line 966
    .line 967
    const/4 v1, 0x2

    .line 968
    invoke-direct {v0, v2, v3, v1}, Lz0/a;-><init>(JI)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 969
    .line 970
    .line 971
    goto/16 :goto_1

    .line 972
    .line 973
    :goto_10
    const-string v1, "Could not make request to the backend"

    .line 974
    .line 975
    invoke-static {v15, v1, v0}, Landroid/support/v4/media/session/a;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 976
    .line 977
    .line 978
    new-instance v0, Lz0/a;

    .line 979
    .line 980
    const/4 v1, 0x2

    .line 981
    const-wide/16 v2, -0x1

    .line 982
    .line 983
    invoke-direct {v0, v2, v3, v1}, Lz0/a;-><init>(JI)V

    .line 984
    .line 985
    .line 986
    :goto_11
    iget v2, v0, Lz0/a;->a:I

    .line 987
    .line 988
    if-ne v2, v1, :cond_1b

    .line 989
    .line 990
    new-instance v0, LE0/i;

    .line 991
    .line 992
    move-object/from16 v1, p0

    .line 993
    .line 994
    move-object/from16 v3, p1

    .line 995
    .line 996
    move-object v2, v12

    .line 997
    move-wide/from16 v4, v31

    .line 998
    .line 999
    invoke-direct/range {v0 .. v5}, LE0/i;-><init>(LE0/l;Ljava/lang/Iterable;Ly0/i;J)V

    .line 1000
    .line 1001
    .line 1002
    invoke-virtual {v10, v0}, LF0/h;->f(LG0/b;)Ljava/lang/Object;

    .line 1003
    .line 1004
    .line 1005
    const/4 v4, 0x1

    .line 1006
    add-int/lit8 v0, p2, 0x1

    .line 1007
    .line 1008
    iget-object v2, v1, LE0/l;->d:LE0/d;

    .line 1009
    .line 1010
    invoke-virtual {v2, v3, v0, v4}, LE0/d;->a(Ly0/i;IZ)V

    .line 1011
    .line 1012
    .line 1013
    return-void

    .line 1014
    :cond_1b
    move-object/from16 v1, p0

    .line 1015
    .line 1016
    move-object/from16 v3, p1

    .line 1017
    .line 1018
    move-object v5, v12

    .line 1019
    move-wide/from16 v7, v31

    .line 1020
    .line 1021
    const/4 v4, 0x1

    .line 1022
    new-instance v9, LE0/j;

    .line 1023
    .line 1024
    const/4 v14, 0x0

    .line 1025
    invoke-direct {v9, v14, v1, v5}, LE0/j;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 1026
    .line 1027
    .line 1028
    invoke-virtual {v10, v9}, LF0/h;->f(LG0/b;)Ljava/lang/Object;

    .line 1029
    .line 1030
    .line 1031
    if-ne v2, v4, :cond_1c

    .line 1032
    .line 1033
    iget-wide v4, v0, Lz0/a;->b:J

    .line 1034
    .line 1035
    invoke-static {v7, v8, v4, v5}, Ljava/lang/Math;->max(JJ)J

    .line 1036
    .line 1037
    .line 1038
    move-result-wide v4

    .line 1039
    if-eqz v30, :cond_20

    .line 1040
    .line 1041
    new-instance v0, LD1/a;

    .line 1042
    .line 1043
    const/4 v2, 0x3

    .line 1044
    invoke-direct {v0, v2, v1}, LD1/a;-><init>(ILjava/lang/Object;)V

    .line 1045
    .line 1046
    .line 1047
    invoke-virtual {v10, v0}, LF0/h;->f(LG0/b;)Ljava/lang/Object;

    .line 1048
    .line 1049
    .line 1050
    goto :goto_13

    .line 1051
    :cond_1c
    const/4 v4, 0x4

    .line 1052
    if-ne v2, v4, :cond_1f

    .line 1053
    .line 1054
    new-instance v0, Ljava/util/HashMap;

    .line 1055
    .line 1056
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1057
    .line 1058
    .line 1059
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 1060
    .line 1061
    .line 1062
    move-result-object v2

    .line 1063
    :goto_12
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 1064
    .line 1065
    .line 1066
    move-result v4

    .line 1067
    if-eqz v4, :cond_1e

    .line 1068
    .line 1069
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1070
    .line 1071
    .line 1072
    move-result-object v4

    .line 1073
    check-cast v4, LF0/b;

    .line 1074
    .line 1075
    iget-object v4, v4, LF0/b;->c:Ly0/h;

    .line 1076
    .line 1077
    iget-object v4, v4, Ly0/h;->a:Ljava/lang/String;

    .line 1078
    .line 1079
    invoke-virtual {v0, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 1080
    .line 1081
    .line 1082
    move-result v5

    .line 1083
    if-nez v5, :cond_1d

    .line 1084
    .line 1085
    const/4 v5, 0x1

    .line 1086
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1087
    .line 1088
    .line 1089
    move-result-object v9

    .line 1090
    invoke-virtual {v0, v4, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1091
    .line 1092
    .line 1093
    goto :goto_12

    .line 1094
    :cond_1d
    const/4 v5, 0x1

    .line 1095
    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1096
    .line 1097
    .line 1098
    move-result-object v9

    .line 1099
    check-cast v9, Ljava/lang/Integer;

    .line 1100
    .line 1101
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    .line 1102
    .line 1103
    .line 1104
    move-result v9

    .line 1105
    add-int/2addr v9, v5

    .line 1106
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1107
    .line 1108
    .line 1109
    move-result-object v9

    .line 1110
    invoke-virtual {v0, v4, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1111
    .line 1112
    .line 1113
    goto :goto_12

    .line 1114
    :cond_1e
    const/4 v5, 0x1

    .line 1115
    new-instance v2, LE0/j;

    .line 1116
    .line 1117
    invoke-direct {v2, v5, v1, v0}, LE0/j;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 1118
    .line 1119
    .line 1120
    invoke-virtual {v10, v2}, LF0/h;->f(LG0/b;)Ljava/lang/Object;

    .line 1121
    .line 1122
    .line 1123
    :cond_1f
    move-wide v4, v7

    .line 1124
    :cond_20
    :goto_13
    move-object/from16 v2, v30

    .line 1125
    .line 1126
    const-wide/16 v7, 0x0

    .line 1127
    .line 1128
    goto/16 :goto_0

    .line 1129
    .line 1130
    :cond_21
    move-wide v7, v4

    .line 1131
    new-instance v0, LE0/k;

    .line 1132
    .line 1133
    invoke-direct {v0, v7, v8, v1, v3}, LE0/k;-><init>(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 1134
    .line 1135
    .line 1136
    invoke-virtual {v10, v0}, LF0/h;->f(LG0/b;)Ljava/lang/Object;

    .line 1137
    .line 1138
    .line 1139
    return-void
.end method
