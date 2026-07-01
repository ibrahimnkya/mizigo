.class public final Lio/flutter/view/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La3/j;
.implements La3/k;


# instance fields
.field public final synthetic a:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/flutter/view/c;->a:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/nio/ByteBuffer;[Ljava/lang/String;[Ljava/nio/ByteBuffer;)V
    .locals 20

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p3

    .line 4
    .line 5
    sget-object v2, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 6
    .line 7
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    .line 10
    array-length v2, v1

    .line 11
    const/4 v4, 0x0

    .line 12
    :goto_0
    if-ge v4, v2, :cond_0

    .line 13
    .line 14
    aget-object v5, v1, v4

    .line 15
    .line 16
    sget-object v6, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 17
    .line 18
    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    .line 21
    add-int/lit8 v4, v4, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move-object/from16 v4, p0

    .line 25
    .line 26
    iget-object v2, v4, Lio/flutter/view/c;->a:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v2, Lio/flutter/view/i;

    .line 29
    .line 30
    iget-object v5, v2, Lio/flutter/view/i;->g:Ljava/util/HashMap;

    .line 31
    .line 32
    iget-object v6, v2, Lio/flutter/view/i;->e:Lio/flutter/plugin/platform/i;

    .line 33
    .line 34
    iget-object v7, v2, Lio/flutter/view/i;->q:Ljava/util/ArrayList;

    .line 35
    .line 36
    new-instance v8, Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 39
    .line 40
    .line 41
    :goto_1
    invoke-virtual {v0}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 42
    .line 43
    .line 44
    move-result v9

    .line 45
    const/16 v10, 0x10

    .line 46
    .line 47
    const/4 v11, 0x1

    .line 48
    const/4 v14, 0x0

    .line 49
    if-eqz v9, :cond_10

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 52
    .line 53
    .line 54
    move-result v9

    .line 55
    invoke-virtual {v2, v9}, Lio/flutter/view/i;->c(I)Lio/flutter/view/h;

    .line 56
    .line 57
    .line 58
    move-result-object v9

    .line 59
    iget-object v15, v9, Lio/flutter/view/h;->U:Ljava/util/ArrayList;

    .line 60
    .line 61
    iget-object v3, v9, Lio/flutter/view/h;->a:Lio/flutter/view/i;

    .line 62
    .line 63
    iput-boolean v11, v9, Lio/flutter/view/h;->E:Z

    .line 64
    .line 65
    iget-object v13, v9, Lio/flutter/view/h;->r:Ljava/lang/String;

    .line 66
    .line 67
    iput-object v13, v9, Lio/flutter/view/h;->K:Ljava/lang/String;

    .line 68
    .line 69
    iget-object v13, v9, Lio/flutter/view/h;->p:Ljava/lang/String;

    .line 70
    .line 71
    iput-object v13, v9, Lio/flutter/view/h;->L:Ljava/lang/String;

    .line 72
    .line 73
    iget-wide v12, v9, Lio/flutter/view/h;->c:J

    .line 74
    .line 75
    iput-wide v12, v9, Lio/flutter/view/h;->F:J

    .line 76
    .line 77
    iget v12, v9, Lio/flutter/view/h;->d:I

    .line 78
    .line 79
    iput v12, v9, Lio/flutter/view/h;->G:I

    .line 80
    .line 81
    iget v12, v9, Lio/flutter/view/h;->g:I

    .line 82
    .line 83
    iput v12, v9, Lio/flutter/view/h;->H:I

    .line 84
    .line 85
    iget v12, v9, Lio/flutter/view/h;->h:I

    .line 86
    .line 87
    iput v12, v9, Lio/flutter/view/h;->I:I

    .line 88
    .line 89
    iget v12, v9, Lio/flutter/view/h;->l:F

    .line 90
    .line 91
    iput v12, v9, Lio/flutter/view/h;->J:F

    .line 92
    .line 93
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getLong()J

    .line 94
    .line 95
    .line 96
    move-result-wide v12

    .line 97
    iput-wide v12, v9, Lio/flutter/view/h;->c:J

    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 100
    .line 101
    .line 102
    move-result v12

    .line 103
    iput v12, v9, Lio/flutter/view/h;->d:I

    .line 104
    .line 105
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 106
    .line 107
    .line 108
    move-result v12

    .line 109
    iput v12, v9, Lio/flutter/view/h;->e:I

    .line 110
    .line 111
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 112
    .line 113
    .line 114
    move-result v12

    .line 115
    iput v12, v9, Lio/flutter/view/h;->f:I

    .line 116
    .line 117
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 118
    .line 119
    .line 120
    move-result v12

    .line 121
    iput v12, v9, Lio/flutter/view/h;->g:I

    .line 122
    .line 123
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 124
    .line 125
    .line 126
    move-result v12

    .line 127
    iput v12, v9, Lio/flutter/view/h;->h:I

    .line 128
    .line 129
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 130
    .line 131
    .line 132
    move-result v12

    .line 133
    iput v12, v9, Lio/flutter/view/h;->i:I

    .line 134
    .line 135
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 136
    .line 137
    .line 138
    move-result v12

    .line 139
    iput v12, v9, Lio/flutter/view/h;->j:I

    .line 140
    .line 141
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 142
    .line 143
    .line 144
    move-result v12

    .line 145
    iput v12, v9, Lio/flutter/view/h;->k:I

    .line 146
    .line 147
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 148
    .line 149
    .line 150
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getFloat()F

    .line 151
    .line 152
    .line 153
    move-result v12

    .line 154
    iput v12, v9, Lio/flutter/view/h;->l:F

    .line 155
    .line 156
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getFloat()F

    .line 157
    .line 158
    .line 159
    move-result v12

    .line 160
    iput v12, v9, Lio/flutter/view/h;->m:F

    .line 161
    .line 162
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getFloat()F

    .line 163
    .line 164
    .line 165
    move-result v12

    .line 166
    iput v12, v9, Lio/flutter/view/h;->n:F

    .line 167
    .line 168
    invoke-static/range {p1 .. p2}, Lio/flutter/view/i;->d(Ljava/nio/ByteBuffer;[Ljava/lang/String;)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v12

    .line 172
    iput-object v12, v9, Lio/flutter/view/h;->o:Ljava/lang/String;

    .line 173
    .line 174
    invoke-static/range {p1 .. p2}, Lio/flutter/view/i;->d(Ljava/nio/ByteBuffer;[Ljava/lang/String;)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v12

    .line 178
    iput-object v12, v9, Lio/flutter/view/h;->p:Ljava/lang/String;

    .line 179
    .line 180
    invoke-static {v0, v1}, Lio/flutter/view/h;->f(Ljava/nio/ByteBuffer;[Ljava/nio/ByteBuffer;)Ljava/util/ArrayList;

    .line 181
    .line 182
    .line 183
    move-result-object v12

    .line 184
    iput-object v12, v9, Lio/flutter/view/h;->q:Ljava/util/ArrayList;

    .line 185
    .line 186
    invoke-static/range {p1 .. p2}, Lio/flutter/view/i;->d(Ljava/nio/ByteBuffer;[Ljava/lang/String;)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v12

    .line 190
    iput-object v12, v9, Lio/flutter/view/h;->r:Ljava/lang/String;

    .line 191
    .line 192
    invoke-static {v0, v1}, Lio/flutter/view/h;->f(Ljava/nio/ByteBuffer;[Ljava/nio/ByteBuffer;)Ljava/util/ArrayList;

    .line 193
    .line 194
    .line 195
    move-result-object v12

    .line 196
    iput-object v12, v9, Lio/flutter/view/h;->s:Ljava/util/List;

    .line 197
    .line 198
    invoke-static/range {p1 .. p2}, Lio/flutter/view/i;->d(Ljava/nio/ByteBuffer;[Ljava/lang/String;)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v12

    .line 202
    iput-object v12, v9, Lio/flutter/view/h;->t:Ljava/lang/String;

    .line 203
    .line 204
    invoke-static {v0, v1}, Lio/flutter/view/h;->f(Ljava/nio/ByteBuffer;[Ljava/nio/ByteBuffer;)Ljava/util/ArrayList;

    .line 205
    .line 206
    .line 207
    move-result-object v12

    .line 208
    iput-object v12, v9, Lio/flutter/view/h;->u:Ljava/util/ArrayList;

    .line 209
    .line 210
    invoke-static/range {p1 .. p2}, Lio/flutter/view/i;->d(Ljava/nio/ByteBuffer;[Ljava/lang/String;)Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v12

    .line 214
    iput-object v12, v9, Lio/flutter/view/h;->v:Ljava/lang/String;

    .line 215
    .line 216
    invoke-static {v0, v1}, Lio/flutter/view/h;->f(Ljava/nio/ByteBuffer;[Ljava/nio/ByteBuffer;)Ljava/util/ArrayList;

    .line 217
    .line 218
    .line 219
    move-result-object v12

    .line 220
    iput-object v12, v9, Lio/flutter/view/h;->w:Ljava/util/ArrayList;

    .line 221
    .line 222
    invoke-static/range {p1 .. p2}, Lio/flutter/view/i;->d(Ljava/nio/ByteBuffer;[Ljava/lang/String;)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v12

    .line 226
    iput-object v12, v9, Lio/flutter/view/h;->x:Ljava/lang/String;

    .line 227
    .line 228
    invoke-static {v0, v1}, Lio/flutter/view/h;->f(Ljava/nio/ByteBuffer;[Ljava/nio/ByteBuffer;)Ljava/util/ArrayList;

    .line 229
    .line 230
    .line 231
    move-result-object v12

    .line 232
    iput-object v12, v9, Lio/flutter/view/h;->y:Ljava/util/ArrayList;

    .line 233
    .line 234
    invoke-static/range {p1 .. p2}, Lio/flutter/view/i;->d(Ljava/nio/ByteBuffer;[Ljava/lang/String;)Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v12

    .line 238
    iput-object v12, v9, Lio/flutter/view/h;->z:Ljava/lang/String;

    .line 239
    .line 240
    invoke-static/range {p1 .. p2}, Lio/flutter/view/i;->d(Ljava/nio/ByteBuffer;[Ljava/lang/String;)Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v12

    .line 244
    iput-object v12, v9, Lio/flutter/view/h;->A:Ljava/lang/String;

    .line 245
    .line 246
    invoke-static/range {p1 .. p2}, Lio/flutter/view/i;->d(Ljava/nio/ByteBuffer;[Ljava/lang/String;)Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v12

    .line 250
    iput-object v12, v9, Lio/flutter/view/h;->B:Ljava/lang/String;

    .line 251
    .line 252
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 253
    .line 254
    .line 255
    move-result v12

    .line 256
    iput v12, v9, Lio/flutter/view/h;->C:I

    .line 257
    .line 258
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 259
    .line 260
    .line 261
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getFloat()F

    .line 262
    .line 263
    .line 264
    move-result v12

    .line 265
    iput v12, v9, Lio/flutter/view/h;->M:F

    .line 266
    .line 267
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getFloat()F

    .line 268
    .line 269
    .line 270
    move-result v12

    .line 271
    iput v12, v9, Lio/flutter/view/h;->N:F

    .line 272
    .line 273
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getFloat()F

    .line 274
    .line 275
    .line 276
    move-result v12

    .line 277
    iput v12, v9, Lio/flutter/view/h;->O:F

    .line 278
    .line 279
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getFloat()F

    .line 280
    .line 281
    .line 282
    move-result v12

    .line 283
    iput v12, v9, Lio/flutter/view/h;->P:F

    .line 284
    .line 285
    iget-object v12, v9, Lio/flutter/view/h;->Q:[F

    .line 286
    .line 287
    if-nez v12, :cond_1

    .line 288
    .line 289
    new-array v12, v10, [F

    .line 290
    .line 291
    :cond_1
    const/4 v13, 0x0

    .line 292
    :goto_2
    if-ge v13, v10, :cond_2

    .line 293
    .line 294
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getFloat()F

    .line 295
    .line 296
    .line 297
    move-result v17

    .line 298
    aput v17, v12, v13

    .line 299
    .line 300
    add-int/lit8 v13, v13, 0x1

    .line 301
    .line 302
    goto :goto_2

    .line 303
    :cond_2
    iput-object v12, v9, Lio/flutter/view/h;->Q:[F

    .line 304
    .line 305
    iget-object v12, v9, Lio/flutter/view/h;->R:[F

    .line 306
    .line 307
    if-nez v12, :cond_3

    .line 308
    .line 309
    new-array v12, v10, [F

    .line 310
    .line 311
    :cond_3
    const/4 v13, 0x0

    .line 312
    :goto_3
    if-ge v13, v10, :cond_4

    .line 313
    .line 314
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getFloat()F

    .line 315
    .line 316
    .line 317
    move-result v17

    .line 318
    aput v17, v12, v13

    .line 319
    .line 320
    add-int/lit8 v13, v13, 0x1

    .line 321
    .line 322
    goto :goto_3

    .line 323
    :cond_4
    iput-object v12, v9, Lio/flutter/view/h;->R:[F

    .line 324
    .line 325
    iput-boolean v11, v9, Lio/flutter/view/h;->Y:Z

    .line 326
    .line 327
    iput-boolean v11, v9, Lio/flutter/view/h;->a0:Z

    .line 328
    .line 329
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 330
    .line 331
    .line 332
    move-result v10

    .line 333
    iget-object v12, v9, Lio/flutter/view/h;->T:Ljava/util/ArrayList;

    .line 334
    .line 335
    invoke-virtual {v12}, Ljava/util/ArrayList;->clear()V

    .line 336
    .line 337
    .line 338
    const/4 v13, 0x0

    .line 339
    :goto_4
    if-ge v13, v10, :cond_5

    .line 340
    .line 341
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 342
    .line 343
    .line 344
    move-result v11

    .line 345
    invoke-virtual {v3, v11}, Lio/flutter/view/i;->c(I)Lio/flutter/view/h;

    .line 346
    .line 347
    .line 348
    move-result-object v11

    .line 349
    iput-object v9, v11, Lio/flutter/view/h;->S:Lio/flutter/view/h;

    .line 350
    .line 351
    invoke-virtual {v12, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 352
    .line 353
    .line 354
    add-int/lit8 v13, v13, 0x1

    .line 355
    .line 356
    const/4 v11, 0x1

    .line 357
    goto :goto_4

    .line 358
    :cond_5
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 359
    .line 360
    .line 361
    move-result v10

    .line 362
    invoke-virtual {v15}, Ljava/util/ArrayList;->clear()V

    .line 363
    .line 364
    .line 365
    const/4 v11, 0x0

    .line 366
    :goto_5
    if-ge v11, v10, :cond_6

    .line 367
    .line 368
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 369
    .line 370
    .line 371
    move-result v12

    .line 372
    invoke-virtual {v3, v12}, Lio/flutter/view/i;->c(I)Lio/flutter/view/h;

    .line 373
    .line 374
    .line 375
    move-result-object v12

    .line 376
    iput-object v9, v12, Lio/flutter/view/h;->S:Lio/flutter/view/h;

    .line 377
    .line 378
    invoke-virtual {v15, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 379
    .line 380
    .line 381
    add-int/lit8 v11, v11, 0x1

    .line 382
    .line 383
    goto :goto_5

    .line 384
    :cond_6
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 385
    .line 386
    .line 387
    move-result v10

    .line 388
    if-nez v10, :cond_8

    .line 389
    .line 390
    iput-object v14, v9, Lio/flutter/view/h;->V:Ljava/util/ArrayList;

    .line 391
    .line 392
    :cond_7
    const/16 v3, 0xe

    .line 393
    .line 394
    goto :goto_9

    .line 395
    :cond_8
    iget-object v11, v9, Lio/flutter/view/h;->V:Ljava/util/ArrayList;

    .line 396
    .line 397
    if-nez v11, :cond_9

    .line 398
    .line 399
    new-instance v11, Ljava/util/ArrayList;

    .line 400
    .line 401
    invoke-direct {v11, v10}, Ljava/util/ArrayList;-><init>(I)V

    .line 402
    .line 403
    .line 404
    iput-object v11, v9, Lio/flutter/view/h;->V:Ljava/util/ArrayList;

    .line 405
    .line 406
    goto :goto_6

    .line 407
    :cond_9
    invoke-virtual {v11}, Ljava/util/ArrayList;->clear()V

    .line 408
    .line 409
    .line 410
    :goto_6
    const/4 v11, 0x0

    .line 411
    :goto_7
    if-ge v11, v10, :cond_7

    .line 412
    .line 413
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 414
    .line 415
    .line 416
    move-result v12

    .line 417
    invoke-virtual {v3, v12}, Lio/flutter/view/i;->b(I)Lio/flutter/view/g;

    .line 418
    .line 419
    .line 420
    move-result-object v12

    .line 421
    iget v13, v12, Lio/flutter/view/g;->c:I

    .line 422
    .line 423
    const/4 v14, 0x1

    .line 424
    if-ne v13, v14, :cond_a

    .line 425
    .line 426
    iput-object v12, v9, Lio/flutter/view/h;->W:Lio/flutter/view/g;

    .line 427
    .line 428
    goto :goto_8

    .line 429
    :cond_a
    const/4 v14, 0x2

    .line 430
    if-ne v13, v14, :cond_b

    .line 431
    .line 432
    iput-object v12, v9, Lio/flutter/view/h;->X:Lio/flutter/view/g;

    .line 433
    .line 434
    goto :goto_8

    .line 435
    :cond_b
    iget-object v13, v9, Lio/flutter/view/h;->V:Ljava/util/ArrayList;

    .line 436
    .line 437
    invoke-virtual {v13, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 438
    .line 439
    .line 440
    :goto_8
    iget-object v13, v9, Lio/flutter/view/h;->V:Ljava/util/ArrayList;

    .line 441
    .line 442
    invoke-virtual {v13, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 443
    .line 444
    .line 445
    add-int/lit8 v11, v11, 0x1

    .line 446
    .line 447
    goto :goto_7

    .line 448
    :goto_9
    invoke-virtual {v9, v3}, Lio/flutter/view/h;->g(I)Z

    .line 449
    .line 450
    .line 451
    move-result v3

    .line 452
    if-eqz v3, :cond_c

    .line 453
    .line 454
    goto/16 :goto_1

    .line 455
    .line 456
    :cond_c
    const/4 v3, 0x6

    .line 457
    invoke-virtual {v9, v3}, Lio/flutter/view/h;->g(I)Z

    .line 458
    .line 459
    .line 460
    move-result v3

    .line 461
    if-eqz v3, :cond_d

    .line 462
    .line 463
    iput-object v9, v2, Lio/flutter/view/i;->n:Lio/flutter/view/h;

    .line 464
    .line 465
    :cond_d
    iget-boolean v3, v9, Lio/flutter/view/h;->E:Z

    .line 466
    .line 467
    if-eqz v3, :cond_e

    .line 468
    .line 469
    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 470
    .line 471
    .line 472
    :cond_e
    iget v3, v9, Lio/flutter/view/h;->i:I

    .line 473
    .line 474
    const/4 v10, -0x1

    .line 475
    if-eq v3, v10, :cond_f

    .line 476
    .line 477
    invoke-interface {v6, v3}, Lio/flutter/plugin/platform/i;->g(I)Z

    .line 478
    .line 479
    .line 480
    move-result v3

    .line 481
    if-nez v3, :cond_f

    .line 482
    .line 483
    iget v3, v9, Lio/flutter/view/h;->i:I

    .line 484
    .line 485
    invoke-interface {v6, v3}, Lio/flutter/plugin/platform/i;->h(I)Landroid/view/View;

    .line 486
    .line 487
    .line 488
    move-result-object v3

    .line 489
    if-eqz v3, :cond_f

    .line 490
    .line 491
    const/4 v9, 0x0

    .line 492
    invoke-virtual {v3, v9}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 493
    .line 494
    .line 495
    goto/16 :goto_1

    .line 496
    .line 497
    :cond_f
    const/4 v9, 0x0

    .line 498
    goto/16 :goto_1

    .line 499
    .line 500
    :cond_10
    const/4 v9, 0x0

    .line 501
    new-instance v0, Ljava/util/HashSet;

    .line 502
    .line 503
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 504
    .line 505
    .line 506
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 507
    .line 508
    .line 509
    move-result-object v1

    .line 510
    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 511
    .line 512
    .line 513
    move-result-object v1

    .line 514
    check-cast v1, Lio/flutter/view/h;

    .line 515
    .line 516
    new-instance v3, Ljava/util/ArrayList;

    .line 517
    .line 518
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 519
    .line 520
    .line 521
    if-eqz v1, :cond_11

    .line 522
    .line 523
    new-array v11, v10, [F

    .line 524
    .line 525
    invoke-static {v11, v9}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 526
    .line 527
    .line 528
    invoke-virtual {v1, v11, v0, v9}, Lio/flutter/view/h;->k([FLjava/util/HashSet;Z)V

    .line 529
    .line 530
    .line 531
    invoke-virtual {v1, v3}, Lio/flutter/view/h;->c(Ljava/util/ArrayList;)V

    .line 532
    .line 533
    .line 534
    :cond_11
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 535
    .line 536
    .line 537
    move-result v1

    .line 538
    move-object v11, v14

    .line 539
    const/4 v9, 0x0

    .line 540
    :cond_12
    :goto_a
    if-ge v9, v1, :cond_13

    .line 541
    .line 542
    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 543
    .line 544
    .line 545
    move-result-object v12

    .line 546
    add-int/lit8 v9, v9, 0x1

    .line 547
    .line 548
    check-cast v12, Lio/flutter/view/h;

    .line 549
    .line 550
    iget v13, v12, Lio/flutter/view/h;->b:I

    .line 551
    .line 552
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 553
    .line 554
    .line 555
    move-result-object v13

    .line 556
    invoke-virtual {v7, v13}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 557
    .line 558
    .line 559
    move-result v13

    .line 560
    if-nez v13, :cond_12

    .line 561
    .line 562
    move-object v11, v12

    .line 563
    goto :goto_a

    .line 564
    :cond_13
    if-nez v11, :cond_14

    .line 565
    .line 566
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    .line 567
    .line 568
    .line 569
    move-result v1

    .line 570
    if-nez v1, :cond_14

    .line 571
    .line 572
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 573
    .line 574
    .line 575
    move-result v1

    .line 576
    const/16 v17, 0x1

    .line 577
    .line 578
    add-int/lit8 v1, v1, -0x1

    .line 579
    .line 580
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 581
    .line 582
    .line 583
    move-result-object v1

    .line 584
    move-object v11, v1

    .line 585
    check-cast v11, Lio/flutter/view/h;

    .line 586
    .line 587
    :cond_14
    if-eqz v11, :cond_18

    .line 588
    .line 589
    iget v1, v11, Lio/flutter/view/h;->b:I

    .line 590
    .line 591
    iget v9, v2, Lio/flutter/view/i;->r:I

    .line 592
    .line 593
    if-ne v1, v9, :cond_15

    .line 594
    .line 595
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 596
    .line 597
    .line 598
    move-result v1

    .line 599
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 600
    .line 601
    .line 602
    move-result v9

    .line 603
    if-eq v1, v9, :cond_18

    .line 604
    .line 605
    :cond_15
    iget v1, v11, Lio/flutter/view/h;->b:I

    .line 606
    .line 607
    iput v1, v2, Lio/flutter/view/i;->r:I

    .line 608
    .line 609
    invoke-virtual {v11}, Lio/flutter/view/h;->e()Ljava/lang/String;

    .line 610
    .line 611
    .line 612
    move-result-object v1

    .line 613
    if-nez v1, :cond_16

    .line 614
    .line 615
    const-string v1, " "

    .line 616
    .line 617
    :cond_16
    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 618
    .line 619
    const/16 v12, 0x1c

    .line 620
    .line 621
    if-lt v9, v12, :cond_17

    .line 622
    .line 623
    iget-object v9, v2, Lio/flutter/view/i;->a:Landroid/view/View;

    .line 624
    .line 625
    invoke-static {v9, v1}, LQ2/a;->s(Landroid/view/View;Ljava/lang/String;)V

    .line 626
    .line 627
    .line 628
    goto :goto_b

    .line 629
    :cond_17
    iget v9, v11, Lio/flutter/view/h;->b:I

    .line 630
    .line 631
    const/16 v11, 0x20

    .line 632
    .line 633
    invoke-virtual {v2, v9, v11}, Lio/flutter/view/i;->e(II)Landroid/view/accessibility/AccessibilityEvent;

    .line 634
    .line 635
    .line 636
    move-result-object v9

    .line 637
    invoke-virtual {v9}, Landroid/view/accessibility/AccessibilityRecord;->getText()Ljava/util/List;

    .line 638
    .line 639
    .line 640
    move-result-object v11

    .line 641
    invoke-interface {v11, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 642
    .line 643
    .line 644
    invoke-virtual {v2, v9}, Lio/flutter/view/i;->i(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 645
    .line 646
    .line 647
    :cond_18
    :goto_b
    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    .line 648
    .line 649
    .line 650
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 651
    .line 652
    .line 653
    move-result v1

    .line 654
    const/4 v9, 0x0

    .line 655
    :goto_c
    if-ge v9, v1, :cond_19

    .line 656
    .line 657
    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 658
    .line 659
    .line 660
    move-result-object v11

    .line 661
    add-int/lit8 v9, v9, 0x1

    .line 662
    .line 663
    check-cast v11, Lio/flutter/view/h;

    .line 664
    .line 665
    iget v11, v11, Lio/flutter/view/h;->b:I

    .line 666
    .line 667
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 668
    .line 669
    .line 670
    move-result-object v11

    .line 671
    invoke-virtual {v7, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 672
    .line 673
    .line 674
    goto :goto_c

    .line 675
    :cond_19
    invoke-virtual {v5}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 676
    .line 677
    .line 678
    move-result-object v1

    .line 679
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 680
    .line 681
    .line 682
    move-result-object v1

    .line 683
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 684
    .line 685
    .line 686
    move-result v3

    .line 687
    const/4 v5, 0x4

    .line 688
    if-eqz v3, :cond_20

    .line 689
    .line 690
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 691
    .line 692
    .line 693
    move-result-object v3

    .line 694
    check-cast v3, Ljava/util/Map$Entry;

    .line 695
    .line 696
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 697
    .line 698
    .line 699
    move-result-object v3

    .line 700
    check-cast v3, Lio/flutter/view/h;

    .line 701
    .line 702
    invoke-virtual {v0, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 703
    .line 704
    .line 705
    move-result v7

    .line 706
    if-nez v7, :cond_1f

    .line 707
    .line 708
    iput-object v14, v3, Lio/flutter/view/h;->S:Lio/flutter/view/h;

    .line 709
    .line 710
    iget v7, v3, Lio/flutter/view/h;->i:I

    .line 711
    .line 712
    const/high16 v9, 0x10000

    .line 713
    .line 714
    const/4 v11, -0x1

    .line 715
    if-eq v7, v11, :cond_1a

    .line 716
    .line 717
    iget-object v7, v2, Lio/flutter/view/i;->j:Ljava/lang/Integer;

    .line 718
    .line 719
    if-eqz v7, :cond_1a

    .line 720
    .line 721
    iget-object v11, v2, Lio/flutter/view/i;->d:Lio/flutter/view/AccessibilityViewEmbedder;

    .line 722
    .line 723
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 724
    .line 725
    .line 726
    move-result v7

    .line 727
    invoke-virtual {v11, v7}, Lio/flutter/view/AccessibilityViewEmbedder;->platformViewOfNode(I)Landroid/view/View;

    .line 728
    .line 729
    .line 730
    move-result-object v7

    .line 731
    iget v11, v3, Lio/flutter/view/h;->i:I

    .line 732
    .line 733
    invoke-interface {v6, v11}, Lio/flutter/plugin/platform/i;->h(I)Landroid/view/View;

    .line 734
    .line 735
    .line 736
    move-result-object v11

    .line 737
    if-ne v7, v11, :cond_1a

    .line 738
    .line 739
    iget-object v7, v2, Lio/flutter/view/i;->j:Ljava/lang/Integer;

    .line 740
    .line 741
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 742
    .line 743
    .line 744
    move-result v7

    .line 745
    invoke-virtual {v2, v7, v9}, Lio/flutter/view/i;->h(II)V

    .line 746
    .line 747
    .line 748
    iput-object v14, v2, Lio/flutter/view/i;->j:Ljava/lang/Integer;

    .line 749
    .line 750
    :cond_1a
    iget v7, v3, Lio/flutter/view/h;->i:I

    .line 751
    .line 752
    const/4 v11, -0x1

    .line 753
    if-eq v7, v11, :cond_1b

    .line 754
    .line 755
    invoke-interface {v6, v7}, Lio/flutter/plugin/platform/i;->h(I)Landroid/view/View;

    .line 756
    .line 757
    .line 758
    move-result-object v7

    .line 759
    if-eqz v7, :cond_1b

    .line 760
    .line 761
    invoke-virtual {v7, v5}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 762
    .line 763
    .line 764
    :cond_1b
    iget-object v5, v2, Lio/flutter/view/i;->i:Lio/flutter/view/h;

    .line 765
    .line 766
    if-ne v5, v3, :cond_1c

    .line 767
    .line 768
    iget v5, v5, Lio/flutter/view/h;->b:I

    .line 769
    .line 770
    invoke-virtual {v2, v5, v9}, Lio/flutter/view/i;->h(II)V

    .line 771
    .line 772
    .line 773
    iput-object v14, v2, Lio/flutter/view/i;->i:Lio/flutter/view/h;

    .line 774
    .line 775
    :cond_1c
    iget-object v5, v2, Lio/flutter/view/i;->n:Lio/flutter/view/h;

    .line 776
    .line 777
    if-ne v5, v3, :cond_1d

    .line 778
    .line 779
    iput-object v14, v2, Lio/flutter/view/i;->n:Lio/flutter/view/h;

    .line 780
    .line 781
    :cond_1d
    iget-object v5, v2, Lio/flutter/view/i;->p:Lio/flutter/view/h;

    .line 782
    .line 783
    if-ne v5, v3, :cond_1e

    .line 784
    .line 785
    iput-object v14, v2, Lio/flutter/view/i;->p:Lio/flutter/view/h;

    .line 786
    .line 787
    :cond_1e
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 788
    .line 789
    .line 790
    goto :goto_d

    .line 791
    :cond_1f
    const/4 v11, -0x1

    .line 792
    goto :goto_d

    .line 793
    :cond_20
    const/16 v0, 0x800

    .line 794
    .line 795
    const/4 v9, 0x0

    .line 796
    invoke-virtual {v2, v9, v0}, Lio/flutter/view/i;->e(II)Landroid/view/accessibility/AccessibilityEvent;

    .line 797
    .line 798
    .line 799
    move-result-object v1

    .line 800
    const/4 v3, 0x1

    .line 801
    invoke-virtual {v1, v3}, Landroid/view/accessibility/AccessibilityEvent;->setContentChangeTypes(I)V

    .line 802
    .line 803
    .line 804
    invoke-virtual {v2, v1}, Lio/flutter/view/i;->i(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 805
    .line 806
    .line 807
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    .line 808
    .line 809
    .line 810
    move-result v1

    .line 811
    move v3, v9

    .line 812
    :goto_e
    if-ge v3, v1, :cond_42

    .line 813
    .line 814
    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 815
    .line 816
    .line 817
    move-result-object v6

    .line 818
    add-int/lit8 v3, v3, 0x1

    .line 819
    .line 820
    check-cast v6, Lio/flutter/view/h;

    .line 821
    .line 822
    iget v7, v6, Lio/flutter/view/h;->l:F

    .line 823
    .line 824
    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    .line 825
    .line 826
    .line 827
    move-result v7

    .line 828
    if-nez v7, :cond_2c

    .line 829
    .line 830
    iget v7, v6, Lio/flutter/view/h;->J:F

    .line 831
    .line 832
    invoke-static {v7}, Ljava/lang/Float;->isNaN(F)Z

    .line 833
    .line 834
    .line 835
    move-result v7

    .line 836
    if-nez v7, :cond_2c

    .line 837
    .line 838
    iget v7, v6, Lio/flutter/view/h;->J:F

    .line 839
    .line 840
    iget v11, v6, Lio/flutter/view/h;->l:F

    .line 841
    .line 842
    cmpl-float v7, v7, v11

    .line 843
    .line 844
    if-eqz v7, :cond_2c

    .line 845
    .line 846
    iget v7, v6, Lio/flutter/view/h;->b:I

    .line 847
    .line 848
    const/16 v11, 0x1000

    .line 849
    .line 850
    invoke-virtual {v2, v7, v11}, Lio/flutter/view/i;->e(II)Landroid/view/accessibility/AccessibilityEvent;

    .line 851
    .line 852
    .line 853
    move-result-object v7

    .line 854
    iget v11, v6, Lio/flutter/view/h;->l:F

    .line 855
    .line 856
    iget v12, v6, Lio/flutter/view/h;->m:F

    .line 857
    .line 858
    invoke-static {v12}, Ljava/lang/Float;->isInfinite(F)Z

    .line 859
    .line 860
    .line 861
    move-result v13

    .line 862
    const v15, 0x47c35000    # 100000.0f

    .line 863
    .line 864
    .line 865
    if-eqz v13, :cond_22

    .line 866
    .line 867
    const v12, 0x4788b800    # 70000.0f

    .line 868
    .line 869
    .line 870
    cmpl-float v13, v11, v12

    .line 871
    .line 872
    if-lez v13, :cond_21

    .line 873
    .line 874
    move v11, v12

    .line 875
    :cond_21
    move v12, v15

    .line 876
    :cond_22
    iget v13, v6, Lio/flutter/view/h;->n:F

    .line 877
    .line 878
    invoke-static {v13}, Ljava/lang/Float;->isInfinite(F)Z

    .line 879
    .line 880
    .line 881
    move-result v13

    .line 882
    if-eqz v13, :cond_24

    .line 883
    .line 884
    add-float/2addr v12, v15

    .line 885
    const v13, -0x38774800    # -70000.0f

    .line 886
    .line 887
    .line 888
    cmpg-float v16, v11, v13

    .line 889
    .line 890
    if-gez v16, :cond_23

    .line 891
    .line 892
    move v11, v13

    .line 893
    :cond_23
    add-float/2addr v11, v15

    .line 894
    goto :goto_f

    .line 895
    :cond_24
    iget v13, v6, Lio/flutter/view/h;->n:F

    .line 896
    .line 897
    sub-float/2addr v12, v13

    .line 898
    sub-float/2addr v11, v13

    .line 899
    :goto_f
    iget v13, v6, Lio/flutter/view/h;->G:I

    .line 900
    .line 901
    and-int/lit8 v15, v13, 0x10

    .line 902
    .line 903
    if-eqz v15, :cond_25

    .line 904
    .line 905
    goto :goto_10

    .line 906
    :cond_25
    and-int/lit8 v15, v13, 0x20

    .line 907
    .line 908
    if-eqz v15, :cond_26

    .line 909
    .line 910
    :goto_10
    float-to-int v11, v11

    .line 911
    invoke-virtual {v7, v11}, Landroid/view/accessibility/AccessibilityRecord;->setScrollY(I)V

    .line 912
    .line 913
    .line 914
    float-to-int v11, v12

    .line 915
    invoke-virtual {v7, v11}, Landroid/view/accessibility/AccessibilityRecord;->setMaxScrollY(I)V

    .line 916
    .line 917
    .line 918
    goto :goto_12

    .line 919
    :cond_26
    and-int/lit8 v15, v13, 0x4

    .line 920
    .line 921
    if-eqz v15, :cond_27

    .line 922
    .line 923
    goto :goto_11

    .line 924
    :cond_27
    and-int/lit8 v13, v13, 0x8

    .line 925
    .line 926
    if-eqz v13, :cond_28

    .line 927
    .line 928
    :goto_11
    float-to-int v11, v11

    .line 929
    invoke-virtual {v7, v11}, Landroid/view/accessibility/AccessibilityRecord;->setScrollX(I)V

    .line 930
    .line 931
    .line 932
    float-to-int v11, v12

    .line 933
    invoke-virtual {v7, v11}, Landroid/view/accessibility/AccessibilityRecord;->setMaxScrollX(I)V

    .line 934
    .line 935
    .line 936
    :cond_28
    :goto_12
    iget v11, v6, Lio/flutter/view/h;->j:I

    .line 937
    .line 938
    if-lez v11, :cond_2b

    .line 939
    .line 940
    invoke-virtual {v7, v11}, Landroid/view/accessibility/AccessibilityRecord;->setItemCount(I)V

    .line 941
    .line 942
    .line 943
    iget v11, v6, Lio/flutter/view/h;->k:I

    .line 944
    .line 945
    invoke-virtual {v7, v11}, Landroid/view/accessibility/AccessibilityRecord;->setFromIndex(I)V

    .line 946
    .line 947
    .line 948
    iget-object v11, v6, Lio/flutter/view/h;->U:Ljava/util/ArrayList;

    .line 949
    .line 950
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    .line 951
    .line 952
    .line 953
    move-result v12

    .line 954
    move v13, v9

    .line 955
    move v15, v13

    .line 956
    :goto_13
    if-ge v15, v12, :cond_2a

    .line 957
    .line 958
    invoke-virtual {v11, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 959
    .line 960
    .line 961
    move-result-object v16

    .line 962
    add-int/lit8 v15, v15, 0x1

    .line 963
    .line 964
    move-object/from16 v9, v16

    .line 965
    .line 966
    check-cast v9, Lio/flutter/view/h;

    .line 967
    .line 968
    const/16 v14, 0xe

    .line 969
    .line 970
    invoke-virtual {v9, v14}, Lio/flutter/view/h;->g(I)Z

    .line 971
    .line 972
    .line 973
    move-result v9

    .line 974
    if-nez v9, :cond_29

    .line 975
    .line 976
    add-int/lit8 v13, v13, 0x1

    .line 977
    .line 978
    :cond_29
    const/4 v9, 0x0

    .line 979
    const/4 v14, 0x0

    .line 980
    goto :goto_13

    .line 981
    :cond_2a
    const/16 v14, 0xe

    .line 982
    .line 983
    iget v9, v6, Lio/flutter/view/h;->k:I

    .line 984
    .line 985
    add-int/2addr v9, v13

    .line 986
    const/16 v17, 0x1

    .line 987
    .line 988
    add-int/lit8 v9, v9, -0x1

    .line 989
    .line 990
    invoke-virtual {v7, v9}, Landroid/view/accessibility/AccessibilityRecord;->setToIndex(I)V

    .line 991
    .line 992
    .line 993
    goto :goto_14

    .line 994
    :cond_2b
    const/16 v14, 0xe

    .line 995
    .line 996
    :goto_14
    invoke-virtual {v2, v7}, Lio/flutter/view/i;->i(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 997
    .line 998
    .line 999
    goto :goto_15

    .line 1000
    :cond_2c
    const/16 v14, 0xe

    .line 1001
    .line 1002
    :goto_15
    invoke-virtual {v6, v10}, Lio/flutter/view/h;->g(I)Z

    .line 1003
    .line 1004
    .line 1005
    move-result v7

    .line 1006
    if-eqz v7, :cond_2f

    .line 1007
    .line 1008
    iget-object v7, v6, Lio/flutter/view/h;->p:Ljava/lang/String;

    .line 1009
    .line 1010
    if-nez v7, :cond_2d

    .line 1011
    .line 1012
    iget-object v9, v6, Lio/flutter/view/h;->L:Ljava/lang/String;

    .line 1013
    .line 1014
    if-nez v9, :cond_2d

    .line 1015
    .line 1016
    goto :goto_16

    .line 1017
    :cond_2d
    if-eqz v7, :cond_2e

    .line 1018
    .line 1019
    iget-object v9, v6, Lio/flutter/view/h;->L:Ljava/lang/String;

    .line 1020
    .line 1021
    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1022
    .line 1023
    .line 1024
    move-result v7

    .line 1025
    if-nez v7, :cond_2f

    .line 1026
    .line 1027
    :cond_2e
    iget v7, v6, Lio/flutter/view/h;->b:I

    .line 1028
    .line 1029
    invoke-virtual {v2, v7, v0}, Lio/flutter/view/i;->e(II)Landroid/view/accessibility/AccessibilityEvent;

    .line 1030
    .line 1031
    .line 1032
    move-result-object v7

    .line 1033
    const/4 v9, 0x1

    .line 1034
    invoke-virtual {v7, v9}, Landroid/view/accessibility/AccessibilityEvent;->setContentChangeTypes(I)V

    .line 1035
    .line 1036
    .line 1037
    invoke-virtual {v2, v7}, Lio/flutter/view/i;->i(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 1038
    .line 1039
    .line 1040
    :cond_2f
    :goto_16
    iget-object v7, v2, Lio/flutter/view/i;->i:Lio/flutter/view/h;

    .line 1041
    .line 1042
    if-eqz v7, :cond_31

    .line 1043
    .line 1044
    iget v7, v7, Lio/flutter/view/h;->b:I

    .line 1045
    .line 1046
    iget v9, v6, Lio/flutter/view/h;->b:I

    .line 1047
    .line 1048
    if-ne v7, v9, :cond_31

    .line 1049
    .line 1050
    move/from16 p2, v1

    .line 1051
    .line 1052
    iget-wide v0, v6, Lio/flutter/view/h;->F:J

    .line 1053
    .line 1054
    const/4 v7, 0x3

    .line 1055
    invoke-static {v7}, LE1/j;->g(I)I

    .line 1056
    .line 1057
    .line 1058
    move-result v9

    .line 1059
    const-wide/16 v18, 0x0

    .line 1060
    .line 1061
    int-to-long v11, v9

    .line 1062
    and-long/2addr v0, v11

    .line 1063
    cmp-long v0, v0, v18

    .line 1064
    .line 1065
    if-eqz v0, :cond_30

    .line 1066
    .line 1067
    goto :goto_17

    .line 1068
    :cond_30
    invoke-virtual {v6, v7}, Lio/flutter/view/h;->g(I)Z

    .line 1069
    .line 1070
    .line 1071
    move-result v0

    .line 1072
    if-eqz v0, :cond_32

    .line 1073
    .line 1074
    iget v0, v6, Lio/flutter/view/h;->b:I

    .line 1075
    .line 1076
    invoke-virtual {v2, v0, v5}, Lio/flutter/view/i;->e(II)Landroid/view/accessibility/AccessibilityEvent;

    .line 1077
    .line 1078
    .line 1079
    move-result-object v0

    .line 1080
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityRecord;->getText()Ljava/util/List;

    .line 1081
    .line 1082
    .line 1083
    move-result-object v1

    .line 1084
    iget-object v7, v6, Lio/flutter/view/h;->p:Ljava/lang/String;

    .line 1085
    .line 1086
    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1087
    .line 1088
    .line 1089
    invoke-virtual {v2, v0}, Lio/flutter/view/i;->i(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 1090
    .line 1091
    .line 1092
    goto :goto_17

    .line 1093
    :cond_31
    move/from16 p2, v1

    .line 1094
    .line 1095
    const-wide/16 v18, 0x0

    .line 1096
    .line 1097
    :cond_32
    :goto_17
    iget-object v0, v2, Lio/flutter/view/i;->n:Lio/flutter/view/h;

    .line 1098
    .line 1099
    if-eqz v0, :cond_35

    .line 1100
    .line 1101
    iget v1, v0, Lio/flutter/view/h;->b:I

    .line 1102
    .line 1103
    iget v7, v6, Lio/flutter/view/h;->b:I

    .line 1104
    .line 1105
    if-ne v1, v7, :cond_35

    .line 1106
    .line 1107
    iget-object v9, v2, Lio/flutter/view/i;->o:Lio/flutter/view/h;

    .line 1108
    .line 1109
    if-eqz v9, :cond_33

    .line 1110
    .line 1111
    iget v9, v9, Lio/flutter/view/h;->b:I

    .line 1112
    .line 1113
    if-eq v9, v1, :cond_35

    .line 1114
    .line 1115
    :cond_33
    iput-object v0, v2, Lio/flutter/view/i;->o:Lio/flutter/view/h;

    .line 1116
    .line 1117
    const/16 v0, 0x8

    .line 1118
    .line 1119
    invoke-virtual {v2, v7, v0}, Lio/flutter/view/i;->e(II)Landroid/view/accessibility/AccessibilityEvent;

    .line 1120
    .line 1121
    .line 1122
    move-result-object v0

    .line 1123
    invoke-virtual {v2, v0}, Lio/flutter/view/i;->i(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 1124
    .line 1125
    .line 1126
    :cond_34
    const/4 v0, 0x0

    .line 1127
    goto :goto_18

    .line 1128
    :cond_35
    if-nez v0, :cond_34

    .line 1129
    .line 1130
    const/4 v0, 0x0

    .line 1131
    iput-object v0, v2, Lio/flutter/view/i;->o:Lio/flutter/view/h;

    .line 1132
    .line 1133
    :goto_18
    iget-object v1, v2, Lio/flutter/view/i;->n:Lio/flutter/view/h;

    .line 1134
    .line 1135
    if-eqz v1, :cond_36

    .line 1136
    .line 1137
    iget v1, v1, Lio/flutter/view/h;->b:I

    .line 1138
    .line 1139
    iget v7, v6, Lio/flutter/view/h;->b:I

    .line 1140
    .line 1141
    if-ne v1, v7, :cond_36

    .line 1142
    .line 1143
    iget-wide v11, v6, Lio/flutter/view/h;->F:J

    .line 1144
    .line 1145
    const/4 v1, 0x5

    .line 1146
    invoke-static {v1}, LE1/j;->g(I)I

    .line 1147
    .line 1148
    .line 1149
    move-result v7

    .line 1150
    int-to-long v14, v7

    .line 1151
    and-long/2addr v11, v14

    .line 1152
    cmp-long v7, v11, v18

    .line 1153
    .line 1154
    if-eqz v7, :cond_36

    .line 1155
    .line 1156
    invoke-virtual {v6, v1}, Lio/flutter/view/h;->g(I)Z

    .line 1157
    .line 1158
    .line 1159
    move-result v1

    .line 1160
    if-eqz v1, :cond_36

    .line 1161
    .line 1162
    iget-object v1, v2, Lio/flutter/view/i;->i:Lio/flutter/view/h;

    .line 1163
    .line 1164
    if-eqz v1, :cond_37

    .line 1165
    .line 1166
    iget v1, v1, Lio/flutter/view/h;->b:I

    .line 1167
    .line 1168
    iget-object v7, v2, Lio/flutter/view/i;->n:Lio/flutter/view/h;

    .line 1169
    .line 1170
    iget v7, v7, Lio/flutter/view/h;->b:I

    .line 1171
    .line 1172
    if-ne v1, v7, :cond_36

    .line 1173
    .line 1174
    goto :goto_19

    .line 1175
    :cond_36
    const/16 v17, 0x1

    .line 1176
    .line 1177
    goto/16 :goto_20

    .line 1178
    .line 1179
    :cond_37
    :goto_19
    iget-object v1, v6, Lio/flutter/view/h;->K:Ljava/lang/String;

    .line 1180
    .line 1181
    const-string v7, ""

    .line 1182
    .line 1183
    if-eqz v1, :cond_38

    .line 1184
    .line 1185
    goto :goto_1a

    .line 1186
    :cond_38
    move-object v1, v7

    .line 1187
    :goto_1a
    iget-object v9, v6, Lio/flutter/view/h;->r:Ljava/lang/String;

    .line 1188
    .line 1189
    if-eqz v9, :cond_39

    .line 1190
    .line 1191
    move-object v7, v9

    .line 1192
    :cond_39
    iget v9, v6, Lio/flutter/view/h;->b:I

    .line 1193
    .line 1194
    invoke-virtual {v2, v9, v10}, Lio/flutter/view/i;->e(II)Landroid/view/accessibility/AccessibilityEvent;

    .line 1195
    .line 1196
    .line 1197
    move-result-object v9

    .line 1198
    invoke-virtual {v9, v1}, Landroid/view/accessibility/AccessibilityRecord;->setBeforeText(Ljava/lang/CharSequence;)V

    .line 1199
    .line 1200
    .line 1201
    invoke-virtual {v9}, Landroid/view/accessibility/AccessibilityRecord;->getText()Ljava/util/List;

    .line 1202
    .line 1203
    .line 1204
    move-result-object v11

    .line 1205
    invoke-interface {v11, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1206
    .line 1207
    .line 1208
    const/4 v11, 0x0

    .line 1209
    :goto_1b
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 1210
    .line 1211
    .line 1212
    move-result v12

    .line 1213
    if-ge v11, v12, :cond_3b

    .line 1214
    .line 1215
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 1216
    .line 1217
    .line 1218
    move-result v12

    .line 1219
    if-ge v11, v12, :cond_3b

    .line 1220
    .line 1221
    invoke-virtual {v1, v11}, Ljava/lang/String;->charAt(I)C

    .line 1222
    .line 1223
    .line 1224
    move-result v12

    .line 1225
    invoke-virtual {v7, v11}, Ljava/lang/String;->charAt(I)C

    .line 1226
    .line 1227
    .line 1228
    move-result v13

    .line 1229
    if-eq v12, v13, :cond_3a

    .line 1230
    .line 1231
    goto :goto_1c

    .line 1232
    :cond_3a
    add-int/lit8 v11, v11, 0x1

    .line 1233
    .line 1234
    goto :goto_1b

    .line 1235
    :cond_3b
    :goto_1c
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 1236
    .line 1237
    .line 1238
    move-result v12

    .line 1239
    if-lt v11, v12, :cond_3c

    .line 1240
    .line 1241
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 1242
    .line 1243
    .line 1244
    move-result v12

    .line 1245
    if-lt v11, v12, :cond_3c

    .line 1246
    .line 1247
    move-object v9, v0

    .line 1248
    const/16 v17, 0x1

    .line 1249
    .line 1250
    goto :goto_1f

    .line 1251
    :cond_3c
    invoke-virtual {v9, v11}, Landroid/view/accessibility/AccessibilityRecord;->setFromIndex(I)V

    .line 1252
    .line 1253
    .line 1254
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 1255
    .line 1256
    .line 1257
    move-result v12

    .line 1258
    const/16 v17, 0x1

    .line 1259
    .line 1260
    add-int/lit8 v12, v12, -0x1

    .line 1261
    .line 1262
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 1263
    .line 1264
    .line 1265
    move-result v13

    .line 1266
    add-int/lit8 v13, v13, -0x1

    .line 1267
    .line 1268
    :goto_1d
    if-lt v12, v11, :cond_3e

    .line 1269
    .line 1270
    if-lt v13, v11, :cond_3e

    .line 1271
    .line 1272
    invoke-virtual {v1, v12}, Ljava/lang/String;->charAt(I)C

    .line 1273
    .line 1274
    .line 1275
    move-result v14

    .line 1276
    invoke-virtual {v7, v13}, Ljava/lang/String;->charAt(I)C

    .line 1277
    .line 1278
    .line 1279
    move-result v15

    .line 1280
    if-eq v14, v15, :cond_3d

    .line 1281
    .line 1282
    goto :goto_1e

    .line 1283
    :cond_3d
    add-int/lit8 v12, v12, -0x1

    .line 1284
    .line 1285
    add-int/lit8 v13, v13, -0x1

    .line 1286
    .line 1287
    goto :goto_1d

    .line 1288
    :cond_3e
    :goto_1e
    sub-int/2addr v12, v11

    .line 1289
    const/16 v17, 0x1

    .line 1290
    .line 1291
    add-int/lit8 v12, v12, 0x1

    .line 1292
    .line 1293
    invoke-virtual {v9, v12}, Landroid/view/accessibility/AccessibilityRecord;->setRemovedCount(I)V

    .line 1294
    .line 1295
    .line 1296
    sub-int/2addr v13, v11

    .line 1297
    add-int/lit8 v13, v13, 0x1

    .line 1298
    .line 1299
    invoke-virtual {v9, v13}, Landroid/view/accessibility/AccessibilityRecord;->setAddedCount(I)V

    .line 1300
    .line 1301
    .line 1302
    :goto_1f
    if-eqz v9, :cond_3f

    .line 1303
    .line 1304
    invoke-virtual {v2, v9}, Lio/flutter/view/i;->i(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 1305
    .line 1306
    .line 1307
    :cond_3f
    iget v1, v6, Lio/flutter/view/h;->H:I

    .line 1308
    .line 1309
    iget v9, v6, Lio/flutter/view/h;->g:I

    .line 1310
    .line 1311
    if-ne v1, v9, :cond_40

    .line 1312
    .line 1313
    iget v1, v6, Lio/flutter/view/h;->I:I

    .line 1314
    .line 1315
    iget v9, v6, Lio/flutter/view/h;->h:I

    .line 1316
    .line 1317
    if-eq v1, v9, :cond_41

    .line 1318
    .line 1319
    :cond_40
    iget v1, v6, Lio/flutter/view/h;->b:I

    .line 1320
    .line 1321
    const/16 v9, 0x2000

    .line 1322
    .line 1323
    invoke-virtual {v2, v1, v9}, Lio/flutter/view/i;->e(II)Landroid/view/accessibility/AccessibilityEvent;

    .line 1324
    .line 1325
    .line 1326
    move-result-object v1

    .line 1327
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityRecord;->getText()Ljava/util/List;

    .line 1328
    .line 1329
    .line 1330
    move-result-object v9

    .line 1331
    invoke-interface {v9, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1332
    .line 1333
    .line 1334
    iget v9, v6, Lio/flutter/view/h;->g:I

    .line 1335
    .line 1336
    invoke-virtual {v1, v9}, Landroid/view/accessibility/AccessibilityRecord;->setFromIndex(I)V

    .line 1337
    .line 1338
    .line 1339
    iget v6, v6, Lio/flutter/view/h;->h:I

    .line 1340
    .line 1341
    invoke-virtual {v1, v6}, Landroid/view/accessibility/AccessibilityRecord;->setToIndex(I)V

    .line 1342
    .line 1343
    .line 1344
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 1345
    .line 1346
    .line 1347
    move-result v6

    .line 1348
    invoke-virtual {v1, v6}, Landroid/view/accessibility/AccessibilityRecord;->setItemCount(I)V

    .line 1349
    .line 1350
    .line 1351
    invoke-virtual {v2, v1}, Lio/flutter/view/i;->i(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 1352
    .line 1353
    .line 1354
    :cond_41
    :goto_20
    move/from16 v1, p2

    .line 1355
    .line 1356
    move-object v14, v0

    .line 1357
    const/16 v0, 0x800

    .line 1358
    .line 1359
    const/4 v9, 0x0

    .line 1360
    goto/16 :goto_e

    .line 1361
    .line 1362
    :cond_42
    return-void
.end method
