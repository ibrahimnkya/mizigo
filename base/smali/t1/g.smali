.class public final Lt1/g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ls1/F;


# static fields
.field public static final b:Lt1/g;

.field public static final c:Lt1/g;

.field public static final d:Ls1/B;


# instance fields
.field public final synthetic a:I


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lt1/g;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lt1/g;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lt1/g;->b:Lt1/g;

    .line 8
    .line 9
    new-instance v0, Lt1/g;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-direct {v0, v1}, Lt1/g;-><init>(I)V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lt1/g;->c:Lt1/g;

    .line 16
    .line 17
    new-instance v0, Ls1/r;

    .line 18
    .line 19
    const/4 v1, 0x5

    .line 20
    invoke-direct {v0, v1}, Ls1/r;-><init>(I)V

    .line 21
    .line 22
    .line 23
    new-instance v1, Ls1/B;

    .line 24
    .line 25
    const-class v2, Ls1/i;

    .line 26
    .line 27
    const-class v3, Lj1/h;

    .line 28
    .line 29
    invoke-direct {v1, v2, v3, v0}, Ls1/B;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ls1/C;)V

    .line 30
    .line 31
    .line 32
    sput-object v1, Lt1/g;->d:Ls1/B;

    .line 33
    .line 34
    return-void
.end method

.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Lt1/g;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Class;
    .locals 1

    .line 1
    iget v0, p0, Lt1/g;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const-class v0, Lj1/h;

    .line 7
    .line 8
    return-object v0

    .line 9
    :pswitch_0
    const-class v0, Lt1/e;

    .line 10
    .line 11
    return-object v0

    .line 12
    nop

    .line 13
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final b(LB2/a;Ls1/k;LE0/j;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget v0, p0, Lt1/g;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    :goto_0
    iget-object v2, p1, LB2/a;->f:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v2, Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-ge v1, v2, :cond_6

    .line 21
    .line 22
    invoke-virtual {p1, v1}, LB2/a;->w(I)Lj1/f;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iget-object v3, v2, Lj1/f;->c:Lj1/c;

    .line 27
    .line 28
    sget-object v4, Lj1/c;->c:Lj1/c;

    .line 29
    .line 30
    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-eqz v3, :cond_5

    .line 35
    .line 36
    invoke-virtual {p3, v2}, LE0/j;->a(Lj1/f;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Lj1/h;

    .line 41
    .line 42
    invoke-virtual {v2}, Lj1/f;->a()Landroid/support/v4/media/session/a;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    instance-of v5, v4, Lt1/n;

    .line 47
    .line 48
    if-eqz v5, :cond_0

    .line 49
    .line 50
    check-cast v4, Lt1/n;

    .line 51
    .line 52
    invoke-virtual {v4}, Lt1/n;->c0()Lz1/a;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    goto :goto_1

    .line 57
    :cond_0
    instance-of v5, v4, Ls1/i;

    .line 58
    .line 59
    if-eqz v5, :cond_4

    .line 60
    .line 61
    check-cast v4, Ls1/i;

    .line 62
    .line 63
    invoke-virtual {v4}, Ls1/i;->c0()Lz1/a;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    :goto_1
    new-instance v5, Lt1/p;

    .line 68
    .line 69
    iget v2, v2, Lj1/f;->d:I

    .line 70
    .line 71
    invoke-direct {v5, v3, v2}, Lt1/p;-><init>(Lj1/h;I)V

    .line 72
    .line 73
    .line 74
    iget-object v2, v4, Lz1/a;->a:[B

    .line 75
    .line 76
    array-length v3, v2

    .line 77
    if-eqz v3, :cond_2

    .line 78
    .line 79
    array-length v2, v2

    .line 80
    const/4 v3, 0x5

    .line 81
    if-ne v2, v3, :cond_1

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_1
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 85
    .line 86
    const-string p2, "PrefixMap only supports 0 and 5 byte prefixes"

    .line 87
    .line 88
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    throw p1

    .line 92
    :cond_2
    :goto_2
    invoke-virtual {v0, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    if-eqz v2, :cond_3

    .line 97
    .line 98
    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    check-cast v2, Ljava/util/List;

    .line 103
    .line 104
    goto :goto_3

    .line 105
    :cond_3
    new-instance v2, Ljava/util/ArrayList;

    .line 106
    .line 107
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    :goto_3
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    goto :goto_4

    .line 117
    :cond_4
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 118
    .line 119
    new-instance p2, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    const-string p3, "Cannot get output prefix for key of class "

    .line 122
    .line 123
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 127
    .line 128
    .line 129
    move-result-object p3

    .line 130
    invoke-virtual {p3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p3

    .line 134
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    const-string p3, " with parameters "

    .line 138
    .line 139
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v4}, Landroid/support/v4/media/session/a;->p()Lj1/i;

    .line 143
    .line 144
    .line 145
    move-result-object p3

    .line 146
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p2

    .line 153
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    throw p1

    .line 157
    :cond_5
    :goto_4
    add-int/lit8 v1, v1, 0x1

    .line 158
    .line 159
    goto/16 :goto_0

    .line 160
    .line 161
    :cond_6
    iget-object p2, p2, Ls1/k;->a:Ljava/util/Map;

    .line 162
    .line 163
    invoke-interface {p2}, Ljava/util/Map;->isEmpty()Z

    .line 164
    .line 165
    .line 166
    move-result p2

    .line 167
    if-nez p2, :cond_8

    .line 168
    .line 169
    sget-object p2, Ls1/o;->b:Ls1/o;

    .line 170
    .line 171
    iget-object p2, p2, Ls1/o;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 172
    .line 173
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object p2

    .line 177
    check-cast p2, Ls1/n;

    .line 178
    .line 179
    if-nez p2, :cond_7

    .line 180
    .line 181
    sget-object p2, Ls1/o;->c:Ls1/n;

    .line 182
    .line 183
    :cond_7
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 184
    .line 185
    .line 186
    :cond_8
    invoke-virtual {p1}, LB2/a;->A()Lj1/f;

    .line 187
    .line 188
    .line 189
    move-result-object p2

    .line 190
    invoke-virtual {p3, p2}, LE0/j;->a(Lj1/f;)Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object p2

    .line 194
    check-cast p2, Lj1/h;

    .line 195
    .line 196
    new-instance p3, Lt1/q;

    .line 197
    .line 198
    new-instance v1, Lt1/p;

    .line 199
    .line 200
    invoke-virtual {p1}, LB2/a;->A()Lj1/f;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    iget p1, p1, Lj1/f;->d:I

    .line 205
    .line 206
    invoke-direct {v1, p2, p1}, Lt1/p;-><init>(Lj1/h;I)V

    .line 207
    .line 208
    .line 209
    new-instance p1, Ls1/A;

    .line 210
    .line 211
    invoke-direct {p1, v0}, Ls1/A;-><init>(Ljava/util/HashMap;)V

    .line 212
    .line 213
    .line 214
    invoke-direct {p3}, Ljava/lang/Object;-><init>()V

    .line 215
    .line 216
    .line 217
    return-object p3

    .line 218
    :pswitch_0
    invoke-virtual {p1}, LB2/a;->A()Lj1/f;

    .line 219
    .line 220
    .line 221
    move-result-object p2

    .line 222
    new-instance v0, Ljava/util/HashMap;

    .line 223
    .line 224
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 225
    .line 226
    .line 227
    const/4 v1, 0x0

    .line 228
    :goto_5
    iget-object v2, p1, LB2/a;->f:Ljava/lang/Object;

    .line 229
    .line 230
    check-cast v2, Ljava/util/List;

    .line 231
    .line 232
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 233
    .line 234
    .line 235
    move-result v2

    .line 236
    if-ge v1, v2, :cond_f

    .line 237
    .line 238
    invoke-virtual {p1, v1}, LB2/a;->w(I)Lj1/f;

    .line 239
    .line 240
    .line 241
    move-result-object v2

    .line 242
    iget-object v3, v2, Lj1/f;->c:Lj1/c;

    .line 243
    .line 244
    sget-object v4, Lj1/c;->c:Lj1/c;

    .line 245
    .line 246
    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 247
    .line 248
    .line 249
    move-result v3

    .line 250
    if-eqz v3, :cond_e

    .line 251
    .line 252
    invoke-virtual {p3, v2}, LE0/j;->a(Lj1/f;)Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    move-result-object v3

    .line 256
    check-cast v3, Lt1/e;

    .line 257
    .line 258
    invoke-virtual {v2}, Lj1/f;->a()Landroid/support/v4/media/session/a;

    .line 259
    .line 260
    .line 261
    move-result-object v2

    .line 262
    instance-of v4, v2, Lt1/n;

    .line 263
    .line 264
    if-eqz v4, :cond_9

    .line 265
    .line 266
    check-cast v2, Lt1/n;

    .line 267
    .line 268
    invoke-virtual {v2}, Lt1/n;->c0()Lz1/a;

    .line 269
    .line 270
    .line 271
    move-result-object v2

    .line 272
    goto :goto_6

    .line 273
    :cond_9
    instance-of v4, v2, Ls1/i;

    .line 274
    .line 275
    if-eqz v4, :cond_d

    .line 276
    .line 277
    check-cast v2, Ls1/i;

    .line 278
    .line 279
    invoke-virtual {v2}, Ls1/i;->c0()Lz1/a;

    .line 280
    .line 281
    .line 282
    move-result-object v2

    .line 283
    :goto_6
    iget-object v4, v2, Lz1/a;->a:[B

    .line 284
    .line 285
    array-length v5, v4

    .line 286
    if-eqz v5, :cond_b

    .line 287
    .line 288
    array-length v4, v4

    .line 289
    const/4 v5, 0x5

    .line 290
    if-ne v4, v5, :cond_a

    .line 291
    .line 292
    goto :goto_7

    .line 293
    :cond_a
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 294
    .line 295
    const-string p2, "PrefixMap only supports 0 and 5 byte prefixes"

    .line 296
    .line 297
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 298
    .line 299
    .line 300
    throw p1

    .line 301
    :cond_b
    :goto_7
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 302
    .line 303
    .line 304
    move-result v4

    .line 305
    if-eqz v4, :cond_c

    .line 306
    .line 307
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 308
    .line 309
    .line 310
    move-result-object v2

    .line 311
    check-cast v2, Ljava/util/List;

    .line 312
    .line 313
    goto :goto_8

    .line 314
    :cond_c
    new-instance v4, Ljava/util/ArrayList;

    .line 315
    .line 316
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 317
    .line 318
    .line 319
    invoke-virtual {v0, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 320
    .line 321
    .line 322
    move-object v2, v4

    .line 323
    :goto_8
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 324
    .line 325
    .line 326
    goto :goto_9

    .line 327
    :cond_d
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 328
    .line 329
    new-instance p2, Ljava/lang/StringBuilder;

    .line 330
    .line 331
    const-string p3, "Cannot get output prefix for key of class "

    .line 332
    .line 333
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 334
    .line 335
    .line 336
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 337
    .line 338
    .line 339
    move-result-object p3

    .line 340
    invoke-virtual {p3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 341
    .line 342
    .line 343
    move-result-object p3

    .line 344
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 345
    .line 346
    .line 347
    const-string p3, " with parameters "

    .line 348
    .line 349
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 350
    .line 351
    .line 352
    invoke-virtual {v2}, Landroid/support/v4/media/session/a;->p()Lj1/i;

    .line 353
    .line 354
    .line 355
    move-result-object p3

    .line 356
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 357
    .line 358
    .line 359
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object p2

    .line 363
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 364
    .line 365
    .line 366
    throw p1

    .line 367
    :cond_e
    :goto_9
    add-int/lit8 v1, v1, 0x1

    .line 368
    .line 369
    goto/16 :goto_5

    .line 370
    .line 371
    :cond_f
    invoke-virtual {p3, p2}, LE0/j;->a(Lj1/f;)Ljava/lang/Object;

    .line 372
    .line 373
    .line 374
    move-result-object p1

    .line 375
    check-cast p1, Lt1/e;

    .line 376
    .line 377
    new-instance p1, Lt1/f;

    .line 378
    .line 379
    new-instance p2, Ls1/A;

    .line 380
    .line 381
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 382
    .line 383
    .line 384
    return-object p1

    .line 385
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final c()Ljava/lang/Class;
    .locals 1

    .line 1
    iget v0, p0, Lt1/g;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const-class v0, Lj1/h;

    .line 7
    .line 8
    return-object v0

    .line 9
    :pswitch_0
    const-class v0, Lt1/e;

    .line 10
    .line 11
    return-object v0

    .line 12
    nop

    .line 13
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
