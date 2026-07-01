.class public final Lx1/s0;
.super Lcom/google/crypto/tink/shaded/protobuf/w;
.source "SourceFile"


# static fields
.field private static final DEFAULT_INSTANCE:Lx1/s0;

.field public static final DEK_TEMPLATE_FIELD_NUMBER:I = 0x2

.field public static final KEK_URI_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Lcom/google/crypto/tink/shaded/protobuf/U;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/crypto/tink/shaded/protobuf/U;"
        }
    .end annotation
.end field


# instance fields
.field private bitField0_:I

.field private dekTemplate_:Lx1/b0;

.field private kekUri_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lx1/s0;

    .line 2
    .line 3
    invoke-direct {v0}, Lx1/s0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lx1/s0;->DEFAULT_INSTANCE:Lx1/s0;

    .line 7
    .line 8
    const-class v1, Lx1/s0;

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
    iput-object v0, p0, Lx1/s0;->kekUri_:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static A(Lx1/s0;Lx1/b0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lx1/s0;->dekTemplate_:Lx1/b0;

    .line 8
    .line 9
    iget p1, p0, Lx1/s0;->bitField0_:I

    .line 10
    .line 11
    or-int/lit8 p1, p1, 0x1

    .line 12
    .line 13
    iput p1, p0, Lx1/s0;->bitField0_:I

    .line 14
    .line 15
    return-void
.end method

.method public static B()Lx1/s0;
    .locals 1

    .line 1
    sget-object v0, Lx1/s0;->DEFAULT_INSTANCE:Lx1/s0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static E()Lx1/r0;
    .locals 1

    .line 1
    sget-object v0, Lx1/s0;->DEFAULT_INSTANCE:Lx1/s0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/w;->i()Lcom/google/crypto/tink/shaded/protobuf/u;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lx1/r0;

    .line 8
    .line 9
    return-object v0
.end method

.method public static F(Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/s0;
    .locals 1

    .line 1
    sget-object v0, Lx1/s0;->DEFAULT_INSTANCE:Lx1/s0;

    .line 2
    .line 3
    invoke-static {v0, p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/w;->t(Lcom/google/crypto/tink/shaded/protobuf/w;Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lx1/s0;

    .line 8
    .line 9
    return-object p0
.end method

.method public static z(Lx1/s0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lx1/s0;->kekUri_:Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final C()Lx1/b0;
    .locals 1

    .line 1
    iget-object v0, p0, Lx1/s0;->dekTemplate_:Lx1/b0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lx1/b0;->C()Lx1/b0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :cond_0
    return-object v0
.end method

.method public final D()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lx1/s0;->kekUri_:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

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
    sget-object p1, Lx1/s0;->PARSER:Lcom/google/crypto/tink/shaded/protobuf/U;

    .line 23
    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    const-class v0, Lx1/s0;

    .line 27
    .line 28
    monitor-enter v0

    .line 29
    :try_start_0
    sget-object p1, Lx1/s0;->PARSER:Lcom/google/crypto/tink/shaded/protobuf/U;

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
    sput-object p1, Lx1/s0;->PARSER:Lcom/google/crypto/tink/shaded/protobuf/U;

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
    sget-object p1, Lx1/s0;->DEFAULT_INSTANCE:Lx1/s0;

    .line 51
    .line 52
    return-object p1

    .line 53
    :cond_4
    new-instance p1, Lx1/r0;

    .line 54
    .line 55
    sget-object v0, Lx1/s0;->DEFAULT_INSTANCE:Lx1/s0;

    .line 56
    .line 57
    invoke-direct {p1, v0}, Lcom/google/crypto/tink/shaded/protobuf/u;-><init>(Lcom/google/crypto/tink/shaded/protobuf/w;)V

    .line 58
    .line 59
    .line 60
    return-object p1

    .line 61
    :cond_5
    new-instance p1, Lx1/s0;

    .line 62
    .line 63
    invoke-direct {p1}, Lx1/s0;-><init>()V

    .line 64
    .line 65
    .line 66
    return-object p1

    .line 67
    :cond_6
    const-string p1, "bitField0_"

    .line 68
    .line 69
    const-string v0, "kekUri_"

    .line 70
    .line 71
    const-string v1, "dekTemplate_"

    .line 72
    .line 73
    filled-new-array {p1, v0, v1}, [Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    const-string v0, "\u0000\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u0208\u0002\u1009\u0000"

    .line 78
    .line 79
    sget-object v1, Lx1/s0;->DEFAULT_INSTANCE:Lx1/s0;

    .line 80
    .line 81
    new-instance v2, Lcom/google/crypto/tink/shaded/protobuf/X;

    .line 82
    .line 83
    invoke-direct {v2, v1, v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/X;-><init>(Lcom/google/crypto/tink/shaded/protobuf/a;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    return-object v2

    .line 87
    :cond_7
    const/4 p1, 0x1

    .line 88
    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    return-object p1
.end method
