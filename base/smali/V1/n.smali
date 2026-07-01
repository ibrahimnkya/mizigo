.class public final synthetic LV1/n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Li1/g;
.implements Lb2/o;
.implements Lk3/c;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(LK0/h;Ljava/lang/String;I)V
    .locals 0

    .line 1
    iput p3, p0, LV1/n;->e:I

    iput-object p2, p0, LV1/n;->f:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 2
    iput p2, p0, LV1/n;->e:I

    iput-object p1, p0, LV1/n;->f:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;)Li1/p;
    .locals 3

    .line 1
    iget v0, p0, LV1/n;->e:I

    .line 2
    .line 3
    iget-object v1, p0, LV1/n;->f:Ljava/lang/String;

    .line 4
    .line 5
    check-cast p1, LV1/E;

    .line 6
    .line 7
    packed-switch v0, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    sget-object v0, Lcom/google/firebase/messaging/FirebaseMessaging;->l:LA0/c;

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    new-instance v0, LV1/B;

    .line 16
    .line 17
    const-string v2, "U"

    .line 18
    .line 19
    invoke-direct {v0, v2, v1}, LV1/B;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v0}, LV1/E;->d(LV1/B;)Li1/p;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p1}, LV1/E;->f()V

    .line 27
    .line 28
    .line 29
    return-object v0

    .line 30
    :pswitch_0
    sget-object v0, Lcom/google/firebase/messaging/FirebaseMessaging;->l:LA0/c;

    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    new-instance v0, LV1/B;

    .line 36
    .line 37
    const-string v2, "S"

    .line 38
    .line 39
    invoke-direct {v0, v2, v1}, LV1/B;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v0}, LV1/E;->d(LV1/B;)Li1/p;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p1}, LV1/E;->f()V

    .line 47
    .line 48
    .line 49
    return-object v0

    .line 50
    nop

    .line 51
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public g()Ljava/lang/Object;
    .locals 2

    .line 1
    iget v0, p0, LV1/n;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    new-instance v0, LZ1/i;

    .line 7
    .line 8
    iget-object v1, p0, LV1/n;->f:Ljava/lang/String;

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    throw v0

    .line 14
    :pswitch_0
    new-instance v0, LZ1/i;

    .line 15
    .line 16
    iget-object v1, p0, LV1/n;->f:Ljava/lang/String;

    .line 17
    .line 18
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    throw v0

    .line 22
    nop

    .line 23
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public o(Ljava/lang/Object;)V
    .locals 4

    .line 1
    iget v0, p0, LV1/n;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    instance-of v0, p1, Ljava/util/List;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    check-cast p1, Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x1

    .line 17
    if-le v0, v1, :cond_1

    .line 18
    .line 19
    new-instance v0, Ls3/x;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Ljava/lang/String;

    .line 27
    .line 28
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Ljava/lang/String;

    .line 33
    .line 34
    const/4 v3, 0x2

    .line 35
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-direct {v0, v2, v1, p1}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iget-object p1, p0, LV1/n;->f:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {p1}, Lc1/g;->g(Ljava/lang/String;)Ls3/x;

    .line 46
    .line 47
    .line 48
    :cond_1
    :goto_0
    return-void

    .line 49
    :pswitch_0
    instance-of v0, p1, Ljava/util/List;

    .line 50
    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    check-cast p1, Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    const/4 v1, 0x1

    .line 60
    if-le v0, v1, :cond_3

    .line 61
    .line 62
    new-instance v0, Ls3/x;

    .line 63
    .line 64
    const/4 v2, 0x0

    .line 65
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    check-cast v2, Ljava/lang/String;

    .line 70
    .line 71
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    check-cast v1, Ljava/lang/String;

    .line 76
    .line 77
    const/4 v3, 0x2

    .line 78
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-direct {v0, v2, v1, p1}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_2
    iget-object p1, p0, LV1/n;->f:Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {p1}, Lc1/g;->g(Ljava/lang/String;)Ls3/x;

    .line 89
    .line 90
    .line 91
    :cond_3
    :goto_1
    return-void

    .line 92
    :pswitch_1
    instance-of v0, p1, Ljava/util/List;

    .line 93
    .line 94
    if-eqz v0, :cond_4

    .line 95
    .line 96
    check-cast p1, Ljava/util/List;

    .line 97
    .line 98
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    const/4 v1, 0x1

    .line 103
    if-le v0, v1, :cond_5

    .line 104
    .line 105
    new-instance v0, Ls3/x;

    .line 106
    .line 107
    const/4 v2, 0x0

    .line 108
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    check-cast v2, Ljava/lang/String;

    .line 113
    .line 114
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    check-cast v1, Ljava/lang/String;

    .line 119
    .line 120
    const/4 v3, 0x2

    .line 121
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-direct {v0, v2, v1, p1}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 126
    .line 127
    .line 128
    goto :goto_2

    .line 129
    :cond_4
    iget-object p1, p0, LV1/n;->f:Ljava/lang/String;

    .line 130
    .line 131
    invoke-static {p1}, Lc1/g;->g(Ljava/lang/String;)Ls3/x;

    .line 132
    .line 133
    .line 134
    :cond_5
    :goto_2
    return-void

    .line 135
    :pswitch_2
    instance-of v0, p1, Ljava/util/List;

    .line 136
    .line 137
    if-eqz v0, :cond_6

    .line 138
    .line 139
    check-cast p1, Ljava/util/List;

    .line 140
    .line 141
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    const/4 v1, 0x1

    .line 146
    if-le v0, v1, :cond_7

    .line 147
    .line 148
    new-instance v0, Ls3/x;

    .line 149
    .line 150
    const/4 v2, 0x0

    .line 151
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    check-cast v2, Ljava/lang/String;

    .line 156
    .line 157
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    check-cast v1, Ljava/lang/String;

    .line 162
    .line 163
    const/4 v3, 0x2

    .line 164
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    invoke-direct {v0, v2, v1, p1}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 169
    .line 170
    .line 171
    goto :goto_3

    .line 172
    :cond_6
    iget-object p1, p0, LV1/n;->f:Ljava/lang/String;

    .line 173
    .line 174
    invoke-static {p1}, Lc1/g;->g(Ljava/lang/String;)Ls3/x;

    .line 175
    .line 176
    .line 177
    :cond_7
    :goto_3
    return-void

    .line 178
    :pswitch_3
    instance-of v0, p1, Ljava/util/List;

    .line 179
    .line 180
    if-eqz v0, :cond_8

    .line 181
    .line 182
    check-cast p1, Ljava/util/List;

    .line 183
    .line 184
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    const/4 v1, 0x1

    .line 189
    if-le v0, v1, :cond_9

    .line 190
    .line 191
    new-instance v0, Ls3/x;

    .line 192
    .line 193
    const/4 v2, 0x0

    .line 194
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    check-cast v2, Ljava/lang/String;

    .line 199
    .line 200
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    check-cast v1, Ljava/lang/String;

    .line 205
    .line 206
    const/4 v3, 0x2

    .line 207
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    invoke-direct {v0, v2, v1, p1}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 212
    .line 213
    .line 214
    goto :goto_4

    .line 215
    :cond_8
    iget-object p1, p0, LV1/n;->f:Ljava/lang/String;

    .line 216
    .line 217
    invoke-static {p1}, Lc1/g;->g(Ljava/lang/String;)Ls3/x;

    .line 218
    .line 219
    .line 220
    :cond_9
    :goto_4
    return-void

    .line 221
    :pswitch_4
    instance-of v0, p1, Ljava/util/List;

    .line 222
    .line 223
    if-eqz v0, :cond_a

    .line 224
    .line 225
    check-cast p1, Ljava/util/List;

    .line 226
    .line 227
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    const/4 v1, 0x1

    .line 232
    if-le v0, v1, :cond_b

    .line 233
    .line 234
    new-instance v0, Ls3/x;

    .line 235
    .line 236
    const/4 v2, 0x0

    .line 237
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    move-result-object v2

    .line 241
    check-cast v2, Ljava/lang/String;

    .line 242
    .line 243
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    check-cast v1, Ljava/lang/String;

    .line 248
    .line 249
    const/4 v3, 0x2

    .line 250
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 251
    .line 252
    .line 253
    move-result-object p1

    .line 254
    invoke-direct {v0, v2, v1, p1}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 255
    .line 256
    .line 257
    goto :goto_5

    .line 258
    :cond_a
    iget-object p1, p0, LV1/n;->f:Ljava/lang/String;

    .line 259
    .line 260
    invoke-static {p1}, Lc1/g;->g(Ljava/lang/String;)Ls3/x;

    .line 261
    .line 262
    .line 263
    :cond_b
    :goto_5
    return-void

    .line 264
    :pswitch_5
    instance-of v0, p1, Ljava/util/List;

    .line 265
    .line 266
    if-eqz v0, :cond_c

    .line 267
    .line 268
    check-cast p1, Ljava/util/List;

    .line 269
    .line 270
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 271
    .line 272
    .line 273
    move-result v0

    .line 274
    const/4 v1, 0x1

    .line 275
    if-le v0, v1, :cond_d

    .line 276
    .line 277
    new-instance v0, Ls3/x;

    .line 278
    .line 279
    const/4 v2, 0x0

    .line 280
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 281
    .line 282
    .line 283
    move-result-object v2

    .line 284
    check-cast v2, Ljava/lang/String;

    .line 285
    .line 286
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 287
    .line 288
    .line 289
    move-result-object v1

    .line 290
    check-cast v1, Ljava/lang/String;

    .line 291
    .line 292
    const/4 v3, 0x2

    .line 293
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    move-result-object p1

    .line 297
    invoke-direct {v0, v2, v1, p1}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 298
    .line 299
    .line 300
    goto :goto_6

    .line 301
    :cond_c
    iget-object p1, p0, LV1/n;->f:Ljava/lang/String;

    .line 302
    .line 303
    invoke-static {p1}, Lc1/g;->g(Ljava/lang/String;)Ls3/x;

    .line 304
    .line 305
    .line 306
    :cond_d
    :goto_6
    return-void

    .line 307
    :pswitch_6
    instance-of v0, p1, Ljava/util/List;

    .line 308
    .line 309
    if-eqz v0, :cond_e

    .line 310
    .line 311
    check-cast p1, Ljava/util/List;

    .line 312
    .line 313
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 314
    .line 315
    .line 316
    move-result v0

    .line 317
    const/4 v1, 0x1

    .line 318
    if-le v0, v1, :cond_f

    .line 319
    .line 320
    new-instance v0, Ls3/x;

    .line 321
    .line 322
    const/4 v2, 0x0

    .line 323
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 324
    .line 325
    .line 326
    move-result-object v2

    .line 327
    check-cast v2, Ljava/lang/String;

    .line 328
    .line 329
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 330
    .line 331
    .line 332
    move-result-object v1

    .line 333
    check-cast v1, Ljava/lang/String;

    .line 334
    .line 335
    const/4 v3, 0x2

    .line 336
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 337
    .line 338
    .line 339
    move-result-object p1

    .line 340
    invoke-direct {v0, v2, v1, p1}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 341
    .line 342
    .line 343
    goto :goto_7

    .line 344
    :cond_e
    iget-object p1, p0, LV1/n;->f:Ljava/lang/String;

    .line 345
    .line 346
    invoke-static {p1}, Lc1/g;->g(Ljava/lang/String;)Ls3/x;

    .line 347
    .line 348
    .line 349
    :cond_f
    :goto_7
    return-void

    .line 350
    :pswitch_7
    instance-of v0, p1, Ljava/util/List;

    .line 351
    .line 352
    if-eqz v0, :cond_10

    .line 353
    .line 354
    check-cast p1, Ljava/util/List;

    .line 355
    .line 356
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 357
    .line 358
    .line 359
    move-result v0

    .line 360
    const/4 v1, 0x1

    .line 361
    if-le v0, v1, :cond_11

    .line 362
    .line 363
    new-instance v0, Ls3/x;

    .line 364
    .line 365
    const/4 v2, 0x0

    .line 366
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 367
    .line 368
    .line 369
    move-result-object v2

    .line 370
    check-cast v2, Ljava/lang/String;

    .line 371
    .line 372
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 373
    .line 374
    .line 375
    move-result-object v1

    .line 376
    check-cast v1, Ljava/lang/String;

    .line 377
    .line 378
    const/4 v3, 0x2

    .line 379
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 380
    .line 381
    .line 382
    move-result-object p1

    .line 383
    invoke-direct {v0, v2, v1, p1}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 384
    .line 385
    .line 386
    goto :goto_8

    .line 387
    :cond_10
    iget-object p1, p0, LV1/n;->f:Ljava/lang/String;

    .line 388
    .line 389
    invoke-static {p1}, Lc1/g;->g(Ljava/lang/String;)Ls3/x;

    .line 390
    .line 391
    .line 392
    :cond_11
    :goto_8
    return-void

    .line 393
    :pswitch_8
    instance-of v0, p1, Ljava/util/List;

    .line 394
    .line 395
    if-eqz v0, :cond_12

    .line 396
    .line 397
    check-cast p1, Ljava/util/List;

    .line 398
    .line 399
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 400
    .line 401
    .line 402
    move-result v0

    .line 403
    const/4 v1, 0x1

    .line 404
    if-le v0, v1, :cond_13

    .line 405
    .line 406
    new-instance v0, Ls3/x;

    .line 407
    .line 408
    const/4 v2, 0x0

    .line 409
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 410
    .line 411
    .line 412
    move-result-object v2

    .line 413
    check-cast v2, Ljava/lang/String;

    .line 414
    .line 415
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 416
    .line 417
    .line 418
    move-result-object v1

    .line 419
    check-cast v1, Ljava/lang/String;

    .line 420
    .line 421
    const/4 v3, 0x2

    .line 422
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 423
    .line 424
    .line 425
    move-result-object p1

    .line 426
    invoke-direct {v0, v2, v1, p1}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 427
    .line 428
    .line 429
    goto :goto_9

    .line 430
    :cond_12
    iget-object p1, p0, LV1/n;->f:Ljava/lang/String;

    .line 431
    .line 432
    invoke-static {p1}, Lc1/g;->g(Ljava/lang/String;)Ls3/x;

    .line 433
    .line 434
    .line 435
    :cond_13
    :goto_9
    return-void

    .line 436
    :pswitch_9
    instance-of v0, p1, Ljava/util/List;

    .line 437
    .line 438
    if-eqz v0, :cond_14

    .line 439
    .line 440
    check-cast p1, Ljava/util/List;

    .line 441
    .line 442
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 443
    .line 444
    .line 445
    move-result v0

    .line 446
    const/4 v1, 0x1

    .line 447
    if-le v0, v1, :cond_15

    .line 448
    .line 449
    new-instance v0, Ls3/x;

    .line 450
    .line 451
    const/4 v2, 0x0

    .line 452
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 453
    .line 454
    .line 455
    move-result-object v2

    .line 456
    check-cast v2, Ljava/lang/String;

    .line 457
    .line 458
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 459
    .line 460
    .line 461
    move-result-object v1

    .line 462
    check-cast v1, Ljava/lang/String;

    .line 463
    .line 464
    const/4 v3, 0x2

    .line 465
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 466
    .line 467
    .line 468
    move-result-object p1

    .line 469
    invoke-direct {v0, v2, v1, p1}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 470
    .line 471
    .line 472
    goto :goto_a

    .line 473
    :cond_14
    iget-object p1, p0, LV1/n;->f:Ljava/lang/String;

    .line 474
    .line 475
    invoke-static {p1}, Lc1/g;->g(Ljava/lang/String;)Ls3/x;

    .line 476
    .line 477
    .line 478
    :cond_15
    :goto_a
    return-void

    .line 479
    :pswitch_a
    instance-of v0, p1, Ljava/util/List;

    .line 480
    .line 481
    if-eqz v0, :cond_16

    .line 482
    .line 483
    check-cast p1, Ljava/util/List;

    .line 484
    .line 485
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 486
    .line 487
    .line 488
    move-result v0

    .line 489
    const/4 v1, 0x1

    .line 490
    if-le v0, v1, :cond_17

    .line 491
    .line 492
    new-instance v0, Ls3/x;

    .line 493
    .line 494
    const/4 v2, 0x0

    .line 495
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 496
    .line 497
    .line 498
    move-result-object v2

    .line 499
    check-cast v2, Ljava/lang/String;

    .line 500
    .line 501
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 502
    .line 503
    .line 504
    move-result-object v1

    .line 505
    check-cast v1, Ljava/lang/String;

    .line 506
    .line 507
    const/4 v3, 0x2

    .line 508
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 509
    .line 510
    .line 511
    move-result-object p1

    .line 512
    invoke-direct {v0, v2, v1, p1}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 513
    .line 514
    .line 515
    goto :goto_b

    .line 516
    :cond_16
    iget-object p1, p0, LV1/n;->f:Ljava/lang/String;

    .line 517
    .line 518
    invoke-static {p1}, Lc1/g;->g(Ljava/lang/String;)Ls3/x;

    .line 519
    .line 520
    .line 521
    :cond_17
    :goto_b
    return-void

    .line 522
    :pswitch_b
    instance-of v0, p1, Ljava/util/List;

    .line 523
    .line 524
    if-eqz v0, :cond_18

    .line 525
    .line 526
    check-cast p1, Ljava/util/List;

    .line 527
    .line 528
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 529
    .line 530
    .line 531
    move-result v0

    .line 532
    const/4 v1, 0x1

    .line 533
    if-le v0, v1, :cond_19

    .line 534
    .line 535
    new-instance v0, Ls3/x;

    .line 536
    .line 537
    const/4 v2, 0x0

    .line 538
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 539
    .line 540
    .line 541
    move-result-object v2

    .line 542
    check-cast v2, Ljava/lang/String;

    .line 543
    .line 544
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 545
    .line 546
    .line 547
    move-result-object v1

    .line 548
    check-cast v1, Ljava/lang/String;

    .line 549
    .line 550
    const/4 v3, 0x2

    .line 551
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 552
    .line 553
    .line 554
    move-result-object p1

    .line 555
    invoke-direct {v0, v2, v1, p1}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 556
    .line 557
    .line 558
    goto :goto_c

    .line 559
    :cond_18
    iget-object p1, p0, LV1/n;->f:Ljava/lang/String;

    .line 560
    .line 561
    invoke-static {p1}, Lc1/g;->g(Ljava/lang/String;)Ls3/x;

    .line 562
    .line 563
    .line 564
    :cond_19
    :goto_c
    return-void

    .line 565
    :pswitch_c
    instance-of v0, p1, Ljava/util/List;

    .line 566
    .line 567
    if-eqz v0, :cond_1a

    .line 568
    .line 569
    check-cast p1, Ljava/util/List;

    .line 570
    .line 571
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 572
    .line 573
    .line 574
    move-result v0

    .line 575
    const/4 v1, 0x1

    .line 576
    if-le v0, v1, :cond_1b

    .line 577
    .line 578
    new-instance v0, Ls3/x;

    .line 579
    .line 580
    const/4 v2, 0x0

    .line 581
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 582
    .line 583
    .line 584
    move-result-object v2

    .line 585
    check-cast v2, Ljava/lang/String;

    .line 586
    .line 587
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 588
    .line 589
    .line 590
    move-result-object v1

    .line 591
    check-cast v1, Ljava/lang/String;

    .line 592
    .line 593
    const/4 v3, 0x2

    .line 594
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 595
    .line 596
    .line 597
    move-result-object p1

    .line 598
    invoke-direct {v0, v2, v1, p1}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 599
    .line 600
    .line 601
    goto :goto_d

    .line 602
    :cond_1a
    iget-object p1, p0, LV1/n;->f:Ljava/lang/String;

    .line 603
    .line 604
    invoke-static {p1}, Lc1/g;->g(Ljava/lang/String;)Ls3/x;

    .line 605
    .line 606
    .line 607
    :cond_1b
    :goto_d
    return-void

    .line 608
    :pswitch_d
    instance-of v0, p1, Ljava/util/List;

    .line 609
    .line 610
    if-eqz v0, :cond_1c

    .line 611
    .line 612
    check-cast p1, Ljava/util/List;

    .line 613
    .line 614
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 615
    .line 616
    .line 617
    move-result v0

    .line 618
    const/4 v1, 0x1

    .line 619
    if-le v0, v1, :cond_1d

    .line 620
    .line 621
    new-instance v0, Ls3/x;

    .line 622
    .line 623
    const/4 v2, 0x0

    .line 624
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 625
    .line 626
    .line 627
    move-result-object v2

    .line 628
    check-cast v2, Ljava/lang/String;

    .line 629
    .line 630
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 631
    .line 632
    .line 633
    move-result-object v1

    .line 634
    check-cast v1, Ljava/lang/String;

    .line 635
    .line 636
    const/4 v3, 0x2

    .line 637
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 638
    .line 639
    .line 640
    move-result-object p1

    .line 641
    invoke-direct {v0, v2, v1, p1}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 642
    .line 643
    .line 644
    goto :goto_e

    .line 645
    :cond_1c
    iget-object p1, p0, LV1/n;->f:Ljava/lang/String;

    .line 646
    .line 647
    invoke-static {p1}, Lc1/g;->g(Ljava/lang/String;)Ls3/x;

    .line 648
    .line 649
    .line 650
    :cond_1d
    :goto_e
    return-void

    .line 651
    :pswitch_data_0
    .packed-switch 0x4
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
