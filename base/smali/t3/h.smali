.class public Lt3/h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lg3/b;
.implements Lh3/a;


# instance fields
.field public e:Lg3/a;

.field public f:Lm/J0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b(Lk3/f;Lt3/h;)V
    .locals 6

    .line 1
    invoke-interface {p0}, Lk3/f;->e()LN1/e;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, LV1/y;

    .line 6
    .line 7
    sget-object v2, Lt3/q;->d:Lt3/q;

    .line 8
    .line 9
    const-string v3, "dev.flutter.pigeon.image_picker_android.ImagePickerApi.pickImages"

    .line 10
    .line 11
    invoke-direct {v1, p0, v3, v2, v0}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 12
    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    new-instance v4, Lt3/n;

    .line 18
    .line 19
    const/4 v5, 0x0

    .line 20
    invoke-direct {v4, p1, v5}, Lt3/n;-><init>(Lt3/h;I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v4}, LV1/y;->A(Lk3/b;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-virtual {v1, v3}, LV1/y;->A(Lk3/b;)V

    .line 28
    .line 29
    .line 30
    :goto_0
    new-instance v1, LV1/y;

    .line 31
    .line 32
    const-string v4, "dev.flutter.pigeon.image_picker_android.ImagePickerApi.pickVideos"

    .line 33
    .line 34
    invoke-direct {v1, p0, v4, v2, v0}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 35
    .line 36
    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    new-instance v4, Lt3/n;

    .line 40
    .line 41
    const/4 v5, 0x1

    .line 42
    invoke-direct {v4, p1, v5}, Lt3/n;-><init>(Lt3/h;I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v4}, LV1/y;->A(Lk3/b;)V

    .line 46
    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    invoke-virtual {v1, v3}, LV1/y;->A(Lk3/b;)V

    .line 50
    .line 51
    .line 52
    :goto_1
    new-instance v1, LV1/y;

    .line 53
    .line 54
    const-string v4, "dev.flutter.pigeon.image_picker_android.ImagePickerApi.pickMedia"

    .line 55
    .line 56
    invoke-direct {v1, p0, v4, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 57
    .line 58
    .line 59
    if-eqz p1, :cond_2

    .line 60
    .line 61
    new-instance v4, Lt3/n;

    .line 62
    .line 63
    const/4 v5, 0x2

    .line 64
    invoke-direct {v4, p1, v5}, Lt3/n;-><init>(Lt3/h;I)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1, v4}, LV1/y;->A(Lk3/b;)V

    .line 68
    .line 69
    .line 70
    goto :goto_2

    .line 71
    :cond_2
    invoke-virtual {v1, v3}, LV1/y;->A(Lk3/b;)V

    .line 72
    .line 73
    .line 74
    :goto_2
    new-instance v1, LV1/y;

    .line 75
    .line 76
    const-string v4, "dev.flutter.pigeon.image_picker_android.ImagePickerApi.retrieveLostResults"

    .line 77
    .line 78
    invoke-direct {v1, p0, v4, v2, v0}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 79
    .line 80
    .line 81
    if-eqz p1, :cond_3

    .line 82
    .line 83
    new-instance p0, Lt3/n;

    .line 84
    .line 85
    const/4 v0, 0x3

    .line 86
    invoke-direct {p0, p1, v0}, Lt3/n;-><init>(Lt3/h;I)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1, p0}, LV1/y;->A(Lk3/b;)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_3
    invoke-virtual {v1, v3}, LV1/y;->A(Lk3/b;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method


# virtual methods
.method public final a()Lt3/j;
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lt3/h;->f:Lm/J0;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_1

    .line 7
    .line 8
    iget-object v3, v1, Lm/J0;->f:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v3, Landroid/app/Activity;

    .line 11
    .line 12
    if-nez v3, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object v1, v1, Lm/J0;->g:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v1, Lt3/f;

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    move-object v1, v2

    .line 21
    :goto_1
    if-eqz v1, :cond_12

    .line 22
    .line 23
    iget-object v3, v1, Lt3/f;->h:LN/m;

    .line 24
    .line 25
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    iget-object v3, v3, LN/m;->a:Landroid/content/Context;

    .line 29
    .line 30
    new-instance v4, Ljava/util/HashMap;

    .line 31
    .line 32
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 33
    .line 34
    .line 35
    const-string v5, "flutter_image_picker_shared_preference"

    .line 36
    .line 37
    const/4 v6, 0x0

    .line 38
    invoke-virtual {v3, v5, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 39
    .line 40
    .line 41
    move-result-object v7

    .line 42
    const-string v8, "flutter_image_picker_image_path"

    .line 43
    .line 44
    invoke-interface {v7, v8}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v9

    .line 48
    const-string v10, "pathList"

    .line 49
    .line 50
    const/4 v11, 0x1

    .line 51
    if-eqz v9, :cond_2

    .line 52
    .line 53
    invoke-interface {v7, v8, v2}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    .line 54
    .line 55
    .line 56
    move-result-object v8

    .line 57
    if-eqz v8, :cond_2

    .line 58
    .line 59
    new-instance v9, Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-direct {v9, v8}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v4, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move v8, v11

    .line 68
    goto :goto_2

    .line 69
    :cond_2
    move v8, v6

    .line 70
    :goto_2
    const-string v9, "flutter_image_picker_error_code"

    .line 71
    .line 72
    invoke-interface {v7, v9}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    .line 73
    .line 74
    .line 75
    move-result v12

    .line 76
    const-string v13, "error"

    .line 77
    .line 78
    const-string v14, ""

    .line 79
    .line 80
    if-eqz v12, :cond_5

    .line 81
    .line 82
    invoke-interface {v7, v9, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v8

    .line 86
    const-string v9, "flutter_image_picker_error_message"

    .line 87
    .line 88
    invoke-interface {v7, v9}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    .line 89
    .line 90
    .line 91
    move-result v12

    .line 92
    if-eqz v12, :cond_3

    .line 93
    .line 94
    invoke-interface {v7, v9, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v9

    .line 98
    goto :goto_3

    .line 99
    :cond_3
    move-object v9, v2

    .line 100
    :goto_3
    new-instance v12, Lt3/i;

    .line 101
    .line 102
    invoke-direct {v12}, Ljava/lang/Object;-><init>()V

    .line 103
    .line 104
    .line 105
    if-eqz v8, :cond_4

    .line 106
    .line 107
    iput-object v8, v12, Lt3/i;->a:Ljava/lang/String;

    .line 108
    .line 109
    iput-object v9, v12, Lt3/i;->b:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {v4, v13, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    goto :goto_4

    .line 115
    :cond_4
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 116
    .line 117
    const-string v2, "Nonnull field \"code\" is null."

    .line 118
    .line 119
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    throw v1

    .line 123
    :cond_5
    move v11, v8

    .line 124
    :goto_4
    const-string v8, "imageQuality"

    .line 125
    .line 126
    const-string v12, "maxHeight"

    .line 127
    .line 128
    const-string v15, "maxWidth"

    .line 129
    .line 130
    move-object/from16 v16, v2

    .line 131
    .line 132
    const-string v2, "type"

    .line 133
    .line 134
    if-eqz v11, :cond_a

    .line 135
    .line 136
    const-string v11, "flutter_image_picker_type"

    .line 137
    .line 138
    invoke-interface {v7, v11}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    .line 139
    .line 140
    .line 141
    move-result v17

    .line 142
    if-eqz v17, :cond_7

    .line 143
    .line 144
    invoke-interface {v7, v11, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v11

    .line 148
    const-string v14, "video"

    .line 149
    .line 150
    invoke-virtual {v11, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v11

    .line 154
    if-eqz v11, :cond_6

    .line 155
    .line 156
    sget-object v11, Lt3/k;->g:Lt3/k;

    .line 157
    .line 158
    goto :goto_5

    .line 159
    :cond_6
    sget-object v11, Lt3/k;->f:Lt3/k;

    .line 160
    .line 161
    :goto_5
    invoke-virtual {v4, v2, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    :cond_7
    const-string v11, "flutter_image_picker_max_width"

    .line 165
    .line 166
    invoke-interface {v7, v11}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    .line 167
    .line 168
    .line 169
    move-result v14

    .line 170
    move-object/from16 v17, v10

    .line 171
    .line 172
    const-wide/16 v9, 0x0

    .line 173
    .line 174
    if-eqz v14, :cond_8

    .line 175
    .line 176
    invoke-interface {v7, v11, v9, v10}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 177
    .line 178
    .line 179
    move-result-wide v18

    .line 180
    invoke-static/range {v18 .. v19}, Ljava/lang/Double;->longBitsToDouble(J)D

    .line 181
    .line 182
    .line 183
    move-result-wide v18

    .line 184
    invoke-static/range {v18 .. v19}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 185
    .line 186
    .line 187
    move-result-object v11

    .line 188
    invoke-virtual {v4, v15, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    :cond_8
    const-string v11, "flutter_image_picker_max_height"

    .line 192
    .line 193
    invoke-interface {v7, v11}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    .line 194
    .line 195
    .line 196
    move-result v14

    .line 197
    if-eqz v14, :cond_9

    .line 198
    .line 199
    invoke-interface {v7, v11, v9, v10}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 200
    .line 201
    .line 202
    move-result-wide v9

    .line 203
    invoke-static {v9, v10}, Ljava/lang/Double;->longBitsToDouble(J)D

    .line 204
    .line 205
    .line 206
    move-result-wide v9

    .line 207
    invoke-static {v9, v10}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 208
    .line 209
    .line 210
    move-result-object v9

    .line 211
    invoke-virtual {v4, v12, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    :cond_9
    const-string v9, "flutter_image_picker_image_quality"

    .line 215
    .line 216
    const/16 v10, 0x64

    .line 217
    .line 218
    invoke-interface {v7, v9, v10}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 219
    .line 220
    .line 221
    move-result v7

    .line 222
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 223
    .line 224
    .line 225
    move-result-object v7

    .line 226
    invoke-virtual {v4, v8, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    goto :goto_6

    .line 230
    :cond_a
    move-object/from16 v17, v10

    .line 231
    .line 232
    const/16 v10, 0x64

    .line 233
    .line 234
    :goto_6
    invoke-virtual {v4}, Ljava/util/HashMap;->isEmpty()Z

    .line 235
    .line 236
    .line 237
    move-result v7

    .line 238
    if-eqz v7, :cond_b

    .line 239
    .line 240
    return-object v16

    .line 241
    :cond_b
    invoke-virtual {v4, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    move-result-object v2

    .line 245
    check-cast v2, Lt3/k;

    .line 246
    .line 247
    if-eqz v2, :cond_c

    .line 248
    .line 249
    goto :goto_7

    .line 250
    :cond_c
    move-object/from16 v2, v16

    .line 251
    .line 252
    :goto_7
    invoke-virtual {v4, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    move-result-object v7

    .line 256
    check-cast v7, Lt3/i;

    .line 257
    .line 258
    move-object/from16 v9, v17

    .line 259
    .line 260
    invoke-virtual {v4, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    move-result-object v9

    .line 264
    check-cast v9, Ljava/util/ArrayList;

    .line 265
    .line 266
    if-eqz v9, :cond_f

    .line 267
    .line 268
    new-instance v11, Ljava/util/ArrayList;

    .line 269
    .line 270
    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 271
    .line 272
    .line 273
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 274
    .line 275
    .line 276
    move-result v13

    .line 277
    move v14, v6

    .line 278
    :goto_8
    if-ge v14, v13, :cond_e

    .line 279
    .line 280
    invoke-virtual {v9, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 281
    .line 282
    .line 283
    move-result-object v16

    .line 284
    add-int/lit8 v14, v14, 0x1

    .line 285
    .line 286
    move-object/from16 v10, v16

    .line 287
    .line 288
    check-cast v10, Ljava/lang/String;

    .line 289
    .line 290
    invoke-virtual {v4, v15}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    .line 292
    .line 293
    move-result-object v16

    .line 294
    move-object/from16 v6, v16

    .line 295
    .line 296
    check-cast v6, Ljava/lang/Double;

    .line 297
    .line 298
    invoke-virtual {v4, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    .line 300
    .line 301
    move-result-object v16

    .line 302
    move-object/from16 v0, v16

    .line 303
    .line 304
    check-cast v0, Ljava/lang/Double;

    .line 305
    .line 306
    invoke-virtual {v4, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 307
    .line 308
    .line 309
    move-result-object v16

    .line 310
    check-cast v16, Ljava/lang/Integer;

    .line 311
    .line 312
    if-nez v16, :cond_d

    .line 313
    .line 314
    move-object/from16 v18, v4

    .line 315
    .line 316
    const/16 v4, 0x64

    .line 317
    .line 318
    :goto_9
    move-object/from16 v19, v8

    .line 319
    .line 320
    goto :goto_a

    .line 321
    :cond_d
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    .line 322
    .line 323
    .line 324
    move-result v16

    .line 325
    move-object/from16 v18, v4

    .line 326
    .line 327
    move/from16 v4, v16

    .line 328
    .line 329
    goto :goto_9

    .line 330
    :goto_a
    iget-object v8, v1, Lt3/f;->g:LT0/b;

    .line 331
    .line 332
    invoke-virtual {v8, v10, v6, v0, v4}, LT0/b;->a(Ljava/lang/String;Ljava/lang/Double;Ljava/lang/Double;I)Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object v0

    .line 336
    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 337
    .line 338
    .line 339
    move-object/from16 v0, p0

    .line 340
    .line 341
    move-object/from16 v4, v18

    .line 342
    .line 343
    move-object/from16 v8, v19

    .line 344
    .line 345
    const/4 v6, 0x0

    .line 346
    const/16 v10, 0x64

    .line 347
    .line 348
    goto :goto_8

    .line 349
    :cond_e
    :goto_b
    move v0, v6

    .line 350
    goto :goto_c

    .line 351
    :cond_f
    move-object/from16 v11, v16

    .line 352
    .line 353
    goto :goto_b

    .line 354
    :goto_c
    invoke-virtual {v3, v5, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 355
    .line 356
    .line 357
    move-result-object v0

    .line 358
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 359
    .line 360
    .line 361
    move-result-object v0

    .line 362
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 363
    .line 364
    .line 365
    move-result-object v0

    .line 366
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 367
    .line 368
    .line 369
    new-instance v0, Lt3/j;

    .line 370
    .line 371
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 372
    .line 373
    .line 374
    if-eqz v2, :cond_11

    .line 375
    .line 376
    iput-object v2, v0, Lt3/j;->a:Lt3/k;

    .line 377
    .line 378
    iput-object v7, v0, Lt3/j;->b:Lt3/i;

    .line 379
    .line 380
    if-eqz v11, :cond_10

    .line 381
    .line 382
    iput-object v11, v0, Lt3/j;->c:Ljava/util/List;

    .line 383
    .line 384
    return-object v0

    .line 385
    :cond_10
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 386
    .line 387
    const-string v1, "Nonnull field \"paths\" is null."

    .line 388
    .line 389
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 390
    .line 391
    .line 392
    throw v0

    .line 393
    :cond_11
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 394
    .line 395
    const-string v1, "Nonnull field \"type\" is null."

    .line 396
    .line 397
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 398
    .line 399
    .line 400
    throw v0

    .line 401
    :cond_12
    new-instance v0, Lt3/l;

    .line 402
    .line 403
    const-string v1, "no_activity"

    .line 404
    .line 405
    const-string v2, "image_picker plugin requires a foreground activity."

    .line 406
    .line 407
    invoke-direct {v0, v1, v2}, Lt3/l;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 408
    .line 409
    .line 410
    throw v0
.end method

.method public final onAttachedToActivity(Lh3/b;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lt3/h;->e:Lg3/a;

    .line 2
    .line 3
    iget-object v1, v0, Lg3/a;->b:Lk3/f;

    .line 4
    .line 5
    iget-object v0, v0, Lg3/a;->a:Landroid/content/Context;

    .line 6
    .line 7
    check-cast v0, Landroid/app/Application;

    .line 8
    .line 9
    move-object v2, p1

    .line 10
    check-cast v2, Lm/J0;

    .line 11
    .line 12
    iget-object v3, v2, Lm/J0;->e:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v3, Landroid/app/Activity;

    .line 15
    .line 16
    new-instance v4, Lm/J0;

    .line 17
    .line 18
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, v4, Lm/J0;->e:Ljava/lang/Object;

    .line 22
    .line 23
    iput-object v3, v4, Lm/J0;->f:Ljava/lang/Object;

    .line 24
    .line 25
    iput-object p1, v4, Lm/J0;->i:Ljava/lang/Object;

    .line 26
    .line 27
    iput-object v1, v4, Lm/J0;->j:Ljava/lang/Object;

    .line 28
    .line 29
    new-instance p1, LN/m;

    .line 30
    .line 31
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v3, p1, LN/m;->a:Landroid/content/Context;

    .line 35
    .line 36
    new-instance v0, LN0/f;

    .line 37
    .line 38
    const/16 v5, 0x11

    .line 39
    .line 40
    invoke-direct {v0, v5}, LN0/f;-><init>(I)V

    .line 41
    .line 42
    .line 43
    new-instance v5, LT0/b;

    .line 44
    .line 45
    invoke-direct {v5, v3, v0}, LT0/b;-><init>(Landroid/app/Activity;LN0/f;)V

    .line 46
    .line 47
    .line 48
    new-instance v0, Lt3/f;

    .line 49
    .line 50
    invoke-direct {v0, v3, v5, p1}, Lt3/f;-><init>(Landroid/app/Activity;LT0/b;LN/m;)V

    .line 51
    .line 52
    .line 53
    iput-object v0, v4, Lm/J0;->g:Ljava/lang/Object;

    .line 54
    .line 55
    invoke-static {v1, p0}, Lt3/h;->b(Lk3/f;Lt3/h;)V

    .line 56
    .line 57
    .line 58
    new-instance p1, Lt3/g;

    .line 59
    .line 60
    invoke-direct {p1, p0, v3}, Lt3/g;-><init>(Lt3/h;Landroid/app/Activity;)V

    .line 61
    .line 62
    .line 63
    iput-object p1, v4, Lm/J0;->h:Ljava/lang/Object;

    .line 64
    .line 65
    iget-object p1, v4, Lm/J0;->g:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast p1, Lt3/f;

    .line 68
    .line 69
    invoke-virtual {v2, p1}, Lm/J0;->a(Lk3/q;)V

    .line 70
    .line 71
    .line 72
    iget-object p1, v4, Lm/J0;->g:Ljava/lang/Object;

    .line 73
    .line 74
    check-cast p1, Lt3/f;

    .line 75
    .line 76
    invoke-virtual {v2, p1}, Lm/J0;->b(Lk3/s;)V

    .line 77
    .line 78
    .line 79
    iget-object p1, v2, Lm/J0;->f:Ljava/lang/Object;

    .line 80
    .line 81
    check-cast p1, Lio/flutter/embedding/engine/plugins/lifecycle/HiddenLifecycleReference;

    .line 82
    .line 83
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/lifecycle/HiddenLifecycleReference;->getLifecycle()Landroidx/lifecycle/l;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iput-object p1, v4, Lm/J0;->k:Ljava/lang/Object;

    .line 88
    .line 89
    iget-object v0, v4, Lm/J0;->h:Ljava/lang/Object;

    .line 90
    .line 91
    check-cast v0, Lt3/g;

    .line 92
    .line 93
    invoke-virtual {p1, v0}, Landroidx/lifecycle/l;->a(Landroidx/lifecycle/p;)V

    .line 94
    .line 95
    .line 96
    iput-object v4, p0, Lt3/h;->f:Lm/J0;

    .line 97
    .line 98
    return-void
.end method

.method public final onAttachedToEngine(Lg3/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lt3/h;->e:Lg3/a;

    .line 2
    .line 3
    return-void
.end method

.method public final onDetachedFromActivity()V
    .locals 4

    .line 1
    iget-object v0, p0, Lt3/h;->f:Lm/J0;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v1, v0, Lm/J0;->i:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Lh3/b;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-object v3, v0, Lm/J0;->g:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v3, Lt3/f;

    .line 15
    .line 16
    check-cast v1, Lm/J0;

    .line 17
    .line 18
    iget-object v1, v1, Lm/J0;->h:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v1, Ljava/util/HashSet;

    .line 21
    .line 22
    invoke-virtual {v1, v3}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    iget-object v1, v0, Lm/J0;->i:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v1, Lh3/b;

    .line 28
    .line 29
    iget-object v3, v0, Lm/J0;->g:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast v3, Lt3/f;

    .line 32
    .line 33
    check-cast v1, Lm/J0;

    .line 34
    .line 35
    iget-object v1, v1, Lm/J0;->g:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast v1, Ljava/util/HashSet;

    .line 38
    .line 39
    invoke-virtual {v1, v3}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    iput-object v2, v0, Lm/J0;->i:Ljava/lang/Object;

    .line 43
    .line 44
    :cond_0
    iget-object v1, v0, Lm/J0;->k:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast v1, Landroidx/lifecycle/l;

    .line 47
    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    iget-object v3, v0, Lm/J0;->h:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast v3, Lt3/g;

    .line 53
    .line 54
    invoke-virtual {v1, v3}, Landroidx/lifecycle/l;->b(Landroidx/lifecycle/p;)V

    .line 55
    .line 56
    .line 57
    iput-object v2, v0, Lm/J0;->k:Ljava/lang/Object;

    .line 58
    .line 59
    :cond_1
    iget-object v1, v0, Lm/J0;->j:Ljava/lang/Object;

    .line 60
    .line 61
    check-cast v1, Lk3/f;

    .line 62
    .line 63
    invoke-static {v1, v2}, Lt3/h;->b(Lk3/f;Lt3/h;)V

    .line 64
    .line 65
    .line 66
    iget-object v1, v0, Lm/J0;->e:Ljava/lang/Object;

    .line 67
    .line 68
    check-cast v1, Landroid/app/Application;

    .line 69
    .line 70
    if-eqz v1, :cond_2

    .line 71
    .line 72
    iget-object v3, v0, Lm/J0;->h:Ljava/lang/Object;

    .line 73
    .line 74
    check-cast v3, Lt3/g;

    .line 75
    .line 76
    invoke-virtual {v1, v3}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 77
    .line 78
    .line 79
    iput-object v2, v0, Lm/J0;->e:Ljava/lang/Object;

    .line 80
    .line 81
    :cond_2
    iput-object v2, v0, Lm/J0;->f:Ljava/lang/Object;

    .line 82
    .line 83
    iput-object v2, v0, Lm/J0;->h:Ljava/lang/Object;

    .line 84
    .line 85
    iput-object v2, v0, Lm/J0;->g:Ljava/lang/Object;

    .line 86
    .line 87
    iput-object v2, p0, Lt3/h;->f:Lm/J0;

    .line 88
    .line 89
    :cond_3
    return-void
.end method

.method public final onDetachedFromActivityForConfigChanges()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lt3/h;->onDetachedFromActivity()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final onDetachedFromEngine(Lg3/a;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lt3/h;->e:Lg3/a;

    .line 3
    .line 4
    return-void
.end method

.method public final onReattachedToActivityForConfigChanges(Lh3/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lt3/h;->onAttachedToActivity(Lh3/b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
