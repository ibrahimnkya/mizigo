.class public Lcom/google/firebase/datatransport/TransportRegistrar;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/firebase/components/ComponentRegistrar;


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# static fields
.field private static final LIBRARY_NAME:Ljava/lang/String; = "fire-transport"


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

.method public static synthetic a(LD1/x;)Lv0/e;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/google/firebase/datatransport/TransportRegistrar;->lambda$getComponents$2(LD1/d;)Lv0/e;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(LD1/x;)Lv0/e;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/google/firebase/datatransport/TransportRegistrar;->lambda$getComponents$1(LD1/d;)Lv0/e;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(LD1/x;)Lv0/e;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/google/firebase/datatransport/TransportRegistrar;->lambda$getComponents$0(LD1/d;)Lv0/e;

    move-result-object p0

    return-object p0
.end method

.method private static synthetic lambda$getComponents$0(LD1/d;)Lv0/e;
    .locals 1

    .line 1
    const-class v0, Landroid/content/Context;

    .line 2
    .line 3
    invoke-interface {p0, v0}, LD1/d;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/content/Context;

    .line 8
    .line 9
    invoke-static {p0}, Ly0/p;->b(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ly0/p;->a()Ly0/p;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget-object v0, Lw0/a;->f:Lw0/a;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ly0/p;->c(Ly0/k;)Ly0/o;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method private static synthetic lambda$getComponents$1(LD1/d;)Lv0/e;
    .locals 1

    .line 1
    const-class v0, Landroid/content/Context;

    .line 2
    .line 3
    invoke-interface {p0, v0}, LD1/d;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/content/Context;

    .line 8
    .line 9
    invoke-static {p0}, Ly0/p;->b(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ly0/p;->a()Ly0/p;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget-object v0, Lw0/a;->f:Lw0/a;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ly0/p;->c(Ly0/k;)Ly0/o;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method private static synthetic lambda$getComponents$2(LD1/d;)Lv0/e;
    .locals 1

    .line 1
    const-class v0, Landroid/content/Context;

    .line 2
    .line 3
    invoke-interface {p0, v0}, LD1/d;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/content/Context;

    .line 8
    .line 9
    invoke-static {p0}, Ly0/p;->b(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ly0/p;->a()Ly0/p;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget-object v0, Lw0/a;->e:Lw0/a;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ly0/p;->c(Ly0/k;)Ly0/o;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method


# virtual methods
.method public getComponents()Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "LD1/c;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ljava/lang/Class;

    .line 3
    .line 4
    new-instance v1, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v2, Ljava/util/HashSet;

    .line 10
    .line 11
    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance v10, Ljava/util/HashSet;

    .line 15
    .line 16
    invoke-direct {v10}, Ljava/util/HashSet;-><init>()V

    .line 17
    .line 18
    .line 19
    const-class v11, Lv0/e;

    .line 20
    .line 21
    invoke-static {v11}, LD1/v;->a(Ljava/lang/Class;)LD1/v;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    array-length v3, v0

    .line 29
    const/4 v7, 0x0

    .line 30
    move v4, v7

    .line 31
    :goto_0
    if-ge v4, v3, :cond_0

    .line 32
    .line 33
    aget-object v5, v0, v4

    .line 34
    .line 35
    const-string v6, "Null interface"

    .line 36
    .line 37
    invoke-static {v5, v6}, LT0/a;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v5}, LD1/v;->a(Ljava/lang/Class;)LD1/v;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    invoke-virtual {v1, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    add-int/lit8 v4, v4, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    const-class v0, Landroid/content/Context;

    .line 51
    .line 52
    invoke-static {v0}, LD1/l;->a(Ljava/lang/Class;)LD1/l;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    iget-object v4, v3, LD1/l;->a:LD1/v;

    .line 57
    .line 58
    invoke-virtual {v1, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    if-nez v4, :cond_1

    .line 63
    .line 64
    invoke-virtual {v2, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    new-instance v9, LA1/h;

    .line 68
    .line 69
    const/16 v3, 0xc

    .line 70
    .line 71
    invoke-direct {v9, v3}, LA1/h;-><init>(I)V

    .line 72
    .line 73
    .line 74
    new-instance v3, LD1/c;

    .line 75
    .line 76
    new-instance v5, Ljava/util/HashSet;

    .line 77
    .line 78
    invoke-direct {v5, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 79
    .line 80
    .line 81
    new-instance v6, Ljava/util/HashSet;

    .line 82
    .line 83
    invoke-direct {v6, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 84
    .line 85
    .line 86
    const-string v4, "fire-transport"

    .line 87
    .line 88
    move v8, v7

    .line 89
    invoke-direct/range {v3 .. v10}, LD1/c;-><init>(Ljava/lang/String;Ljava/util/Set;Ljava/util/Set;IILD1/f;Ljava/util/Set;)V

    .line 90
    .line 91
    .line 92
    new-instance v1, LD1/v;

    .line 93
    .line 94
    const-class v2, LG1/a;

    .line 95
    .line 96
    invoke-direct {v1, v2, v11}, LD1/v;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v1}, LD1/c;->a(LD1/v;)LD1/b;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-static {v0}, LD1/l;->a(Ljava/lang/Class;)LD1/l;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-virtual {v1, v2}, LD1/b;->d(LD1/l;)V

    .line 108
    .line 109
    .line 110
    new-instance v2, LA1/h;

    .line 111
    .line 112
    const/16 v5, 0xd

    .line 113
    .line 114
    invoke-direct {v2, v5}, LA1/h;-><init>(I)V

    .line 115
    .line 116
    .line 117
    iput-object v2, v1, LD1/b;->g:Ljava/lang/Object;

    .line 118
    .line 119
    invoke-virtual {v1}, LD1/b;->e()LD1/c;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    new-instance v2, LD1/v;

    .line 124
    .line 125
    const-class v5, LG1/b;

    .line 126
    .line 127
    invoke-direct {v2, v5, v11}, LD1/v;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 128
    .line 129
    .line 130
    invoke-static {v2}, LD1/c;->a(LD1/v;)LD1/b;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    invoke-static {v0}, LD1/l;->a(Ljava/lang/Class;)LD1/l;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {v2, v0}, LD1/b;->d(LD1/l;)V

    .line 139
    .line 140
    .line 141
    new-instance v0, LA1/h;

    .line 142
    .line 143
    const/16 v5, 0xe

    .line 144
    .line 145
    invoke-direct {v0, v5}, LA1/h;-><init>(I)V

    .line 146
    .line 147
    .line 148
    iput-object v0, v2, LD1/b;->g:Ljava/lang/Object;

    .line 149
    .line 150
    invoke-virtual {v2}, LD1/b;->e()LD1/c;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    const-string v2, "18.2.0"

    .line 155
    .line 156
    invoke-static {v4, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->f(Ljava/lang/String;Ljava/lang/String;)LD1/c;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    filled-new-array {v3, v1, v0, v2}, [LD1/c;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    return-object v0

    .line 169
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 170
    .line 171
    const-string v1, "Components are not allowed to depend on interfaces they themselves provide."

    .line 172
    .line 173
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    throw v0
.end method
