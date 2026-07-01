.class public final LZ2/h;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:LZ2/d;

.field public b:La3/c;

.field public c:LZ2/p;

.field public d:LR/j;

.field public e:LM2/b;

.field public f:LZ2/f;

.field public g:Z

.field public h:Z

.field public i:Z

.field public j:Z

.field public k:Ljava/lang/Integer;

.field public final l:LZ2/e;


# direct methods
.method public constructor <init>(LZ2/d;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, LZ2/e;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1, p0}, LZ2/e;-><init>(ILjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, LZ2/h;->l:LZ2/e;

    .line 11
    .line 12
    iput-object p1, p0, LZ2/h;->a:LZ2/d;

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, LZ2/h;->i:Z

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final a(La3/f;)V
    .locals 3

    .line 1
    iget-object v0, p0, LZ2/h;->a:LZ2/d;

    .line 2
    .line 3
    invoke-virtual {v0}, LZ2/d;->c()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    :cond_0
    invoke-static {}, LB2/a;->J()LB2/a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, LB2/a;->f:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v0, Le3/e;

    .line 22
    .line 23
    iget-object v0, v0, Le3/e;->d:LV1/q;

    .line 24
    .line 25
    iget-object v0, v0, LV1/q;->c:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v0, Ljava/lang/String;

    .line 28
    .line 29
    :cond_1
    new-instance v1, Lb3/a;

    .line 30
    .line 31
    iget-object v2, p0, LZ2/h;->a:LZ2/d;

    .line 32
    .line 33
    invoke-virtual {v2}, LZ2/d;->f()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-direct {v1, v0, v2}, Lb3/a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, LZ2/h;->a:LZ2/d;

    .line 41
    .line 42
    invoke-virtual {v0}, LZ2/d;->g()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    iget-object v0, p0, LZ2/h;->a:LZ2/d;

    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0, v0}, LZ2/h;->d(Landroid/content/Intent;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    if-nez v0, :cond_2

    .line 62
    .line 63
    const-string v0, "/"

    .line 64
    .line 65
    :cond_2
    iput-object v1, p1, La3/f;->d:Ljava/lang/Object;

    .line 66
    .line 67
    iput-object v0, p1, La3/f;->e:Ljava/lang/Object;

    .line 68
    .line 69
    iget-object v0, p0, LZ2/h;->a:LZ2/d;

    .line 70
    .line 71
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    const-string v1, "dart_entrypoint_args"

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Ljava/util/List;

    .line 82
    .line 83
    iput-object v0, p1, La3/f;->f:Ljava/lang/Object;

    .line 84
    .line 85
    return-void
.end method

.method public final b()V
    .locals 3

    .line 1
    iget-object v0, p0, LZ2/h;->a:LZ2/d;

    .line 2
    .line 3
    invoke-virtual {v0}, LZ2/d;->j()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, LZ2/h;->a:LZ2/d;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    new-instance v1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v2, "FlutterActivity "

    .line 17
    .line 18
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v2, " connection to the engine "

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget-object v2, v0, LZ2/d;->f:LZ2/h;

    .line 30
    .line 31
    iget-object v2, v2, LZ2/h;->b:La3/c;

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v2, " evicted by another attaching activity"

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v2, "FlutterActivity"

    .line 46
    .line 47
    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    iget-object v1, v0, LZ2/d;->f:LZ2/h;

    .line 51
    .line 52
    if-eqz v1, :cond_0

    .line 53
    .line 54
    invoke-virtual {v1}, LZ2/h;->e()V

    .line 55
    .line 56
    .line 57
    iget-object v0, v0, LZ2/d;->f:LZ2/h;

    .line 58
    .line 59
    invoke-virtual {v0}, LZ2/h;->f()V

    .line 60
    .line 61
    .line 62
    :cond_0
    return-void

    .line 63
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    .line 64
    .line 65
    new-instance v1, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    const-string v2, "The internal FlutterEngine created by "

    .line 68
    .line 69
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object v2, p0, LZ2/h;->a:LZ2/d;

    .line 73
    .line 74
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string v2, " has been attached to by another activity. To persist a FlutterEngine beyond the ownership of this activity, explicitly create a FlutterEngine"

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    throw v0
.end method

.method public final c()V
    .locals 2

    .line 1
    iget-object v0, p0, LZ2/h;->a:LZ2/d;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 7
    .line 8
    const-string v1, "Cannot execute method on a destroyed FlutterActivityAndFragmentDelegate."

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    throw v0
.end method

.method public final d(Landroid/content/Intent;)Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, LZ2/h;->a:LZ2/d;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {v0}, LZ2/d;->h()Landroid/os/Bundle;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "flutter_deeplinking_enabled"

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v0, 0x1

    .line 26
    goto :goto_0

    .line 27
    :catch_0
    const/4 v0, 0x0

    .line 28
    :goto_0
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    return-object p1

    .line 41
    :cond_1
    const/4 p1, 0x0

    .line 42
    return-object p1
.end method

.method public final e()V
    .locals 2

    .line 1
    invoke-virtual {p0}, LZ2/h;->c()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, LZ2/h;->f:LZ2/f;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, LZ2/h;->c:LZ2/p;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, LZ2/h;->f:LZ2/f;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-object v0, p0, LZ2/h;->f:LZ2/f;

    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, LZ2/h;->c:LZ2/p;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {v0}, LZ2/p;->a()V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, LZ2/h;->c:LZ2/p;

    .line 30
    .line 31
    iget-object v1, p0, LZ2/h;->l:LZ2/e;

    .line 32
    .line 33
    iget-object v0, v0, LZ2/p;->l:Ljava/util/HashSet;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public final f()V
    .locals 11

    .line 1
    iget-boolean v0, p0, LZ2/h;->j:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, LZ2/h;->c()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, LZ2/h;->a:LZ2/d;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, LZ2/h;->a:LZ2/d;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, LZ2/h;->a:LZ2/d;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/app/Activity;->isChangingConfigurations()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v1, 0x1

    .line 29
    if-eqz v0, :cond_3

    .line 30
    .line 31
    iget-object v0, p0, LZ2/h;->b:La3/c;

    .line 32
    .line 33
    iget-object v0, v0, La3/c;->d:La3/d;

    .line 34
    .line 35
    invoke-virtual {v0}, La3/d;->f()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    const-string v2, "FlutterEngineConnectionRegistry#detachFromActivityForConfigChanges"

    .line 42
    .line 43
    invoke-static {v2}, Lw3/a;->b(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :try_start_0
    iput-boolean v1, v0, La3/d;->g:Z

    .line 47
    .line 48
    iget-object v2, v0, La3/d;->d:Ljava/util/HashMap;

    .line 49
    .line 50
    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-eqz v3, :cond_1

    .line 63
    .line 64
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    check-cast v3, Lh3/a;

    .line 69
    .line 70
    invoke-interface {v3}, Lh3/a;->onDetachedFromActivityForConfigChanges()V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :catchall_0
    move-exception v0

    .line 75
    goto :goto_1

    .line 76
    :cond_1
    invoke-virtual {v0}, La3/d;->d()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    .line 78
    .line 79
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 80
    .line 81
    .line 82
    goto :goto_3

    .line 83
    :goto_1
    :try_start_1
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 84
    .line 85
    .line 86
    goto :goto_2

    .line 87
    :catchall_1
    move-exception v1

    .line 88
    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 89
    .line 90
    .line 91
    :goto_2
    throw v0

    .line 92
    :cond_2
    const-string v0, "FlutterEngineCxnRegstry"

    .line 93
    .line 94
    const-string v2, "Attempted to detach plugins from an Activity when no Activity was attached."

    .line 95
    .line 96
    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    goto :goto_3

    .line 100
    :cond_3
    iget-object v0, p0, LZ2/h;->b:La3/c;

    .line 101
    .line 102
    iget-object v0, v0, La3/c;->d:La3/d;

    .line 103
    .line 104
    invoke-virtual {v0}, La3/d;->c()V

    .line 105
    .line 106
    .line 107
    :goto_3
    iget-object v0, p0, LZ2/h;->d:LR/j;

    .line 108
    .line 109
    const/4 v2, 0x0

    .line 110
    if-eqz v0, :cond_4

    .line 111
    .line 112
    iget-object v0, v0, LR/j;->d:Ljava/lang/Object;

    .line 113
    .line 114
    check-cast v0, LZ2/s;

    .line 115
    .line 116
    iput-object v2, v0, LZ2/s;->g:Ljava/lang/Object;

    .line 117
    .line 118
    iput-object v2, p0, LZ2/h;->d:LR/j;

    .line 119
    .line 120
    :cond_4
    iget-object v0, p0, LZ2/h;->e:LM2/b;

    .line 121
    .line 122
    if-eqz v0, :cond_5

    .line 123
    .line 124
    iget-object v3, v0, LM2/b;->c:Ljava/lang/Object;

    .line 125
    .line 126
    check-cast v3, Lio/flutter/plugin/editing/j;

    .line 127
    .line 128
    iput-object v2, v3, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 129
    .line 130
    iput-object v2, v0, LM2/b;->b:Ljava/lang/Object;

    .line 131
    .line 132
    iput-object v2, p0, LZ2/h;->e:LM2/b;

    .line 133
    .line 134
    :cond_5
    iget-object v0, p0, LZ2/h;->a:LZ2/d;

    .line 135
    .line 136
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, LZ2/h;->b:La3/c;

    .line 140
    .line 141
    if-eqz v0, :cond_6

    .line 142
    .line 143
    iget-object v0, v0, La3/c;->g:Lj3/a;

    .line 144
    .line 145
    iget-boolean v3, v0, Lj3/a;->c:Z

    .line 146
    .line 147
    invoke-virtual {v0, v1, v3}, Lj3/a;->a(IZ)V

    .line 148
    .line 149
    .line 150
    :cond_6
    iget-object v0, p0, LZ2/h;->a:LZ2/d;

    .line 151
    .line 152
    invoke-virtual {v0}, LZ2/d;->j()Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    const/4 v1, 0x0

    .line 157
    if-eqz v0, :cond_10

    .line 158
    .line 159
    iget-object v0, p0, LZ2/h;->b:La3/c;

    .line 160
    .line 161
    iget-object v3, v0, La3/c;->a:Lio/flutter/embedding/engine/FlutterJNI;

    .line 162
    .line 163
    iget-object v4, v0, La3/c;->v:Ljava/util/HashSet;

    .line 164
    .line 165
    invoke-virtual {v4}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 166
    .line 167
    .line 168
    move-result-object v4

    .line 169
    :goto_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 170
    .line 171
    .line 172
    move-result v5

    .line 173
    if-eqz v5, :cond_7

    .line 174
    .line 175
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v5

    .line 179
    check-cast v5, La3/b;

    .line 180
    .line 181
    invoke-interface {v5}, La3/b;->a()V

    .line 182
    .line 183
    .line 184
    goto :goto_4

    .line 185
    :cond_7
    iget-object v4, v0, La3/c;->d:La3/d;

    .line 186
    .line 187
    invoke-virtual {v4}, La3/d;->e()V

    .line 188
    .line 189
    .line 190
    new-instance v5, Ljava/util/HashSet;

    .line 191
    .line 192
    iget-object v6, v4, La3/d;->a:Ljava/util/HashMap;

    .line 193
    .line 194
    invoke-virtual {v6}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 195
    .line 196
    .line 197
    move-result-object v7

    .line 198
    invoke-direct {v5, v7}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {v5}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 202
    .line 203
    .line 204
    move-result-object v5

    .line 205
    :goto_5
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 206
    .line 207
    .line 208
    move-result v7

    .line 209
    if-eqz v7, :cond_b

    .line 210
    .line 211
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object v7

    .line 215
    check-cast v7, Ljava/lang/Class;

    .line 216
    .line 217
    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    .line 219
    .line 220
    move-result-object v8

    .line 221
    check-cast v8, Lg3/b;

    .line 222
    .line 223
    if-nez v8, :cond_8

    .line 224
    .line 225
    goto :goto_5

    .line 226
    :cond_8
    invoke-virtual {v7}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v9

    .line 230
    const-string v10, "FlutterEngineConnectionRegistry#remove "

    .line 231
    .line 232
    invoke-virtual {v10, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v9

    .line 236
    invoke-static {v9}, Lw3/a;->b(Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    :try_start_2
    instance-of v9, v8, Lh3/a;

    .line 240
    .line 241
    if-eqz v9, :cond_a

    .line 242
    .line 243
    invoke-virtual {v4}, La3/d;->f()Z

    .line 244
    .line 245
    .line 246
    move-result v9

    .line 247
    if-eqz v9, :cond_9

    .line 248
    .line 249
    move-object v9, v8

    .line 250
    check-cast v9, Lh3/a;

    .line 251
    .line 252
    invoke-interface {v9}, Lh3/a;->onDetachedFromActivity()V

    .line 253
    .line 254
    .line 255
    goto :goto_6

    .line 256
    :catchall_2
    move-exception v0

    .line 257
    goto :goto_7

    .line 258
    :cond_9
    :goto_6
    iget-object v9, v4, La3/d;->d:Ljava/util/HashMap;

    .line 259
    .line 260
    invoke-virtual {v9, v7}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    :cond_a
    iget-object v9, v4, La3/d;->c:Lg3/a;

    .line 264
    .line 265
    invoke-interface {v8, v9}, Lg3/b;->onDetachedFromEngine(Lg3/a;)V

    .line 266
    .line 267
    .line 268
    invoke-virtual {v6, v7}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 269
    .line 270
    .line 271
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 272
    .line 273
    .line 274
    goto :goto_5

    .line 275
    :goto_7
    :try_start_3
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 276
    .line 277
    .line 278
    goto :goto_8

    .line 279
    :catchall_3
    move-exception v1

    .line 280
    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 281
    .line 282
    .line 283
    :goto_8
    throw v0

    .line 284
    :cond_b
    invoke-virtual {v6}, Ljava/util/HashMap;->clear()V

    .line 285
    .line 286
    .line 287
    iget-object v4, v0, La3/c;->s:Lio/flutter/plugin/platform/p;

    .line 288
    .line 289
    iget-object v5, v4, Lio/flutter/plugin/platform/p;->p:Landroid/util/SparseArray;

    .line 290
    .line 291
    :goto_9
    invoke-virtual {v5}, Landroid/util/SparseArray;->size()I

    .line 292
    .line 293
    .line 294
    move-result v6

    .line 295
    if-lez v6, :cond_c

    .line 296
    .line 297
    invoke-virtual {v5, v1}, Landroid/util/SparseArray;->keyAt(I)I

    .line 298
    .line 299
    .line 300
    move-result v6

    .line 301
    iget-object v7, v4, Lio/flutter/plugin/platform/p;->A:Lio/flutter/plugin/platform/m;

    .line 302
    .line 303
    invoke-virtual {v7, v6}, Lio/flutter/plugin/platform/m;->n(I)V

    .line 304
    .line 305
    .line 306
    goto :goto_9

    .line 307
    :cond_c
    iget-object v4, v0, La3/c;->t:Lio/flutter/plugin/platform/o;

    .line 308
    .line 309
    iget-object v5, v4, Lio/flutter/plugin/platform/o;->m:Landroid/util/SparseArray;

    .line 310
    .line 311
    :goto_a
    invoke-virtual {v5}, Landroid/util/SparseArray;->size()I

    .line 312
    .line 313
    .line 314
    move-result v6

    .line 315
    if-lez v6, :cond_d

    .line 316
    .line 317
    invoke-virtual {v5, v1}, Landroid/util/SparseArray;->keyAt(I)I

    .line 318
    .line 319
    .line 320
    move-result v6

    .line 321
    iget-object v7, v4, Lio/flutter/plugin/platform/o;->t:Lio/flutter/plugin/platform/m;

    .line 322
    .line 323
    invoke-virtual {v7, v6}, Lio/flutter/plugin/platform/m;->n(I)V

    .line 324
    .line 325
    .line 326
    goto :goto_a

    .line 327
    :cond_d
    iget-object v4, v0, La3/c;->c:Lb3/b;

    .line 328
    .line 329
    iget-object v4, v4, Lb3/b;->e:Lio/flutter/embedding/engine/FlutterJNI;

    .line 330
    .line 331
    invoke-virtual {v4, v2}, Lio/flutter/embedding/engine/FlutterJNI;->setPlatformMessageHandler(Lb3/j;)V

    .line 332
    .line 333
    .line 334
    iget-object v4, v0, La3/c;->x:La3/a;

    .line 335
    .line 336
    invoke-virtual {v3, v4}, Lio/flutter/embedding/engine/FlutterJNI;->removeEngineLifecycleListener(La3/b;)V

    .line 337
    .line 338
    .line 339
    invoke-virtual {v3, v2}, Lio/flutter/embedding/engine/FlutterJNI;->setDeferredComponentManager(Lc3/a;)V

    .line 340
    .line 341
    .line 342
    invoke-virtual {v3}, Lio/flutter/embedding/engine/FlutterJNI;->detachFromNativeAndReleaseResources()V

    .line 343
    .line 344
    .line 345
    invoke-static {}, LB2/a;->J()LB2/a;

    .line 346
    .line 347
    .line 348
    move-result-object v3

    .line 349
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 350
    .line 351
    .line 352
    sget-object v3, La3/c;->z:Ljava/util/HashMap;

    .line 353
    .line 354
    iget-wide v4, v0, La3/c;->w:J

    .line 355
    .line 356
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 357
    .line 358
    .line 359
    move-result-object v0

    .line 360
    invoke-virtual {v3, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 361
    .line 362
    .line 363
    iget-object v0, p0, LZ2/h;->a:LZ2/d;

    .line 364
    .line 365
    invoke-virtual {v0}, LZ2/d;->e()Ljava/lang/String;

    .line 366
    .line 367
    .line 368
    move-result-object v0

    .line 369
    if-eqz v0, :cond_f

    .line 370
    .line 371
    sget-object v0, La3/h;->c:La3/h;

    .line 372
    .line 373
    if-nez v0, :cond_e

    .line 374
    .line 375
    new-instance v0, La3/h;

    .line 376
    .line 377
    const/4 v3, 0x1

    .line 378
    invoke-direct {v0, v3}, La3/h;-><init>(I)V

    .line 379
    .line 380
    .line 381
    sput-object v0, La3/h;->c:La3/h;

    .line 382
    .line 383
    :cond_e
    sget-object v0, La3/h;->c:La3/h;

    .line 384
    .line 385
    iget-object v3, p0, LZ2/h;->a:LZ2/d;

    .line 386
    .line 387
    invoke-virtual {v3}, LZ2/d;->e()Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    move-result-object v3

    .line 391
    iget-object v0, v0, La3/h;->a:Ljava/util/HashMap;

    .line 392
    .line 393
    invoke-virtual {v0, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 394
    .line 395
    .line 396
    :cond_f
    iput-object v2, p0, LZ2/h;->b:La3/c;

    .line 397
    .line 398
    :cond_10
    iput-boolean v1, p0, LZ2/h;->j:Z

    .line 399
    .line 400
    return-void
.end method
