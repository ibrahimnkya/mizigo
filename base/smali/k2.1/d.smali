.class public final Lk2/d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Li2/a;

.field public final b:Ljava/util/Set;

.field public final c:Lcom/google/android/gms/maps/model/LatLng;

.field public final synthetic d:Lk2/j;


# direct methods
.method public constructor <init>(Lk2/j;Li2/a;Ljava/util/Set;Lcom/google/android/gms/maps/model/LatLng;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lk2/d;->d:Lk2/j;

    .line 5
    .line 6
    iput-object p2, p0, Lk2/d;->a:Li2/a;

    .line 7
    .line 8
    iput-object p3, p0, Lk2/d;->b:Ljava/util/Set;

    .line 9
    .line 10
    iput-object p4, p0, Lk2/d;->c:Lcom/google/android/gms/maps/model/LatLng;

    .line 11
    .line 12
    return-void
.end method

.method public static a(Lk2/d;Lk2/f;)V
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
    check-cast v2, Lk2/j;

    .line 8
    .line 9
    iget-object v3, v1, Lk2/f;->b:Ljava/util/concurrent/locks/ReentrantLock;

    .line 10
    .line 11
    iget-object v4, v0, Lk2/d;->b:Ljava/util/Set;

    .line 12
    .line 13
    iget-object v5, v0, Lk2/d;->c:Lcom/google/android/gms/maps/model/LatLng;

    .line 14
    .line 15
    iget-object v6, v0, Lk2/d;->d:Lk2/j;

    .line 16
    .line 17
    iget-object v0, v0, Lk2/d;->a:Li2/a;

    .line 18
    .line 19
    invoke-interface {v0}, Li2/a;->c()I

    .line 20
    .line 21
    .line 22
    move-result v7

    .line 23
    iget v8, v6, Lk2/j;->k:I

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
    iget-object v8, v6, Lk2/j;->m:Lk2/e;

    .line 31
    .line 32
    iget-object v11, v6, Lk2/j;->c:Li2/c;

    .line 33
    .line 34
    iget-object v12, v6, Lk2/j;->j:Lk2/e;

    .line 35
    .line 36
    if-nez v7, :cond_c

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
    if-eqz v7, :cond_b

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
    check-cast v8, Le1/a;

    .line 67
    .line 68
    if-nez v8, :cond_2

    .line 69
    .line 70
    new-instance v8, Le1/b;

    .line 71
    .line 72
    invoke-direct {v8}, Le1/p;-><init>()V

    .line 73
    .line 74
    .line 75
    if-eqz v5, :cond_1

    .line 76
    .line 77
    invoke-virtual {v8, v5}, Le1/b;->m(Lcom/google/android/gms/maps/model/LatLng;)V

    .line 78
    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_1
    iget-object v13, v7, Ls3/t;->a:Le1/p;

    .line 82
    .line 83
    iget-object v13, v13, Le1/p;->e:Lcom/google/android/gms/maps/model/LatLng;

    .line 84
    .line 85
    invoke-virtual {v8, v13}, Le1/b;->m(Lcom/google/android/gms/maps/model/LatLng;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v7}, Ls3/t;->m()Ljava/lang/Float;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v7}, Ls3/t;->m()Ljava/lang/Float;

    .line 92
    .line 93
    .line 94
    move-result-object v13

    .line 95
    invoke-virtual {v13}, Ljava/lang/Float;->floatValue()F

    .line 96
    .line 97
    .line 98
    move-result v13

    .line 99
    iput v13, v8, Le1/p;->r:F

    .line 100
    .line 101
    :goto_2
    invoke-virtual {v7, v8}, Ls3/t;->n(Le1/p;)V

    .line 102
    .line 103
    .line 104
    iget-object v13, v11, Li2/c;->f:Ll2/a;

    .line 105
    .line 106
    iget-object v14, v13, Ll2/a;->g:Ll2/b;

    .line 107
    .line 108
    iget-object v14, v14, Ll2/b;->f:LB2/a;

    .line 109
    .line 110
    invoke-virtual {v14, v8}, LB2/a;->e(Le1/p;)Le1/o;

    .line 111
    .line 112
    .line 113
    move-result-object v8

    .line 114
    iget-object v14, v13, Ll2/a;->a:Ljava/util/LinkedHashSet;

    .line 115
    .line 116
    invoke-interface {v14, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    iget-object v14, v13, Ll2/a;->b:Ll2/b;

    .line 120
    .line 121
    iget-object v14, v14, Ll2/b;->e:Ljava/util/HashMap;

    .line 122
    .line 123
    invoke-virtual {v14, v8, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    check-cast v8, Le1/a;

    .line 127
    .line 128
    new-instance v13, Lk2/g;

    .line 129
    .line 130
    invoke-direct {v13, v8}, Lk2/g;-><init>(Le1/a;)V

    .line 131
    .line 132
    .line 133
    iget-object v14, v12, Lk2/e;->b:Ljava/util/HashMap;

    .line 134
    .line 135
    invoke-virtual {v14, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    iget-object v14, v12, Lk2/e;->c:Ljava/util/HashMap;

    .line 139
    .line 140
    invoke-virtual {v14, v8, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    if-eqz v5, :cond_9

    .line 144
    .line 145
    iget-object v14, v7, Ls3/t;->a:Le1/p;

    .line 146
    .line 147
    iget-object v14, v14, Le1/p;->e:Lcom/google/android/gms/maps/model/LatLng;

    .line 148
    .line 149
    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 150
    .line 151
    .line 152
    iget-object v15, v1, Lk2/f;->h:Ljava/util/LinkedList;

    .line 153
    .line 154
    new-instance v9, Lk2/c;

    .line 155
    .line 156
    invoke-direct {v9, v2, v13, v5, v14}, Lk2/c;-><init>(Lk2/j;Lk2/g;Lcom/google/android/gms/maps/model/LatLng;Lcom/google/android/gms/maps/model/LatLng;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v15, v9}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 163
    .line 164
    .line 165
    goto/16 :goto_6

    .line 166
    .line 167
    :cond_2
    new-instance v13, Lk2/g;

    .line 168
    .line 169
    invoke-direct {v13, v8}, Lk2/g;-><init>(Le1/a;)V

    .line 170
    .line 171
    .line 172
    iget-object v9, v7, Ls3/t;->a:Le1/p;

    .line 173
    .line 174
    iget-object v14, v9, Le1/p;->f:Ljava/lang/String;

    .line 175
    .line 176
    if-eqz v14, :cond_4

    .line 177
    .line 178
    iget-object v15, v9, Le1/p;->g:Ljava/lang/String;

    .line 179
    .line 180
    if-eqz v15, :cond_4

    .line 181
    .line 182
    invoke-virtual {v8}, Le1/o;->d()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v15

    .line 186
    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result v14

    .line 190
    if-nez v14, :cond_3

    .line 191
    .line 192
    iget-object v14, v9, Le1/p;->f:Ljava/lang/String;

    .line 193
    .line 194
    invoke-virtual {v8, v14}, Le1/o;->i(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    const/4 v14, 0x1

    .line 198
    goto :goto_3

    .line 199
    :cond_3
    const/4 v14, 0x0

    .line 200
    :goto_3
    iget-object v15, v9, Le1/p;->g:Ljava/lang/String;

    .line 201
    .line 202
    invoke-virtual {v8}, Le1/o;->c()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v10

    .line 206
    invoke-virtual {v15, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    move-result v10

    .line 210
    if-nez v10, :cond_7

    .line 211
    .line 212
    iget-object v10, v9, Le1/p;->g:Ljava/lang/String;

    .line 213
    .line 214
    invoke-virtual {v8, v10}, Le1/o;->h(Ljava/lang/String;)V

    .line 215
    .line 216
    .line 217
    :goto_4
    const/4 v14, 0x1

    .line 218
    goto :goto_5

    .line 219
    :cond_4
    iget-object v10, v9, Le1/p;->g:Ljava/lang/String;

    .line 220
    .line 221
    if-eqz v10, :cond_5

    .line 222
    .line 223
    invoke-virtual {v8}, Le1/o;->d()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v14

    .line 227
    invoke-virtual {v10, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    move-result v10

    .line 231
    if-nez v10, :cond_5

    .line 232
    .line 233
    iget-object v10, v9, Le1/p;->g:Ljava/lang/String;

    .line 234
    .line 235
    invoke-virtual {v8, v10}, Le1/o;->i(Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    goto :goto_4

    .line 239
    :cond_5
    iget-object v10, v9, Le1/p;->f:Ljava/lang/String;

    .line 240
    .line 241
    if-eqz v10, :cond_6

    .line 242
    .line 243
    invoke-virtual {v8}, Le1/o;->d()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v14

    .line 247
    invoke-virtual {v10, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    move-result v10

    .line 251
    if-nez v10, :cond_6

    .line 252
    .line 253
    iget-object v10, v9, Le1/p;->f:Ljava/lang/String;

    .line 254
    .line 255
    invoke-virtual {v8, v10}, Le1/o;->i(Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    goto :goto_4

    .line 259
    :cond_6
    const/4 v14, 0x0

    .line 260
    :cond_7
    :goto_5
    invoke-virtual {v8}, Le1/o;->b()Lcom/google/android/gms/maps/model/LatLng;

    .line 261
    .line 262
    .line 263
    move-result-object v10

    .line 264
    iget-object v15, v9, Le1/p;->e:Lcom/google/android/gms/maps/model/LatLng;

    .line 265
    .line 266
    invoke-virtual {v10, v15}, Lcom/google/android/gms/maps/model/LatLng;->equals(Ljava/lang/Object;)Z

    .line 267
    .line 268
    .line 269
    move-result v10

    .line 270
    if-nez v10, :cond_8

    .line 271
    .line 272
    iget-object v9, v9, Le1/p;->e:Lcom/google/android/gms/maps/model/LatLng;

    .line 273
    .line 274
    invoke-virtual {v8, v9}, Le1/o;->g(Lcom/google/android/gms/maps/model/LatLng;)V

    .line 275
    .line 276
    .line 277
    invoke-virtual {v7}, Ls3/t;->m()Ljava/lang/Float;

    .line 278
    .line 279
    .line 280
    invoke-virtual {v7}, Ls3/t;->m()Ljava/lang/Float;

    .line 281
    .line 282
    .line 283
    move-result-object v9

    .line 284
    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    .line 285
    .line 286
    .line 287
    move-result v9

    .line 288
    invoke-virtual {v8, v9}, Le1/o;->j(F)V

    .line 289
    .line 290
    .line 291
    const/4 v14, 0x1

    .line 292
    :cond_8
    if-eqz v14, :cond_9

    .line 293
    .line 294
    invoke-virtual {v8}, Le1/o;->e()Z

    .line 295
    .line 296
    .line 297
    move-result v9

    .line 298
    if-eqz v9, :cond_9

    .line 299
    .line 300
    invoke-virtual {v8}, Le1/o;->k()V

    .line 301
    .line 302
    .line 303
    :cond_9
    :goto_6
    move-object v9, v6

    .line 304
    check-cast v9, Ls3/e;

    .line 305
    .line 306
    iget-object v9, v9, Ls3/e;->t:Ls3/g;

    .line 307
    .line 308
    iget-object v9, v9, Ls3/g;->l:Ls3/j;

    .line 309
    .line 310
    if-eqz v9, :cond_a

    .line 311
    .line 312
    iget-object v9, v9, Ls3/j;->w:Ls3/w;

    .line 313
    .line 314
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 315
    .line 316
    .line 317
    iget-object v10, v7, Ls3/t;->d:Ljava/lang/String;

    .line 318
    .line 319
    iget-object v14, v9, Ls3/w;->a:Ljava/util/HashMap;

    .line 320
    .line 321
    invoke-virtual {v14, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 322
    .line 323
    .line 324
    move-result-object v10

    .line 325
    if-ne v10, v7, :cond_a

    .line 326
    .line 327
    iget-object v10, v7, Ls3/t;->d:Ljava/lang/String;

    .line 328
    .line 329
    iget-boolean v7, v7, Ls3/t;->e:Z

    .line 330
    .line 331
    new-instance v14, Ls3/u;

    .line 332
    .line 333
    invoke-direct {v14, v8, v7}, Ls3/u;-><init>(Le1/o;Z)V

    .line 334
    .line 335
    .line 336
    iget-object v7, v9, Ls3/w;->b:Ljava/util/HashMap;

    .line 337
    .line 338
    invoke-virtual {v7, v10, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 339
    .line 340
    .line 341
    iget-object v7, v9, Ls3/w;->c:Ljava/util/HashMap;

    .line 342
    .line 343
    invoke-virtual {v8}, Le1/o;->a()Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object v8

    .line 347
    invoke-virtual {v7, v8, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 348
    .line 349
    .line 350
    :cond_a
    invoke-interface {v4, v13}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 351
    .line 352
    .line 353
    goto/16 :goto_1

    .line 354
    .line 355
    :cond_b
    return-void

    .line 356
    :cond_c
    iget-object v7, v8, Lk2/e;->b:Ljava/util/HashMap;

    .line 357
    .line 358
    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 359
    .line 360
    .line 361
    move-result-object v7

    .line 362
    check-cast v7, Le1/o;

    .line 363
    .line 364
    check-cast v7, Le1/a;

    .line 365
    .line 366
    if-nez v7, :cond_e

    .line 367
    .line 368
    new-instance v7, Le1/b;

    .line 369
    .line 370
    invoke-direct {v7}, Le1/p;-><init>()V

    .line 371
    .line 372
    .line 373
    if-nez v5, :cond_d

    .line 374
    .line 375
    invoke-interface {v0}, Li2/a;->getPosition()Lcom/google/android/gms/maps/model/LatLng;

    .line 376
    .line 377
    .line 378
    move-result-object v9

    .line 379
    goto :goto_7

    .line 380
    :cond_d
    move-object v9, v5

    .line 381
    :goto_7
    invoke-virtual {v7, v9}, Le1/b;->m(Lcom/google/android/gms/maps/model/LatLng;)V

    .line 382
    .line 383
    .line 384
    invoke-virtual {v6, v0}, Lk2/j;->g(Li2/a;)Le1/c;

    .line 385
    .line 386
    .line 387
    move-result-object v6

    .line 388
    iput-object v6, v7, Le1/p;->h:Le1/c;

    .line 389
    .line 390
    iget-object v6, v11, Li2/c;->g:Ll2/a;

    .line 391
    .line 392
    iget-object v9, v6, Ll2/a;->g:Ll2/b;

    .line 393
    .line 394
    iget-object v9, v9, Ll2/b;->f:LB2/a;

    .line 395
    .line 396
    invoke-virtual {v9, v7}, LB2/a;->e(Le1/p;)Le1/o;

    .line 397
    .line 398
    .line 399
    move-result-object v7

    .line 400
    iget-object v9, v6, Ll2/a;->a:Ljava/util/LinkedHashSet;

    .line 401
    .line 402
    invoke-interface {v9, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 403
    .line 404
    .line 405
    iget-object v9, v6, Ll2/a;->b:Ll2/b;

    .line 406
    .line 407
    iget-object v9, v9, Ll2/b;->e:Ljava/util/HashMap;

    .line 408
    .line 409
    invoke-virtual {v9, v7, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 410
    .line 411
    .line 412
    check-cast v7, Le1/a;

    .line 413
    .line 414
    iget-object v6, v8, Lk2/e;->b:Ljava/util/HashMap;

    .line 415
    .line 416
    invoke-virtual {v6, v0, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    .line 418
    .line 419
    iget-object v6, v8, Lk2/e;->c:Ljava/util/HashMap;

    .line 420
    .line 421
    invoke-virtual {v6, v7, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 422
    .line 423
    .line 424
    new-instance v6, Lk2/g;

    .line 425
    .line 426
    invoke-direct {v6, v7}, Lk2/g;-><init>(Le1/a;)V

    .line 427
    .line 428
    .line 429
    if-eqz v5, :cond_f

    .line 430
    .line 431
    invoke-interface {v0}, Li2/a;->getPosition()Lcom/google/android/gms/maps/model/LatLng;

    .line 432
    .line 433
    .line 434
    move-result-object v0

    .line 435
    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 436
    .line 437
    .line 438
    iget-object v1, v1, Lk2/f;->h:Ljava/util/LinkedList;

    .line 439
    .line 440
    new-instance v7, Lk2/c;

    .line 441
    .line 442
    invoke-direct {v7, v2, v6, v5, v0}, Lk2/c;-><init>(Lk2/j;Lk2/g;Lcom/google/android/gms/maps/model/LatLng;Lcom/google/android/gms/maps/model/LatLng;)V

    .line 443
    .line 444
    .line 445
    invoke-virtual {v1, v7}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 446
    .line 447
    .line 448
    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 449
    .line 450
    .line 451
    goto :goto_8

    .line 452
    :cond_e
    new-instance v1, Lk2/g;

    .line 453
    .line 454
    invoke-direct {v1, v7}, Lk2/g;-><init>(Le1/a;)V

    .line 455
    .line 456
    .line 457
    invoke-virtual {v6, v0}, Lk2/j;->g(Li2/a;)Le1/c;

    .line 458
    .line 459
    .line 460
    move-result-object v0

    .line 461
    invoke-virtual {v7, v0}, Le1/o;->f(Le1/c;)V

    .line 462
    .line 463
    .line 464
    move-object v6, v1

    .line 465
    :cond_f
    :goto_8
    invoke-interface {v4, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 466
    .line 467
    .line 468
    return-void
.end method
