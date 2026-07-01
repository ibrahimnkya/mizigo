.class public abstract Lt1/b;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lk1/i;

.field public static final b:Ls1/B;

.field public static final c:Ls1/B;

.field public static final d:Ls1/g;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lk1/i;

    .line 2
    .line 3
    const/16 v1, 0xb

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lk1/i;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lt1/b;->a:Lk1/i;

    .line 9
    .line 10
    new-instance v0, Ls1/r;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-direct {v0, v1}, Ls1/r;-><init>(I)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Ls1/B;

    .line 17
    .line 18
    const-class v2, Lt1/a;

    .line 19
    .line 20
    const-class v3, Lt1/e;

    .line 21
    .line 22
    invoke-direct {v1, v2, v3, v0}, Ls1/B;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ls1/C;)V

    .line 23
    .line 24
    .line 25
    sput-object v1, Lt1/b;->b:Ls1/B;

    .line 26
    .line 27
    new-instance v0, Ls1/r;

    .line 28
    .line 29
    const/4 v1, 0x2

    .line 30
    invoke-direct {v0, v1}, Ls1/r;-><init>(I)V

    .line 31
    .line 32
    .line 33
    new-instance v1, Ls1/B;

    .line 34
    .line 35
    const-class v3, Lj1/h;

    .line 36
    .line 37
    invoke-direct {v1, v2, v3, v0}, Ls1/B;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ls1/C;)V

    .line 38
    .line 39
    .line 40
    sput-object v1, Lt1/b;->c:Ls1/B;

    .line 41
    .line 42
    invoke-static {}, Lx1/b;->G()Lcom/google/crypto/tink/shaded/protobuf/U;

    .line 43
    .line 44
    .line 45
    new-instance v0, Ls1/g;

    .line 46
    .line 47
    const-string v1, "type.googleapis.com/google.crypto.tink.AesCmacKey"

    .line 48
    .line 49
    sget-object v2, Lx1/X;->g:Lx1/X;

    .line 50
    .line 51
    invoke-direct {v0, v1, v3, v2}, Ls1/g;-><init>(Ljava/lang/String;Ljava/lang/Class;Lx1/X;)V

    .line 52
    .line 53
    .line 54
    sput-object v0, Lt1/b;->d:Ls1/g;

    .line 55
    .line 56
    return-void
.end method
