.class public abstract Landroid/support/v4/media/session/a;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Landroid/app/Activity;

.field public static b:Lh3/b;

.field public static final synthetic c:I


# direct methods
.method public static A(Ls3/A0;Ls3/K0;)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ls3/A0;->b:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-interface {p1, v0}, Ls3/K0;->h(Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ls3/A0;->c:Ljava/lang/Double;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Double;->floatValue()F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-interface {p1, v0}, Ls3/K0;->b(F)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ls3/A0;->d:Ljava/lang/Long;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    long-to-float v0, v0

    .line 26
    invoke-interface {p1, v0}, Ls3/K0;->a(F)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ls3/A0;->e:Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-interface {p1, v0}, Ls3/K0;->setVisible(Z)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ls3/A0;->a:Ljava/lang/String;

    .line 39
    .line 40
    return-object p0
.end method

.method public static C(Lcom/google/android/gms/maps/model/LatLngBounds;)Ls3/k0;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/maps/model/LatLngBounds;->f:Lcom/google/android/gms/maps/model/LatLng;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/support/v4/media/session/a;->E(Lcom/google/android/gms/maps/model/LatLng;)Ls3/j0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/google/android/gms/maps/model/LatLngBounds;->e:Lcom/google/android/gms/maps/model/LatLng;

    .line 8
    .line 9
    invoke-static {p0}, Landroid/support/v4/media/session/a;->E(Lcom/google/android/gms/maps/model/LatLng;)Ls3/j0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v1, Ls3/k0;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, v1, Ls3/k0;->a:Ls3/j0;

    .line 19
    .line 20
    iput-object p0, v1, Ls3/k0;->b:Ls3/j0;

    .line 21
    .line 22
    return-object v1
.end method

.method public static D(Ls3/j0;)Lcom/google/android/gms/maps/model/LatLng;
    .locals 5

    .line 1
    new-instance v0, Lcom/google/android/gms/maps/model/LatLng;

    .line 2
    .line 3
    iget-object v1, p0, Ls3/j0;->a:Ljava/lang/Double;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    iget-object p0, p0, Ls3/j0;->b:Ljava/lang/Double;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 12
    .line 13
    .line 14
    move-result-wide v3

    .line 15
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public static E(Lcom/google/android/gms/maps/model/LatLng;)Ls3/j0;
    .locals 3

    .line 1
    iget-wide v0, p0, Lcom/google/android/gms/maps/model/LatLng;->e:D

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-wide v1, p0, Lcom/google/android/gms/maps/model/LatLng;->f:D

    .line 8
    .line 9
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v1, Ls3/j0;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, v1, Ls3/j0;->a:Ljava/lang/Double;

    .line 19
    .line 20
    iput-object p0, v1, Ls3/j0;->b:Ljava/lang/Double;

    .line 21
    .line 22
    return-object v1
.end method

.method public static F(Landroid/content/Intent;)V
    .locals 22

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    invoke-static {v1}, Landroid/support/v4/media/session/a;->J(Landroid/content/Intent;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string v0, "_nr"

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-static {v0, v2}, Landroid/support/v4/media/session/a;->G(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    if-eqz v1, :cond_2

    .line 20
    .line 21
    const-string v2, "com.google.firebase.messaging.RECEIVE_DIRECT_BOOT"

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-static {}, Landroid/support/v4/media/session/a;->h()Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    goto :goto_1

    .line 39
    :cond_2
    :goto_0
    move v2, v0

    .line 40
    :goto_1
    if-eqz v2, :cond_1f

    .line 41
    .line 42
    sget-object v2, Lcom/google/firebase/messaging/FirebaseMessaging;->m:LP1/a;

    .line 43
    .line 44
    invoke-interface {v2}, LP1/a;->get()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Lv0/e;

    .line 49
    .line 50
    const-string v3, "FirebaseMessaging"

    .line 51
    .line 52
    if-nez v2, :cond_3

    .line 53
    .line 54
    const-string v0, "TransportFactory is null. Skip exporting message delivery metrics to Big Query"

    .line 55
    .line 56
    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_3
    const/4 v4, 0x0

    .line 61
    if-nez v1, :cond_4

    .line 62
    .line 63
    goto/16 :goto_14

    .line 64
    .line 65
    :cond_4
    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    if-nez v5, :cond_5

    .line 70
    .line 71
    sget-object v5, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    .line 72
    .line 73
    :cond_5
    const-string v6, "google.ttl"

    .line 74
    .line 75
    invoke-virtual {v5, v6}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v6

    .line 79
    instance-of v7, v6, Ljava/lang/Integer;

    .line 80
    .line 81
    if-eqz v7, :cond_6

    .line 82
    .line 83
    check-cast v6, Ljava/lang/Integer;

    .line 84
    .line 85
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 86
    .line 87
    .line 88
    move-result v6

    .line 89
    :goto_2
    move/from16 v16, v6

    .line 90
    .line 91
    goto :goto_3

    .line 92
    :cond_6
    instance-of v7, v6, Ljava/lang/String;

    .line 93
    .line 94
    if-eqz v7, :cond_7

    .line 95
    .line 96
    :try_start_0
    move-object v7, v6

    .line 97
    check-cast v7, Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    move-result v6
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    goto :goto_2

    .line 104
    :catch_0
    new-instance v7, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    const-string v8, "Invalid TTL: "

    .line 107
    .line 108
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v6

    .line 118
    invoke-static {v3, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    .line 120
    .line 121
    :cond_7
    move/from16 v16, v0

    .line 122
    .line 123
    :goto_3
    const-string v6, "google.to"

    .line 124
    .line 125
    invoke-virtual {v5, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v6

    .line 129
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 130
    .line 131
    .line 132
    move-result v7

    .line 133
    if-nez v7, :cond_8

    .line 134
    .line 135
    :goto_4
    move-object v11, v6

    .line 136
    goto :goto_5

    .line 137
    :cond_8
    :try_start_1
    invoke-static {}, LA1/g;->d()LA1/g;

    .line 138
    .line 139
    .line 140
    move-result-object v6
    :try_end_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_7
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_7

    .line 141
    :try_start_2
    sget-object v7, LQ1/c;->m:Ljava/lang/Object;

    .line 142
    .line 143
    const-class v7, LQ1/d;

    .line 144
    .line 145
    invoke-virtual {v6}, LA1/g;->a()V

    .line 146
    .line 147
    .line 148
    iget-object v6, v6, LA1/g;->d:LD1/i;

    .line 149
    .line 150
    invoke-interface {v6, v7}, LD1/d;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v6

    .line 154
    check-cast v6, LQ1/c;
    :try_end_2
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_2 .. :try_end_2} :catch_7
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_6

    .line 155
    .line 156
    :try_start_3
    invoke-virtual {v6}, LQ1/c;->c()Li1/p;

    .line 157
    .line 158
    .line 159
    move-result-object v6

    .line 160
    invoke-static {v6}, LV0/g;->a(Li1/h;)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v6

    .line 164
    check-cast v6, Ljava/lang/String;
    :try_end_3
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_3 .. :try_end_3} :catch_7
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_7

    .line 165
    .line 166
    goto :goto_4

    .line 167
    :goto_5
    invoke-static {}, LA1/g;->d()LA1/g;

    .line 168
    .line 169
    .line 170
    move-result-object v6

    .line 171
    invoke-virtual {v6}, LA1/g;->a()V

    .line 172
    .line 173
    .line 174
    iget-object v6, v6, LA1/g;->a:Landroid/content/Context;

    .line 175
    .line 176
    invoke-virtual {v6}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v13

    .line 180
    invoke-static {v5}, LE/i;->A(Landroid/os/Bundle;)Z

    .line 181
    .line 182
    .line 183
    move-result v6

    .line 184
    if-eqz v6, :cond_9

    .line 185
    .line 186
    sget-object v6, LW1/b;->g:LW1/b;

    .line 187
    .line 188
    :goto_6
    move-object v12, v6

    .line 189
    goto :goto_7

    .line 190
    :cond_9
    sget-object v6, LW1/b;->f:LW1/b;

    .line 191
    .line 192
    goto :goto_6

    .line 193
    :goto_7
    const-string v6, "google.delivered_priority"

    .line 194
    .line 195
    invoke-virtual {v5, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v6

    .line 199
    const/4 v7, 0x2

    .line 200
    const/4 v8, 0x1

    .line 201
    if-nez v6, :cond_b

    .line 202
    .line 203
    const-string v6, "google.priority_reduced"

    .line 204
    .line 205
    invoke-virtual {v5, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v6

    .line 209
    const-string v9, "1"

    .line 210
    .line 211
    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result v6

    .line 215
    if-eqz v6, :cond_a

    .line 216
    .line 217
    :goto_8
    move v6, v7

    .line 218
    goto :goto_9

    .line 219
    :cond_a
    const-string v6, "google.priority"

    .line 220
    .line 221
    invoke-virtual {v5, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v6

    .line 225
    :cond_b
    const-string v9, "high"

    .line 226
    .line 227
    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    move-result v9

    .line 231
    if-eqz v9, :cond_c

    .line 232
    .line 233
    move v6, v8

    .line 234
    goto :goto_9

    .line 235
    :cond_c
    const-string v9, "normal"

    .line 236
    .line 237
    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    move-result v6

    .line 241
    if-eqz v6, :cond_d

    .line 242
    .line 243
    goto :goto_8

    .line 244
    :cond_d
    move v6, v0

    .line 245
    :goto_9
    if-ne v6, v7, :cond_f

    .line 246
    .line 247
    const/4 v0, 0x5

    .line 248
    :cond_e
    :goto_a
    move v15, v0

    .line 249
    goto :goto_b

    .line 250
    :cond_f
    if-ne v6, v8, :cond_e

    .line 251
    .line 252
    const/16 v0, 0xa

    .line 253
    .line 254
    goto :goto_a

    .line 255
    :goto_b
    const-string v0, "google.message_id"

    .line 256
    .line 257
    invoke-virtual {v5, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    if-nez v0, :cond_10

    .line 262
    .line 263
    const-string v0, "message_id"

    .line 264
    .line 265
    invoke-virtual {v5, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    :cond_10
    const-string v6, ""

    .line 270
    .line 271
    if-eqz v0, :cond_11

    .line 272
    .line 273
    move-object v10, v0

    .line 274
    goto :goto_c

    .line 275
    :cond_11
    move-object v10, v6

    .line 276
    :goto_c
    const-string v0, "from"

    .line 277
    .line 278
    invoke-virtual {v5, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    if-eqz v0, :cond_12

    .line 283
    .line 284
    const-string v9, "/topics/"

    .line 285
    .line 286
    invoke-virtual {v0, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 287
    .line 288
    .line 289
    move-result v9

    .line 290
    if-eqz v9, :cond_12

    .line 291
    .line 292
    move-object v4, v0

    .line 293
    :cond_12
    if-eqz v4, :cond_13

    .line 294
    .line 295
    move-object/from16 v17, v4

    .line 296
    .line 297
    goto :goto_d

    .line 298
    :cond_13
    move-object/from16 v17, v6

    .line 299
    .line 300
    :goto_d
    const-string v0, "collapse_key"

    .line 301
    .line 302
    invoke-virtual {v5, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    if-eqz v0, :cond_14

    .line 307
    .line 308
    move-object v14, v0

    .line 309
    goto :goto_e

    .line 310
    :cond_14
    move-object v14, v6

    .line 311
    :goto_e
    const-string v0, "google.c.a.m_l"

    .line 312
    .line 313
    invoke-virtual {v5, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    if-eqz v0, :cond_15

    .line 318
    .line 319
    move-object/from16 v18, v0

    .line 320
    .line 321
    goto :goto_f

    .line 322
    :cond_15
    move-object/from16 v18, v6

    .line 323
    .line 324
    :goto_f
    const-string v0, "google.c.a.c_l"

    .line 325
    .line 326
    invoke-virtual {v5, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 327
    .line 328
    .line 329
    move-result-object v0

    .line 330
    if-eqz v0, :cond_16

    .line 331
    .line 332
    move-object/from16 v19, v0

    .line 333
    .line 334
    goto :goto_10

    .line 335
    :cond_16
    move-object/from16 v19, v6

    .line 336
    .line 337
    :goto_10
    const-string v0, "google.c.sender.id"

    .line 338
    .line 339
    invoke-virtual {v5, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 340
    .line 341
    .line 342
    move-result v4

    .line 343
    const-wide/16 v20, 0x0

    .line 344
    .line 345
    if-eqz v4, :cond_17

    .line 346
    .line 347
    :try_start_4
    invoke-virtual {v5, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 348
    .line 349
    .line 350
    move-result-object v0

    .line 351
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 352
    .line 353
    .line 354
    move-result-wide v4
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_1

    .line 355
    goto :goto_12

    .line 356
    :catch_1
    move-exception v0

    .line 357
    const-string v4, "error parsing project number"

    .line 358
    .line 359
    invoke-static {v3, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 360
    .line 361
    .line 362
    :cond_17
    invoke-static {}, LA1/g;->d()LA1/g;

    .line 363
    .line 364
    .line 365
    move-result-object v4

    .line 366
    iget-object v5, v4, LA1/g;->c:LA1/i;

    .line 367
    .line 368
    invoke-virtual {v4}, LA1/g;->a()V

    .line 369
    .line 370
    .line 371
    iget-object v0, v5, LA1/i;->e:Ljava/lang/String;

    .line 372
    .line 373
    if-eqz v0, :cond_18

    .line 374
    .line 375
    :try_start_5
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 376
    .line 377
    .line 378
    move-result-wide v4
    :try_end_5
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_5} :catch_2

    .line 379
    goto :goto_12

    .line 380
    :catch_2
    move-exception v0

    .line 381
    const-string v6, "error parsing sender ID"

    .line 382
    .line 383
    invoke-static {v3, v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 384
    .line 385
    .line 386
    :cond_18
    invoke-virtual {v4}, LA1/g;->a()V

    .line 387
    .line 388
    .line 389
    iget-object v0, v5, LA1/i;->b:Ljava/lang/String;

    .line 390
    .line 391
    const-string v4, "1:"

    .line 392
    .line 393
    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 394
    .line 395
    .line 396
    move-result v4

    .line 397
    const-string v5, "error parsing app ID"

    .line 398
    .line 399
    if-nez v4, :cond_19

    .line 400
    .line 401
    :try_start_6
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 402
    .line 403
    .line 404
    move-result-wide v4
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_6 .. :try_end_6} :catch_3

    .line 405
    goto :goto_12

    .line 406
    :catch_3
    move-exception v0

    .line 407
    invoke-static {v3, v5, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 408
    .line 409
    .line 410
    goto :goto_11

    .line 411
    :cond_19
    const-string v4, ":"

    .line 412
    .line 413
    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 414
    .line 415
    .line 416
    move-result-object v0

    .line 417
    array-length v4, v0

    .line 418
    if-ge v4, v7, :cond_1a

    .line 419
    .line 420
    :goto_11
    move-wide/from16 v4, v20

    .line 421
    .line 422
    goto :goto_12

    .line 423
    :cond_1a
    aget-object v0, v0, v8

    .line 424
    .line 425
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 426
    .line 427
    .line 428
    move-result v4

    .line 429
    if-eqz v4, :cond_1b

    .line 430
    .line 431
    goto :goto_11

    .line 432
    :cond_1b
    :try_start_7
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 433
    .line 434
    .line 435
    move-result-wide v4
    :try_end_7
    .catch Ljava/lang/NumberFormatException; {:try_start_7 .. :try_end_7} :catch_4

    .line 436
    goto :goto_12

    .line 437
    :catch_4
    move-exception v0

    .line 438
    invoke-static {v3, v5, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 439
    .line 440
    .line 441
    goto :goto_11

    .line 442
    :goto_12
    cmp-long v0, v4, v20

    .line 443
    .line 444
    if-lez v0, :cond_1c

    .line 445
    .line 446
    move-wide v8, v4

    .line 447
    goto :goto_13

    .line 448
    :cond_1c
    move-wide/from16 v8, v20

    .line 449
    .line 450
    :goto_13
    new-instance v7, LW1/d;

    .line 451
    .line 452
    invoke-direct/range {v7 .. v19}, LW1/d;-><init>(JLjava/lang/String;Ljava/lang/String;LW1/b;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 453
    .line 454
    .line 455
    move-object v4, v7

    .line 456
    :goto_14
    if-nez v4, :cond_1d

    .line 457
    .line 458
    goto :goto_17

    .line 459
    :cond_1d
    :try_start_8
    const-string v0, "google.product_id"

    .line 460
    .line 461
    const v5, 0x6ab2d1f

    .line 462
    .line 463
    .line 464
    invoke-virtual {v1, v0, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 465
    .line 466
    .line 467
    move-result v0

    .line 468
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 469
    .line 470
    .line 471
    move-result-object v0

    .line 472
    new-instance v1, Lv0/b;

    .line 473
    .line 474
    invoke-direct {v1, v0}, Lv0/b;-><init>(Ljava/lang/Integer;)V

    .line 475
    .line 476
    .line 477
    const-string v0, "proto"

    .line 478
    .line 479
    new-instance v5, Lv0/c;

    .line 480
    .line 481
    invoke-direct {v5, v0}, Lv0/c;-><init>(Ljava/lang/String;)V

    .line 482
    .line 483
    .line 484
    new-instance v0, LA1/h;

    .line 485
    .line 486
    const/16 v6, 0x17

    .line 487
    .line 488
    invoke-direct {v0, v6}, LA1/h;-><init>(I)V

    .line 489
    .line 490
    .line 491
    check-cast v2, Ly0/o;

    .line 492
    .line 493
    iget-object v6, v2, Ly0/o;->a:Ljava/util/Set;

    .line 494
    .line 495
    invoke-interface {v6, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 496
    .line 497
    .line 498
    move-result v7

    .line 499
    if-eqz v7, :cond_1e

    .line 500
    .line 501
    new-instance v6, Lm/x0;

    .line 502
    .line 503
    iget-object v7, v2, Ly0/o;->b:Ly0/i;

    .line 504
    .line 505
    iget-object v2, v2, Ly0/o;->c:Ly0/p;

    .line 506
    .line 507
    invoke-direct {v6, v7, v5, v0, v2}, Lm/x0;-><init>(Ly0/i;Lv0/c;LA1/h;Ly0/p;)V

    .line 508
    .line 509
    .line 510
    new-instance v0, LW1/e;

    .line 511
    .line 512
    invoke-direct {v0, v4}, LW1/e;-><init>(LW1/d;)V

    .line 513
    .line 514
    .line 515
    new-instance v2, Lv0/a;

    .line 516
    .line 517
    invoke-direct {v2, v0, v1}, Lv0/a;-><init>(LW1/e;Lv0/b;)V

    .line 518
    .line 519
    .line 520
    invoke-virtual {v6, v2}, Lm/x0;->H(Lv0/a;)V

    .line 521
    .line 522
    .line 523
    goto :goto_17

    .line 524
    :catch_5
    move-exception v0

    .line 525
    goto :goto_15

    .line 526
    :cond_1e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 527
    .line 528
    const-string v1, "%s is not supported byt this factory. Supported encodings are: %s."

    .line 529
    .line 530
    filled-new-array {v5, v6}, [Ljava/lang/Object;

    .line 531
    .line 532
    .line 533
    move-result-object v2

    .line 534
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 535
    .line 536
    .line 537
    move-result-object v1

    .line 538
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 539
    .line 540
    .line 541
    throw v0
    :try_end_8
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_8} :catch_5

    .line 542
    :goto_15
    const-string v1, "Failed to send big query analytics payload."

    .line 543
    .line 544
    invoke-static {v3, v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 545
    .line 546
    .line 547
    goto :goto_17

    .line 548
    :catch_6
    move-exception v0

    .line 549
    goto :goto_16

    .line 550
    :catch_7
    move-exception v0

    .line 551
    :goto_16
    new-instance v1, Ljava/lang/RuntimeException;

    .line 552
    .line 553
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 554
    .line 555
    .line 556
    throw v1

    .line 557
    :cond_1f
    :goto_17
    return-void
.end method

.method public static G(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 5

    .line 1
    const-string v0, "FirebaseMessaging"

    .line 2
    .line 3
    :try_start_0
    invoke-static {}, LA1/g;->d()LA1/g;
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2

    .line 4
    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    new-instance p1, Landroid/os/Bundle;

    .line 9
    .line 10
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 11
    .line 12
    .line 13
    :cond_0
    new-instance v1, Landroid/os/Bundle;

    .line 14
    .line 15
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v2, "google.c.a.c_id"

    .line 19
    .line 20
    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    const-string v3, "_nmid"

    .line 27
    .line 28
    invoke-virtual {v1, v3, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    const-string v2, "google.c.a.c_l"

    .line 32
    .line 33
    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    if-eqz v2, :cond_2

    .line 38
    .line 39
    const-string v3, "_nmn"

    .line 40
    .line 41
    invoke-virtual {v1, v3, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_2
    const-string v2, "google.c.a.m_l"

    .line 45
    .line 46
    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-nez v3, :cond_3

    .line 55
    .line 56
    const-string v3, "label"

    .line 57
    .line 58
    invoke-virtual {v1, v3, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_3
    const-string v2, "google.c.a.m_c"

    .line 62
    .line 63
    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    if-nez v3, :cond_4

    .line 72
    .line 73
    const-string v3, "message_channel"

    .line 74
    .line 75
    invoke-virtual {v1, v3, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    :cond_4
    const-string v2, "from"

    .line 79
    .line 80
    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    const/4 v3, 0x0

    .line 85
    if-eqz v2, :cond_5

    .line 86
    .line 87
    const-string v4, "/topics/"

    .line 88
    .line 89
    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    if-eqz v4, :cond_5

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_5
    move-object v2, v3

    .line 97
    :goto_0
    if-eqz v2, :cond_6

    .line 98
    .line 99
    const-string v4, "_nt"

    .line 100
    .line 101
    invoke-virtual {v1, v4, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    :cond_6
    const-string v2, "google.c.a.ts"

    .line 105
    .line 106
    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    if-eqz v2, :cond_7

    .line 111
    .line 112
    :try_start_1
    const-string v4, "_nmt"

    .line 113
    .line 114
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    invoke-virtual {v1, v4, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 119
    .line 120
    .line 121
    goto :goto_1

    .line 122
    :catch_0
    move-exception v2

    .line 123
    const-string v4, "Error while parsing timestamp in GCM event"

    .line 124
    .line 125
    invoke-static {v0, v4, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 126
    .line 127
    .line 128
    :cond_7
    :goto_1
    const-string v2, "google.c.a.udt"

    .line 129
    .line 130
    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 131
    .line 132
    .line 133
    move-result v4

    .line 134
    if-eqz v4, :cond_8

    .line 135
    .line 136
    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    :cond_8
    if-eqz v3, :cond_9

    .line 141
    .line 142
    :try_start_2
    const-string v2, "_ndt"

    .line 143
    .line 144
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 145
    .line 146
    .line 147
    move-result v3

    .line 148
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_1

    .line 149
    .line 150
    .line 151
    goto :goto_2

    .line 152
    :catch_1
    move-exception v2

    .line 153
    const-string v3, "Error while parsing use_device_time in GCM event"

    .line 154
    .line 155
    invoke-static {v0, v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 156
    .line 157
    .line 158
    :cond_9
    :goto_2
    invoke-static {p1}, LE/i;->A(Landroid/os/Bundle;)Z

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    if-eqz p1, :cond_a

    .line 163
    .line 164
    const-string p1, "display"

    .line 165
    .line 166
    goto :goto_3

    .line 167
    :cond_a
    const-string p1, "data"

    .line 168
    .line 169
    :goto_3
    const-string v2, "_nr"

    .line 170
    .line 171
    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v2

    .line 175
    if-nez v2, :cond_b

    .line 176
    .line 177
    const-string v2, "_nf"

    .line 178
    .line 179
    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v2

    .line 183
    if-eqz v2, :cond_c

    .line 184
    .line 185
    :cond_b
    const-string v2, "_nmc"

    .line 186
    .line 187
    invoke-virtual {v1, v2, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    :cond_c
    const/4 p1, 0x3

    .line 191
    invoke-static {v0, p1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    if-eqz p1, :cond_d

    .line 196
    .line 197
    new-instance p1, Ljava/lang/StringBuilder;

    .line 198
    .line 199
    const-string v2, "Logging to scion event="

    .line 200
    .line 201
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    const-string p0, " scionPayload="

    .line 208
    .line 209
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    .line 221
    .line 222
    :cond_d
    invoke-static {}, LA1/g;->d()LA1/g;

    .line 223
    .line 224
    .line 225
    move-result-object p0

    .line 226
    invoke-virtual {p0}, LA1/g;->a()V

    .line 227
    .line 228
    .line 229
    iget-object p0, p0, LA1/g;->d:LD1/i;

    .line 230
    .line 231
    const-class p1, LB1/a;

    .line 232
    .line 233
    invoke-interface {p0, p1}, LD1/d;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    move-result-object p0

    .line 237
    if-nez p0, :cond_e

    .line 238
    .line 239
    const-string p0, "Unable to log event: analytics library is missing"

    .line 240
    .line 241
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 242
    .line 243
    .line 244
    return-void

    .line 245
    :cond_e
    new-instance p0, Ljava/lang/ClassCastException;

    .line 246
    .line 247
    invoke-direct {p0}, Ljava/lang/ClassCastException;-><init>()V

    .line 248
    .line 249
    .line 250
    throw p0

    .line 251
    :catch_2
    const-string p0, "Default FirebaseApp has not been initialized. Skip logging event to GA."

    .line 252
    .line 253
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 254
    .line 255
    .line 256
    return-void
.end method

.method public static H(Ljava/util/List;)Ljava/util/ArrayList;
    .locals 7

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Ls3/j0;

    .line 25
    .line 26
    new-instance v2, Lcom/google/android/gms/maps/model/LatLng;

    .line 27
    .line 28
    iget-object v3, v1, Ls3/j0;->a:Ljava/lang/Double;

    .line 29
    .line 30
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    .line 31
    .line 32
    .line 33
    move-result-wide v3

    .line 34
    iget-object v1, v1, Ls3/j0;->b:Ljava/lang/Double;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    .line 37
    .line 38
    .line 39
    move-result-wide v5

    .line 40
    invoke-direct {v2, v3, v4, v5, v6}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    return-object v0
.end method

.method public static I(Landroid/view/View;Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1a

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    invoke-static {p0, p1}, Lm/G0;->a(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget-object v0, Lm/I0;->o:Lm/I0;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, v0, Lm/I0;->e:Landroid/view/View;

    .line 17
    .line 18
    if-ne v0, p0, :cond_1

    .line 19
    .line 20
    invoke-static {v1}, Lm/I0;->b(Lm/I0;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_3

    .line 28
    .line 29
    sget-object p1, Lm/I0;->p:Lm/I0;

    .line 30
    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    iget-object v0, p1, Lm/I0;->e:Landroid/view/View;

    .line 34
    .line 35
    if-ne v0, p0, :cond_2

    .line 36
    .line 37
    invoke-virtual {p1}, Lm/I0;->a()V

    .line 38
    .line 39
    .line 40
    :cond_2
    invoke-virtual {p0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 41
    .line 42
    .line 43
    const/4 p1, 0x0

    .line 44
    invoke-virtual {p0, p1}, Landroid/view/View;->setLongClickable(Z)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v1}, Landroid/view/View;->setOnHoverListener(Landroid/view/View$OnHoverListener;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_3
    new-instance v0, Lm/I0;

    .line 52
    .line 53
    invoke-direct {v0, p0, p1}, Lm/I0;-><init>(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public static J(Landroid/content/Intent;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_2

    .line 3
    .line 4
    const-string v1, "com.google.firebase.messaging.RECEIVE_DIRECT_BOOT"

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    return v0

    .line 24
    :cond_1
    const-string v0, "google.c.a.e"

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string v0, "1"

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0

    .line 37
    :cond_2
    :goto_0
    return v0
.end method

.method public static K(Ls3/C;Landroid/content/res/AssetManager;FLN1/e;)Le1/c;
    .locals 10

    .line 1
    iget-object p0, p0, Ls3/C;->a:Ljava/lang/Object;

    .line 2
    .line 3
    instance-of v0, p0, Ls3/I;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    check-cast p0, Ls3/I;

    .line 8
    .line 9
    iget-object p0, p0, Ls3/I;->a:Ljava/lang/Double;

    .line 10
    .line 11
    const-string p1, "IBitmapDescriptorFactory is not initialized"

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    :try_start_0
    new-instance p0, Le1/c;

    .line 16
    .line 17
    sget-object p2, Lcom/google/crypto/tink/shaded/protobuf/i0;->g:LZ0/u;

    .line 18
    .line 19
    invoke-static {p2, p1}, LN0/n;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    check-cast p2, LZ0/s;

    .line 23
    .line 24
    invoke-virtual {p2}, LY0/a;->c()Landroid/os/Parcel;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const/4 p3, 0x4

    .line 29
    invoke-virtual {p2, p1, p3}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-static {p2}, LU0/b;->e(Landroid/os/IBinder;)LU0/a;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-virtual {p1}, Landroid/os/Parcel;->recycle()V

    .line 42
    .line 43
    .line 44
    invoke-direct {p0, p2}, Le1/c;-><init>(LU0/a;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .line 46
    .line 47
    return-object p0

    .line 48
    :catch_0
    move-exception p0

    .line 49
    new-instance p1, Le1/x;

    .line 50
    .line 51
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    throw p1

    .line 55
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Double;->floatValue()F

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    :try_start_1
    new-instance p2, Le1/c;

    .line 60
    .line 61
    sget-object p3, Lcom/google/crypto/tink/shaded/protobuf/i0;->g:LZ0/u;

    .line 62
    .line 63
    invoke-static {p3, p1}, LN0/n;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    check-cast p3, LZ0/s;

    .line 67
    .line 68
    invoke-virtual {p3}, LY0/a;->c()Landroid/os/Parcel;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 73
    .line 74
    .line 75
    const/4 p0, 0x5

    .line 76
    invoke-virtual {p3, p1, p0}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-static {p1}, LU0/b;->e(Landroid/os/IBinder;)LU0/a;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p0}, Landroid/os/Parcel;->recycle()V

    .line 89
    .line 90
    .line 91
    invoke-direct {p2, p1}, Le1/c;-><init>(LU0/a;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 92
    .line 93
    .line 94
    return-object p2

    .line 95
    :catch_1
    move-exception p0

    .line 96
    new-instance p1, Le1/x;

    .line 97
    .line 98
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 99
    .line 100
    .line 101
    throw p1

    .line 102
    :cond_1
    instance-of v0, p0, Ls3/D;

    .line 103
    .line 104
    if-eqz v0, :cond_3

    .line 105
    .line 106
    check-cast p0, Ls3/D;

    .line 107
    .line 108
    iget-object p1, p0, Ls3/D;->a:Ljava/lang/String;

    .line 109
    .line 110
    iget-object p0, p0, Ls3/D;->b:Ljava/lang/String;

    .line 111
    .line 112
    if-nez p0, :cond_2

    .line 113
    .line 114
    invoke-static {}, LB2/a;->J()LB2/a;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    iget-object p0, p0, LB2/a;->f:Ljava/lang/Object;

    .line 119
    .line 120
    check-cast p0, Le3/e;

    .line 121
    .line 122
    invoke-virtual {p0, p1}, Le3/e;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-static {p0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->q(Ljava/lang/String;)Le1/c;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    return-object p0

    .line 131
    :cond_2
    invoke-static {}, LB2/a;->J()LB2/a;

    .line 132
    .line 133
    .line 134
    move-result-object p2

    .line 135
    iget-object p2, p2, LB2/a;->f:Ljava/lang/Object;

    .line 136
    .line 137
    check-cast p2, Le3/e;

    .line 138
    .line 139
    new-instance p3, Ljava/lang/StringBuilder;

    .line 140
    .line 141
    const-string v0, "packages"

    .line 142
    .line 143
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    .line 147
    .line 148
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    invoke-virtual {p2, p0}, Le3/e;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    invoke-static {p0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->q(Ljava/lang/String;)Le1/c;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    return-object p0

    .line 173
    :cond_3
    instance-of v0, p0, Ls3/E;

    .line 174
    .line 175
    if-eqz v0, :cond_4

    .line 176
    .line 177
    check-cast p0, Ls3/E;

    .line 178
    .line 179
    iget-object p0, p0, Ls3/E;->a:Ljava/lang/String;

    .line 180
    .line 181
    invoke-static {}, LB2/a;->J()LB2/a;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    iget-object p1, p1, LB2/a;->f:Ljava/lang/Object;

    .line 186
    .line 187
    check-cast p1, Le3/e;

    .line 188
    .line 189
    invoke-virtual {p1, p0}, Le3/e;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    invoke-static {p0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->q(Ljava/lang/String;)Le1/c;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    return-object p0

    .line 198
    :cond_4
    instance-of v0, p0, Ls3/G;

    .line 199
    .line 200
    const-string v1, "Unable to decode bytes as a valid bitmap."

    .line 201
    .line 202
    const/4 v2, 0x0

    .line 203
    const-string v3, "Unable to interpret bytes as a valid image."

    .line 204
    .line 205
    if-eqz v0, :cond_6

    .line 206
    .line 207
    check-cast p0, Ls3/G;

    .line 208
    .line 209
    :try_start_2
    iget-object p0, p0, Ls3/G;->a:[B

    .line 210
    .line 211
    array-length p1, p0

    .line 212
    invoke-static {p0, v2, p1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    if-eqz p0, :cond_5

    .line 217
    .line 218
    invoke-static {p0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->r(Landroid/graphics/Bitmap;)Le1/c;

    .line 219
    .line 220
    .line 221
    move-result-object p0

    .line 222
    return-object p0

    .line 223
    :catch_2
    move-exception p0

    .line 224
    goto :goto_0

    .line 225
    :cond_5
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 226
    .line 227
    invoke-direct {p0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    throw p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 231
    :goto_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 232
    .line 233
    invoke-direct {p1, v3, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 234
    .line 235
    .line 236
    throw p1

    .line 237
    :cond_6
    instance-of v0, p0, Ls3/F;

    .line 238
    .line 239
    if-eqz v0, :cond_11

    .line 240
    .line 241
    check-cast p0, Ls3/F;

    .line 242
    .line 243
    const-string v0, "\'asset\' cannot open asset: "

    .line 244
    .line 245
    iget-object v1, p0, Ls3/F;->a:Ljava/lang/String;

    .line 246
    .line 247
    invoke-static {}, LB2/a;->J()LB2/a;

    .line 248
    .line 249
    .line 250
    move-result-object v2

    .line 251
    iget-object v2, v2, LB2/a;->f:Ljava/lang/Object;

    .line 252
    .line 253
    check-cast v2, Le3/e;

    .line 254
    .line 255
    invoke-virtual {v2, v1}, Le3/e;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v2

    .line 259
    iget-object v3, p0, Ls3/F;->b:Ls3/l0;

    .line 260
    .line 261
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 262
    .line 263
    .line 264
    move-result v3

    .line 265
    if-eqz v3, :cond_7

    .line 266
    .line 267
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 268
    .line 269
    .line 270
    invoke-static {v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->q(Ljava/lang/String;)Le1/c;

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    return-object p0

    .line 275
    :cond_7
    iget-object v3, p0, Ls3/F;->d:Ljava/lang/Double;

    .line 276
    .line 277
    iget-object v4, p0, Ls3/F;->e:Ljava/lang/Double;

    .line 278
    .line 279
    const/4 v5, 0x0

    .line 280
    :try_start_3
    invoke-virtual {p1, v2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 281
    .line 282
    .line 283
    move-result-object v5

    .line 284
    invoke-static {v5}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    .line 285
    .line 286
    .line 287
    move-result-object p1

    .line 288
    if-nez v3, :cond_a

    .line 289
    .line 290
    if-eqz v4, :cond_8

    .line 291
    .line 292
    goto :goto_2

    .line 293
    :cond_8
    iget-object p0, p0, Ls3/F;->c:Ljava/lang/Double;

    .line 294
    .line 295
    invoke-virtual {p0}, Ljava/lang/Double;->floatValue()F

    .line 296
    .line 297
    .line 298
    move-result p0

    .line 299
    div-float/2addr p2, p0

    .line 300
    invoke-static {p1, p2}, Landroid/support/v4/media/session/a;->L(Landroid/graphics/Bitmap;F)Landroid/graphics/Bitmap;

    .line 301
    .line 302
    .line 303
    move-result-object p0

    .line 304
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 305
    .line 306
    .line 307
    invoke-static {p0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->r(Landroid/graphics/Bitmap;)Le1/c;

    .line 308
    .line 309
    .line 310
    move-result-object p0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 311
    if-eqz v5, :cond_9

    .line 312
    .line 313
    :goto_1
    :try_start_4
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 314
    .line 315
    .line 316
    return-object p0

    .line 317
    :catch_3
    move-exception p1

    .line 318
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 319
    .line 320
    .line 321
    goto :goto_6

    .line 322
    :cond_9
    return-object p0

    .line 323
    :catchall_0
    move-exception p0

    .line 324
    goto/16 :goto_8

    .line 325
    .line 326
    :catch_4
    move-exception p0

    .line 327
    goto :goto_7

    .line 328
    :cond_a
    :goto_2
    if-eqz v3, :cond_b

    .line 329
    .line 330
    :try_start_5
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    .line 331
    .line 332
    .line 333
    move-result-wide v6

    .line 334
    float-to-double v8, p2

    .line 335
    mul-double/2addr v6, v8

    .line 336
    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 337
    .line 338
    .line 339
    move-result-object p0

    .line 340
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 341
    .line 342
    .line 343
    move-result p0

    .line 344
    goto :goto_3

    .line 345
    :cond_b
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 346
    .line 347
    .line 348
    move-result p0

    .line 349
    :goto_3
    if-eqz v4, :cond_c

    .line 350
    .line 351
    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    .line 352
    .line 353
    .line 354
    move-result-wide v6

    .line 355
    float-to-double v8, p2

    .line 356
    mul-double/2addr v6, v8

    .line 357
    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 358
    .line 359
    .line 360
    move-result-object p2

    .line 361
    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    .line 362
    .line 363
    .line 364
    move-result p2

    .line 365
    goto :goto_4

    .line 366
    :cond_c
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 367
    .line 368
    .line 369
    move-result p2

    .line 370
    :goto_4
    if-eqz v3, :cond_d

    .line 371
    .line 372
    if-nez v4, :cond_d

    .line 373
    .line 374
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 375
    .line 376
    .line 377
    move-result p2

    .line 378
    int-to-double v2, p2

    .line 379
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 380
    .line 381
    .line 382
    move-result p2

    .line 383
    int-to-double v6, p2

    .line 384
    div-double/2addr v2, v6

    .line 385
    int-to-double v6, p0

    .line 386
    mul-double/2addr v6, v2

    .line 387
    double-to-int p2, v6

    .line 388
    goto :goto_5

    .line 389
    :cond_d
    if-eqz v4, :cond_e

    .line 390
    .line 391
    if-nez v3, :cond_e

    .line 392
    .line 393
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 394
    .line 395
    .line 396
    move-result p0

    .line 397
    int-to-double v2, p0

    .line 398
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 399
    .line 400
    .line 401
    move-result p0

    .line 402
    int-to-double v6, p0

    .line 403
    div-double/2addr v2, v6

    .line 404
    int-to-double v6, p2

    .line 405
    mul-double/2addr v6, v2

    .line 406
    double-to-int p0, v6

    .line 407
    :cond_e
    :goto_5
    invoke-static {p1, p0, p2}, Landroid/support/v4/media/session/a;->M(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    .line 408
    .line 409
    .line 410
    move-result-object p0

    .line 411
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 412
    .line 413
    .line 414
    invoke-static {p0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->r(Landroid/graphics/Bitmap;)Le1/c;

    .line 415
    .line 416
    .line 417
    move-result-object p0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 418
    if-eqz v5, :cond_f

    .line 419
    .line 420
    goto :goto_1

    .line 421
    :cond_f
    :goto_6
    return-object p0

    .line 422
    :goto_7
    :try_start_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 423
    .line 424
    new-instance p2, Ljava/lang/StringBuilder;

    .line 425
    .line 426
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 427
    .line 428
    .line 429
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 430
    .line 431
    .line 432
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 433
    .line 434
    .line 435
    move-result-object p2

    .line 436
    invoke-direct {p1, p2, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 437
    .line 438
    .line 439
    throw p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 440
    :goto_8
    if-eqz v5, :cond_10

    .line 441
    .line 442
    :try_start_7
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5

    .line 443
    .line 444
    .line 445
    goto :goto_9

    .line 446
    :catch_5
    move-exception p1

    .line 447
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 448
    .line 449
    .line 450
    :cond_10
    :goto_9
    throw p0

    .line 451
    :cond_11
    instance-of v0, p0, Ls3/H;

    .line 452
    .line 453
    if-eqz v0, :cond_1a

    .line 454
    .line 455
    check-cast p0, Ls3/H;

    .line 456
    .line 457
    :try_start_8
    iget-object p1, p0, Ls3/H;->a:[B

    .line 458
    .line 459
    array-length v0, p1

    .line 460
    invoke-static {p1, v2, v0}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    .line 461
    .line 462
    .line 463
    move-result-object p1

    .line 464
    if-eqz p1, :cond_19

    .line 465
    .line 466
    iget-object v0, p0, Ls3/H;->b:Ls3/l0;

    .line 467
    .line 468
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 469
    .line 470
    .line 471
    move-result v0

    .line 472
    if-eqz v0, :cond_12

    .line 473
    .line 474
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 475
    .line 476
    .line 477
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->r(Landroid/graphics/Bitmap;)Le1/c;

    .line 478
    .line 479
    .line 480
    move-result-object p0

    .line 481
    return-object p0

    .line 482
    :cond_12
    iget-object v0, p0, Ls3/H;->d:Ljava/lang/Double;

    .line 483
    .line 484
    iget-object v1, p0, Ls3/H;->e:Ljava/lang/Double;

    .line 485
    .line 486
    if-nez v0, :cond_14

    .line 487
    .line 488
    if-eqz v1, :cond_13

    .line 489
    .line 490
    goto :goto_a

    .line 491
    :cond_13
    iget-object p0, p0, Ls3/H;->c:Ljava/lang/Double;

    .line 492
    .line 493
    invoke-virtual {p0}, Ljava/lang/Double;->floatValue()F

    .line 494
    .line 495
    .line 496
    move-result p0

    .line 497
    div-float/2addr p2, p0

    .line 498
    invoke-static {p1, p2}, Landroid/support/v4/media/session/a;->L(Landroid/graphics/Bitmap;F)Landroid/graphics/Bitmap;

    .line 499
    .line 500
    .line 501
    move-result-object p0

    .line 502
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 503
    .line 504
    .line 505
    invoke-static {p0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->r(Landroid/graphics/Bitmap;)Le1/c;

    .line 506
    .line 507
    .line 508
    move-result-object p0

    .line 509
    return-object p0

    .line 510
    :catch_6
    move-exception p0

    .line 511
    goto :goto_e

    .line 512
    :cond_14
    :goto_a
    if-eqz v0, :cond_15

    .line 513
    .line 514
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 515
    .line 516
    .line 517
    move-result-wide v4

    .line 518
    float-to-double v6, p2

    .line 519
    mul-double/2addr v4, v6

    .line 520
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 521
    .line 522
    .line 523
    move-result-object p0

    .line 524
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 525
    .line 526
    .line 527
    move-result p0

    .line 528
    goto :goto_b

    .line 529
    :cond_15
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 530
    .line 531
    .line 532
    move-result p0

    .line 533
    :goto_b
    if-eqz v1, :cond_16

    .line 534
    .line 535
    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    .line 536
    .line 537
    .line 538
    move-result-wide v4

    .line 539
    float-to-double v6, p2

    .line 540
    mul-double/2addr v4, v6

    .line 541
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 542
    .line 543
    .line 544
    move-result-object p2

    .line 545
    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    .line 546
    .line 547
    .line 548
    move-result p2

    .line 549
    goto :goto_c

    .line 550
    :cond_16
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 551
    .line 552
    .line 553
    move-result p2

    .line 554
    :goto_c
    if-eqz v0, :cond_17

    .line 555
    .line 556
    if-nez v1, :cond_17

    .line 557
    .line 558
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 559
    .line 560
    .line 561
    move-result p2

    .line 562
    int-to-double v0, p2

    .line 563
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 564
    .line 565
    .line 566
    move-result p2

    .line 567
    int-to-double v4, p2

    .line 568
    div-double/2addr v0, v4

    .line 569
    int-to-double v4, p0

    .line 570
    mul-double/2addr v4, v0

    .line 571
    double-to-int p2, v4

    .line 572
    goto :goto_d

    .line 573
    :cond_17
    if-eqz v1, :cond_18

    .line 574
    .line 575
    if-nez v0, :cond_18

    .line 576
    .line 577
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 578
    .line 579
    .line 580
    move-result p0

    .line 581
    int-to-double v0, p0

    .line 582
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 583
    .line 584
    .line 585
    move-result p0

    .line 586
    int-to-double v4, p0

    .line 587
    div-double/2addr v0, v4

    .line 588
    int-to-double v4, p2

    .line 589
    mul-double/2addr v4, v0

    .line 590
    double-to-int p0, v4

    .line 591
    :cond_18
    :goto_d
    invoke-static {p1, p0, p2}, Landroid/support/v4/media/session/a;->M(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    .line 592
    .line 593
    .line 594
    move-result-object p0

    .line 595
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 596
    .line 597
    .line 598
    invoke-static {p0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->r(Landroid/graphics/Bitmap;)Le1/c;

    .line 599
    .line 600
    .line 601
    move-result-object p0

    .line 602
    return-object p0

    .line 603
    :cond_19
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 604
    .line 605
    invoke-direct {p0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 606
    .line 607
    .line 608
    throw p0
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_6

    .line 609
    :goto_e
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 610
    .line 611
    invoke-direct {p1, v3, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 612
    .line 613
    .line 614
    throw p1

    .line 615
    :cond_1a
    instance-of v0, p0, Ls3/J;

    .line 616
    .line 617
    if-eqz v0, :cond_1b

    .line 618
    .line 619
    check-cast p0, Ls3/J;

    .line 620
    .line 621
    :try_start_9
    invoke-static {p0, p1, p2, p3}, Landroid/support/v4/media/session/a;->q(Ls3/J;Landroid/content/res/AssetManager;FLN1/e;)Le1/s;

    .line 622
    .line 623
    .line 624
    move-result-object p0
    :try_end_9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_9 .. :try_end_9} :catch_8
    .catch Le1/x; {:try_start_9 .. :try_end_9} :catch_8

    .line 625
    :try_start_a
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 626
    .line 627
    .line 628
    invoke-static {p0}, LN1/e;->c(Le1/s;)Le1/c;

    .line 629
    .line 630
    .line 631
    move-result-object p0
    :try_end_a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_a .. :try_end_a} :catch_8
    .catch Le1/x; {:try_start_a .. :try_end_a} :catch_7

    .line 632
    return-object p0

    .line 633
    :catch_7
    move-exception p0

    .line 634
    goto :goto_f

    .line 635
    :catch_8
    move-exception p0

    .line 636
    :goto_f
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 637
    .line 638
    const-string p2, "Unable to interpret pin config as a valid image."

    .line 639
    .line 640
    invoke-direct {p1, p2, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 641
    .line 642
    .line 643
    throw p1

    .line 644
    :cond_1b
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 645
    .line 646
    const-string p1, "PlatformBitmap did not contain a supported subtype."

    .line 647
    .line 648
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 649
    .line 650
    .line 651
    throw p0
.end method

.method public static L(Landroid/graphics/Bitmap;F)Landroid/graphics/Bitmap;
    .locals 2

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    sub-float v0, p1, v0

    .line 4
    .line 5
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const v1, 0x3a83126f    # 0.001f

    .line 10
    .line 11
    .line 12
    cmpl-float v0, v0, v1

    .line 13
    .line 14
    if-lez v0, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    cmpl-float v0, p1, v0

    .line 18
    .line 19
    if-lez v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    int-to-float v0, v0

    .line 26
    mul-float/2addr v0, p1

    .line 27
    float-to-int v0, v0

    .line 28
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    int-to-float v1, v1

    .line 33
    mul-float/2addr v1, p1

    .line 34
    float-to-int p1, v1

    .line 35
    invoke-static {p0, v0, p1}, Landroid/support/v4/media/session/a;->M(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    :cond_0
    return-object p0
.end method

.method public static M(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    if-lez p1, :cond_1

    .line 2
    .line 3
    if-lez p2, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-ne v0, p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eq v0, p2, :cond_1

    .line 16
    .line 17
    :cond_0
    const/4 v0, 0x1

    .line 18
    invoke-static {p0, p1, p2, v0}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    :cond_1
    return-object p0
.end method

.method public static N(Ljava/lang/Throwable;)Ljava/util/ArrayList;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    new-instance v1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v2, "Cause: "

    .line 28
    .line 29
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v2, ", Stacktrace: "

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    return-object v0
.end method

.method public static O(Ljava/lang/Throwable;)Ljava/util/ArrayList;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    new-instance v1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v2, "Cause: "

    .line 28
    .line 29
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v2, ", Stacktrace: "

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    return-object v0
.end method

.method public static P(Landroid/os/Parcel;ILandroid/os/Bundle;)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p0, p1}, Landroid/support/v4/media/session/a;->Z(Landroid/os/Parcel;I)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-virtual {p0, p2}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, p1}, Landroid/support/v4/media/session/a;->b0(Landroid/os/Parcel;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static Q(Landroid/os/Parcel;ILjava/lang/Float;)V
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const/4 v0, 0x4

    .line 5
    invoke-static {p0, p1, v0}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    invoke-virtual {p0, p1}, Landroid/os/Parcel;->writeFloat(F)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static R(Landroid/os/Parcel;ILandroid/os/IBinder;)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p0, p1}, Landroid/support/v4/media/session/a;->Z(Landroid/os/Parcel;I)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-virtual {p0, p2}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, p1}, Landroid/support/v4/media/session/a;->b0(Landroid/os/Parcel;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static T(Landroid/os/Parcel;ILandroid/os/Parcelable;I)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p0, p1}, Landroid/support/v4/media/session/a;->Z(Landroid/os/Parcel;I)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-interface {p2, p0, p3}, Landroid/os/Parcelable;->writeToParcel(Landroid/os/Parcel;I)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, p1}, Landroid/support/v4/media/session/a;->b0(Landroid/os/Parcel;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static U(Landroid/os/Parcel;ILjava/lang/String;)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p0, p1}, Landroid/support/v4/media/session/a;->Z(Landroid/os/Parcel;I)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-virtual {p0, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, p1}, Landroid/support/v4/media/session/a;->b0(Landroid/os/Parcel;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static V(Landroid/os/Parcel;I[Landroid/os/Parcelable;I)V
    .locals 6

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p0, p1}, Landroid/support/v4/media/session/a;->Z(Landroid/os/Parcel;I)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    array-length v0, p2

    .line 9
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    move v2, v1

    .line 14
    :goto_0
    if-ge v2, v0, :cond_2

    .line 15
    .line 16
    aget-object v3, p2, v2

    .line 17
    .line 18
    if-nez v3, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 21
    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    const/4 v5, 0x1

    .line 29
    invoke-virtual {p0, v5}, Landroid/os/Parcel;->writeInt(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    invoke-interface {v3, p0, p3}, Landroid/os/Parcelable;->writeToParcel(Landroid/os/Parcel;I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    invoke-virtual {p0, v4}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 44
    .line 45
    .line 46
    sub-int v4, v3, v5

    .line 47
    .line 48
    invoke-virtual {p0, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 52
    .line 53
    .line 54
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    invoke-static {p0, p1}, Landroid/support/v4/media/session/a;->b0(Landroid/os/Parcel;I)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public static W(Landroid/os/Parcel;ILjava/util/List;)V
    .locals 6

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p0, p1}, Landroid/support/v4/media/session/a;->Z(Landroid/os/Parcel;I)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    move v2, v1

    .line 17
    :goto_0
    if-ge v2, v0, :cond_2

    .line 18
    .line 19
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    check-cast v3, Landroid/os/Parcelable;

    .line 24
    .line 25
    if-nez v3, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 28
    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    const/4 v5, 0x1

    .line 36
    invoke-virtual {p0, v5}, Landroid/os/Parcel;->writeInt(I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 40
    .line 41
    .line 42
    move-result v5

    .line 43
    invoke-interface {v3, p0, v1}, Landroid/os/Parcelable;->writeToParcel(Landroid/os/Parcel;I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    invoke-virtual {p0, v4}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 51
    .line 52
    .line 53
    sub-int v4, v3, v5

    .line 54
    .line 55
    invoke-virtual {p0, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 59
    .line 60
    .line 61
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    invoke-static {p0, p1}, Landroid/support/v4/media/session/a;->b0(Landroid/os/Parcel;I)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public static X(Ljava/lang/Boolean;)B
    .locals 0

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_1
    const/4 p0, -0x1

    .line 14
    return p0
.end method

.method public static Y(Landroid/os/Parcel;II)V
    .locals 0

    .line 1
    shl-int/lit8 p2, p2, 0x10

    .line 2
    .line 3
    or-int/2addr p1, p2

    .line 4
    invoke-virtual {p0, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static Z(Landroid/os/Parcel;I)I
    .locals 1

    .line 1
    const/high16 v0, -0x10000

    .line 2
    .line 3
    or-int/2addr p1, v0

    .line 4
    invoke-virtual {p0, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-virtual {p0, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public static final a(Ljava/util/List;LI/l;LC3/c;)Ljava/lang/Object;
    .locals 6

    .line 1
    instance-of v0, p2, LI/f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, LI/f;

    .line 7
    .line 8
    iget v1, v0, LI/f;->k:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, LI/f;->k:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LI/f;

    .line 21
    .line 22
    invoke-direct {v0, p2}, LC3/c;-><init>(LA3/d;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, LI/f;->j:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, LI/f;->k:I

    .line 28
    .line 29
    const/4 v2, 0x2

    .line 30
    const/4 v3, 0x1

    .line 31
    sget-object v4, LB3/a;->e:LB3/a;

    .line 32
    .line 33
    if-eqz v1, :cond_3

    .line 34
    .line 35
    if-eq v1, v3, :cond_2

    .line 36
    .line 37
    if-ne v1, v2, :cond_1

    .line 38
    .line 39
    iget-object p0, v0, LI/f;->i:Ljava/util/Iterator;

    .line 40
    .line 41
    iget-object p1, v0, LI/f;->h:Ljava/io/Serializable;

    .line 42
    .line 43
    check-cast p1, LI3/p;

    .line 44
    .line 45
    :try_start_0
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    .line 47
    .line 48
    goto :goto_2

    .line 49
    :catchall_0
    move-exception p2

    .line 50
    goto :goto_3

    .line 51
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 52
    .line 53
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 54
    .line 55
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    throw p0

    .line 59
    :cond_2
    iget-object p0, v0, LI/f;->h:Ljava/io/Serializable;

    .line 60
    .line 61
    check-cast p0, Ljava/util/List;

    .line 62
    .line 63
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_3
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    new-instance p2, Ljava/util/ArrayList;

    .line 71
    .line 72
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 73
    .line 74
    .line 75
    new-instance v1, LI/h;

    .line 76
    .line 77
    const/4 v5, 0x0

    .line 78
    invoke-direct {v1, p0, p2, v5}, LI/h;-><init>(Ljava/util/List;Ljava/util/ArrayList;LA3/d;)V

    .line 79
    .line 80
    .line 81
    iput-object p2, v0, LI/f;->h:Ljava/io/Serializable;

    .line 82
    .line 83
    iput v3, v0, LI/f;->k:I

    .line 84
    .line 85
    invoke-virtual {p1, v1, v0}, LI/l;->a(LI/h;LC3/c;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    if-ne p0, v4, :cond_4

    .line 90
    .line 91
    goto :goto_4

    .line 92
    :cond_4
    move-object p0, p2

    .line 93
    :goto_1
    new-instance p1, LI3/p;

    .line 94
    .line 95
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    :cond_5
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 103
    .line 104
    .line 105
    move-result p2

    .line 106
    if-eqz p2, :cond_7

    .line 107
    .line 108
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object p2

    .line 112
    check-cast p2, LH3/l;

    .line 113
    .line 114
    :try_start_1
    iput-object p1, v0, LI/f;->h:Ljava/io/Serializable;

    .line 115
    .line 116
    iput-object p0, v0, LI/f;->i:Ljava/util/Iterator;

    .line 117
    .line 118
    iput v2, v0, LI/f;->k:I

    .line 119
    .line 120
    invoke-interface {p2, v0}, LH3/l;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 124
    if-ne p2, v4, :cond_5

    .line 125
    .line 126
    goto :goto_4

    .line 127
    :goto_3
    iget-object v1, p1, LI3/p;->e:Ljava/lang/Object;

    .line 128
    .line 129
    if-nez v1, :cond_6

    .line 130
    .line 131
    iput-object p2, p1, LI3/p;->e:Ljava/lang/Object;

    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_6
    check-cast v1, Ljava/lang/Throwable;

    .line 135
    .line 136
    invoke-static {v1, p2}, LT0/a;->b(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 137
    .line 138
    .line 139
    goto :goto_2

    .line 140
    :cond_7
    iget-object p0, p1, LI3/p;->e:Ljava/lang/Object;

    .line 141
    .line 142
    check-cast p0, Ljava/lang/Throwable;

    .line 143
    .line 144
    if-nez p0, :cond_8

    .line 145
    .line 146
    sget-object v4, Ly3/h;->a:Ly3/h;

    .line 147
    .line 148
    :goto_4
    return-object v4

    .line 149
    :cond_8
    throw p0
.end method

.method public static a0(B)Ljava/lang/Boolean;
    .locals 1

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return-object p0

    .line 8
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    return-object p0
.end method

.method public static b(Lcom/google/android/gms/maps/model/CameraPosition;)Ls3/K;
    .locals 5

    .line 1
    iget v0, p0, Lcom/google/android/gms/maps/model/CameraPosition;->h:F

    .line 2
    .line 3
    float-to-double v0, v0

    .line 4
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, p0, Lcom/google/android/gms/maps/model/CameraPosition;->e:Lcom/google/android/gms/maps/model/LatLng;

    .line 9
    .line 10
    invoke-static {v1}, Landroid/support/v4/media/session/a;->E(Lcom/google/android/gms/maps/model/LatLng;)Ls3/j0;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget v2, p0, Lcom/google/android/gms/maps/model/CameraPosition;->g:F

    .line 15
    .line 16
    float-to-double v2, v2

    .line 17
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget p0, p0, Lcom/google/android/gms/maps/model/CameraPosition;->f:F

    .line 22
    .line 23
    float-to-double v3, p0

    .line 24
    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    new-instance v3, Ls3/K;

    .line 29
    .line 30
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v0, v3, Ls3/K;->a:Ljava/lang/Double;

    .line 34
    .line 35
    iput-object v1, v3, Ls3/K;->b:Ls3/j0;

    .line 36
    .line 37
    iput-object v2, v3, Ls3/K;->c:Ljava/lang/Double;

    .line 38
    .line 39
    iput-object p0, v3, Ls3/K;->d:Ljava/lang/Double;

    .line 40
    .line 41
    return-object v3
.end method

.method public static b0(Landroid/os/Parcel;I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/os/Parcel;->dataPosition()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sub-int v1, v0, p1

    .line 6
    .line 7
    add-int/lit8 p1, p1, -0x4

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static c(Ls3/M;F)LA0/c;
    .locals 6

    .line 1
    iget-object p0, p0, Ls3/M;->a:Ljava/lang/Object;

    .line 2
    .line 3
    instance-of v0, p0, Ls3/N;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Ls3/N;

    .line 8
    .line 9
    iget-object p0, p0, Ls3/N;->a:Ls3/K;

    .line 10
    .line 11
    iget-object p1, p0, Ls3/K;->a:Ljava/lang/Double;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Double;->floatValue()F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iget-object v0, p0, Ls3/K;->b:Ls3/j0;

    .line 18
    .line 19
    invoke-static {v0}, Landroid/support/v4/media/session/a;->D(Ls3/j0;)Lcom/google/android/gms/maps/model/LatLng;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Ls3/K;->c:Ljava/lang/Double;

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/Double;->floatValue()F

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    iget-object p0, p0, Ls3/K;->d:Ljava/lang/Double;

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/lang/Double;->floatValue()F

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    new-instance v2, Lcom/google/android/gms/maps/model/CameraPosition;

    .line 36
    .line 37
    invoke-direct {v2, v0, p0, v1, p1}, Lcom/google/android/gms/maps/model/CameraPosition;-><init>(Lcom/google/android/gms/maps/model/LatLng;FFF)V

    .line 38
    .line 39
    .line 40
    :try_start_0
    new-instance p0, LA0/c;

    .line 41
    .line 42
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/i0;->U()Ld1/a;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, LY0/a;->c()Landroid/os/Parcel;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {v0, v2}, LZ0/r;->c(Landroid/os/Parcel;Landroid/os/Parcelable;)V

    .line 51
    .line 52
    .line 53
    const/4 v1, 0x7

    .line 54
    invoke-virtual {p1, v0, v1}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {v0}, LU0/b;->e(Landroid/os/IBinder;)LU0/a;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p1}, Landroid/os/Parcel;->recycle()V

    .line 67
    .line 68
    .line 69
    invoke-direct {p0, v0}, LA0/c;-><init>(LU0/a;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    .line 71
    .line 72
    return-object p0

    .line 73
    :catch_0
    move-exception p0

    .line 74
    new-instance p1, Le1/x;

    .line 75
    .line 76
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 77
    .line 78
    .line 79
    throw p1

    .line 80
    :cond_0
    instance-of v0, p0, Ls3/O;

    .line 81
    .line 82
    if-eqz v0, :cond_1

    .line 83
    .line 84
    check-cast p0, Ls3/O;

    .line 85
    .line 86
    iget-object p0, p0, Ls3/O;->a:Ls3/j0;

    .line 87
    .line 88
    invoke-static {p0}, Landroid/support/v4/media/session/a;->D(Ls3/j0;)Lcom/google/android/gms/maps/model/LatLng;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    :try_start_1
    new-instance p1, LA0/c;

    .line 93
    .line 94
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/i0;->U()Ld1/a;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-static {v1, p0}, LZ0/r;->c(Landroid/os/Parcel;Landroid/os/Parcelable;)V

    .line 103
    .line 104
    .line 105
    const/16 p0, 0x8

    .line 106
    .line 107
    invoke-virtual {v0, v1, p0}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-virtual {p0}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-static {v0}, LU0/b;->e(Landroid/os/IBinder;)LU0/a;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {p0}, Landroid/os/Parcel;->recycle()V

    .line 120
    .line 121
    .line 122
    invoke-direct {p1, v0}, LA0/c;-><init>(LU0/a;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 123
    .line 124
    .line 125
    return-object p1

    .line 126
    :catch_1
    move-exception p0

    .line 127
    new-instance p1, Le1/x;

    .line 128
    .line 129
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 130
    .line 131
    .line 132
    throw p1

    .line 133
    :cond_1
    instance-of v0, p0, Ls3/Q;

    .line 134
    .line 135
    if-eqz v0, :cond_2

    .line 136
    .line 137
    check-cast p0, Ls3/Q;

    .line 138
    .line 139
    iget-object p1, p0, Ls3/Q;->a:Ls3/j0;

    .line 140
    .line 141
    invoke-static {p1}, Landroid/support/v4/media/session/a;->D(Ls3/j0;)Lcom/google/android/gms/maps/model/LatLng;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    iget-object p0, p0, Ls3/Q;->b:Ljava/lang/Double;

    .line 146
    .line 147
    invoke-virtual {p0}, Ljava/lang/Double;->floatValue()F

    .line 148
    .line 149
    .line 150
    move-result p0

    .line 151
    :try_start_2
    new-instance v0, LA0/c;

    .line 152
    .line 153
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/i0;->U()Ld1/a;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    invoke-static {v2, p1}, LZ0/r;->c(Landroid/os/Parcel;Landroid/os/Parcelable;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v2, p0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 165
    .line 166
    .line 167
    const/16 p0, 0x9

    .line 168
    .line 169
    invoke-virtual {v1, v2, p0}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    invoke-virtual {p0}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    invoke-static {p1}, LU0/b;->e(Landroid/os/IBinder;)LU0/a;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    invoke-virtual {p0}, Landroid/os/Parcel;->recycle()V

    .line 182
    .line 183
    .line 184
    invoke-direct {v0, p1}, LA0/c;-><init>(LU0/a;)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_2

    .line 185
    .line 186
    .line 187
    return-object v0

    .line 188
    :catch_2
    move-exception p0

    .line 189
    new-instance p1, Le1/x;

    .line 190
    .line 191
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 192
    .line 193
    .line 194
    throw p1

    .line 195
    :cond_2
    instance-of v0, p0, Ls3/P;

    .line 196
    .line 197
    if-eqz v0, :cond_3

    .line 198
    .line 199
    check-cast p0, Ls3/P;

    .line 200
    .line 201
    iget-object v0, p0, Ls3/P;->a:Ls3/k0;

    .line 202
    .line 203
    new-instance v1, Lcom/google/android/gms/maps/model/LatLngBounds;

    .line 204
    .line 205
    iget-object v2, v0, Ls3/k0;->b:Ls3/j0;

    .line 206
    .line 207
    invoke-static {v2}, Landroid/support/v4/media/session/a;->D(Ls3/j0;)Lcom/google/android/gms/maps/model/LatLng;

    .line 208
    .line 209
    .line 210
    move-result-object v2

    .line 211
    iget-object v0, v0, Ls3/k0;->a:Ls3/j0;

    .line 212
    .line 213
    invoke-static {v0}, Landroid/support/v4/media/session/a;->D(Ls3/j0;)Lcom/google/android/gms/maps/model/LatLng;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    invoke-direct {v1, v2, v0}, Lcom/google/android/gms/maps/model/LatLngBounds;-><init>(Lcom/google/android/gms/maps/model/LatLng;Lcom/google/android/gms/maps/model/LatLng;)V

    .line 218
    .line 219
    .line 220
    iget-object p0, p0, Ls3/P;->b:Ljava/lang/Double;

    .line 221
    .line 222
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 223
    .line 224
    .line 225
    move-result-wide v2

    .line 226
    float-to-double p0, p1

    .line 227
    mul-double/2addr v2, p0

    .line 228
    double-to-int p0, v2

    .line 229
    :try_start_3
    new-instance p1, LA0/c;

    .line 230
    .line 231
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/i0;->U()Ld1/a;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 236
    .line 237
    .line 238
    move-result-object v2

    .line 239
    invoke-static {v2, v1}, LZ0/r;->c(Landroid/os/Parcel;Landroid/os/Parcelable;)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {v2, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 243
    .line 244
    .line 245
    const/16 p0, 0xa

    .line 246
    .line 247
    invoke-virtual {v0, v2, p0}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 248
    .line 249
    .line 250
    move-result-object p0

    .line 251
    invoke-virtual {p0}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    invoke-static {v0}, LU0/b;->e(Landroid/os/IBinder;)LU0/a;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    invoke-virtual {p0}, Landroid/os/Parcel;->recycle()V

    .line 260
    .line 261
    .line 262
    invoke-direct {p1, v0}, LA0/c;-><init>(LU0/a;)V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_3

    .line 263
    .line 264
    .line 265
    return-object p1

    .line 266
    :catch_3
    move-exception p0

    .line 267
    new-instance p1, Le1/x;

    .line 268
    .line 269
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 270
    .line 271
    .line 272
    throw p1

    .line 273
    :cond_3
    instance-of v0, p0, Ls3/S;

    .line 274
    .line 275
    if-eqz v0, :cond_4

    .line 276
    .line 277
    check-cast p0, Ls3/S;

    .line 278
    .line 279
    iget-object v0, p0, Ls3/S;->a:Ljava/lang/Double;

    .line 280
    .line 281
    invoke-virtual {v0}, Ljava/lang/Double;->floatValue()F

    .line 282
    .line 283
    .line 284
    move-result v0

    .line 285
    mul-float/2addr v0, p1

    .line 286
    iget-object p0, p0, Ls3/S;->b:Ljava/lang/Double;

    .line 287
    .line 288
    invoke-virtual {p0}, Ljava/lang/Double;->floatValue()F

    .line 289
    .line 290
    .line 291
    move-result p0

    .line 292
    mul-float/2addr p0, p1

    .line 293
    :try_start_4
    new-instance p1, LA0/c;

    .line 294
    .line 295
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/i0;->U()Ld1/a;

    .line 296
    .line 297
    .line 298
    move-result-object v1

    .line 299
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 300
    .line 301
    .line 302
    move-result-object v2

    .line 303
    invoke-virtual {v2, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 304
    .line 305
    .line 306
    invoke-virtual {v2, p0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 307
    .line 308
    .line 309
    const/4 p0, 0x3

    .line 310
    invoke-virtual {v1, v2, p0}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 311
    .line 312
    .line 313
    move-result-object p0

    .line 314
    invoke-virtual {p0}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 315
    .line 316
    .line 317
    move-result-object v0

    .line 318
    invoke-static {v0}, LU0/b;->e(Landroid/os/IBinder;)LU0/a;

    .line 319
    .line 320
    .line 321
    move-result-object v0

    .line 322
    invoke-virtual {p0}, Landroid/os/Parcel;->recycle()V

    .line 323
    .line 324
    .line 325
    invoke-direct {p1, v0}, LA0/c;-><init>(LU0/a;)V
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_4

    .line 326
    .line 327
    .line 328
    return-object p1

    .line 329
    :catch_4
    move-exception p0

    .line 330
    new-instance p1, Le1/x;

    .line 331
    .line 332
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 333
    .line 334
    .line 335
    throw p1

    .line 336
    :cond_4
    instance-of v0, p0, Ls3/U;

    .line 337
    .line 338
    if-eqz v0, :cond_7

    .line 339
    .line 340
    check-cast p0, Ls3/U;

    .line 341
    .line 342
    iget-object v0, p0, Ls3/U;->b:Ls3/c0;

    .line 343
    .line 344
    if-nez v0, :cond_5

    .line 345
    .line 346
    const/4 p1, 0x0

    .line 347
    goto :goto_0

    .line 348
    :cond_5
    new-instance v1, Landroid/graphics/Point;

    .line 349
    .line 350
    iget-object v2, v0, Ls3/c0;->a:Ljava/lang/Double;

    .line 351
    .line 352
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    .line 353
    .line 354
    .line 355
    move-result-wide v2

    .line 356
    float-to-double v4, p1

    .line 357
    mul-double/2addr v2, v4

    .line 358
    double-to-int p1, v2

    .line 359
    iget-object v0, v0, Ls3/c0;->b:Ljava/lang/Double;

    .line 360
    .line 361
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 362
    .line 363
    .line 364
    move-result-wide v2

    .line 365
    mul-double/2addr v2, v4

    .line 366
    double-to-int v0, v2

    .line 367
    invoke-direct {v1, p1, v0}, Landroid/graphics/Point;-><init>(II)V

    .line 368
    .line 369
    .line 370
    move-object p1, v1

    .line 371
    :goto_0
    if-eqz p1, :cond_6

    .line 372
    .line 373
    iget-object p0, p0, Ls3/U;->a:Ljava/lang/Double;

    .line 374
    .line 375
    invoke-virtual {p0}, Ljava/lang/Double;->floatValue()F

    .line 376
    .line 377
    .line 378
    move-result p0

    .line 379
    :try_start_5
    new-instance v0, LA0/c;

    .line 380
    .line 381
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/i0;->U()Ld1/a;

    .line 382
    .line 383
    .line 384
    move-result-object v1

    .line 385
    iget v2, p1, Landroid/graphics/Point;->x:I

    .line 386
    .line 387
    iget p1, p1, Landroid/graphics/Point;->y:I

    .line 388
    .line 389
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 390
    .line 391
    .line 392
    move-result-object v3

    .line 393
    invoke-virtual {v3, p0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 394
    .line 395
    .line 396
    invoke-virtual {v3, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 397
    .line 398
    .line 399
    invoke-virtual {v3, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 400
    .line 401
    .line 402
    const/4 p0, 0x6

    .line 403
    invoke-virtual {v1, v3, p0}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 404
    .line 405
    .line 406
    move-result-object p0

    .line 407
    invoke-virtual {p0}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 408
    .line 409
    .line 410
    move-result-object p1

    .line 411
    invoke-static {p1}, LU0/b;->e(Landroid/os/IBinder;)LU0/a;

    .line 412
    .line 413
    .line 414
    move-result-object p1

    .line 415
    invoke-virtual {p0}, Landroid/os/Parcel;->recycle()V

    .line 416
    .line 417
    .line 418
    invoke-direct {v0, p1}, LA0/c;-><init>(LU0/a;)V
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_5

    .line 419
    .line 420
    .line 421
    return-object v0

    .line 422
    :catch_5
    move-exception p0

    .line 423
    new-instance p1, Le1/x;

    .line 424
    .line 425
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 426
    .line 427
    .line 428
    throw p1

    .line 429
    :cond_6
    iget-object p0, p0, Ls3/U;->a:Ljava/lang/Double;

    .line 430
    .line 431
    invoke-virtual {p0}, Ljava/lang/Double;->floatValue()F

    .line 432
    .line 433
    .line 434
    move-result p0

    .line 435
    :try_start_6
    new-instance p1, LA0/c;

    .line 436
    .line 437
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/i0;->U()Ld1/a;

    .line 438
    .line 439
    .line 440
    move-result-object v0

    .line 441
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 442
    .line 443
    .line 444
    move-result-object v1

    .line 445
    invoke-virtual {v1, p0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 446
    .line 447
    .line 448
    const/4 p0, 0x5

    .line 449
    invoke-virtual {v0, v1, p0}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 450
    .line 451
    .line 452
    move-result-object p0

    .line 453
    invoke-virtual {p0}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 454
    .line 455
    .line 456
    move-result-object v0

    .line 457
    invoke-static {v0}, LU0/b;->e(Landroid/os/IBinder;)LU0/a;

    .line 458
    .line 459
    .line 460
    move-result-object v0

    .line 461
    invoke-virtual {p0}, Landroid/os/Parcel;->recycle()V

    .line 462
    .line 463
    .line 464
    invoke-direct {p1, v0}, LA0/c;-><init>(LU0/a;)V
    :try_end_6
    .catch Landroid/os/RemoteException; {:try_start_6 .. :try_end_6} :catch_6

    .line 465
    .line 466
    .line 467
    return-object p1

    .line 468
    :catch_6
    move-exception p0

    .line 469
    new-instance p1, Le1/x;

    .line 470
    .line 471
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 472
    .line 473
    .line 474
    throw p1

    .line 475
    :cond_7
    instance-of p1, p0, Ls3/V;

    .line 476
    .line 477
    if-eqz p1, :cond_8

    .line 478
    .line 479
    check-cast p0, Ls3/V;

    .line 480
    .line 481
    iget-object p0, p0, Ls3/V;->a:Ljava/lang/Double;

    .line 482
    .line 483
    invoke-virtual {p0}, Ljava/lang/Double;->floatValue()F

    .line 484
    .line 485
    .line 486
    move-result p0

    .line 487
    :try_start_7
    new-instance p1, LA0/c;

    .line 488
    .line 489
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/i0;->U()Ld1/a;

    .line 490
    .line 491
    .line 492
    move-result-object v0

    .line 493
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 494
    .line 495
    .line 496
    move-result-object v1

    .line 497
    invoke-virtual {v1, p0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 498
    .line 499
    .line 500
    const/4 p0, 0x4

    .line 501
    invoke-virtual {v0, v1, p0}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 502
    .line 503
    .line 504
    move-result-object p0

    .line 505
    invoke-virtual {p0}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 506
    .line 507
    .line 508
    move-result-object v0

    .line 509
    invoke-static {v0}, LU0/b;->e(Landroid/os/IBinder;)LU0/a;

    .line 510
    .line 511
    .line 512
    move-result-object v0

    .line 513
    invoke-virtual {p0}, Landroid/os/Parcel;->recycle()V

    .line 514
    .line 515
    .line 516
    invoke-direct {p1, v0}, LA0/c;-><init>(LU0/a;)V
    :try_end_7
    .catch Landroid/os/RemoteException; {:try_start_7 .. :try_end_7} :catch_7

    .line 517
    .line 518
    .line 519
    return-object p1

    .line 520
    :catch_7
    move-exception p0

    .line 521
    new-instance p1, Le1/x;

    .line 522
    .line 523
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 524
    .line 525
    .line 526
    throw p1

    .line 527
    :cond_8
    instance-of p1, p0, Ls3/T;

    .line 528
    .line 529
    if-eqz p1, :cond_a

    .line 530
    .line 531
    check-cast p0, Ls3/T;

    .line 532
    .line 533
    iget-object p0, p0, Ls3/T;->a:Ljava/lang/Boolean;

    .line 534
    .line 535
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 536
    .line 537
    .line 538
    move-result p0

    .line 539
    if-eqz p0, :cond_9

    .line 540
    .line 541
    :try_start_8
    new-instance p0, LA0/c;

    .line 542
    .line 543
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/i0;->U()Ld1/a;

    .line 544
    .line 545
    .line 546
    move-result-object p1

    .line 547
    invoke-virtual {p1}, LY0/a;->c()Landroid/os/Parcel;

    .line 548
    .line 549
    .line 550
    move-result-object v0

    .line 551
    const/4 v1, 0x2

    .line 552
    invoke-virtual {p1, v0, v1}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 553
    .line 554
    .line 555
    move-result-object p1

    .line 556
    invoke-virtual {p1}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 557
    .line 558
    .line 559
    move-result-object v0

    .line 560
    invoke-static {v0}, LU0/b;->e(Landroid/os/IBinder;)LU0/a;

    .line 561
    .line 562
    .line 563
    move-result-object v0

    .line 564
    invoke-virtual {p1}, Landroid/os/Parcel;->recycle()V

    .line 565
    .line 566
    .line 567
    invoke-direct {p0, v0}, LA0/c;-><init>(LU0/a;)V
    :try_end_8
    .catch Landroid/os/RemoteException; {:try_start_8 .. :try_end_8} :catch_8

    .line 568
    .line 569
    .line 570
    return-object p0

    .line 571
    :catch_8
    move-exception p0

    .line 572
    new-instance p1, Le1/x;

    .line 573
    .line 574
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 575
    .line 576
    .line 577
    throw p1

    .line 578
    :cond_9
    :try_start_9
    new-instance p0, LA0/c;

    .line 579
    .line 580
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/i0;->U()Ld1/a;

    .line 581
    .line 582
    .line 583
    move-result-object p1

    .line 584
    invoke-virtual {p1}, LY0/a;->c()Landroid/os/Parcel;

    .line 585
    .line 586
    .line 587
    move-result-object v0

    .line 588
    const/4 v1, 0x1

    .line 589
    invoke-virtual {p1, v0, v1}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 590
    .line 591
    .line 592
    move-result-object p1

    .line 593
    invoke-virtual {p1}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 594
    .line 595
    .line 596
    move-result-object v0

    .line 597
    invoke-static {v0}, LU0/b;->e(Landroid/os/IBinder;)LU0/a;

    .line 598
    .line 599
    .line 600
    move-result-object v0

    .line 601
    invoke-virtual {p1}, Landroid/os/Parcel;->recycle()V

    .line 602
    .line 603
    .line 604
    invoke-direct {p0, v0}, LA0/c;-><init>(LU0/a;)V
    :try_end_9
    .catch Landroid/os/RemoteException; {:try_start_9 .. :try_end_9} :catch_9

    .line 605
    .line 606
    .line 607
    return-object p0

    .line 608
    :catch_9
    move-exception p0

    .line 609
    new-instance p1, Le1/x;

    .line 610
    .line 611
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 612
    .line 613
    .line 614
    throw p1

    .line 615
    :cond_a
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 616
    .line 617
    const-string p1, "PlatformCameraUpdate\'s cameraUpdate field must be one of the PlatformCameraUpdate... case classes."

    .line 618
    .line 619
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 620
    .line 621
    .line 622
    throw p0
.end method

.method public static d(Ls3/W;Landroid/content/res/AssetManager;F)Le1/e;
    .locals 4

    .line 1
    iget-object v0, p0, Ls3/W;->a:Ls3/X;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-eq v0, v1, :cond_3

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    if-eq v0, v1, :cond_2

    .line 14
    .line 15
    const/4 v1, 0x3

    .line 16
    if-ne v0, v1, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Ls3/W;->c:Ljava/lang/Double;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    new-instance v0, Le1/h;

    .line 23
    .line 24
    iget-object v1, p0, Ls3/W;->b:Ls3/C;

    .line 25
    .line 26
    new-instance v2, LN1/e;

    .line 27
    .line 28
    const/16 v3, 0x10

    .line 29
    .line 30
    invoke-direct {v2, v3}, LN1/e;-><init>(I)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1, p1, p2, v2}, Landroid/support/v4/media/session/a;->K(Ls3/C;Landroid/content/res/AssetManager;FLN1/e;)Le1/c;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget-object p0, p0, Ls3/W;->c:Ljava/lang/Double;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/Double;->floatValue()F

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    invoke-direct {v0, p1, p0}, Le1/h;-><init>(Le1/c;F)V

    .line 44
    .line 45
    .line 46
    return-object v0

    .line 47
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 48
    .line 49
    const-string p1, "A Custom Cap must specify a refWidth value."

    .line 50
    .line 51
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    throw p0

    .line 55
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 56
    .line 57
    new-instance p2, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string v0, "Unrecognized PlatformCap type: "

    .line 60
    .line 61
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Ls3/W;->a:Ls3/X;

    .line 65
    .line 66
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    throw p1

    .line 77
    :cond_2
    new-instance p0, Le1/d;

    .line 78
    .line 79
    const/4 p1, 0x2

    .line 80
    invoke-direct {p0, p1}, Le1/d;-><init>(I)V

    .line 81
    .line 82
    .line 83
    return-object p0

    .line 84
    :cond_3
    new-instance p0, Le1/d;

    .line 85
    .line 86
    const/4 p1, 0x1

    .line 87
    invoke-direct {p0, p1}, Le1/d;-><init>(I)V

    .line 88
    .line 89
    .line 90
    return-object p0

    .line 91
    :cond_4
    new-instance p0, Le1/d;

    .line 92
    .line 93
    const/4 p1, 0x0

    .line 94
    invoke-direct {p0, p1}, Le1/d;-><init>(I)V

    .line 95
    .line 96
    .line 97
    return-object p0
.end method

.method public static e(Ljava/lang/String;Li2/a;)Ls3/Z;
    .locals 7

    .line 1
    invoke-interface {p1}, Li2/a;->c()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    new-array v1, v0, [Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {p1}, Li2/a;->b()Ljava/util/Collection;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    new-array v3, v0, [Ls3/t;

    .line 12
    .line 13
    invoke-interface {v2, v3}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, [Ls3/t;

    .line 18
    .line 19
    invoke-static {}, Lcom/google/android/gms/maps/model/LatLngBounds;->a()Le1/m;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    const/4 v4, 0x0

    .line 24
    :goto_0
    if-ge v4, v0, :cond_0

    .line 25
    .line 26
    aget-object v5, v2, v4

    .line 27
    .line 28
    iget-object v6, v5, Ls3/t;->a:Le1/p;

    .line 29
    .line 30
    iget-object v6, v6, Le1/p;->e:Lcom/google/android/gms/maps/model/LatLng;

    .line 31
    .line 32
    invoke-virtual {v3, v6}, Le1/m;->b(Lcom/google/android/gms/maps/model/LatLng;)V

    .line 33
    .line 34
    .line 35
    iget-object v5, v5, Ls3/t;->d:Ljava/lang/String;

    .line 36
    .line 37
    aput-object v5, v1, v4

    .line 38
    .line 39
    add-int/lit8 v4, v4, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    invoke-interface {p1}, Li2/a;->getPosition()Lcom/google/android/gms/maps/model/LatLng;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {p1}, Landroid/support/v4/media/session/a;->E(Lcom/google/android/gms/maps/model/LatLng;)Ls3/j0;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {v3}, Le1/m;->a()Lcom/google/android/gms/maps/model/LatLngBounds;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {v0}, Landroid/support/v4/media/session/a;->C(Lcom/google/android/gms/maps/model/LatLngBounds;)Ls3/k0;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    new-instance v2, Ls3/Z;

    .line 63
    .line 64
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 65
    .line 66
    .line 67
    if-eqz p0, :cond_2

    .line 68
    .line 69
    iput-object p0, v2, Ls3/Z;->a:Ljava/lang/String;

    .line 70
    .line 71
    iput-object p1, v2, Ls3/Z;->b:Ls3/j0;

    .line 72
    .line 73
    iput-object v0, v2, Ls3/Z;->c:Ls3/k0;

    .line 74
    .line 75
    if-eqz v1, :cond_1

    .line 76
    .line 77
    iput-object v1, v2, Ls3/Z;->d:Ljava/util/List;

    .line 78
    .line 79
    return-object v2

    .line 80
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 81
    .line 82
    const-string p1, "Nonnull field \"markerIds\" is null."

    .line 83
    .line 84
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    throw p0

    .line 88
    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 89
    .line 90
    const-string p1, "Nonnull field \"clusterManagerId\" is null."

    .line 91
    .line 92
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    throw p0
.end method

.method public static f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 1
    invoke-static {p0}, Landroid/support/v4/media/session/a;->s(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x3

    .line 6
    invoke-static {p0, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public static g(Ljava/lang/String;)[B
    .locals 6

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    rem-int/lit8 v0, v0, 0x2

    .line 6
    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    div-int/lit8 v0, v0, 0x2

    .line 14
    .line 15
    new-array v1, v0, [B

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    :goto_0
    if-ge v2, v0, :cond_1

    .line 19
    .line 20
    mul-int/lit8 v3, v2, 0x2

    .line 21
    .line 22
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    const/16 v5, 0x10

    .line 27
    .line 28
    invoke-static {v4, v5}, Ljava/lang/Character;->digit(CI)I

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    add-int/lit8 v3, v3, 0x1

    .line 33
    .line 34
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    invoke-static {v3, v5}, Ljava/lang/Character;->digit(CI)I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    const/4 v5, -0x1

    .line 43
    if-eq v4, v5, :cond_0

    .line 44
    .line 45
    if-eq v3, v5, :cond_0

    .line 46
    .line 47
    mul-int/lit8 v4, v4, 0x10

    .line 48
    .line 49
    add-int/2addr v4, v3

    .line 50
    int-to-byte v3, v4

    .line 51
    aput-byte v3, v1, v2

    .line 52
    .line 53
    add-int/lit8 v2, v2, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 57
    .line 58
    const-string v0, "input is not hexadecimal"

    .line 59
    .line 60
    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    throw p0

    .line 64
    :cond_1
    return-object v1

    .line 65
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 66
    .line 67
    const-string v0, "Expected a string of even length"

    .line 68
    .line 69
    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    throw p0
.end method

.method public static h()Z
    .locals 6

    .line 1
    const-string v0, "delivery_metrics_exported_to_big_query_enabled"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    invoke-static {}, LA1/g;->d()LA1/g;
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1

    .line 5
    .line 6
    .line 7
    invoke-static {}, LA1/g;->d()LA1/g;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2}, LA1/g;->a()V

    .line 12
    .line 13
    .line 14
    iget-object v2, v2, LA1/g;->a:Landroid/content/Context;

    .line 15
    .line 16
    const-string v3, "com.google.firebase.messaging"

    .line 17
    .line 18
    invoke-virtual {v2, v3, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    const-string v4, "export_to_big_query"

    .line 23
    .line 24
    invoke-interface {v3, v4}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v5

    .line 28
    if-eqz v5, :cond_0

    .line 29
    .line 30
    invoke-interface {v3, v4, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    return v0

    .line 35
    :cond_0
    :try_start_1
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    if-eqz v3, :cond_1

    .line 40
    .line 41
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    const/16 v4, 0x80

    .line 46
    .line 47
    invoke-virtual {v3, v2, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    if-eqz v2, :cond_1

    .line 52
    .line 53
    iget-object v3, v2, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    .line 54
    .line 55
    if-eqz v3, :cond_1

    .line 56
    .line 57
    invoke-virtual {v3, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    if-eqz v3, :cond_1

    .line 62
    .line 63
    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    .line 64
    .line 65
    invoke-virtual {v2, v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 66
    .line 67
    .line 68
    move-result v0
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    .line 69
    return v0

    .line 70
    :catch_0
    :cond_1
    return v1

    .line 71
    :catch_1
    const-string v0, "FirebaseMessaging"

    .line 72
    .line 73
    const-string v2, "FirebaseApp has not being initialized. Device might be in direct boot mode. Skip exporting delivery metrics to Big Query"

    .line 74
    .line 75
    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    return v1
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 1

    .line 1
    invoke-static {p0}, Landroid/support/v4/media/session/a;->s(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x6

    .line 6
    invoke-static {p0, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-static {p0, p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static j([B)Ljava/lang/String;
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    array-length v1, p0

    .line 4
    mul-int/lit8 v1, v1, 0x2

    .line 5
    .line 6
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 7
    .line 8
    .line 9
    array-length v1, p0

    .line 10
    const/4 v2, 0x0

    .line 11
    :goto_0
    if-ge v2, v1, :cond_0

    .line 12
    .line 13
    aget-byte v3, p0, v2

    .line 14
    .line 15
    and-int/lit16 v3, v3, 0xff

    .line 16
    .line 17
    div-int/lit8 v4, v3, 0x10

    .line 18
    .line 19
    const-string v5, "0123456789abcdef"

    .line 20
    .line 21
    invoke-virtual {v5, v4}, Ljava/lang/String;->charAt(I)C

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    rem-int/lit8 v3, v3, 0x10

    .line 29
    .line 30
    invoke-virtual {v5, v3}, Ljava/lang/String;->charAt(I)C

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    add-int/lit8 v2, v2, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public static l(I)I
    .locals 5

    .line 1
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const-string p0, "android.support.v4.media.session.a"

    .line 9
    .line 10
    const-string v0, "No cameras!"

    .line 11
    .line 12
    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    return v1

    .line 16
    :cond_0
    const/4 v2, 0x0

    .line 17
    if-ltz p0, :cond_1

    .line 18
    .line 19
    const/4 v3, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_1
    move v3, v2

    .line 22
    :goto_0
    if-nez v3, :cond_3

    .line 23
    .line 24
    move p0, v2

    .line 25
    :goto_1
    if-ge p0, v0, :cond_3

    .line 26
    .line 27
    new-instance v4, Landroid/hardware/Camera$CameraInfo;

    .line 28
    .line 29
    invoke-direct {v4}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {p0, v4}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 33
    .line 34
    .line 35
    iget v4, v4, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 36
    .line 37
    if-nez v4, :cond_2

    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_2
    add-int/lit8 p0, p0, 0x1

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_3
    :goto_2
    if-ge p0, v0, :cond_4

    .line 44
    .line 45
    return p0

    .line 46
    :cond_4
    if-eqz v3, :cond_5

    .line 47
    .line 48
    return v1

    .line 49
    :cond_5
    return v2
.end method

.method public static final o(LM/b;LM/d;Ljava/io/Serializable;)Ljava/lang/Object;
    .locals 1

    .line 1
    const-string v0, "<this>"

    .line 2
    .line 3
    invoke-static {p0, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "key"

    .line 7
    .line 8
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, LM/b;->c(LM/d;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    return-object p2

    .line 18
    :cond_0
    return-object p0
.end method

.method public static q(Ls3/J;Landroid/content/res/AssetManager;FLN1/e;)Le1/s;
    .locals 6

    .line 1
    iget-object v0, p0, Ls3/J;->a:Ls3/b0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    move-object v0, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, v0, Ls3/b0;->a:Ljava/lang/Long;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Long;->intValue()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    :goto_0
    iget-object v2, p0, Ls3/J;->b:Ls3/b0;

    .line 19
    .line 20
    if-nez v2, :cond_1

    .line 21
    .line 22
    move-object v2, v1

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    iget-object v2, v2, Ls3/b0;->a:Ljava/lang/Long;

    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/lang/Long;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    :goto_1
    iget-object v3, p0, Ls3/J;->e:Ljava/lang/String;

    .line 35
    .line 36
    const v4, -0x4cebee

    .line 37
    .line 38
    .line 39
    const/high16 v5, -0x1000000

    .line 40
    .line 41
    if-eqz v3, :cond_4

    .line 42
    .line 43
    iget-object p0, p0, Ls3/J;->f:Ls3/b0;

    .line 44
    .line 45
    if-nez p0, :cond_2

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_2
    iget-object p0, p0, Ls3/b0;->a:Ljava/lang/Long;

    .line 49
    .line 50
    invoke-virtual {p0}, Ljava/lang/Long;->intValue()I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    :goto_2
    if-eqz v1, :cond_3

    .line 59
    .line 60
    new-instance p0, Le1/r;

    .line 61
    .line 62
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    invoke-direct {p0, v3, p1}, Le1/r;-><init>(Ljava/lang/String;I)V

    .line 67
    .line 68
    .line 69
    move-object v1, p0

    .line 70
    goto :goto_4

    .line 71
    :cond_3
    new-instance v1, Le1/r;

    .line 72
    .line 73
    invoke-direct {v1, v3, v5}, Le1/r;-><init>(Ljava/lang/String;I)V

    .line 74
    .line 75
    .line 76
    goto :goto_4

    .line 77
    :cond_4
    iget-object v3, p0, Ls3/J;->d:Ls3/C;

    .line 78
    .line 79
    if-eqz v3, :cond_5

    .line 80
    .line 81
    new-instance v1, Le1/r;

    .line 82
    .line 83
    invoke-static {v3, p1, p2, p3}, Landroid/support/v4/media/session/a;->K(Ls3/C;Landroid/content/res/AssetManager;FLN1/e;)Le1/c;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 88
    .line 89
    .line 90
    iput v4, v1, Le1/r;->g:I

    .line 91
    .line 92
    iput v5, v1, Le1/r;->h:I

    .line 93
    .line 94
    iput-object p0, v1, Le1/r;->f:Le1/c;

    .line 95
    .line 96
    goto :goto_4

    .line 97
    :cond_5
    iget-object p0, p0, Ls3/J;->c:Ls3/b0;

    .line 98
    .line 99
    if-nez p0, :cond_6

    .line 100
    .line 101
    move-object p0, v1

    .line 102
    goto :goto_3

    .line 103
    :cond_6
    iget-object p0, p0, Ls3/b0;->a:Ljava/lang/Long;

    .line 104
    .line 105
    invoke-virtual {p0}, Ljava/lang/Long;->intValue()I

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    :goto_3
    if-eqz p0, :cond_7

    .line 114
    .line 115
    new-instance v1, Le1/r;

    .line 116
    .line 117
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    invoke-direct {v1, p0}, Le1/r;-><init>(I)V

    .line 122
    .line 123
    .line 124
    :cond_7
    :goto_4
    new-instance p0, Le1/r;

    .line 125
    .line 126
    invoke-direct {p0, v4}, Le1/r;-><init>(I)V

    .line 127
    .line 128
    .line 129
    if-eqz v0, :cond_8

    .line 130
    .line 131
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    goto :goto_5

    .line 136
    :cond_8
    const p1, -0x15bccb

    .line 137
    .line 138
    .line 139
    :goto_5
    if-eqz v2, :cond_9

    .line 140
    .line 141
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 142
    .line 143
    .line 144
    move-result p2

    .line 145
    goto :goto_6

    .line 146
    :cond_9
    const p2, -0x3adde1

    .line 147
    .line 148
    .line 149
    :goto_6
    if-eqz v1, :cond_a

    .line 150
    .line 151
    goto :goto_7

    .line 152
    :cond_a
    move-object v1, p0

    .line 153
    :goto_7
    new-instance p0, Le1/s;

    .line 154
    .line 155
    invoke-direct {p0, p1, p2, v1}, Le1/s;-><init>(IILe1/r;)V

    .line 156
    .line 157
    .line 158
    return-object p0
.end method

.method public static s(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1a

    .line 4
    .line 5
    const-string v2, "TRuntime."

    .line 6
    .line 7
    if-ge v0, v1, :cond_1

    .line 8
    .line 9
    invoke-virtual {v2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/16 v1, 0x17

    .line 18
    .line 19
    if-le v0, v1, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    :cond_0
    return-object p0

    .line 27
    :cond_1
    invoke-virtual {v2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public static t(Ls3/Y;Ls3/c;)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ls3/Y;->a:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-interface {p1, v0}, Ls3/c;->b(Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ls3/Y;->b:Ls3/b0;

    .line 11
    .line 12
    iget-object v0, v0, Ls3/b0;->a:Ljava/lang/Long;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Long;->intValue()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-interface {p1, v0}, Ls3/c;->f(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ls3/Y;->c:Ls3/b0;

    .line 22
    .line 23
    iget-object v0, v0, Ls3/b0;->a:Ljava/lang/Long;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Long;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-interface {p1, v0}, Ls3/c;->c(I)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ls3/Y;->e:Ljava/lang/Long;

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 35
    .line 36
    .line 37
    move-result-wide v0

    .line 38
    long-to-float v0, v0

    .line 39
    invoke-interface {p1, v0}, Ls3/c;->g(F)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ls3/Y;->f:Ljava/lang/Double;

    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/Double;->floatValue()F

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    invoke-interface {p1, v0}, Ls3/c;->a(F)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ls3/Y;->g:Ls3/j0;

    .line 52
    .line 53
    invoke-static {v0}, Landroid/support/v4/media/session/a;->D(Ls3/j0;)Lcom/google/android/gms/maps/model/LatLng;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-interface {p1, v0}, Ls3/c;->o(Lcom/google/android/gms/maps/model/LatLng;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ls3/Y;->h:Ljava/lang/Double;

    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 63
    .line 64
    .line 65
    move-result-wide v0

    .line 66
    invoke-interface {p1, v0, v1}, Ls3/c;->n(D)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ls3/Y;->d:Ljava/lang/Boolean;

    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    invoke-interface {p1, v0}, Ls3/c;->setVisible(Z)V

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Ls3/Y;->i:Ljava/lang/String;

    .line 79
    .line 80
    return-object p0
.end method

.method public static u(Ls3/e0;Ls3/p;Landroid/content/res/AssetManager;FLN1/e;)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ls3/e0;->h:Ljava/lang/Double;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Double;->floatValue()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-interface {p1, v0}, Ls3/p;->b(F)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ls3/e0;->j:Ljava/lang/Long;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Long;->floatValue()F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-interface {p1, v0}, Ls3/p;->a(F)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ls3/e0;->k:Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-interface {p1, v0}, Ls3/p;->setVisible(Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ls3/e0;->g:Ls3/c0;

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object v0, v0, Ls3/c0;->a:Ljava/lang/Double;

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/Double;->floatValue()F

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iget-object v1, p0, Ls3/e0;->g:Ls3/c0;

    .line 39
    .line 40
    iget-object v1, v1, Ls3/c0;->b:Ljava/lang/Double;

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/Double;->floatValue()F

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-interface {p1, v0, v1}, Ls3/p;->c(FF)V

    .line 47
    .line 48
    .line 49
    :cond_0
    iget-object v0, p0, Ls3/e0;->i:Ljava/lang/Double;

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/Double;->floatValue()F

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    invoke-interface {p1, v0}, Ls3/p;->m(F)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ls3/e0;->l:Ljava/lang/Boolean;

    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    invoke-interface {p1, v0}, Ls3/p;->f(Z)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ls3/e0;->b:Ls3/C;

    .line 68
    .line 69
    invoke-static {v0, p2, p3, p4}, Landroid/support/v4/media/session/a;->K(Ls3/C;Landroid/content/res/AssetManager;FLN1/e;)Le1/c;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-interface {p1, p2}, Ls3/p;->e(Le1/c;)V

    .line 74
    .line 75
    .line 76
    iget-object p2, p0, Ls3/e0;->c:Ls3/j0;

    .line 77
    .line 78
    if-eqz p2, :cond_3

    .line 79
    .line 80
    iget-object p3, p0, Ls3/e0;->e:Ljava/lang/Double;

    .line 81
    .line 82
    const/4 p4, 0x0

    .line 83
    if-eqz p3, :cond_2

    .line 84
    .line 85
    invoke-static {p2}, Landroid/support/v4/media/session/a;->D(Ls3/j0;)Lcom/google/android/gms/maps/model/LatLng;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    iget-object p3, p0, Ls3/e0;->e:Ljava/lang/Double;

    .line 90
    .line 91
    invoke-virtual {p3}, Ljava/lang/Double;->floatValue()F

    .line 92
    .line 93
    .line 94
    move-result p3

    .line 95
    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 96
    .line 97
    .line 98
    move-result-object p3

    .line 99
    iget-object v0, p0, Ls3/e0;->f:Ljava/lang/Double;

    .line 100
    .line 101
    if-eqz v0, :cond_1

    .line 102
    .line 103
    invoke-virtual {v0}, Ljava/lang/Double;->floatValue()F

    .line 104
    .line 105
    .line 106
    move-result p4

    .line 107
    invoke-static {p4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 108
    .line 109
    .line 110
    move-result-object p4

    .line 111
    :cond_1
    invoke-interface {p1, p2, p3, p4}, Ls3/p;->g(Lcom/google/android/gms/maps/model/LatLng;Ljava/lang/Float;Ljava/lang/Float;)V

    .line 112
    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_2
    new-instance p0, Ls3/x;

    .line 116
    .line 117
    const-string p1, "Invalid GroundOverlay"

    .line 118
    .line 119
    const-string p2, "Width is required when using a ground overlay with a position."

    .line 120
    .line 121
    invoke-direct {p0, p1, p2, p4}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 122
    .line 123
    .line 124
    throw p0

    .line 125
    :cond_3
    iget-object p2, p0, Ls3/e0;->d:Ls3/k0;

    .line 126
    .line 127
    if-eqz p2, :cond_4

    .line 128
    .line 129
    new-instance p3, Lcom/google/android/gms/maps/model/LatLngBounds;

    .line 130
    .line 131
    iget-object p4, p2, Ls3/k0;->b:Ls3/j0;

    .line 132
    .line 133
    invoke-static {p4}, Landroid/support/v4/media/session/a;->D(Ls3/j0;)Lcom/google/android/gms/maps/model/LatLng;

    .line 134
    .line 135
    .line 136
    move-result-object p4

    .line 137
    iget-object p2, p2, Ls3/k0;->a:Ls3/j0;

    .line 138
    .line 139
    invoke-static {p2}, Landroid/support/v4/media/session/a;->D(Ls3/j0;)Lcom/google/android/gms/maps/model/LatLng;

    .line 140
    .line 141
    .line 142
    move-result-object p2

    .line 143
    invoke-direct {p3, p4, p2}, Lcom/google/android/gms/maps/model/LatLngBounds;-><init>(Lcom/google/android/gms/maps/model/LatLng;Lcom/google/android/gms/maps/model/LatLng;)V

    .line 144
    .line 145
    .line 146
    invoke-interface {p1, p3}, Ls3/p;->i(Lcom/google/android/gms/maps/model/LatLngBounds;)V

    .line 147
    .line 148
    .line 149
    :cond_4
    :goto_0
    iget-object p0, p0, Ls3/e0;->a:Ljava/lang/String;

    .line 150
    .line 151
    return-object p0
.end method

.method public static v(Ls3/f0;Ls3/s;)Ljava/lang/String;
    .locals 7

    .line 1
    iget-object v0, p0, Ls3/f0;->b:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 10
    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Ls3/B0;

    .line 27
    .line 28
    new-instance v3, Ln2/e;

    .line 29
    .line 30
    iget-object v4, v2, Ls3/B0;->a:Ls3/j0;

    .line 31
    .line 32
    invoke-static {v4}, Landroid/support/v4/media/session/a;->D(Ls3/j0;)Lcom/google/android/gms/maps/model/LatLng;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    iget-object v2, v2, Ls3/B0;->b:Ljava/lang/Double;

    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    .line 39
    .line 40
    .line 41
    move-result-wide v5

    .line 42
    invoke-direct {v3, v4, v5, v6}, Ln2/e;-><init>(Lcom/google/android/gms/maps/model/LatLng;D)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    invoke-interface {p1, v1}, Ls3/s;->f(Ljava/util/ArrayList;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ls3/f0;->c:Ls3/g0;

    .line 53
    .line 54
    if-eqz v0, :cond_3

    .line 55
    .line 56
    iget-object v1, v0, Ls3/g0;->a:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    new-array v2, v2, [I

    .line 63
    .line 64
    const/4 v3, 0x0

    .line 65
    move v4, v3

    .line 66
    :goto_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 67
    .line 68
    .line 69
    move-result v5

    .line 70
    if-ge v4, v5, :cond_1

    .line 71
    .line 72
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    check-cast v5, Ls3/b0;

    .line 77
    .line 78
    iget-object v5, v5, Ls3/b0;->a:Ljava/lang/Long;

    .line 79
    .line 80
    invoke-virtual {v5}, Ljava/lang/Long;->intValue()I

    .line 81
    .line 82
    .line 83
    move-result v5

    .line 84
    aput v5, v2, v4

    .line 85
    .line 86
    add-int/lit8 v4, v4, 0x1

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_1
    iget-object v1, v0, Ls3/g0;->b:Ljava/util/List;

    .line 90
    .line 91
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    new-array v4, v4, [F

    .line 96
    .line 97
    :goto_2
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 98
    .line 99
    .line 100
    move-result v5

    .line 101
    if-ge v3, v5, :cond_2

    .line 102
    .line 103
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v5

    .line 107
    check-cast v5, Ljava/lang/Double;

    .line 108
    .line 109
    invoke-virtual {v5}, Ljava/lang/Double;->floatValue()F

    .line 110
    .line 111
    .line 112
    move-result v5

    .line 113
    aput v5, v4, v3

    .line 114
    .line 115
    add-int/lit8 v3, v3, 0x1

    .line 116
    .line 117
    goto :goto_2

    .line 118
    :cond_2
    new-instance v1, LM2/b;

    .line 119
    .line 120
    iget-object v0, v0, Ls3/g0;->c:Ljava/lang/Long;

    .line 121
    .line 122
    invoke-virtual {v0}, Ljava/lang/Long;->intValue()I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    invoke-direct {v1, v2, v4, v0}, LM2/b;-><init>([I[FI)V

    .line 127
    .line 128
    .line 129
    invoke-interface {p1, v1}, Ls3/s;->h(LM2/b;)V

    .line 130
    .line 131
    .line 132
    :cond_3
    iget-object v0, p0, Ls3/f0;->f:Ljava/lang/Double;

    .line 133
    .line 134
    if-eqz v0, :cond_4

    .line 135
    .line 136
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 137
    .line 138
    .line 139
    move-result-wide v0

    .line 140
    invoke-interface {p1, v0, v1}, Ls3/s;->i(D)V

    .line 141
    .line 142
    .line 143
    :cond_4
    iget-object v0, p0, Ls3/f0;->d:Ljava/lang/Double;

    .line 144
    .line 145
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 146
    .line 147
    .line 148
    move-result-wide v0

    .line 149
    invoke-interface {p1, v0, v1}, Ls3/s;->k(D)V

    .line 150
    .line 151
    .line 152
    iget-object v0, p0, Ls3/f0;->e:Ljava/lang/Long;

    .line 153
    .line 154
    invoke-virtual {v0}, Ljava/lang/Long;->intValue()I

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    invoke-interface {p1, v0}, Ls3/s;->b(I)V

    .line 159
    .line 160
    .line 161
    iget-object p0, p0, Ls3/f0;->a:Ljava/lang/String;

    .line 162
    .line 163
    return-object p0
.end method

.method public static w(Ls3/m0;Ls3/m;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ls3/m0;->b:Ls3/L;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget-object v0, v0, Ls3/L;->a:Ls3/k0;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    move-object v2, v1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance v2, Lcom/google/android/gms/maps/model/LatLngBounds;

    .line 13
    .line 14
    iget-object v3, v0, Ls3/k0;->b:Ls3/j0;

    .line 15
    .line 16
    invoke-static {v3}, Landroid/support/v4/media/session/a;->D(Ls3/j0;)Lcom/google/android/gms/maps/model/LatLng;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    iget-object v0, v0, Ls3/k0;->a:Ls3/j0;

    .line 21
    .line 22
    invoke-static {v0}, Landroid/support/v4/media/session/a;->D(Ls3/j0;)Lcom/google/android/gms/maps/model/LatLng;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-direct {v2, v3, v0}, Lcom/google/android/gms/maps/model/LatLngBounds;-><init>(Lcom/google/android/gms/maps/model/LatLng;Lcom/google/android/gms/maps/model/LatLng;)V

    .line 27
    .line 28
    .line 29
    :goto_0
    invoke-interface {p1, v2}, Ls3/m;->x(Lcom/google/android/gms/maps/model/LatLngBounds;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    iget-object v0, p0, Ls3/m0;->a:Ljava/lang/Boolean;

    .line 33
    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-interface {p1, v0}, Ls3/m;->n(Z)V

    .line 41
    .line 42
    .line 43
    :cond_2
    iget-object v0, p0, Ls3/m0;->e:Ljava/lang/Boolean;

    .line 44
    .line 45
    if-eqz v0, :cond_3

    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    invoke-interface {p1, v0}, Ls3/m;->o(Z)V

    .line 52
    .line 53
    .line 54
    :cond_3
    iget-object v0, p0, Ls3/m0;->c:Ls3/n0;

    .line 55
    .line 56
    if-eqz v0, :cond_6

    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_4

    .line 63
    .line 64
    const/4 v2, 0x2

    .line 65
    if-eq v0, v2, :cond_5

    .line 66
    .line 67
    const/4 v2, 0x3

    .line 68
    if-eq v0, v2, :cond_5

    .line 69
    .line 70
    const/4 v2, 0x4

    .line 71
    if-eq v0, v2, :cond_5

    .line 72
    .line 73
    const/4 v2, 0x1

    .line 74
    goto :goto_1

    .line 75
    :cond_4
    const/4 v2, 0x0

    .line 76
    :cond_5
    :goto_1
    invoke-interface {p1, v2}, Ls3/m;->b(I)V

    .line 77
    .line 78
    .line 79
    :cond_6
    iget-object v0, p0, Ls3/m0;->d:Ls3/C0;

    .line 80
    .line 81
    if-eqz v0, :cond_9

    .line 82
    .line 83
    iget-object v2, v0, Ls3/C0;->a:Ljava/lang/Double;

    .line 84
    .line 85
    if-nez v2, :cond_7

    .line 86
    .line 87
    move-object v2, v1

    .line 88
    goto :goto_2

    .line 89
    :cond_7
    invoke-virtual {v2}, Ljava/lang/Double;->floatValue()F

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    :goto_2
    iget-object v0, v0, Ls3/C0;->b:Ljava/lang/Double;

    .line 98
    .line 99
    if-nez v0, :cond_8

    .line 100
    .line 101
    goto :goto_3

    .line 102
    :cond_8
    invoke-virtual {v0}, Ljava/lang/Double;->floatValue()F

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    :goto_3
    invoke-interface {p1, v2, v1}, Ls3/m;->E(Ljava/lang/Float;Ljava/lang/Float;)V

    .line 111
    .line 112
    .line 113
    :cond_9
    iget-object v0, p0, Ls3/m0;->n:Ls3/d0;

    .line 114
    .line 115
    if-eqz v0, :cond_a

    .line 116
    .line 117
    iget-object v1, v0, Ls3/d0;->a:Ljava/lang/Double;

    .line 118
    .line 119
    invoke-virtual {v1}, Ljava/lang/Double;->floatValue()F

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    iget-object v2, v0, Ls3/d0;->c:Ljava/lang/Double;

    .line 124
    .line 125
    invoke-virtual {v2}, Ljava/lang/Double;->floatValue()F

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    iget-object v3, v0, Ls3/d0;->b:Ljava/lang/Double;

    .line 130
    .line 131
    invoke-virtual {v3}, Ljava/lang/Double;->floatValue()F

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    iget-object v0, v0, Ls3/d0;->d:Ljava/lang/Double;

    .line 136
    .line 137
    invoke-virtual {v0}, Ljava/lang/Double;->floatValue()F

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    invoke-interface {p1, v1, v2, v3, v0}, Ls3/m;->c(FFFF)V

    .line 142
    .line 143
    .line 144
    :cond_a
    iget-object v0, p0, Ls3/m0;->f:Ljava/lang/Boolean;

    .line 145
    .line 146
    if-eqz v0, :cond_b

    .line 147
    .line 148
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    invoke-interface {p1, v0}, Ls3/m;->G(Z)V

    .line 153
    .line 154
    .line 155
    :cond_b
    iget-object v0, p0, Ls3/m0;->g:Ljava/lang/Boolean;

    .line 156
    .line 157
    if-eqz v0, :cond_c

    .line 158
    .line 159
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    invoke-interface {p1, v0}, Ls3/m;->s(Z)V

    .line 164
    .line 165
    .line 166
    :cond_c
    iget-object v0, p0, Ls3/m0;->h:Ljava/lang/Boolean;

    .line 167
    .line 168
    if-eqz v0, :cond_d

    .line 169
    .line 170
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    invoke-interface {p1, v0}, Ls3/m;->y(Z)V

    .line 175
    .line 176
    .line 177
    :cond_d
    iget-object v0, p0, Ls3/m0;->i:Ljava/lang/Boolean;

    .line 178
    .line 179
    if-eqz v0, :cond_e

    .line 180
    .line 181
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    invoke-interface {p1, v0}, Ls3/m;->q(Z)V

    .line 186
    .line 187
    .line 188
    :cond_e
    iget-object v0, p0, Ls3/m0;->k:Ljava/lang/Boolean;

    .line 189
    .line 190
    if-eqz v0, :cond_f

    .line 191
    .line 192
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    invoke-interface {p1, v0}, Ls3/m;->A(Z)V

    .line 197
    .line 198
    .line 199
    :cond_f
    iget-object v0, p0, Ls3/m0;->r:Ljava/lang/Boolean;

    .line 200
    .line 201
    if-eqz v0, :cond_10

    .line 202
    .line 203
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    invoke-interface {p1, v0}, Ls3/m;->t(Z)V

    .line 208
    .line 209
    .line 210
    :cond_10
    iget-object v0, p0, Ls3/m0;->l:Ljava/lang/Boolean;

    .line 211
    .line 212
    if-eqz v0, :cond_11

    .line 213
    .line 214
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    invoke-interface {p1, v0}, Ls3/m;->z(Z)V

    .line 219
    .line 220
    .line 221
    :cond_11
    iget-object v0, p0, Ls3/m0;->j:Ljava/lang/Boolean;

    .line 222
    .line 223
    if-eqz v0, :cond_12

    .line 224
    .line 225
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 226
    .line 227
    .line 228
    move-result v0

    .line 229
    invoke-interface {p1, v0}, Ls3/m;->D(Z)V

    .line 230
    .line 231
    .line 232
    :cond_12
    iget-object v0, p0, Ls3/m0;->m:Ljava/lang/Boolean;

    .line 233
    .line 234
    if-eqz v0, :cond_13

    .line 235
    .line 236
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 237
    .line 238
    .line 239
    move-result v0

    .line 240
    invoke-interface {p1, v0}, Ls3/m;->l(Z)V

    .line 241
    .line 242
    .line 243
    :cond_13
    iget-object v0, p0, Ls3/m0;->o:Ljava/lang/Boolean;

    .line 244
    .line 245
    if-eqz v0, :cond_14

    .line 246
    .line 247
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 248
    .line 249
    .line 250
    move-result v0

    .line 251
    invoke-interface {p1, v0}, Ls3/m;->k(Z)V

    .line 252
    .line 253
    .line 254
    :cond_14
    iget-object v0, p0, Ls3/m0;->p:Ljava/lang/Boolean;

    .line 255
    .line 256
    if-eqz v0, :cond_15

    .line 257
    .line 258
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 259
    .line 260
    .line 261
    move-result v0

    .line 262
    invoke-interface {p1, v0}, Ls3/m;->F(Z)V

    .line 263
    .line 264
    .line 265
    :cond_15
    iget-object v0, p0, Ls3/m0;->q:Ljava/lang/Boolean;

    .line 266
    .line 267
    if-eqz v0, :cond_16

    .line 268
    .line 269
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 270
    .line 271
    .line 272
    move-result v0

    .line 273
    invoke-interface {p1, v0}, Ls3/m;->d(Z)V

    .line 274
    .line 275
    .line 276
    :cond_16
    iget-object p0, p0, Ls3/m0;->u:Ljava/lang/String;

    .line 277
    .line 278
    if-eqz p0, :cond_17

    .line 279
    .line 280
    invoke-interface {p1, p0}, Ls3/m;->B(Ljava/lang/String;)V

    .line 281
    .line 282
    .line 283
    :cond_17
    return-void
.end method

.method public static x(Ls3/p0;Ls3/v;Landroid/content/res/AssetManager;FLN1/e;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ls3/p0;->a:Ljava/lang/Double;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Double;->floatValue()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-interface {p1, v0}, Ls3/v;->d(F)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ls3/p0;->b:Ls3/c0;

    .line 11
    .line 12
    iget-object v0, v0, Ls3/c0;->a:Ljava/lang/Double;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Double;->floatValue()F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v1, p0, Ls3/p0;->b:Ls3/c0;

    .line 19
    .line 20
    iget-object v1, v1, Ls3/c0;->b:Ljava/lang/Double;

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/Double;->floatValue()F

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-interface {p1, v0, v1}, Ls3/v;->c(FF)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ls3/p0;->c:Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-interface {p1, v0}, Ls3/v;->b(Z)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ls3/p0;->d:Ljava/lang/Boolean;

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-interface {p1, v0}, Ls3/v;->e(Z)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ls3/p0;->e:Ljava/lang/Boolean;

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-interface {p1, v0}, Ls3/v;->f(Z)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ls3/p0;->f:Ls3/C;

    .line 57
    .line 58
    invoke-static {v0, p2, p3, p4}, Landroid/support/v4/media/session/a;->K(Ls3/C;Landroid/content/res/AssetManager;FLN1/e;)Le1/c;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-interface {p1, p2}, Ls3/v;->j(Le1/c;)V

    .line 63
    .line 64
    .line 65
    iget-object p2, p0, Ls3/p0;->g:Ls3/h0;

    .line 66
    .line 67
    iget-object p3, p2, Ls3/h0;->a:Ljava/lang/String;

    .line 68
    .line 69
    if-eqz p3, :cond_0

    .line 70
    .line 71
    iget-object p4, p2, Ls3/h0;->b:Ljava/lang/String;

    .line 72
    .line 73
    invoke-interface {p1, p3, p4}, Ls3/v;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    :cond_0
    iget-object p2, p2, Ls3/h0;->c:Ls3/c0;

    .line 77
    .line 78
    iget-object p3, p2, Ls3/c0;->a:Ljava/lang/Double;

    .line 79
    .line 80
    invoke-virtual {p3}, Ljava/lang/Double;->floatValue()F

    .line 81
    .line 82
    .line 83
    move-result p3

    .line 84
    iget-object p2, p2, Ls3/c0;->b:Ljava/lang/Double;

    .line 85
    .line 86
    invoke-virtual {p2}, Ljava/lang/Double;->floatValue()F

    .line 87
    .line 88
    .line 89
    move-result p2

    .line 90
    invoke-interface {p1, p3, p2}, Ls3/v;->g(FF)V

    .line 91
    .line 92
    .line 93
    iget-object p2, p0, Ls3/p0;->h:Ls3/j0;

    .line 94
    .line 95
    invoke-static {p2}, Landroid/support/v4/media/session/a;->D(Ls3/j0;)Lcom/google/android/gms/maps/model/LatLng;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    invoke-interface {p1, p2}, Ls3/v;->i(Lcom/google/android/gms/maps/model/LatLng;)V

    .line 100
    .line 101
    .line 102
    iget-object p2, p0, Ls3/p0;->i:Ljava/lang/Double;

    .line 103
    .line 104
    invoke-virtual {p2}, Ljava/lang/Double;->floatValue()F

    .line 105
    .line 106
    .line 107
    move-result p2

    .line 108
    invoke-interface {p1, p2}, Ls3/v;->h(F)V

    .line 109
    .line 110
    .line 111
    iget-object p2, p0, Ls3/p0;->j:Ljava/lang/Boolean;

    .line 112
    .line 113
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 114
    .line 115
    .line 116
    move-result p2

    .line 117
    invoke-interface {p1, p2}, Ls3/v;->setVisible(Z)V

    .line 118
    .line 119
    .line 120
    iget-object p2, p0, Ls3/p0;->k:Ljava/lang/Double;

    .line 121
    .line 122
    invoke-virtual {p2}, Ljava/lang/Double;->floatValue()F

    .line 123
    .line 124
    .line 125
    move-result p2

    .line 126
    invoke-interface {p1, p2}, Ls3/v;->a(F)V

    .line 127
    .line 128
    .line 129
    iget-object p0, p0, Ls3/p0;->n:Ls3/q0;

    .line 130
    .line 131
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    const/4 p2, 0x2

    .line 136
    const/4 p3, 0x1

    .line 137
    if-eq p0, p3, :cond_2

    .line 138
    .line 139
    if-eq p0, p2, :cond_1

    .line 140
    .line 141
    const/4 p2, 0x0

    .line 142
    goto :goto_0

    .line 143
    :cond_1
    move p2, p3

    .line 144
    :cond_2
    :goto_0
    invoke-interface {p1, p2}, Ls3/v;->k(I)V

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method public static y(Ls3/v0;Ls3/F0;)Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Ls3/v0;->b:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-interface {p1, v0}, Ls3/F0;->b(Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ls3/v0;->d:Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-interface {p1, v0}, Ls3/F0;->d(Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ls3/v0;->g:Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-interface {p1, v0}, Ls3/F0;->setVisible(Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ls3/v0;->c:Ls3/b0;

    .line 29
    .line 30
    iget-object v0, v0, Ls3/b0;->a:Ljava/lang/Long;

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/Long;->intValue()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    invoke-interface {p1, v0}, Ls3/F0;->f(I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ls3/v0;->h:Ls3/b0;

    .line 40
    .line 41
    iget-object v0, v0, Ls3/b0;->a:Ljava/lang/Long;

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/Long;->intValue()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    invoke-interface {p1, v0}, Ls3/F0;->c(I)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ls3/v0;->i:Ljava/lang/Long;

    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 53
    .line 54
    .line 55
    move-result-wide v0

    .line 56
    long-to-float v0, v0

    .line 57
    invoke-interface {p1, v0}, Ls3/F0;->g(F)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ls3/v0;->j:Ljava/lang/Long;

    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 63
    .line 64
    .line 65
    move-result-wide v0

    .line 66
    long-to-float v0, v0

    .line 67
    invoke-interface {p1, v0}, Ls3/F0;->a(F)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ls3/v0;->e:Ljava/util/List;

    .line 71
    .line 72
    invoke-static {v0}, Landroid/support/v4/media/session/a;->H(Ljava/util/List;)Ljava/util/ArrayList;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-interface {p1, v0}, Ls3/F0;->e(Ljava/util/ArrayList;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Ls3/v0;->f:Ljava/util/List;

    .line 80
    .line 81
    new-instance v1, Ljava/util/ArrayList;

    .line 82
    .line 83
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 88
    .line 89
    .line 90
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-eqz v2, :cond_0

    .line 99
    .line 100
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    check-cast v2, Ljava/util/List;

    .line 105
    .line 106
    invoke-static {v2}, Landroid/support/v4/media/session/a;->H(Ljava/util/List;)Ljava/util/ArrayList;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_0
    invoke-interface {p1, v1}, Ls3/F0;->l(Ljava/util/ArrayList;)V

    .line 115
    .line 116
    .line 117
    iget-object p0, p0, Ls3/v0;->a:Ljava/lang/String;

    .line 118
    .line 119
    return-object p0
.end method

.method public static z(Ls3/w0;Ls3/H0;Landroid/content/res/AssetManager;F)Ljava/lang/String;
    .locals 6

    .line 1
    iget-object v0, p0, Ls3/w0;->b:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-interface {p1, v0}, Ls3/H0;->b(Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ls3/w0;->c:Ls3/b0;

    .line 11
    .line 12
    iget-object v0, v0, Ls3/b0;->a:Ljava/lang/Long;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Long;->intValue()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-interface {p1, v0}, Ls3/H0;->p(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ls3/w0;->i:Ls3/W;

    .line 22
    .line 23
    invoke-static {v0, p2, p3}, Landroid/support/v4/media/session/a;->d(Ls3/W;Landroid/content/res/AssetManager;F)Le1/e;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {p1, v0}, Ls3/H0;->m(Le1/e;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ls3/w0;->h:Ls3/W;

    .line 31
    .line 32
    invoke-static {v0, p2, p3}, Landroid/support/v4/media/session/a;->d(Ls3/W;Landroid/content/res/AssetManager;F)Le1/e;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-interface {p1, p2}, Ls3/H0;->h(Le1/e;)V

    .line 37
    .line 38
    .line 39
    iget-object p2, p0, Ls3/w0;->d:Ljava/lang/Boolean;

    .line 40
    .line 41
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    invoke-interface {p1, p2}, Ls3/H0;->d(Z)V

    .line 46
    .line 47
    .line 48
    iget-object p2, p0, Ls3/w0;->e:Ls3/i0;

    .line 49
    .line 50
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    const/4 p3, 0x2

    .line 55
    const/4 v0, 0x1

    .line 56
    if-eq p2, v0, :cond_1

    .line 57
    .line 58
    if-eq p2, p3, :cond_0

    .line 59
    .line 60
    const/4 p2, 0x0

    .line 61
    goto :goto_0

    .line 62
    :cond_0
    move p2, p3

    .line 63
    goto :goto_0

    .line 64
    :cond_1
    move p2, v0

    .line 65
    :goto_0
    invoke-interface {p1, p2}, Ls3/H0;->i(I)V

    .line 66
    .line 67
    .line 68
    iget-object p2, p0, Ls3/w0;->j:Ljava/lang/Boolean;

    .line 69
    .line 70
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    invoke-interface {p1, p2}, Ls3/H0;->setVisible(Z)V

    .line 75
    .line 76
    .line 77
    iget-object p2, p0, Ls3/w0;->k:Ljava/lang/Long;

    .line 78
    .line 79
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 80
    .line 81
    .line 82
    move-result-wide v1

    .line 83
    long-to-float p2, v1

    .line 84
    invoke-interface {p1, p2}, Ls3/H0;->j(F)V

    .line 85
    .line 86
    .line 87
    iget-object p2, p0, Ls3/w0;->l:Ljava/lang/Long;

    .line 88
    .line 89
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 90
    .line 91
    .line 92
    move-result-wide v1

    .line 93
    long-to-float p2, v1

    .line 94
    invoke-interface {p1, p2}, Ls3/H0;->a(F)V

    .line 95
    .line 96
    .line 97
    iget-object p2, p0, Ls3/w0;->g:Ljava/util/List;

    .line 98
    .line 99
    invoke-static {p2}, Landroid/support/v4/media/session/a;->H(Ljava/util/List;)Ljava/util/ArrayList;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    invoke-interface {p1, p2}, Ls3/H0;->e(Ljava/util/ArrayList;)V

    .line 104
    .line 105
    .line 106
    iget-object p2, p0, Ls3/w0;->f:Ljava/util/List;

    .line 107
    .line 108
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    const/4 v2, 0x0

    .line 113
    if-eqz v1, :cond_2

    .line 114
    .line 115
    goto :goto_2

    .line 116
    :cond_2
    new-instance v1, Ljava/util/ArrayList;

    .line 117
    .line 118
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 119
    .line 120
    .line 121
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 126
    .line 127
    .line 128
    move-result v3

    .line 129
    if-eqz v3, :cond_6

    .line 130
    .line 131
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    check-cast v3, Ls3/s0;

    .line 136
    .line 137
    iget-object v4, v3, Ls3/s0;->a:Ls3/t0;

    .line 138
    .line 139
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 140
    .line 141
    .line 142
    move-result v4

    .line 143
    if-eqz v4, :cond_5

    .line 144
    .line 145
    if-eq v4, v0, :cond_4

    .line 146
    .line 147
    if-eq v4, p3, :cond_3

    .line 148
    .line 149
    goto :goto_1

    .line 150
    :cond_3
    new-instance v4, Le1/i;

    .line 151
    .line 152
    iget-object v3, v3, Ls3/s0;->b:Ljava/lang/Double;

    .line 153
    .line 154
    invoke-virtual {v3}, Ljava/lang/Double;->floatValue()F

    .line 155
    .line 156
    .line 157
    move-result v3

    .line 158
    const/4 v5, 0x1

    .line 159
    invoke-direct {v4, v3, v5}, Le1/i;-><init>(FI)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    goto :goto_1

    .line 166
    :cond_4
    new-instance v4, Le1/i;

    .line 167
    .line 168
    iget-object v3, v3, Ls3/s0;->b:Ljava/lang/Double;

    .line 169
    .line 170
    invoke-virtual {v3}, Ljava/lang/Double;->floatValue()F

    .line 171
    .line 172
    .line 173
    move-result v3

    .line 174
    const/4 v5, 0x0

    .line 175
    invoke-direct {v4, v3, v5}, Le1/i;-><init>(FI)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    goto :goto_1

    .line 182
    :cond_5
    new-instance v3, Le1/j;

    .line 183
    .line 184
    invoke-direct {v3, v0, v2}, Le1/q;-><init>(ILjava/lang/Float;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    goto :goto_1

    .line 191
    :cond_6
    move-object v2, v1

    .line 192
    :goto_2
    invoke-interface {p1, v2}, Ls3/H0;->k(Ljava/util/ArrayList;)V

    .line 193
    .line 194
    .line 195
    iget-object p0, p0, Ls3/w0;->a:Ljava/lang/String;

    .line 196
    .line 197
    return-object p0
.end method


# virtual methods
.method public abstract B(Ljava/lang/Class;)Z
.end method

.method public abstract S([BII)V
.end method

.method public abstract k(Ljava/lang/Class;Ljava/lang/reflect/Field;)Ljava/lang/reflect/Method;
.end method

.method public abstract m(Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
.end method

.method public abstract n()Ljava/lang/Integer;
.end method

.method public abstract p()Lj1/i;
.end method

.method public abstract r(Ljava/lang/Class;)[Ljava/lang/String;
.end method
