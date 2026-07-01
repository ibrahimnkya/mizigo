.class public final Lx1/f0;
.super Lcom/google/crypto/tink/shaded/protobuf/w;
.source "SourceFile"


# static fields
.field private static final DEFAULT_INSTANCE:Lx1/f0;

.field public static final KEY_DATA_FIELD_NUMBER:I = 0x1

.field public static final KEY_ID_FIELD_NUMBER:I = 0x3

.field public static final OUTPUT_PREFIX_TYPE_FIELD_NUMBER:I = 0x4

.field private static volatile PARSER:Lcom/google/crypto/tink/shaded/protobuf/U; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/crypto/tink/shaded/protobuf/U;"
        }
    .end annotation
.end field

.field public static final STATUS_FIELD_NUMBER:I = 0x2


# instance fields
.field private bitField0_:I

.field private keyData_:Lx1/Y;

.field private keyId_:I

.field private outputPrefixType_:I

.field private status_:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lx1/f0;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/crypto/tink/shaded/protobuf/w;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lx1/f0;->DEFAULT_INSTANCE:Lx1/f0;

    .line 7
    .line 8
    const-class v1, Lx1/f0;

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/google/crypto/tink/shaded/protobuf/w;->w(Ljava/lang/Class;Lcom/google/crypto/tink/shaded/protobuf/w;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static A(Lx1/f0;Lx1/t0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lx1/t0;->b()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lx1/f0;->outputPrefixType_:I

    .line 9
    .line 10
    return-void
.end method

.method public static B(Lx1/f0;Lx1/Z;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lx1/Z;->a()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lx1/f0;->status_:I

    .line 9
    .line 10
    return-void
.end method

.method public static C(Lx1/f0;I)V
    .locals 0

    .line 1
    iput p1, p0, Lx1/f0;->keyId_:I

    .line 2
    .line 3
    return-void
.end method

.method public static I()Lx1/e0;
    .locals 1

    .line 1
    sget-object v0, Lx1/f0;->DEFAULT_INSTANCE:Lx1/f0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/w;->i()Lcom/google/crypto/tink/shaded/protobuf/u;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lx1/e0;

    .line 8
    .line 9
    return-object v0
.end method

.method public static z(Lx1/f0;Lx1/Y;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lx1/f0;->keyData_:Lx1/Y;

    .line 5
    .line 6
    iget p1, p0, Lx1/f0;->bitField0_:I

    .line 7
    .line 8
    or-int/lit8 p1, p1, 0x1

    .line 9
    .line 10
    iput p1, p0, Lx1/f0;->bitField0_:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final D()Lx1/Y;
    .locals 1

    .line 1
    iget-object v0, p0, Lx1/f0;->keyData_:Lx1/Y;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lx1/Y;->C()Lx1/Y;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :cond_0
    return-object v0
.end method

.method public final E()I
    .locals 1

    .line 1
    iget v0, p0, Lx1/f0;->keyId_:I

    .line 2
    .line 3
    return v0
.end method

.method public final F()Lx1/t0;
    .locals 1

    .line 1
    iget v0, p0, Lx1/f0;->outputPrefixType_:I

    .line 2
    .line 3
    invoke-static {v0}, Lx1/t0;->a(I)Lx1/t0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lx1/t0;->l:Lx1/t0;

    .line 10
    .line 11
    :cond_0
    return-object v0
.end method

.method public final G()Lx1/Z;
    .locals 2

    .line 1
    iget v0, p0, Lx1/f0;->status_:I

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_2

    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    if-eq v0, v1, :cond_1

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget-object v0, Lx1/Z;->i:Lx1/Z;

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    sget-object v0, Lx1/Z;->h:Lx1/Z;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_2
    sget-object v0, Lx1/Z;->g:Lx1/Z;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_3
    sget-object v0, Lx1/Z;->f:Lx1/Z;

    .line 26
    .line 27
    :goto_0
    if-nez v0, :cond_4

    .line 28
    .line 29
    sget-object v0, Lx1/Z;->j:Lx1/Z;

    .line 30
    .line 31
    :cond_4
    return-object v0
.end method

.method public final H()Z
    .locals 2

    .line 1
    iget v0, p0, Lx1/f0;->bitField0_:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    and-int/2addr v0, v1

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return v1

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    return v0
.end method

.method public final j(I)Ljava/lang/Object;
    .locals 4

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
    sget-object p1, Lx1/f0;->PARSER:Lcom/google/crypto/tink/shaded/protobuf/U;

    .line 23
    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    const-class v0, Lx1/f0;

    .line 27
    .line 28
    monitor-enter v0

    .line 29
    :try_start_0
    sget-object p1, Lx1/f0;->PARSER:Lcom/google/crypto/tink/shaded/protobuf/U;

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
    sput-object p1, Lx1/f0;->PARSER:Lcom/google/crypto/tink/shaded/protobuf/U;

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
    sget-object p1, Lx1/f0;->DEFAULT_INSTANCE:Lx1/f0;

    .line 51
    .line 52
    return-object p1

    .line 53
    :cond_4
    new-instance p1, Lx1/e0;

    .line 54
    .line 55
    sget-object v0, Lx1/f0;->DEFAULT_INSTANCE:Lx1/f0;

    .line 56
    .line 57
    invoke-direct {p1, v0}, Lcom/google/crypto/tink/shaded/protobuf/u;-><init>(Lcom/google/crypto/tink/shaded/protobuf/w;)V

    .line 58
    .line 59
    .line 60
    return-object p1

    .line 61
    :cond_5
    new-instance p1, Lx1/f0;

    .line 62
    .line 63
    invoke-direct {p1}, Lcom/google/crypto/tink/shaded/protobuf/w;-><init>()V

    .line 64
    .line 65
    .line 66
    return-object p1

    .line 67
    :cond_6
    const-string p1, "bitField0_"

    .line 68
    .line 69
    const-string v0, "keyData_"

    .line 70
    .line 71
    const-string v1, "status_"

    .line 72
    .line 73
    const-string v2, "keyId_"

    .line 74
    .line 75
    const-string v3, "outputPrefixType_"

    .line 76
    .line 77
    filled-new-array {p1, v0, v1, v2, v3}, [Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    const-string v0, "\u0000\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001\u1009\u0000\u0002\u000c\u0003\u000b\u0004\u000c"

    .line 82
    .line 83
    sget-object v1, Lx1/f0;->DEFAULT_INSTANCE:Lx1/f0;

    .line 84
    .line 85
    new-instance v2, Lcom/google/crypto/tink/shaded/protobuf/X;

    .line 86
    .line 87
    invoke-direct {v2, v1, v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/X;-><init>(Lcom/google/crypto/tink/shaded/protobuf/a;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    return-object v2

    .line 91
    :cond_7
    const/4 p1, 0x1

    .line 92
    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    return-object p1
.end method
