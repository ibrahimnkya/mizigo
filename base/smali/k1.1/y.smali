.class public abstract Lk1/y;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ls1/B;

.field public static final b:Ls1/g;

.field public static final c:Lk1/i;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lb2/f;

    .line 2
    .line 3
    const/16 v1, 0xd

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lb2/f;-><init>(I)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ls1/B;

    .line 9
    .line 10
    const-class v2, Lk1/B;

    .line 11
    .line 12
    const-class v3, Lj1/a;

    .line 13
    .line 14
    invoke-direct {v1, v2, v3, v0}, Ls1/B;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ls1/C;)V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lk1/y;->a:Ls1/B;

    .line 18
    .line 19
    invoke-static {}, Lx1/m0;->E()Lcom/google/crypto/tink/shaded/protobuf/U;

    .line 20
    .line 21
    .line 22
    new-instance v0, Ls1/g;

    .line 23
    .line 24
    const-string v1, "type.googleapis.com/google.crypto.tink.KmsAeadKey"

    .line 25
    .line 26
    sget-object v2, Lx1/X;->j:Lx1/X;

    .line 27
    .line 28
    invoke-direct {v0, v1, v3, v2}, Ls1/g;-><init>(Ljava/lang/String;Ljava/lang/Class;Lx1/X;)V

    .line 29
    .line 30
    .line 31
    sput-object v0, Lk1/y;->b:Ls1/g;

    .line 32
    .line 33
    new-instance v0, Lk1/i;

    .line 34
    .line 35
    const/4 v1, 0x5

    .line 36
    invoke-direct {v0, v1}, Lk1/i;-><init>(I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lk1/y;->c:Lk1/i;

    .line 40
    .line 41
    return-void
.end method
