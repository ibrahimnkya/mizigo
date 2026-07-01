.class public final Lj3/m;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Z

.field public final c:Z

.field public final d:Z

.field public final e:Z

.field public final f:I

.field public final g:Lj3/n;

.field public final h:Ljava/lang/Integer;

.field public final i:Ljava/lang/String;

.field public final j:LV1/y;

.field public final k:[Ljava/lang/String;

.field public final l:[Lj3/m;

.field public final m:[Ljava/util/Locale;


# direct methods
.method public constructor <init>(ZZZZZILj3/n;Ljava/lang/Integer;Ljava/lang/String;LV1/y;[Ljava/lang/String;[Lj3/m;[Ljava/util/Locale;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lj3/m;->a:Z

    .line 5
    .line 6
    iput-boolean p2, p0, Lj3/m;->b:Z

    .line 7
    .line 8
    iput-boolean p3, p0, Lj3/m;->c:Z

    .line 9
    .line 10
    iput-boolean p4, p0, Lj3/m;->d:Z

    .line 11
    .line 12
    iput-boolean p5, p0, Lj3/m;->e:Z

    .line 13
    .line 14
    iput p6, p0, Lj3/m;->f:I

    .line 15
    .line 16
    iput-object p7, p0, Lj3/m;->g:Lj3/n;

    .line 17
    .line 18
    iput-object p8, p0, Lj3/m;->h:Ljava/lang/Integer;

    .line 19
    .line 20
    iput-object p9, p0, Lj3/m;->i:Ljava/lang/String;

    .line 21
    .line 22
    iput-object p10, p0, Lj3/m;->j:LV1/y;

    .line 23
    .line 24
    iput-object p11, p0, Lj3/m;->k:[Ljava/lang/String;

    .line 25
    .line 26
    iput-object p12, p0, Lj3/m;->l:[Lj3/m;

    .line 27
    .line 28
    iput-object p13, p0, Lj3/m;->m:[Ljava/util/Locale;

    .line 29
    .line 30
    return-void
.end method

.method public static a(Lorg/json/JSONObject;)Lj3/m;
    .locals 35

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "inputAction"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eqz v1, :cond_3f

    .line 10
    .line 11
    const-string v2, "fields"

    .line 12
    .line 13
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    const/4 v5, 0x0

    .line 18
    if-nez v3, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    new-array v6, v3, [Lj3/m;

    .line 29
    .line 30
    move v7, v5

    .line 31
    :goto_0
    if-ge v7, v3, :cond_0

    .line 32
    .line 33
    invoke-virtual {v2, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 34
    .line 35
    .line 36
    move-result-object v8

    .line 37
    invoke-static {v8}, Lj3/m;->a(Lorg/json/JSONObject;)Lj3/m;

    .line 38
    .line 39
    .line 40
    move-result-object v8

    .line 41
    aput-object v8, v6, v7

    .line 42
    .line 43
    add-int/lit8 v7, v7, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    move-object/from16 v20, v6

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    const/16 v20, 0x0

    .line 50
    .line 51
    :goto_1
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    const/4 v7, 0x7

    .line 60
    const/4 v8, 0x6

    .line 61
    const/4 v9, 0x5

    .line 62
    const/4 v10, 0x3

    .line 63
    const/4 v11, 0x2

    .line 64
    const/4 v12, 0x4

    .line 65
    const/4 v13, 0x1

    .line 66
    sparse-switch v3, :sswitch_data_0

    .line 67
    .line 68
    .line 69
    :goto_2
    const/4 v1, -0x1

    .line 70
    goto/16 :goto_3

    .line 71
    .line 72
    :sswitch_0
    const-string v3, "TextInputAction.previous"

    .line 73
    .line 74
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-nez v1, :cond_2

    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_2
    move v1, v7

    .line 82
    goto :goto_3

    .line 83
    :sswitch_1
    const-string v3, "TextInputAction.newline"

    .line 84
    .line 85
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-nez v1, :cond_3

    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_3
    move v1, v8

    .line 93
    goto :goto_3

    .line 94
    :sswitch_2
    const-string v3, "TextInputAction.go"

    .line 95
    .line 96
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-nez v1, :cond_4

    .line 101
    .line 102
    goto :goto_2

    .line 103
    :cond_4
    move v1, v9

    .line 104
    goto :goto_3

    .line 105
    :sswitch_3
    const-string v3, "TextInputAction.search"

    .line 106
    .line 107
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    if-nez v1, :cond_5

    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_5
    move v1, v12

    .line 115
    goto :goto_3

    .line 116
    :sswitch_4
    const-string v3, "TextInputAction.send"

    .line 117
    .line 118
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    if-nez v1, :cond_6

    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_6
    move v1, v10

    .line 126
    goto :goto_3

    .line 127
    :sswitch_5
    const-string v3, "TextInputAction.none"

    .line 128
    .line 129
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    if-nez v1, :cond_7

    .line 134
    .line 135
    goto :goto_2

    .line 136
    :cond_7
    move v1, v11

    .line 137
    goto :goto_3

    .line 138
    :sswitch_6
    const-string v3, "TextInputAction.next"

    .line 139
    .line 140
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    if-nez v1, :cond_8

    .line 145
    .line 146
    goto :goto_2

    .line 147
    :cond_8
    move v1, v13

    .line 148
    goto :goto_3

    .line 149
    :sswitch_7
    const-string v3, "TextInputAction.done"

    .line 150
    .line 151
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    if-nez v1, :cond_9

    .line 156
    .line 157
    goto :goto_2

    .line 158
    :cond_9
    move v1, v5

    .line 159
    :goto_3
    packed-switch v1, :pswitch_data_0

    .line 160
    .line 161
    .line 162
    :goto_4
    move-object/from16 v16, v2

    .line 163
    .line 164
    goto :goto_5

    .line 165
    :pswitch_0
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    goto :goto_4

    .line 170
    :pswitch_1
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    goto :goto_4

    .line 175
    :pswitch_2
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    goto :goto_4

    .line 180
    :pswitch_3
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    goto :goto_4

    .line 185
    :pswitch_4
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    goto :goto_4

    .line 190
    :pswitch_5
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    goto :goto_4

    .line 195
    :pswitch_6
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 196
    .line 197
    .line 198
    move-result-object v2

    .line 199
    goto :goto_4

    .line 200
    :goto_5
    new-instance v1, Ljava/util/ArrayList;

    .line 201
    .line 202
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 203
    .line 204
    .line 205
    const-string v2, "contentCommitMimeTypes"

    .line 206
    .line 207
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    .line 208
    .line 209
    .line 210
    move-result v3

    .line 211
    if-eqz v3, :cond_a

    .line 212
    .line 213
    const/4 v2, 0x0

    .line 214
    goto :goto_6

    .line 215
    :cond_a
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 216
    .line 217
    .line 218
    move-result-object v2

    .line 219
    :goto_6
    if-eqz v2, :cond_b

    .line 220
    .line 221
    move v3, v5

    .line 222
    :goto_7
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    .line 223
    .line 224
    .line 225
    move-result v14

    .line 226
    if-ge v3, v14, :cond_b

    .line 227
    .line 228
    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v14

    .line 232
    invoke-virtual {v1, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 233
    .line 234
    .line 235
    add-int/lit8 v3, v3, 0x1

    .line 236
    .line 237
    goto :goto_7

    .line 238
    :cond_b
    const-string v2, "hintLocales"

    .line 239
    .line 240
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    .line 241
    .line 242
    .line 243
    move-result v3

    .line 244
    if-nez v3, :cond_d

    .line 245
    .line 246
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 247
    .line 248
    .line 249
    move-result-object v2

    .line 250
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    .line 251
    .line 252
    .line 253
    move-result v3

    .line 254
    new-array v3, v3, [Ljava/util/Locale;

    .line 255
    .line 256
    move v14, v5

    .line 257
    :goto_8
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    .line 258
    .line 259
    .line 260
    move-result v15

    .line 261
    if-ge v14, v15, :cond_c

    .line 262
    .line 263
    invoke-virtual {v2, v14}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object v15

    .line 267
    invoke-static {v15}, Ljava/util/Locale;->forLanguageTag(Ljava/lang/String;)Ljava/util/Locale;

    .line 268
    .line 269
    .line 270
    move-result-object v15

    .line 271
    aput-object v15, v3, v14

    .line 272
    .line 273
    add-int/lit8 v14, v14, 0x1

    .line 274
    .line 275
    goto :goto_8

    .line 276
    :cond_c
    move-object/from16 v21, v3

    .line 277
    .line 278
    :goto_9
    move v2, v8

    .line 279
    goto :goto_a

    .line 280
    :cond_d
    const/16 v21, 0x0

    .line 281
    .line 282
    goto :goto_9

    .line 283
    :goto_a
    new-instance v8, Lj3/m;

    .line 284
    .line 285
    const-string v3, "obscureText"

    .line 286
    .line 287
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 288
    .line 289
    .line 290
    move-result v3

    .line 291
    const-string v14, "autocorrect"

    .line 292
    .line 293
    invoke-virtual {v0, v14, v13}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 294
    .line 295
    .line 296
    move-result v14

    .line 297
    const-string v15, "enableSuggestions"

    .line 298
    .line 299
    invoke-virtual {v0, v15}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 300
    .line 301
    .line 302
    move-result v15

    .line 303
    const-string v2, "enableIMEPersonalizedLearning"

    .line 304
    .line 305
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 306
    .line 307
    .line 308
    move-result v2

    .line 309
    const/16 v18, 0x0

    .line 310
    .line 311
    const-string v4, "enableDeltaModel"

    .line 312
    .line 313
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 314
    .line 315
    .line 316
    move-result v4

    .line 317
    const-string v6, "textCapitalization"

    .line 318
    .line 319
    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v6

    .line 323
    invoke-static {v12}, LL/i;->c(I)[I

    .line 324
    .line 325
    .line 326
    move-result-object v7

    .line 327
    array-length v9, v7

    .line 328
    :goto_b
    if-ge v5, v9, :cond_3e

    .line 329
    .line 330
    move/from16 v23, v14

    .line 331
    .line 332
    aget v14, v7, v5

    .line 333
    .line 334
    if-eq v14, v13, :cond_11

    .line 335
    .line 336
    if-eq v14, v11, :cond_10

    .line 337
    .line 338
    if-eq v14, v10, :cond_f

    .line 339
    .line 340
    if-ne v14, v12, :cond_e

    .line 341
    .line 342
    const-string v24, "TextCapitalization.none"

    .line 343
    .line 344
    :goto_c
    move-object/from16 v10, v24

    .line 345
    .line 346
    goto :goto_d

    .line 347
    :cond_e
    throw v18

    .line 348
    :cond_f
    const-string v24, "TextCapitalization.sentences"

    .line 349
    .line 350
    goto :goto_c

    .line 351
    :cond_10
    const-string v24, "TextCapitalization.words"

    .line 352
    .line 353
    goto :goto_c

    .line 354
    :cond_11
    const-string v24, "TextCapitalization.characters"

    .line 355
    .line 356
    goto :goto_c

    .line 357
    :goto_d
    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 358
    .line 359
    .line 360
    move-result v10

    .line 361
    if-eqz v10, :cond_3d

    .line 362
    .line 363
    const-string v5, "inputType"

    .line 364
    .line 365
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 366
    .line 367
    .line 368
    move-result-object v5

    .line 369
    move v10, v11

    .line 370
    move v11, v15

    .line 371
    new-instance v15, Lj3/n;

    .line 372
    .line 373
    const-string v6, "name"

    .line 374
    .line 375
    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 376
    .line 377
    .line 378
    move-result-object v7

    .line 379
    const/16 v24, 0xd

    .line 380
    .line 381
    invoke-static/range {v24 .. v24}, LL/i;->c(I)[I

    .line 382
    .line 383
    .line 384
    move-result-object v9

    .line 385
    array-length v10, v9

    .line 386
    const/4 v12, 0x0

    .line 387
    :goto_e
    if-ge v12, v10, :cond_3c

    .line 388
    .line 389
    aget v13, v9, v12

    .line 390
    .line 391
    packed-switch v13, :pswitch_data_1

    .line 392
    .line 393
    .line 394
    throw v18

    .line 395
    :pswitch_7
    const-string v25, "TextInputType.twitter"

    .line 396
    .line 397
    :goto_f
    move/from16 v26, v2

    .line 398
    .line 399
    move-object/from16 v2, v25

    .line 400
    .line 401
    goto :goto_10

    .line 402
    :pswitch_8
    const-string v25, "TextInputType.webSearch"

    .line 403
    .line 404
    goto :goto_f

    .line 405
    :pswitch_9
    const-string v25, "TextInputType.none"

    .line 406
    .line 407
    goto :goto_f

    .line 408
    :pswitch_a
    const-string v25, "TextInputType.visiblePassword"

    .line 409
    .line 410
    goto :goto_f

    .line 411
    :pswitch_b
    const-string v25, "TextInputType.url"

    .line 412
    .line 413
    goto :goto_f

    .line 414
    :pswitch_c
    const-string v25, "TextInputType.emailAddress"

    .line 415
    .line 416
    goto :goto_f

    .line 417
    :pswitch_d
    const-string v25, "TextInputType.multiline"

    .line 418
    .line 419
    goto :goto_f

    .line 420
    :pswitch_e
    const-string v25, "TextInputType.phone"

    .line 421
    .line 422
    goto :goto_f

    .line 423
    :pswitch_f
    const-string v25, "TextInputType.number"

    .line 424
    .line 425
    goto :goto_f

    .line 426
    :pswitch_10
    const-string v25, "TextInputType.address"

    .line 427
    .line 428
    goto :goto_f

    .line 429
    :pswitch_11
    const-string v25, "TextInputType.name"

    .line 430
    .line 431
    goto :goto_f

    .line 432
    :pswitch_12
    const-string v25, "TextInputType.datetime"

    .line 433
    .line 434
    goto :goto_f

    .line 435
    :pswitch_13
    const-string v25, "TextInputType.text"

    .line 436
    .line 437
    goto :goto_f

    .line 438
    :goto_10
    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 439
    .line 440
    .line 441
    move-result v2

    .line 442
    if-eqz v2, :cond_3b

    .line 443
    .line 444
    const-string v2, "signed"

    .line 445
    .line 446
    const/4 v7, 0x0

    .line 447
    invoke-virtual {v5, v2, v7}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 448
    .line 449
    .line 450
    move-result v2

    .line 451
    const-string v9, "decimal"

    .line 452
    .line 453
    invoke-virtual {v5, v9, v7}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 454
    .line 455
    .line 456
    move-result v5

    .line 457
    invoke-direct {v15, v13, v2, v5}, Lj3/n;-><init>(IZZ)V

    .line 458
    .line 459
    .line 460
    const-string v2, "actionLabel"

    .line 461
    .line 462
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    .line 463
    .line 464
    .line 465
    move-result v5

    .line 466
    if-eqz v5, :cond_12

    .line 467
    .line 468
    move-object/from16 v2, v18

    .line 469
    .line 470
    goto :goto_11

    .line 471
    :cond_12
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 472
    .line 473
    .line 474
    move-result-object v2

    .line 475
    :goto_11
    const-string v5, "autofill"

    .line 476
    .line 477
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    .line 478
    .line 479
    .line 480
    move-result v9

    .line 481
    if-eqz v9, :cond_13

    .line 482
    .line 483
    move-object/from16 v25, v2

    .line 484
    .line 485
    move/from16 v28, v3

    .line 486
    .line 487
    move/from16 v29, v4

    .line 488
    .line 489
    move-object/from16 v30, v8

    .line 490
    .line 491
    move/from16 v32, v11

    .line 492
    .line 493
    move/from16 v34, v14

    .line 494
    .line 495
    move-object/from16 v27, v15

    .line 496
    .line 497
    goto/16 :goto_18

    .line 498
    .line 499
    :cond_13
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 500
    .line 501
    .line 502
    move-result-object v0

    .line 503
    const-string v5, "uniqueIdentifier"

    .line 504
    .line 505
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 506
    .line 507
    .line 508
    move-result-object v5

    .line 509
    const-string v9, "hints"

    .line 510
    .line 511
    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 512
    .line 513
    .line 514
    move-result-object v9

    .line 515
    const-string v10, "hintText"

    .line 516
    .line 517
    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    .line 518
    .line 519
    .line 520
    move-result v12

    .line 521
    if-eqz v12, :cond_14

    .line 522
    .line 523
    move-object/from16 v10, v18

    .line 524
    .line 525
    goto :goto_12

    .line 526
    :cond_14
    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 527
    .line 528
    .line 529
    move-result-object v10

    .line 530
    :goto_12
    const-string v12, "editingValue"

    .line 531
    .line 532
    invoke-virtual {v0, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 533
    .line 534
    .line 535
    move-result-object v0

    .line 536
    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    .line 537
    .line 538
    .line 539
    move-result v12

    .line 540
    new-array v12, v12, [Ljava/lang/String;

    .line 541
    .line 542
    move v13, v7

    .line 543
    :goto_13
    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    .line 544
    .line 545
    .line 546
    move-result v7

    .line 547
    if-ge v13, v7, :cond_3a

    .line 548
    .line 549
    invoke-virtual {v9, v13}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 550
    .line 551
    .line 552
    move-result-object v7

    .line 553
    move-object/from16 p0, v0

    .line 554
    .line 555
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 556
    .line 557
    move-object/from16 v25, v2

    .line 558
    .line 559
    const/16 v2, 0x1a

    .line 560
    .line 561
    if-ge v0, v2, :cond_15

    .line 562
    .line 563
    move/from16 v28, v3

    .line 564
    .line 565
    move/from16 v29, v4

    .line 566
    .line 567
    move-object/from16 v30, v8

    .line 568
    .line 569
    move-object/from16 v31, v9

    .line 570
    .line 571
    move/from16 v32, v11

    .line 572
    .line 573
    move/from16 v33, v13

    .line 574
    .line 575
    move/from16 v34, v14

    .line 576
    .line 577
    move-object/from16 v27, v15

    .line 578
    .line 579
    goto/16 :goto_17

    .line 580
    .line 581
    :cond_15
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 582
    .line 583
    .line 584
    invoke-virtual {v7}, Ljava/lang/String;->hashCode()I

    .line 585
    .line 586
    .line 587
    move-result v0

    .line 588
    const-string v2, "username"

    .line 589
    .line 590
    move/from16 v27, v0

    .line 591
    .line 592
    const-string v0, "creditCardExpirationYear"

    .line 593
    .line 594
    move/from16 v28, v3

    .line 595
    .line 596
    const-string v3, "creditCardExpirationDate"

    .line 597
    .line 598
    move/from16 v29, v4

    .line 599
    .line 600
    const-string v4, "creditCardNumber"

    .line 601
    .line 602
    move-object/from16 v30, v8

    .line 603
    .line 604
    const-string v8, "gender"

    .line 605
    .line 606
    move-object/from16 v31, v9

    .line 607
    .line 608
    const-string v9, "creditCardExpirationDay"

    .line 609
    .line 610
    move/from16 v32, v11

    .line 611
    .line 612
    const-string v11, "creditCardSecurityCode"

    .line 613
    .line 614
    move/from16 v33, v13

    .line 615
    .line 616
    const-string v13, "newPassword"

    .line 617
    .line 618
    move/from16 v34, v14

    .line 619
    .line 620
    const-string v14, "creditCardExpirationMonth"

    .line 621
    .line 622
    sparse-switch v27, :sswitch_data_1

    .line 623
    .line 624
    .line 625
    move-object/from16 v27, v15

    .line 626
    .line 627
    :goto_14
    const/4 v15, -0x1

    .line 628
    goto/16 :goto_16

    .line 629
    .line 630
    :sswitch_8
    move-object/from16 v27, v15

    .line 631
    .line 632
    const-string v15, "birthdayDay"

    .line 633
    .line 634
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 635
    .line 636
    .line 637
    move-result v15

    .line 638
    if-nez v15, :cond_16

    .line 639
    .line 640
    goto/16 :goto_15

    .line 641
    .line 642
    :cond_16
    const/16 v15, 0x23

    .line 643
    .line 644
    goto/16 :goto_16

    .line 645
    .line 646
    :sswitch_9
    move-object/from16 v27, v15

    .line 647
    .line 648
    const-string v15, "postalCode"

    .line 649
    .line 650
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 651
    .line 652
    .line 653
    move-result v15

    .line 654
    if-nez v15, :cond_17

    .line 655
    .line 656
    goto/16 :goto_15

    .line 657
    .line 658
    :cond_17
    const/16 v15, 0x22

    .line 659
    .line 660
    goto/16 :goto_16

    .line 661
    .line 662
    :sswitch_a
    move-object/from16 v27, v15

    .line 663
    .line 664
    const-string v15, "postalAddressExtended"

    .line 665
    .line 666
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 667
    .line 668
    .line 669
    move-result v15

    .line 670
    if-nez v15, :cond_18

    .line 671
    .line 672
    goto/16 :goto_15

    .line 673
    .line 674
    :cond_18
    const/16 v15, 0x21

    .line 675
    .line 676
    goto/16 :goto_16

    .line 677
    .line 678
    :sswitch_b
    move-object/from16 v27, v15

    .line 679
    .line 680
    const-string v15, "postalAddress"

    .line 681
    .line 682
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 683
    .line 684
    .line 685
    move-result v15

    .line 686
    if-nez v15, :cond_19

    .line 687
    .line 688
    goto/16 :goto_15

    .line 689
    .line 690
    :cond_19
    const/16 v15, 0x20

    .line 691
    .line 692
    goto/16 :goto_16

    .line 693
    .line 694
    :sswitch_c
    move-object/from16 v27, v15

    .line 695
    .line 696
    const-string v15, "givenName"

    .line 697
    .line 698
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 699
    .line 700
    .line 701
    move-result v15

    .line 702
    if-nez v15, :cond_1a

    .line 703
    .line 704
    goto/16 :goto_15

    .line 705
    .line 706
    :cond_1a
    const/16 v15, 0x1f

    .line 707
    .line 708
    goto/16 :goto_16

    .line 709
    .line 710
    :sswitch_d
    move-object/from16 v27, v15

    .line 711
    .line 712
    const-string v15, "password"

    .line 713
    .line 714
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 715
    .line 716
    .line 717
    move-result v15

    .line 718
    if-nez v15, :cond_1b

    .line 719
    .line 720
    goto/16 :goto_15

    .line 721
    .line 722
    :cond_1b
    const/16 v15, 0x1e

    .line 723
    .line 724
    goto/16 :goto_16

    .line 725
    .line 726
    :sswitch_e
    move-object/from16 v27, v15

    .line 727
    .line 728
    const-string v15, "birthday"

    .line 729
    .line 730
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 731
    .line 732
    .line 733
    move-result v15

    .line 734
    if-nez v15, :cond_1c

    .line 735
    .line 736
    goto/16 :goto_15

    .line 737
    .line 738
    :cond_1c
    const/16 v15, 0x1d

    .line 739
    .line 740
    goto/16 :goto_16

    .line 741
    .line 742
    :sswitch_f
    move-object/from16 v27, v15

    .line 743
    .line 744
    const-string v15, "newUsername"

    .line 745
    .line 746
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 747
    .line 748
    .line 749
    move-result v15

    .line 750
    if-nez v15, :cond_1d

    .line 751
    .line 752
    goto/16 :goto_15

    .line 753
    .line 754
    :cond_1d
    const/16 v15, 0x1c

    .line 755
    .line 756
    goto/16 :goto_16

    .line 757
    .line 758
    :sswitch_10
    move-object/from16 v27, v15

    .line 759
    .line 760
    const-string v15, "telephoneNumber"

    .line 761
    .line 762
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 763
    .line 764
    .line 765
    move-result v15

    .line 766
    if-nez v15, :cond_1e

    .line 767
    .line 768
    goto/16 :goto_15

    .line 769
    .line 770
    :cond_1e
    const/16 v15, 0x1b

    .line 771
    .line 772
    goto/16 :goto_16

    .line 773
    .line 774
    :sswitch_11
    move-object/from16 v27, v15

    .line 775
    .line 776
    const-string v15, "familyName"

    .line 777
    .line 778
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 779
    .line 780
    .line 781
    move-result v15

    .line 782
    if-nez v15, :cond_1f

    .line 783
    .line 784
    goto/16 :goto_15

    .line 785
    .line 786
    :cond_1f
    const/16 v15, 0x1a

    .line 787
    .line 788
    goto/16 :goto_16

    .line 789
    .line 790
    :sswitch_12
    move-object/from16 v27, v15

    .line 791
    .line 792
    const-string v15, "birthdayMonth"

    .line 793
    .line 794
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 795
    .line 796
    .line 797
    move-result v15

    .line 798
    if-nez v15, :cond_20

    .line 799
    .line 800
    goto/16 :goto_15

    .line 801
    .line 802
    :cond_20
    const/16 v15, 0x19

    .line 803
    .line 804
    goto/16 :goto_16

    .line 805
    .line 806
    :sswitch_13
    move-object/from16 v27, v15

    .line 807
    .line 808
    const-string v15, "addressState"

    .line 809
    .line 810
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 811
    .line 812
    .line 813
    move-result v15

    .line 814
    if-nez v15, :cond_21

    .line 815
    .line 816
    goto/16 :goto_15

    .line 817
    .line 818
    :cond_21
    const/16 v15, 0x18

    .line 819
    .line 820
    goto/16 :goto_16

    .line 821
    .line 822
    :sswitch_14
    move-object/from16 v27, v15

    .line 823
    .line 824
    const-string v15, "email"

    .line 825
    .line 826
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 827
    .line 828
    .line 829
    move-result v15

    .line 830
    if-nez v15, :cond_22

    .line 831
    .line 832
    goto/16 :goto_15

    .line 833
    .line 834
    :cond_22
    const/16 v15, 0x17

    .line 835
    .line 836
    goto/16 :goto_16

    .line 837
    .line 838
    :sswitch_15
    move-object/from16 v27, v15

    .line 839
    .line 840
    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 841
    .line 842
    .line 843
    move-result v15

    .line 844
    if-nez v15, :cond_23

    .line 845
    .line 846
    goto/16 :goto_15

    .line 847
    .line 848
    :cond_23
    const/16 v15, 0x16

    .line 849
    .line 850
    goto/16 :goto_16

    .line 851
    .line 852
    :sswitch_16
    move-object/from16 v27, v15

    .line 853
    .line 854
    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 855
    .line 856
    .line 857
    move-result v15

    .line 858
    if-nez v15, :cond_24

    .line 859
    .line 860
    goto/16 :goto_15

    .line 861
    .line 862
    :cond_24
    const/16 v15, 0x15

    .line 863
    .line 864
    goto/16 :goto_16

    .line 865
    .line 866
    :sswitch_17
    move-object/from16 v27, v15

    .line 867
    .line 868
    const-string v15, "telephoneNumberCountryCode"

    .line 869
    .line 870
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 871
    .line 872
    .line 873
    move-result v15

    .line 874
    if-nez v15, :cond_25

    .line 875
    .line 876
    goto/16 :goto_15

    .line 877
    .line 878
    :cond_25
    const/16 v15, 0x14

    .line 879
    .line 880
    goto/16 :goto_16

    .line 881
    .line 882
    :sswitch_18
    move-object/from16 v27, v15

    .line 883
    .line 884
    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 885
    .line 886
    .line 887
    move-result v15

    .line 888
    if-nez v15, :cond_26

    .line 889
    .line 890
    goto/16 :goto_15

    .line 891
    .line 892
    :cond_26
    const/16 v15, 0x13

    .line 893
    .line 894
    goto/16 :goto_16

    .line 895
    .line 896
    :sswitch_19
    move-object/from16 v27, v15

    .line 897
    .line 898
    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 899
    .line 900
    .line 901
    move-result v15

    .line 902
    if-nez v15, :cond_27

    .line 903
    .line 904
    goto/16 :goto_15

    .line 905
    .line 906
    :cond_27
    const/16 v15, 0x12

    .line 907
    .line 908
    goto/16 :goto_16

    .line 909
    .line 910
    :sswitch_1a
    move-object/from16 v27, v15

    .line 911
    .line 912
    const-string v15, "nameSuffix"

    .line 913
    .line 914
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 915
    .line 916
    .line 917
    move-result v15

    .line 918
    if-nez v15, :cond_28

    .line 919
    .line 920
    goto/16 :goto_15

    .line 921
    .line 922
    :cond_28
    const/16 v15, 0x11

    .line 923
    .line 924
    goto/16 :goto_16

    .line 925
    .line 926
    :sswitch_1b
    move-object/from16 v27, v15

    .line 927
    .line 928
    const-string v15, "middleName"

    .line 929
    .line 930
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 931
    .line 932
    .line 933
    move-result v15

    .line 934
    if-nez v15, :cond_29

    .line 935
    .line 936
    goto/16 :goto_15

    .line 937
    .line 938
    :cond_29
    const/16 v15, 0x10

    .line 939
    .line 940
    goto/16 :goto_16

    .line 941
    .line 942
    :sswitch_1c
    move-object/from16 v27, v15

    .line 943
    .line 944
    const-string v15, "namePrefix"

    .line 945
    .line 946
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 947
    .line 948
    .line 949
    move-result v15

    .line 950
    if-nez v15, :cond_2a

    .line 951
    .line 952
    goto/16 :goto_15

    .line 953
    .line 954
    :cond_2a
    const/16 v15, 0xf

    .line 955
    .line 956
    goto/16 :goto_16

    .line 957
    .line 958
    :sswitch_1d
    move-object/from16 v27, v15

    .line 959
    .line 960
    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 961
    .line 962
    .line 963
    move-result v15

    .line 964
    if-nez v15, :cond_2b

    .line 965
    .line 966
    goto/16 :goto_15

    .line 967
    .line 968
    :cond_2b
    const/16 v15, 0xe

    .line 969
    .line 970
    goto/16 :goto_16

    .line 971
    .line 972
    :sswitch_1e
    move-object/from16 v27, v15

    .line 973
    .line 974
    const-string v15, "postalAddressExtendedPostalCode"

    .line 975
    .line 976
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 977
    .line 978
    .line 979
    move-result v15

    .line 980
    if-nez v15, :cond_2c

    .line 981
    .line 982
    goto/16 :goto_15

    .line 983
    .line 984
    :cond_2c
    move/from16 v15, v24

    .line 985
    .line 986
    goto/16 :goto_16

    .line 987
    .line 988
    :sswitch_1f
    move-object/from16 v27, v15

    .line 989
    .line 990
    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 991
    .line 992
    .line 993
    move-result v15

    .line 994
    if-nez v15, :cond_2d

    .line 995
    .line 996
    goto/16 :goto_15

    .line 997
    .line 998
    :cond_2d
    const/16 v15, 0xc

    .line 999
    .line 1000
    goto/16 :goto_16

    .line 1001
    .line 1002
    :sswitch_20
    move-object/from16 v27, v15

    .line 1003
    .line 1004
    const-string v15, "addressCity"

    .line 1005
    .line 1006
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1007
    .line 1008
    .line 1009
    move-result v15

    .line 1010
    if-nez v15, :cond_2e

    .line 1011
    .line 1012
    goto/16 :goto_15

    .line 1013
    .line 1014
    :cond_2e
    const/16 v15, 0xb

    .line 1015
    .line 1016
    goto/16 :goto_16

    .line 1017
    .line 1018
    :sswitch_21
    move-object/from16 v27, v15

    .line 1019
    .line 1020
    const-string v15, "middleInitial"

    .line 1021
    .line 1022
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1023
    .line 1024
    .line 1025
    move-result v15

    .line 1026
    if-nez v15, :cond_2f

    .line 1027
    .line 1028
    goto/16 :goto_15

    .line 1029
    .line 1030
    :cond_2f
    const/16 v15, 0xa

    .line 1031
    .line 1032
    goto/16 :goto_16

    .line 1033
    .line 1034
    :sswitch_22
    move-object/from16 v27, v15

    .line 1035
    .line 1036
    const-string v15, "countryName"

    .line 1037
    .line 1038
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1039
    .line 1040
    .line 1041
    move-result v15

    .line 1042
    if-nez v15, :cond_30

    .line 1043
    .line 1044
    goto/16 :goto_15

    .line 1045
    .line 1046
    :cond_30
    const/16 v15, 0x9

    .line 1047
    .line 1048
    goto/16 :goto_16

    .line 1049
    .line 1050
    :sswitch_23
    move-object/from16 v27, v15

    .line 1051
    .line 1052
    const-string v15, "telephoneNumberDevice"

    .line 1053
    .line 1054
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1055
    .line 1056
    .line 1057
    move-result v15

    .line 1058
    if-nez v15, :cond_31

    .line 1059
    .line 1060
    goto/16 :goto_15

    .line 1061
    .line 1062
    :cond_31
    const/16 v15, 0x8

    .line 1063
    .line 1064
    goto/16 :goto_16

    .line 1065
    .line 1066
    :sswitch_24
    move-object/from16 v27, v15

    .line 1067
    .line 1068
    const-string v15, "fullStreetAddress"

    .line 1069
    .line 1070
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1071
    .line 1072
    .line 1073
    move-result v15

    .line 1074
    if-nez v15, :cond_32

    .line 1075
    .line 1076
    goto :goto_15

    .line 1077
    :cond_32
    const/4 v15, 0x7

    .line 1078
    goto :goto_16

    .line 1079
    :sswitch_25
    move-object/from16 v27, v15

    .line 1080
    .line 1081
    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1082
    .line 1083
    .line 1084
    move-result v15

    .line 1085
    if-nez v15, :cond_33

    .line 1086
    .line 1087
    goto :goto_15

    .line 1088
    :cond_33
    const/4 v15, 0x6

    .line 1089
    goto :goto_16

    .line 1090
    :sswitch_26
    move-object/from16 v27, v15

    .line 1091
    .line 1092
    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1093
    .line 1094
    .line 1095
    move-result v15

    .line 1096
    if-nez v15, :cond_34

    .line 1097
    .line 1098
    goto :goto_15

    .line 1099
    :cond_34
    const/4 v15, 0x5

    .line 1100
    goto :goto_16

    .line 1101
    :sswitch_27
    move-object/from16 v27, v15

    .line 1102
    .line 1103
    invoke-virtual {v7, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1104
    .line 1105
    .line 1106
    move-result v15

    .line 1107
    if-nez v15, :cond_35

    .line 1108
    .line 1109
    goto :goto_15

    .line 1110
    :cond_35
    const/4 v15, 0x4

    .line 1111
    goto :goto_16

    .line 1112
    :sswitch_28
    move-object/from16 v27, v15

    .line 1113
    .line 1114
    const-string v15, "telephoneNumberNational"

    .line 1115
    .line 1116
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1117
    .line 1118
    .line 1119
    move-result v15

    .line 1120
    if-nez v15, :cond_36

    .line 1121
    .line 1122
    goto :goto_15

    .line 1123
    :cond_36
    const/4 v15, 0x3

    .line 1124
    goto :goto_16

    .line 1125
    :sswitch_29
    move-object/from16 v27, v15

    .line 1126
    .line 1127
    invoke-virtual {v7, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1128
    .line 1129
    .line 1130
    move-result v15

    .line 1131
    if-nez v15, :cond_37

    .line 1132
    .line 1133
    goto :goto_15

    .line 1134
    :cond_37
    const/4 v15, 0x2

    .line 1135
    goto :goto_16

    .line 1136
    :sswitch_2a
    move-object/from16 v27, v15

    .line 1137
    .line 1138
    const-string v15, "oneTimeCode"

    .line 1139
    .line 1140
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1141
    .line 1142
    .line 1143
    move-result v15

    .line 1144
    if-nez v15, :cond_38

    .line 1145
    .line 1146
    goto :goto_15

    .line 1147
    :cond_38
    const/4 v15, 0x1

    .line 1148
    goto :goto_16

    .line 1149
    :sswitch_2b
    move-object/from16 v27, v15

    .line 1150
    .line 1151
    const-string v15, "birthdayYear"

    .line 1152
    .line 1153
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1154
    .line 1155
    .line 1156
    move-result v15

    .line 1157
    if-nez v15, :cond_39

    .line 1158
    .line 1159
    :goto_15
    goto/16 :goto_14

    .line 1160
    .line 1161
    :cond_39
    const/4 v15, 0x0

    .line 1162
    :goto_16
    packed-switch v15, :pswitch_data_2

    .line 1163
    .line 1164
    .line 1165
    goto/16 :goto_17

    .line 1166
    .line 1167
    :pswitch_14
    const-string v7, "birthDateDay"

    .line 1168
    .line 1169
    goto/16 :goto_17

    .line 1170
    .line 1171
    :pswitch_15
    const-string v7, "postalCode"

    .line 1172
    .line 1173
    goto/16 :goto_17

    .line 1174
    .line 1175
    :pswitch_16
    const-string v7, "extendedAddress"

    .line 1176
    .line 1177
    goto/16 :goto_17

    .line 1178
    .line 1179
    :pswitch_17
    const-string v7, "postalAddress"

    .line 1180
    .line 1181
    goto/16 :goto_17

    .line 1182
    .line 1183
    :pswitch_18
    const-string v7, "personGivenName"

    .line 1184
    .line 1185
    goto/16 :goto_17

    .line 1186
    .line 1187
    :pswitch_19
    const-string v7, "password"

    .line 1188
    .line 1189
    goto/16 :goto_17

    .line 1190
    .line 1191
    :pswitch_1a
    const-string v7, "birthDateFull"

    .line 1192
    .line 1193
    goto/16 :goto_17

    .line 1194
    .line 1195
    :pswitch_1b
    const-string v7, "newUsername"

    .line 1196
    .line 1197
    goto/16 :goto_17

    .line 1198
    .line 1199
    :pswitch_1c
    const-string v7, "phoneNumber"

    .line 1200
    .line 1201
    goto/16 :goto_17

    .line 1202
    .line 1203
    :pswitch_1d
    const-string v7, "personFamilyName"

    .line 1204
    .line 1205
    goto/16 :goto_17

    .line 1206
    .line 1207
    :pswitch_1e
    const-string v7, "birthDateMonth"

    .line 1208
    .line 1209
    goto/16 :goto_17

    .line 1210
    .line 1211
    :pswitch_1f
    const-string v7, "addressRegion"

    .line 1212
    .line 1213
    goto/16 :goto_17

    .line 1214
    .line 1215
    :pswitch_20
    const-string v7, "emailAddress"

    .line 1216
    .line 1217
    goto :goto_17

    .line 1218
    :pswitch_21
    const-string v7, "personName"

    .line 1219
    .line 1220
    goto :goto_17

    .line 1221
    :pswitch_22
    move-object v7, v2

    .line 1222
    goto :goto_17

    .line 1223
    :pswitch_23
    const-string v7, "phoneCountryCode"

    .line 1224
    .line 1225
    goto :goto_17

    .line 1226
    :pswitch_24
    move-object v7, v0

    .line 1227
    goto :goto_17

    .line 1228
    :pswitch_25
    move-object v7, v3

    .line 1229
    goto :goto_17

    .line 1230
    :pswitch_26
    const-string v7, "personNameSuffix"

    .line 1231
    .line 1232
    goto :goto_17

    .line 1233
    :pswitch_27
    const-string v7, "personMiddleName"

    .line 1234
    .line 1235
    goto :goto_17

    .line 1236
    :pswitch_28
    const-string v7, "personNamePrefix"

    .line 1237
    .line 1238
    goto :goto_17

    .line 1239
    :pswitch_29
    move-object v7, v4

    .line 1240
    goto :goto_17

    .line 1241
    :pswitch_2a
    const-string v7, "extendedPostalCode"

    .line 1242
    .line 1243
    goto :goto_17

    .line 1244
    :pswitch_2b
    move-object v7, v8

    .line 1245
    goto :goto_17

    .line 1246
    :pswitch_2c
    const-string v7, "addressLocality"

    .line 1247
    .line 1248
    goto :goto_17

    .line 1249
    :pswitch_2d
    const-string v7, "personMiddleInitial"

    .line 1250
    .line 1251
    goto :goto_17

    .line 1252
    :pswitch_2e
    const-string v7, "addressCountry"

    .line 1253
    .line 1254
    goto :goto_17

    .line 1255
    :pswitch_2f
    const-string v7, "phoneNumberDevice"

    .line 1256
    .line 1257
    goto :goto_17

    .line 1258
    :pswitch_30
    const-string v7, "streetAddress"

    .line 1259
    .line 1260
    goto :goto_17

    .line 1261
    :pswitch_31
    move-object v7, v9

    .line 1262
    goto :goto_17

    .line 1263
    :pswitch_32
    move-object v7, v11

    .line 1264
    goto :goto_17

    .line 1265
    :pswitch_33
    move-object v7, v13

    .line 1266
    goto :goto_17

    .line 1267
    :pswitch_34
    const-string v7, "phoneNational"

    .line 1268
    .line 1269
    goto :goto_17

    .line 1270
    :pswitch_35
    move-object v7, v14

    .line 1271
    goto :goto_17

    .line 1272
    :pswitch_36
    const-string v7, "smsOTPCode"

    .line 1273
    .line 1274
    goto :goto_17

    .line 1275
    :pswitch_37
    const-string v7, "birthDateYear"

    .line 1276
    .line 1277
    :goto_17
    aput-object v7, v12, v33

    .line 1278
    .line 1279
    add-int/lit8 v13, v33, 0x1

    .line 1280
    .line 1281
    move-object/from16 v0, p0

    .line 1282
    .line 1283
    move-object/from16 v2, v25

    .line 1284
    .line 1285
    move-object/from16 v15, v27

    .line 1286
    .line 1287
    move/from16 v3, v28

    .line 1288
    .line 1289
    move/from16 v4, v29

    .line 1290
    .line 1291
    move-object/from16 v8, v30

    .line 1292
    .line 1293
    move-object/from16 v9, v31

    .line 1294
    .line 1295
    move/from16 v11, v32

    .line 1296
    .line 1297
    move/from16 v14, v34

    .line 1298
    .line 1299
    goto/16 :goto_13

    .line 1300
    .line 1301
    :cond_3a
    move-object/from16 p0, v0

    .line 1302
    .line 1303
    move-object/from16 v25, v2

    .line 1304
    .line 1305
    move/from16 v28, v3

    .line 1306
    .line 1307
    move/from16 v29, v4

    .line 1308
    .line 1309
    move-object/from16 v30, v8

    .line 1310
    .line 1311
    move/from16 v32, v11

    .line 1312
    .line 1313
    move/from16 v34, v14

    .line 1314
    .line 1315
    move-object/from16 v27, v15

    .line 1316
    .line 1317
    new-instance v4, LV1/y;

    .line 1318
    .line 1319
    invoke-static/range {p0 .. p0}, Lj3/o;->a(Lorg/json/JSONObject;)Lj3/o;

    .line 1320
    .line 1321
    .line 1322
    move-result-object v0

    .line 1323
    invoke-direct {v4, v5, v12, v10, v0}, LV1/y;-><init>(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lj3/o;)V

    .line 1324
    .line 1325
    .line 1326
    move-object/from16 v18, v4

    .line 1327
    .line 1328
    :goto_18
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 1329
    .line 1330
    .line 1331
    move-result v0

    .line 1332
    new-array v0, v0, [Ljava/lang/String;

    .line 1333
    .line 1334
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 1335
    .line 1336
    .line 1337
    move-result-object v0

    .line 1338
    move-object/from16 v19, v0

    .line 1339
    .line 1340
    check-cast v19, [Ljava/lang/String;

    .line 1341
    .line 1342
    move/from16 v10, v23

    .line 1343
    .line 1344
    move-object/from16 v17, v25

    .line 1345
    .line 1346
    move/from16 v12, v26

    .line 1347
    .line 1348
    move-object/from16 v15, v27

    .line 1349
    .line 1350
    move/from16 v9, v28

    .line 1351
    .line 1352
    move/from16 v13, v29

    .line 1353
    .line 1354
    move-object/from16 v8, v30

    .line 1355
    .line 1356
    move/from16 v11, v32

    .line 1357
    .line 1358
    move/from16 v14, v34

    .line 1359
    .line 1360
    invoke-direct/range {v8 .. v21}, Lj3/m;-><init>(ZZZZZILj3/n;Ljava/lang/Integer;Ljava/lang/String;LV1/y;[Ljava/lang/String;[Lj3/m;[Ljava/util/Locale;)V

    .line 1361
    .line 1362
    .line 1363
    return-object v30

    .line 1364
    :cond_3b
    move/from16 v28, v3

    .line 1365
    .line 1366
    move/from16 v29, v4

    .line 1367
    .line 1368
    move-object/from16 v30, v8

    .line 1369
    .line 1370
    move/from16 v34, v14

    .line 1371
    .line 1372
    const/16 v22, 0x0

    .line 1373
    .line 1374
    add-int/lit8 v12, v12, 0x1

    .line 1375
    .line 1376
    move/from16 v2, v26

    .line 1377
    .line 1378
    const/4 v13, 0x1

    .line 1379
    goto/16 :goto_e

    .line 1380
    .line 1381
    :cond_3c
    new-instance v0, Ljava/lang/NoSuchFieldException;

    .line 1382
    .line 1383
    const-string v1, "No such TextInputType: "

    .line 1384
    .line 1385
    invoke-static {v1, v7}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 1386
    .line 1387
    .line 1388
    move-result-object v1

    .line 1389
    invoke-direct {v0, v1}, Ljava/lang/NoSuchFieldException;-><init>(Ljava/lang/String;)V

    .line 1390
    .line 1391
    .line 1392
    throw v0

    .line 1393
    :cond_3d
    move/from16 v26, v2

    .line 1394
    .line 1395
    move/from16 v28, v3

    .line 1396
    .line 1397
    move/from16 v29, v4

    .line 1398
    .line 1399
    move-object/from16 v30, v8

    .line 1400
    .line 1401
    move v11, v15

    .line 1402
    const/16 v22, 0x0

    .line 1403
    .line 1404
    add-int/lit8 v5, v5, 0x1

    .line 1405
    .line 1406
    move/from16 v14, v23

    .line 1407
    .line 1408
    const/4 v10, 0x3

    .line 1409
    const/4 v11, 0x2

    .line 1410
    const/4 v12, 0x4

    .line 1411
    const/4 v13, 0x1

    .line 1412
    goto/16 :goto_b

    .line 1413
    .line 1414
    :cond_3e
    new-instance v0, Ljava/lang/NoSuchFieldException;

    .line 1415
    .line 1416
    const-string v1, "No such TextCapitalization: "

    .line 1417
    .line 1418
    invoke-static {v1, v6}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 1419
    .line 1420
    .line 1421
    move-result-object v1

    .line 1422
    invoke-direct {v0, v1}, Ljava/lang/NoSuchFieldException;-><init>(Ljava/lang/String;)V

    .line 1423
    .line 1424
    .line 1425
    throw v0

    .line 1426
    :cond_3f
    new-instance v0, Lorg/json/JSONException;

    .line 1427
    .line 1428
    const-string v1, "Configuration JSON missing \'inputAction\' property."

    .line 1429
    .line 1430
    invoke-direct {v0, v1}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    .line 1431
    .line 1432
    .line 1433
    throw v0

    .line 1434
    nop

    .line 1435
    :sswitch_data_0
    .sparse-switch
        -0x2bf37e83 -> :sswitch_7
        -0x2bef1712 -> :sswitch_6
        -0x2beef2cd -> :sswitch_5
        -0x2becd27d -> :sswitch_4
        0x1bf830e3 -> :sswitch_3
        0x4a02ada3 -> :sswitch_2
        0x5bc225b9 -> :sswitch_1
        0x7dcba372 -> :sswitch_0
    .end sparse-switch

    .line 1436
    .line 1437
    .line 1438
    .line 1439
    .line 1440
    .line 1441
    .line 1442
    .line 1443
    .line 1444
    .line 1445
    .line 1446
    .line 1447
    .line 1448
    .line 1449
    .line 1450
    .line 1451
    .line 1452
    .line 1453
    .line 1454
    .line 1455
    .line 1456
    .line 1457
    .line 1458
    .line 1459
    .line 1460
    .line 1461
    .line 1462
    .line 1463
    .line 1464
    .line 1465
    .line 1466
    .line 1467
    .line 1468
    .line 1469
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_4
        :pswitch_0
    .end packed-switch

    .line 1470
    .line 1471
    .line 1472
    .line 1473
    .line 1474
    .line 1475
    .line 1476
    .line 1477
    .line 1478
    .line 1479
    .line 1480
    .line 1481
    .line 1482
    .line 1483
    .line 1484
    .line 1485
    .line 1486
    .line 1487
    .line 1488
    .line 1489
    :pswitch_data_1
    .packed-switch 0x1
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
    .end packed-switch

    .line 1490
    .line 1491
    .line 1492
    .line 1493
    .line 1494
    .line 1495
    .line 1496
    .line 1497
    .line 1498
    .line 1499
    .line 1500
    .line 1501
    .line 1502
    .line 1503
    .line 1504
    .line 1505
    .line 1506
    .line 1507
    .line 1508
    .line 1509
    .line 1510
    .line 1511
    .line 1512
    .line 1513
    .line 1514
    .line 1515
    .line 1516
    .line 1517
    .line 1518
    .line 1519
    :sswitch_data_1
    .sparse-switch
        -0x7ab827a6 -> :sswitch_2b
        -0x72476d20 -> :sswitch_2a
        -0x6df5a7d8 -> :sswitch_29
        -0x6cd04ac1 -> :sswitch_28
        -0x6c8dd7a5 -> :sswitch_27
        -0x68c2726a -> :sswitch_26
        -0x6446fcbc -> :sswitch_25
        -0x62e1a7de -> :sswitch_24
        -0x5d6852dd -> :sswitch_23
        -0x580574bf -> :sswitch_22
        -0x5443ec11 -> :sswitch_21
        -0x521f7081 -> :sswitch_20
        -0x4a7a0d3f -> :sswitch_1f
        -0x46b1d806 -> :sswitch_1e
        -0x449b65ae -> :sswitch_1d
        -0x31d43b03 -> :sswitch_1c
        -0x30c50a40 -> :sswitch_1b
        -0x2c8af644 -> :sswitch_1a
        -0x24989afa -> :sswitch_19
        -0x248f026b -> :sswitch_18
        -0x20bc980a -> :sswitch_17
        -0xfd6772a -> :sswitch_16
        0x337a8b -> :sswitch_15
        0x5c24b9c -> :sswitch_14
        0xf1790fd -> :sswitch_13
        0x230ed603 -> :sswitch_12
        0x2f98f80f -> :sswitch_11
        0x352e686d -> :sswitch_10
        0x3b11f696 -> :sswitch_f
        0x3fbd627d -> :sswitch_e
        0x4889ba9b -> :sswitch_d
        0x578fdfa8 -> :sswitch_c
        0x631a4ca9 -> :sswitch_b
        0x728d6502 -> :sswitch_a
        0x77dfc158 -> :sswitch_9
        0x77e93bdf -> :sswitch_8
    .end sparse-switch

    .line 1520
    .line 1521
    .line 1522
    .line 1523
    .line 1524
    .line 1525
    .line 1526
    .line 1527
    .line 1528
    .line 1529
    .line 1530
    .line 1531
    .line 1532
    .line 1533
    .line 1534
    .line 1535
    .line 1536
    .line 1537
    .line 1538
    .line 1539
    .line 1540
    .line 1541
    .line 1542
    .line 1543
    .line 1544
    .line 1545
    .line 1546
    .line 1547
    .line 1548
    .line 1549
    .line 1550
    .line 1551
    .line 1552
    .line 1553
    .line 1554
    .line 1555
    .line 1556
    .line 1557
    .line 1558
    .line 1559
    .line 1560
    .line 1561
    .line 1562
    .line 1563
    .line 1564
    .line 1565
    .line 1566
    .line 1567
    .line 1568
    .line 1569
    .line 1570
    .line 1571
    .line 1572
    .line 1573
    .line 1574
    .line 1575
    .line 1576
    .line 1577
    .line 1578
    .line 1579
    .line 1580
    .line 1581
    .line 1582
    .line 1583
    .line 1584
    .line 1585
    .line 1586
    .line 1587
    .line 1588
    .line 1589
    .line 1590
    .line 1591
    .line 1592
    .line 1593
    .line 1594
    .line 1595
    .line 1596
    .line 1597
    .line 1598
    .line 1599
    .line 1600
    .line 1601
    .line 1602
    .line 1603
    .line 1604
    .line 1605
    .line 1606
    .line 1607
    .line 1608
    .line 1609
    .line 1610
    .line 1611
    .line 1612
    .line 1613
    .line 1614
    .line 1615
    .line 1616
    .line 1617
    .line 1618
    .line 1619
    .line 1620
    .line 1621
    .line 1622
    .line 1623
    .line 1624
    .line 1625
    .line 1626
    .line 1627
    .line 1628
    .line 1629
    .line 1630
    .line 1631
    .line 1632
    .line 1633
    .line 1634
    .line 1635
    .line 1636
    .line 1637
    .line 1638
    .line 1639
    .line 1640
    .line 1641
    .line 1642
    .line 1643
    .line 1644
    .line 1645
    .line 1646
    .line 1647
    .line 1648
    .line 1649
    .line 1650
    .line 1651
    .line 1652
    .line 1653
    .line 1654
    .line 1655
    .line 1656
    .line 1657
    .line 1658
    .line 1659
    .line 1660
    .line 1661
    .line 1662
    .line 1663
    .line 1664
    .line 1665
    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
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
    .end packed-switch
.end method
