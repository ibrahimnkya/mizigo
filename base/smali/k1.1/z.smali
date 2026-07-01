.class public final Lk1/z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj1/a;


# static fields
.field public static final d:[B

.field public static final e:Ljava/util/Set;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lj1/i;

.field public final c:Lr1/b;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    sput-object v0, Lk1/z;->d:[B

    .line 5
    .line 6
    new-instance v0, Ljava/util/HashSet;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "type.googleapis.com/google.crypto.tink.AesGcmKey"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    const-string v1, "type.googleapis.com/google.crypto.tink.ChaCha20Poly1305Key"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    const-string v1, "type.googleapis.com/google.crypto.tink.XChaCha20Poly1305Key"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    const-string v1, "type.googleapis.com/google.crypto.tink.AesCtrHmacAeadKey"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    const-string v1, "type.googleapis.com/google.crypto.tink.AesGcmSivKey"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    const-string v1, "type.googleapis.com/google.crypto.tink.AesEaxKey"

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, Lk1/z;->e:Ljava/util/Set;

    .line 46
    .line 47
    return-void
.end method

.method public constructor <init>(Lx1/b0;Lr1/b;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Lk1/z;->e:Ljava/util/Set;

    .line 9
    .line 10
    invoke-interface {v1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lk1/z;->a:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p1}, Lx1/b0;->H(Lx1/b0;)Lx1/a0;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    sget-object v0, Lx1/t0;->i:Lx1/t0;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Lx1/a0;->h(Lx1/t0;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    check-cast p1, Lx1/b0;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/a;->e()[B

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {p1}, LT0/a;->E([B)Lj1/i;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iput-object p1, p0, Lk1/z;->b:Lj1/i;

    .line 46
    .line 47
    iput-object p2, p0, Lk1/z;->c:Lr1/b;

    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    new-instance p2, Ljava/lang/IllegalArgumentException;

    .line 51
    .line 52
    new-instance v0, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    const-string v1, "Unsupported DEK key type: "

    .line 55
    .line 56
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Lx1/b0;->E()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string p1, ". Only Tink AEAD key types are supported."

    .line 67
    .line 68
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    throw p2
.end method


# virtual methods
.method public final a([B[B)[B
    .locals 4

    .line 1
    sget-object v0, Ls1/l;->b:Ls1/l;

    .line 2
    .line 3
    iget-object v1, p0, Lk1/z;->b:Lj1/i;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {v0, v1, v2}, Ls1/l;->b(Lj1/i;Ljava/lang/Integer;)Landroid/support/v4/media/session/a;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget-object v1, Ls1/s;->b:Ls1/s;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ls1/s;->g(Landroid/support/v4/media/session/a;)Ls1/J;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ls1/G;

    .line 17
    .line 18
    iget-object v1, v1, Ls1/G;->c:Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/i;->f()[B

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object v2, p0, Lk1/z;->c:Lr1/b;

    .line 25
    .line 26
    sget-object v3, Lk1/z;->d:[B

    .line 27
    .line 28
    invoke-virtual {v2, v1, v3}, Lr1/b;->a([B[B)[B

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    array-length v2, v1

    .line 33
    const/16 v3, 0x1000

    .line 34
    .line 35
    if-gt v2, v3, :cond_0

    .line 36
    .line 37
    sget-object v2, Ls1/q;->b:Ls1/q;

    .line 38
    .line 39
    const-class v3, Lj1/a;

    .line 40
    .line 41
    invoke-virtual {v2, v0, v3}, Ls1/q;->a(Landroid/support/v4/media/session/a;Ljava/lang/Class;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lj1/a;

    .line 46
    .line 47
    invoke-interface {v0, p1, p2}, Lj1/a;->a([B[B)[B

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    array-length p2, v1

    .line 52
    add-int/lit8 p2, p2, 0x4

    .line 53
    .line 54
    array-length v0, p1

    .line 55
    add-int/2addr p2, v0

    .line 56
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    array-length v0, v1

    .line 61
    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    invoke-virtual {p2, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    invoke-virtual {p2, p1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    return-object p1

    .line 78
    :cond_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 79
    .line 80
    const-string p2, "length of encrypted DEK too large"

    .line 81
    .line 82
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    throw p1
.end method

.method public final b([B[B)[B
    .locals 5

    .line 1
    :try_start_0
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-lez v1, :cond_0

    .line 10
    .line 11
    const/16 v2, 0x1000

    .line 12
    .line 13
    if-gt v1, v2, :cond_0

    .line 14
    .line 15
    array-length p1, p1

    .line 16
    add-int/lit8 p1, p1, -0x4

    .line 17
    .line 18
    if-gt v1, p1, :cond_0

    .line 19
    .line 20
    new-array p1, v1, [B

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-virtual {v0, p1, v2, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/nio/Buffer;->remaining()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    new-array v1, v1, [B

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/nio/Buffer;->remaining()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    invoke-virtual {v0, v1, v2, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lk1/z;->c:Lr1/b;

    .line 40
    .line 41
    sget-object v3, Lk1/z;->d:[B

    .line 42
    .line 43
    invoke-virtual {v0, p1, v3}, Lr1/b;->b([B[B)[B

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iget-object v0, p0, Lk1/z;->a:Ljava/lang/String;

    .line 48
    .line 49
    sget-object v3, Lcom/google/crypto/tink/shaded/protobuf/i;->f:Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 50
    .line 51
    array-length v3, p1

    .line 52
    invoke-static {p1, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/i;->d([BII)Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    sget-object v2, Lx1/X;->g:Lx1/X;

    .line 57
    .line 58
    sget-object v3, Lx1/t0;->i:Lx1/t0;

    .line 59
    .line 60
    const/4 v4, 0x0

    .line 61
    invoke-static {v0, p1, v2, v3, v4}, Ls1/G;->a(Ljava/lang/String;Lcom/google/crypto/tink/shaded/protobuf/i;Lx1/X;Lx1/t0;Ljava/lang/Integer;)Ls1/G;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    sget-object v0, Ls1/s;->b:Ls1/s;

    .line 66
    .line 67
    invoke-virtual {v0, p1}, Ls1/s;->a(Ls1/G;)Landroid/support/v4/media/session/a;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    sget-object v0, Ls1/q;->b:Ls1/q;

    .line 72
    .line 73
    const-class v2, Lj1/a;

    .line 74
    .line 75
    invoke-virtual {v0, p1, v2}, Ls1/q;->a(Landroid/support/v4/media/session/a;Ljava/lang/Class;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    check-cast p1, Lj1/a;

    .line 80
    .line 81
    invoke-interface {p1, v1, p2}, Lj1/a;->b([B[B)[B

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    return-object p1

    .line 86
    :catch_0
    move-exception p1

    .line 87
    goto :goto_0

    .line 88
    :catch_1
    move-exception p1

    .line 89
    goto :goto_0

    .line 90
    :catch_2
    move-exception p1

    .line 91
    goto :goto_0

    .line 92
    :cond_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 93
    .line 94
    const-string p2, "length of encrypted DEK too large"

    .line 95
    .line 96
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    throw p1
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/nio/BufferUnderflowException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NegativeArraySizeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    :goto_0
    new-instance p2, Ljava/security/GeneralSecurityException;

    .line 101
    .line 102
    const-string v0, "invalid ciphertext"

    .line 103
    .line 104
    invoke-direct {p2, v0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 105
    .line 106
    .line 107
    throw p2
.end method
