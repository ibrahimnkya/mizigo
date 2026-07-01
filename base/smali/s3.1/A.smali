.class public final synthetic Ls3/A;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lk3/b;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Ls3/j;


# direct methods
.method public synthetic constructor <init>(Ls3/j;I)V
    .locals 0

    .line 1
    iput p2, p0, Ls3/A;->e:I

    iput-object p1, p0, Ls3/A;->f:Ls3/j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;LZ2/s;)V
    .locals 5

    .line 1
    iget v0, p0, Ls3/A;->e:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    iget-object v3, p0, Ls3/A;->f:Ls3/j;

    .line 6
    .line 7
    packed-switch v0, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    new-instance p1, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    :try_start_0
    iget-object v0, v3, Ls3/j;->j:LB2/a;

    .line 16
    .line 17
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, LB2/a;->D()LA0/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    .line 27
    :try_start_1
    iget-object v0, v0, LA0/c;->f:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast v0, Ld1/c;

    .line 30
    .line 31
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    const/16 v4, 0xc

    .line 36
    .line 37
    invoke-virtual {v0, v3, v4}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sget v3, LZ0/r;->a:I

    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_0

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    move v1, v2

    .line 51
    :goto_0
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 52
    .line 53
    .line 54
    :try_start_2
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p1, v2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    goto :goto_2

    .line 62
    :catchall_0
    move-exception p1

    .line 63
    goto :goto_1

    .line 64
    :catch_0
    move-exception p1

    .line 65
    new-instance v0, Le1/x;

    .line 66
    .line 67
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 68
    .line 69
    .line 70
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 71
    :goto_1
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    :goto_2
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :pswitch_0
    new-instance p1, Ljava/util/ArrayList;

    .line 80
    .line 81
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 82
    .line 83
    .line 84
    :try_start_3
    iget-object v0, v3, Ls3/j;->j:LB2/a;

    .line 85
    .line 86
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0}, LB2/a;->D()LA0/c;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 94
    .line 95
    .line 96
    :try_start_4
    iget-object v0, v0, LA0/c;->f:Ljava/lang/Object;

    .line 97
    .line 98
    check-cast v0, Ld1/c;

    .line 99
    .line 100
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    const/16 v4, 0x9

    .line 105
    .line 106
    invoke-virtual {v0, v3, v4}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    sget v3, LZ0/r;->a:I

    .line 111
    .line 112
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    if-eqz v3, :cond_1

    .line 117
    .line 118
    goto :goto_3

    .line 119
    :cond_1
    move v1, v2

    .line 120
    :goto_3
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 121
    .line 122
    .line 123
    :try_start_5
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {p1, v2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 128
    .line 129
    .line 130
    goto :goto_5

    .line 131
    :catchall_1
    move-exception p1

    .line 132
    goto :goto_4

    .line 133
    :catch_1
    move-exception p1

    .line 134
    new-instance v0, Le1/x;

    .line 135
    .line 136
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 137
    .line 138
    .line 139
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 140
    :goto_4
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    :goto_5
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    :pswitch_1
    new-instance p1, Ljava/util/ArrayList;

    .line 149
    .line 150
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 151
    .line 152
    .line 153
    :try_start_6
    iget-object v0, v3, Ls3/j;->j:LB2/a;

    .line 154
    .line 155
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0}, LB2/a;->D()LA0/c;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 163
    .line 164
    .line 165
    :try_start_7
    iget-object v0, v0, LA0/c;->f:Ljava/lang/Object;

    .line 166
    .line 167
    check-cast v0, Ld1/c;

    .line 168
    .line 169
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 170
    .line 171
    .line 172
    move-result-object v3

    .line 173
    const/16 v4, 0xf

    .line 174
    .line 175
    invoke-virtual {v0, v3, v4}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    sget v3, LZ0/r;->a:I

    .line 180
    .line 181
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 182
    .line 183
    .line 184
    move-result v3

    .line 185
    if-eqz v3, :cond_2

    .line 186
    .line 187
    goto :goto_6

    .line 188
    :cond_2
    move v1, v2

    .line 189
    :goto_6
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V
    :try_end_7
    .catch Landroid/os/RemoteException; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 190
    .line 191
    .line 192
    :try_start_8
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {p1, v2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 197
    .line 198
    .line 199
    goto :goto_8

    .line 200
    :catchall_2
    move-exception p1

    .line 201
    goto :goto_7

    .line 202
    :catch_2
    move-exception p1

    .line 203
    new-instance v0, Le1/x;

    .line 204
    .line 205
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 206
    .line 207
    .line 208
    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 209
    :goto_7
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    :goto_8
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 214
    .line 215
    .line 216
    return-void

    .line 217
    :pswitch_2
    new-instance p1, Ljava/util/ArrayList;

    .line 218
    .line 219
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 220
    .line 221
    .line 222
    :try_start_9
    iget-object v0, v3, Ls3/j;->j:LB2/a;

    .line 223
    .line 224
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    invoke-virtual {v0}, LB2/a;->x()Lcom/google/android/gms/maps/model/CameraPosition;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    invoke-static {v0}, Landroid/support/v4/media/session/a;->b(Lcom/google/android/gms/maps/model/CameraPosition;)Ls3/K;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    invoke-virtual {p1, v2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 236
    .line 237
    .line 238
    goto :goto_9

    .line 239
    :catchall_3
    move-exception p1

    .line 240
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 241
    .line 242
    .line 243
    move-result-object p1

    .line 244
    :goto_9
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 245
    .line 246
    .line 247
    return-void

    .line 248
    :pswitch_3
    new-instance v0, Ljava/util/ArrayList;

    .line 249
    .line 250
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 251
    .line 252
    .line 253
    check-cast p1, Ljava/util/ArrayList;

    .line 254
    .line 255
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    check-cast p1, Ljava/lang/String;

    .line 260
    .line 261
    :try_start_a
    invoke-virtual {v3, p1}, Ls3/j;->K(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 262
    .line 263
    .line 264
    move-result-object p1

    .line 265
    invoke-virtual {v0, v2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    .line 266
    .line 267
    .line 268
    goto :goto_a

    .line 269
    :catchall_4
    move-exception p1

    .line 270
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 271
    .line 272
    .line 273
    move-result-object v0

    .line 274
    :goto_a
    invoke-virtual {p2, v0}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 275
    .line 276
    .line 277
    return-void

    .line 278
    :pswitch_4
    new-instance p1, Ljava/util/ArrayList;

    .line 279
    .line 280
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 281
    .line 282
    .line 283
    :try_start_b
    invoke-virtual {v3}, Ls3/j;->P()Ls3/C0;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    invoke-virtual {p1, v2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    .line 288
    .line 289
    .line 290
    goto :goto_b

    .line 291
    :catchall_5
    move-exception p1

    .line 292
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 293
    .line 294
    .line 295
    move-result-object p1

    .line 296
    :goto_b
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 297
    .line 298
    .line 299
    return-void

    .line 300
    :pswitch_5
    new-instance v0, Ljava/util/ArrayList;

    .line 301
    .line 302
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 303
    .line 304
    .line 305
    check-cast p1, Ljava/util/ArrayList;

    .line 306
    .line 307
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 308
    .line 309
    .line 310
    move-result-object p1

    .line 311
    check-cast p1, Ljava/lang/String;

    .line 312
    .line 313
    :try_start_c
    invoke-virtual {v3, p1}, Ls3/j;->L(Ljava/lang/String;)Ls3/e0;

    .line 314
    .line 315
    .line 316
    move-result-object p1

    .line 317
    invoke-virtual {v0, v2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_6

    .line 318
    .line 319
    .line 320
    goto :goto_c

    .line 321
    :catchall_6
    move-exception p1

    .line 322
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 323
    .line 324
    .line 325
    move-result-object v0

    .line 326
    :goto_c
    invoke-virtual {p2, v0}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 327
    .line 328
    .line 329
    return-void

    .line 330
    :pswitch_6
    new-instance v0, Ljava/util/ArrayList;

    .line 331
    .line 332
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 333
    .line 334
    .line 335
    check-cast p1, Ljava/util/ArrayList;

    .line 336
    .line 337
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 338
    .line 339
    .line 340
    move-result-object p1

    .line 341
    check-cast p1, Ljava/lang/String;

    .line 342
    .line 343
    :try_start_d
    invoke-virtual {v3, p1}, Ls3/j;->O(Ljava/lang/String;)Ls3/z0;

    .line 344
    .line 345
    .line 346
    move-result-object p1

    .line 347
    invoke-virtual {v0, v2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_7

    .line 348
    .line 349
    .line 350
    goto :goto_d

    .line 351
    :catchall_7
    move-exception p1

    .line 352
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 353
    .line 354
    .line 355
    move-result-object v0

    .line 356
    :goto_d
    invoke-virtual {p2, v0}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 357
    .line 358
    .line 359
    return-void

    .line 360
    :pswitch_7
    new-instance p1, Ljava/util/ArrayList;

    .line 361
    .line 362
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 363
    .line 364
    .line 365
    :try_start_e
    iget-object v0, v3, Ls3/j;->j:LB2/a;

    .line 366
    .line 367
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_8

    .line 368
    .line 369
    .line 370
    :try_start_f
    iget-object v0, v0, LB2/a;->f:Ljava/lang/Object;

    .line 371
    .line 372
    check-cast v0, Ld1/g;

    .line 373
    .line 374
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 375
    .line 376
    .line 377
    move-result-object v3

    .line 378
    const/16 v4, 0x11

    .line 379
    .line 380
    invoke-virtual {v0, v3, v4}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 381
    .line 382
    .line 383
    move-result-object v0

    .line 384
    sget v3, LZ0/r;->a:I

    .line 385
    .line 386
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 387
    .line 388
    .line 389
    move-result v3

    .line 390
    if-eqz v3, :cond_3

    .line 391
    .line 392
    goto :goto_e

    .line 393
    :cond_3
    move v1, v2

    .line 394
    :goto_e
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V
    :try_end_f
    .catch Landroid/os/RemoteException; {:try_start_f .. :try_end_f} :catch_3
    .catchall {:try_start_f .. :try_end_f} :catchall_8

    .line 395
    .line 396
    .line 397
    :try_start_10
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 398
    .line 399
    .line 400
    move-result-object v0

    .line 401
    invoke-virtual {p1, v2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 402
    .line 403
    .line 404
    goto :goto_10

    .line 405
    :catchall_8
    move-exception p1

    .line 406
    goto :goto_f

    .line 407
    :catch_3
    move-exception p1

    .line 408
    new-instance v0, Le1/x;

    .line 409
    .line 410
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 411
    .line 412
    .line 413
    throw v0
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_8

    .line 414
    :goto_f
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 415
    .line 416
    .line 417
    move-result-object p1

    .line 418
    :goto_10
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 419
    .line 420
    .line 421
    return-void

    .line 422
    :pswitch_8
    new-instance p1, Ljava/util/ArrayList;

    .line 423
    .line 424
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 425
    .line 426
    .line 427
    :try_start_11
    iget-object v0, v3, Ls3/j;->j:LB2/a;

    .line 428
    .line 429
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 430
    .line 431
    .line 432
    invoke-virtual {v0}, LB2/a;->D()LA0/c;

    .line 433
    .line 434
    .line 435
    move-result-object v0

    .line 436
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_9

    .line 437
    .line 438
    .line 439
    :try_start_12
    iget-object v0, v0, LA0/c;->f:Ljava/lang/Object;

    .line 440
    .line 441
    check-cast v0, Ld1/c;

    .line 442
    .line 443
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 444
    .line 445
    .line 446
    move-result-object v3

    .line 447
    const/16 v4, 0xb

    .line 448
    .line 449
    invoke-virtual {v0, v3, v4}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 450
    .line 451
    .line 452
    move-result-object v0

    .line 453
    sget v3, LZ0/r;->a:I

    .line 454
    .line 455
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 456
    .line 457
    .line 458
    move-result v3

    .line 459
    if-eqz v3, :cond_4

    .line 460
    .line 461
    goto :goto_11

    .line 462
    :cond_4
    move v1, v2

    .line 463
    :goto_11
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V
    :try_end_12
    .catch Landroid/os/RemoteException; {:try_start_12 .. :try_end_12} :catch_4
    .catchall {:try_start_12 .. :try_end_12} :catchall_9

    .line 464
    .line 465
    .line 466
    :try_start_13
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 467
    .line 468
    .line 469
    move-result-object v0

    .line 470
    invoke-virtual {p1, v2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 471
    .line 472
    .line 473
    goto :goto_13

    .line 474
    :catchall_9
    move-exception p1

    .line 475
    goto :goto_12

    .line 476
    :catch_4
    move-exception p1

    .line 477
    new-instance v0, Le1/x;

    .line 478
    .line 479
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 480
    .line 481
    .line 482
    throw v0
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_9

    .line 483
    :goto_12
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 484
    .line 485
    .line 486
    move-result-object p1

    .line 487
    :goto_13
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 488
    .line 489
    .line 490
    return-void

    .line 491
    :pswitch_data_0
    .packed-switch 0x0
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
