.class public final synthetic Lk1/i;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Lk1/i;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lj1/i;Ljava/lang/Integer;)Landroid/support/v4/media/session/a;
    .locals 4

    .line 1
    iget v0, p0, Lk1/i;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    check-cast p1, Lt1/l;

    .line 7
    .line 8
    new-instance v0, Lm/x0;

    .line 9
    .line 10
    const/16 v1, 0x8

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-direct {v0, v2, v1}, Lm/x0;-><init>(CI)V

    .line 14
    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    iput-object v1, v0, Lm/x0;->g:Ljava/lang/Object;

    .line 18
    .line 19
    iput-object v1, v0, Lm/x0;->h:Ljava/lang/Object;

    .line 20
    .line 21
    iput-object p1, v0, Lm/x0;->f:Ljava/lang/Object;

    .line 22
    .line 23
    iget p1, p1, Lt1/l;->a:I

    .line 24
    .line 25
    invoke-static {p1}, Lio/flutter/plugin/editing/j;->r(I)Lio/flutter/plugin/editing/j;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, v0, Lm/x0;->g:Ljava/lang/Object;

    .line 30
    .line 31
    iput-object p2, v0, Lm/x0;->h:Ljava/lang/Object;

    .line 32
    .line 33
    invoke-virtual {v0}, Lm/x0;->x()Lt1/h;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    return-object p1

    .line 38
    :pswitch_0
    check-cast p1, Lt1/d;

    .line 39
    .line 40
    iget v0, p1, Lt1/d;->a:I

    .line 41
    .line 42
    const/16 v1, 0x20

    .line 43
    .line 44
    if-ne v0, v1, :cond_0

    .line 45
    .line 46
    new-instance v1, Lm/x0;

    .line 47
    .line 48
    const/4 v2, 0x6

    .line 49
    const/4 v3, 0x0

    .line 50
    invoke-direct {v1, v3, v2}, Lm/x0;-><init>(CI)V

    .line 51
    .line 52
    .line 53
    const/4 v2, 0x0

    .line 54
    iput-object v2, v1, Lm/x0;->g:Ljava/lang/Object;

    .line 55
    .line 56
    iput-object v2, v1, Lm/x0;->h:Ljava/lang/Object;

    .line 57
    .line 58
    iput-object p1, v1, Lm/x0;->f:Ljava/lang/Object;

    .line 59
    .line 60
    invoke-static {v0}, Lio/flutter/plugin/editing/j;->r(I)Lio/flutter/plugin/editing/j;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iput-object p1, v1, Lm/x0;->g:Ljava/lang/Object;

    .line 65
    .line 66
    iput-object p2, v1, Lm/x0;->h:Ljava/lang/Object;

    .line 67
    .line 68
    invoke-virtual {v1}, Lm/x0;->v()Lt1/a;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    return-object p1

    .line 73
    :cond_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 74
    .line 75
    const-string p2, "AesCmacKey size wrong, must be 32 bytes"

    .line 76
    .line 77
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    throw p1

    .line 81
    :pswitch_1
    check-cast p1, Ls1/j;

    .line 82
    .line 83
    iget-object p1, p1, Ls1/j;->a:Ls1/H;

    .line 84
    .line 85
    iget-object p1, p1, Ls1/H;->b:Lx1/b0;

    .line 86
    .line 87
    sget-object v0, Ls1/b;->d:Ls1/b;

    .line 88
    .line 89
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v0, v1}, Ls1/b;->b(Ljava/lang/String;)Ls1/g;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    iget-object v0, v0, Ls1/b;->b:Ljava/util/concurrent/ConcurrentHashMap;

    .line 102
    .line 103
    invoke-virtual {v0, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Ljava/lang/Boolean;

    .line 108
    .line 109
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_1

    .line 114
    .line 115
    invoke-virtual {p1}, Lx1/b0;->F()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 120
    .line 121
    .line 122
    invoke-static {}, Lx1/b0;->G()Lx1/a0;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    iget-object v1, v1, Ls1/g;->a:Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {v2, v1}, Lx1/a0;->i(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v2, v0}, Lx1/a0;->j(Lcom/google/crypto/tink/shaded/protobuf/i;)V

    .line 132
    .line 133
    .line 134
    sget-object v0, Lx1/t0;->i:Lx1/t0;

    .line 135
    .line 136
    invoke-virtual {v2, v0}, Lx1/a0;->h(Lx1/t0;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    check-cast v0, Lx1/b0;

    .line 144
    .line 145
    new-instance v1, Ls1/H;

    .line 146
    .line 147
    invoke-virtual {v0}, Lx1/b0;->E()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    invoke-static {v2}, Ls1/N;->a(Ljava/lang/String;)Lz1/a;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    invoke-direct {v1, v0, v2}, Ls1/H;-><init>(Lx1/b0;Lz1/a;)V

    .line 156
    .line 157
    .line 158
    sget-object v0, Ls1/s;->b:Ls1/s;

    .line 159
    .line 160
    invoke-virtual {v0, v1}, Ls1/s;->b(Ls1/H;)Lj1/i;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    sget-object v2, Ls1/l;->b:Ls1/l;

    .line 165
    .line 166
    const/4 v3, 0x0

    .line 167
    invoke-virtual {v2, v1, v3}, Ls1/l;->b(Lj1/i;Ljava/lang/Integer;)Landroid/support/v4/media/session/a;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-virtual {v0, v1}, Ls1/s;->g(Landroid/support/v4/media/session/a;)Ls1/J;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    check-cast v0, Ls1/G;

    .line 176
    .line 177
    invoke-static {}, Lx1/Y;->G()Lx1/W;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    iget-object v2, v0, Ls1/G;->a:Ljava/lang/String;

    .line 182
    .line 183
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 184
    .line 185
    .line 186
    iget-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 187
    .line 188
    check-cast v3, Lx1/Y;

    .line 189
    .line 190
    invoke-static {v3, v2}, Lx1/Y;->z(Lx1/Y;Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    iget-object v2, v0, Ls1/G;->c:Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 194
    .line 195
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 196
    .line 197
    .line 198
    iget-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 199
    .line 200
    check-cast v3, Lx1/Y;

    .line 201
    .line 202
    invoke-static {v3, v2}, Lx1/Y;->A(Lx1/Y;Lcom/google/crypto/tink/shaded/protobuf/i;)V

    .line 203
    .line 204
    .line 205
    iget-object v0, v0, Ls1/G;->d:Lx1/X;

    .line 206
    .line 207
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 208
    .line 209
    .line 210
    iget-object v2, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 211
    .line 212
    check-cast v2, Lx1/Y;

    .line 213
    .line 214
    invoke-static {v2, v0}, Lx1/Y;->B(Lx1/Y;Lx1/X;)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    check-cast v0, Lx1/Y;

    .line 222
    .line 223
    invoke-virtual {v0}, Lx1/Y;->E()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    invoke-virtual {v0}, Lx1/Y;->F()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 228
    .line 229
    .line 230
    move-result-object v2

    .line 231
    invoke-virtual {v0}, Lx1/Y;->D()Lx1/X;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    invoke-virtual {p1}, Lx1/b0;->D()Lx1/t0;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    invoke-static {v1, v2, v0, p1, p2}, Ls1/G;->a(Ljava/lang/String;Lcom/google/crypto/tink/shaded/protobuf/i;Lx1/X;Lx1/t0;Ljava/lang/Integer;)Ls1/G;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    new-instance p2, Ls1/i;

    .line 244
    .line 245
    invoke-direct {p2, p1}, Ls1/i;-><init>(Ls1/G;)V

    .line 246
    .line 247
    .line 248
    return-object p2

    .line 249
    :cond_1
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 250
    .line 251
    const-string p2, "Creating new keys is not allowed."

    .line 252
    .line 253
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    throw p1

    .line 257
    :pswitch_2
    check-cast p1, Lp1/d;

    .line 258
    .line 259
    invoke-static {p1}, Lp1/b;->a(Lp1/d;)V

    .line 260
    .line 261
    .line 262
    new-instance v0, Lm/x0;

    .line 263
    .line 264
    const/4 v1, 0x1

    .line 265
    const/4 v2, 0x0

    .line 266
    invoke-direct {v0, v2, v1}, Lm/x0;-><init>(CI)V

    .line 267
    .line 268
    .line 269
    const/4 v1, 0x0

    .line 270
    iput-object v1, v0, Lm/x0;->g:Ljava/lang/Object;

    .line 271
    .line 272
    iput-object p1, v0, Lm/x0;->f:Ljava/lang/Object;

    .line 273
    .line 274
    iput-object p2, v0, Lm/x0;->h:Ljava/lang/Object;

    .line 275
    .line 276
    iget p1, p1, Lp1/d;->a:I

    .line 277
    .line 278
    invoke-static {p1}, Lio/flutter/plugin/editing/j;->r(I)Lio/flutter/plugin/editing/j;

    .line 279
    .line 280
    .line 281
    move-result-object p1

    .line 282
    iput-object p1, v0, Lm/x0;->g:Ljava/lang/Object;

    .line 283
    .line 284
    invoke-virtual {v0}, Lm/x0;->u()Lp1/a;

    .line 285
    .line 286
    .line 287
    move-result-object p1

    .line 288
    return-object p1

    .line 289
    :pswitch_3
    check-cast p1, Lk1/N;

    .line 290
    .line 291
    iget-object p1, p1, Lk1/N;->a:Lk1/k;

    .line 292
    .line 293
    const/16 v0, 0x20

    .line 294
    .line 295
    invoke-static {v0}, Lio/flutter/plugin/editing/j;->r(I)Lio/flutter/plugin/editing/j;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    invoke-static {p1, v0, p2}, Lk1/L;->d0(Lk1/k;Lio/flutter/plugin/editing/j;Ljava/lang/Integer;)Lk1/L;

    .line 300
    .line 301
    .line 302
    move-result-object p1

    .line 303
    return-object p1

    .line 304
    :pswitch_4
    check-cast p1, Lk1/K;

    .line 305
    .line 306
    const/16 v0, 0x20

    .line 307
    .line 308
    invoke-static {v0}, Lio/flutter/plugin/editing/j;->r(I)Lio/flutter/plugin/editing/j;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    invoke-static {p1, v0, p2}, Lk1/I;->d0(Lk1/K;Lio/flutter/plugin/editing/j;Ljava/lang/Integer;)Lk1/I;

    .line 313
    .line 314
    .line 315
    move-result-object p1

    .line 316
    return-object p1

    .line 317
    :pswitch_5
    check-cast p1, Lk1/F;

    .line 318
    .line 319
    invoke-static {p1, p2}, Lk1/E;->d0(Lk1/F;Ljava/lang/Integer;)Lk1/E;

    .line 320
    .line 321
    .line 322
    move-result-object p1

    .line 323
    return-object p1

    .line 324
    :pswitch_6
    check-cast p1, Lk1/C;

    .line 325
    .line 326
    invoke-static {p1, p2}, Lk1/B;->d0(Lk1/C;Ljava/lang/Integer;)Lk1/B;

    .line 327
    .line 328
    .line 329
    move-result-object p1

    .line 330
    return-object p1

    .line 331
    :pswitch_7
    check-cast p1, Lk1/x;

    .line 332
    .line 333
    iget-object p1, p1, Lk1/x;->a:Lk1/k;

    .line 334
    .line 335
    const/16 v0, 0x20

    .line 336
    .line 337
    invoke-static {v0}, Lio/flutter/plugin/editing/j;->r(I)Lio/flutter/plugin/editing/j;

    .line 338
    .line 339
    .line 340
    move-result-object v0

    .line 341
    invoke-static {p1, v0, p2}, Lk1/v;->d0(Lk1/k;Lio/flutter/plugin/editing/j;Ljava/lang/Integer;)Lk1/v;

    .line 342
    .line 343
    .line 344
    move-result-object p1

    .line 345
    return-object p1

    .line 346
    :pswitch_8
    check-cast p1, Lk1/u;

    .line 347
    .line 348
    new-instance v0, LB2/a;

    .line 349
    .line 350
    const/16 v1, 0x1b

    .line 351
    .line 352
    invoke-direct {v0, v1}, LB2/a;-><init>(I)V

    .line 353
    .line 354
    .line 355
    const/4 v1, 0x0

    .line 356
    iput-object v1, v0, LB2/a;->g:Ljava/lang/Object;

    .line 357
    .line 358
    iput-object p1, v0, LB2/a;->f:Ljava/lang/Object;

    .line 359
    .line 360
    iput-object p2, v0, LB2/a;->h:Ljava/lang/Object;

    .line 361
    .line 362
    iget p1, p1, Lk1/u;->a:I

    .line 363
    .line 364
    invoke-static {p1}, Lio/flutter/plugin/editing/j;->r(I)Lio/flutter/plugin/editing/j;

    .line 365
    .line 366
    .line 367
    move-result-object p1

    .line 368
    iput-object p1, v0, LB2/a;->g:Ljava/lang/Object;

    .line 369
    .line 370
    invoke-virtual {v0}, LB2/a;->k()Lk1/s;

    .line 371
    .line 372
    .line 373
    move-result-object p1

    .line 374
    return-object p1

    .line 375
    :pswitch_9
    check-cast p1, Lk1/r;

    .line 376
    .line 377
    iget v0, p1, Lk1/r;->a:I

    .line 378
    .line 379
    const/16 v1, 0x18

    .line 380
    .line 381
    if-eq v0, v1, :cond_2

    .line 382
    .line 383
    new-instance v1, LB2/a;

    .line 384
    .line 385
    const/16 v2, 0x1a

    .line 386
    .line 387
    invoke-direct {v1, v2}, LB2/a;-><init>(I)V

    .line 388
    .line 389
    .line 390
    const/4 v2, 0x0

    .line 391
    iput-object v2, v1, LB2/a;->g:Ljava/lang/Object;

    .line 392
    .line 393
    iput-object p1, v1, LB2/a;->f:Ljava/lang/Object;

    .line 394
    .line 395
    iput-object p2, v1, LB2/a;->h:Ljava/lang/Object;

    .line 396
    .line 397
    invoke-static {v0}, Lio/flutter/plugin/editing/j;->r(I)Lio/flutter/plugin/editing/j;

    .line 398
    .line 399
    .line 400
    move-result-object p1

    .line 401
    iput-object p1, v1, LB2/a;->g:Ljava/lang/Object;

    .line 402
    .line 403
    invoke-virtual {v1}, LB2/a;->j()Lk1/p;

    .line 404
    .line 405
    .line 406
    move-result-object p1

    .line 407
    return-object p1

    .line 408
    :cond_2
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 409
    .line 410
    const-string p2, "192 bit AES GCM Parameters are not valid"

    .line 411
    .line 412
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 413
    .line 414
    .line 415
    throw p1

    .line 416
    :pswitch_a
    check-cast p1, Lk1/o;

    .line 417
    .line 418
    iget v0, p1, Lk1/o;->a:I

    .line 419
    .line 420
    const/16 v1, 0x18

    .line 421
    .line 422
    if-eq v0, v1, :cond_3

    .line 423
    .line 424
    new-instance v1, LB2/a;

    .line 425
    .line 426
    const/16 v2, 0x19

    .line 427
    .line 428
    invoke-direct {v1, v2}, LB2/a;-><init>(I)V

    .line 429
    .line 430
    .line 431
    const/4 v2, 0x0

    .line 432
    iput-object v2, v1, LB2/a;->g:Ljava/lang/Object;

    .line 433
    .line 434
    iput-object p1, v1, LB2/a;->f:Ljava/lang/Object;

    .line 435
    .line 436
    iput-object p2, v1, LB2/a;->h:Ljava/lang/Object;

    .line 437
    .line 438
    invoke-static {v0}, Lio/flutter/plugin/editing/j;->r(I)Lio/flutter/plugin/editing/j;

    .line 439
    .line 440
    .line 441
    move-result-object p1

    .line 442
    iput-object p1, v1, LB2/a;->g:Ljava/lang/Object;

    .line 443
    .line 444
    invoke-virtual {v1}, LB2/a;->i()Lk1/m;

    .line 445
    .line 446
    .line 447
    move-result-object p1

    .line 448
    return-object p1

    .line 449
    :cond_3
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 450
    .line 451
    const-string p2, "192 bit AES GCM Parameters are not valid"

    .line 452
    .line 453
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 454
    .line 455
    .line 456
    throw p1

    .line 457
    :pswitch_b
    check-cast p1, Lk1/l;

    .line 458
    .line 459
    iget v0, p1, Lk1/l;->a:I

    .line 460
    .line 461
    const/16 v1, 0x10

    .line 462
    .line 463
    if-eq v0, v1, :cond_5

    .line 464
    .line 465
    const/16 v1, 0x20

    .line 466
    .line 467
    if-ne v0, v1, :cond_4

    .line 468
    .line 469
    goto :goto_0

    .line 470
    :cond_4
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 471
    .line 472
    const-string p2, "AES key size must be 16 or 32 bytes"

    .line 473
    .line 474
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 475
    .line 476
    .line 477
    throw p1

    .line 478
    :cond_5
    :goto_0
    new-instance v1, LV1/y;

    .line 479
    .line 480
    const/16 v2, 0xa

    .line 481
    .line 482
    const/4 v3, 0x0

    .line 483
    invoke-direct {v1, v2, v3}, LV1/y;-><init>(IZ)V

    .line 484
    .line 485
    .line 486
    const/4 v2, 0x0

    .line 487
    iput-object v2, v1, LV1/y;->g:Ljava/lang/Object;

    .line 488
    .line 489
    iput-object v2, v1, LV1/y;->h:Ljava/lang/Object;

    .line 490
    .line 491
    iput-object p1, v1, LV1/y;->f:Ljava/lang/Object;

    .line 492
    .line 493
    iput-object p2, v1, LV1/y;->i:Ljava/lang/Object;

    .line 494
    .line 495
    invoke-static {v0}, Lio/flutter/plugin/editing/j;->r(I)Lio/flutter/plugin/editing/j;

    .line 496
    .line 497
    .line 498
    move-result-object p2

    .line 499
    iput-object p2, v1, LV1/y;->g:Ljava/lang/Object;

    .line 500
    .line 501
    iget p1, p1, Lk1/l;->b:I

    .line 502
    .line 503
    invoke-static {p1}, Lio/flutter/plugin/editing/j;->r(I)Lio/flutter/plugin/editing/j;

    .line 504
    .line 505
    .line 506
    move-result-object p1

    .line 507
    iput-object p1, v1, LV1/y;->h:Ljava/lang/Object;

    .line 508
    .line 509
    invoke-virtual {v1}, LV1/y;->e()Lk1/g;

    .line 510
    .line 511
    .line 512
    move-result-object p1

    .line 513
    return-object p1

    .line 514
    nop

    .line 515
    :pswitch_data_0
    .packed-switch 0x0
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
