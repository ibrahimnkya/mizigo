.class public final Lv3/f;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:Lv3/f;

.field public static final b:Ly3/f;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lv3/f;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lv3/f;->a:Lv3/f;

    .line 7
    .line 8
    new-instance v0, Lv3/d;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 11
    .line 12
    .line 13
    new-instance v1, Ly3/f;

    .line 14
    .line 15
    invoke-direct {v1, v0}, Ly3/f;-><init>(LH3/a;)V

    .line 16
    .line 17
    .line 18
    sput-object v1, Lv3/f;->b:Ly3/f;

    .line 19
    .line 20
    return-void
.end method

.method public static a()Lk3/k;
    .locals 1

    .line 1
    sget-object v0, Lv3/f;->b:Ly3/f;

    .line 2
    .line 3
    invoke-virtual {v0}, Ly3/f;->a()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lk3/k;

    .line 8
    .line 9
    return-object v0
.end method

.method public static b(Lk3/f;Lv3/g;Ljava/lang/String;)V
    .locals 5

    .line 1
    const-string v0, "binaryMessenger"

    .line 2
    .line 3
    invoke-static {p0, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    const-string v0, "."

    .line 13
    .line 14
    invoke-virtual {v0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const-string p2, ""

    .line 20
    .line 21
    :goto_0
    invoke-interface {p0}, Lk3/f;->e()LN1/e;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, LV1/y;

    .line 26
    .line 27
    const-string v2, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.setBool"

    .line 28
    .line 29
    invoke-static {v2, p2}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-static {}, Lv3/f;->a()Lk3/k;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-direct {v1, p0, v2, v3, v0}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 38
    .line 39
    .line 40
    const/4 v2, 0x0

    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    new-instance v3, Lv3/e;

    .line 44
    .line 45
    const/4 v4, 0x6

    .line 46
    invoke-direct {v3, p1, v4}, Lv3/e;-><init>(Lv3/g;I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, v3}, LV1/y;->A(Lk3/b;)V

    .line 50
    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    invoke-virtual {v1, v2}, LV1/y;->A(Lk3/b;)V

    .line 54
    .line 55
    .line 56
    :goto_1
    new-instance v1, LV1/y;

    .line 57
    .line 58
    const-string v3, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.setString"

    .line 59
    .line 60
    invoke-static {v3, p2}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-static {}, Lv3/f;->a()Lk3/k;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-direct {v1, p0, v3, v4, v0}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 69
    .line 70
    .line 71
    if-eqz p1, :cond_2

    .line 72
    .line 73
    new-instance v3, Lv3/e;

    .line 74
    .line 75
    const/16 v4, 0xc

    .line 76
    .line 77
    invoke-direct {v3, p1, v4}, Lv3/e;-><init>(Lv3/g;I)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1, v3}, LV1/y;->A(Lk3/b;)V

    .line 81
    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_2
    invoke-virtual {v1, v2}, LV1/y;->A(Lk3/b;)V

    .line 85
    .line 86
    .line 87
    :goto_2
    new-instance v1, LV1/y;

    .line 88
    .line 89
    const-string v3, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.setInt"

    .line 90
    .line 91
    invoke-static {v3, p2}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    invoke-static {}, Lv3/f;->a()Lk3/k;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    invoke-direct {v1, p0, v3, v4, v0}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 100
    .line 101
    .line 102
    if-eqz p1, :cond_3

    .line 103
    .line 104
    new-instance v3, Lv3/e;

    .line 105
    .line 106
    const/16 v4, 0xd

    .line 107
    .line 108
    invoke-direct {v3, p1, v4}, Lv3/e;-><init>(Lv3/g;I)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v1, v3}, LV1/y;->A(Lk3/b;)V

    .line 112
    .line 113
    .line 114
    goto :goto_3

    .line 115
    :cond_3
    invoke-virtual {v1, v2}, LV1/y;->A(Lk3/b;)V

    .line 116
    .line 117
    .line 118
    :goto_3
    new-instance v1, LV1/y;

    .line 119
    .line 120
    const-string v3, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.setDouble"

    .line 121
    .line 122
    invoke-static {v3, p2}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    invoke-static {}, Lv3/f;->a()Lk3/k;

    .line 127
    .line 128
    .line 129
    move-result-object v4

    .line 130
    invoke-direct {v1, p0, v3, v4, v0}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 131
    .line 132
    .line 133
    if-eqz p1, :cond_4

    .line 134
    .line 135
    new-instance v3, Lv3/e;

    .line 136
    .line 137
    const/16 v4, 0xe

    .line 138
    .line 139
    invoke-direct {v3, p1, v4}, Lv3/e;-><init>(Lv3/g;I)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v1, v3}, LV1/y;->A(Lk3/b;)V

    .line 143
    .line 144
    .line 145
    goto :goto_4

    .line 146
    :cond_4
    invoke-virtual {v1, v2}, LV1/y;->A(Lk3/b;)V

    .line 147
    .line 148
    .line 149
    :goto_4
    new-instance v1, LV1/y;

    .line 150
    .line 151
    const-string v3, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.setEncodedStringList"

    .line 152
    .line 153
    invoke-static {v3, p2}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v3

    .line 157
    invoke-static {}, Lv3/f;->a()Lk3/k;

    .line 158
    .line 159
    .line 160
    move-result-object v4

    .line 161
    invoke-direct {v1, p0, v3, v4, v0}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 162
    .line 163
    .line 164
    if-eqz p1, :cond_5

    .line 165
    .line 166
    new-instance v3, Lv3/e;

    .line 167
    .line 168
    const/4 v4, 0x0

    .line 169
    invoke-direct {v3, p1, v4}, Lv3/e;-><init>(Lv3/g;I)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {v1, v3}, LV1/y;->A(Lk3/b;)V

    .line 173
    .line 174
    .line 175
    goto :goto_5

    .line 176
    :cond_5
    invoke-virtual {v1, v2}, LV1/y;->A(Lk3/b;)V

    .line 177
    .line 178
    .line 179
    :goto_5
    new-instance v1, LV1/y;

    .line 180
    .line 181
    const-string v3, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.setDeprecatedStringList"

    .line 182
    .line 183
    invoke-static {v3, p2}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v3

    .line 187
    invoke-static {}, Lv3/f;->a()Lk3/k;

    .line 188
    .line 189
    .line 190
    move-result-object v4

    .line 191
    invoke-direct {v1, p0, v3, v4, v0}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 192
    .line 193
    .line 194
    if-eqz p1, :cond_6

    .line 195
    .line 196
    new-instance v3, Lv3/e;

    .line 197
    .line 198
    const/4 v4, 0x1

    .line 199
    invoke-direct {v3, p1, v4}, Lv3/e;-><init>(Lv3/g;I)V

    .line 200
    .line 201
    .line 202
    invoke-virtual {v1, v3}, LV1/y;->A(Lk3/b;)V

    .line 203
    .line 204
    .line 205
    goto :goto_6

    .line 206
    :cond_6
    invoke-virtual {v1, v2}, LV1/y;->A(Lk3/b;)V

    .line 207
    .line 208
    .line 209
    :goto_6
    new-instance v1, LV1/y;

    .line 210
    .line 211
    const-string v3, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.getString"

    .line 212
    .line 213
    invoke-static {v3, p2}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    invoke-static {}, Lv3/f;->a()Lk3/k;

    .line 218
    .line 219
    .line 220
    move-result-object v4

    .line 221
    invoke-direct {v1, p0, v3, v4, v0}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 222
    .line 223
    .line 224
    if-eqz p1, :cond_7

    .line 225
    .line 226
    new-instance v3, Lv3/e;

    .line 227
    .line 228
    const/4 v4, 0x2

    .line 229
    invoke-direct {v3, p1, v4}, Lv3/e;-><init>(Lv3/g;I)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {v1, v3}, LV1/y;->A(Lk3/b;)V

    .line 233
    .line 234
    .line 235
    goto :goto_7

    .line 236
    :cond_7
    invoke-virtual {v1, v2}, LV1/y;->A(Lk3/b;)V

    .line 237
    .line 238
    .line 239
    :goto_7
    new-instance v1, LV1/y;

    .line 240
    .line 241
    const-string v3, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.getBool"

    .line 242
    .line 243
    invoke-static {v3, p2}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v3

    .line 247
    invoke-static {}, Lv3/f;->a()Lk3/k;

    .line 248
    .line 249
    .line 250
    move-result-object v4

    .line 251
    invoke-direct {v1, p0, v3, v4, v0}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 252
    .line 253
    .line 254
    if-eqz p1, :cond_8

    .line 255
    .line 256
    new-instance v3, Lv3/e;

    .line 257
    .line 258
    const/4 v4, 0x3

    .line 259
    invoke-direct {v3, p1, v4}, Lv3/e;-><init>(Lv3/g;I)V

    .line 260
    .line 261
    .line 262
    invoke-virtual {v1, v3}, LV1/y;->A(Lk3/b;)V

    .line 263
    .line 264
    .line 265
    goto :goto_8

    .line 266
    :cond_8
    invoke-virtual {v1, v2}, LV1/y;->A(Lk3/b;)V

    .line 267
    .line 268
    .line 269
    :goto_8
    new-instance v1, LV1/y;

    .line 270
    .line 271
    const-string v3, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.getDouble"

    .line 272
    .line 273
    invoke-static {v3, p2}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object v3

    .line 277
    invoke-static {}, Lv3/f;->a()Lk3/k;

    .line 278
    .line 279
    .line 280
    move-result-object v4

    .line 281
    invoke-direct {v1, p0, v3, v4, v0}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 282
    .line 283
    .line 284
    if-eqz p1, :cond_9

    .line 285
    .line 286
    new-instance v3, Lv3/e;

    .line 287
    .line 288
    const/4 v4, 0x4

    .line 289
    invoke-direct {v3, p1, v4}, Lv3/e;-><init>(Lv3/g;I)V

    .line 290
    .line 291
    .line 292
    invoke-virtual {v1, v3}, LV1/y;->A(Lk3/b;)V

    .line 293
    .line 294
    .line 295
    goto :goto_9

    .line 296
    :cond_9
    invoke-virtual {v1, v2}, LV1/y;->A(Lk3/b;)V

    .line 297
    .line 298
    .line 299
    :goto_9
    new-instance v1, LV1/y;

    .line 300
    .line 301
    const-string v3, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.getInt"

    .line 302
    .line 303
    invoke-static {v3, p2}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object v3

    .line 307
    invoke-static {}, Lv3/f;->a()Lk3/k;

    .line 308
    .line 309
    .line 310
    move-result-object v4

    .line 311
    invoke-direct {v1, p0, v3, v4, v0}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 312
    .line 313
    .line 314
    if-eqz p1, :cond_a

    .line 315
    .line 316
    new-instance v3, Lv3/e;

    .line 317
    .line 318
    const/4 v4, 0x5

    .line 319
    invoke-direct {v3, p1, v4}, Lv3/e;-><init>(Lv3/g;I)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {v1, v3}, LV1/y;->A(Lk3/b;)V

    .line 323
    .line 324
    .line 325
    goto :goto_a

    .line 326
    :cond_a
    invoke-virtual {v1, v2}, LV1/y;->A(Lk3/b;)V

    .line 327
    .line 328
    .line 329
    :goto_a
    new-instance v1, LV1/y;

    .line 330
    .line 331
    const-string v3, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.getPlatformEncodedStringList"

    .line 332
    .line 333
    invoke-static {v3, p2}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 334
    .line 335
    .line 336
    move-result-object v3

    .line 337
    invoke-static {}, Lv3/f;->a()Lk3/k;

    .line 338
    .line 339
    .line 340
    move-result-object v4

    .line 341
    invoke-direct {v1, p0, v3, v4, v0}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 342
    .line 343
    .line 344
    if-eqz p1, :cond_b

    .line 345
    .line 346
    new-instance v3, Lv3/e;

    .line 347
    .line 348
    const/4 v4, 0x7

    .line 349
    invoke-direct {v3, p1, v4}, Lv3/e;-><init>(Lv3/g;I)V

    .line 350
    .line 351
    .line 352
    invoke-virtual {v1, v3}, LV1/y;->A(Lk3/b;)V

    .line 353
    .line 354
    .line 355
    goto :goto_b

    .line 356
    :cond_b
    invoke-virtual {v1, v2}, LV1/y;->A(Lk3/b;)V

    .line 357
    .line 358
    .line 359
    :goto_b
    new-instance v1, LV1/y;

    .line 360
    .line 361
    const-string v3, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.getStringList"

    .line 362
    .line 363
    invoke-static {v3, p2}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 364
    .line 365
    .line 366
    move-result-object v3

    .line 367
    invoke-static {}, Lv3/f;->a()Lk3/k;

    .line 368
    .line 369
    .line 370
    move-result-object v4

    .line 371
    invoke-direct {v1, p0, v3, v4, v0}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 372
    .line 373
    .line 374
    if-eqz p1, :cond_c

    .line 375
    .line 376
    new-instance v3, Lv3/e;

    .line 377
    .line 378
    const/16 v4, 0x8

    .line 379
    .line 380
    invoke-direct {v3, p1, v4}, Lv3/e;-><init>(Lv3/g;I)V

    .line 381
    .line 382
    .line 383
    invoke-virtual {v1, v3}, LV1/y;->A(Lk3/b;)V

    .line 384
    .line 385
    .line 386
    goto :goto_c

    .line 387
    :cond_c
    invoke-virtual {v1, v2}, LV1/y;->A(Lk3/b;)V

    .line 388
    .line 389
    .line 390
    :goto_c
    new-instance v1, LV1/y;

    .line 391
    .line 392
    const-string v3, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.clear"

    .line 393
    .line 394
    invoke-static {v3, p2}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 395
    .line 396
    .line 397
    move-result-object v3

    .line 398
    invoke-static {}, Lv3/f;->a()Lk3/k;

    .line 399
    .line 400
    .line 401
    move-result-object v4

    .line 402
    invoke-direct {v1, p0, v3, v4, v0}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 403
    .line 404
    .line 405
    if-eqz p1, :cond_d

    .line 406
    .line 407
    new-instance v3, Lv3/e;

    .line 408
    .line 409
    const/16 v4, 0x9

    .line 410
    .line 411
    invoke-direct {v3, p1, v4}, Lv3/e;-><init>(Lv3/g;I)V

    .line 412
    .line 413
    .line 414
    invoke-virtual {v1, v3}, LV1/y;->A(Lk3/b;)V

    .line 415
    .line 416
    .line 417
    goto :goto_d

    .line 418
    :cond_d
    invoke-virtual {v1, v2}, LV1/y;->A(Lk3/b;)V

    .line 419
    .line 420
    .line 421
    :goto_d
    new-instance v1, LV1/y;

    .line 422
    .line 423
    const-string v3, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.getAll"

    .line 424
    .line 425
    invoke-static {v3, p2}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 426
    .line 427
    .line 428
    move-result-object v3

    .line 429
    invoke-static {}, Lv3/f;->a()Lk3/k;

    .line 430
    .line 431
    .line 432
    move-result-object v4

    .line 433
    invoke-direct {v1, p0, v3, v4, v0}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 434
    .line 435
    .line 436
    if-eqz p1, :cond_e

    .line 437
    .line 438
    new-instance v3, Lv3/e;

    .line 439
    .line 440
    const/16 v4, 0xa

    .line 441
    .line 442
    invoke-direct {v3, p1, v4}, Lv3/e;-><init>(Lv3/g;I)V

    .line 443
    .line 444
    .line 445
    invoke-virtual {v1, v3}, LV1/y;->A(Lk3/b;)V

    .line 446
    .line 447
    .line 448
    goto :goto_e

    .line 449
    :cond_e
    invoke-virtual {v1, v2}, LV1/y;->A(Lk3/b;)V

    .line 450
    .line 451
    .line 452
    :goto_e
    new-instance v1, LV1/y;

    .line 453
    .line 454
    const-string v3, "dev.flutter.pigeon.shared_preferences_android.SharedPreferencesAsyncApi.getKeys"

    .line 455
    .line 456
    invoke-static {v3, p2}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 457
    .line 458
    .line 459
    move-result-object p2

    .line 460
    invoke-static {}, Lv3/f;->a()Lk3/k;

    .line 461
    .line 462
    .line 463
    move-result-object v3

    .line 464
    invoke-direct {v1, p0, p2, v3, v0}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 465
    .line 466
    .line 467
    if-eqz p1, :cond_f

    .line 468
    .line 469
    new-instance p0, Lv3/e;

    .line 470
    .line 471
    const/16 p2, 0xb

    .line 472
    .line 473
    invoke-direct {p0, p1, p2}, Lv3/e;-><init>(Lv3/g;I)V

    .line 474
    .line 475
    .line 476
    invoke-virtual {v1, p0}, LV1/y;->A(Lk3/b;)V

    .line 477
    .line 478
    .line 479
    return-void

    .line 480
    :cond_f
    invoke-virtual {v1, v2}, LV1/y;->A(Lk3/b;)V

    .line 481
    .line 482
    .line 483
    return-void
.end method
