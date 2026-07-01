.class public final Lx2/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field public e:[I

.field public f:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lx2/a;->f:I

    .line 5
    .line 6
    add-int/lit8 p1, p1, 0x1f

    .line 7
    .line 8
    div-int/lit8 p1, p1, 0x20

    .line 9
    .line 10
    new-array p1, p1, [I

    .line 11
    .line 12
    iput-object p1, p0, Lx2/a;->e:[I

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final a(I)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lx2/a;->e:[I

    .line 2
    .line 3
    div-int/lit8 v1, p1, 0x20

    .line 4
    .line 5
    aget v0, v0, v1

    .line 6
    .line 7
    and-int/lit8 p1, p1, 0x1f

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    shl-int p1, v1, p1

    .line 11
    .line 12
    and-int/2addr p1, v0

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    return v1

    .line 16
    :cond_0
    const/4 p1, 0x0

    .line 17
    return p1
.end method

.method public final b(I)I
    .locals 4

    .line 1
    iget v0, p0, Lx2/a;->f:I

    .line 2
    .line 3
    if-lt p1, v0, :cond_0

    .line 4
    .line 5
    return v0

    .line 6
    :cond_0
    div-int/lit8 v1, p1, 0x20

    .line 7
    .line 8
    iget-object v2, p0, Lx2/a;->e:[I

    .line 9
    .line 10
    aget v2, v2, v1

    .line 11
    .line 12
    and-int/lit8 p1, p1, 0x1f

    .line 13
    .line 14
    const/4 v3, 0x1

    .line 15
    shl-int p1, v3, p1

    .line 16
    .line 17
    neg-int p1, p1

    .line 18
    and-int/2addr p1, v2

    .line 19
    :goto_0
    if-nez p1, :cond_2

    .line 20
    .line 21
    add-int/lit8 v1, v1, 0x1

    .line 22
    .line 23
    iget-object p1, p0, Lx2/a;->e:[I

    .line 24
    .line 25
    array-length v2, p1

    .line 26
    if-ne v1, v2, :cond_1

    .line 27
    .line 28
    return v0

    .line 29
    :cond_1
    aget p1, p1, v1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    mul-int/lit8 v1, v1, 0x20

    .line 33
    .line 34
    invoke-static {p1}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    add-int/2addr p1, v1

    .line 39
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    return p1
.end method

.method public final c(I)I
    .locals 4

    .line 1
    iget v0, p0, Lx2/a;->f:I

    .line 2
    .line 3
    if-lt p1, v0, :cond_0

    .line 4
    .line 5
    return v0

    .line 6
    :cond_0
    div-int/lit8 v1, p1, 0x20

    .line 7
    .line 8
    iget-object v2, p0, Lx2/a;->e:[I

    .line 9
    .line 10
    aget v2, v2, v1

    .line 11
    .line 12
    not-int v2, v2

    .line 13
    and-int/lit8 p1, p1, 0x1f

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    shl-int p1, v3, p1

    .line 17
    .line 18
    neg-int p1, p1

    .line 19
    and-int/2addr p1, v2

    .line 20
    :goto_0
    if-nez p1, :cond_2

    .line 21
    .line 22
    add-int/lit8 v1, v1, 0x1

    .line 23
    .line 24
    iget-object p1, p0, Lx2/a;->e:[I

    .line 25
    .line 26
    array-length v2, p1

    .line 27
    if-ne v1, v2, :cond_1

    .line 28
    .line 29
    return v0

    .line 30
    :cond_1
    aget p1, p1, v1

    .line 31
    .line 32
    not-int p1, p1

    .line 33
    goto :goto_0

    .line 34
    :cond_2
    mul-int/lit8 v1, v1, 0x20

    .line 35
    .line 36
    invoke-static {p1}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    add-int/2addr p1, v1

    .line 41
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    return p1
.end method

.method public final clone()Ljava/lang/Object;
    .locals 3

    .line 1
    new-instance v0, Lx2/a;

    .line 2
    .line 3
    iget-object v1, p0, Lx2/a;->e:[I

    .line 4
    .line 5
    invoke-virtual {v1}, [I->clone()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, [I

    .line 10
    .line 11
    iget v2, p0, Lx2/a;->f:I

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, v0, Lx2/a;->e:[I

    .line 17
    .line 18
    iput v2, v0, Lx2/a;->f:I

    .line 19
    .line 20
    return-object v0
.end method

.method public final d(II)Z
    .locals 8

    .line 1
    if-lt p2, p1, :cond_5

    .line 2
    .line 3
    if-ltz p1, :cond_5

    .line 4
    .line 5
    iget v0, p0, Lx2/a;->f:I

    .line 6
    .line 7
    if-gt p2, v0, :cond_5

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-ne p2, p1, :cond_0

    .line 11
    .line 12
    goto :goto_3

    .line 13
    :cond_0
    add-int/lit8 p2, p2, -0x1

    .line 14
    .line 15
    div-int/lit8 v1, p1, 0x20

    .line 16
    .line 17
    div-int/lit8 v2, p2, 0x20

    .line 18
    .line 19
    move v3, v1

    .line 20
    :goto_0
    if-gt v3, v2, :cond_4

    .line 21
    .line 22
    const/16 v4, 0x1f

    .line 23
    .line 24
    const/4 v5, 0x0

    .line 25
    if-le v3, v1, :cond_1

    .line 26
    .line 27
    move v6, v5

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    and-int/lit8 v6, p1, 0x1f

    .line 30
    .line 31
    :goto_1
    if-ge v3, v2, :cond_2

    .line 32
    .line 33
    goto :goto_2

    .line 34
    :cond_2
    and-int/2addr v4, p2

    .line 35
    :goto_2
    const/4 v7, 0x2

    .line 36
    shl-int v4, v7, v4

    .line 37
    .line 38
    shl-int v6, v0, v6

    .line 39
    .line 40
    sub-int/2addr v4, v6

    .line 41
    iget-object v6, p0, Lx2/a;->e:[I

    .line 42
    .line 43
    aget v6, v6, v3

    .line 44
    .line 45
    and-int/2addr v4, v6

    .line 46
    if-eqz v4, :cond_3

    .line 47
    .line 48
    return v5

    .line 49
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_4
    :goto_3
    return v0

    .line 53
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 54
    .line 55
    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 56
    .line 57
    .line 58
    throw p1
.end method

.method public final e()V
    .locals 8

    .line 1
    iget-object v0, p0, Lx2/a;->e:[I

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    new-array v0, v0, [I

    .line 5
    .line 6
    iget v1, p0, Lx2/a;->f:I

    .line 7
    .line 8
    add-int/lit8 v2, v1, -0x1

    .line 9
    .line 10
    div-int/lit8 v2, v2, 0x20

    .line 11
    .line 12
    add-int/lit8 v3, v2, 0x1

    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    move v5, v4

    .line 16
    :goto_0
    if-ge v5, v3, :cond_0

    .line 17
    .line 18
    sub-int v6, v2, v5

    .line 19
    .line 20
    iget-object v7, p0, Lx2/a;->e:[I

    .line 21
    .line 22
    aget v7, v7, v5

    .line 23
    .line 24
    invoke-static {v7}, Ljava/lang/Integer;->reverse(I)I

    .line 25
    .line 26
    .line 27
    move-result v7

    .line 28
    aput v7, v0, v6

    .line 29
    .line 30
    add-int/lit8 v5, v5, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    mul-int/lit8 v5, v3, 0x20

    .line 34
    .line 35
    if-eq v1, v5, :cond_2

    .line 36
    .line 37
    sub-int/2addr v5, v1

    .line 38
    aget v1, v0, v4

    .line 39
    .line 40
    ushr-int/2addr v1, v5

    .line 41
    const/4 v4, 0x1

    .line 42
    :goto_1
    if-ge v4, v3, :cond_1

    .line 43
    .line 44
    aget v6, v0, v4

    .line 45
    .line 46
    rsub-int/lit8 v7, v5, 0x20

    .line 47
    .line 48
    shl-int v7, v6, v7

    .line 49
    .line 50
    or-int/2addr v1, v7

    .line 51
    add-int/lit8 v7, v4, -0x1

    .line 52
    .line 53
    aput v1, v0, v7

    .line 54
    .line 55
    ushr-int v1, v6, v5

    .line 56
    .line 57
    add-int/lit8 v4, v4, 0x1

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_1
    aput v1, v0, v2

    .line 61
    .line 62
    :cond_2
    iput-object v0, p0, Lx2/a;->e:[I

    .line 63
    .line 64
    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Lx2/a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    check-cast p1, Lx2/a;

    .line 8
    .line 9
    iget v0, p0, Lx2/a;->f:I

    .line 10
    .line 11
    iget v2, p1, Lx2/a;->f:I

    .line 12
    .line 13
    if-ne v0, v2, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lx2/a;->e:[I

    .line 16
    .line 17
    iget-object p1, p1, Lx2/a;->e:[I

    .line 18
    .line 19
    invoke-static {v0, p1}, Ljava/util/Arrays;->equals([I[I)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    return p1

    .line 27
    :cond_1
    return v1
.end method

.method public final f(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lx2/a;->e:[I

    .line 2
    .line 3
    div-int/lit8 v1, p1, 0x20

    .line 4
    .line 5
    aget v2, v0, v1

    .line 6
    .line 7
    and-int/lit8 p1, p1, 0x1f

    .line 8
    .line 9
    const/4 v3, 0x1

    .line 10
    shl-int p1, v3, p1

    .line 11
    .line 12
    or-int/2addr p1, v2

    .line 13
    aput p1, v0, v1

    .line 14
    .line 15
    return-void
.end method

.method public final hashCode()I
    .locals 2

    .line 1
    iget v0, p0, Lx2/a;->f:I

    .line 2
    .line 3
    mul-int/lit8 v0, v0, 0x1f

    .line 4
    .line 5
    iget-object v1, p0, Lx2/a;->e:[I

    .line 6
    .line 7
    invoke-static {v1}, Ljava/util/Arrays;->hashCode([I)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    add-int/2addr v1, v0

    .line 12
    return v1
.end method

.method public final toString()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    iget v1, p0, Lx2/a;->f:I

    .line 4
    .line 5
    div-int/lit8 v2, v1, 0x8

    .line 6
    .line 7
    add-int/2addr v2, v1

    .line 8
    add-int/lit8 v2, v2, 0x1

    .line 9
    .line 10
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 11
    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    :goto_0
    if-ge v2, v1, :cond_2

    .line 15
    .line 16
    and-int/lit8 v3, v2, 0x7

    .line 17
    .line 18
    if-nez v3, :cond_0

    .line 19
    .line 20
    const/16 v3, 0x20

    .line 21
    .line 22
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-virtual {p0, v2}, Lx2/a;->a(I)Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_1

    .line 30
    .line 31
    const/16 v3, 0x58

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    const/16 v3, 0x2e

    .line 35
    .line 36
    :goto_1
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    add-int/lit8 v2, v2, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    return-object v0
.end method
