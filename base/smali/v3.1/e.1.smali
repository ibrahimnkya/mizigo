.class public final synthetic Lv3/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lk3/b;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Lv3/g;


# direct methods
.method public synthetic constructor <init>(Lv3/g;I)V
    .locals 0

    .line 1
    iput p2, p0, Lv3/e;->e:I

    iput-object p1, p0, Lv3/e;->f:Lv3/g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;LZ2/s;)V
    .locals 5

    .line 1
    iget v0, p0, Lv3/e;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lv3/e;->f:Lv3/g;

    .line 7
    .line 8
    const-string v1, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>"

    .line 9
    .line 10
    invoke-static {p1, v1}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    check-cast p1, Ljava/util/List;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-string v2, "null cannot be cast to non-null type kotlin.String"

    .line 21
    .line 22
    invoke-static {v1, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    check-cast v1, Ljava/lang/String;

    .line 26
    .line 27
    const/4 v2, 0x1

    .line 28
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    const-string v3, "null cannot be cast to non-null type kotlin.Double"

    .line 33
    .line 34
    invoke-static {v2, v3}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    check-cast v2, Ljava/lang/Double;

    .line 38
    .line 39
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    .line 40
    .line 41
    .line 42
    move-result-wide v2

    .line 43
    const/4 v4, 0x2

    .line 44
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const-string v4, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions"

    .line 49
    .line 50
    invoke-static {p1, v4}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    check-cast p1, Lv3/h;

    .line 54
    .line 55
    :try_start_0
    invoke-interface {v0, v1, v2, v3, p1}, Lv3/g;->q(Ljava/lang/String;DLv3/h;)V

    .line 56
    .line 57
    .line 58
    const/4 p1, 0x0

    .line 59
    invoke-static {p1}, LT0/a;->C(Ljava/lang/Object;)Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    goto :goto_0

    .line 64
    :catchall_0
    move-exception p1

    .line 65
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    new-instance v3, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    const-string v4, "Cause: "

    .line 88
    .line 89
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    const-string v2, ", Stacktrace: "

    .line 96
    .line 97
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    filled-new-array {v0, v1, p1}, [Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-static {p1}, Lz3/e;->S([Ljava/lang/Object;)Ljava/util/List;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    :goto_0
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :pswitch_0
    iget-object v0, p0, Lv3/e;->f:Lv3/g;

    .line 120
    .line 121
    const-string v1, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>"

    .line 122
    .line 123
    invoke-static {p1, v1}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    check-cast p1, Ljava/util/List;

    .line 127
    .line 128
    const/4 v1, 0x0

    .line 129
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    const-string v2, "null cannot be cast to non-null type kotlin.String"

    .line 134
    .line 135
    invoke-static {v1, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    check-cast v1, Ljava/lang/String;

    .line 139
    .line 140
    const/4 v2, 0x1

    .line 141
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    const-string v3, "null cannot be cast to non-null type kotlin.Long"

    .line 146
    .line 147
    invoke-static {v2, v3}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    check-cast v2, Ljava/lang/Long;

    .line 151
    .line 152
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 153
    .line 154
    .line 155
    move-result-wide v2

    .line 156
    const/4 v4, 0x2

    .line 157
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    const-string v4, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions"

    .line 162
    .line 163
    invoke-static {p1, v4}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    check-cast p1, Lv3/h;

    .line 167
    .line 168
    :try_start_1
    invoke-interface {v0, v1, v2, v3, p1}, Lv3/g;->d(Ljava/lang/String;JLv3/h;)V

    .line 169
    .line 170
    .line 171
    const/4 p1, 0x0

    .line 172
    invoke-static {p1}, LT0/a;->C(Ljava/lang/Object;)Ljava/util/List;

    .line 173
    .line 174
    .line 175
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 176
    goto :goto_1

    .line 177
    :catchall_1
    move-exception p1

    .line 178
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    new-instance v3, Ljava/lang/StringBuilder;

    .line 199
    .line 200
    const-string v4, "Cause: "

    .line 201
    .line 202
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    const-string v2, ", Stacktrace: "

    .line 209
    .line 210
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    filled-new-array {v0, v1, p1}, [Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    invoke-static {p1}, Lz3/e;->S([Ljava/lang/Object;)Ljava/util/List;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    :goto_1
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 229
    .line 230
    .line 231
    return-void

    .line 232
    :pswitch_1
    iget-object v0, p0, Lv3/e;->f:Lv3/g;

    .line 233
    .line 234
    const-string v1, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>"

    .line 235
    .line 236
    invoke-static {p1, v1}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    check-cast p1, Ljava/util/List;

    .line 240
    .line 241
    const/4 v1, 0x0

    .line 242
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    move-result-object v1

    .line 246
    const-string v2, "null cannot be cast to non-null type kotlin.String"

    .line 247
    .line 248
    invoke-static {v1, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    check-cast v1, Ljava/lang/String;

    .line 252
    .line 253
    const/4 v3, 0x1

    .line 254
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 255
    .line 256
    .line 257
    move-result-object v3

    .line 258
    invoke-static {v3, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    check-cast v3, Ljava/lang/String;

    .line 262
    .line 263
    const/4 v2, 0x2

    .line 264
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 265
    .line 266
    .line 267
    move-result-object p1

    .line 268
    const-string v2, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions"

    .line 269
    .line 270
    invoke-static {p1, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    check-cast p1, Lv3/h;

    .line 274
    .line 275
    :try_start_2
    invoke-interface {v0, v1, v3, p1}, Lv3/g;->l(Ljava/lang/String;Ljava/lang/String;Lv3/h;)V

    .line 276
    .line 277
    .line 278
    const/4 p1, 0x0

    .line 279
    invoke-static {p1}, LT0/a;->C(Ljava/lang/Object;)Ljava/util/List;

    .line 280
    .line 281
    .line 282
    move-result-object p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 283
    goto :goto_2

    .line 284
    :catchall_2
    move-exception p1

    .line 285
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object v0

    .line 293
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object v1

    .line 297
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 298
    .line 299
    .line 300
    move-result-object v2

    .line 301
    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    new-instance v3, Ljava/lang/StringBuilder;

    .line 306
    .line 307
    const-string v4, "Cause: "

    .line 308
    .line 309
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 310
    .line 311
    .line 312
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 313
    .line 314
    .line 315
    const-string v2, ", Stacktrace: "

    .line 316
    .line 317
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 318
    .line 319
    .line 320
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 321
    .line 322
    .line 323
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 324
    .line 325
    .line 326
    move-result-object p1

    .line 327
    filled-new-array {v0, v1, p1}, [Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object p1

    .line 331
    invoke-static {p1}, Lz3/e;->S([Ljava/lang/Object;)Ljava/util/List;

    .line 332
    .line 333
    .line 334
    move-result-object p1

    .line 335
    :goto_2
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 336
    .line 337
    .line 338
    return-void

    .line 339
    :pswitch_2
    iget-object v0, p0, Lv3/e;->f:Lv3/g;

    .line 340
    .line 341
    const-string v1, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>"

    .line 342
    .line 343
    invoke-static {p1, v1}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    check-cast p1, Ljava/util/List;

    .line 347
    .line 348
    const/4 v1, 0x0

    .line 349
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 350
    .line 351
    .line 352
    move-result-object v1

    .line 353
    check-cast v1, Ljava/util/List;

    .line 354
    .line 355
    const/4 v2, 0x1

    .line 356
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 357
    .line 358
    .line 359
    move-result-object p1

    .line 360
    const-string v2, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions"

    .line 361
    .line 362
    invoke-static {p1, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 363
    .line 364
    .line 365
    check-cast p1, Lv3/h;

    .line 366
    .line 367
    :try_start_3
    invoke-interface {v0, v1, p1}, Lv3/g;->k(Ljava/util/List;Lv3/h;)Ljava/util/List;

    .line 368
    .line 369
    .line 370
    move-result-object p1

    .line 371
    invoke-static {p1}, LT0/a;->C(Ljava/lang/Object;)Ljava/util/List;

    .line 372
    .line 373
    .line 374
    move-result-object p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 375
    goto :goto_3

    .line 376
    :catchall_3
    move-exception p1

    .line 377
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 378
    .line 379
    .line 380
    move-result-object v0

    .line 381
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 382
    .line 383
    .line 384
    move-result-object v0

    .line 385
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object v1

    .line 389
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 390
    .line 391
    .line 392
    move-result-object v2

    .line 393
    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 394
    .line 395
    .line 396
    move-result-object p1

    .line 397
    new-instance v3, Ljava/lang/StringBuilder;

    .line 398
    .line 399
    const-string v4, "Cause: "

    .line 400
    .line 401
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 402
    .line 403
    .line 404
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 405
    .line 406
    .line 407
    const-string v2, ", Stacktrace: "

    .line 408
    .line 409
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 410
    .line 411
    .line 412
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 413
    .line 414
    .line 415
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 416
    .line 417
    .line 418
    move-result-object p1

    .line 419
    filled-new-array {v0, v1, p1}, [Ljava/lang/String;

    .line 420
    .line 421
    .line 422
    move-result-object p1

    .line 423
    invoke-static {p1}, Lz3/e;->S([Ljava/lang/Object;)Ljava/util/List;

    .line 424
    .line 425
    .line 426
    move-result-object p1

    .line 427
    :goto_3
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 428
    .line 429
    .line 430
    return-void

    .line 431
    :pswitch_3
    iget-object v0, p0, Lv3/e;->f:Lv3/g;

    .line 432
    .line 433
    const-string v1, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>"

    .line 434
    .line 435
    invoke-static {p1, v1}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 436
    .line 437
    .line 438
    check-cast p1, Ljava/util/List;

    .line 439
    .line 440
    const/4 v1, 0x0

    .line 441
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 442
    .line 443
    .line 444
    move-result-object v1

    .line 445
    check-cast v1, Ljava/util/List;

    .line 446
    .line 447
    const/4 v2, 0x1

    .line 448
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 449
    .line 450
    .line 451
    move-result-object p1

    .line 452
    const-string v2, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions"

    .line 453
    .line 454
    invoke-static {p1, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 455
    .line 456
    .line 457
    check-cast p1, Lv3/h;

    .line 458
    .line 459
    :try_start_4
    invoke-interface {v0, v1, p1}, Lv3/g;->i(Ljava/util/List;Lv3/h;)Ljava/util/Map;

    .line 460
    .line 461
    .line 462
    move-result-object p1

    .line 463
    invoke-static {p1}, LT0/a;->C(Ljava/lang/Object;)Ljava/util/List;

    .line 464
    .line 465
    .line 466
    move-result-object p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 467
    goto :goto_4

    .line 468
    :catchall_4
    move-exception p1

    .line 469
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 470
    .line 471
    .line 472
    move-result-object v0

    .line 473
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 474
    .line 475
    .line 476
    move-result-object v0

    .line 477
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 478
    .line 479
    .line 480
    move-result-object v1

    .line 481
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 482
    .line 483
    .line 484
    move-result-object v2

    .line 485
    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 486
    .line 487
    .line 488
    move-result-object p1

    .line 489
    new-instance v3, Ljava/lang/StringBuilder;

    .line 490
    .line 491
    const-string v4, "Cause: "

    .line 492
    .line 493
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 494
    .line 495
    .line 496
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 497
    .line 498
    .line 499
    const-string v2, ", Stacktrace: "

    .line 500
    .line 501
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 502
    .line 503
    .line 504
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 505
    .line 506
    .line 507
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 508
    .line 509
    .line 510
    move-result-object p1

    .line 511
    filled-new-array {v0, v1, p1}, [Ljava/lang/String;

    .line 512
    .line 513
    .line 514
    move-result-object p1

    .line 515
    invoke-static {p1}, Lz3/e;->S([Ljava/lang/Object;)Ljava/util/List;

    .line 516
    .line 517
    .line 518
    move-result-object p1

    .line 519
    :goto_4
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 520
    .line 521
    .line 522
    return-void

    .line 523
    :pswitch_4
    iget-object v0, p0, Lv3/e;->f:Lv3/g;

    .line 524
    .line 525
    const-string v1, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>"

    .line 526
    .line 527
    invoke-static {p1, v1}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 528
    .line 529
    .line 530
    check-cast p1, Ljava/util/List;

    .line 531
    .line 532
    const/4 v1, 0x0

    .line 533
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 534
    .line 535
    .line 536
    move-result-object v1

    .line 537
    check-cast v1, Ljava/util/List;

    .line 538
    .line 539
    const/4 v2, 0x1

    .line 540
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 541
    .line 542
    .line 543
    move-result-object p1

    .line 544
    const-string v2, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions"

    .line 545
    .line 546
    invoke-static {p1, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 547
    .line 548
    .line 549
    check-cast p1, Lv3/h;

    .line 550
    .line 551
    :try_start_5
    invoke-interface {v0, v1, p1}, Lv3/g;->b(Ljava/util/List;Lv3/h;)V

    .line 552
    .line 553
    .line 554
    const/4 p1, 0x0

    .line 555
    invoke-static {p1}, LT0/a;->C(Ljava/lang/Object;)Ljava/util/List;

    .line 556
    .line 557
    .line 558
    move-result-object p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_5

    .line 559
    goto :goto_5

    .line 560
    :catchall_5
    move-exception p1

    .line 561
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 562
    .line 563
    .line 564
    move-result-object v0

    .line 565
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 566
    .line 567
    .line 568
    move-result-object v0

    .line 569
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 570
    .line 571
    .line 572
    move-result-object v1

    .line 573
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 574
    .line 575
    .line 576
    move-result-object v2

    .line 577
    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 578
    .line 579
    .line 580
    move-result-object p1

    .line 581
    new-instance v3, Ljava/lang/StringBuilder;

    .line 582
    .line 583
    const-string v4, "Cause: "

    .line 584
    .line 585
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 586
    .line 587
    .line 588
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 589
    .line 590
    .line 591
    const-string v2, ", Stacktrace: "

    .line 592
    .line 593
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 594
    .line 595
    .line 596
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 597
    .line 598
    .line 599
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 600
    .line 601
    .line 602
    move-result-object p1

    .line 603
    filled-new-array {v0, v1, p1}, [Ljava/lang/String;

    .line 604
    .line 605
    .line 606
    move-result-object p1

    .line 607
    invoke-static {p1}, Lz3/e;->S([Ljava/lang/Object;)Ljava/util/List;

    .line 608
    .line 609
    .line 610
    move-result-object p1

    .line 611
    :goto_5
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 612
    .line 613
    .line 614
    return-void

    .line 615
    :pswitch_5
    iget-object v0, p0, Lv3/e;->f:Lv3/g;

    .line 616
    .line 617
    const-string v1, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>"

    .line 618
    .line 619
    invoke-static {p1, v1}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 620
    .line 621
    .line 622
    check-cast p1, Ljava/util/List;

    .line 623
    .line 624
    const/4 v1, 0x0

    .line 625
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 626
    .line 627
    .line 628
    move-result-object v1

    .line 629
    const-string v2, "null cannot be cast to non-null type kotlin.String"

    .line 630
    .line 631
    invoke-static {v1, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 632
    .line 633
    .line 634
    check-cast v1, Ljava/lang/String;

    .line 635
    .line 636
    const/4 v2, 0x1

    .line 637
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 638
    .line 639
    .line 640
    move-result-object p1

    .line 641
    const-string v2, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions"

    .line 642
    .line 643
    invoke-static {p1, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 644
    .line 645
    .line 646
    check-cast p1, Lv3/h;

    .line 647
    .line 648
    :try_start_6
    invoke-interface {v0, v1, p1}, Lv3/g;->a(Ljava/lang/String;Lv3/h;)Lv3/N;

    .line 649
    .line 650
    .line 651
    move-result-object p1

    .line 652
    invoke-static {p1}, LT0/a;->C(Ljava/lang/Object;)Ljava/util/List;

    .line 653
    .line 654
    .line 655
    move-result-object p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_6

    .line 656
    goto :goto_6

    .line 657
    :catchall_6
    move-exception p1

    .line 658
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 659
    .line 660
    .line 661
    move-result-object v0

    .line 662
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 663
    .line 664
    .line 665
    move-result-object v0

    .line 666
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 667
    .line 668
    .line 669
    move-result-object v1

    .line 670
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 671
    .line 672
    .line 673
    move-result-object v2

    .line 674
    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 675
    .line 676
    .line 677
    move-result-object p1

    .line 678
    new-instance v3, Ljava/lang/StringBuilder;

    .line 679
    .line 680
    const-string v4, "Cause: "

    .line 681
    .line 682
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 683
    .line 684
    .line 685
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 686
    .line 687
    .line 688
    const-string v2, ", Stacktrace: "

    .line 689
    .line 690
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 691
    .line 692
    .line 693
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 694
    .line 695
    .line 696
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 697
    .line 698
    .line 699
    move-result-object p1

    .line 700
    filled-new-array {v0, v1, p1}, [Ljava/lang/String;

    .line 701
    .line 702
    .line 703
    move-result-object p1

    .line 704
    invoke-static {p1}, Lz3/e;->S([Ljava/lang/Object;)Ljava/util/List;

    .line 705
    .line 706
    .line 707
    move-result-object p1

    .line 708
    :goto_6
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 709
    .line 710
    .line 711
    return-void

    .line 712
    :pswitch_6
    iget-object v0, p0, Lv3/e;->f:Lv3/g;

    .line 713
    .line 714
    const-string v1, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>"

    .line 715
    .line 716
    invoke-static {p1, v1}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 717
    .line 718
    .line 719
    check-cast p1, Ljava/util/List;

    .line 720
    .line 721
    const/4 v1, 0x0

    .line 722
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 723
    .line 724
    .line 725
    move-result-object v1

    .line 726
    const-string v2, "null cannot be cast to non-null type kotlin.String"

    .line 727
    .line 728
    invoke-static {v1, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 729
    .line 730
    .line 731
    check-cast v1, Ljava/lang/String;

    .line 732
    .line 733
    const/4 v2, 0x1

    .line 734
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 735
    .line 736
    .line 737
    move-result-object p1

    .line 738
    const-string v2, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions"

    .line 739
    .line 740
    invoke-static {p1, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 741
    .line 742
    .line 743
    check-cast p1, Lv3/h;

    .line 744
    .line 745
    :try_start_7
    invoke-interface {v0, v1, p1}, Lv3/g;->g(Ljava/lang/String;Lv3/h;)Ljava/util/ArrayList;

    .line 746
    .line 747
    .line 748
    move-result-object p1

    .line 749
    invoke-static {p1}, LT0/a;->C(Ljava/lang/Object;)Ljava/util/List;

    .line 750
    .line 751
    .line 752
    move-result-object p1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_7

    .line 753
    goto :goto_7

    .line 754
    :catchall_7
    move-exception p1

    .line 755
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 756
    .line 757
    .line 758
    move-result-object v0

    .line 759
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 760
    .line 761
    .line 762
    move-result-object v0

    .line 763
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 764
    .line 765
    .line 766
    move-result-object v1

    .line 767
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 768
    .line 769
    .line 770
    move-result-object v2

    .line 771
    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 772
    .line 773
    .line 774
    move-result-object p1

    .line 775
    new-instance v3, Ljava/lang/StringBuilder;

    .line 776
    .line 777
    const-string v4, "Cause: "

    .line 778
    .line 779
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 780
    .line 781
    .line 782
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 783
    .line 784
    .line 785
    const-string v2, ", Stacktrace: "

    .line 786
    .line 787
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 788
    .line 789
    .line 790
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 791
    .line 792
    .line 793
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 794
    .line 795
    .line 796
    move-result-object p1

    .line 797
    filled-new-array {v0, v1, p1}, [Ljava/lang/String;

    .line 798
    .line 799
    .line 800
    move-result-object p1

    .line 801
    invoke-static {p1}, Lz3/e;->S([Ljava/lang/Object;)Ljava/util/List;

    .line 802
    .line 803
    .line 804
    move-result-object p1

    .line 805
    :goto_7
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 806
    .line 807
    .line 808
    return-void

    .line 809
    :pswitch_7
    iget-object v0, p0, Lv3/e;->f:Lv3/g;

    .line 810
    .line 811
    const-string v1, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>"

    .line 812
    .line 813
    invoke-static {p1, v1}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 814
    .line 815
    .line 816
    check-cast p1, Ljava/util/List;

    .line 817
    .line 818
    const/4 v1, 0x0

    .line 819
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 820
    .line 821
    .line 822
    move-result-object v1

    .line 823
    const-string v2, "null cannot be cast to non-null type kotlin.String"

    .line 824
    .line 825
    invoke-static {v1, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 826
    .line 827
    .line 828
    check-cast v1, Ljava/lang/String;

    .line 829
    .line 830
    const/4 v2, 0x1

    .line 831
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 832
    .line 833
    .line 834
    move-result-object v2

    .line 835
    const-string v3, "null cannot be cast to non-null type kotlin.Boolean"

    .line 836
    .line 837
    invoke-static {v2, v3}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 838
    .line 839
    .line 840
    check-cast v2, Ljava/lang/Boolean;

    .line 841
    .line 842
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 843
    .line 844
    .line 845
    move-result v2

    .line 846
    const/4 v3, 0x2

    .line 847
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 848
    .line 849
    .line 850
    move-result-object p1

    .line 851
    const-string v3, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions"

    .line 852
    .line 853
    invoke-static {p1, v3}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 854
    .line 855
    .line 856
    check-cast p1, Lv3/h;

    .line 857
    .line 858
    :try_start_8
    invoke-interface {v0, v1, v2, p1}, Lv3/g;->m(Ljava/lang/String;ZLv3/h;)V

    .line 859
    .line 860
    .line 861
    const/4 p1, 0x0

    .line 862
    invoke-static {p1}, LT0/a;->C(Ljava/lang/Object;)Ljava/util/List;

    .line 863
    .line 864
    .line 865
    move-result-object p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_8

    .line 866
    goto :goto_8

    .line 867
    :catchall_8
    move-exception p1

    .line 868
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 869
    .line 870
    .line 871
    move-result-object v0

    .line 872
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 873
    .line 874
    .line 875
    move-result-object v0

    .line 876
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 877
    .line 878
    .line 879
    move-result-object v1

    .line 880
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 881
    .line 882
    .line 883
    move-result-object v2

    .line 884
    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 885
    .line 886
    .line 887
    move-result-object p1

    .line 888
    new-instance v3, Ljava/lang/StringBuilder;

    .line 889
    .line 890
    const-string v4, "Cause: "

    .line 891
    .line 892
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 893
    .line 894
    .line 895
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 896
    .line 897
    .line 898
    const-string v2, ", Stacktrace: "

    .line 899
    .line 900
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 901
    .line 902
    .line 903
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 904
    .line 905
    .line 906
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 907
    .line 908
    .line 909
    move-result-object p1

    .line 910
    filled-new-array {v0, v1, p1}, [Ljava/lang/String;

    .line 911
    .line 912
    .line 913
    move-result-object p1

    .line 914
    invoke-static {p1}, Lz3/e;->S([Ljava/lang/Object;)Ljava/util/List;

    .line 915
    .line 916
    .line 917
    move-result-object p1

    .line 918
    :goto_8
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 919
    .line 920
    .line 921
    return-void

    .line 922
    :pswitch_8
    iget-object v0, p0, Lv3/e;->f:Lv3/g;

    .line 923
    .line 924
    const-string v1, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>"

    .line 925
    .line 926
    invoke-static {p1, v1}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 927
    .line 928
    .line 929
    check-cast p1, Ljava/util/List;

    .line 930
    .line 931
    const/4 v1, 0x0

    .line 932
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 933
    .line 934
    .line 935
    move-result-object v1

    .line 936
    const-string v2, "null cannot be cast to non-null type kotlin.String"

    .line 937
    .line 938
    invoke-static {v1, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 939
    .line 940
    .line 941
    check-cast v1, Ljava/lang/String;

    .line 942
    .line 943
    const/4 v2, 0x1

    .line 944
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 945
    .line 946
    .line 947
    move-result-object p1

    .line 948
    const-string v2, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions"

    .line 949
    .line 950
    invoke-static {p1, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 951
    .line 952
    .line 953
    check-cast p1, Lv3/h;

    .line 954
    .line 955
    :try_start_9
    invoke-interface {v0, v1, p1}, Lv3/g;->o(Ljava/lang/String;Lv3/h;)Ljava/lang/Long;

    .line 956
    .line 957
    .line 958
    move-result-object p1

    .line 959
    invoke-static {p1}, LT0/a;->C(Ljava/lang/Object;)Ljava/util/List;

    .line 960
    .line 961
    .line 962
    move-result-object p1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_9

    .line 963
    goto :goto_9

    .line 964
    :catchall_9
    move-exception p1

    .line 965
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 966
    .line 967
    .line 968
    move-result-object v0

    .line 969
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 970
    .line 971
    .line 972
    move-result-object v0

    .line 973
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 974
    .line 975
    .line 976
    move-result-object v1

    .line 977
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 978
    .line 979
    .line 980
    move-result-object v2

    .line 981
    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 982
    .line 983
    .line 984
    move-result-object p1

    .line 985
    new-instance v3, Ljava/lang/StringBuilder;

    .line 986
    .line 987
    const-string v4, "Cause: "

    .line 988
    .line 989
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 990
    .line 991
    .line 992
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 993
    .line 994
    .line 995
    const-string v2, ", Stacktrace: "

    .line 996
    .line 997
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 998
    .line 999
    .line 1000
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1001
    .line 1002
    .line 1003
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1004
    .line 1005
    .line 1006
    move-result-object p1

    .line 1007
    filled-new-array {v0, v1, p1}, [Ljava/lang/String;

    .line 1008
    .line 1009
    .line 1010
    move-result-object p1

    .line 1011
    invoke-static {p1}, Lz3/e;->S([Ljava/lang/Object;)Ljava/util/List;

    .line 1012
    .line 1013
    .line 1014
    move-result-object p1

    .line 1015
    :goto_9
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 1016
    .line 1017
    .line 1018
    return-void

    .line 1019
    :pswitch_9
    iget-object v0, p0, Lv3/e;->f:Lv3/g;

    .line 1020
    .line 1021
    const-string v1, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>"

    .line 1022
    .line 1023
    invoke-static {p1, v1}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1024
    .line 1025
    .line 1026
    check-cast p1, Ljava/util/List;

    .line 1027
    .line 1028
    const/4 v1, 0x0

    .line 1029
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1030
    .line 1031
    .line 1032
    move-result-object v1

    .line 1033
    const-string v2, "null cannot be cast to non-null type kotlin.String"

    .line 1034
    .line 1035
    invoke-static {v1, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1036
    .line 1037
    .line 1038
    check-cast v1, Ljava/lang/String;

    .line 1039
    .line 1040
    const/4 v2, 0x1

    .line 1041
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1042
    .line 1043
    .line 1044
    move-result-object p1

    .line 1045
    const-string v2, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions"

    .line 1046
    .line 1047
    invoke-static {p1, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1048
    .line 1049
    .line 1050
    check-cast p1, Lv3/h;

    .line 1051
    .line 1052
    :try_start_a
    invoke-interface {v0, v1, p1}, Lv3/g;->n(Ljava/lang/String;Lv3/h;)Ljava/lang/Double;

    .line 1053
    .line 1054
    .line 1055
    move-result-object p1

    .line 1056
    invoke-static {p1}, LT0/a;->C(Ljava/lang/Object;)Ljava/util/List;

    .line 1057
    .line 1058
    .line 1059
    move-result-object p1
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_a

    .line 1060
    goto :goto_a

    .line 1061
    :catchall_a
    move-exception p1

    .line 1062
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1063
    .line 1064
    .line 1065
    move-result-object v0

    .line 1066
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 1067
    .line 1068
    .line 1069
    move-result-object v0

    .line 1070
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 1071
    .line 1072
    .line 1073
    move-result-object v1

    .line 1074
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 1075
    .line 1076
    .line 1077
    move-result-object v2

    .line 1078
    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 1079
    .line 1080
    .line 1081
    move-result-object p1

    .line 1082
    new-instance v3, Ljava/lang/StringBuilder;

    .line 1083
    .line 1084
    const-string v4, "Cause: "

    .line 1085
    .line 1086
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1087
    .line 1088
    .line 1089
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1090
    .line 1091
    .line 1092
    const-string v2, ", Stacktrace: "

    .line 1093
    .line 1094
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1095
    .line 1096
    .line 1097
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1098
    .line 1099
    .line 1100
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1101
    .line 1102
    .line 1103
    move-result-object p1

    .line 1104
    filled-new-array {v0, v1, p1}, [Ljava/lang/String;

    .line 1105
    .line 1106
    .line 1107
    move-result-object p1

    .line 1108
    invoke-static {p1}, Lz3/e;->S([Ljava/lang/Object;)Ljava/util/List;

    .line 1109
    .line 1110
    .line 1111
    move-result-object p1

    .line 1112
    :goto_a
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 1113
    .line 1114
    .line 1115
    return-void

    .line 1116
    :pswitch_a
    iget-object v0, p0, Lv3/e;->f:Lv3/g;

    .line 1117
    .line 1118
    const-string v1, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>"

    .line 1119
    .line 1120
    invoke-static {p1, v1}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1121
    .line 1122
    .line 1123
    check-cast p1, Ljava/util/List;

    .line 1124
    .line 1125
    const/4 v1, 0x0

    .line 1126
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1127
    .line 1128
    .line 1129
    move-result-object v1

    .line 1130
    const-string v2, "null cannot be cast to non-null type kotlin.String"

    .line 1131
    .line 1132
    invoke-static {v1, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1133
    .line 1134
    .line 1135
    check-cast v1, Ljava/lang/String;

    .line 1136
    .line 1137
    const/4 v2, 0x1

    .line 1138
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1139
    .line 1140
    .line 1141
    move-result-object p1

    .line 1142
    const-string v2, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions"

    .line 1143
    .line 1144
    invoke-static {p1, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1145
    .line 1146
    .line 1147
    check-cast p1, Lv3/h;

    .line 1148
    .line 1149
    :try_start_b
    invoke-interface {v0, v1, p1}, Lv3/g;->e(Ljava/lang/String;Lv3/h;)Ljava/lang/Boolean;

    .line 1150
    .line 1151
    .line 1152
    move-result-object p1

    .line 1153
    invoke-static {p1}, LT0/a;->C(Ljava/lang/Object;)Ljava/util/List;

    .line 1154
    .line 1155
    .line 1156
    move-result-object p1
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_b

    .line 1157
    goto :goto_b

    .line 1158
    :catchall_b
    move-exception p1

    .line 1159
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1160
    .line 1161
    .line 1162
    move-result-object v0

    .line 1163
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 1164
    .line 1165
    .line 1166
    move-result-object v0

    .line 1167
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 1168
    .line 1169
    .line 1170
    move-result-object v1

    .line 1171
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 1172
    .line 1173
    .line 1174
    move-result-object v2

    .line 1175
    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 1176
    .line 1177
    .line 1178
    move-result-object p1

    .line 1179
    new-instance v3, Ljava/lang/StringBuilder;

    .line 1180
    .line 1181
    const-string v4, "Cause: "

    .line 1182
    .line 1183
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1184
    .line 1185
    .line 1186
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1187
    .line 1188
    .line 1189
    const-string v2, ", Stacktrace: "

    .line 1190
    .line 1191
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1192
    .line 1193
    .line 1194
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1195
    .line 1196
    .line 1197
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1198
    .line 1199
    .line 1200
    move-result-object p1

    .line 1201
    filled-new-array {v0, v1, p1}, [Ljava/lang/String;

    .line 1202
    .line 1203
    .line 1204
    move-result-object p1

    .line 1205
    invoke-static {p1}, Lz3/e;->S([Ljava/lang/Object;)Ljava/util/List;

    .line 1206
    .line 1207
    .line 1208
    move-result-object p1

    .line 1209
    :goto_b
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 1210
    .line 1211
    .line 1212
    return-void

    .line 1213
    :pswitch_b
    iget-object v0, p0, Lv3/e;->f:Lv3/g;

    .line 1214
    .line 1215
    const-string v1, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>"

    .line 1216
    .line 1217
    invoke-static {p1, v1}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1218
    .line 1219
    .line 1220
    check-cast p1, Ljava/util/List;

    .line 1221
    .line 1222
    const/4 v1, 0x0

    .line 1223
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1224
    .line 1225
    .line 1226
    move-result-object v1

    .line 1227
    const-string v2, "null cannot be cast to non-null type kotlin.String"

    .line 1228
    .line 1229
    invoke-static {v1, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1230
    .line 1231
    .line 1232
    check-cast v1, Ljava/lang/String;

    .line 1233
    .line 1234
    const/4 v2, 0x1

    .line 1235
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1236
    .line 1237
    .line 1238
    move-result-object p1

    .line 1239
    const-string v2, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions"

    .line 1240
    .line 1241
    invoke-static {p1, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1242
    .line 1243
    .line 1244
    check-cast p1, Lv3/h;

    .line 1245
    .line 1246
    :try_start_c
    invoke-interface {v0, v1, p1}, Lv3/g;->f(Ljava/lang/String;Lv3/h;)Ljava/lang/String;

    .line 1247
    .line 1248
    .line 1249
    move-result-object p1

    .line 1250
    invoke-static {p1}, LT0/a;->C(Ljava/lang/Object;)Ljava/util/List;

    .line 1251
    .line 1252
    .line 1253
    move-result-object p1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_c

    .line 1254
    goto :goto_c

    .line 1255
    :catchall_c
    move-exception p1

    .line 1256
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1257
    .line 1258
    .line 1259
    move-result-object v0

    .line 1260
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 1261
    .line 1262
    .line 1263
    move-result-object v0

    .line 1264
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 1265
    .line 1266
    .line 1267
    move-result-object v1

    .line 1268
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 1269
    .line 1270
    .line 1271
    move-result-object v2

    .line 1272
    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 1273
    .line 1274
    .line 1275
    move-result-object p1

    .line 1276
    new-instance v3, Ljava/lang/StringBuilder;

    .line 1277
    .line 1278
    const-string v4, "Cause: "

    .line 1279
    .line 1280
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1281
    .line 1282
    .line 1283
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1284
    .line 1285
    .line 1286
    const-string v2, ", Stacktrace: "

    .line 1287
    .line 1288
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1289
    .line 1290
    .line 1291
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1292
    .line 1293
    .line 1294
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1295
    .line 1296
    .line 1297
    move-result-object p1

    .line 1298
    filled-new-array {v0, v1, p1}, [Ljava/lang/String;

    .line 1299
    .line 1300
    .line 1301
    move-result-object p1

    .line 1302
    invoke-static {p1}, Lz3/e;->S([Ljava/lang/Object;)Ljava/util/List;

    .line 1303
    .line 1304
    .line 1305
    move-result-object p1

    .line 1306
    :goto_c
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 1307
    .line 1308
    .line 1309
    return-void

    .line 1310
    :pswitch_c
    iget-object v0, p0, Lv3/e;->f:Lv3/g;

    .line 1311
    .line 1312
    const-string v1, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>"

    .line 1313
    .line 1314
    invoke-static {p1, v1}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1315
    .line 1316
    .line 1317
    check-cast p1, Ljava/util/List;

    .line 1318
    .line 1319
    const/4 v1, 0x0

    .line 1320
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1321
    .line 1322
    .line 1323
    move-result-object v1

    .line 1324
    const-string v2, "null cannot be cast to non-null type kotlin.String"

    .line 1325
    .line 1326
    invoke-static {v1, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1327
    .line 1328
    .line 1329
    check-cast v1, Ljava/lang/String;

    .line 1330
    .line 1331
    const/4 v2, 0x1

    .line 1332
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1333
    .line 1334
    .line 1335
    move-result-object v2

    .line 1336
    const-string v3, "null cannot be cast to non-null type kotlin.collections.List<kotlin.String>"

    .line 1337
    .line 1338
    invoke-static {v2, v3}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1339
    .line 1340
    .line 1341
    check-cast v2, Ljava/util/List;

    .line 1342
    .line 1343
    const/4 v3, 0x2

    .line 1344
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1345
    .line 1346
    .line 1347
    move-result-object p1

    .line 1348
    const-string v3, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions"

    .line 1349
    .line 1350
    invoke-static {p1, v3}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1351
    .line 1352
    .line 1353
    check-cast p1, Lv3/h;

    .line 1354
    .line 1355
    :try_start_d
    invoke-interface {v0, v1, v2, p1}, Lv3/g;->h(Ljava/lang/String;Ljava/util/List;Lv3/h;)V

    .line 1356
    .line 1357
    .line 1358
    const/4 p1, 0x0

    .line 1359
    invoke-static {p1}, LT0/a;->C(Ljava/lang/Object;)Ljava/util/List;

    .line 1360
    .line 1361
    .line 1362
    move-result-object p1
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_d

    .line 1363
    goto :goto_d

    .line 1364
    :catchall_d
    move-exception p1

    .line 1365
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1366
    .line 1367
    .line 1368
    move-result-object v0

    .line 1369
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 1370
    .line 1371
    .line 1372
    move-result-object v0

    .line 1373
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 1374
    .line 1375
    .line 1376
    move-result-object v1

    .line 1377
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 1378
    .line 1379
    .line 1380
    move-result-object v2

    .line 1381
    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 1382
    .line 1383
    .line 1384
    move-result-object p1

    .line 1385
    new-instance v3, Ljava/lang/StringBuilder;

    .line 1386
    .line 1387
    const-string v4, "Cause: "

    .line 1388
    .line 1389
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1390
    .line 1391
    .line 1392
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1393
    .line 1394
    .line 1395
    const-string v2, ", Stacktrace: "

    .line 1396
    .line 1397
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1398
    .line 1399
    .line 1400
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1401
    .line 1402
    .line 1403
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1404
    .line 1405
    .line 1406
    move-result-object p1

    .line 1407
    filled-new-array {v0, v1, p1}, [Ljava/lang/String;

    .line 1408
    .line 1409
    .line 1410
    move-result-object p1

    .line 1411
    invoke-static {p1}, Lz3/e;->S([Ljava/lang/Object;)Ljava/util/List;

    .line 1412
    .line 1413
    .line 1414
    move-result-object p1

    .line 1415
    :goto_d
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 1416
    .line 1417
    .line 1418
    return-void

    .line 1419
    :pswitch_d
    iget-object v0, p0, Lv3/e;->f:Lv3/g;

    .line 1420
    .line 1421
    const-string v1, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>"

    .line 1422
    .line 1423
    invoke-static {p1, v1}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1424
    .line 1425
    .line 1426
    check-cast p1, Ljava/util/List;

    .line 1427
    .line 1428
    const/4 v1, 0x0

    .line 1429
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1430
    .line 1431
    .line 1432
    move-result-object v1

    .line 1433
    const-string v2, "null cannot be cast to non-null type kotlin.String"

    .line 1434
    .line 1435
    invoke-static {v1, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1436
    .line 1437
    .line 1438
    check-cast v1, Ljava/lang/String;

    .line 1439
    .line 1440
    const/4 v3, 0x1

    .line 1441
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1442
    .line 1443
    .line 1444
    move-result-object v3

    .line 1445
    invoke-static {v3, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1446
    .line 1447
    .line 1448
    check-cast v3, Ljava/lang/String;

    .line 1449
    .line 1450
    const/4 v2, 0x2

    .line 1451
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1452
    .line 1453
    .line 1454
    move-result-object p1

    .line 1455
    const-string v2, "null cannot be cast to non-null type io.flutter.plugins.sharedpreferences.SharedPreferencesPigeonOptions"

    .line 1456
    .line 1457
    invoke-static {p1, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1458
    .line 1459
    .line 1460
    check-cast p1, Lv3/h;

    .line 1461
    .line 1462
    :try_start_e
    invoke-interface {v0, v1, v3, p1}, Lv3/g;->p(Ljava/lang/String;Ljava/lang/String;Lv3/h;)V

    .line 1463
    .line 1464
    .line 1465
    const/4 p1, 0x0

    .line 1466
    invoke-static {p1}, LT0/a;->C(Ljava/lang/Object;)Ljava/util/List;

    .line 1467
    .line 1468
    .line 1469
    move-result-object p1
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_e

    .line 1470
    goto :goto_e

    .line 1471
    :catchall_e
    move-exception p1

    .line 1472
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1473
    .line 1474
    .line 1475
    move-result-object v0

    .line 1476
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 1477
    .line 1478
    .line 1479
    move-result-object v0

    .line 1480
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 1481
    .line 1482
    .line 1483
    move-result-object v1

    .line 1484
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 1485
    .line 1486
    .line 1487
    move-result-object v2

    .line 1488
    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 1489
    .line 1490
    .line 1491
    move-result-object p1

    .line 1492
    new-instance v3, Ljava/lang/StringBuilder;

    .line 1493
    .line 1494
    const-string v4, "Cause: "

    .line 1495
    .line 1496
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1497
    .line 1498
    .line 1499
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1500
    .line 1501
    .line 1502
    const-string v2, ", Stacktrace: "

    .line 1503
    .line 1504
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1505
    .line 1506
    .line 1507
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1508
    .line 1509
    .line 1510
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1511
    .line 1512
    .line 1513
    move-result-object p1

    .line 1514
    filled-new-array {v0, v1, p1}, [Ljava/lang/String;

    .line 1515
    .line 1516
    .line 1517
    move-result-object p1

    .line 1518
    invoke-static {p1}, Lz3/e;->S([Ljava/lang/Object;)Ljava/util/List;

    .line 1519
    .line 1520
    .line 1521
    move-result-object p1

    .line 1522
    :goto_e
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 1523
    .line 1524
    .line 1525
    return-void

    .line 1526
    nop

    .line 1527
    :pswitch_data_0
    .packed-switch 0x0
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
