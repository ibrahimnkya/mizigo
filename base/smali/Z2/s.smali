.class public final LZ2/s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LZ2/x;
.implements Lh0/h;
.implements Lio/flutter/plugin/platform/i;
.implements Lj3/i;
.implements Lk3/m;
.implements Lk3/c;
.implements Lk3/d;


# static fields
.field public static h:LZ2/s;

.field public static i:LZ2/z;


# instance fields
.field public final synthetic e:I

.field public f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;


# direct methods
.method public constructor <init>(I)V
    .locals 0

    iput p1, p0, LZ2/s;->e:I

    packed-switch p1, :pswitch_data_0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance p1, Landroid/util/LongSparseArray;

    invoke-direct {p1}, Landroid/util/LongSparseArray;-><init>()V

    iput-object p1, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 32
    new-instance p1, Ljava/util/PriorityQueue;

    invoke-direct {p1}, Ljava/util/PriorityQueue;-><init>()V

    iput-object p1, p0, LZ2/s;->g:Ljava/lang/Object;

    return-void

    .line 33
    :pswitch_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance p1, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {p1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object p1, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 35
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, LZ2/s;->g:Ljava/lang/Object;

    return-void

    .line 36
    :pswitch_1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, LZ2/s;->f:Ljava/lang/Object;

    return-void

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, LZ2/s;->e:I

    iput-object p2, p0, LZ2/s;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 2
    iput p1, p0, LZ2/s;->e:I

    iput-object p2, p0, LZ2/s;->g:Ljava/lang/Object;

    iput-object p3, p0, LZ2/s;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(IZ)V
    .locals 0

    .line 3
    iput p1, p0, LZ2/s;->e:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(LE/i;)V
    .locals 1

    const/16 v0, 0x9

    iput v0, p0, LZ2/s;->e:I

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 16
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, LZ2/s;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(LV0/g;Landroidx/lifecycle/G;LS/b;)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, LZ2/s;->e:I

    const-string v0, "store"

    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "defaultCreationExtras"

    invoke-static {p3, p1}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p2, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 29
    iput-object p3, p0, LZ2/s;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;LN1/e;Lq0/b;LK0/h;)V
    .locals 0

    const/16 p2, 0x1a

    iput p2, p0, LZ2/s;->e:I

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 11
    iput-object p3, p0, LZ2/s;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/16 v0, 0x1b

    iput v0, p0, LZ2/s;->e:I

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p2, :cond_1

    .line 78
    iput-object p2, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 79
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    if-nez p3, :cond_0

    .line 80
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    iput-object p1, p0, LZ2/s;->f:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    .line 81
    invoke-virtual {p1, p3, p2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    iput-object p1, p0, LZ2/s;->f:Ljava/lang/Object;

    :goto_0
    return-void

    .line 82
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "keysetName cannot be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Landroid/view/View;Landroid/view/inputmethod/InputMethodManager;Lio/flutter/plugin/editing/j;)V
    .locals 2

    const/4 v0, 0x7

    iput v0, p0, LZ2/s;->e:I

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_0

    .line 19
    invoke-static {p1}, LE/c;->t(Landroid/view/View;)V

    .line 20
    :cond_0
    iput-object p1, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 21
    iput-object p2, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 22
    iput-object p0, p3, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lb3/b;I)V
    .locals 4

    iput p2, p0, LZ2/s;->e:I

    packed-switch p2, :pswitch_data_0

    .line 41
    :pswitch_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance p2, Lio/flutter/plugin/editing/j;

    const/4 v0, 0x3

    invoke-direct {p2, v0, p0}, Lio/flutter/plugin/editing/j;-><init>(ILjava/lang/Object;)V

    .line 43
    new-instance v0, Lk3/o;

    sget-object v1, Lk3/j;->a:Lk3/j;

    const/4 v2, 0x0

    .line 44
    const-string v3, "flutter/localization"

    invoke-direct {v0, p1, v3, v1, v2}, Lk3/o;-><init>(Lk3/f;Ljava/lang/String;Lk3/p;LN1/e;)V

    .line 45
    iput-object v0, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 46
    invoke-virtual {v0, p2}, Lk3/o;->b(Lk3/m;)V

    return-void

    .line 47
    :pswitch_1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance p2, Lio/flutter/plugin/editing/j;

    const/16 v0, 0xb

    invoke-direct {p2, v0, p0}, Lio/flutter/plugin/editing/j;-><init>(ILjava/lang/Object;)V

    .line 49
    new-instance v0, Lk3/o;

    sget-object v1, Lk3/j;->a:Lk3/j;

    const/4 v2, 0x0

    .line 50
    const-string v3, "flutter/textinput"

    invoke-direct {v0, p1, v3, v1, v2}, Lk3/o;-><init>(Lk3/f;Ljava/lang/String;Lk3/p;LN1/e;)V

    .line 51
    iput-object v0, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 52
    invoke-virtual {v0, p2}, Lk3/o;->b(Lk3/m;)V

    return-void

    .line 53
    :pswitch_2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    new-instance p2, Lj3/b;

    const/4 v0, 0x1

    invoke-direct {p2, v0, p0}, Lj3/b;-><init>(ILjava/lang/Object;)V

    .line 55
    new-instance v0, Lk3/o;

    sget-object v1, Lk3/v;->a:Lk3/v;

    const/4 v2, 0x0

    .line 56
    const-string v3, "flutter/platform_views"

    invoke-direct {v0, p1, v3, v1, v2}, Lk3/o;-><init>(Lk3/f;Ljava/lang/String;Lk3/p;LN1/e;)V

    .line 57
    iput-object v0, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 58
    invoke-virtual {v0, p2}, Lk3/o;->b(Lk3/m;)V

    return-void

    .line 59
    :pswitch_3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance p2, Lio/flutter/plugin/editing/j;

    const/4 v0, 0x6

    invoke-direct {p2, v0, p0}, Lio/flutter/plugin/editing/j;-><init>(ILjava/lang/Object;)V

    .line 61
    new-instance v0, Lk3/o;

    sget-object v1, Lk3/v;->a:Lk3/v;

    const/4 v2, 0x0

    .line 62
    const-string v3, "flutter/platform_views_2"

    invoke-direct {v0, p1, v3, v1, v2}, Lk3/o;-><init>(Lk3/f;Ljava/lang/String;Lk3/p;LN1/e;)V

    .line 63
    iput-object v0, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 64
    invoke-virtual {v0, p2}, Lk3/o;->b(Lk3/m;)V

    return-void

    .line 65
    :pswitch_4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    new-instance p2, Lio/flutter/plugin/editing/j;

    const/4 v0, 0x5

    invoke-direct {p2, v0, p0}, Lio/flutter/plugin/editing/j;-><init>(ILjava/lang/Object;)V

    .line 67
    new-instance v0, Lk3/o;

    sget-object v1, Lk3/j;->a:Lk3/j;

    const/4 v2, 0x0

    .line 68
    const-string v3, "flutter/platform"

    invoke-direct {v0, p1, v3, v1, v2}, Lk3/o;-><init>(Lk3/f;Ljava/lang/String;Lk3/p;LN1/e;)V

    .line 69
    iput-object v0, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 70
    invoke-virtual {v0, p2}, Lk3/o;->b(Lk3/m;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xb
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public constructor <init>(Lb3/b;Landroid/content/pm/PackageManager;)V
    .locals 4

    const/16 v0, 0xe

    iput v0, p0, LZ2/s;->e:I

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    new-instance v0, Lj3/b;

    const/4 v1, 0x2

    invoke-direct {v0, v1, p0}, Lj3/b;-><init>(ILjava/lang/Object;)V

    .line 73
    iput-object p2, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 74
    new-instance p2, Lk3/o;

    sget-object v1, Lk3/v;->a:Lk3/v;

    const/4 v2, 0x0

    .line 75
    const-string v3, "flutter/processtext"

    invoke-direct {p2, p1, v3, v1, v2}, Lk3/o;-><init>(Lk3/f;Ljava/lang/String;Lk3/p;LN1/e;)V

    .line 76
    invoke-virtual {p2, v0}, Lk3/o;->b(Lk3/m;)V

    return-void
.end method

.method public constructor <init>(Lh0/b;)V
    .locals 2

    const/4 v0, 0x6

    iput v0, p0, LZ2/s;->e:I

    .line 23
    new-instance v0, LZ2/s;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, LZ2/s;-><init>(I)V

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 26
    iput-object v0, p0, LZ2/s;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lio/flutter/plugin/editing/j;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, LZ2/s;->e:I

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    new-instance v0, LV0/k;

    invoke-direct {v0}, LV0/k;-><init>()V

    iput-object v0, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 14
    iput-object p1, p0, LZ2/s;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/util/HashMap;Ljava/util/ArrayList;)V
    .locals 1

    const/4 v0, 0x3

    iput v0, p0, LZ2/s;->e:I

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 40
    iput-object p2, p0, LZ2/s;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lk3/f;Ljava/lang/String;)V
    .locals 1

    const/16 v0, 0x1c

    iput v0, p0, LZ2/s;->e:I

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iput-object p1, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 85
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, ""

    goto :goto_0

    :cond_0
    const-string p1, "."

    invoke-virtual {p1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :goto_0
    iput-object p1, p0, LZ2/s;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lm3/a;Lio/flutter/plugin/editing/j;)V
    .locals 1

    const/16 v0, 0x16

    iput v0, p0, LZ2/s;->e:I

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    iput-object p1, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 6
    iput-object p2, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 7
    new-instance p1, Lio/flutter/plugin/editing/j;

    const/16 v0, 0x11

    invoke-direct {p1, v0, p0}, Lio/flutter/plugin/editing/j;-><init>(ILjava/lang/Object;)V

    .line 8
    iput-object p1, p2, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    return-void
.end method

.method public static q(LZ2/s;Lorg/json/JSONArray;)I
    .locals 11

    .line 1
    const/4 p0, 0x0

    .line 2
    move v0, p0

    .line 3
    move v1, v0

    .line 4
    move v2, v1

    .line 5
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 6
    .line 7
    .line 8
    move-result v3

    .line 9
    const/4 v4, 0x4

    .line 10
    const/4 v5, 0x2

    .line 11
    const/4 v6, 0x1

    .line 12
    if-ge v0, v3, :cond_b

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-static {v4}, LL/i;->c(I)[I

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    array-length v7, v4

    .line 23
    move v8, p0

    .line 24
    :goto_1
    if-ge v8, v7, :cond_a

    .line 25
    .line 26
    aget v9, v4, v8

    .line 27
    .line 28
    const/4 v10, 0x1

    .line 29
    if-eq v9, v10, :cond_3

    .line 30
    .line 31
    const/4 v10, 0x2

    .line 32
    if-eq v9, v10, :cond_2

    .line 33
    .line 34
    const/4 v10, 0x3

    .line 35
    if-eq v9, v10, :cond_1

    .line 36
    .line 37
    const/4 v10, 0x4

    .line 38
    if-ne v9, v10, :cond_0

    .line 39
    .line 40
    const-string v10, "DeviceOrientation.landscapeRight"

    .line 41
    .line 42
    goto :goto_2

    .line 43
    :cond_0
    const/4 p0, 0x0

    .line 44
    throw p0

    .line 45
    :cond_1
    const-string v10, "DeviceOrientation.landscapeLeft"

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_2
    const-string v10, "DeviceOrientation.portraitDown"

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_3
    const-string v10, "DeviceOrientation.portraitUp"

    .line 52
    .line 53
    :goto_2
    invoke-virtual {v10, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v10

    .line 57
    if-eqz v10, :cond_9

    .line 58
    .line 59
    invoke-static {v9}, LL/i;->b(I)I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-eqz v3, :cond_7

    .line 64
    .line 65
    if-eq v3, v6, :cond_6

    .line 66
    .line 67
    if-eq v3, v5, :cond_5

    .line 68
    .line 69
    const/4 v4, 0x3

    .line 70
    if-eq v3, v4, :cond_4

    .line 71
    .line 72
    goto :goto_3

    .line 73
    :cond_4
    or-int/lit8 v1, v1, 0x8

    .line 74
    .line 75
    goto :goto_3

    .line 76
    :cond_5
    or-int/lit8 v1, v1, 0x2

    .line 77
    .line 78
    goto :goto_3

    .line 79
    :cond_6
    or-int/lit8 v1, v1, 0x4

    .line 80
    .line 81
    goto :goto_3

    .line 82
    :cond_7
    or-int/lit8 v1, v1, 0x1

    .line 83
    .line 84
    :goto_3
    if-nez v2, :cond_8

    .line 85
    .line 86
    move v2, v1

    .line 87
    :cond_8
    add-int/lit8 v0, v0, 0x1

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_9
    add-int/lit8 v8, v8, 0x1

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_a
    new-instance p0, Ljava/lang/NoSuchFieldException;

    .line 94
    .line 95
    const-string p1, "No such DeviceOrientation: "

    .line 96
    .line 97
    invoke-static {p1, v3}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-direct {p0, p1}, Ljava/lang/NoSuchFieldException;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    throw p0

    .line 105
    :cond_b
    if-eqz v1, :cond_f

    .line 106
    .line 107
    const/16 p1, 0x8

    .line 108
    .line 109
    packed-switch v1, :pswitch_data_0

    .line 110
    .line 111
    .line 112
    goto :goto_4

    .line 113
    :pswitch_0
    const/16 p0, 0xd

    .line 114
    .line 115
    return p0

    .line 116
    :pswitch_1
    return v5

    .line 117
    :pswitch_2
    const/16 p0, 0xb

    .line 118
    .line 119
    return p0

    .line 120
    :pswitch_3
    const/16 p0, 0xc

    .line 121
    .line 122
    return p0

    .line 123
    :pswitch_4
    if-eq v2, v5, :cond_e

    .line 124
    .line 125
    if-eq v2, v4, :cond_d

    .line 126
    .line 127
    if-eq v2, p1, :cond_c

    .line 128
    .line 129
    :goto_4
    return v6

    .line 130
    :cond_c
    :pswitch_5
    return p1

    .line 131
    :cond_d
    :pswitch_6
    const/16 p0, 0x9

    .line 132
    .line 133
    :cond_e
    :pswitch_7
    return p0

    .line 134
    :cond_f
    const/4 p0, -0x1

    .line 135
    return p0

    .line 136
    nop

    .line 137
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_7
        :pswitch_4
        :pswitch_6
        :pswitch_3
        :pswitch_4
        :pswitch_4
        :pswitch_5
        :pswitch_4
        :pswitch_2
        :pswitch_1
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_0
    .end packed-switch
.end method

.method public static r(LZ2/s;Lorg/json/JSONArray;)Ljava/util/ArrayList;
    .locals 8

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move v1, v0

    .line 8
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-ge v1, v2, :cond_4

    .line 13
    .line 14
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-static {}, Lj3/d;->values()[Lj3/d;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    array-length v4, v3

    .line 23
    move v5, v0

    .line 24
    :goto_1
    if-ge v5, v4, :cond_3

    .line 25
    .line 26
    aget-object v6, v3, v5

    .line 27
    .line 28
    iget-object v7, v6, Lj3/d;->e:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v7

    .line 34
    if-eqz v7, :cond_2

    .line 35
    .line 36
    invoke-virtual {v6}, Ljava/lang/Enum;->ordinal()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_1

    .line 41
    .line 42
    const/4 v3, 0x1

    .line 43
    if-eq v2, v3, :cond_0

    .line 44
    .line 45
    goto :goto_2

    .line 46
    :cond_0
    sget-object v2, Lj3/d;->g:Lj3/d;

    .line 47
    .line 48
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    goto :goto_2

    .line 52
    :cond_1
    sget-object v2, Lj3/d;->f:Lj3/d;

    .line 53
    .line 54
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    add-int/lit8 v5, v5, 0x1

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_3
    new-instance p0, Ljava/lang/NoSuchFieldException;

    .line 64
    .line 65
    const-string p1, "No such SystemUiOverlay: "

    .line 66
    .line 67
    invoke-static {p1, v2}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-direct {p0, p1}, Ljava/lang/NoSuchFieldException;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    throw p0

    .line 75
    :cond_4
    return-object p0
.end method

.method public static s(LZ2/s;Ljava/lang/String;)I
    .locals 5

    .line 1
    const/4 p0, 0x4

    .line 2
    invoke-static {p0}, LL/i;->c(I)[I

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    array-length v1, v0

    .line 7
    const/4 v2, 0x0

    .line 8
    :goto_0
    if-ge v2, v1, :cond_8

    .line 9
    .line 10
    aget v3, v0, v2

    .line 11
    .line 12
    const/4 v4, 0x1

    .line 13
    if-eq v3, v4, :cond_3

    .line 14
    .line 15
    const/4 v4, 0x2

    .line 16
    if-eq v3, v4, :cond_2

    .line 17
    .line 18
    const/4 v4, 0x3

    .line 19
    if-eq v3, v4, :cond_1

    .line 20
    .line 21
    const/4 v4, 0x4

    .line 22
    if-ne v3, v4, :cond_0

    .line 23
    .line 24
    const-string v4, "SystemUiMode.edgeToEdge"

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    throw p0

    .line 29
    :cond_1
    const-string v4, "SystemUiMode.immersiveSticky"

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_2
    const-string v4, "SystemUiMode.immersive"

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_3
    const-string v4, "SystemUiMode.leanBack"

    .line 36
    .line 37
    :goto_1
    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    if-eqz v4, :cond_7

    .line 42
    .line 43
    invoke-static {v3}, LL/i;->b(I)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    const/4 v0, 0x1

    .line 48
    if-eqz p1, :cond_6

    .line 49
    .line 50
    const/4 v1, 0x2

    .line 51
    if-eq p1, v0, :cond_5

    .line 52
    .line 53
    if-eq p1, v1, :cond_4

    .line 54
    .line 55
    return p0

    .line 56
    :cond_4
    const/4 p0, 0x3

    .line 57
    return p0

    .line 58
    :cond_5
    return v1

    .line 59
    :cond_6
    return v0

    .line 60
    :cond_7
    add-int/lit8 v2, v2, 0x1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_8
    new-instance p0, Ljava/lang/NoSuchFieldException;

    .line 64
    .line 65
    const-string v0, "No such SystemUiMode: "

    .line 66
    .line 67
    invoke-static {v0, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-direct {p0, p1}, Ljava/lang/NoSuchFieldException;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    throw p0
.end method

.method public static t(LZ2/s;Lorg/json/JSONObject;)LD1/b;
    .locals 10

    .line 1
    const-string p0, "statusBarColor"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    move-object v3, p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move-object v3, v1

    .line 21
    :goto_0
    const-string p0, "statusBarIconBrightness"

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/4 v2, 0x0

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p0}, LE1/j;->b(Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    move v4, p0

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    move v4, v2

    .line 41
    :goto_1
    const-string p0, "systemStatusBarContrastEnforced"

    .line 42
    .line 43
    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_2

    .line 48
    .line 49
    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    move-object v5, p0

    .line 58
    goto :goto_2

    .line 59
    :cond_2
    move-object v5, v1

    .line 60
    :goto_2
    const-string p0, "systemNavigationBarColor"

    .line 61
    .line 62
    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_3

    .line 67
    .line 68
    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    move-object v6, p0

    .line 77
    goto :goto_3

    .line 78
    :cond_3
    move-object v6, v1

    .line 79
    :goto_3
    const-string p0, "systemNavigationBarIconBrightness"

    .line 80
    .line 81
    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-nez v0, :cond_4

    .line 86
    .line 87
    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-static {p0}, LE1/j;->b(Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    :cond_4
    move v7, v2

    .line 96
    const-string p0, "systemNavigationBarDividerColor"

    .line 97
    .line 98
    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-nez v0, :cond_5

    .line 103
    .line 104
    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    move-object v8, p0

    .line 113
    goto :goto_4

    .line 114
    :cond_5
    move-object v8, v1

    .line 115
    :goto_4
    const-string p0, "systemNavigationBarContrastEnforced"

    .line 116
    .line 117
    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-nez v0, :cond_6

    .line 122
    .line 123
    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    :cond_6
    move-object v9, v1

    .line 132
    new-instance v2, LD1/b;

    .line 133
    .line 134
    invoke-direct/range {v2 .. v9}, LD1/b;-><init>(Ljava/lang/Integer;ILjava/lang/Boolean;Ljava/lang/Integer;ILjava/lang/Integer;Ljava/lang/Boolean;)V

    .line 135
    .line 136
    .line 137
    return-object v2
.end method

.method public static w(Ljava/lang/Class;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Class;->getModifiers()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isInterface(I)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "Interfaces can\'t be instantiated! Register an InstanceCreator or a TypeAdapter for this type. Interface name: "

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isAbstract(I)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    const-string v1, "Abstract classes can\'t be instantiated! Adjust the R8 configuration or register an InstanceCreator or a TypeAdapter for this type. Class name: "

    .line 31
    .line 32
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string p0, "\nSee "

    .line 43
    .line 44
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string p0, "r8-abstract-class"

    .line 48
    .line 49
    const-string v1, "https://github.com/google/gson/blob/main/Troubleshooting.md#"

    .line 50
    .line 51
    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0

    .line 63
    :cond_1
    const/4 p0, 0x0

    .line 64
    return-object p0
.end method

.method public static x(Ljava/lang/String;IIII)Ljava/util/HashMap;
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "text"

    .line 7
    .line 8
    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    const-string p0, "selectionBase"

    .line 12
    .line 13
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    const-string p0, "selectionExtent"

    .line 21
    .line 22
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    const-string p0, "composingBase"

    .line 30
    .line 31
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    const-string p0, "composingExtent"

    .line 39
    .line 40
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    return-object v0
.end method


# virtual methods
.method public A(Ljava/lang/String;Lo0/a;)V
    .locals 3

    .line 1
    iget-object v0, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/content/Context;

    .line 4
    .line 5
    iget-object v1, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ljava/util/Locale;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    new-instance v2, Landroid/location/Geocoder;

    .line 12
    .line 13
    invoke-direct {v2, v0, v1}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;Ljava/util/Locale;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    new-instance v2, Landroid/location/Geocoder;

    .line 18
    .line 19
    invoke-direct {v2, v0}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;)V

    .line 20
    .line 21
    .line 22
    :goto_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 23
    .line 24
    const/16 v1, 0x21

    .line 25
    .line 26
    if-lt v0, v1, :cond_1

    .line 27
    .line 28
    new-instance v0, Lo0/b;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    invoke-direct {v0, p2, v1}, Lo0/b;-><init>(Lo0/a;I)V

    .line 32
    .line 33
    .line 34
    invoke-static {v2, p1, v0}, LE/c;->q(Landroid/location/Geocoder;Ljava/lang/String;Lo0/b;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    const/4 v0, 0x5

    .line 39
    :try_start_0
    invoke-virtual {v2, p1, v0}, Landroid/location/Geocoder;->getFromLocationName(Ljava/lang/String;I)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-interface {p2, p1}, Lo0/a;->onGeocode(Ljava/util/List;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :catch_0
    move-exception p1

    .line 48
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-interface {p2, p1}, Lo0/a;->onError(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public B(LZ2/D;)Landroid/view/MotionEvent;
    .locals 5

    .line 1
    iget-wide v0, p1, LZ2/D;->a:J

    .line 2
    .line 3
    iget-object p1, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p1, Landroid/util/LongSparseArray;

    .line 6
    .line 7
    iget-object v2, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v2, Ljava/util/PriorityQueue;

    .line 10
    .line 11
    :goto_0
    invoke-virtual {v2}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-nez v3, :cond_0

    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/util/PriorityQueue;->peek()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    check-cast v3, Ljava/lang/Long;

    .line 22
    .line 23
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 24
    .line 25
    .line 26
    move-result-wide v3

    .line 27
    cmp-long v3, v3, v0

    .line 28
    .line 29
    if-gez v3, :cond_0

    .line 30
    .line 31
    invoke-virtual {v2}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    check-cast v3, Ljava/lang/Long;

    .line 36
    .line 37
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 38
    .line 39
    .line 40
    move-result-wide v3

    .line 41
    invoke-virtual {p1, v3, v4}, Landroid/util/LongSparseArray;->remove(J)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-virtual {v2}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-nez v3, :cond_1

    .line 50
    .line 51
    invoke-virtual {v2}, Ljava/util/PriorityQueue;->peek()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    check-cast v3, Ljava/lang/Long;

    .line 56
    .line 57
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 58
    .line 59
    .line 60
    move-result-wide v3

    .line 61
    cmp-long v3, v3, v0

    .line 62
    .line 63
    if-nez v3, :cond_1

    .line 64
    .line 65
    invoke-virtual {v2}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    :cond_1
    invoke-virtual {p1, v0, v1}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    check-cast v2, Landroid/view/MotionEvent;

    .line 73
    .line 74
    invoke-virtual {p1, v0, v1}, Landroid/util/LongSparseArray;->remove(J)V

    .line 75
    .line 76
    .line 77
    return-object v2
.end method

.method public C(I)V
    .locals 2

    .line 1
    iget v0, p0, LZ2/s;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const/16 v0, 0x20

    .line 7
    .line 8
    if-eq p1, v0, :cond_1

    .line 9
    .line 10
    const/16 v0, 0x30

    .line 11
    .line 12
    if-eq p1, v0, :cond_1

    .line 13
    .line 14
    const/16 v0, 0x40

    .line 15
    .line 16
    if-ne p1, v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    new-instance v0, Ljava/security/InvalidAlgorithmParameterException;

    .line 20
    .line 21
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string v1, "Invalid key size %d; only 32-byte, 48-byte and 64-byte AES-SIV keys are supported"

    .line 30
    .line 31
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-direct {v0, p1}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    throw v0

    .line 39
    :cond_1
    :goto_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 44
    .line 45
    return-void

    .line 46
    :pswitch_0
    const/16 v0, 0x10

    .line 47
    .line 48
    if-eq p1, v0, :cond_3

    .line 49
    .line 50
    const/16 v0, 0x20

    .line 51
    .line 52
    if-ne p1, v0, :cond_2

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    new-instance v0, Ljava/security/InvalidAlgorithmParameterException;

    .line 56
    .line 57
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    const-string v1, "Invalid key size %d; only 16-byte and 32-byte AES keys are supported"

    .line 66
    .line 67
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-direct {v0, p1}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    throw v0

    .line 75
    :cond_3
    :goto_1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    iput-object p1, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 80
    .line 81
    return-void

    .line 82
    nop

    .line 83
    :pswitch_data_0
    .packed-switch 0x11
        :pswitch_0
    .end packed-switch
.end method

.method public a(Landroid/view/KeyEvent;LI2/h;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p2, v2}, LI2/h;->a(Z)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v3, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v3, LV0/k;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getUnicodeChar()I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    invoke-virtual {v3, v4}, LV0/k;->a(I)Ljava/lang/Character;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    move v1, v2

    .line 31
    :goto_0
    iget-object v0, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v0, Lio/flutter/plugin/editing/j;

    .line 34
    .line 35
    new-instance v4, LD1/a;

    .line 36
    .line 37
    const/16 v5, 0x8

    .line 38
    .line 39
    invoke-direct {v4, v5, p2}, LD1/a;-><init>(ILjava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    iget-object p2, v0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast p2, LV1/y;

    .line 45
    .line 46
    new-instance v0, Ljava/util/HashMap;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 49
    .line 50
    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    const-string v1, "keyup"

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    const-string v1, "keydown"

    .line 57
    .line 58
    :goto_1
    const-string v5, "type"

    .line 59
    .line 60
    invoke-virtual {v0, v5, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    const-string v1, "keymap"

    .line 64
    .line 65
    const-string v5, "android"

    .line 66
    .line 67
    invoke-virtual {v0, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getFlags()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    const-string v5, "flags"

    .line 79
    .line 80
    invoke-virtual {v0, v5, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1, v2}, Landroid/view/KeyEvent;->getUnicodeChar(I)I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    const-string v2, "plainCodePoint"

    .line 92
    .line 93
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getUnicodeChar()I

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    const-string v2, "codePoint"

    .line 105
    .line 106
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    const-string v2, "keyCode"

    .line 118
    .line 119
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getScanCode()I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    const-string v2, "scanCode"

    .line 131
    .line 132
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getMetaState()I

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    const-string v2, "metaState"

    .line 144
    .line 145
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    const-string v1, "character"

    .line 149
    .line 150
    invoke-virtual {v3}, Ljava/lang/Character;->toString()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getSource()I

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    const-string v2, "source"

    .line 166
    .line 167
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getDeviceId()I

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    const-string v2, "deviceId"

    .line 179
    .line 180
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getRepeatCount()I

    .line 184
    .line 185
    .line 186
    move-result p1

    .line 187
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    const-string v1, "repeatCount"

    .line 192
    .line 193
    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    new-instance p1, LD1/a;

    .line 197
    .line 198
    const/16 v1, 0xb

    .line 199
    .line 200
    invoke-direct {p1, v1, v4}, LD1/a;-><init>(ILjava/lang/Object;)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {p2, v0, p1}, LV1/y;->v(Ljava/io/Serializable;Lk3/c;)V

    .line 204
    .line 205
    .line 206
    return-void
.end method

.method public b(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/plugin/platform/p;

    .line 4
    .line 5
    iget-object v0, v0, Lio/flutter/plugin/platform/p;->A:Lio/flutter/plugin/platform/m;

    .line 6
    .line 7
    iget-object v0, v0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Lio/flutter/plugin/platform/p;

    .line 10
    .line 11
    iput-boolean p1, v0, Lio/flutter/plugin/platform/p;->v:Z

    .line 12
    .line 13
    return-void
.end method

.method public c(Lio/flutter/view/i;)V
    .locals 1

    .line 1
    iget-object v0, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/plugin/platform/p;

    .line 4
    .line 5
    iget-object v0, v0, Lio/flutter/plugin/platform/p;->m:Lio/flutter/plugin/platform/a;

    .line 6
    .line 7
    iput-object p1, v0, Lio/flutter/plugin/platform/a;->a:Lio/flutter/view/i;

    .line 8
    .line 9
    iget-object v0, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Lio/flutter/plugin/platform/o;

    .line 12
    .line 13
    iget-object v0, v0, Lio/flutter/plugin/platform/o;->l:Lio/flutter/plugin/platform/a;

    .line 14
    .line 15
    iput-object p1, v0, Lio/flutter/plugin/platform/a;->a:Lio/flutter/view/i;

    .line 16
    .line 17
    return-void
.end method

.method public d(IDD)V
    .locals 7

    .line 1
    iget-object v0, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/plugin/platform/o;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lio/flutter/plugin/platform/o;->h(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Lio/flutter/plugin/platform/p;

    .line 15
    .line 16
    iget-object v1, v0, Lio/flutter/plugin/platform/p;->A:Lio/flutter/plugin/platform/m;

    .line 17
    .line 18
    move v2, p1

    .line 19
    move-wide v3, p2

    .line 20
    move-wide v5, p4

    .line 21
    invoke-virtual/range {v1 .. v6}, Lio/flutter/plugin/platform/m;->d(IDD)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public e(II)V
    .locals 2

    .line 1
    iget-object v0, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/plugin/platform/o;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lio/flutter/plugin/platform/o;->h(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v0, v0, Lio/flutter/plugin/platform/o;->t:Lio/flutter/plugin/platform/m;

    .line 12
    .line 13
    invoke-virtual {v0, p1, p2}, Lio/flutter/plugin/platform/m;->e(II)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object v0, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v0, Lio/flutter/plugin/platform/p;

    .line 20
    .line 21
    iget-object v0, v0, Lio/flutter/plugin/platform/p;->A:Lio/flutter/plugin/platform/m;

    .line 22
    .line 23
    invoke-virtual {v0, p1, p2}, Lio/flutter/plugin/platform/m;->e(II)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public f(Lj3/h;Lj3/g;)V
    .locals 2

    .line 1
    iget-object v0, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/plugin/platform/o;

    .line 4
    .line 5
    iget v1, p1, Lj3/h;->a:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lio/flutter/plugin/platform/o;->h(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Lio/flutter/plugin/platform/p;

    .line 17
    .line 18
    iget-object v0, v0, Lio/flutter/plugin/platform/p;->A:Lio/flutter/plugin/platform/m;

    .line 19
    .line 20
    invoke-virtual {v0, p1, p2}, Lio/flutter/plugin/platform/m;->f(Lj3/h;Lj3/g;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public g(I)Z
    .locals 1

    .line 1
    iget-object v0, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/plugin/platform/o;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lio/flutter/plugin/platform/o;->h(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    return p1

    .line 13
    :cond_0
    iget-object v0, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, Lio/flutter/plugin/platform/p;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Lio/flutter/plugin/platform/p;->g(I)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    return p1
.end method

.method public h(I)Landroid/view/View;
    .locals 2

    .line 1
    iget-object v0, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/plugin/platform/o;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lio/flutter/plugin/platform/o;->h(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lio/flutter/plugin/platform/o;->h(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    return-object p1

    .line 16
    :cond_0
    iget-object v0, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v0, Lio/flutter/plugin/platform/p;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Lio/flutter/plugin/platform/p;->h(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    return-object p1
.end method

.method public i(Lj3/e;)V
    .locals 1

    .line 1
    iget-object v0, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/plugin/platform/p;

    .line 4
    .line 5
    iget-object v0, v0, Lio/flutter/plugin/platform/p;->A:Lio/flutter/plugin/platform/m;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lio/flutter/plugin/platform/m;->i(Lj3/e;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public j(I)V
    .locals 2

    .line 1
    iget-object v0, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/plugin/platform/o;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lio/flutter/plugin/platform/o;->h(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v0, v0, Lio/flutter/plugin/platform/o;->t:Lio/flutter/plugin/platform/m;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lio/flutter/plugin/platform/m;->j(I)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object v0, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v0, Lio/flutter/plugin/platform/p;

    .line 20
    .line 21
    iget-object v0, v0, Lio/flutter/plugin/platform/p;->A:Lio/flutter/plugin/platform/m;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Lio/flutter/plugin/platform/m;->j(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public k(Lj3/e;)J
    .locals 2

    .line 1
    iget-object v0, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/plugin/platform/p;

    .line 4
    .line 5
    iget-object v0, v0, Lio/flutter/plugin/platform/p;->A:Lio/flutter/plugin/platform/m;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lio/flutter/plugin/platform/m;->k(Lj3/e;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public l()V
    .locals 1

    .line 1
    iget-object v0, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/plugin/platform/p;

    .line 4
    .line 5
    invoke-virtual {v0}, Lio/flutter/plugin/platform/p;->l()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v0, Lio/flutter/plugin/platform/o;

    .line 11
    .line 12
    invoke-virtual {v0}, Lio/flutter/plugin/platform/o;->l()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public m(Lj3/f;)V
    .locals 2

    .line 1
    iget-object v0, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/plugin/platform/o;

    .line 4
    .line 5
    iget v1, p1, Lj3/f;->a:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lio/flutter/plugin/platform/o;->h(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v0, v0, Lio/flutter/plugin/platform/o;->t:Lio/flutter/plugin/platform/m;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Lio/flutter/plugin/platform/m;->m(Lj3/f;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v0, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v0, Lio/flutter/plugin/platform/p;

    .line 22
    .line 23
    iget-object v0, v0, Lio/flutter/plugin/platform/p;->A:Lio/flutter/plugin/platform/m;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Lio/flutter/plugin/platform/m;->m(Lj3/f;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public n(I)V
    .locals 2

    .line 1
    iget-object v0, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/plugin/platform/o;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lio/flutter/plugin/platform/o;->h(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v0, v0, Lio/flutter/plugin/platform/o;->t:Lio/flutter/plugin/platform/m;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lio/flutter/plugin/platform/m;->n(I)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object v0, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v0, Lio/flutter/plugin/platform/p;

    .line 20
    .line 21
    iget-object v0, v0, Lio/flutter/plugin/platform/p;->A:Lio/flutter/plugin/platform/m;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Lio/flutter/plugin/platform/m;->n(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public o(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget v0, p0, LZ2/s;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lb3/g;

    .line 9
    .line 10
    iget-object v1, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v1, LZ2/s;

    .line 13
    .line 14
    iget-object v1, v1, LZ2/s;->g:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v1, LV1/y;

    .line 17
    .line 18
    iget-object v1, v1, LV1/y;->h:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v1, Lk3/k;

    .line 21
    .line 22
    invoke-interface {v1, p1}, Lk3/k;->a(Ljava/lang/Object;)Ljava/nio/ByteBuffer;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {v0, p1}, Lb3/g;->a(Ljava/nio/ByteBuffer;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :pswitch_0
    iget-object p1, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast p1, LB2/a;

    .line 33
    .line 34
    iget-object v0, p1, LB2/a;->f:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 37
    .line 38
    iget-object v1, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast v1, Lj3/k;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    iget-object p1, p1, LB2/a;->f:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast p1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 48
    .line 49
    invoke-virtual {p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-nez p1, :cond_0

    .line 54
    .line 55
    new-instance p1, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    const-string v0, "The queue becomes empty after removing config generation "

    .line 58
    .line 59
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget v0, v1, Lj3/k;->a:I

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    const-string v0, "SettingsChannel"

    .line 72
    .line 73
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    :cond_0
    return-void

    .line 77
    :pswitch_data_0
    .packed-switch 0xf
        :pswitch_0
    .end packed-switch
.end method

.method public onMethodCall(Lk3/l;Lk3/n;)V
    .locals 18

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    iget v2, v1, LZ2/s;->e:I

    .line 6
    .line 7
    const/4 v7, 0x0

    .line 8
    const/4 v8, 0x2

    .line 9
    const/4 v9, 0x1

    .line 10
    const/4 v10, 0x0

    .line 11
    sparse-switch v2, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    iget-object v2, v1, LZ2/s;->f:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v2, Landroid/content/Context;

    .line 17
    .line 18
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v11

    .line 22
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object v12

    .line 26
    iget-object v13, v1, LZ2/s;->g:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v13, Lq0/b;

    .line 29
    .line 30
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v14

    .line 34
    iget-object v15, v0, Lk3/l;->a:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v0, v0, Lk3/l;->b:Ljava/lang/Object;

    .line 37
    .line 38
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v15}, Ljava/lang/String;->hashCode()I

    .line 42
    .line 43
    .line 44
    move-result v16

    .line 45
    sparse-switch v16, :sswitch_data_1

    .line 46
    .line 47
    .line 48
    :goto_0
    const/4 v4, -0x1

    .line 49
    goto :goto_1

    .line 50
    :sswitch_0
    const-string v4, "requestPermissions"

    .line 51
    .line 52
    invoke-virtual {v15, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    if-nez v4, :cond_0

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    const/4 v4, 0x4

    .line 60
    goto :goto_1

    .line 61
    :sswitch_1
    const-string v4, "openAppSettings"

    .line 62
    .line 63
    invoke-virtual {v15, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    if-nez v4, :cond_1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    const/4 v4, 0x3

    .line 71
    goto :goto_1

    .line 72
    :sswitch_2
    const-string v4, "checkPermissionStatus"

    .line 73
    .line 74
    invoke-virtual {v15, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    if-nez v4, :cond_2

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_2
    move v4, v8

    .line 82
    goto :goto_1

    .line 83
    :sswitch_3
    const-string v4, "shouldShowRequestPermissionRationale"

    .line 84
    .line 85
    invoke-virtual {v15, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    if-nez v4, :cond_3

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_3
    move v4, v9

    .line 93
    goto :goto_1

    .line 94
    :sswitch_4
    const-string v4, "checkServiceStatus"

    .line 95
    .line 96
    invoke-virtual {v15, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result v4

    .line 100
    if-nez v4, :cond_4

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_4
    move v4, v10

    .line 104
    :goto_1
    const-string v15, "Android context cannot be null."

    .line 105
    .line 106
    move/from16 v17, v8

    .line 107
    .line 108
    const-string v8, "Context cannot be null."

    .line 109
    .line 110
    const-string v5, "Unable to detect current Android Activity."

    .line 111
    .line 112
    const-string v6, "Unable to detect current Activity."

    .line 113
    .line 114
    const-string v3, "PermissionHandler.PermissionManager"

    .line 115
    .line 116
    const-string v9, "permissions_handler"

    .line 117
    .line 118
    packed-switch v4, :pswitch_data_0

    .line 119
    .line 120
    .line 121
    move-object/from16 v0, p2

    .line 122
    .line 123
    check-cast v0, LQ2/g;

    .line 124
    .line 125
    invoke-virtual {v0}, LQ2/g;->b()V

    .line 126
    .line 127
    .line 128
    goto/16 :goto_a

    .line 129
    .line 130
    :pswitch_0
    check-cast v0, Ljava/util/List;

    .line 131
    .line 132
    new-instance v2, Lj3/g;

    .line 133
    .line 134
    move-object/from16 v4, p2

    .line 135
    .line 136
    check-cast v4, LQ2/g;

    .line 137
    .line 138
    invoke-direct {v2, v4}, Lj3/g;-><init>(LQ2/g;)V

    .line 139
    .line 140
    .line 141
    iget v8, v13, Lq0/b;->h:I

    .line 142
    .line 143
    if-lez v8, :cond_5

    .line 144
    .line 145
    const-string v0, "A request for permissions is already running, please wait for it to finish before doing another request (note that you can request multiple permissions at the same time)."

    .line 146
    .line 147
    invoke-virtual {v4, v3, v0, v7}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 148
    .line 149
    .line 150
    goto/16 :goto_a

    .line 151
    .line 152
    :cond_5
    iget-object v8, v13, Lq0/b;->g:Landroid/app/Activity;

    .line 153
    .line 154
    if-nez v8, :cond_6

    .line 155
    .line 156
    invoke-static {v9, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    invoke-virtual {v4, v3, v5, v7}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 160
    .line 161
    .line 162
    goto/16 :goto_a

    .line 163
    .line 164
    :cond_6
    iput-object v2, v13, Lq0/b;->f:Lj3/g;

    .line 165
    .line 166
    new-instance v2, Ljava/util/HashMap;

    .line 167
    .line 168
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 169
    .line 170
    .line 171
    iput-object v2, v13, Lq0/b;->i:Ljava/util/HashMap;

    .line 172
    .line 173
    iput v10, v13, Lq0/b;->h:I

    .line 174
    .line 175
    new-instance v2, Ljava/util/ArrayList;

    .line 176
    .line 177
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 178
    .line 179
    .line 180
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    :cond_7
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 185
    .line 186
    .line 187
    move-result v3

    .line 188
    const/16 v4, 0x18

    .line 189
    .line 190
    if-eqz v3, :cond_15

    .line 191
    .line 192
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object v3

    .line 196
    check-cast v3, Ljava/lang/Integer;

    .line 197
    .line 198
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 199
    .line 200
    .line 201
    move-result v5

    .line 202
    invoke-virtual {v13, v5}, Lq0/b;->a(I)I

    .line 203
    .line 204
    .line 205
    move-result v5

    .line 206
    const/4 v6, 0x1

    .line 207
    if-ne v5, v6, :cond_8

    .line 208
    .line 209
    iget-object v4, v13, Lq0/b;->i:Ljava/util/HashMap;

    .line 210
    .line 211
    invoke-virtual {v4, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result v4

    .line 215
    if-nez v4, :cond_7

    .line 216
    .line 217
    iget-object v4, v13, Lq0/b;->i:Ljava/util/HashMap;

    .line 218
    .line 219
    invoke-virtual {v4, v3, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    goto :goto_2

    .line 223
    :cond_8
    iget-object v5, v13, Lq0/b;->g:Landroid/app/Activity;

    .line 224
    .line 225
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 226
    .line 227
    .line 228
    move-result v6

    .line 229
    invoke-static {v5, v6}, Lc1/g;->x(Landroid/content/Context;I)Ljava/util/ArrayList;

    .line 230
    .line 231
    .line 232
    move-result-object v5

    .line 233
    const/16 v6, 0x16

    .line 234
    .line 235
    const/16 v7, 0x1e

    .line 236
    .line 237
    if-eqz v5, :cond_13

    .line 238
    .line 239
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    .line 240
    .line 241
    .line 242
    move-result v8

    .line 243
    if-eqz v8, :cond_9

    .line 244
    .line 245
    goto/16 :goto_4

    .line 246
    .line 247
    :cond_9
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 248
    .line 249
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 250
    .line 251
    .line 252
    move-result v9

    .line 253
    const/16 v15, 0x10

    .line 254
    .line 255
    if-ne v9, v15, :cond_a

    .line 256
    .line 257
    const-string v3, "android.settings.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS"

    .line 258
    .line 259
    const/16 v4, 0xd1

    .line 260
    .line 261
    invoke-virtual {v13, v3, v4}, Lq0/b;->c(Ljava/lang/String;I)V

    .line 262
    .line 263
    .line 264
    goto :goto_2

    .line 265
    :cond_a
    if-lt v8, v7, :cond_b

    .line 266
    .line 267
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 268
    .line 269
    .line 270
    move-result v7

    .line 271
    if-ne v7, v6, :cond_b

    .line 272
    .line 273
    const-string v3, "android.settings.MANAGE_APP_ALL_FILES_ACCESS_PERMISSION"

    .line 274
    .line 275
    const/16 v4, 0xd2

    .line 276
    .line 277
    invoke-virtual {v13, v3, v4}, Lq0/b;->c(Ljava/lang/String;I)V

    .line 278
    .line 279
    .line 280
    goto :goto_2

    .line 281
    :cond_b
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 282
    .line 283
    .line 284
    move-result v6

    .line 285
    const/16 v7, 0x17

    .line 286
    .line 287
    if-ne v6, v7, :cond_c

    .line 288
    .line 289
    const-string v3, "android.settings.action.MANAGE_OVERLAY_PERMISSION"

    .line 290
    .line 291
    const/16 v4, 0xd3

    .line 292
    .line 293
    invoke-virtual {v13, v3, v4}, Lq0/b;->c(Ljava/lang/String;I)V

    .line 294
    .line 295
    .line 296
    goto :goto_2

    .line 297
    :cond_c
    const/16 v6, 0x1a

    .line 298
    .line 299
    if-lt v8, v6, :cond_d

    .line 300
    .line 301
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 302
    .line 303
    .line 304
    move-result v6

    .line 305
    if-ne v6, v4, :cond_d

    .line 306
    .line 307
    const-string v3, "android.settings.MANAGE_UNKNOWN_APP_SOURCES"

    .line 308
    .line 309
    const/16 v4, 0xd4

    .line 310
    .line 311
    invoke-virtual {v13, v3, v4}, Lq0/b;->c(Ljava/lang/String;I)V

    .line 312
    .line 313
    .line 314
    goto/16 :goto_2

    .line 315
    .line 316
    :cond_d
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 317
    .line 318
    .line 319
    move-result v4

    .line 320
    const/16 v6, 0x1b

    .line 321
    .line 322
    if-ne v4, v6, :cond_e

    .line 323
    .line 324
    const-string v3, "android.settings.NOTIFICATION_POLICY_ACCESS_SETTINGS"

    .line 325
    .line 326
    const/16 v4, 0xd5

    .line 327
    .line 328
    invoke-virtual {v13, v3, v4}, Lq0/b;->c(Ljava/lang/String;I)V

    .line 329
    .line 330
    .line 331
    goto/16 :goto_2

    .line 332
    .line 333
    :cond_e
    const/16 v4, 0x1f

    .line 334
    .line 335
    if-lt v8, v4, :cond_f

    .line 336
    .line 337
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 338
    .line 339
    .line 340
    move-result v4

    .line 341
    const/16 v6, 0x22

    .line 342
    .line 343
    if-ne v4, v6, :cond_f

    .line 344
    .line 345
    const-string v3, "android.settings.REQUEST_SCHEDULE_EXACT_ALARM"

    .line 346
    .line 347
    const/16 v4, 0xd6

    .line 348
    .line 349
    invoke-virtual {v13, v3, v4}, Lq0/b;->c(Ljava/lang/String;I)V

    .line 350
    .line 351
    .line 352
    goto/16 :goto_2

    .line 353
    .line 354
    :cond_f
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 355
    .line 356
    .line 357
    move-result v4

    .line 358
    const/16 v6, 0x25

    .line 359
    .line 360
    if-eq v4, v6, :cond_11

    .line 361
    .line 362
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 363
    .line 364
    .line 365
    move-result v4

    .line 366
    if-nez v4, :cond_10

    .line 367
    .line 368
    goto :goto_3

    .line 369
    :cond_10
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 370
    .line 371
    .line 372
    iget v3, v13, Lq0/b;->h:I

    .line 373
    .line 374
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 375
    .line 376
    .line 377
    move-result v4

    .line 378
    add-int/2addr v4, v3

    .line 379
    iput v4, v13, Lq0/b;->h:I

    .line 380
    .line 381
    goto/16 :goto_2

    .line 382
    .line 383
    :cond_11
    :goto_3
    invoke-virtual {v13}, Lq0/b;->b()Z

    .line 384
    .line 385
    .line 386
    move-result v4

    .line 387
    if-eqz v4, :cond_12

    .line 388
    .line 389
    const-string v3, "android.permission.WRITE_CALENDAR"

    .line 390
    .line 391
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 392
    .line 393
    .line 394
    const-string v3, "android.permission.READ_CALENDAR"

    .line 395
    .line 396
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 397
    .line 398
    .line 399
    iget v3, v13, Lq0/b;->h:I

    .line 400
    .line 401
    add-int/lit8 v3, v3, 0x2

    .line 402
    .line 403
    iput v3, v13, Lq0/b;->h:I

    .line 404
    .line 405
    goto/16 :goto_2

    .line 406
    .line 407
    :cond_12
    iget-object v4, v13, Lq0/b;->i:Ljava/util/HashMap;

    .line 408
    .line 409
    invoke-virtual {v4, v3, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 410
    .line 411
    .line 412
    goto/16 :goto_2

    .line 413
    .line 414
    :cond_13
    :goto_4
    iget-object v4, v13, Lq0/b;->i:Ljava/util/HashMap;

    .line 415
    .line 416
    invoke-virtual {v4, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 417
    .line 418
    .line 419
    move-result v4

    .line 420
    if-nez v4, :cond_7

    .line 421
    .line 422
    iget-object v4, v13, Lq0/b;->i:Ljava/util/HashMap;

    .line 423
    .line 424
    invoke-virtual {v4, v3, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 425
    .line 426
    .line 427
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 428
    .line 429
    .line 430
    move-result v4

    .line 431
    if-ne v4, v6, :cond_14

    .line 432
    .line 433
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 434
    .line 435
    if-ge v4, v7, :cond_14

    .line 436
    .line 437
    iget-object v4, v13, Lq0/b;->i:Ljava/util/HashMap;

    .line 438
    .line 439
    invoke-virtual {v4, v3, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 440
    .line 441
    .line 442
    goto/16 :goto_2

    .line 443
    .line 444
    :cond_14
    iget-object v4, v13, Lq0/b;->i:Ljava/util/HashMap;

    .line 445
    .line 446
    invoke-virtual {v4, v3, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 447
    .line 448
    .line 449
    goto/16 :goto_2

    .line 450
    .line 451
    :cond_15
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 452
    .line 453
    .line 454
    move-result v0

    .line 455
    if-lez v0, :cond_16

    .line 456
    .line 457
    new-array v0, v10, [Ljava/lang/String;

    .line 458
    .line 459
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 460
    .line 461
    .line 462
    move-result-object v0

    .line 463
    check-cast v0, [Ljava/lang/String;

    .line 464
    .line 465
    iget-object v2, v13, Lq0/b;->g:Landroid/app/Activity;

    .line 466
    .line 467
    invoke-static {v2, v0, v4}, Lt/a;->b(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 468
    .line 469
    .line 470
    :cond_16
    iget-object v0, v13, Lq0/b;->f:Lj3/g;

    .line 471
    .line 472
    if-eqz v0, :cond_2a

    .line 473
    .line 474
    iget v2, v13, Lq0/b;->h:I

    .line 475
    .line 476
    if-nez v2, :cond_2a

    .line 477
    .line 478
    iget-object v2, v13, Lq0/b;->i:Ljava/util/HashMap;

    .line 479
    .line 480
    iget-object v0, v0, Lj3/g;->e:LQ2/g;

    .line 481
    .line 482
    invoke-virtual {v0, v2}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 483
    .line 484
    .line 485
    goto/16 :goto_a

    .line 486
    .line 487
    :pswitch_1
    const-string v0, "package:"

    .line 488
    .line 489
    if-nez v2, :cond_17

    .line 490
    .line 491
    invoke-static {v9, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 492
    .line 493
    .line 494
    const-string v0, "PermissionHandler.AppSettingsManager"

    .line 495
    .line 496
    move-object/from16 v2, p2

    .line 497
    .line 498
    check-cast v2, LQ2/g;

    .line 499
    .line 500
    invoke-virtual {v2, v0, v15, v7}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 501
    .line 502
    .line 503
    goto/16 :goto_a

    .line 504
    .line 505
    :cond_17
    :try_start_0
    new-instance v3, Landroid/content/Intent;

    .line 506
    .line 507
    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 508
    .line 509
    .line 510
    const-string v4, "android.settings.APPLICATION_DETAILS_SETTINGS"

    .line 511
    .line 512
    invoke-virtual {v3, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 513
    .line 514
    .line 515
    const-string v4, "android.intent.category.DEFAULT"

    .line 516
    .line 517
    invoke-virtual {v3, v4}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 518
    .line 519
    .line 520
    new-instance v4, Ljava/lang/StringBuilder;

    .line 521
    .line 522
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 523
    .line 524
    .line 525
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 526
    .line 527
    .line 528
    move-result-object v0

    .line 529
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 530
    .line 531
    .line 532
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 533
    .line 534
    .line 535
    move-result-object v0

    .line 536
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 537
    .line 538
    .line 539
    move-result-object v0

    .line 540
    invoke-virtual {v3, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 541
    .line 542
    .line 543
    const/high16 v0, 0x10000000

    .line 544
    .line 545
    invoke-virtual {v3, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 546
    .line 547
    .line 548
    const/high16 v0, 0x40000000    # 2.0f

    .line 549
    .line 550
    invoke-virtual {v3, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 551
    .line 552
    .line 553
    const/high16 v0, 0x800000

    .line 554
    .line 555
    invoke-virtual {v3, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 556
    .line 557
    .line 558
    invoke-virtual {v2, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 559
    .line 560
    .line 561
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 562
    .line 563
    move-object/from16 v2, p2

    .line 564
    .line 565
    check-cast v2, LQ2/g;

    .line 566
    .line 567
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 568
    .line 569
    .line 570
    goto/16 :goto_a

    .line 571
    .line 572
    :catch_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 573
    .line 574
    move-object/from16 v2, p2

    .line 575
    .line 576
    check-cast v2, LQ2/g;

    .line 577
    .line 578
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 579
    .line 580
    .line 581
    goto/16 :goto_a

    .line 582
    .line 583
    :pswitch_2
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 584
    .line 585
    .line 586
    move-result-object v0

    .line 587
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 588
    .line 589
    .line 590
    move-result v0

    .line 591
    invoke-virtual {v13, v0}, Lq0/b;->a(I)I

    .line 592
    .line 593
    .line 594
    move-result v0

    .line 595
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 596
    .line 597
    .line 598
    move-result-object v0

    .line 599
    move-object/from16 v2, p2

    .line 600
    .line 601
    check-cast v2, LQ2/g;

    .line 602
    .line 603
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 604
    .line 605
    .line 606
    goto/16 :goto_a

    .line 607
    .line 608
    :pswitch_3
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 609
    .line 610
    .line 611
    move-result-object v0

    .line 612
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 613
    .line 614
    .line 615
    move-result v0

    .line 616
    iget-object v2, v13, Lq0/b;->g:Landroid/app/Activity;

    .line 617
    .line 618
    if-nez v2, :cond_18

    .line 619
    .line 620
    invoke-static {v9, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 621
    .line 622
    .line 623
    move-object/from16 v0, p2

    .line 624
    .line 625
    check-cast v0, LQ2/g;

    .line 626
    .line 627
    invoke-virtual {v0, v3, v5, v7}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 628
    .line 629
    .line 630
    goto/16 :goto_a

    .line 631
    .line 632
    :cond_18
    invoke-static {v2, v0}, Lc1/g;->x(Landroid/content/Context;I)Ljava/util/ArrayList;

    .line 633
    .line 634
    .line 635
    move-result-object v2

    .line 636
    if-nez v2, :cond_19

    .line 637
    .line 638
    new-instance v2, Ljava/lang/StringBuilder;

    .line 639
    .line 640
    const-string v3, "No android specific permissions needed for: "

    .line 641
    .line 642
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 643
    .line 644
    .line 645
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 646
    .line 647
    .line 648
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 649
    .line 650
    .line 651
    move-result-object v0

    .line 652
    invoke-static {v9, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 653
    .line 654
    .line 655
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 656
    .line 657
    move-object/from16 v2, p2

    .line 658
    .line 659
    check-cast v2, LQ2/g;

    .line 660
    .line 661
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 662
    .line 663
    .line 664
    goto/16 :goto_a

    .line 665
    .line 666
    :cond_19
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 667
    .line 668
    .line 669
    move-result v3

    .line 670
    if-eqz v3, :cond_1a

    .line 671
    .line 672
    new-instance v2, Ljava/lang/StringBuilder;

    .line 673
    .line 674
    const-string v3, "No permissions found in manifest for: "

    .line 675
    .line 676
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 677
    .line 678
    .line 679
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 680
    .line 681
    .line 682
    const-string v0, " no need to show request rationale"

    .line 683
    .line 684
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 685
    .line 686
    .line 687
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 688
    .line 689
    .line 690
    move-result-object v0

    .line 691
    invoke-static {v9, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 692
    .line 693
    .line 694
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 695
    .line 696
    move-object/from16 v2, p2

    .line 697
    .line 698
    check-cast v2, LQ2/g;

    .line 699
    .line 700
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 701
    .line 702
    .line 703
    goto/16 :goto_a

    .line 704
    .line 705
    :cond_1a
    iget-object v0, v13, Lq0/b;->g:Landroid/app/Activity;

    .line 706
    .line 707
    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 708
    .line 709
    .line 710
    move-result-object v2

    .line 711
    check-cast v2, Ljava/lang/String;

    .line 712
    .line 713
    invoke-static {v0, v2}, Lt/a;->c(Landroid/app/Activity;Ljava/lang/String;)Z

    .line 714
    .line 715
    .line 716
    move-result v0

    .line 717
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 718
    .line 719
    .line 720
    move-result-object v0

    .line 721
    move-object/from16 v2, p2

    .line 722
    .line 723
    check-cast v2, LQ2/g;

    .line 724
    .line 725
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 726
    .line 727
    .line 728
    goto/16 :goto_a

    .line 729
    .line 730
    :pswitch_4
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 731
    .line 732
    .line 733
    move-result-object v0

    .line 734
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 735
    .line 736
    .line 737
    move-result v0

    .line 738
    if-nez v2, :cond_1b

    .line 739
    .line 740
    invoke-static {v9, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 741
    .line 742
    .line 743
    const-string v0, "PermissionHandler.ServiceManager"

    .line 744
    .line 745
    move-object/from16 v2, p2

    .line 746
    .line 747
    check-cast v2, LQ2/g;

    .line 748
    .line 749
    invoke-virtual {v2, v0, v15, v7}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 750
    .line 751
    .line 752
    goto/16 :goto_a

    .line 753
    .line 754
    :cond_1b
    const/4 v3, 0x3

    .line 755
    if-eq v0, v3, :cond_26

    .line 756
    .line 757
    const/4 v4, 0x4

    .line 758
    if-eq v0, v4, :cond_26

    .line 759
    .line 760
    const/4 v3, 0x5

    .line 761
    if-ne v0, v3, :cond_1c

    .line 762
    .line 763
    goto/16 :goto_7

    .line 764
    .line 765
    :cond_1c
    const/16 v4, 0x15

    .line 766
    .line 767
    if-ne v0, v4, :cond_1d

    .line 768
    .line 769
    const-string v0, "bluetooth"

    .line 770
    .line 771
    invoke-virtual {v2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 772
    .line 773
    .line 774
    move-result-object v0

    .line 775
    check-cast v0, Landroid/bluetooth/BluetoothManager;

    .line 776
    .line 777
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothManager;->getAdapter()Landroid/bluetooth/BluetoothAdapter;

    .line 778
    .line 779
    .line 780
    move-result-object v0

    .line 781
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    .line 782
    .line 783
    .line 784
    move-result v0

    .line 785
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 786
    .line 787
    .line 788
    move-result-object v0

    .line 789
    move-object/from16 v2, p2

    .line 790
    .line 791
    check-cast v2, LQ2/g;

    .line 792
    .line 793
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 794
    .line 795
    .line 796
    goto/16 :goto_a

    .line 797
    .line 798
    :cond_1d
    const/16 v4, 0x8

    .line 799
    .line 800
    if-ne v0, v4, :cond_24

    .line 801
    .line 802
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 803
    .line 804
    .line 805
    move-result-object v0

    .line 806
    const-string v4, "android.hardware.telephony"

    .line 807
    .line 808
    invoke-virtual {v0, v4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 809
    .line 810
    .line 811
    move-result v4

    .line 812
    if-nez v4, :cond_1e

    .line 813
    .line 814
    move-object/from16 v0, p2

    .line 815
    .line 816
    check-cast v0, LQ2/g;

    .line 817
    .line 818
    invoke-virtual {v0, v11}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 819
    .line 820
    .line 821
    goto/16 :goto_a

    .line 822
    .line 823
    :cond_1e
    const-string v4, "phone"

    .line 824
    .line 825
    invoke-virtual {v2, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 826
    .line 827
    .line 828
    move-result-object v2

    .line 829
    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 830
    .line 831
    if-eqz v2, :cond_23

    .line 832
    .line 833
    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getPhoneType()I

    .line 834
    .line 835
    .line 836
    move-result v4

    .line 837
    if-nez v4, :cond_1f

    .line 838
    .line 839
    goto :goto_6

    .line 840
    :cond_1f
    new-instance v4, Landroid/content/Intent;

    .line 841
    .line 842
    const-string v5, "android.intent.action.CALL"

    .line 843
    .line 844
    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 845
    .line 846
    .line 847
    const-string v5, "tel:123123"

    .line 848
    .line 849
    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 850
    .line 851
    .line 852
    move-result-object v5

    .line 853
    invoke-virtual {v4, v5}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 854
    .line 855
    .line 856
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 857
    .line 858
    const/16 v6, 0x21

    .line 859
    .line 860
    if-lt v5, v6, :cond_20

    .line 861
    .line 862
    invoke-static {}, LE/c;->f()Landroid/content/pm/PackageManager$ResolveInfoFlags;

    .line 863
    .line 864
    .line 865
    move-result-object v5

    .line 866
    invoke-static {v0, v4, v5}, LE/c;->m(Landroid/content/pm/PackageManager;Landroid/content/Intent;Landroid/content/pm/PackageManager$ResolveInfoFlags;)Ljava/util/List;

    .line 867
    .line 868
    .line 869
    move-result-object v0

    .line 870
    goto :goto_5

    .line 871
    :cond_20
    invoke-virtual {v0, v4, v10}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    .line 872
    .line 873
    .line 874
    move-result-object v0

    .line 875
    :goto_5
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 876
    .line 877
    .line 878
    move-result v0

    .line 879
    if-eqz v0, :cond_21

    .line 880
    .line 881
    move-object/from16 v0, p2

    .line 882
    .line 883
    check-cast v0, LQ2/g;

    .line 884
    .line 885
    invoke-virtual {v0, v11}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 886
    .line 887
    .line 888
    goto/16 :goto_a

    .line 889
    .line 890
    :cond_21
    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getSimState()I

    .line 891
    .line 892
    .line 893
    move-result v0

    .line 894
    if-eq v0, v3, :cond_22

    .line 895
    .line 896
    move-object/from16 v0, p2

    .line 897
    .line 898
    check-cast v0, LQ2/g;

    .line 899
    .line 900
    invoke-virtual {v0, v14}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 901
    .line 902
    .line 903
    goto :goto_a

    .line 904
    :cond_22
    move-object/from16 v0, p2

    .line 905
    .line 906
    check-cast v0, LQ2/g;

    .line 907
    .line 908
    invoke-virtual {v0, v12}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 909
    .line 910
    .line 911
    goto :goto_a

    .line 912
    :cond_23
    :goto_6
    move-object/from16 v0, p2

    .line 913
    .line 914
    check-cast v0, LQ2/g;

    .line 915
    .line 916
    invoke-virtual {v0, v11}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 917
    .line 918
    .line 919
    goto :goto_a

    .line 920
    :cond_24
    const/16 v15, 0x10

    .line 921
    .line 922
    if-ne v0, v15, :cond_25

    .line 923
    .line 924
    move-object/from16 v0, p2

    .line 925
    .line 926
    check-cast v0, LQ2/g;

    .line 927
    .line 928
    invoke-virtual {v0, v12}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 929
    .line 930
    .line 931
    goto :goto_a

    .line 932
    :cond_25
    move-object/from16 v0, p2

    .line 933
    .line 934
    check-cast v0, LQ2/g;

    .line 935
    .line 936
    invoke-virtual {v0, v11}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 937
    .line 938
    .line 939
    goto :goto_a

    .line 940
    :cond_26
    :goto_7
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 941
    .line 942
    const/16 v3, 0x1c

    .line 943
    .line 944
    if-lt v0, v3, :cond_29

    .line 945
    .line 946
    const-class v0, Landroid/location/LocationManager;

    .line 947
    .line 948
    invoke-virtual {v2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 949
    .line 950
    .line 951
    move-result-object v0

    .line 952
    check-cast v0, Landroid/location/LocationManager;

    .line 953
    .line 954
    if-nez v0, :cond_28

    .line 955
    .line 956
    :cond_27
    :goto_8
    move v9, v10

    .line 957
    goto :goto_9

    .line 958
    :cond_28
    invoke-static {v0}, LQ2/a;->x(Landroid/location/LocationManager;)Z

    .line 959
    .line 960
    .line 961
    move-result v9

    .line 962
    goto :goto_9

    .line 963
    :cond_29
    :try_start_1
    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 964
    .line 965
    .line 966
    move-result-object v0

    .line 967
    const-string v2, "location_mode"

    .line 968
    .line 969
    invoke-static {v0, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    .line 970
    .line 971
    .line 972
    move-result v0
    :try_end_1
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 973
    if-eqz v0, :cond_27

    .line 974
    .line 975
    const/4 v9, 0x1

    .line 976
    goto :goto_9

    .line 977
    :catch_1
    move-exception v0

    .line 978
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 979
    .line 980
    .line 981
    goto :goto_8

    .line 982
    :goto_9
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 983
    .line 984
    .line 985
    move-result-object v0

    .line 986
    move-object/from16 v2, p2

    .line 987
    .line 988
    check-cast v2, LQ2/g;

    .line 989
    .line 990
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 991
    .line 992
    .line 993
    :cond_2a
    :goto_a
    return-void

    .line 994
    :sswitch_5
    move/from16 v17, v8

    .line 995
    .line 996
    const/4 v3, 0x3

    .line 997
    const/4 v4, 0x4

    .line 998
    iget-object v2, v1, LZ2/s;->f:Ljava/lang/Object;

    .line 999
    .line 1000
    check-cast v2, LZ2/s;

    .line 1001
    .line 1002
    iget-object v5, v0, Lk3/l;->a:Ljava/lang/String;

    .line 1003
    .line 1004
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1005
    .line 1006
    .line 1007
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    .line 1008
    .line 1009
    .line 1010
    move-result v6

    .line 1011
    sparse-switch v6, :sswitch_data_2

    .line 1012
    .line 1013
    .line 1014
    :goto_b
    const/4 v4, -0x1

    .line 1015
    goto :goto_c

    .line 1016
    :sswitch_6
    const-string v3, "setLocaleIdentifier"

    .line 1017
    .line 1018
    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1019
    .line 1020
    .line 1021
    move-result v3

    .line 1022
    if-nez v3, :cond_2f

    .line 1023
    .line 1024
    goto :goto_b

    .line 1025
    :sswitch_7
    const-string v4, "placemarkFromAddress"

    .line 1026
    .line 1027
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1028
    .line 1029
    .line 1030
    move-result v4

    .line 1031
    if-nez v4, :cond_2b

    .line 1032
    .line 1033
    goto :goto_b

    .line 1034
    :cond_2b
    move v4, v3

    .line 1035
    goto :goto_c

    .line 1036
    :sswitch_8
    const-string v3, "locationFromAddress"

    .line 1037
    .line 1038
    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1039
    .line 1040
    .line 1041
    move-result v3

    .line 1042
    if-nez v3, :cond_2c

    .line 1043
    .line 1044
    goto :goto_b

    .line 1045
    :cond_2c
    move/from16 v4, v17

    .line 1046
    .line 1047
    goto :goto_c

    .line 1048
    :sswitch_9
    const-string v3, "isPresent"

    .line 1049
    .line 1050
    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1051
    .line 1052
    .line 1053
    move-result v3

    .line 1054
    if-nez v3, :cond_2d

    .line 1055
    .line 1056
    goto :goto_b

    .line 1057
    :cond_2d
    const/4 v4, 0x1

    .line 1058
    goto :goto_c

    .line 1059
    :sswitch_a
    const-string v3, "placemarkFromCoordinates"

    .line 1060
    .line 1061
    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1062
    .line 1063
    .line 1064
    move-result v3

    .line 1065
    if-nez v3, :cond_2e

    .line 1066
    .line 1067
    goto :goto_b

    .line 1068
    :cond_2e
    move v4, v10

    .line 1069
    :cond_2f
    :goto_c
    const-string v3, "Supply a valid value for the \'address\' parameter."

    .line 1070
    .line 1071
    const-string v5, "ARGUMENT_ERROR"

    .line 1072
    .line 1073
    const-string v6, "address"

    .line 1074
    .line 1075
    packed-switch v4, :pswitch_data_1

    .line 1076
    .line 1077
    .line 1078
    move-object/from16 v0, p2

    .line 1079
    .line 1080
    check-cast v0, LQ2/g;

    .line 1081
    .line 1082
    invoke-virtual {v0}, LQ2/g;->b()V

    .line 1083
    .line 1084
    .line 1085
    goto/16 :goto_12

    .line 1086
    .line 1087
    :pswitch_5
    const-string v3, "localeIdentifier"

    .line 1088
    .line 1089
    invoke-virtual {v0, v3}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 1090
    .line 1091
    .line 1092
    move-result-object v0

    .line 1093
    check-cast v0, Ljava/lang/String;

    .line 1094
    .line 1095
    if-eqz v0, :cond_36

    .line 1096
    .line 1097
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 1098
    .line 1099
    .line 1100
    move-result v3

    .line 1101
    if-eqz v3, :cond_30

    .line 1102
    .line 1103
    goto :goto_10

    .line 1104
    :cond_30
    new-instance v3, Ljava/util/StringTokenizer;

    .line 1105
    .line 1106
    const-string v4, "_"

    .line 1107
    .line 1108
    invoke-direct {v3, v0, v4, v10}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 1109
    .line 1110
    .line 1111
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    .line 1112
    .line 1113
    .line 1114
    move-result v0

    .line 1115
    if-eqz v0, :cond_31

    .line 1116
    .line 1117
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    .line 1118
    .line 1119
    .line 1120
    move-result-object v0

    .line 1121
    goto :goto_d

    .line 1122
    :cond_31
    move-object v0, v7

    .line 1123
    :goto_d
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    .line 1124
    .line 1125
    .line 1126
    move-result v4

    .line 1127
    if-eqz v4, :cond_32

    .line 1128
    .line 1129
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    .line 1130
    .line 1131
    .line 1132
    move-result-object v4

    .line 1133
    goto :goto_e

    .line 1134
    :cond_32
    move-object v4, v7

    .line 1135
    :goto_e
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    .line 1136
    .line 1137
    .line 1138
    move-result v5

    .line 1139
    if-eqz v5, :cond_33

    .line 1140
    .line 1141
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    .line 1142
    .line 1143
    .line 1144
    move-result-object v3

    .line 1145
    goto :goto_f

    .line 1146
    :cond_33
    move-object v3, v7

    .line 1147
    :goto_f
    if-eqz v0, :cond_34

    .line 1148
    .line 1149
    if-eqz v4, :cond_34

    .line 1150
    .line 1151
    if-eqz v3, :cond_34

    .line 1152
    .line 1153
    new-instance v7, Ljava/util/Locale;

    .line 1154
    .line 1155
    invoke-direct {v7, v0, v4, v3}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1156
    .line 1157
    .line 1158
    goto :goto_10

    .line 1159
    :cond_34
    if-eqz v0, :cond_35

    .line 1160
    .line 1161
    if-eqz v4, :cond_35

    .line 1162
    .line 1163
    new-instance v7, Ljava/util/Locale;

    .line 1164
    .line 1165
    invoke-direct {v7, v0, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1166
    .line 1167
    .line 1168
    goto :goto_10

    .line 1169
    :cond_35
    if-eqz v0, :cond_36

    .line 1170
    .line 1171
    new-instance v7, Ljava/util/Locale;

    .line 1172
    .line 1173
    invoke-direct {v7, v0}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    .line 1174
    .line 1175
    .line 1176
    :cond_36
    :goto_10
    iput-object v7, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 1177
    .line 1178
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 1179
    .line 1180
    move-object/from16 v2, p2

    .line 1181
    .line 1182
    check-cast v2, LQ2/g;

    .line 1183
    .line 1184
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 1185
    .line 1186
    .line 1187
    goto/16 :goto_12

    .line 1188
    .line 1189
    :pswitch_6
    invoke-virtual {v0, v6}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 1190
    .line 1191
    .line 1192
    move-result-object v0

    .line 1193
    check-cast v0, Ljava/lang/String;

    .line 1194
    .line 1195
    if-eqz v0, :cond_37

    .line 1196
    .line 1197
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 1198
    .line 1199
    .line 1200
    move-result v4

    .line 1201
    if-eqz v4, :cond_38

    .line 1202
    .line 1203
    :cond_37
    move-object/from16 v4, p2

    .line 1204
    .line 1205
    check-cast v4, LQ2/g;

    .line 1206
    .line 1207
    invoke-virtual {v4, v5, v3, v7}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1208
    .line 1209
    .line 1210
    :cond_38
    new-instance v3, Lo0/d;

    .line 1211
    .line 1212
    move-object/from16 v4, p2

    .line 1213
    .line 1214
    check-cast v4, LQ2/g;

    .line 1215
    .line 1216
    const/4 v6, 0x1

    .line 1217
    invoke-direct {v3, v4, v0, v6}, Lo0/d;-><init>(LQ2/g;Ljava/lang/String;I)V

    .line 1218
    .line 1219
    .line 1220
    invoke-virtual {v2, v0, v3}, LZ2/s;->A(Ljava/lang/String;Lo0/a;)V

    .line 1221
    .line 1222
    .line 1223
    goto/16 :goto_12

    .line 1224
    .line 1225
    :pswitch_7
    invoke-virtual {v0, v6}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 1226
    .line 1227
    .line 1228
    move-result-object v0

    .line 1229
    check-cast v0, Ljava/lang/String;

    .line 1230
    .line 1231
    if-eqz v0, :cond_39

    .line 1232
    .line 1233
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 1234
    .line 1235
    .line 1236
    move-result v4

    .line 1237
    if-eqz v4, :cond_3a

    .line 1238
    .line 1239
    :cond_39
    move-object/from16 v4, p2

    .line 1240
    .line 1241
    check-cast v4, LQ2/g;

    .line 1242
    .line 1243
    invoke-virtual {v4, v5, v3, v7}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1244
    .line 1245
    .line 1246
    :cond_3a
    new-instance v3, Lo0/d;

    .line 1247
    .line 1248
    move-object/from16 v4, p2

    .line 1249
    .line 1250
    check-cast v4, LQ2/g;

    .line 1251
    .line 1252
    invoke-direct {v3, v4, v0, v10}, Lo0/d;-><init>(LQ2/g;Ljava/lang/String;I)V

    .line 1253
    .line 1254
    .line 1255
    invoke-virtual {v2, v0, v3}, LZ2/s;->A(Ljava/lang/String;Lo0/a;)V

    .line 1256
    .line 1257
    .line 1258
    goto/16 :goto_12

    .line 1259
    .line 1260
    :pswitch_8
    invoke-static {}, Landroid/location/Geocoder;->isPresent()Z

    .line 1261
    .line 1262
    .line 1263
    move-result v0

    .line 1264
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 1265
    .line 1266
    .line 1267
    move-result-object v0

    .line 1268
    move-object/from16 v2, p2

    .line 1269
    .line 1270
    check-cast v2, LQ2/g;

    .line 1271
    .line 1272
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 1273
    .line 1274
    .line 1275
    goto :goto_12

    .line 1276
    :pswitch_9
    const-string v3, "latitude"

    .line 1277
    .line 1278
    invoke-virtual {v0, v3}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 1279
    .line 1280
    .line 1281
    move-result-object v3

    .line 1282
    check-cast v3, Ljava/lang/Double;

    .line 1283
    .line 1284
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    .line 1285
    .line 1286
    .line 1287
    move-result-wide v5

    .line 1288
    const-string v3, "longitude"

    .line 1289
    .line 1290
    invoke-virtual {v0, v3}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 1291
    .line 1292
    .line 1293
    move-result-object v0

    .line 1294
    check-cast v0, Ljava/lang/Double;

    .line 1295
    .line 1296
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 1297
    .line 1298
    .line 1299
    move-result-wide v7

    .line 1300
    new-instance v4, Lo0/e;

    .line 1301
    .line 1302
    move-wide v8, v7

    .line 1303
    move-wide v6, v5

    .line 1304
    move-object/from16 v5, p2

    .line 1305
    .line 1306
    check-cast v5, LQ2/g;

    .line 1307
    .line 1308
    invoke-direct/range {v4 .. v9}, Lo0/e;-><init>(LQ2/g;DD)V

    .line 1309
    .line 1310
    .line 1311
    move-object v3, v4

    .line 1312
    move-wide v5, v6

    .line 1313
    move-wide v7, v8

    .line 1314
    iget-object v0, v2, LZ2/s;->f:Ljava/lang/Object;

    .line 1315
    .line 1316
    check-cast v0, Landroid/content/Context;

    .line 1317
    .line 1318
    iget-object v2, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 1319
    .line 1320
    check-cast v2, Ljava/util/Locale;

    .line 1321
    .line 1322
    if-eqz v2, :cond_3b

    .line 1323
    .line 1324
    new-instance v4, Landroid/location/Geocoder;

    .line 1325
    .line 1326
    invoke-direct {v4, v0, v2}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;Ljava/util/Locale;)V

    .line 1327
    .line 1328
    .line 1329
    goto :goto_11

    .line 1330
    :cond_3b
    new-instance v4, Landroid/location/Geocoder;

    .line 1331
    .line 1332
    invoke-direct {v4, v0}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;)V

    .line 1333
    .line 1334
    .line 1335
    :goto_11
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 1336
    .line 1337
    const/16 v2, 0x21

    .line 1338
    .line 1339
    if-lt v0, v2, :cond_3c

    .line 1340
    .line 1341
    new-instance v9, Lo0/b;

    .line 1342
    .line 1343
    const/4 v0, 0x1

    .line 1344
    invoke-direct {v9, v3, v0}, Lo0/b;-><init>(Lo0/a;I)V

    .line 1345
    .line 1346
    .line 1347
    invoke-static/range {v4 .. v9}, LE/c;->p(Landroid/location/Geocoder;DDLo0/b;)V

    .line 1348
    .line 1349
    .line 1350
    goto :goto_12

    .line 1351
    :cond_3c
    const/4 v9, 0x5

    .line 1352
    :try_start_2
    invoke-virtual/range {v4 .. v9}, Landroid/location/Geocoder;->getFromLocation(DDI)Ljava/util/List;

    .line 1353
    .line 1354
    .line 1355
    move-result-object v0

    .line 1356
    invoke-virtual {v3, v0}, Lo0/e;->onGeocode(Ljava/util/List;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 1357
    .line 1358
    .line 1359
    goto :goto_12

    .line 1360
    :catch_2
    move-exception v0

    .line 1361
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 1362
    .line 1363
    .line 1364
    move-result-object v0

    .line 1365
    invoke-virtual {v3, v0}, Lo0/e;->onError(Ljava/lang/String;)V

    .line 1366
    .line 1367
    .line 1368
    :goto_12
    return-void

    .line 1369
    :sswitch_b
    iget-object v2, v1, LZ2/s;->g:Ljava/lang/Object;

    .line 1370
    .line 1371
    check-cast v2, LE/i;

    .line 1372
    .line 1373
    iget-object v3, v2, LE/i;->f:Ljava/lang/Object;

    .line 1374
    .line 1375
    check-cast v3, LB2/a;

    .line 1376
    .line 1377
    if-nez v3, :cond_3d

    .line 1378
    .line 1379
    iget-object v0, v1, LZ2/s;->f:Ljava/lang/Object;

    .line 1380
    .line 1381
    check-cast v0, Ljava/util/Map;

    .line 1382
    .line 1383
    move-object/from16 v2, p2

    .line 1384
    .line 1385
    check-cast v2, LQ2/g;

    .line 1386
    .line 1387
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 1388
    .line 1389
    .line 1390
    goto :goto_14

    .line 1391
    :cond_3d
    iget-object v0, v0, Lk3/l;->a:Ljava/lang/String;

    .line 1392
    .line 1393
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1394
    .line 1395
    .line 1396
    const-string v3, "getKeyboardState"

    .line 1397
    .line 1398
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1399
    .line 1400
    .line 1401
    move-result v0

    .line 1402
    if-nez v0, :cond_3e

    .line 1403
    .line 1404
    move-object/from16 v0, p2

    .line 1405
    .line 1406
    check-cast v0, LQ2/g;

    .line 1407
    .line 1408
    invoke-virtual {v0}, LQ2/g;->b()V

    .line 1409
    .line 1410
    .line 1411
    goto :goto_14

    .line 1412
    :cond_3e
    :try_start_3
    iget-object v0, v2, LE/i;->f:Ljava/lang/Object;

    .line 1413
    .line 1414
    check-cast v0, LB2/a;

    .line 1415
    .line 1416
    iget-object v0, v0, LB2/a;->f:Ljava/lang/Object;

    .line 1417
    .line 1418
    check-cast v0, [LZ2/x;

    .line 1419
    .line 1420
    aget-object v0, v0, v10

    .line 1421
    .line 1422
    check-cast v0, LZ2/w;

    .line 1423
    .line 1424
    iget-object v0, v0, LZ2/w;->f:Ljava/util/HashMap;

    .line 1425
    .line 1426
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 1427
    .line 1428
    .line 1429
    move-result-object v0

    .line 1430
    iput-object v0, v1, LZ2/s;->f:Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/IllegalStateException; {:try_start_3 .. :try_end_3} :catch_3

    .line 1431
    .line 1432
    goto :goto_13

    .line 1433
    :catch_3
    move-exception v0

    .line 1434
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 1435
    .line 1436
    .line 1437
    move-result-object v0

    .line 1438
    move-object/from16 v2, p2

    .line 1439
    .line 1440
    check-cast v2, LQ2/g;

    .line 1441
    .line 1442
    const-string v3, "error"

    .line 1443
    .line 1444
    invoke-virtual {v2, v3, v0, v7}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1445
    .line 1446
    .line 1447
    :goto_13
    iget-object v0, v1, LZ2/s;->f:Ljava/lang/Object;

    .line 1448
    .line 1449
    check-cast v0, Ljava/util/Map;

    .line 1450
    .line 1451
    move-object/from16 v2, p2

    .line 1452
    .line 1453
    check-cast v2, LQ2/g;

    .line 1454
    .line 1455
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 1456
    .line 1457
    .line 1458
    :goto_14
    return-void

    .line 1459
    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_b
        0x18 -> :sswitch_5
    .end sparse-switch

    .line 1460
    .line 1461
    .line 1462
    .line 1463
    .line 1464
    .line 1465
    .line 1466
    .line 1467
    .line 1468
    .line 1469
    :sswitch_data_1
    .sparse-switch
        -0x5c086121 -> :sswitch_4
        -0x3ca2ffb7 -> :sswitch_3
        -0x22583c37 -> :sswitch_2
        0x14b278ba -> :sswitch_1
        0x637dca75 -> :sswitch_0
    .end sparse-switch

    .line 1470
    .line 1471
    .line 1472
    .line 1473
    .line 1474
    .line 1475
    .line 1476
    .line 1477
    .line 1478
    .line 1479
    .line 1480
    .line 1481
    .line 1482
    .line 1483
    .line 1484
    .line 1485
    .line 1486
    .line 1487
    .line 1488
    .line 1489
    .line 1490
    .line 1491
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 1492
    .line 1493
    .line 1494
    .line 1495
    .line 1496
    .line 1497
    .line 1498
    .line 1499
    .line 1500
    .line 1501
    .line 1502
    .line 1503
    .line 1504
    .line 1505
    :sswitch_data_2
    .sparse-switch
        -0x4c16c303 -> :sswitch_a
        -0x35873fcf -> :sswitch_9
        -0x1fc5620b -> :sswitch_8
        0x2ddb6ff6 -> :sswitch_7
        0x3772eb25 -> :sswitch_6
    .end sparse-switch

    .line 1506
    .line 1507
    .line 1508
    .line 1509
    .line 1510
    .line 1511
    .line 1512
    .line 1513
    .line 1514
    .line 1515
    .line 1516
    .line 1517
    .line 1518
    .line 1519
    .line 1520
    .line 1521
    .line 1522
    .line 1523
    .line 1524
    .line 1525
    .line 1526
    .line 1527
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
    .end packed-switch
.end method

.method public p(Ljava/nio/ByteBuffer;Lb3/g;)V
    .locals 5

    .line 1
    iget v0, p0, LZ2/s;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lk3/o;

    .line 9
    .line 10
    iget-object v1, v0, Lk3/o;->c:Lk3/p;

    .line 11
    .line 12
    invoke-interface {v1, p1}, Lk3/p;->d(Ljava/nio/ByteBuffer;)Lk3/l;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    :try_start_0
    iget-object v2, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v2, Lk3/m;

    .line 19
    .line 20
    new-instance v3, LQ2/g;

    .line 21
    .line 22
    const/4 v4, 0x2

    .line 23
    invoke-direct {v3, v4, p0, p2}, LQ2/g;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    invoke-interface {v2, p1, v3}, Lk3/m;->onMethodCall(Lk3/l;Lk3/n;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catch_0
    move-exception p1

    .line 31
    new-instance v2, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v3, "MethodChannel#"

    .line 34
    .line 35
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, v0, Lk3/o;->b:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const-string v2, "Failed to handle method call"

    .line 48
    .line 49
    invoke-static {v0, v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-interface {v1, v0, p1}, Lk3/p;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/nio/ByteBuffer;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p2, p1}, Lb3/g;->a(Ljava/nio/ByteBuffer;)V

    .line 65
    .line 66
    .line 67
    :goto_0
    return-void

    .line 68
    :pswitch_0
    iget-object v0, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 69
    .line 70
    check-cast v0, LV1/y;

    .line 71
    .line 72
    :try_start_1
    iget-object v1, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 73
    .line 74
    check-cast v1, Lk3/b;

    .line 75
    .line 76
    iget-object v2, v0, LV1/y;->h:Ljava/lang/Object;

    .line 77
    .line 78
    check-cast v2, Lk3/k;

    .line 79
    .line 80
    invoke-interface {v2, p1}, Lk3/k;->b(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    new-instance v2, LZ2/s;

    .line 85
    .line 86
    const/16 v3, 0x12

    .line 87
    .line 88
    invoke-direct {v2, v3, p0, p2}, LZ2/s;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    invoke-interface {v1, p1, v2}, Lk3/b;->a(Ljava/lang/Object;LZ2/s;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :catch_1
    move-exception p1

    .line 96
    new-instance v1, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    const-string v2, "BasicMessageChannel#"

    .line 99
    .line 100
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    iget-object v0, v0, LV1/y;->f:Ljava/lang/Object;

    .line 104
    .line 105
    check-cast v0, Ljava/lang/String;

    .line 106
    .line 107
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    const-string v1, "Failed to handle message"

    .line 115
    .line 116
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 117
    .line 118
    .line 119
    const/4 p1, 0x0

    .line 120
    invoke-virtual {p2, p1}, Lb3/g;->a(Ljava/nio/ByteBuffer;)V

    .line 121
    .line 122
    .line 123
    :goto_1
    return-void

    .line 124
    nop

    .line 125
    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_0
    .end packed-switch
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    iget v0, p0, LZ2/s;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    return-object v0

    .line 11
    :pswitch_0
    iget-object v0, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0

    .line 20
    nop

    .line 21
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
    .end packed-switch
.end method

.method public u()Lk1/u;
    .locals 3

    .line 1
    iget-object v0, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Integer;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v1, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v1, Lk1/k;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    new-instance v1, Lk1/u;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v2, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v2, Lk1/k;

    .line 22
    .line 23
    invoke-direct {v1, v0, v2}, Lk1/u;-><init>(ILk1/k;)V

    .line 24
    .line 25
    .line 26
    return-object v1

    .line 27
    :cond_0
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 28
    .line 29
    const-string v1, "Variant is not set"

    .line 30
    .line 31
    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    throw v0

    .line 35
    :cond_1
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 36
    .line 37
    const-string v1, "Key size is not set"

    .line 38
    .line 39
    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    throw v0
.end method

.method public v()Lp1/d;
    .locals 3

    .line 1
    iget-object v0, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Integer;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v1, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v1, Lp1/c;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    new-instance v1, Lp1/d;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v2, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v2, Lp1/c;

    .line 22
    .line 23
    invoke-direct {v1, v0, v2}, Lp1/d;-><init>(ILp1/c;)V

    .line 24
    .line 25
    .line 26
    return-object v1

    .line 27
    :cond_0
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 28
    .line 29
    const-string v1, "Variant is not set"

    .line 30
    .line 31
    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    throw v0

    .line 35
    :cond_1
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 36
    .line 37
    const-string v1, "Key size is not set"

    .line 38
    .line 39
    invoke-direct {v0, v1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    throw v0
.end method

.method public y(Ljava/lang/Class;Ljava/lang/String;)Landroidx/lifecycle/F;
    .locals 0

    .line 1
    const-string p1, "key"

    .line 2
    .line 3
    invoke-static {p2, p1}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    throw p1
.end method

.method public z(Lg2/a;)Lb2/o;
    .locals 9

    .line 1
    iget-object v0, p1, Lg2/a;->b:Ljava/lang/reflect/Type;

    .line 2
    .line 3
    iget-object p1, p1, Lg2/a;->a:Ljava/lang/Class;

    .line 4
    .line 5
    iget-object v1, p0, LZ2/s;->f:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    if-nez v2, :cond_12

    .line 14
    .line 15
    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    if-nez v1, :cond_11

    .line 20
    .line 21
    const-class v1, Ljava/util/EnumSet;

    .line 22
    .line 23
    invoke-virtual {v1, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/4 v2, 0x1

    .line 28
    const/4 v3, 0x0

    .line 29
    const/4 v4, 0x0

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    new-instance v1, Lb2/e;

    .line 33
    .line 34
    invoke-direct {v1, v0, v3}, Lb2/e;-><init>(Ljava/lang/reflect/Type;I)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const-class v1, Ljava/util/EnumMap;

    .line 39
    .line 40
    if-ne p1, v1, :cond_1

    .line 41
    .line 42
    new-instance v1, Lb2/e;

    .line 43
    .line 44
    invoke-direct {v1, v0, v2}, Lb2/e;-><init>(Ljava/lang/reflect/Type;I)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    move-object v1, v4

    .line 49
    :goto_0
    if-eqz v1, :cond_2

    .line 50
    .line 51
    return-object v1

    .line 52
    :cond_2
    iget-object v1, p0, LZ2/s;->g:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast v1, Ljava/util/ArrayList;

    .line 55
    .line 56
    invoke-static {v1}, Lb2/d;->f(Ljava/util/ArrayList;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Ljava/lang/Class;->getModifiers()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    invoke-static {v1}, Ljava/lang/reflect/Modifier;->isAbstract(I)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    const/4 v5, 0x3

    .line 68
    if-eqz v1, :cond_3

    .line 69
    .line 70
    :catch_0
    move-object v1, v4

    .line 71
    goto :goto_2

    .line 72
    :cond_3
    :try_start_0
    invoke-virtual {p1, v4}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 73
    .line 74
    .line 75
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    sget-object v6, Le2/c;->a:Landroid/support/v4/media/session/a;

    .line 77
    .line 78
    :try_start_1
    invoke-virtual {v1, v2}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 79
    .line 80
    .line 81
    move-object v6, v4

    .line 82
    goto :goto_1

    .line 83
    :catch_1
    move-exception v6

    .line 84
    new-instance v7, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    const-string v8, "Failed making constructor \'"

    .line 87
    .line 88
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v1}, Le2/c;->b(Ljava/lang/reflect/Constructor;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v8

    .line 95
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    const-string v8, "\' accessible; either increase its visibility or write a custom InstanceCreator or TypeAdapter for its declaring type: "

    .line 99
    .line 100
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v6}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v8

    .line 107
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-static {v6}, Le2/c;->e(Ljava/lang/Exception;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v6

    .line 114
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v6

    .line 121
    :goto_1
    if-eqz v6, :cond_4

    .line 122
    .line 123
    new-instance v1, LV1/n;

    .line 124
    .line 125
    invoke-direct {v1, v6, v5}, LV1/n;-><init>(Ljava/lang/String;I)V

    .line 126
    .line 127
    .line 128
    goto :goto_2

    .line 129
    :cond_4
    new-instance v6, LD1/a;

    .line 130
    .line 131
    const/16 v7, 0x9

    .line 132
    .line 133
    invoke-direct {v6, v7, v1}, LD1/a;-><init>(ILjava/lang/Object;)V

    .line 134
    .line 135
    .line 136
    move-object v1, v6

    .line 137
    :goto_2
    if-eqz v1, :cond_5

    .line 138
    .line 139
    return-object v1

    .line 140
    :cond_5
    const-class v1, Ljava/util/Collection;

    .line 141
    .line 142
    invoke-virtual {v1, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    const/4 v6, 0x2

    .line 147
    if-eqz v1, :cond_9

    .line 148
    .line 149
    const-class v0, Ljava/util/SortedSet;

    .line 150
    .line 151
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    if-eqz v0, :cond_6

    .line 156
    .line 157
    new-instance v4, LA1/h;

    .line 158
    .line 159
    const/16 v0, 0x1b

    .line 160
    .line 161
    invoke-direct {v4, v0}, LA1/h;-><init>(I)V

    .line 162
    .line 163
    .line 164
    goto/16 :goto_3

    .line 165
    .line 166
    :cond_6
    const-class v0, Ljava/util/Set;

    .line 167
    .line 168
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    if-eqz v0, :cond_7

    .line 173
    .line 174
    new-instance v4, LA1/h;

    .line 175
    .line 176
    const/16 v0, 0x1c

    .line 177
    .line 178
    invoke-direct {v4, v0}, LA1/h;-><init>(I)V

    .line 179
    .line 180
    .line 181
    goto/16 :goto_3

    .line 182
    .line 183
    :cond_7
    const-class v0, Ljava/util/Queue;

    .line 184
    .line 185
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-eqz v0, :cond_8

    .line 190
    .line 191
    new-instance v4, LA1/h;

    .line 192
    .line 193
    const/16 v0, 0x1d

    .line 194
    .line 195
    invoke-direct {v4, v0}, LA1/h;-><init>(I)V

    .line 196
    .line 197
    .line 198
    goto :goto_3

    .line 199
    :cond_8
    new-instance v4, Lb2/f;

    .line 200
    .line 201
    invoke-direct {v4, v3}, Lb2/f;-><init>(I)V

    .line 202
    .line 203
    .line 204
    goto :goto_3

    .line 205
    :cond_9
    const-class v1, Ljava/util/Map;

    .line 206
    .line 207
    invoke-virtual {v1, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    if-eqz v1, :cond_e

    .line 212
    .line 213
    const-class v1, Ljava/util/concurrent/ConcurrentNavigableMap;

    .line 214
    .line 215
    invoke-virtual {v1, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    if-eqz v1, :cond_a

    .line 220
    .line 221
    new-instance v4, Lb2/f;

    .line 222
    .line 223
    invoke-direct {v4, v2}, Lb2/f;-><init>(I)V

    .line 224
    .line 225
    .line 226
    goto :goto_3

    .line 227
    :cond_a
    const-class v1, Ljava/util/concurrent/ConcurrentMap;

    .line 228
    .line 229
    invoke-virtual {v1, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 230
    .line 231
    .line 232
    move-result v1

    .line 233
    if-eqz v1, :cond_b

    .line 234
    .line 235
    new-instance v4, Lb2/f;

    .line 236
    .line 237
    invoke-direct {v4, v6}, Lb2/f;-><init>(I)V

    .line 238
    .line 239
    .line 240
    goto :goto_3

    .line 241
    :cond_b
    const-class v1, Ljava/util/SortedMap;

    .line 242
    .line 243
    invoke-virtual {v1, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 244
    .line 245
    .line 246
    move-result v1

    .line 247
    if-eqz v1, :cond_c

    .line 248
    .line 249
    new-instance v4, Lb2/f;

    .line 250
    .line 251
    invoke-direct {v4, v5}, Lb2/f;-><init>(I)V

    .line 252
    .line 253
    .line 254
    goto :goto_3

    .line 255
    :cond_c
    instance-of v1, v0, Ljava/lang/reflect/ParameterizedType;

    .line 256
    .line 257
    if-eqz v1, :cond_d

    .line 258
    .line 259
    check-cast v0, Ljava/lang/reflect/ParameterizedType;

    .line 260
    .line 261
    invoke-interface {v0}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    aget-object v0, v0, v3

    .line 266
    .line 267
    new-instance v1, Lg2/a;

    .line 268
    .line 269
    invoke-direct {v1, v0}, Lg2/a;-><init>(Ljava/lang/reflect/Type;)V

    .line 270
    .line 271
    .line 272
    iget-object v0, v1, Lg2/a;->a:Ljava/lang/Class;

    .line 273
    .line 274
    const-class v1, Ljava/lang/String;

    .line 275
    .line 276
    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 277
    .line 278
    .line 279
    move-result v0

    .line 280
    if-nez v0, :cond_d

    .line 281
    .line 282
    new-instance v4, Lb2/f;

    .line 283
    .line 284
    const/4 v0, 0x4

    .line 285
    invoke-direct {v4, v0}, Lb2/f;-><init>(I)V

    .line 286
    .line 287
    .line 288
    goto :goto_3

    .line 289
    :cond_d
    new-instance v4, LA1/h;

    .line 290
    .line 291
    const/16 v0, 0x1a

    .line 292
    .line 293
    invoke-direct {v4, v0}, LA1/h;-><init>(I)V

    .line 294
    .line 295
    .line 296
    :cond_e
    :goto_3
    if-eqz v4, :cond_f

    .line 297
    .line 298
    return-object v4

    .line 299
    :cond_f
    invoke-static {p1}, LZ2/s;->w(Ljava/lang/Class;)Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    if-eqz v0, :cond_10

    .line 304
    .line 305
    new-instance p1, LV1/n;

    .line 306
    .line 307
    invoke-direct {p1, v0, v6}, LV1/n;-><init>(Ljava/lang/String;I)V

    .line 308
    .line 309
    .line 310
    return-object p1

    .line 311
    :cond_10
    new-instance v0, LD1/a;

    .line 312
    .line 313
    const/16 v1, 0xa

    .line 314
    .line 315
    invoke-direct {v0, v1, p1}, LD1/a;-><init>(ILjava/lang/Object;)V

    .line 316
    .line 317
    .line 318
    return-object v0

    .line 319
    :cond_11
    new-instance p1, Ljava/lang/ClassCastException;

    .line 320
    .line 321
    invoke-direct {p1}, Ljava/lang/ClassCastException;-><init>()V

    .line 322
    .line 323
    .line 324
    throw p1

    .line 325
    :cond_12
    new-instance p1, Ljava/lang/ClassCastException;

    .line 326
    .line 327
    invoke-direct {p1}, Ljava/lang/ClassCastException;-><init>()V

    .line 328
    .line 329
    .line 330
    throw p1
.end method
