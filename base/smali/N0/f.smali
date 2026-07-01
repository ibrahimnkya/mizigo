.class public LN0/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LA0/b;
.implements LI/c;
.implements LU/a;
.implements Lk3/d;
.implements Ly1/j;


# static fields
.field public static f:LN0/f;

.field public static g:LN0/f;


# instance fields
.field public final synthetic e:I


# direct methods
.method public constructor <init>()V
    .locals 2

    const/16 v0, 0xb

    iput v0, p0, LN0/f;->e:I

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    new-instance v0, Lp/e;

    const/4 v1, 0x0

    .line 5
    invoke-direct {v0, v1}, Lp/j;-><init>(I)V

    .line 6
    new-instance v0, Lp/g;

    invoke-direct {v0}, Lp/g;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, LN0/f;->e:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 2
    iput p1, p0, LN0/f;->e:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lb3/b;)V
    .locals 5

    const/16 v0, 0xe

    iput v0, p0, LN0/f;->e:I

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    new-instance v0, LE/i;

    const/16 v1, 0x1b

    invoke-direct {v0, v1, p0}, LE/i;-><init>(ILjava/lang/Object;)V

    .line 9
    new-instance v1, Lk3/o;

    sget-object v2, Lk3/v;->a:Lk3/v;

    const/4 v3, 0x0

    .line 10
    const-string v4, "flutter/deferredcomponent"

    invoke-direct {v1, p1, v4, v2, v3}, Lk3/o;-><init>(Lk3/f;Ljava/lang/String;Lk3/p;LN1/e;)V

    .line 11
    invoke-virtual {v1, v0}, Lk3/o;->b(Lk3/m;)V

    .line 12
    invoke-static {}, LB2/a;->J()LB2/a;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    return-void
.end method

.method public static b(LQ/h;LQ/h;)V
    .locals 109

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const-string v105, "InteroperabilityIndex"

    .line 6
    .line 7
    const-string v106, "Orientation"

    .line 8
    .line 9
    const-string v2, "ImageDescription"

    .line 10
    .line 11
    const-string v3, "Make"

    .line 12
    .line 13
    const-string v4, "Model"

    .line 14
    .line 15
    const-string v5, "Software"

    .line 16
    .line 17
    const-string v6, "DateTime"

    .line 18
    .line 19
    const-string v7, "Artist"

    .line 20
    .line 21
    const-string v8, "Copyright"

    .line 22
    .line 23
    const-string v9, "ExposureTime"

    .line 24
    .line 25
    const-string v10, "FNumber"

    .line 26
    .line 27
    const-string v11, "ExposureProgram"

    .line 28
    .line 29
    const-string v12, "SpectralSensitivity"

    .line 30
    .line 31
    const-string v13, "PhotographicSensitivity"

    .line 32
    .line 33
    const-string v14, "ISOSpeedRatings"

    .line 34
    .line 35
    const-string v15, "OECF"

    .line 36
    .line 37
    const-string v16, "SensitivityType"

    .line 38
    .line 39
    const-string v17, "StandardOutputSensitivity"

    .line 40
    .line 41
    const-string v18, "RecommendedExposureIndex"

    .line 42
    .line 43
    const-string v19, "ISOSpeed"

    .line 44
    .line 45
    const-string v20, "ISOSpeedLatitudeyyy"

    .line 46
    .line 47
    const-string v21, "ISOSpeedLatitudezzz"

    .line 48
    .line 49
    const-string v22, "ExifVersion"

    .line 50
    .line 51
    const-string v23, "DateTimeOriginal"

    .line 52
    .line 53
    const-string v24, "DateTimeDigitized"

    .line 54
    .line 55
    const-string v25, "OffsetTime"

    .line 56
    .line 57
    const-string v26, "OffsetTimeOriginal"

    .line 58
    .line 59
    const-string v27, "OffsetTimeDigitized"

    .line 60
    .line 61
    const-string v28, "ShutterSpeedValue"

    .line 62
    .line 63
    const-string v29, "ApertureValue"

    .line 64
    .line 65
    const-string v30, "BrightnessValue"

    .line 66
    .line 67
    const-string v31, "ExposureBiasValue"

    .line 68
    .line 69
    const-string v32, "MaxApertureValue"

    .line 70
    .line 71
    const-string v33, "SubjectDistance"

    .line 72
    .line 73
    const-string v34, "MeteringMode"

    .line 74
    .line 75
    const-string v35, "LightSource"

    .line 76
    .line 77
    const-string v36, "Flash"

    .line 78
    .line 79
    const-string v37, "FocalLength"

    .line 80
    .line 81
    const-string v38, "MakerNote"

    .line 82
    .line 83
    const-string v39, "UserComment"

    .line 84
    .line 85
    const-string v40, "SubSecTime"

    .line 86
    .line 87
    const-string v41, "SubSecTimeOriginal"

    .line 88
    .line 89
    const-string v42, "SubSecTimeDigitized"

    .line 90
    .line 91
    const-string v43, "FlashpixVersion"

    .line 92
    .line 93
    const-string v44, "FlashEnergy"

    .line 94
    .line 95
    const-string v45, "SpatialFrequencyResponse"

    .line 96
    .line 97
    const-string v46, "FocalPlaneXResolution"

    .line 98
    .line 99
    const-string v47, "FocalPlaneYResolution"

    .line 100
    .line 101
    const-string v48, "FocalPlaneResolutionUnit"

    .line 102
    .line 103
    const-string v49, "ExposureIndex"

    .line 104
    .line 105
    const-string v50, "SensingMethod"

    .line 106
    .line 107
    const-string v51, "FileSource"

    .line 108
    .line 109
    const-string v52, "SceneType"

    .line 110
    .line 111
    const-string v53, "CFAPattern"

    .line 112
    .line 113
    const-string v54, "CustomRendered"

    .line 114
    .line 115
    const-string v55, "ExposureMode"

    .line 116
    .line 117
    const-string v56, "WhiteBalance"

    .line 118
    .line 119
    const-string v57, "DigitalZoomRatio"

    .line 120
    .line 121
    const-string v58, "FocalLengthIn35mmFilm"

    .line 122
    .line 123
    const-string v59, "SceneCaptureType"

    .line 124
    .line 125
    const-string v60, "GainControl"

    .line 126
    .line 127
    const-string v61, "Contrast"

    .line 128
    .line 129
    const-string v62, "Saturation"

    .line 130
    .line 131
    const-string v63, "Sharpness"

    .line 132
    .line 133
    const-string v64, "DeviceSettingDescription"

    .line 134
    .line 135
    const-string v65, "SubjectDistanceRange"

    .line 136
    .line 137
    const-string v66, "ImageUniqueID"

    .line 138
    .line 139
    const-string v67, "CameraOwnerName"

    .line 140
    .line 141
    const-string v68, "BodySerialNumber"

    .line 142
    .line 143
    const-string v69, "LensSpecification"

    .line 144
    .line 145
    const-string v70, "LensMake"

    .line 146
    .line 147
    const-string v71, "LensModel"

    .line 148
    .line 149
    const-string v72, "LensSerialNumber"

    .line 150
    .line 151
    const-string v73, "GPSVersionID"

    .line 152
    .line 153
    const-string v74, "GPSLatitudeRef"

    .line 154
    .line 155
    const-string v75, "GPSLatitude"

    .line 156
    .line 157
    const-string v76, "GPSLongitudeRef"

    .line 158
    .line 159
    const-string v77, "GPSLongitude"

    .line 160
    .line 161
    const-string v78, "GPSAltitudeRef"

    .line 162
    .line 163
    const-string v79, "GPSAltitude"

    .line 164
    .line 165
    const-string v80, "GPSTimeStamp"

    .line 166
    .line 167
    const-string v81, "GPSSatellites"

    .line 168
    .line 169
    const-string v82, "GPSStatus"

    .line 170
    .line 171
    const-string v83, "GPSMeasureMode"

    .line 172
    .line 173
    const-string v84, "GPSDOP"

    .line 174
    .line 175
    const-string v85, "GPSSpeedRef"

    .line 176
    .line 177
    const-string v86, "GPSSpeed"

    .line 178
    .line 179
    const-string v87, "GPSTrackRef"

    .line 180
    .line 181
    const-string v88, "GPSTrack"

    .line 182
    .line 183
    const-string v89, "GPSImgDirectionRef"

    .line 184
    .line 185
    const-string v90, "GPSImgDirection"

    .line 186
    .line 187
    const-string v91, "GPSMapDatum"

    .line 188
    .line 189
    const-string v92, "GPSDestLatitudeRef"

    .line 190
    .line 191
    const-string v93, "GPSDestLatitude"

    .line 192
    .line 193
    const-string v94, "GPSDestLongitudeRef"

    .line 194
    .line 195
    const-string v95, "GPSDestLongitude"

    .line 196
    .line 197
    const-string v96, "GPSDestBearingRef"

    .line 198
    .line 199
    const-string v97, "GPSDestBearing"

    .line 200
    .line 201
    const-string v98, "GPSDestDistanceRef"

    .line 202
    .line 203
    const-string v99, "GPSDestDistance"

    .line 204
    .line 205
    const-string v100, "GPSProcessingMethod"

    .line 206
    .line 207
    const-string v101, "GPSAreaInformation"

    .line 208
    .line 209
    const-string v102, "GPSDateStamp"

    .line 210
    .line 211
    const-string v103, "GPSDifferential"

    .line 212
    .line 213
    const-string v104, "GPSHPositioningError"

    .line 214
    .line 215
    filled-new-array/range {v2 .. v106}, [Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v2

    .line 219
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 220
    .line 221
    .line 222
    move-result-object v2

    .line 223
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 224
    .line 225
    .line 226
    move-result-object v2

    .line 227
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 228
    .line 229
    .line 230
    move-result v3

    .line 231
    if-eqz v3, :cond_2c

    .line 232
    .line 233
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    move-result-object v3

    .line 237
    check-cast v3, Ljava/lang/String;

    .line 238
    .line 239
    invoke-virtual {v0, v3}, LQ/h;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v12

    .line 243
    if-eqz v12, :cond_2b

    .line 244
    .line 245
    invoke-virtual {v0, v3}, LQ/h;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v12

    .line 249
    sget-object v13, LQ/h;->R:[I

    .line 250
    .line 251
    sget-boolean v14, LQ/h;->u:Z

    .line 252
    .line 253
    iget-object v15, v1, LQ/h;->e:[Ljava/util/HashMap;

    .line 254
    .line 255
    const/16 v16, 0x0

    .line 256
    .line 257
    const-string v11, "ISOSpeedRatings"

    .line 258
    .line 259
    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 260
    .line 261
    .line 262
    move-result v11

    .line 263
    const-string v7, "ExifInterface"

    .line 264
    .line 265
    if-eqz v11, :cond_1

    .line 266
    .line 267
    if-eqz v14, :cond_0

    .line 268
    .line 269
    const-string v3, "setAttribute: Replacing TAG_ISO_SPEED_RATINGS with TAG_PHOTOGRAPHIC_SENSITIVITY."

    .line 270
    .line 271
    invoke-static {v7, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 272
    .line 273
    .line 274
    :cond_0
    const-string v3, "PhotographicSensitivity"

    .line 275
    .line 276
    :cond_1
    const-string v9, "/"

    .line 277
    .line 278
    if-eqz v12, :cond_d

    .line 279
    .line 280
    sget-object v5, LQ/h;->Y:Ljava/util/Set;

    .line 281
    .line 282
    invoke-interface {v5, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 283
    .line 284
    .line 285
    move-result v5

    .line 286
    const-string v4, " : "

    .line 287
    .line 288
    const-string v6, "Invalid value for "

    .line 289
    .line 290
    if-eqz v5, :cond_7

    .line 291
    .line 292
    invoke-virtual {v12, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 293
    .line 294
    .line 295
    move-result v5

    .line 296
    if-nez v5, :cond_7

    .line 297
    .line 298
    :try_start_0
    invoke-static {v12}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 299
    .line 300
    .line 301
    move-result-wide v23

    .line 302
    const-wide/high16 v25, 0x43e0000000000000L    # 9.223372036854776E18

    .line 303
    .line 304
    cmpl-double v5, v23, v25

    .line 305
    .line 306
    const-wide/16 v25, 0x0

    .line 307
    .line 308
    move-object/from16 v28, v9

    .line 309
    .line 310
    const-wide/16 v8, 0x1

    .line 311
    .line 312
    if-gez v5, :cond_2

    .line 313
    .line 314
    const-wide/high16 v29, -0x3c20000000000000L    # -9.223372036854776E18

    .line 315
    .line 316
    cmpg-double v5, v23, v29

    .line 317
    .line 318
    if-gtz v5, :cond_3

    .line 319
    .line 320
    :cond_2
    move-object/from16 v44, v6

    .line 321
    .line 322
    goto :goto_2

    .line 323
    :cond_3
    invoke-static/range {v23 .. v24}, Ljava/lang/Math;->abs(D)D

    .line 324
    .line 325
    .line 326
    move-result-wide v29
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 327
    const-wide v31, 0x3e45798ee2308c3aL    # 1.0E-8

    .line 328
    .line 329
    .line 330
    .line 331
    .line 332
    mul-double v31, v31, v29

    .line 333
    .line 334
    move-wide/from16 v35, v8

    .line 335
    .line 336
    move-wide/from16 v37, v29

    .line 337
    .line 338
    const-wide/16 v18, 0x0

    .line 339
    .line 340
    const-wide/16 v33, 0x0

    .line 341
    .line 342
    :goto_1
    const-wide/high16 v39, 0x3ff0000000000000L    # 1.0

    .line 343
    .line 344
    rem-double v41, v37, v39

    .line 345
    .line 346
    sub-double v10, v37, v41

    .line 347
    .line 348
    double-to-long v10, v10

    .line 349
    mul-long v37, v10, v8

    .line 350
    .line 351
    move-object/from16 v44, v6

    .line 352
    .line 353
    add-long v5, v37, v18

    .line 354
    .line 355
    mul-long v10, v10, v33

    .line 356
    .line 357
    add-long v10, v10, v35

    .line 358
    .line 359
    div-double v37, v39, v41

    .line 360
    .line 361
    move-wide/from16 v18, v8

    .line 362
    .line 363
    long-to-double v8, v5

    .line 364
    move-wide/from16 v35, v8

    .line 365
    .line 366
    long-to-double v8, v10

    .line 367
    div-double v8, v35, v8

    .line 368
    .line 369
    sub-double v8, v29, v8

    .line 370
    .line 371
    :try_start_1
    invoke-static {v8, v9}, Ljava/lang/Math;->abs(D)D

    .line 372
    .line 373
    .line 374
    move-result-wide v8

    .line 375
    cmpl-double v8, v8, v31

    .line 376
    .line 377
    if-gtz v8, :cond_5

    .line 378
    .line 379
    new-instance v8, LQ/f;

    .line 380
    .line 381
    cmpg-double v9, v23, v25

    .line 382
    .line 383
    if-gez v9, :cond_4

    .line 384
    .line 385
    neg-long v5, v5

    .line 386
    :cond_4
    invoke-direct {v8, v5, v6, v10, v11}, LQ/f;-><init>(JJ)V

    .line 387
    .line 388
    .line 389
    goto :goto_4

    .line 390
    :cond_5
    move-wide v8, v5

    .line 391
    move-wide/from16 v35, v33

    .line 392
    .line 393
    move-object/from16 v6, v44

    .line 394
    .line 395
    move-wide/from16 v33, v10

    .line 396
    .line 397
    goto :goto_1

    .line 398
    :goto_2
    new-instance v5, LQ/f;

    .line 399
    .line 400
    cmpl-double v6, v23, v25

    .line 401
    .line 402
    if-lez v6, :cond_6

    .line 403
    .line 404
    const-wide v10, 0x7fffffffffffffffL

    .line 405
    .line 406
    .line 407
    .line 408
    .line 409
    goto :goto_3

    .line 410
    :cond_6
    const-wide/high16 v10, -0x8000000000000000L

    .line 411
    .line 412
    :goto_3
    invoke-direct {v5, v10, v11, v8, v9}, LQ/f;-><init>(JJ)V

    .line 413
    .line 414
    .line 415
    move-object v8, v5

    .line 416
    :goto_4
    invoke-virtual {v8}, LQ/f;->toString()Ljava/lang/String;

    .line 417
    .line 418
    .line 419
    move-result-object v12
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 420
    goto/16 :goto_6

    .line 421
    .line 422
    :catch_0
    move-object/from16 v44, v6

    .line 423
    .line 424
    :catch_1
    new-instance v5, Ljava/lang/StringBuilder;

    .line 425
    .line 426
    move-object/from16 v6, v44

    .line 427
    .line 428
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 429
    .line 430
    .line 431
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 432
    .line 433
    .line 434
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 435
    .line 436
    .line 437
    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 438
    .line 439
    .line 440
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 441
    .line 442
    .line 443
    move-result-object v3

    .line 444
    invoke-static {v7, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 445
    .line 446
    .line 447
    goto/16 :goto_23

    .line 448
    .line 449
    :cond_7
    move-object/from16 v28, v9

    .line 450
    .line 451
    const-string v5, "GPSTimeStamp"

    .line 452
    .line 453
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 454
    .line 455
    .line 456
    move-result v5

    .line 457
    if-eqz v5, :cond_9

    .line 458
    .line 459
    sget-object v5, LQ/h;->d0:Ljava/util/regex/Pattern;

    .line 460
    .line 461
    invoke-virtual {v5, v12}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 462
    .line 463
    .line 464
    move-result-object v8

    .line 465
    invoke-virtual {v8}, Ljava/util/regex/Matcher;->find()Z

    .line 466
    .line 467
    .line 468
    move-result v5

    .line 469
    if-nez v5, :cond_8

    .line 470
    .line 471
    new-instance v5, Ljava/lang/StringBuilder;

    .line 472
    .line 473
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 474
    .line 475
    .line 476
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 477
    .line 478
    .line 479
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 480
    .line 481
    .line 482
    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 483
    .line 484
    .line 485
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 486
    .line 487
    .line 488
    move-result-object v3

    .line 489
    invoke-static {v7, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 490
    .line 491
    .line 492
    goto/16 :goto_23

    .line 493
    .line 494
    :cond_8
    new-instance v4, Ljava/lang/StringBuilder;

    .line 495
    .line 496
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 497
    .line 498
    .line 499
    const/4 v5, 0x1

    .line 500
    invoke-virtual {v8, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 501
    .line 502
    .line 503
    move-result-object v6

    .line 504
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 505
    .line 506
    .line 507
    move-result v6

    .line 508
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 509
    .line 510
    .line 511
    const-string v6, "/1,"

    .line 512
    .line 513
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 514
    .line 515
    .line 516
    const/4 v9, 0x2

    .line 517
    invoke-virtual {v8, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 518
    .line 519
    .line 520
    move-result-object v10

    .line 521
    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 522
    .line 523
    .line 524
    move-result v9

    .line 525
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 526
    .line 527
    .line 528
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 529
    .line 530
    .line 531
    const/4 v6, 0x3

    .line 532
    invoke-virtual {v8, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 533
    .line 534
    .line 535
    move-result-object v8

    .line 536
    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 537
    .line 538
    .line 539
    move-result v6

    .line 540
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 541
    .line 542
    .line 543
    const-string v6, "/1"

    .line 544
    .line 545
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 546
    .line 547
    .line 548
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 549
    .line 550
    .line 551
    move-result-object v12

    .line 552
    goto :goto_6

    .line 553
    :cond_9
    const-string v8, "DateTime"

    .line 554
    .line 555
    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 556
    .line 557
    .line 558
    move-result v8

    .line 559
    if-nez v8, :cond_a

    .line 560
    .line 561
    const-string v8, "DateTimeOriginal"

    .line 562
    .line 563
    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 564
    .line 565
    .line 566
    move-result v8

    .line 567
    if-nez v8, :cond_a

    .line 568
    .line 569
    const-string v8, "DateTimeDigitized"

    .line 570
    .line 571
    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 572
    .line 573
    .line 574
    move-result v8

    .line 575
    if-eqz v8, :cond_e

    .line 576
    .line 577
    :cond_a
    sget-object v8, LQ/h;->e0:Ljava/util/regex/Pattern;

    .line 578
    .line 579
    invoke-virtual {v8, v12}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 580
    .line 581
    .line 582
    move-result-object v8

    .line 583
    invoke-virtual {v8}, Ljava/util/regex/Matcher;->find()Z

    .line 584
    .line 585
    .line 586
    move-result v8

    .line 587
    sget-object v9, LQ/h;->f0:Ljava/util/regex/Pattern;

    .line 588
    .line 589
    invoke-virtual {v9, v12}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 590
    .line 591
    .line 592
    move-result-object v9

    .line 593
    invoke-virtual {v9}, Ljava/util/regex/Matcher;->find()Z

    .line 594
    .line 595
    .line 596
    move-result v9

    .line 597
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    .line 598
    .line 599
    .line 600
    move-result v10

    .line 601
    const/16 v11, 0x13

    .line 602
    .line 603
    if-ne v10, v11, :cond_c

    .line 604
    .line 605
    if-nez v8, :cond_b

    .line 606
    .line 607
    if-nez v9, :cond_b

    .line 608
    .line 609
    goto :goto_5

    .line 610
    :cond_b
    if-eqz v9, :cond_e

    .line 611
    .line 612
    const-string v4, "-"

    .line 613
    .line 614
    const-string v6, ":"

    .line 615
    .line 616
    invoke-virtual {v12, v4, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 617
    .line 618
    .line 619
    move-result-object v12

    .line 620
    goto :goto_6

    .line 621
    :cond_c
    :goto_5
    new-instance v5, Ljava/lang/StringBuilder;

    .line 622
    .line 623
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 624
    .line 625
    .line 626
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 627
    .line 628
    .line 629
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 630
    .line 631
    .line 632
    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 633
    .line 634
    .line 635
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 636
    .line 637
    .line 638
    move-result-object v3

    .line 639
    invoke-static {v7, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 640
    .line 641
    .line 642
    goto/16 :goto_23

    .line 643
    .line 644
    :cond_d
    move-object/from16 v28, v9

    .line 645
    .line 646
    :cond_e
    :goto_6
    const-string v4, "Xmp"

    .line 647
    .line 648
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 649
    .line 650
    .line 651
    move-result v6

    .line 652
    const/16 v8, 0xc

    .line 653
    .line 654
    const/16 v9, 0x9

    .line 655
    .line 656
    if-eqz v6, :cond_16

    .line 657
    .line 658
    aget-object v6, v15, v16

    .line 659
    .line 660
    invoke-virtual {v6, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 661
    .line 662
    .line 663
    move-result v6

    .line 664
    if-nez v6, :cond_10

    .line 665
    .line 666
    const/4 v6, 0x5

    .line 667
    aget-object v6, v15, v6

    .line 668
    .line 669
    invoke-virtual {v6, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 670
    .line 671
    .line 672
    move-result v4

    .line 673
    if-eqz v4, :cond_f

    .line 674
    .line 675
    goto :goto_7

    .line 676
    :cond_f
    move/from16 v4, v16

    .line 677
    .line 678
    goto :goto_8

    .line 679
    :cond_10
    :goto_7
    const/4 v4, 0x1

    .line 680
    :goto_8
    iget v6, v1, LQ/h;->c:I

    .line 681
    .line 682
    const/4 v10, 0x4

    .line 683
    if-eq v6, v10, :cond_12

    .line 684
    .line 685
    if-eq v6, v9, :cond_11

    .line 686
    .line 687
    const/16 v10, 0xf

    .line 688
    .line 689
    if-eq v6, v10, :cond_11

    .line 690
    .line 691
    if-eq v6, v8, :cond_11

    .line 692
    .line 693
    const/16 v10, 0xd

    .line 694
    .line 695
    if-eq v6, v10, :cond_11

    .line 696
    .line 697
    const/4 v6, 0x1

    .line 698
    :goto_9
    const/4 v10, 0x2

    .line 699
    goto :goto_a

    .line 700
    :cond_11
    const/4 v6, 0x2

    .line 701
    goto :goto_9

    .line 702
    :cond_12
    const/4 v6, 0x3

    .line 703
    goto :goto_9

    .line 704
    :goto_a
    if-ne v6, v10, :cond_13

    .line 705
    .line 706
    iget-object v10, v1, LQ/h;->s:LQ/d;

    .line 707
    .line 708
    if-nez v10, :cond_14

    .line 709
    .line 710
    if-eqz v4, :cond_14

    .line 711
    .line 712
    :cond_13
    const/4 v10, 0x3

    .line 713
    if-ne v6, v10, :cond_16

    .line 714
    .line 715
    if-nez v4, :cond_16

    .line 716
    .line 717
    :cond_14
    if-eqz v12, :cond_15

    .line 718
    .line 719
    invoke-static {v12}, LQ/d;->a(Ljava/lang/String;)LQ/d;

    .line 720
    .line 721
    .line 722
    move-result-object v7

    .line 723
    goto :goto_b

    .line 724
    :cond_15
    const/4 v7, 0x0

    .line 725
    :goto_b
    iput-object v7, v1, LQ/h;->s:LQ/d;

    .line 726
    .line 727
    goto/16 :goto_23

    .line 728
    .line 729
    :cond_16
    move/from16 v4, v16

    .line 730
    .line 731
    :goto_c
    sget-object v6, LQ/h;->U:[[LQ/e;

    .line 732
    .line 733
    array-length v6, v6

    .line 734
    if-ge v4, v6, :cond_2b

    .line 735
    .line 736
    const/4 v10, 0x4

    .line 737
    if-ne v4, v10, :cond_18

    .line 738
    .line 739
    iget-boolean v6, v1, LQ/h;->h:Z

    .line 740
    .line 741
    if-nez v6, :cond_18

    .line 742
    .line 743
    :cond_17
    :goto_d
    move/from16 v23, v4

    .line 744
    .line 745
    move-object v11, v7

    .line 746
    :goto_e
    const/16 v43, 0x2

    .line 747
    .line 748
    :goto_f
    const/16 v45, 0x1

    .line 749
    .line 750
    goto/16 :goto_22

    .line 751
    .line 752
    :cond_18
    sget-object v6, LQ/h;->X:[Ljava/util/HashMap;

    .line 753
    .line 754
    aget-object v6, v6, v4

    .line 755
    .line 756
    invoke-virtual {v6, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 757
    .line 758
    .line 759
    move-result-object v6

    .line 760
    check-cast v6, LQ/e;

    .line 761
    .line 762
    if-eqz v6, :cond_17

    .line 763
    .line 764
    iget v10, v6, LQ/e;->d:I

    .line 765
    .line 766
    iget v6, v6, LQ/e;->c:I

    .line 767
    .line 768
    if-nez v12, :cond_19

    .line 769
    .line 770
    aget-object v6, v15, v4

    .line 771
    .line 772
    invoke-virtual {v6, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 773
    .line 774
    .line 775
    goto :goto_d

    .line 776
    :cond_19
    invoke-static {v12}, LQ/h;->o(Ljava/lang/String;)Landroid/util/Pair;

    .line 777
    .line 778
    .line 779
    move-result-object v11

    .line 780
    iget-object v5, v11, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 781
    .line 782
    check-cast v5, Ljava/lang/Integer;

    .line 783
    .line 784
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 785
    .line 786
    .line 787
    move-result v5

    .line 788
    move/from16 v18, v9

    .line 789
    .line 790
    const/4 v9, -0x1

    .line 791
    if-eq v6, v5, :cond_1d

    .line 792
    .line 793
    iget-object v5, v11, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 794
    .line 795
    check-cast v5, Ljava/lang/Integer;

    .line 796
    .line 797
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 798
    .line 799
    .line 800
    move-result v5

    .line 801
    if-ne v6, v5, :cond_1a

    .line 802
    .line 803
    goto :goto_12

    .line 804
    :cond_1a
    if-eq v10, v9, :cond_1b

    .line 805
    .line 806
    iget-object v5, v11, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 807
    .line 808
    check-cast v5, Ljava/lang/Integer;

    .line 809
    .line 810
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 811
    .line 812
    .line 813
    move-result v5

    .line 814
    if-eq v10, v5, :cond_1c

    .line 815
    .line 816
    iget-object v5, v11, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 817
    .line 818
    check-cast v5, Ljava/lang/Integer;

    .line 819
    .line 820
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 821
    .line 822
    .line 823
    move-result v5

    .line 824
    if-ne v10, v5, :cond_1b

    .line 825
    .line 826
    goto :goto_10

    .line 827
    :cond_1b
    const/4 v5, 0x1

    .line 828
    goto :goto_11

    .line 829
    :cond_1c
    :goto_10
    move/from16 v19, v8

    .line 830
    .line 831
    goto/16 :goto_17

    .line 832
    .line 833
    :goto_11
    if-eq v6, v5, :cond_1d

    .line 834
    .line 835
    const/4 v5, 0x7

    .line 836
    if-eq v6, v5, :cond_1d

    .line 837
    .line 838
    const/4 v5, 0x2

    .line 839
    if-ne v6, v5, :cond_1e

    .line 840
    .line 841
    :cond_1d
    :goto_12
    move/from16 v19, v8

    .line 842
    .line 843
    goto/16 :goto_16

    .line 844
    .line 845
    :cond_1e
    if-eqz v14, :cond_21

    .line 846
    .line 847
    new-instance v5, Ljava/lang/StringBuilder;

    .line 848
    .line 849
    move/from16 v19, v8

    .line 850
    .line 851
    const-string v8, "Given tag ("

    .line 852
    .line 853
    invoke-direct {v5, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 854
    .line 855
    .line 856
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 857
    .line 858
    .line 859
    const-string v8, ") value didn\'t match with one of expected formats: "

    .line 860
    .line 861
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 862
    .line 863
    .line 864
    sget-object v8, LQ/h;->Q:[Ljava/lang/String;

    .line 865
    .line 866
    aget-object v6, v8, v6

    .line 867
    .line 868
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 869
    .line 870
    .line 871
    const-string v6, ", "

    .line 872
    .line 873
    const-string v17, ""

    .line 874
    .line 875
    if-ne v10, v9, :cond_1f

    .line 876
    .line 877
    move-object/from16 v9, v17

    .line 878
    .line 879
    goto :goto_13

    .line 880
    :cond_1f
    new-instance v9, Ljava/lang/StringBuilder;

    .line 881
    .line 882
    invoke-direct {v9, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 883
    .line 884
    .line 885
    aget-object v10, v8, v10

    .line 886
    .line 887
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 888
    .line 889
    .line 890
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 891
    .line 892
    .line 893
    move-result-object v9

    .line 894
    :goto_13
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 895
    .line 896
    .line 897
    const-string v9, " (guess: "

    .line 898
    .line 899
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 900
    .line 901
    .line 902
    iget-object v9, v11, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 903
    .line 904
    check-cast v9, Ljava/lang/Integer;

    .line 905
    .line 906
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    .line 907
    .line 908
    .line 909
    move-result v9

    .line 910
    aget-object v9, v8, v9

    .line 911
    .line 912
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 913
    .line 914
    .line 915
    iget-object v9, v11, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 916
    .line 917
    check-cast v9, Ljava/lang/Integer;

    .line 918
    .line 919
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    .line 920
    .line 921
    .line 922
    move-result v9

    .line 923
    const/4 v10, -0x1

    .line 924
    if-ne v9, v10, :cond_20

    .line 925
    .line 926
    :goto_14
    move-object/from16 v6, v17

    .line 927
    .line 928
    goto :goto_15

    .line 929
    :cond_20
    new-instance v9, Ljava/lang/StringBuilder;

    .line 930
    .line 931
    invoke-direct {v9, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 932
    .line 933
    .line 934
    iget-object v6, v11, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 935
    .line 936
    check-cast v6, Ljava/lang/Integer;

    .line 937
    .line 938
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 939
    .line 940
    .line 941
    move-result v6

    .line 942
    aget-object v6, v8, v6

    .line 943
    .line 944
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 945
    .line 946
    .line 947
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 948
    .line 949
    .line 950
    move-result-object v17

    .line 951
    goto :goto_14

    .line 952
    :goto_15
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 953
    .line 954
    .line 955
    const-string v6, ")"

    .line 956
    .line 957
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 958
    .line 959
    .line 960
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 961
    .line 962
    .line 963
    move-result-object v5

    .line 964
    invoke-static {v7, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 965
    .line 966
    .line 967
    goto/16 :goto_d

    .line 968
    .line 969
    :cond_21
    move/from16 v23, v4

    .line 970
    .line 971
    move/from16 v43, v5

    .line 972
    .line 973
    move-object v11, v7

    .line 974
    goto/16 :goto_f

    .line 975
    .line 976
    :goto_16
    move v10, v6

    .line 977
    :goto_17
    const-string v6, ","

    .line 978
    .line 979
    packed-switch v10, :pswitch_data_0

    .line 980
    .line 981
    .line 982
    :pswitch_0
    if-eqz v14, :cond_17

    .line 983
    .line 984
    new-instance v5, Ljava/lang/StringBuilder;

    .line 985
    .line 986
    const-string v6, "Data format isn\'t one of expected formats: "

    .line 987
    .line 988
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 989
    .line 990
    .line 991
    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 992
    .line 993
    .line 994
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 995
    .line 996
    .line 997
    move-result-object v5

    .line 998
    invoke-static {v7, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 999
    .line 1000
    .line 1001
    goto/16 :goto_d

    .line 1002
    .line 1003
    :pswitch_1
    const/4 v10, -0x1

    .line 1004
    invoke-virtual {v12, v6, v10}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 1005
    .line 1006
    .line 1007
    move-result-object v5

    .line 1008
    array-length v6, v5

    .line 1009
    new-array v8, v6, [D

    .line 1010
    .line 1011
    move/from16 v9, v16

    .line 1012
    .line 1013
    :goto_18
    array-length v10, v5

    .line 1014
    if-ge v9, v10, :cond_22

    .line 1015
    .line 1016
    aget-object v10, v5, v9

    .line 1017
    .line 1018
    invoke-static {v10}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 1019
    .line 1020
    .line 1021
    move-result-wide v10

    .line 1022
    aput-wide v10, v8, v9

    .line 1023
    .line 1024
    add-int/lit8 v9, v9, 0x1

    .line 1025
    .line 1026
    goto :goto_18

    .line 1027
    :cond_22
    aget-object v5, v15, v4

    .line 1028
    .line 1029
    iget-object v9, v1, LQ/h;->g:Ljava/nio/ByteOrder;

    .line 1030
    .line 1031
    aget v10, v13, v19

    .line 1032
    .line 1033
    mul-int/2addr v10, v6

    .line 1034
    new-array v10, v10, [B

    .line 1035
    .line 1036
    invoke-static {v10}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 1037
    .line 1038
    .line 1039
    move-result-object v10

    .line 1040
    invoke-virtual {v10, v9}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 1041
    .line 1042
    .line 1043
    move/from16 v9, v16

    .line 1044
    .line 1045
    :goto_19
    if-ge v9, v6, :cond_23

    .line 1046
    .line 1047
    move-object v11, v7

    .line 1048
    move-object/from16 v17, v8

    .line 1049
    .line 1050
    aget-wide v7, v17, v9

    .line 1051
    .line 1052
    invoke-virtual {v10, v7, v8}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 1053
    .line 1054
    .line 1055
    add-int/lit8 v9, v9, 0x1

    .line 1056
    .line 1057
    move-object v7, v11

    .line 1058
    move-object/from16 v8, v17

    .line 1059
    .line 1060
    goto :goto_19

    .line 1061
    :cond_23
    move-object v11, v7

    .line 1062
    new-instance v7, LQ/d;

    .line 1063
    .line 1064
    invoke-virtual {v10}, Ljava/nio/ByteBuffer;->array()[B

    .line 1065
    .line 1066
    .line 1067
    move-result-object v8

    .line 1068
    move/from16 v9, v19

    .line 1069
    .line 1070
    invoke-direct {v7, v8, v9, v6}, LQ/d;-><init>([BII)V

    .line 1071
    .line 1072
    .line 1073
    invoke-virtual {v5, v3, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1074
    .line 1075
    .line 1076
    move/from16 v23, v4

    .line 1077
    .line 1078
    goto/16 :goto_e

    .line 1079
    .line 1080
    :pswitch_2
    move-object v11, v7

    .line 1081
    move/from16 v9, v19

    .line 1082
    .line 1083
    const/4 v10, -0x1

    .line 1084
    invoke-virtual {v12, v6, v10}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 1085
    .line 1086
    .line 1087
    move-result-object v6

    .line 1088
    array-length v7, v6

    .line 1089
    new-array v8, v7, [LQ/f;

    .line 1090
    .line 1091
    move/from16 v5, v16

    .line 1092
    .line 1093
    :goto_1a
    array-length v9, v6

    .line 1094
    if-ge v5, v9, :cond_24

    .line 1095
    .line 1096
    aget-object v9, v6, v5

    .line 1097
    .line 1098
    move-object/from16 v0, v28

    .line 1099
    .line 1100
    invoke-virtual {v9, v0, v10}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 1101
    .line 1102
    .line 1103
    move-result-object v9

    .line 1104
    new-instance v10, LQ/f;

    .line 1105
    .line 1106
    aget-object v17, v9, v16

    .line 1107
    .line 1108
    move/from16 v23, v4

    .line 1109
    .line 1110
    move/from16 v24, v5

    .line 1111
    .line 1112
    invoke-static/range {v17 .. v17}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 1113
    .line 1114
    .line 1115
    move-result-wide v4

    .line 1116
    double-to-long v4, v4

    .line 1117
    const/16 v45, 0x1

    .line 1118
    .line 1119
    aget-object v9, v9, v45

    .line 1120
    .line 1121
    move-wide/from16 v107, v4

    .line 1122
    .line 1123
    move-object v4, v6

    .line 1124
    move-wide/from16 v5, v107

    .line 1125
    .line 1126
    move-object/from16 v17, v8

    .line 1127
    .line 1128
    const/16 v43, 0x2

    .line 1129
    .line 1130
    invoke-static {v9}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 1131
    .line 1132
    .line 1133
    move-result-wide v8

    .line 1134
    double-to-long v8, v8

    .line 1135
    invoke-direct {v10, v5, v6, v8, v9}, LQ/f;-><init>(JJ)V

    .line 1136
    .line 1137
    .line 1138
    aput-object v10, v17, v24

    .line 1139
    .line 1140
    add-int/lit8 v5, v24, 0x1

    .line 1141
    .line 1142
    move-object v6, v4

    .line 1143
    move-object/from16 v8, v17

    .line 1144
    .line 1145
    move/from16 v4, v23

    .line 1146
    .line 1147
    const/4 v10, -0x1

    .line 1148
    move-object/from16 v0, p0

    .line 1149
    .line 1150
    goto :goto_1a

    .line 1151
    :cond_24
    move/from16 v23, v4

    .line 1152
    .line 1153
    move-object/from16 v17, v8

    .line 1154
    .line 1155
    move-object/from16 v0, v28

    .line 1156
    .line 1157
    const/16 v43, 0x2

    .line 1158
    .line 1159
    aget-object v4, v15, v23

    .line 1160
    .line 1161
    iget-object v5, v1, LQ/h;->g:Ljava/nio/ByteOrder;

    .line 1162
    .line 1163
    const/16 v6, 0xa

    .line 1164
    .line 1165
    aget v8, v13, v6

    .line 1166
    .line 1167
    mul-int/2addr v8, v7

    .line 1168
    new-array v8, v8, [B

    .line 1169
    .line 1170
    invoke-static {v8}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 1171
    .line 1172
    .line 1173
    move-result-object v8

    .line 1174
    invoke-virtual {v8, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 1175
    .line 1176
    .line 1177
    move/from16 v5, v16

    .line 1178
    .line 1179
    :goto_1b
    if-ge v5, v7, :cond_25

    .line 1180
    .line 1181
    aget-object v9, v17, v5

    .line 1182
    .line 1183
    move v10, v7

    .line 1184
    iget-wide v6, v9, LQ/f;->a:J

    .line 1185
    .line 1186
    long-to-int v6, v6

    .line 1187
    invoke-virtual {v8, v6}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 1188
    .line 1189
    .line 1190
    iget-wide v6, v9, LQ/f;->b:J

    .line 1191
    .line 1192
    long-to-int v6, v6

    .line 1193
    invoke-virtual {v8, v6}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 1194
    .line 1195
    .line 1196
    add-int/lit8 v5, v5, 0x1

    .line 1197
    .line 1198
    move v7, v10

    .line 1199
    const/16 v6, 0xa

    .line 1200
    .line 1201
    goto :goto_1b

    .line 1202
    :cond_25
    move v10, v7

    .line 1203
    new-instance v5, LQ/d;

    .line 1204
    .line 1205
    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->array()[B

    .line 1206
    .line 1207
    .line 1208
    move-result-object v6

    .line 1209
    const/16 v7, 0xa

    .line 1210
    .line 1211
    invoke-direct {v5, v6, v7, v10}, LQ/d;-><init>([BII)V

    .line 1212
    .line 1213
    .line 1214
    invoke-virtual {v4, v3, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1215
    .line 1216
    .line 1217
    :goto_1c
    move-object/from16 v28, v0

    .line 1218
    .line 1219
    goto/16 :goto_f

    .line 1220
    .line 1221
    :pswitch_3
    move/from16 v23, v4

    .line 1222
    .line 1223
    move-object v11, v7

    .line 1224
    move-object/from16 v0, v28

    .line 1225
    .line 1226
    const/4 v10, -0x1

    .line 1227
    const/16 v43, 0x2

    .line 1228
    .line 1229
    invoke-virtual {v12, v6, v10}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 1230
    .line 1231
    .line 1232
    move-result-object v4

    .line 1233
    array-length v5, v4

    .line 1234
    new-array v6, v5, [I

    .line 1235
    .line 1236
    move/from16 v7, v16

    .line 1237
    .line 1238
    :goto_1d
    array-length v8, v4

    .line 1239
    if-ge v7, v8, :cond_26

    .line 1240
    .line 1241
    aget-object v8, v4, v7

    .line 1242
    .line 1243
    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 1244
    .line 1245
    .line 1246
    move-result v8

    .line 1247
    aput v8, v6, v7

    .line 1248
    .line 1249
    add-int/lit8 v7, v7, 0x1

    .line 1250
    .line 1251
    goto :goto_1d

    .line 1252
    :cond_26
    aget-object v4, v15, v23

    .line 1253
    .line 1254
    iget-object v7, v1, LQ/h;->g:Ljava/nio/ByteOrder;

    .line 1255
    .line 1256
    aget v8, v13, v18

    .line 1257
    .line 1258
    mul-int/2addr v8, v5

    .line 1259
    new-array v8, v8, [B

    .line 1260
    .line 1261
    invoke-static {v8}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 1262
    .line 1263
    .line 1264
    move-result-object v8

    .line 1265
    invoke-virtual {v8, v7}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 1266
    .line 1267
    .line 1268
    move/from16 v7, v16

    .line 1269
    .line 1270
    :goto_1e
    if-ge v7, v5, :cond_27

    .line 1271
    .line 1272
    aget v9, v6, v7

    .line 1273
    .line 1274
    invoke-virtual {v8, v9}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 1275
    .line 1276
    .line 1277
    add-int/lit8 v7, v7, 0x1

    .line 1278
    .line 1279
    goto :goto_1e

    .line 1280
    :cond_27
    new-instance v6, LQ/d;

    .line 1281
    .line 1282
    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->array()[B

    .line 1283
    .line 1284
    .line 1285
    move-result-object v7

    .line 1286
    move/from16 v8, v18

    .line 1287
    .line 1288
    invoke-direct {v6, v7, v8, v5}, LQ/d;-><init>([BII)V

    .line 1289
    .line 1290
    .line 1291
    invoke-virtual {v4, v3, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1292
    .line 1293
    .line 1294
    goto :goto_1c

    .line 1295
    :pswitch_4
    move/from16 v23, v4

    .line 1296
    .line 1297
    move-object v11, v7

    .line 1298
    move/from16 v8, v18

    .line 1299
    .line 1300
    move-object/from16 v0, v28

    .line 1301
    .line 1302
    const/4 v10, -0x1

    .line 1303
    const/16 v43, 0x2

    .line 1304
    .line 1305
    invoke-virtual {v12, v6, v10}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 1306
    .line 1307
    .line 1308
    move-result-object v4

    .line 1309
    array-length v5, v4

    .line 1310
    new-array v5, v5, [LQ/f;

    .line 1311
    .line 1312
    move/from16 v6, v16

    .line 1313
    .line 1314
    :goto_1f
    array-length v7, v4

    .line 1315
    if-ge v6, v7, :cond_28

    .line 1316
    .line 1317
    aget-object v7, v4, v6

    .line 1318
    .line 1319
    invoke-virtual {v7, v0, v10}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 1320
    .line 1321
    .line 1322
    move-result-object v7

    .line 1323
    new-instance v9, LQ/f;

    .line 1324
    .line 1325
    aget-object v10, v7, v16

    .line 1326
    .line 1327
    move-object/from16 v17, v9

    .line 1328
    .line 1329
    invoke-static {v10}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 1330
    .line 1331
    .line 1332
    move-result-wide v8

    .line 1333
    double-to-long v8, v8

    .line 1334
    const/16 v45, 0x1

    .line 1335
    .line 1336
    aget-object v7, v7, v45

    .line 1337
    .line 1338
    move v10, v6

    .line 1339
    invoke-static {v7}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 1340
    .line 1341
    .line 1342
    move-result-wide v6

    .line 1343
    double-to-long v6, v6

    .line 1344
    move-object/from16 v28, v0

    .line 1345
    .line 1346
    move-object/from16 v0, v17

    .line 1347
    .line 1348
    invoke-direct {v0, v8, v9, v6, v7}, LQ/f;-><init>(JJ)V

    .line 1349
    .line 1350
    .line 1351
    aput-object v0, v5, v10

    .line 1352
    .line 1353
    add-int/lit8 v6, v10, 0x1

    .line 1354
    .line 1355
    move-object/from16 v0, v28

    .line 1356
    .line 1357
    const/16 v8, 0x9

    .line 1358
    .line 1359
    const/4 v10, -0x1

    .line 1360
    goto :goto_1f

    .line 1361
    :cond_28
    move-object/from16 v28, v0

    .line 1362
    .line 1363
    const/16 v45, 0x1

    .line 1364
    .line 1365
    aget-object v0, v15, v23

    .line 1366
    .line 1367
    iget-object v4, v1, LQ/h;->g:Ljava/nio/ByteOrder;

    .line 1368
    .line 1369
    invoke-static {v5, v4}, LQ/d;->e([LQ/f;Ljava/nio/ByteOrder;)LQ/d;

    .line 1370
    .line 1371
    .line 1372
    move-result-object v4

    .line 1373
    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1374
    .line 1375
    .line 1376
    goto/16 :goto_22

    .line 1377
    .line 1378
    :pswitch_5
    move/from16 v23, v4

    .line 1379
    .line 1380
    move-object v11, v7

    .line 1381
    const/4 v10, -0x1

    .line 1382
    const/16 v43, 0x2

    .line 1383
    .line 1384
    const/16 v45, 0x1

    .line 1385
    .line 1386
    invoke-virtual {v12, v6, v10}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 1387
    .line 1388
    .line 1389
    move-result-object v0

    .line 1390
    array-length v4, v0

    .line 1391
    new-array v4, v4, [J

    .line 1392
    .line 1393
    move/from16 v5, v16

    .line 1394
    .line 1395
    :goto_20
    array-length v6, v0

    .line 1396
    if-ge v5, v6, :cond_29

    .line 1397
    .line 1398
    aget-object v6, v0, v5

    .line 1399
    .line 1400
    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 1401
    .line 1402
    .line 1403
    move-result-wide v6

    .line 1404
    aput-wide v6, v4, v5

    .line 1405
    .line 1406
    add-int/lit8 v5, v5, 0x1

    .line 1407
    .line 1408
    goto :goto_20

    .line 1409
    :cond_29
    aget-object v0, v15, v23

    .line 1410
    .line 1411
    iget-object v5, v1, LQ/h;->g:Ljava/nio/ByteOrder;

    .line 1412
    .line 1413
    invoke-static {v4, v5}, LQ/d;->d([JLjava/nio/ByteOrder;)LQ/d;

    .line 1414
    .line 1415
    .line 1416
    move-result-object v4

    .line 1417
    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1418
    .line 1419
    .line 1420
    goto :goto_22

    .line 1421
    :pswitch_6
    move/from16 v23, v4

    .line 1422
    .line 1423
    move-object v11, v7

    .line 1424
    const/4 v10, -0x1

    .line 1425
    const/16 v43, 0x2

    .line 1426
    .line 1427
    const/16 v45, 0x1

    .line 1428
    .line 1429
    invoke-virtual {v12, v6, v10}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 1430
    .line 1431
    .line 1432
    move-result-object v0

    .line 1433
    array-length v4, v0

    .line 1434
    new-array v4, v4, [I

    .line 1435
    .line 1436
    move/from16 v5, v16

    .line 1437
    .line 1438
    :goto_21
    array-length v6, v0

    .line 1439
    if-ge v5, v6, :cond_2a

    .line 1440
    .line 1441
    aget-object v6, v0, v5

    .line 1442
    .line 1443
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 1444
    .line 1445
    .line 1446
    move-result v6

    .line 1447
    aput v6, v4, v5

    .line 1448
    .line 1449
    add-int/lit8 v5, v5, 0x1

    .line 1450
    .line 1451
    goto :goto_21

    .line 1452
    :cond_2a
    aget-object v0, v15, v23

    .line 1453
    .line 1454
    iget-object v5, v1, LQ/h;->g:Ljava/nio/ByteOrder;

    .line 1455
    .line 1456
    invoke-static {v4, v5}, LQ/d;->g([ILjava/nio/ByteOrder;)LQ/d;

    .line 1457
    .line 1458
    .line 1459
    move-result-object v4

    .line 1460
    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1461
    .line 1462
    .line 1463
    goto :goto_22

    .line 1464
    :pswitch_7
    move/from16 v23, v4

    .line 1465
    .line 1466
    move-object v11, v7

    .line 1467
    const/16 v43, 0x2

    .line 1468
    .line 1469
    const/16 v45, 0x1

    .line 1470
    .line 1471
    aget-object v0, v15, v23

    .line 1472
    .line 1473
    invoke-static {v12}, LQ/d;->b(Ljava/lang/String;)LQ/d;

    .line 1474
    .line 1475
    .line 1476
    move-result-object v4

    .line 1477
    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1478
    .line 1479
    .line 1480
    goto :goto_22

    .line 1481
    :pswitch_8
    move/from16 v23, v4

    .line 1482
    .line 1483
    move-object v11, v7

    .line 1484
    const/16 v43, 0x2

    .line 1485
    .line 1486
    const/16 v45, 0x1

    .line 1487
    .line 1488
    aget-object v0, v15, v23

    .line 1489
    .line 1490
    invoke-static {v12}, LQ/d;->a(Ljava/lang/String;)LQ/d;

    .line 1491
    .line 1492
    .line 1493
    move-result-object v4

    .line 1494
    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1495
    .line 1496
    .line 1497
    :goto_22
    add-int/lit8 v4, v23, 0x1

    .line 1498
    .line 1499
    move-object v7, v11

    .line 1500
    const/16 v8, 0xc

    .line 1501
    .line 1502
    const/16 v9, 0x9

    .line 1503
    .line 1504
    move-object/from16 v0, p0

    .line 1505
    .line 1506
    goto/16 :goto_c

    .line 1507
    .line 1508
    :cond_2b
    :goto_23
    move-object/from16 v0, p0

    .line 1509
    .line 1510
    goto/16 :goto_0

    .line 1511
    .line 1512
    :cond_2c
    const/16 v16, 0x0

    .line 1513
    .line 1514
    const/16 v45, 0x1

    .line 1515
    .line 1516
    const-string v2, "Failed to save new file. Original file is stored in "

    .line 1517
    .line 1518
    iget v0, v1, LQ/h;->c:I

    .line 1519
    .line 1520
    const/16 v3, 0xe

    .line 1521
    .line 1522
    const/4 v10, 0x4

    .line 1523
    if-eq v0, v10, :cond_2e

    .line 1524
    .line 1525
    const/16 v10, 0xd

    .line 1526
    .line 1527
    if-eq v0, v10, :cond_2e

    .line 1528
    .line 1529
    if-ne v0, v3, :cond_2d

    .line 1530
    .line 1531
    goto :goto_24

    .line 1532
    :cond_2d
    new-instance v0, Ljava/io/IOException;

    .line 1533
    .line 1534
    const-string v1, "ExifInterface only supports saving attributes for JPEG, PNG, and WebP formats."

    .line 1535
    .line 1536
    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 1537
    .line 1538
    .line 1539
    throw v0

    .line 1540
    :cond_2e
    :goto_24
    iget-object v0, v1, LQ/h;->b:Ljava/io/FileDescriptor;

    .line 1541
    .line 1542
    if-nez v0, :cond_30

    .line 1543
    .line 1544
    iget-object v0, v1, LQ/h;->a:Ljava/lang/String;

    .line 1545
    .line 1546
    if-eqz v0, :cond_2f

    .line 1547
    .line 1548
    goto :goto_25

    .line 1549
    :cond_2f
    new-instance v0, Ljava/io/IOException;

    .line 1550
    .line 1551
    const-string v1, "ExifInterface does not support saving attributes for the current input."

    .line 1552
    .line 1553
    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 1554
    .line 1555
    .line 1556
    throw v0

    .line 1557
    :cond_30
    :goto_25
    iget-boolean v0, v1, LQ/h;->h:Z

    .line 1558
    .line 1559
    if-eqz v0, :cond_32

    .line 1560
    .line 1561
    iget-boolean v0, v1, LQ/h;->i:Z

    .line 1562
    .line 1563
    if-eqz v0, :cond_32

    .line 1564
    .line 1565
    iget-boolean v0, v1, LQ/h;->j:Z

    .line 1566
    .line 1567
    if-eqz v0, :cond_31

    .line 1568
    .line 1569
    goto :goto_26

    .line 1570
    :cond_31
    new-instance v0, Ljava/io/IOException;

    .line 1571
    .line 1572
    const-string v1, "ExifInterface does not support saving attributes when the image file has non-consecutive thumbnail strips"

    .line 1573
    .line 1574
    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 1575
    .line 1576
    .line 1577
    throw v0

    .line 1578
    :cond_32
    :goto_26
    iget v0, v1, LQ/h;->n:I

    .line 1579
    .line 1580
    const/4 v4, 0x6

    .line 1581
    if-eq v0, v4, :cond_34

    .line 1582
    .line 1583
    const/4 v5, 0x7

    .line 1584
    if-ne v0, v5, :cond_33

    .line 1585
    .line 1586
    goto :goto_27

    .line 1587
    :cond_33
    const/4 v0, 0x0

    .line 1588
    goto :goto_28

    .line 1589
    :cond_34
    :goto_27
    invoke-virtual {v1}, LQ/h;->m()[B

    .line 1590
    .line 1591
    .line 1592
    move-result-object v0

    .line 1593
    :goto_28
    iput-object v0, v1, LQ/h;->m:[B

    .line 1594
    .line 1595
    :try_start_2
    const-string v0, "temp"

    .line 1596
    .line 1597
    const-string v4, "tmp"

    .line 1598
    .line 1599
    invoke-static {v0, v4}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 1600
    .line 1601
    .line 1602
    move-result-object v4

    .line 1603
    iget-object v0, v1, LQ/h;->a:Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_d
    .catchall {:try_start_2 .. :try_end_2} :catchall_c

    .line 1604
    .line 1605
    if-eqz v0, :cond_35

    .line 1606
    .line 1607
    :try_start_3
    new-instance v0, Ljava/io/FileInputStream;

    .line 1608
    .line 1609
    iget-object v5, v1, LQ/h;->a:Ljava/lang/String;

    .line 1610
    .line 1611
    invoke-direct {v0, v5}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1612
    .line 1613
    .line 1614
    :goto_29
    move-object v5, v0

    .line 1615
    goto :goto_2a

    .line 1616
    :catchall_0
    move-exception v0

    .line 1617
    const/4 v3, 0x0

    .line 1618
    const/4 v7, 0x0

    .line 1619
    goto/16 :goto_3a

    .line 1620
    .line 1621
    :catch_2
    move-exception v0

    .line 1622
    const/4 v3, 0x0

    .line 1623
    const/4 v7, 0x0

    .line 1624
    goto/16 :goto_39

    .line 1625
    .line 1626
    :cond_35
    :try_start_4
    iget-object v0, v1, LQ/h;->b:Ljava/io/FileDescriptor;

    .line 1627
    .line 1628
    sget v5, Landroid/system/OsConstants;->SEEK_SET:I

    .line 1629
    .line 1630
    const-wide/16 v6, 0x0

    .line 1631
    .line 1632
    invoke-static {v0, v6, v7, v5}, Landroid/system/Os;->lseek(Ljava/io/FileDescriptor;JI)J

    .line 1633
    .line 1634
    .line 1635
    new-instance v0, Ljava/io/FileInputStream;

    .line 1636
    .line 1637
    iget-object v5, v1, LQ/h;->b:Ljava/io/FileDescriptor;

    .line 1638
    .line 1639
    invoke-direct {v0, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_d
    .catchall {:try_start_4 .. :try_end_4} :catchall_c

    .line 1640
    .line 1641
    .line 1642
    goto :goto_29

    .line 1643
    :goto_2a
    :try_start_5
    new-instance v6, Ljava/io/FileOutputStream;

    .line 1644
    .line 1645
    invoke-direct {v6, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_c
    .catchall {:try_start_5 .. :try_end_5} :catchall_b

    .line 1646
    .line 1647
    .line 1648
    :try_start_6
    invoke-static {v5, v6}, Ld1/d;->d(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_b
    .catchall {:try_start_6 .. :try_end_6} :catchall_a

    .line 1649
    .line 1650
    .line 1651
    invoke-static {v5}, Ld1/d;->a(Ljava/io/Closeable;)V

    .line 1652
    .line 1653
    .line 1654
    invoke-static {v6}, Ld1/d;->a(Ljava/io/Closeable;)V

    .line 1655
    .line 1656
    .line 1657
    :try_start_7
    new-instance v5, Ljava/io/FileInputStream;

    .line 1658
    .line 1659
    invoke-direct {v5, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_8
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 1660
    .line 1661
    .line 1662
    :try_start_8
    iget-object v0, v1, LQ/h;->a:Ljava/lang/String;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_7
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 1663
    .line 1664
    if-eqz v0, :cond_36

    .line 1665
    .line 1666
    :try_start_9
    new-instance v0, Ljava/io/FileOutputStream;

    .line 1667
    .line 1668
    iget-object v6, v1, LQ/h;->a:Ljava/lang/String;

    .line 1669
    .line 1670
    invoke-direct {v0, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_3
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 1671
    .line 1672
    .line 1673
    :goto_2b
    move-object v6, v0

    .line 1674
    goto :goto_2c

    .line 1675
    :catchall_1
    move-exception v0

    .line 1676
    move/from16 v11, v16

    .line 1677
    .line 1678
    const/4 v3, 0x0

    .line 1679
    const/4 v7, 0x0

    .line 1680
    goto/16 :goto_38

    .line 1681
    .line 1682
    :catch_3
    move-exception v0

    .line 1683
    move-object v7, v5

    .line 1684
    const/4 v3, 0x0

    .line 1685
    const/4 v8, 0x0

    .line 1686
    const/16 v17, 0x0

    .line 1687
    .line 1688
    goto/16 :goto_31

    .line 1689
    .line 1690
    :cond_36
    :try_start_a
    iget-object v0, v1, LQ/h;->b:Ljava/io/FileDescriptor;

    .line 1691
    .line 1692
    sget v6, Landroid/system/OsConstants;->SEEK_SET:I

    .line 1693
    .line 1694
    const-wide/16 v7, 0x0

    .line 1695
    .line 1696
    invoke-static {v0, v7, v8, v6}, Landroid/system/Os;->lseek(Ljava/io/FileDescriptor;JI)J

    .line 1697
    .line 1698
    .line 1699
    new-instance v0, Ljava/io/FileOutputStream;

    .line 1700
    .line 1701
    iget-object v6, v1, LQ/h;->b:Ljava/io/FileDescriptor;

    .line 1702
    .line 1703
    invoke-direct {v0, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/FileDescriptor;)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_7
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    .line 1704
    .line 1705
    .line 1706
    goto :goto_2b

    .line 1707
    :goto_2c
    :try_start_b
    new-instance v7, Ljava/io/BufferedInputStream;

    .line 1708
    .line 1709
    invoke-direct {v7, v5}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_6
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    .line 1710
    .line 1711
    .line 1712
    :try_start_c
    new-instance v8, Ljava/io/BufferedOutputStream;

    .line 1713
    .line 1714
    invoke-direct {v8, v6}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_5
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    .line 1715
    .line 1716
    .line 1717
    :try_start_d
    iget v0, v1, LQ/h;->c:I

    .line 1718
    .line 1719
    const/4 v10, 0x4

    .line 1720
    if-ne v0, v10, :cond_37

    .line 1721
    .line 1722
    invoke-virtual {v1, v7, v8}, LQ/h;->z(Ljava/io/BufferedInputStream;Ljava/io/BufferedOutputStream;)V

    .line 1723
    .line 1724
    .line 1725
    goto :goto_30

    .line 1726
    :catchall_2
    move-exception v0

    .line 1727
    move-object v3, v8

    .line 1728
    :goto_2d
    move/from16 v11, v16

    .line 1729
    .line 1730
    goto/16 :goto_38

    .line 1731
    .line 1732
    :catch_4
    move-exception v0

    .line 1733
    :goto_2e
    move-object v3, v6

    .line 1734
    move-object/from16 v17, v7

    .line 1735
    .line 1736
    :goto_2f
    move-object v7, v5

    .line 1737
    goto :goto_31

    .line 1738
    :cond_37
    const/16 v10, 0xd

    .line 1739
    .line 1740
    if-ne v0, v10, :cond_38

    .line 1741
    .line 1742
    invoke-virtual {v1, v7, v8}, LQ/h;->A(Ljava/io/BufferedInputStream;Ljava/io/BufferedOutputStream;)V

    .line 1743
    .line 1744
    .line 1745
    goto :goto_30

    .line 1746
    :cond_38
    if-ne v0, v3, :cond_39

    .line 1747
    .line 1748
    invoke-virtual {v1, v7, v8}, LQ/h;->B(Ljava/io/BufferedInputStream;Ljava/io/BufferedOutputStream;)V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_4
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    .line 1749
    .line 1750
    .line 1751
    :cond_39
    :goto_30
    invoke-static {v7}, Ld1/d;->a(Ljava/io/Closeable;)V

    .line 1752
    .line 1753
    .line 1754
    invoke-static {v8}, Ld1/d;->a(Ljava/io/Closeable;)V

    .line 1755
    .line 1756
    .line 1757
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    .line 1758
    .line 1759
    .line 1760
    const/4 v3, 0x0

    .line 1761
    iput-object v3, v1, LQ/h;->m:[B

    .line 1762
    .line 1763
    return-void

    .line 1764
    :catchall_3
    move-exception v0

    .line 1765
    const/4 v3, 0x0

    .line 1766
    goto :goto_2d

    .line 1767
    :catch_5
    move-exception v0

    .line 1768
    const/4 v3, 0x0

    .line 1769
    move-object v8, v3

    .line 1770
    goto :goto_2e

    .line 1771
    :catchall_4
    move-exception v0

    .line 1772
    const/4 v3, 0x0

    .line 1773
    move-object v7, v3

    .line 1774
    goto :goto_2d

    .line 1775
    :catch_6
    move-exception v0

    .line 1776
    const/4 v3, 0x0

    .line 1777
    move-object v8, v3

    .line 1778
    move-object/from16 v17, v8

    .line 1779
    .line 1780
    move-object v7, v5

    .line 1781
    move-object v3, v6

    .line 1782
    goto :goto_31

    .line 1783
    :catch_7
    move-exception v0

    .line 1784
    const/4 v3, 0x0

    .line 1785
    move-object v8, v3

    .line 1786
    move-object/from16 v17, v8

    .line 1787
    .line 1788
    goto :goto_2f

    .line 1789
    :catch_8
    move-exception v0

    .line 1790
    const/4 v3, 0x0

    .line 1791
    move-object v7, v3

    .line 1792
    move-object v8, v7

    .line 1793
    move-object/from16 v17, v8

    .line 1794
    .line 1795
    :goto_31
    :try_start_e
    new-instance v5, Ljava/io/FileInputStream;

    .line 1796
    .line 1797
    invoke-direct {v5, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_a
    .catchall {:try_start_e .. :try_end_e} :catchall_7

    .line 1798
    .line 1799
    .line 1800
    :try_start_f
    iget-object v6, v1, LQ/h;->a:Ljava/lang/String;

    .line 1801
    .line 1802
    if-eqz v6, :cond_3a

    .line 1803
    .line 1804
    new-instance v6, Ljava/io/FileOutputStream;

    .line 1805
    .line 1806
    iget-object v1, v1, LQ/h;->a:Ljava/lang/String;

    .line 1807
    .line 1808
    invoke-direct {v6, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 1809
    .line 1810
    .line 1811
    :goto_32
    move-object v3, v6

    .line 1812
    goto :goto_34

    .line 1813
    :catchall_5
    move-exception v0

    .line 1814
    move-object v7, v5

    .line 1815
    :goto_33
    move/from16 v10, v16

    .line 1816
    .line 1817
    goto :goto_37

    .line 1818
    :catch_9
    move-exception v0

    .line 1819
    move-object v7, v5

    .line 1820
    goto :goto_36

    .line 1821
    :cond_3a
    iget-object v6, v1, LQ/h;->b:Ljava/io/FileDescriptor;

    .line 1822
    .line 1823
    sget v7, Landroid/system/OsConstants;->SEEK_SET:I

    .line 1824
    .line 1825
    const-wide/16 v9, 0x0

    .line 1826
    .line 1827
    invoke-static {v6, v9, v10, v7}, Landroid/system/Os;->lseek(Ljava/io/FileDescriptor;JI)J

    .line 1828
    .line 1829
    .line 1830
    new-instance v6, Ljava/io/FileOutputStream;

    .line 1831
    .line 1832
    iget-object v1, v1, LQ/h;->b:Ljava/io/FileDescriptor;

    .line 1833
    .line 1834
    invoke-direct {v6, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/FileDescriptor;)V

    .line 1835
    .line 1836
    .line 1837
    goto :goto_32

    .line 1838
    :goto_34
    invoke-static {v5, v3}, Ld1/d;->d(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_9
    .catchall {:try_start_f .. :try_end_f} :catchall_5

    .line 1839
    .line 1840
    .line 1841
    :try_start_10
    invoke-static {v5}, Ld1/d;->a(Ljava/io/Closeable;)V

    .line 1842
    .line 1843
    .line 1844
    invoke-static {v3}, Ld1/d;->a(Ljava/io/Closeable;)V

    .line 1845
    .line 1846
    .line 1847
    new-instance v1, Ljava/io/IOException;

    .line 1848
    .line 1849
    const-string v2, "Failed to save new file"

    .line 1850
    .line 1851
    invoke-direct {v1, v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1852
    .line 1853
    .line 1854
    throw v1
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_6

    .line 1855
    :catchall_6
    move-exception v0

    .line 1856
    move-object v3, v8

    .line 1857
    move/from16 v11, v16

    .line 1858
    .line 1859
    :goto_35
    move-object/from16 v7, v17

    .line 1860
    .line 1861
    goto :goto_38

    .line 1862
    :catchall_7
    move-exception v0

    .line 1863
    goto :goto_33

    .line 1864
    :catch_a
    move-exception v0

    .line 1865
    :goto_36
    :try_start_11
    new-instance v1, Ljava/io/IOException;

    .line 1866
    .line 1867
    new-instance v5, Ljava/lang/StringBuilder;

    .line 1868
    .line 1869
    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1870
    .line 1871
    .line 1872
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 1873
    .line 1874
    .line 1875
    move-result-object v2

    .line 1876
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1877
    .line 1878
    .line 1879
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1880
    .line 1881
    .line 1882
    move-result-object v2

    .line 1883
    invoke-direct {v1, v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1884
    .line 1885
    .line 1886
    throw v1
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_8

    .line 1887
    :catchall_8
    move-exception v0

    .line 1888
    move/from16 v10, v45

    .line 1889
    .line 1890
    :goto_37
    :try_start_12
    invoke-static {v7}, Ld1/d;->a(Ljava/io/Closeable;)V

    .line 1891
    .line 1892
    .line 1893
    invoke-static {v3}, Ld1/d;->a(Ljava/io/Closeable;)V

    .line 1894
    .line 1895
    .line 1896
    throw v0
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_9

    .line 1897
    :catchall_9
    move-exception v0

    .line 1898
    move-object v3, v8

    .line 1899
    move v11, v10

    .line 1900
    goto :goto_35

    .line 1901
    :goto_38
    invoke-static {v7}, Ld1/d;->a(Ljava/io/Closeable;)V

    .line 1902
    .line 1903
    .line 1904
    invoke-static {v3}, Ld1/d;->a(Ljava/io/Closeable;)V

    .line 1905
    .line 1906
    .line 1907
    if-nez v11, :cond_3b

    .line 1908
    .line 1909
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    .line 1910
    .line 1911
    .line 1912
    :cond_3b
    throw v0

    .line 1913
    :catchall_a
    move-exception v0

    .line 1914
    move-object v7, v5

    .line 1915
    move-object v3, v6

    .line 1916
    goto :goto_3a

    .line 1917
    :catch_b
    move-exception v0

    .line 1918
    move-object v7, v5

    .line 1919
    move-object v3, v6

    .line 1920
    goto :goto_39

    .line 1921
    :catchall_b
    move-exception v0

    .line 1922
    const/4 v3, 0x0

    .line 1923
    move-object v7, v5

    .line 1924
    goto :goto_3a

    .line 1925
    :catch_c
    move-exception v0

    .line 1926
    const/4 v3, 0x0

    .line 1927
    move-object v7, v5

    .line 1928
    goto :goto_39

    .line 1929
    :catchall_c
    move-exception v0

    .line 1930
    const/4 v3, 0x0

    .line 1931
    move-object v7, v3

    .line 1932
    goto :goto_3a

    .line 1933
    :catch_d
    move-exception v0

    .line 1934
    const/4 v3, 0x0

    .line 1935
    move-object v7, v3

    .line 1936
    :goto_39
    :try_start_13
    new-instance v1, Ljava/io/IOException;

    .line 1937
    .line 1938
    const-string v2, "Failed to copy original file to temp file"

    .line 1939
    .line 1940
    invoke-direct {v1, v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1941
    .line 1942
    .line 1943
    throw v1
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_d

    .line 1944
    :catchall_d
    move-exception v0

    .line 1945
    :goto_3a
    invoke-static {v7}, Ld1/d;->a(Ljava/io/Closeable;)V

    .line 1946
    .line 1947
    .line 1948
    invoke-static {v3}, Ld1/d;->a(Ljava/io/Closeable;)V

    .line 1949
    .line 1950
    .line 1951
    throw v0

    .line 1952
    nop

    .line 1953
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_7
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/security/Provider;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, LN0/f;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    if-nez p2, :cond_0

    .line 7
    .line 8
    invoke-static {p1}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-static {p1, p2}, Ljava/security/Signature;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljava/security/Signature;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    :goto_0
    return-object p1

    .line 18
    :pswitch_0
    if-nez p2, :cond_1

    .line 19
    .line 20
    invoke-static {p1}, Ljava/security/KeyPairGenerator;->getInstance(Ljava/lang/String;)Ljava/security/KeyPairGenerator;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    goto :goto_1

    .line 25
    :cond_1
    invoke-static {p1, p2}, Ljava/security/KeyPairGenerator;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljava/security/KeyPairGenerator;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    :goto_1
    return-object p1

    .line 30
    :pswitch_1
    if-nez p2, :cond_2

    .line 31
    .line 32
    invoke-static {p1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    goto :goto_2

    .line 37
    :cond_2
    invoke-static {p1, p2}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljavax/crypto/Cipher;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    :goto_2
    return-object p1

    .line 42
    nop

    .line 43
    :pswitch_data_0
    .packed-switch 0x14
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public c(Landroid/content/pm/PackageManager;Ljava/lang/String;)[Landroid/content/pm/Signature;
    .locals 1

    .line 1
    const/16 v0, 0x40

    .line 2
    .line 3
    invoke-virtual {p1, p2, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p1, p1, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .line 8
    .line 9
    return-object p1
.end method

.method public d(Ljava/lang/CharSequence;)Z
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    return p1
.end method

.method public e(Landroid/content/Context;Ljava/lang/String;LV0/c;)LV0/d;
    .locals 3

    .line 1
    new-instance v0, LV0/d;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput v1, v0, LV0/d;->a:I

    .line 8
    .line 9
    iput v1, v0, LV0/d;->b:I

    .line 10
    .line 11
    iput v1, v0, LV0/d;->c:I

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-interface {p3, p1, p2, v1}, LV0/c;->b(Landroid/content/Context;Ljava/lang/String;Z)I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    iput v2, v0, LV0/d;->b:I

    .line 19
    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    iput v1, v0, LV0/d;->c:I

    .line 23
    .line 24
    return-object v0

    .line 25
    :cond_0
    invoke-interface {p3, p1, p2}, LV0/c;->c(Landroid/content/Context;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput p1, v0, LV0/d;->a:I

    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    const/4 p1, -0x1

    .line 34
    iput p1, v0, LV0/d;->c:I

    .line 35
    .line 36
    :cond_1
    return-object v0
.end method

.method public f(Landroidx/preference/Preference;)Ljava/lang/CharSequence;
    .locals 2

    .line 1
    check-cast p1, Landroidx/preference/ListPreference;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    iget-object p1, p1, Landroidx/preference/Preference;->e:Landroid/content/Context;

    .line 11
    .line 12
    const v0, 0x7f0e004a

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    return-object p1

    .line 20
    :cond_0
    return-object v0
.end method

.method public get()Ljava/lang/Object;
    .locals 15

    .line 1
    new-instance v0, LK0/h;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-direct {v0, v1}, LK0/h;-><init>(I)V

    .line 5
    .line 6
    .line 7
    new-instance v1, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    sget-object v7, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    .line 13
    .line 14
    const-string v8, "Null flags"

    .line 15
    .line 16
    if-eqz v7, :cond_4

    .line 17
    .line 18
    new-instance v2, LE0/c;

    .line 19
    .line 20
    const-wide/16 v3, 0x7530

    .line 21
    .line 22
    const-wide/32 v5, 0x5265c00

    .line 23
    .line 24
    .line 25
    invoke-direct/range {v2 .. v7}, LE0/c;-><init>(JJLjava/util/Set;)V

    .line 26
    .line 27
    .line 28
    sget-object v3, Lv0/d;->e:Lv0/d;

    .line 29
    .line 30
    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    if-eqz v7, :cond_3

    .line 34
    .line 35
    new-instance v2, LE0/c;

    .line 36
    .line 37
    const-wide/16 v3, 0x3e8

    .line 38
    .line 39
    const-wide/32 v5, 0x5265c00

    .line 40
    .line 41
    .line 42
    invoke-direct/range {v2 .. v7}, LE0/c;-><init>(JJLjava/util/Set;)V

    .line 43
    .line 44
    .line 45
    sget-object v3, Lv0/d;->g:Lv0/d;

    .line 46
    .line 47
    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    if-eqz v7, :cond_2

    .line 51
    .line 52
    sget-object v2, LE0/e;->f:LE0/e;

    .line 53
    .line 54
    filled-new-array {v2}, [LE0/e;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    new-instance v3, Ljava/util/HashSet;

    .line 59
    .line 60
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-direct {v3, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v3}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 68
    .line 69
    .line 70
    move-result-object v14

    .line 71
    if-eqz v14, :cond_1

    .line 72
    .line 73
    new-instance v9, LE0/c;

    .line 74
    .line 75
    const-wide/32 v10, 0x5265c00

    .line 76
    .line 77
    .line 78
    const-wide/32 v12, 0x5265c00

    .line 79
    .line 80
    .line 81
    invoke-direct/range {v9 .. v14}, LE0/c;-><init>(JJLjava/util/Set;)V

    .line 82
    .line 83
    .line 84
    sget-object v2, Lv0/d;->f:Lv0/d;

    .line 85
    .line 86
    invoke-virtual {v1, v2, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-interface {v2}, Ljava/util/Set;->size()I

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    invoke-static {}, Lv0/d;->values()[Lv0/d;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    array-length v3, v3

    .line 102
    if-lt v2, v3, :cond_0

    .line 103
    .line 104
    new-instance v2, Ljava/util/HashMap;

    .line 105
    .line 106
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 107
    .line 108
    .line 109
    new-instance v2, LE0/b;

    .line 110
    .line 111
    invoke-direct {v2, v0, v1}, LE0/b;-><init>(LH0/a;Ljava/util/HashMap;)V

    .line 112
    .line 113
    .line 114
    return-object v2

    .line 115
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 116
    .line 117
    const-string v1, "Not all priorities have been configured"

    .line 118
    .line 119
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    throw v0

    .line 123
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    .line 124
    .line 125
    invoke-direct {v0, v8}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    throw v0

    .line 129
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    .line 130
    .line 131
    invoke-direct {v0, v8}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    throw v0

    .line 135
    :cond_3
    new-instance v0, Ljava/lang/NullPointerException;

    .line 136
    .line 137
    invoke-direct {v0, v8}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    throw v0

    .line 141
    :cond_4
    new-instance v0, Ljava/lang/NullPointerException;

    .line 142
    .line 143
    invoke-direct {v0, v8}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    throw v0
.end method

.method public o(LI/b;)Ljava/lang/Object;
    .locals 0

    .line 1
    throw p1
.end method

.method public p(Ljava/nio/ByteBuffer;Lb3/g;)V
    .locals 0

    .line 1
    sget-object p2, Lk3/w;->b:Lk3/w;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lk3/w;->c(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    return-void
.end method
