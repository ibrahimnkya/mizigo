.class public final La3/g;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(LZ2/d;[Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, La3/g;->a:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-static {}, LB2/a;->J()LB2/a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, LB2/a;->f:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Le3/e;

    .line 18
    .line 19
    iget-boolean v1, v0, Le3/e;->a:Z

    .line 20
    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Le3/e;->d(Landroid/content/Context;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {v0, p1, p2}, Le3/e;->a(Landroid/content/Context;[Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method


# virtual methods
.method public final a(La3/f;)La3/c;
    .locals 12

    .line 1
    iget-object v1, p1, La3/f;->c:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v0, p1, La3/f;->d:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Lb3/a;

    .line 6
    .line 7
    iget-object v2, p1, La3/f;->e:Ljava/lang/Object;

    .line 8
    .line 9
    move-object v7, v2

    .line 10
    check-cast v7, Ljava/lang/String;

    .line 11
    .line 12
    iget-object v2, p1, La3/f;->f:Ljava/lang/Object;

    .line 13
    .line 14
    move-object v8, v2

    .line 15
    check-cast v8, Ljava/util/List;

    .line 16
    .line 17
    new-instance v3, Lio/flutter/plugin/platform/p;

    .line 18
    .line 19
    invoke-direct {v3}, Lio/flutter/plugin/platform/p;-><init>()V

    .line 20
    .line 21
    .line 22
    iget-boolean v5, p1, La3/f;->a:Z

    .line 23
    .line 24
    iget-boolean v6, p1, La3/f;->b:Z

    .line 25
    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    invoke-static {}, LB2/a;->J()LB2/a;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object p1, p1, LB2/a;->f:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast p1, Le3/e;

    .line 35
    .line 36
    iget-boolean v0, p1, Le3/e;->a:Z

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    new-instance v0, Lb3/a;

    .line 41
    .line 42
    iget-object p1, p1, Le3/e;->d:LV1/q;

    .line 43
    .line 44
    iget-object p1, p1, LV1/q;->c:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast p1, Ljava/lang/String;

    .line 47
    .line 48
    const-string v2, "main"

    .line 49
    .line 50
    invoke-direct {v0, p1, v2}, Lb3/a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    move-object p1, v0

    .line 54
    goto :goto_0

    .line 55
    :cond_1
    new-instance p1, Ljava/lang/AssertionError;

    .line 56
    .line 57
    const-string v0, "DartEntrypoints can only be created once a FlutterEngine is created."

    .line 58
    .line 59
    invoke-direct {p1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    throw p1

    .line 63
    :goto_0
    iget-object v10, p0, La3/g;->a:Ljava/util/ArrayList;

    .line 64
    .line 65
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_3

    .line 70
    .line 71
    new-instance v0, La3/c;

    .line 72
    .line 73
    const/4 v2, 0x0

    .line 74
    const/4 v4, 0x0

    .line 75
    invoke-direct/range {v0 .. v6}, La3/c;-><init>(Landroid/content/Context;Lio/flutter/embedding/engine/FlutterJNI;Lio/flutter/plugin/platform/p;[Ljava/lang/String;ZZ)V

    .line 76
    .line 77
    .line 78
    if-eqz v7, :cond_2

    .line 79
    .line 80
    iget-object v1, v0, La3/c;->i:Lj3/b;

    .line 81
    .line 82
    iget-object v1, v1, Lj3/b;->f:Ljava/lang/Object;

    .line 83
    .line 84
    check-cast v1, Lk3/o;

    .line 85
    .line 86
    const-string v2, "setInitialRoute"

    .line 87
    .line 88
    const/4 v3, 0x0

    .line 89
    invoke-virtual {v1, v2, v7, v3}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 90
    .line 91
    .line 92
    :cond_2
    iget-object v1, v0, La3/c;->c:Lb3/b;

    .line 93
    .line 94
    invoke-virtual {v1, p1, v8}, Lb3/b;->b(Lb3/a;Ljava/util/List;)V

    .line 95
    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_3
    move-object v0, v3

    .line 99
    move v2, v5

    .line 100
    move v11, v6

    .line 101
    const/4 v3, 0x0

    .line 102
    invoke-virtual {v10, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    check-cast v3, La3/c;

    .line 107
    .line 108
    iget-object v4, v3, La3/c;->a:Lio/flutter/embedding/engine/FlutterJNI;

    .line 109
    .line 110
    invoke-virtual {v4}, Lio/flutter/embedding/engine/FlutterJNI;->isAttached()Z

    .line 111
    .line 112
    .line 113
    move-result v4

    .line 114
    if-eqz v4, :cond_4

    .line 115
    .line 116
    iget-object v3, v3, La3/c;->a:Lio/flutter/embedding/engine/FlutterJNI;

    .line 117
    .line 118
    iget-object v4, p1, Lb3/a;->c:Ljava/lang/String;

    .line 119
    .line 120
    iget-object v5, p1, Lb3/a;->b:Ljava/lang/String;

    .line 121
    .line 122
    move-object v6, v7

    .line 123
    move-object v7, v8

    .line 124
    sget-wide v8, La3/c;->y:J

    .line 125
    .line 126
    invoke-virtual/range {v3 .. v9}, Lio/flutter/embedding/engine/FlutterJNI;->spawn(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;J)Lio/flutter/embedding/engine/FlutterJNI;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    move-object v3, v0

    .line 131
    new-instance v0, La3/c;

    .line 132
    .line 133
    const/4 v4, 0x0

    .line 134
    move v5, v2

    .line 135
    move v6, v11

    .line 136
    move-object v2, p1

    .line 137
    invoke-direct/range {v0 .. v6}, La3/c;-><init>(Landroid/content/Context;Lio/flutter/embedding/engine/FlutterJNI;Lio/flutter/plugin/platform/p;[Ljava/lang/String;ZZ)V

    .line 138
    .line 139
    .line 140
    :goto_1
    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    new-instance p1, La3/e;

    .line 144
    .line 145
    invoke-direct {p1, p0, v0}, La3/e;-><init>(La3/g;La3/c;)V

    .line 146
    .line 147
    .line 148
    iget-object v1, v0, La3/c;->v:Ljava/util/HashSet;

    .line 149
    .line 150
    invoke-virtual {v1, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    return-object v0

    .line 154
    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 155
    .line 156
    const-string v0, "Spawn can only be called on a fully constructed FlutterEngine"

    .line 157
    .line 158
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    throw p1
.end method
