.class public final synthetic Lq3/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Lq3/e;

.field public final synthetic g:Li1/i;


# direct methods
.method public synthetic constructor <init>(Lq3/e;Li1/i;I)V
    .locals 0

    .line 1
    iput p3, p0, Lq3/b;->e:I

    iput-object p1, p0, Lq3/b;->f:Lq3/e;

    iput-object p2, p0, Lq3/b;->g:Li1/i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    .line 1
    iget v0, p0, Lq3/b;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lq3/b;->f:Lq3/e;

    .line 7
    .line 8
    iget-object v1, p0, Lq3/b;->g:Li1/i;

    .line 9
    .line 10
    :try_start_0
    new-instance v2, Ljava/util/HashMap;

    .line 11
    .line 12
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 13
    .line 14
    .line 15
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 16
    .line 17
    const/16 v4, 0x21

    .line 18
    .line 19
    if-lt v3, v4, :cond_1

    .line 20
    .line 21
    sget-object v0, Ld1/d;->a:Landroid/content/Context;

    .line 22
    .line 23
    const-string v3, "android.permission.POST_NOTIFICATIONS"

    .line 24
    .line 25
    invoke-virtual {v0, v3}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    const/4 v0, 0x1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 v0, 0x0

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    iget-object v0, v0, Lq3/e;->g:Landroid/app/Activity;

    .line 36
    .line 37
    new-instance v3, Lt/H;

    .line 38
    .line 39
    invoke-direct {v3, v0}, Lt/H;-><init>(Landroid/content/Context;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, v3, Lt/H;->b:Landroid/app/NotificationManager;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/app/NotificationManager;->areNotificationsEnabled()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    :goto_0
    const-string v3, "authorizationStatus"

    .line 49
    .line 50
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1, v2}, Li1/i;->b(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :catch_0
    move-exception v0

    .line 62
    invoke-virtual {v1, v0}, Li1/i;->a(Ljava/lang/Exception;)V

    .line 63
    .line 64
    .line 65
    :goto_1
    return-void

    .line 66
    :pswitch_0
    const-string v0, "android.permission.POST_NOTIFICATIONS"

    .line 67
    .line 68
    iget-object v1, p0, Lq3/b;->f:Lq3/e;

    .line 69
    .line 70
    iget-object v2, p0, Lq3/b;->g:Li1/i;

    .line 71
    .line 72
    new-instance v3, Ljava/util/HashMap;

    .line 73
    .line 74
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 75
    .line 76
    .line 77
    :try_start_1
    sget-object v4, Ld1/d;->a:Landroid/content/Context;

    .line 78
    .line 79
    invoke-virtual {v4, v0}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    const/4 v5, 0x0

    .line 84
    const/4 v6, 0x1

    .line 85
    if-nez v4, :cond_2

    .line 86
    .line 87
    move v4, v6

    .line 88
    goto :goto_2

    .line 89
    :cond_2
    move v4, v5

    .line 90
    :goto_2
    if-nez v4, :cond_5

    .line 91
    .line 92
    iget-object v4, v1, Lq3/e;->n:Lq3/f;

    .line 93
    .line 94
    iget-object v1, v1, Lq3/e;->g:Landroid/app/Activity;

    .line 95
    .line 96
    new-instance v7, LE0/j;

    .line 97
    .line 98
    const/4 v8, 0x7

    .line 99
    invoke-direct {v7, v8, v3, v2}, LE0/j;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 103
    .line 104
    .line 105
    iget-boolean v3, v4, Lq3/f;->f:Z

    .line 106
    .line 107
    if-eqz v3, :cond_3

    .line 108
    .line 109
    const-string v0, "A request for permissions is already running, please wait for it to finish before doing another request."

    .line 110
    .line 111
    new-instance v1, Ljava/lang/Exception;

    .line 112
    .line 113
    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v2, v1}, Li1/i;->a(Ljava/lang/Exception;)V

    .line 117
    .line 118
    .line 119
    goto :goto_4

    .line 120
    :cond_3
    if-nez v1, :cond_4

    .line 121
    .line 122
    const-string v0, "Unable to detect current Android Activity."

    .line 123
    .line 124
    new-instance v1, Ljava/lang/Exception;

    .line 125
    .line 126
    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v2, v1}, Li1/i;->a(Ljava/lang/Exception;)V

    .line 130
    .line 131
    .line 132
    goto :goto_4

    .line 133
    :cond_4
    iput-object v7, v4, Lq3/f;->e:LE0/j;

    .line 134
    .line 135
    new-instance v3, Ljava/util/ArrayList;

    .line 136
    .line 137
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    new-array v0, v5, [Ljava/lang/String;

    .line 144
    .line 145
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    check-cast v0, [Ljava/lang/String;

    .line 150
    .line 151
    iget-boolean v3, v4, Lq3/f;->f:Z

    .line 152
    .line 153
    if-nez v3, :cond_6

    .line 154
    .line 155
    const/16 v3, 0xf0

    .line 156
    .line 157
    invoke-static {v1, v0, v3}, Lt/a;->b(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 158
    .line 159
    .line 160
    iput-boolean v6, v4, Lq3/f;->f:Z

    .line 161
    .line 162
    goto :goto_4

    .line 163
    :catch_1
    move-exception v0

    .line 164
    goto :goto_3

    .line 165
    :cond_5
    const-string v0, "authorizationStatus"

    .line 166
    .line 167
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-virtual {v3, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    invoke-virtual {v2, v3}, Li1/i;->b(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 175
    .line 176
    .line 177
    goto :goto_4

    .line 178
    :goto_3
    invoke-virtual {v2, v0}, Li1/i;->a(Ljava/lang/Exception;)V

    .line 179
    .line 180
    .line 181
    :cond_6
    :goto_4
    return-void

    .line 182
    :pswitch_1
    iget-object v0, p0, Lq3/b;->g:Li1/i;

    .line 183
    .line 184
    iget-object v1, p0, Lq3/b;->f:Lq3/e;

    .line 185
    .line 186
    iget-object v2, v1, Lq3/e;->e:Ljava/util/HashMap;

    .line 187
    .line 188
    :try_start_2
    iget-object v3, v1, Lq3/e;->l:LV1/x;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 189
    .line 190
    const-string v4, "notification"

    .line 191
    .line 192
    const/4 v5, 0x0

    .line 193
    if-eqz v3, :cond_8

    .line 194
    .line 195
    :try_start_3
    invoke-static {v3}, LT0/a;->F(LV1/x;)Ljava/util/HashMap;

    .line 196
    .line 197
    .line 198
    move-result-object v2

    .line 199
    iget-object v3, v1, Lq3/e;->m:Ljava/util/Map;

    .line 200
    .line 201
    if-eqz v3, :cond_7

    .line 202
    .line 203
    invoke-virtual {v2, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    goto :goto_5

    .line 207
    :catch_2
    move-exception v1

    .line 208
    goto/16 :goto_a

    .line 209
    .line 210
    :cond_7
    :goto_5
    invoke-virtual {v0, v2}, Li1/i;->b(Ljava/lang/Object;)V

    .line 211
    .line 212
    .line 213
    iput-object v5, v1, Lq3/e;->l:LV1/x;

    .line 214
    .line 215
    iput-object v5, v1, Lq3/e;->m:Ljava/util/Map;

    .line 216
    .line 217
    goto/16 :goto_b

    .line 218
    .line 219
    :cond_8
    iget-object v1, v1, Lq3/e;->g:Landroid/app/Activity;

    .line 220
    .line 221
    if-nez v1, :cond_9

    .line 222
    .line 223
    invoke-virtual {v0, v5}, Li1/i;->b(Ljava/lang/Object;)V

    .line 224
    .line 225
    .line 226
    goto/16 :goto_b

    .line 227
    .line 228
    :cond_9
    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 229
    .line 230
    .line 231
    move-result-object v1

    .line 232
    if-eqz v1, :cond_12

    .line 233
    .line 234
    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 235
    .line 236
    .line 237
    move-result-object v3

    .line 238
    if-nez v3, :cond_a

    .line 239
    .line 240
    goto/16 :goto_9

    .line 241
    .line 242
    :cond_a
    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 243
    .line 244
    .line 245
    move-result-object v3

    .line 246
    const-string v6, "google.message_id"

    .line 247
    .line 248
    invoke-virtual {v3, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v3

    .line 252
    if-nez v3, :cond_b

    .line 253
    .line 254
    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 255
    .line 256
    .line 257
    move-result-object v1

    .line 258
    const-string v3, "message_id"

    .line 259
    .line 260
    invoke-virtual {v1, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v3

    .line 264
    :cond_b
    if-eqz v3, :cond_11

    .line 265
    .line 266
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    .line 268
    .line 269
    move-result-object v1

    .line 270
    if-eqz v1, :cond_c

    .line 271
    .line 272
    goto :goto_8

    .line 273
    :cond_c
    sget-object v1, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingReceiver;->a:Ljava/util/HashMap;

    .line 274
    .line 275
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 276
    .line 277
    .line 278
    move-result-object v1

    .line 279
    check-cast v1, LV1/x;

    .line 280
    .line 281
    if-nez v1, :cond_e

    .line 282
    .line 283
    invoke-static {}, Lj3/b;->n()Lj3/b;

    .line 284
    .line 285
    .line 286
    move-result-object v6

    .line 287
    invoke-virtual {v6, v3}, Lj3/b;->m(Ljava/lang/String;)Ljava/util/HashMap;

    .line 288
    .line 289
    .line 290
    move-result-object v6

    .line 291
    if-eqz v6, :cond_d

    .line 292
    .line 293
    invoke-static {v6}, LT0/a;->y(Ljava/util/Map;)LV1/x;

    .line 294
    .line 295
    .line 296
    move-result-object v1

    .line 297
    invoke-virtual {v6, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    .line 299
    .line 300
    move-result-object v7

    .line 301
    if-eqz v7, :cond_d

    .line 302
    .line 303
    invoke-virtual {v6, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    .line 305
    .line 306
    move-result-object v6

    .line 307
    check-cast v6, Ljava/util/Map;

    .line 308
    .line 309
    goto :goto_6

    .line 310
    :cond_d
    move-object v6, v5

    .line 311
    :goto_6
    invoke-static {}, Lj3/b;->n()Lj3/b;

    .line 312
    .line 313
    .line 314
    move-result-object v7

    .line 315
    invoke-virtual {v7, v3}, Lj3/b;->t(Ljava/lang/String;)V

    .line 316
    .line 317
    .line 318
    goto :goto_7

    .line 319
    :cond_e
    move-object v6, v5

    .line 320
    :goto_7
    if-nez v1, :cond_f

    .line 321
    .line 322
    invoke-virtual {v0, v5}, Li1/i;->b(Ljava/lang/Object;)V

    .line 323
    .line 324
    .line 325
    goto :goto_b

    .line 326
    :cond_f
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 327
    .line 328
    invoke-virtual {v2, v3, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 329
    .line 330
    .line 331
    invoke-static {v1}, LT0/a;->F(LV1/x;)Ljava/util/HashMap;

    .line 332
    .line 333
    .line 334
    move-result-object v2

    .line 335
    invoke-virtual {v1}, LV1/x;->c()LV1/w;

    .line 336
    .line 337
    .line 338
    move-result-object v1

    .line 339
    if-nez v1, :cond_10

    .line 340
    .line 341
    if-eqz v6, :cond_10

    .line 342
    .line 343
    invoke-virtual {v2, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 344
    .line 345
    .line 346
    :cond_10
    invoke-virtual {v0, v2}, Li1/i;->b(Ljava/lang/Object;)V

    .line 347
    .line 348
    .line 349
    goto :goto_b

    .line 350
    :cond_11
    :goto_8
    invoke-virtual {v0, v5}, Li1/i;->b(Ljava/lang/Object;)V

    .line 351
    .line 352
    .line 353
    goto :goto_b

    .line 354
    :cond_12
    :goto_9
    invoke-virtual {v0, v5}, Li1/i;->b(Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 355
    .line 356
    .line 357
    goto :goto_b

    .line 358
    :goto_a
    invoke-virtual {v0, v1}, Li1/i;->a(Ljava/lang/Exception;)V

    .line 359
    .line 360
    .line 361
    :goto_b
    return-void

    .line 362
    nop

    .line 363
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
