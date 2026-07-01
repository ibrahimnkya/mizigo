.class public final enum Lx1/X;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lcom/google/crypto/tink/shaded/protobuf/y;


# static fields
.field public static final enum f:Lx1/X;

.field public static final enum g:Lx1/X;

.field public static final enum h:Lx1/X;

.field public static final enum i:Lx1/X;

.field public static final enum j:Lx1/X;

.field public static final enum k:Lx1/X;

.field public static final synthetic l:[Lx1/X;


# instance fields
.field public final e:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    new-instance v0, Lx1/X;

    .line 2
    .line 3
    const-string v1, "UNKNOWN_KEYMATERIAL"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v2, v2, v1}, Lx1/X;-><init>(IILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lx1/X;->f:Lx1/X;

    .line 10
    .line 11
    new-instance v1, Lx1/X;

    .line 12
    .line 13
    const-string v2, "SYMMETRIC"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v3, v3, v2}, Lx1/X;-><init>(IILjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lx1/X;->g:Lx1/X;

    .line 20
    .line 21
    new-instance v2, Lx1/X;

    .line 22
    .line 23
    const-string v3, "ASYMMETRIC_PRIVATE"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v4, v4, v3}, Lx1/X;-><init>(IILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lx1/X;->h:Lx1/X;

    .line 30
    .line 31
    new-instance v3, Lx1/X;

    .line 32
    .line 33
    const-string v4, "ASYMMETRIC_PUBLIC"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v5, v5, v4}, Lx1/X;-><init>(IILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lx1/X;->i:Lx1/X;

    .line 40
    .line 41
    new-instance v4, Lx1/X;

    .line 42
    .line 43
    const-string v5, "REMOTE"

    .line 44
    .line 45
    const/4 v6, 0x4

    .line 46
    invoke-direct {v4, v6, v6, v5}, Lx1/X;-><init>(IILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    sput-object v4, Lx1/X;->j:Lx1/X;

    .line 50
    .line 51
    new-instance v5, Lx1/X;

    .line 52
    .line 53
    const/4 v6, 0x5

    .line 54
    const/4 v7, -0x1

    .line 55
    const-string v8, "UNRECOGNIZED"

    .line 56
    .line 57
    invoke-direct {v5, v6, v7, v8}, Lx1/X;-><init>(IILjava/lang/String;)V

    .line 58
    .line 59
    .line 60
    sput-object v5, Lx1/X;->k:Lx1/X;

    .line 61
    .line 62
    filled-new-array/range {v0 .. v5}, [Lx1/X;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    sput-object v0, Lx1/X;->l:[Lx1/X;

    .line 67
    .line 68
    return-void
.end method

.method public constructor <init>(IILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p3, p1}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Lx1/X;->e:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lx1/X;
    .locals 1

    .line 1
    const-class v0, Lx1/X;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lx1/X;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lx1/X;
    .locals 1

    .line 1
    sget-object v0, Lx1/X;->l:[Lx1/X;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lx1/X;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lx1/X;

    .line 8
    .line 9
    return-object v0
.end method
