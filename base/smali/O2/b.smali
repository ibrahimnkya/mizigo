.class public abstract LO2/b;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:[C


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ $%*+-./:"

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, LO2/b;->a:[C

    .line 8
    .line 9
    return-void
.end method

.method public static a(LT2/s;Ljava/lang/StringBuilder;IZ)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    :goto_0
    const/4 v1, 0x1

    .line 6
    if-le p2, v1, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0}, LT2/s;->a()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/16 v2, 0xb

    .line 13
    .line 14
    if-lt v1, v2, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, v2}, LT2/s;->b(I)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    div-int/lit8 v2, v1, 0x2d

    .line 21
    .line 22
    invoke-static {v2}, LO2/b;->e(I)C

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    rem-int/lit8 v1, v1, 0x2d

    .line 30
    .line 31
    invoke-static {v1}, LO2/b;->e(I)C

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    add-int/lit8 p2, p2, -0x2

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    throw p0

    .line 46
    :cond_1
    if-ne p2, v1, :cond_3

    .line 47
    .line 48
    invoke-virtual {p0}, LT2/s;->a()I

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    const/4 v2, 0x6

    .line 53
    if-lt p2, v2, :cond_2

    .line 54
    .line 55
    invoke-virtual {p0, v2}, LT2/s;->b(I)I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    invoke-static {p0}, LO2/b;->e(I)C

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_2
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    throw p0

    .line 72
    :cond_3
    :goto_1
    if-eqz p3, :cond_6

    .line 73
    .line 74
    :goto_2
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-ge v0, p0, :cond_6

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    const/16 p2, 0x25

    .line 85
    .line 86
    if-ne p0, p2, :cond_5

    .line 87
    .line 88
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    sub-int/2addr p0, v1

    .line 93
    if-ge v0, p0, :cond_4

    .line 94
    .line 95
    add-int/lit8 p0, v0, 0x1

    .line 96
    .line 97
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 98
    .line 99
    .line 100
    move-result p3

    .line 101
    if-ne p3, p2, :cond_4

    .line 102
    .line 103
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    goto :goto_3

    .line 107
    :cond_4
    const/16 p0, 0x1d

    .line 108
    .line 109
    invoke-virtual {p1, v0, p0}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    .line 110
    .line 111
    .line 112
    :cond_5
    :goto_3
    add-int/lit8 v0, v0, 0x1

    .line 113
    .line 114
    goto :goto_2

    .line 115
    :cond_6
    return-void
.end method

.method public static b(LT2/s;Ljava/lang/StringBuilder;ILx2/c;Ljava/util/ArrayList;Ljava/util/Map;)V
    .locals 23

    .line 1
    move/from16 v0, p2

    .line 2
    .line 3
    move-object/from16 v1, p5

    .line 4
    .line 5
    mul-int/lit8 v2, v0, 0x8

    .line 6
    .line 7
    invoke-virtual/range {p0 .. p0}, LT2/s;->a()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    if-gt v2, v3, :cond_29

    .line 12
    .line 13
    new-array v2, v0, [B

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    move v4, v3

    .line 17
    :goto_0
    if-ge v4, v0, :cond_0

    .line 18
    .line 19
    const/16 v5, 0x8

    .line 20
    .line 21
    move-object/from16 v6, p0

    .line 22
    .line 23
    invoke-virtual {v6, v5}, LT2/s;->b(I)I

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    int-to-byte v5, v5

    .line 28
    aput-byte v5, v2, v4

    .line 29
    .line 30
    add-int/lit8 v4, v4, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    if-nez p3, :cond_28

    .line 34
    .line 35
    sget-object v4, Lx2/g;->b:Ljava/nio/charset/Charset;

    .line 36
    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    sget-object v5, Lr2/d;->i:Lr2/d;

    .line 40
    .line 41
    invoke-interface {v1, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v6

    .line 45
    if-eqz v6, :cond_1

    .line 46
    .line 47
    invoke-interface {v1, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    goto/16 :goto_f

    .line 60
    .line 61
    :cond_1
    const/4 v1, 0x1

    .line 62
    const/4 v5, 0x2

    .line 63
    if-le v0, v5, :cond_4

    .line 64
    .line 65
    aget-byte v6, v2, v3

    .line 66
    .line 67
    const/4 v7, -0x2

    .line 68
    const/4 v8, -0x1

    .line 69
    if-ne v6, v7, :cond_2

    .line 70
    .line 71
    aget-byte v9, v2, v1

    .line 72
    .line 73
    if-eq v9, v8, :cond_3

    .line 74
    .line 75
    :cond_2
    if-ne v6, v8, :cond_4

    .line 76
    .line 77
    aget-byte v6, v2, v1

    .line 78
    .line 79
    if-ne v6, v7, :cond_4

    .line 80
    .line 81
    :cond_3
    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_16:Ljava/nio/charset/Charset;

    .line 82
    .line 83
    goto/16 :goto_f

    .line 84
    .line 85
    :cond_4
    const/4 v6, 0x3

    .line 86
    if-le v0, v6, :cond_5

    .line 87
    .line 88
    aget-byte v7, v2, v3

    .line 89
    .line 90
    const/16 v8, -0x11

    .line 91
    .line 92
    if-ne v7, v8, :cond_5

    .line 93
    .line 94
    aget-byte v7, v2, v1

    .line 95
    .line 96
    const/16 v8, -0x45

    .line 97
    .line 98
    if-ne v7, v8, :cond_5

    .line 99
    .line 100
    aget-byte v7, v2, v5

    .line 101
    .line 102
    const/16 v8, -0x41

    .line 103
    .line 104
    if-ne v7, v8, :cond_5

    .line 105
    .line 106
    move v7, v1

    .line 107
    goto :goto_1

    .line 108
    :cond_5
    move v7, v3

    .line 109
    :goto_1
    move v8, v1

    .line 110
    move v9, v8

    .line 111
    move v5, v3

    .line 112
    move v6, v5

    .line 113
    move v10, v6

    .line 114
    move v11, v10

    .line 115
    move v12, v11

    .line 116
    move v13, v12

    .line 117
    move v14, v13

    .line 118
    move v15, v14

    .line 119
    move/from16 v17, v15

    .line 120
    .line 121
    move/from16 v18, v17

    .line 122
    .line 123
    move/from16 v19, v18

    .line 124
    .line 125
    :goto_2
    if-ge v10, v0, :cond_7

    .line 126
    .line 127
    if-nez v1, :cond_6

    .line 128
    .line 129
    if-nez v8, :cond_6

    .line 130
    .line 131
    if-eqz v9, :cond_7

    .line 132
    .line 133
    :cond_6
    move/from16 p5, v1

    .line 134
    .line 135
    goto :goto_3

    .line 136
    :cond_7
    move/from16 p5, v1

    .line 137
    .line 138
    move-object/from16 v20, v4

    .line 139
    .line 140
    move/from16 v21, v7

    .line 141
    .line 142
    goto/16 :goto_c

    .line 143
    .line 144
    :goto_3
    aget-byte v1, v2, v10

    .line 145
    .line 146
    move-object/from16 v20, v4

    .line 147
    .line 148
    and-int/lit16 v4, v1, 0xff

    .line 149
    .line 150
    if-eqz v9, :cond_a

    .line 151
    .line 152
    if-lez v11, :cond_b

    .line 153
    .line 154
    and-int/lit16 v1, v1, 0x80

    .line 155
    .line 156
    if-nez v1, :cond_9

    .line 157
    .line 158
    move/from16 v21, v7

    .line 159
    .line 160
    :cond_8
    :goto_4
    const/4 v9, 0x0

    .line 161
    goto :goto_6

    .line 162
    :cond_9
    add-int/lit8 v11, v11, -0x1

    .line 163
    .line 164
    :cond_a
    move/from16 v21, v7

    .line 165
    .line 166
    goto :goto_6

    .line 167
    :cond_b
    move/from16 v21, v7

    .line 168
    .line 169
    and-int/lit16 v7, v1, 0x80

    .line 170
    .line 171
    if-eqz v7, :cond_f

    .line 172
    .line 173
    and-int/lit8 v7, v1, 0x40

    .line 174
    .line 175
    if-nez v7, :cond_c

    .line 176
    .line 177
    goto :goto_4

    .line 178
    :cond_c
    add-int/lit8 v7, v11, 0x1

    .line 179
    .line 180
    and-int/lit8 v22, v1, 0x20

    .line 181
    .line 182
    if-nez v22, :cond_d

    .line 183
    .line 184
    add-int/lit8 v13, v13, 0x1

    .line 185
    .line 186
    :goto_5
    move v11, v7

    .line 187
    goto :goto_6

    .line 188
    :cond_d
    add-int/lit8 v7, v11, 0x2

    .line 189
    .line 190
    and-int/lit8 v22, v1, 0x10

    .line 191
    .line 192
    if-nez v22, :cond_e

    .line 193
    .line 194
    add-int/lit8 v14, v14, 0x1

    .line 195
    .line 196
    goto :goto_5

    .line 197
    :cond_e
    add-int/lit8 v11, v11, 0x3

    .line 198
    .line 199
    and-int/lit8 v1, v1, 0x8

    .line 200
    .line 201
    if-nez v1, :cond_8

    .line 202
    .line 203
    add-int/lit8 v15, v15, 0x1

    .line 204
    .line 205
    :cond_f
    :goto_6
    const/16 v1, 0xa0

    .line 206
    .line 207
    const/16 v7, 0x7f

    .line 208
    .line 209
    if-eqz p5, :cond_12

    .line 210
    .line 211
    if-le v4, v7, :cond_10

    .line 212
    .line 213
    if-ge v4, v1, :cond_10

    .line 214
    .line 215
    const/4 v1, 0x0

    .line 216
    goto :goto_7

    .line 217
    :cond_10
    const/16 v1, 0x9f

    .line 218
    .line 219
    if-le v4, v1, :cond_12

    .line 220
    .line 221
    const/16 v1, 0xc0

    .line 222
    .line 223
    if-lt v4, v1, :cond_11

    .line 224
    .line 225
    const/16 v1, 0xd7

    .line 226
    .line 227
    if-eq v4, v1, :cond_11

    .line 228
    .line 229
    const/16 v1, 0xf7

    .line 230
    .line 231
    if-ne v4, v1, :cond_12

    .line 232
    .line 233
    :cond_11
    add-int/lit8 v17, v17, 0x1

    .line 234
    .line 235
    :cond_12
    move/from16 v1, p5

    .line 236
    .line 237
    :goto_7
    if-eqz v8, :cond_1b

    .line 238
    .line 239
    if-lez v12, :cond_15

    .line 240
    .line 241
    move/from16 p5, v1

    .line 242
    .line 243
    const/16 v1, 0x40

    .line 244
    .line 245
    if-lt v4, v1, :cond_14

    .line 246
    .line 247
    if-eq v4, v7, :cond_14

    .line 248
    .line 249
    const/16 v1, 0xfc

    .line 250
    .line 251
    if-le v4, v1, :cond_13

    .line 252
    .line 253
    goto :goto_8

    .line 254
    :cond_13
    add-int/lit8 v12, v12, -0x1

    .line 255
    .line 256
    goto :goto_b

    .line 257
    :cond_14
    :goto_8
    const/4 v8, 0x0

    .line 258
    goto :goto_b

    .line 259
    :cond_15
    move/from16 p5, v1

    .line 260
    .line 261
    const/16 v1, 0x80

    .line 262
    .line 263
    if-eq v4, v1, :cond_14

    .line 264
    .line 265
    const/16 v1, 0xa0

    .line 266
    .line 267
    if-eq v4, v1, :cond_14

    .line 268
    .line 269
    const/16 v7, 0xef

    .line 270
    .line 271
    if-le v4, v7, :cond_16

    .line 272
    .line 273
    goto :goto_8

    .line 274
    :cond_16
    if-le v4, v1, :cond_18

    .line 275
    .line 276
    const/16 v1, 0xe0

    .line 277
    .line 278
    if-ge v4, v1, :cond_18

    .line 279
    .line 280
    add-int/lit8 v6, v6, 0x1

    .line 281
    .line 282
    add-int/lit8 v1, v19, 0x1

    .line 283
    .line 284
    if-le v1, v3, :cond_17

    .line 285
    .line 286
    move v3, v1

    .line 287
    move/from16 v19, v3

    .line 288
    .line 289
    :goto_9
    const/16 v18, 0x0

    .line 290
    .line 291
    goto :goto_b

    .line 292
    :cond_17
    move/from16 v19, v1

    .line 293
    .line 294
    goto :goto_9

    .line 295
    :cond_18
    const/16 v1, 0x7f

    .line 296
    .line 297
    if-le v4, v1, :cond_1a

    .line 298
    .line 299
    add-int/lit8 v12, v12, 0x1

    .line 300
    .line 301
    add-int/lit8 v1, v18, 0x1

    .line 302
    .line 303
    if-le v1, v5, :cond_19

    .line 304
    .line 305
    move v5, v1

    .line 306
    move/from16 v18, v5

    .line 307
    .line 308
    :goto_a
    const/16 v19, 0x0

    .line 309
    .line 310
    goto :goto_b

    .line 311
    :cond_19
    move/from16 v18, v1

    .line 312
    .line 313
    goto :goto_a

    .line 314
    :cond_1a
    const/16 v18, 0x0

    .line 315
    .line 316
    goto :goto_a

    .line 317
    :cond_1b
    move/from16 p5, v1

    .line 318
    .line 319
    :goto_b
    add-int/lit8 v10, v10, 0x1

    .line 320
    .line 321
    move/from16 v1, p5

    .line 322
    .line 323
    move-object/from16 v4, v20

    .line 324
    .line 325
    move/from16 v7, v21

    .line 326
    .line 327
    goto/16 :goto_2

    .line 328
    .line 329
    :goto_c
    if-eqz v9, :cond_1c

    .line 330
    .line 331
    if-lez v11, :cond_1c

    .line 332
    .line 333
    const/4 v9, 0x0

    .line 334
    :cond_1c
    if-eqz v8, :cond_1d

    .line 335
    .line 336
    if-lez v12, :cond_1d

    .line 337
    .line 338
    const/16 v16, 0x0

    .line 339
    .line 340
    goto :goto_d

    .line 341
    :cond_1d
    move/from16 v16, v8

    .line 342
    .line 343
    :goto_d
    if-eqz v9, :cond_1f

    .line 344
    .line 345
    if-nez v21, :cond_1e

    .line 346
    .line 347
    add-int/2addr v13, v14

    .line 348
    add-int/2addr v13, v15

    .line 349
    if-lez v13, :cond_1f

    .line 350
    .line 351
    :cond_1e
    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 352
    .line 353
    goto :goto_f

    .line 354
    :cond_1f
    if-eqz v16, :cond_21

    .line 355
    .line 356
    sget-boolean v1, Lx2/g;->d:Z

    .line 357
    .line 358
    if-nez v1, :cond_20

    .line 359
    .line 360
    const/4 v1, 0x3

    .line 361
    if-ge v3, v1, :cond_20

    .line 362
    .line 363
    if-lt v5, v1, :cond_21

    .line 364
    .line 365
    :cond_20
    :goto_e
    move-object/from16 v4, v20

    .line 366
    .line 367
    goto :goto_f

    .line 368
    :cond_21
    if-eqz p5, :cond_24

    .line 369
    .line 370
    if-eqz v16, :cond_24

    .line 371
    .line 372
    const/4 v1, 0x2

    .line 373
    if-ne v3, v1, :cond_22

    .line 374
    .line 375
    if-eq v6, v1, :cond_20

    .line 376
    .line 377
    :cond_22
    mul-int/lit8 v1, v17, 0xa

    .line 378
    .line 379
    if-lt v1, v0, :cond_23

    .line 380
    .line 381
    goto :goto_e

    .line 382
    :cond_23
    sget-object v4, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    .line 383
    .line 384
    goto :goto_f

    .line 385
    :cond_24
    if-eqz p5, :cond_25

    .line 386
    .line 387
    sget-object v4, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    .line 388
    .line 389
    goto :goto_f

    .line 390
    :cond_25
    if-eqz v16, :cond_26

    .line 391
    .line 392
    goto :goto_e

    .line 393
    :cond_26
    if-eqz v9, :cond_27

    .line 394
    .line 395
    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 396
    .line 397
    goto :goto_f

    .line 398
    :cond_27
    sget-object v4, Lx2/g;->a:Ljava/nio/charset/Charset;

    .line 399
    .line 400
    goto :goto_f

    .line 401
    :cond_28
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 402
    .line 403
    .line 404
    move-result-object v0

    .line 405
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    .line 406
    .line 407
    .line 408
    move-result-object v4

    .line 409
    :goto_f
    new-instance v0, Ljava/lang/String;

    .line 410
    .line 411
    invoke-direct {v0, v2, v4}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 412
    .line 413
    .line 414
    move-object/from16 v1, p1

    .line 415
    .line 416
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 417
    .line 418
    .line 419
    move-object/from16 v0, p4

    .line 420
    .line 421
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 422
    .line 423
    .line 424
    return-void

    .line 425
    :cond_29
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 426
    .line 427
    .line 428
    move-result-object v0

    .line 429
    throw v0
.end method

.method public static c(LT2/s;Ljava/lang/StringBuilder;I)V
    .locals 4

    .line 1
    sget-object v0, Lx2/g;->c:Ljava/nio/charset/Charset;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    mul-int/lit8 v0, p2, 0xd

    .line 6
    .line 7
    invoke-virtual {p0}, LT2/s;->a()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-gt v0, v1, :cond_2

    .line 12
    .line 13
    mul-int/lit8 v0, p2, 0x2

    .line 14
    .line 15
    new-array v0, v0, [B

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    :goto_0
    if-lez p2, :cond_1

    .line 19
    .line 20
    const/16 v2, 0xd

    .line 21
    .line 22
    invoke-virtual {p0, v2}, LT2/s;->b(I)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    div-int/lit8 v3, v2, 0x60

    .line 27
    .line 28
    shl-int/lit8 v3, v3, 0x8

    .line 29
    .line 30
    rem-int/lit8 v2, v2, 0x60

    .line 31
    .line 32
    or-int/2addr v2, v3

    .line 33
    const/16 v3, 0xa00

    .line 34
    .line 35
    if-ge v2, v3, :cond_0

    .line 36
    .line 37
    const v3, 0xa1a1

    .line 38
    .line 39
    .line 40
    :goto_1
    add-int/2addr v2, v3

    .line 41
    goto :goto_2

    .line 42
    :cond_0
    const v3, 0xa6a1

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :goto_2
    shr-int/lit8 v3, v2, 0x8

    .line 47
    .line 48
    and-int/lit16 v3, v3, 0xff

    .line 49
    .line 50
    int-to-byte v3, v3

    .line 51
    aput-byte v3, v0, v1

    .line 52
    .line 53
    add-int/lit8 v3, v1, 0x1

    .line 54
    .line 55
    and-int/lit16 v2, v2, 0xff

    .line 56
    .line 57
    int-to-byte v2, v2

    .line 58
    aput-byte v2, v0, v3

    .line 59
    .line 60
    add-int/lit8 v1, v1, 0x2

    .line 61
    .line 62
    add-int/lit8 p2, p2, -0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    new-instance p0, Ljava/lang/String;

    .line 66
    .line 67
    sget-object p2, Lx2/g;->c:Ljava/nio/charset/Charset;

    .line 68
    .line 69
    invoke-direct {p0, v0, p2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_2
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    throw p0

    .line 81
    :cond_3
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    throw p0
.end method

.method public static d(LT2/s;Ljava/lang/StringBuilder;I)V
    .locals 3

    .line 1
    :goto_0
    const/4 v0, 0x3

    .line 2
    const/16 v1, 0xa

    .line 3
    .line 4
    if-lt p2, v0, :cond_2

    .line 5
    .line 6
    invoke-virtual {p0}, LT2/s;->a()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-lt v0, v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, v1}, LT2/s;->b(I)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/16 v2, 0x3e8

    .line 17
    .line 18
    if-ge v0, v2, :cond_0

    .line 19
    .line 20
    div-int/lit8 v2, v0, 0x64

    .line 21
    .line 22
    invoke-static {v2}, LO2/b;->e(I)C

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    div-int/lit8 v2, v0, 0xa

    .line 30
    .line 31
    rem-int/2addr v2, v1

    .line 32
    invoke-static {v2}, LO2/b;->e(I)C

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    rem-int/lit8 v0, v0, 0xa

    .line 40
    .line 41
    invoke-static {v0}, LO2/b;->e(I)C

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    add-int/lit8 p2, p2, -0x3

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    throw p0

    .line 56
    :cond_1
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    throw p0

    .line 61
    :cond_2
    const/4 v0, 0x2

    .line 62
    if-ne p2, v0, :cond_5

    .line 63
    .line 64
    invoke-virtual {p0}, LT2/s;->a()I

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    const/4 v0, 0x7

    .line 69
    if-lt p2, v0, :cond_4

    .line 70
    .line 71
    invoke-virtual {p0, v0}, LT2/s;->b(I)I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    const/16 p2, 0x64

    .line 76
    .line 77
    if-ge p0, p2, :cond_3

    .line 78
    .line 79
    div-int/lit8 p2, p0, 0xa

    .line 80
    .line 81
    invoke-static {p2}, LO2/b;->e(I)C

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    rem-int/2addr p0, v1

    .line 89
    invoke-static {p0}, LO2/b;->e(I)C

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_3
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    throw p0

    .line 102
    :cond_4
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    throw p0

    .line 107
    :cond_5
    const/4 v0, 0x1

    .line 108
    if-ne p2, v0, :cond_8

    .line 109
    .line 110
    invoke-virtual {p0}, LT2/s;->a()I

    .line 111
    .line 112
    .line 113
    move-result p2

    .line 114
    const/4 v0, 0x4

    .line 115
    if-lt p2, v0, :cond_7

    .line 116
    .line 117
    invoke-virtual {p0, v0}, LT2/s;->b(I)I

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    if-ge p0, v1, :cond_6

    .line 122
    .line 123
    invoke-static {p0}, LO2/b;->e(I)C

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :cond_6
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    throw p0

    .line 136
    :cond_7
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    throw p0

    .line 141
    :cond_8
    return-void
.end method

.method public static e(I)C
    .locals 2

    .line 1
    sget-object v0, LO2/b;->a:[C

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    if-ge p0, v1, :cond_0

    .line 5
    .line 6
    aget-char p0, v0, p0

    .line 7
    .line 8
    return p0

    .line 9
    :cond_0
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    throw p0
.end method
