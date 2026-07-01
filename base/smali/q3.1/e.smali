.class public Lq3/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;
.implements Lk3/m;
.implements Lk3/r;
.implements Lg3/b;
.implements Lh3/a;


# instance fields
.field public final e:Ljava/util/HashMap;

.field public f:Lk3/o;

.field public g:Landroid/app/Activity;

.field public final h:Landroidx/lifecycle/v;

.field public i:Lq3/d;

.field public final j:Landroidx/lifecycle/v;

.field public k:Lq3/d;

.field public l:LV1/x;

.field public m:Ljava/util/Map;

.field public n:Lq3/f;


# direct methods
.method public constructor <init>()V
    .locals 1

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
    iput-object v0, p0, Lq3/e;->e:Ljava/util/HashMap;

    .line 10
    .line 11
    sget-object v0, Landroidx/lifecycle/v;->l:Landroidx/lifecycle/v;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Landroidx/lifecycle/v;

    .line 16
    .line 17
    invoke-direct {v0}, Landroidx/lifecycle/v;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Landroidx/lifecycle/v;->l:Landroidx/lifecycle/v;

    .line 21
    .line 22
    :cond_0
    sget-object v0, Landroidx/lifecycle/v;->l:Landroidx/lifecycle/v;

    .line 23
    .line 24
    iput-object v0, p0, Lq3/e;->h:Landroidx/lifecycle/v;

    .line 25
    .line 26
    sget-object v0, Landroidx/lifecycle/v;->m:Landroidx/lifecycle/v;

    .line 27
    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    new-instance v0, Landroidx/lifecycle/v;

    .line 31
    .line 32
    invoke-direct {v0}, Landroidx/lifecycle/v;-><init>()V

    .line 33
    .line 34
    .line 35
    sput-object v0, Landroidx/lifecycle/v;->m:Landroidx/lifecycle/v;

    .line 36
    .line 37
    :cond_1
    sget-object v0, Landroidx/lifecycle/v;->m:Landroidx/lifecycle/v;

    .line 38
    .line 39
    iput-object v0, p0, Lq3/e;->j:Landroidx/lifecycle/v;

    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public final didReinitializeFirebaseCore()Li1/h;
    .locals 4

    .line 1
    new-instance v0, Li1/i;

    .line 2
    .line 3
    invoke-direct {v0}, Li1/i;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 7
    .line 8
    new-instance v2, Lp3/e;

    .line 9
    .line 10
    const/4 v3, 0x1

    .line 11
    invoke-direct {v2, v0, v3}, Lp3/e;-><init>(Li1/i;I)V

    .line 12
    .line 13
    .line 14
    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, v0, Li1/i;->a:Li1/p;

    .line 18
    .line 19
    return-object v0
.end method

.method public final getPluginConstantsForFirebaseApp(LA1/g;)Li1/h;
    .locals 4

    .line 1
    new-instance v0, Li1/i;

    .line 2
    .line 3
    invoke-direct {v0}, Li1/i;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 7
    .line 8
    new-instance v2, Lp3/c;

    .line 9
    .line 10
    const/4 v3, 0x2

    .line 11
    invoke-direct {v2, p1, v0, v3}, Lp3/c;-><init>(LA1/g;Li1/i;I)V

    .line 12
    .line 13
    .line 14
    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, v0, Li1/i;->a:Li1/p;

    .line 18
    .line 19
    return-object p1
.end method

.method public final onAttachedToActivity(Lh3/b;)V
    .locals 1

    .line 1
    check-cast p1, Lm/J0;

    .line 2
    .line 3
    iget-object v0, p1, Lm/J0;->i:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Ljava/util/HashSet;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lq3/e;->n:Lq3/f;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Lm/J0;->b(Lk3/s;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p1, Lm/J0;->e:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p1, Landroid/app/Activity;

    .line 18
    .line 19
    iput-object p1, p0, Lq3/e;->g:Landroid/app/Activity;

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Lq3/e;->g:Landroid/app/Activity;

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    iget-object p1, p0, Lq3/e;->g:Landroid/app/Activity;

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1}, Landroid/content/Intent;->getFlags()I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    const/high16 v0, 0x100000

    .line 50
    .line 51
    and-int/2addr p1, v0

    .line 52
    if-eq p1, v0, :cond_0

    .line 53
    .line 54
    iget-object p1, p0, Lq3/e;->g:Landroid/app/Activity;

    .line 55
    .line 56
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p0, p1}, Lq3/e;->onNewIntent(Landroid/content/Intent;)Z

    .line 61
    .line 62
    .line 63
    :cond_0
    return-void
.end method

.method public final onAttachedToEngine(Lg3/a;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lg3/a;->a:Landroid/content/Context;

    .line 2
    .line 3
    const-string v1, "FLTFireContextHolder"

    .line 4
    .line 5
    const-string v2, "received application context."

    .line 6
    .line 7
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    sput-object v0, Ld1/d;->a:Landroid/content/Context;

    .line 11
    .line 12
    iget-object p1, p1, Lg3/a;->b:Lk3/f;

    .line 13
    .line 14
    new-instance v0, Lk3/o;

    .line 15
    .line 16
    const-string v1, "plugins.flutter.io/firebase_messaging"

    .line 17
    .line 18
    invoke-direct {v0, p1, v1}, Lk3/o;-><init>(Lk3/f;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lq3/e;->f:Lk3/o;

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Lk3/o;->b(Lk3/m;)V

    .line 24
    .line 25
    .line 26
    new-instance p1, Lq3/f;

    .line 27
    .line 28
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 29
    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    iput-boolean v0, p1, Lq3/f;->f:Z

    .line 33
    .line 34
    iput-object p1, p0, Lq3/e;->n:Lq3/f;

    .line 35
    .line 36
    new-instance p1, Lq3/d;

    .line 37
    .line 38
    invoke-direct {p1, p0, v0}, Lq3/d;-><init>(Lq3/e;I)V

    .line 39
    .line 40
    .line 41
    iput-object p1, p0, Lq3/e;->i:Lq3/d;

    .line 42
    .line 43
    new-instance v0, Lq3/d;

    .line 44
    .line 45
    const/4 v2, 0x1

    .line 46
    invoke-direct {v0, p0, v2}, Lq3/d;-><init>(Lq3/e;I)V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Lq3/e;->k:Lq3/d;

    .line 50
    .line 51
    iget-object v0, p0, Lq3/e;->h:Landroidx/lifecycle/v;

    .line 52
    .line 53
    invoke-virtual {v0, p1}, Landroidx/lifecycle/v;->c(Landroidx/lifecycle/w;)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lq3/e;->j:Landroidx/lifecycle/v;

    .line 57
    .line 58
    iget-object v0, p0, Lq3/e;->k:Lq3/d;

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Landroidx/lifecycle/v;->c(Landroidx/lifecycle/w;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v1, p0}, Lio/flutter/plugins/firebase/core/FlutterFirebasePluginRegistry;->registerPlugin(Ljava/lang/String;Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final onDetachedFromActivity()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lq3/e;->g:Landroid/app/Activity;

    .line 3
    .line 4
    return-void
.end method

.method public final onDetachedFromActivityForConfigChanges()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lq3/e;->g:Landroid/app/Activity;

    .line 3
    .line 4
    return-void
.end method

.method public final onDetachedFromEngine(Lg3/a;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lq3/e;->j:Landroidx/lifecycle/v;

    .line 2
    .line 3
    iget-object v0, p0, Lq3/e;->k:Lq3/d;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroidx/lifecycle/v;->e(Landroidx/lifecycle/w;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lq3/e;->h:Landroidx/lifecycle/v;

    .line 9
    .line 10
    iget-object v0, p0, Lq3/e;->i:Lq3/d;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroidx/lifecycle/v;->e(Landroidx/lifecycle/w;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final onMethodCall(Lk3/l;Lk3/n;)V
    .locals 10

    .line 1
    iget-object v0, p1, Lk3/l;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lk3/l;->b:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x4

    .line 13
    const/4 v3, 0x3

    .line 14
    const/4 v4, 0x1

    .line 15
    const/4 v5, 0x2

    .line 16
    const/4 v6, 0x0

    .line 17
    const/4 v7, -0x1

    .line 18
    sparse-switch v1, :sswitch_data_0

    .line 19
    .line 20
    .line 21
    goto/16 :goto_0

    .line 22
    .line 23
    :sswitch_0
    const-string v1, "Messaging#getToken"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    goto/16 :goto_0

    .line 32
    .line 33
    :cond_0
    const/16 v7, 0xa

    .line 34
    .line 35
    goto/16 :goto_0

    .line 36
    .line 37
    :sswitch_1
    const-string v1, "Messaging#getNotificationSettings"

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_1

    .line 44
    .line 45
    goto/16 :goto_0

    .line 46
    .line 47
    :cond_1
    const/16 v7, 0x9

    .line 48
    .line 49
    goto/16 :goto_0

    .line 50
    .line 51
    :sswitch_2
    const-string v1, "Messaging#requestPermission"

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_2

    .line 58
    .line 59
    goto/16 :goto_0

    .line 60
    .line 61
    :cond_2
    const/16 v7, 0x8

    .line 62
    .line 63
    goto/16 :goto_0

    .line 64
    .line 65
    :sswitch_3
    const-string v1, "Messaging#sendMessage"

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_3

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_3
    const/4 v7, 0x7

    .line 75
    goto :goto_0

    .line 76
    :sswitch_4
    const-string v1, "Messaging#startBackgroundIsolate"

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-nez v0, :cond_4

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_4
    const/4 v7, 0x6

    .line 86
    goto :goto_0

    .line 87
    :sswitch_5
    const-string v1, "Messaging#setDeliveryMetricsExportToBigQuery"

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_5

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_5
    const/4 v7, 0x5

    .line 97
    goto :goto_0

    .line 98
    :sswitch_6
    const-string v1, "Messaging#subscribeToTopic"

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-nez v0, :cond_6

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_6
    move v7, v2

    .line 108
    goto :goto_0

    .line 109
    :sswitch_7
    const-string v1, "Messaging#unsubscribeFromTopic"

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-nez v0, :cond_7

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_7
    move v7, v3

    .line 119
    goto :goto_0

    .line 120
    :sswitch_8
    const-string v1, "Messaging#deleteToken"

    .line 121
    .line 122
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-nez v0, :cond_8

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_8
    move v7, v5

    .line 130
    goto :goto_0

    .line 131
    :sswitch_9
    const-string v1, "Messaging#setAutoInitEnabled"

    .line 132
    .line 133
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-nez v0, :cond_9

    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_9
    move v7, v4

    .line 141
    goto :goto_0

    .line 142
    :sswitch_a
    const-string v1, "Messaging#getInitialMessage"

    .line 143
    .line 144
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    if-nez v0, :cond_a

    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_a
    move v7, v6

    .line 152
    :goto_0
    packed-switch v7, :pswitch_data_0

    .line 153
    .line 154
    .line 155
    check-cast p2, LQ2/g;

    .line 156
    .line 157
    invoke-virtual {p2}, LQ2/g;->b()V

    .line 158
    .line 159
    .line 160
    return-void

    .line 161
    :pswitch_0
    new-instance p1, Li1/i;

    .line 162
    .line 163
    invoke-direct {p1}, Li1/i;-><init>()V

    .line 164
    .line 165
    .line 166
    sget-object v0, Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 167
    .line 168
    new-instance v1, Lp3/e;

    .line 169
    .line 170
    invoke-direct {v1, p0, p1}, Lp3/e;-><init>(Lq3/e;Li1/i;)V

    .line 171
    .line 172
    .line 173
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 174
    .line 175
    .line 176
    iget-object p1, p1, Li1/i;->a:Li1/p;

    .line 177
    .line 178
    goto/16 :goto_6

    .line 179
    .line 180
    :pswitch_1
    new-instance p1, Li1/i;

    .line 181
    .line 182
    invoke-direct {p1}, Li1/i;-><init>()V

    .line 183
    .line 184
    .line 185
    sget-object v0, Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 186
    .line 187
    new-instance v1, Lq3/b;

    .line 188
    .line 189
    invoke-direct {v1, p0, p1, v5}, Lq3/b;-><init>(Lq3/e;Li1/i;I)V

    .line 190
    .line 191
    .line 192
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 193
    .line 194
    .line 195
    iget-object p1, p1, Li1/i;->a:Li1/p;

    .line 196
    .line 197
    goto/16 :goto_6

    .line 198
    .line 199
    :pswitch_2
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 200
    .line 201
    const/16 v0, 0x21

    .line 202
    .line 203
    if-lt p1, v0, :cond_b

    .line 204
    .line 205
    new-instance p1, Li1/i;

    .line 206
    .line 207
    invoke-direct {p1}, Li1/i;-><init>()V

    .line 208
    .line 209
    .line 210
    sget-object v0, Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 211
    .line 212
    new-instance v1, Lq3/b;

    .line 213
    .line 214
    invoke-direct {v1, p0, p1, v4}, Lq3/b;-><init>(Lq3/e;Li1/i;I)V

    .line 215
    .line 216
    .line 217
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 218
    .line 219
    .line 220
    iget-object p1, p1, Li1/i;->a:Li1/p;

    .line 221
    .line 222
    goto/16 :goto_6

    .line 223
    .line 224
    :cond_b
    new-instance p1, Li1/i;

    .line 225
    .line 226
    invoke-direct {p1}, Li1/i;-><init>()V

    .line 227
    .line 228
    .line 229
    sget-object v0, Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 230
    .line 231
    new-instance v1, Lq3/b;

    .line 232
    .line 233
    invoke-direct {v1, p0, p1, v5}, Lq3/b;-><init>(Lq3/e;Li1/i;I)V

    .line 234
    .line 235
    .line 236
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 237
    .line 238
    .line 239
    iget-object p1, p1, Li1/i;->a:Li1/p;

    .line 240
    .line 241
    goto/16 :goto_6

    .line 242
    .line 243
    :pswitch_3
    check-cast p1, Ljava/util/Map;

    .line 244
    .line 245
    new-instance v0, Li1/i;

    .line 246
    .line 247
    invoke-direct {v0}, Li1/i;-><init>()V

    .line 248
    .line 249
    .line 250
    sget-object v1, Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 251
    .line 252
    new-instance v3, Lq3/c;

    .line 253
    .line 254
    invoke-direct {v3, p1, v0, v2}, Lq3/c;-><init>(Ljava/util/Map;Li1/i;I)V

    .line 255
    .line 256
    .line 257
    invoke-interface {v1, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 258
    .line 259
    .line 260
    iget-object p1, v0, Li1/i;->a:Li1/p;

    .line 261
    .line 262
    goto/16 :goto_6

    .line 263
    .line 264
    :pswitch_4
    check-cast p1, Ljava/util/Map;

    .line 265
    .line 266
    const-string v0, "pluginCallbackHandle"

    .line 267
    .line 268
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    const-string v1, "userCallbackHandle"

    .line 273
    .line 274
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 275
    .line 276
    .line 277
    move-result-object p1

    .line 278
    instance-of v1, v0, Ljava/lang/Long;

    .line 279
    .line 280
    if-eqz v1, :cond_c

    .line 281
    .line 282
    check-cast v0, Ljava/lang/Long;

    .line 283
    .line 284
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 285
    .line 286
    .line 287
    move-result-wide v0

    .line 288
    goto :goto_1

    .line 289
    :cond_c
    instance-of v1, v0, Ljava/lang/Integer;

    .line 290
    .line 291
    if-eqz v1, :cond_12

    .line 292
    .line 293
    check-cast v0, Ljava/lang/Integer;

    .line 294
    .line 295
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 296
    .line 297
    .line 298
    move-result v0

    .line 299
    int-to-long v0, v0

    .line 300
    :goto_1
    instance-of v2, p1, Ljava/lang/Long;

    .line 301
    .line 302
    if-eqz v2, :cond_d

    .line 303
    .line 304
    check-cast p1, Ljava/lang/Long;

    .line 305
    .line 306
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 307
    .line 308
    .line 309
    move-result-wide v2

    .line 310
    goto :goto_2

    .line 311
    :cond_d
    instance-of v2, p1, Ljava/lang/Integer;

    .line 312
    .line 313
    if-eqz v2, :cond_11

    .line 314
    .line 315
    check-cast p1, Ljava/lang/Integer;

    .line 316
    .line 317
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 318
    .line 319
    .line 320
    move-result p1

    .line 321
    int-to-long v2, p1

    .line 322
    :goto_2
    iget-object p1, p0, Lq3/e;->g:Landroid/app/Activity;

    .line 323
    .line 324
    const/4 v4, 0x0

    .line 325
    if-eqz p1, :cond_e

    .line 326
    .line 327
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 328
    .line 329
    .line 330
    move-result-object p1

    .line 331
    invoke-static {p1}, LX1/c;->a(Landroid/content/Intent;)LX1/c;

    .line 332
    .line 333
    .line 334
    move-result-object p1

    .line 335
    goto :goto_3

    .line 336
    :cond_e
    move-object p1, v4

    .line 337
    :goto_3
    sget-object v7, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;->l:Ljava/util/List;

    .line 338
    .line 339
    sget-object v7, Ld1/d;->a:Landroid/content/Context;

    .line 340
    .line 341
    const-string v8, "io.flutter.firebase.messaging.callback"

    .line 342
    .line 343
    if-nez v7, :cond_f

    .line 344
    .line 345
    const-string v7, "FLTFireBGExecutor"

    .line 346
    .line 347
    const-string v9, "Context is null, cannot continue."

    .line 348
    .line 349
    invoke-static {v7, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 350
    .line 351
    .line 352
    goto :goto_4

    .line 353
    :cond_f
    invoke-virtual {v7, v8, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 354
    .line 355
    .line 356
    move-result-object v7

    .line 357
    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 358
    .line 359
    .line 360
    move-result-object v7

    .line 361
    const-string v9, "callback_handle"

    .line 362
    .line 363
    invoke-interface {v7, v9, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 364
    .line 365
    .line 366
    move-result-object v7

    .line 367
    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 368
    .line 369
    .line 370
    :goto_4
    sget-object v7, Ld1/d;->a:Landroid/content/Context;

    .line 371
    .line 372
    invoke-virtual {v7, v8, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 373
    .line 374
    .line 375
    move-result-object v7

    .line 376
    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 377
    .line 378
    .line 379
    move-result-object v7

    .line 380
    const-string v8, "user_callback_handle"

    .line 381
    .line 382
    invoke-interface {v7, v8, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 383
    .line 384
    .line 385
    move-result-object v2

    .line 386
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 387
    .line 388
    .line 389
    sget-object v2, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;->m:Lm/x0;

    .line 390
    .line 391
    if-eqz v2, :cond_10

    .line 392
    .line 393
    const-string p1, "FLTFireMsgService"

    .line 394
    .line 395
    const-string v0, "Attempted to start a duplicate background isolate. Returning..."

    .line 396
    .line 397
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 398
    .line 399
    .line 400
    goto :goto_5

    .line 401
    :cond_10
    new-instance v2, Lm/x0;

    .line 402
    .line 403
    invoke-direct {v2, v5, v6}, Lm/x0;-><init>(IB)V

    .line 404
    .line 405
    .line 406
    sput-object v2, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;->m:Lm/x0;

    .line 407
    .line 408
    invoke-virtual {v2, v0, v1, p1}, Lm/x0;->L(JLX1/c;)V

    .line 409
    .line 410
    .line 411
    :goto_5
    invoke-static {v4}, LV0/g;->o(Ljava/lang/Object;)Li1/p;

    .line 412
    .line 413
    .line 414
    move-result-object p1

    .line 415
    goto/16 :goto_6

    .line 416
    .line 417
    :cond_11
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 418
    .line 419
    const-string p2, "Expected \'Long\' or \'Integer\' type for \'userCallbackHandle\'."

    .line 420
    .line 421
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 422
    .line 423
    .line 424
    throw p1

    .line 425
    :cond_12
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 426
    .line 427
    const-string p2, "Expected \'Long\' or \'Integer\' type for \'pluginCallbackHandle\'."

    .line 428
    .line 429
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 430
    .line 431
    .line 432
    throw p1

    .line 433
    :pswitch_5
    check-cast p1, Ljava/util/Map;

    .line 434
    .line 435
    new-instance v0, Li1/i;

    .line 436
    .line 437
    invoke-direct {v0}, Li1/i;-><init>()V

    .line 438
    .line 439
    .line 440
    sget-object v1, Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 441
    .line 442
    new-instance v2, Lq3/c;

    .line 443
    .line 444
    invoke-direct {v2, p1, v0, v4}, Lq3/c;-><init>(Ljava/util/Map;Li1/i;I)V

    .line 445
    .line 446
    .line 447
    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 448
    .line 449
    .line 450
    iget-object p1, v0, Li1/i;->a:Li1/p;

    .line 451
    .line 452
    goto :goto_6

    .line 453
    :pswitch_6
    check-cast p1, Ljava/util/Map;

    .line 454
    .line 455
    new-instance v0, Li1/i;

    .line 456
    .line 457
    invoke-direct {v0}, Li1/i;-><init>()V

    .line 458
    .line 459
    .line 460
    sget-object v1, Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 461
    .line 462
    new-instance v2, Lq3/c;

    .line 463
    .line 464
    invoke-direct {v2, p1, v0, v3}, Lq3/c;-><init>(Ljava/util/Map;Li1/i;I)V

    .line 465
    .line 466
    .line 467
    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 468
    .line 469
    .line 470
    iget-object p1, v0, Li1/i;->a:Li1/p;

    .line 471
    .line 472
    goto :goto_6

    .line 473
    :pswitch_7
    check-cast p1, Ljava/util/Map;

    .line 474
    .line 475
    new-instance v0, Li1/i;

    .line 476
    .line 477
    invoke-direct {v0}, Li1/i;-><init>()V

    .line 478
    .line 479
    .line 480
    sget-object v1, Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 481
    .line 482
    new-instance v2, Lq3/c;

    .line 483
    .line 484
    invoke-direct {v2, p1, v0, v6}, Lq3/c;-><init>(Ljava/util/Map;Li1/i;I)V

    .line 485
    .line 486
    .line 487
    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 488
    .line 489
    .line 490
    iget-object p1, v0, Li1/i;->a:Li1/p;

    .line 491
    .line 492
    goto :goto_6

    .line 493
    :pswitch_8
    new-instance p1, Li1/i;

    .line 494
    .line 495
    invoke-direct {p1}, Li1/i;-><init>()V

    .line 496
    .line 497
    .line 498
    sget-object v0, Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 499
    .line 500
    new-instance v1, Lp3/e;

    .line 501
    .line 502
    invoke-direct {v1, p1, v3}, Lp3/e;-><init>(Li1/i;I)V

    .line 503
    .line 504
    .line 505
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 506
    .line 507
    .line 508
    iget-object p1, p1, Li1/i;->a:Li1/p;

    .line 509
    .line 510
    goto :goto_6

    .line 511
    :pswitch_9
    check-cast p1, Ljava/util/Map;

    .line 512
    .line 513
    new-instance v0, Li1/i;

    .line 514
    .line 515
    invoke-direct {v0}, Li1/i;-><init>()V

    .line 516
    .line 517
    .line 518
    sget-object v1, Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 519
    .line 520
    new-instance v2, Lq3/c;

    .line 521
    .line 522
    invoke-direct {v2, p0, p1, v0}, Lq3/c;-><init>(Lq3/e;Ljava/util/Map;Li1/i;)V

    .line 523
    .line 524
    .line 525
    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 526
    .line 527
    .line 528
    iget-object p1, v0, Li1/i;->a:Li1/p;

    .line 529
    .line 530
    goto :goto_6

    .line 531
    :pswitch_a
    new-instance p1, Li1/i;

    .line 532
    .line 533
    invoke-direct {p1}, Li1/i;-><init>()V

    .line 534
    .line 535
    .line 536
    sget-object v0, Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 537
    .line 538
    new-instance v1, Lq3/b;

    .line 539
    .line 540
    invoke-direct {v1, p0, p1, v6}, Lq3/b;-><init>(Lq3/e;Li1/i;I)V

    .line 541
    .line 542
    .line 543
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 544
    .line 545
    .line 546
    iget-object p1, p1, Li1/i;->a:Li1/p;

    .line 547
    .line 548
    :goto_6
    new-instance v0, Lj3/g;

    .line 549
    .line 550
    check-cast p2, LQ2/g;

    .line 551
    .line 552
    invoke-direct {v0, p0, p2}, Lj3/g;-><init>(Lq3/e;LQ2/g;)V

    .line 553
    .line 554
    .line 555
    invoke-virtual {p1, v0}, Li1/p;->f(Li1/c;)Li1/p;

    .line 556
    .line 557
    .line 558
    return-void

    .line 559
    :sswitch_data_0
    .sparse-switch
        -0x659116c6 -> :sswitch_a
        -0x6304bde1 -> :sswitch_9
        -0x27332c11 -> :sswitch_8
        0x191cc013 -> :sswitch_7
        0x1e2dde89 -> :sswitch_6
        0x243b9fa3 -> :sswitch_5
        0x3756bbda -> :sswitch_4
        0x457e7c40 -> :sswitch_3
        0x4964bddf -> :sswitch_2
        0x4a23be05 -> :sswitch_1
        0x56fbb702 -> :sswitch_0
    .end sparse-switch

    .line 560
    .line 561
    .line 562
    .line 563
    .line 564
    .line 565
    .line 566
    .line 567
    .line 568
    .line 569
    .line 570
    .line 571
    .line 572
    .line 573
    .line 574
    .line 575
    .line 576
    .line 577
    .line 578
    .line 579
    .line 580
    .line 581
    .line 582
    .line 583
    .line 584
    .line 585
    .line 586
    .line 587
    .line 588
    .line 589
    .line 590
    .line 591
    .line 592
    .line 593
    .line 594
    .line 595
    .line 596
    .line 597
    .line 598
    .line 599
    .line 600
    .line 601
    .line 602
    .line 603
    .line 604
    .line 605
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final onNewIntent(Landroid/content/Intent;)Z
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "google.message_id"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "message_id"

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    :cond_1
    if-nez v0, :cond_2

    .line 31
    .line 32
    goto :goto_2

    .line 33
    :cond_2
    sget-object v1, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingReceiver;->a:Ljava/util/HashMap;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, LV1/x;

    .line 40
    .line 41
    const-string v3, "notification"

    .line 42
    .line 43
    const/4 v4, 0x0

    .line 44
    if-nez v2, :cond_4

    .line 45
    .line 46
    invoke-static {}, Lj3/b;->n()Lj3/b;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    invoke-virtual {v5, v0}, Lj3/b;->m(Ljava/lang/String;)Ljava/util/HashMap;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    if-eqz v5, :cond_4

    .line 55
    .line 56
    invoke-static {v5}, LT0/a;->y(Ljava/util/Map;)LV1/x;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    const-string v6, "message"

    .line 61
    .line 62
    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    check-cast v5, Ljava/util/Map;

    .line 70
    .line 71
    invoke-interface {v5, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    if-nez v6, :cond_3

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_3
    invoke-interface {v5, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    check-cast v5, Ljava/util/Map;

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_4
    :goto_0
    move-object v5, v4

    .line 86
    :goto_1
    if-nez v2, :cond_5

    .line 87
    .line 88
    :goto_2
    const/4 p1, 0x0

    .line 89
    return p1

    .line 90
    :cond_5
    iput-object v2, p0, Lq3/e;->l:LV1/x;

    .line 91
    .line 92
    iput-object v5, p0, Lq3/e;->m:Ljava/util/Map;

    .line 93
    .line 94
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    invoke-static {v2}, LT0/a;->F(LV1/x;)Ljava/util/HashMap;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v2}, LV1/x;->c()LV1/w;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    if-nez v1, :cond_6

    .line 106
    .line 107
    iget-object v1, p0, Lq3/e;->m:Ljava/util/Map;

    .line 108
    .line 109
    if-eqz v1, :cond_6

    .line 110
    .line 111
    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    :cond_6
    iget-object v1, p0, Lq3/e;->f:Lk3/o;

    .line 115
    .line 116
    const-string v2, "Messaging#onMessageOpenedApp"

    .line 117
    .line 118
    invoke-virtual {v1, v2, v0, v4}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lq3/e;->g:Landroid/app/Activity;

    .line 122
    .line 123
    invoke-virtual {v0, p1}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V

    .line 124
    .line 125
    .line 126
    const/4 p1, 0x1

    .line 127
    return p1
.end method

.method public final onReattachedToActivityForConfigChanges(Lh3/b;)V
    .locals 1

    .line 1
    check-cast p1, Lm/J0;

    .line 2
    .line 3
    iget-object v0, p1, Lm/J0;->i:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Ljava/util/HashSet;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    iget-object p1, p1, Lm/J0;->e:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p1, Landroid/app/Activity;

    .line 13
    .line 14
    iput-object p1, p0, Lq3/e;->g:Landroid/app/Activity;

    .line 15
    .line 16
    return-void
.end method
