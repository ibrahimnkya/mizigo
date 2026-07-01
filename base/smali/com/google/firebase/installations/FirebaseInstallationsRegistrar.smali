.class public Lcom/google/firebase/installations/FirebaseInstallationsRegistrar;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/firebase/components/ComponentRegistrar;


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# static fields
.field private static final LIBRARY_NAME:Ljava/lang/String; = "fire-installations"


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

.method public static synthetic a(LD1/x;)LQ1/d;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/google/firebase/installations/FirebaseInstallationsRegistrar;->lambda$getComponents$0(LD1/d;)LQ1/d;

    move-result-object p0

    return-object p0
.end method

.method private static lambda$getComponents$0(LD1/d;)LQ1/d;
    .locals 7

    .line 1
    new-instance v0, LQ1/c;

    .line 2
    .line 3
    const-class v1, LA1/g;

    .line 4
    .line 5
    invoke-interface {p0, v1}, LD1/d;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, LA1/g;

    .line 10
    .line 11
    const-class v2, LN1/f;

    .line 12
    .line 13
    invoke-interface {p0, v2}, LD1/d;->f(Ljava/lang/Class;)LP1/a;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    new-instance v3, LD1/v;

    .line 18
    .line 19
    const-class v4, LC1/a;

    .line 20
    .line 21
    const-class v5, Ljava/util/concurrent/ExecutorService;

    .line 22
    .line 23
    invoke-direct {v3, v4, v5}, LD1/v;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 24
    .line 25
    .line 26
    invoke-interface {p0, v3}, LD1/d;->d(LD1/v;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    check-cast v3, Ljava/util/concurrent/ExecutorService;

    .line 31
    .line 32
    new-instance v4, LD1/v;

    .line 33
    .line 34
    const-class v5, LC1/b;

    .line 35
    .line 36
    const-class v6, Ljava/util/concurrent/Executor;

    .line 37
    .line 38
    invoke-direct {v4, v5, v6}, LD1/v;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 39
    .line 40
    .line 41
    invoke-interface {p0, v4}, LD1/d;->d(LD1/v;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Ljava/util/concurrent/Executor;

    .line 46
    .line 47
    new-instance v4, LE1/k;

    .line 48
    .line 49
    invoke-direct {v4, p0}, LE1/k;-><init>(Ljava/util/concurrent/Executor;)V

    .line 50
    .line 51
    .line 52
    invoke-direct {v0, v1, v2, v3, v4}, LQ1/c;-><init>(LA1/g;LP1/a;Ljava/util/concurrent/ExecutorService;LE1/k;)V

    .line 53
    .line 54
    .line 55
    return-object v0
.end method


# virtual methods
.method public getComponents()Ljava/util/List;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "LD1/c;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, LD1/b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    new-array v2, v1, [Ljava/lang/Class;

    .line 5
    .line 6
    const-class v3, LQ1/d;

    .line 7
    .line 8
    invoke-direct {v0, v3, v2}, LD1/b;-><init>(Ljava/lang/Class;[Ljava/lang/Class;)V

    .line 9
    .line 10
    .line 11
    const-string v2, "fire-installations"

    .line 12
    .line 13
    iput-object v2, v0, LD1/b;->a:Ljava/lang/Object;

    .line 14
    .line 15
    const-class v3, LA1/g;

    .line 16
    .line 17
    invoke-static {v3}, LD1/l;->a(Ljava/lang/Class;)LD1/l;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-virtual {v0, v3}, LD1/b;->d(LD1/l;)V

    .line 22
    .line 23
    .line 24
    new-instance v3, LD1/l;

    .line 25
    .line 26
    const/4 v4, 0x1

    .line 27
    const-class v5, LN1/f;

    .line 28
    .line 29
    invoke-direct {v3, v1, v4, v5}, LD1/l;-><init>(IILjava/lang/Class;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v3}, LD1/b;->d(LD1/l;)V

    .line 33
    .line 34
    .line 35
    new-instance v3, LD1/v;

    .line 36
    .line 37
    const-class v5, LC1/a;

    .line 38
    .line 39
    const-class v6, Ljava/util/concurrent/ExecutorService;

    .line 40
    .line 41
    invoke-direct {v3, v5, v6}, LD1/v;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 42
    .line 43
    .line 44
    new-instance v5, LD1/l;

    .line 45
    .line 46
    invoke-direct {v5, v3, v4, v1}, LD1/l;-><init>(LD1/v;II)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v5}, LD1/b;->d(LD1/l;)V

    .line 50
    .line 51
    .line 52
    new-instance v3, LD1/v;

    .line 53
    .line 54
    const-class v5, LC1/b;

    .line 55
    .line 56
    const-class v6, Ljava/util/concurrent/Executor;

    .line 57
    .line 58
    invoke-direct {v3, v5, v6}, LD1/v;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 59
    .line 60
    .line 61
    new-instance v5, LD1/l;

    .line 62
    .line 63
    invoke-direct {v5, v3, v4, v1}, LD1/l;-><init>(LD1/v;II)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v5}, LD1/b;->d(LD1/l;)V

    .line 67
    .line 68
    .line 69
    new-instance v1, LA1/h;

    .line 70
    .line 71
    const/16 v3, 0xf

    .line 72
    .line 73
    invoke-direct {v1, v3}, LA1/h;-><init>(I)V

    .line 74
    .line 75
    .line 76
    iput-object v1, v0, LD1/b;->g:Ljava/lang/Object;

    .line 77
    .line 78
    invoke-virtual {v0}, LD1/b;->e()LD1/c;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    new-instance v1, LN1/e;

    .line 83
    .line 84
    const/4 v3, 0x0

    .line 85
    invoke-direct {v1, v3}, LN1/e;-><init>(I)V

    .line 86
    .line 87
    .line 88
    new-instance v3, Ljava/util/HashSet;

    .line 89
    .line 90
    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 91
    .line 92
    .line 93
    new-instance v4, Ljava/util/HashSet;

    .line 94
    .line 95
    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 96
    .line 97
    .line 98
    new-instance v12, Ljava/util/HashSet;

    .line 99
    .line 100
    invoke-direct {v12}, Ljava/util/HashSet;-><init>()V

    .line 101
    .line 102
    .line 103
    const-class v5, LN1/e;

    .line 104
    .line 105
    invoke-static {v5}, LD1/v;->a(Ljava/lang/Class;)LD1/v;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    invoke-virtual {v3, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    new-instance v11, LD1/a;

    .line 113
    .line 114
    const/4 v5, 0x0

    .line 115
    invoke-direct {v11, v5, v1}, LD1/a;-><init>(ILjava/lang/Object;)V

    .line 116
    .line 117
    .line 118
    new-instance v5, LD1/c;

    .line 119
    .line 120
    new-instance v7, Ljava/util/HashSet;

    .line 121
    .line 122
    invoke-direct {v7, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 123
    .line 124
    .line 125
    new-instance v8, Ljava/util/HashSet;

    .line 126
    .line 127
    invoke-direct {v8, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 128
    .line 129
    .line 130
    const/4 v6, 0x0

    .line 131
    const/4 v9, 0x0

    .line 132
    const/4 v10, 0x1

    .line 133
    invoke-direct/range {v5 .. v12}, LD1/c;-><init>(Ljava/lang/String;Ljava/util/Set;Ljava/util/Set;IILD1/f;Ljava/util/Set;)V

    .line 134
    .line 135
    .line 136
    const-string v1, "19.0.1"

    .line 137
    .line 138
    invoke-static {v2, v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->f(Ljava/lang/String;Ljava/lang/String;)LD1/c;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    filled-new-array {v0, v5, v1}, [LD1/c;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    return-object v0
.end method
