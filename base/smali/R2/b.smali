.class public final enum LR2/b;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum g:LR2/b;

.field public static final enum h:LR2/b;

.field public static final synthetic i:[LR2/b;


# instance fields
.field public final e:LA1/h;

.field public final f:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, LR2/b;

    .line 2
    .line 3
    new-instance v1, LA1/h;

    .line 4
    .line 5
    const/16 v2, 0x10

    .line 6
    .line 7
    invoke-direct {v1, v2}, LA1/h;-><init>(I)V

    .line 8
    .line 9
    .line 10
    const-string v2, "RSA_ECB_PKCS1Padding"

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    const/4 v4, 0x1

    .line 14
    invoke-direct {v0, v2, v3, v1, v4}, LR2/b;-><init>(Ljava/lang/String;ILA1/h;I)V

    .line 15
    .line 16
    .line 17
    sput-object v0, LR2/b;->g:LR2/b;

    .line 18
    .line 19
    new-instance v1, LR2/b;

    .line 20
    .line 21
    new-instance v2, LA1/h;

    .line 22
    .line 23
    const/16 v3, 0x11

    .line 24
    .line 25
    invoke-direct {v2, v3}, LA1/h;-><init>(I)V

    .line 26
    .line 27
    .line 28
    const-string v3, "RSA_ECB_OAEPwithSHA_256andMGF1Padding"

    .line 29
    .line 30
    const/16 v5, 0x17

    .line 31
    .line 32
    invoke-direct {v1, v3, v4, v2, v5}, LR2/b;-><init>(Ljava/lang/String;ILA1/h;I)V

    .line 33
    .line 34
    .line 35
    new-instance v2, LR2/b;

    .line 36
    .line 37
    new-instance v3, LA1/h;

    .line 38
    .line 39
    const/16 v4, 0x12

    .line 40
    .line 41
    invoke-direct {v3, v4}, LA1/h;-><init>(I)V

    .line 42
    .line 43
    .line 44
    const-string v4, "AES_GCM_NoPadding"

    .line 45
    .line 46
    const/4 v6, 0x2

    .line 47
    invoke-direct {v2, v4, v6, v3, v5}, LR2/b;-><init>(Ljava/lang/String;ILA1/h;I)V

    .line 48
    .line 49
    .line 50
    sput-object v2, LR2/b;->h:LR2/b;

    .line 51
    .line 52
    filled-new-array {v0, v1, v2}, [LR2/b;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    sput-object v0, LR2/b;->i:[LR2/b;

    .line 57
    .line 58
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILA1/h;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, LR2/b;->e:LA1/h;

    .line 5
    .line 6
    iput p4, p0, LR2/b;->f:I

    .line 7
    .line 8
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)LR2/b;
    .locals 1

    .line 1
    const-class v0, LR2/b;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LR2/b;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[LR2/b;
    .locals 1

    .line 1
    sget-object v0, LR2/b;->i:[LR2/b;

    .line 2
    .line 3
    invoke-virtual {v0}, [LR2/b;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [LR2/b;

    .line 8
    .line 9
    return-object v0
.end method
