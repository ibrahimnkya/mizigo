.class public final LI2/m;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:I


# direct methods
.method public constructor <init>(IZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p2, p0, LI2/m;->a:Z

    .line 5
    .line 6
    iput p1, p0, LI2/m;->b:I

    .line 7
    .line 8
    return-void
.end method

.method public static a(I)LI2/m;
    .locals 2

    .line 1
    new-instance v0, LI2/m;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, LI2/m;-><init>(IZ)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public static b(I)LI2/m;
    .locals 2

    .line 1
    new-instance v0, LI2/m;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, p0, v1}, LI2/m;-><init>(IZ)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method
