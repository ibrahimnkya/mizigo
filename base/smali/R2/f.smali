.class public final enum LR2/f;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum g:LR2/f;

.field public static final enum h:LR2/f;

.field public static final synthetic i:[LR2/f;


# instance fields
.field public final e:LA1/h;

.field public final f:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, LR2/f;

    .line 2
    .line 3
    new-instance v1, LA1/h;

    .line 4
    .line 5
    const/16 v2, 0x13

    .line 6
    .line 7
    invoke-direct {v1, v2}, LA1/h;-><init>(I)V

    .line 8
    .line 9
    .line 10
    const-string v2, "AES_CBC_PKCS7Padding"

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    const/4 v4, 0x1

    .line 14
    invoke-direct {v0, v2, v3, v1, v4}, LR2/f;-><init>(Ljava/lang/String;ILA1/h;I)V

    .line 15
    .line 16
    .line 17
    sput-object v0, LR2/f;->g:LR2/f;

    .line 18
    .line 19
    new-instance v1, LR2/f;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    const/16 v3, 0x17

    .line 23
    .line 24
    const-string v5, "AES_GCM_NoPadding"

    .line 25
    .line 26
    invoke-direct {v1, v5, v4, v2, v3}, LR2/f;-><init>(Ljava/lang/String;ILA1/h;I)V

    .line 27
    .line 28
    .line 29
    sput-object v1, LR2/f;->h:LR2/f;

    .line 30
    .line 31
    filled-new-array {v0, v1}, [LR2/f;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, LR2/f;->i:[LR2/f;

    .line 36
    .line 37
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILA1/h;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, LR2/f;->e:LA1/h;

    .line 5
    .line 6
    iput p4, p0, LR2/f;->f:I

    .line 7
    .line 8
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)LR2/f;
    .locals 1

    .line 1
    const-class v0, LR2/f;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LR2/f;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[LR2/f;
    .locals 1

    .line 1
    sget-object v0, LR2/f;->i:[LR2/f;

    .line 2
    .line 3
    invoke-virtual {v0}, [LR2/f;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [LR2/f;

    .line 8
    .line 9
    return-object v0
.end method
