.class public final Lx1/g0;
.super Lcom/google/crypto/tink/shaded/protobuf/w;
.source "SourceFile"


# static fields
.field private static final DEFAULT_INSTANCE:Lx1/g0;

.field public static final KEY_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Lcom/google/crypto/tink/shaded/protobuf/U; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/crypto/tink/shaded/protobuf/U;"
        }
    .end annotation
.end field

.field public static final PRIMARY_KEY_ID_FIELD_NUMBER:I = 0x1


# instance fields
.field private key_:Lcom/google/crypto/tink/shaded/protobuf/z;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/crypto/tink/shaded/protobuf/z;"
        }
    .end annotation
.end field

.field private primaryKeyId_:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lx1/g0;

    .line 2
    .line 3
    invoke-direct {v0}, Lx1/g0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lx1/g0;->DEFAULT_INSTANCE:Lx1/g0;

    .line 7
    .line 8
    const-class v1, Lx1/g0;

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
    sget-object v0, Lcom/google/crypto/tink/shaded/protobuf/W;->i:Lcom/google/crypto/tink/shaded/protobuf/W;

    .line 5
    .line 6
    iput-object v0, p0, Lx1/g0;->key_:Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 7
    .line 8
    return-void
.end method

.method public static A(Lx1/g0;Lx1/f0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lx1/g0;->key_:Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 5
    .line 6
    move-object v1, v0

    .line 7
    check-cast v1, Lcom/google/crypto/tink/shaded/protobuf/b;

    .line 8
    .line 9
    iget-boolean v1, v1, Lcom/google/crypto/tink/shaded/protobuf/b;->e:Z

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    mul-int/lit8 v1, v1, 0x2

    .line 18
    .line 19
    invoke-interface {v0, v1}, Lcom/google/crypto/tink/shaded/protobuf/z;->a(I)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lx1/g0;->key_:Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 24
    .line 25
    :cond_0
    iget-object p0, p0, Lx1/g0;->key_:Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 26
    .line 27
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static F()Lx1/d0;
    .locals 1

    .line 1
    sget-object v0, Lx1/g0;->DEFAULT_INSTANCE:Lx1/g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/w;->i()Lcom/google/crypto/tink/shaded/protobuf/u;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lx1/d0;

    .line 8
    .line 9
    return-object v0
.end method

.method public static G(Ljava/io/ByteArrayInputStream;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/g0;
    .locals 2

    .line 1
    sget-object v0, Lx1/g0;->DEFAULT_INSTANCE:Lx1/g0;

    .line 2
    .line 3
    new-instance v1, Lcom/google/crypto/tink/shaded/protobuf/k;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/google/crypto/tink/shaded/protobuf/k;-><init>(Ljava/io/ByteArrayInputStream;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1, p1}, Lcom/google/crypto/tink/shaded/protobuf/w;->v(Lcom/google/crypto/tink/shaded/protobuf/w;Landroidx/datastore/preferences/protobuf/j;Lcom/google/crypto/tink/shaded/protobuf/o;)Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Lcom/google/crypto/tink/shaded/protobuf/w;->h(Lcom/google/crypto/tink/shaded/protobuf/w;)V

    .line 13
    .line 14
    .line 15
    check-cast p0, Lx1/g0;

    .line 16
    .line 17
    return-object p0
.end method

.method public static H([BLcom/google/crypto/tink/shaded/protobuf/o;)Lx1/g0;
    .locals 1

    .line 1
    sget-object v0, Lx1/g0;->DEFAULT_INSTANCE:Lx1/g0;

    .line 2
    .line 3
    invoke-static {v0, p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/w;->u(Lcom/google/crypto/tink/shaded/protobuf/w;[BLcom/google/crypto/tink/shaded/protobuf/o;)Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lx1/g0;

    .line 8
    .line 9
    return-object p0
.end method

.method public static z(Lx1/g0;I)V
    .locals 0

    .line 1
    iput p1, p0, Lx1/g0;->primaryKeyId_:I

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final B(I)Lx1/f0;
    .locals 1

    .line 1
    iget-object v0, p0, Lx1/g0;->key_:Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lx1/f0;

    .line 8
    .line 9
    return-object p1
.end method

.method public final C()I
    .locals 1

    .line 1
    iget-object v0, p0, Lx1/g0;->key_:Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public final D()Lcom/google/crypto/tink/shaded/protobuf/z;
    .locals 1

    .line 1
    iget-object v0, p0, Lx1/g0;->key_:Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 2
    .line 3
    return-object v0
.end method

.method public final E()I
    .locals 1

    .line 1
    iget v0, p0, Lx1/g0;->primaryKeyId_:I

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
    sget-object p1, Lx1/g0;->PARSER:Lcom/google/crypto/tink/shaded/protobuf/U;

    .line 23
    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    const-class v0, Lx1/g0;

    .line 27
    .line 28
    monitor-enter v0

    .line 29
    :try_start_0
    sget-object p1, Lx1/g0;->PARSER:Lcom/google/crypto/tink/shaded/protobuf/U;

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
    sput-object p1, Lx1/g0;->PARSER:Lcom/google/crypto/tink/shaded/protobuf/U;

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
    sget-object p1, Lx1/g0;->DEFAULT_INSTANCE:Lx1/g0;

    .line 51
    .line 52
    return-object p1

    .line 53
    :cond_4
    new-instance p1, Lx1/d0;

    .line 54
    .line 55
    sget-object v0, Lx1/g0;->DEFAULT_INSTANCE:Lx1/g0;

    .line 56
    .line 57
    invoke-direct {p1, v0}, Lcom/google/crypto/tink/shaded/protobuf/u;-><init>(Lcom/google/crypto/tink/shaded/protobuf/w;)V

    .line 58
    .line 59
    .line 60
    return-object p1

    .line 61
    :cond_5
    new-instance p1, Lx1/g0;

    .line 62
    .line 63
    invoke-direct {p1}, Lx1/g0;-><init>()V

    .line 64
    .line 65
    .line 66
    return-object p1

    .line 67
    :cond_6
    const-string p1, "primaryKeyId_"

    .line 68
    .line 69
    const-string v0, "key_"

    .line 70
    .line 71
    const-class v1, Lx1/f0;

    .line 72
    .line 73
    filled-new-array {p1, v0, v1}, [Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    const-string v0, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0001\u0000\u0001\u000b\u0002\u001b"

    .line 78
    .line 79
    sget-object v1, Lx1/g0;->DEFAULT_INSTANCE:Lx1/g0;

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
