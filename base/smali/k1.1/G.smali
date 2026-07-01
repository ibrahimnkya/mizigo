.class public abstract Lk1/G;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ls1/w;

.field public static final b:Ls1/u;

.field public static final c:Ls1/e;

.field public static final d:Ls1/c;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const-string v0, "type.googleapis.com/google.crypto.tink.KmsEnvelopeAeadKey"

    .line 2
    .line 3
    invoke-static {v0}, Ls1/N;->c(Ljava/lang/String;)Lz1/a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lb2/f;

    .line 8
    .line 9
    const/16 v2, 0x13

    .line 10
    .line 11
    invoke-direct {v1, v2}, Lb2/f;-><init>(I)V

    .line 12
    .line 13
    .line 14
    new-instance v2, Ls1/w;

    .line 15
    .line 16
    const-class v3, Lk1/F;

    .line 17
    .line 18
    invoke-direct {v2, v3, v1}, Ls1/w;-><init>(Ljava/lang/Class;Ls1/x;)V

    .line 19
    .line 20
    .line 21
    sput-object v2, Lk1/G;->a:Ls1/w;

    .line 22
    .line 23
    new-instance v1, Lb2/f;

    .line 24
    .line 25
    const/16 v2, 0x14

    .line 26
    .line 27
    invoke-direct {v1, v2}, Lb2/f;-><init>(I)V

    .line 28
    .line 29
    .line 30
    new-instance v2, Ls1/u;

    .line 31
    .line 32
    invoke-direct {v2, v0, v1}, Ls1/u;-><init>(Lz1/a;Ls1/v;)V

    .line 33
    .line 34
    .line 35
    sput-object v2, Lk1/G;->b:Ls1/u;

    .line 36
    .line 37
    new-instance v1, Lb2/f;

    .line 38
    .line 39
    const/16 v2, 0x15

    .line 40
    .line 41
    invoke-direct {v1, v2}, Lb2/f;-><init>(I)V

    .line 42
    .line 43
    .line 44
    new-instance v2, Ls1/e;

    .line 45
    .line 46
    const-class v3, Lk1/E;

    .line 47
    .line 48
    invoke-direct {v2, v3, v1}, Ls1/e;-><init>(Ljava/lang/Class;Ls1/f;)V

    .line 49
    .line 50
    .line 51
    sput-object v2, Lk1/G;->c:Ls1/e;

    .line 52
    .line 53
    new-instance v1, Lb2/f;

    .line 54
    .line 55
    const/16 v2, 0x16

    .line 56
    .line 57
    invoke-direct {v1, v2}, Lb2/f;-><init>(I)V

    .line 58
    .line 59
    .line 60
    new-instance v2, Ls1/c;

    .line 61
    .line 62
    invoke-direct {v2, v0, v1}, Ls1/c;-><init>(Lz1/a;Ls1/d;)V

    .line 63
    .line 64
    .line 65
    sput-object v2, Lk1/G;->d:Ls1/c;

    .line 66
    .line 67
    return-void
.end method

.method public static a(Lx1/s0;Lx1/t0;)Lk1/F;
    .locals 11

    .line 1
    sget-object v0, Lk1/k;->F:Lk1/k;

    .line 2
    .line 3
    sget-object v1, Lk1/k;->D:Lk1/k;

    .line 4
    .line 5
    sget-object v2, Lk1/k;->C:Lk1/k;

    .line 6
    .line 7
    sget-object v3, Lk1/k;->B:Lk1/k;

    .line 8
    .line 9
    sget-object v4, Lk1/k;->z:Lk1/k;

    .line 10
    .line 11
    sget-object v5, Lk1/k;->A:Lk1/k;

    .line 12
    .line 13
    sget-object v6, Lk1/k;->y:Lk1/k;

    .line 14
    .line 15
    invoke-static {}, Lx1/b0;->G()Lx1/a0;

    .line 16
    .line 17
    .line 18
    move-result-object v7

    .line 19
    invoke-virtual {p0}, Lx1/s0;->C()Lx1/b0;

    .line 20
    .line 21
    .line 22
    move-result-object v8

    .line 23
    invoke-virtual {v8}, Lx1/b0;->E()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v8

    .line 27
    invoke-virtual {v7, v8}, Lx1/a0;->i(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lx1/s0;->C()Lx1/b0;

    .line 31
    .line 32
    .line 33
    move-result-object v8

    .line 34
    invoke-virtual {v8}, Lx1/b0;->F()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 35
    .line 36
    .line 37
    move-result-object v8

    .line 38
    invoke-virtual {v7, v8}, Lx1/a0;->j(Lcom/google/crypto/tink/shaded/protobuf/i;)V

    .line 39
    .line 40
    .line 41
    sget-object v8, Lx1/t0;->i:Lx1/t0;

    .line 42
    .line 43
    invoke-virtual {v7, v8}, Lx1/a0;->h(Lx1/t0;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v7}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 47
    .line 48
    .line 49
    move-result-object v7

    .line 50
    check-cast v7, Lx1/b0;

    .line 51
    .line 52
    invoke-virtual {v7}, Lcom/google/crypto/tink/shaded/protobuf/a;->e()[B

    .line 53
    .line 54
    .line 55
    move-result-object v7

    .line 56
    invoke-static {v7}, LT0/a;->E([B)Lj1/i;

    .line 57
    .line 58
    .line 59
    move-result-object v7

    .line 60
    instance-of v8, v7, Lk1/r;

    .line 61
    .line 62
    if-eqz v8, :cond_0

    .line 63
    .line 64
    move-object v8, v6

    .line 65
    goto :goto_0

    .line 66
    :cond_0
    instance-of v8, v7, Lk1/x;

    .line 67
    .line 68
    if-eqz v8, :cond_1

    .line 69
    .line 70
    move-object v8, v5

    .line 71
    goto :goto_0

    .line 72
    :cond_1
    instance-of v8, v7, Lk1/N;

    .line 73
    .line 74
    if-eqz v8, :cond_2

    .line 75
    .line 76
    move-object v8, v4

    .line 77
    goto :goto_0

    .line 78
    :cond_2
    instance-of v8, v7, Lk1/l;

    .line 79
    .line 80
    if-eqz v8, :cond_3

    .line 81
    .line 82
    move-object v8, v3

    .line 83
    goto :goto_0

    .line 84
    :cond_3
    instance-of v8, v7, Lk1/o;

    .line 85
    .line 86
    if-eqz v8, :cond_4

    .line 87
    .line 88
    move-object v8, v2

    .line 89
    goto :goto_0

    .line 90
    :cond_4
    instance-of v8, v7, Lk1/u;

    .line 91
    .line 92
    if-eqz v8, :cond_10

    .line 93
    .line 94
    move-object v8, v1

    .line 95
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 96
    .line 97
    .line 98
    move-result v9

    .line 99
    const/4 v10, 0x1

    .line 100
    if-eq v9, v10, :cond_6

    .line 101
    .line 102
    const/4 v10, 0x3

    .line 103
    if-ne v9, v10, :cond_5

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_5
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 107
    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    const-string v1, "Unable to parse OutputPrefixType: "

    .line 111
    .line 112
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1}, Lx1/t0;->b()I

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-direct {p0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    throw p0

    .line 130
    :cond_6
    sget-object v0, Lk1/k;->E:Lk1/k;

    .line 131
    .line 132
    :goto_1
    invoke-virtual {p0}, Lx1/s0;->D()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    check-cast v7, Lk1/c;

    .line 137
    .line 138
    if-eqz p0, :cond_f

    .line 139
    .line 140
    if-eqz v7, :cond_e

    .line 141
    .line 142
    invoke-virtual {v7}, Lj1/i;->a()Z

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    if-nez p1, :cond_d

    .line 147
    .line 148
    invoke-virtual {v8, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    if-eqz p1, :cond_7

    .line 153
    .line 154
    instance-of p1, v7, Lk1/r;

    .line 155
    .line 156
    if-eqz p1, :cond_7

    .line 157
    .line 158
    goto :goto_2

    .line 159
    :cond_7
    invoke-virtual {v8, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    if-eqz p1, :cond_8

    .line 164
    .line 165
    instance-of p1, v7, Lk1/x;

    .line 166
    .line 167
    if-eqz p1, :cond_8

    .line 168
    .line 169
    goto :goto_2

    .line 170
    :cond_8
    invoke-virtual {v8, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    move-result p1

    .line 174
    if-eqz p1, :cond_9

    .line 175
    .line 176
    instance-of p1, v7, Lk1/N;

    .line 177
    .line 178
    if-eqz p1, :cond_9

    .line 179
    .line 180
    goto :goto_2

    .line 181
    :cond_9
    invoke-virtual {v8, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result p1

    .line 185
    if-eqz p1, :cond_a

    .line 186
    .line 187
    instance-of p1, v7, Lk1/l;

    .line 188
    .line 189
    if-eqz p1, :cond_a

    .line 190
    .line 191
    goto :goto_2

    .line 192
    :cond_a
    invoke-virtual {v8, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    move-result p1

    .line 196
    if-eqz p1, :cond_b

    .line 197
    .line 198
    instance-of p1, v7, Lk1/o;

    .line 199
    .line 200
    if-eqz p1, :cond_b

    .line 201
    .line 202
    goto :goto_2

    .line 203
    :cond_b
    invoke-virtual {v8, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    move-result p1

    .line 207
    if-eqz p1, :cond_c

    .line 208
    .line 209
    instance-of p1, v7, Lk1/u;

    .line 210
    .line 211
    if-eqz p1, :cond_c

    .line 212
    .line 213
    :goto_2
    new-instance p1, Lk1/F;

    .line 214
    .line 215
    invoke-direct {p1, v0, p0, v8, v7}, Lk1/F;-><init>(Lk1/k;Ljava/lang/String;Lk1/k;Lk1/c;)V

    .line 216
    .line 217
    .line 218
    return-object p1

    .line 219
    :cond_c
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 220
    .line 221
    new-instance p1, Ljava/lang/StringBuilder;

    .line 222
    .line 223
    const-string v0, "Cannot use parsing strategy "

    .line 224
    .line 225
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    iget-object v0, v8, Lk1/k;->b:Ljava/lang/String;

    .line 229
    .line 230
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    const-string v0, " when new keys are picked according to "

    .line 234
    .line 235
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    const-string v0, "."

    .line 242
    .line 243
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    invoke-direct {p0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    throw p0

    .line 254
    :cond_d
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 255
    .line 256
    const-string p1, "dekParametersForNewKeys must not have ID Requirements"

    .line 257
    .line 258
    invoke-direct {p0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    throw p0

    .line 262
    :cond_e
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 263
    .line 264
    const-string p1, "dekParametersForNewKeys must be set"

    .line 265
    .line 266
    invoke-direct {p0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 267
    .line 268
    .line 269
    throw p0

    .line 270
    :cond_f
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 271
    .line 272
    const-string p1, "kekUri must be set"

    .line 273
    .line 274
    invoke-direct {p0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 275
    .line 276
    .line 277
    throw p0

    .line 278
    :cond_10
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 279
    .line 280
    new-instance p1, Ljava/lang/StringBuilder;

    .line 281
    .line 282
    const-string v0, "Unsupported DEK parameters when parsing "

    .line 283
    .line 284
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 288
    .line 289
    .line 290
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object p1

    .line 294
    invoke-direct {p0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 295
    .line 296
    .line 297
    throw p0
.end method

.method public static b(Lk1/F;)Lx1/s0;
    .locals 3

    .line 1
    iget-object v0, p0, Lk1/F;->d:Lk1/c;

    .line 2
    .line 3
    invoke-static {v0}, LT0/a;->I(Lj1/i;)[B

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :try_start_0
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/o;->a()Lcom/google/crypto/tink/shaded/protobuf/o;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v0, v1}, Lx1/b0;->I([BLcom/google/crypto/tink/shaded/protobuf/o;)Lx1/b0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {}, Lx1/s0;->E()Lx1/r0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object p0, p0, Lk1/F;->b:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 22
    .line 23
    .line 24
    iget-object v2, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 25
    .line 26
    check-cast v2, Lx1/s0;

    .line 27
    .line 28
    invoke-static {v2, p0}, Lx1/s0;->z(Lx1/s0;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 32
    .line 33
    .line 34
    iget-object p0, v1, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 35
    .line 36
    check-cast p0, Lx1/s0;

    .line 37
    .line 38
    invoke-static {p0, v0}, Lx1/s0;->A(Lx1/s0;Lx1/b0;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Lx1/s0;
    :try_end_0
    .catch Lcom/google/crypto/tink/shaded/protobuf/C; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    .line 47
    return-object p0

    .line 48
    :catch_0
    move-exception p0

    .line 49
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 50
    .line 51
    const-string v1, "Parsing KmsEnvelopeAeadKeyFormat failed: "

    .line 52
    .line 53
    invoke-direct {v0, v1, p0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    throw v0
.end method

.method public static c(Lk1/k;)Lx1/t0;
    .locals 3

    .line 1
    sget-object v0, Lk1/k;->E:Lk1/k;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lx1/t0;->g:Lx1/t0;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    sget-object v0, Lk1/k;->F:Lk1/k;

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    sget-object p0, Lx1/t0;->i:Lx1/t0;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 24
    .line 25
    new-instance v1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v2, "Unable to serialize variant: "

    .line 28
    .line 29
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-direct {v0, p0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    throw v0
.end method
