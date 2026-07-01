.class public final Ll1/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj1/a;


# static fields
.field public static final d:[B

.field public static final e:[B

.field public static final f:[B

.field public static final g:[B

.field public static final h:[B


# instance fields
.field public final a:Ll1/b;

.field public final b:Ljavax/crypto/spec/SecretKeySpec;

.field public final c:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "7a806c"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/support/v4/media/session/a;->g(Ljava/lang/String;)[B

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll1/f;->d:[B

    .line 8
    .line 9
    const-string v0, "46bb91c3c5"

    .line 10
    .line 11
    invoke-static {v0}, Landroid/support/v4/media/session/a;->g(Ljava/lang/String;)[B

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Ll1/f;->e:[B

    .line 16
    .line 17
    const-string v0, "36864200e0eaf5284d884a0e77d31646"

    .line 18
    .line 19
    invoke-static {v0}, Landroid/support/v4/media/session/a;->g(Ljava/lang/String;)[B

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Ll1/f;->f:[B

    .line 24
    .line 25
    const-string v0, "bae8e37fc83441b16034566b"

    .line 26
    .line 27
    invoke-static {v0}, Landroid/support/v4/media/session/a;->g(Ljava/lang/String;)[B

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, Ll1/f;->g:[B

    .line 32
    .line 33
    const-string v0, "af60eb711bd85bc1e4d3e0a462e074eea428a8"

    .line 34
    .line 35
    invoke-static {v0}, Landroid/support/v4/media/session/a;->g(Ljava/lang/String;)[B

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sput-object v0, Ll1/f;->h:[B

    .line 40
    .line 41
    return-void
.end method

.method public constructor <init>([B[BLl1/b;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll1/f;->c:[B

    .line 5
    .line 6
    array-length p2, p1

    .line 7
    invoke-static {p2}, Ly1/n;->a(I)V

    .line 8
    .line 9
    .line 10
    new-instance p2, Ljavax/crypto/spec/SecretKeySpec;

    .line 11
    .line 12
    const-string v0, "AES"

    .line 13
    .line 14
    invoke-direct {p2, p1, v0}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iput-object p2, p0, Ll1/f;->b:Ljavax/crypto/spec/SecretKeySpec;

    .line 18
    .line 19
    iput-object p3, p0, Ll1/f;->a:Ll1/b;

    .line 20
    .line 21
    return-void
.end method

.method public static c(Ljavax/crypto/Cipher;)Z
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    sget-object v1, Ll1/f;->g:[B

    .line 3
    .line 4
    array-length v2, v1

    .line 5
    new-instance v3, Ljavax/crypto/spec/GCMParameterSpec;

    .line 6
    .line 7
    const/16 v4, 0x80

    .line 8
    .line 9
    invoke-direct {v3, v4, v1, v0, v2}, Ljavax/crypto/spec/GCMParameterSpec;-><init>(I[BII)V

    .line 10
    .line 11
    .line 12
    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    .line 13
    .line 14
    sget-object v2, Ll1/f;->f:[B

    .line 15
    .line 16
    const-string v4, "AES"

    .line 17
    .line 18
    invoke-direct {v1, v2, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 v2, 0x2

    .line 22
    invoke-virtual {p0, v2, v1, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 23
    .line 24
    .line 25
    sget-object v1, Ll1/f;->e:[B

    .line 26
    .line 27
    invoke-virtual {p0, v1}, Ljavax/crypto/Cipher;->updateAAD([B)V

    .line 28
    .line 29
    .line 30
    sget-object v1, Ll1/f;->h:[B

    .line 31
    .line 32
    array-length v2, v1

    .line 33
    invoke-virtual {p0, v1, v0, v2}, Ljavax/crypto/Cipher;->doFinal([BII)[B

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    sget-object v1, Ll1/f;->d:[B

    .line 38
    .line 39
    invoke-static {p0, v1}, Ljava/security/MessageDigest;->isEqual([B[B)Z

    .line 40
    .line 41
    .line 42
    move-result p0
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    return p0

    .line 44
    :catch_0
    return v0
.end method


# virtual methods
.method public final a([B[B)[B
    .locals 9

    .line 1
    iget-object v0, p0, Ll1/f;->a:Ll1/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll1/b;->a()Ljavax/crypto/Cipher;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    array-length v0, p1

    .line 11
    iget-object v2, p0, Ll1/f;->c:[B

    .line 12
    .line 13
    array-length v3, v2

    .line 14
    const v4, 0x7fffffe3

    .line 15
    .line 16
    .line 17
    sub-int/2addr v4, v3

    .line 18
    if-gt v0, v4, :cond_2

    .line 19
    .line 20
    array-length v0, v2

    .line 21
    const/16 v3, 0xc

    .line 22
    .line 23
    add-int/2addr v0, v3

    .line 24
    array-length v4, p1

    .line 25
    add-int/2addr v0, v4

    .line 26
    add-int/lit8 v0, v0, 0x10

    .line 27
    .line 28
    invoke-static {v2, v0}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    invoke-static {v3}, Ls1/I;->a(I)[B

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    array-length v4, v2

    .line 37
    const/4 v6, 0x0

    .line 38
    invoke-static {v0, v6, v5, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 39
    .line 40
    .line 41
    array-length v4, v0

    .line 42
    new-instance v7, Ljavax/crypto/spec/GCMParameterSpec;

    .line 43
    .line 44
    const/16 v8, 0x80

    .line 45
    .line 46
    invoke-direct {v7, v8, v0, v6, v4}, Ljavax/crypto/spec/GCMParameterSpec;-><init>(I[BII)V

    .line 47
    .line 48
    .line 49
    const/4 v0, 0x1

    .line 50
    iget-object v4, p0, Ll1/f;->b:Ljavax/crypto/spec/SecretKeySpec;

    .line 51
    .line 52
    invoke-virtual {v1, v0, v4, v7}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 53
    .line 54
    .line 55
    if-eqz p2, :cond_0

    .line 56
    .line 57
    array-length v0, p2

    .line 58
    if-eqz v0, :cond_0

    .line 59
    .line 60
    invoke-virtual {v1, p2}, Ljavax/crypto/Cipher;->updateAAD([B)V

    .line 61
    .line 62
    .line 63
    :cond_0
    array-length v4, p1

    .line 64
    array-length p2, v2

    .line 65
    add-int/lit8 v6, p2, 0xc

    .line 66
    .line 67
    const/4 v3, 0x0

    .line 68
    move-object v2, p1

    .line 69
    invoke-virtual/range {v1 .. v6}, Ljavax/crypto/Cipher;->doFinal([BII[BI)I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    array-length p2, v2

    .line 74
    add-int/lit8 p2, p2, 0x10

    .line 75
    .line 76
    if-ne p1, p2, :cond_1

    .line 77
    .line 78
    return-object v5

    .line 79
    :cond_1
    array-length p2, v2

    .line 80
    sub-int/2addr p1, p2

    .line 81
    new-instance p2, Ljava/security/GeneralSecurityException;

    .line 82
    .line 83
    const-string v0, "encryption failed; AES-GCM-SIV tag must be 16 bytes, but got only "

    .line 84
    .line 85
    const-string v1, " bytes"

    .line 86
    .line 87
    invoke-static {p1, v0, v1}, LE1/j;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-direct {p2, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    throw p2

    .line 95
    :cond_2
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 96
    .line 97
    const-string p2, "plaintext too long"

    .line 98
    .line 99
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    throw p1
.end method

.method public final b([B[B)[B
    .locals 6

    .line 1
    array-length v0, p1

    .line 2
    iget-object v1, p0, Ll1/f;->c:[B

    .line 3
    .line 4
    array-length v2, v1

    .line 5
    add-int/lit8 v2, v2, 0x1c

    .line 6
    .line 7
    if-lt v0, v2, :cond_2

    .line 8
    .line 9
    invoke-static {v1, p1}, Ls1/N;->b([B[B)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Ll1/f;->a:Ll1/b;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll1/b;->a()Ljavax/crypto/Cipher;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    array-length v2, v1

    .line 25
    new-instance v3, Ljavax/crypto/spec/GCMParameterSpec;

    .line 26
    .line 27
    const/16 v4, 0x80

    .line 28
    .line 29
    const/16 v5, 0xc

    .line 30
    .line 31
    invoke-direct {v3, v4, p1, v2, v5}, Ljavax/crypto/spec/GCMParameterSpec;-><init>(I[BII)V

    .line 32
    .line 33
    .line 34
    const/4 v2, 0x2

    .line 35
    iget-object v4, p0, Ll1/f;->b:Ljavax/crypto/spec/SecretKeySpec;

    .line 36
    .line 37
    invoke-virtual {v0, v2, v4, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 38
    .line 39
    .line 40
    if-eqz p2, :cond_0

    .line 41
    .line 42
    array-length v2, p2

    .line 43
    if-eqz v2, :cond_0

    .line 44
    .line 45
    invoke-virtual {v0, p2}, Ljavax/crypto/Cipher;->updateAAD([B)V

    .line 46
    .line 47
    .line 48
    :cond_0
    array-length p2, v1

    .line 49
    add-int/2addr p2, v5

    .line 50
    array-length v2, p1

    .line 51
    array-length v1, v1

    .line 52
    sub-int/2addr v2, v1

    .line 53
    sub-int/2addr v2, v5

    .line 54
    invoke-virtual {v0, p1, p2, v2}, Ljavax/crypto/Cipher;->doFinal([BII)[B

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    return-object p1

    .line 59
    :cond_1
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 60
    .line 61
    const-string p2, "Decryption failed (OutputPrefix mismatch)."

    .line 62
    .line 63
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    throw p1

    .line 67
    :cond_2
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 68
    .line 69
    const-string p2, "ciphertext too short"

    .line 70
    .line 71
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    throw p1
.end method
