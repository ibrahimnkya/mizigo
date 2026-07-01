.class public final synthetic Ll1/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ls1/v;
.implements Ls1/f;
.implements Ls1/d;
.implements Ls1/x;
.implements Ls1/C;


# instance fields
.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll1/b;->e:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a()Ljavax/crypto/Cipher;
    .locals 3

    .line 1
    :try_start_0
    sget-object v0, Lm1/a;->a:LV0/i;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljavax/crypto/Cipher;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 13
    .line 14
    const-string v1, "AES GCM SIV cipher is invalid."

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    throw v0
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    :catch_0
    move-exception v0

    .line 21
    new-instance v1, Ljava/security/GeneralSecurityException;

    .line 22
    .line 23
    const-string v2, "AES GCM SIV cipher is not available or is invalid."

    .line 24
    .line 25
    invoke-direct {v1, v2, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    throw v1
.end method


# virtual methods
.method public b(Ls1/H;)Lj1/i;
    .locals 3

    .line 1
    iget v0, p0, Ll1/b;->e:I

    .line 2
    .line 3
    sparse-switch v0, :sswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object p1, p1, Ls1/H;->b:Lx1/b0;

    .line 7
    .line 8
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "type.googleapis.com/google.crypto.tink.AesSivKey"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    :try_start_0
    invoke-virtual {p1}, Lx1/b0;->F()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/o;->a()Lcom/google/crypto/tink/shaded/protobuf/o;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {v0, v1}, Lx1/H;->D(Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/H;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Lx1/H;->B()I

    .line 33
    .line 34
    .line 35
    move-result v1
    :try_end_0
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    if-nez v1, :cond_0

    .line 37
    .line 38
    invoke-static {}, Lp1/d;->b()LZ2/s;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0}, Lx1/H;->A()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    invoke-virtual {v1, v0}, LZ2/s;->C(I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1}, Lx1/b0;->D()Lx1/t0;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-static {p1}, Lq1/a;->b(Lx1/t0;)Lp1/c;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iput-object p1, v1, LZ2/s;->g:Ljava/lang/Object;

    .line 58
    .line 59
    invoke-virtual {v1}, LZ2/s;->v()Lp1/d;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    return-object p1

    .line 64
    :cond_0
    :try_start_1
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 65
    .line 66
    const-string v0, "Only version 0 keys are accepted"

    .line 67
    .line 68
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    throw p1
    :try_end_1
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_1 .. :try_end_1} :catch_0

    .line 72
    :catch_0
    move-exception p1

    .line 73
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 74
    .line 75
    const-string v1, "Parsing AesSivParameters failed: "

    .line 76
    .line 77
    invoke-direct {v0, v1, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    throw v0

    .line 81
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 82
    .line 83
    new-instance v1, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    const-string v2, "Wrong type URL in call to AesSivParameters.parseParameters: "

    .line 86
    .line 87
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    throw v0

    .line 105
    :sswitch_0
    iget-object p1, p1, Ls1/H;->b:Lx1/b0;

    .line 106
    .line 107
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    const-string v1, "type.googleapis.com/google.crypto.tink.XChaCha20Poly1305Key"

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-eqz v0, :cond_3

    .line 118
    .line 119
    :try_start_2
    invoke-virtual {p1}, Lx1/b0;->F()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/o;->a()Lcom/google/crypto/tink/shaded/protobuf/o;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-static {v0, v1}, Lx1/D0;->B(Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/D0;

    .line 128
    .line 129
    .line 130
    move-result-object v0
    :try_end_2
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_2 .. :try_end_2} :catch_1

    .line 131
    invoke-virtual {v0}, Lx1/D0;->A()I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-nez v0, :cond_2

    .line 136
    .line 137
    invoke-virtual {p1}, Lx1/b0;->D()Lx1/t0;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-static {p1}, Ll1/p;->b(Lx1/t0;)Lk1/k;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    new-instance v0, Lk1/N;

    .line 146
    .line 147
    invoke-direct {v0, p1}, Lk1/N;-><init>(Lk1/k;)V

    .line 148
    .line 149
    .line 150
    return-object v0

    .line 151
    :cond_2
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 152
    .line 153
    const-string v0, "Only version 0 parameters are accepted"

    .line 154
    .line 155
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    throw p1

    .line 159
    :catch_1
    move-exception p1

    .line 160
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 161
    .line 162
    const-string v1, "Parsing XChaCha20Poly1305Parameters failed: "

    .line 163
    .line 164
    invoke-direct {v0, v1, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 165
    .line 166
    .line 167
    throw v0

    .line 168
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 169
    .line 170
    new-instance v1, Ljava/lang/StringBuilder;

    .line 171
    .line 172
    const-string v2, "Wrong type URL in call to XChaCha20Poly1305ProtoSerialization.parseParameters: "

    .line 173
    .line 174
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    throw v0

    .line 192
    :sswitch_1
    iget-object p1, p1, Ls1/H;->b:Lx1/b0;

    .line 193
    .line 194
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    const-string v1, "type.googleapis.com/google.crypto.tink.XAesGcmKey"

    .line 199
    .line 200
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result v0

    .line 204
    if-eqz v0, :cond_5

    .line 205
    .line 206
    :try_start_3
    invoke-virtual {p1}, Lx1/b0;->F()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/o;->a()Lcom/google/crypto/tink/shaded/protobuf/o;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    invoke-static {v0, v1}, Lx1/y0;->D(Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/y0;

    .line 215
    .line 216
    .line 217
    move-result-object v0
    :try_end_3
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_3 .. :try_end_3} :catch_2

    .line 218
    invoke-virtual {v0}, Lx1/y0;->B()I

    .line 219
    .line 220
    .line 221
    move-result v1

    .line 222
    if-nez v1, :cond_4

    .line 223
    .line 224
    invoke-virtual {p1}, Lx1/b0;->D()Lx1/t0;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    invoke-static {p1}, Ll1/n;->b(Lx1/t0;)Lk1/k;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    invoke-virtual {v0}, Lx1/y0;->A()Lx1/A0;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    invoke-virtual {v0}, Lx1/A0;->B()I

    .line 237
    .line 238
    .line 239
    move-result v0

    .line 240
    invoke-static {v0, p1}, Lk1/K;->b(ILk1/k;)Lk1/K;

    .line 241
    .line 242
    .line 243
    move-result-object p1

    .line 244
    return-object p1

    .line 245
    :cond_4
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 246
    .line 247
    const-string v0, "Only version 0 parameters are accepted"

    .line 248
    .line 249
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 250
    .line 251
    .line 252
    throw p1

    .line 253
    :catch_2
    move-exception p1

    .line 254
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 255
    .line 256
    const-string v1, "Parsing XAesGcmParameters failed: "

    .line 257
    .line 258
    invoke-direct {v0, v1, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 259
    .line 260
    .line 261
    throw v0

    .line 262
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 263
    .line 264
    new-instance v1, Ljava/lang/StringBuilder;

    .line 265
    .line 266
    const-string v2, "Wrong type URL in call to XAesGcmProtoSerialization.parseParameters: "

    .line 267
    .line 268
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object p1

    .line 275
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object p1

    .line 282
    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    throw v0

    .line 286
    :sswitch_2
    iget-object p1, p1, Ls1/H;->b:Lx1/b0;

    .line 287
    .line 288
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v0

    .line 292
    const-string v1, "type.googleapis.com/google.crypto.tink.ChaCha20Poly1305Key"

    .line 293
    .line 294
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 295
    .line 296
    .line 297
    move-result v0

    .line 298
    if-eqz v0, :cond_6

    .line 299
    .line 300
    :try_start_4
    invoke-virtual {p1}, Lx1/b0;->F()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/o;->a()Lcom/google/crypto/tink/shaded/protobuf/o;

    .line 305
    .line 306
    .line 307
    move-result-object v1

    .line 308
    invoke-static {v0, v1}, Lx1/L;->A(Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)V
    :try_end_4
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_4 .. :try_end_4} :catch_3

    .line 309
    .line 310
    .line 311
    invoke-virtual {p1}, Lx1/b0;->D()Lx1/t0;

    .line 312
    .line 313
    .line 314
    move-result-object p1

    .line 315
    invoke-static {p1}, Ll1/i;->b(Lx1/t0;)Lk1/k;

    .line 316
    .line 317
    .line 318
    move-result-object p1

    .line 319
    new-instance v0, Lk1/x;

    .line 320
    .line 321
    invoke-direct {v0, p1}, Lk1/x;-><init>(Lk1/k;)V

    .line 322
    .line 323
    .line 324
    return-object v0

    .line 325
    :catch_3
    move-exception p1

    .line 326
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 327
    .line 328
    const-string v1, "Parsing ChaCha20Poly1305Parameters failed: "

    .line 329
    .line 330
    invoke-direct {v0, v1, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 331
    .line 332
    .line 333
    throw v0

    .line 334
    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 335
    .line 336
    new-instance v1, Ljava/lang/StringBuilder;

    .line 337
    .line 338
    const-string v2, "Wrong type URL in call to ChaCha20Poly1305ProtoSerialization.parseParameters: "

    .line 339
    .line 340
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 341
    .line 342
    .line 343
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object p1

    .line 347
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 348
    .line 349
    .line 350
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object p1

    .line 354
    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 355
    .line 356
    .line 357
    throw v0

    .line 358
    :sswitch_3
    iget-object p1, p1, Ls1/H;->b:Lx1/b0;

    .line 359
    .line 360
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object v0

    .line 364
    const-string v1, "type.googleapis.com/google.crypto.tink.AesGcmSivKey"

    .line 365
    .line 366
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 367
    .line 368
    .line 369
    move-result v0

    .line 370
    if-eqz v0, :cond_8

    .line 371
    .line 372
    :try_start_5
    invoke-virtual {p1}, Lx1/b0;->F()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 373
    .line 374
    .line 375
    move-result-object v0

    .line 376
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/o;->a()Lcom/google/crypto/tink/shaded/protobuf/o;

    .line 377
    .line 378
    .line 379
    move-result-object v1

    .line 380
    invoke-static {v0, v1}, Lx1/D;->D(Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/D;

    .line 381
    .line 382
    .line 383
    move-result-object v0
    :try_end_5
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_5 .. :try_end_5} :catch_4

    .line 384
    invoke-virtual {v0}, Lx1/D;->B()I

    .line 385
    .line 386
    .line 387
    move-result v1

    .line 388
    if-nez v1, :cond_7

    .line 389
    .line 390
    invoke-static {}, Lk1/u;->b()LZ2/s;

    .line 391
    .line 392
    .line 393
    move-result-object v1

    .line 394
    invoke-virtual {v0}, Lx1/D;->A()I

    .line 395
    .line 396
    .line 397
    move-result v0

    .line 398
    invoke-virtual {v1, v0}, LZ2/s;->C(I)V

    .line 399
    .line 400
    .line 401
    invoke-virtual {p1}, Lx1/b0;->D()Lx1/t0;

    .line 402
    .line 403
    .line 404
    move-result-object p1

    .line 405
    invoke-static {p1}, Ll1/g;->b(Lx1/t0;)Lk1/k;

    .line 406
    .line 407
    .line 408
    move-result-object p1

    .line 409
    iput-object p1, v1, LZ2/s;->g:Ljava/lang/Object;

    .line 410
    .line 411
    invoke-virtual {v1}, LZ2/s;->u()Lk1/u;

    .line 412
    .line 413
    .line 414
    move-result-object p1

    .line 415
    return-object p1

    .line 416
    :cond_7
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 417
    .line 418
    const-string v0, "Only version 0 parameters are accepted"

    .line 419
    .line 420
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 421
    .line 422
    .line 423
    throw p1

    .line 424
    :catch_4
    move-exception p1

    .line 425
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 426
    .line 427
    const-string v1, "Parsing AesGcmSivParameters failed: "

    .line 428
    .line 429
    invoke-direct {v0, v1, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 430
    .line 431
    .line 432
    throw v0

    .line 433
    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 434
    .line 435
    new-instance v1, Ljava/lang/StringBuilder;

    .line 436
    .line 437
    const-string v2, "Wrong type URL in call to AesGcmSivProtoSerialization.parseParameters: "

    .line 438
    .line 439
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 440
    .line 441
    .line 442
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 443
    .line 444
    .line 445
    move-result-object p1

    .line 446
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 447
    .line 448
    .line 449
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 450
    .line 451
    .line 452
    move-result-object p1

    .line 453
    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 454
    .line 455
    .line 456
    throw v0

    .line 457
    :sswitch_4
    iget-object p1, p1, Ls1/H;->b:Lx1/b0;

    .line 458
    .line 459
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 460
    .line 461
    .line 462
    move-result-object v0

    .line 463
    const-string v1, "type.googleapis.com/google.crypto.tink.AesGcmKey"

    .line 464
    .line 465
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 466
    .line 467
    .line 468
    move-result v0

    .line 469
    if-eqz v0, :cond_a

    .line 470
    .line 471
    :try_start_6
    invoke-virtual {p1}, Lx1/b0;->F()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 472
    .line 473
    .line 474
    move-result-object v0

    .line 475
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/o;->a()Lcom/google/crypto/tink/shaded/protobuf/o;

    .line 476
    .line 477
    .line 478
    move-result-object v1

    .line 479
    invoke-static {v0, v1}, Lx1/z;->D(Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/z;

    .line 480
    .line 481
    .line 482
    move-result-object v0
    :try_end_6
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_6 .. :try_end_6} :catch_5

    .line 483
    invoke-virtual {v0}, Lx1/z;->B()I

    .line 484
    .line 485
    .line 486
    move-result v1

    .line 487
    if-nez v1, :cond_9

    .line 488
    .line 489
    invoke-static {}, Lk1/r;->b()LV1/y;

    .line 490
    .line 491
    .line 492
    move-result-object v1

    .line 493
    invoke-virtual {v0}, Lx1/z;->A()I

    .line 494
    .line 495
    .line 496
    move-result v0

    .line 497
    invoke-virtual {v1, v0}, LV1/y;->z(I)V

    .line 498
    .line 499
    .line 500
    invoke-virtual {v1}, LV1/y;->x()V

    .line 501
    .line 502
    .line 503
    invoke-virtual {v1}, LV1/y;->B()V

    .line 504
    .line 505
    .line 506
    invoke-virtual {p1}, Lx1/b0;->D()Lx1/t0;

    .line 507
    .line 508
    .line 509
    move-result-object p1

    .line 510
    invoke-static {p1}, Ll1/e;->b(Lx1/t0;)Lk1/k;

    .line 511
    .line 512
    .line 513
    move-result-object p1

    .line 514
    iput-object p1, v1, LV1/y;->i:Ljava/lang/Object;

    .line 515
    .line 516
    invoke-virtual {v1}, LV1/y;->g()Lk1/r;

    .line 517
    .line 518
    .line 519
    move-result-object p1

    .line 520
    return-object p1

    .line 521
    :cond_9
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 522
    .line 523
    const-string v0, "Only version 0 parameters are accepted"

    .line 524
    .line 525
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 526
    .line 527
    .line 528
    throw p1

    .line 529
    :catch_5
    move-exception p1

    .line 530
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 531
    .line 532
    const-string v1, "Parsing AesGcmParameters failed: "

    .line 533
    .line 534
    invoke-direct {v0, v1, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 535
    .line 536
    .line 537
    throw v0

    .line 538
    :cond_a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 539
    .line 540
    new-instance v1, Ljava/lang/StringBuilder;

    .line 541
    .line 542
    const-string v2, "Wrong type URL in call to AesGcmProtoSerialization.parseParameters: "

    .line 543
    .line 544
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 545
    .line 546
    .line 547
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 548
    .line 549
    .line 550
    move-result-object p1

    .line 551
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 552
    .line 553
    .line 554
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 555
    .line 556
    .line 557
    move-result-object p1

    .line 558
    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 559
    .line 560
    .line 561
    throw v0

    .line 562
    :sswitch_5
    iget-object p1, p1, Ls1/H;->b:Lx1/b0;

    .line 563
    .line 564
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 565
    .line 566
    .line 567
    move-result-object v0

    .line 568
    const-string v1, "type.googleapis.com/google.crypto.tink.AesEaxKey"

    .line 569
    .line 570
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 571
    .line 572
    .line 573
    move-result v0

    .line 574
    if-eqz v0, :cond_b

    .line 575
    .line 576
    :try_start_7
    invoke-virtual {p1}, Lx1/b0;->F()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 577
    .line 578
    .line 579
    move-result-object v0

    .line 580
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/o;->a()Lcom/google/crypto/tink/shaded/protobuf/o;

    .line 581
    .line 582
    .line 583
    move-result-object v1

    .line 584
    invoke-static {v0, v1}, Lx1/t;->E(Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/t;

    .line 585
    .line 586
    .line 587
    move-result-object v0
    :try_end_7
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_7 .. :try_end_7} :catch_6

    .line 588
    invoke-static {}, Lk1/o;->b()LV1/y;

    .line 589
    .line 590
    .line 591
    move-result-object v1

    .line 592
    invoke-virtual {v0}, Lx1/t;->B()I

    .line 593
    .line 594
    .line 595
    move-result v2

    .line 596
    invoke-virtual {v1, v2}, LV1/y;->z(I)V

    .line 597
    .line 598
    .line 599
    invoke-virtual {v0}, Lx1/t;->C()Lx1/v;

    .line 600
    .line 601
    .line 602
    move-result-object v0

    .line 603
    invoke-virtual {v0}, Lx1/v;->B()I

    .line 604
    .line 605
    .line 606
    move-result v0

    .line 607
    invoke-virtual {v1, v0}, LV1/y;->y(I)V

    .line 608
    .line 609
    .line 610
    invoke-virtual {v1}, LV1/y;->B()V

    .line 611
    .line 612
    .line 613
    invoke-virtual {p1}, Lx1/b0;->D()Lx1/t0;

    .line 614
    .line 615
    .line 616
    move-result-object p1

    .line 617
    invoke-static {p1}, Ll1/c;->c(Lx1/t0;)Lk1/k;

    .line 618
    .line 619
    .line 620
    move-result-object p1

    .line 621
    iput-object p1, v1, LV1/y;->i:Ljava/lang/Object;

    .line 622
    .line 623
    invoke-virtual {v1}, LV1/y;->f()Lk1/o;

    .line 624
    .line 625
    .line 626
    move-result-object p1

    .line 627
    return-object p1

    .line 628
    :catch_6
    move-exception p1

    .line 629
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 630
    .line 631
    const-string v1, "Parsing AesEaxParameters failed: "

    .line 632
    .line 633
    invoke-direct {v0, v1, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 634
    .line 635
    .line 636
    throw v0

    .line 637
    :cond_b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 638
    .line 639
    new-instance v1, Ljava/lang/StringBuilder;

    .line 640
    .line 641
    const-string v2, "Wrong type URL in call to AesEaxProtoSerialization.parseParameters: "

    .line 642
    .line 643
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 644
    .line 645
    .line 646
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 647
    .line 648
    .line 649
    move-result-object p1

    .line 650
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 651
    .line 652
    .line 653
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 654
    .line 655
    .line 656
    move-result-object p1

    .line 657
    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 658
    .line 659
    .line 660
    throw v0

    .line 661
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_5
        0x4 -> :sswitch_4
        0x8 -> :sswitch_3
        0xc -> :sswitch_2
        0x10 -> :sswitch_1
        0x14 -> :sswitch_0
    .end sparse-switch
.end method

.method public c(Landroid/support/v4/media/session/a;)Ls1/G;
    .locals 5

    .line 1
    iget v0, p0, Ll1/b;->e:I

    .line 2
    .line 3
    sparse-switch v0, :sswitch_data_0

    .line 4
    .line 5
    .line 6
    check-cast p1, Lp1/a;

    .line 7
    .line 8
    invoke-static {}, Lx1/F;->C()Lx1/E;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p1, Lp1/a;->e:Lio/flutter/plugin/editing/j;

    .line 13
    .line 14
    iget-object v1, v1, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v1, Lz1/a;

    .line 17
    .line 18
    invoke-virtual {v1}, Lz1/a;->b()[B

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const/4 v2, 0x0

    .line 23
    array-length v3, v1

    .line 24
    invoke-static {v1, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/i;->d([BII)Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 29
    .line 30
    .line 31
    iget-object v2, v0, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 32
    .line 33
    check-cast v2, Lx1/F;

    .line 34
    .line 35
    invoke-static {v2, v1}, Lx1/F;->z(Lx1/F;Lcom/google/crypto/tink/shaded/protobuf/h;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lx1/F;

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/a;->f()Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v1, p1, Lp1/a;->d:Lp1/d;

    .line 49
    .line 50
    iget-object v1, v1, Lp1/d;->b:Lp1/c;

    .line 51
    .line 52
    invoke-static {v1}, Lq1/a;->a(Lp1/c;)Lx1/t0;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iget-object p1, p1, Lp1/a;->g:Ljava/lang/Integer;

    .line 57
    .line 58
    const-string v2, "type.googleapis.com/google.crypto.tink.AesSivKey"

    .line 59
    .line 60
    sget-object v3, Lx1/X;->g:Lx1/X;

    .line 61
    .line 62
    invoke-static {v2, v0, v3, v1, p1}, Ls1/G;->a(Ljava/lang/String;Lcom/google/crypto/tink/shaded/protobuf/i;Lx1/X;Lx1/t0;Ljava/lang/Integer;)Ls1/G;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    return-object p1

    .line 67
    :sswitch_0
    check-cast p1, Lk1/L;

    .line 68
    .line 69
    invoke-static {}, Lx1/C0;->C()Lx1/B0;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iget-object v1, p1, Lk1/L;->e:Lio/flutter/plugin/editing/j;

    .line 74
    .line 75
    iget-object v1, v1, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 76
    .line 77
    check-cast v1, Lz1/a;

    .line 78
    .line 79
    invoke-virtual {v1}, Lz1/a;->b()[B

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    const/4 v2, 0x0

    .line 84
    array-length v3, v1

    .line 85
    invoke-static {v1, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/i;->d([BII)Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 90
    .line 91
    .line 92
    iget-object v2, v0, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 93
    .line 94
    check-cast v2, Lx1/C0;

    .line 95
    .line 96
    invoke-static {v2, v1}, Lx1/C0;->z(Lx1/C0;Lcom/google/crypto/tink/shaded/protobuf/h;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    check-cast v0, Lx1/C0;

    .line 104
    .line 105
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/a;->f()Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iget-object v1, p1, Lk1/L;->d:Lk1/N;

    .line 110
    .line 111
    iget-object v1, v1, Lk1/N;->a:Lk1/k;

    .line 112
    .line 113
    invoke-static {v1}, Ll1/p;->a(Lk1/k;)Lx1/t0;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    iget-object p1, p1, Lk1/L;->g:Ljava/lang/Integer;

    .line 118
    .line 119
    const-string v2, "type.googleapis.com/google.crypto.tink.XChaCha20Poly1305Key"

    .line 120
    .line 121
    sget-object v3, Lx1/X;->g:Lx1/X;

    .line 122
    .line 123
    invoke-static {v2, v0, v3, v1, p1}, Ls1/G;->a(Ljava/lang/String;Lcom/google/crypto/tink/shaded/protobuf/i;Lx1/X;Lx1/t0;Ljava/lang/Integer;)Ls1/G;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    return-object p1

    .line 128
    :sswitch_1
    check-cast p1, Lk1/I;

    .line 129
    .line 130
    invoke-static {}, Lx1/w0;->E()Lx1/v0;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    iget-object v1, p1, Lk1/I;->e:Lio/flutter/plugin/editing/j;

    .line 135
    .line 136
    iget-object v1, v1, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 137
    .line 138
    check-cast v1, Lz1/a;

    .line 139
    .line 140
    invoke-virtual {v1}, Lz1/a;->b()[B

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    const/4 v2, 0x0

    .line 145
    array-length v3, v1

    .line 146
    invoke-static {v1, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/i;->d([BII)Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 151
    .line 152
    .line 153
    iget-object v2, v0, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 154
    .line 155
    check-cast v2, Lx1/w0;

    .line 156
    .line 157
    invoke-static {v2, v1}, Lx1/w0;->A(Lx1/w0;Lcom/google/crypto/tink/shaded/protobuf/h;)V

    .line 158
    .line 159
    .line 160
    invoke-static {}, Lx1/A0;->C()Lx1/z0;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    iget-object v2, p1, Lk1/I;->d:Lk1/K;

    .line 165
    .line 166
    iget v3, v2, Lk1/K;->b:I

    .line 167
    .line 168
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 169
    .line 170
    .line 171
    iget-object v4, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 172
    .line 173
    check-cast v4, Lx1/A0;

    .line 174
    .line 175
    invoke-static {v4, v3}, Lx1/A0;->z(Lx1/A0;I)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    check-cast v1, Lx1/A0;

    .line 183
    .line 184
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 185
    .line 186
    .line 187
    iget-object v3, v0, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 188
    .line 189
    check-cast v3, Lx1/w0;

    .line 190
    .line 191
    invoke-static {v3, v1}, Lx1/w0;->z(Lx1/w0;Lx1/A0;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    check-cast v0, Lx1/w0;

    .line 199
    .line 200
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/a;->f()Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    iget-object v1, v2, Lk1/K;->a:Lk1/k;

    .line 205
    .line 206
    invoke-static {v1}, Ll1/n;->a(Lk1/k;)Lx1/t0;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    iget-object p1, p1, Lk1/I;->g:Ljava/lang/Integer;

    .line 211
    .line 212
    const-string v2, "type.googleapis.com/google.crypto.tink.XAesGcmKey"

    .line 213
    .line 214
    sget-object v3, Lx1/X;->g:Lx1/X;

    .line 215
    .line 216
    invoke-static {v2, v0, v3, v1, p1}, Ls1/G;->a(Ljava/lang/String;Lcom/google/crypto/tink/shaded/protobuf/i;Lx1/X;Lx1/t0;Ljava/lang/Integer;)Ls1/G;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    return-object p1

    .line 221
    :sswitch_2
    check-cast p1, Lk1/v;

    .line 222
    .line 223
    invoke-static {}, Lx1/J;->C()Lx1/I;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    iget-object v1, p1, Lk1/v;->e:Lio/flutter/plugin/editing/j;

    .line 228
    .line 229
    iget-object v1, v1, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 230
    .line 231
    check-cast v1, Lz1/a;

    .line 232
    .line 233
    invoke-virtual {v1}, Lz1/a;->b()[B

    .line 234
    .line 235
    .line 236
    move-result-object v1

    .line 237
    const/4 v2, 0x0

    .line 238
    array-length v3, v1

    .line 239
    invoke-static {v1, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/i;->d([BII)Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 244
    .line 245
    .line 246
    iget-object v2, v0, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 247
    .line 248
    check-cast v2, Lx1/J;

    .line 249
    .line 250
    invoke-static {v2, v1}, Lx1/J;->z(Lx1/J;Lcom/google/crypto/tink/shaded/protobuf/h;)V

    .line 251
    .line 252
    .line 253
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    check-cast v0, Lx1/J;

    .line 258
    .line 259
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/a;->f()Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    iget-object v1, p1, Lk1/v;->d:Lk1/x;

    .line 264
    .line 265
    iget-object v1, v1, Lk1/x;->a:Lk1/k;

    .line 266
    .line 267
    invoke-static {v1}, Ll1/i;->a(Lk1/k;)Lx1/t0;

    .line 268
    .line 269
    .line 270
    move-result-object v1

    .line 271
    iget-object p1, p1, Lk1/v;->g:Ljava/lang/Integer;

    .line 272
    .line 273
    const-string v2, "type.googleapis.com/google.crypto.tink.ChaCha20Poly1305Key"

    .line 274
    .line 275
    sget-object v3, Lx1/X;->g:Lx1/X;

    .line 276
    .line 277
    invoke-static {v2, v0, v3, v1, p1}, Ls1/G;->a(Ljava/lang/String;Lcom/google/crypto/tink/shaded/protobuf/i;Lx1/X;Lx1/t0;Ljava/lang/Integer;)Ls1/G;

    .line 278
    .line 279
    .line 280
    move-result-object p1

    .line 281
    return-object p1

    .line 282
    :sswitch_3
    check-cast p1, Lk1/s;

    .line 283
    .line 284
    invoke-static {}, Lx1/B;->C()Lx1/A;

    .line 285
    .line 286
    .line 287
    move-result-object v0

    .line 288
    iget-object v1, p1, Lk1/s;->e:Lio/flutter/plugin/editing/j;

    .line 289
    .line 290
    iget-object v1, v1, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 291
    .line 292
    check-cast v1, Lz1/a;

    .line 293
    .line 294
    invoke-virtual {v1}, Lz1/a;->b()[B

    .line 295
    .line 296
    .line 297
    move-result-object v1

    .line 298
    const/4 v2, 0x0

    .line 299
    array-length v3, v1

    .line 300
    invoke-static {v1, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/i;->d([BII)Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 301
    .line 302
    .line 303
    move-result-object v1

    .line 304
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 305
    .line 306
    .line 307
    iget-object v2, v0, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 308
    .line 309
    check-cast v2, Lx1/B;

    .line 310
    .line 311
    invoke-static {v2, v1}, Lx1/B;->z(Lx1/B;Lcom/google/crypto/tink/shaded/protobuf/h;)V

    .line 312
    .line 313
    .line 314
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 315
    .line 316
    .line 317
    move-result-object v0

    .line 318
    check-cast v0, Lx1/B;

    .line 319
    .line 320
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/a;->f()Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 321
    .line 322
    .line 323
    move-result-object v0

    .line 324
    iget-object v1, p1, Lk1/s;->d:Lk1/u;

    .line 325
    .line 326
    iget-object v1, v1, Lk1/u;->b:Lk1/k;

    .line 327
    .line 328
    invoke-static {v1}, Ll1/g;->a(Lk1/k;)Lx1/t0;

    .line 329
    .line 330
    .line 331
    move-result-object v1

    .line 332
    iget-object p1, p1, Lk1/s;->g:Ljava/lang/Integer;

    .line 333
    .line 334
    const-string v2, "type.googleapis.com/google.crypto.tink.AesGcmSivKey"

    .line 335
    .line 336
    sget-object v3, Lx1/X;->g:Lx1/X;

    .line 337
    .line 338
    invoke-static {v2, v0, v3, v1, p1}, Ls1/G;->a(Ljava/lang/String;Lcom/google/crypto/tink/shaded/protobuf/i;Lx1/X;Lx1/t0;Ljava/lang/Integer;)Ls1/G;

    .line 339
    .line 340
    .line 341
    move-result-object p1

    .line 342
    return-object p1

    .line 343
    :sswitch_4
    check-cast p1, Lk1/p;

    .line 344
    .line 345
    iget-object v0, p1, Lk1/p;->d:Lk1/r;

    .line 346
    .line 347
    invoke-static {v0}, Ll1/e;->c(Lk1/r;)V

    .line 348
    .line 349
    .line 350
    invoke-static {}, Lx1/x;->C()Lx1/w;

    .line 351
    .line 352
    .line 353
    move-result-object v0

    .line 354
    iget-object v1, p1, Lk1/p;->e:Lio/flutter/plugin/editing/j;

    .line 355
    .line 356
    iget-object v1, v1, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 357
    .line 358
    check-cast v1, Lz1/a;

    .line 359
    .line 360
    invoke-virtual {v1}, Lz1/a;->b()[B

    .line 361
    .line 362
    .line 363
    move-result-object v1

    .line 364
    const/4 v2, 0x0

    .line 365
    array-length v3, v1

    .line 366
    invoke-static {v1, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/i;->d([BII)Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 367
    .line 368
    .line 369
    move-result-object v1

    .line 370
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 371
    .line 372
    .line 373
    iget-object v2, v0, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 374
    .line 375
    check-cast v2, Lx1/x;

    .line 376
    .line 377
    invoke-static {v2, v1}, Lx1/x;->z(Lx1/x;Lcom/google/crypto/tink/shaded/protobuf/h;)V

    .line 378
    .line 379
    .line 380
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 381
    .line 382
    .line 383
    move-result-object v0

    .line 384
    check-cast v0, Lx1/x;

    .line 385
    .line 386
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/a;->f()Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 387
    .line 388
    .line 389
    move-result-object v0

    .line 390
    iget-object v1, p1, Lk1/p;->d:Lk1/r;

    .line 391
    .line 392
    iget-object v1, v1, Lk1/r;->d:Lk1/k;

    .line 393
    .line 394
    invoke-static {v1}, Ll1/e;->a(Lk1/k;)Lx1/t0;

    .line 395
    .line 396
    .line 397
    move-result-object v1

    .line 398
    iget-object p1, p1, Lk1/p;->g:Ljava/lang/Integer;

    .line 399
    .line 400
    const-string v2, "type.googleapis.com/google.crypto.tink.AesGcmKey"

    .line 401
    .line 402
    sget-object v3, Lx1/X;->g:Lx1/X;

    .line 403
    .line 404
    invoke-static {v2, v0, v3, v1, p1}, Ls1/G;->a(Ljava/lang/String;Lcom/google/crypto/tink/shaded/protobuf/i;Lx1/X;Lx1/t0;Ljava/lang/Integer;)Ls1/G;

    .line 405
    .line 406
    .line 407
    move-result-object p1

    .line 408
    return-object p1

    .line 409
    :sswitch_5
    check-cast p1, Lk1/m;

    .line 410
    .line 411
    invoke-static {}, Lx1/r;->E()Lx1/q;

    .line 412
    .line 413
    .line 414
    move-result-object v0

    .line 415
    iget-object v1, p1, Lk1/m;->d:Lk1/o;

    .line 416
    .line 417
    invoke-static {v1}, Ll1/c;->a(Lk1/o;)Lx1/v;

    .line 418
    .line 419
    .line 420
    move-result-object v1

    .line 421
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 422
    .line 423
    .line 424
    iget-object v2, v0, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 425
    .line 426
    check-cast v2, Lx1/r;

    .line 427
    .line 428
    invoke-static {v2, v1}, Lx1/r;->z(Lx1/r;Lx1/v;)V

    .line 429
    .line 430
    .line 431
    iget-object v1, p1, Lk1/m;->e:Lio/flutter/plugin/editing/j;

    .line 432
    .line 433
    iget-object v1, v1, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 434
    .line 435
    check-cast v1, Lz1/a;

    .line 436
    .line 437
    invoke-virtual {v1}, Lz1/a;->b()[B

    .line 438
    .line 439
    .line 440
    move-result-object v1

    .line 441
    const/4 v2, 0x0

    .line 442
    array-length v3, v1

    .line 443
    invoke-static {v1, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/i;->d([BII)Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 444
    .line 445
    .line 446
    move-result-object v1

    .line 447
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 448
    .line 449
    .line 450
    iget-object v2, v0, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 451
    .line 452
    check-cast v2, Lx1/r;

    .line 453
    .line 454
    invoke-static {v2, v1}, Lx1/r;->A(Lx1/r;Lcom/google/crypto/tink/shaded/protobuf/h;)V

    .line 455
    .line 456
    .line 457
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 458
    .line 459
    .line 460
    move-result-object v0

    .line 461
    check-cast v0, Lx1/r;

    .line 462
    .line 463
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/a;->f()Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 464
    .line 465
    .line 466
    move-result-object v0

    .line 467
    iget-object v1, p1, Lk1/m;->d:Lk1/o;

    .line 468
    .line 469
    iget-object v1, v1, Lk1/o;->d:Lk1/k;

    .line 470
    .line 471
    invoke-static {v1}, Ll1/c;->b(Lk1/k;)Lx1/t0;

    .line 472
    .line 473
    .line 474
    move-result-object v1

    .line 475
    iget-object p1, p1, Lk1/m;->g:Ljava/lang/Integer;

    .line 476
    .line 477
    const-string v2, "type.googleapis.com/google.crypto.tink.AesEaxKey"

    .line 478
    .line 479
    sget-object v3, Lx1/X;->g:Lx1/X;

    .line 480
    .line 481
    invoke-static {v2, v0, v3, v1, p1}, Ls1/G;->a(Ljava/lang/String;Lcom/google/crypto/tink/shaded/protobuf/i;Lx1/X;Lx1/t0;Ljava/lang/Integer;)Ls1/G;

    .line 482
    .line 483
    .line 484
    move-result-object p1

    .line 485
    return-object p1

    .line 486
    nop

    .line 487
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_5
        0x5 -> :sswitch_4
        0x9 -> :sswitch_3
        0xd -> :sswitch_2
        0x11 -> :sswitch_1
        0x15 -> :sswitch_0
    .end sparse-switch
.end method

.method public d(Lj1/i;)Ls1/H;
    .locals 5

    .line 1
    iget v0, p0, Ll1/b;->e:I

    .line 2
    .line 3
    sparse-switch v0, :sswitch_data_0

    .line 4
    .line 5
    .line 6
    check-cast p1, Lp1/d;

    .line 7
    .line 8
    invoke-static {}, Lx1/b0;->G()Lx1/a0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "type.googleapis.com/google.crypto.tink.AesSivKey"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lx1/a0;->i(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lx1/H;->C()Lx1/G;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget v2, p1, Lp1/d;->a:I

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 24
    .line 25
    .line 26
    iget-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 27
    .line 28
    check-cast v3, Lx1/H;

    .line 29
    .line 30
    invoke-static {v3, v2}, Lx1/H;->z(Lx1/H;I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Lx1/H;

    .line 38
    .line 39
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/a;->f()Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Lx1/a0;->j(Lcom/google/crypto/tink/shaded/protobuf/i;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p1, Lp1/d;->b:Lp1/c;

    .line 47
    .line 48
    invoke-static {p1}, Lq1/a;->a(Lp1/c;)Lx1/t0;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {v0, p1}, Lx1/a0;->h(Lx1/t0;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    check-cast p1, Lx1/b0;

    .line 60
    .line 61
    invoke-static {p1}, Ls1/H;->a(Lx1/b0;)Ls1/H;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    return-object p1

    .line 66
    :sswitch_0
    check-cast p1, Lk1/N;

    .line 67
    .line 68
    invoke-static {}, Lx1/b0;->G()Lx1/a0;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const-string v1, "type.googleapis.com/google.crypto.tink.XChaCha20Poly1305Key"

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Lx1/a0;->i(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-static {}, Lx1/D0;->z()Lx1/D0;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/a;->f()Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v0, v1}, Lx1/a0;->j(Lcom/google/crypto/tink/shaded/protobuf/i;)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p1, Lk1/N;->a:Lk1/k;

    .line 89
    .line 90
    invoke-static {p1}, Ll1/p;->a(Lk1/k;)Lx1/t0;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {v0, p1}, Lx1/a0;->h(Lx1/t0;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    check-cast p1, Lx1/b0;

    .line 102
    .line 103
    invoke-static {p1}, Ls1/H;->a(Lx1/b0;)Ls1/H;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    return-object p1

    .line 108
    :sswitch_1
    check-cast p1, Lk1/K;

    .line 109
    .line 110
    invoke-static {}, Lx1/b0;->G()Lx1/a0;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    const-string v1, "type.googleapis.com/google.crypto.tink.XAesGcmKey"

    .line 115
    .line 116
    invoke-virtual {v0, v1}, Lx1/a0;->i(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-static {}, Lx1/y0;->C()Lx1/x0;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-static {}, Lx1/A0;->C()Lx1/z0;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    iget v3, p1, Lk1/K;->b:I

    .line 128
    .line 129
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 130
    .line 131
    .line 132
    iget-object v4, v2, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 133
    .line 134
    check-cast v4, Lx1/A0;

    .line 135
    .line 136
    invoke-static {v4, v3}, Lx1/A0;->z(Lx1/A0;I)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    check-cast v2, Lx1/A0;

    .line 144
    .line 145
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 146
    .line 147
    .line 148
    iget-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 149
    .line 150
    check-cast v3, Lx1/y0;

    .line 151
    .line 152
    invoke-static {v3, v2}, Lx1/y0;->z(Lx1/y0;Lx1/A0;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    check-cast v1, Lx1/y0;

    .line 160
    .line 161
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/a;->f()Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-virtual {v0, v1}, Lx1/a0;->j(Lcom/google/crypto/tink/shaded/protobuf/i;)V

    .line 166
    .line 167
    .line 168
    iget-object p1, p1, Lk1/K;->a:Lk1/k;

    .line 169
    .line 170
    invoke-static {p1}, Ll1/n;->a(Lk1/k;)Lx1/t0;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    invoke-virtual {v0, p1}, Lx1/a0;->h(Lx1/t0;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    check-cast p1, Lx1/b0;

    .line 182
    .line 183
    invoke-static {p1}, Ls1/H;->a(Lx1/b0;)Ls1/H;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    return-object p1

    .line 188
    :sswitch_2
    check-cast p1, Lk1/x;

    .line 189
    .line 190
    invoke-static {}, Lx1/b0;->G()Lx1/a0;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    const-string v1, "type.googleapis.com/google.crypto.tink.ChaCha20Poly1305Key"

    .line 195
    .line 196
    invoke-virtual {v0, v1}, Lx1/a0;->i(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    invoke-static {}, Lx1/L;->z()Lx1/L;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/a;->f()Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 204
    .line 205
    .line 206
    move-result-object v1

    .line 207
    invoke-virtual {v0, v1}, Lx1/a0;->j(Lcom/google/crypto/tink/shaded/protobuf/i;)V

    .line 208
    .line 209
    .line 210
    iget-object p1, p1, Lk1/x;->a:Lk1/k;

    .line 211
    .line 212
    invoke-static {p1}, Ll1/i;->a(Lk1/k;)Lx1/t0;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    invoke-virtual {v0, p1}, Lx1/a0;->h(Lx1/t0;)V

    .line 217
    .line 218
    .line 219
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 220
    .line 221
    .line 222
    move-result-object p1

    .line 223
    check-cast p1, Lx1/b0;

    .line 224
    .line 225
    invoke-static {p1}, Ls1/H;->a(Lx1/b0;)Ls1/H;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    return-object p1

    .line 230
    :sswitch_3
    check-cast p1, Lk1/u;

    .line 231
    .line 232
    invoke-static {}, Lx1/b0;->G()Lx1/a0;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    const-string v1, "type.googleapis.com/google.crypto.tink.AesGcmSivKey"

    .line 237
    .line 238
    invoke-virtual {v0, v1}, Lx1/a0;->i(Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    invoke-static {}, Lx1/D;->C()Lx1/C;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    iget v2, p1, Lk1/u;->a:I

    .line 246
    .line 247
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 248
    .line 249
    .line 250
    iget-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 251
    .line 252
    check-cast v3, Lx1/D;

    .line 253
    .line 254
    invoke-static {v3, v2}, Lx1/D;->z(Lx1/D;I)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 258
    .line 259
    .line 260
    move-result-object v1

    .line 261
    check-cast v1, Lx1/D;

    .line 262
    .line 263
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/a;->f()Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 264
    .line 265
    .line 266
    move-result-object v1

    .line 267
    invoke-virtual {v0, v1}, Lx1/a0;->j(Lcom/google/crypto/tink/shaded/protobuf/i;)V

    .line 268
    .line 269
    .line 270
    iget-object p1, p1, Lk1/u;->b:Lk1/k;

    .line 271
    .line 272
    invoke-static {p1}, Ll1/g;->a(Lk1/k;)Lx1/t0;

    .line 273
    .line 274
    .line 275
    move-result-object p1

    .line 276
    invoke-virtual {v0, p1}, Lx1/a0;->h(Lx1/t0;)V

    .line 277
    .line 278
    .line 279
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 280
    .line 281
    .line 282
    move-result-object p1

    .line 283
    check-cast p1, Lx1/b0;

    .line 284
    .line 285
    invoke-static {p1}, Ls1/H;->a(Lx1/b0;)Ls1/H;

    .line 286
    .line 287
    .line 288
    move-result-object p1

    .line 289
    return-object p1

    .line 290
    :sswitch_4
    check-cast p1, Lk1/r;

    .line 291
    .line 292
    invoke-static {p1}, Ll1/e;->c(Lk1/r;)V

    .line 293
    .line 294
    .line 295
    invoke-static {}, Lx1/b0;->G()Lx1/a0;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    const-string v1, "type.googleapis.com/google.crypto.tink.AesGcmKey"

    .line 300
    .line 301
    invoke-virtual {v0, v1}, Lx1/a0;->i(Ljava/lang/String;)V

    .line 302
    .line 303
    .line 304
    invoke-static {}, Lx1/z;->C()Lx1/y;

    .line 305
    .line 306
    .line 307
    move-result-object v1

    .line 308
    iget v2, p1, Lk1/r;->a:I

    .line 309
    .line 310
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 311
    .line 312
    .line 313
    iget-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 314
    .line 315
    check-cast v3, Lx1/z;

    .line 316
    .line 317
    invoke-static {v3, v2}, Lx1/z;->z(Lx1/z;I)V

    .line 318
    .line 319
    .line 320
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 321
    .line 322
    .line 323
    move-result-object v1

    .line 324
    check-cast v1, Lx1/z;

    .line 325
    .line 326
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/a;->f()Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 327
    .line 328
    .line 329
    move-result-object v1

    .line 330
    invoke-virtual {v0, v1}, Lx1/a0;->j(Lcom/google/crypto/tink/shaded/protobuf/i;)V

    .line 331
    .line 332
    .line 333
    iget-object p1, p1, Lk1/r;->d:Lk1/k;

    .line 334
    .line 335
    invoke-static {p1}, Ll1/e;->a(Lk1/k;)Lx1/t0;

    .line 336
    .line 337
    .line 338
    move-result-object p1

    .line 339
    invoke-virtual {v0, p1}, Lx1/a0;->h(Lx1/t0;)V

    .line 340
    .line 341
    .line 342
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 343
    .line 344
    .line 345
    move-result-object p1

    .line 346
    check-cast p1, Lx1/b0;

    .line 347
    .line 348
    invoke-static {p1}, Ls1/H;->a(Lx1/b0;)Ls1/H;

    .line 349
    .line 350
    .line 351
    move-result-object p1

    .line 352
    return-object p1

    .line 353
    :sswitch_data_0
    .sparse-switch
        0x3 -> :sswitch_4
        0x7 -> :sswitch_3
        0xb -> :sswitch_2
        0xf -> :sswitch_1
        0x13 -> :sswitch_0
    .end sparse-switch
.end method

.method public e(Landroid/support/v4/media/session/a;)Ljava/lang/Object;
    .locals 4

    .line 1
    iget v0, p0, Ll1/b;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    check-cast p1, Ls1/i;

    .line 7
    .line 8
    iget-object p1, p1, Ls1/i;->d:Ls1/G;

    .line 9
    .line 10
    invoke-static {p1}, Ls1/i;->d0(Ls1/G;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p1, Ls1/G;->f:Ljava/lang/Integer;

    .line 14
    .line 15
    sget-object v1, Ls1/b;->d:Ls1/b;

    .line 16
    .line 17
    iget-object v2, p1, Ls1/G;->a:Ljava/lang/String;

    .line 18
    .line 19
    const-class v3, Lj1/b;

    .line 20
    .line 21
    invoke-virtual {v1, v3, v2}, Ls1/b;->a(Ljava/lang/Class;Ljava/lang/String;)Ls1/g;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v2, p1, Ls1/G;->c:Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ls1/g;->a(Lcom/google/crypto/tink/shaded/protobuf/i;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Lj1/b;

    .line 32
    .line 33
    iget-object p1, p1, Ls1/G;->e:Lx1/t0;

    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    const/4 v3, 0x1

    .line 40
    if-eq v2, v3, :cond_3

    .line 41
    .line 42
    const/4 v3, 0x2

    .line 43
    if-eq v2, v3, :cond_2

    .line 44
    .line 45
    const/4 v3, 0x3

    .line 46
    if-eq v2, v3, :cond_1

    .line 47
    .line 48
    const/4 v3, 0x4

    .line 49
    if-ne v2, v3, :cond_0

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 53
    .line 54
    new-instance v1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v2, "unknown output prefix type "

    .line 57
    .line 58
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1}, Lx1/t0;->b()I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-direct {v0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    throw v0

    .line 76
    :cond_1
    sget-object v0, Ls1/t;->a:Lz1/a;

    .line 77
    .line 78
    invoke-virtual {v0}, Lz1/a;->b()[B

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    goto :goto_1

    .line 83
    :cond_2
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    invoke-static {v0}, Ls1/t;->a(I)Lz1/a;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Lz1/a;->b()[B

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    goto :goto_1

    .line 96
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    invoke-static {v0}, Ls1/t;->b(I)Lz1/a;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0}, Lz1/a;->b()[B

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    :goto_1
    new-instance v2, Lq1/b;

    .line 109
    .line 110
    invoke-direct {v2, v1, p1, v0}, Lq1/b;-><init>(Lj1/b;Lx1/t0;[B)V

    .line 111
    .line 112
    .line 113
    return-object v2

    .line 114
    :pswitch_0
    check-cast p1, Lp1/a;

    .line 115
    .line 116
    iget-object v0, p1, Lp1/a;->d:Lp1/d;

    .line 117
    .line 118
    invoke-static {v0}, Lp1/b;->a(Lp1/d;)V

    .line 119
    .line 120
    .line 121
    new-instance v0, Ly1/c;

    .line 122
    .line 123
    iget-object v1, p1, Lp1/a;->e:Lio/flutter/plugin/editing/j;

    .line 124
    .line 125
    iget-object v1, v1, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 126
    .line 127
    check-cast v1, Lz1/a;

    .line 128
    .line 129
    invoke-virtual {v1}, Lz1/a;->b()[B

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    array-length v2, v1

    .line 134
    const/16 v3, 0x40

    .line 135
    .line 136
    if-ne v2, v3, :cond_4

    .line 137
    .line 138
    iget-object p1, p1, Lp1/a;->f:Lz1/a;

    .line 139
    .line 140
    invoke-direct {v0, v1, p1}, Ly1/c;-><init>([BLz1/a;)V

    .line 141
    .line 142
    .line 143
    return-object v0

    .line 144
    :cond_4
    new-instance p1, Ljava/security/InvalidKeyException;

    .line 145
    .line 146
    new-instance v0, Ljava/lang/StringBuilder;

    .line 147
    .line 148
    const-string v2, "invalid key size: "

    .line 149
    .line 150
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    array-length v1, v1

    .line 154
    const-string v2, " bytes; key must have 64 bytes"

    .line 155
    .line 156
    invoke-static {v0, v1, v2}, LE1/j;->l(Ljava/lang/StringBuilder;ILjava/lang/String;)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-direct {p1, v0}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    throw p1

    .line 164
    nop

    .line 165
    :pswitch_data_0
    .packed-switch 0x18
        :pswitch_0
    .end packed-switch
.end method

.method public f(Ls1/G;)Landroid/support/v4/media/session/a;
    .locals 5

    .line 1
    iget v0, p0, Ll1/b;->e:I

    .line 2
    .line 3
    sparse-switch v0, :sswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Ls1/G;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, "type.googleapis.com/google.crypto.tink.AesSivKey"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    :try_start_0
    iget-object v0, p1, Ls1/G;->c:Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 17
    .line 18
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/o;->a()Lcom/google/crypto/tink/shaded/protobuf/o;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v0, v1}, Lx1/F;->D(Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/F;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lx1/F;->B()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_0

    .line 31
    .line 32
    invoke-static {}, Lp1/d;->b()LZ2/s;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0}, Lx1/F;->A()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/i;->size()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-virtual {v1, v2}, LZ2/s;->C(I)V

    .line 45
    .line 46
    .line 47
    iget-object v2, p1, Ls1/G;->e:Lx1/t0;

    .line 48
    .line 49
    invoke-static {v2}, Lq1/a;->b(Lx1/t0;)Lp1/c;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    iput-object v2, v1, LZ2/s;->g:Ljava/lang/Object;

    .line 54
    .line 55
    invoke-virtual {v1}, LZ2/s;->v()Lp1/d;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    new-instance v2, Lm/x0;

    .line 60
    .line 61
    const/4 v3, 0x1

    .line 62
    const/4 v4, 0x0

    .line 63
    invoke-direct {v2, v4, v3}, Lm/x0;-><init>(CI)V

    .line 64
    .line 65
    .line 66
    const/4 v3, 0x0

    .line 67
    iput-object v3, v2, Lm/x0;->g:Ljava/lang/Object;

    .line 68
    .line 69
    iput-object v3, v2, Lm/x0;->h:Ljava/lang/Object;

    .line 70
    .line 71
    iput-object v1, v2, Lm/x0;->f:Ljava/lang/Object;

    .line 72
    .line 73
    invoke-virtual {v0}, Lx1/F;->A()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/i;->f()[B

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-instance v1, Lio/flutter/plugin/editing/j;

    .line 82
    .line 83
    invoke-static {v0}, Lz1/a;->a([B)Lz1/a;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    const/16 v3, 0x17

    .line 88
    .line 89
    invoke-direct {v1, v3, v0}, Lio/flutter/plugin/editing/j;-><init>(ILjava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    iput-object v1, v2, Lm/x0;->g:Ljava/lang/Object;

    .line 93
    .line 94
    iget-object p1, p1, Ls1/G;->f:Ljava/lang/Integer;

    .line 95
    .line 96
    iput-object p1, v2, Lm/x0;->h:Ljava/lang/Object;

    .line 97
    .line 98
    invoke-virtual {v2}, Lm/x0;->u()Lp1/a;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    return-object p1

    .line 103
    :cond_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 104
    .line 105
    const-string v0, "Only version 0 keys are accepted"

    .line 106
    .line 107
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    throw p1
    :try_end_0
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_0 .. :try_end_0} :catch_0

    .line 111
    :catch_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 112
    .line 113
    const-string v0, "Parsing AesSivKey failed"

    .line 114
    .line 115
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    throw p1

    .line 119
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 120
    .line 121
    const-string v0, "Wrong type URL in call to AesSivParameters.parseParameters"

    .line 122
    .line 123
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    throw p1

    .line 127
    :sswitch_0
    iget-object v0, p1, Ls1/G;->a:Ljava/lang/String;

    .line 128
    .line 129
    const-string v1, "type.googleapis.com/google.crypto.tink.XChaCha20Poly1305Key"

    .line 130
    .line 131
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-eqz v0, :cond_3

    .line 136
    .line 137
    :try_start_1
    iget-object v0, p1, Ls1/G;->c:Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 138
    .line 139
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/o;->a()Lcom/google/crypto/tink/shaded/protobuf/o;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-static {v0, v1}, Lx1/C0;->D(Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/C0;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {v0}, Lx1/C0;->B()I

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    if-nez v1, :cond_2

    .line 152
    .line 153
    iget-object v1, p1, Ls1/G;->e:Lx1/t0;

    .line 154
    .line 155
    invoke-static {v1}, Ll1/p;->b(Lx1/t0;)Lk1/k;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-virtual {v0}, Lx1/C0;->A()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/i;->f()[B

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    new-instance v2, Lio/flutter/plugin/editing/j;

    .line 168
    .line 169
    invoke-static {v0}, Lz1/a;->a([B)Lz1/a;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    const/16 v3, 0x17

    .line 174
    .line 175
    invoke-direct {v2, v3, v0}, Lio/flutter/plugin/editing/j;-><init>(ILjava/lang/Object;)V

    .line 176
    .line 177
    .line 178
    iget-object p1, p1, Ls1/G;->f:Ljava/lang/Integer;

    .line 179
    .line 180
    invoke-static {v1, v2, p1}, Lk1/L;->d0(Lk1/k;Lio/flutter/plugin/editing/j;Ljava/lang/Integer;)Lk1/L;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    return-object p1

    .line 185
    :cond_2
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 186
    .line 187
    const-string v0, "Only version 0 keys are accepted"

    .line 188
    .line 189
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    throw p1
    :try_end_1
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_1 .. :try_end_1} :catch_1

    .line 193
    :catch_1
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 194
    .line 195
    const-string v0, "Parsing XChaCha20Poly1305Key failed"

    .line 196
    .line 197
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    throw p1

    .line 201
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 202
    .line 203
    const-string v0, "Wrong type URL in call to XChaCha20Poly1305ProtoSerialization.parseKey"

    .line 204
    .line 205
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    throw p1

    .line 209
    :sswitch_1
    iget-object v0, p1, Ls1/G;->a:Ljava/lang/String;

    .line 210
    .line 211
    const-string v1, "type.googleapis.com/google.crypto.tink.XAesGcmKey"

    .line 212
    .line 213
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    if-eqz v0, :cond_6

    .line 218
    .line 219
    :try_start_2
    iget-object v0, p1, Ls1/G;->c:Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 220
    .line 221
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/o;->a()Lcom/google/crypto/tink/shaded/protobuf/o;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    invoke-static {v0, v1}, Lx1/w0;->F(Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/w0;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    invoke-virtual {v0}, Lx1/w0;->D()I

    .line 230
    .line 231
    .line 232
    move-result v1

    .line 233
    if-nez v1, :cond_5

    .line 234
    .line 235
    invoke-virtual {v0}, Lx1/w0;->B()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/i;->size()I

    .line 240
    .line 241
    .line 242
    move-result v1

    .line 243
    const/16 v2, 0x20

    .line 244
    .line 245
    if-ne v1, v2, :cond_4

    .line 246
    .line 247
    iget-object v1, p1, Ls1/G;->e:Lx1/t0;

    .line 248
    .line 249
    invoke-static {v1}, Ll1/n;->b(Lx1/t0;)Lk1/k;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    invoke-virtual {v0}, Lx1/w0;->C()Lx1/A0;

    .line 254
    .line 255
    .line 256
    move-result-object v2

    .line 257
    invoke-virtual {v2}, Lx1/A0;->B()I

    .line 258
    .line 259
    .line 260
    move-result v2

    .line 261
    invoke-static {v2, v1}, Lk1/K;->b(ILk1/k;)Lk1/K;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    invoke-virtual {v0}, Lx1/w0;->B()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/i;->f()[B

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    new-instance v2, Lio/flutter/plugin/editing/j;

    .line 274
    .line 275
    invoke-static {v0}, Lz1/a;->a([B)Lz1/a;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    const/16 v3, 0x17

    .line 280
    .line 281
    invoke-direct {v2, v3, v0}, Lio/flutter/plugin/editing/j;-><init>(ILjava/lang/Object;)V

    .line 282
    .line 283
    .line 284
    iget-object p1, p1, Ls1/G;->f:Ljava/lang/Integer;

    .line 285
    .line 286
    invoke-static {v1, v2, p1}, Lk1/I;->d0(Lk1/K;Lio/flutter/plugin/editing/j;Ljava/lang/Integer;)Lk1/I;

    .line 287
    .line 288
    .line 289
    move-result-object p1

    .line 290
    return-object p1

    .line 291
    :cond_4
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 292
    .line 293
    const-string v0, "Only 32 byte key size is accepted"

    .line 294
    .line 295
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 296
    .line 297
    .line 298
    throw p1

    .line 299
    :cond_5
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 300
    .line 301
    const-string v0, "Only version 0 keys are accepted"

    .line 302
    .line 303
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 304
    .line 305
    .line 306
    throw p1
    :try_end_2
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_2 .. :try_end_2} :catch_2

    .line 307
    :catch_2
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 308
    .line 309
    const-string v0, "Parsing XAesGcmKey failed"

    .line 310
    .line 311
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 312
    .line 313
    .line 314
    throw p1

    .line 315
    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 316
    .line 317
    const-string v0, "Wrong type URL in call to XAesGcmProtoSerialization.parseKey"

    .line 318
    .line 319
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 320
    .line 321
    .line 322
    throw p1

    .line 323
    :sswitch_2
    iget-object v0, p1, Ls1/G;->a:Ljava/lang/String;

    .line 324
    .line 325
    const-string v1, "type.googleapis.com/google.crypto.tink.ChaCha20Poly1305Key"

    .line 326
    .line 327
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 328
    .line 329
    .line 330
    move-result v0

    .line 331
    if-eqz v0, :cond_8

    .line 332
    .line 333
    :try_start_3
    iget-object v0, p1, Ls1/G;->c:Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 334
    .line 335
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/o;->a()Lcom/google/crypto/tink/shaded/protobuf/o;

    .line 336
    .line 337
    .line 338
    move-result-object v1

    .line 339
    invoke-static {v0, v1}, Lx1/J;->D(Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/J;

    .line 340
    .line 341
    .line 342
    move-result-object v0

    .line 343
    invoke-virtual {v0}, Lx1/J;->B()I

    .line 344
    .line 345
    .line 346
    move-result v1

    .line 347
    if-nez v1, :cond_7

    .line 348
    .line 349
    iget-object v1, p1, Ls1/G;->e:Lx1/t0;

    .line 350
    .line 351
    invoke-static {v1}, Ll1/i;->b(Lx1/t0;)Lk1/k;

    .line 352
    .line 353
    .line 354
    move-result-object v1

    .line 355
    invoke-virtual {v0}, Lx1/J;->A()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 356
    .line 357
    .line 358
    move-result-object v0

    .line 359
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/i;->f()[B

    .line 360
    .line 361
    .line 362
    move-result-object v0

    .line 363
    new-instance v2, Lio/flutter/plugin/editing/j;

    .line 364
    .line 365
    invoke-static {v0}, Lz1/a;->a([B)Lz1/a;

    .line 366
    .line 367
    .line 368
    move-result-object v0

    .line 369
    const/16 v3, 0x17

    .line 370
    .line 371
    invoke-direct {v2, v3, v0}, Lio/flutter/plugin/editing/j;-><init>(ILjava/lang/Object;)V

    .line 372
    .line 373
    .line 374
    iget-object p1, p1, Ls1/G;->f:Ljava/lang/Integer;

    .line 375
    .line 376
    invoke-static {v1, v2, p1}, Lk1/v;->d0(Lk1/k;Lio/flutter/plugin/editing/j;Ljava/lang/Integer;)Lk1/v;

    .line 377
    .line 378
    .line 379
    move-result-object p1

    .line 380
    return-object p1

    .line 381
    :cond_7
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 382
    .line 383
    const-string v0, "Only version 0 keys are accepted"

    .line 384
    .line 385
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 386
    .line 387
    .line 388
    throw p1
    :try_end_3
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_3 .. :try_end_3} :catch_3

    .line 389
    :catch_3
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 390
    .line 391
    const-string v0, "Parsing ChaCha20Poly1305Key failed"

    .line 392
    .line 393
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 394
    .line 395
    .line 396
    throw p1

    .line 397
    :cond_8
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 398
    .line 399
    const-string v0, "Wrong type URL in call to ChaCha20Poly1305ProtoSerialization.parseKey"

    .line 400
    .line 401
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 402
    .line 403
    .line 404
    throw p1

    .line 405
    :sswitch_3
    iget-object v0, p1, Ls1/G;->a:Ljava/lang/String;

    .line 406
    .line 407
    const-string v1, "type.googleapis.com/google.crypto.tink.AesGcmSivKey"

    .line 408
    .line 409
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 410
    .line 411
    .line 412
    move-result v0

    .line 413
    if-eqz v0, :cond_a

    .line 414
    .line 415
    :try_start_4
    iget-object v0, p1, Ls1/G;->c:Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 416
    .line 417
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/o;->a()Lcom/google/crypto/tink/shaded/protobuf/o;

    .line 418
    .line 419
    .line 420
    move-result-object v1

    .line 421
    invoke-static {v0, v1}, Lx1/B;->D(Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/B;

    .line 422
    .line 423
    .line 424
    move-result-object v0

    .line 425
    invoke-virtual {v0}, Lx1/B;->B()I

    .line 426
    .line 427
    .line 428
    move-result v1

    .line 429
    if-nez v1, :cond_9

    .line 430
    .line 431
    invoke-static {}, Lk1/u;->b()LZ2/s;

    .line 432
    .line 433
    .line 434
    move-result-object v1

    .line 435
    invoke-virtual {v0}, Lx1/B;->A()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 436
    .line 437
    .line 438
    move-result-object v2

    .line 439
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/i;->size()I

    .line 440
    .line 441
    .line 442
    move-result v2

    .line 443
    invoke-virtual {v1, v2}, LZ2/s;->C(I)V

    .line 444
    .line 445
    .line 446
    iget-object v2, p1, Ls1/G;->e:Lx1/t0;

    .line 447
    .line 448
    invoke-static {v2}, Ll1/g;->b(Lx1/t0;)Lk1/k;

    .line 449
    .line 450
    .line 451
    move-result-object v2

    .line 452
    iput-object v2, v1, LZ2/s;->g:Ljava/lang/Object;

    .line 453
    .line 454
    invoke-virtual {v1}, LZ2/s;->u()Lk1/u;

    .line 455
    .line 456
    .line 457
    move-result-object v1

    .line 458
    new-instance v2, LB2/a;

    .line 459
    .line 460
    const/16 v3, 0x1b

    .line 461
    .line 462
    invoke-direct {v2, v3}, LB2/a;-><init>(I)V

    .line 463
    .line 464
    .line 465
    const/4 v3, 0x0

    .line 466
    iput-object v3, v2, LB2/a;->g:Ljava/lang/Object;

    .line 467
    .line 468
    iput-object v3, v2, LB2/a;->h:Ljava/lang/Object;

    .line 469
    .line 470
    iput-object v1, v2, LB2/a;->f:Ljava/lang/Object;

    .line 471
    .line 472
    invoke-virtual {v0}, Lx1/B;->A()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 473
    .line 474
    .line 475
    move-result-object v0

    .line 476
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/i;->f()[B

    .line 477
    .line 478
    .line 479
    move-result-object v0

    .line 480
    new-instance v1, Lio/flutter/plugin/editing/j;

    .line 481
    .line 482
    invoke-static {v0}, Lz1/a;->a([B)Lz1/a;

    .line 483
    .line 484
    .line 485
    move-result-object v0

    .line 486
    const/16 v3, 0x17

    .line 487
    .line 488
    invoke-direct {v1, v3, v0}, Lio/flutter/plugin/editing/j;-><init>(ILjava/lang/Object;)V

    .line 489
    .line 490
    .line 491
    iput-object v1, v2, LB2/a;->g:Ljava/lang/Object;

    .line 492
    .line 493
    iget-object p1, p1, Ls1/G;->f:Ljava/lang/Integer;

    .line 494
    .line 495
    iput-object p1, v2, LB2/a;->h:Ljava/lang/Object;

    .line 496
    .line 497
    invoke-virtual {v2}, LB2/a;->k()Lk1/s;

    .line 498
    .line 499
    .line 500
    move-result-object p1

    .line 501
    return-object p1

    .line 502
    :cond_9
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 503
    .line 504
    const-string v0, "Only version 0 keys are accepted"

    .line 505
    .line 506
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 507
    .line 508
    .line 509
    throw p1
    :try_end_4
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_4 .. :try_end_4} :catch_4

    .line 510
    :catch_4
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 511
    .line 512
    const-string v0, "Parsing AesGcmSivKey failed"

    .line 513
    .line 514
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 515
    .line 516
    .line 517
    throw p1

    .line 518
    :cond_a
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 519
    .line 520
    const-string v0, "Wrong type URL in call to AesGcmSivProtoSerialization.parseKey"

    .line 521
    .line 522
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 523
    .line 524
    .line 525
    throw p1

    .line 526
    :sswitch_4
    iget-object v0, p1, Ls1/G;->a:Ljava/lang/String;

    .line 527
    .line 528
    const-string v1, "type.googleapis.com/google.crypto.tink.AesGcmKey"

    .line 529
    .line 530
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 531
    .line 532
    .line 533
    move-result v0

    .line 534
    if-eqz v0, :cond_c

    .line 535
    .line 536
    :try_start_5
    iget-object v0, p1, Ls1/G;->c:Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 537
    .line 538
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/o;->a()Lcom/google/crypto/tink/shaded/protobuf/o;

    .line 539
    .line 540
    .line 541
    move-result-object v1

    .line 542
    invoke-static {v0, v1}, Lx1/x;->D(Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/x;

    .line 543
    .line 544
    .line 545
    move-result-object v0

    .line 546
    invoke-virtual {v0}, Lx1/x;->B()I

    .line 547
    .line 548
    .line 549
    move-result v1

    .line 550
    if-nez v1, :cond_b

    .line 551
    .line 552
    invoke-static {}, Lk1/r;->b()LV1/y;

    .line 553
    .line 554
    .line 555
    move-result-object v1

    .line 556
    invoke-virtual {v0}, Lx1/x;->A()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 557
    .line 558
    .line 559
    move-result-object v2

    .line 560
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/i;->size()I

    .line 561
    .line 562
    .line 563
    move-result v2

    .line 564
    invoke-virtual {v1, v2}, LV1/y;->z(I)V

    .line 565
    .line 566
    .line 567
    invoke-virtual {v1}, LV1/y;->x()V

    .line 568
    .line 569
    .line 570
    invoke-virtual {v1}, LV1/y;->B()V

    .line 571
    .line 572
    .line 573
    iget-object v2, p1, Ls1/G;->e:Lx1/t0;

    .line 574
    .line 575
    invoke-static {v2}, Ll1/e;->b(Lx1/t0;)Lk1/k;

    .line 576
    .line 577
    .line 578
    move-result-object v2

    .line 579
    iput-object v2, v1, LV1/y;->i:Ljava/lang/Object;

    .line 580
    .line 581
    invoke-virtual {v1}, LV1/y;->g()Lk1/r;

    .line 582
    .line 583
    .line 584
    move-result-object v1

    .line 585
    new-instance v2, LB2/a;

    .line 586
    .line 587
    const/16 v3, 0x1a

    .line 588
    .line 589
    invoke-direct {v2, v3}, LB2/a;-><init>(I)V

    .line 590
    .line 591
    .line 592
    const/4 v3, 0x0

    .line 593
    iput-object v3, v2, LB2/a;->g:Ljava/lang/Object;

    .line 594
    .line 595
    iput-object v3, v2, LB2/a;->h:Ljava/lang/Object;

    .line 596
    .line 597
    iput-object v1, v2, LB2/a;->f:Ljava/lang/Object;

    .line 598
    .line 599
    invoke-virtual {v0}, Lx1/x;->A()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 600
    .line 601
    .line 602
    move-result-object v0

    .line 603
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/i;->f()[B

    .line 604
    .line 605
    .line 606
    move-result-object v0

    .line 607
    new-instance v1, Lio/flutter/plugin/editing/j;

    .line 608
    .line 609
    invoke-static {v0}, Lz1/a;->a([B)Lz1/a;

    .line 610
    .line 611
    .line 612
    move-result-object v0

    .line 613
    const/16 v3, 0x17

    .line 614
    .line 615
    invoke-direct {v1, v3, v0}, Lio/flutter/plugin/editing/j;-><init>(ILjava/lang/Object;)V

    .line 616
    .line 617
    .line 618
    iput-object v1, v2, LB2/a;->g:Ljava/lang/Object;

    .line 619
    .line 620
    iget-object p1, p1, Ls1/G;->f:Ljava/lang/Integer;

    .line 621
    .line 622
    iput-object p1, v2, LB2/a;->h:Ljava/lang/Object;

    .line 623
    .line 624
    invoke-virtual {v2}, LB2/a;->j()Lk1/p;

    .line 625
    .line 626
    .line 627
    move-result-object p1

    .line 628
    return-object p1

    .line 629
    :cond_b
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 630
    .line 631
    const-string v0, "Only version 0 keys are accepted"

    .line 632
    .line 633
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 634
    .line 635
    .line 636
    throw p1
    :try_end_5
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_5 .. :try_end_5} :catch_5

    .line 637
    :catch_5
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 638
    .line 639
    const-string v0, "Parsing AesGcmKey failed"

    .line 640
    .line 641
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 642
    .line 643
    .line 644
    throw p1

    .line 645
    :cond_c
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 646
    .line 647
    const-string v0, "Wrong type URL in call to AesGcmProtoSerialization.parseKey"

    .line 648
    .line 649
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 650
    .line 651
    .line 652
    throw p1

    .line 653
    :sswitch_5
    iget-object v0, p1, Ls1/G;->a:Ljava/lang/String;

    .line 654
    .line 655
    const-string v1, "type.googleapis.com/google.crypto.tink.AesEaxKey"

    .line 656
    .line 657
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 658
    .line 659
    .line 660
    move-result v0

    .line 661
    if-eqz v0, :cond_e

    .line 662
    .line 663
    :try_start_6
    iget-object v0, p1, Ls1/G;->c:Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 664
    .line 665
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/o;->a()Lcom/google/crypto/tink/shaded/protobuf/o;

    .line 666
    .line 667
    .line 668
    move-result-object v1

    .line 669
    invoke-static {v0, v1}, Lx1/r;->F(Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/r;

    .line 670
    .line 671
    .line 672
    move-result-object v0

    .line 673
    invoke-virtual {v0}, Lx1/r;->D()I

    .line 674
    .line 675
    .line 676
    move-result v1

    .line 677
    if-nez v1, :cond_d

    .line 678
    .line 679
    invoke-static {}, Lk1/o;->b()LV1/y;

    .line 680
    .line 681
    .line 682
    move-result-object v1

    .line 683
    invoke-virtual {v0}, Lx1/r;->B()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 684
    .line 685
    .line 686
    move-result-object v2

    .line 687
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/i;->size()I

    .line 688
    .line 689
    .line 690
    move-result v2

    .line 691
    invoke-virtual {v1, v2}, LV1/y;->z(I)V

    .line 692
    .line 693
    .line 694
    invoke-virtual {v0}, Lx1/r;->C()Lx1/v;

    .line 695
    .line 696
    .line 697
    move-result-object v2

    .line 698
    invoke-virtual {v2}, Lx1/v;->B()I

    .line 699
    .line 700
    .line 701
    move-result v2

    .line 702
    invoke-virtual {v1, v2}, LV1/y;->y(I)V

    .line 703
    .line 704
    .line 705
    invoke-virtual {v1}, LV1/y;->B()V

    .line 706
    .line 707
    .line 708
    iget-object v2, p1, Ls1/G;->e:Lx1/t0;

    .line 709
    .line 710
    invoke-static {v2}, Ll1/c;->c(Lx1/t0;)Lk1/k;

    .line 711
    .line 712
    .line 713
    move-result-object v2

    .line 714
    iput-object v2, v1, LV1/y;->i:Ljava/lang/Object;

    .line 715
    .line 716
    invoke-virtual {v1}, LV1/y;->f()Lk1/o;

    .line 717
    .line 718
    .line 719
    move-result-object v1

    .line 720
    new-instance v2, LB2/a;

    .line 721
    .line 722
    const/16 v3, 0x19

    .line 723
    .line 724
    invoke-direct {v2, v3}, LB2/a;-><init>(I)V

    .line 725
    .line 726
    .line 727
    const/4 v3, 0x0

    .line 728
    iput-object v3, v2, LB2/a;->g:Ljava/lang/Object;

    .line 729
    .line 730
    iput-object v3, v2, LB2/a;->h:Ljava/lang/Object;

    .line 731
    .line 732
    iput-object v1, v2, LB2/a;->f:Ljava/lang/Object;

    .line 733
    .line 734
    invoke-virtual {v0}, Lx1/r;->B()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 735
    .line 736
    .line 737
    move-result-object v0

    .line 738
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/i;->f()[B

    .line 739
    .line 740
    .line 741
    move-result-object v0

    .line 742
    new-instance v1, Lio/flutter/plugin/editing/j;

    .line 743
    .line 744
    invoke-static {v0}, Lz1/a;->a([B)Lz1/a;

    .line 745
    .line 746
    .line 747
    move-result-object v0

    .line 748
    const/16 v3, 0x17

    .line 749
    .line 750
    invoke-direct {v1, v3, v0}, Lio/flutter/plugin/editing/j;-><init>(ILjava/lang/Object;)V

    .line 751
    .line 752
    .line 753
    iput-object v1, v2, LB2/a;->g:Ljava/lang/Object;

    .line 754
    .line 755
    iget-object p1, p1, Ls1/G;->f:Ljava/lang/Integer;

    .line 756
    .line 757
    iput-object p1, v2, LB2/a;->h:Ljava/lang/Object;

    .line 758
    .line 759
    invoke-virtual {v2}, LB2/a;->i()Lk1/m;

    .line 760
    .line 761
    .line 762
    move-result-object p1

    .line 763
    return-object p1

    .line 764
    :cond_d
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 765
    .line 766
    const-string v0, "Only version 0 keys are accepted"

    .line 767
    .line 768
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 769
    .line 770
    .line 771
    throw p1
    :try_end_6
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_6 .. :try_end_6} :catch_6

    .line 772
    :catch_6
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 773
    .line 774
    const-string v0, "Parsing AesEaxcKey failed"

    .line 775
    .line 776
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 777
    .line 778
    .line 779
    throw p1

    .line 780
    :cond_e
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 781
    .line 782
    const-string v0, "Wrong type URL in call to AesEaxProtoSerialization.parseKey"

    .line 783
    .line 784
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 785
    .line 786
    .line 787
    throw p1

    .line 788
    nop

    .line 789
    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_5
        0x6 -> :sswitch_4
        0xa -> :sswitch_3
        0xe -> :sswitch_2
        0x12 -> :sswitch_1
        0x16 -> :sswitch_0
    .end sparse-switch
.end method
