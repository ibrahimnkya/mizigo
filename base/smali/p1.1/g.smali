.class public final Lp1/g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj1/b;


# instance fields
.field public final a:Lp1/f;

.field public final b:Ls1/A;


# direct methods
.method public constructor <init>(Lp1/f;Ls1/A;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lp1/g;->a:Lp1/f;

    .line 5
    .line 6
    iput-object p2, p0, Lp1/g;->b:Ls1/A;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a([B[B)[B
    .locals 1

    .line 1
    iget-object v0, p0, Lp1/g;->a:Lp1/f;

    .line 2
    .line 3
    iget-object v0, v0, Lp1/f;->a:Lj1/b;

    .line 4
    .line 5
    invoke-interface {v0, p1, p2}, Lj1/b;->a([B[B)[B

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    array-length p1, p1

    .line 10
    return-object p2
.end method

.method public final b([B[B)[B
    .locals 2

    .line 1
    iget-object v0, p0, Lp1/g;->b:Ls1/A;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ls1/A;->a([B)Ljava/lang/Iterable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :catch_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lp1/f;

    .line 22
    .line 23
    :try_start_0
    iget-object v1, v1, Lp1/f;->a:Lj1/b;

    .line 24
    .line 25
    invoke-interface {v1, p1, p2}, Lj1/b;->b([B[B)[B

    .line 26
    .line 27
    .line 28
    move-result-object p1
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    return-object p1

    .line 30
    :cond_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 31
    .line 32
    const-string p2, "decryption failed"

    .line 33
    .line 34
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    throw p1
.end method
