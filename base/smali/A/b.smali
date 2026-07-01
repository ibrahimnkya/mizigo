.class public final LA/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:I

.field public final f:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, LA/b;->e:I

    iput-object p2, p0, LA/b;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(LM0/g;LM0/w;)V
    .locals 0

    const/4 p1, 0x5

    iput p1, p0, LA/b;->e:I

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, LA/b;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lio/flutter/plugin/editing/j;I)V
    .locals 0

    const/4 p2, 0x0

    iput p2, p0, LA/b;->e:I

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LA/b;->f:Ljava/lang/Object;

    return-void
.end method

.method private final a()V
    .locals 5

    .line 1
    iget-object v0, p0, LA/b;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lh1/a;

    .line 4
    .line 5
    iget-object v1, v0, Lh1/a;->a:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v1

    .line 8
    :try_start_0
    invoke-virtual {v0}, Lh1/a;->b()Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    monitor-exit v1

    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string v2, "WakeLock"

    .line 19
    .line 20
    iget-object v3, v0, Lh1/a;->j:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    const-string v4, " ** IS FORCE-RELEASED ON TIMEOUT **"

    .line 27
    .line 28
    invoke-virtual {v3, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Lh1/a;->d()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Lh1/a;->b()Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-nez v2, :cond_1

    .line 43
    .line 44
    monitor-exit v1

    .line 45
    return-void

    .line 46
    :cond_1
    const/4 v2, 0x1

    .line 47
    iput v2, v0, Lh1/a;->c:I

    .line 48
    .line 49
    invoke-virtual {v0}, Lh1/a;->e()V

    .line 50
    .line 51
    .line 52
    monitor-exit v1

    .line 53
    return-void

    .line 54
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    throw v0
.end method

.method private final b()V
    .locals 2

    .line 1
    iget-object v0, p0, LA/b;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Li1/l;

    .line 4
    .line 5
    iget-object v0, v0, Li1/l;->g:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, LA/b;->f:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v1, Li1/l;

    .line 11
    .line 12
    iget-object v1, v1, Li1/l;->h:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v1, Li1/b;

    .line 15
    .line 16
    invoke-interface {v1}, Li1/b;->a()V

    .line 17
    .line 18
    .line 19
    monitor-exit v0

    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception v1

    .line 22
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw v1
.end method


# virtual methods
.method public final run()V
    .locals 19

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget v0, v1, LA/b;->e:I

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    const/4 v4, 0x1

    .line 8
    const/4 v5, 0x0

    .line 9
    const/4 v6, 0x0

    .line 10
    packed-switch v0, :pswitch_data_0

    .line 11
    .line 12
    .line 13
    :goto_0
    iget-object v0, v1, LA/b;->f:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, Lm/x0;

    .line 16
    .line 17
    iget-object v0, v0, Lm/x0;->h:Ljava/lang/Object;

    .line 18
    .line 19
    move-object v7, v0

    .line 20
    check-cast v7, Lio/flutter/plugins/firebase/messaging/a;

    .line 21
    .line 22
    iget-object v0, v7, Lio/flutter/plugins/firebase/messaging/a;->e:Lq3/k;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    iget-object v8, v0, Lq3/k;->b:Ljava/lang/Object;

    .line 27
    .line 28
    monitor-enter v8

    .line 29
    :try_start_0
    iget-object v9, v0, Lq3/k;->c:Landroid/app/job/JobParameters;

    .line 30
    .line 31
    if-nez v9, :cond_1

    .line 32
    .line 33
    monitor-exit v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    :cond_0
    :goto_1
    move-object v8, v5

    .line 35
    goto :goto_2

    .line 36
    :catchall_0
    move-exception v0

    .line 37
    goto :goto_3

    .line 38
    :cond_1
    :try_start_1
    invoke-static {v9}, Lio/flutter/plugin/editing/i;->a(Landroid/app/job/JobParameters;)Landroid/app/job/JobWorkItem;

    .line 39
    .line 40
    .line 41
    move-result-object v9
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    :try_start_2
    monitor-exit v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 43
    if-eqz v9, :cond_0

    .line 44
    .line 45
    invoke-static {v9}, Lio/flutter/plugin/editing/i;->c(Landroid/app/job/JobWorkItem;)Landroid/content/Intent;

    .line 46
    .line 47
    .line 48
    move-result-object v8

    .line 49
    iget-object v10, v0, Lq3/k;->a:Lio/flutter/plugins/firebase/messaging/a;

    .line 50
    .line 51
    invoke-virtual {v10}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 52
    .line 53
    .line 54
    move-result-object v10

    .line 55
    invoke-virtual {v8, v10}, Landroid/content/Intent;->setExtrasClassLoader(Ljava/lang/ClassLoader;)V

    .line 56
    .line 57
    .line 58
    new-instance v8, Lq3/j;

    .line 59
    .line 60
    invoke-direct {v8, v0, v9}, Lq3/j;-><init>(Lq3/k;Landroid/app/job/JobWorkItem;)V

    .line 61
    .line 62
    .line 63
    goto :goto_2

    .line 64
    :catch_0
    move-exception v0

    .line 65
    :try_start_3
    const-string v9, "JobServiceEngineImpl"

    .line 66
    .line 67
    const-string v10, "Failed to run mParams.dequeueWork()!"

    .line 68
    .line 69
    invoke-static {v9, v10, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 70
    .line 71
    .line 72
    monitor-exit v8

    .line 73
    goto :goto_1

    .line 74
    :goto_2
    if-eqz v8, :cond_2

    .line 75
    .line 76
    goto :goto_4

    .line 77
    :goto_3
    monitor-exit v8
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 78
    throw v0

    .line 79
    :cond_2
    iget-object v8, v7, Lio/flutter/plugins/firebase/messaging/a;->i:Ljava/util/ArrayList;

    .line 80
    .line 81
    monitor-enter v8

    .line 82
    :try_start_4
    iget-object v0, v7, Lio/flutter/plugins/firebase/messaging/a;->i:Ljava/util/ArrayList;

    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-lez v0, :cond_3

    .line 89
    .line 90
    iget-object v0, v7, Lio/flutter/plugins/firebase/messaging/a;->i:Ljava/util/ArrayList;

    .line 91
    .line 92
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    check-cast v0, Lq3/i;

    .line 97
    .line 98
    monitor-exit v8

    .line 99
    move-object v8, v0

    .line 100
    goto :goto_4

    .line 101
    :catchall_1
    move-exception v0

    .line 102
    goto/16 :goto_7

    .line 103
    .line 104
    :cond_3
    monitor-exit v8
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 105
    move-object v8, v5

    .line 106
    :goto_4
    if-eqz v8, :cond_6

    .line 107
    .line 108
    iget-object v0, v1, LA/b;->f:Ljava/lang/Object;

    .line 109
    .line 110
    check-cast v0, Lm/x0;

    .line 111
    .line 112
    iget-object v0, v0, Lm/x0;->h:Ljava/lang/Object;

    .line 113
    .line 114
    check-cast v0, Lio/flutter/plugins/firebase/messaging/a;

    .line 115
    .line 116
    invoke-interface {v8}, Lq3/i;->getIntent()Landroid/content/Intent;

    .line 117
    .line 118
    .line 119
    move-result-object v7

    .line 120
    check-cast v0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;

    .line 121
    .line 122
    sget-object v9, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;->m:Lm/x0;

    .line 123
    .line 124
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 125
    .line 126
    .line 127
    sget-object v9, Ld1/d;->a:Landroid/content/Context;

    .line 128
    .line 129
    const-string v10, "io.flutter.firebase.messaging.callback"

    .line 130
    .line 131
    invoke-virtual {v9, v10, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 132
    .line 133
    .line 134
    move-result-object v9

    .line 135
    const-string v10, "callback_handle"

    .line 136
    .line 137
    invoke-interface {v9, v10, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 138
    .line 139
    .line 140
    move-result-wide v9

    .line 141
    cmp-long v9, v9, v2

    .line 142
    .line 143
    if-eqz v9, :cond_5

    .line 144
    .line 145
    sget-object v9, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;->l:Ljava/util/List;

    .line 146
    .line 147
    monitor-enter v9

    .line 148
    :try_start_5
    sget-object v10, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;->m:Lm/x0;

    .line 149
    .line 150
    iget-object v10, v10, Lm/x0;->f:Ljava/lang/Object;

    .line 151
    .line 152
    check-cast v10, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 153
    .line 154
    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 155
    .line 156
    .line 157
    move-result v10

    .line 158
    if-nez v10, :cond_4

    .line 159
    .line 160
    const-string v0, "FLTFireMsgService"

    .line 161
    .line 162
    const-string v10, "Service has not yet started, messages will be queued."

    .line 163
    .line 164
    invoke-static {v0, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    .line 166
    .line 167
    invoke-interface {v9, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    monitor-exit v9

    .line 171
    goto :goto_6

    .line 172
    :catchall_2
    move-exception v0

    .line 173
    goto :goto_5

    .line 174
    :cond_4
    monitor-exit v9
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 175
    new-instance v9, Ljava/util/concurrent/CountDownLatch;

    .line 176
    .line 177
    invoke-direct {v9, v4}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 178
    .line 179
    .line 180
    new-instance v10, Landroid/os/Handler;

    .line 181
    .line 182
    invoke-virtual {v0}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-direct {v10, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 187
    .line 188
    .line 189
    new-instance v0, LD1/h;

    .line 190
    .line 191
    const/16 v11, 0xe

    .line 192
    .line 193
    invoke-direct {v0, v11, v7, v9}, LD1/h;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {v10, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 197
    .line 198
    .line 199
    :try_start_6
    invoke-virtual {v9}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_6
    .catch Ljava/lang/InterruptedException; {:try_start_6 .. :try_end_6} :catch_1

    .line 200
    .line 201
    .line 202
    goto :goto_6

    .line 203
    :catch_1
    move-exception v0

    .line 204
    const-string v7, "FLTFireMsgService"

    .line 205
    .line 206
    const-string v9, "Exception waiting to execute Dart callback"

    .line 207
    .line 208
    invoke-static {v7, v9, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 209
    .line 210
    .line 211
    goto :goto_6

    .line 212
    :goto_5
    :try_start_7
    monitor-exit v9
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 213
    throw v0

    .line 214
    :cond_5
    const-string v0, "FLTFireMsgService"

    .line 215
    .line 216
    const-string v7, "A background message could not be handled in Dart as no onBackgroundMessage handler has been registered."

    .line 217
    .line 218
    invoke-static {v0, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    .line 220
    .line 221
    :goto_6
    invoke-interface {v8}, Lq3/i;->a()V

    .line 222
    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :cond_6
    iget-object v0, v1, LA/b;->f:Ljava/lang/Object;

    .line 227
    .line 228
    check-cast v0, Lm/x0;

    .line 229
    .line 230
    iget-object v0, v0, Lm/x0;->g:Ljava/lang/Object;

    .line 231
    .line 232
    check-cast v0, Landroid/os/Handler;

    .line 233
    .line 234
    new-instance v2, LA/b;

    .line 235
    .line 236
    const/16 v3, 0x11

    .line 237
    .line 238
    invoke-direct {v2, v3, v1}, LA/b;-><init>(ILjava/lang/Object;)V

    .line 239
    .line 240
    .line 241
    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 242
    .line 243
    .line 244
    return-void

    .line 245
    :goto_7
    :try_start_8
    monitor-exit v8
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 246
    throw v0

    .line 247
    :pswitch_0
    iget-object v0, v1, LA/b;->f:Ljava/lang/Object;

    .line 248
    .line 249
    check-cast v0, LA/b;

    .line 250
    .line 251
    iget-object v0, v0, LA/b;->f:Ljava/lang/Object;

    .line 252
    .line 253
    check-cast v0, Lm/x0;

    .line 254
    .line 255
    iget-object v0, v0, Lm/x0;->h:Ljava/lang/Object;

    .line 256
    .line 257
    check-cast v0, Lio/flutter/plugins/firebase/messaging/a;

    .line 258
    .line 259
    invoke-virtual {v0}, Lio/flutter/plugins/firebase/messaging/a;->c()V

    .line 260
    .line 261
    .line 262
    return-void

    .line 263
    :pswitch_1
    iget-object v0, v1, LA/b;->f:Ljava/lang/Object;

    .line 264
    .line 265
    check-cast v0, Landroidx/appcompat/widget/Toolbar;

    .line 266
    .line 267
    iget-object v0, v0, Landroidx/appcompat/widget/Toolbar;->e:Landroidx/appcompat/widget/ActionMenuView;

    .line 268
    .line 269
    if-eqz v0, :cond_7

    .line 270
    .line 271
    iget-object v0, v0, Landroidx/appcompat/widget/ActionMenuView;->w:Lm/j;

    .line 272
    .line 273
    if-eqz v0, :cond_7

    .line 274
    .line 275
    invoke-virtual {v0}, Lm/j;->k()Z

    .line 276
    .line 277
    .line 278
    :cond_7
    return-void

    .line 279
    :pswitch_2
    iget-object v0, v1, LA/b;->f:Ljava/lang/Object;

    .line 280
    .line 281
    check-cast v0, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    .line 282
    .line 283
    iget-boolean v2, v0, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;->j:Z

    .line 284
    .line 285
    if-eqz v2, :cond_8

    .line 286
    .line 287
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 288
    .line 289
    .line 290
    move-result-object v2

    .line 291
    const-string v3, "input_method"

    .line 292
    .line 293
    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    move-result-object v2

    .line 297
    check-cast v2, Landroid/view/inputmethod/InputMethodManager;

    .line 298
    .line 299
    invoke-virtual {v2, v0, v6}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 300
    .line 301
    .line 302
    iput-boolean v6, v0, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;->j:Z

    .line 303
    .line 304
    :cond_8
    return-void

    .line 305
    :pswitch_3
    iget-object v0, v1, LA/b;->f:Ljava/lang/Object;

    .line 306
    .line 307
    check-cast v0, Lm/V;

    .line 308
    .line 309
    iput-object v5, v0, Lm/V;->p:LA/b;

    .line 310
    .line 311
    invoke-virtual {v0}, Lm/V;->drawableStateChanged()V

    .line 312
    .line 313
    .line 314
    return-void

    .line 315
    :pswitch_4
    iget-object v0, v1, LA/b;->f:Ljava/lang/Object;

    .line 316
    .line 317
    check-cast v0, Ll2/b;

    .line 318
    .line 319
    iget-object v2, v0, Ll2/b;->f:LB2/a;

    .line 320
    .line 321
    if-eqz v2, :cond_9

    .line 322
    .line 323
    iget-object v3, v2, LB2/a;->f:Ljava/lang/Object;

    .line 324
    .line 325
    check-cast v3, Ld1/g;

    .line 326
    .line 327
    :try_start_9
    new-instance v4, Lc1/h;

    .line 328
    .line 329
    invoke-direct {v4, v2, v0}, Lc1/h;-><init>(LB2/a;Lc1/b;)V

    .line 330
    .line 331
    .line 332
    invoke-virtual {v3}, LY0/a;->c()Landroid/os/Parcel;

    .line 333
    .line 334
    .line 335
    move-result-object v5

    .line 336
    invoke-static {v5, v4}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 337
    .line 338
    .line 339
    const/16 v4, 0x20

    .line 340
    .line 341
    invoke-virtual {v3, v5, v4}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_9
    .catch Landroid/os/RemoteException; {:try_start_9 .. :try_end_9} :catch_6

    .line 342
    .line 343
    .line 344
    :try_start_a
    new-instance v4, Lc1/h;

    .line 345
    .line 346
    invoke-direct {v4, v2, v0}, Lc1/h;-><init>(LB2/a;Lc1/c;)V

    .line 347
    .line 348
    .line 349
    invoke-virtual {v3}, LY0/a;->c()Landroid/os/Parcel;

    .line 350
    .line 351
    .line 352
    move-result-object v5

    .line 353
    invoke-static {v5, v4}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 354
    .line 355
    .line 356
    const/16 v4, 0x54

    .line 357
    .line 358
    invoke-virtual {v3, v5, v4}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_a
    .catch Landroid/os/RemoteException; {:try_start_a .. :try_end_a} :catch_5

    .line 359
    .line 360
    .line 361
    :try_start_b
    new-instance v4, Lc1/h;

    .line 362
    .line 363
    invoke-direct {v4, v2, v0}, Lc1/h;-><init>(LB2/a;Lc1/d;)V

    .line 364
    .line 365
    .line 366
    invoke-virtual {v3}, LY0/a;->c()Landroid/os/Parcel;

    .line 367
    .line 368
    .line 369
    move-result-object v5

    .line 370
    invoke-static {v5, v4}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 371
    .line 372
    .line 373
    const/16 v4, 0x1e

    .line 374
    .line 375
    invoke-virtual {v3, v5, v4}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_b
    .catch Landroid/os/RemoteException; {:try_start_b .. :try_end_b} :catch_4

    .line 376
    .line 377
    .line 378
    :try_start_c
    new-instance v4, Lc1/h;

    .line 379
    .line 380
    invoke-direct {v4, v2, v0}, Lc1/h;-><init>(LB2/a;Lc1/e;)V

    .line 381
    .line 382
    .line 383
    invoke-virtual {v3}, LY0/a;->c()Landroid/os/Parcel;

    .line 384
    .line 385
    .line 386
    move-result-object v5

    .line 387
    invoke-static {v5, v4}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 388
    .line 389
    .line 390
    const/16 v4, 0x1f

    .line 391
    .line 392
    invoke-virtual {v3, v5, v4}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_c
    .catch Landroid/os/RemoteException; {:try_start_c .. :try_end_c} :catch_3

    .line 393
    .line 394
    .line 395
    :try_start_d
    new-instance v4, Lc1/h;

    .line 396
    .line 397
    invoke-direct {v4, v2, v0}, Lc1/h;-><init>(LB2/a;Ll2/b;)V

    .line 398
    .line 399
    .line 400
    invoke-virtual {v3}, LY0/a;->c()Landroid/os/Parcel;

    .line 401
    .line 402
    .line 403
    move-result-object v0

    .line 404
    invoke-static {v0, v4}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 405
    .line 406
    .line 407
    const/16 v2, 0x21

    .line 408
    .line 409
    invoke-virtual {v3, v0, v2}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_d
    .catch Landroid/os/RemoteException; {:try_start_d .. :try_end_d} :catch_2

    .line 410
    .line 411
    .line 412
    goto :goto_8

    .line 413
    :catch_2
    move-exception v0

    .line 414
    new-instance v2, Le1/x;

    .line 415
    .line 416
    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 417
    .line 418
    .line 419
    throw v2

    .line 420
    :catch_3
    move-exception v0

    .line 421
    new-instance v2, Le1/x;

    .line 422
    .line 423
    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 424
    .line 425
    .line 426
    throw v2

    .line 427
    :catch_4
    move-exception v0

    .line 428
    new-instance v2, Le1/x;

    .line 429
    .line 430
    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 431
    .line 432
    .line 433
    throw v2

    .line 434
    :catch_5
    move-exception v0

    .line 435
    new-instance v2, Le1/x;

    .line 436
    .line 437
    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 438
    .line 439
    .line 440
    throw v2

    .line 441
    :catch_6
    move-exception v0

    .line 442
    new-instance v2, Le1/x;

    .line 443
    .line 444
    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 445
    .line 446
    .line 447
    throw v2

    .line 448
    :cond_9
    :goto_8
    return-void

    .line 449
    :pswitch_5
    invoke-direct {v1}, LA/b;->b()V

    .line 450
    .line 451
    .line 452
    return-void

    .line 453
    :pswitch_6
    invoke-direct {v1}, LA/b;->a()V

    .line 454
    .line 455
    .line 456
    return-void

    .line 457
    :pswitch_7
    iget-object v0, v1, LA/b;->f:Ljava/lang/Object;

    .line 458
    .line 459
    check-cast v0, Landroidx/lifecycle/v;

    .line 460
    .line 461
    iget-object v2, v0, Landroidx/lifecycle/v;->a:Ljava/lang/Object;

    .line 462
    .line 463
    monitor-enter v2

    .line 464
    :try_start_e
    iget-object v0, v1, LA/b;->f:Ljava/lang/Object;

    .line 465
    .line 466
    check-cast v0, Landroidx/lifecycle/v;

    .line 467
    .line 468
    iget-object v0, v0, Landroidx/lifecycle/v;->f:Ljava/lang/Object;

    .line 469
    .line 470
    iget-object v3, v1, LA/b;->f:Ljava/lang/Object;

    .line 471
    .line 472
    check-cast v3, Landroidx/lifecycle/v;

    .line 473
    .line 474
    sget-object v6, Landroidx/lifecycle/v;->k:Ljava/lang/Object;

    .line 475
    .line 476
    iput-object v6, v3, Landroidx/lifecycle/v;->f:Ljava/lang/Object;

    .line 477
    .line 478
    monitor-exit v2
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_3

    .line 479
    iget-object v2, v1, LA/b;->f:Ljava/lang/Object;

    .line 480
    .line 481
    check-cast v2, Landroidx/lifecycle/v;

    .line 482
    .line 483
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 484
    .line 485
    .line 486
    const-string v3, "setValue"

    .line 487
    .line 488
    invoke-static {v3}, Landroidx/lifecycle/v;->a(Ljava/lang/String;)V

    .line 489
    .line 490
    .line 491
    iget v3, v2, Landroidx/lifecycle/v;->g:I

    .line 492
    .line 493
    add-int/2addr v3, v4

    .line 494
    iput v3, v2, Landroidx/lifecycle/v;->g:I

    .line 495
    .line 496
    iput-object v0, v2, Landroidx/lifecycle/v;->e:Ljava/lang/Object;

    .line 497
    .line 498
    invoke-virtual {v2, v5}, Landroidx/lifecycle/v;->b(Landroidx/lifecycle/u;)V

    .line 499
    .line 500
    .line 501
    return-void

    .line 502
    :catchall_3
    move-exception v0

    .line 503
    :try_start_f
    monitor-exit v2
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_3

    .line 504
    throw v0

    .line 505
    :pswitch_8
    iget-object v0, v1, LA/b;->f:Ljava/lang/Object;

    .line 506
    .line 507
    check-cast v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    .line 508
    .line 509
    invoke-virtual {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->J()Z

    .line 510
    .line 511
    .line 512
    return-void

    .line 513
    :pswitch_9
    iget-object v0, v1, LA/b;->f:Ljava/lang/Object;

    .line 514
    .line 515
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 516
    .line 517
    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->H:LX/s;

    .line 518
    .line 519
    if-eqz v0, :cond_17

    .line 520
    .line 521
    check-cast v0, LX/c;

    .line 522
    .line 523
    iget-object v4, v0, LX/c;->e:Ljava/util/ArrayList;

    .line 524
    .line 525
    iget-object v7, v0, LX/c;->i:Ljava/util/ArrayList;

    .line 526
    .line 527
    iget-object v8, v0, LX/c;->k:Ljava/util/ArrayList;

    .line 528
    .line 529
    iget-object v9, v0, LX/c;->j:Ljava/util/ArrayList;

    .line 530
    .line 531
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    .line 532
    .line 533
    .line 534
    move-result v10

    .line 535
    iget-object v11, v0, LX/c;->g:Ljava/util/ArrayList;

    .line 536
    .line 537
    invoke-virtual {v11}, Ljava/util/ArrayList;->isEmpty()Z

    .line 538
    .line 539
    .line 540
    move-result v12

    .line 541
    iget-object v13, v0, LX/c;->h:Ljava/util/ArrayList;

    .line 542
    .line 543
    invoke-virtual {v13}, Ljava/util/ArrayList;->isEmpty()Z

    .line 544
    .line 545
    .line 546
    move-result v14

    .line 547
    iget-object v15, v0, LX/c;->f:Ljava/util/ArrayList;

    .line 548
    .line 549
    invoke-virtual {v15}, Ljava/util/ArrayList;->isEmpty()Z

    .line 550
    .line 551
    .line 552
    move-result v16

    .line 553
    if-eqz v10, :cond_a

    .line 554
    .line 555
    if-eqz v12, :cond_a

    .line 556
    .line 557
    if-eqz v16, :cond_a

    .line 558
    .line 559
    if-eqz v14, :cond_a

    .line 560
    .line 561
    goto/16 :goto_d

    .line 562
    .line 563
    :cond_a
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 564
    .line 565
    .line 566
    move-result-object v17

    .line 567
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    .line 568
    .line 569
    .line 570
    move-result v18

    .line 571
    if-nez v18, :cond_16

    .line 572
    .line 573
    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 574
    .line 575
    .line 576
    if-nez v12, :cond_d

    .line 577
    .line 578
    new-instance v4, Ljava/util/ArrayList;

    .line 579
    .line 580
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 581
    .line 582
    .line 583
    invoke-virtual {v4, v11}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 584
    .line 585
    .line 586
    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 587
    .line 588
    .line 589
    invoke-virtual {v11}, Ljava/util/ArrayList;->clear()V

    .line 590
    .line 591
    .line 592
    if-eqz v10, :cond_c

    .line 593
    .line 594
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 595
    .line 596
    .line 597
    move-result-object v11

    .line 598
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    .line 599
    .line 600
    .line 601
    move-result v17

    .line 602
    if-nez v17, :cond_b

    .line 603
    .line 604
    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 605
    .line 606
    .line 607
    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 608
    .line 609
    .line 610
    goto :goto_9

    .line 611
    :cond_b
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 612
    .line 613
    .line 614
    move-result-object v0

    .line 615
    invoke-static {v0}, LE1/j;->n(Ljava/lang/Object;)V

    .line 616
    .line 617
    .line 618
    throw v5

    .line 619
    :cond_c
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 620
    .line 621
    .line 622
    move-result-object v0

    .line 623
    invoke-static {v0}, LE1/j;->n(Ljava/lang/Object;)V

    .line 624
    .line 625
    .line 626
    throw v5

    .line 627
    :cond_d
    :goto_9
    if-nez v14, :cond_10

    .line 628
    .line 629
    new-instance v4, Ljava/util/ArrayList;

    .line 630
    .line 631
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 632
    .line 633
    .line 634
    invoke-virtual {v4, v13}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 635
    .line 636
    .line 637
    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 638
    .line 639
    .line 640
    invoke-virtual {v13}, Ljava/util/ArrayList;->clear()V

    .line 641
    .line 642
    .line 643
    if-eqz v10, :cond_f

    .line 644
    .line 645
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 646
    .line 647
    .line 648
    move-result v9

    .line 649
    if-gtz v9, :cond_e

    .line 650
    .line 651
    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 652
    .line 653
    .line 654
    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 655
    .line 656
    .line 657
    goto :goto_a

    .line 658
    :cond_e
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 659
    .line 660
    .line 661
    move-result-object v0

    .line 662
    invoke-static {v0}, LE1/j;->n(Ljava/lang/Object;)V

    .line 663
    .line 664
    .line 665
    throw v5

    .line 666
    :cond_f
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 667
    .line 668
    .line 669
    move-result-object v0

    .line 670
    invoke-static {v0}, LE1/j;->n(Ljava/lang/Object;)V

    .line 671
    .line 672
    .line 673
    throw v5

    .line 674
    :cond_10
    :goto_a
    if-nez v16, :cond_17

    .line 675
    .line 676
    new-instance v4, Ljava/util/ArrayList;

    .line 677
    .line 678
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 679
    .line 680
    .line 681
    invoke-virtual {v4, v15}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 682
    .line 683
    .line 684
    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 685
    .line 686
    .line 687
    invoke-virtual {v15}, Ljava/util/ArrayList;->clear()V

    .line 688
    .line 689
    .line 690
    if-eqz v10, :cond_13

    .line 691
    .line 692
    if-eqz v12, :cond_13

    .line 693
    .line 694
    if-nez v14, :cond_11

    .line 695
    .line 696
    goto :goto_b

    .line 697
    :cond_11
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 698
    .line 699
    .line 700
    move-result-object v0

    .line 701
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 702
    .line 703
    .line 704
    move-result v2

    .line 705
    if-nez v2, :cond_12

    .line 706
    .line 707
    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 708
    .line 709
    .line 710
    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 711
    .line 712
    .line 713
    goto :goto_d

    .line 714
    :cond_12
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 715
    .line 716
    .line 717
    move-result-object v0

    .line 718
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 719
    .line 720
    .line 721
    new-instance v0, Ljava/lang/ClassCastException;

    .line 722
    .line 723
    invoke-direct {v0}, Ljava/lang/ClassCastException;-><init>()V

    .line 724
    .line 725
    .line 726
    throw v0

    .line 727
    :cond_13
    :goto_b
    if-nez v12, :cond_14

    .line 728
    .line 729
    iget-wide v7, v0, LX/s;->c:J

    .line 730
    .line 731
    goto :goto_c

    .line 732
    :cond_14
    move-wide v7, v2

    .line 733
    :goto_c
    if-nez v14, :cond_15

    .line 734
    .line 735
    iget-wide v2, v0, LX/s;->d:J

    .line 736
    .line 737
    :cond_15
    invoke-static {v7, v8, v2, v3}, Ljava/lang/Math;->max(JJ)J

    .line 738
    .line 739
    .line 740
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 741
    .line 742
    .line 743
    move-result-object v0

    .line 744
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 745
    .line 746
    .line 747
    new-instance v0, Ljava/lang/ClassCastException;

    .line 748
    .line 749
    invoke-direct {v0}, Ljava/lang/ClassCastException;-><init>()V

    .line 750
    .line 751
    .line 752
    throw v0

    .line 753
    :cond_16
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 754
    .line 755
    .line 756
    move-result-object v0

    .line 757
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 758
    .line 759
    .line 760
    new-instance v0, Ljava/lang/ClassCastException;

    .line 761
    .line 762
    invoke-direct {v0}, Ljava/lang/ClassCastException;-><init>()V

    .line 763
    .line 764
    .line 765
    throw v0

    .line 766
    :cond_17
    :goto_d
    return-void

    .line 767
    :pswitch_a
    iget-object v0, v1, LA/b;->f:Ljava/lang/Object;

    .line 768
    .line 769
    check-cast v0, LX/g;

    .line 770
    .line 771
    iget-object v2, v0, LX/g;->u:Landroid/animation/ValueAnimator;

    .line 772
    .line 773
    iget v3, v0, LX/g;->v:I

    .line 774
    .line 775
    const/4 v5, 0x2

    .line 776
    if-eq v3, v4, :cond_18

    .line 777
    .line 778
    if-eq v3, v5, :cond_19

    .line 779
    .line 780
    goto :goto_e

    .line 781
    :cond_18
    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->cancel()V

    .line 782
    .line 783
    .line 784
    :cond_19
    const/4 v3, 0x3

    .line 785
    iput v3, v0, LX/g;->v:I

    .line 786
    .line 787
    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 788
    .line 789
    .line 790
    move-result-object v0

    .line 791
    check-cast v0, Ljava/lang/Float;

    .line 792
    .line 793
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 794
    .line 795
    .line 796
    move-result v0

    .line 797
    new-array v3, v5, [F

    .line 798
    .line 799
    aput v0, v3, v6

    .line 800
    .line 801
    const/4 v0, 0x0

    .line 802
    aput v0, v3, v4

    .line 803
    .line 804
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 805
    .line 806
    .line 807
    const/16 v0, 0x1f4

    .line 808
    .line 809
    int-to-long v3, v0

    .line 810
    invoke-virtual {v2, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 811
    .line 812
    .line 813
    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->start()V

    .line 814
    .line 815
    .line 816
    :goto_e
    return-void

    .line 817
    :pswitch_b
    iget-object v0, v1, LA/b;->f:Ljava/lang/Object;

    .line 818
    .line 819
    check-cast v0, LR/j;

    .line 820
    .line 821
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 822
    .line 823
    .line 824
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 825
    .line 826
    const-string v2, "FragmentManager has not been attached to a host."

    .line 827
    .line 828
    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 829
    .line 830
    .line 831
    throw v0

    .line 832
    :pswitch_c
    throw v5

    .line 833
    :pswitch_d
    iget-object v0, v1, LA/b;->f:Ljava/lang/Object;

    .line 834
    .line 835
    check-cast v0, LE/i;

    .line 836
    .line 837
    iget-object v0, v0, LE/i;->f:Ljava/lang/Object;

    .line 838
    .line 839
    check-cast v0, LM0/j;

    .line 840
    .line 841
    iget-object v0, v0, LM0/j;->d:LL0/a;

    .line 842
    .line 843
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 844
    .line 845
    .line 846
    move-result-object v2

    .line 847
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 848
    .line 849
    .line 850
    move-result-object v2

    .line 851
    const-string v3, " disconnecting because it was signed out."

    .line 852
    .line 853
    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 854
    .line 855
    .line 856
    move-result-object v2

    .line 857
    invoke-interface {v0, v2}, LL0/a;->e(Ljava/lang/String;)V

    .line 858
    .line 859
    .line 860
    return-void

    .line 861
    :pswitch_e
    iget-object v0, v1, LA/b;->f:Ljava/lang/Object;

    .line 862
    .line 863
    check-cast v0, LM0/j;

    .line 864
    .line 865
    invoke-virtual {v0}, LM0/j;->h()V

    .line 866
    .line 867
    .line 868
    return-void

    .line 869
    :pswitch_f
    new-instance v0, Ljava/io/IOException;

    .line 870
    .line 871
    const-string v2, "TIMEOUT"

    .line 872
    .line 873
    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 874
    .line 875
    .line 876
    iget-object v2, v1, LA/b;->f:Ljava/lang/Object;

    .line 877
    .line 878
    check-cast v2, Li1/i;

    .line 879
    .line 880
    invoke-virtual {v2, v0}, Li1/i;->c(Ljava/lang/Exception;)Z

    .line 881
    .line 882
    .line 883
    move-result v0

    .line 884
    if-eqz v0, :cond_1a

    .line 885
    .line 886
    const-string v0, "Rpc"

    .line 887
    .line 888
    const-string v2, "No response"

    .line 889
    .line 890
    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 891
    .line 892
    .line 893
    :cond_1a
    return-void

    .line 894
    :pswitch_10
    iget-object v0, v1, LA/b;->f:Ljava/lang/Object;

    .line 895
    .line 896
    check-cast v0, LG/d;

    .line 897
    .line 898
    iget-object v4, v0, LG/d;->g:Lm/V;

    .line 899
    .line 900
    iget-object v5, v0, LG/d;->e:LG/a;

    .line 901
    .line 902
    iget-boolean v7, v0, LG/d;->s:Z

    .line 903
    .line 904
    if-nez v7, :cond_1b

    .line 905
    .line 906
    goto/16 :goto_10

    .line 907
    .line 908
    :cond_1b
    iget-boolean v7, v0, LG/d;->q:Z

    .line 909
    .line 910
    if-eqz v7, :cond_1c

    .line 911
    .line 912
    iput-boolean v6, v0, LG/d;->q:Z

    .line 913
    .line 914
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    .line 915
    .line 916
    .line 917
    move-result-wide v7

    .line 918
    iput-wide v7, v5, LG/a;->e:J

    .line 919
    .line 920
    const-wide/16 v9, -0x1

    .line 921
    .line 922
    iput-wide v9, v5, LG/a;->g:J

    .line 923
    .line 924
    iput-wide v7, v5, LG/a;->f:J

    .line 925
    .line 926
    const/high16 v7, 0x3f000000    # 0.5f

    .line 927
    .line 928
    iput v7, v5, LG/a;->h:F

    .line 929
    .line 930
    :cond_1c
    iget-wide v7, v5, LG/a;->g:J

    .line 931
    .line 932
    cmp-long v7, v7, v2

    .line 933
    .line 934
    if-lez v7, :cond_1d

    .line 935
    .line 936
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    .line 937
    .line 938
    .line 939
    move-result-wide v7

    .line 940
    iget-wide v9, v5, LG/a;->g:J

    .line 941
    .line 942
    iget v11, v5, LG/a;->i:I

    .line 943
    .line 944
    int-to-long v11, v11

    .line 945
    add-long/2addr v9, v11

    .line 946
    cmp-long v7, v7, v9

    .line 947
    .line 948
    if-lez v7, :cond_1d

    .line 949
    .line 950
    goto :goto_f

    .line 951
    :cond_1d
    invoke-virtual {v0}, LG/d;->e()Z

    .line 952
    .line 953
    .line 954
    move-result v7

    .line 955
    if-nez v7, :cond_1e

    .line 956
    .line 957
    :goto_f
    iput-boolean v6, v0, LG/d;->s:Z

    .line 958
    .line 959
    goto :goto_10

    .line 960
    :cond_1e
    iget-boolean v7, v0, LG/d;->r:Z

    .line 961
    .line 962
    if-eqz v7, :cond_1f

    .line 963
    .line 964
    iput-boolean v6, v0, LG/d;->r:Z

    .line 965
    .line 966
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 967
    .line 968
    .line 969
    move-result-wide v8

    .line 970
    const/4 v14, 0x0

    .line 971
    const/4 v15, 0x0

    .line 972
    const/4 v12, 0x3

    .line 973
    const/4 v13, 0x0

    .line 974
    move-wide v10, v8

    .line 975
    invoke-static/range {v8 .. v15}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    .line 976
    .line 977
    .line 978
    move-result-object v6

    .line 979
    invoke-virtual {v4, v6}, Lm/V;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 980
    .line 981
    .line 982
    invoke-virtual {v6}, Landroid/view/MotionEvent;->recycle()V

    .line 983
    .line 984
    .line 985
    :cond_1f
    iget-wide v6, v5, LG/a;->f:J

    .line 986
    .line 987
    cmp-long v2, v6, v2

    .line 988
    .line 989
    if-eqz v2, :cond_20

    .line 990
    .line 991
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    .line 992
    .line 993
    .line 994
    move-result-wide v2

    .line 995
    invoke-virtual {v5, v2, v3}, LG/a;->a(J)F

    .line 996
    .line 997
    .line 998
    move-result v6

    .line 999
    const/high16 v7, -0x3f800000    # -4.0f

    .line 1000
    .line 1001
    mul-float/2addr v7, v6

    .line 1002
    mul-float/2addr v7, v6

    .line 1003
    const/high16 v8, 0x40800000    # 4.0f

    .line 1004
    .line 1005
    mul-float/2addr v6, v8

    .line 1006
    add-float/2addr v6, v7

    .line 1007
    iget-wide v7, v5, LG/a;->f:J

    .line 1008
    .line 1009
    sub-long v7, v2, v7

    .line 1010
    .line 1011
    iput-wide v2, v5, LG/a;->f:J

    .line 1012
    .line 1013
    long-to-float v2, v7

    .line 1014
    mul-float/2addr v2, v6

    .line 1015
    iget v3, v5, LG/a;->d:F

    .line 1016
    .line 1017
    mul-float/2addr v2, v3

    .line 1018
    float-to-int v2, v2

    .line 1019
    iget-object v0, v0, LG/d;->u:Lm/V;

    .line 1020
    .line 1021
    invoke-virtual {v0, v2}, Landroid/widget/AbsListView;->scrollListBy(I)V

    .line 1022
    .line 1023
    .line 1024
    sget-object v0, LD/z;->a:Ljava/lang/reflect/Field;

    .line 1025
    .line 1026
    invoke-virtual {v4, v1}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    .line 1027
    .line 1028
    .line 1029
    :goto_10
    return-void

    .line 1030
    :cond_20
    new-instance v0, Ljava/lang/RuntimeException;

    .line 1031
    .line 1032
    const-string v2, "Cannot compute scroll delta before calling start()"

    .line 1033
    .line 1034
    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 1035
    .line 1036
    .line 1037
    throw v0

    .line 1038
    :pswitch_11
    iget-object v0, v1, LA/b;->f:Ljava/lang/Object;

    .line 1039
    .line 1040
    check-cast v0, Lio/flutter/plugin/editing/j;

    .line 1041
    .line 1042
    iget-object v0, v0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 1043
    .line 1044
    return-void

    .line 1045
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
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
