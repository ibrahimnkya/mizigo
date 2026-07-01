.class public final Lk2/h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:I

.field public final f:Ljava/util/Set;

.field public g:LE/i;

.field public h:Lo2/b;

.field public i:F

.field public j:Ljava/lang/Runnable;

.field public final synthetic k:Lk2/a;


# direct methods
.method public synthetic constructor <init>(Lk2/a;Ljava/util/Set;I)V
    .locals 0

    .line 1
    iput p3, p0, Lk2/h;->e:I

    iput-object p1, p0, Lk2/h;->k:Lk2/a;

    iput-object p2, p0, Lk2/h;->f:Ljava/util/Set;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget v0, v1, Lk2/h;->e:I

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    iget-object v0, v1, Lk2/h;->k:Lk2/a;

    .line 9
    .line 10
    move-object v2, v0

    .line 11
    check-cast v2, Lk2/o;

    .line 12
    .line 13
    iget-object v0, v2, Lk2/o;->l:Ljava/util/Set;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    sget-object v0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    .line 23
    .line 24
    :goto_0
    iget-object v3, v1, Lk2/h;->f:Ljava/util/Set;

    .line 25
    .line 26
    if-eqz v3, :cond_1

    .line 27
    .line 28
    invoke-static {v3}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    sget-object v4, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    .line 34
    .line 35
    :goto_1
    invoke-interface {v4, v0}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    iget-object v0, v1, Lk2/h;->j:Ljava/lang/Runnable;

    .line 42
    .line 43
    check-cast v0, LD1/o;

    .line 44
    .line 45
    invoke-virtual {v0}, LD1/o;->run()V

    .line 46
    .line 47
    .line 48
    goto/16 :goto_9

    .line 49
    .line 50
    :cond_2
    new-instance v4, Lk2/f;

    .line 51
    .line 52
    invoke-direct {v4, v2}, Lk2/f;-><init>(Lk2/o;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, v4, Lk2/f;->j:Lk2/a;

    .line 56
    .line 57
    move-object v5, v0

    .line 58
    check-cast v5, Lk2/o;

    .line 59
    .line 60
    iget v6, v1, Lk2/h;->i:F

    .line 61
    .line 62
    iget v0, v2, Lk2/o;->n:F

    .line 63
    .line 64
    cmpl-float v7, v6, v0

    .line 65
    .line 66
    if-lez v7, :cond_3

    .line 67
    .line 68
    const/4 v7, 0x1

    .line 69
    goto :goto_2

    .line 70
    :cond_3
    const/4 v7, 0x0

    .line 71
    :goto_2
    sub-float v9, v6, v0

    .line 72
    .line 73
    iget-object v10, v2, Lk2/o;->h:Ljava/util/Set;

    .line 74
    .line 75
    :try_start_0
    iget-object v0, v1, Lk2/h;->g:LE/i;

    .line 76
    .line 77
    invoke-virtual {v0}, LE/i;->z()Le1/F;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iget-object v0, v0, Le1/F;->i:Lcom/google/android/gms/maps/model/LatLngBounds;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    .line 83
    goto :goto_3

    .line 84
    :catch_0
    move-exception v0

    .line 85
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 86
    .line 87
    .line 88
    invoke-static {}, Lcom/google/android/gms/maps/model/LatLngBounds;->a()Le1/m;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    new-instance v11, Lcom/google/android/gms/maps/model/LatLng;

    .line 93
    .line 94
    const-wide/16 v12, 0x0

    .line 95
    .line 96
    invoke-direct {v11, v12, v13, v12, v13}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, v11}, Le1/m;->b(Lcom/google/android/gms/maps/model/LatLng;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0}, Le1/m;->a()Lcom/google/android/gms/maps/model/LatLngBounds;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    :goto_3
    iget-object v11, v2, Lk2/o;->l:Ljava/util/Set;

    .line 107
    .line 108
    if-eqz v11, :cond_5

    .line 109
    .line 110
    iget-boolean v11, v2, Lk2/o;->d:Z

    .line 111
    .line 112
    if-eqz v11, :cond_5

    .line 113
    .line 114
    new-instance v11, Ljava/util/ArrayList;

    .line 115
    .line 116
    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 117
    .line 118
    .line 119
    iget-object v13, v2, Lk2/o;->l:Ljava/util/Set;

    .line 120
    .line 121
    invoke-interface {v13}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 122
    .line 123
    .line 124
    move-result-object v13

    .line 125
    :cond_4
    :goto_4
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    .line 126
    .line 127
    .line 128
    move-result v14

    .line 129
    if-eqz v14, :cond_6

    .line 130
    .line 131
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v14

    .line 135
    check-cast v14, Li2/a;

    .line 136
    .line 137
    invoke-interface {v14}, Li2/a;->c()I

    .line 138
    .line 139
    .line 140
    move-result v15

    .line 141
    iget v12, v2, Lk2/o;->k:I

    .line 142
    .line 143
    if-lt v15, v12, :cond_4

    .line 144
    .line 145
    invoke-interface {v14}, Li2/a;->getPosition()Lcom/google/android/gms/maps/model/LatLng;

    .line 146
    .line 147
    .line 148
    move-result-object v12

    .line 149
    invoke-virtual {v0, v12}, Lcom/google/android/gms/maps/model/LatLngBounds;->b(Lcom/google/android/gms/maps/model/LatLng;)Z

    .line 150
    .line 151
    .line 152
    move-result v12

    .line 153
    if-eqz v12, :cond_4

    .line 154
    .line 155
    iget-object v12, v1, Lk2/h;->h:Lo2/b;

    .line 156
    .line 157
    invoke-interface {v14}, Li2/a;->getPosition()Lcom/google/android/gms/maps/model/LatLng;

    .line 158
    .line 159
    .line 160
    move-result-object v14

    .line 161
    invoke-virtual {v12, v14}, Lo2/b;->b(Lcom/google/android/gms/maps/model/LatLng;)Lo2/a;

    .line 162
    .line 163
    .line 164
    move-result-object v12

    .line 165
    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    goto :goto_4

    .line 169
    :cond_5
    const/4 v11, 0x0

    .line 170
    :cond_6
    new-instance v12, Ljava/util/concurrent/ConcurrentHashMap;

    .line 171
    .line 172
    invoke-direct {v12}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 173
    .line 174
    .line 175
    invoke-static {v12}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    .line 176
    .line 177
    .line 178
    move-result-object v12

    .line 179
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 180
    .line 181
    .line 182
    move-result-object v13

    .line 183
    :goto_5
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    .line 184
    .line 185
    .line 186
    move-result v14

    .line 187
    if-eqz v14, :cond_9

    .line 188
    .line 189
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v14

    .line 193
    check-cast v14, Li2/a;

    .line 194
    .line 195
    invoke-interface {v14}, Li2/a;->getPosition()Lcom/google/android/gms/maps/model/LatLng;

    .line 196
    .line 197
    .line 198
    move-result-object v15

    .line 199
    invoke-virtual {v0, v15}, Lcom/google/android/gms/maps/model/LatLngBounds;->b(Lcom/google/android/gms/maps/model/LatLng;)Z

    .line 200
    .line 201
    .line 202
    move-result v15

    .line 203
    if-eqz v7, :cond_8

    .line 204
    .line 205
    if-eqz v15, :cond_8

    .line 206
    .line 207
    iget-boolean v8, v2, Lk2/o;->d:Z

    .line 208
    .line 209
    if-eqz v8, :cond_8

    .line 210
    .line 211
    iget-object v8, v1, Lk2/h;->h:Lo2/b;

    .line 212
    .line 213
    invoke-interface {v14}, Li2/a;->getPosition()Lcom/google/android/gms/maps/model/LatLng;

    .line 214
    .line 215
    .line 216
    move-result-object v15

    .line 217
    invoke-virtual {v8, v15}, Lo2/b;->b(Lcom/google/android/gms/maps/model/LatLng;)Lo2/a;

    .line 218
    .line 219
    .line 220
    move-result-object v8

    .line 221
    invoke-static {v2, v11, v8}, Lk2/o;->f(Lk2/o;Ljava/util/ArrayList;Lo2/a;)Lo2/a;

    .line 222
    .line 223
    .line 224
    move-result-object v8

    .line 225
    if-eqz v8, :cond_7

    .line 226
    .line 227
    iget-object v15, v1, Lk2/h;->h:Lo2/b;

    .line 228
    .line 229
    invoke-virtual {v15, v8}, Lo2/b;->a(Lo2/a;)Lcom/google/android/gms/maps/model/LatLng;

    .line 230
    .line 231
    .line 232
    move-result-object v8

    .line 233
    new-instance v15, Lk2/m;

    .line 234
    .line 235
    invoke-direct {v15, v2, v14, v12, v8}, Lk2/m;-><init>(Lk2/o;Li2/a;Ljava/util/Set;Lcom/google/android/gms/maps/model/LatLng;)V

    .line 236
    .line 237
    .line 238
    const/4 v8, 0x1

    .line 239
    invoke-virtual {v4, v8, v15}, Lk2/f;->b(ZLk2/m;)V

    .line 240
    .line 241
    .line 242
    move/from16 v16, v7

    .line 243
    .line 244
    const/4 v7, 0x0

    .line 245
    goto :goto_6

    .line 246
    :cond_7
    const/4 v8, 0x1

    .line 247
    new-instance v15, Lk2/m;

    .line 248
    .line 249
    move/from16 v16, v7

    .line 250
    .line 251
    const/4 v7, 0x0

    .line 252
    invoke-direct {v15, v2, v14, v12, v7}, Lk2/m;-><init>(Lk2/o;Li2/a;Ljava/util/Set;Lcom/google/android/gms/maps/model/LatLng;)V

    .line 253
    .line 254
    .line 255
    invoke-virtual {v4, v8, v15}, Lk2/f;->b(ZLk2/m;)V

    .line 256
    .line 257
    .line 258
    goto :goto_6

    .line 259
    :cond_8
    move/from16 v16, v7

    .line 260
    .line 261
    const/4 v7, 0x0

    .line 262
    new-instance v8, Lk2/m;

    .line 263
    .line 264
    invoke-direct {v8, v2, v14, v12, v7}, Lk2/m;-><init>(Lk2/o;Li2/a;Ljava/util/Set;Lcom/google/android/gms/maps/model/LatLng;)V

    .line 265
    .line 266
    .line 267
    invoke-virtual {v4, v15, v8}, Lk2/f;->b(ZLk2/m;)V

    .line 268
    .line 269
    .line 270
    :goto_6
    move/from16 v7, v16

    .line 271
    .line 272
    goto :goto_5

    .line 273
    :cond_9
    move/from16 v16, v7

    .line 274
    .line 275
    const/4 v7, 0x0

    .line 276
    invoke-virtual {v4}, Lk2/f;->f()V

    .line 277
    .line 278
    .line 279
    invoke-interface {v10, v12}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 280
    .line 281
    .line 282
    iget-boolean v8, v2, Lk2/o;->d:Z

    .line 283
    .line 284
    if-eqz v8, :cond_b

    .line 285
    .line 286
    new-instance v7, Ljava/util/ArrayList;

    .line 287
    .line 288
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 289
    .line 290
    .line 291
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 292
    .line 293
    .line 294
    move-result-object v8

    .line 295
    :cond_a
    :goto_7
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 296
    .line 297
    .line 298
    move-result v11

    .line 299
    if-eqz v11, :cond_b

    .line 300
    .line 301
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 302
    .line 303
    .line 304
    move-result-object v11

    .line 305
    check-cast v11, Li2/a;

    .line 306
    .line 307
    invoke-interface {v11}, Li2/a;->c()I

    .line 308
    .line 309
    .line 310
    move-result v13

    .line 311
    iget v14, v2, Lk2/o;->k:I

    .line 312
    .line 313
    if-lt v13, v14, :cond_a

    .line 314
    .line 315
    invoke-interface {v11}, Li2/a;->getPosition()Lcom/google/android/gms/maps/model/LatLng;

    .line 316
    .line 317
    .line 318
    move-result-object v13

    .line 319
    invoke-virtual {v0, v13}, Lcom/google/android/gms/maps/model/LatLngBounds;->b(Lcom/google/android/gms/maps/model/LatLng;)Z

    .line 320
    .line 321
    .line 322
    move-result v13

    .line 323
    if-eqz v13, :cond_a

    .line 324
    .line 325
    iget-object v13, v1, Lk2/h;->h:Lo2/b;

    .line 326
    .line 327
    invoke-interface {v11}, Li2/a;->getPosition()Lcom/google/android/gms/maps/model/LatLng;

    .line 328
    .line 329
    .line 330
    move-result-object v11

    .line 331
    invoke-virtual {v13, v11}, Lo2/b;->b(Lcom/google/android/gms/maps/model/LatLng;)Lo2/a;

    .line 332
    .line 333
    .line 334
    move-result-object v11

    .line 335
    invoke-virtual {v7, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 336
    .line 337
    .line 338
    goto :goto_7

    .line 339
    :cond_b
    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 340
    .line 341
    .line 342
    move-result-object v8

    .line 343
    :goto_8
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 344
    .line 345
    .line 346
    move-result v10

    .line 347
    if-eqz v10, :cond_e

    .line 348
    .line 349
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 350
    .line 351
    .line 352
    move-result-object v10

    .line 353
    check-cast v10, Lk2/n;

    .line 354
    .line 355
    iget-object v11, v10, Lk2/n;->b:Lcom/google/android/gms/maps/model/LatLng;

    .line 356
    .line 357
    iget-object v13, v10, Lk2/n;->a:Le1/o;

    .line 358
    .line 359
    invoke-virtual {v0, v11}, Lcom/google/android/gms/maps/model/LatLngBounds;->b(Lcom/google/android/gms/maps/model/LatLng;)Z

    .line 360
    .line 361
    .line 362
    move-result v11

    .line 363
    if-nez v16, :cond_d

    .line 364
    .line 365
    const/high16 v14, -0x3fc00000    # -3.0f

    .line 366
    .line 367
    cmpl-float v14, v9, v14

    .line 368
    .line 369
    if-lez v14, :cond_d

    .line 370
    .line 371
    if-eqz v11, :cond_d

    .line 372
    .line 373
    iget-boolean v14, v2, Lk2/o;->d:Z

    .line 374
    .line 375
    if-eqz v14, :cond_d

    .line 376
    .line 377
    iget-object v11, v1, Lk2/h;->h:Lo2/b;

    .line 378
    .line 379
    iget-object v14, v10, Lk2/n;->b:Lcom/google/android/gms/maps/model/LatLng;

    .line 380
    .line 381
    invoke-virtual {v11, v14}, Lo2/b;->b(Lcom/google/android/gms/maps/model/LatLng;)Lo2/a;

    .line 382
    .line 383
    .line 384
    move-result-object v11

    .line 385
    invoke-static {v2, v7, v11}, Lk2/o;->f(Lk2/o;Ljava/util/ArrayList;Lo2/a;)Lo2/a;

    .line 386
    .line 387
    .line 388
    move-result-object v11

    .line 389
    if-eqz v11, :cond_c

    .line 390
    .line 391
    iget-object v13, v1, Lk2/h;->h:Lo2/b;

    .line 392
    .line 393
    invoke-virtual {v13, v11}, Lo2/b;->a(Lo2/a;)Lcom/google/android/gms/maps/model/LatLng;

    .line 394
    .line 395
    .line 396
    move-result-object v11

    .line 397
    iget-object v13, v10, Lk2/n;->b:Lcom/google/android/gms/maps/model/LatLng;

    .line 398
    .line 399
    iget-object v14, v4, Lk2/f;->b:Ljava/util/concurrent/locks/ReentrantLock;

    .line 400
    .line 401
    invoke-virtual {v14}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 402
    .line 403
    .line 404
    new-instance v15, Lk2/l;

    .line 405
    .line 406
    invoke-direct {v15, v5, v10, v13, v11}, Lk2/l;-><init>(Lk2/o;Lk2/n;Lcom/google/android/gms/maps/model/LatLng;Lcom/google/android/gms/maps/model/LatLng;)V

    .line 407
    .line 408
    .line 409
    iget-object v10, v5, Lk2/o;->c:Li2/c;

    .line 410
    .line 411
    iget-object v10, v10, Li2/c;->e:Ll2/b;

    .line 412
    .line 413
    iput-object v10, v15, Lk2/l;->f:Ll2/b;

    .line 414
    .line 415
    const/4 v10, 0x1

    .line 416
    iput-boolean v10, v15, Lk2/l;->e:Z

    .line 417
    .line 418
    iget-object v11, v4, Lk2/f;->h:Ljava/util/LinkedList;

    .line 419
    .line 420
    invoke-virtual {v11, v15}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 421
    .line 422
    .line 423
    invoke-virtual {v14}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 424
    .line 425
    .line 426
    goto :goto_8

    .line 427
    :cond_c
    const/4 v10, 0x1

    .line 428
    invoke-virtual {v4, v13, v10}, Lk2/f;->e(Le1/o;Z)V

    .line 429
    .line 430
    .line 431
    goto :goto_8

    .line 432
    :cond_d
    const/4 v10, 0x1

    .line 433
    invoke-virtual {v4, v13, v11}, Lk2/f;->e(Le1/o;Z)V

    .line 434
    .line 435
    .line 436
    goto :goto_8

    .line 437
    :cond_e
    invoke-virtual {v4}, Lk2/f;->f()V

    .line 438
    .line 439
    .line 440
    iput-object v12, v2, Lk2/o;->h:Ljava/util/Set;

    .line 441
    .line 442
    iput-object v3, v2, Lk2/o;->l:Ljava/util/Set;

    .line 443
    .line 444
    iput v6, v2, Lk2/o;->n:F

    .line 445
    .line 446
    iget-object v0, v1, Lk2/h;->j:Ljava/lang/Runnable;

    .line 447
    .line 448
    check-cast v0, LD1/o;

    .line 449
    .line 450
    invoke-virtual {v0}, LD1/o;->run()V

    .line 451
    .line 452
    .line 453
    :goto_9
    return-void

    .line 454
    :pswitch_0
    iget-object v0, v1, Lk2/h;->k:Lk2/a;

    .line 455
    .line 456
    move-object v2, v0

    .line 457
    check-cast v2, Lk2/j;

    .line 458
    .line 459
    iget-object v0, v2, Lk2/j;->l:Ljava/util/Set;

    .line 460
    .line 461
    if-eqz v0, :cond_f

    .line 462
    .line 463
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 464
    .line 465
    .line 466
    move-result-object v0

    .line 467
    goto :goto_a

    .line 468
    :cond_f
    sget-object v0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    .line 469
    .line 470
    :goto_a
    iget-object v3, v1, Lk2/h;->f:Ljava/util/Set;

    .line 471
    .line 472
    if-eqz v3, :cond_10

    .line 473
    .line 474
    invoke-static {v3}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 475
    .line 476
    .line 477
    move-result-object v4

    .line 478
    goto :goto_b

    .line 479
    :cond_10
    sget-object v4, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    .line 480
    .line 481
    :goto_b
    invoke-interface {v4, v0}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    .line 482
    .line 483
    .line 484
    move-result v0

    .line 485
    if-eqz v0, :cond_11

    .line 486
    .line 487
    iget-object v0, v1, Lk2/h;->j:Ljava/lang/Runnable;

    .line 488
    .line 489
    check-cast v0, LD1/o;

    .line 490
    .line 491
    invoke-virtual {v0}, LD1/o;->run()V

    .line 492
    .line 493
    .line 494
    goto/16 :goto_13

    .line 495
    .line 496
    :cond_11
    new-instance v4, Lk2/f;

    .line 497
    .line 498
    invoke-direct {v4, v2}, Lk2/f;-><init>(Lk2/j;)V

    .line 499
    .line 500
    .line 501
    iget-object v0, v4, Lk2/f;->j:Lk2/a;

    .line 502
    .line 503
    move-object v5, v0

    .line 504
    check-cast v5, Lk2/j;

    .line 505
    .line 506
    iget v6, v1, Lk2/h;->i:F

    .line 507
    .line 508
    iget v0, v2, Lk2/j;->n:F

    .line 509
    .line 510
    cmpl-float v7, v6, v0

    .line 511
    .line 512
    if-lez v7, :cond_12

    .line 513
    .line 514
    const/4 v7, 0x1

    .line 515
    goto :goto_c

    .line 516
    :cond_12
    const/4 v7, 0x0

    .line 517
    :goto_c
    sub-float v9, v6, v0

    .line 518
    .line 519
    iget-object v10, v2, Lk2/j;->h:Ljava/util/Set;

    .line 520
    .line 521
    :try_start_1
    iget-object v0, v1, Lk2/h;->g:LE/i;

    .line 522
    .line 523
    invoke-virtual {v0}, LE/i;->z()Le1/F;

    .line 524
    .line 525
    .line 526
    move-result-object v0

    .line 527
    iget-object v0, v0, Le1/F;->i:Lcom/google/android/gms/maps/model/LatLngBounds;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 528
    .line 529
    goto :goto_d

    .line 530
    :catch_1
    move-exception v0

    .line 531
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 532
    .line 533
    .line 534
    invoke-static {}, Lcom/google/android/gms/maps/model/LatLngBounds;->a()Le1/m;

    .line 535
    .line 536
    .line 537
    move-result-object v0

    .line 538
    new-instance v11, Lcom/google/android/gms/maps/model/LatLng;

    .line 539
    .line 540
    const-wide/16 v12, 0x0

    .line 541
    .line 542
    invoke-direct {v11, v12, v13, v12, v13}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 543
    .line 544
    .line 545
    invoke-virtual {v0, v11}, Le1/m;->b(Lcom/google/android/gms/maps/model/LatLng;)V

    .line 546
    .line 547
    .line 548
    invoke-virtual {v0}, Le1/m;->a()Lcom/google/android/gms/maps/model/LatLngBounds;

    .line 549
    .line 550
    .line 551
    move-result-object v0

    .line 552
    :goto_d
    iget-object v11, v2, Lk2/j;->l:Ljava/util/Set;

    .line 553
    .line 554
    if-eqz v11, :cond_14

    .line 555
    .line 556
    iget-boolean v11, v2, Lk2/j;->d:Z

    .line 557
    .line 558
    if-eqz v11, :cond_14

    .line 559
    .line 560
    new-instance v11, Ljava/util/ArrayList;

    .line 561
    .line 562
    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 563
    .line 564
    .line 565
    iget-object v13, v2, Lk2/j;->l:Ljava/util/Set;

    .line 566
    .line 567
    invoke-interface {v13}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 568
    .line 569
    .line 570
    move-result-object v13

    .line 571
    :cond_13
    :goto_e
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    .line 572
    .line 573
    .line 574
    move-result v14

    .line 575
    if-eqz v14, :cond_15

    .line 576
    .line 577
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 578
    .line 579
    .line 580
    move-result-object v14

    .line 581
    check-cast v14, Li2/a;

    .line 582
    .line 583
    invoke-interface {v14}, Li2/a;->c()I

    .line 584
    .line 585
    .line 586
    move-result v15

    .line 587
    iget v12, v2, Lk2/j;->k:I

    .line 588
    .line 589
    if-lt v15, v12, :cond_13

    .line 590
    .line 591
    invoke-interface {v14}, Li2/a;->getPosition()Lcom/google/android/gms/maps/model/LatLng;

    .line 592
    .line 593
    .line 594
    move-result-object v12

    .line 595
    invoke-virtual {v0, v12}, Lcom/google/android/gms/maps/model/LatLngBounds;->b(Lcom/google/android/gms/maps/model/LatLng;)Z

    .line 596
    .line 597
    .line 598
    move-result v12

    .line 599
    if-eqz v12, :cond_13

    .line 600
    .line 601
    iget-object v12, v1, Lk2/h;->h:Lo2/b;

    .line 602
    .line 603
    invoke-interface {v14}, Li2/a;->getPosition()Lcom/google/android/gms/maps/model/LatLng;

    .line 604
    .line 605
    .line 606
    move-result-object v14

    .line 607
    invoke-virtual {v12, v14}, Lo2/b;->b(Lcom/google/android/gms/maps/model/LatLng;)Lo2/a;

    .line 608
    .line 609
    .line 610
    move-result-object v12

    .line 611
    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 612
    .line 613
    .line 614
    goto :goto_e

    .line 615
    :cond_14
    const/4 v11, 0x0

    .line 616
    :cond_15
    new-instance v12, Ljava/util/concurrent/ConcurrentHashMap;

    .line 617
    .line 618
    invoke-direct {v12}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 619
    .line 620
    .line 621
    invoke-static {v12}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    .line 622
    .line 623
    .line 624
    move-result-object v12

    .line 625
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 626
    .line 627
    .line 628
    move-result-object v13

    .line 629
    :goto_f
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    .line 630
    .line 631
    .line 632
    move-result v14

    .line 633
    if-eqz v14, :cond_18

    .line 634
    .line 635
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 636
    .line 637
    .line 638
    move-result-object v14

    .line 639
    check-cast v14, Li2/a;

    .line 640
    .line 641
    invoke-interface {v14}, Li2/a;->getPosition()Lcom/google/android/gms/maps/model/LatLng;

    .line 642
    .line 643
    .line 644
    move-result-object v15

    .line 645
    invoke-virtual {v0, v15}, Lcom/google/android/gms/maps/model/LatLngBounds;->b(Lcom/google/android/gms/maps/model/LatLng;)Z

    .line 646
    .line 647
    .line 648
    move-result v15

    .line 649
    if-eqz v7, :cond_17

    .line 650
    .line 651
    if-eqz v15, :cond_17

    .line 652
    .line 653
    iget-boolean v8, v2, Lk2/j;->d:Z

    .line 654
    .line 655
    if-eqz v8, :cond_17

    .line 656
    .line 657
    iget-object v8, v1, Lk2/h;->h:Lo2/b;

    .line 658
    .line 659
    invoke-interface {v14}, Li2/a;->getPosition()Lcom/google/android/gms/maps/model/LatLng;

    .line 660
    .line 661
    .line 662
    move-result-object v15

    .line 663
    invoke-virtual {v8, v15}, Lo2/b;->b(Lcom/google/android/gms/maps/model/LatLng;)Lo2/a;

    .line 664
    .line 665
    .line 666
    move-result-object v8

    .line 667
    invoke-static {v2, v11, v8}, Lk2/j;->f(Lk2/j;Ljava/util/ArrayList;Lo2/a;)Lo2/a;

    .line 668
    .line 669
    .line 670
    move-result-object v8

    .line 671
    if-eqz v8, :cond_16

    .line 672
    .line 673
    iget-object v15, v1, Lk2/h;->h:Lo2/b;

    .line 674
    .line 675
    invoke-virtual {v15, v8}, Lo2/b;->a(Lo2/a;)Lcom/google/android/gms/maps/model/LatLng;

    .line 676
    .line 677
    .line 678
    move-result-object v8

    .line 679
    new-instance v15, Lk2/d;

    .line 680
    .line 681
    invoke-direct {v15, v2, v14, v12, v8}, Lk2/d;-><init>(Lk2/j;Li2/a;Ljava/util/Set;Lcom/google/android/gms/maps/model/LatLng;)V

    .line 682
    .line 683
    .line 684
    const/4 v8, 0x1

    .line 685
    invoke-virtual {v4, v8, v15}, Lk2/f;->a(ZLk2/d;)V

    .line 686
    .line 687
    .line 688
    move/from16 v16, v7

    .line 689
    .line 690
    const/4 v7, 0x0

    .line 691
    goto :goto_10

    .line 692
    :cond_16
    const/4 v8, 0x1

    .line 693
    new-instance v15, Lk2/d;

    .line 694
    .line 695
    move/from16 v16, v7

    .line 696
    .line 697
    const/4 v7, 0x0

    .line 698
    invoke-direct {v15, v2, v14, v12, v7}, Lk2/d;-><init>(Lk2/j;Li2/a;Ljava/util/Set;Lcom/google/android/gms/maps/model/LatLng;)V

    .line 699
    .line 700
    .line 701
    invoke-virtual {v4, v8, v15}, Lk2/f;->a(ZLk2/d;)V

    .line 702
    .line 703
    .line 704
    goto :goto_10

    .line 705
    :cond_17
    move/from16 v16, v7

    .line 706
    .line 707
    const/4 v7, 0x0

    .line 708
    new-instance v8, Lk2/d;

    .line 709
    .line 710
    invoke-direct {v8, v2, v14, v12, v7}, Lk2/d;-><init>(Lk2/j;Li2/a;Ljava/util/Set;Lcom/google/android/gms/maps/model/LatLng;)V

    .line 711
    .line 712
    .line 713
    invoke-virtual {v4, v15, v8}, Lk2/f;->a(ZLk2/d;)V

    .line 714
    .line 715
    .line 716
    :goto_10
    move/from16 v7, v16

    .line 717
    .line 718
    goto :goto_f

    .line 719
    :cond_18
    move/from16 v16, v7

    .line 720
    .line 721
    const/4 v7, 0x0

    .line 722
    invoke-virtual {v4}, Lk2/f;->f()V

    .line 723
    .line 724
    .line 725
    invoke-interface {v10, v12}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 726
    .line 727
    .line 728
    iget-boolean v8, v2, Lk2/j;->d:Z

    .line 729
    .line 730
    if-eqz v8, :cond_1a

    .line 731
    .line 732
    new-instance v7, Ljava/util/ArrayList;

    .line 733
    .line 734
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 735
    .line 736
    .line 737
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 738
    .line 739
    .line 740
    move-result-object v8

    .line 741
    :cond_19
    :goto_11
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 742
    .line 743
    .line 744
    move-result v11

    .line 745
    if-eqz v11, :cond_1a

    .line 746
    .line 747
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 748
    .line 749
    .line 750
    move-result-object v11

    .line 751
    check-cast v11, Li2/a;

    .line 752
    .line 753
    invoke-interface {v11}, Li2/a;->c()I

    .line 754
    .line 755
    .line 756
    move-result v13

    .line 757
    iget v14, v2, Lk2/j;->k:I

    .line 758
    .line 759
    if-lt v13, v14, :cond_19

    .line 760
    .line 761
    invoke-interface {v11}, Li2/a;->getPosition()Lcom/google/android/gms/maps/model/LatLng;

    .line 762
    .line 763
    .line 764
    move-result-object v13

    .line 765
    invoke-virtual {v0, v13}, Lcom/google/android/gms/maps/model/LatLngBounds;->b(Lcom/google/android/gms/maps/model/LatLng;)Z

    .line 766
    .line 767
    .line 768
    move-result v13

    .line 769
    if-eqz v13, :cond_19

    .line 770
    .line 771
    iget-object v13, v1, Lk2/h;->h:Lo2/b;

    .line 772
    .line 773
    invoke-interface {v11}, Li2/a;->getPosition()Lcom/google/android/gms/maps/model/LatLng;

    .line 774
    .line 775
    .line 776
    move-result-object v11

    .line 777
    invoke-virtual {v13, v11}, Lo2/b;->b(Lcom/google/android/gms/maps/model/LatLng;)Lo2/a;

    .line 778
    .line 779
    .line 780
    move-result-object v11

    .line 781
    invoke-virtual {v7, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 782
    .line 783
    .line 784
    goto :goto_11

    .line 785
    :cond_1a
    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 786
    .line 787
    .line 788
    move-result-object v8

    .line 789
    :goto_12
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 790
    .line 791
    .line 792
    move-result v10

    .line 793
    if-eqz v10, :cond_1d

    .line 794
    .line 795
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 796
    .line 797
    .line 798
    move-result-object v10

    .line 799
    check-cast v10, Lk2/g;

    .line 800
    .line 801
    iget-object v11, v10, Lk2/g;->b:Lcom/google/android/gms/maps/model/LatLng;

    .line 802
    .line 803
    iget-object v13, v10, Lk2/g;->a:Le1/o;

    .line 804
    .line 805
    invoke-virtual {v0, v11}, Lcom/google/android/gms/maps/model/LatLngBounds;->b(Lcom/google/android/gms/maps/model/LatLng;)Z

    .line 806
    .line 807
    .line 808
    move-result v11

    .line 809
    if-nez v16, :cond_1c

    .line 810
    .line 811
    const/high16 v14, -0x3fc00000    # -3.0f

    .line 812
    .line 813
    cmpl-float v14, v9, v14

    .line 814
    .line 815
    if-lez v14, :cond_1c

    .line 816
    .line 817
    if-eqz v11, :cond_1c

    .line 818
    .line 819
    iget-boolean v14, v2, Lk2/j;->d:Z

    .line 820
    .line 821
    if-eqz v14, :cond_1c

    .line 822
    .line 823
    iget-object v11, v1, Lk2/h;->h:Lo2/b;

    .line 824
    .line 825
    iget-object v14, v10, Lk2/g;->b:Lcom/google/android/gms/maps/model/LatLng;

    .line 826
    .line 827
    invoke-virtual {v11, v14}, Lo2/b;->b(Lcom/google/android/gms/maps/model/LatLng;)Lo2/a;

    .line 828
    .line 829
    .line 830
    move-result-object v11

    .line 831
    invoke-static {v2, v7, v11}, Lk2/j;->f(Lk2/j;Ljava/util/ArrayList;Lo2/a;)Lo2/a;

    .line 832
    .line 833
    .line 834
    move-result-object v11

    .line 835
    if-eqz v11, :cond_1b

    .line 836
    .line 837
    iget-object v13, v1, Lk2/h;->h:Lo2/b;

    .line 838
    .line 839
    invoke-virtual {v13, v11}, Lo2/b;->a(Lo2/a;)Lcom/google/android/gms/maps/model/LatLng;

    .line 840
    .line 841
    .line 842
    move-result-object v11

    .line 843
    iget-object v13, v10, Lk2/g;->b:Lcom/google/android/gms/maps/model/LatLng;

    .line 844
    .line 845
    iget-object v14, v4, Lk2/f;->b:Ljava/util/concurrent/locks/ReentrantLock;

    .line 846
    .line 847
    invoke-virtual {v14}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 848
    .line 849
    .line 850
    new-instance v15, Lk2/c;

    .line 851
    .line 852
    invoke-direct {v15, v5, v10, v13, v11}, Lk2/c;-><init>(Lk2/j;Lk2/g;Lcom/google/android/gms/maps/model/LatLng;Lcom/google/android/gms/maps/model/LatLng;)V

    .line 853
    .line 854
    .line 855
    iget-object v10, v5, Lk2/j;->c:Li2/c;

    .line 856
    .line 857
    iget-object v10, v10, Li2/c;->e:Ll2/b;

    .line 858
    .line 859
    iput-object v10, v15, Lk2/c;->f:Ll2/b;

    .line 860
    .line 861
    const/4 v10, 0x1

    .line 862
    iput-boolean v10, v15, Lk2/c;->e:Z

    .line 863
    .line 864
    iget-object v11, v4, Lk2/f;->h:Ljava/util/LinkedList;

    .line 865
    .line 866
    invoke-virtual {v11, v15}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 867
    .line 868
    .line 869
    invoke-virtual {v14}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 870
    .line 871
    .line 872
    goto :goto_12

    .line 873
    :cond_1b
    const/4 v10, 0x1

    .line 874
    invoke-virtual {v4, v13, v10}, Lk2/f;->e(Le1/o;Z)V

    .line 875
    .line 876
    .line 877
    goto :goto_12

    .line 878
    :cond_1c
    const/4 v10, 0x1

    .line 879
    invoke-virtual {v4, v13, v11}, Lk2/f;->e(Le1/o;Z)V

    .line 880
    .line 881
    .line 882
    goto :goto_12

    .line 883
    :cond_1d
    invoke-virtual {v4}, Lk2/f;->f()V

    .line 884
    .line 885
    .line 886
    iput-object v12, v2, Lk2/j;->h:Ljava/util/Set;

    .line 887
    .line 888
    iput-object v3, v2, Lk2/j;->l:Ljava/util/Set;

    .line 889
    .line 890
    iput v6, v2, Lk2/j;->n:F

    .line 891
    .line 892
    iget-object v0, v1, Lk2/h;->j:Ljava/lang/Runnable;

    .line 893
    .line 894
    check-cast v0, LD1/o;

    .line 895
    .line 896
    invoke-virtual {v0}, LD1/o;->run()V

    .line 897
    .line 898
    .line 899
    :goto_13
    return-void

    .line 900
    nop

    .line 901
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
