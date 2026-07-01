.class public abstract Lt1/i;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ls1/B;

.field public static final b:Ls1/B;

.field public static final c:Ls1/g;

.field public static final d:Lk1/h;

.field public static final e:Lk1/i;

.field public static final f:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ls1/r;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-direct {v0, v1}, Ls1/r;-><init>(I)V

    .line 5
    .line 6
    .line 7
    new-instance v1, Ls1/B;

    .line 8
    .line 9
    const-class v2, Lt1/h;

    .line 10
    .line 11
    const-class v3, Lt1/e;

    .line 12
    .line 13
    invoke-direct {v1, v2, v3, v0}, Ls1/B;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ls1/C;)V

    .line 14
    .line 15
    .line 16
    sput-object v1, Lt1/i;->a:Ls1/B;

    .line 17
    .line 18
    new-instance v0, Ls1/r;

    .line 19
    .line 20
    const/4 v1, 0x4

    .line 21
    invoke-direct {v0, v1}, Ls1/r;-><init>(I)V

    .line 22
    .line 23
    .line 24
    new-instance v1, Ls1/B;

    .line 25
    .line 26
    const-class v3, Lj1/h;

    .line 27
    .line 28
    invoke-direct {v1, v2, v3, v0}, Ls1/B;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ls1/C;)V

    .line 29
    .line 30
    .line 31
    sput-object v1, Lt1/i;->b:Ls1/B;

    .line 32
    .line 33
    invoke-static {}, Lx1/Q;->H()Lcom/google/crypto/tink/shaded/protobuf/U;

    .line 34
    .line 35
    .line 36
    new-instance v0, Ls1/g;

    .line 37
    .line 38
    const-string v1, "type.googleapis.com/google.crypto.tink.HmacKey"

    .line 39
    .line 40
    sget-object v2, Lx1/X;->g:Lx1/X;

    .line 41
    .line 42
    invoke-direct {v0, v1, v3, v2}, Ls1/g;-><init>(Ljava/lang/String;Ljava/lang/Class;Lx1/X;)V

    .line 43
    .line 44
    .line 45
    sput-object v0, Lt1/i;->c:Ls1/g;

    .line 46
    .line 47
    new-instance v0, Lk1/h;

    .line 48
    .line 49
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 50
    .line 51
    .line 52
    sput-object v0, Lt1/i;->d:Lk1/h;

    .line 53
    .line 54
    new-instance v0, Lk1/i;

    .line 55
    .line 56
    const/16 v1, 0xc

    .line 57
    .line 58
    invoke-direct {v0, v1}, Lk1/i;-><init>(I)V

    .line 59
    .line 60
    .line 61
    sput-object v0, Lt1/i;->e:Lk1/i;

    .line 62
    .line 63
    const/4 v0, 0x2

    .line 64
    sput v0, Lt1/i;->f:I

    .line 65
    .line 66
    return-void
.end method
