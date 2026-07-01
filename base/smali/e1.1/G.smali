.class public final Le1/G;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Le1/G;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 41

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget v2, v0, Le1/G;->a:I

    .line 6
    .line 7
    const/4 v3, 0x6

    .line 8
    const/high16 v4, 0x3f000000    # 0.5f

    .line 9
    .line 10
    const/4 v5, 0x5

    .line 11
    const-wide/16 v6, 0x0

    .line 12
    .line 13
    const/16 v8, 0x8

    .line 14
    .line 15
    const/4 v9, 0x1

    .line 16
    const/4 v11, 0x4

    .line 17
    const/4 v12, 0x3

    .line 18
    const/4 v13, 0x0

    .line 19
    const/4 v14, 0x2

    .line 20
    packed-switch v2, :pswitch_data_0

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    const/4 v15, 0x0

    .line 28
    :goto_0
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-ge v3, v2, :cond_1

    .line 33
    .line 34
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    int-to-char v4, v3

    .line 39
    if-eq v4, v14, :cond_0

    .line 40
    .line 41
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->E(Landroid/os/Parcel;I)Landroid/os/IBinder;

    .line 46
    .line 47
    .line 48
    move-result-object v15

    .line 49
    goto :goto_0

    .line 50
    :cond_1
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 51
    .line 52
    .line 53
    new-instance v1, Le1/y;

    .line 54
    .line 55
    invoke-direct {v1, v15}, Le1/y;-><init>(Landroid/os/IBinder;)V

    .line 56
    .line 57
    .line 58
    return-object v1

    .line 59
    :pswitch_0
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    move/from16 v19, v13

    .line 64
    .line 65
    move/from16 v21, v19

    .line 66
    .line 67
    move/from16 v22, v21

    .line 68
    .line 69
    move/from16 v23, v22

    .line 70
    .line 71
    move/from16 v26, v23

    .line 72
    .line 73
    const/16 v17, 0x0

    .line 74
    .line 75
    const/16 v18, 0x0

    .line 76
    .line 77
    const/16 v20, 0x0

    .line 78
    .line 79
    const/16 v24, 0x0

    .line 80
    .line 81
    const/16 v25, 0x0

    .line 82
    .line 83
    const/16 v27, 0x0

    .line 84
    .line 85
    const/16 v28, 0x0

    .line 86
    .line 87
    :goto_1
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    if-ge v3, v2, :cond_2

    .line 92
    .line 93
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    int-to-char v4, v3

    .line 98
    packed-switch v4, :pswitch_data_1

    .line 99
    .line 100
    .line 101
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 102
    .line 103
    .line 104
    goto :goto_1

    .line 105
    :pswitch_1
    sget-object v4, Le1/A;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 106
    .line 107
    invoke-static {v1, v3, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->k(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    .line 108
    .line 109
    .line 110
    move-result-object v28

    .line 111
    goto :goto_1

    .line 112
    :pswitch_2
    sget-object v4, Le1/q;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 113
    .line 114
    invoke-static {v1, v3, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->k(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    .line 115
    .line 116
    .line 117
    move-result-object v27

    .line 118
    goto :goto_1

    .line 119
    :pswitch_3
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 120
    .line 121
    .line 122
    move-result v26

    .line 123
    goto :goto_1

    .line 124
    :pswitch_4
    sget-object v4, Le1/e;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 125
    .line 126
    invoke-static {v1, v3, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->h(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    move-object/from16 v25, v3

    .line 131
    .line 132
    check-cast v25, Le1/e;

    .line 133
    .line 134
    goto :goto_1

    .line 135
    :pswitch_5
    sget-object v4, Le1/e;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 136
    .line 137
    invoke-static {v1, v3, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->h(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    move-object/from16 v24, v3

    .line 142
    .line 143
    check-cast v24, Le1/e;

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :pswitch_6
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->A(Landroid/os/Parcel;I)Z

    .line 147
    .line 148
    .line 149
    move-result v23

    .line 150
    goto :goto_1

    .line 151
    :pswitch_7
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->A(Landroid/os/Parcel;I)Z

    .line 152
    .line 153
    .line 154
    move-result v22

    .line 155
    goto :goto_1

    .line 156
    :pswitch_8
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->A(Landroid/os/Parcel;I)Z

    .line 157
    .line 158
    .line 159
    move-result v21

    .line 160
    goto :goto_1

    .line 161
    :pswitch_9
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->C(Landroid/os/Parcel;I)F

    .line 162
    .line 163
    .line 164
    move-result v20

    .line 165
    goto :goto_1

    .line 166
    :pswitch_a
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 167
    .line 168
    .line 169
    move-result v19

    .line 170
    goto :goto_1

    .line 171
    :pswitch_b
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->C(Landroid/os/Parcel;I)F

    .line 172
    .line 173
    .line 174
    move-result v18

    .line 175
    goto :goto_1

    .line 176
    :pswitch_c
    sget-object v4, Lcom/google/android/gms/maps/model/LatLng;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 177
    .line 178
    invoke-static {v1, v3, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->k(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    .line 179
    .line 180
    .line 181
    move-result-object v17

    .line 182
    goto :goto_1

    .line 183
    :cond_2
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 184
    .line 185
    .line 186
    new-instance v16, Le1/w;

    .line 187
    .line 188
    invoke-direct/range {v16 .. v28}, Le1/w;-><init>(Ljava/util/ArrayList;FIFZZZLe1/e;Le1/e;ILjava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 189
    .line 190
    .line 191
    return-object v16

    .line 192
    :pswitch_d
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 193
    .line 194
    .line 195
    move-result v2

    .line 196
    move v3, v13

    .line 197
    const/4 v15, 0x0

    .line 198
    :goto_2
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 199
    .line 200
    .line 201
    move-result v4

    .line 202
    if-ge v4, v2, :cond_6

    .line 203
    .line 204
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 205
    .line 206
    .line 207
    move-result v4

    .line 208
    int-to-char v5, v4

    .line 209
    if-eq v5, v14, :cond_5

    .line 210
    .line 211
    if-eq v5, v12, :cond_4

    .line 212
    .line 213
    if-eq v5, v11, :cond_3

    .line 214
    .line 215
    invoke-static {v1, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 216
    .line 217
    .line 218
    goto :goto_2

    .line 219
    :cond_3
    sget-object v5, Le1/r;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 220
    .line 221
    invoke-static {v1, v4, v5}, Lcom/google/crypto/tink/shaded/protobuf/i0;->h(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 222
    .line 223
    .line 224
    move-result-object v4

    .line 225
    move-object v15, v4

    .line 226
    check-cast v15, Le1/r;

    .line 227
    .line 228
    goto :goto_2

    .line 229
    :cond_4
    invoke-static {v1, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 230
    .line 231
    .line 232
    move-result v3

    .line 233
    goto :goto_2

    .line 234
    :cond_5
    invoke-static {v1, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 235
    .line 236
    .line 237
    move-result v13

    .line 238
    goto :goto_2

    .line 239
    :cond_6
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 240
    .line 241
    .line 242
    new-instance v1, Le1/s;

    .line 243
    .line 244
    invoke-direct {v1, v13, v3, v15}, Le1/s;-><init>(IILe1/r;)V

    .line 245
    .line 246
    .line 247
    return-object v1

    .line 248
    :pswitch_e
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 249
    .line 250
    .line 251
    move-result v2

    .line 252
    const/4 v15, 0x0

    .line 253
    :goto_3
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 254
    .line 255
    .line 256
    move-result v3

    .line 257
    if-ge v3, v2, :cond_9

    .line 258
    .line 259
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 260
    .line 261
    .line 262
    move-result v3

    .line 263
    int-to-char v4, v3

    .line 264
    if-eq v4, v14, :cond_8

    .line 265
    .line 266
    if-eq v4, v12, :cond_7

    .line 267
    .line 268
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 269
    .line 270
    .line 271
    goto :goto_3

    .line 272
    :cond_7
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->D(Landroid/os/Parcel;I)Ljava/lang/Float;

    .line 273
    .line 274
    .line 275
    move-result-object v15

    .line 276
    goto :goto_3

    .line 277
    :cond_8
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 278
    .line 279
    .line 280
    move-result v13

    .line 281
    goto :goto_3

    .line 282
    :cond_9
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 283
    .line 284
    .line 285
    new-instance v1, Le1/q;

    .line 286
    .line 287
    invoke-direct {v1, v13, v15}, Le1/q;-><init>(ILjava/lang/Float;)V

    .line 288
    .line 289
    .line 290
    return-object v1

    .line 291
    :pswitch_f
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 292
    .line 293
    .line 294
    move-result v2

    .line 295
    const/high16 v3, 0x3f800000    # 1.0f

    .line 296
    .line 297
    move/from16 v34, v3

    .line 298
    .line 299
    move/from16 v32, v4

    .line 300
    .line 301
    move v14, v13

    .line 302
    move/from16 v29, v14

    .line 303
    .line 304
    move/from16 v30, v29

    .line 305
    .line 306
    move/from16 v36, v30

    .line 307
    .line 308
    move/from16 v37, v36

    .line 309
    .line 310
    const/4 v5, 0x0

    .line 311
    const/4 v6, 0x0

    .line 312
    const/4 v7, 0x0

    .line 313
    const/4 v8, 0x0

    .line 314
    const/4 v11, 0x0

    .line 315
    const/4 v12, 0x0

    .line 316
    const/16 v16, 0x0

    .line 317
    .line 318
    const/16 v31, 0x0

    .line 319
    .line 320
    const/16 v33, 0x0

    .line 321
    .line 322
    const/16 v35, 0x0

    .line 323
    .line 324
    const/16 v38, 0x0

    .line 325
    .line 326
    :goto_4
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 327
    .line 328
    .line 329
    move-result v15

    .line 330
    if-ge v15, v2, :cond_a

    .line 331
    .line 332
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 333
    .line 334
    .line 335
    move-result v15

    .line 336
    int-to-char v10, v15

    .line 337
    packed-switch v10, :pswitch_data_2

    .line 338
    .line 339
    .line 340
    :pswitch_10
    invoke-static {v1, v15}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 341
    .line 342
    .line 343
    goto :goto_4

    .line 344
    :pswitch_11
    invoke-static {v1, v15}, Lcom/google/crypto/tink/shaded/protobuf/i0;->i(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 345
    .line 346
    .line 347
    move-result-object v38

    .line 348
    goto :goto_4

    .line 349
    :pswitch_12
    invoke-static {v1, v15}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 350
    .line 351
    .line 352
    move-result v37

    .line 353
    goto :goto_4

    .line 354
    :pswitch_13
    invoke-static {v1, v15}, Lcom/google/crypto/tink/shaded/protobuf/i0;->E(Landroid/os/Parcel;I)Landroid/os/IBinder;

    .line 355
    .line 356
    .line 357
    move-result-object v16

    .line 358
    goto :goto_4

    .line 359
    :pswitch_14
    invoke-static {v1, v15}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 360
    .line 361
    .line 362
    move-result v36

    .line 363
    goto :goto_4

    .line 364
    :pswitch_15
    invoke-static {v1, v15}, Lcom/google/crypto/tink/shaded/protobuf/i0;->C(Landroid/os/Parcel;I)F

    .line 365
    .line 366
    .line 367
    move-result v35

    .line 368
    goto :goto_4

    .line 369
    :pswitch_16
    invoke-static {v1, v15}, Lcom/google/crypto/tink/shaded/protobuf/i0;->C(Landroid/os/Parcel;I)F

    .line 370
    .line 371
    .line 372
    move-result v34

    .line 373
    goto :goto_4

    .line 374
    :pswitch_17
    invoke-static {v1, v15}, Lcom/google/crypto/tink/shaded/protobuf/i0;->C(Landroid/os/Parcel;I)F

    .line 375
    .line 376
    .line 377
    move-result v33

    .line 378
    goto :goto_4

    .line 379
    :pswitch_18
    invoke-static {v1, v15}, Lcom/google/crypto/tink/shaded/protobuf/i0;->C(Landroid/os/Parcel;I)F

    .line 380
    .line 381
    .line 382
    move-result v32

    .line 383
    goto :goto_4

    .line 384
    :pswitch_19
    invoke-static {v1, v15}, Lcom/google/crypto/tink/shaded/protobuf/i0;->C(Landroid/os/Parcel;I)F

    .line 385
    .line 386
    .line 387
    move-result v31

    .line 388
    goto :goto_4

    .line 389
    :pswitch_1a
    invoke-static {v1, v15}, Lcom/google/crypto/tink/shaded/protobuf/i0;->A(Landroid/os/Parcel;I)Z

    .line 390
    .line 391
    .line 392
    move-result v30

    .line 393
    goto :goto_4

    .line 394
    :pswitch_1b
    invoke-static {v1, v15}, Lcom/google/crypto/tink/shaded/protobuf/i0;->A(Landroid/os/Parcel;I)Z

    .line 395
    .line 396
    .line 397
    move-result v29

    .line 398
    goto :goto_4

    .line 399
    :pswitch_1c
    invoke-static {v1, v15}, Lcom/google/crypto/tink/shaded/protobuf/i0;->A(Landroid/os/Parcel;I)Z

    .line 400
    .line 401
    .line 402
    move-result v14

    .line 403
    goto :goto_4

    .line 404
    :pswitch_1d
    invoke-static {v1, v15}, Lcom/google/crypto/tink/shaded/protobuf/i0;->C(Landroid/os/Parcel;I)F

    .line 405
    .line 406
    .line 407
    move-result v12

    .line 408
    goto :goto_4

    .line 409
    :pswitch_1e
    invoke-static {v1, v15}, Lcom/google/crypto/tink/shaded/protobuf/i0;->C(Landroid/os/Parcel;I)F

    .line 410
    .line 411
    .line 412
    move-result v11

    .line 413
    goto :goto_4

    .line 414
    :pswitch_1f
    invoke-static {v1, v15}, Lcom/google/crypto/tink/shaded/protobuf/i0;->E(Landroid/os/Parcel;I)Landroid/os/IBinder;

    .line 415
    .line 416
    .line 417
    move-result-object v8

    .line 418
    goto :goto_4

    .line 419
    :pswitch_20
    invoke-static {v1, v15}, Lcom/google/crypto/tink/shaded/protobuf/i0;->i(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 420
    .line 421
    .line 422
    move-result-object v7

    .line 423
    goto :goto_4

    .line 424
    :pswitch_21
    invoke-static {v1, v15}, Lcom/google/crypto/tink/shaded/protobuf/i0;->i(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 425
    .line 426
    .line 427
    move-result-object v6

    .line 428
    goto :goto_4

    .line 429
    :pswitch_22
    sget-object v5, Lcom/google/android/gms/maps/model/LatLng;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 430
    .line 431
    invoke-static {v1, v15, v5}, Lcom/google/crypto/tink/shaded/protobuf/i0;->h(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 432
    .line 433
    .line 434
    move-result-object v5

    .line 435
    check-cast v5, Lcom/google/android/gms/maps/model/LatLng;

    .line 436
    .line 437
    goto :goto_4

    .line 438
    :cond_a
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 439
    .line 440
    .line 441
    new-instance v1, Le1/p;

    .line 442
    .line 443
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 444
    .line 445
    .line 446
    iput v4, v1, Le1/p;->i:F

    .line 447
    .line 448
    iput v3, v1, Le1/p;->j:F

    .line 449
    .line 450
    iput-boolean v9, v1, Le1/p;->l:Z

    .line 451
    .line 452
    iput-boolean v13, v1, Le1/p;->m:Z

    .line 453
    .line 454
    const/4 v2, 0x0

    .line 455
    iput v2, v1, Le1/p;->n:F

    .line 456
    .line 457
    iput v4, v1, Le1/p;->o:F

    .line 458
    .line 459
    iput v2, v1, Le1/p;->p:F

    .line 460
    .line 461
    iput v3, v1, Le1/p;->q:F

    .line 462
    .line 463
    iput v13, v1, Le1/p;->s:I

    .line 464
    .line 465
    iput-object v5, v1, Le1/p;->e:Lcom/google/android/gms/maps/model/LatLng;

    .line 466
    .line 467
    iput-object v6, v1, Le1/p;->f:Ljava/lang/String;

    .line 468
    .line 469
    iput-object v7, v1, Le1/p;->g:Ljava/lang/String;

    .line 470
    .line 471
    if-nez v8, :cond_b

    .line 472
    .line 473
    const/4 v2, 0x0

    .line 474
    iput-object v2, v1, Le1/p;->h:Le1/c;

    .line 475
    .line 476
    goto :goto_5

    .line 477
    :cond_b
    const/4 v2, 0x0

    .line 478
    new-instance v3, Le1/c;

    .line 479
    .line 480
    invoke-static {v8}, LU0/b;->e(Landroid/os/IBinder;)LU0/a;

    .line 481
    .line 482
    .line 483
    move-result-object v4

    .line 484
    invoke-direct {v3, v4}, Le1/c;-><init>(LU0/a;)V

    .line 485
    .line 486
    .line 487
    iput-object v3, v1, Le1/p;->h:Le1/c;

    .line 488
    .line 489
    :goto_5
    iput v11, v1, Le1/p;->i:F

    .line 490
    .line 491
    iput v12, v1, Le1/p;->j:F

    .line 492
    .line 493
    iput-boolean v14, v1, Le1/p;->k:Z

    .line 494
    .line 495
    move/from16 v13, v29

    .line 496
    .line 497
    iput-boolean v13, v1, Le1/p;->l:Z

    .line 498
    .line 499
    move/from16 v13, v30

    .line 500
    .line 501
    iput-boolean v13, v1, Le1/p;->m:Z

    .line 502
    .line 503
    move/from16 v10, v31

    .line 504
    .line 505
    iput v10, v1, Le1/p;->n:F

    .line 506
    .line 507
    move/from16 v4, v32

    .line 508
    .line 509
    iput v4, v1, Le1/p;->o:F

    .line 510
    .line 511
    move/from16 v10, v33

    .line 512
    .line 513
    iput v10, v1, Le1/p;->p:F

    .line 514
    .line 515
    move/from16 v3, v34

    .line 516
    .line 517
    iput v3, v1, Le1/p;->q:F

    .line 518
    .line 519
    move/from16 v10, v35

    .line 520
    .line 521
    iput v10, v1, Le1/p;->r:F

    .line 522
    .line 523
    move/from16 v13, v37

    .line 524
    .line 525
    iput v13, v1, Le1/p;->u:I

    .line 526
    .line 527
    move/from16 v13, v36

    .line 528
    .line 529
    iput v13, v1, Le1/p;->s:I

    .line 530
    .line 531
    invoke-static/range {v16 .. v16}, LU0/b;->e(Landroid/os/IBinder;)LU0/a;

    .line 532
    .line 533
    .line 534
    move-result-object v3

    .line 535
    if-nez v3, :cond_c

    .line 536
    .line 537
    move-object v15, v2

    .line 538
    goto :goto_6

    .line 539
    :cond_c
    invoke-static {v3}, LU0/b;->f(LU0/a;)Ljava/lang/Object;

    .line 540
    .line 541
    .line 542
    move-result-object v2

    .line 543
    move-object v15, v2

    .line 544
    check-cast v15, Landroid/view/View;

    .line 545
    .line 546
    :goto_6
    iput-object v15, v1, Le1/p;->t:Landroid/view/View;

    .line 547
    .line 548
    move-object/from16 v15, v38

    .line 549
    .line 550
    iput-object v15, v1, Le1/p;->v:Ljava/lang/String;

    .line 551
    .line 552
    return-object v1

    .line 553
    :pswitch_23
    const/4 v2, 0x0

    .line 554
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 555
    .line 556
    .line 557
    move-result v3

    .line 558
    move-object v15, v2

    .line 559
    :goto_7
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 560
    .line 561
    .line 562
    move-result v2

    .line 563
    if-ge v2, v3, :cond_e

    .line 564
    .line 565
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 566
    .line 567
    .line 568
    move-result v2

    .line 569
    int-to-char v4, v2

    .line 570
    if-eq v4, v14, :cond_d

    .line 571
    .line 572
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 573
    .line 574
    .line 575
    goto :goto_7

    .line 576
    :cond_d
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->i(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 577
    .line 578
    .line 579
    move-result-object v15

    .line 580
    goto :goto_7

    .line 581
    :cond_e
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 582
    .line 583
    .line 584
    new-instance v1, Le1/n;

    .line 585
    .line 586
    invoke-direct {v1, v15}, Le1/n;-><init>(Ljava/lang/String;)V

    .line 587
    .line 588
    .line 589
    return-object v1

    .line 590
    :pswitch_24
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 591
    .line 592
    .line 593
    move-result v2

    .line 594
    move-wide v3, v6

    .line 595
    :goto_8
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 596
    .line 597
    .line 598
    move-result v5

    .line 599
    if-ge v5, v2, :cond_11

    .line 600
    .line 601
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 602
    .line 603
    .line 604
    move-result v5

    .line 605
    int-to-char v9, v5

    .line 606
    if-eq v9, v14, :cond_10

    .line 607
    .line 608
    if-eq v9, v12, :cond_f

    .line 609
    .line 610
    invoke-static {v1, v5}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 611
    .line 612
    .line 613
    goto :goto_8

    .line 614
    :cond_f
    invoke-static {v1, v5, v8}, Lcom/google/crypto/tink/shaded/protobuf/i0;->T(Landroid/os/Parcel;II)V

    .line 615
    .line 616
    .line 617
    invoke-virtual {v1}, Landroid/os/Parcel;->readDouble()D

    .line 618
    .line 619
    .line 620
    move-result-wide v3

    .line 621
    goto :goto_8

    .line 622
    :cond_10
    invoke-static {v1, v5, v8}, Lcom/google/crypto/tink/shaded/protobuf/i0;->T(Landroid/os/Parcel;II)V

    .line 623
    .line 624
    .line 625
    invoke-virtual {v1}, Landroid/os/Parcel;->readDouble()D

    .line 626
    .line 627
    .line 628
    move-result-wide v5

    .line 629
    move-wide v6, v5

    .line 630
    goto :goto_8

    .line 631
    :cond_11
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 632
    .line 633
    .line 634
    new-instance v1, Lcom/google/android/gms/maps/model/LatLng;

    .line 635
    .line 636
    invoke-direct {v1, v6, v7, v3, v4}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 637
    .line 638
    .line 639
    return-object v1

    .line 640
    :pswitch_25
    const/4 v2, 0x0

    .line 641
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 642
    .line 643
    .line 644
    move-result v3

    .line 645
    move-object v15, v2

    .line 646
    :goto_9
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 647
    .line 648
    .line 649
    move-result v4

    .line 650
    if-ge v4, v3, :cond_14

    .line 651
    .line 652
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 653
    .line 654
    .line 655
    move-result v4

    .line 656
    int-to-char v5, v4

    .line 657
    if-eq v5, v14, :cond_13

    .line 658
    .line 659
    if-eq v5, v12, :cond_12

    .line 660
    .line 661
    invoke-static {v1, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 662
    .line 663
    .line 664
    goto :goto_9

    .line 665
    :cond_12
    sget-object v2, Lcom/google/android/gms/maps/model/LatLng;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 666
    .line 667
    invoke-static {v1, v4, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->h(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 668
    .line 669
    .line 670
    move-result-object v2

    .line 671
    check-cast v2, Lcom/google/android/gms/maps/model/LatLng;

    .line 672
    .line 673
    goto :goto_9

    .line 674
    :cond_13
    sget-object v5, Lcom/google/android/gms/maps/model/LatLng;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 675
    .line 676
    invoke-static {v1, v4, v5}, Lcom/google/crypto/tink/shaded/protobuf/i0;->h(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 677
    .line 678
    .line 679
    move-result-object v4

    .line 680
    move-object v15, v4

    .line 681
    check-cast v15, Lcom/google/android/gms/maps/model/LatLng;

    .line 682
    .line 683
    goto :goto_9

    .line 684
    :cond_14
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 685
    .line 686
    .line 687
    new-instance v1, Lcom/google/android/gms/maps/model/LatLngBounds;

    .line 688
    .line 689
    invoke-direct {v1, v15, v2}, Lcom/google/android/gms/maps/model/LatLngBounds;-><init>(Lcom/google/android/gms/maps/model/LatLng;Lcom/google/android/gms/maps/model/LatLng;)V

    .line 690
    .line 691
    .line 692
    return-object v1

    .line 693
    :pswitch_26
    const/4 v2, 0x0

    .line 694
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 695
    .line 696
    .line 697
    move-result v3

    .line 698
    move-object v5, v2

    .line 699
    move-object v15, v5

    .line 700
    move/from16 v39, v13

    .line 701
    .line 702
    move/from16 v40, v39

    .line 703
    .line 704
    const/4 v6, 0x0

    .line 705
    const/4 v7, 0x0

    .line 706
    const/4 v8, 0x0

    .line 707
    const/4 v10, 0x0

    .line 708
    const/4 v11, 0x0

    .line 709
    const/4 v12, 0x0

    .line 710
    const/4 v14, 0x0

    .line 711
    :goto_a
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 712
    .line 713
    .line 714
    move-result v13

    .line 715
    if-ge v13, v3, :cond_15

    .line 716
    .line 717
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 718
    .line 719
    .line 720
    move-result v13

    .line 721
    int-to-char v4, v13

    .line 722
    packed-switch v4, :pswitch_data_3

    .line 723
    .line 724
    .line 725
    invoke-static {v1, v13}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 726
    .line 727
    .line 728
    :goto_b
    const/high16 v4, 0x3f000000    # 0.5f

    .line 729
    .line 730
    goto :goto_a

    .line 731
    :pswitch_27
    invoke-static {v1, v13}, Lcom/google/crypto/tink/shaded/protobuf/i0;->A(Landroid/os/Parcel;I)Z

    .line 732
    .line 733
    .line 734
    move-result v40

    .line 735
    goto :goto_b

    .line 736
    :pswitch_28
    invoke-static {v1, v13}, Lcom/google/crypto/tink/shaded/protobuf/i0;->C(Landroid/os/Parcel;I)F

    .line 737
    .line 738
    .line 739
    move-result v14

    .line 740
    goto :goto_b

    .line 741
    :pswitch_29
    invoke-static {v1, v13}, Lcom/google/crypto/tink/shaded/protobuf/i0;->C(Landroid/os/Parcel;I)F

    .line 742
    .line 743
    .line 744
    move-result v12

    .line 745
    goto :goto_b

    .line 746
    :pswitch_2a
    invoke-static {v1, v13}, Lcom/google/crypto/tink/shaded/protobuf/i0;->C(Landroid/os/Parcel;I)F

    .line 747
    .line 748
    .line 749
    move-result v11

    .line 750
    goto :goto_b

    .line 751
    :pswitch_2b
    invoke-static {v1, v13}, Lcom/google/crypto/tink/shaded/protobuf/i0;->A(Landroid/os/Parcel;I)Z

    .line 752
    .line 753
    .line 754
    move-result v39

    .line 755
    goto :goto_b

    .line 756
    :pswitch_2c
    invoke-static {v1, v13}, Lcom/google/crypto/tink/shaded/protobuf/i0;->C(Landroid/os/Parcel;I)F

    .line 757
    .line 758
    .line 759
    move-result v10

    .line 760
    goto :goto_b

    .line 761
    :pswitch_2d
    invoke-static {v1, v13}, Lcom/google/crypto/tink/shaded/protobuf/i0;->C(Landroid/os/Parcel;I)F

    .line 762
    .line 763
    .line 764
    move-result v8

    .line 765
    goto :goto_b

    .line 766
    :pswitch_2e
    sget-object v4, Lcom/google/android/gms/maps/model/LatLngBounds;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 767
    .line 768
    invoke-static {v1, v13, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->h(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 769
    .line 770
    .line 771
    move-result-object v4

    .line 772
    move-object v5, v4

    .line 773
    check-cast v5, Lcom/google/android/gms/maps/model/LatLngBounds;

    .line 774
    .line 775
    goto :goto_b

    .line 776
    :pswitch_2f
    invoke-static {v1, v13}, Lcom/google/crypto/tink/shaded/protobuf/i0;->C(Landroid/os/Parcel;I)F

    .line 777
    .line 778
    .line 779
    move-result v7

    .line 780
    goto :goto_b

    .line 781
    :pswitch_30
    invoke-static {v1, v13}, Lcom/google/crypto/tink/shaded/protobuf/i0;->C(Landroid/os/Parcel;I)F

    .line 782
    .line 783
    .line 784
    move-result v6

    .line 785
    goto :goto_b

    .line 786
    :pswitch_31
    sget-object v2, Lcom/google/android/gms/maps/model/LatLng;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 787
    .line 788
    invoke-static {v1, v13, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->h(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 789
    .line 790
    .line 791
    move-result-object v2

    .line 792
    check-cast v2, Lcom/google/android/gms/maps/model/LatLng;

    .line 793
    .line 794
    goto :goto_b

    .line 795
    :pswitch_32
    invoke-static {v1, v13}, Lcom/google/crypto/tink/shaded/protobuf/i0;->E(Landroid/os/Parcel;I)Landroid/os/IBinder;

    .line 796
    .line 797
    .line 798
    move-result-object v15

    .line 799
    goto :goto_b

    .line 800
    :cond_15
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 801
    .line 802
    .line 803
    new-instance v1, Le1/l;

    .line 804
    .line 805
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 806
    .line 807
    .line 808
    iput-boolean v9, v1, Le1/l;->l:Z

    .line 809
    .line 810
    const/4 v3, 0x0

    .line 811
    iput v3, v1, Le1/l;->m:F

    .line 812
    .line 813
    const/high16 v3, 0x3f000000    # 0.5f

    .line 814
    .line 815
    iput v3, v1, Le1/l;->n:F

    .line 816
    .line 817
    iput v3, v1, Le1/l;->o:F

    .line 818
    .line 819
    const/4 v4, 0x0

    .line 820
    iput-boolean v4, v1, Le1/l;->p:Z

    .line 821
    .line 822
    new-instance v3, Le1/c;

    .line 823
    .line 824
    invoke-static {v15}, LU0/b;->e(Landroid/os/IBinder;)LU0/a;

    .line 825
    .line 826
    .line 827
    move-result-object v4

    .line 828
    invoke-direct {v3, v4}, Le1/c;-><init>(LU0/a;)V

    .line 829
    .line 830
    .line 831
    iput-object v3, v1, Le1/l;->e:Le1/c;

    .line 832
    .line 833
    iput-object v2, v1, Le1/l;->f:Lcom/google/android/gms/maps/model/LatLng;

    .line 834
    .line 835
    iput v6, v1, Le1/l;->g:F

    .line 836
    .line 837
    iput v7, v1, Le1/l;->h:F

    .line 838
    .line 839
    iput-object v5, v1, Le1/l;->i:Lcom/google/android/gms/maps/model/LatLngBounds;

    .line 840
    .line 841
    iput v8, v1, Le1/l;->j:F

    .line 842
    .line 843
    iput v10, v1, Le1/l;->k:F

    .line 844
    .line 845
    move/from16 v13, v39

    .line 846
    .line 847
    iput-boolean v13, v1, Le1/l;->l:Z

    .line 848
    .line 849
    iput v11, v1, Le1/l;->m:F

    .line 850
    .line 851
    iput v12, v1, Le1/l;->n:F

    .line 852
    .line 853
    iput v14, v1, Le1/l;->o:F

    .line 854
    .line 855
    move/from16 v13, v40

    .line 856
    .line 857
    iput-boolean v13, v1, Le1/l;->p:Z

    .line 858
    .line 859
    return-object v1

    .line 860
    :pswitch_33
    move v4, v13

    .line 861
    const/4 v2, 0x0

    .line 862
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 863
    .line 864
    .line 865
    move-result v3

    .line 866
    move-object v6, v2

    .line 867
    move-object v7, v6

    .line 868
    :goto_c
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 869
    .line 870
    .line 871
    move-result v8

    .line 872
    if-ge v8, v3, :cond_1a

    .line 873
    .line 874
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 875
    .line 876
    .line 877
    move-result v8

    .line 878
    int-to-char v9, v8

    .line 879
    if-eq v9, v14, :cond_19

    .line 880
    .line 881
    if-eq v9, v12, :cond_18

    .line 882
    .line 883
    if-eq v9, v11, :cond_17

    .line 884
    .line 885
    if-eq v9, v5, :cond_16

    .line 886
    .line 887
    invoke-static {v1, v8}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 888
    .line 889
    .line 890
    goto :goto_c

    .line 891
    :cond_16
    invoke-static {v1, v8}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 892
    .line 893
    .line 894
    move-result v4

    .line 895
    goto :goto_c

    .line 896
    :cond_17
    invoke-static {v1, v8}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 897
    .line 898
    .line 899
    move-result v13

    .line 900
    goto :goto_c

    .line 901
    :cond_18
    invoke-static {v1, v8}, Lcom/google/crypto/tink/shaded/protobuf/i0;->E(Landroid/os/Parcel;I)Landroid/os/IBinder;

    .line 902
    .line 903
    .line 904
    move-result-object v7

    .line 905
    goto :goto_c

    .line 906
    :cond_19
    invoke-static {v1, v8}, Lcom/google/crypto/tink/shaded/protobuf/i0;->i(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 907
    .line 908
    .line 909
    move-result-object v6

    .line 910
    goto :goto_c

    .line 911
    :cond_1a
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 912
    .line 913
    .line 914
    new-instance v1, Le1/r;

    .line 915
    .line 916
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 917
    .line 918
    .line 919
    const v3, -0x4cebee

    .line 920
    .line 921
    .line 922
    iput v3, v1, Le1/r;->g:I

    .line 923
    .line 924
    const/high16 v3, -0x1000000

    .line 925
    .line 926
    iput v3, v1, Le1/r;->h:I

    .line 927
    .line 928
    iput-object v6, v1, Le1/r;->e:Ljava/lang/String;

    .line 929
    .line 930
    if-nez v7, :cond_1b

    .line 931
    .line 932
    move-object v15, v2

    .line 933
    goto :goto_d

    .line 934
    :cond_1b
    new-instance v15, Le1/c;

    .line 935
    .line 936
    invoke-static {v7}, LU0/b;->e(Landroid/os/IBinder;)LU0/a;

    .line 937
    .line 938
    .line 939
    move-result-object v2

    .line 940
    invoke-direct {v15, v2}, Le1/c;-><init>(LU0/a;)V

    .line 941
    .line 942
    .line 943
    :goto_d
    iput-object v15, v1, Le1/r;->f:Le1/c;

    .line 944
    .line 945
    iput v13, v1, Le1/r;->g:I

    .line 946
    .line 947
    iput v4, v1, Le1/r;->h:I

    .line 948
    .line 949
    return-object v1

    .line 950
    :pswitch_34
    move v4, v13

    .line 951
    const/4 v2, 0x0

    .line 952
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 953
    .line 954
    .line 955
    move-result v3

    .line 956
    move-object v11, v2

    .line 957
    move-object v15, v11

    .line 958
    move v5, v4

    .line 959
    move v9, v5

    .line 960
    move v13, v9

    .line 961
    const/4 v2, 0x0

    .line 962
    const/4 v10, 0x0

    .line 963
    :goto_e
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 964
    .line 965
    .line 966
    move-result v12

    .line 967
    if-ge v12, v3, :cond_1c

    .line 968
    .line 969
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 970
    .line 971
    .line 972
    move-result v12

    .line 973
    int-to-char v14, v12

    .line 974
    packed-switch v14, :pswitch_data_4

    .line 975
    .line 976
    .line 977
    invoke-static {v1, v12}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 978
    .line 979
    .line 980
    goto :goto_e

    .line 981
    :pswitch_35
    sget-object v11, Le1/q;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 982
    .line 983
    invoke-static {v1, v12, v11}, Lcom/google/crypto/tink/shaded/protobuf/i0;->k(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    .line 984
    .line 985
    .line 986
    move-result-object v11

    .line 987
    goto :goto_e

    .line 988
    :pswitch_36
    invoke-static {v1, v12}, Lcom/google/crypto/tink/shaded/protobuf/i0;->A(Landroid/os/Parcel;I)Z

    .line 989
    .line 990
    .line 991
    move-result v9

    .line 992
    goto :goto_e

    .line 993
    :pswitch_37
    invoke-static {v1, v12}, Lcom/google/crypto/tink/shaded/protobuf/i0;->A(Landroid/os/Parcel;I)Z

    .line 994
    .line 995
    .line 996
    move-result v5

    .line 997
    goto :goto_e

    .line 998
    :pswitch_38
    invoke-static {v1, v12}, Lcom/google/crypto/tink/shaded/protobuf/i0;->C(Landroid/os/Parcel;I)F

    .line 999
    .line 1000
    .line 1001
    move-result v2

    .line 1002
    goto :goto_e

    .line 1003
    :pswitch_39
    invoke-static {v1, v12}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1004
    .line 1005
    .line 1006
    move-result v4

    .line 1007
    goto :goto_e

    .line 1008
    :pswitch_3a
    invoke-static {v1, v12}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1009
    .line 1010
    .line 1011
    move-result v12

    .line 1012
    move v13, v12

    .line 1013
    goto :goto_e

    .line 1014
    :pswitch_3b
    invoke-static {v1, v12}, Lcom/google/crypto/tink/shaded/protobuf/i0;->C(Landroid/os/Parcel;I)F

    .line 1015
    .line 1016
    .line 1017
    move-result v10

    .line 1018
    goto :goto_e

    .line 1019
    :pswitch_3c
    invoke-static {v1, v12, v8}, Lcom/google/crypto/tink/shaded/protobuf/i0;->T(Landroid/os/Parcel;II)V

    .line 1020
    .line 1021
    .line 1022
    invoke-virtual {v1}, Landroid/os/Parcel;->readDouble()D

    .line 1023
    .line 1024
    .line 1025
    move-result-wide v6

    .line 1026
    goto :goto_e

    .line 1027
    :pswitch_3d
    sget-object v14, Lcom/google/android/gms/maps/model/LatLng;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1028
    .line 1029
    invoke-static {v1, v12, v14}, Lcom/google/crypto/tink/shaded/protobuf/i0;->h(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 1030
    .line 1031
    .line 1032
    move-result-object v12

    .line 1033
    check-cast v12, Lcom/google/android/gms/maps/model/LatLng;

    .line 1034
    .line 1035
    move-object v15, v12

    .line 1036
    goto :goto_e

    .line 1037
    :cond_1c
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 1038
    .line 1039
    .line 1040
    new-instance v1, Le1/g;

    .line 1041
    .line 1042
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 1043
    .line 1044
    .line 1045
    iput-object v15, v1, Le1/g;->e:Lcom/google/android/gms/maps/model/LatLng;

    .line 1046
    .line 1047
    iput-wide v6, v1, Le1/g;->f:D

    .line 1048
    .line 1049
    iput v10, v1, Le1/g;->g:F

    .line 1050
    .line 1051
    iput v13, v1, Le1/g;->h:I

    .line 1052
    .line 1053
    iput v4, v1, Le1/g;->i:I

    .line 1054
    .line 1055
    iput v2, v1, Le1/g;->j:F

    .line 1056
    .line 1057
    iput-boolean v5, v1, Le1/g;->k:Z

    .line 1058
    .line 1059
    iput-boolean v9, v1, Le1/g;->l:Z

    .line 1060
    .line 1061
    iput-object v11, v1, Le1/g;->m:Ljava/util/ArrayList;

    .line 1062
    .line 1063
    return-object v1

    .line 1064
    :pswitch_3e
    move v4, v13

    .line 1065
    const/4 v2, 0x0

    .line 1066
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 1067
    .line 1068
    .line 1069
    move-result v3

    .line 1070
    move-object v5, v2

    .line 1071
    move-object v4, v5

    .line 1072
    :goto_f
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1073
    .line 1074
    .line 1075
    move-result v6

    .line 1076
    if-ge v6, v3, :cond_20

    .line 1077
    .line 1078
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1079
    .line 1080
    .line 1081
    move-result v6

    .line 1082
    int-to-char v7, v6

    .line 1083
    if-eq v7, v14, :cond_1f

    .line 1084
    .line 1085
    if-eq v7, v12, :cond_1e

    .line 1086
    .line 1087
    if-eq v7, v11, :cond_1d

    .line 1088
    .line 1089
    invoke-static {v1, v6}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 1090
    .line 1091
    .line 1092
    goto :goto_f

    .line 1093
    :cond_1d
    invoke-static {v1, v6}, Lcom/google/crypto/tink/shaded/protobuf/i0;->D(Landroid/os/Parcel;I)Ljava/lang/Float;

    .line 1094
    .line 1095
    .line 1096
    move-result-object v5

    .line 1097
    goto :goto_f

    .line 1098
    :cond_1e
    invoke-static {v1, v6}, Lcom/google/crypto/tink/shaded/protobuf/i0;->E(Landroid/os/Parcel;I)Landroid/os/IBinder;

    .line 1099
    .line 1100
    .line 1101
    move-result-object v4

    .line 1102
    goto :goto_f

    .line 1103
    :cond_1f
    invoke-static {v1, v6}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1104
    .line 1105
    .line 1106
    move-result v13

    .line 1107
    goto :goto_f

    .line 1108
    :cond_20
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 1109
    .line 1110
    .line 1111
    new-instance v1, Le1/e;

    .line 1112
    .line 1113
    if-nez v4, :cond_21

    .line 1114
    .line 1115
    move-object v15, v2

    .line 1116
    goto :goto_10

    .line 1117
    :cond_21
    invoke-static {v4}, LU0/b;->e(Landroid/os/IBinder;)LU0/a;

    .line 1118
    .line 1119
    .line 1120
    move-result-object v2

    .line 1121
    new-instance v15, Le1/c;

    .line 1122
    .line 1123
    invoke-direct {v15, v2}, Le1/c;-><init>(LU0/a;)V

    .line 1124
    .line 1125
    .line 1126
    :goto_10
    invoke-direct {v1, v13, v15, v5}, Le1/e;-><init>(ILe1/c;Ljava/lang/Float;)V

    .line 1127
    .line 1128
    .line 1129
    return-object v1

    .line 1130
    :pswitch_3f
    const/4 v2, 0x0

    .line 1131
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 1132
    .line 1133
    .line 1134
    move-result v4

    .line 1135
    move-object/from16 v16, v2

    .line 1136
    .line 1137
    move-object/from16 v17, v16

    .line 1138
    .line 1139
    move-object/from16 v18, v17

    .line 1140
    .line 1141
    move-object/from16 v19, v18

    .line 1142
    .line 1143
    move-object/from16 v20, v19

    .line 1144
    .line 1145
    :goto_11
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1146
    .line 1147
    .line 1148
    move-result v2

    .line 1149
    if-ge v2, v4, :cond_27

    .line 1150
    .line 1151
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1152
    .line 1153
    .line 1154
    move-result v2

    .line 1155
    int-to-char v6, v2

    .line 1156
    if-eq v6, v14, :cond_26

    .line 1157
    .line 1158
    if-eq v6, v12, :cond_25

    .line 1159
    .line 1160
    if-eq v6, v11, :cond_24

    .line 1161
    .line 1162
    if-eq v6, v5, :cond_23

    .line 1163
    .line 1164
    if-eq v6, v3, :cond_22

    .line 1165
    .line 1166
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 1167
    .line 1168
    .line 1169
    goto :goto_11

    .line 1170
    :cond_22
    sget-object v6, Lcom/google/android/gms/maps/model/LatLngBounds;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1171
    .line 1172
    invoke-static {v1, v2, v6}, Lcom/google/crypto/tink/shaded/protobuf/i0;->h(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 1173
    .line 1174
    .line 1175
    move-result-object v2

    .line 1176
    move-object/from16 v20, v2

    .line 1177
    .line 1178
    check-cast v20, Lcom/google/android/gms/maps/model/LatLngBounds;

    .line 1179
    .line 1180
    goto :goto_11

    .line 1181
    :cond_23
    sget-object v6, Lcom/google/android/gms/maps/model/LatLng;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1182
    .line 1183
    invoke-static {v1, v2, v6}, Lcom/google/crypto/tink/shaded/protobuf/i0;->h(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 1184
    .line 1185
    .line 1186
    move-result-object v2

    .line 1187
    move-object/from16 v19, v2

    .line 1188
    .line 1189
    check-cast v19, Lcom/google/android/gms/maps/model/LatLng;

    .line 1190
    .line 1191
    goto :goto_11

    .line 1192
    :cond_24
    sget-object v6, Lcom/google/android/gms/maps/model/LatLng;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1193
    .line 1194
    invoke-static {v1, v2, v6}, Lcom/google/crypto/tink/shaded/protobuf/i0;->h(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 1195
    .line 1196
    .line 1197
    move-result-object v2

    .line 1198
    move-object/from16 v18, v2

    .line 1199
    .line 1200
    check-cast v18, Lcom/google/android/gms/maps/model/LatLng;

    .line 1201
    .line 1202
    goto :goto_11

    .line 1203
    :cond_25
    sget-object v6, Lcom/google/android/gms/maps/model/LatLng;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1204
    .line 1205
    invoke-static {v1, v2, v6}, Lcom/google/crypto/tink/shaded/protobuf/i0;->h(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 1206
    .line 1207
    .line 1208
    move-result-object v2

    .line 1209
    move-object/from16 v17, v2

    .line 1210
    .line 1211
    check-cast v17, Lcom/google/android/gms/maps/model/LatLng;

    .line 1212
    .line 1213
    goto :goto_11

    .line 1214
    :cond_26
    sget-object v6, Lcom/google/android/gms/maps/model/LatLng;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1215
    .line 1216
    invoke-static {v1, v2, v6}, Lcom/google/crypto/tink/shaded/protobuf/i0;->h(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 1217
    .line 1218
    .line 1219
    move-result-object v2

    .line 1220
    move-object/from16 v16, v2

    .line 1221
    .line 1222
    check-cast v16, Lcom/google/android/gms/maps/model/LatLng;

    .line 1223
    .line 1224
    goto :goto_11

    .line 1225
    :cond_27
    invoke-static {v1, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 1226
    .line 1227
    .line 1228
    new-instance v15, Le1/F;

    .line 1229
    .line 1230
    invoke-direct/range {v15 .. v20}, Le1/F;-><init>(Lcom/google/android/gms/maps/model/LatLng;Lcom/google/android/gms/maps/model/LatLng;Lcom/google/android/gms/maps/model/LatLng;Lcom/google/android/gms/maps/model/LatLng;Lcom/google/android/gms/maps/model/LatLngBounds;)V

    .line 1231
    .line 1232
    .line 1233
    return-object v15

    .line 1234
    :pswitch_40
    move v4, v13

    .line 1235
    const/4 v2, 0x0

    .line 1236
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 1237
    .line 1238
    .line 1239
    move-result v6

    .line 1240
    move-object v8, v2

    .line 1241
    move v10, v9

    .line 1242
    const/4 v4, 0x0

    .line 1243
    const/4 v7, 0x0

    .line 1244
    :goto_12
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1245
    .line 1246
    .line 1247
    move-result v15

    .line 1248
    if-ge v15, v6, :cond_2d

    .line 1249
    .line 1250
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1251
    .line 1252
    .line 1253
    move-result v15

    .line 1254
    int-to-char v2, v15

    .line 1255
    if-eq v2, v14, :cond_2c

    .line 1256
    .line 1257
    if-eq v2, v12, :cond_2b

    .line 1258
    .line 1259
    if-eq v2, v11, :cond_2a

    .line 1260
    .line 1261
    if-eq v2, v5, :cond_29

    .line 1262
    .line 1263
    if-eq v2, v3, :cond_28

    .line 1264
    .line 1265
    invoke-static {v1, v15}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 1266
    .line 1267
    .line 1268
    :goto_13
    const/4 v2, 0x0

    .line 1269
    goto :goto_12

    .line 1270
    :cond_28
    invoke-static {v1, v15}, Lcom/google/crypto/tink/shaded/protobuf/i0;->C(Landroid/os/Parcel;I)F

    .line 1271
    .line 1272
    .line 1273
    move-result v7

    .line 1274
    goto :goto_13

    .line 1275
    :cond_29
    invoke-static {v1, v15}, Lcom/google/crypto/tink/shaded/protobuf/i0;->A(Landroid/os/Parcel;I)Z

    .line 1276
    .line 1277
    .line 1278
    move-result v10

    .line 1279
    goto :goto_13

    .line 1280
    :cond_2a
    invoke-static {v1, v15}, Lcom/google/crypto/tink/shaded/protobuf/i0;->C(Landroid/os/Parcel;I)F

    .line 1281
    .line 1282
    .line 1283
    move-result v4

    .line 1284
    goto :goto_13

    .line 1285
    :cond_2b
    invoke-static {v1, v15}, Lcom/google/crypto/tink/shaded/protobuf/i0;->A(Landroid/os/Parcel;I)Z

    .line 1286
    .line 1287
    .line 1288
    move-result v13

    .line 1289
    goto :goto_13

    .line 1290
    :cond_2c
    invoke-static {v1, v15}, Lcom/google/crypto/tink/shaded/protobuf/i0;->E(Landroid/os/Parcel;I)Landroid/os/IBinder;

    .line 1291
    .line 1292
    .line 1293
    move-result-object v8

    .line 1294
    goto :goto_13

    .line 1295
    :cond_2d
    invoke-static {v1, v6}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 1296
    .line 1297
    .line 1298
    new-instance v1, Le1/D;

    .line 1299
    .line 1300
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 1301
    .line 1302
    .line 1303
    iput-boolean v9, v1, Le1/D;->f:Z

    .line 1304
    .line 1305
    iput-boolean v9, v1, Le1/D;->h:Z

    .line 1306
    .line 1307
    const/4 v2, 0x0

    .line 1308
    iput v2, v1, Le1/D;->i:F

    .line 1309
    .line 1310
    sget v2, Le1/H;->e:I

    .line 1311
    .line 1312
    if-nez v8, :cond_2e

    .line 1313
    .line 1314
    const/4 v15, 0x0

    .line 1315
    goto :goto_14

    .line 1316
    :cond_2e
    const-string v2, "com.google.android.gms.maps.model.internal.ITileProviderDelegate"

    .line 1317
    .line 1318
    invoke-interface {v8, v2}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 1319
    .line 1320
    .line 1321
    move-result-object v3

    .line 1322
    instance-of v5, v3, LZ0/q;

    .line 1323
    .line 1324
    if-eqz v5, :cond_2f

    .line 1325
    .line 1326
    move-object v15, v3

    .line 1327
    check-cast v15, LZ0/q;

    .line 1328
    .line 1329
    goto :goto_14

    .line 1330
    :cond_2f
    new-instance v15, LZ0/p;

    .line 1331
    .line 1332
    invoke-direct {v15, v8, v2, v9}, LY0/a;-><init>(Landroid/os/IBinder;Ljava/lang/String;I)V

    .line 1333
    .line 1334
    .line 1335
    :goto_14
    iput-object v15, v1, Le1/D;->e:LZ0/q;

    .line 1336
    .line 1337
    iput-boolean v13, v1, Le1/D;->f:Z

    .line 1338
    .line 1339
    iput v4, v1, Le1/D;->g:F

    .line 1340
    .line 1341
    iput-boolean v10, v1, Le1/D;->h:Z

    .line 1342
    .line 1343
    iput v7, v1, Le1/D;->i:F

    .line 1344
    .line 1345
    return-object v1

    .line 1346
    :pswitch_41
    move v4, v13

    .line 1347
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 1348
    .line 1349
    .line 1350
    move-result v2

    .line 1351
    :goto_15
    const/4 v3, 0x0

    .line 1352
    :goto_16
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1353
    .line 1354
    .line 1355
    move-result v5

    .line 1356
    if-ge v5, v2, :cond_34

    .line 1357
    .line 1358
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1359
    .line 1360
    .line 1361
    move-result v5

    .line 1362
    int-to-char v6, v5

    .line 1363
    if-eq v6, v14, :cond_33

    .line 1364
    .line 1365
    if-eq v6, v12, :cond_32

    .line 1366
    .line 1367
    if-eq v6, v11, :cond_30

    .line 1368
    .line 1369
    invoke-static {v1, v5}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 1370
    .line 1371
    .line 1372
    goto :goto_16

    .line 1373
    :cond_30
    invoke-static {v1, v5}, Lcom/google/crypto/tink/shaded/protobuf/i0;->G(Landroid/os/Parcel;I)I

    .line 1374
    .line 1375
    .line 1376
    move-result v3

    .line 1377
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1378
    .line 1379
    .line 1380
    move-result v5

    .line 1381
    if-nez v3, :cond_31

    .line 1382
    .line 1383
    goto :goto_15

    .line 1384
    :cond_31
    invoke-virtual {v1}, Landroid/os/Parcel;->createByteArray()[B

    .line 1385
    .line 1386
    .line 1387
    move-result-object v6

    .line 1388
    add-int/2addr v5, v3

    .line 1389
    invoke-virtual {v1, v5}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 1390
    .line 1391
    .line 1392
    move-object v3, v6

    .line 1393
    goto :goto_16

    .line 1394
    :cond_32
    invoke-static {v1, v5}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1395
    .line 1396
    .line 1397
    move-result v4

    .line 1398
    goto :goto_16

    .line 1399
    :cond_33
    invoke-static {v1, v5}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1400
    .line 1401
    .line 1402
    move-result v13

    .line 1403
    goto :goto_16

    .line 1404
    :cond_34
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 1405
    .line 1406
    .line 1407
    new-instance v1, Le1/B;

    .line 1408
    .line 1409
    invoke-direct {v1, v3, v13, v4}, Le1/B;-><init>([BII)V

    .line 1410
    .line 1411
    .line 1412
    return-object v1

    .line 1413
    :pswitch_42
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 1414
    .line 1415
    .line 1416
    move-result v2

    .line 1417
    const/4 v15, 0x0

    .line 1418
    :goto_17
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1419
    .line 1420
    .line 1421
    move-result v3

    .line 1422
    if-ge v3, v2, :cond_37

    .line 1423
    .line 1424
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1425
    .line 1426
    .line 1427
    move-result v3

    .line 1428
    int-to-char v4, v3

    .line 1429
    if-eq v4, v14, :cond_36

    .line 1430
    .line 1431
    if-eq v4, v12, :cond_35

    .line 1432
    .line 1433
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 1434
    .line 1435
    .line 1436
    goto :goto_17

    .line 1437
    :cond_35
    invoke-static {v1, v3, v8}, Lcom/google/crypto/tink/shaded/protobuf/i0;->T(Landroid/os/Parcel;II)V

    .line 1438
    .line 1439
    .line 1440
    invoke-virtual {v1}, Landroid/os/Parcel;->readDouble()D

    .line 1441
    .line 1442
    .line 1443
    move-result-wide v3

    .line 1444
    move-wide v6, v3

    .line 1445
    goto :goto_17

    .line 1446
    :cond_36
    sget-object v4, Le1/z;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1447
    .line 1448
    invoke-static {v1, v3, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->h(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 1449
    .line 1450
    .line 1451
    move-result-object v3

    .line 1452
    check-cast v3, Le1/z;

    .line 1453
    .line 1454
    move-object v15, v3

    .line 1455
    goto :goto_17

    .line 1456
    :cond_37
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 1457
    .line 1458
    .line 1459
    new-instance v1, Le1/A;

    .line 1460
    .line 1461
    invoke-direct {v1, v15, v6, v7}, Le1/A;-><init>(Le1/z;D)V

    .line 1462
    .line 1463
    .line 1464
    return-object v1

    .line 1465
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_34
        :pswitch_33
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_0
    .end packed-switch

    .line 1466
    .line 1467
    .line 1468
    .line 1469
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
    :pswitch_data_1
    .packed-switch 0x2
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
    .end packed-switch

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
    .line 1520
    .line 1521
    .line 1522
    .line 1523
    .line 1524
    .line 1525
    .line 1526
    .line 1527
    :pswitch_data_2
    .packed-switch 0x2
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
        :pswitch_10
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
    .end packed-switch

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
    :pswitch_data_3
    .packed-switch 0x2
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
    .end packed-switch

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
    :pswitch_data_4
    .packed-switch 0x2
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
    .end packed-switch
.end method

.method public final synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Le1/G;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    new-array p1, p1, [Le1/y;

    .line 7
    .line 8
    return-object p1

    .line 9
    :pswitch_0
    new-array p1, p1, [Le1/w;

    .line 10
    .line 11
    return-object p1

    .line 12
    :pswitch_1
    new-array p1, p1, [Le1/s;

    .line 13
    .line 14
    return-object p1

    .line 15
    :pswitch_2
    new-array p1, p1, [Le1/q;

    .line 16
    .line 17
    return-object p1

    .line 18
    :pswitch_3
    new-array p1, p1, [Le1/p;

    .line 19
    .line 20
    return-object p1

    .line 21
    :pswitch_4
    new-array p1, p1, [Le1/n;

    .line 22
    .line 23
    return-object p1

    .line 24
    :pswitch_5
    new-array p1, p1, [Lcom/google/android/gms/maps/model/LatLng;

    .line 25
    .line 26
    return-object p1

    .line 27
    :pswitch_6
    new-array p1, p1, [Lcom/google/android/gms/maps/model/LatLngBounds;

    .line 28
    .line 29
    return-object p1

    .line 30
    :pswitch_7
    new-array p1, p1, [Le1/l;

    .line 31
    .line 32
    return-object p1

    .line 33
    :pswitch_8
    new-array p1, p1, [Le1/r;

    .line 34
    .line 35
    return-object p1

    .line 36
    :pswitch_9
    new-array p1, p1, [Le1/g;

    .line 37
    .line 38
    return-object p1

    .line 39
    :pswitch_a
    new-array p1, p1, [Le1/e;

    .line 40
    .line 41
    return-object p1

    .line 42
    :pswitch_b
    new-array p1, p1, [Le1/F;

    .line 43
    .line 44
    return-object p1

    .line 45
    :pswitch_c
    new-array p1, p1, [Le1/D;

    .line 46
    .line 47
    return-object p1

    .line 48
    :pswitch_d
    new-array p1, p1, [Le1/B;

    .line 49
    .line 50
    return-object p1

    .line 51
    :pswitch_e
    new-array p1, p1, [Le1/A;

    .line 52
    .line 53
    return-object p1

    .line 54
    nop

    .line 55
    :pswitch_data_0
    .packed-switch 0x0
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
