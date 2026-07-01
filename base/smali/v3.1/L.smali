.class public final enum Lv3/L;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final f:LN0/f;

.field public static final enum g:Lv3/L;

.field public static final enum h:Lv3/L;

.field public static final enum i:Lv3/L;

.field public static final synthetic j:[Lv3/L;


# instance fields
.field public final e:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lv3/L;

    .line 2
    .line 3
    const-string v1, "PLATFORM_ENCODED"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v2, v2, v1}, Lv3/L;-><init>(IILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lv3/L;->g:Lv3/L;

    .line 10
    .line 11
    new-instance v1, Lv3/L;

    .line 12
    .line 13
    const-string v2, "JSON_ENCODED"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v3, v3, v2}, Lv3/L;-><init>(IILjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lv3/L;->h:Lv3/L;

    .line 20
    .line 21
    new-instance v2, Lv3/L;

    .line 22
    .line 23
    const-string v3, "UNEXPECTED_STRING"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v4, v4, v3}, Lv3/L;-><init>(IILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lv3/L;->i:Lv3/L;

    .line 30
    .line 31
    filled-new-array {v0, v1, v2}, [Lv3/L;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lv3/L;->j:[Lv3/L;

    .line 36
    .line 37
    new-instance v0, LN0/f;

    .line 38
    .line 39
    const/16 v1, 0x13

    .line 40
    .line 41
    invoke-direct {v0, v1}, LN0/f;-><init>(I)V

    .line 42
    .line 43
    .line 44
    sput-object v0, Lv3/L;->f:LN0/f;

    .line 45
    .line 46
    return-void
.end method

.method public constructor <init>(IILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p3, p1}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Lv3/L;->e:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lv3/L;
    .locals 1

    .line 1
    const-class v0, Lv3/L;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lv3/L;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lv3/L;
    .locals 1

    .line 1
    sget-object v0, Lv3/L;->j:[Lv3/L;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lv3/L;

    .line 8
    .line 9
    return-object v0
.end method
