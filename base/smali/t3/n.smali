.class public final synthetic Lt3/n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lk3/b;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Lt3/h;


# direct methods
.method public synthetic constructor <init>(Lt3/h;I)V
    .locals 0

    .line 1
    iput p2, p0, Lt3/n;->e:I

    iput-object p1, p0, Lt3/n;->f:Lt3/h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;LZ2/s;)V
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p2

    .line 4
    .line 5
    iget v0, v1, Lt3/n;->e:I

    .line 6
    .line 7
    packed-switch v0, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    iget-object v0, v1, Lt3/n;->f:Lt3/h;

    .line 11
    .line 12
    new-instance v3, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    :try_start_0
    invoke-virtual {v0}, Lt3/h;->a()Lt3/j;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/4 v4, 0x0

    .line 22
    invoke-virtual {v3, v4, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception v0

    .line 27
    invoke-static {v0}, LV0/g;->G(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    :goto_0
    invoke-virtual {v2, v3}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :pswitch_0
    new-instance v0, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    move-object/from16 v3, p1

    .line 41
    .line 42
    check-cast v3, Ljava/util/ArrayList;

    .line 43
    .line 44
    const/4 v4, 0x0

    .line 45
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    check-cast v4, Lt3/p;

    .line 50
    .line 51
    const/4 v5, 0x1

    .line 52
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    check-cast v3, Lt3/m;

    .line 57
    .line 58
    new-instance v5, Lp3/i;

    .line 59
    .line 60
    const/16 v6, 0xb

    .line 61
    .line 62
    invoke-direct {v5, v0, v2, v6}, Lp3/i;-><init>(Ljava/util/ArrayList;LZ2/s;I)V

    .line 63
    .line 64
    .line 65
    iget-object v0, v1, Lt3/n;->f:Lt3/h;

    .line 66
    .line 67
    iget-object v0, v0, Lt3/h;->f:Lm/J0;

    .line 68
    .line 69
    const/4 v2, 0x0

    .line 70
    if-eqz v0, :cond_1

    .line 71
    .line 72
    iget-object v6, v0, Lm/J0;->f:Ljava/lang/Object;

    .line 73
    .line 74
    check-cast v6, Landroid/app/Activity;

    .line 75
    .line 76
    if-nez v6, :cond_0

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_0
    iget-object v0, v0, Lm/J0;->g:Ljava/lang/Object;

    .line 80
    .line 81
    check-cast v0, Lt3/f;

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_1
    :goto_1
    move-object v0, v2

    .line 85
    :goto_2
    if-nez v0, :cond_2

    .line 86
    .line 87
    new-instance v0, Lt3/l;

    .line 88
    .line 89
    const-string v2, "no_activity"

    .line 90
    .line 91
    const-string v3, "image_picker plugin requires a foreground activity."

    .line 92
    .line 93
    invoke-direct {v0, v2, v3}, Lt3/l;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v5, v0}, Lp3/i;->d(Lt3/l;)V

    .line 97
    .line 98
    .line 99
    goto/16 :goto_8

    .line 100
    .line 101
    :cond_2
    iget-object v4, v4, Lt3/p;->a:Lt3/o;

    .line 102
    .line 103
    invoke-virtual {v0, v4, v2, v5}, Lt3/f;->k(Lt3/o;Lt3/u;Lp3/i;)Z

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    if-nez v2, :cond_3

    .line 108
    .line 109
    invoke-static {v5}, Lt3/f;->a(Lp3/i;)V

    .line 110
    .line 111
    .line 112
    goto/16 :goto_8

    .line 113
    .line 114
    :cond_3
    iget-object v0, v0, Lt3/f;->f:Landroid/app/Activity;

    .line 115
    .line 116
    iget-object v2, v3, Lt3/m;->b:Ljava/lang/Boolean;

    .line 117
    .line 118
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-eqz v2, :cond_d

    .line 123
    .line 124
    iget-object v2, v3, Lt3/m;->a:Ljava/lang/Boolean;

    .line 125
    .line 126
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    sget-object v4, Lg/b;->a:Lg/b;

    .line 131
    .line 132
    const v5, 0x7fffffff

    .line 133
    .line 134
    .line 135
    const/4 v6, 0x2

    .line 136
    const/16 v7, 0x21

    .line 137
    .line 138
    const/16 v8, 0x1e

    .line 139
    .line 140
    sget-object v9, Lg/c;->a:Lg/c;

    .line 141
    .line 142
    if-eqz v2, :cond_8

    .line 143
    .line 144
    invoke-static {v3}, LT0/a;->u(Lt3/m;)I

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    new-instance v3, Lg/a;

    .line 149
    .line 150
    invoke-direct {v3, v2}, Lg/a;-><init>(I)V

    .line 151
    .line 152
    .line 153
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 154
    .line 155
    if-lt v2, v7, :cond_4

    .line 156
    .line 157
    goto :goto_3

    .line 158
    :cond_4
    if-lt v2, v8, :cond_5

    .line 159
    .line 160
    invoke-static {}, LD/N;->D()I

    .line 161
    .line 162
    .line 163
    move-result v10

    .line 164
    if-lt v10, v6, :cond_5

    .line 165
    .line 166
    :goto_3
    invoke-static {}, LE/c;->a()I

    .line 167
    .line 168
    .line 169
    move-result v5

    .line 170
    :cond_5
    new-instance v10, LM2/b;

    .line 171
    .line 172
    invoke-direct {v10}, Ljava/lang/Object;-><init>()V

    .line 173
    .line 174
    .line 175
    iput-object v9, v10, LM2/b;->b:Ljava/lang/Object;

    .line 176
    .line 177
    if-lt v2, v7, :cond_6

    .line 178
    .line 179
    goto :goto_4

    .line 180
    :cond_6
    if-lt v2, v8, :cond_7

    .line 181
    .line 182
    invoke-static {}, LD/N;->D()I

    .line 183
    .line 184
    .line 185
    move-result v2

    .line 186
    if-lt v2, v6, :cond_7

    .line 187
    .line 188
    :goto_4
    invoke-static {}, LE/c;->a()I

    .line 189
    .line 190
    .line 191
    :cond_7
    iput-object v9, v10, LM2/b;->b:Ljava/lang/Object;

    .line 192
    .line 193
    iput v5, v10, LM2/b;->a:I

    .line 194
    .line 195
    iput-object v4, v10, LM2/b;->c:Ljava/lang/Object;

    .line 196
    .line 197
    invoke-virtual {v3, v0, v10}, Lg/a;->R(Landroid/app/Activity;LM2/b;)Landroid/content/Intent;

    .line 198
    .line 199
    .line 200
    move-result-object v2

    .line 201
    goto :goto_7

    .line 202
    :cond_8
    new-instance v2, Lg/g;

    .line 203
    .line 204
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 205
    .line 206
    .line 207
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 208
    .line 209
    if-lt v3, v7, :cond_9

    .line 210
    .line 211
    goto :goto_5

    .line 212
    :cond_9
    if-lt v3, v8, :cond_a

    .line 213
    .line 214
    invoke-static {}, LD/N;->D()I

    .line 215
    .line 216
    .line 217
    move-result v10

    .line 218
    if-lt v10, v6, :cond_a

    .line 219
    .line 220
    :goto_5
    invoke-static {}, LE/c;->a()I

    .line 221
    .line 222
    .line 223
    move-result v5

    .line 224
    :cond_a
    new-instance v10, LM2/b;

    .line 225
    .line 226
    invoke-direct {v10}, Ljava/lang/Object;-><init>()V

    .line 227
    .line 228
    .line 229
    iput-object v9, v10, LM2/b;->b:Ljava/lang/Object;

    .line 230
    .line 231
    if-lt v3, v7, :cond_b

    .line 232
    .line 233
    goto :goto_6

    .line 234
    :cond_b
    if-lt v3, v8, :cond_c

    .line 235
    .line 236
    invoke-static {}, LD/N;->D()I

    .line 237
    .line 238
    .line 239
    move-result v3

    .line 240
    if-lt v3, v6, :cond_c

    .line 241
    .line 242
    :goto_6
    invoke-static {}, LE/c;->a()I

    .line 243
    .line 244
    .line 245
    :cond_c
    iput-object v9, v10, LM2/b;->b:Ljava/lang/Object;

    .line 246
    .line 247
    iput v5, v10, LM2/b;->a:I

    .line 248
    .line 249
    iput-object v4, v10, LM2/b;->c:Ljava/lang/Object;

    .line 250
    .line 251
    invoke-virtual {v2, v0, v10}, Lg/g;->R(Landroid/app/Activity;LM2/b;)Landroid/content/Intent;

    .line 252
    .line 253
    .line 254
    move-result-object v2

    .line 255
    goto :goto_7

    .line 256
    :cond_d
    new-instance v2, Landroid/content/Intent;

    .line 257
    .line 258
    const-string v4, "android.intent.action.GET_CONTENT"

    .line 259
    .line 260
    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 261
    .line 262
    .line 263
    const-string v4, "*/*"

    .line 264
    .line 265
    invoke-virtual {v2, v4}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 266
    .line 267
    .line 268
    const-string v4, "video/*"

    .line 269
    .line 270
    const-string v5, "image/*"

    .line 271
    .line 272
    filled-new-array {v4, v5}, [Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v4

    .line 276
    const-string v5, "CONTENT_TYPE"

    .line 277
    .line 278
    invoke-virtual {v2, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 279
    .line 280
    .line 281
    const-string v4, "android.intent.extra.ALLOW_MULTIPLE"

    .line 282
    .line 283
    iget-object v3, v3, Lt3/m;->a:Ljava/lang/Boolean;

    .line 284
    .line 285
    invoke-virtual {v2, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 286
    .line 287
    .line 288
    :goto_7
    const/16 v3, 0x92b

    .line 289
    .line 290
    invoke-virtual {v0, v2, v3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 291
    .line 292
    .line 293
    :goto_8
    return-void

    .line 294
    :pswitch_1
    new-instance v0, Ljava/util/ArrayList;

    .line 295
    .line 296
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 297
    .line 298
    .line 299
    move-object/from16 v3, p1

    .line 300
    .line 301
    check-cast v3, Ljava/util/ArrayList;

    .line 302
    .line 303
    const/4 v4, 0x0

    .line 304
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 305
    .line 306
    .line 307
    move-result-object v4

    .line 308
    check-cast v4, Lt3/s;

    .line 309
    .line 310
    const/4 v5, 0x1

    .line 311
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    move-result-object v6

    .line 315
    check-cast v6, Lt3/u;

    .line 316
    .line 317
    const/4 v7, 0x2

    .line 318
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 319
    .line 320
    .line 321
    move-result-object v3

    .line 322
    check-cast v3, Lt3/m;

    .line 323
    .line 324
    new-instance v8, Lp3/i;

    .line 325
    .line 326
    const/16 v9, 0xa

    .line 327
    .line 328
    invoke-direct {v8, v0, v2, v9}, Lp3/i;-><init>(Ljava/util/ArrayList;LZ2/s;I)V

    .line 329
    .line 330
    .line 331
    iget-object v0, v1, Lt3/n;->f:Lt3/h;

    .line 332
    .line 333
    iget-object v0, v0, Lt3/h;->f:Lm/J0;

    .line 334
    .line 335
    const/4 v2, 0x0

    .line 336
    if-eqz v0, :cond_f

    .line 337
    .line 338
    iget-object v9, v0, Lm/J0;->f:Ljava/lang/Object;

    .line 339
    .line 340
    check-cast v9, Landroid/app/Activity;

    .line 341
    .line 342
    if-nez v9, :cond_e

    .line 343
    .line 344
    goto :goto_9

    .line 345
    :cond_e
    iget-object v0, v0, Lm/J0;->g:Ljava/lang/Object;

    .line 346
    .line 347
    check-cast v0, Lt3/f;

    .line 348
    .line 349
    goto :goto_a

    .line 350
    :cond_f
    :goto_9
    move-object v0, v2

    .line 351
    :goto_a
    if-nez v0, :cond_10

    .line 352
    .line 353
    new-instance v0, Lt3/l;

    .line 354
    .line 355
    const-string v2, "no_activity"

    .line 356
    .line 357
    const-string v3, "image_picker plugin requires a foreground activity."

    .line 358
    .line 359
    invoke-direct {v0, v2, v3}, Lt3/l;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 360
    .line 361
    .line 362
    invoke-virtual {v8, v0}, Lp3/i;->d(Lt3/l;)V

    .line 363
    .line 364
    .line 365
    goto/16 :goto_13

    .line 366
    .line 367
    :cond_10
    iget-object v9, v0, Lt3/f;->f:Landroid/app/Activity;

    .line 368
    .line 369
    iget-object v10, v4, Lt3/s;->b:Lt3/r;

    .line 370
    .line 371
    if-eqz v10, :cond_12

    .line 372
    .line 373
    invoke-virtual {v10}, Ljava/lang/Enum;->ordinal()I

    .line 374
    .line 375
    .line 376
    move-result v10

    .line 377
    if-eq v10, v5, :cond_11

    .line 378
    .line 379
    move v10, v5

    .line 380
    goto :goto_b

    .line 381
    :cond_11
    move v10, v7

    .line 382
    :goto_b
    iput v10, v0, Lt3/f;->m:I

    .line 383
    .line 384
    :cond_12
    iget-object v10, v3, Lt3/m;->a:Ljava/lang/Boolean;

    .line 385
    .line 386
    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    .line 387
    .line 388
    .line 389
    move-result v10

    .line 390
    const-string v11, "video/*"

    .line 391
    .line 392
    const-string v12, "android.intent.action.GET_CONTENT"

    .line 393
    .line 394
    sget-object v13, Lg/e;->a:Lg/e;

    .line 395
    .line 396
    sget-object v14, Lg/c;->a:Lg/c;

    .line 397
    .line 398
    const/16 v15, 0x1e

    .line 399
    .line 400
    const/16 v5, 0x21

    .line 401
    .line 402
    const v16, 0x7fffffff

    .line 403
    .line 404
    .line 405
    sget-object v7, Lg/b;->a:Lg/b;

    .line 406
    .line 407
    if-eqz v10, :cond_19

    .line 408
    .line 409
    invoke-static {v3}, LT0/a;->u(Lt3/m;)I

    .line 410
    .line 411
    .line 412
    move-result v4

    .line 413
    iget-object v3, v3, Lt3/m;->b:Ljava/lang/Boolean;

    .line 414
    .line 415
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 416
    .line 417
    .line 418
    move-result v3

    .line 419
    invoke-virtual {v0, v2, v6, v8}, Lt3/f;->k(Lt3/o;Lt3/u;Lp3/i;)Z

    .line 420
    .line 421
    .line 422
    move-result v0

    .line 423
    if-nez v0, :cond_13

    .line 424
    .line 425
    invoke-static {v8}, Lt3/f;->a(Lp3/i;)V

    .line 426
    .line 427
    .line 428
    goto/16 :goto_13

    .line 429
    .line 430
    :cond_13
    if-eqz v3, :cond_18

    .line 431
    .line 432
    new-instance v0, Lg/a;

    .line 433
    .line 434
    invoke-direct {v0, v4}, Lg/a;-><init>(I)V

    .line 435
    .line 436
    .line 437
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 438
    .line 439
    if-lt v2, v5, :cond_14

    .line 440
    .line 441
    goto :goto_c

    .line 442
    :cond_14
    if-lt v2, v15, :cond_15

    .line 443
    .line 444
    invoke-static {}, LD/N;->D()I

    .line 445
    .line 446
    .line 447
    move-result v3

    .line 448
    const/4 v4, 0x2

    .line 449
    if-lt v3, v4, :cond_15

    .line 450
    .line 451
    :goto_c
    invoke-static {}, LE/c;->a()I

    .line 452
    .line 453
    .line 454
    move-result v16

    .line 455
    :cond_15
    move/from16 v3, v16

    .line 456
    .line 457
    new-instance v4, LM2/b;

    .line 458
    .line 459
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 460
    .line 461
    .line 462
    iput-object v14, v4, LM2/b;->b:Ljava/lang/Object;

    .line 463
    .line 464
    if-lt v2, v5, :cond_16

    .line 465
    .line 466
    goto :goto_d

    .line 467
    :cond_16
    if-lt v2, v15, :cond_17

    .line 468
    .line 469
    invoke-static {}, LD/N;->D()I

    .line 470
    .line 471
    .line 472
    move-result v2

    .line 473
    const/4 v5, 0x2

    .line 474
    if-lt v2, v5, :cond_17

    .line 475
    .line 476
    :goto_d
    invoke-static {}, LE/c;->a()I

    .line 477
    .line 478
    .line 479
    :cond_17
    iput-object v13, v4, LM2/b;->b:Ljava/lang/Object;

    .line 480
    .line 481
    iput v3, v4, LM2/b;->a:I

    .line 482
    .line 483
    iput-object v7, v4, LM2/b;->c:Ljava/lang/Object;

    .line 484
    .line 485
    invoke-virtual {v0, v9, v4}, Lg/a;->R(Landroid/app/Activity;LM2/b;)Landroid/content/Intent;

    .line 486
    .line 487
    .line 488
    move-result-object v0

    .line 489
    goto :goto_e

    .line 490
    :cond_18
    new-instance v0, Landroid/content/Intent;

    .line 491
    .line 492
    invoke-direct {v0, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 493
    .line 494
    .line 495
    invoke-virtual {v0, v11}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 496
    .line 497
    .line 498
    const-string v2, "android.intent.extra.ALLOW_MULTIPLE"

    .line 499
    .line 500
    const/4 v10, 0x1

    .line 501
    invoke-virtual {v0, v2, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 502
    .line 503
    .line 504
    :goto_e
    const/16 v2, 0x92c

    .line 505
    .line 506
    invoke-virtual {v9, v0, v2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 507
    .line 508
    .line 509
    goto/16 :goto_13

    .line 510
    .line 511
    :cond_19
    const/4 v10, 0x1

    .line 512
    iget-object v4, v4, Lt3/s;->a:Lt3/t;

    .line 513
    .line 514
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 515
    .line 516
    .line 517
    move-result v4

    .line 518
    if-eqz v4, :cond_21

    .line 519
    .line 520
    if-eq v4, v10, :cond_1a

    .line 521
    .line 522
    goto/16 :goto_13

    .line 523
    .line 524
    :cond_1a
    iget-object v3, v3, Lt3/m;->b:Ljava/lang/Boolean;

    .line 525
    .line 526
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 527
    .line 528
    .line 529
    move-result v3

    .line 530
    invoke-virtual {v0, v2, v6, v8}, Lt3/f;->k(Lt3/o;Lt3/u;Lp3/i;)Z

    .line 531
    .line 532
    .line 533
    move-result v0

    .line 534
    if-nez v0, :cond_1b

    .line 535
    .line 536
    invoke-static {v8}, Lt3/f;->a(Lp3/i;)V

    .line 537
    .line 538
    .line 539
    goto/16 :goto_13

    .line 540
    .line 541
    :cond_1b
    if-eqz v3, :cond_20

    .line 542
    .line 543
    new-instance v0, Lg/g;

    .line 544
    .line 545
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 546
    .line 547
    .line 548
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 549
    .line 550
    if-lt v2, v5, :cond_1c

    .line 551
    .line 552
    goto :goto_f

    .line 553
    :cond_1c
    if-lt v2, v15, :cond_1d

    .line 554
    .line 555
    invoke-static {}, LD/N;->D()I

    .line 556
    .line 557
    .line 558
    move-result v3

    .line 559
    const/4 v4, 0x2

    .line 560
    if-lt v3, v4, :cond_1d

    .line 561
    .line 562
    :goto_f
    invoke-static {}, LE/c;->a()I

    .line 563
    .line 564
    .line 565
    move-result v16

    .line 566
    :cond_1d
    move/from16 v3, v16

    .line 567
    .line 568
    new-instance v4, LM2/b;

    .line 569
    .line 570
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 571
    .line 572
    .line 573
    iput-object v14, v4, LM2/b;->b:Ljava/lang/Object;

    .line 574
    .line 575
    if-lt v2, v5, :cond_1e

    .line 576
    .line 577
    goto :goto_10

    .line 578
    :cond_1e
    if-lt v2, v15, :cond_1f

    .line 579
    .line 580
    invoke-static {}, LD/N;->D()I

    .line 581
    .line 582
    .line 583
    move-result v2

    .line 584
    const/4 v5, 0x2

    .line 585
    if-lt v2, v5, :cond_1f

    .line 586
    .line 587
    :goto_10
    invoke-static {}, LE/c;->a()I

    .line 588
    .line 589
    .line 590
    :cond_1f
    iput-object v13, v4, LM2/b;->b:Ljava/lang/Object;

    .line 591
    .line 592
    iput v3, v4, LM2/b;->a:I

    .line 593
    .line 594
    iput-object v7, v4, LM2/b;->c:Ljava/lang/Object;

    .line 595
    .line 596
    invoke-virtual {v0, v9, v4}, Lg/g;->R(Landroid/app/Activity;LM2/b;)Landroid/content/Intent;

    .line 597
    .line 598
    .line 599
    move-result-object v0

    .line 600
    goto :goto_11

    .line 601
    :cond_20
    new-instance v0, Landroid/content/Intent;

    .line 602
    .line 603
    invoke-direct {v0, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 604
    .line 605
    .line 606
    invoke-virtual {v0, v11}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 607
    .line 608
    .line 609
    :goto_11
    const/16 v2, 0x930

    .line 610
    .line 611
    invoke-virtual {v9, v0, v2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 612
    .line 613
    .line 614
    goto :goto_13

    .line 615
    :cond_21
    iget-object v3, v0, Lt3/f;->i:Lio/flutter/plugin/editing/j;

    .line 616
    .line 617
    invoke-virtual {v0, v2, v6, v8}, Lt3/f;->k(Lt3/o;Lt3/u;Lp3/i;)Z

    .line 618
    .line 619
    .line 620
    move-result v2

    .line 621
    if-nez v2, :cond_22

    .line 622
    .line 623
    invoke-static {v8}, Lt3/f;->a(Lp3/i;)V

    .line 624
    .line 625
    .line 626
    goto :goto_13

    .line 627
    :cond_22
    invoke-virtual {v0}, Lt3/f;->j()Z

    .line 628
    .line 629
    .line 630
    move-result v2

    .line 631
    if-eqz v2, :cond_24

    .line 632
    .line 633
    iget-object v2, v3, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 634
    .line 635
    check-cast v2, Landroid/app/Activity;

    .line 636
    .line 637
    const-string v4, "android.permission.CAMERA"

    .line 638
    .line 639
    invoke-static {v2, v4}, Lu/c;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 640
    .line 641
    .line 642
    move-result v2

    .line 643
    if-nez v2, :cond_23

    .line 644
    .line 645
    goto :goto_12

    .line 646
    :cond_23
    iget-object v0, v3, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 647
    .line 648
    check-cast v0, Landroid/app/Activity;

    .line 649
    .line 650
    filled-new-array {v4}, [Ljava/lang/String;

    .line 651
    .line 652
    .line 653
    move-result-object v2

    .line 654
    const/16 v3, 0x933

    .line 655
    .line 656
    invoke-static {v0, v2, v3}, Lt/a;->b(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 657
    .line 658
    .line 659
    goto :goto_13

    .line 660
    :cond_24
    :goto_12
    invoke-virtual {v0}, Lt3/f;->i()V

    .line 661
    .line 662
    .line 663
    :goto_13
    return-void

    .line 664
    :pswitch_2
    new-instance v0, Ljava/util/ArrayList;

    .line 665
    .line 666
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 667
    .line 668
    .line 669
    move-object/from16 v3, p1

    .line 670
    .line 671
    check-cast v3, Ljava/util/ArrayList;

    .line 672
    .line 673
    const/4 v4, 0x0

    .line 674
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 675
    .line 676
    .line 677
    move-result-object v4

    .line 678
    check-cast v4, Lt3/s;

    .line 679
    .line 680
    const/4 v5, 0x1

    .line 681
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 682
    .line 683
    .line 684
    move-result-object v6

    .line 685
    check-cast v6, Lt3/o;

    .line 686
    .line 687
    const/4 v7, 0x2

    .line 688
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 689
    .line 690
    .line 691
    move-result-object v3

    .line 692
    check-cast v3, Lt3/m;

    .line 693
    .line 694
    new-instance v8, Lp3/i;

    .line 695
    .line 696
    const/16 v9, 0x9

    .line 697
    .line 698
    invoke-direct {v8, v0, v2, v9}, Lp3/i;-><init>(Ljava/util/ArrayList;LZ2/s;I)V

    .line 699
    .line 700
    .line 701
    iget-object v0, v1, Lt3/n;->f:Lt3/h;

    .line 702
    .line 703
    iget-object v0, v0, Lt3/h;->f:Lm/J0;

    .line 704
    .line 705
    const/4 v2, 0x0

    .line 706
    if-eqz v0, :cond_26

    .line 707
    .line 708
    iget-object v9, v0, Lm/J0;->f:Ljava/lang/Object;

    .line 709
    .line 710
    check-cast v9, Landroid/app/Activity;

    .line 711
    .line 712
    if-nez v9, :cond_25

    .line 713
    .line 714
    goto :goto_14

    .line 715
    :cond_25
    iget-object v0, v0, Lm/J0;->g:Ljava/lang/Object;

    .line 716
    .line 717
    check-cast v0, Lt3/f;

    .line 718
    .line 719
    goto :goto_15

    .line 720
    :cond_26
    :goto_14
    move-object v0, v2

    .line 721
    :goto_15
    if-nez v0, :cond_27

    .line 722
    .line 723
    new-instance v0, Lt3/l;

    .line 724
    .line 725
    const-string v2, "no_activity"

    .line 726
    .line 727
    const-string v3, "image_picker plugin requires a foreground activity."

    .line 728
    .line 729
    invoke-direct {v0, v2, v3}, Lt3/l;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 730
    .line 731
    .line 732
    invoke-virtual {v8, v0}, Lp3/i;->d(Lt3/l;)V

    .line 733
    .line 734
    .line 735
    goto/16 :goto_1e

    .line 736
    .line 737
    :cond_27
    iget-object v9, v0, Lt3/f;->f:Landroid/app/Activity;

    .line 738
    .line 739
    iget-object v10, v4, Lt3/s;->b:Lt3/r;

    .line 740
    .line 741
    if-eqz v10, :cond_29

    .line 742
    .line 743
    invoke-virtual {v10}, Ljava/lang/Enum;->ordinal()I

    .line 744
    .line 745
    .line 746
    move-result v10

    .line 747
    if-eq v10, v5, :cond_28

    .line 748
    .line 749
    move v10, v5

    .line 750
    goto :goto_16

    .line 751
    :cond_28
    move v10, v7

    .line 752
    :goto_16
    iput v10, v0, Lt3/f;->m:I

    .line 753
    .line 754
    :cond_29
    iget-object v10, v3, Lt3/m;->a:Ljava/lang/Boolean;

    .line 755
    .line 756
    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    .line 757
    .line 758
    .line 759
    move-result v10

    .line 760
    const-string v11, "image/*"

    .line 761
    .line 762
    const-string v12, "android.intent.action.GET_CONTENT"

    .line 763
    .line 764
    sget-object v13, Lg/d;->a:Lg/d;

    .line 765
    .line 766
    sget-object v14, Lg/c;->a:Lg/c;

    .line 767
    .line 768
    const/16 v15, 0x1e

    .line 769
    .line 770
    const/16 v5, 0x21

    .line 771
    .line 772
    const v16, 0x7fffffff

    .line 773
    .line 774
    .line 775
    sget-object v7, Lg/b;->a:Lg/b;

    .line 776
    .line 777
    if-eqz v10, :cond_30

    .line 778
    .line 779
    invoke-static {v3}, LT0/a;->u(Lt3/m;)I

    .line 780
    .line 781
    .line 782
    move-result v4

    .line 783
    iget-object v3, v3, Lt3/m;->b:Ljava/lang/Boolean;

    .line 784
    .line 785
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 786
    .line 787
    .line 788
    move-result v3

    .line 789
    invoke-virtual {v0, v6, v2, v8}, Lt3/f;->k(Lt3/o;Lt3/u;Lp3/i;)Z

    .line 790
    .line 791
    .line 792
    move-result v0

    .line 793
    if-nez v0, :cond_2a

    .line 794
    .line 795
    invoke-static {v8}, Lt3/f;->a(Lp3/i;)V

    .line 796
    .line 797
    .line 798
    goto/16 :goto_1e

    .line 799
    .line 800
    :cond_2a
    if-eqz v3, :cond_2f

    .line 801
    .line 802
    new-instance v0, Lg/a;

    .line 803
    .line 804
    invoke-direct {v0, v4}, Lg/a;-><init>(I)V

    .line 805
    .line 806
    .line 807
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 808
    .line 809
    if-lt v2, v5, :cond_2b

    .line 810
    .line 811
    goto :goto_17

    .line 812
    :cond_2b
    if-lt v2, v15, :cond_2c

    .line 813
    .line 814
    invoke-static {}, LD/N;->D()I

    .line 815
    .line 816
    .line 817
    move-result v3

    .line 818
    const/4 v4, 0x2

    .line 819
    if-lt v3, v4, :cond_2c

    .line 820
    .line 821
    :goto_17
    invoke-static {}, LE/c;->a()I

    .line 822
    .line 823
    .line 824
    move-result v16

    .line 825
    :cond_2c
    move/from16 v3, v16

    .line 826
    .line 827
    new-instance v4, LM2/b;

    .line 828
    .line 829
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 830
    .line 831
    .line 832
    iput-object v14, v4, LM2/b;->b:Ljava/lang/Object;

    .line 833
    .line 834
    if-lt v2, v5, :cond_2d

    .line 835
    .line 836
    goto :goto_18

    .line 837
    :cond_2d
    if-lt v2, v15, :cond_2e

    .line 838
    .line 839
    invoke-static {}, LD/N;->D()I

    .line 840
    .line 841
    .line 842
    move-result v2

    .line 843
    const/4 v5, 0x2

    .line 844
    if-lt v2, v5, :cond_2e

    .line 845
    .line 846
    :goto_18
    invoke-static {}, LE/c;->a()I

    .line 847
    .line 848
    .line 849
    :cond_2e
    iput-object v13, v4, LM2/b;->b:Ljava/lang/Object;

    .line 850
    .line 851
    iput v3, v4, LM2/b;->a:I

    .line 852
    .line 853
    iput-object v7, v4, LM2/b;->c:Ljava/lang/Object;

    .line 854
    .line 855
    invoke-virtual {v0, v9, v4}, Lg/a;->R(Landroid/app/Activity;LM2/b;)Landroid/content/Intent;

    .line 856
    .line 857
    .line 858
    move-result-object v0

    .line 859
    goto :goto_19

    .line 860
    :cond_2f
    new-instance v0, Landroid/content/Intent;

    .line 861
    .line 862
    invoke-direct {v0, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 863
    .line 864
    .line 865
    invoke-virtual {v0, v11}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 866
    .line 867
    .line 868
    const-string v2, "android.intent.extra.ALLOW_MULTIPLE"

    .line 869
    .line 870
    const/4 v10, 0x1

    .line 871
    invoke-virtual {v0, v2, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 872
    .line 873
    .line 874
    :goto_19
    const/16 v2, 0x92a

    .line 875
    .line 876
    invoke-virtual {v9, v0, v2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 877
    .line 878
    .line 879
    goto/16 :goto_1e

    .line 880
    .line 881
    :cond_30
    const/4 v10, 0x1

    .line 882
    iget-object v4, v4, Lt3/s;->a:Lt3/t;

    .line 883
    .line 884
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 885
    .line 886
    .line 887
    move-result v4

    .line 888
    if-eqz v4, :cond_38

    .line 889
    .line 890
    if-eq v4, v10, :cond_31

    .line 891
    .line 892
    goto/16 :goto_1e

    .line 893
    .line 894
    :cond_31
    iget-object v3, v3, Lt3/m;->b:Ljava/lang/Boolean;

    .line 895
    .line 896
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 897
    .line 898
    .line 899
    move-result v3

    .line 900
    invoke-virtual {v0, v6, v2, v8}, Lt3/f;->k(Lt3/o;Lt3/u;Lp3/i;)Z

    .line 901
    .line 902
    .line 903
    move-result v0

    .line 904
    if-nez v0, :cond_32

    .line 905
    .line 906
    invoke-static {v8}, Lt3/f;->a(Lp3/i;)V

    .line 907
    .line 908
    .line 909
    goto/16 :goto_1e

    .line 910
    .line 911
    :cond_32
    if-eqz v3, :cond_37

    .line 912
    .line 913
    new-instance v0, Lg/g;

    .line 914
    .line 915
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 916
    .line 917
    .line 918
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 919
    .line 920
    if-lt v2, v5, :cond_33

    .line 921
    .line 922
    goto :goto_1a

    .line 923
    :cond_33
    if-lt v2, v15, :cond_34

    .line 924
    .line 925
    invoke-static {}, LD/N;->D()I

    .line 926
    .line 927
    .line 928
    move-result v3

    .line 929
    const/4 v4, 0x2

    .line 930
    if-lt v3, v4, :cond_34

    .line 931
    .line 932
    :goto_1a
    invoke-static {}, LE/c;->a()I

    .line 933
    .line 934
    .line 935
    move-result v16

    .line 936
    :cond_34
    move/from16 v3, v16

    .line 937
    .line 938
    new-instance v4, LM2/b;

    .line 939
    .line 940
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 941
    .line 942
    .line 943
    iput-object v14, v4, LM2/b;->b:Ljava/lang/Object;

    .line 944
    .line 945
    if-lt v2, v5, :cond_35

    .line 946
    .line 947
    goto :goto_1b

    .line 948
    :cond_35
    if-lt v2, v15, :cond_36

    .line 949
    .line 950
    invoke-static {}, LD/N;->D()I

    .line 951
    .line 952
    .line 953
    move-result v2

    .line 954
    const/4 v5, 0x2

    .line 955
    if-lt v2, v5, :cond_36

    .line 956
    .line 957
    :goto_1b
    invoke-static {}, LE/c;->a()I

    .line 958
    .line 959
    .line 960
    :cond_36
    iput-object v13, v4, LM2/b;->b:Ljava/lang/Object;

    .line 961
    .line 962
    iput v3, v4, LM2/b;->a:I

    .line 963
    .line 964
    iput-object v7, v4, LM2/b;->c:Ljava/lang/Object;

    .line 965
    .line 966
    invoke-virtual {v0, v9, v4}, Lg/g;->R(Landroid/app/Activity;LM2/b;)Landroid/content/Intent;

    .line 967
    .line 968
    .line 969
    move-result-object v0

    .line 970
    goto :goto_1c

    .line 971
    :cond_37
    new-instance v0, Landroid/content/Intent;

    .line 972
    .line 973
    invoke-direct {v0, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 974
    .line 975
    .line 976
    invoke-virtual {v0, v11}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 977
    .line 978
    .line 979
    :goto_1c
    const/16 v2, 0x926

    .line 980
    .line 981
    invoke-virtual {v9, v0, v2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 982
    .line 983
    .line 984
    goto :goto_1e

    .line 985
    :cond_38
    iget-object v3, v0, Lt3/f;->i:Lio/flutter/plugin/editing/j;

    .line 986
    .line 987
    invoke-virtual {v0, v6, v2, v8}, Lt3/f;->k(Lt3/o;Lt3/u;Lp3/i;)Z

    .line 988
    .line 989
    .line 990
    move-result v2

    .line 991
    if-nez v2, :cond_39

    .line 992
    .line 993
    invoke-static {v8}, Lt3/f;->a(Lp3/i;)V

    .line 994
    .line 995
    .line 996
    goto :goto_1e

    .line 997
    :cond_39
    invoke-virtual {v0}, Lt3/f;->j()Z

    .line 998
    .line 999
    .line 1000
    move-result v2

    .line 1001
    if-eqz v2, :cond_3b

    .line 1002
    .line 1003
    iget-object v2, v3, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 1004
    .line 1005
    check-cast v2, Landroid/app/Activity;

    .line 1006
    .line 1007
    const-string v4, "android.permission.CAMERA"

    .line 1008
    .line 1009
    invoke-static {v2, v4}, Lu/c;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 1010
    .line 1011
    .line 1012
    move-result v2

    .line 1013
    if-nez v2, :cond_3a

    .line 1014
    .line 1015
    goto :goto_1d

    .line 1016
    :cond_3a
    iget-object v0, v3, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 1017
    .line 1018
    check-cast v0, Landroid/app/Activity;

    .line 1019
    .line 1020
    filled-new-array {v4}, [Ljava/lang/String;

    .line 1021
    .line 1022
    .line 1023
    move-result-object v2

    .line 1024
    const/16 v3, 0x929

    .line 1025
    .line 1026
    invoke-static {v0, v2, v3}, Lt/a;->b(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 1027
    .line 1028
    .line 1029
    goto :goto_1e

    .line 1030
    :cond_3b
    :goto_1d
    invoke-virtual {v0}, Lt3/f;->h()V

    .line 1031
    .line 1032
    .line 1033
    :goto_1e
    return-void

    .line 1034
    nop

    .line 1035
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
