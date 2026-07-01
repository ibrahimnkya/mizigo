.class public final synthetic Ls3/y;
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
    iput p2, p0, Ls3/y;->e:I

    iput-object p1, p0, Ls3/y;->f:Ls3/j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;LZ2/s;)V
    .locals 9

    .line 1
    iget v0, p0, Ls3/y;->e:I

    .line 2
    .line 3
    const-string v1, "Invalid markerId"

    .line 4
    .line 5
    const/16 v2, 0xe

    .line 6
    .line 7
    const-string v3, "GoogleMap uninitialized"

    .line 8
    .line 9
    const/4 v4, 0x2

    .line 10
    const/4 v5, 0x1

    .line 11
    const/4 v6, 0x0

    .line 12
    const/4 v7, 0x0

    .line 13
    iget-object v8, p0, Ls3/y;->f:Ls3/j;

    .line 14
    .line 15
    packed-switch v0, :pswitch_data_0

    .line 16
    .line 17
    .line 18
    new-instance p1, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    :try_start_0
    iget-object v0, v8, Ls3/j;->j:LB2/a;

    .line 24
    .line 25
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, LB2/a;->D()LA0/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    .line 34
    .line 35
    :try_start_1
    iget-object v0, v0, LA0/c;->f:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast v0, Ld1/c;

    .line 38
    .line 39
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const/16 v2, 0x13

    .line 44
    .line 45
    invoke-virtual {v0, v1, v2}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    sget v1, LZ0/r;->a:I

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_0

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    move v5, v7

    .line 59
    :goto_0
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    .line 61
    .line 62
    :try_start_2
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p1, v7, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    goto :goto_2

    .line 70
    :catchall_0
    move-exception p1

    .line 71
    goto :goto_1

    .line 72
    :catch_0
    move-exception p1

    .line 73
    new-instance v0, Le1/x;

    .line 74
    .line 75
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 76
    .line 77
    .line 78
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 79
    :goto_1
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    :goto_2
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :pswitch_0
    new-instance p1, Ljava/util/ArrayList;

    .line 88
    .line 89
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 90
    .line 91
    .line 92
    :try_start_3
    iget-object v0, v8, Ls3/j;->h:Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 93
    .line 94
    iget-object v0, v0, Lcom/google/android/gms/maps/GoogleMapOptions;->o:Ljava/lang/Boolean;

    .line 95
    .line 96
    invoke-virtual {p1, v7, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 97
    .line 98
    .line 99
    goto :goto_3

    .line 100
    :catchall_1
    move-exception p1

    .line 101
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    :goto_3
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :pswitch_1
    new-instance p1, Ljava/util/ArrayList;

    .line 110
    .line 111
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 112
    .line 113
    .line 114
    :try_start_4
    iget-object v0, v8, Ls3/j;->j:LB2/a;

    .line 115
    .line 116
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0}, LB2/a;->D()LA0/c;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 124
    .line 125
    .line 126
    :try_start_5
    iget-object v0, v0, LA0/c;->f:Ljava/lang/Object;

    .line 127
    .line 128
    check-cast v0, Ld1/c;

    .line 129
    .line 130
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    const/16 v2, 0xa

    .line 135
    .line 136
    invoke-virtual {v0, v1, v2}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    sget v1, LZ0/r;->a:I

    .line 141
    .line 142
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    if-eqz v1, :cond_1

    .line 147
    .line 148
    goto :goto_4

    .line 149
    :cond_1
    move v5, v7

    .line 150
    :goto_4
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 151
    .line 152
    .line 153
    :try_start_6
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-virtual {p1, v7, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 158
    .line 159
    .line 160
    goto :goto_6

    .line 161
    :catchall_2
    move-exception p1

    .line 162
    goto :goto_5

    .line 163
    :catch_1
    move-exception p1

    .line 164
    new-instance v0, Le1/x;

    .line 165
    .line 166
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 167
    .line 168
    .line 169
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 170
    :goto_5
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    :goto_6
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :pswitch_2
    new-instance p1, Ljava/util/ArrayList;

    .line 179
    .line 180
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 181
    .line 182
    .line 183
    :try_start_7
    iget-object v0, v8, Ls3/j;->j:LB2/a;

    .line 184
    .line 185
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v0}, LB2/a;->D()LA0/c;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 193
    .line 194
    .line 195
    :try_start_8
    iget-object v0, v0, LA0/c;->f:Ljava/lang/Object;

    .line 196
    .line 197
    check-cast v0, Ld1/c;

    .line 198
    .line 199
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    const/16 v2, 0xd

    .line 204
    .line 205
    invoke-virtual {v0, v1, v2}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    sget v1, LZ0/r;->a:I

    .line 210
    .line 211
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    if-eqz v1, :cond_2

    .line 216
    .line 217
    goto :goto_7

    .line 218
    :cond_2
    move v5, v7

    .line 219
    :goto_7
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V
    :try_end_8
    .catch Landroid/os/RemoteException; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 220
    .line 221
    .line 222
    :try_start_9
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    invoke-virtual {p1, v7, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 227
    .line 228
    .line 229
    goto :goto_9

    .line 230
    :catchall_3
    move-exception p1

    .line 231
    goto :goto_8

    .line 232
    :catch_2
    move-exception p1

    .line 233
    new-instance v0, Le1/x;

    .line 234
    .line 235
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 236
    .line 237
    .line 238
    throw v0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 239
    :goto_8
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    :goto_9
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 244
    .line 245
    .line 246
    return-void

    .line 247
    :pswitch_3
    new-instance p1, Ljava/util/ArrayList;

    .line 248
    .line 249
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 250
    .line 251
    .line 252
    :try_start_a
    iget-object v0, v8, Ls3/j;->j:LB2/a;

    .line 253
    .line 254
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    .line 256
    .line 257
    invoke-virtual {v0}, LB2/a;->D()LA0/c;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    .line 262
    .line 263
    .line 264
    :try_start_b
    iget-object v0, v0, LA0/c;->f:Ljava/lang/Object;

    .line 265
    .line 266
    check-cast v0, Ld1/c;

    .line 267
    .line 268
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 269
    .line 270
    .line 271
    move-result-object v1

    .line 272
    invoke-virtual {v0, v1, v2}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    sget v1, LZ0/r;->a:I

    .line 277
    .line 278
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 279
    .line 280
    .line 281
    move-result v1

    .line 282
    if-eqz v1, :cond_3

    .line 283
    .line 284
    goto :goto_a

    .line 285
    :cond_3
    move v5, v7

    .line 286
    :goto_a
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V
    :try_end_b
    .catch Landroid/os/RemoteException; {:try_start_b .. :try_end_b} :catch_3
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    .line 287
    .line 288
    .line 289
    :try_start_c
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 290
    .line 291
    .line 292
    move-result-object v0

    .line 293
    invoke-virtual {p1, v7, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 294
    .line 295
    .line 296
    goto :goto_c

    .line 297
    :catchall_4
    move-exception p1

    .line 298
    goto :goto_b

    .line 299
    :catch_3
    move-exception p1

    .line 300
    new-instance v0, Le1/x;

    .line 301
    .line 302
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 303
    .line 304
    .line 305
    throw v0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    .line 306
    :goto_b
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 307
    .line 308
    .line 309
    move-result-object p1

    .line 310
    :goto_c
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 311
    .line 312
    .line 313
    return-void

    .line 314
    :pswitch_4
    new-instance p1, Ljava/util/ArrayList;

    .line 315
    .line 316
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 317
    .line 318
    .line 319
    :try_start_d
    iget-object v0, v8, Ls3/j;->j:LB2/a;

    .line 320
    .line 321
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_5

    .line 322
    .line 323
    .line 324
    :try_start_e
    iget-object v0, v0, LB2/a;->f:Ljava/lang/Object;

    .line 325
    .line 326
    check-cast v0, Ld1/g;

    .line 327
    .line 328
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 329
    .line 330
    .line 331
    move-result-object v1

    .line 332
    const/16 v2, 0x28

    .line 333
    .line 334
    invoke-virtual {v0, v1, v2}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 335
    .line 336
    .line 337
    move-result-object v0

    .line 338
    sget v1, LZ0/r;->a:I

    .line 339
    .line 340
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 341
    .line 342
    .line 343
    move-result v1

    .line 344
    if-eqz v1, :cond_4

    .line 345
    .line 346
    goto :goto_d

    .line 347
    :cond_4
    move v5, v7

    .line 348
    :goto_d
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V
    :try_end_e
    .catch Landroid/os/RemoteException; {:try_start_e .. :try_end_e} :catch_4
    .catchall {:try_start_e .. :try_end_e} :catchall_5

    .line 349
    .line 350
    .line 351
    :try_start_f
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 352
    .line 353
    .line 354
    move-result-object v0

    .line 355
    invoke-virtual {p1, v7, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 356
    .line 357
    .line 358
    goto :goto_f

    .line 359
    :catchall_5
    move-exception p1

    .line 360
    goto :goto_e

    .line 361
    :catch_4
    move-exception p1

    .line 362
    new-instance v0, Le1/x;

    .line 363
    .line 364
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 365
    .line 366
    .line 367
    throw v0
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_5

    .line 368
    :goto_e
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 369
    .line 370
    .line 371
    move-result-object p1

    .line 372
    :goto_f
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 373
    .line 374
    .line 375
    return-void

    .line 376
    :pswitch_5
    new-instance v0, Ljava/util/ArrayList;

    .line 377
    .line 378
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 379
    .line 380
    .line 381
    check-cast p1, Ljava/util/ArrayList;

    .line 382
    .line 383
    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 384
    .line 385
    .line 386
    move-result-object p1

    .line 387
    check-cast p1, Ljava/lang/String;

    .line 388
    .line 389
    :try_start_10
    iget-object v2, v8, Ls3/j;->w:Ls3/w;

    .line 390
    .line 391
    iget-object v2, v2, Ls3/w;->b:Ljava/util/HashMap;

    .line 392
    .line 393
    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 394
    .line 395
    .line 396
    move-result-object p1

    .line 397
    check-cast p1, Ls3/u;

    .line 398
    .line 399
    if-eqz p1, :cond_6

    .line 400
    .line 401
    iget-object p1, p1, Ls3/u;->a:Ljava/lang/ref/WeakReference;

    .line 402
    .line 403
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 404
    .line 405
    .line 406
    move-result-object p1

    .line 407
    check-cast p1, Le1/o;

    .line 408
    .line 409
    if-nez p1, :cond_5

    .line 410
    .line 411
    move p1, v7

    .line 412
    goto :goto_10

    .line 413
    :cond_5
    invoke-virtual {p1}, Le1/o;->e()Z

    .line 414
    .line 415
    .line 416
    move-result p1

    .line 417
    :goto_10
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 418
    .line 419
    .line 420
    move-result-object p1

    .line 421
    invoke-virtual {v0, v7, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 422
    .line 423
    .line 424
    goto :goto_12

    .line 425
    :catchall_6
    move-exception p1

    .line 426
    goto :goto_11

    .line 427
    :cond_6
    new-instance p1, Ls3/x;

    .line 428
    .line 429
    const-string v0, "isInfoWindowShown called with invalid markerId"

    .line 430
    .line 431
    invoke-direct {p1, v1, v0, v6}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 432
    .line 433
    .line 434
    throw p1
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_6

    .line 435
    :goto_11
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 436
    .line 437
    .line 438
    move-result-object v0

    .line 439
    :goto_12
    invoke-virtual {p2, v0}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 440
    .line 441
    .line 442
    return-void

    .line 443
    :pswitch_6
    new-instance v0, Ljava/util/ArrayList;

    .line 444
    .line 445
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 446
    .line 447
    .line 448
    check-cast p1, Ljava/util/ArrayList;

    .line 449
    .line 450
    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 451
    .line 452
    .line 453
    move-result-object p1

    .line 454
    check-cast p1, Ljava/lang/String;

    .line 455
    .line 456
    :try_start_11
    invoke-virtual {v8, p1}, Ls3/j;->Q(Ljava/lang/String;)V

    .line 457
    .line 458
    .line 459
    invoke-virtual {v0, v7, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_7

    .line 460
    .line 461
    .line 462
    goto :goto_13

    .line 463
    :catchall_7
    move-exception p1

    .line 464
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 465
    .line 466
    .line 467
    move-result-object v0

    .line 468
    :goto_13
    invoke-virtual {p2, v0}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 469
    .line 470
    .line 471
    return-void

    .line 472
    :pswitch_7
    new-instance v0, Ljava/util/ArrayList;

    .line 473
    .line 474
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 475
    .line 476
    .line 477
    check-cast p1, Ljava/util/ArrayList;

    .line 478
    .line 479
    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 480
    .line 481
    .line 482
    move-result-object p1

    .line 483
    check-cast p1, Ljava/lang/String;

    .line 484
    .line 485
    :try_start_12
    iget-object v2, v8, Ls3/j;->w:Ls3/w;

    .line 486
    .line 487
    iget-object v2, v2, Ls3/w;->b:Ljava/util/HashMap;

    .line 488
    .line 489
    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 490
    .line 491
    .line 492
    move-result-object p1

    .line 493
    check-cast p1, Ls3/u;

    .line 494
    .line 495
    if-eqz p1, :cond_8

    .line 496
    .line 497
    iget-object p1, p1, Ls3/u;->a:Ljava/lang/ref/WeakReference;

    .line 498
    .line 499
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 500
    .line 501
    .line 502
    move-result-object p1

    .line 503
    check-cast p1, Le1/o;

    .line 504
    .line 505
    if-nez p1, :cond_7

    .line 506
    .line 507
    goto :goto_14

    .line 508
    :cond_7
    invoke-virtual {p1}, Le1/o;->k()V

    .line 509
    .line 510
    .line 511
    :goto_14
    invoke-virtual {v0, v7, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 512
    .line 513
    .line 514
    goto :goto_16

    .line 515
    :catchall_8
    move-exception p1

    .line 516
    goto :goto_15

    .line 517
    :cond_8
    new-instance p1, Ls3/x;

    .line 518
    .line 519
    const-string v0, "showInfoWindow called with invalid markerId"

    .line 520
    .line 521
    invoke-direct {p1, v1, v0, v6}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 522
    .line 523
    .line 524
    throw p1
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_8

    .line 525
    :goto_15
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 526
    .line 527
    .line 528
    move-result-object v0

    .line 529
    :goto_16
    invoke-virtual {p2, v0}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 530
    .line 531
    .line 532
    return-void

    .line 533
    :pswitch_8
    new-instance p1, Ljava/util/ArrayList;

    .line 534
    .line 535
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 536
    .line 537
    .line 538
    :try_start_13
    iget-object v0, v8, Ls3/j;->j:LB2/a;

    .line 539
    .line 540
    if-eqz v0, :cond_9

    .line 541
    .line 542
    invoke-virtual {v0}, LB2/a;->x()Lcom/google/android/gms/maps/model/CameraPosition;

    .line 543
    .line 544
    .line 545
    move-result-object v0

    .line 546
    iget v0, v0, Lcom/google/android/gms/maps/model/CameraPosition;->f:F

    .line 547
    .line 548
    float-to-double v0, v0

    .line 549
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 550
    .line 551
    .line 552
    move-result-object v0

    .line 553
    invoke-virtual {p1, v7, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 554
    .line 555
    .line 556
    goto :goto_18

    .line 557
    :catchall_9
    move-exception p1

    .line 558
    goto :goto_17

    .line 559
    :cond_9
    new-instance p1, Ls3/x;

    .line 560
    .line 561
    const-string v0, "getZoomLevel called prior to map initialization"

    .line 562
    .line 563
    invoke-direct {p1, v3, v0, v6}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 564
    .line 565
    .line 566
    throw p1
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_9

    .line 567
    :goto_17
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 568
    .line 569
    .line 570
    move-result-object p1

    .line 571
    :goto_18
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 572
    .line 573
    .line 574
    return-void

    .line 575
    :pswitch_9
    new-instance v0, Ljava/util/ArrayList;

    .line 576
    .line 577
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 578
    .line 579
    .line 580
    check-cast p1, Ljava/util/ArrayList;

    .line 581
    .line 582
    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 583
    .line 584
    .line 585
    move-result-object v1

    .line 586
    check-cast v1, Ls3/M;

    .line 587
    .line 588
    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 589
    .line 590
    .line 591
    move-result-object p1

    .line 592
    check-cast p1, Ljava/lang/Long;

    .line 593
    .line 594
    :try_start_14
    invoke-virtual {v8, v1, p1}, Ls3/j;->I(Ls3/M;Ljava/lang/Long;)V

    .line 595
    .line 596
    .line 597
    invoke-virtual {v0, v7, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_a

    .line 598
    .line 599
    .line 600
    goto :goto_19

    .line 601
    :catchall_a
    move-exception p1

    .line 602
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 603
    .line 604
    .line 605
    move-result-object v0

    .line 606
    :goto_19
    invoke-virtual {p2, v0}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 607
    .line 608
    .line 609
    return-void

    .line 610
    :pswitch_a
    new-instance v0, Ljava/util/ArrayList;

    .line 611
    .line 612
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 613
    .line 614
    .line 615
    check-cast p1, Ljava/util/ArrayList;

    .line 616
    .line 617
    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 618
    .line 619
    .line 620
    move-result-object p1

    .line 621
    check-cast p1, Ls3/M;

    .line 622
    .line 623
    :try_start_15
    invoke-virtual {v8, p1}, Ls3/j;->S(Ls3/M;)V

    .line 624
    .line 625
    .line 626
    invoke-virtual {v0, v7, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_b

    .line 627
    .line 628
    .line 629
    goto :goto_1a

    .line 630
    :catchall_b
    move-exception p1

    .line 631
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 632
    .line 633
    .line 634
    move-result-object v0

    .line 635
    :goto_1a
    invoke-virtual {p2, v0}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 636
    .line 637
    .line 638
    return-void

    .line 639
    :pswitch_b
    new-instance p1, Ljava/util/ArrayList;

    .line 640
    .line 641
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 642
    .line 643
    .line 644
    :try_start_16
    iget-object v0, v8, Ls3/j;->j:LB2/a;

    .line 645
    .line 646
    if-eqz v0, :cond_a

    .line 647
    .line 648
    invoke-virtual {v0}, LB2/a;->C()LE/i;

    .line 649
    .line 650
    .line 651
    move-result-object v0

    .line 652
    invoke-virtual {v0}, LE/i;->z()Le1/F;

    .line 653
    .line 654
    .line 655
    move-result-object v0

    .line 656
    iget-object v0, v0, Le1/F;->i:Lcom/google/android/gms/maps/model/LatLngBounds;

    .line 657
    .line 658
    invoke-static {v0}, Landroid/support/v4/media/session/a;->C(Lcom/google/android/gms/maps/model/LatLngBounds;)Ls3/k0;

    .line 659
    .line 660
    .line 661
    move-result-object v0

    .line 662
    invoke-virtual {p1, v7, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 663
    .line 664
    .line 665
    goto :goto_1c

    .line 666
    :catchall_c
    move-exception p1

    .line 667
    goto :goto_1b

    .line 668
    :cond_a
    new-instance p1, Ls3/x;

    .line 669
    .line 670
    const-string v0, "getVisibleRegion called prior to map initialization"

    .line 671
    .line 672
    invoke-direct {p1, v3, v0, v6}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 673
    .line 674
    .line 675
    throw p1
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_c

    .line 676
    :goto_1b
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 677
    .line 678
    .line 679
    move-result-object p1

    .line 680
    :goto_1c
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 681
    .line 682
    .line 683
    return-void

    .line 684
    :pswitch_c
    new-instance v0, Ljava/util/ArrayList;

    .line 685
    .line 686
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 687
    .line 688
    .line 689
    check-cast p1, Ljava/util/ArrayList;

    .line 690
    .line 691
    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 692
    .line 693
    .line 694
    move-result-object p1

    .line 695
    check-cast p1, Ls3/u0;

    .line 696
    .line 697
    :try_start_17
    invoke-virtual {v8, p1}, Ls3/j;->M(Ls3/u0;)Ls3/j0;

    .line 698
    .line 699
    .line 700
    move-result-object p1

    .line 701
    invoke-virtual {v0, v7, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_d

    .line 702
    .line 703
    .line 704
    goto :goto_1d

    .line 705
    :catchall_d
    move-exception p1

    .line 706
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 707
    .line 708
    .line 709
    move-result-object v0

    .line 710
    :goto_1d
    invoke-virtual {p2, v0}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 711
    .line 712
    .line 713
    return-void

    .line 714
    :pswitch_d
    new-instance v0, Ljava/util/ArrayList;

    .line 715
    .line 716
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 717
    .line 718
    .line 719
    check-cast p1, Ljava/util/ArrayList;

    .line 720
    .line 721
    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 722
    .line 723
    .line 724
    move-result-object v1

    .line 725
    check-cast v1, Ljava/util/List;

    .line 726
    .line 727
    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 728
    .line 729
    .line 730
    move-result-object v2

    .line 731
    check-cast v2, Ljava/util/List;

    .line 732
    .line 733
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 734
    .line 735
    .line 736
    move-result-object p1

    .line 737
    check-cast p1, Ljava/util/List;

    .line 738
    .line 739
    :try_start_18
    invoke-virtual {v8, v1, v2, p1}, Ls3/j;->Z(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 740
    .line 741
    .line 742
    invoke-virtual {v0, v7, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_e

    .line 743
    .line 744
    .line 745
    goto :goto_1e

    .line 746
    :catchall_e
    move-exception p1

    .line 747
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 748
    .line 749
    .line 750
    move-result-object v0

    .line 751
    :goto_1e
    invoke-virtual {p2, v0}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 752
    .line 753
    .line 754
    return-void

    .line 755
    :pswitch_e
    new-instance v0, Ljava/util/ArrayList;

    .line 756
    .line 757
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 758
    .line 759
    .line 760
    check-cast p1, Ljava/util/ArrayList;

    .line 761
    .line 762
    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 763
    .line 764
    .line 765
    move-result-object v1

    .line 766
    check-cast v1, Ljava/util/List;

    .line 767
    .line 768
    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 769
    .line 770
    .line 771
    move-result-object v2

    .line 772
    check-cast v2, Ljava/util/List;

    .line 773
    .line 774
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 775
    .line 776
    .line 777
    move-result-object p1

    .line 778
    check-cast p1, Ljava/util/List;

    .line 779
    .line 780
    :try_start_19
    invoke-virtual {v8, v1, v2, p1}, Ls3/j;->g0(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 781
    .line 782
    .line 783
    invoke-virtual {v0, v7, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_f

    .line 784
    .line 785
    .line 786
    goto :goto_1f

    .line 787
    :catchall_f
    move-exception p1

    .line 788
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 789
    .line 790
    .line 791
    move-result-object v0

    .line 792
    :goto_1f
    invoke-virtual {p2, v0}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 793
    .line 794
    .line 795
    return-void

    .line 796
    :pswitch_f
    new-instance v0, Ljava/util/ArrayList;

    .line 797
    .line 798
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 799
    .line 800
    .line 801
    check-cast p1, Ljava/util/ArrayList;

    .line 802
    .line 803
    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 804
    .line 805
    .line 806
    move-result-object v1

    .line 807
    check-cast v1, Ljava/util/List;

    .line 808
    .line 809
    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 810
    .line 811
    .line 812
    move-result-object v2

    .line 813
    check-cast v2, Ljava/util/List;

    .line 814
    .line 815
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 816
    .line 817
    .line 818
    move-result-object p1

    .line 819
    check-cast p1, Ljava/util/List;

    .line 820
    .line 821
    :try_start_1a
    invoke-virtual {v8, v1, v2, p1}, Ls3/j;->f0(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 822
    .line 823
    .line 824
    invoke-virtual {v0, v7, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_10

    .line 825
    .line 826
    .line 827
    goto :goto_20

    .line 828
    :catchall_10
    move-exception p1

    .line 829
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 830
    .line 831
    .line 832
    move-result-object v0

    .line 833
    :goto_20
    invoke-virtual {p2, v0}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 834
    .line 835
    .line 836
    return-void

    .line 837
    :pswitch_10
    new-instance v0, Ljava/util/ArrayList;

    .line 838
    .line 839
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 840
    .line 841
    .line 842
    check-cast p1, Ljava/util/ArrayList;

    .line 843
    .line 844
    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 845
    .line 846
    .line 847
    move-result-object v1

    .line 848
    check-cast v1, Ljava/util/List;

    .line 849
    .line 850
    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 851
    .line 852
    .line 853
    move-result-object v2

    .line 854
    check-cast v2, Ljava/util/List;

    .line 855
    .line 856
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 857
    .line 858
    .line 859
    move-result-object p1

    .line 860
    check-cast p1, Ljava/util/List;

    .line 861
    .line 862
    :try_start_1b
    invoke-virtual {v8, v1, v2, p1}, Ls3/j;->e0(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 863
    .line 864
    .line 865
    invoke-virtual {v0, v7, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_11

    .line 866
    .line 867
    .line 868
    goto :goto_21

    .line 869
    :catchall_11
    move-exception p1

    .line 870
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 871
    .line 872
    .line 873
    move-result-object v0

    .line 874
    :goto_21
    invoke-virtual {p2, v0}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 875
    .line 876
    .line 877
    return-void

    .line 878
    :pswitch_11
    new-instance v0, Ljava/util/ArrayList;

    .line 879
    .line 880
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 881
    .line 882
    .line 883
    check-cast p1, Ljava/util/ArrayList;

    .line 884
    .line 885
    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 886
    .line 887
    .line 888
    move-result-object p1

    .line 889
    check-cast p1, Ls3/j0;

    .line 890
    .line 891
    :try_start_1c
    invoke-virtual {v8, p1}, Ls3/j;->N(Ls3/j0;)Ls3/u0;

    .line 892
    .line 893
    .line 894
    move-result-object p1

    .line 895
    invoke-virtual {v0, v7, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_12

    .line 896
    .line 897
    .line 898
    goto :goto_22

    .line 899
    :catchall_12
    move-exception p1

    .line 900
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 901
    .line 902
    .line 903
    move-result-object v0

    .line 904
    :goto_22
    invoke-virtual {p2, v0}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 905
    .line 906
    .line 907
    return-void

    .line 908
    :pswitch_12
    new-instance v0, Ljava/util/ArrayList;

    .line 909
    .line 910
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 911
    .line 912
    .line 913
    check-cast p1, Ljava/util/ArrayList;

    .line 914
    .line 915
    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 916
    .line 917
    .line 918
    move-result-object v1

    .line 919
    check-cast v1, Ljava/util/List;

    .line 920
    .line 921
    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 922
    .line 923
    .line 924
    move-result-object v2

    .line 925
    check-cast v2, Ljava/util/List;

    .line 926
    .line 927
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 928
    .line 929
    .line 930
    move-result-object p1

    .line 931
    check-cast p1, Ljava/util/List;

    .line 932
    .line 933
    :try_start_1d
    invoke-virtual {v8, v1, v2, p1}, Ls3/j;->c0(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 934
    .line 935
    .line 936
    invoke-virtual {v0, v7, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_13

    .line 937
    .line 938
    .line 939
    goto :goto_23

    .line 940
    :catchall_13
    move-exception p1

    .line 941
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 942
    .line 943
    .line 944
    move-result-object v0

    .line 945
    :goto_23
    invoke-virtual {p2, v0}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 946
    .line 947
    .line 948
    return-void

    .line 949
    :pswitch_13
    new-instance v0, Ljava/util/ArrayList;

    .line 950
    .line 951
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 952
    .line 953
    .line 954
    check-cast p1, Ljava/util/ArrayList;

    .line 955
    .line 956
    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 957
    .line 958
    .line 959
    move-result-object v1

    .line 960
    check-cast v1, Ljava/util/List;

    .line 961
    .line 962
    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 963
    .line 964
    .line 965
    move-result-object p1

    .line 966
    check-cast p1, Ljava/util/List;

    .line 967
    .line 968
    :try_start_1e
    invoke-virtual {v8, v1, p1}, Ls3/j;->Y(Ljava/util/List;Ljava/util/List;)V

    .line 969
    .line 970
    .line 971
    invoke-virtual {v0, v7, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_14

    .line 972
    .line 973
    .line 974
    goto :goto_24

    .line 975
    :catchall_14
    move-exception p1

    .line 976
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 977
    .line 978
    .line 979
    move-result-object v0

    .line 980
    :goto_24
    invoke-virtual {p2, v0}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 981
    .line 982
    .line 983
    return-void

    .line 984
    :pswitch_14
    new-instance v0, Ljava/util/ArrayList;

    .line 985
    .line 986
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 987
    .line 988
    .line 989
    check-cast p1, Ljava/util/ArrayList;

    .line 990
    .line 991
    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 992
    .line 993
    .line 994
    move-result-object v1

    .line 995
    check-cast v1, Ljava/util/List;

    .line 996
    .line 997
    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 998
    .line 999
    .line 1000
    move-result-object v2

    .line 1001
    check-cast v2, Ljava/util/List;

    .line 1002
    .line 1003
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1004
    .line 1005
    .line 1006
    move-result-object p1

    .line 1007
    check-cast p1, Ljava/util/List;

    .line 1008
    .line 1009
    :try_start_1f
    invoke-virtual {v8, v1, v2, p1}, Ls3/j;->a0(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 1010
    .line 1011
    .line 1012
    invoke-virtual {v0, v7, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_15

    .line 1013
    .line 1014
    .line 1015
    goto :goto_25

    .line 1016
    :catchall_15
    move-exception p1

    .line 1017
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 1018
    .line 1019
    .line 1020
    move-result-object v0

    .line 1021
    :goto_25
    invoke-virtual {p2, v0}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 1022
    .line 1023
    .line 1024
    return-void

    .line 1025
    :pswitch_15
    new-instance v0, Ljava/util/ArrayList;

    .line 1026
    .line 1027
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1028
    .line 1029
    .line 1030
    check-cast p1, Ljava/util/ArrayList;

    .line 1031
    .line 1032
    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1033
    .line 1034
    .line 1035
    move-result-object v1

    .line 1036
    check-cast v1, Ljava/util/List;

    .line 1037
    .line 1038
    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1039
    .line 1040
    .line 1041
    move-result-object v2

    .line 1042
    check-cast v2, Ljava/util/List;

    .line 1043
    .line 1044
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1045
    .line 1046
    .line 1047
    move-result-object p1

    .line 1048
    check-cast p1, Ljava/util/List;

    .line 1049
    .line 1050
    :try_start_20
    invoke-virtual {v8, v1, v2, p1}, Ls3/j;->X(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 1051
    .line 1052
    .line 1053
    invoke-virtual {v0, v7, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_16

    .line 1054
    .line 1055
    .line 1056
    goto :goto_26

    .line 1057
    :catchall_16
    move-exception p1

    .line 1058
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 1059
    .line 1060
    .line 1061
    move-result-object v0

    .line 1062
    :goto_26
    invoke-virtual {p2, v0}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 1063
    .line 1064
    .line 1065
    return-void

    .line 1066
    :pswitch_16
    new-instance p1, Ljava/util/ArrayList;

    .line 1067
    .line 1068
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1069
    .line 1070
    .line 1071
    new-instance v0, Lp3/i;

    .line 1072
    .line 1073
    const/4 v1, 0x7

    .line 1074
    invoke-direct {v0, p1, p2, v1}, Lp3/i;-><init>(Ljava/util/ArrayList;LZ2/s;I)V

    .line 1075
    .line 1076
    .line 1077
    iget-object p1, v8, Ls3/j;->j:LB2/a;

    .line 1078
    .line 1079
    if-nez p1, :cond_b

    .line 1080
    .line 1081
    new-instance p1, Ls3/x;

    .line 1082
    .line 1083
    const-string p2, "takeSnapshot"

    .line 1084
    .line 1085
    invoke-direct {p1, v3, p2, v6}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1086
    .line 1087
    .line 1088
    invoke-virtual {v0, p1}, Lp3/i;->b(Ls3/x;)V

    .line 1089
    .line 1090
    .line 1091
    goto :goto_27

    .line 1092
    :cond_b
    new-instance p2, LD1/a;

    .line 1093
    .line 1094
    invoke-direct {p2, v2, v0}, LD1/a;-><init>(ILjava/lang/Object;)V

    .line 1095
    .line 1096
    .line 1097
    :try_start_21
    iget-object v0, p1, LB2/a;->f:Ljava/lang/Object;

    .line 1098
    .line 1099
    check-cast v0, Ld1/g;

    .line 1100
    .line 1101
    new-instance v1, Lc1/h;

    .line 1102
    .line 1103
    invoke-direct {v1, p1, p2}, Lc1/h;-><init>(LB2/a;LD1/a;)V

    .line 1104
    .line 1105
    .line 1106
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 1107
    .line 1108
    .line 1109
    move-result-object p1

    .line 1110
    invoke-static {p1, v1}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 1111
    .line 1112
    .line 1113
    invoke-virtual {p1, v6}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    .line 1114
    .line 1115
    .line 1116
    const/16 p2, 0x26

    .line 1117
    .line 1118
    invoke-virtual {v0, p1, p2}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_21
    .catch Landroid/os/RemoteException; {:try_start_21 .. :try_end_21} :catch_5

    .line 1119
    .line 1120
    .line 1121
    :goto_27
    return-void

    .line 1122
    :catch_5
    move-exception p1

    .line 1123
    new-instance p2, Le1/x;

    .line 1124
    .line 1125
    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 1126
    .line 1127
    .line 1128
    throw p2

    .line 1129
    :pswitch_17
    new-instance v0, Ljava/util/ArrayList;

    .line 1130
    .line 1131
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1132
    .line 1133
    .line 1134
    check-cast p1, Ljava/util/ArrayList;

    .line 1135
    .line 1136
    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1137
    .line 1138
    .line 1139
    move-result-object p1

    .line 1140
    check-cast p1, Ljava/lang/String;

    .line 1141
    .line 1142
    :try_start_22
    iget-object v1, v8, Ls3/j;->C:Lm/x0;

    .line 1143
    .line 1144
    if-nez p1, :cond_c

    .line 1145
    .line 1146
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1147
    .line 1148
    .line 1149
    goto :goto_28

    .line 1150
    :cond_c
    iget-object v1, v1, Lm/x0;->f:Ljava/lang/Object;

    .line 1151
    .line 1152
    check-cast v1, Ljava/util/HashMap;

    .line 1153
    .line 1154
    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1155
    .line 1156
    .line 1157
    move-result-object p1

    .line 1158
    check-cast p1, Ls3/J0;

    .line 1159
    .line 1160
    if-eqz p1, :cond_d

    .line 1161
    .line 1162
    iget-object p1, p1, Ls3/J0;->e:Le1/C;

    .line 1163
    .line 1164
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_17

    .line 1165
    .line 1166
    .line 1167
    :try_start_23
    iget-object p1, p1, Le1/C;->a:LZ0/o;

    .line 1168
    .line 1169
    check-cast p1, LZ0/m;

    .line 1170
    .line 1171
    invoke-virtual {p1}, LY0/a;->c()Landroid/os/Parcel;

    .line 1172
    .line 1173
    .line 1174
    move-result-object v1

    .line 1175
    invoke-virtual {p1, v1, v4}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_23
    .catch Landroid/os/RemoteException; {:try_start_23 .. :try_end_23} :catch_6
    .catchall {:try_start_23 .. :try_end_23} :catchall_17

    .line 1176
    .line 1177
    .line 1178
    goto :goto_28

    .line 1179
    :catch_6
    move-exception p1

    .line 1180
    :try_start_24
    new-instance v0, Le1/x;

    .line 1181
    .line 1182
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 1183
    .line 1184
    .line 1185
    throw v0

    .line 1186
    :cond_d
    :goto_28
    invoke-virtual {v0, v7, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_24
    .catchall {:try_start_24 .. :try_end_24} :catchall_17

    .line 1187
    .line 1188
    .line 1189
    goto :goto_29

    .line 1190
    :catchall_17
    move-exception p1

    .line 1191
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 1192
    .line 1193
    .line 1194
    move-result-object v0

    .line 1195
    :goto_29
    invoke-virtual {p2, v0}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 1196
    .line 1197
    .line 1198
    return-void

    .line 1199
    :pswitch_18
    new-instance p1, Ljava/util/ArrayList;

    .line 1200
    .line 1201
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1202
    .line 1203
    .line 1204
    :try_start_25
    invoke-virtual {v8}, Ls3/j;->R()Ljava/lang/Boolean;

    .line 1205
    .line 1206
    .line 1207
    move-result-object v0

    .line 1208
    invoke-virtual {p1, v7, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_25
    .catchall {:try_start_25 .. :try_end_25} :catchall_18

    .line 1209
    .line 1210
    .line 1211
    goto :goto_2a

    .line 1212
    :catchall_18
    move-exception p1

    .line 1213
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 1214
    .line 1215
    .line 1216
    move-result-object p1

    .line 1217
    :goto_2a
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 1218
    .line 1219
    .line 1220
    return-void

    .line 1221
    :pswitch_19
    new-instance p1, Ljava/util/ArrayList;

    .line 1222
    .line 1223
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1224
    .line 1225
    .line 1226
    :try_start_26
    iget-boolean v0, v8, Ls3/j;->P:Z

    .line 1227
    .line 1228
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 1229
    .line 1230
    .line 1231
    move-result-object v0

    .line 1232
    invoke-virtual {p1, v7, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_26
    .catchall {:try_start_26 .. :try_end_26} :catchall_19

    .line 1233
    .line 1234
    .line 1235
    goto :goto_2b

    .line 1236
    :catchall_19
    move-exception p1

    .line 1237
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 1238
    .line 1239
    .line 1240
    move-result-object p1

    .line 1241
    :goto_2b
    invoke-virtual {p2, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 1242
    .line 1243
    .line 1244
    return-void

    .line 1245
    :pswitch_1a
    new-instance v0, Ljava/util/ArrayList;

    .line 1246
    .line 1247
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1248
    .line 1249
    .line 1250
    check-cast p1, Ljava/util/ArrayList;

    .line 1251
    .line 1252
    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1253
    .line 1254
    .line 1255
    move-result-object p1

    .line 1256
    check-cast p1, Ls3/m0;

    .line 1257
    .line 1258
    :try_start_27
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1259
    .line 1260
    .line 1261
    invoke-static {p1, v8}, Landroid/support/v4/media/session/a;->w(Ls3/m0;Ls3/m;)V

    .line 1262
    .line 1263
    .line 1264
    invoke-virtual {v0, v7, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_27
    .catchall {:try_start_27 .. :try_end_27} :catchall_1a

    .line 1265
    .line 1266
    .line 1267
    goto :goto_2c

    .line 1268
    :catchall_1a
    move-exception p1

    .line 1269
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 1270
    .line 1271
    .line 1272
    move-result-object v0

    .line 1273
    :goto_2c
    invoke-virtual {p2, v0}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 1274
    .line 1275
    .line 1276
    return-void

    .line 1277
    :pswitch_1b
    new-instance v0, Ljava/util/ArrayList;

    .line 1278
    .line 1279
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1280
    .line 1281
    .line 1282
    check-cast p1, Ljava/util/ArrayList;

    .line 1283
    .line 1284
    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1285
    .line 1286
    .line 1287
    move-result-object p1

    .line 1288
    check-cast p1, Ljava/lang/String;

    .line 1289
    .line 1290
    :try_start_28
    invoke-virtual {v8, p1}, Ls3/j;->b0(Ljava/lang/String;)Z

    .line 1291
    .line 1292
    .line 1293
    move-result p1

    .line 1294
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 1295
    .line 1296
    .line 1297
    move-result-object p1

    .line 1298
    invoke-virtual {v0, v7, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_28
    .catchall {:try_start_28 .. :try_end_28} :catchall_1b

    .line 1299
    .line 1300
    .line 1301
    goto :goto_2d

    .line 1302
    :catchall_1b
    move-exception p1

    .line 1303
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 1304
    .line 1305
    .line 1306
    move-result-object v0

    .line 1307
    :goto_2d
    invoke-virtual {p2, v0}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 1308
    .line 1309
    .line 1310
    return-void

    .line 1311
    :pswitch_1c
    new-instance p1, Ljava/util/ArrayList;

    .line 1312
    .line 1313
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1314
    .line 1315
    .line 1316
    new-instance v0, Lp3/i;

    .line 1317
    .line 1318
    const/4 v1, 0x6

    .line 1319
    invoke-direct {v0, p1, p2, v1}, Lp3/i;-><init>(Ljava/util/ArrayList;LZ2/s;I)V

    .line 1320
    .line 1321
    .line 1322
    iget-object p1, v8, Ls3/j;->j:LB2/a;

    .line 1323
    .line 1324
    if-nez p1, :cond_e

    .line 1325
    .line 1326
    iput-object v0, v8, Ls3/j;->t:Lp3/i;

    .line 1327
    .line 1328
    goto :goto_2e

    .line 1329
    :cond_e
    invoke-virtual {v0}, Lp3/i;->e()V

    .line 1330
    .line 1331
    .line 1332
    :goto_2e
    return-void

    .line 1333
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
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
