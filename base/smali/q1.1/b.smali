.class public final Lq1/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj1/b;


# instance fields
.field public final a:Lj1/b;

.field public final b:Lx1/t0;

.field public final c:[B


# direct methods
.method public constructor <init>(Lj1/b;Lx1/t0;[B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lq1/b;->a:Lj1/b;

    .line 5
    .line 6
    iput-object p2, p0, Lq1/b;->b:Lx1/t0;

    .line 7
    .line 8
    iput-object p3, p0, Lq1/b;->c:[B

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a([B[B)[B
    .locals 3

    .line 1
    iget-object v0, p0, Lq1/b;->b:Lx1/t0;

    .line 2
    .line 3
    sget-object v1, Lx1/t0;->i:Lx1/t0;

    .line 4
    .line 5
    iget-object v2, p0, Lq1/b;->a:Lj1/b;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    invoke-interface {v2, p1, p2}, Lj1/b;->a([B[B)[B

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    return-object p1

    .line 14
    :cond_0
    iget-object v0, p0, Lq1/b;->c:[B

    .line 15
    .line 16
    invoke-interface {v2, p1, p2}, Lj1/b;->a([B[B)[B

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    filled-new-array {v0, p1}, [[B

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->e([[B)[B

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    return-object p1
.end method

.method public final b([B[B)[B
    .locals 3

    .line 1
    iget-object v0, p0, Lq1/b;->b:Lx1/t0;

    .line 2
    .line 3
    sget-object v1, Lx1/t0;->i:Lx1/t0;

    .line 4
    .line 5
    iget-object v2, p0, Lq1/b;->a:Lj1/b;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    invoke-interface {v2, p1, p2}, Lj1/b;->b([B[B)[B

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    return-object p1

    .line 14
    :cond_0
    iget-object v0, p0, Lq1/b;->c:[B

    .line 15
    .line 16
    invoke-static {v0, p1}, Ls1/N;->b([B[B)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/4 v0, 0x5

    .line 23
    array-length v1, p1

    .line 24
    invoke-static {p1, v0, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-interface {v2, p1, p2}, Lj1/b;->b([B[B)[B

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    return-object p1

    .line 33
    :cond_1
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 34
    .line 35
    const-string p2, "wrong prefix"

    .line 36
    .line 37
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    throw p1
.end method
