.class public abstract Lw/d;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:LT0/a;

.field public static final b:Lp/i;

.field public static c:Landroid/graphics/Paint;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-string v0, "TypefaceCompat static init"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->N(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 11
    .line 12
    const/16 v1, 0x1f

    .line 13
    .line 14
    if-lt v0, v1, :cond_0

    .line 15
    .line 16
    new-instance v0, Lw/j;

    .line 17
    .line 18
    invoke-direct {v0}, LT0/a;-><init>()V

    .line 19
    .line 20
    .line 21
    sput-object v0, Lw/d;->a:LT0/a;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/16 v1, 0x1d

    .line 25
    .line 26
    if-lt v0, v1, :cond_1

    .line 27
    .line 28
    new-instance v0, Lw/i;

    .line 29
    .line 30
    invoke-direct {v0}, LT0/a;-><init>()V

    .line 31
    .line 32
    .line 33
    sput-object v0, Lw/d;->a:LT0/a;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const/16 v1, 0x1c

    .line 37
    .line 38
    if-lt v0, v1, :cond_2

    .line 39
    .line 40
    new-instance v0, Lw/h;

    .line 41
    .line 42
    invoke-direct {v0}, Lw/g;-><init>()V

    .line 43
    .line 44
    .line 45
    sput-object v0, Lw/d;->a:LT0/a;

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    const/16 v1, 0x1a

    .line 49
    .line 50
    if-lt v0, v1, :cond_3

    .line 51
    .line 52
    new-instance v0, Lw/g;

    .line 53
    .line 54
    invoke-direct {v0}, Lw/g;-><init>()V

    .line 55
    .line 56
    .line 57
    sput-object v0, Lw/d;->a:LT0/a;

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_3
    sget-object v0, Lw/f;->l:Ljava/lang/reflect/Method;

    .line 61
    .line 62
    if-nez v0, :cond_4

    .line 63
    .line 64
    const-string v1, "TypefaceCompatApi24Impl"

    .line 65
    .line 66
    const-string v2, "Unable to collect necessary private methods.Fallback to legacy implementation."

    .line 67
    .line 68
    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    :cond_4
    if-eqz v0, :cond_5

    .line 72
    .line 73
    new-instance v0, Lw/f;

    .line 74
    .line 75
    invoke-direct {v0}, LT0/a;-><init>()V

    .line 76
    .line 77
    .line 78
    sput-object v0, Lw/d;->a:LT0/a;

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_5
    new-instance v0, Lw/e;

    .line 82
    .line 83
    invoke-direct {v0}, LT0/a;-><init>()V

    .line 84
    .line 85
    .line 86
    sput-object v0, Lw/d;->a:LT0/a;

    .line 87
    .line 88
    :goto_0
    new-instance v0, Lp/i;

    .line 89
    .line 90
    const/16 v1, 0x10

    .line 91
    .line 92
    invoke-direct {v0, v1}, Lp/i;-><init>(I)V

    .line 93
    .line 94
    .line 95
    sput-object v0, Lw/d;->b:Lp/i;

    .line 96
    .line 97
    const/4 v0, 0x0

    .line 98
    sput-object v0, Lw/d;->c:Landroid/graphics/Paint;

    .line 99
    .line 100
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public static a(Landroid/content/Context;Lv/d;Landroid/content/res/Resources;ILjava/lang/String;IILm/v;)Landroid/graphics/Typeface;
    .locals 14

    .line 1
    move/from16 v4, p6

    .line 2
    .line 3
    move-object/from16 v1, p7

    .line 4
    .line 5
    instance-of v2, p1, Lv/g;

    .line 6
    .line 7
    const/16 v3, 0x10

    .line 8
    .line 9
    if-eqz v2, :cond_13

    .line 10
    .line 11
    move-object v0, p1

    .line 12
    check-cast v0, Lv/g;

    .line 13
    .line 14
    const-string v2, "TypefaceCompat"

    .line 15
    .line 16
    iget-object v5, v0, Lv/g;->d:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v6

    .line 22
    const/4 v7, 0x0

    .line 23
    const/4 v8, 0x1

    .line 24
    const/4 v9, 0x0

    .line 25
    if-nez v6, :cond_0

    .line 26
    .line 27
    invoke-static {v5}, Lw/d;->c(Ljava/lang/String;)Landroid/graphics/Typeface;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    if-eqz v5, :cond_0

    .line 32
    .line 33
    goto/16 :goto_6

    .line 34
    .line 35
    :cond_0
    iget-object v5, v0, Lv/g;->a:Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 38
    .line 39
    .line 40
    move-result v6

    .line 41
    if-ne v6, v8, :cond_1

    .line 42
    .line 43
    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    check-cast v2, LA/g;

    .line 48
    .line 49
    iget-object v2, v2, LA/g;->e:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v2}, Lw/d;->c(Ljava/lang/String;)Landroid/graphics/Typeface;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    goto/16 :goto_6

    .line 56
    .line 57
    :cond_1
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 58
    .line 59
    const/16 v10, 0x1f

    .line 60
    .line 61
    if-ge v6, v10, :cond_2

    .line 62
    .line 63
    :goto_0
    move-object v5, v7

    .line 64
    goto/16 :goto_6

    .line 65
    .line 66
    :cond_2
    move v6, v9

    .line 67
    :goto_1
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 68
    .line 69
    .line 70
    move-result v10

    .line 71
    if-ge v6, v10, :cond_4

    .line 72
    .line 73
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v10

    .line 77
    check-cast v10, LA/g;

    .line 78
    .line 79
    iget-object v10, v10, LA/g;->e:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {v10}, Lw/d;->c(Ljava/lang/String;)Landroid/graphics/Typeface;

    .line 82
    .line 83
    .line 84
    move-result-object v10

    .line 85
    if-nez v10, :cond_3

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_3
    add-int/lit8 v6, v6, 0x1

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_4
    move-object v10, v7

    .line 92
    move v6, v9

    .line 93
    :goto_2
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 94
    .line 95
    .line 96
    move-result v11

    .line 97
    if-ge v6, v11, :cond_9

    .line 98
    .line 99
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v11

    .line 103
    check-cast v11, LA/g;

    .line 104
    .line 105
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 106
    .line 107
    .line 108
    move-result v12

    .line 109
    sub-int/2addr v12, v8

    .line 110
    if-ne v6, v12, :cond_5

    .line 111
    .line 112
    iget-object v12, v11, LA/g;->f:Ljava/lang/String;

    .line 113
    .line 114
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 115
    .line 116
    .line 117
    move-result v12

    .line 118
    if-eqz v12, :cond_5

    .line 119
    .line 120
    iget-object v2, v11, LA/g;->e:Ljava/lang/String;

    .line 121
    .line 122
    invoke-static {v10, v2}, Lio/flutter/plugin/platform/n;->q(Landroid/graphics/Typeface$CustomFallbackBuilder;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    goto :goto_5

    .line 126
    :cond_5
    iget-object v12, v11, LA/g;->e:Ljava/lang/String;

    .line 127
    .line 128
    iget-object v13, v11, LA/g;->f:Ljava/lang/String;

    .line 129
    .line 130
    invoke-static {v12}, Lw/d;->c(Ljava/lang/String;)Landroid/graphics/Typeface;

    .line 131
    .line 132
    .line 133
    move-result-object v12

    .line 134
    invoke-static {v12}, Lw/d;->d(Landroid/graphics/Typeface;)Landroid/graphics/fonts/Font;

    .line 135
    .line 136
    .line 137
    move-result-object v12

    .line 138
    if-nez v12, :cond_6

    .line 139
    .line 140
    new-instance v5, Ljava/lang/StringBuilder;

    .line 141
    .line 142
    const-string v6, "Unable identify the primary font for "

    .line 143
    .line 144
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    iget-object v6, v11, LA/g;->e:Ljava/lang/String;

    .line 148
    .line 149
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    const-string v6, ". Falling back to provider font."

    .line 153
    .line 154
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v5

    .line 161
    invoke-static {v2, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    .line 163
    .line 164
    goto :goto_0

    .line 165
    :cond_6
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 166
    .line 167
    .line 168
    move-result v11

    .line 169
    if-eqz v11, :cond_7

    .line 170
    .line 171
    :try_start_0
    invoke-static {}, Lio/flutter/plugin/platform/n;->o()V

    .line 172
    .line 173
    .line 174
    invoke-static {}, Lio/flutter/plugin/platform/n;->y()V

    .line 175
    .line 176
    .line 177
    invoke-static {v12}, LR0/e;->c(Landroid/graphics/fonts/Font;)Landroid/graphics/fonts/Font$Builder;

    .line 178
    .line 179
    .line 180
    move-result-object v11

    .line 181
    invoke-static {v11, v13}, Lio/flutter/plugin/platform/n;->d(Landroid/graphics/fonts/Font$Builder;Ljava/lang/String;)Landroid/graphics/fonts/Font$Builder;

    .line 182
    .line 183
    .line 184
    move-result-object v11

    .line 185
    invoke-static {v11}, Lio/flutter/plugin/platform/n;->e(Landroid/graphics/fonts/Font$Builder;)Landroid/graphics/fonts/Font;

    .line 186
    .line 187
    .line 188
    move-result-object v11

    .line 189
    invoke-static {v11}, Lio/flutter/plugin/platform/n;->f(Landroid/graphics/fonts/Font;)Landroid/graphics/fonts/FontFamily$Builder;

    .line 190
    .line 191
    .line 192
    move-result-object v11

    .line 193
    invoke-static {v11}, Lio/flutter/plugin/platform/n;->g(Landroid/graphics/fonts/FontFamily$Builder;)Landroid/graphics/fonts/FontFamily;

    .line 194
    .line 195
    .line 196
    move-result-object v11
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 197
    goto :goto_3

    .line 198
    :catch_0
    const-string v5, "Failed to clone Font instance. Fall back to provider font."

    .line 199
    .line 200
    invoke-static {v2, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    .line 202
    .line 203
    goto/16 :goto_0

    .line 204
    .line 205
    :cond_7
    invoke-static {v12}, Lio/flutter/plugin/platform/n;->f(Landroid/graphics/fonts/Font;)Landroid/graphics/fonts/FontFamily$Builder;

    .line 206
    .line 207
    .line 208
    move-result-object v11

    .line 209
    invoke-static {v11}, Lio/flutter/plugin/platform/n;->g(Landroid/graphics/fonts/FontFamily$Builder;)Landroid/graphics/fonts/FontFamily;

    .line 210
    .line 211
    .line 212
    move-result-object v11

    .line 213
    :goto_3
    if-nez v10, :cond_8

    .line 214
    .line 215
    invoke-static {v11}, Lio/flutter/plugin/platform/n;->b(Landroid/graphics/fonts/FontFamily;)Landroid/graphics/Typeface$CustomFallbackBuilder;

    .line 216
    .line 217
    .line 218
    move-result-object v10

    .line 219
    goto :goto_4

    .line 220
    :cond_8
    invoke-static {v10, v11}, Lio/flutter/plugin/platform/n;->p(Landroid/graphics/Typeface$CustomFallbackBuilder;Landroid/graphics/fonts/FontFamily;)V

    .line 221
    .line 222
    .line 223
    :goto_4
    add-int/lit8 v6, v6, 0x1

    .line 224
    .line 225
    goto/16 :goto_2

    .line 226
    .line 227
    :cond_9
    :goto_5
    invoke-static {v10}, Lio/flutter/plugin/platform/n;->c(Landroid/graphics/Typeface$CustomFallbackBuilder;)Landroid/graphics/Typeface;

    .line 228
    .line 229
    .line 230
    move-result-object v5

    .line 231
    :goto_6
    if-eqz v5, :cond_a

    .line 232
    .line 233
    new-instance p0, Landroid/os/Handler;

    .line 234
    .line 235
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 240
    .line 241
    .line 242
    new-instance v0, LD1/h;

    .line 243
    .line 244
    invoke-direct {v0, v3, v1, v5}, LD1/h;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 248
    .line 249
    .line 250
    sget-object p0, Lw/d;->b:Lp/i;

    .line 251
    .line 252
    invoke-static/range {p2 .. p6}, Lw/d;->b(Landroid/content/res/Resources;ILjava/lang/String;II)Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    invoke-virtual {p0, v0, v5}, Lp/i;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    .line 258
    .line 259
    return-object v5

    .line 260
    :cond_a
    iget v2, v0, Lv/g;->c:I

    .line 261
    .line 262
    if-nez v2, :cond_b

    .line 263
    .line 264
    move v2, v8

    .line 265
    goto :goto_7

    .line 266
    :cond_b
    move v2, v9

    .line 267
    :goto_7
    iget v6, v0, Lv/g;->b:I

    .line 268
    .line 269
    new-instance v3, Landroid/os/Handler;

    .line 270
    .line 271
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 272
    .line 273
    .line 274
    move-result-object v5

    .line 275
    invoke-direct {v3, v5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 276
    .line 277
    .line 278
    new-instance v5, Lio/flutter/plugin/editing/j;

    .line 279
    .line 280
    const/16 v10, 0x16

    .line 281
    .line 282
    invoke-direct {v5, v10}, Lio/flutter/plugin/editing/j;-><init>(I)V

    .line 283
    .line 284
    .line 285
    iput-object v1, v5, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 286
    .line 287
    iget-object v0, v0, Lv/g;->a:Ljava/util/ArrayList;

    .line 288
    .line 289
    new-instance v10, LA/c;

    .line 290
    .line 291
    new-instance v1, LA/p;

    .line 292
    .line 293
    invoke-direct {v1, v3, v9}, LA/p;-><init>(Landroid/os/Handler;I)V

    .line 294
    .line 295
    .line 296
    invoke-direct {v10, v9, v5, v1}, LA/c;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 297
    .line 298
    .line 299
    if-eqz v2, :cond_f

    .line 300
    .line 301
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 302
    .line 303
    .line 304
    move-result v2

    .line 305
    if-gt v2, v8, :cond_e

    .line 306
    .line 307
    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 308
    .line 309
    .line 310
    move-result-object v0

    .line 311
    move-object v3, v0

    .line 312
    check-cast v3, LA/g;

    .line 313
    .line 314
    sget-object v0, LA/k;->a:Lp/i;

    .line 315
    .line 316
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 317
    .line 318
    .line 319
    move-result-object v0

    .line 320
    new-instance v2, Ljava/util/ArrayList;

    .line 321
    .line 322
    invoke-direct {v2, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 323
    .line 324
    .line 325
    aget-object v0, v0, v9

    .line 326
    .line 327
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 328
    .line 329
    .line 330
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 331
    .line 332
    .line 333
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 334
    .line 335
    .line 336
    move-result-object v0

    .line 337
    invoke-static {v4, v0}, LA/k;->a(ILjava/util/List;)Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object v0

    .line 341
    sget-object v2, LA/k;->a:Lp/i;

    .line 342
    .line 343
    invoke-virtual {v2, v0}, Lp/i;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 344
    .line 345
    .line 346
    move-result-object v2

    .line 347
    check-cast v2, Landroid/graphics/Typeface;

    .line 348
    .line 349
    if-eqz v2, :cond_c

    .line 350
    .line 351
    new-instance p0, LA/a;

    .line 352
    .line 353
    invoke-direct {p0, v9, v5, v2}, LA/a;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 354
    .line 355
    .line 356
    invoke-virtual {v1, p0}, LA/p;->execute(Ljava/lang/Runnable;)V

    .line 357
    .line 358
    .line 359
    move-object v7, v2

    .line 360
    goto/16 :goto_b

    .line 361
    .line 362
    :cond_c
    const/4 v1, -0x1

    .line 363
    if-ne v6, v1, :cond_d

    .line 364
    .line 365
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 366
    .line 367
    .line 368
    move-result-object v1

    .line 369
    new-instance v2, Ljava/util/ArrayList;

    .line 370
    .line 371
    invoke-direct {v2, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 372
    .line 373
    .line 374
    aget-object v1, v1, v9

    .line 375
    .line 376
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 377
    .line 378
    .line 379
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 380
    .line 381
    .line 382
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 383
    .line 384
    .line 385
    move-result-object v1

    .line 386
    invoke-static {v0, p0, v1, v4}, LA/k;->b(Ljava/lang/String;Landroid/content/Context;Ljava/util/List;I)LA/j;

    .line 387
    .line 388
    .line 389
    move-result-object p0

    .line 390
    invoke-virtual {v10, p0}, LA/c;->M(LA/j;)V

    .line 391
    .line 392
    .line 393
    iget-object v7, p0, LA/j;->a:Landroid/graphics/Typeface;

    .line 394
    .line 395
    goto/16 :goto_b

    .line 396
    .line 397
    :cond_d
    move-object v1, v0

    .line 398
    new-instance v0, LA/h;

    .line 399
    .line 400
    const/4 v5, 0x0

    .line 401
    move-object v2, p0

    .line 402
    invoke-direct/range {v0 .. v5}, LA/h;-><init>(Ljava/lang/String;Landroid/content/Context;Ljava/lang/Object;II)V

    .line 403
    .line 404
    .line 405
    :try_start_1
    sget-object p0, LA/k;->b:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 406
    .line 407
    invoke-interface {p0, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 408
    .line 409
    .line 410
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_4

    .line 411
    int-to-long v0, v6

    .line 412
    :try_start_2
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 413
    .line 414
    invoke-interface {p0, v0, v1, v2}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 415
    .line 416
    .line 417
    move-result-object p0
    :try_end_2
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_2 .. :try_end_2} :catch_3

    .line 418
    :try_start_3
    check-cast p0, LA/j;

    .line 419
    .line 420
    invoke-virtual {v10, p0}, LA/c;->M(LA/j;)V

    .line 421
    .line 422
    .line 423
    iget-object v7, p0, LA/j;->a:Landroid/graphics/Typeface;

    .line 424
    .line 425
    goto/16 :goto_b

    .line 426
    .line 427
    :catch_1
    move-exception v0

    .line 428
    move-object p0, v0

    .line 429
    goto :goto_8

    .line 430
    :catch_2
    move-exception v0

    .line 431
    move-object p0, v0

    .line 432
    goto :goto_9

    .line 433
    :catch_3
    new-instance p0, Ljava/lang/InterruptedException;

    .line 434
    .line 435
    const-string v0, "timeout"

    .line 436
    .line 437
    invoke-direct {p0, v0}, Ljava/lang/InterruptedException;-><init>(Ljava/lang/String;)V

    .line 438
    .line 439
    .line 440
    throw p0

    .line 441
    :goto_8
    throw p0

    .line 442
    :goto_9
    new-instance v0, Ljava/lang/RuntimeException;

    .line 443
    .line 444
    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 445
    .line 446
    .line 447
    throw v0
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_4

    .line 448
    :catch_4
    iget-object p0, v10, LA/c;->g:Ljava/lang/Object;

    .line 449
    .line 450
    check-cast p0, LA/p;

    .line 451
    .line 452
    iget-object v0, v10, LA/c;->f:Ljava/lang/Object;

    .line 453
    .line 454
    check-cast v0, Lio/flutter/plugin/editing/j;

    .line 455
    .line 456
    new-instance v1, LA/b;

    .line 457
    .line 458
    const/4 v2, -0x3

    .line 459
    invoke-direct {v1, v0, v2}, LA/b;-><init>(Lio/flutter/plugin/editing/j;I)V

    .line 460
    .line 461
    .line 462
    invoke-virtual {p0, v1}, LA/p;->execute(Ljava/lang/Runnable;)V

    .line 463
    .line 464
    .line 465
    goto/16 :goto_b

    .line 466
    .line 467
    :cond_e
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 468
    .line 469
    const-string v0, "Fallbacks with blocking fetches are not supported for performance reasons"

    .line 470
    .line 471
    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 472
    .line 473
    .line 474
    throw p0

    .line 475
    :cond_f
    invoke-static {v4, v0}, LA/k;->a(ILjava/util/List;)Ljava/lang/String;

    .line 476
    .line 477
    .line 478
    move-result-object v2

    .line 479
    sget-object v3, LA/k;->a:Lp/i;

    .line 480
    .line 481
    invoke-virtual {v3, v2}, Lp/i;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 482
    .line 483
    .line 484
    move-result-object v3

    .line 485
    check-cast v3, Landroid/graphics/Typeface;

    .line 486
    .line 487
    if-eqz v3, :cond_10

    .line 488
    .line 489
    new-instance p0, LA/a;

    .line 490
    .line 491
    invoke-direct {p0, v9, v5, v3}, LA/a;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 492
    .line 493
    .line 494
    invoke-virtual {v1, p0}, LA/p;->execute(Ljava/lang/Runnable;)V

    .line 495
    .line 496
    .line 497
    move-object v7, v3

    .line 498
    goto :goto_b

    .line 499
    :cond_10
    new-instance v1, LA/i;

    .line 500
    .line 501
    invoke-direct {v1, v9, v10}, LA/i;-><init>(ILjava/lang/Object;)V

    .line 502
    .line 503
    .line 504
    sget-object v5, LA/k;->c:Ljava/lang/Object;

    .line 505
    .line 506
    monitor-enter v5

    .line 507
    :try_start_4
    sget-object v3, LA/k;->d:Lp/j;

    .line 508
    .line 509
    invoke-virtual {v3, v2}, Lp/j;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 510
    .line 511
    .line 512
    move-result-object v6

    .line 513
    check-cast v6, Ljava/util/ArrayList;

    .line 514
    .line 515
    if-eqz v6, :cond_11

    .line 516
    .line 517
    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 518
    .line 519
    .line 520
    monitor-exit v5

    .line 521
    goto :goto_b

    .line 522
    :catchall_0
    move-exception v0

    .line 523
    move-object p0, v0

    .line 524
    goto :goto_c

    .line 525
    :cond_11
    new-instance v6, Ljava/util/ArrayList;

    .line 526
    .line 527
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 528
    .line 529
    .line 530
    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 531
    .line 532
    .line 533
    invoke-virtual {v3, v2, v6}, Lp/j;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 534
    .line 535
    .line 536
    monitor-exit v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 537
    move-object v3, v0

    .line 538
    new-instance v0, LA/h;

    .line 539
    .line 540
    const/4 v5, 0x1

    .line 541
    move-object v1, v2

    .line 542
    move-object v2, p0

    .line 543
    invoke-direct/range {v0 .. v5}, LA/h;-><init>(Ljava/lang/String;Landroid/content/Context;Ljava/lang/Object;II)V

    .line 544
    .line 545
    .line 546
    sget-object p0, LA/k;->b:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 547
    .line 548
    new-instance v2, LA/i;

    .line 549
    .line 550
    invoke-direct {v2, v8, v1}, LA/i;-><init>(ILjava/lang/Object;)V

    .line 551
    .line 552
    .line 553
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 554
    .line 555
    .line 556
    move-result-object v1

    .line 557
    if-nez v1, :cond_12

    .line 558
    .line 559
    new-instance v1, Landroid/os/Handler;

    .line 560
    .line 561
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 562
    .line 563
    .line 564
    move-result-object v3

    .line 565
    invoke-direct {v1, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 566
    .line 567
    .line 568
    goto :goto_a

    .line 569
    :cond_12
    new-instance v1, Landroid/os/Handler;

    .line 570
    .line 571
    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    .line 572
    .line 573
    .line 574
    :goto_a
    new-instance v3, LA/q;

    .line 575
    .line 576
    invoke-direct {v3}, LA/q;-><init>()V

    .line 577
    .line 578
    .line 579
    iput-object v0, v3, LA/q;->f:Ljava/lang/Object;

    .line 580
    .line 581
    iput-object v2, v3, LA/q;->g:Ljava/lang/Object;

    .line 582
    .line 583
    iput-object v1, v3, LA/q;->h:Ljava/lang/Object;

    .line 584
    .line 585
    invoke-virtual {p0, v3}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 586
    .line 587
    .line 588
    :goto_b
    move-object/from16 v6, p2

    .line 589
    .line 590
    goto :goto_d

    .line 591
    :goto_c
    :try_start_5
    monitor-exit v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 592
    throw p0

    .line 593
    :cond_13
    sget-object v5, Lw/d;->a:LT0/a;

    .line 594
    .line 595
    move-object v0, p1

    .line 596
    check-cast v0, Lv/e;

    .line 597
    .line 598
    move-object/from16 v6, p2

    .line 599
    .line 600
    invoke-virtual {v5, p0, v0, v6, v4}, LT0/a;->f(Landroid/content/Context;Lv/e;Landroid/content/res/Resources;I)Landroid/graphics/Typeface;

    .line 601
    .line 602
    .line 603
    move-result-object v7

    .line 604
    if-eqz v7, :cond_14

    .line 605
    .line 606
    new-instance p0, Landroid/os/Handler;

    .line 607
    .line 608
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 609
    .line 610
    .line 611
    move-result-object v0

    .line 612
    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 613
    .line 614
    .line 615
    new-instance v0, LD1/h;

    .line 616
    .line 617
    invoke-direct {v0, v3, v1, v7}, LD1/h;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 618
    .line 619
    .line 620
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 621
    .line 622
    .line 623
    goto :goto_d

    .line 624
    :cond_14
    invoke-virtual {v1}, Lm/v;->a()V

    .line 625
    .line 626
    .line 627
    :goto_d
    if-eqz v7, :cond_15

    .line 628
    .line 629
    sget-object p0, Lw/d;->b:Lp/i;

    .line 630
    .line 631
    invoke-static/range {p2 .. p6}, Lw/d;->b(Landroid/content/res/Resources;ILjava/lang/String;II)Ljava/lang/String;

    .line 632
    .line 633
    .line 634
    move-result-object v0

    .line 635
    invoke-virtual {p0, v0, v7}, Lp/i;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 636
    .line 637
    .line 638
    :cond_15
    return-object v7
.end method

.method public static b(Landroid/content/res/Resources;ILjava/lang/String;II)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourcePackageName(I)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const/16 p0, 0x2d

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public static c(Ljava/lang/String;)Landroid/graphics/Typeface;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_1

    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v1, 0x0

    .line 12
    invoke-static {p0, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 17
    .line 18
    invoke-static {v2, v1}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0, v1}, Landroid/graphics/Typeface;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_1
    :goto_0
    return-object v0
.end method

.method public static d(Landroid/graphics/Typeface;)Landroid/graphics/fonts/Font;
    .locals 2

    .line 1
    sget-object v0, Lw/d;->c:Landroid/graphics/Paint;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/graphics/Paint;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lw/d;->c:Landroid/graphics/Paint;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Lw/d;->c:Landroid/graphics/Paint;

    .line 13
    .line 14
    const/high16 v1, 0x41200000    # 10.0f

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 17
    .line 18
    .line 19
    sget-object v0, Lw/d;->c:Landroid/graphics/Paint;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 22
    .line 23
    .line 24
    sget-object p0, Lw/d;->c:Landroid/graphics/Paint;

    .line 25
    .line 26
    invoke-static {p0}, LR0/e;->e(Landroid/graphics/Paint;)Landroid/graphics/text/PositionedGlyphs;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p0}, LR0/e;->b(Landroid/graphics/text/PositionedGlyphs;)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    const/4 p0, 0x0

    .line 37
    return-object p0

    .line 38
    :cond_1
    invoke-static {p0}, LR0/e;->d(Landroid/graphics/text/PositionedGlyphs;)Landroid/graphics/fonts/Font;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method
