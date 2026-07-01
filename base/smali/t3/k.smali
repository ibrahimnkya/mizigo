.class public final enum Lt3/k;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum f:Lt3/k;

.field public static final enum g:Lt3/k;

.field public static final synthetic h:[Lt3/k;


# instance fields
.field public final e:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lt3/k;

    .line 2
    .line 3
    const-string v1, "IMAGE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v2, v2, v1}, Lt3/k;-><init>(IILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lt3/k;->f:Lt3/k;

    .line 10
    .line 11
    new-instance v1, Lt3/k;

    .line 12
    .line 13
    const-string v2, "VIDEO"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v3, v3, v2}, Lt3/k;-><init>(IILjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lt3/k;->g:Lt3/k;

    .line 20
    .line 21
    filled-new-array {v0, v1}, [Lt3/k;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Lt3/k;->h:[Lt3/k;

    .line 26
    .line 27
    return-void
.end method

.method public constructor <init>(IILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p3, p1}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Lt3/k;->e:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lt3/k;
    .locals 1

    .line 1
    const-class v0, Lt3/k;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lt3/k;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lt3/k;
    .locals 1

    .line 1
    sget-object v0, Lt3/k;->h:[Lt3/k;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lt3/k;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lt3/k;

    .line 8
    .line 9
    return-object v0
.end method
