.class public abstract Lk1/j;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ls1/B;

.field public static final b:Ls1/g;

.field public static final c:Lk1/h;

.field public static final d:Lk1/i;

.field public static final e:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lb2/f;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lb2/f;-><init>(I)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ls1/B;

    .line 9
    .line 10
    const-class v2, Lk1/g;

    .line 11
    .line 12
    const-class v3, Lj1/a;

    .line 13
    .line 14
    invoke-direct {v1, v2, v3, v0}, Ls1/B;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ls1/C;)V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lk1/j;->a:Ls1/B;

    .line 18
    .line 19
    invoke-static {}, Lx1/h;->G()Lcom/google/crypto/tink/shaded/protobuf/U;

    .line 20
    .line 21
    .line 22
    new-instance v0, Ls1/g;

    .line 23
    .line 24
    const-string v1, "type.googleapis.com/google.crypto.tink.AesCtrHmacAeadKey"

    .line 25
    .line 26
    sget-object v2, Lx1/X;->g:Lx1/X;

    .line 27
    .line 28
    invoke-direct {v0, v1, v3, v2}, Ls1/g;-><init>(Ljava/lang/String;Ljava/lang/Class;Lx1/X;)V

    .line 29
    .line 30
    .line 31
    sput-object v0, Lk1/j;->b:Ls1/g;

    .line 32
    .line 33
    new-instance v0, Lk1/h;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 36
    .line 37
    .line 38
    sput-object v0, Lk1/j;->c:Lk1/h;

    .line 39
    .line 40
    new-instance v0, Lk1/i;

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-direct {v0, v1}, Lk1/i;-><init>(I)V

    .line 44
    .line 45
    .line 46
    sput-object v0, Lk1/j;->d:Lk1/i;

    .line 47
    .line 48
    const/4 v0, 0x2

    .line 49
    sput v0, Lk1/j;->e:I

    .line 50
    .line 51
    return-void
.end method
