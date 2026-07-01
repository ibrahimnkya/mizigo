.class public final Lx1/u0;
.super Lcom/google/crypto/tink/shaded/protobuf/w;
.source "SourceFile"


# static fields
.field public static final CONFIG_NAME_FIELD_NUMBER:I = 0x1

.field private static final DEFAULT_INSTANCE:Lx1/u0;

.field public static final ENTRY_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Lcom/google/crypto/tink/shaded/protobuf/U;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/crypto/tink/shaded/protobuf/U;"
        }
    .end annotation
.end field


# instance fields
.field private configName_:Ljava/lang/String;

.field private entry_:Lcom/google/crypto/tink/shaded/protobuf/z;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/crypto/tink/shaded/protobuf/z;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lx1/u0;

    .line 2
    .line 3
    invoke-direct {v0}, Lx1/u0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lx1/u0;->DEFAULT_INSTANCE:Lx1/u0;

    .line 7
    .line 8
    const-class v1, Lx1/u0;

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/google/crypto/tink/shaded/protobuf/w;->w(Ljava/lang/Class;Lcom/google/crypto/tink/shaded/protobuf/w;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/crypto/tink/shaded/protobuf/w;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lx1/u0;->configName_:Ljava/lang/String;

    .line 7
    .line 8
    sget-object v0, Lcom/google/crypto/tink/shaded/protobuf/W;->i:Lcom/google/crypto/tink/shaded/protobuf/W;

    .line 9
    .line 10
    iput-object v0, p0, Lx1/u0;->entry_:Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final j(I)Ljava/lang/Object;
    .locals 3

    .line 1
    invoke-static {p1}, LL/i;->b(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_7

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    if-eq p1, v0, :cond_6

    .line 9
    .line 10
    const/4 v0, 0x3

    .line 11
    if-eq p1, v0, :cond_5

    .line 12
    .line 13
    const/4 v0, 0x4

    .line 14
    if-eq p1, v0, :cond_4

    .line 15
    .line 16
    const/4 v0, 0x5

    .line 17
    if-eq p1, v0, :cond_3

    .line 18
    .line 19
    const/4 v0, 0x6

    .line 20
    if-ne p1, v0, :cond_2

    .line 21
    .line 22
    sget-object p1, Lx1/u0;->PARSER:Lcom/google/crypto/tink/shaded/protobuf/U;

    .line 23
    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    const-class v0, Lx1/u0;

    .line 27
    .line 28
    monitor-enter v0

    .line 29
    :try_start_0
    sget-object p1, Lx1/u0;->PARSER:Lcom/google/crypto/tink/shaded/protobuf/U;

    .line 30
    .line 31
    if-nez p1, :cond_0

    .line 32
    .line 33
    new-instance p1, Lcom/google/crypto/tink/shaded/protobuf/v;

    .line 34
    .line 35
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 36
    .line 37
    .line 38
    sput-object p1, Lx1/u0;->PARSER:Lcom/google/crypto/tink/shaded/protobuf/U;

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catchall_0
    move-exception p1

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    :goto_0
    monitor-exit v0

    .line 44
    return-object p1

    .line 45
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    throw p1

    .line 47
    :cond_1
    return-object p1

    .line 48
    :cond_2
    const/4 p1, 0x0

    .line 49
    throw p1

    .line 50
    :cond_3
    sget-object p1, Lx1/u0;->DEFAULT_INSTANCE:Lx1/u0;

    .line 51
    .line 52
    return-object p1

    .line 53
    :cond_4
    new-instance p1, Lx1/K;

    .line 54
    .line 55
    sget-object v0, Lx1/u0;->DEFAULT_INSTANCE:Lx1/u0;

    .line 56
    .line 57
    const/4 v1, 0x2

    .line 58
    invoke-direct {p1, v0, v1}, Lx1/K;-><init>(Lcom/google/crypto/tink/shaded/protobuf/w;I)V

    .line 59
    .line 60
    .line 61
    return-object p1

    .line 62
    :cond_5
    new-instance p1, Lx1/u0;

    .line 63
    .line 64
    invoke-direct {p1}, Lx1/u0;-><init>()V

    .line 65
    .line 66
    .line 67
    return-object p1

    .line 68
    :cond_6
    const-string p1, "configName_"

    .line 69
    .line 70
    const-string v0, "entry_"

    .line 71
    .line 72
    const-class v1, Lx1/c0;

    .line 73
    .line 74
    filled-new-array {p1, v0, v1}, [Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    const-string v0, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0001\u0000\u0001\u0208\u0002\u001b"

    .line 79
    .line 80
    sget-object v1, Lx1/u0;->DEFAULT_INSTANCE:Lx1/u0;

    .line 81
    .line 82
    new-instance v2, Lcom/google/crypto/tink/shaded/protobuf/X;

    .line 83
    .line 84
    invoke-direct {v2, v1, v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/X;-><init>(Lcom/google/crypto/tink/shaded/protobuf/a;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    return-object v2

    .line 88
    :cond_7
    const/4 p1, 0x1

    .line 89
    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    return-object p1
.end method
