.class public final Ls1/i;
.super Landroid/support/v4/media/session/a;
.source "SourceFile"


# instance fields
.field public final d:Ls1/G;


# direct methods
.method public constructor <init>(Ls1/G;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Ls1/G;->d:Lx1/X;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ls1/i;->d:Ls1/G;

    .line 10
    .line 11
    return-void
.end method

.method public static d0(Ls1/G;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/G;->d:Lx1/X;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final c0()Lz1/a;
    .locals 3

    .line 1
    iget-object v0, p0, Ls1/i;->d:Ls1/G;

    .line 2
    .line 3
    iget-object v1, v0, Ls1/G;->e:Lx1/t0;

    .line 4
    .line 5
    iget-object v0, v0, Ls1/G;->f:Ljava/lang/Integer;

    .line 6
    .line 7
    sget-object v2, Lx1/t0;->i:Lx1/t0;

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    new-array v0, v0, [B

    .line 17
    .line 18
    invoke-static {v0}, Lz1/a;->a([B)Lz1/a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    return-object v0

    .line 23
    :cond_0
    sget-object v2, Lx1/t0;->g:Lx1/t0;

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-static {v0}, Ls1/t;->b(I)Lz1/a;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    return-object v0

    .line 40
    :cond_1
    sget-object v2, Lx1/t0;->h:Lx1/t0;

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-nez v2, :cond_3

    .line 47
    .line 48
    sget-object v2, Lx1/t0;->j:Lx1/t0;

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_2

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 58
    .line 59
    const-string v1, "Unknown output prefix type"

    .line 60
    .line 61
    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    throw v0

    .line 65
    :cond_3
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    invoke-static {v0}, Ls1/t;->a(I)Lz1/a;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    return-object v0
.end method

.method public final n()Ljava/lang/Integer;
    .locals 1

    .line 1
    iget-object v0, p0, Ls1/i;->d:Ls1/G;

    .line 2
    .line 3
    iget-object v0, v0, Ls1/G;->f:Ljava/lang/Integer;

    .line 4
    .line 5
    return-object v0
.end method

.method public final p()Lj1/i;
    .locals 3

    .line 1
    new-instance v0, Ls1/h;

    .line 2
    .line 3
    iget-object v1, p0, Ls1/i;->d:Ls1/G;

    .line 4
    .line 5
    iget-object v2, v1, Ls1/G;->a:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v1, v1, Ls1/G;->e:Lx1/t0;

    .line 8
    .line 9
    invoke-direct {v0, v2, v1}, Ls1/h;-><init>(Ljava/lang/String;Lx1/t0;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method
