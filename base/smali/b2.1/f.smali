.class public final synthetic Lb2/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lb2/o;
.implements Ls1/C;
.implements Ls1/x;
.implements Ls1/v;
.implements Ls1/f;
.implements Ls1/d;


# instance fields
.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Lb2/f;->e:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(Lj1/f;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public b(Ls1/H;)Lj1/i;
    .locals 3

    .line 1
    iget v0, p0, Lb2/f;->e:I

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
    const-string v1, "type.googleapis.com/google.crypto.tink.AesCtrHmacAeadKey"

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
    invoke-static {v0, v1}, Lx1/j;->E(Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/j;

    .line 29
    .line 30
    .line 31
    move-result-object v0
    :try_end_0
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    invoke-virtual {v0}, Lx1/j;->C()Lx1/T;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1}, Lx1/T;->E()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-nez v1, :cond_0

    .line 41
    .line 42
    invoke-static {}, Lk1/l;->b()LD1/x;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0}, Lx1/j;->B()Lx1/n;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v2}, Lx1/n;->C()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    invoke-virtual {v1, v2}, LD1/x;->o(I)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Lx1/j;->C()Lx1/T;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v2}, Lx1/T;->C()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    invoke-virtual {v1, v2}, LD1/x;->q(I)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Lx1/j;->B()Lx1/n;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v2}, Lx1/n;->D()Lx1/p;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {v2}, Lx1/p;->B()I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    invoke-virtual {v1, v2}, LD1/x;->r(I)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0}, Lx1/j;->C()Lx1/T;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v2}, Lx1/T;->D()Lx1/V;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-virtual {v2}, Lx1/V;->D()I

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    invoke-virtual {v1, v2}, LD1/x;->t(I)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Lx1/j;->C()Lx1/T;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {v0}, Lx1/T;->D()Lx1/V;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v0}, Lx1/V;->C()Lx1/O;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-static {v0}, Ll1/a;->b(Lx1/O;)Lk1/k;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iput-object v0, v1, LD1/x;->e:Ljava/lang/Object;

    .line 115
    .line 116
    invoke-virtual {p1}, Lx1/b0;->D()Lx1/t0;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-static {p1}, Ll1/a;->d(Lx1/t0;)Lk1/k;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    iput-object p1, v1, LD1/x;->f:Ljava/lang/Object;

    .line 125
    .line 126
    invoke-virtual {v1}, LD1/x;->i()Lk1/l;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    return-object p1

    .line 131
    :cond_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 132
    .line 133
    const-string v0, "Only version 0 keys are accepted"

    .line 134
    .line 135
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    throw p1

    .line 139
    :catch_0
    move-exception p1

    .line 140
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 141
    .line 142
    const-string v1, "Parsing AesCtrHmacAeadParameters failed: "

    .line 143
    .line 144
    invoke-direct {v0, v1, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 145
    .line 146
    .line 147
    throw v0

    .line 148
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 149
    .line 150
    new-instance v1, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    const-string v2, "Wrong type URL in call to AesCtrHmacAeadProtoSerialization.parseParameters: "

    .line 153
    .line 154
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    throw v0

    .line 172
    :sswitch_0
    iget-object p1, p1, Ls1/H;->b:Lx1/b0;

    .line 173
    .line 174
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    const-string v1, "type.googleapis.com/google.crypto.tink.KmsEnvelopeAeadKey"

    .line 179
    .line 180
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    if-eqz v0, :cond_2

    .line 185
    .line 186
    :try_start_1
    invoke-virtual {p1}, Lx1/b0;->F()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/o;->a()Lcom/google/crypto/tink/shaded/protobuf/o;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    invoke-static {v0, v1}, Lx1/s0;->F(Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/s0;

    .line 195
    .line 196
    .line 197
    move-result-object v0
    :try_end_1
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_1 .. :try_end_1} :catch_1

    .line 198
    invoke-virtual {p1}, Lx1/b0;->D()Lx1/t0;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    invoke-static {v0, p1}, Lk1/G;->a(Lx1/s0;Lx1/t0;)Lk1/F;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    return-object p1

    .line 207
    :catch_1
    move-exception p1

    .line 208
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 209
    .line 210
    const-string v1, "Parsing KmsEnvelopeAeadKeyFormat failed: "

    .line 211
    .line 212
    invoke-direct {v0, v1, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 213
    .line 214
    .line 215
    throw v0

    .line 216
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 217
    .line 218
    new-instance v1, Ljava/lang/StringBuilder;

    .line 219
    .line 220
    const-string v2, "Wrong type URL in call to LegacyKmsEnvelopeAeadProtoSerialization.parseParameters: "

    .line 221
    .line 222
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    throw v0

    .line 240
    :sswitch_1
    iget-object p1, p1, Ls1/H;->b:Lx1/b0;

    .line 241
    .line 242
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    const-string v1, "type.googleapis.com/google.crypto.tink.KmsAeadKey"

    .line 247
    .line 248
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 249
    .line 250
    .line 251
    move-result v0

    .line 252
    if-eqz v0, :cond_3

    .line 253
    .line 254
    :try_start_2
    invoke-virtual {p1}, Lx1/b0;->F()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/o;->a()Lcom/google/crypto/tink/shaded/protobuf/o;

    .line 259
    .line 260
    .line 261
    move-result-object v1

    .line 262
    invoke-static {v0, v1}, Lx1/o0;->D(Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/o0;

    .line 263
    .line 264
    .line 265
    move-result-object v0
    :try_end_2
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_2 .. :try_end_2} :catch_2

    .line 266
    invoke-virtual {v0}, Lx1/o0;->B()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    invoke-virtual {p1}, Lx1/b0;->D()Lx1/t0;

    .line 271
    .line 272
    .line 273
    move-result-object p1

    .line 274
    invoke-static {p1}, Lk1/D;->b(Lx1/t0;)Lk1/k;

    .line 275
    .line 276
    .line 277
    move-result-object p1

    .line 278
    new-instance v1, Lk1/C;

    .line 279
    .line 280
    invoke-direct {v1, v0, p1}, Lk1/C;-><init>(Ljava/lang/String;Lk1/k;)V

    .line 281
    .line 282
    .line 283
    return-object v1

    .line 284
    :catch_2
    move-exception p1

    .line 285
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 286
    .line 287
    const-string v1, "Parsing KmsAeadKeyFormat failed: "

    .line 288
    .line 289
    invoke-direct {v0, v1, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 290
    .line 291
    .line 292
    throw v0

    .line 293
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 294
    .line 295
    new-instance v1, Ljava/lang/StringBuilder;

    .line 296
    .line 297
    const-string v2, "Wrong type URL in call to LegacyKmsAeadProtoSerialization.parseParameters: "

    .line 298
    .line 299
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 300
    .line 301
    .line 302
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object p1

    .line 306
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 307
    .line 308
    .line 309
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 310
    .line 311
    .line 312
    move-result-object p1

    .line 313
    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 314
    .line 315
    .line 316
    throw v0

    .line 317
    :sswitch_data_0
    .sparse-switch
        0x10 -> :sswitch_1
        0x14 -> :sswitch_0
    .end sparse-switch
.end method

.method public c(Landroid/support/v4/media/session/a;)Ls1/G;
    .locals 6

    .line 1
    iget v0, p0, Lb2/f;->e:I

    .line 2
    .line 3
    sparse-switch v0, :sswitch_data_0

    .line 4
    .line 5
    .line 6
    check-cast p1, Lk1/g;

    .line 7
    .line 8
    invoke-static {}, Lx1/h;->E()Lx1/g;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {}, Lx1/l;->F()Lx1/k;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {}, Lx1/p;->C()Lx1/o;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iget-object v3, p1, Lk1/g;->d:Lk1/l;

    .line 21
    .line 22
    iget v3, v3, Lk1/l;->c:I

    .line 23
    .line 24
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 25
    .line 26
    .line 27
    iget-object v4, v2, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 28
    .line 29
    check-cast v4, Lx1/p;

    .line 30
    .line 31
    invoke-static {v4, v3}, Lx1/p;->z(Lx1/p;I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Lx1/p;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 41
    .line 42
    .line 43
    iget-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 44
    .line 45
    check-cast v3, Lx1/l;

    .line 46
    .line 47
    invoke-static {v3, v2}, Lx1/l;->z(Lx1/l;Lx1/p;)V

    .line 48
    .line 49
    .line 50
    iget-object v2, p1, Lk1/g;->e:Lio/flutter/plugin/editing/j;

    .line 51
    .line 52
    iget-object v2, v2, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast v2, Lz1/a;

    .line 55
    .line 56
    invoke-virtual {v2}, Lz1/a;->b()[B

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    array-length v3, v2

    .line 61
    const/4 v4, 0x0

    .line 62
    invoke-static {v2, v4, v3}, Lcom/google/crypto/tink/shaded/protobuf/i;->d([BII)Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 67
    .line 68
    .line 69
    iget-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 70
    .line 71
    check-cast v3, Lx1/l;

    .line 72
    .line 73
    invoke-static {v3, v2}, Lx1/l;->A(Lx1/l;Lcom/google/crypto/tink/shaded/protobuf/h;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    check-cast v1, Lx1/l;

    .line 81
    .line 82
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 83
    .line 84
    .line 85
    iget-object v2, v0, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 86
    .line 87
    check-cast v2, Lx1/h;

    .line 88
    .line 89
    invoke-static {v2, v1}, Lx1/h;->z(Lx1/h;Lx1/l;)V

    .line 90
    .line 91
    .line 92
    invoke-static {}, Lx1/Q;->F()Lx1/P;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    iget-object v2, p1, Lk1/g;->d:Lk1/l;

    .line 97
    .line 98
    invoke-static {v2}, Ll1/a;->a(Lk1/l;)Lx1/V;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 103
    .line 104
    .line 105
    iget-object v5, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 106
    .line 107
    check-cast v5, Lx1/Q;

    .line 108
    .line 109
    invoke-static {v5, v3}, Lx1/Q;->z(Lx1/Q;Lx1/V;)V

    .line 110
    .line 111
    .line 112
    iget-object v3, p1, Lk1/g;->f:Lio/flutter/plugin/editing/j;

    .line 113
    .line 114
    iget-object v3, v3, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 115
    .line 116
    check-cast v3, Lz1/a;

    .line 117
    .line 118
    invoke-virtual {v3}, Lz1/a;->b()[B

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    array-length v5, v3

    .line 123
    invoke-static {v3, v4, v5}, Lcom/google/crypto/tink/shaded/protobuf/i;->d([BII)Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 128
    .line 129
    .line 130
    iget-object v4, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 131
    .line 132
    check-cast v4, Lx1/Q;

    .line 133
    .line 134
    invoke-static {v4, v3}, Lx1/Q;->A(Lx1/Q;Lcom/google/crypto/tink/shaded/protobuf/h;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    check-cast v1, Lx1/Q;

    .line 142
    .line 143
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 144
    .line 145
    .line 146
    iget-object v3, v0, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 147
    .line 148
    check-cast v3, Lx1/h;

    .line 149
    .line 150
    invoke-static {v3, v1}, Lx1/h;->A(Lx1/h;Lx1/Q;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    check-cast v0, Lx1/h;

    .line 158
    .line 159
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/a;->f()Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    iget-object v1, v2, Lk1/l;->e:Lk1/k;

    .line 164
    .line 165
    invoke-static {v1}, Ll1/a;->c(Lk1/k;)Lx1/t0;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    iget-object p1, p1, Lk1/g;->h:Ljava/lang/Integer;

    .line 170
    .line 171
    const-string v2, "type.googleapis.com/google.crypto.tink.AesCtrHmacAeadKey"

    .line 172
    .line 173
    sget-object v3, Lx1/X;->g:Lx1/X;

    .line 174
    .line 175
    invoke-static {v2, v0, v3, v1, p1}, Ls1/G;->a(Ljava/lang/String;Lcom/google/crypto/tink/shaded/protobuf/i;Lx1/X;Lx1/t0;Ljava/lang/Integer;)Ls1/G;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    return-object p1

    .line 180
    :sswitch_0
    check-cast p1, Lk1/E;

    .line 181
    .line 182
    invoke-static {}, Lx1/q0;->C()Lx1/p0;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    iget-object v1, p1, Lk1/E;->d:Lk1/F;

    .line 187
    .line 188
    invoke-static {v1}, Lk1/G;->b(Lk1/F;)Lx1/s0;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 193
    .line 194
    .line 195
    iget-object v2, v0, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 196
    .line 197
    check-cast v2, Lx1/q0;

    .line 198
    .line 199
    invoke-static {v2, v1}, Lx1/q0;->z(Lx1/q0;Lx1/s0;)V

    .line 200
    .line 201
    .line 202
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    check-cast v0, Lx1/q0;

    .line 207
    .line 208
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/a;->f()Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    iget-object v1, p1, Lk1/E;->d:Lk1/F;

    .line 213
    .line 214
    iget-object v1, v1, Lk1/F;->a:Lk1/k;

    .line 215
    .line 216
    invoke-static {v1}, Lk1/G;->c(Lk1/k;)Lx1/t0;

    .line 217
    .line 218
    .line 219
    move-result-object v1

    .line 220
    iget-object p1, p1, Lk1/E;->f:Ljava/lang/Integer;

    .line 221
    .line 222
    const-string v2, "type.googleapis.com/google.crypto.tink.KmsEnvelopeAeadKey"

    .line 223
    .line 224
    sget-object v3, Lx1/X;->j:Lx1/X;

    .line 225
    .line 226
    invoke-static {v2, v0, v3, v1, p1}, Ls1/G;->a(Ljava/lang/String;Lcom/google/crypto/tink/shaded/protobuf/i;Lx1/X;Lx1/t0;Ljava/lang/Integer;)Ls1/G;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    return-object p1

    .line 231
    :sswitch_1
    check-cast p1, Lk1/B;

    .line 232
    .line 233
    invoke-static {}, Lx1/m0;->C()Lx1/l0;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    invoke-static {}, Lx1/o0;->C()Lx1/n0;

    .line 238
    .line 239
    .line 240
    move-result-object v1

    .line 241
    iget-object v2, p1, Lk1/B;->d:Lk1/C;

    .line 242
    .line 243
    iget-object v2, v2, Lk1/C;->a:Ljava/lang/String;

    .line 244
    .line 245
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 246
    .line 247
    .line 248
    iget-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 249
    .line 250
    check-cast v3, Lx1/o0;

    .line 251
    .line 252
    invoke-static {v3, v2}, Lx1/o0;->z(Lx1/o0;Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 256
    .line 257
    .line 258
    move-result-object v1

    .line 259
    check-cast v1, Lx1/o0;

    .line 260
    .line 261
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 262
    .line 263
    .line 264
    iget-object v2, v0, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 265
    .line 266
    check-cast v2, Lx1/m0;

    .line 267
    .line 268
    invoke-static {v2, v1}, Lx1/m0;->z(Lx1/m0;Lx1/o0;)V

    .line 269
    .line 270
    .line 271
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    check-cast v0, Lx1/m0;

    .line 276
    .line 277
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/a;->f()Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    iget-object v1, p1, Lk1/B;->d:Lk1/C;

    .line 282
    .line 283
    iget-object v1, v1, Lk1/C;->b:Lk1/k;

    .line 284
    .line 285
    invoke-static {v1}, Lk1/D;->a(Lk1/k;)Lx1/t0;

    .line 286
    .line 287
    .line 288
    move-result-object v1

    .line 289
    iget-object p1, p1, Lk1/B;->f:Ljava/lang/Integer;

    .line 290
    .line 291
    const-string v2, "type.googleapis.com/google.crypto.tink.KmsAeadKey"

    .line 292
    .line 293
    sget-object v3, Lx1/X;->j:Lx1/X;

    .line 294
    .line 295
    invoke-static {v2, v0, v3, v1, p1}, Ls1/G;->a(Ljava/lang/String;Lcom/google/crypto/tink/shaded/protobuf/i;Lx1/X;Lx1/t0;Ljava/lang/Integer;)Ls1/G;

    .line 296
    .line 297
    .line 298
    move-result-object p1

    .line 299
    return-object p1

    .line 300
    nop

    .line 301
    :sswitch_data_0
    .sparse-switch
        0x11 -> :sswitch_1
        0x15 -> :sswitch_0
    .end sparse-switch
.end method

.method public d(Lj1/i;)Ls1/H;
    .locals 6

    .line 1
    iget v0, p0, Lb2/f;->e:I

    .line 2
    .line 3
    sparse-switch v0, :sswitch_data_0

    .line 4
    .line 5
    .line 6
    check-cast p1, Lk1/o;

    .line 7
    .line 8
    invoke-static {}, Lx1/b0;->G()Lx1/a0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "type.googleapis.com/google.crypto.tink.AesEaxKey"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lx1/a0;->i(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lx1/t;->D()Lx1/s;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {p1}, Ll1/c;->a(Lk1/o;)Lx1/v;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 26
    .line 27
    .line 28
    iget-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 29
    .line 30
    check-cast v3, Lx1/t;

    .line 31
    .line 32
    invoke-static {v3, v2}, Lx1/t;->z(Lx1/t;Lx1/v;)V

    .line 33
    .line 34
    .line 35
    iget v2, p1, Lk1/o;->a:I

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 38
    .line 39
    .line 40
    iget-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 41
    .line 42
    check-cast v3, Lx1/t;

    .line 43
    .line 44
    invoke-static {v3, v2}, Lx1/t;->A(Lx1/t;I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    check-cast v1, Lx1/t;

    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/a;->f()Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Lx1/a0;->j(Lcom/google/crypto/tink/shaded/protobuf/i;)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p1, Lk1/o;->d:Lk1/k;

    .line 61
    .line 62
    invoke-static {p1}, Ll1/c;->b(Lk1/k;)Lx1/t0;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {v0, p1}, Lx1/a0;->h(Lx1/t0;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    check-cast p1, Lx1/b0;

    .line 74
    .line 75
    invoke-static {p1}, Ls1/H;->a(Lx1/b0;)Ls1/H;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    return-object p1

    .line 80
    :sswitch_0
    check-cast p1, Lk1/l;

    .line 81
    .line 82
    invoke-static {}, Lx1/b0;->G()Lx1/a0;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    const-string v1, "type.googleapis.com/google.crypto.tink.AesCtrHmacAeadKey"

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Lx1/a0;->i(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-static {}, Lx1/j;->D()Lx1/i;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-static {}, Lx1/n;->E()Lx1/m;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-static {}, Lx1/p;->C()Lx1/o;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    iget v4, p1, Lk1/l;->c:I

    .line 104
    .line 105
    invoke-virtual {v3}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 106
    .line 107
    .line 108
    iget-object v5, v3, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 109
    .line 110
    check-cast v5, Lx1/p;

    .line 111
    .line 112
    invoke-static {v5, v4}, Lx1/p;->z(Lx1/p;I)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v3}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    check-cast v3, Lx1/p;

    .line 120
    .line 121
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 122
    .line 123
    .line 124
    iget-object v4, v2, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 125
    .line 126
    check-cast v4, Lx1/n;

    .line 127
    .line 128
    invoke-static {v4, v3}, Lx1/n;->z(Lx1/n;Lx1/p;)V

    .line 129
    .line 130
    .line 131
    iget v3, p1, Lk1/l;->a:I

    .line 132
    .line 133
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 134
    .line 135
    .line 136
    iget-object v4, v2, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 137
    .line 138
    check-cast v4, Lx1/n;

    .line 139
    .line 140
    invoke-static {v4, v3}, Lx1/n;->A(Lx1/n;I)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    check-cast v2, Lx1/n;

    .line 148
    .line 149
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 150
    .line 151
    .line 152
    iget-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 153
    .line 154
    check-cast v3, Lx1/j;

    .line 155
    .line 156
    invoke-static {v3, v2}, Lx1/j;->z(Lx1/j;Lx1/n;)V

    .line 157
    .line 158
    .line 159
    invoke-static {}, Lx1/T;->F()Lx1/S;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    invoke-static {p1}, Ll1/a;->a(Lk1/l;)Lx1/V;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 168
    .line 169
    .line 170
    iget-object v4, v2, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 171
    .line 172
    check-cast v4, Lx1/T;

    .line 173
    .line 174
    invoke-static {v4, v3}, Lx1/T;->z(Lx1/T;Lx1/V;)V

    .line 175
    .line 176
    .line 177
    iget v3, p1, Lk1/l;->b:I

    .line 178
    .line 179
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 180
    .line 181
    .line 182
    iget-object v4, v2, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 183
    .line 184
    check-cast v4, Lx1/T;

    .line 185
    .line 186
    invoke-static {v4, v3}, Lx1/T;->A(Lx1/T;I)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 190
    .line 191
    .line 192
    move-result-object v2

    .line 193
    check-cast v2, Lx1/T;

    .line 194
    .line 195
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 196
    .line 197
    .line 198
    iget-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 199
    .line 200
    check-cast v3, Lx1/j;

    .line 201
    .line 202
    invoke-static {v3, v2}, Lx1/j;->A(Lx1/j;Lx1/T;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    check-cast v1, Lx1/j;

    .line 210
    .line 211
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/a;->f()Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    invoke-virtual {v0, v1}, Lx1/a0;->j(Lcom/google/crypto/tink/shaded/protobuf/i;)V

    .line 216
    .line 217
    .line 218
    iget-object p1, p1, Lk1/l;->e:Lk1/k;

    .line 219
    .line 220
    invoke-static {p1}, Ll1/a;->c(Lk1/k;)Lx1/t0;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    invoke-virtual {v0, p1}, Lx1/a0;->h(Lx1/t0;)V

    .line 225
    .line 226
    .line 227
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    check-cast p1, Lx1/b0;

    .line 232
    .line 233
    invoke-static {p1}, Ls1/H;->a(Lx1/b0;)Ls1/H;

    .line 234
    .line 235
    .line 236
    move-result-object p1

    .line 237
    return-object p1

    .line 238
    :sswitch_1
    check-cast p1, Lk1/F;

    .line 239
    .line 240
    invoke-static {}, Lx1/b0;->G()Lx1/a0;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    const-string v1, "type.googleapis.com/google.crypto.tink.KmsEnvelopeAeadKey"

    .line 245
    .line 246
    invoke-virtual {v0, v1}, Lx1/a0;->i(Ljava/lang/String;)V

    .line 247
    .line 248
    .line 249
    invoke-static {p1}, Lk1/G;->b(Lk1/F;)Lx1/s0;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/a;->f()Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 254
    .line 255
    .line 256
    move-result-object v1

    .line 257
    invoke-virtual {v0, v1}, Lx1/a0;->j(Lcom/google/crypto/tink/shaded/protobuf/i;)V

    .line 258
    .line 259
    .line 260
    iget-object p1, p1, Lk1/F;->a:Lk1/k;

    .line 261
    .line 262
    invoke-static {p1}, Lk1/G;->c(Lk1/k;)Lx1/t0;

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    invoke-virtual {v0, p1}, Lx1/a0;->h(Lx1/t0;)V

    .line 267
    .line 268
    .line 269
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 270
    .line 271
    .line 272
    move-result-object p1

    .line 273
    check-cast p1, Lx1/b0;

    .line 274
    .line 275
    invoke-static {p1}, Ls1/H;->a(Lx1/b0;)Ls1/H;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    return-object p1

    .line 280
    :sswitch_2
    check-cast p1, Lk1/C;

    .line 281
    .line 282
    invoke-static {}, Lx1/b0;->G()Lx1/a0;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    const-string v1, "type.googleapis.com/google.crypto.tink.KmsAeadKey"

    .line 287
    .line 288
    invoke-virtual {v0, v1}, Lx1/a0;->i(Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    invoke-static {}, Lx1/o0;->C()Lx1/n0;

    .line 292
    .line 293
    .line 294
    move-result-object v1

    .line 295
    iget-object v2, p1, Lk1/C;->a:Ljava/lang/String;

    .line 296
    .line 297
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 298
    .line 299
    .line 300
    iget-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 301
    .line 302
    check-cast v3, Lx1/o0;

    .line 303
    .line 304
    invoke-static {v3, v2}, Lx1/o0;->z(Lx1/o0;Ljava/lang/String;)V

    .line 305
    .line 306
    .line 307
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 308
    .line 309
    .line 310
    move-result-object v1

    .line 311
    check-cast v1, Lx1/o0;

    .line 312
    .line 313
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/a;->f()Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 314
    .line 315
    .line 316
    move-result-object v1

    .line 317
    invoke-virtual {v0, v1}, Lx1/a0;->j(Lcom/google/crypto/tink/shaded/protobuf/i;)V

    .line 318
    .line 319
    .line 320
    iget-object p1, p1, Lk1/C;->b:Lk1/k;

    .line 321
    .line 322
    invoke-static {p1}, Lk1/D;->a(Lk1/k;)Lx1/t0;

    .line 323
    .line 324
    .line 325
    move-result-object p1

    .line 326
    invoke-virtual {v0, p1}, Lx1/a0;->h(Lx1/t0;)V

    .line 327
    .line 328
    .line 329
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 330
    .line 331
    .line 332
    move-result-object p1

    .line 333
    check-cast p1, Lx1/b0;

    .line 334
    .line 335
    invoke-static {p1}, Ls1/H;->a(Lx1/b0;)Ls1/H;

    .line 336
    .line 337
    .line 338
    move-result-object p1

    .line 339
    return-object p1

    .line 340
    nop

    .line 341
    :sswitch_data_0
    .sparse-switch
        0xf -> :sswitch_2
        0x13 -> :sswitch_1
        0x19 -> :sswitch_0
    .end sparse-switch
.end method

.method public e(Landroid/support/v4/media/session/a;)Ljava/lang/Object;
    .locals 9

    .line 1
    iget v0, p0, Lb2/f;->e:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/16 v2, 0x10

    .line 5
    .line 6
    const/4 v3, 0x3

    .line 7
    const/16 v4, 0xc

    .line 8
    .line 9
    const/4 v5, 0x4

    .line 10
    packed-switch v0, :pswitch_data_0

    .line 11
    .line 12
    .line 13
    :pswitch_0
    check-cast p1, Lk1/L;

    .line 14
    .line 15
    :try_start_0
    invoke-static {}, Ll1/h;->c()Ljavax/crypto/Cipher;
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll1/h;->c()Ljavax/crypto/Cipher;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll1/o;

    .line 23
    .line 24
    iget-object v2, p1, Lk1/L;->e:Lio/flutter/plugin/editing/j;

    .line 25
    .line 26
    iget-object v2, v2, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v2, Lz1/a;

    .line 29
    .line 30
    invoke-virtual {v2}, Lz1/a;->b()[B

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    iget-object p1, p1, Lk1/L;->f:Lz1/a;

    .line 35
    .line 36
    invoke-virtual {p1}, Lz1/a;->b()[B

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {v0}, Ljavax/crypto/Cipher;->getProvider()Ljava/security/Provider;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-direct {v1, v2, p1, v0}, Ll1/o;-><init>([B[BLjava/security/Provider;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catch_0
    new-instance v1, Lk1/e;

    .line 49
    .line 50
    iget-object v0, p1, Lk1/L;->e:Lio/flutter/plugin/editing/j;

    .line 51
    .line 52
    iget-object v0, v0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast v0, Lz1/a;

    .line 55
    .line 56
    invoke-virtual {v0}, Lz1/a;->b()[B

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object p1, p1, Lk1/L;->f:Lz1/a;

    .line 61
    .line 62
    invoke-virtual {p1}, Lz1/a;->b()[B

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-direct {v1, v5, v0, p1}, Lk1/e;-><init>(I[B[B)V

    .line 67
    .line 68
    .line 69
    :goto_0
    return-object v1

    .line 70
    :pswitch_1
    check-cast p1, Lk1/I;

    .line 71
    .line 72
    iget-object v0, p1, Lk1/I;->d:Lk1/K;

    .line 73
    .line 74
    iget v0, v0, Lk1/K;->b:I

    .line 75
    .line 76
    const/16 v1, 0x8

    .line 77
    .line 78
    if-lt v0, v1, :cond_0

    .line 79
    .line 80
    if-gt v0, v4, :cond_0

    .line 81
    .line 82
    new-instance v0, Ll1/m;

    .line 83
    .line 84
    iget-object v1, p1, Lk1/I;->e:Lio/flutter/plugin/editing/j;

    .line 85
    .line 86
    iget-object v1, v1, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 87
    .line 88
    check-cast v1, Lz1/a;

    .line 89
    .line 90
    invoke-virtual {v1}, Lz1/a;->b()[B

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    iget-object v2, p1, Lk1/I;->f:Lz1/a;

    .line 95
    .line 96
    iget-object p1, p1, Lk1/I;->d:Lk1/K;

    .line 97
    .line 98
    iget p1, p1, Lk1/K;->b:I

    .line 99
    .line 100
    invoke-direct {v0, v1, v2, p1}, Ll1/m;-><init>([BLz1/a;I)V

    .line 101
    .line 102
    .line 103
    return-object v0

    .line 104
    :cond_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 105
    .line 106
    const-string v0, "invalid salt size"

    .line 107
    .line 108
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    throw p1

    .line 112
    :pswitch_2
    check-cast p1, Lk1/E;

    .line 113
    .line 114
    iget-object v0, p1, Lk1/E;->d:Lk1/F;

    .line 115
    .line 116
    iget-object v1, v0, Lk1/F;->b:Ljava/lang/String;

    .line 117
    .line 118
    iget-object v0, v0, Lk1/F;->d:Lk1/c;

    .line 119
    .line 120
    invoke-static {v1}, Lj1/g;->a(Ljava/lang/String;)Lr1/c;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    invoke-virtual {v2, v1}, Lr1/c;->b(Ljava/lang/String;)Lr1/b;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    sget-object v2, Lk1/z;->d:[B

    .line 129
    .line 130
    :try_start_1
    invoke-static {v0}, LT0/a;->I(Lj1/i;)[B

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/o;->a()Lcom/google/crypto/tink/shaded/protobuf/o;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    invoke-static {v0, v2}, Lx1/b0;->I([BLcom/google/crypto/tink/shaded/protobuf/o;)Lx1/b0;

    .line 139
    .line 140
    .line 141
    move-result-object v0
    :try_end_1
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_1 .. :try_end_1} :catch_1

    .line 142
    new-instance v2, Lk1/z;

    .line 143
    .line 144
    invoke-direct {v2, v0, v1}, Lk1/z;-><init>(Lx1/b0;Lr1/b;)V

    .line 145
    .line 146
    .line 147
    iget-object p1, p1, Lk1/E;->e:Lz1/a;

    .line 148
    .line 149
    new-instance v0, Lk1/e;

    .line 150
    .line 151
    invoke-virtual {p1}, Lz1/a;->b()[B

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    invoke-direct {v0, v2, p1}, Lk1/e;-><init>(Lj1/a;[B)V

    .line 156
    .line 157
    .line 158
    return-object v0

    .line 159
    :catch_1
    move-exception p1

    .line 160
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 161
    .line 162
    invoke-direct {v0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/Throwable;)V

    .line 163
    .line 164
    .line 165
    throw v0

    .line 166
    :pswitch_3
    check-cast p1, Lk1/B;

    .line 167
    .line 168
    iget-object v0, p1, Lk1/B;->d:Lk1/C;

    .line 169
    .line 170
    iget-object v0, v0, Lk1/C;->a:Ljava/lang/String;

    .line 171
    .line 172
    invoke-static {v0}, Lj1/g;->a(Ljava/lang/String;)Lr1/c;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    iget-object v1, p1, Lk1/B;->d:Lk1/C;

    .line 177
    .line 178
    iget-object v1, v1, Lk1/C;->a:Ljava/lang/String;

    .line 179
    .line 180
    invoke-virtual {v0, v1}, Lr1/c;->b(Ljava/lang/String;)Lr1/b;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    iget-object p1, p1, Lk1/B;->e:Lz1/a;

    .line 185
    .line 186
    new-instance v1, Lk1/e;

    .line 187
    .line 188
    invoke-virtual {p1}, Lz1/a;->b()[B

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    invoke-direct {v1, v0, p1}, Lk1/e;-><init>(Lj1/a;[B)V

    .line 193
    .line 194
    .line 195
    return-object v1

    .line 196
    :pswitch_4
    check-cast p1, Lk1/v;

    .line 197
    .line 198
    :try_start_2
    invoke-static {}, Ll1/h;->c()Ljavax/crypto/Cipher;
    :try_end_2
    .catch Ljava/security/GeneralSecurityException; {:try_start_2 .. :try_end_2} :catch_2

    .line 199
    .line 200
    .line 201
    invoke-static {}, Ll1/h;->c()Ljavax/crypto/Cipher;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    new-instance v1, Ll1/h;

    .line 206
    .line 207
    iget-object v2, p1, Lk1/v;->e:Lio/flutter/plugin/editing/j;

    .line 208
    .line 209
    iget-object v2, v2, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 210
    .line 211
    check-cast v2, Lz1/a;

    .line 212
    .line 213
    invoke-virtual {v2}, Lz1/a;->b()[B

    .line 214
    .line 215
    .line 216
    move-result-object v2

    .line 217
    iget-object p1, p1, Lk1/v;->f:Lz1/a;

    .line 218
    .line 219
    invoke-virtual {p1}, Lz1/a;->b()[B

    .line 220
    .line 221
    .line 222
    move-result-object p1

    .line 223
    invoke-virtual {v0}, Ljavax/crypto/Cipher;->getProvider()Ljava/security/Provider;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    invoke-direct {v1, v2, p1, v0}, Ll1/h;-><init>([B[BLjava/security/Provider;)V

    .line 228
    .line 229
    .line 230
    goto :goto_1

    .line 231
    :catch_2
    new-instance v1, Lk1/e;

    .line 232
    .line 233
    iget-object v0, p1, Lk1/v;->e:Lio/flutter/plugin/editing/j;

    .line 234
    .line 235
    iget-object v0, v0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 236
    .line 237
    check-cast v0, Lz1/a;

    .line 238
    .line 239
    invoke-virtual {v0}, Lz1/a;->b()[B

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    iget-object p1, p1, Lk1/v;->f:Lz1/a;

    .line 244
    .line 245
    invoke-virtual {p1}, Lz1/a;->b()[B

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    invoke-direct {v1, v3, v0, p1}, Lk1/e;-><init>(I[B[B)V

    .line 250
    .line 251
    .line 252
    :goto_1
    return-object v1

    .line 253
    :pswitch_5
    check-cast p1, Lk1/s;

    .line 254
    .line 255
    sget-object v0, Lm1/a;->a:LV0/i;

    .line 256
    .line 257
    new-instance v0, Ll1/b;

    .line 258
    .line 259
    const/16 v1, 0x17

    .line 260
    .line 261
    invoke-direct {v0, v1}, Ll1/b;-><init>(I)V

    .line 262
    .line 263
    .line 264
    sget-object v1, Ll1/f;->d:[B

    .line 265
    .line 266
    invoke-static {}, Ll1/b;->a()Ljavax/crypto/Cipher;

    .line 267
    .line 268
    .line 269
    move-result-object v1

    .line 270
    invoke-static {v1}, Ll1/f;->c(Ljavax/crypto/Cipher;)Z

    .line 271
    .line 272
    .line 273
    move-result v1

    .line 274
    if-eqz v1, :cond_1

    .line 275
    .line 276
    new-instance v1, Ll1/f;

    .line 277
    .line 278
    iget-object v2, p1, Lk1/s;->e:Lio/flutter/plugin/editing/j;

    .line 279
    .line 280
    iget-object v2, v2, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 281
    .line 282
    check-cast v2, Lz1/a;

    .line 283
    .line 284
    invoke-virtual {v2}, Lz1/a;->b()[B

    .line 285
    .line 286
    .line 287
    move-result-object v2

    .line 288
    iget-object p1, p1, Lk1/s;->f:Lz1/a;

    .line 289
    .line 290
    invoke-virtual {p1}, Lz1/a;->b()[B

    .line 291
    .line 292
    .line 293
    move-result-object p1

    .line 294
    invoke-direct {v1, v2, p1, v0}, Ll1/f;-><init>([B[BLl1/b;)V

    .line 295
    .line 296
    .line 297
    return-object v1

    .line 298
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 299
    .line 300
    const-string v0, "Cipher does not implement AES GCM SIV."

    .line 301
    .line 302
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 303
    .line 304
    .line 305
    throw p1

    .line 306
    :pswitch_6
    check-cast p1, Lk1/p;

    .line 307
    .line 308
    iget-object v0, p1, Lk1/p;->d:Lk1/r;

    .line 309
    .line 310
    iget v1, v0, Lk1/r;->b:I

    .line 311
    .line 312
    iget v3, v0, Lk1/r;->c:I

    .line 313
    .line 314
    if-ne v1, v4, :cond_3

    .line 315
    .line 316
    if-ne v3, v2, :cond_2

    .line 317
    .line 318
    new-instance v0, Lk1/e;

    .line 319
    .line 320
    iget-object v1, p1, Lk1/p;->e:Lio/flutter/plugin/editing/j;

    .line 321
    .line 322
    iget-object v1, v1, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 323
    .line 324
    check-cast v1, Lz1/a;

    .line 325
    .line 326
    invoke-virtual {v1}, Lz1/a;->b()[B

    .line 327
    .line 328
    .line 329
    move-result-object v1

    .line 330
    iget-object p1, p1, Lk1/p;->f:Lz1/a;

    .line 331
    .line 332
    invoke-direct {v0, v1, p1}, Lk1/e;-><init>([BLz1/a;)V

    .line 333
    .line 334
    .line 335
    return-object v0

    .line 336
    :cond_2
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 337
    .line 338
    new-instance v0, Ljava/lang/StringBuilder;

    .line 339
    .line 340
    const-string v1, "Expected tag Size 16, got "

    .line 341
    .line 342
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 343
    .line 344
    .line 345
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 346
    .line 347
    .line 348
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 349
    .line 350
    .line 351
    move-result-object v0

    .line 352
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 353
    .line 354
    .line 355
    throw p1

    .line 356
    :cond_3
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 357
    .line 358
    new-instance v1, Ljava/lang/StringBuilder;

    .line 359
    .line 360
    const-string v2, "Expected IV Size 12, got "

    .line 361
    .line 362
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 363
    .line 364
    .line 365
    iget v0, v0, Lk1/r;->b:I

    .line 366
    .line 367
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 368
    .line 369
    .line 370
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 371
    .line 372
    .line 373
    move-result-object v0

    .line 374
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 375
    .line 376
    .line 377
    throw p1

    .line 378
    :pswitch_7
    check-cast p1, Lk1/m;

    .line 379
    .line 380
    sget-object v0, Ly1/b;->e:LV0/i;

    .line 381
    .line 382
    invoke-static {v1}, LE1/j;->e(I)Z

    .line 383
    .line 384
    .line 385
    move-result v0

    .line 386
    if-eqz v0, :cond_5

    .line 387
    .line 388
    iget-object v0, p1, Lk1/m;->d:Lk1/o;

    .line 389
    .line 390
    iget v1, v0, Lk1/o;->c:I

    .line 391
    .line 392
    if-ne v1, v2, :cond_4

    .line 393
    .line 394
    new-instance v1, Ly1/b;

    .line 395
    .line 396
    iget-object v2, p1, Lk1/m;->e:Lio/flutter/plugin/editing/j;

    .line 397
    .line 398
    iget-object v2, v2, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 399
    .line 400
    check-cast v2, Lz1/a;

    .line 401
    .line 402
    invoke-virtual {v2}, Lz1/a;->b()[B

    .line 403
    .line 404
    .line 405
    move-result-object v2

    .line 406
    iget v0, v0, Lk1/o;->b:I

    .line 407
    .line 408
    iget-object p1, p1, Lk1/m;->f:Lz1/a;

    .line 409
    .line 410
    invoke-virtual {p1}, Lz1/a;->b()[B

    .line 411
    .line 412
    .line 413
    move-result-object p1

    .line 414
    invoke-direct {v1, v0, v2, p1}, Ly1/b;-><init>(I[B[B)V

    .line 415
    .line 416
    .line 417
    return-object v1

    .line 418
    :cond_4
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 419
    .line 420
    new-instance v1, Ljava/lang/StringBuilder;

    .line 421
    .line 422
    const-string v2, "AesEaxJce only supports 16 byte tag size, not "

    .line 423
    .line 424
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 425
    .line 426
    .line 427
    iget v0, v0, Lk1/o;->c:I

    .line 428
    .line 429
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 430
    .line 431
    .line 432
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 433
    .line 434
    .line 435
    move-result-object v0

    .line 436
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 437
    .line 438
    .line 439
    throw p1

    .line 440
    :cond_5
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 441
    .line 442
    const-string v0, "Can not use AES-EAX in FIPS-mode."

    .line 443
    .line 444
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 445
    .line 446
    .line 447
    throw p1

    .line 448
    :pswitch_8
    check-cast p1, Lk1/g;

    .line 449
    .line 450
    new-instance v0, Ly1/f;

    .line 451
    .line 452
    new-instance v1, Ly1/a;

    .line 453
    .line 454
    iget-object v2, p1, Lk1/g;->e:Lio/flutter/plugin/editing/j;

    .line 455
    .line 456
    iget-object v2, v2, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 457
    .line 458
    check-cast v2, Lz1/a;

    .line 459
    .line 460
    invoke-virtual {v2}, Lz1/a;->b()[B

    .line 461
    .line 462
    .line 463
    move-result-object v2

    .line 464
    iget-object v3, p1, Lk1/g;->d:Lk1/l;

    .line 465
    .line 466
    iget v4, v3, Lk1/l;->c:I

    .line 467
    .line 468
    invoke-direct {v1, v4, v2}, Ly1/a;-><init>(I[B)V

    .line 469
    .line 470
    .line 471
    new-instance v2, Ly1/m;

    .line 472
    .line 473
    new-instance v4, Ly1/l;

    .line 474
    .line 475
    new-instance v5, Ljava/lang/StringBuilder;

    .line 476
    .line 477
    const-string v6, "HMAC"

    .line 478
    .line 479
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 480
    .line 481
    .line 482
    iget-object v7, v3, Lk1/l;->f:Lk1/k;

    .line 483
    .line 484
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 485
    .line 486
    .line 487
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 488
    .line 489
    .line 490
    move-result-object v5

    .line 491
    new-instance v7, Ljavax/crypto/spec/SecretKeySpec;

    .line 492
    .line 493
    iget-object v8, p1, Lk1/g;->f:Lio/flutter/plugin/editing/j;

    .line 494
    .line 495
    iget-object v8, v8, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 496
    .line 497
    check-cast v8, Lz1/a;

    .line 498
    .line 499
    invoke-virtual {v8}, Lz1/a;->b()[B

    .line 500
    .line 501
    .line 502
    move-result-object v8

    .line 503
    invoke-direct {v7, v8, v6}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 504
    .line 505
    .line 506
    invoke-direct {v4, v5, v7}, Ly1/l;-><init>(Ljava/lang/String;Ljavax/crypto/spec/SecretKeySpec;)V

    .line 507
    .line 508
    .line 509
    iget v3, v3, Lk1/l;->d:I

    .line 510
    .line 511
    invoke-direct {v2, v4, v3}, Ly1/m;-><init>(Ly1/l;I)V

    .line 512
    .line 513
    .line 514
    iget-object p1, p1, Lk1/g;->g:Lz1/a;

    .line 515
    .line 516
    invoke-virtual {p1}, Lz1/a;->b()[B

    .line 517
    .line 518
    .line 519
    move-result-object p1

    .line 520
    invoke-direct {v0, v1, v2, v3, p1}, Ly1/f;-><init>(Ly1/a;Ly1/m;I[B)V

    .line 521
    .line 522
    .line 523
    return-object v0

    .line 524
    :pswitch_9
    check-cast p1, Ls1/i;

    .line 525
    .line 526
    iget-object p1, p1, Ls1/i;->d:Ls1/G;

    .line 527
    .line 528
    invoke-static {p1}, Ls1/i;->d0(Ls1/G;)V

    .line 529
    .line 530
    .line 531
    iget-object v0, p1, Ls1/G;->f:Ljava/lang/Integer;

    .line 532
    .line 533
    sget-object v2, Ls1/b;->d:Ls1/b;

    .line 534
    .line 535
    iget-object v4, p1, Ls1/G;->a:Ljava/lang/String;

    .line 536
    .line 537
    const-class v6, Lj1/a;

    .line 538
    .line 539
    invoke-virtual {v2, v6, v4}, Ls1/b;->a(Ljava/lang/Class;Ljava/lang/String;)Ls1/g;

    .line 540
    .line 541
    .line 542
    move-result-object v2

    .line 543
    iget-object v4, p1, Ls1/G;->c:Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 544
    .line 545
    invoke-virtual {v2, v4}, Ls1/g;->a(Lcom/google/crypto/tink/shaded/protobuf/i;)Ljava/lang/Object;

    .line 546
    .line 547
    .line 548
    move-result-object v2

    .line 549
    check-cast v2, Lj1/a;

    .line 550
    .line 551
    iget-object p1, p1, Ls1/G;->e:Lx1/t0;

    .line 552
    .line 553
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 554
    .line 555
    .line 556
    move-result v4

    .line 557
    if-eq v4, v1, :cond_9

    .line 558
    .line 559
    const/4 v1, 0x2

    .line 560
    if-eq v4, v1, :cond_8

    .line 561
    .line 562
    if-eq v4, v3, :cond_7

    .line 563
    .line 564
    if-ne v4, v5, :cond_6

    .line 565
    .line 566
    goto :goto_2

    .line 567
    :cond_6
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 568
    .line 569
    new-instance v1, Ljava/lang/StringBuilder;

    .line 570
    .line 571
    const-string v2, "unknown output prefix type "

    .line 572
    .line 573
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 574
    .line 575
    .line 576
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 577
    .line 578
    .line 579
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 580
    .line 581
    .line 582
    move-result-object p1

    .line 583
    invoke-direct {v0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 584
    .line 585
    .line 586
    throw v0

    .line 587
    :cond_7
    sget-object p1, Ls1/t;->a:Lz1/a;

    .line 588
    .line 589
    invoke-virtual {p1}, Lz1/a;->b()[B

    .line 590
    .line 591
    .line 592
    move-result-object p1

    .line 593
    goto :goto_3

    .line 594
    :cond_8
    :goto_2
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 595
    .line 596
    .line 597
    move-result p1

    .line 598
    invoke-static {p1}, Ls1/t;->a(I)Lz1/a;

    .line 599
    .line 600
    .line 601
    move-result-object p1

    .line 602
    invoke-virtual {p1}, Lz1/a;->b()[B

    .line 603
    .line 604
    .line 605
    move-result-object p1

    .line 606
    goto :goto_3

    .line 607
    :cond_9
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 608
    .line 609
    .line 610
    move-result p1

    .line 611
    invoke-static {p1}, Ls1/t;->b(I)Lz1/a;

    .line 612
    .line 613
    .line 614
    move-result-object p1

    .line 615
    invoke-virtual {p1}, Lz1/a;->b()[B

    .line 616
    .line 617
    .line 618
    move-result-object p1

    .line 619
    :goto_3
    new-instance v0, Lk1/e;

    .line 620
    .line 621
    invoke-direct {v0, v2, p1}, Lk1/e;-><init>(Lj1/a;[B)V

    .line 622
    .line 623
    .line 624
    return-object v0

    .line 625
    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public f(Ls1/G;)Landroid/support/v4/media/session/a;
    .locals 5

    .line 1
    iget v0, p0, Lb2/f;->e:I

    .line 2
    .line 3
    sparse-switch v0, :sswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Ls1/G;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, "type.googleapis.com/google.crypto.tink.AesCtrHmacAeadKey"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_3

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
    invoke-static {v0, v1}, Lx1/h;->F(Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/h;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lx1/h;->D()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_2

    .line 31
    .line 32
    invoke-virtual {v0}, Lx1/h;->B()Lx1/l;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1}, Lx1/l;->E()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-nez v1, :cond_1

    .line 41
    .line 42
    invoke-virtual {v0}, Lx1/h;->C()Lx1/Q;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1}, Lx1/Q;->E()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-nez v1, :cond_0

    .line 51
    .line 52
    invoke-static {}, Lk1/l;->b()LD1/x;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0}, Lx1/h;->B()Lx1/l;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v2}, Lx1/l;->C()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/i;->size()I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    invoke-virtual {v1, v2}, LD1/x;->o(I)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Lx1/h;->C()Lx1/Q;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v2}, Lx1/Q;->C()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/i;->size()I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    invoke-virtual {v1, v2}, LD1/x;->q(I)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0}, Lx1/h;->B()Lx1/l;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {v2}, Lx1/l;->D()Lx1/p;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-virtual {v2}, Lx1/p;->B()I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    invoke-virtual {v1, v2}, LD1/x;->r(I)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0}, Lx1/h;->C()Lx1/Q;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-virtual {v2}, Lx1/Q;->D()Lx1/V;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-virtual {v2}, Lx1/V;->D()I

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    invoke-virtual {v1, v2}, LD1/x;->t(I)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0}, Lx1/h;->C()Lx1/Q;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    invoke-virtual {v2}, Lx1/Q;->D()Lx1/V;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    invoke-virtual {v2}, Lx1/V;->C()Lx1/O;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-static {v2}, Ll1/a;->b(Lx1/O;)Lk1/k;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    iput-object v2, v1, LD1/x;->e:Ljava/lang/Object;

    .line 133
    .line 134
    iget-object v2, p1, Ls1/G;->e:Lx1/t0;

    .line 135
    .line 136
    invoke-static {v2}, Ll1/a;->d(Lx1/t0;)Lk1/k;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    iput-object v2, v1, LD1/x;->f:Ljava/lang/Object;

    .line 141
    .line 142
    invoke-virtual {v1}, LD1/x;->i()Lk1/l;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    new-instance v2, LV1/y;

    .line 147
    .line 148
    const/16 v3, 0xa

    .line 149
    .line 150
    const/4 v4, 0x0

    .line 151
    invoke-direct {v2, v3, v4}, LV1/y;-><init>(IZ)V

    .line 152
    .line 153
    .line 154
    const/4 v3, 0x0

    .line 155
    iput-object v3, v2, LV1/y;->g:Ljava/lang/Object;

    .line 156
    .line 157
    iput-object v3, v2, LV1/y;->h:Ljava/lang/Object;

    .line 158
    .line 159
    iput-object v3, v2, LV1/y;->i:Ljava/lang/Object;

    .line 160
    .line 161
    iput-object v1, v2, LV1/y;->f:Ljava/lang/Object;

    .line 162
    .line 163
    invoke-virtual {v0}, Lx1/h;->B()Lx1/l;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    invoke-virtual {v1}, Lx1/l;->C()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/i;->f()[B

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    new-instance v3, Lio/flutter/plugin/editing/j;

    .line 176
    .line 177
    invoke-static {v1}, Lz1/a;->a([B)Lz1/a;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    const/16 v4, 0x17

    .line 182
    .line 183
    invoke-direct {v3, v4, v1}, Lio/flutter/plugin/editing/j;-><init>(ILjava/lang/Object;)V

    .line 184
    .line 185
    .line 186
    iput-object v3, v2, LV1/y;->g:Ljava/lang/Object;

    .line 187
    .line 188
    invoke-virtual {v0}, Lx1/h;->C()Lx1/Q;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-virtual {v0}, Lx1/Q;->C()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/i;->f()[B

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    new-instance v1, Lio/flutter/plugin/editing/j;

    .line 201
    .line 202
    invoke-static {v0}, Lz1/a;->a([B)Lz1/a;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    const/16 v3, 0x17

    .line 207
    .line 208
    invoke-direct {v1, v3, v0}, Lio/flutter/plugin/editing/j;-><init>(ILjava/lang/Object;)V

    .line 209
    .line 210
    .line 211
    iput-object v1, v2, LV1/y;->h:Ljava/lang/Object;

    .line 212
    .line 213
    iget-object p1, p1, Ls1/G;->f:Ljava/lang/Integer;

    .line 214
    .line 215
    iput-object p1, v2, LV1/y;->i:Ljava/lang/Object;

    .line 216
    .line 217
    invoke-virtual {v2}, LV1/y;->e()Lk1/g;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    return-object p1

    .line 222
    :cond_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 223
    .line 224
    const-string v0, "Only version 0 keys inner HMAC keys are accepted"

    .line 225
    .line 226
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    throw p1

    .line 230
    :cond_1
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 231
    .line 232
    const-string v0, "Only version 0 keys inner AES CTR keys are accepted"

    .line 233
    .line 234
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    throw p1

    .line 238
    :cond_2
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 239
    .line 240
    const-string v0, "Only version 0 keys are accepted"

    .line 241
    .line 242
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    throw p1
    :try_end_0
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_0 .. :try_end_0} :catch_0

    .line 246
    :catch_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 247
    .line 248
    const-string v0, "Parsing AesCtrHmacAeadKey failed"

    .line 249
    .line 250
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    throw p1

    .line 254
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 255
    .line 256
    const-string v0, "Wrong type URL in call to AesCtrHmacAeadProtoSerialization.parseKey"

    .line 257
    .line 258
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    throw p1

    .line 262
    :sswitch_0
    const-string v0, "KmsEnvelopeAeadKeys are only accepted with version 0, got "

    .line 263
    .line 264
    iget-object v1, p1, Ls1/G;->a:Ljava/lang/String;

    .line 265
    .line 266
    const-string v2, "type.googleapis.com/google.crypto.tink.KmsEnvelopeAeadKey"

    .line 267
    .line 268
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 269
    .line 270
    .line 271
    move-result v1

    .line 272
    if-eqz v1, :cond_5

    .line 273
    .line 274
    :try_start_1
    iget-object v1, p1, Ls1/G;->c:Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 275
    .line 276
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/o;->a()Lcom/google/crypto/tink/shaded/protobuf/o;

    .line 277
    .line 278
    .line 279
    move-result-object v2

    .line 280
    invoke-static {v1, v2}, Lx1/q0;->D(Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/q0;

    .line 281
    .line 282
    .line 283
    move-result-object v1

    .line 284
    invoke-virtual {v1}, Lx1/q0;->B()I

    .line 285
    .line 286
    .line 287
    move-result v2

    .line 288
    if-nez v2, :cond_4

    .line 289
    .line 290
    invoke-virtual {v1}, Lx1/q0;->A()Lx1/s0;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    iget-object v1, p1, Ls1/G;->e:Lx1/t0;

    .line 295
    .line 296
    invoke-static {v0, v1}, Lk1/G;->a(Lx1/s0;Lx1/t0;)Lk1/F;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    iget-object p1, p1, Ls1/G;->f:Ljava/lang/Integer;

    .line 301
    .line 302
    invoke-static {v0, p1}, Lk1/E;->d0(Lk1/F;Ljava/lang/Integer;)Lk1/E;

    .line 303
    .line 304
    .line 305
    move-result-object p1

    .line 306
    return-object p1

    .line 307
    :catch_1
    move-exception p1

    .line 308
    goto :goto_0

    .line 309
    :cond_4
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 310
    .line 311
    new-instance v2, Ljava/lang/StringBuilder;

    .line 312
    .line 313
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 314
    .line 315
    .line 316
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 324
    .line 325
    .line 326
    throw p1
    :try_end_1
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_1 .. :try_end_1} :catch_1

    .line 327
    :goto_0
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 328
    .line 329
    const-string v1, "Parsing KmsEnvelopeAeadKey failed: "

    .line 330
    .line 331
    invoke-direct {v0, v1, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 332
    .line 333
    .line 334
    throw v0

    .line 335
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 336
    .line 337
    const-string v0, "Wrong type URL in call to LegacyKmsEnvelopeAeadProtoSerialization.parseKey"

    .line 338
    .line 339
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 340
    .line 341
    .line 342
    throw p1

    .line 343
    :sswitch_1
    const-string v0, "KmsAeadKey are only accepted with version 0, got "

    .line 344
    .line 345
    iget-object v1, p1, Ls1/G;->a:Ljava/lang/String;

    .line 346
    .line 347
    const-string v2, "type.googleapis.com/google.crypto.tink.KmsAeadKey"

    .line 348
    .line 349
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 350
    .line 351
    .line 352
    move-result v1

    .line 353
    if-eqz v1, :cond_7

    .line 354
    .line 355
    :try_start_2
    iget-object v1, p1, Ls1/G;->c:Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 356
    .line 357
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/o;->a()Lcom/google/crypto/tink/shaded/protobuf/o;

    .line 358
    .line 359
    .line 360
    move-result-object v2

    .line 361
    invoke-static {v1, v2}, Lx1/m0;->D(Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/m0;

    .line 362
    .line 363
    .line 364
    move-result-object v1

    .line 365
    invoke-virtual {v1}, Lx1/m0;->B()I

    .line 366
    .line 367
    .line 368
    move-result v2

    .line 369
    if-nez v2, :cond_6

    .line 370
    .line 371
    invoke-virtual {v1}, Lx1/m0;->A()Lx1/o0;

    .line 372
    .line 373
    .line 374
    move-result-object v0

    .line 375
    invoke-virtual {v0}, Lx1/o0;->B()Ljava/lang/String;

    .line 376
    .line 377
    .line 378
    move-result-object v0

    .line 379
    iget-object v1, p1, Ls1/G;->e:Lx1/t0;

    .line 380
    .line 381
    invoke-static {v1}, Lk1/D;->b(Lx1/t0;)Lk1/k;

    .line 382
    .line 383
    .line 384
    move-result-object v1

    .line 385
    new-instance v2, Lk1/C;

    .line 386
    .line 387
    invoke-direct {v2, v0, v1}, Lk1/C;-><init>(Ljava/lang/String;Lk1/k;)V

    .line 388
    .line 389
    .line 390
    iget-object p1, p1, Ls1/G;->f:Ljava/lang/Integer;

    .line 391
    .line 392
    invoke-static {v2, p1}, Lk1/B;->d0(Lk1/C;Ljava/lang/Integer;)Lk1/B;

    .line 393
    .line 394
    .line 395
    move-result-object p1

    .line 396
    return-object p1

    .line 397
    :catch_2
    move-exception p1

    .line 398
    goto :goto_1

    .line 399
    :cond_6
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 400
    .line 401
    new-instance v2, Ljava/lang/StringBuilder;

    .line 402
    .line 403
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 404
    .line 405
    .line 406
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 407
    .line 408
    .line 409
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 410
    .line 411
    .line 412
    move-result-object v0

    .line 413
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 414
    .line 415
    .line 416
    throw p1
    :try_end_2
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_2 .. :try_end_2} :catch_2

    .line 417
    :goto_1
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 418
    .line 419
    const-string v1, "Parsing KmsAeadKey failed: "

    .line 420
    .line 421
    invoke-direct {v0, v1, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 422
    .line 423
    .line 424
    throw v0

    .line 425
    :cond_7
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 426
    .line 427
    const-string v0, "Wrong type URL in call to LegacyKmsAeadProtoSerialization.parseKey"

    .line 428
    .line 429
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 430
    .line 431
    .line 432
    throw p1

    .line 433
    :sswitch_data_0
    .sparse-switch
        0x12 -> :sswitch_1
        0x16 -> :sswitch_0
    .end sparse-switch
.end method

.method public g()Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Lb2/f;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 9
    .line 10
    .line 11
    return-object v0

    .line 12
    :pswitch_0
    new-instance v0, Ljava/util/TreeMap;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    .line 15
    .line 16
    .line 17
    return-object v0

    .line 18
    :pswitch_1
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    return-object v0

    .line 24
    :pswitch_2
    new-instance v0, Ljava/util/concurrent/ConcurrentSkipListMap;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentSkipListMap;-><init>()V

    .line 27
    .line 28
    .line 29
    return-object v0

    .line 30
    :pswitch_3
    new-instance v0, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    return-object v0

    .line 36
    nop

    .line 37
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
