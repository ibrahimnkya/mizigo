.class public Lcom/google/firebase/messaging/FirebaseMessagingRegistrar;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/firebase/components/ComponentRegistrar;


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# static fields
.field private static final LIBRARY_NAME:Ljava/lang/String; = "fire-fcm"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(LD1/v;LD1/x;)Lcom/google/firebase/messaging/FirebaseMessaging;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/google/firebase/messaging/FirebaseMessagingRegistrar;->lambda$getComponents$0(LD1/v;LD1/d;)Lcom/google/firebase/messaging/FirebaseMessaging;

    move-result-object p0

    return-object p0
.end method

.method private static synthetic lambda$getComponents$0(LD1/v;LD1/d;)Lcom/google/firebase/messaging/FirebaseMessaging;
    .locals 7

    .line 1
    new-instance v0, Lcom/google/firebase/messaging/FirebaseMessaging;

    .line 2
    .line 3
    const-class v1, LA1/g;

    .line 4
    .line 5
    invoke-interface {p1, v1}, LD1/d;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, LA1/g;

    .line 10
    .line 11
    const-class v2, LO1/a;

    .line 12
    .line 13
    invoke-interface {p1, v2}, LD1/d;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    const-class v2, LX1/b;

    .line 20
    .line 21
    invoke-interface {p1, v2}, LD1/d;->f(Ljava/lang/Class;)LP1/a;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    const-class v3, LN1/g;

    .line 26
    .line 27
    invoke-interface {p1, v3}, LD1/d;->f(Ljava/lang/Class;)LP1/a;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    const-class v4, LQ1/d;

    .line 32
    .line 33
    invoke-interface {p1, v4}, LD1/d;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    check-cast v4, LQ1/d;

    .line 38
    .line 39
    invoke-interface {p1, p0}, LD1/d;->e(LD1/v;)LP1/a;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    const-class p0, LM1/c;

    .line 44
    .line 45
    invoke-interface {p1, p0}, LD1/d;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    move-object v6, p0

    .line 50
    check-cast v6, LM1/c;

    .line 51
    .line 52
    invoke-direct/range {v0 .. v6}, Lcom/google/firebase/messaging/FirebaseMessaging;-><init>(LA1/g;LP1/a;LP1/a;LQ1/d;LP1/a;LM1/c;)V

    .line 53
    .line 54
    .line 55
    return-object v0

    .line 56
    :cond_0
    new-instance p0, Ljava/lang/ClassCastException;

    .line 57
    .line 58
    invoke-direct {p0}, Ljava/lang/ClassCastException;-><init>()V

    .line 59
    .line 60
    .line 61
    throw p0
.end method


# virtual methods
.method public getComponents()Ljava/util/List;
    .locals 7
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "LD1/c;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, LD1/v;

    .line 2
    .line 3
    const-class v1, LG1/b;

    .line 4
    .line 5
    const-class v2, Lv0/e;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, LD1/v;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, LD1/b;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    new-array v3, v2, [Ljava/lang/Class;

    .line 14
    .line 15
    const-class v4, Lcom/google/firebase/messaging/FirebaseMessaging;

    .line 16
    .line 17
    invoke-direct {v1, v4, v3}, LD1/b;-><init>(Ljava/lang/Class;[Ljava/lang/Class;)V

    .line 18
    .line 19
    .line 20
    const-string v3, "fire-fcm"

    .line 21
    .line 22
    iput-object v3, v1, LD1/b;->a:Ljava/lang/Object;

    .line 23
    .line 24
    const-class v4, LA1/g;

    .line 25
    .line 26
    invoke-static {v4}, LD1/l;->a(Ljava/lang/Class;)LD1/l;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    invoke-virtual {v1, v4}, LD1/b;->d(LD1/l;)V

    .line 31
    .line 32
    .line 33
    new-instance v4, LD1/l;

    .line 34
    .line 35
    const-class v5, LO1/a;

    .line 36
    .line 37
    invoke-direct {v4, v2, v2, v5}, LD1/l;-><init>(IILjava/lang/Class;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, v4}, LD1/b;->d(LD1/l;)V

    .line 41
    .line 42
    .line 43
    new-instance v4, LD1/l;

    .line 44
    .line 45
    const/4 v5, 0x1

    .line 46
    const-class v6, LX1/b;

    .line 47
    .line 48
    invoke-direct {v4, v2, v5, v6}, LD1/l;-><init>(IILjava/lang/Class;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, v4}, LD1/b;->d(LD1/l;)V

    .line 52
    .line 53
    .line 54
    new-instance v4, LD1/l;

    .line 55
    .line 56
    const-class v6, LN1/g;

    .line 57
    .line 58
    invoke-direct {v4, v2, v5, v6}, LD1/l;-><init>(IILjava/lang/Class;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, v4}, LD1/b;->d(LD1/l;)V

    .line 62
    .line 63
    .line 64
    const-class v4, LQ1/d;

    .line 65
    .line 66
    invoke-static {v4}, LD1/l;->a(Ljava/lang/Class;)LD1/l;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    invoke-virtual {v1, v4}, LD1/b;->d(LD1/l;)V

    .line 71
    .line 72
    .line 73
    new-instance v4, LD1/l;

    .line 74
    .line 75
    invoke-direct {v4, v0, v2, v5}, LD1/l;-><init>(LD1/v;II)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1, v4}, LD1/b;->d(LD1/l;)V

    .line 79
    .line 80
    .line 81
    const-class v4, LM1/c;

    .line 82
    .line 83
    invoke-static {v4}, LD1/l;->a(Ljava/lang/Class;)LD1/l;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    invoke-virtual {v1, v4}, LD1/b;->d(LD1/l;)V

    .line 88
    .line 89
    .line 90
    new-instance v4, LN1/b;

    .line 91
    .line 92
    const/4 v6, 0x1

    .line 93
    invoke-direct {v4, v0, v6}, LN1/b;-><init>(LD1/v;I)V

    .line 94
    .line 95
    .line 96
    iput-object v4, v1, LD1/b;->g:Ljava/lang/Object;

    .line 97
    .line 98
    iget v0, v1, LD1/b;->b:I

    .line 99
    .line 100
    if-nez v0, :cond_0

    .line 101
    .line 102
    move v2, v5

    .line 103
    :cond_0
    if-eqz v2, :cond_1

    .line 104
    .line 105
    iput v5, v1, LD1/b;->b:I

    .line 106
    .line 107
    invoke-virtual {v1}, LD1/b;->e()LD1/c;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    const-string v1, "25.0.1"

    .line 112
    .line 113
    invoke-static {v3, v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->f(Ljava/lang/String;Ljava/lang/String;)LD1/c;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    filled-new-array {v0, v1}, [LD1/c;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    return-object v0

    .line 126
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 127
    .line 128
    const-string v1, "Instantiation type has already been set."

    .line 129
    .line 130
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    throw v0
.end method
