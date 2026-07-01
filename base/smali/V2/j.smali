.class public final synthetic LV2/j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Lk3/l;

.field public final synthetic g:LQ2/g;

.field public final synthetic h:LV2/e;


# direct methods
.method public synthetic constructor <init>(LV2/e;Lk3/l;LQ2/g;)V
    .locals 1

    .line 1
    const/4 v0, 0x6

    iput v0, p0, LV2/j;->e:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LV2/j;->h:LV2/e;

    iput-object p2, p0, LV2/j;->f:Lk3/l;

    iput-object p3, p0, LV2/j;->g:LQ2/g;

    return-void
.end method

.method public synthetic constructor <init>(Lk3/l;LQ2/g;LV2/e;I)V
    .locals 0

    .line 2
    iput p4, p0, LV2/j;->e:I

    iput-object p1, p0, LV2/j;->f:Lk3/l;

    iput-object p2, p0, LV2/j;->g:LQ2/g;

    iput-object p3, p0, LV2/j;->h:LV2/e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lk3/l;LV2/e;LQ2/g;)V
    .locals 1

    .line 3
    const/4 v0, 0x3

    iput v0, p0, LV2/j;->e:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LV2/j;->f:Lk3/l;

    iput-object p2, p0, LV2/j;->h:LV2/e;

    iput-object p3, p0, LV2/j;->g:LQ2/g;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 15

    .line 1
    iget v0, p0, LV2/j;->e:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    const/4 v2, 0x2

    .line 5
    const/4 v3, 0x1

    .line 6
    const/4 v4, 0x0

    .line 7
    const/4 v5, 0x0

    .line 8
    iget-object v6, p0, LV2/j;->g:LQ2/g;

    .line 9
    .line 10
    iget-object v7, p0, LV2/j;->f:Lk3/l;

    .line 11
    .line 12
    iget-object v8, p0, LV2/j;->h:LV2/e;

    .line 13
    .line 14
    packed-switch v0, :pswitch_data_0

    .line 15
    .line 16
    .line 17
    sget-object v0, LV2/m;->g:Ljava/util/HashMap;

    .line 18
    .line 19
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 20
    .line 21
    const-string v9, "noResult"

    .line 22
    .line 23
    invoke-virtual {v7, v9}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v9

    .line 27
    invoke-virtual {v0, v9}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v9

    .line 31
    const-string v10, "continueOnError"

    .line 32
    .line 33
    invoke-virtual {v7, v10}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v10

    .line 37
    invoke-virtual {v0, v10}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    const-string v10, "operations"

    .line 42
    .line 43
    invoke-virtual {v7, v10}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v7

    .line 47
    check-cast v7, Ljava/util/List;

    .line 48
    .line 49
    new-instance v10, Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 55
    .line 56
    .line 57
    move-result-object v7

    .line 58
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 59
    .line 60
    .line 61
    move-result v11

    .line 62
    if-eqz v11, :cond_c

    .line 63
    .line 64
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v11

    .line 68
    check-cast v11, Ljava/util/Map;

    .line 69
    .line 70
    new-instance v12, LW2/a;

    .line 71
    .line 72
    invoke-direct {v12, v11, v9}, LW2/a;-><init>(Ljava/util/Map;Z)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v12}, LW2/a;->v()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v11

    .line 79
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v11}, Ljava/lang/String;->hashCode()I

    .line 83
    .line 84
    .line 85
    move-result v13

    .line 86
    const/4 v14, -0x1

    .line 87
    sparse-switch v13, :sswitch_data_0

    .line 88
    .line 89
    .line 90
    goto :goto_1

    .line 91
    :sswitch_0
    const-string v13, "query"

    .line 92
    .line 93
    invoke-virtual {v11, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v13

    .line 97
    if-nez v13, :cond_0

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_0
    move v14, v1

    .line 101
    goto :goto_1

    .line 102
    :sswitch_1
    const-string v13, "update"

    .line 103
    .line 104
    invoke-virtual {v11, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v13

    .line 108
    if-nez v13, :cond_1

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_1
    move v14, v2

    .line 112
    goto :goto_1

    .line 113
    :sswitch_2
    const-string v13, "insert"

    .line 114
    .line 115
    invoke-virtual {v11, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v13

    .line 119
    if-nez v13, :cond_2

    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_2
    move v14, v3

    .line 123
    goto :goto_1

    .line 124
    :sswitch_3
    const-string v13, "execute"

    .line 125
    .line 126
    invoke-virtual {v11, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result v13

    .line 130
    if-nez v13, :cond_3

    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_3
    move v14, v4

    .line 134
    :goto_1
    iget-object v13, v12, LW2/a;->k:LV1/y;

    .line 135
    .line 136
    packed-switch v14, :pswitch_data_1

    .line 137
    .line 138
    .line 139
    const-string v0, "Batch method \'"

    .line 140
    .line 141
    const-string v1, "\' not supported"

    .line 142
    .line 143
    invoke-static {v0, v11, v1}, Lr/a;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    const-string v1, "bad_param"

    .line 148
    .line 149
    invoke-virtual {v6, v1, v0, v5}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 150
    .line 151
    .line 152
    goto/16 :goto_2

    .line 153
    .line 154
    :pswitch_0
    invoke-virtual {v8, v12}, LV2/e;->f(LT0/a;)Z

    .line 155
    .line 156
    .line 157
    move-result v11

    .line 158
    if-eqz v11, :cond_4

    .line 159
    .line 160
    invoke-virtual {v12, v10}, LW2/a;->S(Ljava/util/ArrayList;)V

    .line 161
    .line 162
    .line 163
    goto :goto_0

    .line 164
    :cond_4
    if-eqz v0, :cond_5

    .line 165
    .line 166
    invoke-virtual {v12, v10}, LW2/a;->R(Ljava/util/ArrayList;)V

    .line 167
    .line 168
    .line 169
    goto :goto_0

    .line 170
    :cond_5
    iget-object v0, v13, LV1/y;->f:Ljava/lang/Object;

    .line 171
    .line 172
    check-cast v0, Ljava/lang/String;

    .line 173
    .line 174
    iget-object v1, v13, LV1/y;->h:Ljava/lang/Object;

    .line 175
    .line 176
    check-cast v1, Ljava/lang/String;

    .line 177
    .line 178
    iget-object v2, v13, LV1/y;->i:Ljava/lang/Object;

    .line 179
    .line 180
    invoke-virtual {v6, v0, v1, v2}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 181
    .line 182
    .line 183
    goto/16 :goto_2

    .line 184
    .line 185
    :pswitch_1
    invoke-virtual {v8, v12}, LV2/e;->g(LT0/a;)Z

    .line 186
    .line 187
    .line 188
    move-result v11

    .line 189
    if-eqz v11, :cond_6

    .line 190
    .line 191
    invoke-virtual {v12, v10}, LW2/a;->S(Ljava/util/ArrayList;)V

    .line 192
    .line 193
    .line 194
    goto/16 :goto_0

    .line 195
    .line 196
    :cond_6
    if-eqz v0, :cond_7

    .line 197
    .line 198
    invoke-virtual {v12, v10}, LW2/a;->R(Ljava/util/ArrayList;)V

    .line 199
    .line 200
    .line 201
    goto/16 :goto_0

    .line 202
    .line 203
    :cond_7
    iget-object v0, v13, LV1/y;->f:Ljava/lang/Object;

    .line 204
    .line 205
    check-cast v0, Ljava/lang/String;

    .line 206
    .line 207
    iget-object v1, v13, LV1/y;->h:Ljava/lang/Object;

    .line 208
    .line 209
    check-cast v1, Ljava/lang/String;

    .line 210
    .line 211
    iget-object v2, v13, LV1/y;->i:Ljava/lang/Object;

    .line 212
    .line 213
    invoke-virtual {v6, v0, v1, v2}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 214
    .line 215
    .line 216
    goto :goto_2

    .line 217
    :pswitch_2
    invoke-virtual {v8, v12}, LV2/e;->e(LT0/a;)Z

    .line 218
    .line 219
    .line 220
    move-result v11

    .line 221
    if-eqz v11, :cond_8

    .line 222
    .line 223
    invoke-virtual {v12, v10}, LW2/a;->S(Ljava/util/ArrayList;)V

    .line 224
    .line 225
    .line 226
    goto/16 :goto_0

    .line 227
    .line 228
    :cond_8
    if-eqz v0, :cond_9

    .line 229
    .line 230
    invoke-virtual {v12, v10}, LW2/a;->R(Ljava/util/ArrayList;)V

    .line 231
    .line 232
    .line 233
    goto/16 :goto_0

    .line 234
    .line 235
    :cond_9
    iget-object v0, v13, LV1/y;->f:Ljava/lang/Object;

    .line 236
    .line 237
    check-cast v0, Ljava/lang/String;

    .line 238
    .line 239
    iget-object v1, v13, LV1/y;->h:Ljava/lang/Object;

    .line 240
    .line 241
    check-cast v1, Ljava/lang/String;

    .line 242
    .line 243
    iget-object v2, v13, LV1/y;->i:Ljava/lang/Object;

    .line 244
    .line 245
    invoke-virtual {v6, v0, v1, v2}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 246
    .line 247
    .line 248
    goto :goto_2

    .line 249
    :pswitch_3
    invoke-virtual {v8, v12}, LV2/e;->h(LT0/a;)Z

    .line 250
    .line 251
    .line 252
    move-result v11

    .line 253
    if-nez v11, :cond_b

    .line 254
    .line 255
    if-eqz v0, :cond_a

    .line 256
    .line 257
    invoke-virtual {v12, v10}, LW2/a;->R(Ljava/util/ArrayList;)V

    .line 258
    .line 259
    .line 260
    goto/16 :goto_0

    .line 261
    .line 262
    :cond_a
    iget-object v0, v13, LV1/y;->f:Ljava/lang/Object;

    .line 263
    .line 264
    check-cast v0, Ljava/lang/String;

    .line 265
    .line 266
    iget-object v1, v13, LV1/y;->h:Ljava/lang/Object;

    .line 267
    .line 268
    check-cast v1, Ljava/lang/String;

    .line 269
    .line 270
    iget-object v2, v13, LV1/y;->i:Ljava/lang/Object;

    .line 271
    .line 272
    invoke-virtual {v6, v0, v1, v2}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 273
    .line 274
    .line 275
    goto :goto_2

    .line 276
    :cond_b
    invoke-virtual {v12, v5}, LT0/a;->a(Ljava/lang/Object;)V

    .line 277
    .line 278
    .line 279
    invoke-virtual {v12, v10}, LW2/a;->S(Ljava/util/ArrayList;)V

    .line 280
    .line 281
    .line 282
    goto/16 :goto_0

    .line 283
    .line 284
    :cond_c
    if-eqz v9, :cond_d

    .line 285
    .line 286
    invoke-virtual {v6, v5}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 287
    .line 288
    .line 289
    goto :goto_2

    .line 290
    :cond_d
    invoke-virtual {v6, v10}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 291
    .line 292
    .line 293
    :goto_2
    return-void

    .line 294
    :pswitch_4
    sget-object v0, LV2/m;->g:Ljava/util/HashMap;

    .line 295
    .line 296
    new-instance v0, LW2/c;

    .line 297
    .line 298
    invoke-direct {v0, v7, v6}, LW2/c;-><init>(Lk3/l;Lk3/n;)V

    .line 299
    .line 300
    .line 301
    new-instance v1, LV2/b;

    .line 302
    .line 303
    invoke-direct {v1, v8, v0, v2}, LV2/b;-><init>(LV2/e;LW2/c;I)V

    .line 304
    .line 305
    .line 306
    invoke-virtual {v8, v0, v1}, LV2/e;->m(LW2/c;Ljava/lang/Runnable;)V

    .line 307
    .line 308
    .line 309
    return-void

    .line 310
    :pswitch_5
    sget-object v0, LV2/m;->g:Ljava/util/HashMap;

    .line 311
    .line 312
    new-instance v0, LW2/c;

    .line 313
    .line 314
    invoke-direct {v0, v7, v6}, LW2/c;-><init>(Lk3/l;Lk3/n;)V

    .line 315
    .line 316
    .line 317
    new-instance v1, LV2/b;

    .line 318
    .line 319
    const/4 v2, 0x4

    .line 320
    invoke-direct {v1, v8, v0, v2}, LV2/b;-><init>(LV2/e;LW2/c;I)V

    .line 321
    .line 322
    .line 323
    invoke-virtual {v8, v0, v1}, LV2/e;->m(LW2/c;Ljava/lang/Runnable;)V

    .line 324
    .line 325
    .line 326
    return-void

    .line 327
    :pswitch_6
    sget-object v0, LV2/m;->g:Ljava/util/HashMap;

    .line 328
    .line 329
    const-string v0, "locale"

    .line 330
    .line 331
    invoke-virtual {v7, v0}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 332
    .line 333
    .line 334
    move-result-object v0

    .line 335
    check-cast v0, Ljava/lang/String;

    .line 336
    .line 337
    :try_start_0
    iget-object v1, v8, LV2/e;->i:Landroid/database/sqlite/SQLiteDatabase;

    .line 338
    .line 339
    invoke-static {v0}, Ljava/util/Locale;->forLanguageTag(Ljava/lang/String;)Ljava/util/Locale;

    .line 340
    .line 341
    .line 342
    move-result-object v0

    .line 343
    invoke-virtual {v1, v0}, Landroid/database/sqlite/SQLiteDatabase;->setLocale(Ljava/util/Locale;)V

    .line 344
    .line 345
    .line 346
    invoke-virtual {v6, v5}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 347
    .line 348
    .line 349
    goto :goto_3

    .line 350
    :catch_0
    move-exception v0

    .line 351
    new-instance v1, Ljava/lang/StringBuilder;

    .line 352
    .line 353
    const-string v2, "Error calling setLocale: "

    .line 354
    .line 355
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 356
    .line 357
    .line 358
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v0

    .line 362
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    .line 364
    .line 365
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 366
    .line 367
    .line 368
    move-result-object v0

    .line 369
    const-string v1, "sqlite_error"

    .line 370
    .line 371
    invoke-virtual {v6, v1, v0, v5}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 372
    .line 373
    .line 374
    :goto_3
    return-void

    .line 375
    :pswitch_7
    sget-object v0, LV2/m;->g:Ljava/util/HashMap;

    .line 376
    .line 377
    new-instance v0, LW2/c;

    .line 378
    .line 379
    invoke-direct {v0, v7, v6}, LW2/c;-><init>(Lk3/l;Lk3/n;)V

    .line 380
    .line 381
    .line 382
    new-instance v1, LV2/b;

    .line 383
    .line 384
    invoke-direct {v1, v8, v0, v3}, LV2/b;-><init>(LV2/e;LW2/c;I)V

    .line 385
    .line 386
    .line 387
    invoke-virtual {v8, v0, v1}, LV2/e;->m(LW2/c;Ljava/lang/Runnable;)V

    .line 388
    .line 389
    .line 390
    return-void

    .line 391
    :pswitch_8
    sget-object v0, LV2/m;->g:Ljava/util/HashMap;

    .line 392
    .line 393
    new-instance v0, LW2/c;

    .line 394
    .line 395
    invoke-direct {v0, v7, v6}, LW2/c;-><init>(Lk3/l;Lk3/n;)V

    .line 396
    .line 397
    .line 398
    new-instance v2, LV2/b;

    .line 399
    .line 400
    invoke-direct {v2, v8, v0, v1}, LV2/b;-><init>(LV2/e;LW2/c;I)V

    .line 401
    .line 402
    .line 403
    invoke-virtual {v8, v0, v2}, LV2/e;->m(LW2/c;Ljava/lang/Runnable;)V

    .line 404
    .line 405
    .line 406
    return-void

    .line 407
    :pswitch_9
    sget-object v0, LV2/m;->g:Ljava/util/HashMap;

    .line 408
    .line 409
    new-instance v0, LW2/c;

    .line 410
    .line 411
    invoke-direct {v0, v7, v6}, LW2/c;-><init>(Lk3/l;Lk3/n;)V

    .line 412
    .line 413
    .line 414
    new-instance v1, LV2/b;

    .line 415
    .line 416
    invoke-direct {v1, v8, v0, v4}, LV2/b;-><init>(LV2/e;LW2/c;I)V

    .line 417
    .line 418
    .line 419
    invoke-virtual {v8, v0, v1}, LV2/e;->m(LW2/c;Ljava/lang/Runnable;)V

    .line 420
    .line 421
    .line 422
    return-void

    .line 423
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch

    .line 424
    .line 425
    .line 426
    .line 427
    .line 428
    .line 429
    .line 430
    .line 431
    .line 432
    .line 433
    .line 434
    .line 435
    .line 436
    .line 437
    .line 438
    .line 439
    :sswitch_data_0
    .sparse-switch
        -0x4ea7088b -> :sswitch_3
        -0x468f3d47 -> :sswitch_2
        -0x31ffc737 -> :sswitch_1
        0x66f18c8 -> :sswitch_0
    .end sparse-switch

    .line 440
    .line 441
    .line 442
    .line 443
    .line 444
    .line 445
    .line 446
    .line 447
    .line 448
    .line 449
    .line 450
    .line 451
    .line 452
    .line 453
    .line 454
    .line 455
    .line 456
    .line 457
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
