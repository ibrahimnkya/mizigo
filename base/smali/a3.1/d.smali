.class public final La3/d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/HashMap;

.field public final b:La3/c;

.field public final c:Lg3/a;

.field public final d:Ljava/util/HashMap;

.field public e:LZ2/h;

.field public f:Lm/J0;

.field public g:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;La3/c;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, La3/d;->a:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, La3/d;->d:Ljava/util/HashMap;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, La3/d;->g:Z

    .line 20
    .line 21
    new-instance v0, Ljava/util/HashMap;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 24
    .line 25
    .line 26
    new-instance v0, Ljava/util/HashMap;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 29
    .line 30
    .line 31
    new-instance v0, Ljava/util/HashMap;

    .line 32
    .line 33
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object p2, p0, La3/d;->b:La3/c;

    .line 37
    .line 38
    new-instance v0, Lg3/a;

    .line 39
    .line 40
    iget-object v1, p2, La3/c;->c:Lb3/b;

    .line 41
    .line 42
    iget-object p2, p2, La3/c;->s:Lio/flutter/plugin/platform/p;

    .line 43
    .line 44
    iget-object p2, p2, Lio/flutter/plugin/platform/p;->e:Lio/flutter/plugin/platform/m;

    .line 45
    .line 46
    invoke-direct {v0, p1, v1, p2}, Lg3/a;-><init>(Landroid/content/Context;Lk3/f;Lio/flutter/plugin/platform/m;)V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, La3/d;->c:Lg3/a;

    .line 50
    .line 51
    return-void
.end method


# virtual methods
.method public final a(Lg3/b;)V
    .locals 4

    .line 1
    iget-object v0, p0, La3/d;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    const-string v1, "Attempted to register plugin ("

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const-string v3, "FlutterEngineConnectionRegistry#add "

    .line 14
    .line 15
    invoke-virtual {v3, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-static {v2}, Lw3/a;->b(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    const-string v0, "FlutterEngineCxnRegstry"

    .line 33
    .line 34
    new-instance v2, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string p1, ") but it was already registered with this FlutterEngine ("

    .line 43
    .line 44
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, La3/d;->b:La3/c;

    .line 48
    .line 49
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string p1, ")."

    .line 53
    .line 54
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    .line 63
    .line 64
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :catchall_0
    move-exception p1

    .line 69
    goto :goto_0

    .line 70
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, La3/d;->c:Lg3/a;

    .line 81
    .line 82
    invoke-interface {p1, v0}, Lg3/b;->onAttachedToEngine(Lg3/a;)V

    .line 83
    .line 84
    .line 85
    instance-of v0, p1, Lh3/a;

    .line 86
    .line 87
    if-eqz v0, :cond_1

    .line 88
    .line 89
    move-object v0, p1

    .line 90
    check-cast v0, Lh3/a;

    .line 91
    .line 92
    iget-object v1, p0, La3/d;->d:Ljava/util/HashMap;

    .line 93
    .line 94
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0}, La3/d;->f()Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-eqz p1, :cond_1

    .line 106
    .line 107
    iget-object p1, p0, La3/d;->f:Lm/J0;

    .line 108
    .line 109
    invoke-interface {v0, p1}, Lh3/a;->onAttachedToActivity(Lh3/b;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 110
    .line 111
    .line 112
    :cond_1
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :goto_0
    :try_start_2
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 117
    .line 118
    .line 119
    goto :goto_1

    .line 120
    :catchall_1
    move-exception v0

    .line 121
    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 122
    .line 123
    .line 124
    :goto_1
    throw p1
.end method

.method public final b(LZ2/d;Landroidx/lifecycle/s;)V
    .locals 6

    .line 1
    new-instance v0, Lm/J0;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/HashSet;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v1, v0, Lm/J0;->g:Ljava/lang/Object;

    .line 12
    .line 13
    new-instance v1, Ljava/util/HashSet;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v1, v0, Lm/J0;->h:Ljava/lang/Object;

    .line 19
    .line 20
    new-instance v1, Ljava/util/HashSet;

    .line 21
    .line 22
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v1, v0, Lm/J0;->i:Ljava/lang/Object;

    .line 26
    .line 27
    new-instance v1, Ljava/util/HashSet;

    .line 28
    .line 29
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v1, v0, Lm/J0;->j:Ljava/lang/Object;

    .line 33
    .line 34
    new-instance v1, Ljava/util/HashSet;

    .line 35
    .line 36
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 37
    .line 38
    .line 39
    new-instance v1, Ljava/util/HashSet;

    .line 40
    .line 41
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v1, v0, Lm/J0;->k:Ljava/lang/Object;

    .line 45
    .line 46
    iput-object p1, v0, Lm/J0;->e:Ljava/lang/Object;

    .line 47
    .line 48
    new-instance v1, Lio/flutter/embedding/engine/plugins/lifecycle/HiddenLifecycleReference;

    .line 49
    .line 50
    invoke-direct {v1, p2}, Lio/flutter/embedding/engine/plugins/lifecycle/HiddenLifecycleReference;-><init>(Landroidx/lifecycle/l;)V

    .line 51
    .line 52
    .line 53
    iput-object v1, v0, Lm/J0;->f:Ljava/lang/Object;

    .line 54
    .line 55
    iput-object v0, p0, La3/d;->f:Lm/J0;

    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    const/4 v0, 0x0

    .line 62
    if-eqz p2, :cond_0

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    const-string v1, "enable-software-rendering"

    .line 69
    .line 70
    invoke-virtual {p2, v1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    goto :goto_0

    .line 75
    :cond_0
    move p2, v0

    .line 76
    :goto_0
    iget-object v1, p0, La3/d;->b:La3/c;

    .line 77
    .line 78
    iget-object v2, v1, La3/c;->s:Lio/flutter/plugin/platform/p;

    .line 79
    .line 80
    iput-boolean p2, v2, Lio/flutter/plugin/platform/p;->z:Z

    .line 81
    .line 82
    iget-object p2, v1, La3/c;->u:LZ2/s;

    .line 83
    .line 84
    iget-object v2, v1, La3/c;->b:Lio/flutter/embedding/engine/renderer/j;

    .line 85
    .line 86
    iget-object v1, v1, La3/c;->c:Lb3/b;

    .line 87
    .line 88
    iget-object v3, p2, LZ2/s;->f:Ljava/lang/Object;

    .line 89
    .line 90
    check-cast v3, Lio/flutter/plugin/platform/p;

    .line 91
    .line 92
    iget-object v4, v3, Lio/flutter/plugin/platform/p;->g:LZ2/d;

    .line 93
    .line 94
    const-string v5, "A PlatformViewsController can only be attached to a single output target.\nattach was called while the PlatformViewsController was already attached."

    .line 95
    .line 96
    if-nez v4, :cond_4

    .line 97
    .line 98
    iput-object p1, v3, Lio/flutter/plugin/platform/p;->g:LZ2/d;

    .line 99
    .line 100
    iput-object v2, v3, Lio/flutter/plugin/platform/p;->j:Lio/flutter/embedding/engine/renderer/j;

    .line 101
    .line 102
    new-instance v2, LZ2/s;

    .line 103
    .line 104
    const/16 v4, 0xd

    .line 105
    .line 106
    invoke-direct {v2, v1, v4}, LZ2/s;-><init>(Lb3/b;I)V

    .line 107
    .line 108
    .line 109
    iput-object v2, v3, Lio/flutter/plugin/platform/p;->l:LZ2/s;

    .line 110
    .line 111
    iget-object v2, p2, LZ2/s;->g:Ljava/lang/Object;

    .line 112
    .line 113
    check-cast v2, Lio/flutter/plugin/platform/o;

    .line 114
    .line 115
    iget-object v4, v2, Lio/flutter/plugin/platform/o;->g:LZ2/d;

    .line 116
    .line 117
    if-nez v4, :cond_3

    .line 118
    .line 119
    iput-object p1, v2, Lio/flutter/plugin/platform/o;->g:LZ2/d;

    .line 120
    .line 121
    new-instance p1, LZ2/s;

    .line 122
    .line 123
    const/16 v4, 0xc

    .line 124
    .line 125
    invoke-direct {p1, v1, v4}, LZ2/s;-><init>(Lb3/b;I)V

    .line 126
    .line 127
    .line 128
    iput-object p1, v2, Lio/flutter/plugin/platform/o;->k:LZ2/s;

    .line 129
    .line 130
    iget-object v1, v2, Lio/flutter/plugin/platform/o;->t:Lio/flutter/plugin/platform/m;

    .line 131
    .line 132
    iput-object v1, p1, LZ2/s;->g:Ljava/lang/Object;

    .line 133
    .line 134
    iget-object p1, v3, Lio/flutter/plugin/platform/p;->l:LZ2/s;

    .line 135
    .line 136
    iput-object p2, p1, LZ2/s;->g:Ljava/lang/Object;

    .line 137
    .line 138
    iget-object p1, p0, La3/d;->d:Ljava/util/HashMap;

    .line 139
    .line 140
    invoke-virtual {p1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 149
    .line 150
    .line 151
    move-result p2

    .line 152
    if-eqz p2, :cond_2

    .line 153
    .line 154
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object p2

    .line 158
    check-cast p2, Lh3/a;

    .line 159
    .line 160
    iget-boolean v1, p0, La3/d;->g:Z

    .line 161
    .line 162
    if-eqz v1, :cond_1

    .line 163
    .line 164
    iget-object v1, p0, La3/d;->f:Lm/J0;

    .line 165
    .line 166
    invoke-interface {p2, v1}, Lh3/a;->onReattachedToActivityForConfigChanges(Lh3/b;)V

    .line 167
    .line 168
    .line 169
    goto :goto_1

    .line 170
    :cond_1
    iget-object v1, p0, La3/d;->f:Lm/J0;

    .line 171
    .line 172
    invoke-interface {p2, v1}, Lh3/a;->onAttachedToActivity(Lh3/b;)V

    .line 173
    .line 174
    .line 175
    goto :goto_1

    .line 176
    :cond_2
    iput-boolean v0, p0, La3/d;->g:Z

    .line 177
    .line 178
    return-void

    .line 179
    :cond_3
    new-instance p1, Ljava/lang/AssertionError;

    .line 180
    .line 181
    invoke-direct {p1, v5}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 182
    .line 183
    .line 184
    throw p1

    .line 185
    :cond_4
    new-instance p1, Ljava/lang/AssertionError;

    .line 186
    .line 187
    invoke-direct {p1, v5}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 188
    .line 189
    .line 190
    throw p1
.end method

.method public final c()V
    .locals 2

    .line 1
    invoke-virtual {p0}, La3/d;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    const-string v0, "FlutterEngineConnectionRegistry#detachFromActivity"

    .line 8
    .line 9
    invoke-static {v0}, Lw3/a;->b(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :try_start_0
    iget-object v0, p0, La3/d;->d:Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Lh3/a;

    .line 33
    .line 34
    invoke-interface {v1}, Lh3/a;->onDetachedFromActivity()V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception v0

    .line 39
    goto :goto_1

    .line 40
    :cond_0
    invoke-virtual {p0}, La3/d;->d()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    .line 42
    .line 43
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :goto_1
    :try_start_1
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 48
    .line 49
    .line 50
    goto :goto_2

    .line 51
    :catchall_1
    move-exception v1

    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    :goto_2
    throw v0

    .line 56
    :cond_1
    const-string v0, "FlutterEngineCxnRegstry"

    .line 57
    .line 58
    const-string v1, "Attempted to detach plugins from an Activity when no Activity was attached."

    .line 59
    .line 60
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final d()V
    .locals 4

    .line 1
    iget-object v0, p0, La3/d;->b:La3/c;

    .line 2
    .line 3
    iget-object v1, v0, La3/c;->s:Lio/flutter/plugin/platform/p;

    .line 4
    .line 5
    iget-object v2, v1, Lio/flutter/plugin/platform/p;->l:LZ2/s;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    iput-object v3, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 11
    .line 12
    :cond_0
    invoke-virtual {v1}, Lio/flutter/plugin/platform/p;->d()V

    .line 13
    .line 14
    .line 15
    iput-object v3, v1, Lio/flutter/plugin/platform/p;->l:LZ2/s;

    .line 16
    .line 17
    iput-object v3, v1, Lio/flutter/plugin/platform/p;->g:LZ2/d;

    .line 18
    .line 19
    iput-object v3, v1, Lio/flutter/plugin/platform/p;->j:Lio/flutter/embedding/engine/renderer/j;

    .line 20
    .line 21
    iget-object v0, v0, La3/c;->t:Lio/flutter/plugin/platform/o;

    .line 22
    .line 23
    iget-object v1, v0, Lio/flutter/plugin/platform/o;->k:LZ2/s;

    .line 24
    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    iput-object v3, v1, LZ2/s;->g:Ljava/lang/Object;

    .line 28
    .line 29
    :cond_1
    iget-object v1, v0, Lio/flutter/plugin/platform/o;->r:Landroid/view/Surface;

    .line 30
    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/view/Surface;->release()V

    .line 34
    .line 35
    .line 36
    iput-object v3, v0, Lio/flutter/plugin/platform/o;->r:Landroid/view/Surface;

    .line 37
    .line 38
    iput-object v3, v0, Lio/flutter/plugin/platform/o;->s:Landroid/view/SurfaceControl;

    .line 39
    .line 40
    :cond_2
    iput-object v3, v0, Lio/flutter/plugin/platform/o;->k:LZ2/s;

    .line 41
    .line 42
    iput-object v3, v0, Lio/flutter/plugin/platform/o;->g:LZ2/d;

    .line 43
    .line 44
    iput-object v3, p0, La3/d;->e:LZ2/h;

    .line 45
    .line 46
    iput-object v3, p0, La3/d;->f:Lm/J0;

    .line 47
    .line 48
    return-void
.end method

.method public final e()V
    .locals 1

    .line 1
    invoke-virtual {p0}, La3/d;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, La3/d;->c()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final f()Z
    .locals 1

    .line 1
    iget-object v0, p0, La3/d;->e:LZ2/h;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    return v0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    return v0
.end method
