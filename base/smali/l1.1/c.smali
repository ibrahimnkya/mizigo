.class public abstract Ll1/c;
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
    const-string v0, "type.googleapis.com/google.crypto.tink.AesEaxKey"

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
    const/16 v2, 0x1d

    .line 10
    .line 11
    invoke-direct {v1, v2}, Lb2/f;-><init>(I)V

    .line 12
    .line 13
    .line 14
    new-instance v2, Ls1/w;

    .line 15
    .line 16
    const-class v3, Lk1/o;

    .line 17
    .line 18
    invoke-direct {v2, v3, v1}, Ls1/w;-><init>(Ljava/lang/Class;Ls1/x;)V

    .line 19
    .line 20
    .line 21
    sput-object v2, Ll1/c;->a:Ls1/w;

    .line 22
    .line 23
    new-instance v1, Ll1/b;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-direct {v1, v2}, Ll1/b;-><init>(I)V

    .line 27
    .line 28
    .line 29
    new-instance v2, Ls1/u;

    .line 30
    .line 31
    invoke-direct {v2, v0, v1}, Ls1/u;-><init>(Lz1/a;Ls1/v;)V

    .line 32
    .line 33
    .line 34
    sput-object v2, Ll1/c;->b:Ls1/u;

    .line 35
    .line 36
    new-instance v1, Ll1/b;

    .line 37
    .line 38
    const/4 v2, 0x1

    .line 39
    invoke-direct {v1, v2}, Ll1/b;-><init>(I)V

    .line 40
    .line 41
    .line 42
    new-instance v2, Ls1/e;

    .line 43
    .line 44
    const-class v3, Lk1/m;

    .line 45
    .line 46
    invoke-direct {v2, v3, v1}, Ls1/e;-><init>(Ljava/lang/Class;Ls1/f;)V

    .line 47
    .line 48
    .line 49
    sput-object v2, Ll1/c;->c:Ls1/e;

    .line 50
    .line 51
    new-instance v1, Ll1/b;

    .line 52
    .line 53
    const/4 v2, 0x2

    .line 54
    invoke-direct {v1, v2}, Ll1/b;-><init>(I)V

    .line 55
    .line 56
    .line 57
    new-instance v2, Ls1/c;

    .line 58
    .line 59
    invoke-direct {v2, v0, v1}, Ls1/c;-><init>(Lz1/a;Ls1/d;)V

    .line 60
    .line 61
    .line 62
    sput-object v2, Ll1/c;->d:Ls1/c;

    .line 63
    .line 64
    return-void
.end method

.method public static a(Lk1/o;)Lx1/v;
    .locals 2

    .line 1
    iget v0, p0, Lk1/o;->c:I

    .line 2
    .line 3
    const/16 v1, 0x10

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lx1/v;->C()Lx1/u;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget p0, p0, Lk1/o;->b:I

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->e()V

    .line 14
    .line 15
    .line 16
    iget-object v1, v0, Lcom/google/crypto/tink/shaded/protobuf/u;->f:Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 17
    .line 18
    check-cast v1, Lx1/v;

    .line 19
    .line 20
    invoke-static {v1, p0}, Lx1/v;->z(Lx1/v;I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/u;->b()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lx1/v;

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_0
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 31
    .line 32
    iget p0, p0, Lk1/o;->c:I

    .line 33
    .line 34
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string v1, "Invalid tag size in bytes %d. Currently Tink only supports aes eax keys with tag size equal to 16 bytes."

    .line 43
    .line 44
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-direct {v0, p0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    throw v0
.end method

.method public static b(Lk1/k;)Lx1/t0;
    .locals 3

    .line 1
    sget-object v0, Lk1/k;->k:Lk1/k;

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
    sget-object v0, Lk1/k;->l:Lk1/k;

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
    sget-object p0, Lx1/t0;->j:Lx1/t0;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    sget-object v0, Lk1/k;->m:Lk1/k;

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    sget-object p0, Lx1/t0;->i:Lx1/t0;

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_2
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 35
    .line 36
    new-instance v1, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    const-string v2, "Unable to serialize variant: "

    .line 39
    .line 40
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-direct {v0, p0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    throw v0
.end method

.method public static c(Lx1/t0;)Lk1/k;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_3

    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    if-eq v0, v1, :cond_2

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    if-eq v0, v1, :cond_1

    .line 13
    .line 14
    const/4 v1, 0x4

    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 19
    .line 20
    new-instance v1, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v2, "Unable to parse OutputPrefixType: "

    .line 23
    .line 24
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lx1/t0;->b()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-direct {v0, p0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    throw v0

    .line 42
    :cond_1
    sget-object p0, Lk1/k;->m:Lk1/k;

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_2
    :goto_0
    sget-object p0, Lk1/k;->l:Lk1/k;

    .line 46
    .line 47
    return-object p0

    .line 48
    :cond_3
    sget-object p0, Lk1/k;->k:Lk1/k;

    .line 49
    .line 50
    return-object p0
.end method
