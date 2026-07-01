.class public final Ld3/c;
.super Landroid/media/MediaDataSource;
.source "SourceFile"


# instance fields
.field public final synthetic e:[B


# direct methods
.method public constructor <init>([B)V
    .locals 0

    .line 1
    iput-object p1, p0, Ld3/c;->e:[B

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/media/MediaDataSource;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final close()V
    .locals 0

    .line 1
    return-void
.end method

.method public final getSize()J
    .locals 2

    .line 1
    iget-object v0, p0, Ld3/c;->e:[B

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    int-to-long v0, v0

    .line 5
    return-wide v0
.end method

.method public final readAt(J[BII)I
    .locals 5

    .line 1
    iget-object v0, p0, Ld3/c;->e:[B

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    int-to-long v1, v1

    .line 5
    cmp-long v1, p1, v1

    .line 6
    .line 7
    if-ltz v1, :cond_0

    .line 8
    .line 9
    const/4 p1, -0x1

    .line 10
    return p1

    .line 11
    :cond_0
    int-to-long v1, p5

    .line 12
    add-long/2addr v1, p1

    .line 13
    array-length v3, v0

    .line 14
    int-to-long v3, v3

    .line 15
    cmp-long v1, v1, v3

    .line 16
    .line 17
    if-lez v1, :cond_1

    .line 18
    .line 19
    array-length p5, v0

    .line 20
    int-to-long v1, p5

    .line 21
    sub-long/2addr v1, p1

    .line 22
    long-to-int p5, v1

    .line 23
    :cond_1
    long-to-int p1, p1

    .line 24
    invoke-static {v0, p1, p3, p4, p5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 25
    .line 26
    .line 27
    return p5
.end method
