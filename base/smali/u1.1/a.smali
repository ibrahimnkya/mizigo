.class public abstract Lu1/a;
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
    const-string v0, "type.googleapis.com/google.crypto.tink.AesCmacKey"

    .line 2
    .line 3
    invoke-static {v0}, Ls1/N;->c(Ljava/lang/String;)Lz1/a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ls1/r;

    .line 8
    .line 9
    const/4 v2, 0x6

    .line 10
    invoke-direct {v1, v2}, Ls1/r;-><init>(I)V

    .line 11
    .line 12
    .line 13
    new-instance v2, Ls1/w;

    .line 14
    .line 15
    const-class v3, Lt1/d;

    .line 16
    .line 17
    invoke-direct {v2, v3, v1}, Ls1/w;-><init>(Ljava/lang/Class;Ls1/x;)V

    .line 18
    .line 19
    .line 20
    sput-object v2, Lu1/a;->a:Ls1/w;

    .line 21
    .line 22
    new-instance v1, Ls1/r;

    .line 23
    .line 24
    const/4 v2, 0x7

    .line 25
    invoke-direct {v1, v2}, Ls1/r;-><init>(I)V

    .line 26
    .line 27
    .line 28
    new-instance v2, Ls1/u;

    .line 29
    .line 30
    invoke-direct {v2, v0, v1}, Ls1/u;-><init>(Lz1/a;Ls1/v;)V

    .line 31
    .line 32
    .line 33
    sput-object v2, Lu1/a;->b:Ls1/u;

    .line 34
    .line 35
    new-instance v1, Ls1/r;

    .line 36
    .line 37
    const/16 v2, 0x8

    .line 38
    .line 39
    invoke-direct {v1, v2}, Ls1/r;-><init>(I)V

    .line 40
    .line 41
    .line 42
    new-instance v2, Ls1/e;

    .line 43
    .line 44
    const-class v3, Lt1/a;

    .line 45
    .line 46
    invoke-direct {v2, v3, v1}, Ls1/e;-><init>(Ljava/lang/Class;Ls1/f;)V

    .line 47
    .line 48
    .line 49
    sput-object v2, Lu1/a;->c:Ls1/e;

    .line 50
    .line 51
    new-instance v1, Ls1/r;

    .line 52
    .line 53
    const/16 v2, 0x9

    .line 54
    .line 55
    invoke-direct {v1, v2}, Ls1/r;-><init>(I)V

    .line 56
    .line 57
    .line 58
    new-instance v2, Ls1/c;

    .line 59
    .line 60
    invoke-direct {v2, v0, v1}, Ls1/c;-><init>(Lz1/a;Ls1/d;)V

    .line 61
    .line 62
    .line 63
    sput-object v2, Lu1/a;->d:Ls1/c;

    .line 64
    .line 65
    return-void
.end method

.method public static a(Lt1/c;)Lx1/t0;
    .locals 3

    .line 1
    sget-object v0, Lt1/c;->b:Lt1/c;

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
    sget-object v0, Lt1/c;->c:Lt1/c;

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
    sget-object v0, Lt1/c;->e:Lt1/c;

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
    sget-object v0, Lt1/c;->d:Lt1/c;

    .line 35
    .line 36
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    sget-object p0, Lx1/t0;->h:Lx1/t0;

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_3
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 46
    .line 47
    new-instance v1, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    const-string v2, "Unable to serialize variant: "

    .line 50
    .line 51
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-direct {v0, p0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    throw v0
.end method

.method public static b(Lx1/t0;)Lt1/c;
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
    sget-object p0, Lt1/c;->c:Lt1/c;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 21
    .line 22
    new-instance v1, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v2, "Unable to parse OutputPrefixType: "

    .line 25
    .line 26
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lx1/t0;->b()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-direct {v0, p0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    throw v0

    .line 44
    :cond_1
    sget-object p0, Lt1/c;->e:Lt1/c;

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_2
    sget-object p0, Lt1/c;->d:Lt1/c;

    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_3
    sget-object p0, Lt1/c;->b:Lt1/c;

    .line 51
    .line 52
    return-object p0
.end method
