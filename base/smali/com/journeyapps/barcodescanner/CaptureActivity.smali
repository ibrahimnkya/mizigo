.class public Lcom/journeyapps/barcodescanner/CaptureActivity;
.super Landroid/app/Activity;
.source "SourceFile"


# instance fields
.field public e:LT2/k;

.field public f:Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final onCreate(Landroid/os/Bundle;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-super/range {p0 .. p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 6
    .line 7
    .line 8
    const v2, 0x7f0b0048

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v2}, Landroid/app/Activity;->setContentView(I)V

    .line 12
    .line 13
    .line 14
    const v2, 0x7f0800f8

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;

    .line 22
    .line 23
    iput-object v2, v0, Lcom/journeyapps/barcodescanner/CaptureActivity;->f:Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;

    .line 24
    .line 25
    new-instance v2, LT2/k;

    .line 26
    .line 27
    iget-object v3, v0, Lcom/journeyapps/barcodescanner/CaptureActivity;->f:Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;

    .line 28
    .line 29
    invoke-direct {v2, v0, v3}, LT2/k;-><init>(Lcom/journeyapps/barcodescanner/CaptureActivity;Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;)V

    .line 30
    .line 31
    .line 32
    iput-object v2, v0, Lcom/journeyapps/barcodescanner/CaptureActivity;->e:LT2/k;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    const/16 v6, 0x80

    .line 43
    .line 44
    invoke-virtual {v5, v6}, Landroid/view/Window;->addFlags(I)V

    .line 45
    .line 46
    .line 47
    const/4 v5, -0x1

    .line 48
    if-eqz v1, :cond_0

    .line 49
    .line 50
    const-string v6, "SAVED_ORIENTATION_LOCK"

    .line 51
    .line 52
    invoke-virtual {v1, v6, v5}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    iput v1, v2, LT2/k;->c:I

    .line 57
    .line 58
    :cond_0
    const/4 v1, 0x2

    .line 59
    if-eqz v4, :cond_1b

    .line 60
    .line 61
    const-string v7, "SCAN_ORIENTATION_LOCKED"

    .line 62
    .line 63
    const/4 v8, 0x1

    .line 64
    invoke-virtual {v4, v7, v8}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 65
    .line 66
    .line 67
    move-result v7

    .line 68
    if-eqz v7, :cond_7

    .line 69
    .line 70
    iget v7, v2, LT2/k;->c:I

    .line 71
    .line 72
    if-ne v7, v5, :cond_6

    .line 73
    .line 74
    invoke-virtual {v0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    .line 75
    .line 76
    .line 77
    move-result-object v7

    .line 78
    invoke-interface {v7}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    invoke-virtual {v7}, Landroid/view/Display;->getRotation()I

    .line 83
    .line 84
    .line 85
    move-result v7

    .line 86
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 87
    .line 88
    .line 89
    move-result-object v9

    .line 90
    invoke-virtual {v9}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 91
    .line 92
    .line 93
    move-result-object v9

    .line 94
    iget v9, v9, Landroid/content/res/Configuration;->orientation:I

    .line 95
    .line 96
    if-ne v9, v1, :cond_3

    .line 97
    .line 98
    if-eqz v7, :cond_2

    .line 99
    .line 100
    if-ne v7, v8, :cond_1

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_1
    const/16 v7, 0x8

    .line 104
    .line 105
    goto :goto_2

    .line 106
    :cond_2
    :goto_0
    const/4 v7, 0x0

    .line 107
    goto :goto_2

    .line 108
    :cond_3
    if-ne v9, v8, :cond_2

    .line 109
    .line 110
    if-eqz v7, :cond_5

    .line 111
    .line 112
    const/4 v9, 0x3

    .line 113
    if-ne v7, v9, :cond_4

    .line 114
    .line 115
    goto :goto_1

    .line 116
    :cond_4
    const/16 v7, 0x9

    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_5
    :goto_1
    move v7, v8

    .line 120
    :goto_2
    iput v7, v2, LT2/k;->c:I

    .line 121
    .line 122
    :cond_6
    iget v7, v2, LT2/k;->c:I

    .line 123
    .line 124
    invoke-virtual {v0, v7}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 125
    .line 126
    .line 127
    :cond_7
    const-string v7, "com.google.zxing.client.android.SCAN"

    .line 128
    .line 129
    invoke-virtual {v4}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v9

    .line 133
    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v7

    .line 137
    if-eqz v7, :cond_16

    .line 138
    .line 139
    sget-object v7, Lv2/d;->a:Ljava/util/regex/Pattern;

    .line 140
    .line 141
    const-string v7, "SCAN_FORMATS"

    .line 142
    .line 143
    invoke-virtual {v4, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v7

    .line 147
    const/4 v9, 0x0

    .line 148
    if-eqz v7, :cond_8

    .line 149
    .line 150
    sget-object v10, Lv2/d;->a:Ljava/util/regex/Pattern;

    .line 151
    .line 152
    invoke-virtual {v10, v7}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v7

    .line 156
    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 157
    .line 158
    .line 159
    move-result-object v7

    .line 160
    goto :goto_3

    .line 161
    :cond_8
    move-object v7, v9

    .line 162
    :goto_3
    const-string v10, "SCAN_MODE"

    .line 163
    .line 164
    invoke-virtual {v4, v10}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v10

    .line 168
    if-eqz v7, :cond_9

    .line 169
    .line 170
    const-class v11, Lr2/a;

    .line 171
    .line 172
    invoke-static {v11}, Ljava/util/EnumSet;->noneOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    .line 173
    .line 174
    .line 175
    move-result-object v11

    .line 176
    :try_start_0
    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 177
    .line 178
    .line 179
    move-result-object v7

    .line 180
    :goto_4
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 181
    .line 182
    .line 183
    move-result v12

    .line 184
    if-eqz v12, :cond_b

    .line 185
    .line 186
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v12

    .line 190
    check-cast v12, Ljava/lang/String;

    .line 191
    .line 192
    invoke-static {v12}, Lr2/a;->valueOf(Ljava/lang/String;)Lr2/a;

    .line 193
    .line 194
    .line 195
    move-result-object v12

    .line 196
    invoke-interface {v11, v12}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 197
    .line 198
    .line 199
    goto :goto_4

    .line 200
    :catch_0
    :cond_9
    if-eqz v10, :cond_a

    .line 201
    .line 202
    sget-object v7, Lv2/d;->b:Ljava/util/HashMap;

    .line 203
    .line 204
    invoke-virtual {v7, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object v7

    .line 208
    check-cast v7, Ljava/util/Set;

    .line 209
    .line 210
    move-object v11, v7

    .line 211
    goto :goto_5

    .line 212
    :cond_a
    move-object v11, v9

    .line 213
    :cond_b
    :goto_5
    sget v7, Lv2/e;->a:I

    .line 214
    .line 215
    invoke-virtual {v4}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 216
    .line 217
    .line 218
    move-result-object v7

    .line 219
    if-eqz v7, :cond_12

    .line 220
    .line 221
    invoke-virtual {v7}, Landroid/os/BaseBundle;->isEmpty()Z

    .line 222
    .line 223
    .line 224
    move-result v10

    .line 225
    if-eqz v10, :cond_c

    .line 226
    .line 227
    goto/16 :goto_8

    .line 228
    .line 229
    :cond_c
    new-instance v9, Ljava/util/EnumMap;

    .line 230
    .line 231
    const-class v10, Lr2/d;

    .line 232
    .line 233
    invoke-direct {v9, v10}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    .line 234
    .line 235
    .line 236
    invoke-static {}, Lr2/d;->values()[Lr2/d;

    .line 237
    .line 238
    .line 239
    move-result-object v10

    .line 240
    array-length v12, v10

    .line 241
    const/4 v13, 0x0

    .line 242
    :goto_6
    const-string v14, "e"

    .line 243
    .line 244
    if-ge v13, v12, :cond_11

    .line 245
    .line 246
    aget-object v15, v10, v13

    .line 247
    .line 248
    sget-object v1, Lr2/d;->i:Lr2/d;

    .line 249
    .line 250
    if-eq v15, v1, :cond_10

    .line 251
    .line 252
    sget-object v1, Lr2/d;->n:Lr2/d;

    .line 253
    .line 254
    if-eq v15, v1, :cond_10

    .line 255
    .line 256
    sget-object v1, Lr2/d;->g:Lr2/d;

    .line 257
    .line 258
    if-ne v15, v1, :cond_d

    .line 259
    .line 260
    goto :goto_7

    .line 261
    :cond_d
    invoke-virtual {v15}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    iget-object v8, v15, Lr2/d;->e:Ljava/lang/Class;

    .line 266
    .line 267
    invoke-virtual {v7, v1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 268
    .line 269
    .line 270
    move-result v16

    .line 271
    if-eqz v16, :cond_10

    .line 272
    .line 273
    const-class v6, Ljava/lang/Void;

    .line 274
    .line 275
    invoke-virtual {v8, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 276
    .line 277
    .line 278
    move-result v6

    .line 279
    if-eqz v6, :cond_e

    .line 280
    .line 281
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 282
    .line 283
    invoke-virtual {v9, v15, v1}, Ljava/util/EnumMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 284
    .line 285
    .line 286
    goto :goto_7

    .line 287
    :cond_e
    invoke-virtual {v7, v1}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 288
    .line 289
    .line 290
    move-result-object v1

    .line 291
    invoke-virtual {v8, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 292
    .line 293
    .line 294
    move-result v6

    .line 295
    if-eqz v6, :cond_f

    .line 296
    .line 297
    invoke-virtual {v9, v15, v1}, Ljava/util/EnumMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    .line 299
    .line 300
    goto :goto_7

    .line 301
    :cond_f
    new-instance v6, Ljava/lang/StringBuilder;

    .line 302
    .line 303
    const-string v8, "Ignoring hint "

    .line 304
    .line 305
    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 306
    .line 307
    .line 308
    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    const-string v8, " because it is not assignable from "

    .line 312
    .line 313
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 314
    .line 315
    .line 316
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v1

    .line 323
    invoke-static {v14, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 324
    .line 325
    .line 326
    :cond_10
    :goto_7
    add-int/lit8 v13, v13, 0x1

    .line 327
    .line 328
    const/4 v1, 0x2

    .line 329
    const/4 v8, 0x1

    .line 330
    goto :goto_6

    .line 331
    :cond_11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 332
    .line 333
    const-string v6, "Hints from the Intent: "

    .line 334
    .line 335
    invoke-direct {v1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 336
    .line 337
    .line 338
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 339
    .line 340
    .line 341
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object v1

    .line 345
    invoke-static {v14, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 346
    .line 347
    .line 348
    :cond_12
    :goto_8
    new-instance v1, LU2/j;

    .line 349
    .line 350
    invoke-direct {v1}, LU2/j;-><init>()V

    .line 351
    .line 352
    .line 353
    const-string v6, "SCAN_CAMERA_ID"

    .line 354
    .line 355
    invoke-virtual {v4, v6}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 356
    .line 357
    .line 358
    move-result v7

    .line 359
    if-eqz v7, :cond_13

    .line 360
    .line 361
    invoke-virtual {v4, v6, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 362
    .line 363
    .line 364
    move-result v5

    .line 365
    if-ltz v5, :cond_13

    .line 366
    .line 367
    iput v5, v1, LU2/j;->a:I

    .line 368
    .line 369
    :cond_13
    const-string v5, "TORCH_ENABLED"

    .line 370
    .line 371
    invoke-virtual {v4, v5}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 372
    .line 373
    .line 374
    move-result v6

    .line 375
    if-eqz v6, :cond_14

    .line 376
    .line 377
    const/4 v6, 0x0

    .line 378
    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 379
    .line 380
    .line 381
    move-result v5

    .line 382
    if-eqz v5, :cond_14

    .line 383
    .line 384
    iget-object v5, v3, Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;->e:Lcom/journeyapps/barcodescanner/BarcodeView;

    .line 385
    .line 386
    const/4 v6, 0x1

    .line 387
    invoke-virtual {v5, v6}, LT2/g;->setTorch(Z)V

    .line 388
    .line 389
    .line 390
    :cond_14
    const-string v5, "PROMPT_MESSAGE"

    .line 391
    .line 392
    invoke-virtual {v4, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 393
    .line 394
    .line 395
    move-result-object v5

    .line 396
    if-eqz v5, :cond_15

    .line 397
    .line 398
    invoke-virtual {v3, v5}, Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;->setStatusText(Ljava/lang/String;)V

    .line 399
    .line 400
    .line 401
    :cond_15
    const-string v5, "SCAN_TYPE"

    .line 402
    .line 403
    const/4 v6, 0x0

    .line 404
    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 405
    .line 406
    .line 407
    move-result v5

    .line 408
    const-string v6, "CHARACTER_SET"

    .line 409
    .line 410
    invoke-virtual {v4, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 411
    .line 412
    .line 413
    move-result-object v6

    .line 414
    new-instance v7, Lr2/h;

    .line 415
    .line 416
    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    .line 417
    .line 418
    .line 419
    invoke-virtual {v7, v9}, Lr2/h;->c(Ljava/util/Map;)V

    .line 420
    .line 421
    .line 422
    iget-object v7, v3, Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;->e:Lcom/journeyapps/barcodescanner/BarcodeView;

    .line 423
    .line 424
    invoke-virtual {v7, v1}, LT2/g;->setCameraSettings(LU2/j;)V

    .line 425
    .line 426
    .line 427
    iget-object v1, v3, Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;->e:Lcom/journeyapps/barcodescanner/BarcodeView;

    .line 428
    .line 429
    new-instance v3, LJ0/p;

    .line 430
    .line 431
    invoke-direct {v3, v11, v9, v6, v5}, LJ0/p;-><init>(Ljava/util/Collection;Ljava/util/EnumMap;Ljava/lang/String;I)V

    .line 432
    .line 433
    .line 434
    invoke-virtual {v1, v3}, Lcom/journeyapps/barcodescanner/BarcodeView;->setDecoderFactory(LT2/m;)V

    .line 435
    .line 436
    .line 437
    :cond_16
    const-string v1, "BEEP_ENABLED"

    .line 438
    .line 439
    const/4 v6, 0x1

    .line 440
    invoke-virtual {v4, v1, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 441
    .line 442
    .line 443
    move-result v1

    .line 444
    if-nez v1, :cond_17

    .line 445
    .line 446
    iget-object v1, v2, LT2/k;->i:Ls3/l;

    .line 447
    .line 448
    const/4 v3, 0x0

    .line 449
    iput-boolean v3, v1, Ls3/l;->b:Z

    .line 450
    .line 451
    :cond_17
    const-string v1, "SHOW_MISSING_CAMERA_PERMISSION_DIALOG"

    .line 452
    .line 453
    invoke-virtual {v4, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 454
    .line 455
    .line 456
    move-result v3

    .line 457
    if-eqz v3, :cond_19

    .line 458
    .line 459
    invoke-virtual {v4, v1, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 460
    .line 461
    .line 462
    move-result v1

    .line 463
    const-string v3, "MISSING_CAMERA_PERMISSION_DIALOG_MESSAGE"

    .line 464
    .line 465
    invoke-virtual {v4, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 466
    .line 467
    .line 468
    move-result-object v3

    .line 469
    iput-boolean v1, v2, LT2/k;->e:Z

    .line 470
    .line 471
    if-eqz v3, :cond_18

    .line 472
    .line 473
    goto :goto_9

    .line 474
    :cond_18
    const-string v3, ""

    .line 475
    .line 476
    :goto_9
    iput-object v3, v2, LT2/k;->f:Ljava/lang/String;

    .line 477
    .line 478
    :cond_19
    const-string v1, "TIMEOUT"

    .line 479
    .line 480
    invoke-virtual {v4, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 481
    .line 482
    .line 483
    move-result v3

    .line 484
    if-eqz v3, :cond_1a

    .line 485
    .line 486
    new-instance v3, LT2/h;

    .line 487
    .line 488
    const/4 v6, 0x1

    .line 489
    invoke-direct {v3, v2, v6}, LT2/h;-><init>(LT2/k;I)V

    .line 490
    .line 491
    .line 492
    const-wide/16 v7, 0x0

    .line 493
    .line 494
    invoke-virtual {v4, v1, v7, v8}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    .line 495
    .line 496
    .line 497
    move-result-wide v7

    .line 498
    iget-object v1, v2, LT2/k;->j:Landroid/os/Handler;

    .line 499
    .line 500
    invoke-virtual {v1, v3, v7, v8}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 501
    .line 502
    .line 503
    goto :goto_a

    .line 504
    :cond_1a
    const/4 v6, 0x1

    .line 505
    :goto_a
    const-string v1, "BARCODE_IMAGE_ENABLED"

    .line 506
    .line 507
    const/4 v3, 0x0

    .line 508
    invoke-virtual {v4, v1, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 509
    .line 510
    .line 511
    move-result v1

    .line 512
    if-eqz v1, :cond_1b

    .line 513
    .line 514
    iput-boolean v6, v2, LT2/k;->d:Z

    .line 515
    .line 516
    :cond_1b
    iget-object v1, v0, Lcom/journeyapps/barcodescanner/CaptureActivity;->e:LT2/k;

    .line 517
    .line 518
    iget-object v2, v1, LT2/k;->b:Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;

    .line 519
    .line 520
    iget-object v1, v1, LT2/k;->l:LA0/c;

    .line 521
    .line 522
    iget-object v3, v2, Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;->e:Lcom/journeyapps/barcodescanner/BarcodeView;

    .line 523
    .line 524
    new-instance v4, LA/c;

    .line 525
    .line 526
    const/16 v5, 0x18

    .line 527
    .line 528
    const/4 v6, 0x0

    .line 529
    invoke-direct {v4, v2, v1, v5, v6}, LA/c;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 530
    .line 531
    .line 532
    const/4 v1, 0x2

    .line 533
    iput v1, v3, Lcom/journeyapps/barcodescanner/BarcodeView;->F:I

    .line 534
    .line 535
    iput-object v4, v3, Lcom/journeyapps/barcodescanner/BarcodeView;->G:LT2/a;

    .line 536
    .line 537
    invoke-virtual {v3}, Lcom/journeyapps/barcodescanner/BarcodeView;->j()V

    .line 538
    .line 539
    .line 540
    return-void
.end method

.method public final onDestroy()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureActivity;->e:LT2/k;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    iput-boolean v1, v0, LT2/k;->g:Z

    .line 8
    .line 9
    iget-object v1, v0, LT2/k;->h:La3/f;

    .line 10
    .line 11
    invoke-virtual {v1}, La3/f;->a()V

    .line 12
    .line 13
    .line 14
    iget-object v0, v0, LT2/k;->j:Landroid/os/Handler;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureActivity;->f:Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p1, 0x0

    .line 17
    return p1

    .line 18
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 19
    return p1
.end method

.method public final onPause()V
    .locals 8

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureActivity;->e:LT2/k;

    .line 5
    .line 6
    iget-object v1, v0, LT2/k;->h:La3/f;

    .line 7
    .line 8
    invoke-virtual {v1}, La3/f;->a()V

    .line 9
    .line 10
    .line 11
    iget-object v0, v0, LT2/k;->b:Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;->e:Lcom/journeyapps/barcodescanner/BarcodeView;

    .line 14
    .line 15
    invoke-virtual {v0}, LT2/g;->getCameraInstance()LU2/g;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/BarcodeView;->i()V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 23
    .line 24
    .line 25
    move-result-wide v2

    .line 26
    :goto_0
    if-eqz v1, :cond_1

    .line 27
    .line 28
    iget-boolean v0, v1, LU2/g;->g:Z

    .line 29
    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 33
    .line 34
    .line 35
    move-result-wide v4

    .line 36
    sub-long/2addr v4, v2

    .line 37
    const-wide/32 v6, 0x77359400

    .line 38
    .line 39
    .line 40
    cmp-long v0, v4, v6

    .line 41
    .line 42
    if-lez v0, :cond_0

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_0
    const-wide/16 v4, 0x1

    .line 46
    .line 47
    :try_start_0
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catch_0
    :cond_1
    :goto_1
    return-void
.end method

.method public final onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/journeyapps/barcodescanner/CaptureActivity;->e:LT2/k;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const/16 v0, 0xfa

    .line 7
    .line 8
    if-ne p1, v0, :cond_2

    .line 9
    .line 10
    array-length p1, p3

    .line 11
    const/4 v0, 0x0

    .line 12
    if-lez p1, :cond_0

    .line 13
    .line 14
    aget p1, p3, v0

    .line 15
    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    iget-object p1, p2, LT2/k;->b:Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;->e:Lcom/journeyapps/barcodescanner/BarcodeView;

    .line 21
    .line 22
    invoke-virtual {p1}, LT2/g;->e()V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    new-instance p1, Landroid/content/Intent;

    .line 27
    .line 28
    const-string p3, "com.google.zxing.client.android.SCAN"

    .line 29
    .line 30
    invoke-direct {p1, p3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const-string p3, "MISSING_CAMERA_PERMISSION"

    .line 34
    .line 35
    const/4 v1, 0x1

    .line 36
    invoke-virtual {p1, p3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    iget-object p3, p2, LT2/k;->a:Lcom/journeyapps/barcodescanner/CaptureActivity;

    .line 40
    .line 41
    invoke-virtual {p3, v0, p1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 42
    .line 43
    .line 44
    iget-boolean p1, p2, LT2/k;->e:Z

    .line 45
    .line 46
    if-eqz p1, :cond_1

    .line 47
    .line 48
    iget-object p1, p2, LT2/k;->f:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {p2, p1}, LT2/k;->b(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    invoke-virtual {p2}, LT2/k;->a()V

    .line 55
    .line 56
    .line 57
    :cond_2
    return-void
.end method

.method public final onResume()V
    .locals 6

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureActivity;->e:LT2/k;

    .line 5
    .line 6
    iget-object v1, v0, LT2/k;->a:Lcom/journeyapps/barcodescanner/CaptureActivity;

    .line 7
    .line 8
    const-string v2, "android.permission.CAMERA"

    .line 9
    .line 10
    invoke-static {v1, v2}, Lu/c;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    const/4 v4, 0x1

    .line 15
    if-nez v3, :cond_0

    .line 16
    .line 17
    iget-object v1, v0, LT2/k;->b:Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;->e:Lcom/journeyapps/barcodescanner/BarcodeView;

    .line 20
    .line 21
    invoke-virtual {v1}, LT2/g;->e()V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-boolean v3, v0, LT2/k;->m:Z

    .line 26
    .line 27
    if-nez v3, :cond_1

    .line 28
    .line 29
    filled-new-array {v2}, [Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    const/16 v3, 0xfa

    .line 34
    .line 35
    invoke-static {v1, v2, v3}, Lt/a;->b(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 36
    .line 37
    .line 38
    iput-boolean v4, v0, LT2/k;->m:Z

    .line 39
    .line 40
    :cond_1
    :goto_0
    iget-object v0, v0, LT2/k;->h:La3/f;

    .line 41
    .line 42
    iget-boolean v1, v0, La3/f;->a:Z

    .line 43
    .line 44
    if-nez v1, :cond_2

    .line 45
    .line 46
    iget-object v1, v0, La3/f;->c:Landroid/content/Context;

    .line 47
    .line 48
    check-cast v1, Lcom/journeyapps/barcodescanner/CaptureActivity;

    .line 49
    .line 50
    iget-object v2, v0, La3/f;->d:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast v2, Lv2/f;

    .line 53
    .line 54
    new-instance v3, Landroid/content/IntentFilter;

    .line 55
    .line 56
    const-string v5, "android.intent.action.BATTERY_CHANGED"

    .line 57
    .line 58
    invoke-direct {v3, v5}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 62
    .line 63
    .line 64
    iput-boolean v4, v0, La3/f;->a:Z

    .line 65
    .line 66
    :cond_2
    iget-object v1, v0, La3/f;->e:Ljava/lang/Object;

    .line 67
    .line 68
    check-cast v1, Landroid/os/Handler;

    .line 69
    .line 70
    const/4 v2, 0x0

    .line 71
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    iget-boolean v1, v0, La3/f;->b:Z

    .line 75
    .line 76
    if-eqz v1, :cond_3

    .line 77
    .line 78
    iget-object v1, v0, La3/f;->e:Ljava/lang/Object;

    .line 79
    .line 80
    check-cast v1, Landroid/os/Handler;

    .line 81
    .line 82
    iget-object v0, v0, La3/f;->f:Ljava/lang/Object;

    .line 83
    .line 84
    check-cast v0, LT2/h;

    .line 85
    .line 86
    const-wide/32 v2, 0x493e0

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 90
    .line 91
    .line 92
    :cond_3
    return-void
.end method

.method public final onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/CaptureActivity;->e:LT2/k;

    .line 5
    .line 6
    const-string v1, "SAVED_ORIENTATION_LOCK"

    .line 7
    .line 8
    iget v0, v0, LT2/k;->c:I

    .line 9
    .line 10
    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
