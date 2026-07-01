.class public abstract Lk1/t;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ls1/B;

.field public static final b:Lk1/i;

.field public static final c:Lk1/h;

.field public static final d:Ls1/g;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lb2/f;

    .line 2
    .line 3
    const/16 v1, 0xb

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lb2/f;-><init>(I)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ls1/B;

    .line 9
    .line 10
    const-class v2, Lk1/s;

    .line 11
    .line 12
    const-class v3, Lj1/a;

    .line 13
    .line 14
    invoke-direct {v1, v2, v3, v0}, Ls1/B;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ls1/C;)V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lk1/t;->a:Ls1/B;

    .line 18
    .line 19
    new-instance v0, Lk1/i;

    .line 20
    .line 21
    const/4 v1, 0x3

    .line 22
    invoke-direct {v0, v1}, Lk1/i;-><init>(I)V

    .line 23
    .line 24
    .line 25
    sput-object v0, Lk1/t;->b:Lk1/i;

    .line 26
    .line 27
    new-instance v0, Lk1/h;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 30
    .line 31
    .line 32
    sput-object v0, Lk1/t;->c:Lk1/h;

    .line 33
    .line 34
    invoke-static {}, Lx1/B;->E()Lcom/google/crypto/tink/shaded/protobuf/U;

    .line 35
    .line 36
    .line 37
    new-instance v0, Ls1/g;

    .line 38
    .line 39
    const-string v1, "type.googleapis.com/google.crypto.tink.AesGcmSivKey"

    .line 40
    .line 41
    sget-object v2, Lx1/X;->g:Lx1/X;

    .line 42
    .line 43
    invoke-direct {v0, v1, v3, v2}, Ls1/g;-><init>(Ljava/lang/String;Ljava/lang/Class;Lx1/X;)V

    .line 44
    .line 45
    .line 46
    sput-object v0, Lk1/t;->d:Ls1/g;

    .line 47
    .line 48
    return-void
.end method
