.class public abstract Lk1/w;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ls1/B;

.field public static final b:Lk1/i;

.field public static final c:Ls1/g;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lb2/f;

    .line 2
    .line 3
    const/16 v1, 0xc

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lb2/f;-><init>(I)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ls1/B;

    .line 9
    .line 10
    const-class v2, Lk1/v;

    .line 11
    .line 12
    const-class v3, Lj1/a;

    .line 13
    .line 14
    invoke-direct {v1, v2, v3, v0}, Ls1/B;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ls1/C;)V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lk1/w;->a:Ls1/B;

    .line 18
    .line 19
    new-instance v0, Lk1/i;

    .line 20
    .line 21
    const/4 v1, 0x4

    .line 22
    invoke-direct {v0, v1}, Lk1/i;-><init>(I)V

    .line 23
    .line 24
    .line 25
    sput-object v0, Lk1/w;->b:Lk1/i;

    .line 26
    .line 27
    invoke-static {}, Lx1/J;->E()Lcom/google/crypto/tink/shaded/protobuf/U;

    .line 28
    .line 29
    .line 30
    new-instance v0, Ls1/g;

    .line 31
    .line 32
    const-string v1, "type.googleapis.com/google.crypto.tink.ChaCha20Poly1305Key"

    .line 33
    .line 34
    sget-object v2, Lx1/X;->g:Lx1/X;

    .line 35
    .line 36
    invoke-direct {v0, v1, v3, v2}, Ls1/g;-><init>(Ljava/lang/String;Ljava/lang/Class;Lx1/X;)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lk1/w;->c:Ls1/g;

    .line 40
    .line 41
    return-void
.end method
