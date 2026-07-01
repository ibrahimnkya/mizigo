.class public final LB2/d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lj3/b;


# direct methods
.method public constructor <init>(I)V
    .locals 2

    .line 1
    packed-switch p1, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    new-instance p1, Lj3/b;

    .line 8
    .line 9
    sget-object v0, Lz2/a;->m:Lz2/a;

    .line 10
    .line 11
    const/16 v1, 0x15

    .line 12
    .line 13
    invoke-direct {p1, v1, v0}, Lj3/b;-><init>(ILjava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, LB2/d;->a:Lj3/b;

    .line 17
    .line 18
    return-void

    .line 19
    :pswitch_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    .line 21
    .line 22
    new-instance p1, Lj3/b;

    .line 23
    .line 24
    sget-object v0, Lz2/a;->l:Lz2/a;

    .line 25
    .line 26
    const/16 v1, 0x15

    .line 27
    .line 28
    invoke-direct {p1, v1, v0}, Lj3/b;-><init>(ILjava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, LB2/d;->a:Lj3/b;

    .line 32
    .line 33
    return-void

    .line 34
    :pswitch_1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    .line 36
    .line 37
    new-instance p1, Lj3/b;

    .line 38
    .line 39
    sget-object v0, Lz2/a;->o:Lz2/a;

    .line 40
    .line 41
    const/16 v1, 0x15

    .line 42
    .line 43
    invoke-direct {p1, v1, v0}, Lj3/b;-><init>(ILjava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    iput-object p1, p0, LB2/d;->a:Lj3/b;

    .line 47
    .line 48
    return-void

    .line 49
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public a([BIIII)I
    .locals 7

    .line 1
    add-int v0, p3, p4

    .line 2
    .line 3
    if-nez p5, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v1, 0x2

    .line 8
    :goto_0
    div-int v2, v0, v1

    .line 9
    .line 10
    new-array v2, v2, [I

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    move v4, v3

    .line 14
    :goto_1
    if-ge v4, v0, :cond_3

    .line 15
    .line 16
    if-eqz p5, :cond_1

    .line 17
    .line 18
    rem-int/lit8 v5, v4, 0x2

    .line 19
    .line 20
    add-int/lit8 v6, p5, -0x1

    .line 21
    .line 22
    if-ne v5, v6, :cond_2

    .line 23
    .line 24
    :cond_1
    div-int v5, v4, v1

    .line 25
    .line 26
    add-int v6, v4, p2

    .line 27
    .line 28
    aget-byte v6, p1, v6

    .line 29
    .line 30
    and-int/lit16 v6, v6, 0xff

    .line 31
    .line 32
    aput v6, v2, v5

    .line 33
    .line 34
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_3
    :try_start_0
    iget-object v0, p0, LB2/d;->a:Lj3/b;

    .line 38
    .line 39
    div-int/2addr p4, v1

    .line 40
    invoke-virtual {v0, v2, p4}, Lj3/b;->l([II)I

    .line 41
    .line 42
    .line 43
    move-result p4
    :try_end_0
    .catch Lz2/b; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    :goto_2
    if-ge v3, p3, :cond_6

    .line 45
    .line 46
    if-eqz p5, :cond_4

    .line 47
    .line 48
    rem-int/lit8 v0, v3, 0x2

    .line 49
    .line 50
    add-int/lit8 v4, p5, -0x1

    .line 51
    .line 52
    if-ne v0, v4, :cond_5

    .line 53
    .line 54
    :cond_4
    add-int v0, v3, p2

    .line 55
    .line 56
    div-int v4, v3, v1

    .line 57
    .line 58
    aget v4, v2, v4

    .line 59
    .line 60
    int-to-byte v4, v4

    .line 61
    aput-byte v4, p1, v0

    .line 62
    .line 63
    :cond_5
    add-int/lit8 v3, v3, 0x1

    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_6
    return p4

    .line 67
    :catch_0
    invoke-static {}, Lr2/c;->a()Lr2/c;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    throw p1
.end method

.method public b(LO2/a;Ljava/util/Map;)Lx2/d;
    .locals 28

    .line 1
    invoke-virtual/range {p1 .. p1}, LO2/a;->c()LO2/g;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual/range {p1 .. p1}, LO2/a;->b()LO2/d;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget v1, v1, LO2/d;->a:I

    .line 10
    .line 11
    invoke-virtual/range {p1 .. p1}, LO2/a;->b()LO2/d;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual/range {p1 .. p1}, LO2/a;->c()LO2/g;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    const/16 v4, 0x8

    .line 20
    .line 21
    invoke-static {v4}, LL/i;->c(I)[I

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    iget-byte v2, v2, LO2/d;->b:B

    .line 26
    .line 27
    aget v2, v5, v2

    .line 28
    .line 29
    move-object/from16 v5, p1

    .line 30
    .line 31
    iget-object v5, v5, LO2/a;->a:Lx2/b;

    .line 32
    .line 33
    iget v6, v5, Lx2/b;->f:I

    .line 34
    .line 35
    const/4 v7, 0x0

    .line 36
    move v8, v7

    .line 37
    :goto_0
    if-ge v8, v6, :cond_2

    .line 38
    .line 39
    move v9, v7

    .line 40
    :goto_1
    if-ge v9, v6, :cond_1

    .line 41
    .line 42
    invoke-static {v2, v8, v9}, LO2/c;->a(III)Z

    .line 43
    .line 44
    .line 45
    move-result v10

    .line 46
    if-eqz v10, :cond_0

    .line 47
    .line 48
    invoke-virtual {v5, v9, v8}, Lx2/b;->a(II)V

    .line 49
    .line 50
    .line 51
    :cond_0
    add-int/lit8 v9, v9, 0x1

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_1
    add-int/lit8 v8, v8, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    iget v2, v3, LO2/g;->a:I

    .line 58
    .line 59
    const/4 v8, 0x4

    .line 60
    mul-int/2addr v2, v8

    .line 61
    add-int/lit8 v9, v2, 0x11

    .line 62
    .line 63
    iget v10, v3, LO2/g;->d:I

    .line 64
    .line 65
    new-instance v11, Lx2/b;

    .line 66
    .line 67
    invoke-direct {v11, v9, v9}, Lx2/b;-><init>(II)V

    .line 68
    .line 69
    .line 70
    const/16 v9, 0x9

    .line 71
    .line 72
    invoke-virtual {v11, v7, v7, v9, v9}, Lx2/b;->i(IIII)V

    .line 73
    .line 74
    .line 75
    add-int/lit8 v12, v2, 0x9

    .line 76
    .line 77
    invoke-virtual {v11, v12, v7, v4, v9}, Lx2/b;->i(IIII)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v11, v7, v12, v9, v4}, Lx2/b;->i(IIII)V

    .line 81
    .line 82
    .line 83
    iget-object v12, v3, LO2/g;->b:[I

    .line 84
    .line 85
    array-length v13, v12

    .line 86
    move v14, v7

    .line 87
    :goto_2
    const/4 v15, 0x2

    .line 88
    const/4 v8, 0x5

    .line 89
    if-ge v14, v13, :cond_7

    .line 90
    .line 91
    aget v16, v12, v14

    .line 92
    .line 93
    add-int/lit8 v4, v16, -0x2

    .line 94
    .line 95
    move/from16 v16, v15

    .line 96
    .line 97
    move v15, v7

    .line 98
    :goto_3
    if-ge v15, v13, :cond_6

    .line 99
    .line 100
    if-nez v14, :cond_3

    .line 101
    .line 102
    if-eqz v15, :cond_5

    .line 103
    .line 104
    add-int/lit8 v7, v13, -0x1

    .line 105
    .line 106
    if-eq v15, v7, :cond_5

    .line 107
    .line 108
    :cond_3
    add-int/lit8 v7, v13, -0x1

    .line 109
    .line 110
    if-ne v14, v7, :cond_4

    .line 111
    .line 112
    if-eqz v15, :cond_5

    .line 113
    .line 114
    :cond_4
    aget v7, v12, v15

    .line 115
    .line 116
    add-int/lit8 v7, v7, -0x2

    .line 117
    .line 118
    invoke-virtual {v11, v7, v4, v8, v8}, Lx2/b;->i(IIII)V

    .line 119
    .line 120
    .line 121
    :cond_5
    add-int/lit8 v15, v15, 0x1

    .line 122
    .line 123
    const/4 v7, 0x0

    .line 124
    goto :goto_3

    .line 125
    :cond_6
    add-int/lit8 v14, v14, 0x1

    .line 126
    .line 127
    const/16 v4, 0x8

    .line 128
    .line 129
    const/4 v7, 0x0

    .line 130
    const/4 v8, 0x4

    .line 131
    goto :goto_2

    .line 132
    :cond_7
    move/from16 v16, v15

    .line 133
    .line 134
    const/4 v4, 0x6

    .line 135
    const/4 v7, 0x1

    .line 136
    invoke-virtual {v11, v4, v9, v7, v2}, Lx2/b;->i(IIII)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v11, v9, v4, v2, v7}, Lx2/b;->i(IIII)V

    .line 140
    .line 141
    .line 142
    iget v3, v3, LO2/g;->a:I

    .line 143
    .line 144
    const/4 v12, 0x3

    .line 145
    if-le v3, v4, :cond_8

    .line 146
    .line 147
    add-int/2addr v2, v4

    .line 148
    const/4 v3, 0x0

    .line 149
    invoke-virtual {v11, v2, v3, v12, v4}, Lx2/b;->i(IIII)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v11, v3, v2, v4, v12}, Lx2/b;->i(IIII)V

    .line 153
    .line 154
    .line 155
    :cond_8
    new-array v2, v10, [B

    .line 156
    .line 157
    add-int/lit8 v3, v6, -0x1

    .line 158
    .line 159
    move v9, v3

    .line 160
    move/from16 v19, v7

    .line 161
    .line 162
    const/4 v13, 0x0

    .line 163
    const/4 v14, 0x0

    .line 164
    const/4 v15, 0x0

    .line 165
    :goto_4
    if-lez v9, :cond_f

    .line 166
    .line 167
    if-ne v9, v4, :cond_9

    .line 168
    .line 169
    add-int/lit8 v9, v9, -0x1

    .line 170
    .line 171
    :cond_9
    const/4 v4, 0x0

    .line 172
    :goto_5
    if-ge v4, v6, :cond_e

    .line 173
    .line 174
    if-eqz v19, :cond_a

    .line 175
    .line 176
    sub-int v20, v3, v4

    .line 177
    .line 178
    move/from16 v8, v20

    .line 179
    .line 180
    goto :goto_6

    .line 181
    :cond_a
    move v8, v4

    .line 182
    :goto_6
    move/from16 v21, v7

    .line 183
    .line 184
    move/from16 v7, v16

    .line 185
    .line 186
    const/4 v12, 0x0

    .line 187
    :goto_7
    if-ge v12, v7, :cond_d

    .line 188
    .line 189
    sub-int v7, v9, v12

    .line 190
    .line 191
    invoke-virtual {v11, v7, v8}, Lx2/b;->b(II)Z

    .line 192
    .line 193
    .line 194
    move-result v22

    .line 195
    if-nez v22, :cond_c

    .line 196
    .line 197
    add-int/lit8 v14, v14, 0x1

    .line 198
    .line 199
    shl-int/lit8 v15, v15, 0x1

    .line 200
    .line 201
    invoke-virtual {v5, v7, v8}, Lx2/b;->b(II)Z

    .line 202
    .line 203
    .line 204
    move-result v7

    .line 205
    if-eqz v7, :cond_b

    .line 206
    .line 207
    or-int/lit8 v7, v15, 0x1

    .line 208
    .line 209
    move v15, v7

    .line 210
    :cond_b
    const/16 v7, 0x8

    .line 211
    .line 212
    if-ne v14, v7, :cond_c

    .line 213
    .line 214
    add-int/lit8 v7, v13, 0x1

    .line 215
    .line 216
    int-to-byte v14, v15

    .line 217
    aput-byte v14, v2, v13

    .line 218
    .line 219
    move v13, v7

    .line 220
    const/4 v14, 0x0

    .line 221
    const/4 v15, 0x0

    .line 222
    :cond_c
    add-int/lit8 v12, v12, 0x1

    .line 223
    .line 224
    const/4 v7, 0x2

    .line 225
    goto :goto_7

    .line 226
    :cond_d
    add-int/lit8 v4, v4, 0x1

    .line 227
    .line 228
    move/from16 v7, v21

    .line 229
    .line 230
    const/4 v8, 0x5

    .line 231
    const/4 v12, 0x3

    .line 232
    const/16 v16, 0x2

    .line 233
    .line 234
    goto :goto_5

    .line 235
    :cond_e
    move/from16 v21, v7

    .line 236
    .line 237
    xor-int/lit8 v19, v19, 0x1

    .line 238
    .line 239
    add-int/lit8 v9, v9, -0x2

    .line 240
    .line 241
    const/4 v4, 0x6

    .line 242
    const/4 v8, 0x5

    .line 243
    const/4 v12, 0x3

    .line 244
    const/16 v16, 0x2

    .line 245
    .line 246
    goto :goto_4

    .line 247
    :cond_f
    move/from16 v21, v7

    .line 248
    .line 249
    if-ne v13, v10, :cond_4e

    .line 250
    .line 251
    iget v3, v0, LO2/g;->d:I

    .line 252
    .line 253
    iget v4, v0, LO2/g;->a:I

    .line 254
    .line 255
    if-ne v10, v3, :cond_4d

    .line 256
    .line 257
    iget-object v0, v0, LO2/g;->c:[LA/l;

    .line 258
    .line 259
    invoke-static {v1}, LL/i;->b(I)I

    .line 260
    .line 261
    .line 262
    move-result v3

    .line 263
    aget-object v0, v0, v3

    .line 264
    .line 265
    iget-object v3, v0, LA/l;->b:Ljava/lang/Object;

    .line 266
    .line 267
    check-cast v3, [LB2/e;

    .line 268
    .line 269
    iget v0, v0, LA/l;->a:I

    .line 270
    .line 271
    array-length v5, v3

    .line 272
    const/4 v6, 0x0

    .line 273
    const/4 v7, 0x0

    .line 274
    :goto_8
    if-ge v7, v5, :cond_10

    .line 275
    .line 276
    aget-object v8, v3, v7

    .line 277
    .line 278
    iget v8, v8, LB2/e;->b:I

    .line 279
    .line 280
    add-int/2addr v6, v8

    .line 281
    add-int/lit8 v7, v7, 0x1

    .line 282
    .line 283
    goto :goto_8

    .line 284
    :cond_10
    new-array v5, v6, [LB2/b;

    .line 285
    .line 286
    array-length v7, v3

    .line 287
    const/4 v8, 0x0

    .line 288
    const/4 v9, 0x0

    .line 289
    :goto_9
    if-ge v9, v7, :cond_12

    .line 290
    .line 291
    aget-object v10, v3, v9

    .line 292
    .line 293
    const/4 v11, 0x0

    .line 294
    :goto_a
    iget v12, v10, LB2/e;->b:I

    .line 295
    .line 296
    if-ge v11, v12, :cond_11

    .line 297
    .line 298
    iget v12, v10, LB2/e;->c:I

    .line 299
    .line 300
    add-int v13, v0, v12

    .line 301
    .line 302
    add-int/lit8 v14, v8, 0x1

    .line 303
    .line 304
    new-instance v15, LB2/b;

    .line 305
    .line 306
    new-array v13, v13, [B

    .line 307
    .line 308
    invoke-direct {v15, v12, v13}, LB2/b;-><init>(I[B)V

    .line 309
    .line 310
    .line 311
    aput-object v15, v5, v8

    .line 312
    .line 313
    add-int/lit8 v11, v11, 0x1

    .line 314
    .line 315
    move v8, v14

    .line 316
    goto :goto_a

    .line 317
    :cond_11
    add-int/lit8 v9, v9, 0x1

    .line 318
    .line 319
    goto :goto_9

    .line 320
    :cond_12
    const/16 v18, 0x0

    .line 321
    .line 322
    aget-object v3, v5, v18

    .line 323
    .line 324
    iget-object v3, v3, LB2/b;->b:[B

    .line 325
    .line 326
    array-length v3, v3

    .line 327
    add-int/lit8 v7, v6, -0x1

    .line 328
    .line 329
    :goto_b
    if-ltz v7, :cond_14

    .line 330
    .line 331
    aget-object v9, v5, v7

    .line 332
    .line 333
    iget-object v9, v9, LB2/b;->b:[B

    .line 334
    .line 335
    array-length v9, v9

    .line 336
    if-ne v9, v3, :cond_13

    .line 337
    .line 338
    goto :goto_c

    .line 339
    :cond_13
    add-int/lit8 v7, v7, -0x1

    .line 340
    .line 341
    goto :goto_b

    .line 342
    :cond_14
    :goto_c
    add-int/lit8 v7, v7, 0x1

    .line 343
    .line 344
    sub-int/2addr v3, v0

    .line 345
    const/4 v0, 0x0

    .line 346
    const/4 v9, 0x0

    .line 347
    :goto_d
    if-ge v0, v3, :cond_16

    .line 348
    .line 349
    move v10, v9

    .line 350
    const/4 v9, 0x0

    .line 351
    :goto_e
    if-ge v9, v8, :cond_15

    .line 352
    .line 353
    aget-object v11, v5, v9

    .line 354
    .line 355
    iget-object v11, v11, LB2/b;->b:[B

    .line 356
    .line 357
    add-int/lit8 v12, v10, 0x1

    .line 358
    .line 359
    aget-byte v10, v2, v10

    .line 360
    .line 361
    aput-byte v10, v11, v0

    .line 362
    .line 363
    add-int/lit8 v9, v9, 0x1

    .line 364
    .line 365
    move v10, v12

    .line 366
    goto :goto_e

    .line 367
    :cond_15
    add-int/lit8 v0, v0, 0x1

    .line 368
    .line 369
    move v9, v10

    .line 370
    goto :goto_d

    .line 371
    :cond_16
    move v0, v7

    .line 372
    :goto_f
    if-ge v0, v8, :cond_17

    .line 373
    .line 374
    aget-object v10, v5, v0

    .line 375
    .line 376
    iget-object v10, v10, LB2/b;->b:[B

    .line 377
    .line 378
    add-int/lit8 v11, v9, 0x1

    .line 379
    .line 380
    aget-byte v9, v2, v9

    .line 381
    .line 382
    aput-byte v9, v10, v3

    .line 383
    .line 384
    add-int/lit8 v0, v0, 0x1

    .line 385
    .line 386
    move v9, v11

    .line 387
    goto :goto_f

    .line 388
    :cond_17
    const/16 v18, 0x0

    .line 389
    .line 390
    aget-object v0, v5, v18

    .line 391
    .line 392
    iget-object v0, v0, LB2/b;->b:[B

    .line 393
    .line 394
    array-length v0, v0

    .line 395
    :goto_10
    if-ge v3, v0, :cond_1a

    .line 396
    .line 397
    move v10, v9

    .line 398
    move/from16 v9, v18

    .line 399
    .line 400
    :goto_11
    if-ge v9, v8, :cond_19

    .line 401
    .line 402
    if-ge v9, v7, :cond_18

    .line 403
    .line 404
    move v11, v3

    .line 405
    goto :goto_12

    .line 406
    :cond_18
    add-int/lit8 v11, v3, 0x1

    .line 407
    .line 408
    :goto_12
    aget-object v12, v5, v9

    .line 409
    .line 410
    iget-object v12, v12, LB2/b;->b:[B

    .line 411
    .line 412
    add-int/lit8 v13, v10, 0x1

    .line 413
    .line 414
    aget-byte v10, v2, v10

    .line 415
    .line 416
    aput-byte v10, v12, v11

    .line 417
    .line 418
    add-int/lit8 v9, v9, 0x1

    .line 419
    .line 420
    move v10, v13

    .line 421
    goto :goto_11

    .line 422
    :cond_19
    add-int/lit8 v3, v3, 0x1

    .line 423
    .line 424
    move v9, v10

    .line 425
    goto :goto_10

    .line 426
    :cond_1a
    move/from16 v0, v18

    .line 427
    .line 428
    move v3, v0

    .line 429
    :goto_13
    if-ge v3, v6, :cond_1b

    .line 430
    .line 431
    aget-object v2, v5, v3

    .line 432
    .line 433
    iget v2, v2, LB2/b;->a:I

    .line 434
    .line 435
    add-int/2addr v0, v2

    .line 436
    add-int/lit8 v3, v3, 0x1

    .line 437
    .line 438
    goto :goto_13

    .line 439
    :cond_1b
    new-array v8, v0, [B

    .line 440
    .line 441
    move/from16 v0, v18

    .line 442
    .line 443
    move v2, v0

    .line 444
    move v3, v2

    .line 445
    :goto_14
    if-ge v3, v6, :cond_1f

    .line 446
    .line 447
    aget-object v7, v5, v3

    .line 448
    .line 449
    iget-object v9, v7, LB2/b;->b:[B

    .line 450
    .line 451
    iget v7, v7, LB2/b;->a:I

    .line 452
    .line 453
    array-length v10, v9

    .line 454
    new-array v11, v10, [I

    .line 455
    .line 456
    move/from16 v12, v18

    .line 457
    .line 458
    :goto_15
    if-ge v12, v10, :cond_1c

    .line 459
    .line 460
    aget-byte v13, v9, v12

    .line 461
    .line 462
    and-int/lit16 v13, v13, 0xff

    .line 463
    .line 464
    aput v13, v11, v12

    .line 465
    .line 466
    add-int/lit8 v12, v12, 0x1

    .line 467
    .line 468
    goto :goto_15

    .line 469
    :cond_1c
    move-object/from16 v15, p0

    .line 470
    .line 471
    :try_start_0
    iget-object v10, v15, LB2/d;->a:Lj3/b;

    .line 472
    .line 473
    array-length v12, v9

    .line 474
    sub-int/2addr v12, v7

    .line 475
    invoke-virtual {v10, v11, v12}, Lj3/b;->l([II)I

    .line 476
    .line 477
    .line 478
    move-result v10
    :try_end_0
    .catch Lz2/b; {:try_start_0 .. :try_end_0} :catch_0

    .line 479
    move/from16 v12, v18

    .line 480
    .line 481
    :goto_16
    if-ge v12, v7, :cond_1d

    .line 482
    .line 483
    aget v13, v11, v12

    .line 484
    .line 485
    int-to-byte v13, v13

    .line 486
    aput-byte v13, v9, v12

    .line 487
    .line 488
    add-int/lit8 v12, v12, 0x1

    .line 489
    .line 490
    goto :goto_16

    .line 491
    :cond_1d
    add-int/2addr v0, v10

    .line 492
    move/from16 v10, v18

    .line 493
    .line 494
    :goto_17
    if-ge v10, v7, :cond_1e

    .line 495
    .line 496
    add-int/lit8 v11, v2, 0x1

    .line 497
    .line 498
    aget-byte v12, v9, v10

    .line 499
    .line 500
    aput-byte v12, v8, v2

    .line 501
    .line 502
    add-int/lit8 v10, v10, 0x1

    .line 503
    .line 504
    move v2, v11

    .line 505
    goto :goto_17

    .line 506
    :cond_1e
    add-int/lit8 v3, v3, 0x1

    .line 507
    .line 508
    goto :goto_14

    .line 509
    :catch_0
    invoke-static {}, Lr2/c;->a()Lr2/c;

    .line 510
    .line 511
    .line 512
    move-result-object v0

    .line 513
    throw v0

    .line 514
    :cond_1f
    move-object/from16 v15, p0

    .line 515
    .line 516
    sget-object v2, LO2/b;->a:[C

    .line 517
    .line 518
    new-instance v9, LT2/s;

    .line 519
    .line 520
    invoke-direct {v9, v8}, LT2/s;-><init>([B)V

    .line 521
    .line 522
    .line 523
    new-instance v10, Ljava/lang/StringBuilder;

    .line 524
    .line 525
    const/16 v2, 0x32

    .line 526
    .line 527
    invoke-direct {v10, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 528
    .line 529
    .line 530
    new-instance v13, Ljava/util/ArrayList;

    .line 531
    .line 532
    move/from16 v2, v21

    .line 533
    .line 534
    invoke-direct {v13, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 535
    .line 536
    .line 537
    const/4 v3, -0x1

    .line 538
    move v7, v3

    .line 539
    move/from16 v19, v7

    .line 540
    .line 541
    move/from16 v3, v18

    .line 542
    .line 543
    move v5, v3

    .line 544
    move v6, v5

    .line 545
    const/4 v12, 0x0

    .line 546
    :goto_18
    :try_start_1
    invoke-virtual {v9}, LT2/s;->a()I

    .line 547
    .line 548
    .line 549
    move-result v11
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    .line 550
    const/16 v22, 0x0

    .line 551
    .line 552
    sget-object v14, LO2/e;->f:LO2/e;

    .line 553
    .line 554
    const/4 v2, 0x4

    .line 555
    if-ge v11, v2, :cond_21

    .line 556
    .line 557
    :cond_20
    move-object v2, v14

    .line 558
    goto :goto_19

    .line 559
    :cond_21
    :try_start_2
    invoke-virtual {v9, v2}, LT2/s;->b(I)I

    .line 560
    .line 561
    .line 562
    move-result v11

    .line 563
    if-eqz v11, :cond_20

    .line 564
    .line 565
    const/4 v2, 0x1

    .line 566
    if-eq v11, v2, :cond_2a

    .line 567
    .line 568
    const/4 v2, 0x2

    .line 569
    if-eq v11, v2, :cond_29

    .line 570
    .line 571
    const/4 v2, 0x3

    .line 572
    if-eq v11, v2, :cond_28

    .line 573
    .line 574
    const/4 v2, 0x4

    .line 575
    if-eq v11, v2, :cond_27

    .line 576
    .line 577
    const/4 v2, 0x5

    .line 578
    if-eq v11, v2, :cond_26

    .line 579
    .line 580
    const/4 v2, 0x7

    .line 581
    if-eq v11, v2, :cond_25

    .line 582
    .line 583
    const/16 v2, 0x8

    .line 584
    .line 585
    if-eq v11, v2, :cond_24

    .line 586
    .line 587
    const/16 v2, 0x9

    .line 588
    .line 589
    if-eq v11, v2, :cond_23

    .line 590
    .line 591
    const/16 v2, 0xd

    .line 592
    .line 593
    if-ne v11, v2, :cond_22

    .line 594
    .line 595
    sget-object v2, LO2/e;->o:LO2/e;

    .line 596
    .line 597
    goto :goto_19

    .line 598
    :cond_22
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 599
    .line 600
    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 601
    .line 602
    .line 603
    throw v0

    .line 604
    :cond_23
    sget-object v2, LO2/e;->n:LO2/e;

    .line 605
    .line 606
    goto :goto_19

    .line 607
    :cond_24
    sget-object v2, LO2/e;->l:LO2/e;

    .line 608
    .line 609
    goto :goto_19

    .line 610
    :cond_25
    sget-object v2, LO2/e;->k:LO2/e;

    .line 611
    .line 612
    goto :goto_19

    .line 613
    :cond_26
    sget-object v2, LO2/e;->m:LO2/e;

    .line 614
    .line 615
    goto :goto_19

    .line 616
    :cond_27
    sget-object v2, LO2/e;->j:LO2/e;

    .line 617
    .line 618
    goto :goto_19

    .line 619
    :cond_28
    sget-object v2, LO2/e;->i:LO2/e;

    .line 620
    .line 621
    goto :goto_19

    .line 622
    :cond_29
    sget-object v2, LO2/e;->h:LO2/e;

    .line 623
    .line 624
    goto :goto_19

    .line 625
    :cond_2a
    sget-object v2, LO2/e;->g:LO2/e;

    .line 626
    .line 627
    :goto_19
    iget-object v11, v2, LO2/e;->e:[I

    .line 628
    .line 629
    move/from16 v25, v0

    .line 630
    .line 631
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 632
    .line 633
    .line 634
    move-result v0

    .line 635
    if-eqz v0, :cond_41

    .line 636
    .line 637
    move/from16 v26, v5

    .line 638
    .line 639
    const/4 v5, 0x3

    .line 640
    if-eq v0, v5, :cond_3f

    .line 641
    .line 642
    const/4 v5, 0x5

    .line 643
    if-eq v0, v5, :cond_3a

    .line 644
    .line 645
    const/4 v5, 0x7

    .line 646
    if-eq v0, v5, :cond_39

    .line 647
    .line 648
    const/16 v5, 0x8

    .line 649
    .line 650
    if-eq v0, v5, :cond_38

    .line 651
    .line 652
    const/16 v5, 0x9

    .line 653
    .line 654
    if-eq v0, v5, :cond_35

    .line 655
    .line 656
    if-gt v4, v5, :cond_2b

    .line 657
    .line 658
    move/from16 v0, v18

    .line 659
    .line 660
    goto :goto_1a

    .line 661
    :cond_2b
    const/16 v0, 0x1a

    .line 662
    .line 663
    if-gt v4, v0, :cond_2c

    .line 664
    .line 665
    const/4 v0, 0x1

    .line 666
    goto :goto_1a

    .line 667
    :cond_2c
    const/4 v0, 0x2

    .line 668
    :goto_1a
    aget v0, v11, v0

    .line 669
    .line 670
    invoke-virtual {v9, v0}, LT2/s;->b(I)I

    .line 671
    .line 672
    .line 673
    move-result v11

    .line 674
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 675
    .line 676
    .line 677
    move-result v0

    .line 678
    const/4 v5, 0x1

    .line 679
    if-eq v0, v5, :cond_34

    .line 680
    .line 681
    const/4 v5, 0x2

    .line 682
    if-eq v0, v5, :cond_33

    .line 683
    .line 684
    const/4 v5, 0x4

    .line 685
    if-eq v0, v5, :cond_32

    .line 686
    .line 687
    const/4 v5, 0x6

    .line 688
    if-ne v0, v5, :cond_31

    .line 689
    .line 690
    mul-int/lit8 v0, v11, 0xd

    .line 691
    .line 692
    invoke-virtual {v9}, LT2/s;->a()I

    .line 693
    .line 694
    .line 695
    move-result v5

    .line 696
    if-gt v0, v5, :cond_30

    .line 697
    .line 698
    mul-int/lit8 v0, v11, 0x2

    .line 699
    .line 700
    new-array v0, v0, [B

    .line 701
    .line 702
    move/from16 v5, v18

    .line 703
    .line 704
    :goto_1b
    if-lez v11, :cond_2e

    .line 705
    .line 706
    move/from16 v24, v5

    .line 707
    .line 708
    move/from16 v23, v6

    .line 709
    .line 710
    const/16 v5, 0xd

    .line 711
    .line 712
    invoke-virtual {v9, v5}, LT2/s;->b(I)I

    .line 713
    .line 714
    .line 715
    move-result v6

    .line 716
    div-int/lit16 v5, v6, 0xc0

    .line 717
    .line 718
    const/16 v17, 0x8

    .line 719
    .line 720
    shl-int/lit8 v5, v5, 0x8

    .line 721
    .line 722
    rem-int/lit16 v6, v6, 0xc0

    .line 723
    .line 724
    or-int/2addr v5, v6

    .line 725
    const/16 v6, 0x1f00

    .line 726
    .line 727
    if-ge v5, v6, :cond_2d

    .line 728
    .line 729
    const v6, 0x8140

    .line 730
    .line 731
    .line 732
    :goto_1c
    add-int/2addr v5, v6

    .line 733
    goto :goto_1d

    .line 734
    :cond_2d
    const v6, 0xc140

    .line 735
    .line 736
    .line 737
    goto :goto_1c

    .line 738
    :goto_1d
    shr-int/lit8 v6, v5, 0x8

    .line 739
    .line 740
    int-to-byte v6, v6

    .line 741
    aput-byte v6, v0, v24

    .line 742
    .line 743
    add-int/lit8 v6, v24, 0x1

    .line 744
    .line 745
    int-to-byte v5, v5

    .line 746
    aput-byte v5, v0, v6

    .line 747
    .line 748
    add-int/lit8 v5, v24, 0x2

    .line 749
    .line 750
    add-int/lit8 v11, v11, -0x1

    .line 751
    .line 752
    move/from16 v6, v23

    .line 753
    .line 754
    goto :goto_1b

    .line 755
    :cond_2e
    move/from16 v23, v6

    .line 756
    .line 757
    new-instance v5, Ljava/lang/String;

    .line 758
    .line 759
    sget-object v6, Lx2/g;->b:Ljava/nio/charset/Charset;

    .line 760
    .line 761
    invoke-direct {v5, v0, v6}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 762
    .line 763
    .line 764
    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 765
    .line 766
    .line 767
    :goto_1e
    move-object v0, v14

    .line 768
    :goto_1f
    const/16 v5, 0x9

    .line 769
    .line 770
    :cond_2f
    :goto_20
    const/16 v6, 0x8

    .line 771
    .line 772
    goto/16 :goto_23

    .line 773
    .line 774
    :cond_30
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 775
    .line 776
    .line 777
    move-result-object v0

    .line 778
    throw v0

    .line 779
    :cond_31
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 780
    .line 781
    .line 782
    move-result-object v0

    .line 783
    throw v0

    .line 784
    :cond_32
    move/from16 v23, v6

    .line 785
    .line 786
    move-object v0, v14

    .line 787
    move-object/from16 v14, p2

    .line 788
    .line 789
    invoke-static/range {v9 .. v14}, LO2/b;->b(LT2/s;Ljava/lang/StringBuilder;ILx2/c;Ljava/util/ArrayList;Ljava/util/Map;)V

    .line 790
    .line 791
    .line 792
    goto :goto_1f

    .line 793
    :cond_33
    move/from16 v23, v6

    .line 794
    .line 795
    move-object v0, v14

    .line 796
    invoke-static {v9, v10, v11, v3}, LO2/b;->a(LT2/s;Ljava/lang/StringBuilder;IZ)V

    .line 797
    .line 798
    .line 799
    goto :goto_1f

    .line 800
    :cond_34
    move/from16 v23, v6

    .line 801
    .line 802
    move-object v0, v14

    .line 803
    invoke-static {v9, v10, v11}, LO2/b;->d(LT2/s;Ljava/lang/StringBuilder;I)V

    .line 804
    .line 805
    .line 806
    goto :goto_1f

    .line 807
    :cond_35
    move/from16 v23, v6

    .line 808
    .line 809
    move-object v0, v14

    .line 810
    const/4 v5, 0x4

    .line 811
    invoke-virtual {v9, v5}, LT2/s;->b(I)I

    .line 812
    .line 813
    .line 814
    move-result v6

    .line 815
    const/16 v5, 0x9

    .line 816
    .line 817
    if-gt v4, v5, :cond_36

    .line 818
    .line 819
    move/from16 v14, v18

    .line 820
    .line 821
    goto :goto_21

    .line 822
    :cond_36
    const/16 v14, 0x1a

    .line 823
    .line 824
    if-gt v4, v14, :cond_37

    .line 825
    .line 826
    const/4 v14, 0x1

    .line 827
    goto :goto_21

    .line 828
    :cond_37
    const/4 v14, 0x2

    .line 829
    :goto_21
    aget v11, v11, v14

    .line 830
    .line 831
    invoke-virtual {v9, v11}, LT2/s;->b(I)I

    .line 832
    .line 833
    .line 834
    move-result v11

    .line 835
    const/4 v14, 0x1

    .line 836
    if-ne v6, v14, :cond_2f

    .line 837
    .line 838
    invoke-static {v9, v10, v11}, LO2/b;->c(LT2/s;Ljava/lang/StringBuilder;I)V

    .line 839
    .line 840
    .line 841
    goto :goto_20

    .line 842
    :cond_38
    move-object v0, v14

    .line 843
    const/16 v5, 0x9

    .line 844
    .line 845
    move-object v3, v12

    .line 846
    move v12, v7

    .line 847
    move-object v7, v3

    .line 848
    const/4 v3, 0x1

    .line 849
    const/16 v6, 0x8

    .line 850
    .line 851
    const/16 v23, 0x1

    .line 852
    .line 853
    goto/16 :goto_24

    .line 854
    .line 855
    :cond_39
    move/from16 v23, v6

    .line 856
    .line 857
    move-object v0, v14

    .line 858
    const/16 v5, 0x9

    .line 859
    .line 860
    move-object v3, v12

    .line 861
    move v12, v7

    .line 862
    move-object v7, v3

    .line 863
    const/4 v3, 0x1

    .line 864
    const/16 v6, 0x8

    .line 865
    .line 866
    const/16 v26, 0x1

    .line 867
    .line 868
    goto/16 :goto_24

    .line 869
    .line 870
    :cond_3a
    move/from16 v23, v6

    .line 871
    .line 872
    move-object v0, v14

    .line 873
    const/16 v5, 0x9

    .line 874
    .line 875
    const/16 v6, 0x8

    .line 876
    .line 877
    invoke-virtual {v9, v6}, LT2/s;->b(I)I

    .line 878
    .line 879
    .line 880
    move-result v11

    .line 881
    and-int/lit16 v6, v11, 0x80

    .line 882
    .line 883
    if-nez v6, :cond_3b

    .line 884
    .line 885
    and-int/lit8 v6, v11, 0x7f

    .line 886
    .line 887
    goto :goto_22

    .line 888
    :cond_3b
    and-int/lit16 v6, v11, 0xc0

    .line 889
    .line 890
    const/16 v12, 0x80

    .line 891
    .line 892
    if-ne v6, v12, :cond_3c

    .line 893
    .line 894
    const/16 v6, 0x8

    .line 895
    .line 896
    invoke-virtual {v9, v6}, LT2/s;->b(I)I

    .line 897
    .line 898
    .line 899
    move-result v12

    .line 900
    and-int/lit8 v11, v11, 0x3f

    .line 901
    .line 902
    shl-int/2addr v11, v6

    .line 903
    or-int v6, v11, v12

    .line 904
    .line 905
    goto :goto_22

    .line 906
    :cond_3c
    and-int/lit16 v6, v11, 0xe0

    .line 907
    .line 908
    const/16 v12, 0xc0

    .line 909
    .line 910
    if-ne v6, v12, :cond_3e

    .line 911
    .line 912
    const/16 v6, 0x10

    .line 913
    .line 914
    invoke-virtual {v9, v6}, LT2/s;->b(I)I

    .line 915
    .line 916
    .line 917
    move-result v12

    .line 918
    and-int/lit8 v11, v11, 0x1f

    .line 919
    .line 920
    shl-int/lit8 v6, v11, 0x10

    .line 921
    .line 922
    or-int/2addr v6, v12

    .line 923
    :goto_22
    invoke-static {v6}, Lx2/c;->a(I)Lx2/c;

    .line 924
    .line 925
    .line 926
    move-result-object v12

    .line 927
    if-eqz v12, :cond_3d

    .line 928
    .line 929
    move-object v6, v12

    .line 930
    move v12, v7

    .line 931
    move-object v7, v6

    .line 932
    const/16 v6, 0x8

    .line 933
    .line 934
    goto :goto_24

    .line 935
    :cond_3d
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 936
    .line 937
    .line 938
    move-result-object v0

    .line 939
    throw v0

    .line 940
    :cond_3e
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 941
    .line 942
    .line 943
    move-result-object v0

    .line 944
    throw v0

    .line 945
    :cond_3f
    move/from16 v23, v6

    .line 946
    .line 947
    move-object v0, v14

    .line 948
    const/16 v5, 0x9

    .line 949
    .line 950
    invoke-virtual {v9}, LT2/s;->a()I

    .line 951
    .line 952
    .line 953
    move-result v6

    .line 954
    const/16 v7, 0x10

    .line 955
    .line 956
    if-lt v6, v7, :cond_40

    .line 957
    .line 958
    const/16 v6, 0x8

    .line 959
    .line 960
    invoke-virtual {v9, v6}, LT2/s;->b(I)I

    .line 961
    .line 962
    .line 963
    move-result v7

    .line 964
    invoke-virtual {v9, v6}, LT2/s;->b(I)I

    .line 965
    .line 966
    .line 967
    move-result v19

    .line 968
    :goto_23
    move-object/from16 v27, v12

    .line 969
    .line 970
    move v12, v7

    .line 971
    move-object/from16 v7, v27

    .line 972
    .line 973
    goto :goto_24

    .line 974
    :cond_40
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 975
    .line 976
    .line 977
    move-result-object v0

    .line 978
    throw v0
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_1

    .line 979
    :cond_41
    move/from16 v26, v5

    .line 980
    .line 981
    move/from16 v23, v6

    .line 982
    .line 983
    goto/16 :goto_1e

    .line 984
    .line 985
    :goto_24
    if-ne v2, v0, :cond_4c

    .line 986
    .line 987
    if-eqz v7, :cond_44

    .line 988
    .line 989
    if-eqz v26, :cond_42

    .line 990
    .line 991
    const/4 v14, 0x4

    .line 992
    goto :goto_25

    .line 993
    :cond_42
    if-eqz v23, :cond_43

    .line 994
    .line 995
    const/4 v14, 0x6

    .line 996
    goto :goto_25

    .line 997
    :cond_43
    const/4 v14, 0x2

    .line 998
    goto :goto_25

    .line 999
    :cond_44
    if-eqz v26, :cond_45

    .line 1000
    .line 1001
    const/4 v14, 0x3

    .line 1002
    goto :goto_25

    .line 1003
    :cond_45
    if-eqz v23, :cond_46

    .line 1004
    .line 1005
    const/4 v14, 0x5

    .line 1006
    goto :goto_25

    .line 1007
    :cond_46
    const/4 v14, 0x1

    .line 1008
    :goto_25
    new-instance v7, Lx2/d;

    .line 1009
    .line 1010
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1011
    .line 1012
    .line 1013
    move-result-object v9

    .line 1014
    invoke-virtual {v13}, Ljava/util/ArrayList;->isEmpty()Z

    .line 1015
    .line 1016
    .line 1017
    move-result v0

    .line 1018
    if-eqz v0, :cond_47

    .line 1019
    .line 1020
    move-object/from16 v10, v22

    .line 1021
    .line 1022
    :goto_26
    const/4 v2, 0x1

    .line 1023
    goto :goto_27

    .line 1024
    :cond_47
    move-object v10, v13

    .line 1025
    goto :goto_26

    .line 1026
    :goto_27
    if-eq v1, v2, :cond_4b

    .line 1027
    .line 1028
    const/4 v0, 0x2

    .line 1029
    if-eq v1, v0, :cond_4a

    .line 1030
    .line 1031
    const/4 v11, 0x3

    .line 1032
    if-eq v1, v11, :cond_49

    .line 1033
    .line 1034
    const/4 v0, 0x4

    .line 1035
    if-ne v1, v0, :cond_48

    .line 1036
    .line 1037
    const-string v0, "H"

    .line 1038
    .line 1039
    :goto_28
    move-object v11, v0

    .line 1040
    move/from16 v13, v19

    .line 1041
    .line 1042
    goto :goto_29

    .line 1043
    :cond_48
    throw v22

    .line 1044
    :cond_49
    const-string v0, "Q"

    .line 1045
    .line 1046
    goto :goto_28

    .line 1047
    :cond_4a
    const-string v0, "M"

    .line 1048
    .line 1049
    goto :goto_28

    .line 1050
    :cond_4b
    const-string v0, "L"

    .line 1051
    .line 1052
    goto :goto_28

    .line 1053
    :goto_29
    invoke-direct/range {v7 .. v14}, Lx2/d;-><init>([BLjava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;III)V

    .line 1054
    .line 1055
    .line 1056
    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1057
    .line 1058
    .line 1059
    move-result-object v0

    .line 1060
    iput-object v0, v7, Lx2/d;->e:Ljava/lang/Integer;

    .line 1061
    .line 1062
    return-object v7

    .line 1063
    :cond_4c
    move v0, v12

    .line 1064
    move-object v12, v7

    .line 1065
    move v7, v0

    .line 1066
    move/from16 v6, v23

    .line 1067
    .line 1068
    move/from16 v0, v25

    .line 1069
    .line 1070
    move/from16 v5, v26

    .line 1071
    .line 1072
    goto/16 :goto_18

    .line 1073
    .line 1074
    :catch_1
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 1075
    .line 1076
    .line 1077
    move-result-object v0

    .line 1078
    throw v0

    .line 1079
    :cond_4d
    move-object/from16 v15, p0

    .line 1080
    .line 1081
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 1082
    .line 1083
    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 1084
    .line 1085
    .line 1086
    throw v0

    .line 1087
    :cond_4e
    move-object/from16 v15, p0

    .line 1088
    .line 1089
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 1090
    .line 1091
    .line 1092
    move-result-object v0

    .line 1093
    throw v0
.end method

.method public c(Lx2/b;)Lx2/d;
    .locals 31

    .line 1
    new-instance v0, LB2/a;

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-direct {v0, v1}, LB2/a;-><init>(Lx2/b;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, v0, LB2/a;->h:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v1, LB2/f;

    .line 11
    .line 12
    iget-object v2, v0, LB2/a;->g:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v2, Lx2/b;

    .line 15
    .line 16
    iget v3, v1, LB2/f;->g:I

    .line 17
    .line 18
    new-array v4, v3, [B

    .line 19
    .line 20
    iget-object v5, v0, LB2/a;->f:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast v5, Lx2/b;

    .line 23
    .line 24
    iget v6, v5, Lx2/b;->f:I

    .line 25
    .line 26
    iget v5, v5, Lx2/b;->e:I

    .line 27
    .line 28
    const/4 v7, 0x0

    .line 29
    move v10, v7

    .line 30
    move v11, v10

    .line 31
    move v12, v11

    .line 32
    move v13, v12

    .line 33
    move v14, v13

    .line 34
    move v15, v14

    .line 35
    const/4 v9, 0x4

    .line 36
    :goto_0
    if-ne v9, v6, :cond_7

    .line 37
    .line 38
    if-nez v10, :cond_7

    .line 39
    .line 40
    if-nez v11, :cond_7

    .line 41
    .line 42
    add-int/lit8 v11, v12, 0x1

    .line 43
    .line 44
    const/16 v17, 0x1

    .line 45
    .line 46
    add-int/lit8 v8, v6, -0x1

    .line 47
    .line 48
    invoke-virtual {v0, v8, v7, v6, v5}, LB2/a;->P(IIII)Z

    .line 49
    .line 50
    .line 51
    move-result v18

    .line 52
    shl-int/lit8 v18, v18, 0x1

    .line 53
    .line 54
    move/from16 v7, v17

    .line 55
    .line 56
    invoke-virtual {v0, v8, v7, v6, v5}, LB2/a;->P(IIII)Z

    .line 57
    .line 58
    .line 59
    move-result v17

    .line 60
    if-eqz v17, :cond_0

    .line 61
    .line 62
    or-int/lit8 v18, v18, 0x1

    .line 63
    .line 64
    :cond_0
    shl-int/lit8 v17, v18, 0x1

    .line 65
    .line 66
    move/from16 v18, v7

    .line 67
    .line 68
    const/4 v7, 0x2

    .line 69
    invoke-virtual {v0, v8, v7, v6, v5}, LB2/a;->P(IIII)Z

    .line 70
    .line 71
    .line 72
    move-result v8

    .line 73
    if-eqz v8, :cond_1

    .line 74
    .line 75
    or-int/lit8 v17, v17, 0x1

    .line 76
    .line 77
    :cond_1
    shl-int/lit8 v7, v17, 0x1

    .line 78
    .line 79
    add-int/lit8 v8, v5, -0x2

    .line 80
    .line 81
    move-object/from16 v20, v4

    .line 82
    .line 83
    const/4 v4, 0x0

    .line 84
    invoke-virtual {v0, v4, v8, v6, v5}, LB2/a;->P(IIII)Z

    .line 85
    .line 86
    .line 87
    move-result v8

    .line 88
    if-eqz v8, :cond_2

    .line 89
    .line 90
    or-int/lit8 v7, v7, 0x1

    .line 91
    .line 92
    :cond_2
    shl-int/lit8 v7, v7, 0x1

    .line 93
    .line 94
    add-int/lit8 v8, v5, -0x1

    .line 95
    .line 96
    invoke-virtual {v0, v4, v8, v6, v5}, LB2/a;->P(IIII)Z

    .line 97
    .line 98
    .line 99
    move-result v17

    .line 100
    if-eqz v17, :cond_3

    .line 101
    .line 102
    or-int/lit8 v7, v7, 0x1

    .line 103
    .line 104
    :cond_3
    shl-int/lit8 v4, v7, 0x1

    .line 105
    .line 106
    move/from16 v7, v18

    .line 107
    .line 108
    invoke-virtual {v0, v7, v8, v6, v5}, LB2/a;->P(IIII)Z

    .line 109
    .line 110
    .line 111
    move-result v17

    .line 112
    if-eqz v17, :cond_4

    .line 113
    .line 114
    or-int/lit8 v4, v4, 0x1

    .line 115
    .line 116
    :cond_4
    shl-int/2addr v4, v7

    .line 117
    move/from16 v17, v7

    .line 118
    .line 119
    const/4 v7, 0x2

    .line 120
    invoke-virtual {v0, v7, v8, v6, v5}, LB2/a;->P(IIII)Z

    .line 121
    .line 122
    .line 123
    move-result v18

    .line 124
    if-eqz v18, :cond_5

    .line 125
    .line 126
    or-int/lit8 v4, v4, 0x1

    .line 127
    .line 128
    :cond_5
    shl-int/lit8 v4, v4, 0x1

    .line 129
    .line 130
    const/4 v7, 0x3

    .line 131
    invoke-virtual {v0, v7, v8, v6, v5}, LB2/a;->P(IIII)Z

    .line 132
    .line 133
    .line 134
    move-result v8

    .line 135
    if-eqz v8, :cond_6

    .line 136
    .line 137
    or-int/lit8 v4, v4, 0x1

    .line 138
    .line 139
    :cond_6
    int-to-byte v4, v4

    .line 140
    aput-byte v4, v20, v12

    .line 141
    .line 142
    add-int/lit8 v9, v9, -0x2

    .line 143
    .line 144
    add-int/lit8 v10, v10, 0x2

    .line 145
    .line 146
    move v12, v11

    .line 147
    const/4 v11, 0x1

    .line 148
    goto/16 :goto_6

    .line 149
    .line 150
    :cond_7
    move-object/from16 v20, v4

    .line 151
    .line 152
    add-int/lit8 v4, v6, -0x2

    .line 153
    .line 154
    if-ne v9, v4, :cond_f

    .line 155
    .line 156
    if-nez v10, :cond_f

    .line 157
    .line 158
    and-int/lit8 v7, v5, 0x3

    .line 159
    .line 160
    if-eqz v7, :cond_f

    .line 161
    .line 162
    if-nez v13, :cond_f

    .line 163
    .line 164
    add-int/lit8 v7, v12, 0x1

    .line 165
    .line 166
    add-int/lit8 v8, v6, -0x3

    .line 167
    .line 168
    const/4 v13, 0x0

    .line 169
    invoke-virtual {v0, v8, v13, v6, v5}, LB2/a;->P(IIII)Z

    .line 170
    .line 171
    .line 172
    move-result v8

    .line 173
    move/from16 v18, v7

    .line 174
    .line 175
    const/4 v7, 0x1

    .line 176
    shl-int/2addr v8, v7

    .line 177
    invoke-virtual {v0, v4, v13, v6, v5}, LB2/a;->P(IIII)Z

    .line 178
    .line 179
    .line 180
    move-result v4

    .line 181
    if-eqz v4, :cond_8

    .line 182
    .line 183
    or-int/lit8 v8, v8, 0x1

    .line 184
    .line 185
    :cond_8
    shl-int/lit8 v4, v8, 0x1

    .line 186
    .line 187
    add-int/lit8 v8, v6, -0x1

    .line 188
    .line 189
    invoke-virtual {v0, v8, v13, v6, v5}, LB2/a;->P(IIII)Z

    .line 190
    .line 191
    .line 192
    move-result v8

    .line 193
    if-eqz v8, :cond_9

    .line 194
    .line 195
    or-int/lit8 v4, v4, 0x1

    .line 196
    .line 197
    :cond_9
    shl-int/2addr v4, v7

    .line 198
    add-int/lit8 v8, v5, -0x4

    .line 199
    .line 200
    invoke-virtual {v0, v13, v8, v6, v5}, LB2/a;->P(IIII)Z

    .line 201
    .line 202
    .line 203
    move-result v8

    .line 204
    if-eqz v8, :cond_a

    .line 205
    .line 206
    or-int/lit8 v4, v4, 0x1

    .line 207
    .line 208
    :cond_a
    shl-int/2addr v4, v7

    .line 209
    add-int/lit8 v8, v5, -0x3

    .line 210
    .line 211
    invoke-virtual {v0, v13, v8, v6, v5}, LB2/a;->P(IIII)Z

    .line 212
    .line 213
    .line 214
    move-result v8

    .line 215
    if-eqz v8, :cond_b

    .line 216
    .line 217
    or-int/lit8 v4, v4, 0x1

    .line 218
    .line 219
    :cond_b
    shl-int/2addr v4, v7

    .line 220
    add-int/lit8 v8, v5, -0x2

    .line 221
    .line 222
    invoke-virtual {v0, v13, v8, v6, v5}, LB2/a;->P(IIII)Z

    .line 223
    .line 224
    .line 225
    move-result v8

    .line 226
    if-eqz v8, :cond_c

    .line 227
    .line 228
    or-int/lit8 v4, v4, 0x1

    .line 229
    .line 230
    :cond_c
    shl-int/2addr v4, v7

    .line 231
    add-int/lit8 v8, v5, -0x1

    .line 232
    .line 233
    invoke-virtual {v0, v13, v8, v6, v5}, LB2/a;->P(IIII)Z

    .line 234
    .line 235
    .line 236
    move-result v17

    .line 237
    if-eqz v17, :cond_d

    .line 238
    .line 239
    or-int/lit8 v4, v4, 0x1

    .line 240
    .line 241
    :cond_d
    shl-int/2addr v4, v7

    .line 242
    invoke-virtual {v0, v7, v8, v6, v5}, LB2/a;->P(IIII)Z

    .line 243
    .line 244
    .line 245
    move-result v8

    .line 246
    if-eqz v8, :cond_e

    .line 247
    .line 248
    or-int/lit8 v4, v4, 0x1

    .line 249
    .line 250
    :cond_e
    int-to-byte v4, v4

    .line 251
    aput-byte v4, v20, v12

    .line 252
    .line 253
    add-int/lit8 v9, v9, -0x2

    .line 254
    .line 255
    add-int/lit8 v10, v10, 0x2

    .line 256
    .line 257
    move/from16 v12, v18

    .line 258
    .line 259
    const/4 v13, 0x1

    .line 260
    goto/16 :goto_6

    .line 261
    .line 262
    :cond_f
    add-int/lit8 v7, v6, 0x4

    .line 263
    .line 264
    if-ne v9, v7, :cond_17

    .line 265
    .line 266
    const/4 v7, 0x2

    .line 267
    if-ne v10, v7, :cond_17

    .line 268
    .line 269
    and-int/lit8 v7, v5, 0x7

    .line 270
    .line 271
    if-nez v7, :cond_17

    .line 272
    .line 273
    if-nez v14, :cond_17

    .line 274
    .line 275
    add-int/lit8 v4, v12, 0x1

    .line 276
    .line 277
    add-int/lit8 v7, v6, -0x1

    .line 278
    .line 279
    const/4 v8, 0x0

    .line 280
    invoke-virtual {v0, v7, v8, v6, v5}, LB2/a;->P(IIII)Z

    .line 281
    .line 282
    .line 283
    move-result v14

    .line 284
    const/4 v8, 0x1

    .line 285
    shl-int/2addr v14, v8

    .line 286
    move/from16 v17, v8

    .line 287
    .line 288
    add-int/lit8 v8, v5, -0x1

    .line 289
    .line 290
    invoke-virtual {v0, v7, v8, v6, v5}, LB2/a;->P(IIII)Z

    .line 291
    .line 292
    .line 293
    move-result v7

    .line 294
    if-eqz v7, :cond_10

    .line 295
    .line 296
    or-int/lit8 v14, v14, 0x1

    .line 297
    .line 298
    :cond_10
    shl-int/lit8 v7, v14, 0x1

    .line 299
    .line 300
    add-int/lit8 v14, v5, -0x3

    .line 301
    .line 302
    move/from16 v18, v4

    .line 303
    .line 304
    const/4 v4, 0x0

    .line 305
    invoke-virtual {v0, v4, v14, v6, v5}, LB2/a;->P(IIII)Z

    .line 306
    .line 307
    .line 308
    move-result v19

    .line 309
    if-eqz v19, :cond_11

    .line 310
    .line 311
    or-int/lit8 v7, v7, 0x1

    .line 312
    .line 313
    :cond_11
    shl-int/lit8 v7, v7, 0x1

    .line 314
    .line 315
    move/from16 v19, v7

    .line 316
    .line 317
    add-int/lit8 v7, v5, -0x2

    .line 318
    .line 319
    invoke-virtual {v0, v4, v7, v6, v5}, LB2/a;->P(IIII)Z

    .line 320
    .line 321
    .line 322
    move-result v21

    .line 323
    if-eqz v21, :cond_12

    .line 324
    .line 325
    or-int/lit8 v19, v19, 0x1

    .line 326
    .line 327
    :cond_12
    shl-int/lit8 v21, v19, 0x1

    .line 328
    .line 329
    invoke-virtual {v0, v4, v8, v6, v5}, LB2/a;->P(IIII)Z

    .line 330
    .line 331
    .line 332
    move-result v22

    .line 333
    if-eqz v22, :cond_13

    .line 334
    .line 335
    or-int/lit8 v21, v21, 0x1

    .line 336
    .line 337
    :cond_13
    shl-int/lit8 v4, v21, 0x1

    .line 338
    .line 339
    move/from16 v21, v4

    .line 340
    .line 341
    move/from16 v4, v17

    .line 342
    .line 343
    invoke-virtual {v0, v4, v14, v6, v5}, LB2/a;->P(IIII)Z

    .line 344
    .line 345
    .line 346
    move-result v14

    .line 347
    if-eqz v14, :cond_14

    .line 348
    .line 349
    or-int/lit8 v14, v21, 0x1

    .line 350
    .line 351
    goto :goto_1

    .line 352
    :cond_14
    move/from16 v14, v21

    .line 353
    .line 354
    :goto_1
    shl-int/2addr v14, v4

    .line 355
    invoke-virtual {v0, v4, v7, v6, v5}, LB2/a;->P(IIII)Z

    .line 356
    .line 357
    .line 358
    move-result v7

    .line 359
    if-eqz v7, :cond_15

    .line 360
    .line 361
    or-int/lit8 v14, v14, 0x1

    .line 362
    .line 363
    :cond_15
    shl-int/lit8 v7, v14, 0x1

    .line 364
    .line 365
    invoke-virtual {v0, v4, v8, v6, v5}, LB2/a;->P(IIII)Z

    .line 366
    .line 367
    .line 368
    move-result v8

    .line 369
    if-eqz v8, :cond_16

    .line 370
    .line 371
    or-int/lit8 v7, v7, 0x1

    .line 372
    .line 373
    :cond_16
    int-to-byte v4, v7

    .line 374
    aput-byte v4, v20, v12

    .line 375
    .line 376
    add-int/lit8 v9, v9, -0x2

    .line 377
    .line 378
    add-int/lit8 v10, v10, 0x2

    .line 379
    .line 380
    move/from16 v12, v18

    .line 381
    .line 382
    const/4 v14, 0x1

    .line 383
    goto/16 :goto_6

    .line 384
    .line 385
    :cond_17
    if-ne v9, v4, :cond_1f

    .line 386
    .line 387
    if-nez v10, :cond_1f

    .line 388
    .line 389
    and-int/lit8 v7, v5, 0x7

    .line 390
    .line 391
    const/4 v8, 0x4

    .line 392
    if-ne v7, v8, :cond_1f

    .line 393
    .line 394
    if-nez v15, :cond_1f

    .line 395
    .line 396
    add-int/lit8 v7, v12, 0x1

    .line 397
    .line 398
    add-int/lit8 v8, v6, -0x3

    .line 399
    .line 400
    const/4 v15, 0x0

    .line 401
    invoke-virtual {v0, v8, v15, v6, v5}, LB2/a;->P(IIII)Z

    .line 402
    .line 403
    .line 404
    move-result v8

    .line 405
    move/from16 v18, v7

    .line 406
    .line 407
    const/4 v7, 0x1

    .line 408
    shl-int/2addr v8, v7

    .line 409
    invoke-virtual {v0, v4, v15, v6, v5}, LB2/a;->P(IIII)Z

    .line 410
    .line 411
    .line 412
    move-result v4

    .line 413
    if-eqz v4, :cond_18

    .line 414
    .line 415
    or-int/lit8 v8, v8, 0x1

    .line 416
    .line 417
    :cond_18
    shl-int/lit8 v4, v8, 0x1

    .line 418
    .line 419
    add-int/lit8 v8, v6, -0x1

    .line 420
    .line 421
    invoke-virtual {v0, v8, v15, v6, v5}, LB2/a;->P(IIII)Z

    .line 422
    .line 423
    .line 424
    move-result v8

    .line 425
    if-eqz v8, :cond_19

    .line 426
    .line 427
    or-int/lit8 v4, v4, 0x1

    .line 428
    .line 429
    :cond_19
    shl-int/2addr v4, v7

    .line 430
    add-int/lit8 v8, v5, -0x2

    .line 431
    .line 432
    invoke-virtual {v0, v15, v8, v6, v5}, LB2/a;->P(IIII)Z

    .line 433
    .line 434
    .line 435
    move-result v8

    .line 436
    if-eqz v8, :cond_1a

    .line 437
    .line 438
    or-int/lit8 v4, v4, 0x1

    .line 439
    .line 440
    :cond_1a
    shl-int/2addr v4, v7

    .line 441
    add-int/lit8 v8, v5, -0x1

    .line 442
    .line 443
    invoke-virtual {v0, v15, v8, v6, v5}, LB2/a;->P(IIII)Z

    .line 444
    .line 445
    .line 446
    move-result v17

    .line 447
    if-eqz v17, :cond_1b

    .line 448
    .line 449
    or-int/lit8 v4, v4, 0x1

    .line 450
    .line 451
    :cond_1b
    shl-int/2addr v4, v7

    .line 452
    invoke-virtual {v0, v7, v8, v6, v5}, LB2/a;->P(IIII)Z

    .line 453
    .line 454
    .line 455
    move-result v15

    .line 456
    if-eqz v15, :cond_1c

    .line 457
    .line 458
    or-int/lit8 v4, v4, 0x1

    .line 459
    .line 460
    :cond_1c
    shl-int/2addr v4, v7

    .line 461
    const/4 v15, 0x2

    .line 462
    invoke-virtual {v0, v15, v8, v6, v5}, LB2/a;->P(IIII)Z

    .line 463
    .line 464
    .line 465
    move-result v17

    .line 466
    if-eqz v17, :cond_1d

    .line 467
    .line 468
    or-int/lit8 v4, v4, 0x1

    .line 469
    .line 470
    :cond_1d
    shl-int/2addr v4, v7

    .line 471
    const/4 v7, 0x3

    .line 472
    invoke-virtual {v0, v7, v8, v6, v5}, LB2/a;->P(IIII)Z

    .line 473
    .line 474
    .line 475
    move-result v8

    .line 476
    if-eqz v8, :cond_1e

    .line 477
    .line 478
    or-int/lit8 v4, v4, 0x1

    .line 479
    .line 480
    :cond_1e
    int-to-byte v4, v4

    .line 481
    aput-byte v4, v20, v12

    .line 482
    .line 483
    add-int/lit8 v9, v9, -0x2

    .line 484
    .line 485
    add-int/lit8 v10, v10, 0x2

    .line 486
    .line 487
    move/from16 v12, v18

    .line 488
    .line 489
    const/4 v15, 0x1

    .line 490
    goto :goto_6

    .line 491
    :cond_1f
    :goto_2
    if-ge v9, v6, :cond_20

    .line 492
    .line 493
    if-ltz v10, :cond_20

    .line 494
    .line 495
    invoke-virtual {v2, v10, v9}, Lx2/b;->b(II)Z

    .line 496
    .line 497
    .line 498
    move-result v4

    .line 499
    if-nez v4, :cond_20

    .line 500
    .line 501
    add-int/lit8 v4, v12, 0x1

    .line 502
    .line 503
    invoke-virtual {v0, v9, v10, v6, v5}, LB2/a;->Q(IIII)I

    .line 504
    .line 505
    .line 506
    move-result v7

    .line 507
    int-to-byte v7, v7

    .line 508
    aput-byte v7, v20, v12

    .line 509
    .line 510
    move v12, v4

    .line 511
    :cond_20
    add-int/lit8 v4, v9, -0x2

    .line 512
    .line 513
    add-int/lit8 v7, v10, 0x2

    .line 514
    .line 515
    if-ltz v4, :cond_22

    .line 516
    .line 517
    if-lt v7, v5, :cond_21

    .line 518
    .line 519
    goto :goto_3

    .line 520
    :cond_21
    move v9, v4

    .line 521
    move v10, v7

    .line 522
    goto :goto_2

    .line 523
    :cond_22
    :goto_3
    add-int/lit8 v9, v9, -0x1

    .line 524
    .line 525
    add-int/lit8 v10, v10, 0x5

    .line 526
    .line 527
    :goto_4
    if-ltz v9, :cond_23

    .line 528
    .line 529
    if-ge v10, v5, :cond_23

    .line 530
    .line 531
    invoke-virtual {v2, v10, v9}, Lx2/b;->b(II)Z

    .line 532
    .line 533
    .line 534
    move-result v4

    .line 535
    if-nez v4, :cond_23

    .line 536
    .line 537
    add-int/lit8 v4, v12, 0x1

    .line 538
    .line 539
    invoke-virtual {v0, v9, v10, v6, v5}, LB2/a;->Q(IIII)I

    .line 540
    .line 541
    .line 542
    move-result v7

    .line 543
    int-to-byte v7, v7

    .line 544
    aput-byte v7, v20, v12

    .line 545
    .line 546
    move v12, v4

    .line 547
    :cond_23
    add-int/lit8 v4, v9, 0x2

    .line 548
    .line 549
    add-int/lit8 v7, v10, -0x2

    .line 550
    .line 551
    if-ge v4, v6, :cond_25

    .line 552
    .line 553
    if-gez v7, :cond_24

    .line 554
    .line 555
    goto :goto_5

    .line 556
    :cond_24
    move v9, v4

    .line 557
    move v10, v7

    .line 558
    goto :goto_4

    .line 559
    :cond_25
    :goto_5
    add-int/lit8 v9, v9, 0x5

    .line 560
    .line 561
    add-int/lit8 v10, v10, -0x1

    .line 562
    .line 563
    :goto_6
    if-lt v9, v6, :cond_89

    .line 564
    .line 565
    if-lt v10, v5, :cond_89

    .line 566
    .line 567
    iget v0, v1, LB2/f;->g:I

    .line 568
    .line 569
    if-ne v12, v0, :cond_88

    .line 570
    .line 571
    iget-object v0, v1, LB2/f;->f:LA/l;

    .line 572
    .line 573
    iget-object v2, v0, LA/l;->b:Ljava/lang/Object;

    .line 574
    .line 575
    check-cast v2, [LB2/e;

    .line 576
    .line 577
    iget v0, v0, LA/l;->a:I

    .line 578
    .line 579
    array-length v4, v2

    .line 580
    const/4 v5, 0x0

    .line 581
    const/4 v6, 0x0

    .line 582
    :goto_7
    if-ge v5, v4, :cond_26

    .line 583
    .line 584
    aget-object v7, v2, v5

    .line 585
    .line 586
    iget v7, v7, LB2/e;->b:I

    .line 587
    .line 588
    add-int/2addr v6, v7

    .line 589
    add-int/lit8 v5, v5, 0x1

    .line 590
    .line 591
    goto :goto_7

    .line 592
    :cond_26
    new-array v4, v6, [LB2/b;

    .line 593
    .line 594
    array-length v5, v2

    .line 595
    const/4 v7, 0x0

    .line 596
    const/4 v8, 0x0

    .line 597
    :goto_8
    if-ge v7, v5, :cond_28

    .line 598
    .line 599
    aget-object v9, v2, v7

    .line 600
    .line 601
    const/4 v10, 0x0

    .line 602
    :goto_9
    iget v11, v9, LB2/e;->b:I

    .line 603
    .line 604
    if-ge v10, v11, :cond_27

    .line 605
    .line 606
    iget v11, v9, LB2/e;->c:I

    .line 607
    .line 608
    add-int v12, v0, v11

    .line 609
    .line 610
    add-int/lit8 v13, v8, 0x1

    .line 611
    .line 612
    new-instance v14, LB2/b;

    .line 613
    .line 614
    new-array v12, v12, [B

    .line 615
    .line 616
    invoke-direct {v14, v11, v12}, LB2/b;-><init>(I[B)V

    .line 617
    .line 618
    .line 619
    aput-object v14, v4, v8

    .line 620
    .line 621
    add-int/lit8 v10, v10, 0x1

    .line 622
    .line 623
    move v8, v13

    .line 624
    goto :goto_9

    .line 625
    :cond_27
    add-int/lit8 v7, v7, 0x1

    .line 626
    .line 627
    goto :goto_8

    .line 628
    :cond_28
    const/16 v19, 0x0

    .line 629
    .line 630
    aget-object v2, v4, v19

    .line 631
    .line 632
    iget-object v2, v2, LB2/b;->b:[B

    .line 633
    .line 634
    array-length v2, v2

    .line 635
    sub-int/2addr v2, v0

    .line 636
    add-int/lit8 v0, v2, -0x1

    .line 637
    .line 638
    const/4 v5, 0x0

    .line 639
    const/4 v7, 0x0

    .line 640
    :goto_a
    if-ge v5, v0, :cond_2a

    .line 641
    .line 642
    const/4 v9, 0x0

    .line 643
    :goto_b
    if-ge v9, v8, :cond_29

    .line 644
    .line 645
    aget-object v10, v4, v9

    .line 646
    .line 647
    iget-object v10, v10, LB2/b;->b:[B

    .line 648
    .line 649
    add-int/lit8 v11, v7, 0x1

    .line 650
    .line 651
    aget-byte v7, v20, v7

    .line 652
    .line 653
    aput-byte v7, v10, v5

    .line 654
    .line 655
    add-int/lit8 v9, v9, 0x1

    .line 656
    .line 657
    move v7, v11

    .line 658
    goto :goto_b

    .line 659
    :cond_29
    add-int/lit8 v5, v5, 0x1

    .line 660
    .line 661
    goto :goto_a

    .line 662
    :cond_2a
    iget v1, v1, LB2/f;->a:I

    .line 663
    .line 664
    const/16 v5, 0x18

    .line 665
    .line 666
    if-ne v1, v5, :cond_2b

    .line 667
    .line 668
    const/4 v1, 0x1

    .line 669
    goto :goto_c

    .line 670
    :cond_2b
    const/4 v1, 0x0

    .line 671
    :goto_c
    const/16 v5, 0x8

    .line 672
    .line 673
    if-eqz v1, :cond_2c

    .line 674
    .line 675
    move v9, v5

    .line 676
    goto :goto_d

    .line 677
    :cond_2c
    move v9, v8

    .line 678
    :goto_d
    const/4 v10, 0x0

    .line 679
    :goto_e
    if-ge v10, v9, :cond_2d

    .line 680
    .line 681
    aget-object v11, v4, v10

    .line 682
    .line 683
    iget-object v11, v11, LB2/b;->b:[B

    .line 684
    .line 685
    add-int/lit8 v12, v7, 0x1

    .line 686
    .line 687
    aget-byte v7, v20, v7

    .line 688
    .line 689
    aput-byte v7, v11, v0

    .line 690
    .line 691
    add-int/lit8 v10, v10, 0x1

    .line 692
    .line 693
    move v7, v12

    .line 694
    goto :goto_e

    .line 695
    :cond_2d
    const/16 v19, 0x0

    .line 696
    .line 697
    aget-object v0, v4, v19

    .line 698
    .line 699
    iget-object v0, v0, LB2/b;->b:[B

    .line 700
    .line 701
    array-length v0, v0

    .line 702
    :goto_f
    const/4 v9, 0x7

    .line 703
    if-ge v2, v0, :cond_31

    .line 704
    .line 705
    const/4 v10, 0x0

    .line 706
    :goto_10
    if-ge v10, v8, :cond_30

    .line 707
    .line 708
    if-eqz v1, :cond_2e

    .line 709
    .line 710
    add-int/lit8 v11, v10, 0x8

    .line 711
    .line 712
    rem-int/2addr v11, v8

    .line 713
    goto :goto_11

    .line 714
    :cond_2e
    move v11, v10

    .line 715
    :goto_11
    if-eqz v1, :cond_2f

    .line 716
    .line 717
    if-le v11, v9, :cond_2f

    .line 718
    .line 719
    add-int/lit8 v12, v2, -0x1

    .line 720
    .line 721
    goto :goto_12

    .line 722
    :cond_2f
    move v12, v2

    .line 723
    :goto_12
    aget-object v11, v4, v11

    .line 724
    .line 725
    iget-object v11, v11, LB2/b;->b:[B

    .line 726
    .line 727
    add-int/lit8 v13, v7, 0x1

    .line 728
    .line 729
    aget-byte v7, v20, v7

    .line 730
    .line 731
    aput-byte v7, v11, v12

    .line 732
    .line 733
    add-int/lit8 v10, v10, 0x1

    .line 734
    .line 735
    move v7, v13

    .line 736
    goto :goto_10

    .line 737
    :cond_30
    add-int/lit8 v2, v2, 0x1

    .line 738
    .line 739
    goto :goto_f

    .line 740
    :cond_31
    if-ne v7, v3, :cond_87

    .line 741
    .line 742
    const/4 v0, 0x0

    .line 743
    const/4 v1, 0x0

    .line 744
    :goto_13
    if-ge v0, v6, :cond_32

    .line 745
    .line 746
    aget-object v2, v4, v0

    .line 747
    .line 748
    iget v2, v2, LB2/b;->a:I

    .line 749
    .line 750
    add-int/2addr v1, v2

    .line 751
    add-int/lit8 v0, v0, 0x1

    .line 752
    .line 753
    goto :goto_13

    .line 754
    :cond_32
    new-array v0, v1, [B

    .line 755
    .line 756
    const/4 v1, 0x0

    .line 757
    const/4 v2, 0x0

    .line 758
    :goto_14
    if-ge v2, v6, :cond_36

    .line 759
    .line 760
    aget-object v3, v4, v2

    .line 761
    .line 762
    iget-object v7, v3, LB2/b;->b:[B

    .line 763
    .line 764
    iget v3, v3, LB2/b;->a:I

    .line 765
    .line 766
    array-length v8, v7

    .line 767
    new-array v10, v8, [I

    .line 768
    .line 769
    const/4 v11, 0x0

    .line 770
    :goto_15
    if-ge v11, v8, :cond_33

    .line 771
    .line 772
    aget-byte v12, v7, v11

    .line 773
    .line 774
    and-int/lit16 v12, v12, 0xff

    .line 775
    .line 776
    aput v12, v10, v11

    .line 777
    .line 778
    add-int/lit8 v11, v11, 0x1

    .line 779
    .line 780
    goto :goto_15

    .line 781
    :cond_33
    move-object/from16 v11, p0

    .line 782
    .line 783
    :try_start_0
    iget-object v8, v11, LB2/d;->a:Lj3/b;

    .line 784
    .line 785
    array-length v12, v7

    .line 786
    sub-int/2addr v12, v3

    .line 787
    invoke-virtual {v8, v10, v12}, Lj3/b;->l([II)I

    .line 788
    .line 789
    .line 790
    move-result v8
    :try_end_0
    .catch Lz2/b; {:try_start_0 .. :try_end_0} :catch_0

    .line 791
    const/4 v12, 0x0

    .line 792
    :goto_16
    if-ge v12, v3, :cond_34

    .line 793
    .line 794
    aget v13, v10, v12

    .line 795
    .line 796
    int-to-byte v13, v13

    .line 797
    aput-byte v13, v7, v12

    .line 798
    .line 799
    add-int/lit8 v12, v12, 0x1

    .line 800
    .line 801
    goto :goto_16

    .line 802
    :cond_34
    add-int/2addr v1, v8

    .line 803
    const/4 v8, 0x0

    .line 804
    :goto_17
    if-ge v8, v3, :cond_35

    .line 805
    .line 806
    mul-int v10, v8, v6

    .line 807
    .line 808
    add-int/2addr v10, v2

    .line 809
    aget-byte v12, v7, v8

    .line 810
    .line 811
    aput-byte v12, v0, v10

    .line 812
    .line 813
    add-int/lit8 v8, v8, 0x1

    .line 814
    .line 815
    goto :goto_17

    .line 816
    :cond_35
    add-int/lit8 v2, v2, 0x1

    .line 817
    .line 818
    goto :goto_14

    .line 819
    :catch_0
    invoke-static {}, Lr2/c;->a()Lr2/c;

    .line 820
    .line 821
    .line 822
    move-result-object v0

    .line 823
    throw v0

    .line 824
    :cond_36
    move-object/from16 v11, p0

    .line 825
    .line 826
    const/4 v2, 0x5

    .line 827
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 828
    .line 829
    .line 830
    move-result-object v3

    .line 831
    const/4 v8, 0x4

    .line 832
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 833
    .line 834
    .line 835
    move-result-object v4

    .line 836
    new-instance v6, LT2/s;

    .line 837
    .line 838
    invoke-direct {v6, v0}, LT2/s;-><init>([B)V

    .line 839
    .line 840
    .line 841
    new-instance v7, Lm/x0;

    .line 842
    .line 843
    const/16 v8, 0x64

    .line 844
    .line 845
    invoke-direct {v7, v8}, Lm/x0;-><init>(I)V

    .line 846
    .line 847
    .line 848
    new-instance v8, Ljava/lang/StringBuilder;

    .line 849
    .line 850
    const/4 v15, 0x0

    .line 851
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 852
    .line 853
    .line 854
    move-result-object v10

    .line 855
    invoke-direct {v8, v15}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 856
    .line 857
    .line 858
    new-instance v12, Ljava/util/ArrayList;

    .line 859
    .line 860
    const/4 v13, 0x1

    .line 861
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 862
    .line 863
    .line 864
    move-result-object v14

    .line 865
    invoke-direct {v12, v13}, Ljava/util/ArrayList;-><init>(I)V

    .line 866
    .line 867
    .line 868
    new-instance v13, Ljava/util/HashSet;

    .line 869
    .line 870
    invoke-direct {v13}, Ljava/util/HashSet;-><init>()V

    .line 871
    .line 872
    .line 873
    const/4 v2, 0x2

    .line 874
    const/4 v15, 0x0

    .line 875
    :goto_18
    const/4 v9, 0x2

    .line 876
    if-ne v2, v9, :cond_3f

    .line 877
    .line 878
    const/4 v2, 0x0

    .line 879
    :goto_19
    invoke-virtual {v6, v5}, LT2/s;->b(I)I

    .line 880
    .line 881
    .line 882
    move-result v9

    .line 883
    if-eqz v9, :cond_3e

    .line 884
    .line 885
    const/16 v5, 0x80

    .line 886
    .line 887
    if-gt v9, v5, :cond_38

    .line 888
    .line 889
    if-eqz v2, :cond_37

    .line 890
    .line 891
    add-int/lit16 v9, v9, 0x80

    .line 892
    .line 893
    :cond_37
    const/16 v17, 0x1

    .line 894
    .line 895
    add-int/lit8 v9, v9, -0x1

    .line 896
    .line 897
    int-to-char v2, v9

    .line 898
    invoke-virtual {v7, v2}, Lm/x0;->s(C)V

    .line 899
    .line 900
    .line 901
    move-object/from16 v25, v0

    .line 902
    .line 903
    move/from16 v19, v1

    .line 904
    .line 905
    const/4 v0, 0x0

    .line 906
    :goto_1a
    const/4 v1, 0x2

    .line 907
    goto/16 :goto_1d

    .line 908
    .line 909
    :cond_38
    const/16 v5, 0x81

    .line 910
    .line 911
    if-ne v9, v5, :cond_39

    .line 912
    .line 913
    move-object/from16 v25, v0

    .line 914
    .line 915
    move/from16 v19, v1

    .line 916
    .line 917
    const/4 v0, 0x0

    .line 918
    const/4 v1, 0x1

    .line 919
    goto/16 :goto_1d

    .line 920
    .line 921
    :cond_39
    const/16 v5, 0xe5

    .line 922
    .line 923
    if-gt v9, v5, :cond_3b

    .line 924
    .line 925
    add-int/lit16 v9, v9, -0x82

    .line 926
    .line 927
    const/16 v5, 0xa

    .line 928
    .line 929
    if-ge v9, v5, :cond_3a

    .line 930
    .line 931
    const/16 v5, 0x30

    .line 932
    .line 933
    invoke-virtual {v7, v5}, Lm/x0;->s(C)V

    .line 934
    .line 935
    .line 936
    :cond_3a
    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 937
    .line 938
    .line 939
    move-result-object v5

    .line 940
    iget-object v9, v7, Lm/x0;->f:Ljava/lang/Object;

    .line 941
    .line 942
    check-cast v9, Ljava/lang/StringBuilder;

    .line 943
    .line 944
    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 945
    .line 946
    .line 947
    :pswitch_0
    move-object/from16 v25, v0

    .line 948
    .line 949
    :goto_1b
    move/from16 v19, v1

    .line 950
    .line 951
    const/4 v0, 0x0

    .line 952
    goto/16 :goto_1c

    .line 953
    .line 954
    :cond_3b
    const-string v5, "\u001e\u0004"

    .line 955
    .line 956
    packed-switch v9, :pswitch_data_0

    .line 957
    .line 958
    .line 959
    move-object/from16 v25, v0

    .line 960
    .line 961
    const/16 v0, 0xfe

    .line 962
    .line 963
    if-ne v9, v0, :cond_3c

    .line 964
    .line 965
    invoke-virtual {v6}, LT2/s;->a()I

    .line 966
    .line 967
    .line 968
    move-result v0

    .line 969
    if-nez v0, :cond_3c

    .line 970
    .line 971
    goto :goto_1b

    .line 972
    :cond_3c
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 973
    .line 974
    .line 975
    move-result-object v0

    .line 976
    throw v0

    .line 977
    :pswitch_1
    move-object/from16 v25, v0

    .line 978
    .line 979
    move/from16 v19, v1

    .line 980
    .line 981
    const/4 v0, 0x0

    .line 982
    const/16 v1, 0x8

    .line 983
    .line 984
    goto/16 :goto_1d

    .line 985
    .line 986
    :pswitch_2
    move-object/from16 v25, v0

    .line 987
    .line 988
    move/from16 v19, v1

    .line 989
    .line 990
    const/4 v0, 0x0

    .line 991
    const/4 v1, 0x6

    .line 992
    goto/16 :goto_1d

    .line 993
    .line 994
    :pswitch_3
    move-object/from16 v25, v0

    .line 995
    .line 996
    move/from16 v19, v1

    .line 997
    .line 998
    const/4 v0, 0x0

    .line 999
    const/4 v1, 0x4

    .line 1000
    goto/16 :goto_1d

    .line 1001
    .line 1002
    :pswitch_4
    move-object/from16 v25, v0

    .line 1003
    .line 1004
    move/from16 v19, v1

    .line 1005
    .line 1006
    const/4 v0, 0x0

    .line 1007
    const/4 v1, 0x5

    .line 1008
    goto :goto_1d

    .line 1009
    :pswitch_5
    move-object/from16 v25, v0

    .line 1010
    .line 1011
    iget-object v0, v7, Lm/x0;->f:Ljava/lang/Object;

    .line 1012
    .line 1013
    check-cast v0, Ljava/lang/StringBuilder;

    .line 1014
    .line 1015
    const-string v9, "[)>\u001e06\u001d"

    .line 1016
    .line 1017
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1018
    .line 1019
    .line 1020
    const/4 v0, 0x0

    .line 1021
    invoke-virtual {v8, v0, v5}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 1022
    .line 1023
    .line 1024
    move/from16 v19, v1

    .line 1025
    .line 1026
    goto :goto_1c

    .line 1027
    :pswitch_6
    move-object/from16 v25, v0

    .line 1028
    .line 1029
    const/4 v0, 0x0

    .line 1030
    iget-object v9, v7, Lm/x0;->f:Ljava/lang/Object;

    .line 1031
    .line 1032
    check-cast v9, Ljava/lang/StringBuilder;

    .line 1033
    .line 1034
    move/from16 v19, v1

    .line 1035
    .line 1036
    const-string v1, "[)>\u001e05\u001d"

    .line 1037
    .line 1038
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1039
    .line 1040
    .line 1041
    invoke-virtual {v8, v0, v5}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 1042
    .line 1043
    .line 1044
    goto :goto_1c

    .line 1045
    :pswitch_7
    move-object/from16 v25, v0

    .line 1046
    .line 1047
    move/from16 v19, v1

    .line 1048
    .line 1049
    const/4 v0, 0x0

    .line 1050
    const/4 v2, 0x1

    .line 1051
    goto :goto_1c

    .line 1052
    :pswitch_8
    move-object/from16 v25, v0

    .line 1053
    .line 1054
    move/from16 v19, v1

    .line 1055
    .line 1056
    const/4 v0, 0x0

    .line 1057
    invoke-virtual {v7}, Lm/x0;->toString()Ljava/lang/String;

    .line 1058
    .line 1059
    .line 1060
    move-result-object v1

    .line 1061
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 1062
    .line 1063
    .line 1064
    move-result v1

    .line 1065
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1066
    .line 1067
    .line 1068
    move-result-object v1

    .line 1069
    invoke-virtual {v13, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1070
    .line 1071
    .line 1072
    const/16 v1, 0x1d

    .line 1073
    .line 1074
    invoke-virtual {v7, v1}, Lm/x0;->s(C)V

    .line 1075
    .line 1076
    .line 1077
    :goto_1c
    invoke-virtual {v6}, LT2/s;->a()I

    .line 1078
    .line 1079
    .line 1080
    move-result v1

    .line 1081
    if-gtz v1, :cond_3d

    .line 1082
    .line 1083
    goto/16 :goto_1a

    .line 1084
    .line 1085
    :cond_3d
    move/from16 v1, v19

    .line 1086
    .line 1087
    move-object/from16 v0, v25

    .line 1088
    .line 1089
    const/16 v5, 0x8

    .line 1090
    .line 1091
    goto/16 :goto_19

    .line 1092
    .line 1093
    :pswitch_9
    move-object/from16 v25, v0

    .line 1094
    .line 1095
    move/from16 v19, v1

    .line 1096
    .line 1097
    const/4 v0, 0x0

    .line 1098
    const/4 v1, 0x7

    .line 1099
    goto :goto_1d

    .line 1100
    :pswitch_a
    move-object/from16 v25, v0

    .line 1101
    .line 1102
    move/from16 v19, v1

    .line 1103
    .line 1104
    const/4 v0, 0x0

    .line 1105
    const/4 v1, 0x3

    .line 1106
    :goto_1d
    move v2, v1

    .line 1107
    const/16 v20, 0x6

    .line 1108
    .line 1109
    :goto_1e
    const/4 v0, 0x1

    .line 1110
    goto/16 :goto_35

    .line 1111
    .line 1112
    :cond_3e
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 1113
    .line 1114
    .line 1115
    move-result-object v0

    .line 1116
    throw v0

    .line 1117
    :cond_3f
    move-object/from16 v25, v0

    .line 1118
    .line 1119
    move/from16 v19, v1

    .line 1120
    .line 1121
    const/4 v0, 0x0

    .line 1122
    invoke-static {v2}, LL/i;->b(I)I

    .line 1123
    .line 1124
    .line 1125
    move-result v1

    .line 1126
    packed-switch v1, :pswitch_data_1

    .line 1127
    .line 1128
    .line 1129
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 1130
    .line 1131
    .line 1132
    move-result-object v0

    .line 1133
    throw v0

    .line 1134
    :pswitch_b
    invoke-virtual {v6}, LT2/s;->a()I

    .line 1135
    .line 1136
    .line 1137
    move-result v0

    .line 1138
    const/16 v1, 0x8

    .line 1139
    .line 1140
    if-lt v0, v1, :cond_41

    .line 1141
    .line 1142
    invoke-virtual {v6, v1}, LT2/s;->b(I)I

    .line 1143
    .line 1144
    .line 1145
    move-result v0

    .line 1146
    const/16 v1, 0x7f

    .line 1147
    .line 1148
    if-gt v0, v1, :cond_40

    .line 1149
    .line 1150
    add-int/lit8 v0, v0, -0x1

    .line 1151
    .line 1152
    invoke-virtual {v7, v0}, Lm/x0;->t(I)V

    .line 1153
    .line 1154
    .line 1155
    :cond_40
    const/4 v15, 0x1

    .line 1156
    :goto_1f
    const/16 v20, 0x6

    .line 1157
    .line 1158
    goto/16 :goto_34

    .line 1159
    .line 1160
    :cond_41
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 1161
    .line 1162
    .line 1163
    move-result-object v0

    .line 1164
    throw v0

    .line 1165
    :pswitch_c
    iget v0, v6, LT2/s;->b:I

    .line 1166
    .line 1167
    add-int/lit8 v1, v0, 0x1

    .line 1168
    .line 1169
    const/16 v2, 0x8

    .line 1170
    .line 1171
    invoke-virtual {v6, v2}, LT2/s;->b(I)I

    .line 1172
    .line 1173
    .line 1174
    move-result v5

    .line 1175
    add-int/lit8 v9, v0, 0x2

    .line 1176
    .line 1177
    invoke-static {v5, v1}, LB2/c;->b(II)I

    .line 1178
    .line 1179
    .line 1180
    move-result v1

    .line 1181
    if-nez v1, :cond_42

    .line 1182
    .line 1183
    invoke-virtual {v6}, LT2/s;->a()I

    .line 1184
    .line 1185
    .line 1186
    move-result v0

    .line 1187
    div-int/lit8 v1, v0, 0x8

    .line 1188
    .line 1189
    goto :goto_20

    .line 1190
    :cond_42
    const/16 v5, 0xfa

    .line 1191
    .line 1192
    if-ge v1, v5, :cond_43

    .line 1193
    .line 1194
    goto :goto_20

    .line 1195
    :cond_43
    add-int/lit16 v1, v1, -0xf9

    .line 1196
    .line 1197
    mul-int/2addr v1, v5

    .line 1198
    invoke-virtual {v6, v2}, LT2/s;->b(I)I

    .line 1199
    .line 1200
    .line 1201
    move-result v5

    .line 1202
    add-int/lit8 v0, v0, 0x3

    .line 1203
    .line 1204
    invoke-static {v5, v9}, LB2/c;->b(II)I

    .line 1205
    .line 1206
    .line 1207
    move-result v5

    .line 1208
    add-int/2addr v1, v5

    .line 1209
    move v9, v0

    .line 1210
    :goto_20
    if-ltz v1, :cond_46

    .line 1211
    .line 1212
    new-array v0, v1, [B

    .line 1213
    .line 1214
    const/4 v5, 0x0

    .line 1215
    :goto_21
    if-ge v5, v1, :cond_45

    .line 1216
    .line 1217
    move/from16 v22, v1

    .line 1218
    .line 1219
    invoke-virtual {v6}, LT2/s;->a()I

    .line 1220
    .line 1221
    .line 1222
    move-result v1

    .line 1223
    if-lt v1, v2, :cond_44

    .line 1224
    .line 1225
    invoke-virtual {v6, v2}, LT2/s;->b(I)I

    .line 1226
    .line 1227
    .line 1228
    move-result v1

    .line 1229
    add-int/lit8 v2, v9, 0x1

    .line 1230
    .line 1231
    invoke-static {v1, v9}, LB2/c;->b(II)I

    .line 1232
    .line 1233
    .line 1234
    move-result v1

    .line 1235
    int-to-byte v1, v1

    .line 1236
    aput-byte v1, v0, v5

    .line 1237
    .line 1238
    add-int/lit8 v5, v5, 0x1

    .line 1239
    .line 1240
    move v9, v2

    .line 1241
    move/from16 v1, v22

    .line 1242
    .line 1243
    const/16 v2, 0x8

    .line 1244
    .line 1245
    goto :goto_21

    .line 1246
    :cond_44
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 1247
    .line 1248
    .line 1249
    move-result-object v0

    .line 1250
    throw v0

    .line 1251
    :cond_45
    invoke-virtual {v12, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1252
    .line 1253
    .line 1254
    new-instance v1, Ljava/lang/String;

    .line 1255
    .line 1256
    sget-object v2, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    .line 1257
    .line 1258
    invoke-direct {v1, v0, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 1259
    .line 1260
    .line 1261
    iget-object v0, v7, Lm/x0;->f:Ljava/lang/Object;

    .line 1262
    .line 1263
    check-cast v0, Ljava/lang/StringBuilder;

    .line 1264
    .line 1265
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1266
    .line 1267
    .line 1268
    goto :goto_1f

    .line 1269
    :cond_46
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 1270
    .line 1271
    .line 1272
    move-result-object v0

    .line 1273
    throw v0

    .line 1274
    :cond_47
    :pswitch_d
    invoke-virtual {v6}, LT2/s;->a()I

    .line 1275
    .line 1276
    .line 1277
    move-result v0

    .line 1278
    const/16 v1, 0x10

    .line 1279
    .line 1280
    if-gt v0, v1, :cond_48

    .line 1281
    .line 1282
    const/4 v1, 0x4

    .line 1283
    const/4 v2, 0x6

    .line 1284
    goto :goto_23

    .line 1285
    :cond_48
    const/4 v0, 0x0

    .line 1286
    const/4 v1, 0x4

    .line 1287
    :goto_22
    if-ge v0, v1, :cond_4b

    .line 1288
    .line 1289
    const/4 v2, 0x6

    .line 1290
    invoke-virtual {v6, v2}, LT2/s;->b(I)I

    .line 1291
    .line 1292
    .line 1293
    move-result v5

    .line 1294
    const/16 v9, 0x1f

    .line 1295
    .line 1296
    if-ne v5, v9, :cond_49

    .line 1297
    .line 1298
    iget v0, v6, LT2/s;->c:I

    .line 1299
    .line 1300
    const/16 v5, 0x8

    .line 1301
    .line 1302
    rsub-int/lit8 v0, v0, 0x8

    .line 1303
    .line 1304
    if-eq v0, v5, :cond_4c

    .line 1305
    .line 1306
    invoke-virtual {v6, v0}, LT2/s;->b(I)I

    .line 1307
    .line 1308
    .line 1309
    goto :goto_23

    .line 1310
    :cond_49
    and-int/lit8 v9, v5, 0x20

    .line 1311
    .line 1312
    if-nez v9, :cond_4a

    .line 1313
    .line 1314
    or-int/lit8 v5, v5, 0x40

    .line 1315
    .line 1316
    :cond_4a
    int-to-char v5, v5

    .line 1317
    invoke-virtual {v7, v5}, Lm/x0;->s(C)V

    .line 1318
    .line 1319
    .line 1320
    add-int/lit8 v0, v0, 0x1

    .line 1321
    .line 1322
    goto :goto_22

    .line 1323
    :cond_4b
    const/4 v2, 0x6

    .line 1324
    invoke-virtual {v6}, LT2/s;->a()I

    .line 1325
    .line 1326
    .line 1327
    move-result v0

    .line 1328
    if-gtz v0, :cond_47

    .line 1329
    .line 1330
    :cond_4c
    :goto_23
    move/from16 v20, v2

    .line 1331
    .line 1332
    goto/16 :goto_34

    .line 1333
    .line 1334
    :pswitch_e
    const/4 v2, 0x6

    .line 1335
    const/4 v5, 0x3

    .line 1336
    new-array v1, v5, [I

    .line 1337
    .line 1338
    :goto_24
    invoke-virtual {v6}, LT2/s;->a()I

    .line 1339
    .line 1340
    .line 1341
    move-result v2

    .line 1342
    const/16 v0, 0x8

    .line 1343
    .line 1344
    if-ne v2, v0, :cond_4d

    .line 1345
    .line 1346
    goto :goto_27

    .line 1347
    :cond_4d
    invoke-virtual {v6, v0}, LT2/s;->b(I)I

    .line 1348
    .line 1349
    .line 1350
    move-result v2

    .line 1351
    const/16 v9, 0xfe

    .line 1352
    .line 1353
    if-ne v2, v9, :cond_4e

    .line 1354
    .line 1355
    goto :goto_27

    .line 1356
    :cond_4e
    invoke-virtual {v6, v0}, LT2/s;->b(I)I

    .line 1357
    .line 1358
    .line 1359
    move-result v9

    .line 1360
    invoke-static {v2, v9, v1}, LB2/c;->a(II[I)V

    .line 1361
    .line 1362
    .line 1363
    const/4 v0, 0x0

    .line 1364
    :goto_25
    if-ge v0, v5, :cond_55

    .line 1365
    .line 1366
    aget v2, v1, v0

    .line 1367
    .line 1368
    if-eqz v2, :cond_54

    .line 1369
    .line 1370
    const/4 v9, 0x1

    .line 1371
    if-eq v2, v9, :cond_53

    .line 1372
    .line 1373
    const/4 v9, 0x2

    .line 1374
    if-eq v2, v9, :cond_52

    .line 1375
    .line 1376
    if-eq v2, v5, :cond_51

    .line 1377
    .line 1378
    const/16 v5, 0xe

    .line 1379
    .line 1380
    if-ge v2, v5, :cond_4f

    .line 1381
    .line 1382
    add-int/lit8 v2, v2, 0x2c

    .line 1383
    .line 1384
    int-to-char v2, v2

    .line 1385
    invoke-virtual {v7, v2}, Lm/x0;->s(C)V

    .line 1386
    .line 1387
    .line 1388
    goto :goto_26

    .line 1389
    :cond_4f
    const/16 v5, 0x28

    .line 1390
    .line 1391
    if-ge v2, v5, :cond_50

    .line 1392
    .line 1393
    add-int/lit8 v2, v2, 0x33

    .line 1394
    .line 1395
    int-to-char v2, v2

    .line 1396
    invoke-virtual {v7, v2}, Lm/x0;->s(C)V

    .line 1397
    .line 1398
    .line 1399
    goto :goto_26

    .line 1400
    :cond_50
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 1401
    .line 1402
    .line 1403
    move-result-object v0

    .line 1404
    throw v0

    .line 1405
    :cond_51
    const/16 v2, 0x20

    .line 1406
    .line 1407
    invoke-virtual {v7, v2}, Lm/x0;->s(C)V

    .line 1408
    .line 1409
    .line 1410
    goto :goto_26

    .line 1411
    :cond_52
    const/16 v2, 0x3e

    .line 1412
    .line 1413
    invoke-virtual {v7, v2}, Lm/x0;->s(C)V

    .line 1414
    .line 1415
    .line 1416
    goto :goto_26

    .line 1417
    :cond_53
    const/16 v2, 0x2a

    .line 1418
    .line 1419
    invoke-virtual {v7, v2}, Lm/x0;->s(C)V

    .line 1420
    .line 1421
    .line 1422
    goto :goto_26

    .line 1423
    :cond_54
    const/16 v2, 0xd

    .line 1424
    .line 1425
    invoke-virtual {v7, v2}, Lm/x0;->s(C)V

    .line 1426
    .line 1427
    .line 1428
    :goto_26
    add-int/lit8 v0, v0, 0x1

    .line 1429
    .line 1430
    const/4 v5, 0x3

    .line 1431
    goto :goto_25

    .line 1432
    :cond_55
    invoke-virtual {v6}, LT2/s;->a()I

    .line 1433
    .line 1434
    .line 1435
    move-result v0

    .line 1436
    if-gtz v0, :cond_56

    .line 1437
    .line 1438
    :goto_27
    goto/16 :goto_1f

    .line 1439
    .line 1440
    :cond_56
    const/4 v5, 0x3

    .line 1441
    goto :goto_24

    .line 1442
    :pswitch_f
    const/4 v0, 0x3

    .line 1443
    const/16 v20, 0x6

    .line 1444
    .line 1445
    new-array v1, v0, [I

    .line 1446
    .line 1447
    const/4 v9, 0x0

    .line 1448
    const/16 v16, 0x0

    .line 1449
    .line 1450
    :goto_28
    invoke-virtual {v6}, LT2/s;->a()I

    .line 1451
    .line 1452
    .line 1453
    move-result v2

    .line 1454
    const/16 v5, 0x8

    .line 1455
    .line 1456
    if-ne v2, v5, :cond_57

    .line 1457
    .line 1458
    goto/16 :goto_34

    .line 1459
    .line 1460
    :cond_57
    invoke-virtual {v6, v5}, LT2/s;->b(I)I

    .line 1461
    .line 1462
    .line 1463
    move-result v2

    .line 1464
    const/16 v0, 0xfe

    .line 1465
    .line 1466
    if-ne v2, v0, :cond_58

    .line 1467
    .line 1468
    goto/16 :goto_34

    .line 1469
    .line 1470
    :cond_58
    invoke-virtual {v6, v5}, LT2/s;->b(I)I

    .line 1471
    .line 1472
    .line 1473
    move-result v0

    .line 1474
    invoke-static {v2, v0, v1}, LB2/c;->a(II[I)V

    .line 1475
    .line 1476
    .line 1477
    move/from16 v2, v16

    .line 1478
    .line 1479
    const/4 v0, 0x0

    .line 1480
    :goto_29
    const/4 v5, 0x3

    .line 1481
    if-ge v0, v5, :cond_67

    .line 1482
    .line 1483
    aget v5, v1, v0

    .line 1484
    .line 1485
    if-eqz v2, :cond_63

    .line 1486
    .line 1487
    move/from16 v30, v0

    .line 1488
    .line 1489
    const/4 v0, 0x1

    .line 1490
    if-eq v2, v0, :cond_61

    .line 1491
    .line 1492
    const/4 v0, 0x2

    .line 1493
    if-eq v2, v0, :cond_5c

    .line 1494
    .line 1495
    const/4 v0, 0x3

    .line 1496
    if-ne v2, v0, :cond_5b

    .line 1497
    .line 1498
    const/16 v0, 0x20

    .line 1499
    .line 1500
    if-ge v5, v0, :cond_5a

    .line 1501
    .line 1502
    sget-object v2, LB2/c;->e:[C

    .line 1503
    .line 1504
    aget-char v2, v2, v5

    .line 1505
    .line 1506
    if-eqz v9, :cond_59

    .line 1507
    .line 1508
    add-int/lit16 v2, v2, 0x80

    .line 1509
    .line 1510
    int-to-char v2, v2

    .line 1511
    invoke-virtual {v7, v2}, Lm/x0;->s(C)V

    .line 1512
    .line 1513
    .line 1514
    :goto_2a
    const/4 v9, 0x0

    .line 1515
    goto :goto_2b

    .line 1516
    :cond_59
    invoke-virtual {v7, v2}, Lm/x0;->s(C)V

    .line 1517
    .line 1518
    .line 1519
    :goto_2b
    const/4 v2, 0x0

    .line 1520
    goto/16 :goto_2c

    .line 1521
    .line 1522
    :cond_5a
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 1523
    .line 1524
    .line 1525
    move-result-object v0

    .line 1526
    throw v0

    .line 1527
    :cond_5b
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 1528
    .line 1529
    .line 1530
    move-result-object v0

    .line 1531
    throw v0

    .line 1532
    :cond_5c
    const/16 v0, 0x20

    .line 1533
    .line 1534
    const/16 v2, 0x1b

    .line 1535
    .line 1536
    if-ge v5, v2, :cond_5e

    .line 1537
    .line 1538
    sget-object v2, LB2/c;->d:[C

    .line 1539
    .line 1540
    aget-char v2, v2, v5

    .line 1541
    .line 1542
    if-eqz v9, :cond_5d

    .line 1543
    .line 1544
    add-int/lit16 v2, v2, 0x80

    .line 1545
    .line 1546
    int-to-char v2, v2

    .line 1547
    invoke-virtual {v7, v2}, Lm/x0;->s(C)V

    .line 1548
    .line 1549
    .line 1550
    goto :goto_2a

    .line 1551
    :cond_5d
    invoke-virtual {v7, v2}, Lm/x0;->s(C)V

    .line 1552
    .line 1553
    .line 1554
    goto :goto_2b

    .line 1555
    :cond_5e
    if-eq v5, v2, :cond_60

    .line 1556
    .line 1557
    const/16 v2, 0x1e

    .line 1558
    .line 1559
    if-ne v5, v2, :cond_5f

    .line 1560
    .line 1561
    const/4 v9, 0x1

    .line 1562
    goto :goto_2b

    .line 1563
    :cond_5f
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 1564
    .line 1565
    .line 1566
    move-result-object v0

    .line 1567
    throw v0

    .line 1568
    :cond_60
    invoke-virtual {v7}, Lm/x0;->toString()Ljava/lang/String;

    .line 1569
    .line 1570
    .line 1571
    move-result-object v2

    .line 1572
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 1573
    .line 1574
    .line 1575
    move-result v2

    .line 1576
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1577
    .line 1578
    .line 1579
    move-result-object v2

    .line 1580
    invoke-virtual {v13, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1581
    .line 1582
    .line 1583
    const/16 v2, 0x1d

    .line 1584
    .line 1585
    invoke-virtual {v7, v2}, Lm/x0;->s(C)V

    .line 1586
    .line 1587
    .line 1588
    goto :goto_2b

    .line 1589
    :cond_61
    const/16 v0, 0x20

    .line 1590
    .line 1591
    if-eqz v9, :cond_62

    .line 1592
    .line 1593
    add-int/lit16 v5, v5, 0x80

    .line 1594
    .line 1595
    int-to-char v2, v5

    .line 1596
    invoke-virtual {v7, v2}, Lm/x0;->s(C)V

    .line 1597
    .line 1598
    .line 1599
    goto :goto_2a

    .line 1600
    :cond_62
    int-to-char v2, v5

    .line 1601
    invoke-virtual {v7, v2}, Lm/x0;->s(C)V

    .line 1602
    .line 1603
    .line 1604
    goto :goto_2b

    .line 1605
    :cond_63
    move/from16 v30, v0

    .line 1606
    .line 1607
    const/4 v0, 0x3

    .line 1608
    if-ge v5, v0, :cond_64

    .line 1609
    .line 1610
    add-int/lit8 v0, v5, 0x1

    .line 1611
    .line 1612
    move v2, v0

    .line 1613
    goto :goto_2c

    .line 1614
    :cond_64
    const/16 v0, 0x28

    .line 1615
    .line 1616
    if-ge v5, v0, :cond_66

    .line 1617
    .line 1618
    sget-object v0, LB2/c;->c:[C

    .line 1619
    .line 1620
    aget-char v0, v0, v5

    .line 1621
    .line 1622
    if-eqz v9, :cond_65

    .line 1623
    .line 1624
    add-int/lit16 v0, v0, 0x80

    .line 1625
    .line 1626
    int-to-char v0, v0

    .line 1627
    invoke-virtual {v7, v0}, Lm/x0;->s(C)V

    .line 1628
    .line 1629
    .line 1630
    const/4 v9, 0x0

    .line 1631
    goto :goto_2c

    .line 1632
    :cond_65
    invoke-virtual {v7, v0}, Lm/x0;->s(C)V

    .line 1633
    .line 1634
    .line 1635
    :goto_2c
    add-int/lit8 v0, v30, 0x1

    .line 1636
    .line 1637
    goto/16 :goto_29

    .line 1638
    .line 1639
    :cond_66
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 1640
    .line 1641
    .line 1642
    move-result-object v0

    .line 1643
    throw v0

    .line 1644
    :cond_67
    invoke-virtual {v6}, LT2/s;->a()I

    .line 1645
    .line 1646
    .line 1647
    move-result v0

    .line 1648
    if-gtz v0, :cond_68

    .line 1649
    .line 1650
    goto/16 :goto_34

    .line 1651
    .line 1652
    :cond_68
    move/from16 v16, v2

    .line 1653
    .line 1654
    const/4 v0, 0x3

    .line 1655
    goto/16 :goto_28

    .line 1656
    .line 1657
    :pswitch_10
    const/4 v0, 0x3

    .line 1658
    const/16 v20, 0x6

    .line 1659
    .line 1660
    new-array v1, v0, [I

    .line 1661
    .line 1662
    const/4 v2, 0x0

    .line 1663
    const/4 v5, 0x0

    .line 1664
    :goto_2d
    invoke-virtual {v6}, LT2/s;->a()I

    .line 1665
    .line 1666
    .line 1667
    move-result v9

    .line 1668
    const/16 v0, 0x8

    .line 1669
    .line 1670
    if-ne v9, v0, :cond_69

    .line 1671
    .line 1672
    goto/16 :goto_34

    .line 1673
    .line 1674
    :cond_69
    invoke-virtual {v6, v0}, LT2/s;->b(I)I

    .line 1675
    .line 1676
    .line 1677
    move-result v9

    .line 1678
    const/16 v0, 0xfe

    .line 1679
    .line 1680
    if-ne v9, v0, :cond_6a

    .line 1681
    .line 1682
    goto/16 :goto_34

    .line 1683
    .line 1684
    :cond_6a
    move/from16 v24, v2

    .line 1685
    .line 1686
    const/16 v0, 0x8

    .line 1687
    .line 1688
    invoke-virtual {v6, v0}, LT2/s;->b(I)I

    .line 1689
    .line 1690
    .line 1691
    move-result v2

    .line 1692
    invoke-static {v9, v2, v1}, LB2/c;->a(II[I)V

    .line 1693
    .line 1694
    .line 1695
    move v9, v5

    .line 1696
    move/from16 v2, v24

    .line 1697
    .line 1698
    const/4 v5, 0x0

    .line 1699
    :goto_2e
    const/4 v0, 0x3

    .line 1700
    if-ge v5, v0, :cond_78

    .line 1701
    .line 1702
    aget v0, v1, v5

    .line 1703
    .line 1704
    if-eqz v9, :cond_74

    .line 1705
    .line 1706
    move-object/from16 v27, v1

    .line 1707
    .line 1708
    const/4 v1, 0x1

    .line 1709
    if-eq v9, v1, :cond_72

    .line 1710
    .line 1711
    const/4 v1, 0x2

    .line 1712
    if-eq v9, v1, :cond_6d

    .line 1713
    .line 1714
    const/4 v1, 0x3

    .line 1715
    if-ne v9, v1, :cond_6c

    .line 1716
    .line 1717
    if-eqz v2, :cond_6b

    .line 1718
    .line 1719
    add-int/lit16 v0, v0, 0xe0

    .line 1720
    .line 1721
    int-to-char v0, v0

    .line 1722
    invoke-virtual {v7, v0}, Lm/x0;->s(C)V

    .line 1723
    .line 1724
    .line 1725
    const/4 v2, 0x0

    .line 1726
    goto :goto_2f

    .line 1727
    :cond_6b
    add-int/lit8 v0, v0, 0x60

    .line 1728
    .line 1729
    int-to-char v0, v0

    .line 1730
    invoke-virtual {v7, v0}, Lm/x0;->s(C)V

    .line 1731
    .line 1732
    .line 1733
    :goto_2f
    const/16 v1, 0x28

    .line 1734
    .line 1735
    const/4 v9, 0x0

    .line 1736
    const/16 v22, 0x1d

    .line 1737
    .line 1738
    const/16 v29, 0x1e

    .line 1739
    .line 1740
    goto/16 :goto_33

    .line 1741
    .line 1742
    :cond_6c
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 1743
    .line 1744
    .line 1745
    move-result-object v0

    .line 1746
    throw v0

    .line 1747
    :cond_6d
    const/16 v1, 0x1b

    .line 1748
    .line 1749
    if-ge v0, v1, :cond_6f

    .line 1750
    .line 1751
    sget-object v1, LB2/c;->b:[C

    .line 1752
    .line 1753
    aget-char v0, v1, v0

    .line 1754
    .line 1755
    if-eqz v2, :cond_6e

    .line 1756
    .line 1757
    add-int/lit16 v0, v0, 0x80

    .line 1758
    .line 1759
    int-to-char v0, v0

    .line 1760
    invoke-virtual {v7, v0}, Lm/x0;->s(C)V

    .line 1761
    .line 1762
    .line 1763
    const/4 v2, 0x0

    .line 1764
    goto :goto_30

    .line 1765
    :cond_6e
    invoke-virtual {v7, v0}, Lm/x0;->s(C)V

    .line 1766
    .line 1767
    .line 1768
    :goto_30
    const/16 v0, 0x1d

    .line 1769
    .line 1770
    const/16 v1, 0x1b

    .line 1771
    .line 1772
    const/16 v9, 0x1e

    .line 1773
    .line 1774
    goto :goto_31

    .line 1775
    :cond_6f
    if-eq v0, v1, :cond_71

    .line 1776
    .line 1777
    const/16 v9, 0x1e

    .line 1778
    .line 1779
    if-ne v0, v9, :cond_70

    .line 1780
    .line 1781
    const/16 v0, 0x1d

    .line 1782
    .line 1783
    const/4 v2, 0x1

    .line 1784
    goto :goto_31

    .line 1785
    :cond_70
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 1786
    .line 1787
    .line 1788
    move-result-object v0

    .line 1789
    throw v0

    .line 1790
    :cond_71
    const/16 v9, 0x1e

    .line 1791
    .line 1792
    invoke-virtual {v7}, Lm/x0;->toString()Ljava/lang/String;

    .line 1793
    .line 1794
    .line 1795
    move-result-object v0

    .line 1796
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 1797
    .line 1798
    .line 1799
    move-result v0

    .line 1800
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1801
    .line 1802
    .line 1803
    move-result-object v0

    .line 1804
    invoke-virtual {v13, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 1805
    .line 1806
    .line 1807
    const/16 v0, 0x1d

    .line 1808
    .line 1809
    invoke-virtual {v7, v0}, Lm/x0;->s(C)V

    .line 1810
    .line 1811
    .line 1812
    :goto_31
    move/from16 v22, v0

    .line 1813
    .line 1814
    :goto_32
    move/from16 v29, v9

    .line 1815
    .line 1816
    const/16 v1, 0x28

    .line 1817
    .line 1818
    const/4 v9, 0x0

    .line 1819
    goto :goto_33

    .line 1820
    :cond_72
    const/16 v1, 0x1b

    .line 1821
    .line 1822
    const/16 v9, 0x1e

    .line 1823
    .line 1824
    const/16 v22, 0x1d

    .line 1825
    .line 1826
    if-eqz v2, :cond_73

    .line 1827
    .line 1828
    add-int/lit16 v0, v0, 0x80

    .line 1829
    .line 1830
    int-to-char v0, v0

    .line 1831
    invoke-virtual {v7, v0}, Lm/x0;->s(C)V

    .line 1832
    .line 1833
    .line 1834
    const/4 v2, 0x0

    .line 1835
    goto :goto_32

    .line 1836
    :cond_73
    int-to-char v0, v0

    .line 1837
    invoke-virtual {v7, v0}, Lm/x0;->s(C)V

    .line 1838
    .line 1839
    .line 1840
    goto :goto_32

    .line 1841
    :cond_74
    move-object/from16 v27, v1

    .line 1842
    .line 1843
    const/4 v1, 0x3

    .line 1844
    const/16 v22, 0x1d

    .line 1845
    .line 1846
    const/16 v29, 0x1e

    .line 1847
    .line 1848
    if-ge v0, v1, :cond_75

    .line 1849
    .line 1850
    add-int/lit8 v0, v0, 0x1

    .line 1851
    .line 1852
    move v9, v0

    .line 1853
    const/16 v1, 0x28

    .line 1854
    .line 1855
    goto :goto_33

    .line 1856
    :cond_75
    const/16 v1, 0x28

    .line 1857
    .line 1858
    if-ge v0, v1, :cond_77

    .line 1859
    .line 1860
    sget-object v28, LB2/c;->a:[C

    .line 1861
    .line 1862
    aget-char v0, v28, v0

    .line 1863
    .line 1864
    if-eqz v2, :cond_76

    .line 1865
    .line 1866
    add-int/lit16 v0, v0, 0x80

    .line 1867
    .line 1868
    int-to-char v0, v0

    .line 1869
    invoke-virtual {v7, v0}, Lm/x0;->s(C)V

    .line 1870
    .line 1871
    .line 1872
    const/4 v2, 0x0

    .line 1873
    goto :goto_33

    .line 1874
    :cond_76
    invoke-virtual {v7, v0}, Lm/x0;->s(C)V

    .line 1875
    .line 1876
    .line 1877
    :goto_33
    add-int/lit8 v5, v5, 0x1

    .line 1878
    .line 1879
    move-object/from16 v1, v27

    .line 1880
    .line 1881
    goto/16 :goto_2e

    .line 1882
    .line 1883
    :cond_77
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 1884
    .line 1885
    .line 1886
    move-result-object v0

    .line 1887
    throw v0

    .line 1888
    :cond_78
    move-object/from16 v27, v1

    .line 1889
    .line 1890
    const/16 v1, 0x28

    .line 1891
    .line 1892
    const/16 v22, 0x1d

    .line 1893
    .line 1894
    const/16 v29, 0x1e

    .line 1895
    .line 1896
    invoke-virtual {v6}, LT2/s;->a()I

    .line 1897
    .line 1898
    .line 1899
    move-result v0

    .line 1900
    if-gtz v0, :cond_86

    .line 1901
    .line 1902
    :goto_34
    const/4 v2, 0x2

    .line 1903
    goto/16 :goto_1e

    .line 1904
    .line 1905
    :goto_35
    if-eq v2, v0, :cond_7a

    .line 1906
    .line 1907
    invoke-virtual {v6}, LT2/s;->a()I

    .line 1908
    .line 1909
    .line 1910
    move-result v1

    .line 1911
    if-gtz v1, :cond_79

    .line 1912
    .line 1913
    goto :goto_36

    .line 1914
    :cond_79
    move/from16 v1, v19

    .line 1915
    .line 1916
    move-object/from16 v0, v25

    .line 1917
    .line 1918
    const/16 v5, 0x8

    .line 1919
    .line 1920
    goto/16 :goto_18

    .line 1921
    .line 1922
    :cond_7a
    :goto_36
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->length()I

    .line 1923
    .line 1924
    .line 1925
    move-result v1

    .line 1926
    if-lez v1, :cond_7b

    .line 1927
    .line 1928
    invoke-virtual {v7}, Lm/x0;->A()V

    .line 1929
    .line 1930
    .line 1931
    iget-object v1, v7, Lm/x0;->g:Ljava/lang/Object;

    .line 1932
    .line 1933
    check-cast v1, Ljava/lang/StringBuilder;

    .line 1934
    .line 1935
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 1936
    .line 1937
    .line 1938
    :cond_7b
    if-eqz v15, :cond_80

    .line 1939
    .line 1940
    invoke-virtual {v13, v10}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 1941
    .line 1942
    .line 1943
    move-result v0

    .line 1944
    if-nez v0, :cond_7f

    .line 1945
    .line 1946
    invoke-virtual {v13, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 1947
    .line 1948
    .line 1949
    move-result v0

    .line 1950
    if-eqz v0, :cond_7c

    .line 1951
    .line 1952
    goto :goto_38

    .line 1953
    :cond_7c
    invoke-virtual {v13, v14}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 1954
    .line 1955
    .line 1956
    move-result v0

    .line 1957
    if-nez v0, :cond_7e

    .line 1958
    .line 1959
    invoke-virtual {v13, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 1960
    .line 1961
    .line 1962
    move-result v0

    .line 1963
    if-eqz v0, :cond_7d

    .line 1964
    .line 1965
    goto :goto_37

    .line 1966
    :cond_7d
    const/16 v27, 0x4

    .line 1967
    .line 1968
    goto :goto_3b

    .line 1969
    :cond_7e
    :goto_37
    move/from16 v27, v20

    .line 1970
    .line 1971
    goto :goto_3b

    .line 1972
    :cond_7f
    :goto_38
    const/16 v27, 0x5

    .line 1973
    .line 1974
    goto :goto_3b

    .line 1975
    :cond_80
    invoke-virtual {v13, v10}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 1976
    .line 1977
    .line 1978
    move-result v1

    .line 1979
    if-nez v1, :cond_84

    .line 1980
    .line 1981
    invoke-virtual {v13, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 1982
    .line 1983
    .line 1984
    move-result v1

    .line 1985
    if-eqz v1, :cond_81

    .line 1986
    .line 1987
    goto :goto_3a

    .line 1988
    :cond_81
    invoke-virtual {v13, v14}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 1989
    .line 1990
    .line 1991
    move-result v1

    .line 1992
    if-nez v1, :cond_83

    .line 1993
    .line 1994
    invoke-virtual {v13, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 1995
    .line 1996
    .line 1997
    move-result v1

    .line 1998
    if-eqz v1, :cond_82

    .line 1999
    .line 2000
    goto :goto_39

    .line 2001
    :cond_82
    move/from16 v27, v0

    .line 2002
    .line 2003
    goto :goto_3b

    .line 2004
    :cond_83
    :goto_39
    const/16 v27, 0x3

    .line 2005
    .line 2006
    goto :goto_3b

    .line 2007
    :cond_84
    :goto_3a
    const/16 v27, 0x2

    .line 2008
    .line 2009
    :goto_3b
    new-instance v20, Lx2/d;

    .line 2010
    .line 2011
    invoke-virtual {v7}, Lm/x0;->toString()Ljava/lang/String;

    .line 2012
    .line 2013
    .line 2014
    move-result-object v22

    .line 2015
    invoke-virtual {v12}, Ljava/util/ArrayList;->isEmpty()Z

    .line 2016
    .line 2017
    .line 2018
    move-result v0

    .line 2019
    if-eqz v0, :cond_85

    .line 2020
    .line 2021
    const/4 v12, 0x0

    .line 2022
    :cond_85
    move-object/from16 v23, v12

    .line 2023
    .line 2024
    move-object/from16 v21, v25

    .line 2025
    .line 2026
    const/16 v25, -0x1

    .line 2027
    .line 2028
    const/16 v26, -0x1

    .line 2029
    .line 2030
    const/16 v24, 0x0

    .line 2031
    .line 2032
    invoke-direct/range {v20 .. v27}, Lx2/d;-><init>([BLjava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;III)V

    .line 2033
    .line 2034
    .line 2035
    move-object/from16 v0, v20

    .line 2036
    .line 2037
    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2038
    .line 2039
    .line 2040
    move-result-object v1

    .line 2041
    iput-object v1, v0, Lx2/d;->e:Ljava/lang/Integer;

    .line 2042
    .line 2043
    return-object v0

    .line 2044
    :cond_86
    move v5, v9

    .line 2045
    move-object/from16 v1, v27

    .line 2046
    .line 2047
    const/4 v0, 0x3

    .line 2048
    goto/16 :goto_2d

    .line 2049
    .line 2050
    :cond_87
    move-object/from16 v11, p0

    .line 2051
    .line 2052
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 2053
    .line 2054
    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 2055
    .line 2056
    .line 2057
    throw v0

    .line 2058
    :cond_88
    move-object/from16 v11, p0

    .line 2059
    .line 2060
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 2061
    .line 2062
    .line 2063
    move-result-object v0

    .line 2064
    throw v0

    .line 2065
    :cond_89
    const/4 v8, 0x4

    .line 2066
    const/16 v19, 0x0

    .line 2067
    .line 2068
    move/from16 v7, v19

    .line 2069
    .line 2070
    move-object/from16 v4, v20

    .line 2071
    .line 2072
    goto/16 :goto_0

    .line 2073
    .line 2074
    nop

    :pswitch_data_0
    .packed-switch 0xe6
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_0
        :pswitch_0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x2
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
    .end packed-switch
.end method

.method public d(Lx2/b;Ljava/util/Map;)Lx2/d;
    .locals 8

    .line 1
    new-instance v0, LO2/a;

    .line 2
    .line 3
    invoke-direct {v0, p1}, LO2/a;-><init>(Lx2/b;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    :try_start_0
    invoke-virtual {p0, v0, p2}, LB2/d;->b(LO2/a;Ljava/util/Map;)Lx2/d;

    .line 8
    .line 9
    .line 10
    move-result-object p1
    :try_end_0
    .catch Lr2/e; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lr2/c; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    return-object p1

    .line 12
    :catch_0
    move-exception v1

    .line 13
    move-object v2, v1

    .line 14
    move-object v1, p1

    .line 15
    goto :goto_0

    .line 16
    :catch_1
    move-exception v1

    .line 17
    move-object v2, p1

    .line 18
    :goto_0
    :try_start_1
    invoke-virtual {v0}, LO2/a;->d()V

    .line 19
    .line 20
    .line 21
    iput-object p1, v0, LO2/a;->b:LO2/g;

    .line 22
    .line 23
    iput-object p1, v0, LO2/a;->c:LO2/d;

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    iput-boolean p1, v0, LO2/a;->d:Z

    .line 27
    .line 28
    invoke-virtual {v0}, LO2/a;->c()LO2/g;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, LO2/a;->b()LO2/d;

    .line 32
    .line 33
    .line 34
    iget-object p1, v0, LO2/a;->a:Lx2/b;

    .line 35
    .line 36
    const/4 v3, 0x0

    .line 37
    :goto_1
    iget v4, p1, Lx2/b;->e:I

    .line 38
    .line 39
    if-ge v3, v4, :cond_2

    .line 40
    .line 41
    add-int/lit8 v4, v3, 0x1

    .line 42
    .line 43
    move v5, v4

    .line 44
    :goto_2
    iget v6, p1, Lx2/b;->f:I

    .line 45
    .line 46
    if-ge v5, v6, :cond_1

    .line 47
    .line 48
    invoke-virtual {p1, v3, v5}, Lx2/b;->b(II)Z

    .line 49
    .line 50
    .line 51
    move-result v6

    .line 52
    invoke-virtual {p1, v5, v3}, Lx2/b;->b(II)Z

    .line 53
    .line 54
    .line 55
    move-result v7

    .line 56
    if-eq v6, v7, :cond_0

    .line 57
    .line 58
    invoke-virtual {p1, v5, v3}, Lx2/b;->a(II)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1, v3, v5}, Lx2/b;->a(II)V

    .line 62
    .line 63
    .line 64
    :cond_0
    add-int/lit8 v5, v5, 0x1

    .line 65
    .line 66
    goto :goto_2

    .line 67
    :cond_1
    move v3, v4

    .line 68
    goto :goto_1

    .line 69
    :cond_2
    invoke-virtual {p0, v0, p2}, LB2/d;->b(LO2/a;Ljava/util/Map;)Lx2/d;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    new-instance p2, LO2/f;

    .line 74
    .line 75
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 76
    .line 77
    .line 78
    iput-object p2, p1, Lx2/d;->g:Ljava/lang/Object;
    :try_end_1
    .catch Lr2/e; {:try_start_1 .. :try_end_1} :catch_2
    .catch Lr2/c; {:try_start_1 .. :try_end_1} :catch_2

    .line 79
    .line 80
    return-object p1

    .line 81
    :catch_2
    if-eqz v1, :cond_3

    .line 82
    .line 83
    throw v1

    .line 84
    :cond_3
    throw v2
.end method
