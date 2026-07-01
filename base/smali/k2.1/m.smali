.class public final Lk2/m;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Li2/a;

.field public final b:Ljava/util/Set;

.field public final c:Lcom/google/android/gms/maps/model/LatLng;

.field public final synthetic d:Lk2/o;


# direct methods
.method public constructor <init>(Lk2/o;Li2/a;Ljava/util/Set;Lcom/google/android/gms/maps/model/LatLng;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lk2/m;->d:Lk2/o;

    .line 5
    .line 6
    iput-object p2, p0, Lk2/m;->a:Li2/a;

    .line 7
    .line 8
    iput-object p3, p0, Lk2/m;->b:Ljava/util/Set;

    .line 9
    .line 10
    iput-object p4, p0, Lk2/m;->c:Lcom/google/android/gms/maps/model/LatLng;

    .line 11
    .line 12
    return-void
.end method

.method public static a(Lk2/m;Lk2/f;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v1, Lk2/f;->j:Lk2/a;

    .line 6
    .line 7
    check-cast v2, Lk2/o;

    .line 8
    .line 9
    iget-object v3, v1, Lk2/f;->b:Ljava/util/concurrent/locks/ReentrantLock;

    .line 10
    .line 11
    iget-object v4, v0, Lk2/m;->b:Ljava/util/Set;

    .line 12
    .line 13
    iget-object v5, v0, Lk2/m;->c:Lcom/google/android/gms/maps/model/LatLng;

    .line 14
    .line 15
    iget-object v6, v0, Lk2/m;->d:Lk2/o;

    .line 16
    .line 17
    iget-object v0, v0, Lk2/m;->a:Li2/a;

    .line 18
    .line 19
    invoke-interface {v0}, Li2/a;->c()I

    .line 20
    .line 21
    .line 22
    move-result v7

    .line 23
    iget v8, v6, Lk2/o;->k:I

    .line 24
    .line 25
    if-lt v7, v8, :cond_0

    .line 26
    .line 27
    const/4 v7, 0x1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 v7, 0x0

    .line 30
    :goto_0
    iget-object v8, v6, Lk2/o;->m:Lk2/e;

    .line 31
    .line 32
    iget-object v11, v6, Lk2/o;->c:Li2/c;

    .line 33
    .line 34
    iget-object v12, v6, Lk2/o;->j:Lk2/e;

    .line 35
    .line 36
    if-nez v7, :cond_b

    .line 37
    .line 38
    invoke-interface {v0}, Li2/a;->b()Ljava/util/Collection;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 47
    .line 48
    .line 49
    move-result v7

    .line 50
    if-eqz v7, :cond_a

    .line 51
    .line 52
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v7

    .line 56
    check-cast v7, Ls3/t;

    .line 57
    .line 58
    iget-object v8, v12, Lk2/e;->b:Ljava/util/HashMap;

    .line 59
    .line 60
    invoke-virtual {v8, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v8

    .line 64
    check-cast v8, Le1/o;

    .line 65
    .line 66
    if-nez v8, :cond_2

    .line 67
    .line 68
    new-instance v8, Le1/p;

    .line 69
    .line 70
    invoke-direct {v8}, Le1/p;-><init>()V

    .line 71
    .line 72
    .line 73
    if-eqz v5, :cond_1

    .line 74
    .line 75
    iput-object v5, v8, Le1/p;->e:Lcom/google/android/gms/maps/model/LatLng;

    .line 76
    .line 77
    goto :goto_2

    .line 78
    :cond_1
    iget-object v13, v7, Ls3/t;->a:Le1/p;

    .line 79
    .line 80
    iget-object v13, v13, Le1/p;->e:Lcom/google/android/gms/maps/model/LatLng;

    .line 81
    .line 82
    invoke-virtual {v8, v13}, Le1/p;->g(Lcom/google/android/gms/maps/model/LatLng;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v7}, Ls3/t;->m()Ljava/lang/Float;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v7}, Ls3/t;->m()Ljava/lang/Float;

    .line 89
    .line 90
    .line 91
    move-result-object v13

    .line 92
    invoke-virtual {v13}, Ljava/lang/Float;->floatValue()F

    .line 93
    .line 94
    .line 95
    move-result v13

    .line 96
    iput v13, v8, Le1/p;->r:F

    .line 97
    .line 98
    :goto_2
    invoke-virtual {v6, v7, v8}, Lk2/o;->h(Ls3/t;Le1/p;)V

    .line 99
    .line 100
    .line 101
    iget-object v13, v11, Li2/c;->f:Ll2/a;

    .line 102
    .line 103
    iget-object v14, v13, Ll2/a;->g:Ll2/b;

    .line 104
    .line 105
    iget-object v14, v14, Ll2/b;->f:LB2/a;

    .line 106
    .line 107
    invoke-virtual {v14, v8}, LB2/a;->e(Le1/p;)Le1/o;

    .line 108
    .line 109
    .line 110
    move-result-object v8

    .line 111
    iget-object v14, v13, Ll2/a;->a:Ljava/util/LinkedHashSet;

    .line 112
    .line 113
    invoke-interface {v14, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    iget-object v14, v13, Ll2/a;->b:Ll2/b;

    .line 117
    .line 118
    iget-object v14, v14, Ll2/b;->e:Ljava/util/HashMap;

    .line 119
    .line 120
    invoke-virtual {v14, v8, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    new-instance v13, Lk2/n;

    .line 124
    .line 125
    invoke-direct {v13, v8}, Lk2/n;-><init>(Le1/o;)V

    .line 126
    .line 127
    .line 128
    iget-object v14, v12, Lk2/e;->b:Ljava/util/HashMap;

    .line 129
    .line 130
    invoke-virtual {v14, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    iget-object v14, v12, Lk2/e;->c:Ljava/util/HashMap;

    .line 134
    .line 135
    invoke-virtual {v14, v8, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    if-eqz v5, :cond_9

    .line 139
    .line 140
    iget-object v14, v7, Ls3/t;->a:Le1/p;

    .line 141
    .line 142
    iget-object v14, v14, Le1/p;->e:Lcom/google/android/gms/maps/model/LatLng;

    .line 143
    .line 144
    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 145
    .line 146
    .line 147
    iget-object v15, v1, Lk2/f;->h:Ljava/util/LinkedList;

    .line 148
    .line 149
    new-instance v9, Lk2/l;

    .line 150
    .line 151
    invoke-direct {v9, v2, v13, v5, v14}, Lk2/l;-><init>(Lk2/o;Lk2/n;Lcom/google/android/gms/maps/model/LatLng;Lcom/google/android/gms/maps/model/LatLng;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v15, v9}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 158
    .line 159
    .line 160
    goto/16 :goto_6

    .line 161
    .line 162
    :cond_2
    new-instance v13, Lk2/n;

    .line 163
    .line 164
    invoke-direct {v13, v8}, Lk2/n;-><init>(Le1/o;)V

    .line 165
    .line 166
    .line 167
    iget-object v9, v7, Ls3/t;->a:Le1/p;

    .line 168
    .line 169
    iget-object v14, v9, Le1/p;->f:Ljava/lang/String;

    .line 170
    .line 171
    if-eqz v14, :cond_4

    .line 172
    .line 173
    iget-object v15, v9, Le1/p;->g:Ljava/lang/String;

    .line 174
    .line 175
    if-eqz v15, :cond_4

    .line 176
    .line 177
    invoke-virtual {v8}, Le1/o;->d()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v15

    .line 181
    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result v14

    .line 185
    if-nez v14, :cond_3

    .line 186
    .line 187
    iget-object v14, v9, Le1/p;->f:Ljava/lang/String;

    .line 188
    .line 189
    invoke-virtual {v8, v14}, Le1/o;->i(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    const/4 v14, 0x1

    .line 193
    goto :goto_3

    .line 194
    :cond_3
    const/4 v14, 0x0

    .line 195
    :goto_3
    iget-object v15, v9, Le1/p;->g:Ljava/lang/String;

    .line 196
    .line 197
    invoke-virtual {v8}, Le1/o;->c()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v10

    .line 201
    invoke-virtual {v15, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    move-result v10

    .line 205
    if-nez v10, :cond_7

    .line 206
    .line 207
    iget-object v10, v9, Le1/p;->g:Ljava/lang/String;

    .line 208
    .line 209
    invoke-virtual {v8, v10}, Le1/o;->h(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    :goto_4
    const/4 v14, 0x1

    .line 213
    goto :goto_5

    .line 214
    :cond_4
    iget-object v10, v9, Le1/p;->g:Ljava/lang/String;

    .line 215
    .line 216
    if-eqz v10, :cond_5

    .line 217
    .line 218
    invoke-virtual {v8}, Le1/o;->d()Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v14

    .line 222
    invoke-virtual {v10, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    move-result v10

    .line 226
    if-nez v10, :cond_5

    .line 227
    .line 228
    iget-object v10, v9, Le1/p;->g:Ljava/lang/String;

    .line 229
    .line 230
    invoke-virtual {v8, v10}, Le1/o;->i(Ljava/lang/String;)V

    .line 231
    .line 232
    .line 233
    goto :goto_4

    .line 234
    :cond_5
    iget-object v10, v9, Le1/p;->f:Ljava/lang/String;

    .line 235
    .line 236
    if-eqz v10, :cond_6

    .line 237
    .line 238
    invoke-virtual {v8}, Le1/o;->d()Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v14

    .line 242
    invoke-virtual {v10, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    move-result v10

    .line 246
    if-nez v10, :cond_6

    .line 247
    .line 248
    iget-object v10, v9, Le1/p;->f:Ljava/lang/String;

    .line 249
    .line 250
    invoke-virtual {v8, v10}, Le1/o;->i(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    goto :goto_4

    .line 254
    :cond_6
    const/4 v14, 0x0

    .line 255
    :cond_7
    :goto_5
    invoke-virtual {v8}, Le1/o;->b()Lcom/google/android/gms/maps/model/LatLng;

    .line 256
    .line 257
    .line 258
    move-result-object v10

    .line 259
    iget-object v15, v9, Le1/p;->e:Lcom/google/android/gms/maps/model/LatLng;

    .line 260
    .line 261
    invoke-virtual {v10, v15}, Lcom/google/android/gms/maps/model/LatLng;->equals(Ljava/lang/Object;)Z

    .line 262
    .line 263
    .line 264
    move-result v10

    .line 265
    if-nez v10, :cond_8

    .line 266
    .line 267
    iget-object v9, v9, Le1/p;->e:Lcom/google/android/gms/maps/model/LatLng;

    .line 268
    .line 269
    invoke-virtual {v8, v9}, Le1/o;->g(Lcom/google/android/gms/maps/model/LatLng;)V

    .line 270
    .line 271
    .line 272
    invoke-virtual {v7}, Ls3/t;->m()Ljava/lang/Float;

    .line 273
    .line 274
    .line 275
    invoke-virtual {v7}, Ls3/t;->m()Ljava/lang/Float;

    .line 276
    .line 277
    .line 278
    move-result-object v9

    .line 279
    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    .line 280
    .line 281
    .line 282
    move-result v9

    .line 283
    invoke-virtual {v8, v9}, Le1/o;->j(F)V

    .line 284
    .line 285
    .line 286
    const/4 v14, 0x1

    .line 287
    :cond_8
    if-eqz v14, :cond_9

    .line 288
    .line 289
    invoke-virtual {v8}, Le1/o;->e()Z

    .line 290
    .line 291
    .line 292
    move-result v9

    .line 293
    if-eqz v9, :cond_9

    .line 294
    .line 295
    invoke-virtual {v8}, Le1/o;->k()V

    .line 296
    .line 297
    .line 298
    :cond_9
    :goto_6
    invoke-virtual {v6, v7, v8}, Lk2/o;->i(Ls3/t;Le1/o;)V

    .line 299
    .line 300
    .line 301
    invoke-interface {v4, v13}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 302
    .line 303
    .line 304
    goto/16 :goto_1

    .line 305
    .line 306
    :cond_a
    return-void

    .line 307
    :cond_b
    iget-object v7, v8, Lk2/e;->b:Ljava/util/HashMap;

    .line 308
    .line 309
    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 310
    .line 311
    .line 312
    move-result-object v7

    .line 313
    check-cast v7, Le1/o;

    .line 314
    .line 315
    if-nez v7, :cond_e

    .line 316
    .line 317
    new-instance v7, Le1/p;

    .line 318
    .line 319
    invoke-direct {v7}, Le1/p;-><init>()V

    .line 320
    .line 321
    .line 322
    if-nez v5, :cond_c

    .line 323
    .line 324
    invoke-interface {v0}, Li2/a;->getPosition()Lcom/google/android/gms/maps/model/LatLng;

    .line 325
    .line 326
    .line 327
    move-result-object v9

    .line 328
    goto :goto_7

    .line 329
    :cond_c
    move-object v9, v5

    .line 330
    :goto_7
    invoke-virtual {v7, v9}, Le1/p;->g(Lcom/google/android/gms/maps/model/LatLng;)V

    .line 331
    .line 332
    .line 333
    invoke-virtual {v6, v0}, Lk2/o;->g(Li2/a;)Le1/c;

    .line 334
    .line 335
    .line 336
    move-result-object v6

    .line 337
    iput-object v6, v7, Le1/p;->h:Le1/c;

    .line 338
    .line 339
    new-instance v6, Ljava/util/ArrayList;

    .line 340
    .line 341
    invoke-interface {v0}, Li2/a;->b()Ljava/util/Collection;

    .line 342
    .line 343
    .line 344
    move-result-object v9

    .line 345
    invoke-direct {v6, v9}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 346
    .line 347
    .line 348
    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    .line 349
    .line 350
    .line 351
    move-result v9

    .line 352
    if-nez v9, :cond_d

    .line 353
    .line 354
    const/4 v9, 0x0

    .line 355
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 356
    .line 357
    .line 358
    move-result-object v6

    .line 359
    check-cast v6, Ls3/t;

    .line 360
    .line 361
    invoke-virtual {v6}, Ls3/t;->m()Ljava/lang/Float;

    .line 362
    .line 363
    .line 364
    move-result-object v6

    .line 365
    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    .line 366
    .line 367
    .line 368
    move-result v6

    .line 369
    iput v6, v7, Le1/p;->r:F

    .line 370
    .line 371
    :cond_d
    iget-object v6, v11, Li2/c;->g:Ll2/a;

    .line 372
    .line 373
    iget-object v9, v6, Ll2/a;->g:Ll2/b;

    .line 374
    .line 375
    iget-object v9, v9, Ll2/b;->f:LB2/a;

    .line 376
    .line 377
    invoke-virtual {v9, v7}, LB2/a;->e(Le1/p;)Le1/o;

    .line 378
    .line 379
    .line 380
    move-result-object v7

    .line 381
    iget-object v9, v6, Ll2/a;->a:Ljava/util/LinkedHashSet;

    .line 382
    .line 383
    invoke-interface {v9, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 384
    .line 385
    .line 386
    iget-object v9, v6, Ll2/a;->b:Ll2/b;

    .line 387
    .line 388
    iget-object v9, v9, Ll2/b;->e:Ljava/util/HashMap;

    .line 389
    .line 390
    invoke-virtual {v9, v7, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 391
    .line 392
    .line 393
    iget-object v6, v8, Lk2/e;->b:Ljava/util/HashMap;

    .line 394
    .line 395
    invoke-virtual {v6, v0, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 396
    .line 397
    .line 398
    iget-object v6, v8, Lk2/e;->c:Ljava/util/HashMap;

    .line 399
    .line 400
    invoke-virtual {v6, v7, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 401
    .line 402
    .line 403
    new-instance v6, Lk2/n;

    .line 404
    .line 405
    invoke-direct {v6, v7}, Lk2/n;-><init>(Le1/o;)V

    .line 406
    .line 407
    .line 408
    if-eqz v5, :cond_f

    .line 409
    .line 410
    invoke-interface {v0}, Li2/a;->getPosition()Lcom/google/android/gms/maps/model/LatLng;

    .line 411
    .line 412
    .line 413
    move-result-object v0

    .line 414
    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 415
    .line 416
    .line 417
    iget-object v1, v1, Lk2/f;->h:Ljava/util/LinkedList;

    .line 418
    .line 419
    new-instance v7, Lk2/l;

    .line 420
    .line 421
    invoke-direct {v7, v2, v6, v5, v0}, Lk2/l;-><init>(Lk2/o;Lk2/n;Lcom/google/android/gms/maps/model/LatLng;Lcom/google/android/gms/maps/model/LatLng;)V

    .line 422
    .line 423
    .line 424
    invoke-virtual {v1, v7}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 425
    .line 426
    .line 427
    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 428
    .line 429
    .line 430
    goto :goto_8

    .line 431
    :cond_e
    new-instance v1, Lk2/n;

    .line 432
    .line 433
    invoke-direct {v1, v7}, Lk2/n;-><init>(Le1/o;)V

    .line 434
    .line 435
    .line 436
    invoke-virtual {v6, v0}, Lk2/o;->g(Li2/a;)Le1/c;

    .line 437
    .line 438
    .line 439
    move-result-object v0

    .line 440
    invoke-virtual {v7, v0}, Le1/o;->f(Le1/c;)V

    .line 441
    .line 442
    .line 443
    move-object v6, v1

    .line 444
    :cond_f
    :goto_8
    invoke-interface {v4, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 445
    .line 446
    .line 447
    return-void
.end method
