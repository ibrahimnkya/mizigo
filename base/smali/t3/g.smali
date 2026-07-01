.class public final Lt3/g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;
.implements Landroidx/lifecycle/DefaultLifecycleObserver;


# instance fields
.field public final e:Landroid/app/Activity;

.field public final synthetic f:Lt3/h;


# direct methods
.method public constructor <init>(Lt3/h;Landroid/app/Activity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lt3/g;->f:Lt3/h;

    .line 5
    .line 6
    iput-object p2, p0, Lt3/g;->e:Landroid/app/Activity;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final C(Landroidx/lifecycle/q;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lt3/g;->e:Landroid/app/Activity;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lt3/g;->onActivityStopped(Landroid/app/Activity;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final f(Landroidx/lifecycle/q;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final g(Landroidx/lifecycle/q;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lt3/g;->e:Landroid/app/Activity;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lt3/g;->onActivityDestroyed(Landroid/app/Activity;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final h(Landroidx/lifecycle/q;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final onActivityDestroyed(Landroid/app/Activity;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lt3/g;->e:Landroid/app/Activity;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Landroid/app/Application;

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final onActivityPaused(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final onActivityResumed(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final onActivityStarted(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final onActivityStopped(Landroid/app/Activity;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lt3/g;->e:Landroid/app/Activity;

    .line 2
    .line 3
    if-ne v0, p1, :cond_7

    .line 4
    .line 5
    iget-object p1, p0, Lt3/g;->f:Lt3/h;

    .line 6
    .line 7
    iget-object p1, p1, Lt3/h;->f:Lm/J0;

    .line 8
    .line 9
    iget-object p1, p1, Lm/J0;->g:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p1, Lt3/f;

    .line 12
    .line 13
    iget-object v0, p1, Lt3/f;->p:Ljava/lang/Object;

    .line 14
    .line 15
    monitor-enter v0

    .line 16
    :try_start_0
    iget-object v1, p1, Lt3/f;->o:Lm/x0;

    .line 17
    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception p1

    .line 23
    goto/16 :goto_2

    .line 24
    .line 25
    :cond_0
    iget-object v1, v1, Lm/x0;->f:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v1, Lt3/o;

    .line 28
    .line 29
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    iget-object v0, p1, Lt3/f;->h:LN/m;

    .line 31
    .line 32
    const/4 v2, 0x1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    move v3, v2

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 v3, 0x2

    .line 38
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    invoke-static {v3}, LL/i;->b(I)I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    const/4 v4, 0x0

    .line 46
    if-eqz v3, :cond_3

    .line 47
    .line 48
    if-eq v3, v2, :cond_2

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_2
    const-string v2, "video"

    .line 52
    .line 53
    iget-object v0, v0, LN/m;->a:Landroid/content/Context;

    .line 54
    .line 55
    const-string v3, "flutter_image_picker_shared_preference"

    .line 56
    .line 57
    invoke-virtual {v0, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const-string v3, "flutter_image_picker_type"

    .line 66
    .line 67
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 72
    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_3
    const-string v2, "image"

    .line 76
    .line 77
    iget-object v0, v0, LN/m;->a:Landroid/content/Context;

    .line 78
    .line 79
    const-string v3, "flutter_image_picker_shared_preference"

    .line 80
    .line 81
    invoke-virtual {v0, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    const-string v3, "flutter_image_picker_type"

    .line 90
    .line 91
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 96
    .line 97
    .line 98
    :goto_1
    if-eqz v1, :cond_6

    .line 99
    .line 100
    iget-object v0, p1, Lt3/f;->h:LN/m;

    .line 101
    .line 102
    iget-object v0, v0, LN/m;->a:Landroid/content/Context;

    .line 103
    .line 104
    const-string v2, "flutter_image_picker_shared_preference"

    .line 105
    .line 106
    invoke-virtual {v0, v2, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iget-object v2, v1, Lt3/o;->a:Ljava/lang/Double;

    .line 115
    .line 116
    if-eqz v2, :cond_4

    .line 117
    .line 118
    const-string v3, "flutter_image_picker_max_width"

    .line 119
    .line 120
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    .line 121
    .line 122
    .line 123
    move-result-wide v5

    .line 124
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    .line 125
    .line 126
    .line 127
    move-result-wide v5

    .line 128
    invoke-interface {v0, v3, v5, v6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 129
    .line 130
    .line 131
    :cond_4
    iget-object v2, v1, Lt3/o;->b:Ljava/lang/Double;

    .line 132
    .line 133
    if-eqz v2, :cond_5

    .line 134
    .line 135
    const-string v3, "flutter_image_picker_max_height"

    .line 136
    .line 137
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    .line 138
    .line 139
    .line 140
    move-result-wide v5

    .line 141
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    .line 142
    .line 143
    .line 144
    move-result-wide v5

    .line 145
    invoke-interface {v0, v3, v5, v6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 146
    .line 147
    .line 148
    :cond_5
    const-string v2, "flutter_image_picker_image_quality"

    .line 149
    .line 150
    iget-object v1, v1, Lt3/o;->c:Ljava/lang/Long;

    .line 151
    .line 152
    invoke-virtual {v1}, Ljava/lang/Long;->intValue()I

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 157
    .line 158
    .line 159
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 160
    .line 161
    .line 162
    :cond_6
    iget-object v0, p1, Lt3/f;->n:Landroid/net/Uri;

    .line 163
    .line 164
    if-eqz v0, :cond_7

    .line 165
    .line 166
    iget-object p1, p1, Lt3/f;->h:LN/m;

    .line 167
    .line 168
    iget-object p1, p1, LN/m;->a:Landroid/content/Context;

    .line 169
    .line 170
    const-string v1, "flutter_image_picker_shared_preference"

    .line 171
    .line 172
    invoke-virtual {p1, v1, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    const-string v1, "flutter_image_picker_pending_image_uri"

    .line 181
    .line 182
    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 191
    .line 192
    .line 193
    return-void

    .line 194
    :goto_2
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 195
    throw p1

    .line 196
    :cond_7
    return-void
.end method

.method public final p(Landroidx/lifecycle/q;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final r(Landroidx/lifecycle/q;)V
    .locals 0

    .line 1
    return-void
.end method
