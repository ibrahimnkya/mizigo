.class public final synthetic Lq3/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Ljava/util/Map;

.field public final synthetic g:Li1/i;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Map;Li1/i;I)V
    .locals 0

    .line 1
    iput p3, p0, Lq3/c;->e:I

    iput-object p1, p0, Lq3/c;->f:Ljava/util/Map;

    iput-object p2, p0, Lq3/c;->g:Li1/i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lq3/e;Ljava/util/Map;Li1/i;)V
    .locals 0

    .line 2
    const/4 p1, 0x2

    iput p1, p0, Lq3/c;->e:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lq3/c;->f:Ljava/util/Map;

    iput-object p3, p0, Lq3/c;->g:Li1/i;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget v0, p0, Lq3/c;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lq3/c;->f:Ljava/util/Map;

    .line 7
    .line 8
    iget-object v1, p0, Lq3/c;->g:Li1/i;

    .line 9
    .line 10
    :try_start_0
    invoke-static {}, Lcom/google/firebase/messaging/FirebaseMessaging;->c()Lcom/google/firebase/messaging/FirebaseMessaging;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-static {v0}, LT0/a;->y(Ljava/util/Map;)LV1/x;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v2, v0}, Lcom/google/firebase/messaging/FirebaseMessaging;->h(LV1/x;)V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {v1, v0}, Li1/i;->b(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catch_0
    move-exception v0

    .line 27
    invoke-virtual {v1, v0}, Li1/i;->a(Ljava/lang/Exception;)V

    .line 28
    .line 29
    .line 30
    :goto_0
    return-void

    .line 31
    :pswitch_0
    iget-object v0, p0, Lq3/c;->f:Ljava/util/Map;

    .line 32
    .line 33
    iget-object v1, p0, Lq3/c;->g:Li1/i;

    .line 34
    .line 35
    :try_start_1
    invoke-static {}, Lcom/google/firebase/messaging/FirebaseMessaging;->c()Lcom/google/firebase/messaging/FirebaseMessaging;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    const-string v3, "topic"

    .line 40
    .line 41
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    check-cast v0, Ljava/lang/String;

    .line 49
    .line 50
    iget-object v2, v2, Lcom/google/firebase/messaging/FirebaseMessaging;->h:Li1/p;

    .line 51
    .line 52
    new-instance v3, LV1/n;

    .line 53
    .line 54
    const/4 v4, 0x0

    .line 55
    invoke-direct {v3, v0, v4}, LV1/n;-><init>(Ljava/lang/String;I)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 59
    .line 60
    .line 61
    sget-object v0, Li1/j;->a:Li1/o;

    .line 62
    .line 63
    new-instance v4, Li1/p;

    .line 64
    .line 65
    invoke-direct {v4}, Li1/p;-><init>()V

    .line 66
    .line 67
    .line 68
    new-instance v5, Li1/l;

    .line 69
    .line 70
    invoke-direct {v5, v0, v3, v4}, Li1/l;-><init>(Ljava/util/concurrent/Executor;Li1/g;Li1/p;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, v2, Li1/p;->b:LM0/t;

    .line 74
    .line 75
    invoke-virtual {v0, v5}, LM0/t;->d(Li1/m;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2}, Li1/p;->o()V

    .line 79
    .line 80
    .line 81
    invoke-static {v4}, LV0/g;->a(Li1/h;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    const/4 v0, 0x0

    .line 85
    invoke-virtual {v1, v0}, Li1/i;->b(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :catch_1
    move-exception v0

    .line 90
    invoke-virtual {v1, v0}, Li1/i;->a(Ljava/lang/Exception;)V

    .line 91
    .line 92
    .line 93
    :goto_1
    return-void

    .line 94
    :pswitch_1
    iget-object v0, p0, Lq3/c;->f:Ljava/util/Map;

    .line 95
    .line 96
    iget-object v1, p0, Lq3/c;->g:Li1/i;

    .line 97
    .line 98
    :try_start_2
    invoke-static {}, Lcom/google/firebase/messaging/FirebaseMessaging;->c()Lcom/google/firebase/messaging/FirebaseMessaging;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    const-string v3, "enabled"

    .line 103
    .line 104
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    check-cast v0, Ljava/lang/Boolean;

    .line 112
    .line 113
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    invoke-virtual {v2, v0}, Lcom/google/firebase/messaging/FirebaseMessaging;->i(Z)V

    .line 118
    .line 119
    .line 120
    new-instance v0, LZ2/z;

    .line 121
    .line 122
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 123
    .line 124
    .line 125
    const-string v3, "isAutoInitEnabled"

    .line 126
    .line 127
    iget-object v2, v2, Lcom/google/firebase/messaging/FirebaseMessaging;->e:LV1/q;

    .line 128
    .line 129
    invoke-virtual {v2}, LV1/q;->b()Z

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    invoke-virtual {v0, v3, v2}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v1, v0}, Li1/i;->b(Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 141
    .line 142
    .line 143
    goto :goto_2

    .line 144
    :catch_2
    move-exception v0

    .line 145
    invoke-virtual {v1, v0}, Li1/i;->a(Ljava/lang/Exception;)V

    .line 146
    .line 147
    .line 148
    :goto_2
    return-void

    .line 149
    :pswitch_2
    iget-object v0, p0, Lq3/c;->f:Ljava/util/Map;

    .line 150
    .line 151
    iget-object v1, p0, Lq3/c;->g:Li1/i;

    .line 152
    .line 153
    :try_start_3
    invoke-static {}, Lcom/google/firebase/messaging/FirebaseMessaging;->c()Lcom/google/firebase/messaging/FirebaseMessaging;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    const-string v3, "enabled"

    .line 158
    .line 159
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    check-cast v0, Ljava/lang/Boolean;

    .line 167
    .line 168
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 173
    .line 174
    .line 175
    invoke-static {}, LA1/g;->d()LA1/g;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    invoke-virtual {v3}, LA1/g;->a()V

    .line 180
    .line 181
    .line 182
    iget-object v3, v3, LA1/g;->a:Landroid/content/Context;

    .line 183
    .line 184
    const-string v4, "com.google.firebase.messaging"

    .line 185
    .line 186
    const/4 v5, 0x0

    .line 187
    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 188
    .line 189
    .line 190
    move-result-object v3

    .line 191
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 192
    .line 193
    .line 194
    move-result-object v3

    .line 195
    const-string v4, "export_to_big_query"

    .line 196
    .line 197
    invoke-interface {v3, v4, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 202
    .line 203
    .line 204
    iget-object v0, v2, Lcom/google/firebase/messaging/FirebaseMessaging;->b:Landroid/content/Context;

    .line 205
    .line 206
    iget-object v3, v2, Lcom/google/firebase/messaging/FirebaseMessaging;->c:LD1/x;

    .line 207
    .line 208
    invoke-virtual {v2}, Lcom/google/firebase/messaging/FirebaseMessaging;->j()Z

    .line 209
    .line 210
    .line 211
    move-result v2

    .line 212
    invoke-static {v0, v3, v2}, Ld1/d;->z(Landroid/content/Context;LD1/x;Z)V

    .line 213
    .line 214
    .line 215
    const/4 v0, 0x0

    .line 216
    invoke-virtual {v1, v0}, Li1/i;->b(Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 217
    .line 218
    .line 219
    goto :goto_3

    .line 220
    :catch_3
    move-exception v0

    .line 221
    invoke-virtual {v1, v0}, Li1/i;->a(Ljava/lang/Exception;)V

    .line 222
    .line 223
    .line 224
    :goto_3
    return-void

    .line 225
    :pswitch_3
    iget-object v0, p0, Lq3/c;->f:Ljava/util/Map;

    .line 226
    .line 227
    iget-object v1, p0, Lq3/c;->g:Li1/i;

    .line 228
    .line 229
    :try_start_4
    invoke-static {}, Lcom/google/firebase/messaging/FirebaseMessaging;->c()Lcom/google/firebase/messaging/FirebaseMessaging;

    .line 230
    .line 231
    .line 232
    move-result-object v2

    .line 233
    const-string v3, "topic"

    .line 234
    .line 235
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    .line 241
    .line 242
    check-cast v0, Ljava/lang/String;

    .line 243
    .line 244
    iget-object v2, v2, Lcom/google/firebase/messaging/FirebaseMessaging;->h:Li1/p;

    .line 245
    .line 246
    new-instance v3, LV1/n;

    .line 247
    .line 248
    const/4 v4, 0x1

    .line 249
    invoke-direct {v3, v0, v4}, LV1/n;-><init>(Ljava/lang/String;I)V

    .line 250
    .line 251
    .line 252
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 253
    .line 254
    .line 255
    sget-object v0, Li1/j;->a:Li1/o;

    .line 256
    .line 257
    new-instance v4, Li1/p;

    .line 258
    .line 259
    invoke-direct {v4}, Li1/p;-><init>()V

    .line 260
    .line 261
    .line 262
    new-instance v5, Li1/l;

    .line 263
    .line 264
    invoke-direct {v5, v0, v3, v4}, Li1/l;-><init>(Ljava/util/concurrent/Executor;Li1/g;Li1/p;)V

    .line 265
    .line 266
    .line 267
    iget-object v0, v2, Li1/p;->b:LM0/t;

    .line 268
    .line 269
    invoke-virtual {v0, v5}, LM0/t;->d(Li1/m;)V

    .line 270
    .line 271
    .line 272
    invoke-virtual {v2}, Li1/p;->o()V

    .line 273
    .line 274
    .line 275
    invoke-static {v4}, LV0/g;->a(Li1/h;)Ljava/lang/Object;

    .line 276
    .line 277
    .line 278
    const/4 v0, 0x0

    .line 279
    invoke-virtual {v1, v0}, Li1/i;->b(Ljava/lang/Object;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    .line 280
    .line 281
    .line 282
    goto :goto_4

    .line 283
    :catch_4
    move-exception v0

    .line 284
    invoke-virtual {v1, v0}, Li1/i;->a(Ljava/lang/Exception;)V

    .line 285
    .line 286
    .line 287
    :goto_4
    return-void

    .line 288
    nop

    .line 289
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
