.class public final LZ2/a;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final f:Landroid/graphics/Matrix;


# instance fields
.field public final a:Lio/flutter/embedding/engine/renderer/j;

.field public final b:LZ2/s;

.field public final c:Z

.field public final d:Ljava/util/HashMap;

.field public e:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LZ2/a;->f:Landroid/graphics/Matrix;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Lio/flutter/embedding/engine/renderer/j;Z)V
    .locals 1

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
    iput-object v0, p0, LZ2/a;->d:Ljava/util/HashMap;

    .line 10
    .line 11
    iput-object p1, p0, LZ2/a;->a:Lio/flutter/embedding/engine/renderer/j;

    .line 12
    .line 13
    sget-object p1, LZ2/s;->h:LZ2/s;

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    new-instance p1, LZ2/s;

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    invoke-direct {p1, v0}, LZ2/s;-><init>(I)V

    .line 21
    .line 22
    .line 23
    sput-object p1, LZ2/s;->h:LZ2/s;

    .line 24
    .line 25
    :cond_0
    sget-object p1, LZ2/s;->h:LZ2/s;

    .line 26
    .line 27
    iput-object p1, p0, LZ2/a;->b:LZ2/s;

    .line 28
    .line 29
    iput-boolean p2, p0, LZ2/a;->c:Z

    .line 30
    .line 31
    return-void
.end method

.method public static b(I)I
    .locals 2

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    const/4 v0, 0x1

    .line 5
    const/4 v1, 0x6

    .line 6
    if-ne p0, v0, :cond_1

    .line 7
    .line 8
    goto :goto_1

    .line 9
    :cond_1
    const/4 v0, 0x5

    .line 10
    if-ne p0, v0, :cond_2

    .line 11
    .line 12
    :goto_0
    const/4 p0, 0x4

    .line 13
    return p0

    .line 14
    :cond_2
    if-ne p0, v1, :cond_3

    .line 15
    .line 16
    :goto_1
    return v1

    .line 17
    :cond_3
    const/4 v1, 0x2

    .line 18
    if-ne p0, v1, :cond_4

    .line 19
    .line 20
    return v0

    .line 21
    :cond_4
    const/4 v0, 0x7

    .line 22
    const/4 v1, 0x3

    .line 23
    if-ne p0, v0, :cond_5

    .line 24
    .line 25
    goto :goto_2

    .line 26
    :cond_5
    if-ne p0, v1, :cond_6

    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :cond_6
    const/16 v0, 0x8

    .line 31
    .line 32
    if-ne p0, v0, :cond_7

    .line 33
    .line 34
    :goto_2
    return v1

    .line 35
    :cond_7
    const/4 p0, -0x1

    .line 36
    return p0
.end method


# virtual methods
.method public final a(Landroid/view/MotionEvent;IIILandroid/graphics/Matrix;Ljava/nio/ByteBuffer;Landroid/content/Context;)V
    .locals 28

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v2, p2

    .line 4
    .line 5
    move/from16 v3, p3

    .line 6
    .line 7
    move-object/from16 v4, p6

    .line 8
    .line 9
    move-object/from16 v5, p7

    .line 10
    .line 11
    const/4 v6, -0x1

    .line 12
    if-ne v3, v6, :cond_0

    .line 13
    .line 14
    :goto_0
    move-object v7, v0

    .line 15
    goto/16 :goto_13

    .line 16
    .line 17
    :cond_0
    invoke-virtual/range {p1 .. p2}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 18
    .line 19
    .line 20
    move-result v7

    .line 21
    const/4 v8, 0x3

    .line 22
    shl-int/2addr v7, v8

    .line 23
    invoke-virtual/range {p1 .. p2}, Landroid/view/MotionEvent;->getToolType(I)I

    .line 24
    .line 25
    .line 26
    move-result v9

    .line 27
    const/4 v10, 0x7

    .line 28
    and-int/2addr v9, v10

    .line 29
    or-int/2addr v7, v9

    .line 30
    invoke-virtual/range {p1 .. p2}, Landroid/view/MotionEvent;->getToolType(I)I

    .line 31
    .line 32
    .line 33
    move-result v9

    .line 34
    const/4 v11, 0x5

    .line 35
    const/4 v12, 0x4

    .line 36
    const/4 v13, 0x2

    .line 37
    const/4 v14, 0x0

    .line 38
    const/4 v15, 0x1

    .line 39
    if-eq v9, v15, :cond_3

    .line 40
    .line 41
    if-eq v9, v13, :cond_2

    .line 42
    .line 43
    if-eq v9, v8, :cond_1

    .line 44
    .line 45
    if-eq v9, v12, :cond_4

    .line 46
    .line 47
    move v8, v11

    .line 48
    goto :goto_1

    .line 49
    :cond_1
    move v8, v15

    .line 50
    goto :goto_1

    .line 51
    :cond_2
    move v8, v13

    .line 52
    goto :goto_1

    .line 53
    :cond_3
    move v8, v14

    .line 54
    :cond_4
    :goto_1
    invoke-virtual/range {p1 .. p2}, Landroid/view/MotionEvent;->getX(I)F

    .line 55
    .line 56
    .line 57
    move-result v9

    .line 58
    invoke-virtual/range {p1 .. p2}, Landroid/view/MotionEvent;->getY(I)F

    .line 59
    .line 60
    .line 61
    move-result v16

    .line 62
    new-array v10, v13, [F

    .line 63
    .line 64
    aput v9, v10, v14

    .line 65
    .line 66
    aput v16, v10, v15

    .line 67
    .line 68
    move-object/from16 v9, p5

    .line 69
    .line 70
    invoke-virtual {v9, v10}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 71
    .line 72
    .line 73
    iget-object v9, v0, LZ2/a;->d:Ljava/util/HashMap;

    .line 74
    .line 75
    move/from16 v17, v7

    .line 76
    .line 77
    if-ne v8, v15, :cond_6

    .line 78
    .line 79
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getButtonState()I

    .line 80
    .line 81
    .line 82
    move-result v18

    .line 83
    move/from16 v19, v14

    .line 84
    .line 85
    and-int/lit8 v14, v18, 0x1f

    .line 86
    .line 87
    const-wide/16 v20, 0x0

    .line 88
    .line 89
    int-to-long v6, v14

    .line 90
    cmp-long v14, v6, v20

    .line 91
    .line 92
    if-nez v14, :cond_5

    .line 93
    .line 94
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getSource()I

    .line 95
    .line 96
    .line 97
    move-result v14

    .line 98
    move/from16 v18, v15

    .line 99
    .line 100
    const/16 v15, 0x2002

    .line 101
    .line 102
    if-ne v14, v15, :cond_8

    .line 103
    .line 104
    if-ne v3, v12, :cond_8

    .line 105
    .line 106
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 107
    .line 108
    .line 109
    move-result-object v14

    .line 110
    invoke-virtual {v9, v14, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_5
    move/from16 v18, v15

    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_6
    move/from16 v19, v14

    .line 118
    .line 119
    move/from16 v18, v15

    .line 120
    .line 121
    const-wide/16 v20, 0x0

    .line 122
    .line 123
    if-ne v8, v13, :cond_7

    .line 124
    .line 125
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getButtonState()I

    .line 126
    .line 127
    .line 128
    move-result v6

    .line 129
    shr-int/2addr v6, v12

    .line 130
    and-int/lit8 v6, v6, 0xf

    .line 131
    .line 132
    int-to-long v6, v6

    .line 133
    goto :goto_2

    .line 134
    :cond_7
    move-wide/from16 v6, v20

    .line 135
    .line 136
    :cond_8
    :goto_2
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 137
    .line 138
    .line 139
    move-result-object v14

    .line 140
    invoke-virtual {v9, v14}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v14

    .line 144
    if-eqz v14, :cond_d

    .line 145
    .line 146
    if-ne v3, v12, :cond_9

    .line 147
    .line 148
    const/4 v11, 0x7

    .line 149
    :goto_3
    const/4 v12, -0x1

    .line 150
    goto :goto_5

    .line 151
    :cond_9
    if-ne v3, v11, :cond_a

    .line 152
    .line 153
    const/16 v11, 0x8

    .line 154
    .line 155
    goto :goto_3

    .line 156
    :cond_a
    const/4 v11, 0x6

    .line 157
    if-eq v3, v11, :cond_c

    .line 158
    .line 159
    if-nez v3, :cond_b

    .line 160
    .line 161
    goto :goto_4

    .line 162
    :cond_b
    const/4 v11, -0x1

    .line 163
    goto :goto_3

    .line 164
    :cond_c
    :goto_4
    const/16 v11, 0x9

    .line 165
    .line 166
    goto :goto_3

    .line 167
    :goto_5
    if-ne v11, v12, :cond_e

    .line 168
    .line 169
    goto/16 :goto_0

    .line 170
    .line 171
    :cond_d
    const/4 v12, -0x1

    .line 172
    move v11, v12

    .line 173
    :cond_e
    iget-boolean v12, v0, LZ2/a;->c:Z

    .line 174
    .line 175
    if-eqz v12, :cond_f

    .line 176
    .line 177
    iget-object v12, v0, LZ2/a;->b:LZ2/s;

    .line 178
    .line 179
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 180
    .line 181
    .line 182
    sget-object v16, LZ2/D;->b:Ljava/util/concurrent/atomic/AtomicLong;

    .line 183
    .line 184
    move/from16 v22, v14

    .line 185
    .line 186
    invoke-virtual/range {v16 .. v16}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    .line 187
    .line 188
    .line 189
    move-result-wide v13

    .line 190
    new-instance v16, LZ2/D;

    .line 191
    .line 192
    invoke-static/range {p1 .. p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 193
    .line 194
    .line 195
    move-result-object v15

    .line 196
    move-object/from16 v23, v10

    .line 197
    .line 198
    iget-object v10, v12, LZ2/s;->f:Ljava/lang/Object;

    .line 199
    .line 200
    check-cast v10, Landroid/util/LongSparseArray;

    .line 201
    .line 202
    invoke-virtual {v10, v13, v14, v15}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    .line 203
    .line 204
    .line 205
    iget-object v10, v12, LZ2/s;->g:Ljava/lang/Object;

    .line 206
    .line 207
    check-cast v10, Ljava/util/PriorityQueue;

    .line 208
    .line 209
    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 210
    .line 211
    .line 212
    move-result-object v12

    .line 213
    invoke-virtual {v10, v12}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    goto :goto_6

    .line 217
    :cond_f
    move-object/from16 v23, v10

    .line 218
    .line 219
    move/from16 v22, v14

    .line 220
    .line 221
    move-wide/from16 v13, v20

    .line 222
    .line 223
    :goto_6
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 224
    .line 225
    .line 226
    move-result v10

    .line 227
    const/16 v12, 0x8

    .line 228
    .line 229
    if-ne v10, v12, :cond_10

    .line 230
    .line 231
    move/from16 v10, v18

    .line 232
    .line 233
    goto :goto_7

    .line 234
    :cond_10
    move/from16 v10, v19

    .line 235
    .line 236
    :goto_7
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    .line 237
    .line 238
    .line 239
    move-result-wide v24

    .line 240
    const-wide/16 v26, 0x3e8

    .line 241
    .line 242
    mul-long v0, v24, v26

    .line 243
    .line 244
    invoke-virtual {v4, v13, v14}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 245
    .line 246
    .line 247
    invoke-virtual {v4, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 248
    .line 249
    .line 250
    if-eqz v22, :cond_11

    .line 251
    .line 252
    int-to-long v0, v11

    .line 253
    invoke-virtual {v4, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 254
    .line 255
    .line 256
    const-wide/16 v0, 0x4

    .line 257
    .line 258
    invoke-virtual {v4, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 259
    .line 260
    .line 261
    goto :goto_8

    .line 262
    :cond_11
    int-to-long v0, v3

    .line 263
    invoke-virtual {v4, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 264
    .line 265
    .line 266
    int-to-long v0, v8

    .line 267
    invoke-virtual {v4, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 268
    .line 269
    .line 270
    :goto_8
    int-to-long v0, v10

    .line 271
    invoke-virtual {v4, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 272
    .line 273
    .line 274
    move/from16 v0, v17

    .line 275
    .line 276
    int-to-long v12, v0

    .line 277
    invoke-virtual {v4, v12, v13}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 278
    .line 279
    .line 280
    move-wide/from16 v12, v20

    .line 281
    .line 282
    invoke-virtual {v4, v12, v13}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 283
    .line 284
    .line 285
    if-eqz v22, :cond_12

    .line 286
    .line 287
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 288
    .line 289
    .line 290
    move-result-object v1

    .line 291
    invoke-virtual {v9, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    .line 293
    .line 294
    move-result-object v1

    .line 295
    check-cast v1, [F

    .line 296
    .line 297
    aget v3, v1, v19

    .line 298
    .line 299
    float-to-double v12, v3

    .line 300
    invoke-virtual {v4, v12, v13}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 301
    .line 302
    .line 303
    aget v1, v1, v18

    .line 304
    .line 305
    float-to-double v12, v1

    .line 306
    invoke-virtual {v4, v12, v13}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 307
    .line 308
    .line 309
    goto :goto_9

    .line 310
    :cond_12
    aget v1, v23, v19

    .line 311
    .line 312
    float-to-double v12, v1

    .line 313
    invoke-virtual {v4, v12, v13}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 314
    .line 315
    .line 316
    aget v1, v23, v18

    .line 317
    .line 318
    float-to-double v12, v1

    .line 319
    invoke-virtual {v4, v12, v13}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 320
    .line 321
    .line 322
    :goto_9
    const-wide/16 v12, 0x0

    .line 323
    .line 324
    invoke-virtual {v4, v12, v13}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 325
    .line 326
    .line 327
    invoke-virtual {v4, v12, v13}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 328
    .line 329
    .line 330
    invoke-virtual {v4, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 331
    .line 332
    .line 333
    const-wide/16 v6, 0x0

    .line 334
    .line 335
    invoke-virtual {v4, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 336
    .line 337
    .line 338
    invoke-virtual {v4, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 339
    .line 340
    .line 341
    invoke-virtual/range {p1 .. p2}, Landroid/view/MotionEvent;->getPressure(I)F

    .line 342
    .line 343
    .line 344
    move-result v1

    .line 345
    float-to-double v6, v1

    .line 346
    invoke-virtual {v4, v6, v7}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 347
    .line 348
    .line 349
    invoke-virtual/range {p1 .. p1}, Landroid/view/InputEvent;->getDevice()Landroid/view/InputDevice;

    .line 350
    .line 351
    .line 352
    move-result-object v1

    .line 353
    if-eqz v1, :cond_13

    .line 354
    .line 355
    invoke-virtual/range {p1 .. p1}, Landroid/view/InputEvent;->getDevice()Landroid/view/InputDevice;

    .line 356
    .line 357
    .line 358
    move-result-object v1

    .line 359
    const/4 v3, 0x2

    .line 360
    invoke-virtual {v1, v3}, Landroid/view/InputDevice;->getMotionRange(I)Landroid/view/InputDevice$MotionRange;

    .line 361
    .line 362
    .line 363
    move-result-object v1

    .line 364
    if-eqz v1, :cond_13

    .line 365
    .line 366
    invoke-virtual {v1}, Landroid/view/InputDevice$MotionRange;->getMin()F

    .line 367
    .line 368
    .line 369
    move-result v3

    .line 370
    float-to-double v14, v3

    .line 371
    invoke-virtual {v1}, Landroid/view/InputDevice$MotionRange;->getMax()F

    .line 372
    .line 373
    .line 374
    move-result v1

    .line 375
    float-to-double v6, v1

    .line 376
    goto :goto_a

    .line 377
    :cond_13
    move-wide v14, v12

    .line 378
    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    .line 379
    .line 380
    :goto_a
    invoke-virtual {v4, v14, v15}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 381
    .line 382
    .line 383
    invoke-virtual {v4, v6, v7}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 384
    .line 385
    .line 386
    const/4 v3, 0x2

    .line 387
    if-ne v8, v3, :cond_14

    .line 388
    .line 389
    const/16 v1, 0x18

    .line 390
    .line 391
    move-object/from16 v3, p1

    .line 392
    .line 393
    invoke-virtual {v3, v1, v2}, Landroid/view/MotionEvent;->getAxisValue(II)F

    .line 394
    .line 395
    .line 396
    move-result v1

    .line 397
    float-to-double v6, v1

    .line 398
    invoke-virtual {v4, v6, v7}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 399
    .line 400
    .line 401
    invoke-virtual {v4, v12, v13}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 402
    .line 403
    .line 404
    goto :goto_b

    .line 405
    :cond_14
    move-object/from16 v3, p1

    .line 406
    .line 407
    invoke-virtual {v4, v12, v13}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 408
    .line 409
    .line 410
    invoke-virtual {v4, v12, v13}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 411
    .line 412
    .line 413
    :goto_b
    invoke-virtual/range {p1 .. p2}, Landroid/view/MotionEvent;->getSize(I)F

    .line 414
    .line 415
    .line 416
    move-result v1

    .line 417
    float-to-double v6, v1

    .line 418
    invoke-virtual {v4, v6, v7}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 419
    .line 420
    .line 421
    invoke-virtual/range {p1 .. p2}, Landroid/view/MotionEvent;->getToolMajor(I)F

    .line 422
    .line 423
    .line 424
    move-result v1

    .line 425
    float-to-double v6, v1

    .line 426
    invoke-virtual {v4, v6, v7}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 427
    .line 428
    .line 429
    invoke-virtual/range {p1 .. p2}, Landroid/view/MotionEvent;->getToolMinor(I)F

    .line 430
    .line 431
    .line 432
    move-result v1

    .line 433
    float-to-double v6, v1

    .line 434
    invoke-virtual {v4, v6, v7}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 435
    .line 436
    .line 437
    invoke-virtual {v4, v12, v13}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 438
    .line 439
    .line 440
    invoke-virtual {v4, v12, v13}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 441
    .line 442
    .line 443
    const/16 v1, 0x8

    .line 444
    .line 445
    invoke-virtual {v3, v1, v2}, Landroid/view/MotionEvent;->getAxisValue(II)F

    .line 446
    .line 447
    .line 448
    move-result v1

    .line 449
    float-to-double v6, v1

    .line 450
    invoke-virtual {v4, v6, v7}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 451
    .line 452
    .line 453
    const/4 v1, 0x2

    .line 454
    if-ne v8, v1, :cond_15

    .line 455
    .line 456
    const/16 v1, 0x19

    .line 457
    .line 458
    invoke-virtual {v3, v1, v2}, Landroid/view/MotionEvent;->getAxisValue(II)F

    .line 459
    .line 460
    .line 461
    move-result v1

    .line 462
    float-to-double v6, v1

    .line 463
    invoke-virtual {v4, v6, v7}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 464
    .line 465
    .line 466
    :goto_c
    move/from16 v1, p4

    .line 467
    .line 468
    goto :goto_d

    .line 469
    :cond_15
    invoke-virtual {v4, v12, v13}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 470
    .line 471
    .line 472
    goto :goto_c

    .line 473
    :goto_d
    int-to-long v6, v1

    .line 474
    invoke-virtual {v4, v6, v7}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 475
    .line 476
    .line 477
    move/from16 v1, v18

    .line 478
    .line 479
    if-ne v10, v1, :cond_19

    .line 480
    .line 481
    if-eqz v5, :cond_18

    .line 482
    .line 483
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 484
    .line 485
    const/16 v6, 0x1a

    .line 486
    .line 487
    if-lt v1, v6, :cond_16

    .line 488
    .line 489
    invoke-static {v5}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 490
    .line 491
    .line 492
    move-result-object v7

    .line 493
    invoke-static {v7}, LB/a;->y(Landroid/view/ViewConfiguration;)F

    .line 494
    .line 495
    .line 496
    move-result v7

    .line 497
    move v8, v7

    .line 498
    move-object/from16 v7, p0

    .line 499
    .line 500
    goto :goto_e

    .line 501
    :cond_16
    move-object/from16 v7, p0

    .line 502
    .line 503
    invoke-virtual {v7, v5}, LZ2/a;->c(Landroid/content/Context;)I

    .line 504
    .line 505
    .line 506
    move-result v8

    .line 507
    int-to-float v8, v8

    .line 508
    :goto_e
    float-to-double v14, v8

    .line 509
    if-lt v1, v6, :cond_17

    .line 510
    .line 511
    invoke-static {v5}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 512
    .line 513
    .line 514
    move-result-object v1

    .line 515
    invoke-static {v1}, LB/a;->a(Landroid/view/ViewConfiguration;)F

    .line 516
    .line 517
    .line 518
    move-result v1

    .line 519
    goto :goto_f

    .line 520
    :cond_17
    invoke-virtual {v7, v5}, LZ2/a;->c(Landroid/content/Context;)I

    .line 521
    .line 522
    .line 523
    move-result v1

    .line 524
    int-to-float v1, v1

    .line 525
    :goto_f
    float-to-double v5, v1

    .line 526
    goto :goto_10

    .line 527
    :cond_18
    move-object/from16 v7, p0

    .line 528
    .line 529
    const-wide/high16 v14, 0x4048000000000000L    # 48.0

    .line 530
    .line 531
    move-wide v5, v14

    .line 532
    :goto_10
    const/16 v1, 0xa

    .line 533
    .line 534
    invoke-virtual {v3, v1, v2}, Landroid/view/MotionEvent;->getAxisValue(II)F

    .line 535
    .line 536
    .line 537
    move-result v1

    .line 538
    neg-float v1, v1

    .line 539
    float-to-double v12, v1

    .line 540
    mul-double/2addr v14, v12

    .line 541
    const/16 v1, 0x9

    .line 542
    .line 543
    invoke-virtual {v3, v1, v2}, Landroid/view/MotionEvent;->getAxisValue(II)F

    .line 544
    .line 545
    .line 546
    move-result v2

    .line 547
    neg-float v1, v2

    .line 548
    float-to-double v1, v1

    .line 549
    mul-double/2addr v5, v1

    .line 550
    invoke-virtual {v4, v14, v15}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 551
    .line 552
    .line 553
    invoke-virtual {v4, v5, v6}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 554
    .line 555
    .line 556
    goto :goto_11

    .line 557
    :cond_19
    move-object/from16 v7, p0

    .line 558
    .line 559
    move-wide v1, v12

    .line 560
    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 561
    .line 562
    .line 563
    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 564
    .line 565
    .line 566
    :goto_11
    if-eqz v22, :cond_1a

    .line 567
    .line 568
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 569
    .line 570
    .line 571
    move-result-object v1

    .line 572
    invoke-virtual {v9, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 573
    .line 574
    .line 575
    move-result-object v1

    .line 576
    check-cast v1, [F

    .line 577
    .line 578
    aget v2, v23, v19

    .line 579
    .line 580
    aget v3, v1, v19

    .line 581
    .line 582
    sub-float/2addr v2, v3

    .line 583
    float-to-double v2, v2

    .line 584
    invoke-virtual {v4, v2, v3}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 585
    .line 586
    .line 587
    const/16 v18, 0x1

    .line 588
    .line 589
    aget v2, v23, v18

    .line 590
    .line 591
    aget v1, v1, v18

    .line 592
    .line 593
    sub-float/2addr v2, v1

    .line 594
    float-to-double v1, v2

    .line 595
    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 596
    .line 597
    .line 598
    const-wide/16 v1, 0x0

    .line 599
    .line 600
    goto :goto_12

    .line 601
    :cond_1a
    const-wide/16 v1, 0x0

    .line 602
    .line 603
    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 604
    .line 605
    .line 606
    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 607
    .line 608
    .line 609
    :goto_12
    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 610
    .line 611
    .line 612
    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 613
    .line 614
    .line 615
    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    .line 616
    .line 617
    invoke-virtual {v4, v5, v6}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 618
    .line 619
    .line 620
    invoke-virtual {v4, v1, v2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 621
    .line 622
    .line 623
    const-wide/16 v12, 0x0

    .line 624
    .line 625
    invoke-virtual {v4, v12, v13}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 626
    .line 627
    .line 628
    if-eqz v22, :cond_1b

    .line 629
    .line 630
    const/16 v1, 0x9

    .line 631
    .line 632
    if-ne v11, v1, :cond_1b

    .line 633
    .line 634
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 635
    .line 636
    .line 637
    move-result-object v0

    .line 638
    invoke-virtual {v9, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 639
    .line 640
    .line 641
    :cond_1b
    :goto_13
    return-void
.end method

.method public final c(Landroid/content/Context;)I
    .locals 4

    .line 1
    iget v0, p0, LZ2/a;->e:I

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Landroid/util/TypedValue;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const v2, 0x101004d

    .line 15
    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    const/16 p1, 0x30

    .line 25
    .line 26
    return p1

    .line 27
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {v0, p1}, Landroid/util/TypedValue;->getDimension(Landroid/util/DisplayMetrics;)F

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    float-to-int p1, p1

    .line 40
    iput p1, p0, LZ2/a;->e:I

    .line 41
    .line 42
    :cond_1
    iget p1, p0, LZ2/a;->e:I

    .line 43
    .line 44
    return p1
.end method

.method public final d(Landroid/view/MotionEvent;Landroid/graphics/Matrix;)V
    .locals 13

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    invoke-static {v2}, LZ2/a;->b(I)I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    const/4 v2, 0x5

    .line 14
    const/4 v4, 0x0

    .line 15
    const/4 v8, 0x1

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    if-ne v0, v2, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move v5, v4

    .line 22
    goto :goto_1

    .line 23
    :cond_1
    :goto_0
    move v5, v8

    .line 24
    :goto_1
    if-nez v5, :cond_3

    .line 25
    .line 26
    if-eq v0, v8, :cond_2

    .line 27
    .line 28
    const/4 v6, 0x6

    .line 29
    if-ne v0, v6, :cond_3

    .line 30
    .line 31
    :cond_2
    move v0, v8

    .line 32
    goto :goto_2

    .line 33
    :cond_3
    move v0, v4

    .line 34
    :goto_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getToolType(I)I

    .line 39
    .line 40
    .line 41
    move-result v6

    .line 42
    const/4 v9, 0x2

    .line 43
    if-eq v6, v8, :cond_7

    .line 44
    .line 45
    if-eq v6, v9, :cond_6

    .line 46
    .line 47
    const/4 v7, 0x3

    .line 48
    if-eq v6, v7, :cond_5

    .line 49
    .line 50
    const/4 v10, 0x4

    .line 51
    if-eq v6, v10, :cond_4

    .line 52
    .line 53
    goto :goto_3

    .line 54
    :cond_4
    move v2, v7

    .line 55
    goto :goto_3

    .line 56
    :cond_5
    move v2, v8

    .line 57
    goto :goto_3

    .line 58
    :cond_6
    move v2, v9

    .line 59
    goto :goto_3

    .line 60
    :cond_7
    move v2, v4

    .line 61
    :goto_3
    if-eqz v0, :cond_8

    .line 62
    .line 63
    if-nez v2, :cond_8

    .line 64
    .line 65
    move v10, v8

    .line 66
    goto :goto_4

    .line 67
    :cond_8
    move v10, v4

    .line 68
    :goto_4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 69
    .line 70
    .line 71
    move-result v11

    .line 72
    add-int v2, v11, v10

    .line 73
    .line 74
    mul-int/lit16 v2, v2, 0x120

    .line 75
    .line 76
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 77
    .line 78
    .line 79
    move-result-object v6

    .line 80
    sget-object v2, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 81
    .line 82
    invoke-virtual {v6, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 83
    .line 84
    .line 85
    if-eqz v5, :cond_9

    .line 86
    .line 87
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    const/4 v4, 0x0

    .line 92
    const/4 v7, 0x0

    .line 93
    move-object v0, p0

    .line 94
    move-object v1, p1

    .line 95
    move-object v5, p2

    .line 96
    invoke-virtual/range {v0 .. v7}, LZ2/a;->a(Landroid/view/MotionEvent;IIILandroid/graphics/Matrix;Ljava/nio/ByteBuffer;Landroid/content/Context;)V

    .line 97
    .line 98
    .line 99
    goto :goto_7

    .line 100
    :cond_9
    move v12, v3

    .line 101
    if-eqz v0, :cond_c

    .line 102
    .line 103
    move v2, v4

    .line 104
    :goto_5
    if-ge v2, v11, :cond_b

    .line 105
    .line 106
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eq v2, v0, :cond_a

    .line 111
    .line 112
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getToolType(I)I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-ne v0, v8, :cond_a

    .line 117
    .line 118
    const/4 v4, 0x1

    .line 119
    const/4 v7, 0x0

    .line 120
    const/4 v3, 0x5

    .line 121
    move-object v0, p0

    .line 122
    move-object v1, p1

    .line 123
    move-object v5, p2

    .line 124
    invoke-virtual/range {v0 .. v7}, LZ2/a;->a(Landroid/view/MotionEvent;IIILandroid/graphics/Matrix;Ljava/nio/ByteBuffer;Landroid/content/Context;)V

    .line 125
    .line 126
    .line 127
    :cond_a
    add-int/lit8 v2, v2, 0x1

    .line 128
    .line 129
    goto :goto_5

    .line 130
    :cond_b
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 131
    .line 132
    .line 133
    move-result v2

    .line 134
    const/4 v4, 0x0

    .line 135
    const/4 v7, 0x0

    .line 136
    move-object v0, p0

    .line 137
    move-object v1, p1

    .line 138
    move-object v5, p2

    .line 139
    move v3, v12

    .line 140
    invoke-virtual/range {v0 .. v7}, LZ2/a;->a(Landroid/view/MotionEvent;IIILandroid/graphics/Matrix;Ljava/nio/ByteBuffer;Landroid/content/Context;)V

    .line 141
    .line 142
    .line 143
    if-eqz v10, :cond_d

    .line 144
    .line 145
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    const/4 v4, 0x0

    .line 150
    const/4 v7, 0x0

    .line 151
    const/4 v3, 0x2

    .line 152
    move-object v0, p0

    .line 153
    move-object v1, p1

    .line 154
    move-object v5, p2

    .line 155
    invoke-virtual/range {v0 .. v7}, LZ2/a;->a(Landroid/view/MotionEvent;IIILandroid/graphics/Matrix;Ljava/nio/ByteBuffer;Landroid/content/Context;)V

    .line 156
    .line 157
    .line 158
    goto :goto_7

    .line 159
    :cond_c
    move v3, v12

    .line 160
    move v2, v4

    .line 161
    :goto_6
    if-ge v2, v11, :cond_d

    .line 162
    .line 163
    shl-int/lit8 v0, v11, 0x8

    .line 164
    .line 165
    or-int/lit8 v4, v0, 0x2

    .line 166
    .line 167
    const/4 v7, 0x0

    .line 168
    move-object v0, p0

    .line 169
    move-object v1, p1

    .line 170
    move-object v5, p2

    .line 171
    invoke-virtual/range {v0 .. v7}, LZ2/a;->a(Landroid/view/MotionEvent;IIILandroid/graphics/Matrix;Ljava/nio/ByteBuffer;Landroid/content/Context;)V

    .line 172
    .line 173
    .line 174
    add-int/lit8 v2, v2, 0x1

    .line 175
    .line 176
    goto :goto_6

    .line 177
    :cond_d
    :goto_7
    invoke-virtual {v6}, Ljava/nio/Buffer;->position()I

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    rem-int/lit16 v0, v0, 0x120

    .line 182
    .line 183
    if-nez v0, :cond_e

    .line 184
    .line 185
    invoke-virtual {v6}, Ljava/nio/Buffer;->position()I

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    iget-object v2, p0, LZ2/a;->a:Lio/flutter/embedding/engine/renderer/j;

    .line 190
    .line 191
    iget-object v2, v2, Lio/flutter/embedding/engine/renderer/j;->a:Lio/flutter/embedding/engine/FlutterJNI;

    .line 192
    .line 193
    invoke-virtual {v2, v6, v0}, Lio/flutter/embedding/engine/FlutterJNI;->dispatchPointerDataPacket(Ljava/nio/ByteBuffer;I)V

    .line 194
    .line 195
    .line 196
    return-void

    .line 197
    :cond_e
    new-instance v0, Ljava/lang/AssertionError;

    .line 198
    .line 199
    const-string v2, "Packet position is not on field boundary"

    .line 200
    .line 201
    invoke-direct {v0, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 202
    .line 203
    .line 204
    throw v0
.end method
