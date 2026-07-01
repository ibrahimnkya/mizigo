.class public final Lu2/a;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final g:[I


# instance fields
.field public final a:Lx2/b;

.field public b:Z

.field public c:I

.field public d:I

.field public e:I

.field public f:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const/16 v0, 0x83b

    .line 2
    .line 3
    const/16 v1, 0x707

    .line 4
    .line 5
    const/16 v2, 0xee0

    .line 6
    .line 7
    const/16 v3, 0x1dc

    .line 8
    .line 9
    filled-new-array {v2, v3, v0, v1}, [I

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Lu2/a;->g:[I

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Lx2/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lu2/a;->a:Lx2/b;

    .line 5
    .line 6
    return-void
.end method

.method public static b([Lr2/o;II)[Lr2/o;
    .locals 7

    .line 1
    int-to-float p2, p2

    .line 2
    int-to-float p1, p1

    .line 3
    const/high16 v0, 0x40000000    # 2.0f

    .line 4
    .line 5
    mul-float/2addr p1, v0

    .line 6
    div-float/2addr p2, p1

    .line 7
    const/4 p1, 0x0

    .line 8
    aget-object p1, p0, p1

    .line 9
    .line 10
    iget v1, p1, Lr2/o;->a:F

    .line 11
    .line 12
    const/4 v2, 0x2

    .line 13
    aget-object v2, p0, v2

    .line 14
    .line 15
    iget v3, v2, Lr2/o;->a:F

    .line 16
    .line 17
    sub-float v4, v1, v3

    .line 18
    .line 19
    iget p1, p1, Lr2/o;->b:F

    .line 20
    .line 21
    iget v2, v2, Lr2/o;->b:F

    .line 22
    .line 23
    sub-float v5, p1, v2

    .line 24
    .line 25
    add-float/2addr v1, v3

    .line 26
    div-float/2addr v1, v0

    .line 27
    add-float/2addr p1, v2

    .line 28
    div-float/2addr p1, v0

    .line 29
    new-instance v2, Lr2/o;

    .line 30
    .line 31
    mul-float/2addr v4, p2

    .line 32
    add-float v3, v1, v4

    .line 33
    .line 34
    mul-float/2addr v5, p2

    .line 35
    add-float v6, p1, v5

    .line 36
    .line 37
    invoke-direct {v2, v3, v6}, Lr2/o;-><init>(FF)V

    .line 38
    .line 39
    .line 40
    new-instance v3, Lr2/o;

    .line 41
    .line 42
    sub-float/2addr v1, v4

    .line 43
    sub-float/2addr p1, v5

    .line 44
    invoke-direct {v3, v1, p1}, Lr2/o;-><init>(FF)V

    .line 45
    .line 46
    .line 47
    const/4 p1, 0x1

    .line 48
    aget-object p1, p0, p1

    .line 49
    .line 50
    iget v1, p1, Lr2/o;->a:F

    .line 51
    .line 52
    const/4 v4, 0x3

    .line 53
    aget-object p0, p0, v4

    .line 54
    .line 55
    iget v4, p0, Lr2/o;->a:F

    .line 56
    .line 57
    sub-float v5, v1, v4

    .line 58
    .line 59
    iget p1, p1, Lr2/o;->b:F

    .line 60
    .line 61
    iget p0, p0, Lr2/o;->b:F

    .line 62
    .line 63
    sub-float v6, p1, p0

    .line 64
    .line 65
    add-float/2addr v1, v4

    .line 66
    div-float/2addr v1, v0

    .line 67
    add-float/2addr p1, p0

    .line 68
    div-float/2addr p1, v0

    .line 69
    new-instance p0, Lr2/o;

    .line 70
    .line 71
    mul-float/2addr v5, p2

    .line 72
    add-float v0, v1, v5

    .line 73
    .line 74
    mul-float/2addr p2, v6

    .line 75
    add-float v4, p1, p2

    .line 76
    .line 77
    invoke-direct {p0, v0, v4}, Lr2/o;-><init>(FF)V

    .line 78
    .line 79
    .line 80
    new-instance v0, Lr2/o;

    .line 81
    .line 82
    sub-float/2addr v1, v5

    .line 83
    sub-float/2addr p1, p2

    .line 84
    invoke-direct {v0, v1, p1}, Lr2/o;-><init>(FF)V

    .line 85
    .line 86
    .line 87
    filled-new-array {v2, p0, v3, v0}, [Lr2/o;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    return-object p0
.end method


# virtual methods
.method public final a(Z)Ls2/a;
    .locals 47

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lu2/a;->a:Lx2/b;

    .line 4
    .line 5
    const/4 v2, 0x3

    .line 6
    const/4 v3, 0x2

    .line 7
    const/4 v4, -0x1

    .line 8
    const/4 v5, 0x7

    .line 9
    const/4 v6, 0x1

    .line 10
    const/4 v7, 0x0

    .line 11
    :try_start_0
    new-instance v8, Ld3/d;

    .line 12
    .line 13
    invoke-direct {v8, v1}, Ld3/d;-><init>(Lx2/b;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v8}, Ld3/d;->b()[Lr2/o;

    .line 17
    .line 18
    .line 19
    move-result-object v8

    .line 20
    aget-object v9, v8, v7

    .line 21
    .line 22
    aget-object v10, v8, v6

    .line 23
    .line 24
    aget-object v11, v8, v3

    .line 25
    .line 26
    aget-object v8, v8, v2
    :try_end_0
    .catch Lr2/i; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catch_0
    iget v8, v1, Lx2/b;->e:I

    .line 30
    .line 31
    div-int/2addr v8, v3

    .line 32
    iget v9, v1, Lx2/b;->f:I

    .line 33
    .line 34
    div-int/2addr v9, v3

    .line 35
    new-instance v10, LB2/e;

    .line 36
    .line 37
    add-int/lit8 v11, v8, 0x7

    .line 38
    .line 39
    add-int/lit8 v12, v9, -0x7

    .line 40
    .line 41
    const/4 v13, 0x6

    .line 42
    invoke-direct {v10, v11, v12, v13}, LB2/e;-><init>(III)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v10, v7, v6, v4}, Lu2/a;->e(LB2/e;ZII)LB2/e;

    .line 46
    .line 47
    .line 48
    move-result-object v10

    .line 49
    invoke-virtual {v10}, LB2/e;->a()Lr2/o;

    .line 50
    .line 51
    .line 52
    move-result-object v10

    .line 53
    new-instance v13, LB2/e;

    .line 54
    .line 55
    add-int/2addr v9, v5

    .line 56
    const/4 v14, 0x6

    .line 57
    invoke-direct {v13, v11, v9, v14}, LB2/e;-><init>(III)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v13, v7, v6, v6}, Lu2/a;->e(LB2/e;ZII)LB2/e;

    .line 61
    .line 62
    .line 63
    move-result-object v11

    .line 64
    invoke-virtual {v11}, LB2/e;->a()Lr2/o;

    .line 65
    .line 66
    .line 67
    move-result-object v11

    .line 68
    new-instance v13, LB2/e;

    .line 69
    .line 70
    sub-int/2addr v8, v5

    .line 71
    invoke-direct {v13, v8, v9, v14}, LB2/e;-><init>(III)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v13, v7, v4, v6}, Lu2/a;->e(LB2/e;ZII)LB2/e;

    .line 75
    .line 76
    .line 77
    move-result-object v9

    .line 78
    invoke-virtual {v9}, LB2/e;->a()Lr2/o;

    .line 79
    .line 80
    .line 81
    move-result-object v9

    .line 82
    new-instance v13, LB2/e;

    .line 83
    .line 84
    invoke-direct {v13, v8, v12, v14}, LB2/e;-><init>(III)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v13, v7, v4, v4}, Lu2/a;->e(LB2/e;ZII)LB2/e;

    .line 88
    .line 89
    .line 90
    move-result-object v8

    .line 91
    invoke-virtual {v8}, LB2/e;->a()Lr2/o;

    .line 92
    .line 93
    .line 94
    move-result-object v8

    .line 95
    move-object/from16 v46, v11

    .line 96
    .line 97
    move-object v11, v9

    .line 98
    move-object v9, v10

    .line 99
    move-object/from16 v10, v46

    .line 100
    .line 101
    :goto_0
    iget v12, v9, Lr2/o;->a:F

    .line 102
    .line 103
    iget v13, v8, Lr2/o;->a:F

    .line 104
    .line 105
    add-float/2addr v12, v13

    .line 106
    iget v13, v10, Lr2/o;->a:F

    .line 107
    .line 108
    add-float/2addr v12, v13

    .line 109
    iget v13, v11, Lr2/o;->a:F

    .line 110
    .line 111
    add-float/2addr v12, v13

    .line 112
    const/high16 v13, 0x40800000    # 4.0f

    .line 113
    .line 114
    div-float/2addr v12, v13

    .line 115
    invoke-static {v12}, Ld1/d;->x(F)I

    .line 116
    .line 117
    .line 118
    move-result v12

    .line 119
    iget v9, v9, Lr2/o;->b:F

    .line 120
    .line 121
    iget v8, v8, Lr2/o;->b:F

    .line 122
    .line 123
    add-float/2addr v9, v8

    .line 124
    iget v8, v10, Lr2/o;->b:F

    .line 125
    .line 126
    add-float/2addr v9, v8

    .line 127
    iget v8, v11, Lr2/o;->b:F

    .line 128
    .line 129
    add-float/2addr v9, v8

    .line 130
    div-float/2addr v9, v13

    .line 131
    invoke-static {v9}, Ld1/d;->x(F)I

    .line 132
    .line 133
    .line 134
    move-result v8

    .line 135
    const/16 v9, 0xf

    .line 136
    .line 137
    :try_start_1
    new-instance v10, Ld3/d;

    .line 138
    .line 139
    invoke-direct {v10, v1, v9, v12, v8}, Ld3/d;-><init>(Lx2/b;III)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v10}, Ld3/d;->b()[Lr2/o;

    .line 143
    .line 144
    .line 145
    move-result-object v10

    .line 146
    aget-object v11, v10, v7

    .line 147
    .line 148
    aget-object v14, v10, v6

    .line 149
    .line 150
    aget-object v15, v10, v3

    .line 151
    .line 152
    aget-object v8, v10, v2
    :try_end_1
    .catch Lr2/i; {:try_start_1 .. :try_end_1} :catch_1

    .line 153
    .line 154
    move/from16 v16, v2

    .line 155
    .line 156
    goto :goto_1

    .line 157
    :catch_1
    new-instance v10, LB2/e;

    .line 158
    .line 159
    add-int/lit8 v11, v12, 0x7

    .line 160
    .line 161
    add-int/lit8 v14, v8, -0x7

    .line 162
    .line 163
    const/4 v15, 0x6

    .line 164
    invoke-direct {v10, v11, v14, v15}, LB2/e;-><init>(III)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v0, v10, v7, v6, v4}, Lu2/a;->e(LB2/e;ZII)LB2/e;

    .line 168
    .line 169
    .line 170
    move-result-object v10

    .line 171
    invoke-virtual {v10}, LB2/e;->a()Lr2/o;

    .line 172
    .line 173
    .line 174
    move-result-object v10

    .line 175
    new-instance v15, LB2/e;

    .line 176
    .line 177
    add-int/2addr v8, v5

    .line 178
    move/from16 v16, v2

    .line 179
    .line 180
    const/4 v2, 0x6

    .line 181
    invoke-direct {v15, v11, v8, v2}, LB2/e;-><init>(III)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v0, v15, v7, v6, v6}, Lu2/a;->e(LB2/e;ZII)LB2/e;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    invoke-virtual {v2}, LB2/e;->a()Lr2/o;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    new-instance v11, LB2/e;

    .line 193
    .line 194
    sub-int/2addr v12, v5

    .line 195
    const/4 v15, 0x6

    .line 196
    invoke-direct {v11, v12, v8, v15}, LB2/e;-><init>(III)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {v0, v11, v7, v4, v6}, Lu2/a;->e(LB2/e;ZII)LB2/e;

    .line 200
    .line 201
    .line 202
    move-result-object v8

    .line 203
    invoke-virtual {v8}, LB2/e;->a()Lr2/o;

    .line 204
    .line 205
    .line 206
    move-result-object v15

    .line 207
    new-instance v8, LB2/e;

    .line 208
    .line 209
    const/4 v11, 0x6

    .line 210
    invoke-direct {v8, v12, v14, v11}, LB2/e;-><init>(III)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {v0, v8, v7, v4, v4}, Lu2/a;->e(LB2/e;ZII)LB2/e;

    .line 214
    .line 215
    .line 216
    move-result-object v8

    .line 217
    invoke-virtual {v8}, LB2/e;->a()Lr2/o;

    .line 218
    .line 219
    .line 220
    move-result-object v8

    .line 221
    move-object v14, v2

    .line 222
    move-object v11, v10

    .line 223
    :goto_1
    iget v2, v11, Lr2/o;->a:F

    .line 224
    .line 225
    iget v10, v8, Lr2/o;->a:F

    .line 226
    .line 227
    add-float/2addr v2, v10

    .line 228
    iget v10, v14, Lr2/o;->a:F

    .line 229
    .line 230
    add-float/2addr v2, v10

    .line 231
    iget v10, v15, Lr2/o;->a:F

    .line 232
    .line 233
    add-float/2addr v2, v10

    .line 234
    div-float/2addr v2, v13

    .line 235
    invoke-static {v2}, Ld1/d;->x(F)I

    .line 236
    .line 237
    .line 238
    move-result v2

    .line 239
    iget v10, v11, Lr2/o;->b:F

    .line 240
    .line 241
    iget v8, v8, Lr2/o;->b:F

    .line 242
    .line 243
    add-float/2addr v10, v8

    .line 244
    iget v8, v14, Lr2/o;->b:F

    .line 245
    .line 246
    add-float/2addr v10, v8

    .line 247
    iget v8, v15, Lr2/o;->b:F

    .line 248
    .line 249
    add-float/2addr v10, v8

    .line 250
    div-float/2addr v10, v13

    .line 251
    invoke-static {v10}, Ld1/d;->x(F)I

    .line 252
    .line 253
    .line 254
    move-result v8

    .line 255
    new-instance v10, LB2/e;

    .line 256
    .line 257
    const/4 v11, 0x6

    .line 258
    invoke-direct {v10, v2, v8, v11}, LB2/e;-><init>(III)V

    .line 259
    .line 260
    .line 261
    iput v6, v0, Lu2/a;->e:I

    .line 262
    .line 263
    move v12, v6

    .line 264
    move-object v2, v10

    .line 265
    move-object v8, v2

    .line 266
    move-object v11, v8

    .line 267
    :goto_2
    iget v13, v11, LB2/e;->c:I

    .line 268
    .line 269
    iget v14, v11, LB2/e;->b:I

    .line 270
    .line 271
    iget v15, v10, LB2/e;->c:I

    .line 272
    .line 273
    move/from16 v17, v9

    .line 274
    .line 275
    iget v9, v10, LB2/e;->b:I

    .line 276
    .line 277
    iget v5, v0, Lu2/a;->e:I

    .line 278
    .line 279
    const/16 v7, 0x9

    .line 280
    .line 281
    if-ge v5, v7, :cond_4

    .line 282
    .line 283
    invoke-virtual {v0, v10, v12, v6, v4}, Lu2/a;->e(LB2/e;ZII)LB2/e;

    .line 284
    .line 285
    .line 286
    move-result-object v10

    .line 287
    iget v5, v10, LB2/e;->c:I

    .line 288
    .line 289
    iget v7, v10, LB2/e;->b:I

    .line 290
    .line 291
    invoke-virtual {v0, v2, v12, v6, v6}, Lu2/a;->e(LB2/e;ZII)LB2/e;

    .line 292
    .line 293
    .line 294
    move-result-object v3

    .line 295
    move-object/from16 v21, v10

    .line 296
    .line 297
    invoke-virtual {v0, v8, v12, v4, v6}, Lu2/a;->e(LB2/e;ZII)LB2/e;

    .line 298
    .line 299
    .line 300
    move-result-object v10

    .line 301
    invoke-virtual {v0, v11, v12, v4, v4}, Lu2/a;->e(LB2/e;ZII)LB2/e;

    .line 302
    .line 303
    .line 304
    move-result-object v11

    .line 305
    iget v4, v11, LB2/e;->c:I

    .line 306
    .line 307
    move/from16 v22, v6

    .line 308
    .line 309
    iget v6, v11, LB2/e;->b:I

    .line 310
    .line 311
    move-object/from16 v23, v11

    .line 312
    .line 313
    iget v11, v0, Lu2/a;->e:I

    .line 314
    .line 315
    move/from16 v24, v12

    .line 316
    .line 317
    const/4 v12, 0x2

    .line 318
    if-le v11, v12, :cond_3

    .line 319
    .line 320
    invoke-static {v6, v4, v7, v5}, Ld1/d;->h(IIII)F

    .line 321
    .line 322
    .line 323
    move-result v11

    .line 324
    move/from16 v20, v12

    .line 325
    .line 326
    iget v12, v0, Lu2/a;->e:I

    .line 327
    .line 328
    int-to-float v12, v12

    .line 329
    mul-float/2addr v11, v12

    .line 330
    invoke-static {v14, v13, v9, v15}, Ld1/d;->h(IIII)F

    .line 331
    .line 332
    .line 333
    move-result v12

    .line 334
    move/from16 v25, v4

    .line 335
    .line 336
    iget v4, v0, Lu2/a;->e:I

    .line 337
    .line 338
    add-int/lit8 v4, v4, 0x2

    .line 339
    .line 340
    int-to-float v4, v4

    .line 341
    mul-float/2addr v12, v4

    .line 342
    div-float/2addr v11, v12

    .line 343
    float-to-double v11, v11

    .line 344
    const-wide/high16 v26, 0x3fe8000000000000L    # 0.75

    .line 345
    .line 346
    cmpg-double v4, v11, v26

    .line 347
    .line 348
    if-ltz v4, :cond_5

    .line 349
    .line 350
    const-wide/high16 v26, 0x3ff4000000000000L    # 1.25

    .line 351
    .line 352
    cmpl-double v4, v11, v26

    .line 353
    .line 354
    if-gtz v4, :cond_5

    .line 355
    .line 356
    new-instance v4, LB2/e;

    .line 357
    .line 358
    add-int/lit8 v7, v7, -0x3

    .line 359
    .line 360
    const/4 v11, 0x0

    .line 361
    invoke-static {v11, v7}, Ljava/lang/Math;->max(II)I

    .line 362
    .line 363
    .line 364
    move-result v7

    .line 365
    iget v12, v1, Lx2/b;->f:I

    .line 366
    .line 367
    add-int/lit8 v12, v12, -0x1

    .line 368
    .line 369
    add-int/lit8 v5, v5, 0x3

    .line 370
    .line 371
    invoke-static {v12, v5}, Ljava/lang/Math;->min(II)I

    .line 372
    .line 373
    .line 374
    move-result v5

    .line 375
    const/4 v12, 0x6

    .line 376
    invoke-direct {v4, v7, v5, v12}, LB2/e;-><init>(III)V

    .line 377
    .line 378
    .line 379
    new-instance v5, LB2/e;

    .line 380
    .line 381
    iget v7, v3, LB2/e;->b:I

    .line 382
    .line 383
    add-int/lit8 v7, v7, -0x3

    .line 384
    .line 385
    invoke-static {v11, v7}, Ljava/lang/Math;->max(II)I

    .line 386
    .line 387
    .line 388
    move-result v7

    .line 389
    iget v12, v3, LB2/e;->c:I

    .line 390
    .line 391
    add-int/lit8 v12, v12, -0x3

    .line 392
    .line 393
    invoke-static {v11, v12}, Ljava/lang/Math;->max(II)I

    .line 394
    .line 395
    .line 396
    move-result v12

    .line 397
    const/4 v11, 0x6

    .line 398
    invoke-direct {v5, v7, v12, v11}, LB2/e;-><init>(III)V

    .line 399
    .line 400
    .line 401
    new-instance v7, LB2/e;

    .line 402
    .line 403
    iget v11, v1, Lx2/b;->e:I

    .line 404
    .line 405
    add-int/lit8 v11, v11, -0x1

    .line 406
    .line 407
    iget v12, v10, LB2/e;->b:I

    .line 408
    .line 409
    add-int/lit8 v12, v12, 0x3

    .line 410
    .line 411
    invoke-static {v11, v12}, Ljava/lang/Math;->min(II)I

    .line 412
    .line 413
    .line 414
    move-result v11

    .line 415
    iget v12, v1, Lx2/b;->f:I

    .line 416
    .line 417
    add-int/lit8 v12, v12, -0x1

    .line 418
    .line 419
    move-object/from16 v26, v3

    .line 420
    .line 421
    iget v3, v10, LB2/e;->c:I

    .line 422
    .line 423
    add-int/lit8 v3, v3, -0x3

    .line 424
    .line 425
    invoke-static {v12, v3}, Ljava/lang/Math;->min(II)I

    .line 426
    .line 427
    .line 428
    move-result v3

    .line 429
    const/4 v12, 0x0

    .line 430
    invoke-static {v12, v3}, Ljava/lang/Math;->max(II)I

    .line 431
    .line 432
    .line 433
    move-result v3

    .line 434
    const/4 v12, 0x6

    .line 435
    invoke-direct {v7, v11, v3, v12}, LB2/e;-><init>(III)V

    .line 436
    .line 437
    .line 438
    new-instance v3, LB2/e;

    .line 439
    .line 440
    iget v11, v1, Lx2/b;->e:I

    .line 441
    .line 442
    add-int/lit8 v11, v11, -0x1

    .line 443
    .line 444
    add-int/lit8 v6, v6, 0x3

    .line 445
    .line 446
    invoke-static {v11, v6}, Ljava/lang/Math;->min(II)I

    .line 447
    .line 448
    .line 449
    move-result v6

    .line 450
    iget v11, v1, Lx2/b;->f:I

    .line 451
    .line 452
    add-int/lit8 v11, v11, -0x1

    .line 453
    .line 454
    add-int/lit8 v12, v25, 0x3

    .line 455
    .line 456
    invoke-static {v11, v12}, Ljava/lang/Math;->min(II)I

    .line 457
    .line 458
    .line 459
    move-result v11

    .line 460
    const/4 v12, 0x6

    .line 461
    invoke-direct {v3, v6, v11, v12}, LB2/e;-><init>(III)V

    .line 462
    .line 463
    .line 464
    invoke-virtual {v0, v3, v4}, Lu2/a;->c(LB2/e;LB2/e;)I

    .line 465
    .line 466
    .line 467
    move-result v6

    .line 468
    if-nez v6, :cond_0

    .line 469
    .line 470
    goto :goto_4

    .line 471
    :cond_0
    invoke-virtual {v0, v4, v5}, Lu2/a;->c(LB2/e;LB2/e;)I

    .line 472
    .line 473
    .line 474
    move-result v4

    .line 475
    if-eq v4, v6, :cond_1

    .line 476
    .line 477
    goto :goto_4

    .line 478
    :cond_1
    invoke-virtual {v0, v5, v7}, Lu2/a;->c(LB2/e;LB2/e;)I

    .line 479
    .line 480
    .line 481
    move-result v4

    .line 482
    if-eq v4, v6, :cond_2

    .line 483
    .line 484
    goto :goto_4

    .line 485
    :cond_2
    invoke-virtual {v0, v7, v3}, Lu2/a;->c(LB2/e;LB2/e;)I

    .line 486
    .line 487
    .line 488
    move-result v3

    .line 489
    if-ne v3, v6, :cond_5

    .line 490
    .line 491
    goto :goto_3

    .line 492
    :cond_3
    move-object/from16 v26, v3

    .line 493
    .line 494
    :goto_3
    xor-int/lit8 v12, v24, 0x1

    .line 495
    .line 496
    iget v2, v0, Lu2/a;->e:I

    .line 497
    .line 498
    add-int/lit8 v2, v2, 0x1

    .line 499
    .line 500
    iput v2, v0, Lu2/a;->e:I

    .line 501
    .line 502
    move-object v8, v10

    .line 503
    move/from16 v9, v17

    .line 504
    .line 505
    move-object/from16 v10, v21

    .line 506
    .line 507
    move/from16 v6, v22

    .line 508
    .line 509
    move-object/from16 v11, v23

    .line 510
    .line 511
    move-object/from16 v2, v26

    .line 512
    .line 513
    const/4 v3, 0x2

    .line 514
    const/4 v4, -0x1

    .line 515
    const/4 v5, 0x7

    .line 516
    const/4 v7, 0x0

    .line 517
    goto/16 :goto_2

    .line 518
    .line 519
    :cond_4
    move/from16 v22, v6

    .line 520
    .line 521
    :cond_5
    :goto_4
    iget v3, v0, Lu2/a;->e:I

    .line 522
    .line 523
    const/4 v4, 0x5

    .line 524
    if-eq v3, v4, :cond_7

    .line 525
    .line 526
    const/4 v5, 0x7

    .line 527
    if-ne v3, v5, :cond_6

    .line 528
    .line 529
    goto :goto_5

    .line 530
    :cond_6
    invoke-static {}, Lr2/i;->a()Lr2/i;

    .line 531
    .line 532
    .line 533
    move-result-object v1

    .line 534
    throw v1

    .line 535
    :cond_7
    :goto_5
    if-ne v3, v4, :cond_8

    .line 536
    .line 537
    move/from16 v4, v22

    .line 538
    .line 539
    goto :goto_6

    .line 540
    :cond_8
    const/4 v4, 0x0

    .line 541
    :goto_6
    iput-boolean v4, v0, Lu2/a;->b:Z

    .line 542
    .line 543
    new-instance v4, Lr2/o;

    .line 544
    .line 545
    int-to-float v5, v9

    .line 546
    const/high16 v6, 0x3f000000    # 0.5f

    .line 547
    .line 548
    add-float/2addr v5, v6

    .line 549
    int-to-float v7, v15

    .line 550
    sub-float/2addr v7, v6

    .line 551
    invoke-direct {v4, v5, v7}, Lr2/o;-><init>(FF)V

    .line 552
    .line 553
    .line 554
    new-instance v5, Lr2/o;

    .line 555
    .line 556
    iget v7, v2, LB2/e;->b:I

    .line 557
    .line 558
    int-to-float v7, v7

    .line 559
    add-float/2addr v7, v6

    .line 560
    iget v2, v2, LB2/e;->c:I

    .line 561
    .line 562
    int-to-float v2, v2

    .line 563
    add-float/2addr v2, v6

    .line 564
    invoke-direct {v5, v7, v2}, Lr2/o;-><init>(FF)V

    .line 565
    .line 566
    .line 567
    new-instance v2, Lr2/o;

    .line 568
    .line 569
    iget v7, v8, LB2/e;->b:I

    .line 570
    .line 571
    int-to-float v7, v7

    .line 572
    sub-float/2addr v7, v6

    .line 573
    iget v8, v8, LB2/e;->c:I

    .line 574
    .line 575
    int-to-float v8, v8

    .line 576
    add-float/2addr v8, v6

    .line 577
    invoke-direct {v2, v7, v8}, Lr2/o;-><init>(FF)V

    .line 578
    .line 579
    .line 580
    new-instance v7, Lr2/o;

    .line 581
    .line 582
    int-to-float v8, v14

    .line 583
    sub-float/2addr v8, v6

    .line 584
    int-to-float v9, v13

    .line 585
    sub-float/2addr v9, v6

    .line 586
    invoke-direct {v7, v8, v9}, Lr2/o;-><init>(FF)V

    .line 587
    .line 588
    .line 589
    filled-new-array {v4, v5, v2, v7}, [Lr2/o;

    .line 590
    .line 591
    .line 592
    move-result-object v2

    .line 593
    const/16 v20, 0x2

    .line 594
    .line 595
    mul-int/lit8 v3, v3, 0x2

    .line 596
    .line 597
    add-int/lit8 v4, v3, -0x3

    .line 598
    .line 599
    invoke-static {v2, v4, v3}, Lu2/a;->b([Lr2/o;II)[Lr2/o;

    .line 600
    .line 601
    .line 602
    move-result-object v2

    .line 603
    const/16 v19, 0x0

    .line 604
    .line 605
    if-eqz p1, :cond_9

    .line 606
    .line 607
    aget-object v3, v2, v19

    .line 608
    .line 609
    aget-object v4, v2, v20

    .line 610
    .line 611
    aput-object v4, v2, v19

    .line 612
    .line 613
    aput-object v3, v2, v20

    .line 614
    .line 615
    :cond_9
    aget-object v3, v2, v19

    .line 616
    .line 617
    invoke-virtual {v0, v3}, Lu2/a;->g(Lr2/o;)Z

    .line 618
    .line 619
    .line 620
    move-result v3

    .line 621
    if-eqz v3, :cond_13

    .line 622
    .line 623
    aget-object v3, v2, v22

    .line 624
    .line 625
    invoke-virtual {v0, v3}, Lu2/a;->g(Lr2/o;)Z

    .line 626
    .line 627
    .line 628
    move-result v3

    .line 629
    if-eqz v3, :cond_13

    .line 630
    .line 631
    aget-object v3, v2, v20

    .line 632
    .line 633
    invoke-virtual {v0, v3}, Lu2/a;->g(Lr2/o;)Z

    .line 634
    .line 635
    .line 636
    move-result v3

    .line 637
    if-eqz v3, :cond_13

    .line 638
    .line 639
    aget-object v3, v2, v16

    .line 640
    .line 641
    invoke-virtual {v0, v3}, Lu2/a;->g(Lr2/o;)Z

    .line 642
    .line 643
    .line 644
    move-result v3

    .line 645
    if-eqz v3, :cond_13

    .line 646
    .line 647
    iget v3, v0, Lu2/a;->e:I

    .line 648
    .line 649
    mul-int/lit8 v3, v3, 0x2

    .line 650
    .line 651
    const/16 v19, 0x0

    .line 652
    .line 653
    aget-object v4, v2, v19

    .line 654
    .line 655
    aget-object v5, v2, v22

    .line 656
    .line 657
    invoke-virtual {v0, v4, v5, v3}, Lu2/a;->h(Lr2/o;Lr2/o;I)I

    .line 658
    .line 659
    .line 660
    move-result v4

    .line 661
    aget-object v5, v2, v22

    .line 662
    .line 663
    aget-object v6, v2, v20

    .line 664
    .line 665
    invoke-virtual {v0, v5, v6, v3}, Lu2/a;->h(Lr2/o;Lr2/o;I)I

    .line 666
    .line 667
    .line 668
    move-result v5

    .line 669
    aget-object v6, v2, v20

    .line 670
    .line 671
    aget-object v7, v2, v16

    .line 672
    .line 673
    invoke-virtual {v0, v6, v7, v3}, Lu2/a;->h(Lr2/o;Lr2/o;I)I

    .line 674
    .line 675
    .line 676
    move-result v6

    .line 677
    aget-object v7, v2, v16

    .line 678
    .line 679
    aget-object v8, v2, v19

    .line 680
    .line 681
    invoke-virtual {v0, v7, v8, v3}, Lu2/a;->h(Lr2/o;Lr2/o;I)I

    .line 682
    .line 683
    .line 684
    move-result v7

    .line 685
    filled-new-array {v4, v5, v6, v7}, [I

    .line 686
    .line 687
    .line 688
    move-result-object v4

    .line 689
    move/from16 v5, v19

    .line 690
    .line 691
    move v11, v5

    .line 692
    :goto_7
    const/4 v12, 0x4

    .line 693
    if-ge v11, v12, :cond_a

    .line 694
    .line 695
    aget v6, v4, v11

    .line 696
    .line 697
    add-int/lit8 v7, v3, -0x2

    .line 698
    .line 699
    shr-int v7, v6, v7

    .line 700
    .line 701
    shl-int/lit8 v7, v7, 0x1

    .line 702
    .line 703
    and-int/lit8 v6, v6, 0x1

    .line 704
    .line 705
    add-int/2addr v7, v6

    .line 706
    shl-int/lit8 v5, v5, 0x3

    .line 707
    .line 708
    add-int/2addr v5, v7

    .line 709
    add-int/lit8 v11, v11, 0x1

    .line 710
    .line 711
    const/16 v20, 0x2

    .line 712
    .line 713
    goto :goto_7

    .line 714
    :cond_a
    and-int/lit8 v3, v5, 0x1

    .line 715
    .line 716
    shl-int/lit8 v3, v3, 0xb

    .line 717
    .line 718
    shr-int/lit8 v5, v5, 0x1

    .line 719
    .line 720
    add-int/2addr v3, v5

    .line 721
    move/from16 v11, v19

    .line 722
    .line 723
    :goto_8
    if-ge v11, v12, :cond_12

    .line 724
    .line 725
    sget-object v5, Lu2/a;->g:[I

    .line 726
    .line 727
    aget v5, v5, v11

    .line 728
    .line 729
    xor-int/2addr v5, v3

    .line 730
    invoke-static {v5}, Ljava/lang/Integer;->bitCount(I)I

    .line 731
    .line 732
    .line 733
    move-result v5

    .line 734
    const/4 v6, 0x2

    .line 735
    if-gt v5, v6, :cond_11

    .line 736
    .line 737
    iput v11, v0, Lu2/a;->f:I

    .line 738
    .line 739
    const-wide/16 v5, 0x0

    .line 740
    .line 741
    move/from16 v11, v19

    .line 742
    .line 743
    :goto_9
    const/16 v3, 0xa

    .line 744
    .line 745
    if-ge v11, v12, :cond_c

    .line 746
    .line 747
    iget v7, v0, Lu2/a;->f:I

    .line 748
    .line 749
    add-int/2addr v7, v11

    .line 750
    rem-int/2addr v7, v12

    .line 751
    aget v7, v4, v7

    .line 752
    .line 753
    iget-boolean v8, v0, Lu2/a;->b:Z

    .line 754
    .line 755
    if-eqz v8, :cond_b

    .line 756
    .line 757
    const/16 v18, 0x7

    .line 758
    .line 759
    shl-long v5, v5, v18

    .line 760
    .line 761
    shr-int/lit8 v3, v7, 0x1

    .line 762
    .line 763
    and-int/lit8 v3, v3, 0x7f

    .line 764
    .line 765
    :goto_a
    int-to-long v7, v3

    .line 766
    add-long/2addr v5, v7

    .line 767
    goto :goto_b

    .line 768
    :cond_b
    const/16 v18, 0x7

    .line 769
    .line 770
    shl-long/2addr v5, v3

    .line 771
    shr-int/lit8 v3, v7, 0x2

    .line 772
    .line 773
    and-int/lit16 v3, v3, 0x3e0

    .line 774
    .line 775
    shr-int/lit8 v7, v7, 0x1

    .line 776
    .line 777
    and-int/lit8 v7, v7, 0x1f

    .line 778
    .line 779
    add-int/2addr v3, v7

    .line 780
    goto :goto_a

    .line 781
    :goto_b
    add-int/lit8 v11, v11, 0x1

    .line 782
    .line 783
    goto :goto_9

    .line 784
    :cond_c
    const/16 v18, 0x7

    .line 785
    .line 786
    iget-boolean v4, v0, Lu2/a;->b:Z

    .line 787
    .line 788
    if-eqz v4, :cond_d

    .line 789
    .line 790
    move/from16 v3, v18

    .line 791
    .line 792
    const/4 v4, 0x2

    .line 793
    goto :goto_c

    .line 794
    :cond_d
    move v4, v12

    .line 795
    :goto_c
    sub-int v7, v3, v4

    .line 796
    .line 797
    new-array v8, v3, [I

    .line 798
    .line 799
    add-int/lit8 v3, v3, -0x1

    .line 800
    .line 801
    :goto_d
    if-ltz v3, :cond_e

    .line 802
    .line 803
    long-to-int v9, v5

    .line 804
    and-int/lit8 v9, v9, 0xf

    .line 805
    .line 806
    aput v9, v8, v3

    .line 807
    .line 808
    shr-long/2addr v5, v12

    .line 809
    add-int/lit8 v3, v3, -0x1

    .line 810
    .line 811
    goto :goto_d

    .line 812
    :cond_e
    :try_start_2
    new-instance v3, Lj3/b;

    .line 813
    .line 814
    sget-object v5, Lz2/a;->k:Lz2/a;

    .line 815
    .line 816
    const/16 v6, 0x15

    .line 817
    .line 818
    invoke-direct {v3, v6, v5}, Lj3/b;-><init>(ILjava/lang/Object;)V

    .line 819
    .line 820
    .line 821
    invoke-virtual {v3, v8, v7}, Lj3/b;->l([II)I

    .line 822
    .line 823
    .line 824
    move-result v29
    :try_end_2
    .catch Lz2/b; {:try_start_2 .. :try_end_2} :catch_2

    .line 825
    move/from16 v3, v19

    .line 826
    .line 827
    move v7, v3

    .line 828
    :goto_e
    if-ge v7, v4, :cond_f

    .line 829
    .line 830
    shl-int/lit8 v3, v3, 0x4

    .line 831
    .line 832
    aget v5, v8, v7

    .line 833
    .line 834
    add-int/2addr v3, v5

    .line 835
    add-int/lit8 v7, v7, 0x1

    .line 836
    .line 837
    goto :goto_e

    .line 838
    :cond_f
    iget-boolean v4, v0, Lu2/a;->b:Z

    .line 839
    .line 840
    if-eqz v4, :cond_10

    .line 841
    .line 842
    shr-int/lit8 v4, v3, 0x6

    .line 843
    .line 844
    add-int/lit8 v4, v4, 0x1

    .line 845
    .line 846
    iput v4, v0, Lu2/a;->c:I

    .line 847
    .line 848
    and-int/lit8 v3, v3, 0x3f

    .line 849
    .line 850
    add-int/lit8 v3, v3, 0x1

    .line 851
    .line 852
    iput v3, v0, Lu2/a;->d:I

    .line 853
    .line 854
    goto :goto_f

    .line 855
    :cond_10
    shr-int/lit8 v4, v3, 0xb

    .line 856
    .line 857
    add-int/lit8 v4, v4, 0x1

    .line 858
    .line 859
    iput v4, v0, Lu2/a;->c:I

    .line 860
    .line 861
    and-int/lit16 v3, v3, 0x7ff

    .line 862
    .line 863
    add-int/lit8 v3, v3, 0x1

    .line 864
    .line 865
    iput v3, v0, Lu2/a;->d:I

    .line 866
    .line 867
    :goto_f
    iget v3, v0, Lu2/a;->f:I

    .line 868
    .line 869
    rem-int/lit8 v4, v3, 0x4

    .line 870
    .line 871
    aget-object v4, v2, v4

    .line 872
    .line 873
    add-int/lit8 v5, v3, 0x1

    .line 874
    .line 875
    rem-int/2addr v5, v12

    .line 876
    aget-object v5, v2, v5

    .line 877
    .line 878
    add-int/lit8 v6, v3, 0x2

    .line 879
    .line 880
    rem-int/2addr v6, v12

    .line 881
    aget-object v6, v2, v6

    .line 882
    .line 883
    add-int/lit8 v3, v3, 0x3

    .line 884
    .line 885
    rem-int/2addr v3, v12

    .line 886
    aget-object v3, v2, v3

    .line 887
    .line 888
    invoke-virtual {v0}, Lu2/a;->d()I

    .line 889
    .line 890
    .line 891
    move-result v7

    .line 892
    int-to-float v8, v7

    .line 893
    const/high16 v9, 0x40000000    # 2.0f

    .line 894
    .line 895
    div-float/2addr v8, v9

    .line 896
    iget v9, v0, Lu2/a;->e:I

    .line 897
    .line 898
    int-to-float v9, v9

    .line 899
    sub-float v30, v8, v9

    .line 900
    .line 901
    add-float v32, v8, v9

    .line 902
    .line 903
    iget v8, v4, Lr2/o;->a:F

    .line 904
    .line 905
    iget v4, v4, Lr2/o;->b:F

    .line 906
    .line 907
    iget v9, v5, Lr2/o;->a:F

    .line 908
    .line 909
    iget v5, v5, Lr2/o;->b:F

    .line 910
    .line 911
    iget v10, v6, Lr2/o;->a:F

    .line 912
    .line 913
    iget v6, v6, Lr2/o;->b:F

    .line 914
    .line 915
    iget v11, v3, Lr2/o;->a:F

    .line 916
    .line 917
    iget v3, v3, Lr2/o;->b:F

    .line 918
    .line 919
    move/from16 v31, v30

    .line 920
    .line 921
    move/from16 v33, v30

    .line 922
    .line 923
    move/from16 v34, v32

    .line 924
    .line 925
    move/from16 v35, v32

    .line 926
    .line 927
    move/from16 v36, v30

    .line 928
    .line 929
    move/from16 v37, v32

    .line 930
    .line 931
    move/from16 v45, v3

    .line 932
    .line 933
    move/from16 v39, v4

    .line 934
    .line 935
    move/from16 v41, v5

    .line 936
    .line 937
    move/from16 v43, v6

    .line 938
    .line 939
    move/from16 v38, v8

    .line 940
    .line 941
    move/from16 v40, v9

    .line 942
    .line 943
    move/from16 v42, v10

    .line 944
    .line 945
    move/from16 v44, v11

    .line 946
    .line 947
    invoke-static/range {v30 .. v45}, Lx2/f;->a(FFFFFFFFFFFFFFFF)Lx2/f;

    .line 948
    .line 949
    .line 950
    move-result-object v3

    .line 951
    invoke-static {v1, v7, v7, v3}, LT0/a;->H(Lx2/b;IILx2/f;)Lx2/b;

    .line 952
    .line 953
    .line 954
    move-result-object v24

    .line 955
    iget v1, v0, Lu2/a;->e:I

    .line 956
    .line 957
    const/16 v20, 0x2

    .line 958
    .line 959
    mul-int/lit8 v1, v1, 0x2

    .line 960
    .line 961
    invoke-virtual {v0}, Lu2/a;->d()I

    .line 962
    .line 963
    .line 964
    move-result v3

    .line 965
    invoke-static {v2, v1, v3}, Lu2/a;->b([Lr2/o;II)[Lr2/o;

    .line 966
    .line 967
    .line 968
    move-result-object v25

    .line 969
    new-instance v23, Ls2/a;

    .line 970
    .line 971
    iget-boolean v1, v0, Lu2/a;->b:Z

    .line 972
    .line 973
    iget v2, v0, Lu2/a;->d:I

    .line 974
    .line 975
    iget v3, v0, Lu2/a;->c:I

    .line 976
    .line 977
    move/from16 v26, v1

    .line 978
    .line 979
    move/from16 v27, v2

    .line 980
    .line 981
    move/from16 v28, v3

    .line 982
    .line 983
    invoke-direct/range {v23 .. v29}, Ls2/a;-><init>(Lx2/b;[Lr2/o;ZIII)V

    .line 984
    .line 985
    .line 986
    return-object v23

    .line 987
    :catch_2
    invoke-static {}, Lr2/i;->a()Lr2/i;

    .line 988
    .line 989
    .line 990
    move-result-object v1

    .line 991
    throw v1

    .line 992
    :cond_11
    move/from16 v20, v6

    .line 993
    .line 994
    const/16 v18, 0x7

    .line 995
    .line 996
    add-int/lit8 v11, v11, 0x1

    .line 997
    .line 998
    goto/16 :goto_8

    .line 999
    .line 1000
    :cond_12
    invoke-static {}, Lr2/i;->a()Lr2/i;

    .line 1001
    .line 1002
    .line 1003
    move-result-object v1

    .line 1004
    throw v1

    .line 1005
    :cond_13
    invoke-static {}, Lr2/i;->a()Lr2/i;

    .line 1006
    .line 1007
    .line 1008
    move-result-object v1

    .line 1009
    throw v1
.end method

.method public final c(LB2/e;LB2/e;)I
    .locals 11

    .line 1
    iget v0, p1, LB2/e;->b:I

    .line 2
    .line 3
    iget p1, p1, LB2/e;->c:I

    .line 4
    .line 5
    iget v1, p2, LB2/e;->b:I

    .line 6
    .line 7
    iget p2, p2, LB2/e;->c:I

    .line 8
    .line 9
    invoke-static {v0, p1, v1, p2}, Ld1/d;->h(IIII)F

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/4 v3, 0x0

    .line 14
    cmpl-float v3, v2, v3

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    if-nez v3, :cond_0

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    sub-int/2addr v1, v0

    .line 21
    int-to-float v1, v1

    .line 22
    div-float/2addr v1, v2

    .line 23
    sub-int/2addr p2, p1

    .line 24
    int-to-float p2, p2

    .line 25
    div-float/2addr p2, v2

    .line 26
    int-to-float v3, v0

    .line 27
    int-to-float v5, p1

    .line 28
    iget-object v6, p0, Lu2/a;->a:Lx2/b;

    .line 29
    .line 30
    invoke-virtual {v6, v0, p1}, Lx2/b;->b(II)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    float-to-double v7, v2

    .line 35
    invoke-static {v7, v8}, Ljava/lang/Math;->floor(D)D

    .line 36
    .line 37
    .line 38
    move-result-wide v7

    .line 39
    double-to-int v0, v7

    .line 40
    move v7, v4

    .line 41
    move v8, v7

    .line 42
    :goto_0
    if-ge v7, v0, :cond_2

    .line 43
    .line 44
    invoke-static {v3}, Ld1/d;->x(F)I

    .line 45
    .line 46
    .line 47
    move-result v9

    .line 48
    invoke-static {v5}, Ld1/d;->x(F)I

    .line 49
    .line 50
    .line 51
    move-result v10

    .line 52
    invoke-virtual {v6, v9, v10}, Lx2/b;->b(II)Z

    .line 53
    .line 54
    .line 55
    move-result v9

    .line 56
    if-eq v9, p1, :cond_1

    .line 57
    .line 58
    add-int/lit8 v8, v8, 0x1

    .line 59
    .line 60
    :cond_1
    add-float/2addr v3, v1

    .line 61
    add-float/2addr v5, p2

    .line 62
    add-int/lit8 v7, v7, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    int-to-float p2, v8

    .line 66
    div-float/2addr p2, v2

    .line 67
    const v0, 0x3dcccccd    # 0.1f

    .line 68
    .line 69
    .line 70
    cmpl-float v1, p2, v0

    .line 71
    .line 72
    if-lez v1, :cond_3

    .line 73
    .line 74
    const v1, 0x3f666666    # 0.9f

    .line 75
    .line 76
    .line 77
    cmpg-float v1, p2, v1

    .line 78
    .line 79
    if-gez v1, :cond_3

    .line 80
    .line 81
    :goto_1
    return v4

    .line 82
    :cond_3
    cmpg-float p2, p2, v0

    .line 83
    .line 84
    const/4 v0, 0x1

    .line 85
    if-gtz p2, :cond_4

    .line 86
    .line 87
    move v4, v0

    .line 88
    :cond_4
    if-ne v4, p1, :cond_5

    .line 89
    .line 90
    return v0

    .line 91
    :cond_5
    const/4 p1, -0x1

    .line 92
    return p1
.end method

.method public final d()I
    .locals 2

    .line 1
    iget-boolean v0, p0, Lu2/a;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lu2/a;->c:I

    .line 6
    .line 7
    mul-int/lit8 v0, v0, 0x4

    .line 8
    .line 9
    add-int/lit8 v0, v0, 0xb

    .line 10
    .line 11
    return v0

    .line 12
    :cond_0
    iget v0, p0, Lu2/a;->c:I

    .line 13
    .line 14
    mul-int/lit8 v1, v0, 0x4

    .line 15
    .line 16
    mul-int/lit8 v0, v0, 0x2

    .line 17
    .line 18
    add-int/lit8 v0, v0, 0x6

    .line 19
    .line 20
    div-int/lit8 v0, v0, 0xf

    .line 21
    .line 22
    mul-int/lit8 v0, v0, 0x2

    .line 23
    .line 24
    add-int/2addr v0, v1

    .line 25
    add-int/lit8 v0, v0, 0xf

    .line 26
    .line 27
    return v0
.end method

.method public final e(LB2/e;ZII)LB2/e;
    .locals 3

    .line 1
    iget v0, p1, LB2/e;->b:I

    .line 2
    .line 3
    add-int/2addr v0, p3

    .line 4
    iget p1, p1, LB2/e;->c:I

    .line 5
    .line 6
    :goto_0
    add-int/2addr p1, p4

    .line 7
    invoke-virtual {p0, v0, p1}, Lu2/a;->f(II)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget-object v2, p0, Lu2/a;->a:Lx2/b;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v2, v0, p1}, Lx2/b;->b(II)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-ne v1, p2, :cond_0

    .line 20
    .line 21
    add-int/2addr v0, p3

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    sub-int/2addr v0, p3

    .line 24
    sub-int/2addr p1, p4

    .line 25
    :goto_1
    invoke-virtual {p0, v0, p1}, Lu2/a;->f(II)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    invoke-virtual {v2, v0, p1}, Lx2/b;->b(II)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-ne v1, p2, :cond_1

    .line 36
    .line 37
    add-int/2addr v0, p3

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    sub-int/2addr v0, p3

    .line 40
    :goto_2
    invoke-virtual {p0, v0, p1}, Lu2/a;->f(II)Z

    .line 41
    .line 42
    .line 43
    move-result p3

    .line 44
    if-eqz p3, :cond_2

    .line 45
    .line 46
    invoke-virtual {v2, v0, p1}, Lx2/b;->b(II)Z

    .line 47
    .line 48
    .line 49
    move-result p3

    .line 50
    if-ne p3, p2, :cond_2

    .line 51
    .line 52
    add-int/2addr p1, p4

    .line 53
    goto :goto_2

    .line 54
    :cond_2
    sub-int/2addr p1, p4

    .line 55
    new-instance p2, LB2/e;

    .line 56
    .line 57
    const/4 p3, 0x6

    .line 58
    invoke-direct {p2, v0, p1, p3}, LB2/e;-><init>(III)V

    .line 59
    .line 60
    .line 61
    return-object p2
.end method

.method public final f(II)Z
    .locals 2

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lu2/a;->a:Lx2/b;

    .line 4
    .line 5
    iget v1, v0, Lx2/b;->e:I

    .line 6
    .line 7
    if-ge p1, v1, :cond_0

    .line 8
    .line 9
    if-ltz p2, :cond_0

    .line 10
    .line 11
    iget p1, v0, Lx2/b;->f:I

    .line 12
    .line 13
    if-ge p2, p1, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    return p1

    .line 17
    :cond_0
    const/4 p1, 0x0

    .line 18
    return p1
.end method

.method public final g(Lr2/o;)Z
    .locals 1

    .line 1
    iget v0, p1, Lr2/o;->a:F

    .line 2
    .line 3
    invoke-static {v0}, Ld1/d;->x(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget p1, p1, Lr2/o;->b:F

    .line 8
    .line 9
    invoke-static {p1}, Ld1/d;->x(F)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-virtual {p0, v0, p1}, Lu2/a;->f(II)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    return p1
.end method

.method public final h(Lr2/o;Lr2/o;I)I
    .locals 7

    .line 1
    iget v0, p1, Lr2/o;->a:F

    .line 2
    .line 3
    iget v1, p1, Lr2/o;->b:F

    .line 4
    .line 5
    iget v2, p2, Lr2/o;->a:F

    .line 6
    .line 7
    iget v3, p2, Lr2/o;->b:F

    .line 8
    .line 9
    invoke-static {v0, v1, v2, v3}, Ld1/d;->g(FFFF)F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    int-to-float v2, p3

    .line 14
    div-float v2, v0, v2

    .line 15
    .line 16
    iget p1, p1, Lr2/o;->a:F

    .line 17
    .line 18
    iget p2, p2, Lr2/o;->a:F

    .line 19
    .line 20
    sub-float/2addr p2, p1

    .line 21
    mul-float/2addr p2, v2

    .line 22
    div-float/2addr p2, v0

    .line 23
    sub-float/2addr v3, v1

    .line 24
    mul-float/2addr v3, v2

    .line 25
    div-float/2addr v3, v0

    .line 26
    const/4 v0, 0x0

    .line 27
    move v2, v0

    .line 28
    :goto_0
    if-ge v0, p3, :cond_1

    .line 29
    .line 30
    int-to-float v4, v0

    .line 31
    mul-float v5, v4, p2

    .line 32
    .line 33
    add-float/2addr v5, p1

    .line 34
    invoke-static {v5}, Ld1/d;->x(F)I

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    mul-float/2addr v4, v3

    .line 39
    add-float/2addr v4, v1

    .line 40
    invoke-static {v4}, Ld1/d;->x(F)I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    iget-object v6, p0, Lu2/a;->a:Lx2/b;

    .line 45
    .line 46
    invoke-virtual {v6, v5, v4}, Lx2/b;->b(II)Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    if-eqz v4, :cond_0

    .line 51
    .line 52
    sub-int v4, p3, v0

    .line 53
    .line 54
    const/4 v5, 0x1

    .line 55
    sub-int/2addr v4, v5

    .line 56
    shl-int v4, v5, v4

    .line 57
    .line 58
    or-int/2addr v2, v4

    .line 59
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    return v2
.end method
