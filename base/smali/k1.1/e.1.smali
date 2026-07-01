.class public final Lk1/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj1/a;


# instance fields
.field public final synthetic a:I

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(I[B[B)V
    .locals 1

    iput p1, p0, Lk1/e;->a:I

    packed-switch p1, :pswitch_data_0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance p1, Ll1/l;

    const/4 v0, 0x0

    .line 3
    invoke-direct {p1, v0, p2}, Ll1/l;-><init>(I[B)V

    .line 4
    iput-object p1, p0, Lk1/e;->b:Ljava/lang/Object;

    .line 5
    iput-object p3, p0, Lk1/e;->c:Ljava/lang/Object;

    return-void

    .line 6
    :pswitch_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    new-instance p1, Ll1/l;

    const/4 v0, 0x1

    .line 8
    invoke-direct {p1, v0, p2}, Ll1/l;-><init>(I[B)V

    .line 9
    iput-object p1, p0, Lk1/e;->b:Ljava/lang/Object;

    .line 10
    iput-object p3, p0, Lk1/e;->c:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_0
    .end packed-switch
.end method

.method public constructor <init>(Lj1/a;[B)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lk1/e;->a:I

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lk1/e;->b:Ljava/lang/Object;

    .line 21
    array-length p1, p2

    if-eqz p1, :cond_1

    array-length p1, p2

    const/4 v0, 0x5

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 22
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "identifier has an invalid length"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 23
    :cond_1
    :goto_0
    iput-object p2, p0, Lk1/e;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lk1/d;Ls1/A;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lk1/e;->a:I

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lk1/e;->b:Ljava/lang/Object;

    .line 26
    iput-object p2, p0, Lk1/e;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>([BLz1/a;)V
    .locals 2

    const/4 v0, 0x2

    iput v0, p0, Lk1/e;->a:I

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    invoke-static {v0}, LE1/j;->f(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 13
    sget-object v0, Ll1/d;->a:LV0/i;

    .line 14
    array-length v0, p1

    invoke-static {v0}, Ly1/n;->a(I)V

    .line 15
    new-instance v0, Ljavax/crypto/spec/SecretKeySpec;

    const-string v1, "AES"

    invoke-direct {v0, p1, v1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 16
    iput-object v0, p0, Lk1/e;->b:Ljava/lang/Object;

    .line 17
    invoke-virtual {p2}, Lz1/a;->b()[B

    move-result-object p1

    iput-object p1, p0, Lk1/e;->c:Ljava/lang/Object;

    return-void

    .line 18
    :cond_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string p2, "Can not use AES-GCM in FIPS-mode, as BoringCrypto module is not available."

    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public final a([B[B)[B
    .locals 12

    .line 1
    iget v0, p0, Lk1/e;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    array-length v0, p1

    .line 7
    add-int/lit8 v0, v0, 0x28

    .line 8
    .line 9
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/16 v1, 0x18

    .line 14
    .line 15
    invoke-static {v1}, Ls1/I;->a(I)[B

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    .line 22
    iget-object v2, p0, Lk1/e;->b:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v2, Ll1/l;

    .line 25
    .line 26
    invoke-virtual {v2, v0, v1, p1, p2}, LI2/f;->b(Ljava/nio/ByteBuffer;[B[B[B)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object p2, p0, Lk1/e;->c:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast p2, [B

    .line 36
    .line 37
    array-length v0, p2

    .line 38
    if-nez v0, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    filled-new-array {p2, p1}, [[B

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->e([[B)[B

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    :goto_0
    return-object p1

    .line 50
    :pswitch_0
    array-length v0, p1

    .line 51
    add-int/lit8 v0, v0, 0x1c

    .line 52
    .line 53
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const/16 v1, 0xc

    .line 58
    .line 59
    invoke-static {v1}, Ls1/I;->a(I)[B

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 64
    .line 65
    .line 66
    iget-object v2, p0, Lk1/e;->b:Ljava/lang/Object;

    .line 67
    .line 68
    check-cast v2, Ll1/l;

    .line 69
    .line 70
    invoke-virtual {v2, v0, v1, p1, p2}, LI2/f;->b(Ljava/nio/ByteBuffer;[B[B[B)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iget-object p2, p0, Lk1/e;->c:Ljava/lang/Object;

    .line 78
    .line 79
    check-cast p2, [B

    .line 80
    .line 81
    array-length v0, p2

    .line 82
    if-nez v0, :cond_1

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_1
    filled-new-array {p2, p1}, [[B

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->e([[B)[B

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    :goto_1
    return-object p1

    .line 94
    :pswitch_1
    iget-object v0, p0, Lk1/e;->c:Ljava/lang/Object;

    .line 95
    .line 96
    check-cast v0, [B

    .line 97
    .line 98
    if-eqz p1, :cond_5

    .line 99
    .line 100
    const/16 v1, 0xc

    .line 101
    .line 102
    invoke-static {v1}, Ls1/I;->a(I)[B

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    array-length v3, v2

    .line 107
    const/4 v4, 0x0

    .line 108
    invoke-static {v2, v4, v3}, Ll1/d;->a([BII)Ljava/security/spec/AlgorithmParameterSpec;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    sget-object v5, Ll1/d;->a:LV0/i;

    .line 113
    .line 114
    invoke-virtual {v5}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    move-object v6, v5

    .line 119
    check-cast v6, Ljavax/crypto/Cipher;

    .line 120
    .line 121
    iget-object v5, p0, Lk1/e;->b:Ljava/lang/Object;

    .line 122
    .line 123
    check-cast v5, Ljavax/crypto/spec/SecretKeySpec;

    .line 124
    .line 125
    const/4 v7, 0x1

    .line 126
    invoke-virtual {v6, v7, v5, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 127
    .line 128
    .line 129
    if-eqz p2, :cond_2

    .line 130
    .line 131
    array-length v3, p2

    .line 132
    if-eqz v3, :cond_2

    .line 133
    .line 134
    invoke-virtual {v6, p2}, Ljavax/crypto/Cipher;->updateAAD([B)V

    .line 135
    .line 136
    .line 137
    :cond_2
    array-length p2, p1

    .line 138
    invoke-virtual {v6, p2}, Ljavax/crypto/Cipher;->getOutputSize(I)I

    .line 139
    .line 140
    .line 141
    move-result p2

    .line 142
    array-length v3, v0

    .line 143
    const v5, 0x7ffffff3

    .line 144
    .line 145
    .line 146
    sub-int/2addr v5, v3

    .line 147
    if-gt p2, v5, :cond_4

    .line 148
    .line 149
    array-length v3, v0

    .line 150
    add-int/2addr v3, v1

    .line 151
    add-int/2addr v3, p2

    .line 152
    invoke-static {v0, v3}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 153
    .line 154
    .line 155
    move-result-object v10

    .line 156
    array-length v3, v0

    .line 157
    invoke-static {v2, v4, v10, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 158
    .line 159
    .line 160
    array-length v9, p1

    .line 161
    array-length v0, v0

    .line 162
    add-int/lit8 v11, v0, 0xc

    .line 163
    .line 164
    const/4 v8, 0x0

    .line 165
    move-object v7, p1

    .line 166
    invoke-virtual/range {v6 .. v11}, Ljavax/crypto/Cipher;->doFinal([BII[BI)I

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    if-ne p1, p2, :cond_3

    .line 171
    .line 172
    return-object v10

    .line 173
    :cond_3
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 174
    .line 175
    const-string p2, "not enough data written"

    .line 176
    .line 177
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    throw p1

    .line 181
    :cond_4
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 182
    .line 183
    const-string p2, "plaintext too long"

    .line 184
    .line 185
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    throw p1

    .line 189
    :cond_5
    new-instance p1, Ljava/lang/NullPointerException;

    .line 190
    .line 191
    const-string p2, "plaintext is null"

    .line 192
    .line 193
    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    throw p1

    .line 197
    :pswitch_2
    move-object v7, p1

    .line 198
    iget-object p1, p0, Lk1/e;->b:Ljava/lang/Object;

    .line 199
    .line 200
    check-cast p1, Lj1/a;

    .line 201
    .line 202
    iget-object v0, p0, Lk1/e;->c:Ljava/lang/Object;

    .line 203
    .line 204
    check-cast v0, [B

    .line 205
    .line 206
    array-length v1, v0

    .line 207
    if-nez v1, :cond_6

    .line 208
    .line 209
    invoke-interface {p1, v7, p2}, Lj1/a;->a([B[B)[B

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    goto :goto_2

    .line 214
    :cond_6
    invoke-interface {p1, v7, p2}, Lj1/a;->a([B[B)[B

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    filled-new-array {v0, p1}, [[B

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->e([[B)[B

    .line 223
    .line 224
    .line 225
    move-result-object p1

    .line 226
    :goto_2
    return-object p1

    .line 227
    :pswitch_3
    move-object v7, p1

    .line 228
    iget-object p1, p0, Lk1/e;->b:Ljava/lang/Object;

    .line 229
    .line 230
    check-cast p1, Lk1/d;

    .line 231
    .line 232
    iget-object p1, p1, Lk1/d;->a:Lj1/a;

    .line 233
    .line 234
    invoke-interface {p1, v7, p2}, Lj1/a;->a([B[B)[B

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    array-length p2, v7

    .line 239
    return-object p1

    .line 240
    nop

    .line 241
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final b([B[B)[B
    .locals 6

    .line 1
    iget v0, p0, Lk1/e;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lk1/e;->c:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, [B

    .line 9
    .line 10
    array-length v1, v0

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2}, Lk1/e;->d([B[B)[B

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-static {v0, p1}, Ls1/N;->b([B[B)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    array-length v0, v0

    .line 25
    array-length v1, p1

    .line 26
    invoke-static {p1, v0, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1, p2}, Lk1/e;->d([B[B)[B

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    :goto_0
    return-object p1

    .line 35
    :cond_1
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 36
    .line 37
    const-string p2, "Decryption failed (OutputPrefix mismatch)."

    .line 38
    .line 39
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    throw p1

    .line 43
    :pswitch_0
    iget-object v0, p0, Lk1/e;->c:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v0, [B

    .line 46
    .line 47
    array-length v1, v0

    .line 48
    if-nez v1, :cond_2

    .line 49
    .line 50
    invoke-virtual {p0, p1, p2}, Lk1/e;->c([B[B)[B

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    goto :goto_1

    .line 55
    :cond_2
    invoke-static {v0, p1}, Ls1/N;->b([B[B)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_3

    .line 60
    .line 61
    array-length v0, v0

    .line 62
    array-length v1, p1

    .line 63
    invoke-static {p1, v0, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p0, p1, p2}, Lk1/e;->c([B[B)[B

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    :goto_1
    return-object p1

    .line 72
    :cond_3
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 73
    .line 74
    const-string p2, "Decryption failed (OutputPrefix mismatch)."

    .line 75
    .line 76
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    throw p1

    .line 80
    :pswitch_1
    iget-object v0, p0, Lk1/e;->c:Ljava/lang/Object;

    .line 81
    .line 82
    check-cast v0, [B

    .line 83
    .line 84
    if-eqz p1, :cond_7

    .line 85
    .line 86
    array-length v1, p1

    .line 87
    array-length v2, v0

    .line 88
    add-int/lit8 v2, v2, 0x1c

    .line 89
    .line 90
    if-lt v1, v2, :cond_6

    .line 91
    .line 92
    invoke-static {v0, p1}, Ls1/N;->b([B[B)Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-eqz v1, :cond_5

    .line 97
    .line 98
    array-length v1, v0

    .line 99
    const/16 v2, 0xc

    .line 100
    .line 101
    invoke-static {p1, v1, v2}, Ll1/d;->a([BII)Ljava/security/spec/AlgorithmParameterSpec;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    sget-object v3, Ll1/d;->a:LV0/i;

    .line 106
    .line 107
    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    check-cast v3, Ljavax/crypto/Cipher;

    .line 112
    .line 113
    iget-object v4, p0, Lk1/e;->b:Ljava/lang/Object;

    .line 114
    .line 115
    check-cast v4, Ljavax/crypto/spec/SecretKeySpec;

    .line 116
    .line 117
    const/4 v5, 0x2

    .line 118
    invoke-virtual {v3, v5, v4, v1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 119
    .line 120
    .line 121
    if-eqz p2, :cond_4

    .line 122
    .line 123
    array-length v1, p2

    .line 124
    if-eqz v1, :cond_4

    .line 125
    .line 126
    invoke-virtual {v3, p2}, Ljavax/crypto/Cipher;->updateAAD([B)V

    .line 127
    .line 128
    .line 129
    :cond_4
    array-length p2, v0

    .line 130
    add-int/2addr p2, v2

    .line 131
    array-length v1, p1

    .line 132
    array-length v0, v0

    .line 133
    sub-int/2addr v1, v0

    .line 134
    sub-int/2addr v1, v2

    .line 135
    invoke-virtual {v3, p1, p2, v1}, Ljavax/crypto/Cipher;->doFinal([BII)[B

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    return-object p1

    .line 140
    :cond_5
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 141
    .line 142
    const-string p2, "Decryption failed (OutputPrefix mismatch)."

    .line 143
    .line 144
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    throw p1

    .line 148
    :cond_6
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 149
    .line 150
    const-string p2, "ciphertext too short"

    .line 151
    .line 152
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    throw p1

    .line 156
    :cond_7
    new-instance p1, Ljava/lang/NullPointerException;

    .line 157
    .line 158
    const-string p2, "ciphertext is null"

    .line 159
    .line 160
    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    throw p1

    .line 164
    :pswitch_2
    iget-object v0, p0, Lk1/e;->b:Ljava/lang/Object;

    .line 165
    .line 166
    check-cast v0, Lj1/a;

    .line 167
    .line 168
    iget-object v1, p0, Lk1/e;->c:Ljava/lang/Object;

    .line 169
    .line 170
    check-cast v1, [B

    .line 171
    .line 172
    array-length v2, v1

    .line 173
    if-nez v2, :cond_8

    .line 174
    .line 175
    invoke-interface {v0, p1, p2}, Lj1/a;->b([B[B)[B

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    goto :goto_2

    .line 180
    :cond_8
    invoke-static {v1, p1}, Ls1/N;->b([B[B)Z

    .line 181
    .line 182
    .line 183
    move-result v1

    .line 184
    if-eqz v1, :cond_9

    .line 185
    .line 186
    const/4 v1, 0x5

    .line 187
    array-length v2, p1

    .line 188
    invoke-static {p1, v1, v2}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    invoke-interface {v0, p1, p2}, Lj1/a;->b([B[B)[B

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    :goto_2
    return-object p1

    .line 197
    :cond_9
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 198
    .line 199
    const-string p2, "wrong prefix"

    .line 200
    .line 201
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    throw p1

    .line 205
    :pswitch_3
    iget-object v0, p0, Lk1/e;->c:Ljava/lang/Object;

    .line 206
    .line 207
    check-cast v0, Ls1/A;

    .line 208
    .line 209
    invoke-virtual {v0, p1}, Ls1/A;->a([B)Ljava/lang/Iterable;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    :catch_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 218
    .line 219
    .line 220
    move-result v1

    .line 221
    if-eqz v1, :cond_a

    .line 222
    .line 223
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    check-cast v1, Lk1/d;

    .line 228
    .line 229
    :try_start_0
    iget-object v1, v1, Lk1/d;->a:Lj1/a;

    .line 230
    .line 231
    invoke-interface {v1, p1, p2}, Lj1/a;->b([B[B)[B

    .line 232
    .line 233
    .line 234
    move-result-object p1
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 235
    return-object p1

    .line 236
    :cond_a
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 237
    .line 238
    const-string p2, "decryption failed"

    .line 239
    .line 240
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 241
    .line 242
    .line 243
    throw p1

    .line 244
    nop

    .line 245
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public c([B[B)[B
    .locals 3

    .line 1
    array-length v0, p1

    .line 2
    const/16 v1, 0x1c

    .line 3
    .line 4
    if-lt v0, v1, :cond_0

    .line 5
    .line 6
    const/16 v0, 0xc

    .line 7
    .line 8
    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    array-length v2, p1

    .line 13
    sub-int/2addr v2, v0

    .line 14
    invoke-static {p1, v0, v2}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object v0, p0, Lk1/e;->b:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v0, Ll1/l;

    .line 21
    .line 22
    invoke-virtual {v0, p1, v1, p2}, LI2/f;->a(Ljava/nio/ByteBuffer;[B[B)[B

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    return-object p1

    .line 27
    :cond_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 28
    .line 29
    const-string p2, "ciphertext too short"

    .line 30
    .line 31
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    throw p1
.end method

.method public d([B[B)[B
    .locals 3

    .line 1
    array-length v0, p1

    .line 2
    const/16 v1, 0x28

    .line 3
    .line 4
    if-lt v0, v1, :cond_0

    .line 5
    .line 6
    const/16 v0, 0x18

    .line 7
    .line 8
    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    array-length v2, p1

    .line 13
    sub-int/2addr v2, v0

    .line 14
    invoke-static {p1, v0, v2}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object v0, p0, Lk1/e;->b:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v0, Ll1/l;

    .line 21
    .line 22
    invoke-virtual {v0, p1, v1, p2}, LI2/f;->a(Ljava/nio/ByteBuffer;[B[B)[B

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    return-object p1

    .line 27
    :cond_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 28
    .line 29
    const-string p2, "ciphertext too short"

    .line 30
    .line 31
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    throw p1
.end method
