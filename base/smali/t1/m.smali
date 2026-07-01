.class public abstract Lt1/m;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget v0, Lx1/u0;->CONFIG_NAME_FIELD_NUMBER:I

    .line 2
    .line 3
    :try_start_0
    invoke-static {}, Lt1/m;->a()V
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception v0

    .line 8
    new-instance v1, Ljava/lang/ExceptionInInitializerError;

    .line 9
    .line 10
    invoke-direct {v1, v0}, Ljava/lang/ExceptionInInitializerError;-><init>(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    throw v1
.end method

.method public static a()V
    .locals 15

    .line 1
    sget-object v0, Ls1/q;->b:Ls1/q;

    .line 2
    .line 3
    sget-object v1, Lt1/g;->c:Lt1/g;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ls1/q;->c(Ls1/F;)V

    .line 6
    .line 7
    .line 8
    sget-object v1, Lt1/g;->d:Ls1/B;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ls1/q;->b(Ls1/B;)V

    .line 11
    .line 12
    .line 13
    sget-object v1, Lt1/g;->b:Lt1/g;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ls1/q;->c(Ls1/F;)V

    .line 16
    .line 17
    .line 18
    sget v1, Lt1/i;->f:I

    .line 19
    .line 20
    invoke-static {v1}, LE1/j;->a(I)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_2

    .line 25
    .line 26
    sget-object v2, Lu1/c;->a:LM0/f;

    .line 27
    .line 28
    sget-object v2, Ls1/s;->b:Ls1/s;

    .line 29
    .line 30
    sget-object v3, Lu1/c;->c:Ls1/w;

    .line 31
    .line 32
    invoke-virtual {v2, v3}, Ls1/s;->f(Ls1/w;)V

    .line 33
    .line 34
    .line 35
    sget-object v3, Lu1/c;->d:Ls1/u;

    .line 36
    .line 37
    invoke-virtual {v2, v3}, Ls1/s;->e(Ls1/u;)V

    .line 38
    .line 39
    .line 40
    sget-object v3, Lu1/c;->e:Ls1/e;

    .line 41
    .line 42
    invoke-virtual {v2, v3}, Ls1/s;->d(Ls1/e;)V

    .line 43
    .line 44
    .line 45
    sget-object v3, Lu1/c;->f:Ls1/c;

    .line 46
    .line 47
    invoke-virtual {v2, v3}, Ls1/s;->c(Ls1/c;)V

    .line 48
    .line 49
    .line 50
    sget-object v3, Lt1/i;->a:Ls1/B;

    .line 51
    .line 52
    invoke-virtual {v0, v3}, Ls1/q;->b(Ls1/B;)V

    .line 53
    .line 54
    .line 55
    sget-object v3, Lt1/i;->b:Ls1/B;

    .line 56
    .line 57
    invoke-virtual {v0, v3}, Ls1/q;->b(Ls1/B;)V

    .line 58
    .line 59
    .line 60
    sget-object v3, Ls1/p;->b:Ls1/p;

    .line 61
    .line 62
    new-instance v4, Ljava/util/HashMap;

    .line 63
    .line 64
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 65
    .line 66
    .line 67
    const-string v5, "HMAC_SHA256_128BITTAG"

    .line 68
    .line 69
    sget-object v6, Lt1/r;->a:Lt1/l;

    .line 70
    .line 71
    invoke-virtual {v4, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    invoke-static {}, Lt1/l;->b()LV1/y;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    const/16 v6, 0x20

    .line 79
    .line 80
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 81
    .line 82
    .line 83
    move-result-object v7

    .line 84
    iput-object v7, v5, LV1/y;->f:Ljava/lang/Object;

    .line 85
    .line 86
    const/16 v8, 0x10

    .line 87
    .line 88
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 89
    .line 90
    .line 91
    move-result-object v9

    .line 92
    iput-object v9, v5, LV1/y;->g:Ljava/lang/Object;

    .line 93
    .line 94
    sget-object v10, Lt1/k;->e:Lt1/k;

    .line 95
    .line 96
    iput-object v10, v5, LV1/y;->i:Ljava/lang/Object;

    .line 97
    .line 98
    sget-object v11, Lt1/j;->d:Lt1/j;

    .line 99
    .line 100
    iput-object v11, v5, LV1/y;->h:Ljava/lang/Object;

    .line 101
    .line 102
    invoke-virtual {v5}, LV1/y;->i()Lt1/l;

    .line 103
    .line 104
    .line 105
    move-result-object v5

    .line 106
    const-string v12, "HMAC_SHA256_128BITTAG_RAW"

    .line 107
    .line 108
    invoke-virtual {v4, v12, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    invoke-static {}, Lt1/l;->b()LV1/y;

    .line 112
    .line 113
    .line 114
    move-result-object v5

    .line 115
    iput-object v7, v5, LV1/y;->f:Ljava/lang/Object;

    .line 116
    .line 117
    iput-object v7, v5, LV1/y;->g:Ljava/lang/Object;

    .line 118
    .line 119
    sget-object v12, Lt1/k;->b:Lt1/k;

    .line 120
    .line 121
    iput-object v12, v5, LV1/y;->i:Ljava/lang/Object;

    .line 122
    .line 123
    iput-object v11, v5, LV1/y;->h:Ljava/lang/Object;

    .line 124
    .line 125
    invoke-virtual {v5}, LV1/y;->i()Lt1/l;

    .line 126
    .line 127
    .line 128
    move-result-object v5

    .line 129
    const-string v13, "HMAC_SHA256_256BITTAG"

    .line 130
    .line 131
    invoke-virtual {v4, v13, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    invoke-static {}, Lt1/l;->b()LV1/y;

    .line 135
    .line 136
    .line 137
    move-result-object v5

    .line 138
    iput-object v7, v5, LV1/y;->f:Ljava/lang/Object;

    .line 139
    .line 140
    iput-object v7, v5, LV1/y;->g:Ljava/lang/Object;

    .line 141
    .line 142
    iput-object v10, v5, LV1/y;->i:Ljava/lang/Object;

    .line 143
    .line 144
    iput-object v11, v5, LV1/y;->h:Ljava/lang/Object;

    .line 145
    .line 146
    invoke-virtual {v5}, LV1/y;->i()Lt1/l;

    .line 147
    .line 148
    .line 149
    move-result-object v5

    .line 150
    const-string v11, "HMAC_SHA256_256BITTAG_RAW"

    .line 151
    .line 152
    invoke-virtual {v4, v11, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    invoke-static {}, Lt1/l;->b()LV1/y;

    .line 156
    .line 157
    .line 158
    move-result-object v5

    .line 159
    const/16 v11, 0x40

    .line 160
    .line 161
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 162
    .line 163
    .line 164
    move-result-object v11

    .line 165
    iput-object v11, v5, LV1/y;->f:Ljava/lang/Object;

    .line 166
    .line 167
    iput-object v9, v5, LV1/y;->g:Ljava/lang/Object;

    .line 168
    .line 169
    iput-object v12, v5, LV1/y;->i:Ljava/lang/Object;

    .line 170
    .line 171
    sget-object v13, Lt1/j;->f:Lt1/j;

    .line 172
    .line 173
    iput-object v13, v5, LV1/y;->h:Ljava/lang/Object;

    .line 174
    .line 175
    invoke-virtual {v5}, LV1/y;->i()Lt1/l;

    .line 176
    .line 177
    .line 178
    move-result-object v5

    .line 179
    const-string v14, "HMAC_SHA512_128BITTAG"

    .line 180
    .line 181
    invoke-virtual {v4, v14, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    invoke-static {}, Lt1/l;->b()LV1/y;

    .line 185
    .line 186
    .line 187
    move-result-object v5

    .line 188
    iput-object v11, v5, LV1/y;->f:Ljava/lang/Object;

    .line 189
    .line 190
    iput-object v9, v5, LV1/y;->g:Ljava/lang/Object;

    .line 191
    .line 192
    iput-object v10, v5, LV1/y;->i:Ljava/lang/Object;

    .line 193
    .line 194
    iput-object v13, v5, LV1/y;->h:Ljava/lang/Object;

    .line 195
    .line 196
    invoke-virtual {v5}, LV1/y;->i()Lt1/l;

    .line 197
    .line 198
    .line 199
    move-result-object v5

    .line 200
    const-string v9, "HMAC_SHA512_128BITTAG_RAW"

    .line 201
    .line 202
    invoke-virtual {v4, v9, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    invoke-static {}, Lt1/l;->b()LV1/y;

    .line 206
    .line 207
    .line 208
    move-result-object v5

    .line 209
    iput-object v11, v5, LV1/y;->f:Ljava/lang/Object;

    .line 210
    .line 211
    iput-object v7, v5, LV1/y;->g:Ljava/lang/Object;

    .line 212
    .line 213
    iput-object v12, v5, LV1/y;->i:Ljava/lang/Object;

    .line 214
    .line 215
    iput-object v13, v5, LV1/y;->h:Ljava/lang/Object;

    .line 216
    .line 217
    invoke-virtual {v5}, LV1/y;->i()Lt1/l;

    .line 218
    .line 219
    .line 220
    move-result-object v5

    .line 221
    const-string v9, "HMAC_SHA512_256BITTAG"

    .line 222
    .line 223
    invoke-virtual {v4, v9, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    .line 225
    .line 226
    invoke-static {}, Lt1/l;->b()LV1/y;

    .line 227
    .line 228
    .line 229
    move-result-object v5

    .line 230
    iput-object v11, v5, LV1/y;->f:Ljava/lang/Object;

    .line 231
    .line 232
    iput-object v7, v5, LV1/y;->g:Ljava/lang/Object;

    .line 233
    .line 234
    iput-object v10, v5, LV1/y;->i:Ljava/lang/Object;

    .line 235
    .line 236
    iput-object v13, v5, LV1/y;->h:Ljava/lang/Object;

    .line 237
    .line 238
    invoke-virtual {v5}, LV1/y;->i()Lt1/l;

    .line 239
    .line 240
    .line 241
    move-result-object v5

    .line 242
    const-string v7, "HMAC_SHA512_256BITTAG_RAW"

    .line 243
    .line 244
    invoke-virtual {v4, v7, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    .line 246
    .line 247
    const-string v5, "HMAC_SHA512_512BITTAG"

    .line 248
    .line 249
    sget-object v7, Lt1/r;->b:Lt1/l;

    .line 250
    .line 251
    invoke-virtual {v4, v5, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    .line 253
    .line 254
    invoke-static {}, Lt1/l;->b()LV1/y;

    .line 255
    .line 256
    .line 257
    move-result-object v5

    .line 258
    iput-object v11, v5, LV1/y;->f:Ljava/lang/Object;

    .line 259
    .line 260
    iput-object v11, v5, LV1/y;->g:Ljava/lang/Object;

    .line 261
    .line 262
    iput-object v10, v5, LV1/y;->i:Ljava/lang/Object;

    .line 263
    .line 264
    iput-object v13, v5, LV1/y;->h:Ljava/lang/Object;

    .line 265
    .line 266
    invoke-virtual {v5}, LV1/y;->i()Lt1/l;

    .line 267
    .line 268
    .line 269
    move-result-object v5

    .line 270
    const-string v7, "HMAC_SHA512_512BITTAG_RAW"

    .line 271
    .line 272
    invoke-virtual {v4, v7, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    .line 274
    .line 275
    invoke-static {v4}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 276
    .line 277
    .line 278
    move-result-object v4

    .line 279
    invoke-virtual {v3, v4}, Ls1/p;->b(Ljava/util/Map;)V

    .line 280
    .line 281
    .line 282
    sget-object v4, Ls1/l;->b:Ls1/l;

    .line 283
    .line 284
    sget-object v5, Lt1/i;->e:Lk1/i;

    .line 285
    .line 286
    const-class v7, Lt1/l;

    .line 287
    .line 288
    invoke-virtual {v4, v5, v7}, Ls1/l;->a(Lk1/i;Ljava/lang/Class;)V

    .line 289
    .line 290
    .line 291
    sget-object v5, Ls1/m;->b:Ls1/m;

    .line 292
    .line 293
    sget-object v9, Lt1/i;->d:Lk1/h;

    .line 294
    .line 295
    invoke-virtual {v5, v9, v7}, Ls1/m;->a(Lk1/h;Ljava/lang/Class;)V

    .line 296
    .line 297
    .line 298
    sget-object v5, Ls1/b;->d:Ls1/b;

    .line 299
    .line 300
    sget-object v7, Lt1/i;->c:Ls1/g;

    .line 301
    .line 302
    invoke-virtual {v5, v7, v1}, Ls1/b;->e(Ls1/g;I)V

    .line 303
    .line 304
    .line 305
    invoke-static {}, Lo1/a;->a()Z

    .line 306
    .line 307
    .line 308
    move-result v1

    .line 309
    if-eqz v1, :cond_0

    .line 310
    .line 311
    return-void

    .line 312
    :cond_0
    sget-object v1, Lt1/b;->a:Lk1/i;

    .line 313
    .line 314
    const/4 v1, 0x1

    .line 315
    invoke-static {v1}, LE1/j;->e(I)Z

    .line 316
    .line 317
    .line 318
    move-result v1

    .line 319
    if-eqz v1, :cond_1

    .line 320
    .line 321
    sget-object v1, Lu1/a;->a:Ls1/w;

    .line 322
    .line 323
    invoke-virtual {v2, v1}, Ls1/s;->f(Ls1/w;)V

    .line 324
    .line 325
    .line 326
    sget-object v1, Lu1/a;->b:Ls1/u;

    .line 327
    .line 328
    invoke-virtual {v2, v1}, Ls1/s;->e(Ls1/u;)V

    .line 329
    .line 330
    .line 331
    sget-object v1, Lu1/a;->c:Ls1/e;

    .line 332
    .line 333
    invoke-virtual {v2, v1}, Ls1/s;->d(Ls1/e;)V

    .line 334
    .line 335
    .line 336
    sget-object v1, Lu1/a;->d:Ls1/c;

    .line 337
    .line 338
    invoke-virtual {v2, v1}, Ls1/s;->c(Ls1/c;)V

    .line 339
    .line 340
    .line 341
    sget-object v1, Lt1/b;->a:Lk1/i;

    .line 342
    .line 343
    const-class v2, Lt1/d;

    .line 344
    .line 345
    invoke-virtual {v4, v1, v2}, Ls1/l;->a(Lk1/i;Ljava/lang/Class;)V

    .line 346
    .line 347
    .line 348
    sget-object v1, Lt1/b;->b:Ls1/B;

    .line 349
    .line 350
    invoke-virtual {v0, v1}, Ls1/q;->b(Ls1/B;)V

    .line 351
    .line 352
    .line 353
    sget-object v1, Lt1/b;->c:Ls1/B;

    .line 354
    .line 355
    invoke-virtual {v0, v1}, Ls1/q;->b(Ls1/B;)V

    .line 356
    .line 357
    .line 358
    new-instance v0, Ljava/util/HashMap;

    .line 359
    .line 360
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 361
    .line 362
    .line 363
    sget-object v1, Lt1/r;->c:Lt1/d;

    .line 364
    .line 365
    const-string v2, "AES_CMAC"

    .line 366
    .line 367
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 368
    .line 369
    .line 370
    const-string v2, "AES256_CMAC"

    .line 371
    .line 372
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 373
    .line 374
    .line 375
    invoke-static {}, Lt1/d;->b()Lm/x0;

    .line 376
    .line 377
    .line 378
    move-result-object v1

    .line 379
    invoke-virtual {v1, v6}, Lm/x0;->J(I)V

    .line 380
    .line 381
    .line 382
    invoke-virtual {v1, v8}, Lm/x0;->K(I)V

    .line 383
    .line 384
    .line 385
    sget-object v2, Lt1/c;->e:Lt1/c;

    .line 386
    .line 387
    iput-object v2, v1, Lm/x0;->h:Ljava/lang/Object;

    .line 388
    .line 389
    invoke-virtual {v1}, Lm/x0;->w()Lt1/d;

    .line 390
    .line 391
    .line 392
    move-result-object v1

    .line 393
    const-string v2, "AES256_CMAC_RAW"

    .line 394
    .line 395
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 396
    .line 397
    .line 398
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 399
    .line 400
    .line 401
    move-result-object v0

    .line 402
    invoke-virtual {v3, v0}, Ls1/p;->b(Ljava/util/Map;)V

    .line 403
    .line 404
    .line 405
    sget-object v0, Lt1/b;->d:Ls1/g;

    .line 406
    .line 407
    invoke-virtual {v5, v0}, Ls1/b;->d(Ls1/g;)V

    .line 408
    .line 409
    .line 410
    return-void

    .line 411
    :cond_1
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 412
    .line 413
    const-string v1, "Registering AES CMAC is not supported in FIPS mode"

    .line 414
    .line 415
    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 416
    .line 417
    .line 418
    throw v0

    .line 419
    :cond_2
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 420
    .line 421
    const-string v1, "Can not use HMAC in FIPS-mode, as BoringCrypto module is not available."

    .line 422
    .line 423
    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 424
    .line 425
    .line 426
    throw v0
.end method
