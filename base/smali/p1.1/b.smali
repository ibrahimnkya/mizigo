.class public abstract Lp1/b;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ls1/B;

.field public static final b:Ls1/g;

.field public static final c:Lk1/h;

.field public static final d:Lk1/i;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ll1/b;

    .line 2
    .line 3
    const/16 v1, 0x18

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll1/b;-><init>(I)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ls1/B;

    .line 9
    .line 10
    const-class v2, Lp1/a;

    .line 11
    .line 12
    const-class v3, Lj1/b;

    .line 13
    .line 14
    invoke-direct {v1, v2, v3, v0}, Ls1/B;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ls1/C;)V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lp1/b;->a:Ls1/B;

    .line 18
    .line 19
    invoke-static {}, Lx1/F;->E()Lcom/google/crypto/tink/shaded/protobuf/U;

    .line 20
    .line 21
    .line 22
    new-instance v0, Ls1/g;

    .line 23
    .line 24
    const-string v1, "type.googleapis.com/google.crypto.tink.AesSivKey"

    .line 25
    .line 26
    sget-object v2, Lx1/X;->g:Lx1/X;

    .line 27
    .line 28
    invoke-direct {v0, v1, v3, v2}, Ls1/g;-><init>(Ljava/lang/String;Ljava/lang/Class;Lx1/X;)V

    .line 29
    .line 30
    .line 31
    sput-object v0, Lp1/b;->b:Ls1/g;

    .line 32
    .line 33
    new-instance v0, Lk1/h;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 36
    .line 37
    .line 38
    sput-object v0, Lp1/b;->c:Lk1/h;

    .line 39
    .line 40
    new-instance v0, Lk1/i;

    .line 41
    .line 42
    const/16 v1, 0x9

    .line 43
    .line 44
    invoke-direct {v0, v1}, Lk1/i;-><init>(I)V

    .line 45
    .line 46
    .line 47
    sput-object v0, Lp1/b;->d:Lk1/i;

    .line 48
    .line 49
    return-void
.end method

.method public static a(Lp1/d;)V
    .locals 3

    .line 1
    iget v0, p0, Lp1/d;->a:I

    .line 2
    .line 3
    const/16 v1, 0x40

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Ljava/security/InvalidAlgorithmParameterException;

    .line 9
    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v2, "invalid key size: "

    .line 13
    .line 14
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget p0, p0, Lp1/d;->a:I

    .line 18
    .line 19
    const-string v2, ". Valid keys must have 64 bytes."

    .line 20
    .line 21
    invoke-static {v1, p0, v2}, LE1/j;->l(Ljava/lang/StringBuilder;ILjava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-direct {v0, p0}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    throw v0
.end method
