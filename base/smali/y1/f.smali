.class public final Ly1/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj1/a;


# instance fields
.field public final a:Ly1/a;

.field public final b:Ly1/m;

.field public final c:I

.field public final d:[B


# direct methods
.method public constructor <init>(Ly1/a;Ly1/m;I[B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ly1/f;->a:Ly1/a;

    .line 5
    .line 6
    iput-object p2, p0, Ly1/f;->b:Ly1/m;

    .line 7
    .line 8
    iput p3, p0, Ly1/f;->c:I

    .line 9
    .line 10
    iput-object p4, p0, Ly1/f;->d:[B

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a([B[B)[B
    .locals 9

    .line 1
    array-length v0, p1

    .line 2
    iget-object v1, p0, Ly1/f;->a:Ly1/a;

    .line 3
    .line 4
    iget v2, v1, Ly1/a;->b:I

    .line 5
    .line 6
    const v3, 0x7fffffff

    .line 7
    .line 8
    .line 9
    sub-int/2addr v3, v2

    .line 10
    if-gt v0, v3, :cond_1

    .line 11
    .line 12
    array-length v0, p1

    .line 13
    add-int/2addr v0, v2

    .line 14
    new-array v5, v0, [B

    .line 15
    .line 16
    invoke-static {v2}, Ls1/I;->a(I)[B

    .line 17
    .line 18
    .line 19
    move-result-object v7

    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-static {v7, v0, v5, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 22
    .line 23
    .line 24
    array-length v4, p1

    .line 25
    iget v6, v1, Ly1/a;->b:I

    .line 26
    .line 27
    const/4 v8, 0x1

    .line 28
    const/4 v3, 0x0

    .line 29
    move-object v2, p1

    .line 30
    invoke-virtual/range {v1 .. v8}, Ly1/a;->a([BII[BI[BZ)V

    .line 31
    .line 32
    .line 33
    if-nez p2, :cond_0

    .line 34
    .line 35
    new-array p2, v0, [B

    .line 36
    .line 37
    :cond_0
    const/16 p1, 0x8

    .line 38
    .line 39
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    array-length v1, p2

    .line 44
    int-to-long v1, v1

    .line 45
    const-wide/16 v3, 0x8

    .line 46
    .line 47
    mul-long/2addr v1, v3

    .line 48
    invoke-virtual {v0, v1, v2}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {v0, p1}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    filled-new-array {p2, v5, p1}, [[B

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->e([[B)[B

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iget-object p2, p0, Ly1/f;->b:Ly1/m;

    .line 69
    .line 70
    invoke-virtual {p2, p1}, Ly1/m;->a([B)[B

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object p2, p0, Ly1/f;->d:[B

    .line 75
    .line 76
    filled-new-array {p2, v5, p1}, [[B

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->e([[B)[B

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    return-object p1

    .line 85
    :cond_1
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 86
    .line 87
    const-string p2, "plaintext length can not exceed "

    .line 88
    .line 89
    invoke-static {p2, v3}, LE1/j;->j(Ljava/lang/String;I)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    throw p1
.end method

.method public final b([B[B)[B
    .locals 12

    .line 1
    array-length v0, p1

    .line 2
    iget-object v1, p0, Ly1/f;->d:[B

    .line 3
    .line 4
    array-length v2, v1

    .line 5
    iget v3, p0, Ly1/f;->c:I

    .line 6
    .line 7
    add-int/2addr v2, v3

    .line 8
    if-lt v0, v2, :cond_4

    .line 9
    .line 10
    invoke-static {v1, p1}, Ls1/N;->b([B[B)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_3

    .line 15
    .line 16
    array-length v0, v1

    .line 17
    array-length v1, p1

    .line 18
    sub-int/2addr v1, v3

    .line 19
    invoke-static {p1, v0, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    array-length v0, p1

    .line 24
    sub-int/2addr v0, v3

    .line 25
    array-length v1, p1

    .line 26
    invoke-static {p1, v0, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const/4 v0, 0x0

    .line 31
    if-nez p2, :cond_0

    .line 32
    .line 33
    new-array p2, v0, [B

    .line 34
    .line 35
    :cond_0
    const/16 v1, 0x8

    .line 36
    .line 37
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    array-length v3, p2

    .line 42
    int-to-long v3, v3

    .line 43
    const-wide/16 v6, 0x8

    .line 44
    .line 45
    mul-long/2addr v3, v6

    .line 46
    invoke-virtual {v2, v3, v4}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-static {v2, v1}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    filled-new-array {p2, v5, v1}, [[B

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-static {p2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->e([[B)[B

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    iget-object v1, p0, Ly1/f;->b:Ly1/m;

    .line 67
    .line 68
    invoke-virtual {v1, p2}, Ly1/m;->a([B)[B

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-static {p2, p1}, Ljava/security/MessageDigest;->isEqual([B[B)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-eqz p1, :cond_2

    .line 77
    .line 78
    array-length p1, v5

    .line 79
    iget-object v4, p0, Ly1/f;->a:Ly1/a;

    .line 80
    .line 81
    iget p2, v4, Ly1/a;->b:I

    .line 82
    .line 83
    if-lt p1, p2, :cond_1

    .line 84
    .line 85
    new-array v10, p2, [B

    .line 86
    .line 87
    invoke-static {v5, v0, v10, v0, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 88
    .line 89
    .line 90
    array-length p1, v5

    .line 91
    iget v6, v4, Ly1/a;->b:I

    .line 92
    .line 93
    sub-int/2addr p1, v6

    .line 94
    new-array v8, p1, [B

    .line 95
    .line 96
    array-length p1, v5

    .line 97
    sub-int v7, p1, v6

    .line 98
    .line 99
    const/4 v9, 0x0

    .line 100
    const/4 v11, 0x0

    .line 101
    invoke-virtual/range {v4 .. v11}, Ly1/a;->a([BII[BI[BZ)V

    .line 102
    .line 103
    .line 104
    return-object v8

    .line 105
    :cond_1
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 106
    .line 107
    const-string p2, "ciphertext too short"

    .line 108
    .line 109
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    throw p1

    .line 113
    :cond_2
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 114
    .line 115
    const-string p2, "invalid MAC"

    .line 116
    .line 117
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    throw p1

    .line 121
    :cond_3
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 122
    .line 123
    const-string p2, "Decryption failed (OutputPrefix mismatch)."

    .line 124
    .line 125
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    throw p1

    .line 129
    :cond_4
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 130
    .line 131
    const-string p2, "Decryption failed (ciphertext too short)."

    .line 132
    .line 133
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    throw p1
.end method
