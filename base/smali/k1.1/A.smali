.class public abstract Lk1/A;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ls1/g;

.field public static final b:Lk1/i;

.field public static final c:Ls1/B;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    invoke-static {}, Lx1/q0;->E()Lcom/google/crypto/tink/shaded/protobuf/U;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ls1/g;

    .line 5
    .line 6
    const-string v1, "type.googleapis.com/google.crypto.tink.KmsEnvelopeAeadKey"

    .line 7
    .line 8
    const-class v2, Lj1/a;

    .line 9
    .line 10
    sget-object v3, Lx1/X;->g:Lx1/X;

    .line 11
    .line 12
    invoke-direct {v0, v1, v2, v3}, Ls1/g;-><init>(Ljava/lang/String;Ljava/lang/Class;Lx1/X;)V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lk1/A;->a:Ls1/g;

    .line 16
    .line 17
    new-instance v0, Lk1/i;

    .line 18
    .line 19
    const/4 v1, 0x6

    .line 20
    invoke-direct {v0, v1}, Lk1/i;-><init>(I)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lk1/A;->b:Lk1/i;

    .line 24
    .line 25
    new-instance v0, Lb2/f;

    .line 26
    .line 27
    const/16 v1, 0xe

    .line 28
    .line 29
    invoke-direct {v0, v1}, Lb2/f;-><init>(I)V

    .line 30
    .line 31
    .line 32
    new-instance v1, Ls1/B;

    .line 33
    .line 34
    const-class v3, Lk1/E;

    .line 35
    .line 36
    invoke-direct {v1, v3, v2, v0}, Ls1/B;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ls1/C;)V

    .line 37
    .line 38
    .line 39
    sput-object v1, Lk1/A;->c:Ls1/B;

    .line 40
    .line 41
    return-void
.end method
