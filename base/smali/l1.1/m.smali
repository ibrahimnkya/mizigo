.class public final Ll1/m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj1/a;


# instance fields
.field public final a:[B

.field public final b:I

.field public final c:Lv1/c;


# direct methods
.method public constructor <init>([BLz1/a;I)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    array-length v0, p1

    .line 5
    invoke-static {v0}, Lv1/b;->b(I)Lv1/b;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Lio/flutter/plugin/editing/j;

    .line 10
    .line 11
    invoke-static {p1}, Lz1/a;->a([B)Lz1/a;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const/16 v2, 0x17

    .line 16
    .line 17
    invoke-direct {v1, v2, p1}, Lio/flutter/plugin/editing/j;-><init>(ILjava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v1}, Lv1/a;->c0(Lv1/b;Lio/flutter/plugin/editing/j;)Lv1/a;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p1}, Lc1/g;->f(Lv1/a;)Lv1/c;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Ll1/m;->c:Lv1/c;

    .line 29
    .line 30
    invoke-virtual {p2}, Lz1/a;->b()[B

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iput-object p1, p0, Ll1/m;->a:[B

    .line 35
    .line 36
    iput p3, p0, Ll1/m;->b:I

    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public final a([B[B)[B
    .locals 12

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    iget v0, p0, Ll1/m;->b:I

    .line 4
    .line 5
    add-int/lit8 v1, v0, 0xc

    .line 6
    .line 7
    invoke-static {v1}, Ls1/I;->a(I)[B

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-static {v2, v0}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-static {v2, v0, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p0, v3}, Ll1/m;->c([B)[B

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    const/4 v4, 0x2

    .line 24
    invoke-static {v4}, LE1/j;->f(I)Z

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    if-eqz v4, :cond_4

    .line 29
    .line 30
    sget-object v4, Ll1/d;->a:LV0/i;

    .line 31
    .line 32
    const/16 v4, 0x20

    .line 33
    .line 34
    invoke-static {v4}, Ly1/n;->a(I)V

    .line 35
    .line 36
    .line 37
    new-instance v4, Ljavax/crypto/spec/SecretKeySpec;

    .line 38
    .line 39
    const-string v5, "AES"

    .line 40
    .line 41
    invoke-direct {v4, v3, v5}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object v3, p0, Ll1/m;->a:[B

    .line 45
    .line 46
    array-length v5, v3

    .line 47
    add-int/2addr v5, v0

    .line 48
    array-length v0, v1

    .line 49
    add-int v11, v5, v0

    .line 50
    .line 51
    array-length v0, v1

    .line 52
    const/16 v5, 0xc

    .line 53
    .line 54
    if-ne v0, v5, :cond_3

    .line 55
    .line 56
    array-length v0, v1

    .line 57
    const/4 v5, 0x0

    .line 58
    invoke-static {v1, v5, v0}, Ll1/d;->a([BII)Ljava/security/spec/AlgorithmParameterSpec;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    sget-object v1, Ll1/d;->a:LV0/i;

    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    move-object v6, v1

    .line 69
    check-cast v6, Ljavax/crypto/Cipher;

    .line 70
    .line 71
    const/4 v1, 0x1

    .line 72
    invoke-virtual {v6, v1, v4, v0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 73
    .line 74
    .line 75
    if-eqz p2, :cond_0

    .line 76
    .line 77
    array-length v0, p2

    .line 78
    if-eqz v0, :cond_0

    .line 79
    .line 80
    invoke-virtual {v6, p2}, Ljavax/crypto/Cipher;->updateAAD([B)V

    .line 81
    .line 82
    .line 83
    :cond_0
    array-length p2, p1

    .line 84
    invoke-virtual {v6, p2}, Ljavax/crypto/Cipher;->getOutputSize(I)I

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    const v0, 0x7fffffff

    .line 89
    .line 90
    .line 91
    sub-int/2addr v0, v11

    .line 92
    if-gt p2, v0, :cond_2

    .line 93
    .line 94
    add-int v0, v11, p2

    .line 95
    .line 96
    new-array v10, v0, [B

    .line 97
    .line 98
    const/4 v8, 0x0

    .line 99
    array-length v9, p1

    .line 100
    move-object v7, p1

    .line 101
    invoke-virtual/range {v6 .. v11}, Ljavax/crypto/Cipher;->doFinal([BII[BI)I

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-ne p1, p2, :cond_1

    .line 106
    .line 107
    array-length p1, v3

    .line 108
    invoke-static {v3, v5, v10, v5, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 109
    .line 110
    .line 111
    array-length p1, v3

    .line 112
    array-length p2, v2

    .line 113
    invoke-static {v2, v5, v10, p1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 114
    .line 115
    .line 116
    return-object v10

    .line 117
    :cond_1
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 118
    .line 119
    const-string p2, "not enough data written"

    .line 120
    .line 121
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    throw p1

    .line 125
    :cond_2
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 126
    .line 127
    const-string p2, "plaintext too long"

    .line 128
    .line 129
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    throw p1

    .line 133
    :cond_3
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 134
    .line 135
    const-string p2, "iv is wrong size"

    .line 136
    .line 137
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    throw p1

    .line 141
    :cond_4
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 142
    .line 143
    const-string p2, "Can not use AES-GCM in FIPS-mode, as BoringCrypto module is not available."

    .line 144
    .line 145
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    throw p1

    .line 149
    :cond_5
    new-instance p1, Ljava/lang/NullPointerException;

    .line 150
    .line 151
    const-string p2, "plaintext is null"

    .line 152
    .line 153
    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    throw p1
.end method

.method public final b([B[B)[B
    .locals 8

    .line 1
    if-eqz p1, :cond_6

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    iget-object v1, p0, Ll1/m;->a:[B

    .line 5
    .line 6
    array-length v2, v1

    .line 7
    iget v3, p0, Ll1/m;->b:I

    .line 8
    .line 9
    add-int/2addr v2, v3

    .line 10
    add-int/lit8 v2, v2, 0x1c

    .line 11
    .line 12
    const-string v4, "ciphertext too short"

    .line 13
    .line 14
    if-lt v0, v2, :cond_5

    .line 15
    .line 16
    invoke-static {v1, p1}, Ls1/N;->b([B[B)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_4

    .line 21
    .line 22
    array-length v0, v1

    .line 23
    add-int/2addr v0, v3

    .line 24
    array-length v1, v1

    .line 25
    invoke-static {p1, v1, v0}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {p0, v1}, Ll1/m;->c([B)[B

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const/4 v2, 0x2

    .line 34
    invoke-static {v2}, LE1/j;->f(I)Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-eqz v3, :cond_3

    .line 39
    .line 40
    sget-object v3, Ll1/d;->a:LV0/i;

    .line 41
    .line 42
    const/16 v3, 0x20

    .line 43
    .line 44
    invoke-static {v3}, Ly1/n;->a(I)V

    .line 45
    .line 46
    .line 47
    new-instance v3, Ljavax/crypto/spec/SecretKeySpec;

    .line 48
    .line 49
    const-string v5, "AES"

    .line 50
    .line 51
    invoke-direct {v3, v1, v5}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 52
    .line 53
    .line 54
    add-int/lit8 v1, v0, 0xc

    .line 55
    .line 56
    invoke-static {p1, v0, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    array-length v6, v5

    .line 61
    const/16 v7, 0xc

    .line 62
    .line 63
    if-ne v6, v7, :cond_2

    .line 64
    .line 65
    array-length v6, p1

    .line 66
    add-int/lit8 v0, v0, 0x1c

    .line 67
    .line 68
    if-lt v6, v0, :cond_1

    .line 69
    .line 70
    const/4 v0, 0x0

    .line 71
    array-length v4, v5

    .line 72
    invoke-static {v5, v0, v4}, Ll1/d;->a([BII)Ljava/security/spec/AlgorithmParameterSpec;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    sget-object v4, Ll1/d;->a:LV0/i;

    .line 77
    .line 78
    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    check-cast v4, Ljavax/crypto/Cipher;

    .line 83
    .line 84
    invoke-virtual {v4, v2, v3, v0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 85
    .line 86
    .line 87
    if-eqz p2, :cond_0

    .line 88
    .line 89
    array-length v0, p2

    .line 90
    if-eqz v0, :cond_0

    .line 91
    .line 92
    invoke-virtual {v4, p2}, Ljavax/crypto/Cipher;->updateAAD([B)V

    .line 93
    .line 94
    .line 95
    :cond_0
    array-length p2, p1

    .line 96
    sub-int/2addr p2, v1

    .line 97
    invoke-virtual {v4, p1, v1, p2}, Ljavax/crypto/Cipher;->doFinal([BII)[B

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    return-object p1

    .line 102
    :cond_1
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 103
    .line 104
    invoke-direct {p1, v4}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    throw p1

    .line 108
    :cond_2
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 109
    .line 110
    const-string p2, "iv is wrong size"

    .line 111
    .line 112
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    throw p1

    .line 116
    :cond_3
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 117
    .line 118
    const-string p2, "Can not use AES-GCM in FIPS-mode, as BoringCrypto module is not available."

    .line 119
    .line 120
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    throw p1

    .line 124
    :cond_4
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 125
    .line 126
    const-string p2, "Decryption failed (OutputPrefix mismatch)."

    .line 127
    .line 128
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    throw p1

    .line 132
    :cond_5
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 133
    .line 134
    invoke-direct {p1, v4}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    throw p1

    .line 138
    :cond_6
    new-instance p1, Ljava/lang/NullPointerException;

    .line 139
    .line 140
    const-string p2, "ciphertext is null"

    .line 141
    .line 142
    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    throw p1
.end method

.method public final c([B)[B
    .locals 6

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v1, v0, [B

    .line 4
    .line 5
    fill-array-data v1, :array_0

    .line 6
    .line 7
    .line 8
    new-array v2, v0, [B

    .line 9
    .line 10
    fill-array-data v2, :array_1

    .line 11
    .line 12
    .line 13
    array-length v3, p1

    .line 14
    const/16 v4, 0xc

    .line 15
    .line 16
    if-gt v3, v4, :cond_0

    .line 17
    .line 18
    array-length v3, p1

    .line 19
    const/16 v4, 0x8

    .line 20
    .line 21
    if-lt v3, v4, :cond_0

    .line 22
    .line 23
    array-length v3, p1

    .line 24
    const/4 v4, 0x0

    .line 25
    const/4 v5, 0x4

    .line 26
    invoke-static {p1, v4, v1, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 27
    .line 28
    .line 29
    array-length v3, p1

    .line 30
    invoke-static {p1, v4, v2, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 31
    .line 32
    .line 33
    const/16 p1, 0x20

    .line 34
    .line 35
    new-array p1, p1, [B

    .line 36
    .line 37
    iget-object v3, p0, Ll1/m;->c:Lv1/c;

    .line 38
    .line 39
    invoke-interface {v3, v0, v1}, Lv1/c;->a(I[B)[B

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {v1, v4, p1, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 44
    .line 45
    .line 46
    invoke-interface {v3, v0, v2}, Lv1/c;->a(I[B)[B

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-static {v1, v4, p1, v0, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 51
    .line 52
    .line 53
    return-object p1

    .line 54
    :cond_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 55
    .line 56
    const-string v0, "invalid salt size"

    .line 57
    .line 58
    invoke-direct {p1, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    throw p1

    .line 62
    nop

    .line 63
    :array_0
    .array-data 1
        0x0t
        0x1t
        0x58t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data

    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    :array_1
    .array-data 1
        0x0t
        0x2t
        0x58t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method
