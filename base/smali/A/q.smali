.class public final LA/q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:I

.field public f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;

.field public h:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    iput v0, p0, LA/q;->e:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;LJ0/a;Ljava/util/concurrent/CountDownLatch;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, LA/q;->e:I

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LA/q;->f:Ljava/lang/Object;

    iput-object p2, p0, LA/q;->g:Ljava/lang/Object;

    iput-object p3, p0, LA/q;->h:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Lk3/n;I)V
    .locals 0

    .line 3
    iput p4, p0, LA/q;->e:I

    iput-object p1, p0, LA/q;->h:Ljava/lang/Object;

    iput-object p2, p0, LA/q;->f:Ljava/lang/Object;

    iput-object p3, p0, LA/q;->g:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(LA/q;Ljava/lang/Exception;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/io/StringWriter;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/io/PrintWriter;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const-string p1, "Unknown error"

    .line 26
    .line 27
    :goto_0
    iget-object p0, p0, LA/q;->g:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast p0, LQ2/g;

    .line 30
    .line 31
    const-string v1, "Exception encountered"

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v1, p1, v0}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 13

    .line 1
    iget v0, p0, LA/q;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    sget-object v1, LV2/m;->j:Ljava/lang/Object;

    .line 7
    .line 8
    monitor-enter v1

    .line 9
    :try_start_0
    iget-object v0, p0, LA/q;->h:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, LV2/m;

    .line 12
    .line 13
    iget-object v2, p0, LA/q;->f:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v2, LV2/e;

    .line 16
    .line 17
    invoke-static {v0, v2}, LV2/m;->a(LV2/m;LV2/e;)V

    .line 18
    .line 19
    .line 20
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    iget-object v0, p0, LA/q;->g:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v0, LQ2/g;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {v0, v1}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :catchall_0
    move-exception v0

    .line 31
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    throw v0

    .line 33
    :pswitch_0
    iget-object v0, p0, LA/q;->f:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast v0, Lk3/l;

    .line 36
    .line 37
    iget-object v0, v0, Lk3/l;->b:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast v0, Ljava/util/Map;

    .line 40
    .line 41
    const-string v1, "options"

    .line 42
    .line 43
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Ljava/util/Map;

    .line 48
    .line 49
    new-instance v1, LQ2/e;

    .line 50
    .line 51
    invoke-direct {v1, v0}, LQ2/e;-><init>(Ljava/util/Map;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, LA/q;->h:Ljava/lang/Object;

    .line 55
    .line 56
    check-cast v0, LQ2/h;

    .line 57
    .line 58
    iget-object v3, v0, LQ2/h;->f:LQ2/d;

    .line 59
    .line 60
    new-instance v7, LA/c;

    .line 61
    .line 62
    const/16 v0, 0x12

    .line 63
    .line 64
    const/4 v2, 0x0

    .line 65
    invoke-direct {v7, p0, v1, v0, v2}, LA/c;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 66
    .line 67
    .line 68
    iget-object v0, v3, LQ2/d;->b:Landroid/content/Context;

    .line 69
    .line 70
    const-string v9, "FlutterSecureStorage"

    .line 71
    .line 72
    iput-object v1, v3, LQ2/d;->a:LQ2/e;

    .line 73
    .line 74
    iget-object v2, v3, LQ2/d;->c:Landroid/content/SharedPreferences;

    .line 75
    .line 76
    const/4 v4, 0x0

    .line 77
    if-eqz v2, :cond_0

    .line 78
    .line 79
    invoke-virtual {v7, v4}, LA/c;->b(Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    goto/16 :goto_1

    .line 83
    .line 84
    :cond_0
    iget-object v2, v1, LQ2/e;->a:Ljava/lang/String;

    .line 85
    .line 86
    iget-boolean v5, v1, LQ2/e;->d:Z

    .line 87
    .line 88
    iget-boolean v1, v1, LQ2/e;->e:Z

    .line 89
    .line 90
    const/4 v6, 0x0

    .line 91
    invoke-virtual {v0, v2, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    const-string v8, "FlutterSecureStorageConfiguration"

    .line 96
    .line 97
    invoke-virtual {v0, v8, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 98
    .line 99
    .line 100
    move-result-object v8

    .line 101
    const-string v10, "ENCRYPTED_PREFERENCES_MIGRATED"

    .line 102
    .line 103
    invoke-interface {v8, v10, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 104
    .line 105
    .line 106
    move-result v10

    .line 107
    if-nez v10, :cond_6

    .line 108
    .line 109
    :try_start_2
    invoke-virtual {v3, v0}, LQ2/d;->h(Landroid/content/Context;)LS2/b;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {v0}, LS2/b;->getAll()Ljava/util/Map;

    .line 114
    .line 115
    .line 116
    move-result-object v6

    .line 117
    check-cast v6, Ljava/util/HashMap;

    .line 118
    .line 119
    invoke-virtual {v6}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 120
    .line 121
    .line 122
    move-result-object v6

    .line 123
    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 124
    .line 125
    .line 126
    move-result-object v6

    .line 127
    :cond_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 128
    .line 129
    .line 130
    move-result v11

    .line 131
    if-eqz v11, :cond_5

    .line 132
    .line 133
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v11

    .line 137
    check-cast v11, Ljava/lang/String;

    .line 138
    .line 139
    iget-object v12, v3, LQ2/d;->a:LQ2/e;

    .line 140
    .line 141
    iget-object v12, v12, LQ2/e;->b:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {v11, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 144
    .line 145
    .line 146
    move-result v11

    .line 147
    if-eqz v11, :cond_1

    .line 148
    .line 149
    const-string v6, "Found data in EncryptedSharedPreferences (deprecated)"

    .line 150
    .line 151
    invoke-static {v9, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    .line 153
    .line 154
    const-string v6, "EncryptedSharedPreferences is DEPRECATED and will be removed in a later version"

    .line 155
    .line 156
    invoke-static {v9, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    const-string v6, "The Jetpack Security library has been deprecated by Google."

    .line 160
    .line 161
    invoke-static {v9, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    .line 163
    .line 164
    if-nez v5, :cond_3

    .line 165
    .line 166
    const-string v5, "Data found in EncryptedSharedPreferences, but migrateOnAlgorithmChange is set to false."

    .line 167
    .line 168
    invoke-static {v9, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    .line 170
    .line 171
    const-string v5, "Set migrateOnAlgorithmChange=true to migrate to custom cipher storage."

    .line 172
    .line 173
    invoke-static {v9, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    .line 175
    .line 176
    if-eqz v1, :cond_2

    .line 177
    .line 178
    const-string v5, "Using EncryptedSharedPreferences (migration disabled)."

    .line 179
    .line 180
    invoke-static {v9, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    .line 182
    .line 183
    iput-object v0, v3, LQ2/d;->c:Landroid/content/SharedPreferences;

    .line 184
    .line 185
    invoke-virtual {v7, v4}, LA/c;->b(Ljava/lang/Object;)V

    .line 186
    .line 187
    .line 188
    goto/16 :goto_1

    .line 189
    .line 190
    :catch_0
    move-exception v0

    .line 191
    goto :goto_0

    .line 192
    :cond_2
    const-string v0, "Data exists in EncryptedSharedPreferences but encryptedSharedPreferences=false and migrateOnAlgorithmChange=false."

    .line 193
    .line 194
    invoke-static {v9, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    .line 196
    .line 197
    const-string v0, "Either set encryptedSharedPreferences=true to use the old data, or set migrateOnAlgorithmChange=true to migrate it."

    .line 198
    .line 199
    invoke-static {v9, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    .line 201
    .line 202
    new-instance v0, Ljava/lang/Exception;

    .line 203
    .line 204
    const-string v4, "EncryptedSharedPreferences data found but migration is disabled. Set migrateOnAlgorithmChange=true to migrate."

    .line 205
    .line 206
    invoke-direct {v0, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {v7, v0}, LA/c;->h(Ljava/lang/Exception;)V

    .line 210
    .line 211
    .line 212
    goto :goto_1

    .line 213
    :cond_3
    const-string v4, "Migrating data from EncryptedSharedPreferences to custom cipher storage..."

    .line 214
    .line 215
    invoke-static {v9, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    .line 217
    .line 218
    if-eqz v1, :cond_4

    .line 219
    .line 220
    const-string v4, "Your data will be automatically migrated. You can safely remove encryptedSharedPreferences from your config after migration."

    .line 221
    .line 222
    invoke-static {v9, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 223
    .line 224
    .line 225
    :cond_4
    const-string v4, "Migrating data from EncryptedSharedPreferences to selected custom cipher storage..."

    .line 226
    .line 227
    invoke-static {v9, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 228
    .line 229
    .line 230
    move-object v5, v2

    .line 231
    :try_start_3
    new-instance v2, LD0/d;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 232
    .line 233
    move-object v6, v8

    .line 234
    const/4 v8, 0x1

    .line 235
    move-object v4, v0

    .line 236
    :try_start_4
    invoke-direct/range {v2 .. v8}, LD0/d;-><init>(LQ2/d;Ljava/lang/Object;Ljava/lang/Object;Landroid/content/SharedPreferences;LQ2/i;I)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 237
    .line 238
    .line 239
    move-object v0, v2

    .line 240
    move-object v2, v5

    .line 241
    move-object v8, v6

    .line 242
    :try_start_5
    invoke-virtual {v3, v8, v0}, LQ2/d;->i(Landroid/content/SharedPreferences;LQ2/i;)V

    .line 243
    .line 244
    .line 245
    goto :goto_1

    .line 246
    :catch_1
    move-exception v0

    .line 247
    move-object v2, v5

    .line 248
    move-object v8, v6

    .line 249
    goto :goto_0

    .line 250
    :catch_2
    move-exception v0

    .line 251
    move-object v2, v5

    .line 252
    goto :goto_0

    .line 253
    :cond_5
    const-string v6, "No data found in EncryptedSharedPreferences."

    .line 254
    .line 255
    invoke-static {v9, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 256
    .line 257
    .line 258
    if-eqz v1, :cond_6

    .line 259
    .line 260
    if-nez v5, :cond_6

    .line 261
    .line 262
    const-string v5, "Using EncryptedSharedPreferences (deprecated). Consider migrating to custom ciphers."

    .line 263
    .line 264
    invoke-static {v9, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 265
    .line 266
    .line 267
    iput-object v0, v3, LQ2/d;->c:Landroid/content/SharedPreferences;

    .line 268
    .line 269
    invoke-virtual {v7, v4}, LA/c;->b(Ljava/lang/Object;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 270
    .line 271
    .line 272
    goto :goto_1

    .line 273
    :goto_0
    const-string v4, "EncryptedSharedPreferences initialization failed. Falling back to custom ciphers."

    .line 274
    .line 275
    invoke-static {v9, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 276
    .line 277
    .line 278
    :cond_6
    iget-object v0, v3, LQ2/d;->c:Landroid/content/SharedPreferences;

    .line 279
    .line 280
    if-nez v0, :cond_8

    .line 281
    .line 282
    if-eqz v1, :cond_7

    .line 283
    .line 284
    if-eqz v10, :cond_7

    .line 285
    .line 286
    const-string v0, "Data already migrated, encryptedSharedPreferences ignored and can be safely removed."

    .line 287
    .line 288
    invoke-static {v9, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 289
    .line 290
    .line 291
    :cond_7
    iput-object v2, v3, LQ2/d;->c:Landroid/content/SharedPreferences;

    .line 292
    .line 293
    invoke-virtual {v3, v8, v7}, LQ2/d;->i(Landroid/content/SharedPreferences;LQ2/i;)V

    .line 294
    .line 295
    .line 296
    :cond_8
    :goto_1
    return-void

    .line 297
    :pswitch_1
    iget-object v0, p0, LA/q;->g:Ljava/lang/Object;

    .line 298
    .line 299
    check-cast v0, LJ0/a;

    .line 300
    .line 301
    iget-object v1, v0, LJ0/a;->e:Landroid/content/Intent;

    .line 302
    .line 303
    const-string v2, "google.message_id"

    .line 304
    .line 305
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object v2

    .line 309
    if-nez v2, :cond_9

    .line 310
    .line 311
    const-string v2, "message_id"

    .line 312
    .line 313
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v2

    .line 317
    :cond_9
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 318
    .line 319
    .line 320
    move-result v1

    .line 321
    const/4 v2, 0x0

    .line 322
    if-eqz v1, :cond_a

    .line 323
    .line 324
    invoke-static {v2}, LV0/g;->o(Ljava/lang/Object;)Li1/p;

    .line 325
    .line 326
    .line 327
    move-result-object v0

    .line 328
    goto :goto_2

    .line 329
    :cond_a
    new-instance v1, Landroid/os/Bundle;

    .line 330
    .line 331
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 332
    .line 333
    .line 334
    iget-object v3, v0, LJ0/a;->e:Landroid/content/Intent;

    .line 335
    .line 336
    const-string v4, "google.message_id"

    .line 337
    .line 338
    invoke-virtual {v3, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 339
    .line 340
    .line 341
    move-result-object v4

    .line 342
    if-nez v4, :cond_b

    .line 343
    .line 344
    const-string v4, "message_id"

    .line 345
    .line 346
    invoke-virtual {v3, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object v4

    .line 350
    :cond_b
    const-string v3, "google.message_id"

    .line 351
    .line 352
    invoke-virtual {v1, v3, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 353
    .line 354
    .line 355
    iget-object v0, v0, LJ0/a;->e:Landroid/content/Intent;

    .line 356
    .line 357
    const-string v3, "google.product_id"

    .line 358
    .line 359
    invoke-virtual {v0, v3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 360
    .line 361
    .line 362
    move-result v4

    .line 363
    if-eqz v4, :cond_c

    .line 364
    .line 365
    const/4 v2, 0x0

    .line 366
    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 367
    .line 368
    .line 369
    move-result v0

    .line 370
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 371
    .line 372
    .line 373
    move-result-object v2

    .line 374
    :cond_c
    if-eqz v2, :cond_d

    .line 375
    .line 376
    const-string v0, "google.product_id"

    .line 377
    .line 378
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 379
    .line 380
    .line 381
    move-result v2

    .line 382
    invoke-virtual {v1, v0, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 383
    .line 384
    .line 385
    :cond_d
    iget-object v0, p0, LA/q;->f:Ljava/lang/Object;

    .line 386
    .line 387
    check-cast v0, Landroid/content/Context;

    .line 388
    .line 389
    const-string v2, "supports_message_handled"

    .line 390
    .line 391
    const/4 v3, 0x1

    .line 392
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 393
    .line 394
    .line 395
    invoke-static {v0}, LJ0/p;->d(Landroid/content/Context;)LJ0/p;

    .line 396
    .line 397
    .line 398
    move-result-object v2

    .line 399
    new-instance v0, LJ0/n;

    .line 400
    .line 401
    monitor-enter v2

    .line 402
    :try_start_6
    iget v3, v2, LJ0/p;->b:I

    .line 403
    .line 404
    add-int/lit8 v4, v3, 0x1

    .line 405
    .line 406
    iput v4, v2, LJ0/p;->b:I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 407
    .line 408
    monitor-exit v2

    .line 409
    const/4 v4, 0x0

    .line 410
    const/4 v5, 0x2

    .line 411
    invoke-direct {v0, v3, v5, v1, v4}, LJ0/n;-><init>(IILandroid/os/Bundle;I)V

    .line 412
    .line 413
    .line 414
    invoke-virtual {v2, v0}, LJ0/p;->e(LJ0/n;)Li1/p;

    .line 415
    .line 416
    .line 417
    move-result-object v0

    .line 418
    :goto_2
    iget-object v1, p0, LA/q;->h:Ljava/lang/Object;

    .line 419
    .line 420
    check-cast v1, Ljava/util/concurrent/CountDownLatch;

    .line 421
    .line 422
    sget-object v2, LJ0/h;->f:LJ0/h;

    .line 423
    .line 424
    new-instance v3, LJ0/i;

    .line 425
    .line 426
    invoke-direct {v3, v1}, LJ0/i;-><init>(Ljava/util/concurrent/CountDownLatch;)V

    .line 427
    .line 428
    .line 429
    invoke-virtual {v0, v2, v3}, Li1/p;->g(Ljava/util/concurrent/Executor;Li1/c;)Li1/p;

    .line 430
    .line 431
    .line 432
    return-void

    .line 433
    :catchall_1
    move-exception v0

    .line 434
    :try_start_7
    monitor-exit v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 435
    throw v0

    .line 436
    :pswitch_2
    :try_start_8
    iget-object v0, p0, LA/q;->f:Ljava/lang/Object;

    .line 437
    .line 438
    check-cast v0, LA/h;

    .line 439
    .line 440
    invoke-virtual {v0}, LA/h;->call()Ljava/lang/Object;

    .line 441
    .line 442
    .line 443
    move-result-object v0
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3

    .line 444
    goto :goto_3

    .line 445
    :catch_3
    const/4 v0, 0x0

    .line 446
    :goto_3
    iget-object v1, p0, LA/q;->g:Ljava/lang/Object;

    .line 447
    .line 448
    check-cast v1, LA/i;

    .line 449
    .line 450
    iget-object v2, p0, LA/q;->h:Ljava/lang/Object;

    .line 451
    .line 452
    check-cast v2, Landroid/os/Handler;

    .line 453
    .line 454
    new-instance v3, LA/a;

    .line 455
    .line 456
    const/4 v4, 0x1

    .line 457
    invoke-direct {v3, v4, v1, v0}, LA/a;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 458
    .line 459
    .line 460
    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 461
    .line 462
    .line 463
    return-void

    .line 464
    nop

    .line 465
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
