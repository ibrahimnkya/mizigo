.class public final Lx1/D0;
.super Lcom/google/crypto/tink/shaded/protobuf/w;
.source "SourceFile"


# static fields
.field private static final DEFAULT_INSTANCE:Lx1/D0;

.field private static volatile PARSER:Lcom/google/crypto/tink/shaded/protobuf/U; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/crypto/tink/shaded/protobuf/U;"
        }
    .end annotation
.end field

.field public static final VERSION_FIELD_NUMBER:I = 0x1


# instance fields
.field private version_:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lx1/D0;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/crypto/tink/shaded/protobuf/w;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lx1/D0;->DEFAULT_INSTANCE:Lx1/D0;

    .line 7
    .line 8
    const-class v1, Lx1/D0;

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/google/crypto/tink/shaded/protobuf/w;->w(Ljava/lang/Class;Lcom/google/crypto/tink/shaded/protobuf/w;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static B(Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/D0;
    .locals 1

    .line 1
    sget-object v0, Lx1/D0;->DEFAULT_INSTANCE:Lx1/D0;

    .line 2
    .line 3
    invoke-static {v0, p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/w;->t(Lcom/google/crypto/tink/shaded/protobuf/w;Lcom/google/crypto/tink/shaded/protobuf/i;Lcom/google/crypto/tink/shaded/protobuf/o;)Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lx1/D0;

    .line 8
    .line 9
    return-object p0
.end method

.method public static z()Lx1/D0;
    .locals 1

    .line 1
    sget-object v0, Lx1/D0;->DEFAULT_INSTANCE:Lx1/D0;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public final A()I
    .locals 1

    .line 1
    iget v0, p0, Lx1/D0;->version_:I

    .line 2
    .line 3
    return v0
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
    sget-object p1, Lx1/D0;->PARSER:Lcom/google/crypto/tink/shaded/protobuf/U;

    .line 23
    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    const-class v0, Lx1/D0;

    .line 27
    .line 28
    monitor-enter v0

    .line 29
    :try_start_0
    sget-object p1, Lx1/D0;->PARSER:Lcom/google/crypto/tink/shaded/protobuf/U;

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
    sput-object p1, Lx1/D0;->PARSER:Lcom/google/crypto/tink/shaded/protobuf/U;

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
    sget-object p1, Lx1/D0;->DEFAULT_INSTANCE:Lx1/D0;

    .line 51
    .line 52
    return-object p1

    .line 53
    :cond_4
    new-instance p1, Lx1/K;

    .line 54
    .line 55
    sget-object v0, Lx1/D0;->DEFAULT_INSTANCE:Lx1/D0;

    .line 56
    .line 57
    const/4 v1, 0x3

    .line 58
    invoke-direct {p1, v0, v1}, Lx1/K;-><init>(Lcom/google/crypto/tink/shaded/protobuf/w;I)V

    .line 59
    .line 60
    .line 61
    return-object p1

    .line 62
    :cond_5
    new-instance p1, Lx1/D0;

    .line 63
    .line 64
    invoke-direct {p1}, Lcom/google/crypto/tink/shaded/protobuf/w;-><init>()V

    .line 65
    .line 66
    .line 67
    return-object p1

    .line 68
    :cond_6
    const-string p1, "version_"

    .line 69
    .line 70
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    const-string v0, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001\u000b"

    .line 75
    .line 76
    sget-object v1, Lx1/D0;->DEFAULT_INSTANCE:Lx1/D0;

    .line 77
    .line 78
    new-instance v2, Lcom/google/crypto/tink/shaded/protobuf/X;

    .line 79
    .line 80
    invoke-direct {v2, v1, v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/X;-><init>(Lcom/google/crypto/tink/shaded/protobuf/a;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    return-object v2

    .line 84
    :cond_7
    const/4 p1, 0x1

    .line 85
    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    return-object p1
.end method
