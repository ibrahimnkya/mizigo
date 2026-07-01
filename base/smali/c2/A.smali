.class public final Lc2/A;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LZ1/t;


# instance fields
.field public final e:LZ2/s;

.field public final f:Lb2/h;

.field public final g:Lc2/l;

.field public final h:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(LZ2/s;Lb2/h;Lc2/l;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lc2/A;->e:LZ2/s;

    .line 5
    .line 6
    iput-object p2, p0, Lc2/A;->f:Lb2/h;

    .line 7
    .line 8
    iput-object p3, p0, Lc2/A;->g:Lc2/l;

    .line 9
    .line 10
    iput-object p4, p0, Lc2/A;->h:Ljava/util/ArrayList;

    .line 11
    .line 12
    return-void
.end method

.method public static a(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/reflect/Field;Ljava/lang/reflect/Field;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "Class "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string p0, " declares multiple JSON fields named \'"

    .line 18
    .line 19
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string p0, "\'; conflict is caused by fields "

    .line 26
    .line 27
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-static {p2}, Le2/c;->c(Ljava/lang/reflect/Field;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string p0, " and "

    .line 38
    .line 39
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-static {p3}, Le2/c;->c(Ljava/lang/reflect/Field;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string p0, "\nSee "

    .line 50
    .line 51
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string p0, "duplicate-fields"

    .line 55
    .line 56
    const-string p1, "https://github.com/google/gson/blob/main/Troubleshooting.md#"

    .line 57
    .line 58
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    throw v0
.end method


# virtual methods
.method public final b(LZ1/e;Lg2/a;Ljava/lang/Class;Z)Lc2/y;
    .locals 28

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v7, p3

    .line 4
    .line 5
    invoke-virtual {v7}, Ljava/lang/Class;->isInterface()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    sget-object v1, Lc2/y;->c:Lc2/y;

    .line 12
    .line 13
    return-object v1

    .line 14
    :cond_0
    new-instance v8, Ljava/util/LinkedHashMap;

    .line 15
    .line 16
    invoke-direct {v8}, Ljava/util/LinkedHashMap;-><init>()V

    .line 17
    .line 18
    .line 19
    new-instance v9, Ljava/util/LinkedHashMap;

    .line 20
    .line 21
    invoke-direct {v9}, Ljava/util/LinkedHashMap;-><init>()V

    .line 22
    .line 23
    .line 24
    move-object/from16 v10, p2

    .line 25
    .line 26
    move-object v11, v7

    .line 27
    :goto_0
    const-class v1, Ljava/lang/Object;

    .line 28
    .line 29
    if-eq v11, v1, :cond_16

    .line 30
    .line 31
    invoke-virtual {v11}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    .line 32
    .line 33
    .line 34
    move-result-object v12

    .line 35
    if-eq v11, v7, :cond_1

    .line 36
    .line 37
    array-length v1, v12

    .line 38
    if-lez v1, :cond_1

    .line 39
    .line 40
    iget-object v1, v0, Lc2/A;->h:Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-static {v1}, Lb2/d;->f(Ljava/util/ArrayList;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    array-length v13, v12

    .line 46
    const/4 v14, 0x0

    .line 47
    move v15, v14

    .line 48
    :goto_1
    if-ge v15, v13, :cond_15

    .line 49
    .line 50
    aget-object v1, v12, v15

    .line 51
    .line 52
    const/4 v2, 0x1

    .line 53
    invoke-virtual {v0, v1, v2}, Lc2/A;->c(Ljava/lang/reflect/Field;Z)Z

    .line 54
    .line 55
    .line 56
    move-result v24

    .line 57
    invoke-virtual {v0, v1, v14}, Lc2/A;->c(Ljava/lang/reflect/Field;Z)Z

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    if-nez v24, :cond_2

    .line 62
    .line 63
    if-nez v3, :cond_2

    .line 64
    .line 65
    move-object/from16 v3, p1

    .line 66
    .line 67
    goto/16 :goto_e

    .line 68
    .line 69
    :cond_2
    const-class v4, La2/b;

    .line 70
    .line 71
    const/16 v25, 0x0

    .line 72
    .line 73
    if-eqz p4, :cond_6

    .line 74
    .line 75
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getModifiers()I

    .line 76
    .line 77
    .line 78
    move-result v5

    .line 79
    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    .line 80
    .line 81
    .line 82
    move-result v5

    .line 83
    if-eqz v5, :cond_3

    .line 84
    .line 85
    move/from16 v26, v14

    .line 86
    .line 87
    :goto_2
    move-object/from16 v19, v25

    .line 88
    .line 89
    goto :goto_4

    .line 90
    :cond_3
    sget-object v5, Le2/c;->a:Landroid/support/v4/media/session/a;

    .line 91
    .line 92
    invoke-virtual {v5, v11, v1}, Landroid/support/v4/media/session/a;->k(Ljava/lang/Class;Ljava/lang/reflect/Field;)Ljava/lang/reflect/Method;

    .line 93
    .line 94
    .line 95
    move-result-object v5

    .line 96
    invoke-static {v5}, Le2/c;->f(Ljava/lang/reflect/AccessibleObject;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v5, v4}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    .line 100
    .line 101
    .line 102
    move-result-object v6

    .line 103
    if-eqz v6, :cond_5

    .line 104
    .line 105
    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    .line 106
    .line 107
    .line 108
    move-result-object v6

    .line 109
    if-eqz v6, :cond_4

    .line 110
    .line 111
    goto :goto_3

    .line 112
    :cond_4
    invoke-static {v5, v14}, Le2/c;->d(Ljava/lang/reflect/AccessibleObject;Z)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    new-instance v2, LZ1/i;

    .line 117
    .line 118
    const-string v3, "@SerializedName on "

    .line 119
    .line 120
    const-string v4, " is not supported"

    .line 121
    .line 122
    invoke-static {v3, v1, v4}, Lr/a;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    throw v2

    .line 130
    :cond_5
    :goto_3
    move/from16 v26, v3

    .line 131
    .line 132
    move-object/from16 v19, v5

    .line 133
    .line 134
    goto :goto_4

    .line 135
    :cond_6
    move/from16 v26, v3

    .line 136
    .line 137
    goto :goto_2

    .line 138
    :goto_4
    if-nez v19, :cond_7

    .line 139
    .line 140
    invoke-static {v1}, Le2/c;->f(Ljava/lang/reflect/AccessibleObject;)V

    .line 141
    .line 142
    .line 143
    :cond_7
    iget-object v3, v10, Lg2/a;->b:Ljava/lang/reflect/Type;

    .line 144
    .line 145
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getGenericType()Ljava/lang/reflect/Type;

    .line 146
    .line 147
    .line 148
    move-result-object v5

    .line 149
    new-instance v6, Ljava/util/HashMap;

    .line 150
    .line 151
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 152
    .line 153
    .line 154
    invoke-static {v3, v11, v5, v6}, Lb2/d;->k(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/util/HashMap;)Ljava/lang/reflect/Type;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    .line 159
    .line 160
    .line 161
    move-result-object v4

    .line 162
    check-cast v4, La2/b;

    .line 163
    .line 164
    if-nez v4, :cond_8

    .line 165
    .line 166
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v4

    .line 170
    invoke-static {v4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 171
    .line 172
    .line 173
    move-result-object v4

    .line 174
    :goto_5
    move/from16 p2, v2

    .line 175
    .line 176
    move-object v2, v4

    .line 177
    goto :goto_6

    .line 178
    :cond_8
    invoke-interface {v4}, La2/b;->value()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v5

    .line 182
    invoke-interface {v4}, La2/b;->alternate()[Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v4

    .line 186
    array-length v6, v4

    .line 187
    if-nez v6, :cond_9

    .line 188
    .line 189
    invoke-static {v5}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 190
    .line 191
    .line 192
    move-result-object v4

    .line 193
    goto :goto_5

    .line 194
    :cond_9
    new-instance v6, Ljava/util/ArrayList;

    .line 195
    .line 196
    move/from16 p2, v2

    .line 197
    .line 198
    array-length v2, v4

    .line 199
    add-int/lit8 v2, v2, 0x1

    .line 200
    .line 201
    invoke-direct {v6, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    invoke-static {v6, v4}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    move-object v2, v6

    .line 211
    :goto_6
    invoke-interface {v2, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object v4

    .line 215
    move-object/from16 v17, v4

    .line 216
    .line 217
    check-cast v17, Ljava/lang/String;

    .line 218
    .line 219
    new-instance v4, Lg2/a;

    .line 220
    .line 221
    invoke-direct {v4, v3}, Lg2/a;-><init>(Ljava/lang/reflect/Type;)V

    .line 222
    .line 223
    .line 224
    iget-object v3, v4, Lg2/a;->a:Ljava/lang/Class;

    .line 225
    .line 226
    if-eqz v3, :cond_a

    .line 227
    .line 228
    invoke-virtual {v3}, Ljava/lang/Class;->isPrimitive()Z

    .line 229
    .line 230
    .line 231
    move-result v3

    .line 232
    if-eqz v3, :cond_a

    .line 233
    .line 234
    move/from16 v22, p2

    .line 235
    .line 236
    goto :goto_7

    .line 237
    :cond_a
    move/from16 v22, v14

    .line 238
    .line 239
    :goto_7
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getModifiers()I

    .line 240
    .line 241
    .line 242
    move-result v3

    .line 243
    invoke-static {v3}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    .line 244
    .line 245
    .line 246
    move-result v5

    .line 247
    if-eqz v5, :cond_b

    .line 248
    .line 249
    invoke-static {v3}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    .line 250
    .line 251
    .line 252
    move-result v3

    .line 253
    if-eqz v3, :cond_b

    .line 254
    .line 255
    move/from16 v23, p2

    .line 256
    .line 257
    goto :goto_8

    .line 258
    :cond_b
    move/from16 v23, v14

    .line 259
    .line 260
    :goto_8
    const-class v3, La2/a;

    .line 261
    .line 262
    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    .line 263
    .line 264
    .line 265
    move-result-object v3

    .line 266
    move-object v5, v3

    .line 267
    check-cast v5, La2/a;

    .line 268
    .line 269
    if-eqz v5, :cond_c

    .line 270
    .line 271
    move-object v6, v2

    .line 272
    iget-object v2, v0, Lc2/A;->e:LZ2/s;

    .line 273
    .line 274
    move-object v3, v6

    .line 275
    const/4 v6, 0x0

    .line 276
    move-object/from16 v18, v1

    .line 277
    .line 278
    iget-object v1, v0, Lc2/A;->g:Lc2/l;

    .line 279
    .line 280
    move/from16 v16, p2

    .line 281
    .line 282
    move-object/from16 v27, v3

    .line 283
    .line 284
    move-object/from16 v3, p1

    .line 285
    .line 286
    invoke-virtual/range {v1 .. v6}, Lc2/l;->a(LZ2/s;LZ1/e;Lg2/a;La2/a;Z)LZ1/s;

    .line 287
    .line 288
    .line 289
    move-result-object v1

    .line 290
    goto :goto_9

    .line 291
    :cond_c
    move-object/from16 v3, p1

    .line 292
    .line 293
    move/from16 v16, p2

    .line 294
    .line 295
    move-object/from16 v18, v1

    .line 296
    .line 297
    move-object/from16 v27, v2

    .line 298
    .line 299
    move-object/from16 v1, v25

    .line 300
    .line 301
    :goto_9
    if-eqz v1, :cond_d

    .line 302
    .line 303
    move/from16 v2, v16

    .line 304
    .line 305
    goto :goto_a

    .line 306
    :cond_d
    move v2, v14

    .line 307
    :goto_a
    if-nez v1, :cond_e

    .line 308
    .line 309
    invoke-virtual {v3, v4}, LZ1/e;->c(Lg2/a;)LZ1/s;

    .line 310
    .line 311
    .line 312
    move-result-object v1

    .line 313
    :cond_e
    if-eqz v24, :cond_10

    .line 314
    .line 315
    if-eqz v2, :cond_f

    .line 316
    .line 317
    move-object v2, v1

    .line 318
    goto :goto_b

    .line 319
    :cond_f
    new-instance v2, Lc2/r;

    .line 320
    .line 321
    iget-object v4, v4, Lg2/a;->b:Ljava/lang/reflect/Type;

    .line 322
    .line 323
    invoke-direct {v2, v3, v1, v4}, Lc2/r;-><init>(LZ1/e;LZ1/s;Ljava/lang/reflect/Type;)V

    .line 324
    .line 325
    .line 326
    :goto_b
    move-object/from16 v20, v2

    .line 327
    .line 328
    goto :goto_c

    .line 329
    :cond_10
    move-object/from16 v20, v1

    .line 330
    .line 331
    :goto_c
    new-instance v16, Lc2/v;

    .line 332
    .line 333
    move-object/from16 v21, v1

    .line 334
    .line 335
    invoke-direct/range {v16 .. v23}, Lc2/v;-><init>(Ljava/lang/String;Ljava/lang/reflect/Field;Ljava/lang/reflect/Method;LZ1/s;LZ1/s;ZZ)V

    .line 336
    .line 337
    .line 338
    move-object/from16 v2, v16

    .line 339
    .line 340
    move-object/from16 v4, v17

    .line 341
    .line 342
    move-object/from16 v1, v18

    .line 343
    .line 344
    if-eqz v26, :cond_12

    .line 345
    .line 346
    invoke-interface/range {v27 .. v27}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 347
    .line 348
    .line 349
    move-result-object v5

    .line 350
    :goto_d
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 351
    .line 352
    .line 353
    move-result v6

    .line 354
    if-eqz v6, :cond_12

    .line 355
    .line 356
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 357
    .line 358
    .line 359
    move-result-object v6

    .line 360
    check-cast v6, Ljava/lang/String;

    .line 361
    .line 362
    invoke-interface {v8, v6, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 363
    .line 364
    .line 365
    move-result-object v16

    .line 366
    move-object/from16 v14, v16

    .line 367
    .line 368
    check-cast v14, Lc2/v;

    .line 369
    .line 370
    if-nez v14, :cond_11

    .line 371
    .line 372
    const/4 v14, 0x0

    .line 373
    goto :goto_d

    .line 374
    :cond_11
    iget-object v2, v14, Lc2/v;->b:Ljava/lang/reflect/Field;

    .line 375
    .line 376
    invoke-static {v7, v6, v2, v1}, Lc2/A;->a(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/reflect/Field;Ljava/lang/reflect/Field;)V

    .line 377
    .line 378
    .line 379
    throw v25

    .line 380
    :cond_12
    if-eqz v24, :cond_14

    .line 381
    .line 382
    invoke-interface {v9, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 383
    .line 384
    .line 385
    move-result-object v2

    .line 386
    check-cast v2, Lc2/v;

    .line 387
    .line 388
    if-nez v2, :cond_13

    .line 389
    .line 390
    goto :goto_e

    .line 391
    :cond_13
    iget-object v2, v2, Lc2/v;->b:Ljava/lang/reflect/Field;

    .line 392
    .line 393
    invoke-static {v7, v4, v2, v1}, Lc2/A;->a(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/reflect/Field;Ljava/lang/reflect/Field;)V

    .line 394
    .line 395
    .line 396
    throw v25

    .line 397
    :cond_14
    :goto_e
    add-int/lit8 v15, v15, 0x1

    .line 398
    .line 399
    const/4 v14, 0x0

    .line 400
    goto/16 :goto_1

    .line 401
    .line 402
    :cond_15
    move-object/from16 v3, p1

    .line 403
    .line 404
    iget-object v1, v10, Lg2/a;->b:Ljava/lang/reflect/Type;

    .line 405
    .line 406
    invoke-virtual {v11}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    .line 407
    .line 408
    .line 409
    move-result-object v2

    .line 410
    new-instance v4, Ljava/util/HashMap;

    .line 411
    .line 412
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 413
    .line 414
    .line 415
    invoke-static {v1, v11, v2, v4}, Lb2/d;->k(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/util/HashMap;)Ljava/lang/reflect/Type;

    .line 416
    .line 417
    .line 418
    move-result-object v1

    .line 419
    new-instance v10, Lg2/a;

    .line 420
    .line 421
    invoke-direct {v10, v1}, Lg2/a;-><init>(Ljava/lang/reflect/Type;)V

    .line 422
    .line 423
    .line 424
    iget-object v11, v10, Lg2/a;->a:Ljava/lang/Class;

    .line 425
    .line 426
    goto/16 :goto_0

    .line 427
    .line 428
    :cond_16
    new-instance v1, Lc2/y;

    .line 429
    .line 430
    new-instance v2, Ljava/util/ArrayList;

    .line 431
    .line 432
    invoke-virtual {v9}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    .line 433
    .line 434
    .line 435
    move-result-object v3

    .line 436
    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 437
    .line 438
    .line 439
    invoke-direct {v1, v8, v2}, Lc2/y;-><init>(Ljava/util/Map;Ljava/util/List;)V

    .line 440
    .line 441
    .line 442
    return-object v1
.end method

.method public final c(Ljava/lang/reflect/Field;Z)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lc2/A;->f:Lb2/h;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x88

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getModifiers()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    and-int/2addr v1, v2

    .line 13
    const/4 v2, 0x1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    :goto_0
    move p1, v2

    .line 17
    goto :goto_3

    .line 18
    :cond_0
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->isSynthetic()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {v0, p1, p2}, Lb2/h;->a(Ljava/lang/Class;Z)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    if-eqz p2, :cond_3

    .line 37
    .line 38
    iget-object p1, v0, Lb2/h;->e:Ljava/util/List;

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_3
    iget-object p1, v0, Lb2/h;->f:Ljava/util/List;

    .line 42
    .line 43
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    if-nez p2, :cond_5

    .line 48
    .line 49
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    if-nez p2, :cond_4

    .line 58
    .line 59
    goto :goto_2

    .line 60
    :cond_4
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 65
    .line 66
    .line 67
    new-instance p1, Ljava/lang/ClassCastException;

    .line 68
    .line 69
    invoke-direct {p1}, Ljava/lang/ClassCastException;-><init>()V

    .line 70
    .line 71
    .line 72
    throw p1

    .line 73
    :cond_5
    :goto_2
    const/4 p1, 0x0

    .line 74
    :goto_3
    xor-int/2addr p1, v2

    .line 75
    return p1
.end method

.method public final create(LZ1/e;Lg2/a;)LZ1/s;
    .locals 4

    .line 1
    iget-object v0, p2, Lg2/a;->a:Ljava/lang/Class;

    .line 2
    .line 3
    const-class v1, Ljava/lang/Object;

    .line 4
    .line 5
    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    return-object p1

    .line 13
    :cond_0
    sget-object v1, Le2/c;->a:Landroid/support/v4/media/session/a;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Class;->getModifiers()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-static {v1}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_2

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Class;->isAnonymousClass()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_1

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/Class;->isLocalClass()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    :cond_1
    new-instance p1, LZ1/b;

    .line 38
    .line 39
    const/4 p2, 0x2

    .line 40
    invoke-direct {p1, p2}, LZ1/b;-><init>(I)V

    .line 41
    .line 42
    .line 43
    return-object p1

    .line 44
    :cond_2
    iget-object v1, p0, Lc2/A;->h:Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-static {v1}, Lb2/d;->f(Ljava/util/ArrayList;)V

    .line 47
    .line 48
    .line 49
    sget-object v1, Le2/c;->a:Landroid/support/v4/media/session/a;

    .line 50
    .line 51
    invoke-virtual {v1, v0}, Landroid/support/v4/media/session/a;->B(Ljava/lang/Class;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_3

    .line 56
    .line 57
    new-instance v1, Lc2/z;

    .line 58
    .line 59
    const/4 v2, 0x1

    .line 60
    invoke-virtual {p0, p1, p2, v0, v2}, Lc2/A;->b(LZ1/e;Lg2/a;Ljava/lang/Class;Z)Lc2/y;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-direct {v1, v0, p1}, Lc2/z;-><init>(Ljava/lang/Class;Lc2/y;)V

    .line 65
    .line 66
    .line 67
    return-object v1

    .line 68
    :cond_3
    iget-object v1, p0, Lc2/A;->e:LZ2/s;

    .line 69
    .line 70
    invoke-virtual {v1, p2}, LZ2/s;->z(Lg2/a;)Lb2/o;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    new-instance v2, Lc2/x;

    .line 75
    .line 76
    const/4 v3, 0x0

    .line 77
    invoke-virtual {p0, p1, p2, v0, v3}, Lc2/A;->b(LZ1/e;Lg2/a;Ljava/lang/Class;Z)Lc2/y;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-direct {v2, v1, p1}, Lc2/x;-><init>(Lb2/o;Lc2/y;)V

    .line 82
    .line 83
    .line 84
    return-object v2
.end method
