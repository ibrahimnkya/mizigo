.class public final Ll1/o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj1/a;


# instance fields
.field public final a:[B

.field public final b:[B

.field public final c:Ljava/security/Provider;


# direct methods
.method public constructor <init>([B[BLjava/security/Provider;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-static {v0}, LE1/j;->e(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    array-length v0, p1

    .line 12
    const/16 v1, 0x20

    .line 13
    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    iput-object p1, p0, Ll1/o;->a:[B

    .line 17
    .line 18
    iput-object p2, p0, Ll1/o;->b:[B

    .line 19
    .line 20
    iput-object p3, p0, Ll1/o;->c:Ljava/security/Provider;

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    new-instance p1, Ljava/security/InvalidKeyException;

    .line 24
    .line 25
    const-string p2, "The key length in bytes must be 32."

    .line 26
    .line 27
    invoke-direct {p1, p2}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    throw p1

    .line 31
    :cond_1
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 32
    .line 33
    const-string p2, "Can not use ChaCha20Poly1305 in FIPS-mode."

    .line 34
    .line 35
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    throw p1
.end method


# virtual methods
.method public final a([B[B)[B
    .locals 12

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    const/16 v0, 0x18

    .line 4
    .line 5
    invoke-static {v0}, Ls1/I;->a(I)[B

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Ll1/o;->a:[B

    .line 10
    .line 11
    invoke-static {v2, v1}, Ll1/j;->a([B[B)[B

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    new-instance v3, Ljavax/crypto/spec/SecretKeySpec;

    .line 16
    .line 17
    const-string v4, "ChaCha20"

    .line 18
    .line 19
    invoke-direct {v3, v2, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    new-instance v2, Ljavax/crypto/spec/IvParameterSpec;

    .line 23
    .line 24
    const/16 v4, 0xc

    .line 25
    .line 26
    new-array v4, v4, [B

    .line 27
    .line 28
    const/4 v5, 0x4

    .line 29
    const/16 v6, 0x8

    .line 30
    .line 31
    const/16 v7, 0x10

    .line 32
    .line 33
    invoke-static {v1, v7, v4, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 34
    .line 35
    .line 36
    invoke-direct {v2, v4}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 37
    .line 38
    .line 39
    sget-object v4, Ll1/h;->d:[B

    .line 40
    .line 41
    const-string v4, "ChaCha20-Poly1305"

    .line 42
    .line 43
    iget-object v5, p0, Ll1/o;->c:Ljava/security/Provider;

    .line 44
    .line 45
    invoke-static {v4, v5}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljavax/crypto/Cipher;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    const/4 v4, 0x1

    .line 50
    invoke-virtual {v6, v4, v3, v2}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 51
    .line 52
    .line 53
    if-eqz p2, :cond_0

    .line 54
    .line 55
    array-length v2, p2

    .line 56
    if-eqz v2, :cond_0

    .line 57
    .line 58
    invoke-virtual {v6, p2}, Ljavax/crypto/Cipher;->updateAAD([B)V

    .line 59
    .line 60
    .line 61
    :cond_0
    array-length p2, p1

    .line 62
    invoke-virtual {v6, p2}, Ljavax/crypto/Cipher;->getOutputSize(I)I

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    iget-object v2, p0, Ll1/o;->b:[B

    .line 67
    .line 68
    array-length v3, v2

    .line 69
    const v4, 0x7fffffe7

    .line 70
    .line 71
    .line 72
    sub-int/2addr v4, v3

    .line 73
    if-gt p2, v4, :cond_2

    .line 74
    .line 75
    array-length v3, v2

    .line 76
    add-int/2addr v3, v0

    .line 77
    add-int/2addr v3, p2

    .line 78
    invoke-static {v2, v3}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 79
    .line 80
    .line 81
    move-result-object v10

    .line 82
    const/4 v3, 0x0

    .line 83
    array-length v4, v2

    .line 84
    invoke-static {v1, v3, v10, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 85
    .line 86
    .line 87
    array-length v9, p1

    .line 88
    array-length v1, v2

    .line 89
    add-int/lit8 v11, v1, 0x18

    .line 90
    .line 91
    const/4 v8, 0x0

    .line 92
    move-object v7, p1

    .line 93
    invoke-virtual/range {v6 .. v11}, Ljavax/crypto/Cipher;->doFinal([BII[BI)I

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-ne p1, p2, :cond_1

    .line 98
    .line 99
    return-object v10

    .line 100
    :cond_1
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 101
    .line 102
    const-string p2, "not enough data written"

    .line 103
    .line 104
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    throw p1

    .line 108
    :cond_2
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 109
    .line 110
    const-string p2, "plaintext too long"

    .line 111
    .line 112
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    throw p1

    .line 116
    :cond_3
    new-instance p1, Ljava/lang/NullPointerException;

    .line 117
    .line 118
    const-string p2, "plaintext is null"

    .line 119
    .line 120
    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    throw p1
.end method

.method public final b([B[B)[B
    .locals 9

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    iget-object v1, p0, Ll1/o;->b:[B

    .line 5
    .line 6
    array-length v2, v1

    .line 7
    add-int/lit8 v2, v2, 0x28

    .line 8
    .line 9
    if-lt v0, v2, :cond_2

    .line 10
    .line 11
    invoke-static {v1, p1}, Ls1/N;->b([B[B)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    const/16 v0, 0x18

    .line 18
    .line 19
    new-array v2, v0, [B

    .line 20
    .line 21
    array-length v3, v1

    .line 22
    const/4 v4, 0x0

    .line 23
    invoke-static {p1, v3, v2, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 24
    .line 25
    .line 26
    iget-object v3, p0, Ll1/o;->a:[B

    .line 27
    .line 28
    invoke-static {v3, v2}, Ll1/j;->a([B[B)[B

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    new-instance v4, Ljavax/crypto/spec/SecretKeySpec;

    .line 33
    .line 34
    const-string v5, "ChaCha20"

    .line 35
    .line 36
    invoke-direct {v4, v3, v5}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    new-instance v3, Ljavax/crypto/spec/IvParameterSpec;

    .line 40
    .line 41
    const/16 v5, 0xc

    .line 42
    .line 43
    new-array v5, v5, [B

    .line 44
    .line 45
    const/4 v6, 0x4

    .line 46
    const/16 v7, 0x8

    .line 47
    .line 48
    const/16 v8, 0x10

    .line 49
    .line 50
    invoke-static {v2, v8, v5, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 51
    .line 52
    .line 53
    invoke-direct {v3, v5}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 54
    .line 55
    .line 56
    sget-object v2, Ll1/h;->d:[B

    .line 57
    .line 58
    const-string v2, "ChaCha20-Poly1305"

    .line 59
    .line 60
    iget-object v5, p0, Ll1/o;->c:Ljava/security/Provider;

    .line 61
    .line 62
    invoke-static {v2, v5}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljavax/crypto/Cipher;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    const/4 v5, 0x2

    .line 67
    invoke-virtual {v2, v5, v4, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 68
    .line 69
    .line 70
    if-eqz p2, :cond_0

    .line 71
    .line 72
    array-length v3, p2

    .line 73
    if-eqz v3, :cond_0

    .line 74
    .line 75
    invoke-virtual {v2, p2}, Ljavax/crypto/Cipher;->updateAAD([B)V

    .line 76
    .line 77
    .line 78
    :cond_0
    array-length p2, v1

    .line 79
    add-int/2addr p2, v0

    .line 80
    array-length v3, p1

    .line 81
    array-length v1, v1

    .line 82
    sub-int/2addr v3, v1

    .line 83
    sub-int/2addr v3, v0

    .line 84
    invoke-virtual {v2, p1, p2, v3}, Ljavax/crypto/Cipher;->doFinal([BII)[B

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    return-object p1

    .line 89
    :cond_1
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 90
    .line 91
    const-string p2, "Decryption failed (OutputPrefix mismatch)."

    .line 92
    .line 93
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    throw p1

    .line 97
    :cond_2
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 98
    .line 99
    const-string p2, "ciphertext too short"

    .line 100
    .line 101
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    throw p1

    .line 105
    :cond_3
    new-instance p1, Ljava/lang/NullPointerException;

    .line 106
    .line 107
    const-string p2, "ciphertext is null"

    .line 108
    .line 109
    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    throw p1
.end method
