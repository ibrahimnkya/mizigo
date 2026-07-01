.class public Lcom/dexterous/flutterlocalnotifications/ActionBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# static fields
.field public static b:LZ2/s;

.field public static c:La3/c;


# instance fields
.field public a:LT0/b;


# direct methods
.method public constructor <init>()V
    .locals 0
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 7

    .line 1
    const-string v0, "com.dexterous.flutterlocalnotifications.ActionBroadcastReceiver.ACTION_TAPPED"

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/dexterous/flutterlocalnotifications/ActionBroadcastReceiver;->a:LT0/b;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    new-instance v0, LT0/b;

    .line 19
    .line 20
    invoke-direct {v0, p1}, LT0/b;-><init>(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iput-object v0, p0, Lcom/dexterous/flutterlocalnotifications/ActionBroadcastReceiver;->a:LT0/b;

    .line 24
    .line 25
    invoke-static {p2}, Lcom/dexterous/flutterlocalnotifications/FlutterLocalNotificationsPlugin;->extractNotificationResponseMap(Landroid/content/Intent;)Ljava/util/Map;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "cancelNotification"

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    const/4 v1, 0x0

    .line 37
    if-eqz p2, :cond_3

    .line 38
    .line 39
    const-string p2, "notificationId"

    .line 40
    .line 41
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    check-cast p2, Ljava/lang/Integer;

    .line 46
    .line 47
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    const-string v3, "notificationTag"

    .line 52
    .line 53
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    instance-of v4, v3, Ljava/lang/String;

    .line 58
    .line 59
    if-eqz v4, :cond_2

    .line 60
    .line 61
    new-instance v4, Lt/H;

    .line 62
    .line 63
    invoke-direct {v4, p1}, Lt/H;-><init>(Landroid/content/Context;)V

    .line 64
    .line 65
    .line 66
    check-cast v3, Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v4, v3, p2}, Lt/H;->a(Ljava/lang/String;I)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    new-instance v3, Lt/H;

    .line 73
    .line 74
    invoke-direct {v3, p1}, Lt/H;-><init>(Landroid/content/Context;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v3, v1, p2}, Lt/H;->a(Ljava/lang/String;I)V

    .line 78
    .line 79
    .line 80
    :cond_3
    :goto_0
    sget-object p2, Lcom/dexterous/flutterlocalnotifications/ActionBroadcastReceiver;->b:LZ2/s;

    .line 81
    .line 82
    if-nez p2, :cond_4

    .line 83
    .line 84
    new-instance p2, LZ2/s;

    .line 85
    .line 86
    const/4 v3, 0x4

    .line 87
    invoke-direct {p2, v3}, LZ2/s;-><init>(I)V

    .line 88
    .line 89
    .line 90
    sput-object p2, Lcom/dexterous/flutterlocalnotifications/ActionBroadcastReceiver;->b:LZ2/s;

    .line 91
    .line 92
    :cond_4
    sget-object p2, Lcom/dexterous/flutterlocalnotifications/ActionBroadcastReceiver;->b:LZ2/s;

    .line 93
    .line 94
    iget-object v3, p2, LZ2/s;->g:Ljava/lang/Object;

    .line 95
    .line 96
    check-cast v3, Lk3/g;

    .line 97
    .line 98
    if-eqz v3, :cond_5

    .line 99
    .line 100
    invoke-virtual {v3, v0}, Lk3/g;->a(Ljava/util/Map;)V

    .line 101
    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_5
    iget-object p2, p2, LZ2/s;->f:Ljava/lang/Object;

    .line 105
    .line 106
    check-cast p2, Ljava/util/ArrayList;

    .line 107
    .line 108
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    :goto_1
    sget-object p2, Lcom/dexterous/flutterlocalnotifications/ActionBroadcastReceiver;->c:La3/c;

    .line 112
    .line 113
    const-string v0, "ActionBroadcastReceiver"

    .line 114
    .line 115
    if-eqz p2, :cond_6

    .line 116
    .line 117
    const-string p1, "Engine is already initialised"

    .line 118
    .line 119
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_6
    invoke-static {}, LB2/a;->J()LB2/a;

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    iget-object p2, p2, LB2/a;->f:Ljava/lang/Object;

    .line 128
    .line 129
    check-cast p2, Le3/e;

    .line 130
    .line 131
    invoke-virtual {p2, p1}, Le3/e;->d(Landroid/content/Context;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p2, p1, v1}, Le3/e;->a(Landroid/content/Context;[Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    new-instance v3, La3/c;

    .line 138
    .line 139
    invoke-direct {v3, p1, v1}, La3/c;-><init>(Landroid/content/Context;[Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    sput-object v3, Lcom/dexterous/flutterlocalnotifications/ActionBroadcastReceiver;->c:La3/c;

    .line 143
    .line 144
    iget-object v3, p0, Lcom/dexterous/flutterlocalnotifications/ActionBroadcastReceiver;->a:LT0/b;

    .line 145
    .line 146
    iget-object v3, v3, LT0/b;->a:Landroid/content/Context;

    .line 147
    .line 148
    const-string v4, "flutter_local_notifications_plugin"

    .line 149
    .line 150
    invoke-virtual {v3, v4, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    const-string v3, "com.dexterous.flutterlocalnotifications.CALLBACK_DISPATCHER_HANDLE_KEY"

    .line 155
    .line 156
    const-wide/16 v4, -0x1

    .line 157
    .line 158
    invoke-interface {v2, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 159
    .line 160
    .line 161
    move-result-wide v2

    .line 162
    invoke-static {v2, v3}, Lio/flutter/view/FlutterCallbackInformation;->lookupCallbackInformation(J)Lio/flutter/view/FlutterCallbackInformation;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    if-nez v2, :cond_7

    .line 167
    .line 168
    const-string p1, "Callback information could not be retrieved"

    .line 169
    .line 170
    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_7
    sget-object v0, Lcom/dexterous/flutterlocalnotifications/ActionBroadcastReceiver;->c:La3/c;

    .line 175
    .line 176
    iget-object v0, v0, La3/c;->c:Lb3/b;

    .line 177
    .line 178
    new-instance v3, LB2/a;

    .line 179
    .line 180
    iget-object v4, v0, Lb3/b;->i:LA0/c;

    .line 181
    .line 182
    invoke-direct {v3, v4}, LB2/a;-><init>(LA0/c;)V

    .line 183
    .line 184
    .line 185
    sget-object v4, Lcom/dexterous/flutterlocalnotifications/ActionBroadcastReceiver;->b:LZ2/s;

    .line 186
    .line 187
    iget-object v5, v3, LB2/a;->g:Ljava/lang/Object;

    .line 188
    .line 189
    check-cast v5, Ljava/lang/String;

    .line 190
    .line 191
    iget-object v6, v3, LB2/a;->f:Ljava/lang/Object;

    .line 192
    .line 193
    check-cast v6, Lk3/f;

    .line 194
    .line 195
    if-nez v4, :cond_8

    .line 196
    .line 197
    goto :goto_2

    .line 198
    :cond_8
    new-instance v1, LB2/a;

    .line 199
    .line 200
    invoke-direct {v1, v3, v4}, LB2/a;-><init>(LB2/a;LZ2/s;)V

    .line 201
    .line 202
    .line 203
    :goto_2
    invoke-interface {v6, v5, v1}, Lk3/f;->m(Ljava/lang/String;Lk3/d;)V

    .line 204
    .line 205
    .line 206
    iget-object p2, p2, Le3/e;->d:LV1/q;

    .line 207
    .line 208
    iget-object p2, p2, LV1/q;->c:Ljava/lang/Object;

    .line 209
    .line 210
    check-cast p2, Ljava/lang/String;

    .line 211
    .line 212
    new-instance v1, LB2/a;

    .line 213
    .line 214
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    const/16 v3, 0x12

    .line 219
    .line 220
    invoke-direct {v1, p1, p2, v2, v3}, LB2/a;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {v0, v1}, Lb3/b;->a(LB2/a;)V

    .line 224
    .line 225
    .line 226
    return-void
.end method
