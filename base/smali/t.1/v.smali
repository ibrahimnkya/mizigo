.class public final Lt/v;
.super Lt/A;
.source "SourceFile"


# instance fields
.field public final e:Ljava/util/ArrayList;

.field public final f:Ljava/util/ArrayList;

.field public g:Lt/I;

.field public h:Ljava/lang/CharSequence;

.field public i:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lt/A;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lt/v;->e:Ljava/util/ArrayList;

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lt/v;->f:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Lt/I;)V
    .locals 1

    .line 4
    invoke-direct {p0}, Lt/A;-><init>()V

    .line 5
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lt/v;->e:Ljava/util/ArrayList;

    .line 6
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lt/v;->f:Ljava/util/ArrayList;

    .line 7
    iget-object v0, p1, Lt/I;->a:Ljava/lang/CharSequence;

    .line 8
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 9
    iput-object p1, p0, Lt/v;->g:Lt/I;

    return-void

    .line 10
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "User\'s name must not be empty."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static e(Landroid/app/Notification;)Lt/v;
    .locals 6

    .line 1
    iget-object p0, p0, Landroid/app/Notification;->extras:Landroid/os/Bundle;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    :catch_0
    :goto_0
    move-object v1, v0

    .line 7
    goto/16 :goto_9

    .line 8
    .line 9
    :cond_0
    const-string v1, "androidx.core.app.extra.COMPAT_TEMPLATE"

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/4 v2, 0x0

    .line 16
    const/4 v3, 0x1

    .line 17
    if-eqz v1, :cond_8

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    const/4 v5, -0x1

    .line 24
    sparse-switch v4, :sswitch_data_0

    .line 25
    .line 26
    .line 27
    goto :goto_1

    .line 28
    :sswitch_0
    const-string v4, "androidx.core.app.NotificationCompat$MessagingStyle"

    .line 29
    .line 30
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    const/4 v5, 0x6

    .line 38
    goto :goto_1

    .line 39
    :sswitch_1
    const-string v4, "androidx.core.app.NotificationCompat$BigTextStyle"

    .line 40
    .line 41
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-nez v1, :cond_2

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_2
    const/4 v5, 0x5

    .line 49
    goto :goto_1

    .line 50
    :sswitch_2
    const-string v4, "androidx.core.app.NotificationCompat$InboxStyle"

    .line 51
    .line 52
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-nez v1, :cond_3

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_3
    const/4 v5, 0x4

    .line 60
    goto :goto_1

    .line 61
    :sswitch_3
    const-string v4, "androidx.core.app.NotificationCompat$CallStyle"

    .line 62
    .line 63
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-nez v1, :cond_4

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_4
    const/4 v5, 0x3

    .line 71
    goto :goto_1

    .line 72
    :sswitch_4
    const-string v4, "androidx.core.app.NotificationCompat$BigPictureStyle"

    .line 73
    .line 74
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-nez v1, :cond_5

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_5
    const/4 v5, 0x2

    .line 82
    goto :goto_1

    .line 83
    :sswitch_5
    const-string v4, "androidx.core.app.NotificationCompat$DecoratedCustomViewStyle"

    .line 84
    .line 85
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-nez v1, :cond_6

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_6
    move v5, v3

    .line 93
    goto :goto_1

    .line 94
    :sswitch_6
    const-string v4, "androidx.core.app.NotificationCompat$ProgressStyle"

    .line 95
    .line 96
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-nez v1, :cond_7

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_7
    move v5, v2

    .line 104
    :goto_1
    packed-switch v5, :pswitch_data_0

    .line 105
    .line 106
    .line 107
    goto :goto_2

    .line 108
    :pswitch_0
    new-instance v1, Lt/v;

    .line 109
    .line 110
    invoke-direct {v1}, Lt/v;-><init>()V

    .line 111
    .line 112
    .line 113
    goto :goto_3

    .line 114
    :pswitch_1
    new-instance v1, Lt/g;

    .line 115
    .line 116
    invoke-direct {v1, v2}, Lt/g;-><init>(I)V

    .line 117
    .line 118
    .line 119
    goto :goto_3

    .line 120
    :pswitch_2
    new-instance v1, Lt/g;

    .line 121
    .line 122
    invoke-direct {v1, v3}, Lt/g;-><init>(I)V

    .line 123
    .line 124
    .line 125
    goto :goto_3

    .line 126
    :pswitch_3
    new-instance v1, Lt/n;

    .line 127
    .line 128
    invoke-direct {v1}, Lt/A;-><init>()V

    .line 129
    .line 130
    .line 131
    goto :goto_3

    .line 132
    :pswitch_4
    new-instance v1, Lt/f;

    .line 133
    .line 134
    invoke-direct {v1}, Lt/A;-><init>()V

    .line 135
    .line 136
    .line 137
    goto :goto_3

    .line 138
    :pswitch_5
    new-instance v1, LT/a;

    .line 139
    .line 140
    invoke-direct {v1, v3}, LT/a;-><init>(I)V

    .line 141
    .line 142
    .line 143
    goto :goto_3

    .line 144
    :pswitch_6
    new-instance v1, Lt/z;

    .line 145
    .line 146
    invoke-direct {v1}, Lt/z;-><init>()V

    .line 147
    .line 148
    .line 149
    goto :goto_3

    .line 150
    :cond_8
    :goto_2
    move-object v1, v0

    .line 151
    :goto_3
    if-eqz v1, :cond_9

    .line 152
    .line 153
    goto/16 :goto_8

    .line 154
    .line 155
    :cond_9
    const-string v1, "android.selfDisplayName"

    .line 156
    .line 157
    invoke-virtual {p0, v1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    if-nez v1, :cond_19

    .line 162
    .line 163
    const-string v1, "android.messagingStyleUser"

    .line 164
    .line 165
    invoke-virtual {p0, v1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    if-eqz v1, :cond_a

    .line 170
    .line 171
    goto/16 :goto_7

    .line 172
    .line 173
    :cond_a
    const-string v1, "android.picture"

    .line 174
    .line 175
    invoke-virtual {p0, v1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 176
    .line 177
    .line 178
    move-result v1

    .line 179
    if-nez v1, :cond_18

    .line 180
    .line 181
    const-string v1, "android.pictureIcon"

    .line 182
    .line 183
    invoke-virtual {p0, v1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    if-eqz v1, :cond_b

    .line 188
    .line 189
    goto/16 :goto_6

    .line 190
    .line 191
    :cond_b
    const-string v1, "android.bigText"

    .line 192
    .line 193
    invoke-virtual {p0, v1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    if-eqz v1, :cond_c

    .line 198
    .line 199
    new-instance v1, Lt/g;

    .line 200
    .line 201
    invoke-direct {v1, v2}, Lt/g;-><init>(I)V

    .line 202
    .line 203
    .line 204
    goto/16 :goto_8

    .line 205
    .line 206
    :cond_c
    const-string v1, "android.textLines"

    .line 207
    .line 208
    invoke-virtual {p0, v1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    if-eqz v1, :cond_d

    .line 213
    .line 214
    new-instance v1, Lt/g;

    .line 215
    .line 216
    invoke-direct {v1, v3}, Lt/g;-><init>(I)V

    .line 217
    .line 218
    .line 219
    goto/16 :goto_8

    .line 220
    .line 221
    :cond_d
    const-string v1, "android.callType"

    .line 222
    .line 223
    invoke-virtual {p0, v1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 224
    .line 225
    .line 226
    move-result v1

    .line 227
    if-eqz v1, :cond_e

    .line 228
    .line 229
    new-instance v1, Lt/n;

    .line 230
    .line 231
    invoke-direct {v1}, Lt/A;-><init>()V

    .line 232
    .line 233
    .line 234
    goto/16 :goto_8

    .line 235
    .line 236
    :cond_e
    const-string v1, "android.progressSegments"

    .line 237
    .line 238
    invoke-virtual {p0, v1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 239
    .line 240
    .line 241
    move-result v1

    .line 242
    if-nez v1, :cond_17

    .line 243
    .line 244
    const-string v1, "android.progressPoints"

    .line 245
    .line 246
    invoke-virtual {p0, v1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 247
    .line 248
    .line 249
    move-result v1

    .line 250
    if-eqz v1, :cond_f

    .line 251
    .line 252
    goto/16 :goto_5

    .line 253
    .line 254
    :cond_f
    const-string v1, "android.template"

    .line 255
    .line 256
    invoke-virtual {p0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    if-nez v1, :cond_10

    .line 261
    .line 262
    goto/16 :goto_4

    .line 263
    .line 264
    :cond_10
    const-class v4, Landroid/app/Notification$BigPictureStyle;

    .line 265
    .line 266
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v4

    .line 270
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 271
    .line 272
    .line 273
    move-result v4

    .line 274
    if-eqz v4, :cond_11

    .line 275
    .line 276
    new-instance v1, Lt/f;

    .line 277
    .line 278
    invoke-direct {v1}, Lt/A;-><init>()V

    .line 279
    .line 280
    .line 281
    goto/16 :goto_8

    .line 282
    .line 283
    :cond_11
    const-class v4, Landroid/app/Notification$BigTextStyle;

    .line 284
    .line 285
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v4

    .line 289
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 290
    .line 291
    .line 292
    move-result v4

    .line 293
    if-eqz v4, :cond_12

    .line 294
    .line 295
    new-instance v1, Lt/g;

    .line 296
    .line 297
    invoke-direct {v1, v2}, Lt/g;-><init>(I)V

    .line 298
    .line 299
    .line 300
    goto :goto_8

    .line 301
    :cond_12
    const-class v2, Landroid/app/Notification$InboxStyle;

    .line 302
    .line 303
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object v2

    .line 307
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 308
    .line 309
    .line 310
    move-result v2

    .line 311
    if-eqz v2, :cond_13

    .line 312
    .line 313
    new-instance v1, Lt/g;

    .line 314
    .line 315
    invoke-direct {v1, v3}, Lt/g;-><init>(I)V

    .line 316
    .line 317
    .line 318
    goto :goto_8

    .line 319
    :cond_13
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 320
    .line 321
    const/16 v4, 0x24

    .line 322
    .line 323
    if-lt v2, v4, :cond_14

    .line 324
    .line 325
    invoke-static {}, LV2/o;->b()Ljava/lang/Class;

    .line 326
    .line 327
    .line 328
    move-result-object v2

    .line 329
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object v2

    .line 333
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 334
    .line 335
    .line 336
    move-result v2

    .line 337
    if-eqz v2, :cond_14

    .line 338
    .line 339
    new-instance v1, Lt/z;

    .line 340
    .line 341
    invoke-direct {v1}, Lt/z;-><init>()V

    .line 342
    .line 343
    .line 344
    goto :goto_8

    .line 345
    :cond_14
    const-class v2, Landroid/app/Notification$MessagingStyle;

    .line 346
    .line 347
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 348
    .line 349
    .line 350
    move-result-object v2

    .line 351
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 352
    .line 353
    .line 354
    move-result v2

    .line 355
    if-eqz v2, :cond_15

    .line 356
    .line 357
    new-instance v1, Lt/v;

    .line 358
    .line 359
    invoke-direct {v1}, Lt/v;-><init>()V

    .line 360
    .line 361
    .line 362
    goto :goto_8

    .line 363
    :cond_15
    const-class v2, Landroid/app/Notification$DecoratedCustomViewStyle;

    .line 364
    .line 365
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 366
    .line 367
    .line 368
    move-result-object v2

    .line 369
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 370
    .line 371
    .line 372
    move-result v1

    .line 373
    if-eqz v1, :cond_16

    .line 374
    .line 375
    new-instance v1, LT/a;

    .line 376
    .line 377
    invoke-direct {v1, v3}, LT/a;-><init>(I)V

    .line 378
    .line 379
    .line 380
    goto :goto_8

    .line 381
    :cond_16
    :goto_4
    move-object v1, v0

    .line 382
    goto :goto_8

    .line 383
    :cond_17
    :goto_5
    new-instance v1, Lt/z;

    .line 384
    .line 385
    invoke-direct {v1}, Lt/z;-><init>()V

    .line 386
    .line 387
    .line 388
    goto :goto_8

    .line 389
    :cond_18
    :goto_6
    new-instance v1, Lt/f;

    .line 390
    .line 391
    invoke-direct {v1}, Lt/A;-><init>()V

    .line 392
    .line 393
    .line 394
    goto :goto_8

    .line 395
    :cond_19
    :goto_7
    new-instance v1, Lt/v;

    .line 396
    .line 397
    invoke-direct {v1}, Lt/v;-><init>()V

    .line 398
    .line 399
    .line 400
    :goto_8
    if-nez v1, :cond_1a

    .line 401
    .line 402
    goto/16 :goto_0

    .line 403
    .line 404
    :cond_1a
    :try_start_0
    invoke-virtual {v1, p0}, Lt/A;->d(Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 405
    .line 406
    .line 407
    :goto_9
    instance-of p0, v1, Lt/v;

    .line 408
    .line 409
    if-eqz p0, :cond_1b

    .line 410
    .line 411
    check-cast v1, Lt/v;

    .line 412
    .line 413
    return-object v1

    .line 414
    :cond_1b
    return-object v0

    .line 415
    :sswitch_data_0
    .sparse-switch
        -0x722bb13c -> :sswitch_6
        -0x2ab80d9c -> :sswitch_5
        -0xa3fb04d -> :sswitch_4
        0x2a94ad33 -> :sswitch_3
        0x366a678b -> :sswitch_2
        0x36cfe824 -> :sswitch_1
        0x7c9f11cd -> :sswitch_0
    .end sparse-switch

    .line 416
    .line 417
    .line 418
    .line 419
    .line 420
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final a(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lt/A;->a(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lt/v;->g:Lt/I;

    .line 5
    .line 6
    iget-object v0, v0, Lt/I;->a:Ljava/lang/CharSequence;

    .line 7
    .line 8
    const-string v1, "android.selfDisplayName"

    .line 9
    .line 10
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lt/v;->g:Lt/I;

    .line 14
    .line 15
    invoke-virtual {v0}, Lt/I;->b()Landroid/os/Bundle;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "android.messagingStyleUser"

    .line 20
    .line 21
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 22
    .line 23
    .line 24
    const-string v0, "android.hiddenConversationTitle"

    .line 25
    .line 26
    iget-object v1, p0, Lt/v;->h:Ljava/lang/CharSequence;

    .line 27
    .line 28
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lt/v;->h:Ljava/lang/CharSequence;

    .line 32
    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    iget-object v0, p0, Lt/v;->i:Ljava/lang/Boolean;

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    const-string v0, "android.conversationTitle"

    .line 44
    .line 45
    iget-object v1, p0, Lt/v;->h:Ljava/lang/CharSequence;

    .line 46
    .line 47
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    iget-object v0, p0, Lt/v;->e:Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-nez v1, :cond_1

    .line 57
    .line 58
    const-string v1, "android.messages"

    .line 59
    .line 60
    invoke-static {v0}, Lt/u;->a(Ljava/util/ArrayList;)[Landroid/os/Bundle;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    iget-object v0, p0, Lt/v;->f:Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-nez v1, :cond_2

    .line 74
    .line 75
    const-string v1, "android.messages.historic"

    .line 76
    .line 77
    invoke-static {v0}, Lt/u;->a(Ljava/util/ArrayList;)[Landroid/os/Bundle;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 82
    .line 83
    .line 84
    :cond_2
    iget-object v0, p0, Lt/v;->i:Ljava/lang/Boolean;

    .line 85
    .line 86
    if-eqz v0, :cond_3

    .line 87
    .line 88
    const-string v1, "android.isGroupConversation"

    .line 89
    .line 90
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 95
    .line 96
    .line 97
    :cond_3
    return-void
.end method

.method public final b(LR/j;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lt/v;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lt/v;->i:Ljava/lang/Boolean;

    .line 10
    .line 11
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 12
    .line 13
    const/16 v1, 0x1c

    .line 14
    .line 15
    if-lt v0, v1, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lt/v;->g:Lt/I;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    invoke-static {v0}, LD/d;->r(Lt/I;)Landroid/app/Person;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Lt/r;->a(Landroid/app/Person;)Landroid/app/Notification$MessagingStyle;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object v0, p0, Lt/v;->g:Lt/I;

    .line 32
    .line 33
    iget-object v0, v0, Lt/I;->a:Ljava/lang/CharSequence;

    .line 34
    .line 35
    invoke-static {v0}, Lt/p;->b(Ljava/lang/CharSequence;)Landroid/app/Notification$MessagingStyle;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    :goto_0
    iget-object v2, p0, Lt/v;->e:Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    const/4 v4, 0x0

    .line 46
    move v5, v4

    .line 47
    :goto_1
    if-ge v5, v3, :cond_1

    .line 48
    .line 49
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v6

    .line 53
    add-int/lit8 v5, v5, 0x1

    .line 54
    .line 55
    check-cast v6, Lt/u;

    .line 56
    .line 57
    invoke-virtual {v6}, Lt/u;->c()Landroid/app/Notification$MessagingStyle$Message;

    .line 58
    .line 59
    .line 60
    move-result-object v6

    .line 61
    invoke-static {v0, v6}, Lt/p;->a(Landroid/app/Notification$MessagingStyle;Landroid/app/Notification$MessagingStyle$Message;)Landroid/app/Notification$MessagingStyle;

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_1
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 66
    .line 67
    const/16 v3, 0x1a

    .line 68
    .line 69
    if-lt v2, v3, :cond_2

    .line 70
    .line 71
    iget-object v2, p0, Lt/v;->f:Ljava/util/ArrayList;

    .line 72
    .line 73
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    :goto_2
    if-ge v4, v3, :cond_2

    .line 78
    .line 79
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    add-int/lit8 v4, v4, 0x1

    .line 84
    .line 85
    check-cast v5, Lt/u;

    .line 86
    .line 87
    invoke-virtual {v5}, Lt/u;->c()Landroid/app/Notification$MessagingStyle$Message;

    .line 88
    .line 89
    .line 90
    move-result-object v5

    .line 91
    invoke-static {v0, v5}, Lt/q;->a(Landroid/app/Notification$MessagingStyle;Landroid/app/Notification$MessagingStyle$Message;)Landroid/app/Notification$MessagingStyle;

    .line 92
    .line 93
    .line 94
    goto :goto_2

    .line 95
    :cond_2
    iget-object v2, p0, Lt/v;->i:Ljava/lang/Boolean;

    .line 96
    .line 97
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    if-nez v2, :cond_3

    .line 102
    .line 103
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 104
    .line 105
    if-lt v2, v1, :cond_4

    .line 106
    .line 107
    :cond_3
    iget-object v2, p0, Lt/v;->h:Ljava/lang/CharSequence;

    .line 108
    .line 109
    invoke-static {v0, v2}, Lt/p;->c(Landroid/app/Notification$MessagingStyle;Ljava/lang/CharSequence;)Landroid/app/Notification$MessagingStyle;

    .line 110
    .line 111
    .line 112
    :cond_4
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 113
    .line 114
    if-lt v2, v1, :cond_5

    .line 115
    .line 116
    iget-object v1, p0, Lt/v;->i:Ljava/lang/Boolean;

    .line 117
    .line 118
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    invoke-static {v0, v1}, Lt/r;->b(Landroid/app/Notification$MessagingStyle;Z)Landroid/app/Notification$MessagingStyle;

    .line 123
    .line 124
    .line 125
    :cond_5
    iget-object p1, p1, LR/j;->d:Ljava/lang/Object;

    .line 126
    .line 127
    check-cast p1, Landroid/app/Notification$Builder;

    .line 128
    .line 129
    invoke-virtual {v0, p1}, Landroid/app/Notification$Style;->setBuilder(Landroid/app/Notification$Builder;)V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public final c()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "androidx.core.app.NotificationCompat$MessagingStyle"

    .line 2
    .line 3
    return-object v0
.end method

.method public final d(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lt/A;->d(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lt/v;->e:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 7
    .line 8
    .line 9
    const-string v1, "android.messagingStyleUser"

    .line 10
    .line 11
    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v1}, Lt/I;->a(Landroid/os/Bundle;)Lt/I;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iput-object v1, p0, Lt/v;->g:Lt/I;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const-string v1, "android.selfDisplayName"

    .line 29
    .line 30
    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    new-instance v2, Lt/I;

    .line 35
    .line 36
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v1, v2, Lt/I;->a:Ljava/lang/CharSequence;

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    iput-object v1, v2, Lt/I;->b:Landroidx/core/graphics/drawable/IconCompat;

    .line 43
    .line 44
    iput-object v1, v2, Lt/I;->c:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v1, v2, Lt/I;->d:Ljava/lang/String;

    .line 47
    .line 48
    const/4 v1, 0x0

    .line 49
    iput-boolean v1, v2, Lt/I;->e:Z

    .line 50
    .line 51
    iput-boolean v1, v2, Lt/I;->f:Z

    .line 52
    .line 53
    iput-object v2, p0, Lt/v;->g:Lt/I;

    .line 54
    .line 55
    :goto_0
    const-string v1, "android.conversationTitle"

    .line 56
    .line 57
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    iput-object v1, p0, Lt/v;->h:Ljava/lang/CharSequence;

    .line 62
    .line 63
    if-nez v1, :cond_1

    .line 64
    .line 65
    const-string v1, "android.hiddenConversationTitle"

    .line 66
    .line 67
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    iput-object v1, p0, Lt/v;->h:Ljava/lang/CharSequence;

    .line 72
    .line 73
    :cond_1
    const-string v1, "android.messages"

    .line 74
    .line 75
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    if-eqz v1, :cond_2

    .line 80
    .line 81
    invoke-static {v1}, Lt/u;->b([Landroid/os/Parcelable;)Ljava/util/ArrayList;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 86
    .line 87
    .line 88
    :cond_2
    const-string v0, "android.messages.historic"

    .line 89
    .line 90
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    if-eqz v0, :cond_3

    .line 95
    .line 96
    iget-object v1, p0, Lt/v;->f:Ljava/util/ArrayList;

    .line 97
    .line 98
    invoke-static {v0}, Lt/u;->b([Landroid/os/Parcelable;)Ljava/util/ArrayList;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 103
    .line 104
    .line 105
    :cond_3
    const-string v0, "android.isGroupConversation"

    .line 106
    .line 107
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    if-eqz v1, :cond_4

    .line 112
    .line 113
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    iput-object p1, p0, Lt/v;->i:Ljava/lang/Boolean;

    .line 122
    .line 123
    :cond_4
    return-void
.end method

.method public final f()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lt/A;->a:Lt/i;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget-object v0, v0, Lt/i;->a:Landroid/content/Context;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget v0, v0, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    .line 13
    .line 14
    const/16 v2, 0x1c

    .line 15
    .line 16
    if-ge v0, v2, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lt/v;->i:Ljava/lang/Boolean;

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lt/v;->h:Ljava/lang/CharSequence;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    return v0

    .line 28
    :cond_0
    return v1

    .line 29
    :cond_1
    iget-object v0, p0, Lt/v;->i:Ljava/lang/Boolean;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    return v0

    .line 38
    :cond_2
    return v1
.end method
