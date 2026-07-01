.class public final Ly1/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj1/b;


# static fields
.field public static final d:[B

.field public static final e:[B

.field public static final f:LV0/i;


# instance fields
.field public final a:Lv1/c;

.field public final b:[B

.field public final c:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v1, v0, [B

    .line 4
    .line 5
    sput-object v1, Ly1/c;->d:[B

    .line 6
    .line 7
    new-array v0, v0, [B

    .line 8
    .line 9
    fill-array-data v0, :array_0

    .line 10
    .line 11
    .line 12
    sput-object v0, Ly1/c;->e:[B

    .line 13
    .line 14
    new-instance v0, LV0/i;

    .line 15
    .line 16
    const/4 v1, 0x7

    .line 17
    invoke-direct {v0, v1}, LV0/i;-><init>(I)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Ly1/c;->f:LV0/i;

    .line 21
    .line 22
    return-void

    .line 23
    :array_0
    .array-data 1
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
        0x0t
        0x0t
        0x1t
    .end array-data
.end method

.method public constructor <init>([BLz1/a;)V
    .locals 3

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
    if-eqz v0, :cond_2

    .line 10
    .line 11
    array-length v0, p1

    .line 12
    const/16 v1, 0x20

    .line 13
    .line 14
    if-eq v0, v1, :cond_1

    .line 15
    .line 16
    array-length v0, p1

    .line 17
    const/16 v1, 0x40

    .line 18
    .line 19
    if-ne v0, v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-instance p2, Ljava/security/InvalidKeyException;

    .line 23
    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v1, "invalid key size: "

    .line 27
    .line 28
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    array-length p1, p1

    .line 32
    const-string v1, " bytes; key must have 32 or 64 bytes"

    .line 33
    .line 34
    invoke-static {v0, p1, v1}, LE1/j;->l(Ljava/lang/StringBuilder;ILjava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-direct {p2, p1}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    throw p2

    .line 42
    :cond_1
    :goto_0
    array-length v0, p1

    .line 43
    div-int/lit8 v0, v0, 0x2

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    invoke-static {p1, v1, v0}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    array-length v1, p1

    .line 51
    div-int/lit8 v1, v1, 0x2

    .line 52
    .line 53
    array-length v2, p1

    .line 54
    invoke-static {p1, v1, v2}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iput-object p1, p0, Ly1/c;->b:[B

    .line 59
    .line 60
    array-length p1, v0

    .line 61
    invoke-static {p1}, Lv1/b;->b(I)Lv1/b;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    new-instance v1, Lio/flutter/plugin/editing/j;

    .line 66
    .line 67
    invoke-static {v0}, Lz1/a;->a([B)Lz1/a;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const/16 v2, 0x17

    .line 72
    .line 73
    invoke-direct {v1, v2, v0}, Lio/flutter/plugin/editing/j;-><init>(ILjava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    invoke-static {p1, v1}, Lv1/a;->c0(Lv1/b;Lio/flutter/plugin/editing/j;)Lv1/a;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-static {p1}, Lc1/g;->f(Lv1/a;)Lv1/c;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iput-object p1, p0, Ly1/c;->a:Lv1/c;

    .line 85
    .line 86
    invoke-virtual {p2}, Lz1/a;->b()[B

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iput-object p1, p0, Ly1/c;->c:[B

    .line 91
    .line 92
    return-void

    .line 93
    :cond_2
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 94
    .line 95
    const-string p2, "Can not use AES-SIV in FIPS-mode."

    .line 96
    .line 97
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    throw p1
.end method

.method public static d(I)V
    .locals 3

    .line 1
    const/16 v0, 0x7e

    .line 2
    .line 3
    if-gt p0, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 7
    .line 8
    const-string v1, "Too many associated datas: "

    .line 9
    .line 10
    const-string v2, " > 126"

    .line 11
    .line 12
    invoke-static {p0, v1, v2}, LE1/j;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-direct {v0, p0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    throw v0
.end method


# virtual methods
.method public final a([B[B)[B
    .locals 9

    .line 1
    filled-new-array {p2}, [[B

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {v0}, Ly1/c;->d(I)V

    .line 7
    .line 8
    .line 9
    array-length v1, p1

    .line 10
    iget-object v2, p0, Ly1/c;->c:[B

    .line 11
    .line 12
    array-length v3, v2

    .line 13
    const v4, 0x7fffffef

    .line 14
    .line 15
    .line 16
    sub-int/2addr v4, v3

    .line 17
    if-gt v1, v4, :cond_1

    .line 18
    .line 19
    sget-object v1, Ly1/c;->f:LV0/i;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    move-object v3, v1

    .line 26
    check-cast v3, Ljavax/crypto/Cipher;

    .line 27
    .line 28
    const/4 v1, 0x2

    .line 29
    invoke-static {p2, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    check-cast p2, [[B

    .line 34
    .line 35
    aput-object p1, p2, v0

    .line 36
    .line 37
    invoke-virtual {p0, p2}, Ly1/c;->c([[B)[B

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-virtual {p2}, [B->clone()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, [B

    .line 46
    .line 47
    const/16 v4, 0x8

    .line 48
    .line 49
    aget-byte v5, v1, v4

    .line 50
    .line 51
    and-int/lit8 v5, v5, 0x7f

    .line 52
    .line 53
    int-to-byte v5, v5

    .line 54
    aput-byte v5, v1, v4

    .line 55
    .line 56
    const/16 v4, 0xc

    .line 57
    .line 58
    aget-byte v5, v1, v4

    .line 59
    .line 60
    and-int/lit8 v5, v5, 0x7f

    .line 61
    .line 62
    int-to-byte v5, v5

    .line 63
    aput-byte v5, v1, v4

    .line 64
    .line 65
    new-instance v4, Ljavax/crypto/spec/SecretKeySpec;

    .line 66
    .line 67
    iget-object v5, p0, Ly1/c;->b:[B

    .line 68
    .line 69
    const-string v6, "AES"

    .line 70
    .line 71
    invoke-direct {v4, v5, v6}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 72
    .line 73
    .line 74
    new-instance v5, Ljavax/crypto/spec/IvParameterSpec;

    .line 75
    .line 76
    invoke-direct {v5, v1}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3, v0, v4, v5}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 80
    .line 81
    .line 82
    array-length v0, v2

    .line 83
    array-length v1, p2

    .line 84
    add-int/2addr v0, v1

    .line 85
    array-length v1, p1

    .line 86
    add-int/2addr v0, v1

    .line 87
    invoke-static {v2, v0}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 88
    .line 89
    .line 90
    move-result-object v7

    .line 91
    array-length v0, v2

    .line 92
    array-length v1, p2

    .line 93
    const/4 v4, 0x0

    .line 94
    invoke-static {p2, v4, v7, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 95
    .line 96
    .line 97
    array-length v6, p1

    .line 98
    array-length v0, v2

    .line 99
    array-length p2, p2

    .line 100
    add-int v8, v0, p2

    .line 101
    .line 102
    const/4 v5, 0x0

    .line 103
    move-object v4, p1

    .line 104
    invoke-virtual/range {v3 .. v8}, Ljavax/crypto/Cipher;->doFinal([BII[BI)I

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    array-length p2, v4

    .line 109
    if-ne p1, p2, :cond_0

    .line 110
    .line 111
    return-object v7

    .line 112
    :cond_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 113
    .line 114
    const-string p2, "not enough data written"

    .line 115
    .line 116
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    throw p1

    .line 120
    :cond_1
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 121
    .line 122
    const-string p2, "plaintext too long"

    .line 123
    .line 124
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    throw p1
.end method

.method public final b([B[B)[B
    .locals 8

    .line 1
    filled-new-array {p2}, [[B

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {v0}, Ly1/c;->d(I)V

    .line 7
    .line 8
    .line 9
    array-length v1, p1

    .line 10
    iget-object v2, p0, Ly1/c;->c:[B

    .line 11
    .line 12
    array-length v3, v2

    .line 13
    add-int/lit8 v3, v3, 0x10

    .line 14
    .line 15
    if-lt v1, v3, :cond_3

    .line 16
    .line 17
    invoke-static {v2, p1}, Ls1/N;->b([B[B)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    sget-object v1, Ly1/c;->f:LV0/i;

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ljavax/crypto/Cipher;

    .line 30
    .line 31
    array-length v3, v2

    .line 32
    array-length v4, v2

    .line 33
    add-int/lit8 v4, v4, 0x10

    .line 34
    .line 35
    invoke-static {p1, v3, v4}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v3}, [B->clone()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    check-cast v4, [B

    .line 44
    .line 45
    const/16 v5, 0x8

    .line 46
    .line 47
    aget-byte v6, v4, v5

    .line 48
    .line 49
    and-int/lit8 v6, v6, 0x7f

    .line 50
    .line 51
    int-to-byte v6, v6

    .line 52
    aput-byte v6, v4, v5

    .line 53
    .line 54
    const/16 v5, 0xc

    .line 55
    .line 56
    aget-byte v6, v4, v5

    .line 57
    .line 58
    and-int/lit8 v6, v6, 0x7f

    .line 59
    .line 60
    int-to-byte v6, v6

    .line 61
    aput-byte v6, v4, v5

    .line 62
    .line 63
    new-instance v5, Ljavax/crypto/spec/SecretKeySpec;

    .line 64
    .line 65
    iget-object v6, p0, Ly1/c;->b:[B

    .line 66
    .line 67
    const-string v7, "AES"

    .line 68
    .line 69
    invoke-direct {v5, v6, v7}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 70
    .line 71
    .line 72
    new-instance v6, Ljavax/crypto/spec/IvParameterSpec;

    .line 73
    .line 74
    invoke-direct {v6, v4}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 75
    .line 76
    .line 77
    const/4 v4, 0x2

    .line 78
    invoke-virtual {v1, v4, v5, v6}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 79
    .line 80
    .line 81
    array-length v2, v2

    .line 82
    add-int/lit8 v2, v2, 0x10

    .line 83
    .line 84
    array-length v5, p1

    .line 85
    sub-int/2addr v5, v2

    .line 86
    invoke-virtual {v1, p1, v2, v5}, Ljavax/crypto/Cipher;->doFinal([BII)[B

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    if-nez v5, :cond_0

    .line 91
    .line 92
    if-nez p1, :cond_0

    .line 93
    .line 94
    const-string v1, "java.vendor"

    .line 95
    .line 96
    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    const-string v2, "The Android Project"

    .line 101
    .line 102
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-eqz v1, :cond_0

    .line 107
    .line 108
    const/4 p1, 0x0

    .line 109
    new-array p1, p1, [B

    .line 110
    .line 111
    :cond_0
    invoke-static {p2, v4}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object p2

    .line 115
    check-cast p2, [[B

    .line 116
    .line 117
    aput-object p1, p2, v0

    .line 118
    .line 119
    invoke-virtual {p0, p2}, Ly1/c;->c([[B)[B

    .line 120
    .line 121
    .line 122
    move-result-object p2

    .line 123
    invoke-static {v3, p2}, Ljava/security/MessageDigest;->isEqual([B[B)Z

    .line 124
    .line 125
    .line 126
    move-result p2

    .line 127
    if-eqz p2, :cond_1

    .line 128
    .line 129
    return-object p1

    .line 130
    :cond_1
    new-instance p1, Ljavax/crypto/AEADBadTagException;

    .line 131
    .line 132
    const-string p2, "Integrity check failed."

    .line 133
    .line 134
    invoke-direct {p1, p2}, Ljavax/crypto/AEADBadTagException;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    throw p1

    .line 138
    :cond_2
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 139
    .line 140
    const-string p2, "Decryption failed (OutputPrefix mismatch)."

    .line 141
    .line 142
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    throw p1

    .line 146
    :cond_3
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 147
    .line 148
    const-string p2, "Ciphertext too short."

    .line 149
    .line 150
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    throw p1
.end method

.method public final varargs c([[B)[B
    .locals 8

    .line 1
    array-length v0, p1

    .line 2
    iget-object v1, p0, Ly1/c;->a:Lv1/c;

    .line 3
    .line 4
    const/16 v2, 0x10

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    sget-object p1, Ly1/c;->e:[B

    .line 9
    .line 10
    invoke-interface {v1, v2, p1}, Lv1/c;->a(I[B)[B

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    return-object p1

    .line 15
    :cond_0
    sget-object v0, Ly1/c;->d:[B

    .line 16
    .line 17
    invoke-interface {v1, v2, v0}, Lv1/c;->a(I[B)[B

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/4 v3, 0x0

    .line 22
    move v4, v3

    .line 23
    :goto_0
    array-length v5, p1

    .line 24
    add-int/lit8 v5, v5, -0x1

    .line 25
    .line 26
    if-ge v4, v5, :cond_2

    .line 27
    .line 28
    aget-object v5, p1, v4

    .line 29
    .line 30
    if-nez v5, :cond_1

    .line 31
    .line 32
    new-array v5, v3, [B

    .line 33
    .line 34
    :cond_1
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->l([B)[B

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-interface {v1, v2, v5}, Lv1/c;->a(I[B)[B

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    invoke-static {v0, v5}, Lcom/google/crypto/tink/shaded/protobuf/i0;->S([B[B)[B

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    add-int/lit8 v4, v4, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    array-length v4, p1

    .line 50
    add-int/lit8 v4, v4, -0x1

    .line 51
    .line 52
    aget-object p1, p1, v4

    .line 53
    .line 54
    array-length v4, p1

    .line 55
    if-lt v4, v2, :cond_4

    .line 56
    .line 57
    array-length v4, p1

    .line 58
    array-length v5, v0

    .line 59
    if-lt v4, v5, :cond_3

    .line 60
    .line 61
    array-length v4, p1

    .line 62
    array-length v5, v0

    .line 63
    sub-int/2addr v4, v5

    .line 64
    array-length v5, p1

    .line 65
    invoke-static {p1, v5}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    :goto_1
    array-length v5, v0

    .line 70
    if-ge v3, v5, :cond_5

    .line 71
    .line 72
    add-int v5, v4, v3

    .line 73
    .line 74
    aget-byte v6, p1, v5

    .line 75
    .line 76
    aget-byte v7, v0, v3

    .line 77
    .line 78
    xor-int/2addr v6, v7

    .line 79
    int-to-byte v6, v6

    .line 80
    aput-byte v6, p1, v5

    .line 81
    .line 82
    add-int/lit8 v3, v3, 0x1

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 86
    .line 87
    const-string v0, "xorEnd requires a.length >= b.length"

    .line 88
    .line 89
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    throw p1

    .line 93
    :cond_4
    array-length v3, p1

    .line 94
    if-ge v3, v2, :cond_6

    .line 95
    .line 96
    invoke-static {p1, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    array-length p1, p1

    .line 101
    const/16 v4, -0x80

    .line 102
    .line 103
    aput-byte v4, v3, p1

    .line 104
    .line 105
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->l([B)[B

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-static {v3, p1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->S([B[B)[B

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    :cond_5
    invoke-interface {v1, v2, p1}, Lv1/c;->a(I[B)[B

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    return-object p1

    .line 118
    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 119
    .line 120
    const-string v0, "x must be smaller than a block."

    .line 121
    .line 122
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    throw p1
.end method
