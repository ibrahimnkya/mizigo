.class public final enum LE0/e;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum e:LE0/e;

.field public static final enum f:LE0/e;

.field public static final enum g:LE0/e;

.field public static final synthetic h:[LE0/e;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, LE0/e;

    .line 2
    .line 3
    const-string v1, "NETWORK_UNMETERED"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, LE0/e;->e:LE0/e;

    .line 10
    .line 11
    new-instance v1, LE0/e;

    .line 12
    .line 13
    const-string v2, "DEVICE_IDLE"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v1, LE0/e;->f:LE0/e;

    .line 20
    .line 21
    new-instance v2, LE0/e;

    .line 22
    .line 23
    const-string v3, "DEVICE_CHARGING"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v2, LE0/e;->g:LE0/e;

    .line 30
    .line 31
    filled-new-array {v0, v1, v2}, [LE0/e;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, LE0/e;->h:[LE0/e;

    .line 36
    .line 37
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)LE0/e;
    .locals 1

    .line 1
    const-class v0, LE0/e;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LE0/e;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[LE0/e;
    .locals 1

    .line 1
    sget-object v0, LE0/e;->h:[LE0/e;

    .line 2
    .line 3
    invoke-virtual {v0}, [LE0/e;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [LE0/e;

    .line 8
    .line 9
    return-object v0
.end method
