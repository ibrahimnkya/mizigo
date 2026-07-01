.class public abstract LK0/g;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public static final b:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public static final synthetic c:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LK0/g;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 7
    .line 8
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, LK0/g;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 14
    .line 15
    return-void
.end method

.method public static a(Landroid/content/Context;I)I
    .locals 12

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f0e002c

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    const-string v0, "GooglePlayServicesUtil"

    .line 13
    .line 14
    const-string v1, "The Google Play services resources were not found. Check your project configuration to ensure that the resources are included."

    .line 15
    .line 16
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    :goto_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "com.google.android.gms"

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/4 v1, 0x1

    .line 30
    if-nez v0, :cond_5

    .line 31
    .line 32
    sget-object v0, LK0/g;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    goto/16 :goto_4

    .line 41
    .line 42
    :cond_0
    sget-object v0, LN0/n;->a:Ljava/lang/Object;

    .line 43
    .line 44
    monitor-enter v0

    .line 45
    :try_start_1
    sget-boolean v2, LN0/n;->b:Z

    .line 46
    .line 47
    if-eqz v2, :cond_1

    .line 48
    .line 49
    monitor-exit v0

    .line 50
    goto :goto_2

    .line 51
    :catchall_1
    move-exception p0

    .line 52
    goto/16 :goto_3

    .line 53
    .line 54
    :cond_1
    sput-boolean v1, LN0/n;->b:Z

    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-static {p0}, LT0/c;->a(Landroid/content/Context;)LT0/b;

    .line 61
    .line 62
    .line 63
    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 64
    :try_start_2
    iget-object v3, v3, LT0/b;->a:Landroid/content/Context;

    .line 65
    .line 66
    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    const/16 v4, 0x80

    .line 71
    .line 72
    invoke-virtual {v3, v2, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 77
    .line 78
    if-nez v2, :cond_2

    .line 79
    .line 80
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 81
    goto :goto_2

    .line 82
    :cond_2
    :try_start_4
    const-string v3, "com.google.app.id"

    .line 83
    .line 84
    invoke-virtual {v2, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    const-string v3, "com.google.android.gms.version"

    .line 88
    .line 89
    invoke-virtual {v2, v3}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    sput v2, LN0/n;->c:I
    :try_end_4
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :catch_0
    move-exception v2

    .line 97
    :try_start_5
    const-string v3, "MetadataValueReader"

    .line 98
    .line 99
    const-string v4, "This should never happen."

    .line 100
    .line 101
    invoke-static {v3, v4, v2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 102
    .line 103
    .line 104
    :goto_1
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 105
    :goto_2
    sget v0, LN0/n;->c:I

    .line 106
    .line 107
    if-eqz v0, :cond_4

    .line 108
    .line 109
    const v2, 0xbdfcb8

    .line 110
    .line 111
    .line 112
    if-ne v0, v2, :cond_3

    .line 113
    .line 114
    goto :goto_4

    .line 115
    :cond_3
    new-instance p0, Lcom/google/android/gms/common/GooglePlayServicesIncorrectManifestValueException;

    .line 116
    .line 117
    sget p1, LK0/e;->a:I

    .line 118
    .line 119
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    add-int/lit8 v1, v1, 0x68

    .line 136
    .line 137
    add-int/2addr v1, v2

    .line 138
    new-instance v2, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    add-int/lit16 v1, v1, 0xc2

    .line 141
    .line 142
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 143
    .line 144
    .line 145
    const-string v1, "The meta-data tag in your app\'s AndroidManifest.xml does not have the right value.  Expected "

    .line 146
    .line 147
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string p1, " but found "

    .line 154
    .line 155
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    const-string p1, ".  You must have the following declaration within the <application> element:     <meta-data android:name=\"com.google.android.gms.version\" android:value=\"@integer/google_play_services_version\" />"

    .line 162
    .line 163
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    throw p0

    .line 174
    :cond_4
    new-instance p0, Lcom/google/android/gms/common/GooglePlayServicesMissingManifestValueException;

    .line 175
    .line 176
    invoke-direct {p0}, Lcom/google/android/gms/common/GooglePlayServicesMissingManifestValueException;-><init>()V

    .line 177
    .line 178
    .line 179
    throw p0

    .line 180
    :goto_3
    :try_start_6
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 181
    throw p0

    .line 182
    :cond_5
    :goto_4
    invoke-static {p0}, LR0/b;->c(Landroid/content/Context;)Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    const/4 v2, 0x0

    .line 187
    if-nez v0, :cond_8

    .line 188
    .line 189
    sget-object v0, LR0/b;->d:Ljava/lang/Boolean;

    .line 190
    .line 191
    if-nez v0, :cond_7

    .line 192
    .line 193
    invoke-static {}, LR0/b;->b()Z

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    if-eqz v0, :cond_6

    .line 198
    .line 199
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    const-string v3, "android.hardware.type.embedded"

    .line 204
    .line 205
    invoke-virtual {v0, v3}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 206
    .line 207
    .line 208
    move-result v0

    .line 209
    goto :goto_5

    .line 210
    :cond_6
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    const-string v3, "android.hardware.type.iot"

    .line 215
    .line 216
    invoke-virtual {v0, v3}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    :goto_5
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    sput-object v0, LR0/b;->d:Ljava/lang/Boolean;

    .line 225
    .line 226
    :cond_7
    sget-object v0, LR0/b;->d:Ljava/lang/Boolean;

    .line 227
    .line 228
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    if-nez v0, :cond_8

    .line 233
    .line 234
    move v0, v1

    .line 235
    goto :goto_6

    .line 236
    :cond_8
    move v0, v2

    .line 237
    :goto_6
    if-ltz p1, :cond_16

    .line 238
    .line 239
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v3

    .line 243
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 244
    .line 245
    .line 246
    move-result-object v4

    .line 247
    const/16 v5, 0x1c

    .line 248
    .line 249
    const/16 v6, 0x9

    .line 250
    .line 251
    if-eqz v0, :cond_a

    .line 252
    .line 253
    :try_start_7
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 254
    .line 255
    if-lt v7, v5, :cond_9

    .line 256
    .line 257
    const v7, 0x8002040

    .line 258
    .line 259
    .line 260
    goto :goto_7

    .line 261
    :cond_9
    const/16 v7, 0x2040

    .line 262
    .line 263
    :goto_7
    const-string v8, "com.android.vending"

    .line 264
    .line 265
    invoke-virtual {v4, v8, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 266
    .line 267
    .line 268
    move-result-object v7
    :try_end_7
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_7 .. :try_end_7} :catch_1

    .line 269
    goto :goto_9

    .line 270
    :catch_1
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    const-string p1, " requires the Google Play Store, but it is missing."

    .line 275
    .line 276
    const-string v0, "GooglePlayServicesUtil"

    .line 277
    .line 278
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object p0

    .line 282
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    .line 284
    .line 285
    :goto_8
    move v1, v6

    .line 286
    goto/16 :goto_12

    .line 287
    .line 288
    :cond_a
    const/4 v7, 0x0

    .line 289
    :goto_9
    :try_start_8
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 290
    .line 291
    if-lt v8, v5, :cond_b

    .line 292
    .line 293
    const v5, 0x8000040

    .line 294
    .line 295
    .line 296
    goto :goto_a

    .line 297
    :cond_b
    const/16 v5, 0x40

    .line 298
    .line 299
    :goto_a
    const-string v8, "com.google.android.gms"

    .line 300
    .line 301
    invoke-virtual {v4, v8, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 302
    .line 303
    .line 304
    move-result-object v5
    :try_end_8
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_8 .. :try_end_8} :catch_3

    .line 305
    const-class v8, LK0/h;

    .line 306
    .line 307
    monitor-enter v8

    .line 308
    :try_start_9
    sget-object v9, LK0/h;->f:LK0/h;

    .line 309
    .line 310
    if-nez v9, :cond_d

    .line 311
    .line 312
    sget-object v9, LK0/o;->a:LK0/k;

    .line 313
    .line 314
    const-class v9, LK0/o;

    .line 315
    .line 316
    monitor-enter v9
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 317
    :try_start_a
    sget-object v10, LK0/o;->c:Landroid/content/Context;

    .line 318
    .line 319
    if-nez v10, :cond_c

    .line 320
    .line 321
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 322
    .line 323
    .line 324
    move-result-object v10

    .line 325
    sput-object v10, LK0/o;->c:Landroid/content/Context;
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 326
    .line 327
    :try_start_b
    monitor-exit v9
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    .line 328
    goto :goto_b

    .line 329
    :catchall_2
    move-exception p0

    .line 330
    goto :goto_c

    .line 331
    :cond_c
    :try_start_c
    const-string v10, "GoogleCertificates"

    .line 332
    .line 333
    const-string v11, "GoogleCertificates has been initialized already"

    .line 334
    .line 335
    invoke-static {v10, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 336
    .line 337
    .line 338
    :try_start_d
    monitor-exit v9

    .line 339
    :goto_b
    new-instance v9, LK0/h;

    .line 340
    .line 341
    invoke-direct {v9, v2}, LK0/h;-><init>(I)V

    .line 342
    .line 343
    .line 344
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 345
    .line 346
    .line 347
    sput-object v9, LK0/h;->f:LK0/h;
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    .line 348
    .line 349
    goto :goto_d

    .line 350
    :catchall_3
    move-exception p0

    .line 351
    goto/16 :goto_11

    .line 352
    .line 353
    :goto_c
    :try_start_e
    monitor-exit v9
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    .line 354
    :try_start_f
    throw p0

    .line 355
    :cond_d
    :goto_d
    monitor-exit v8
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_3

    .line 356
    invoke-static {v5}, LK0/h;->p(Landroid/content/pm/PackageInfo;)Z

    .line 357
    .line 358
    .line 359
    move-result p0

    .line 360
    if-nez p0, :cond_e

    .line 361
    .line 362
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 363
    .line 364
    .line 365
    move-result-object p0

    .line 366
    const-string p1, " requires Google Play services, but their signature is invalid."

    .line 367
    .line 368
    const-string v0, "GooglePlayServicesUtil"

    .line 369
    .line 370
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 371
    .line 372
    .line 373
    move-result-object p0

    .line 374
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 375
    .line 376
    .line 377
    goto :goto_8

    .line 378
    :cond_e
    if-eqz v0, :cond_f

    .line 379
    .line 380
    invoke-static {v7}, LN0/n;->e(Ljava/lang/Object;)V

    .line 381
    .line 382
    .line 383
    invoke-static {v7}, LK0/h;->p(Landroid/content/pm/PackageInfo;)Z

    .line 384
    .line 385
    .line 386
    move-result p0

    .line 387
    if-nez p0, :cond_f

    .line 388
    .line 389
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 390
    .line 391
    .line 392
    move-result-object p0

    .line 393
    const-string p1, " requires Google Play Store, but its signature is invalid."

    .line 394
    .line 395
    const-string v0, "GooglePlayServicesUtil"

    .line 396
    .line 397
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 398
    .line 399
    .line 400
    move-result-object p0

    .line 401
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 402
    .line 403
    .line 404
    goto :goto_8

    .line 405
    :cond_f
    if-eqz v0, :cond_10

    .line 406
    .line 407
    if-eqz v7, :cond_10

    .line 408
    .line 409
    iget-object p0, v7, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .line 410
    .line 411
    aget-object p0, p0, v2

    .line 412
    .line 413
    iget-object v0, v5, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .line 414
    .line 415
    aget-object v0, v0, v2

    .line 416
    .line 417
    invoke-virtual {p0, v0}, Landroid/content/pm/Signature;->equals(Ljava/lang/Object;)Z

    .line 418
    .line 419
    .line 420
    move-result p0

    .line 421
    if-nez p0, :cond_10

    .line 422
    .line 423
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 424
    .line 425
    .line 426
    move-result-object p0

    .line 427
    const-string p1, " requires Google Play Store, but its signature doesn\'t match that of Google Play services."

    .line 428
    .line 429
    const-string v0, "GooglePlayServicesUtil"

    .line 430
    .line 431
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 432
    .line 433
    .line 434
    move-result-object p0

    .line 435
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 436
    .line 437
    .line 438
    goto/16 :goto_8

    .line 439
    .line 440
    :cond_10
    iget p0, v5, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 441
    .line 442
    const/4 v0, -0x1

    .line 443
    if-ne p0, v0, :cond_11

    .line 444
    .line 445
    move v6, v0

    .line 446
    goto :goto_e

    .line 447
    :cond_11
    div-int/lit16 v6, p0, 0x3e8

    .line 448
    .line 449
    :goto_e
    if-ne p1, v0, :cond_12

    .line 450
    .line 451
    goto :goto_f

    .line 452
    :cond_12
    div-int/lit16 v0, p1, 0x3e8

    .line 453
    .line 454
    :goto_f
    if-ge v6, v0, :cond_13

    .line 455
    .line 456
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 457
    .line 458
    .line 459
    move-result-object v0

    .line 460
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 461
    .line 462
    .line 463
    move-result v0

    .line 464
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 465
    .line 466
    .line 467
    move-result-object v1

    .line 468
    add-int/lit8 v0, v0, 0x31

    .line 469
    .line 470
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 471
    .line 472
    .line 473
    move-result v1

    .line 474
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 475
    .line 476
    .line 477
    move-result-object v2

    .line 478
    add-int/2addr v0, v1

    .line 479
    add-int/lit8 v0, v0, 0xb

    .line 480
    .line 481
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 482
    .line 483
    .line 484
    move-result v1

    .line 485
    new-instance v2, Ljava/lang/StringBuilder;

    .line 486
    .line 487
    add-int/2addr v0, v1

    .line 488
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 489
    .line 490
    .line 491
    const-string v0, "Google Play services out of date for "

    .line 492
    .line 493
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 494
    .line 495
    .line 496
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 497
    .line 498
    .line 499
    const-string v0, ".  Requires "

    .line 500
    .line 501
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 502
    .line 503
    .line 504
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 505
    .line 506
    .line 507
    const-string p1, " but found "

    .line 508
    .line 509
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 510
    .line 511
    .line 512
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 513
    .line 514
    .line 515
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 516
    .line 517
    .line 518
    move-result-object p0

    .line 519
    const-string p1, "GooglePlayServicesUtil"

    .line 520
    .line 521
    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 522
    .line 523
    .line 524
    const/4 v1, 0x2

    .line 525
    goto :goto_12

    .line 526
    :cond_13
    iget-object p0, v5, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 527
    .line 528
    if-nez p0, :cond_14

    .line 529
    .line 530
    :try_start_10
    const-string p0, "com.google.android.gms"

    .line 531
    .line 532
    invoke-virtual {v4, p0, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 533
    .line 534
    .line 535
    move-result-object p0
    :try_end_10
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_10 .. :try_end_10} :catch_2

    .line 536
    goto :goto_10

    .line 537
    :catch_2
    move-exception p0

    .line 538
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 539
    .line 540
    .line 541
    move-result-object p1

    .line 542
    const-string v0, " requires Google Play services, but they\'re missing when getting application info."

    .line 543
    .line 544
    const-string v2, "GooglePlayServicesUtil"

    .line 545
    .line 546
    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 547
    .line 548
    .line 549
    move-result-object p1

    .line 550
    invoke-static {v2, p1, p0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 551
    .line 552
    .line 553
    goto :goto_12

    .line 554
    :cond_14
    :goto_10
    iget-boolean p0, p0, Landroid/content/pm/ApplicationInfo;->enabled:Z

    .line 555
    .line 556
    if-nez p0, :cond_15

    .line 557
    .line 558
    const/4 v1, 0x3

    .line 559
    goto :goto_12

    .line 560
    :cond_15
    return v2

    .line 561
    :goto_11
    :try_start_11
    monitor-exit v8
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_3

    .line 562
    throw p0

    .line 563
    :catch_3
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 564
    .line 565
    .line 566
    move-result-object p0

    .line 567
    const-string p1, " requires Google Play services, but they are missing."

    .line 568
    .line 569
    const-string v0, "GooglePlayServicesUtil"

    .line 570
    .line 571
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 572
    .line 573
    .line 574
    move-result-object p0

    .line 575
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 576
    .line 577
    .line 578
    :goto_12
    return v1

    .line 579
    :cond_16
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 580
    .line 581
    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 582
    .line 583
    .line 584
    throw p0
.end method
