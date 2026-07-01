.class public final Lv3/n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LQ3/e;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:LQ3/e;

.field public final synthetic g:Ljava/lang/Object;


# direct methods
.method public constructor <init>(LI/p;LQ3/e;)V
    .locals 1

    const/4 v0, 0x4

    iput v0, p0, Lv3/n;->e:I

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Lv3/n;->g:Ljava/lang/Object;

    iput-object p2, p0, Lv3/n;->f:LQ3/e;

    return-void
.end method

.method public synthetic constructor <init>(LQ3/e;LM/d;I)V
    .locals 0

    .line 1
    iput p3, p0, Lv3/n;->e:I

    iput-object p1, p0, Lv3/n;->f:LQ3/e;

    iput-object p2, p0, Lv3/n;->g:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;LA3/d;)Ljava/lang/Object;
    .locals 7

    .line 1
    iget v0, p0, Lv3/n;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    instance-of v0, p2, LQ3/n;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    move-object v0, p2

    .line 11
    check-cast v0, LQ3/n;

    .line 12
    .line 13
    iget v1, v0, LQ3/n;->j:I

    .line 14
    .line 15
    const/high16 v2, -0x80000000

    .line 16
    .line 17
    and-int v3, v1, v2

    .line 18
    .line 19
    if-eqz v3, :cond_0

    .line 20
    .line 21
    sub-int/2addr v1, v2

    .line 22
    iput v1, v0, LQ3/n;->j:I

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    new-instance v0, LQ3/n;

    .line 26
    .line 27
    invoke-direct {v0, p0, p2}, LQ3/n;-><init>(Lv3/n;LA3/d;)V

    .line 28
    .line 29
    .line 30
    :goto_0
    iget-object p2, v0, LQ3/n;->i:Ljava/lang/Object;

    .line 31
    .line 32
    iget v1, v0, LQ3/n;->j:I

    .line 33
    .line 34
    const/4 v2, 0x2

    .line 35
    const/4 v3, 0x1

    .line 36
    sget-object v4, LB3/a;->e:LB3/a;

    .line 37
    .line 38
    if-eqz v1, :cond_3

    .line 39
    .line 40
    if-eq v1, v3, :cond_2

    .line 41
    .line 42
    if-ne v1, v2, :cond_1

    .line 43
    .line 44
    iget-object p1, v0, LQ3/n;->h:Lv3/n;

    .line 45
    .line 46
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    goto :goto_2

    .line 50
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 51
    .line 52
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 53
    .line 54
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    throw p1

    .line 58
    :cond_2
    iget-object p1, v0, LQ3/n;->l:Ljava/lang/Object;

    .line 59
    .line 60
    iget-object v1, v0, LQ3/n;->h:Lv3/n;

    .line 61
    .line 62
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    move-object v6, p2

    .line 66
    move-object p2, p1

    .line 67
    move-object p1, v1

    .line 68
    move-object v1, v6

    .line 69
    goto :goto_1

    .line 70
    :cond_3
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    iget-object p2, p0, Lv3/n;->g:Ljava/lang/Object;

    .line 74
    .line 75
    check-cast p2, LI/p;

    .line 76
    .line 77
    iput-object p0, v0, LQ3/n;->h:Lv3/n;

    .line 78
    .line 79
    iput-object p1, v0, LQ3/n;->l:Ljava/lang/Object;

    .line 80
    .line 81
    iput v3, v0, LQ3/n;->j:I

    .line 82
    .line 83
    invoke-virtual {p2, p1, v0}, LI/p;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    if-ne p2, v4, :cond_4

    .line 88
    .line 89
    goto :goto_3

    .line 90
    :cond_4
    move-object v1, p2

    .line 91
    move-object p2, p1

    .line 92
    move-object p1, p0

    .line 93
    :goto_1
    check-cast v1, Ljava/lang/Boolean;

    .line 94
    .line 95
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-eqz v1, :cond_5

    .line 100
    .line 101
    iget-object v1, p1, Lv3/n;->f:LQ3/e;

    .line 102
    .line 103
    iput-object p1, v0, LQ3/n;->h:Lv3/n;

    .line 104
    .line 105
    const/4 v5, 0x0

    .line 106
    iput-object v5, v0, LQ3/n;->l:Ljava/lang/Object;

    .line 107
    .line 108
    iput v2, v0, LQ3/n;->j:I

    .line 109
    .line 110
    invoke-interface {v1, p2, v0}, LQ3/e;->b(Ljava/lang/Object;LA3/d;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    if-ne p2, v4, :cond_6

    .line 115
    .line 116
    goto :goto_3

    .line 117
    :cond_5
    const/4 v3, 0x0

    .line 118
    :cond_6
    :goto_2
    if-eqz v3, :cond_7

    .line 119
    .line 120
    sget-object v4, Ly3/h;->a:Ly3/h;

    .line 121
    .line 122
    :goto_3
    return-object v4

    .line 123
    :cond_7
    new-instance p2, LR3/a;

    .line 124
    .line 125
    invoke-direct {p2, p1}, LR3/a;-><init>(LQ3/e;)V

    .line 126
    .line 127
    .line 128
    throw p2

    .line 129
    :pswitch_0
    instance-of v0, p2, Lv3/y;

    .line 130
    .line 131
    if-eqz v0, :cond_8

    .line 132
    .line 133
    move-object v0, p2

    .line 134
    check-cast v0, Lv3/y;

    .line 135
    .line 136
    iget v1, v0, Lv3/y;->i:I

    .line 137
    .line 138
    const/high16 v2, -0x80000000

    .line 139
    .line 140
    and-int v3, v1, v2

    .line 141
    .line 142
    if-eqz v3, :cond_8

    .line 143
    .line 144
    sub-int/2addr v1, v2

    .line 145
    iput v1, v0, Lv3/y;->i:I

    .line 146
    .line 147
    goto :goto_4

    .line 148
    :cond_8
    new-instance v0, Lv3/y;

    .line 149
    .line 150
    invoke-direct {v0, p0, p2}, Lv3/y;-><init>(Lv3/n;LA3/d;)V

    .line 151
    .line 152
    .line 153
    :goto_4
    iget-object p2, v0, Lv3/y;->h:Ljava/lang/Object;

    .line 154
    .line 155
    iget v1, v0, Lv3/y;->i:I

    .line 156
    .line 157
    const/4 v2, 0x1

    .line 158
    if-eqz v1, :cond_a

    .line 159
    .line 160
    if-ne v1, v2, :cond_9

    .line 161
    .line 162
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 163
    .line 164
    .line 165
    goto :goto_5

    .line 166
    :cond_9
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 167
    .line 168
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 169
    .line 170
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    throw p1

    .line 174
    :cond_a
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 175
    .line 176
    .line 177
    check-cast p1, LM/b;

    .line 178
    .line 179
    iget-object p2, p0, Lv3/n;->g:Ljava/lang/Object;

    .line 180
    .line 181
    check-cast p2, LM/d;

    .line 182
    .line 183
    invoke-virtual {p1, p2}, LM/b;->c(LM/d;)Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    iput v2, v0, Lv3/y;->i:I

    .line 188
    .line 189
    iget-object p2, p0, Lv3/n;->f:LQ3/e;

    .line 190
    .line 191
    invoke-interface {p2, p1, v0}, LQ3/e;->b(Ljava/lang/Object;LA3/d;)Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    sget-object p2, LB3/a;->e:LB3/a;

    .line 196
    .line 197
    if-ne p1, p2, :cond_b

    .line 198
    .line 199
    goto :goto_6

    .line 200
    :cond_b
    :goto_5
    sget-object p2, Ly3/h;->a:Ly3/h;

    .line 201
    .line 202
    :goto_6
    return-object p2

    .line 203
    :pswitch_1
    instance-of v0, p2, Lv3/w;

    .line 204
    .line 205
    if-eqz v0, :cond_c

    .line 206
    .line 207
    move-object v0, p2

    .line 208
    check-cast v0, Lv3/w;

    .line 209
    .line 210
    iget v1, v0, Lv3/w;->i:I

    .line 211
    .line 212
    const/high16 v2, -0x80000000

    .line 213
    .line 214
    and-int v3, v1, v2

    .line 215
    .line 216
    if-eqz v3, :cond_c

    .line 217
    .line 218
    sub-int/2addr v1, v2

    .line 219
    iput v1, v0, Lv3/w;->i:I

    .line 220
    .line 221
    goto :goto_7

    .line 222
    :cond_c
    new-instance v0, Lv3/w;

    .line 223
    .line 224
    invoke-direct {v0, p0, p2}, Lv3/w;-><init>(Lv3/n;LA3/d;)V

    .line 225
    .line 226
    .line 227
    :goto_7
    iget-object p2, v0, Lv3/w;->h:Ljava/lang/Object;

    .line 228
    .line 229
    iget v1, v0, Lv3/w;->i:I

    .line 230
    .line 231
    const/4 v2, 0x1

    .line 232
    if-eqz v1, :cond_e

    .line 233
    .line 234
    if-ne v1, v2, :cond_d

    .line 235
    .line 236
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 237
    .line 238
    .line 239
    goto :goto_8

    .line 240
    :cond_d
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 241
    .line 242
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 243
    .line 244
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    throw p1

    .line 248
    :cond_e
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 249
    .line 250
    .line 251
    check-cast p1, LM/b;

    .line 252
    .line 253
    iget-object p2, p0, Lv3/n;->g:Ljava/lang/Object;

    .line 254
    .line 255
    check-cast p2, LM/d;

    .line 256
    .line 257
    invoke-virtual {p1, p2}, LM/b;->c(LM/d;)Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    move-result-object p1

    .line 261
    iput v2, v0, Lv3/w;->i:I

    .line 262
    .line 263
    iget-object p2, p0, Lv3/n;->f:LQ3/e;

    .line 264
    .line 265
    invoke-interface {p2, p1, v0}, LQ3/e;->b(Ljava/lang/Object;LA3/d;)Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    move-result-object p1

    .line 269
    sget-object p2, LB3/a;->e:LB3/a;

    .line 270
    .line 271
    if-ne p1, p2, :cond_f

    .line 272
    .line 273
    goto :goto_9

    .line 274
    :cond_f
    :goto_8
    sget-object p2, Ly3/h;->a:Ly3/h;

    .line 275
    .line 276
    :goto_9
    return-object p2

    .line 277
    :pswitch_2
    instance-of v0, p2, Lv3/s;

    .line 278
    .line 279
    if-eqz v0, :cond_10

    .line 280
    .line 281
    move-object v0, p2

    .line 282
    check-cast v0, Lv3/s;

    .line 283
    .line 284
    iget v1, v0, Lv3/s;->i:I

    .line 285
    .line 286
    const/high16 v2, -0x80000000

    .line 287
    .line 288
    and-int v3, v1, v2

    .line 289
    .line 290
    if-eqz v3, :cond_10

    .line 291
    .line 292
    sub-int/2addr v1, v2

    .line 293
    iput v1, v0, Lv3/s;->i:I

    .line 294
    .line 295
    goto :goto_a

    .line 296
    :cond_10
    new-instance v0, Lv3/s;

    .line 297
    .line 298
    invoke-direct {v0, p0, p2}, Lv3/s;-><init>(Lv3/n;LA3/d;)V

    .line 299
    .line 300
    .line 301
    :goto_a
    iget-object p2, v0, Lv3/s;->h:Ljava/lang/Object;

    .line 302
    .line 303
    iget v1, v0, Lv3/s;->i:I

    .line 304
    .line 305
    const/4 v2, 0x1

    .line 306
    if-eqz v1, :cond_12

    .line 307
    .line 308
    if-ne v1, v2, :cond_11

    .line 309
    .line 310
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 311
    .line 312
    .line 313
    goto :goto_b

    .line 314
    :cond_11
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 315
    .line 316
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 317
    .line 318
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 319
    .line 320
    .line 321
    throw p1

    .line 322
    :cond_12
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 323
    .line 324
    .line 325
    check-cast p1, LM/b;

    .line 326
    .line 327
    iget-object p2, p0, Lv3/n;->g:Ljava/lang/Object;

    .line 328
    .line 329
    check-cast p2, LM/d;

    .line 330
    .line 331
    invoke-virtual {p1, p2}, LM/b;->c(LM/d;)Ljava/lang/Object;

    .line 332
    .line 333
    .line 334
    move-result-object p1

    .line 335
    iput v2, v0, Lv3/s;->i:I

    .line 336
    .line 337
    iget-object p2, p0, Lv3/n;->f:LQ3/e;

    .line 338
    .line 339
    invoke-interface {p2, p1, v0}, LQ3/e;->b(Ljava/lang/Object;LA3/d;)Ljava/lang/Object;

    .line 340
    .line 341
    .line 342
    move-result-object p1

    .line 343
    sget-object p2, LB3/a;->e:LB3/a;

    .line 344
    .line 345
    if-ne p1, p2, :cond_13

    .line 346
    .line 347
    goto :goto_c

    .line 348
    :cond_13
    :goto_b
    sget-object p2, Ly3/h;->a:Ly3/h;

    .line 349
    .line 350
    :goto_c
    return-object p2

    .line 351
    :pswitch_3
    instance-of v0, p2, Lv3/m;

    .line 352
    .line 353
    if-eqz v0, :cond_14

    .line 354
    .line 355
    move-object v0, p2

    .line 356
    check-cast v0, Lv3/m;

    .line 357
    .line 358
    iget v1, v0, Lv3/m;->i:I

    .line 359
    .line 360
    const/high16 v2, -0x80000000

    .line 361
    .line 362
    and-int v3, v1, v2

    .line 363
    .line 364
    if-eqz v3, :cond_14

    .line 365
    .line 366
    sub-int/2addr v1, v2

    .line 367
    iput v1, v0, Lv3/m;->i:I

    .line 368
    .line 369
    goto :goto_d

    .line 370
    :cond_14
    new-instance v0, Lv3/m;

    .line 371
    .line 372
    invoke-direct {v0, p0, p2}, Lv3/m;-><init>(Lv3/n;LA3/d;)V

    .line 373
    .line 374
    .line 375
    :goto_d
    iget-object p2, v0, Lv3/m;->h:Ljava/lang/Object;

    .line 376
    .line 377
    iget v1, v0, Lv3/m;->i:I

    .line 378
    .line 379
    const/4 v2, 0x1

    .line 380
    if-eqz v1, :cond_16

    .line 381
    .line 382
    if-ne v1, v2, :cond_15

    .line 383
    .line 384
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 385
    .line 386
    .line 387
    goto :goto_e

    .line 388
    :cond_15
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 389
    .line 390
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 391
    .line 392
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 393
    .line 394
    .line 395
    throw p1

    .line 396
    :cond_16
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 397
    .line 398
    .line 399
    check-cast p1, LM/b;

    .line 400
    .line 401
    iget-object p2, p0, Lv3/n;->g:Ljava/lang/Object;

    .line 402
    .line 403
    check-cast p2, LM/d;

    .line 404
    .line 405
    invoke-virtual {p1, p2}, LM/b;->c(LM/d;)Ljava/lang/Object;

    .line 406
    .line 407
    .line 408
    move-result-object p1

    .line 409
    iput v2, v0, Lv3/m;->i:I

    .line 410
    .line 411
    iget-object p2, p0, Lv3/n;->f:LQ3/e;

    .line 412
    .line 413
    invoke-interface {p2, p1, v0}, LQ3/e;->b(Ljava/lang/Object;LA3/d;)Ljava/lang/Object;

    .line 414
    .line 415
    .line 416
    move-result-object p1

    .line 417
    sget-object p2, LB3/a;->e:LB3/a;

    .line 418
    .line 419
    if-ne p1, p2, :cond_17

    .line 420
    .line 421
    goto :goto_f

    .line 422
    :cond_17
    :goto_e
    sget-object p2, Ly3/h;->a:Ly3/h;

    .line 423
    .line 424
    :goto_f
    return-object p2

    .line 425
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
