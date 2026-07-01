.class public final LR3/l;
.super LC3/c;
.source "SourceFile"

# interfaces
.implements LQ3/e;


# instance fields
.field public final h:LQ3/e;

.field public final i:LA3/i;

.field public final j:I

.field public k:LA3/i;

.field public l:LA3/d;


# direct methods
.method public constructor <init>(LQ3/e;LA3/i;)V
    .locals 2

    .line 1
    sget-object v0, LR3/j;->e:LR3/j;

    .line 2
    .line 3
    sget-object v1, LA3/j;->e:LA3/j;

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, LC3/c;-><init>(LA3/d;LA3/i;)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, LR3/l;->h:LQ3/e;

    .line 9
    .line 10
    iput-object p2, p0, LR3/l;->i:LA3/i;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance v0, LA3/b;

    .line 18
    .line 19
    const/4 v1, 0x5

    .line 20
    invoke-direct {v0, v1}, LA3/b;-><init>(I)V

    .line 21
    .line 22
    .line 23
    invoke-interface {p2, p1, v0}, LA3/i;->i(Ljava/lang/Object;LH3/p;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Ljava/lang/Number;

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iput p1, p0, LR3/l;->j:I

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;LA3/d;)Ljava/lang/Object;
    .locals 1

    .line 1
    :try_start_0
    invoke-virtual {p0, p2, p1}, LR3/l;->o(LA3/d;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    sget-object p2, LB3/a;->e:LB3/a;

    .line 6
    .line 7
    if-ne p1, p2, :cond_0

    .line 8
    .line 9
    return-object p1

    .line 10
    :cond_0
    sget-object p1, Ly3/h;->a:Ly3/h;

    .line 11
    .line 12
    return-object p1

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    new-instance v0, LR3/h;

    .line 15
    .line 16
    invoke-interface {p2}, LA3/d;->e()LA3/i;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-direct {v0, p2, p1}, LR3/h;-><init>(LA3/i;Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, LR3/l;->k:LA3/i;

    .line 24
    .line 25
    throw p1
.end method

.method public final d()LC3/d;
    .locals 2

    .line 1
    iget-object v0, p0, LR3/l;->l:LA3/d;

    .line 2
    .line 3
    instance-of v1, v0, LC3/d;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, LC3/d;

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    return-object v0
.end method

.method public final e()LA3/i;
    .locals 1

    .line 1
    iget-object v0, p0, LR3/l;->k:LA3/i;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, LA3/j;->e:LA3/j;

    .line 6
    .line 7
    :cond_0
    return-object v0
.end method

.method public final l()Ljava/lang/StackTraceElement;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return-object v0
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    invoke-static {p1}, Ly3/e;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v1, LR3/h;

    .line 8
    .line 9
    invoke-virtual {p0}, LR3/l;->e()LA3/i;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-direct {v1, v2, v0}, LR3/h;-><init>(LA3/i;Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, LR3/l;->k:LA3/i;

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, LR3/l;->l:LA3/d;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-interface {v0, p1}, LA3/d;->g(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    sget-object p1, LB3/a;->e:LB3/a;

    .line 26
    .line 27
    return-object p1
.end method

.method public final o(LA3/d;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    invoke-interface/range {p1 .. p1}, LA3/d;->e()LA3/i;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-static {v2}, LN3/v;->a(LA3/i;)V

    .line 10
    .line 11
    .line 12
    iget-object v3, v0, LR3/l;->k:LA3/i;

    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    if-eq v3, v2, :cond_16

    .line 16
    .line 17
    instance-of v5, v3, LR3/h;

    .line 18
    .line 19
    const/4 v6, 0x0

    .line 20
    if-eqz v5, :cond_15

    .line 21
    .line 22
    check-cast v3, LR3/h;

    .line 23
    .line 24
    new-instance v2, Ljava/lang/IllegalStateException;

    .line 25
    .line 26
    new-instance v5, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v7, "\n            Flow exception transparency is violated:\n                Previous \'emit\' call has thrown exception "

    .line 29
    .line 30
    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v3, v3, LR3/h;->f:Ljava/lang/Throwable;

    .line 34
    .line 35
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v3, ", but then emission attempt of value \'"

    .line 39
    .line 40
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v1, "\' has been detected.\n                Emissions from \'catch\' blocks are prohibited in order to avoid unspecified behaviour, \'Flow.catch\' operator can be used instead.\n                For a more detailed explanation, please refer to Flow documentation.\n            "

    .line 47
    .line 48
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    const-string v3, "<this>"

    .line 56
    .line 57
    invoke-static {v1, v3}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    new-instance v5, LM3/d;

    .line 61
    .line 62
    invoke-direct {v5, v1}, LM3/d;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 66
    .line 67
    .line 68
    move-result v7

    .line 69
    if-nez v7, :cond_0

    .line 70
    .line 71
    sget-object v5, Lz3/l;->e:Lz3/l;

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v7

    .line 78
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 79
    .line 80
    .line 81
    move-result v8

    .line 82
    if-nez v8, :cond_1

    .line 83
    .line 84
    invoke-static {v7}, LT0/a;->C(Ljava/lang/Object;)Ljava/util/List;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    goto :goto_1

    .line 89
    :cond_1
    new-instance v8, Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 98
    .line 99
    .line 100
    move-result v7

    .line 101
    if-eqz v7, :cond_2

    .line 102
    .line 103
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v7

    .line 107
    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_2
    move-object v5, v8

    .line 112
    :goto_1
    new-instance v7, Ljava/util/ArrayList;

    .line 113
    .line 114
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 118
    .line 119
    .line 120
    move-result-object v8

    .line 121
    :cond_3
    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 122
    .line 123
    .line 124
    move-result v9

    .line 125
    if-eqz v9, :cond_4

    .line 126
    .line 127
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v9

    .line 131
    move-object v10, v9

    .line 132
    check-cast v10, Ljava/lang/String;

    .line 133
    .line 134
    invoke-static {v10}, LM3/l;->g0(Ljava/lang/CharSequence;)Z

    .line 135
    .line 136
    .line 137
    move-result v10

    .line 138
    if-nez v10, :cond_3

    .line 139
    .line 140
    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    goto :goto_2

    .line 144
    :cond_4
    new-instance v8, Ljava/util/ArrayList;

    .line 145
    .line 146
    invoke-static {v7}, Lz3/f;->T(Ljava/lang/Iterable;)I

    .line 147
    .line 148
    .line 149
    move-result v9

    .line 150
    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 154
    .line 155
    .line 156
    move-result v9

    .line 157
    move v10, v6

    .line 158
    :goto_3
    if-ge v10, v9, :cond_9

    .line 159
    .line 160
    invoke-virtual {v7, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v11

    .line 164
    add-int/lit8 v10, v10, 0x1

    .line 165
    .line 166
    check-cast v11, Ljava/lang/String;

    .line 167
    .line 168
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    .line 169
    .line 170
    .line 171
    move-result v12

    .line 172
    move v13, v6

    .line 173
    :goto_4
    const/4 v14, -0x1

    .line 174
    if-ge v13, v12, :cond_6

    .line 175
    .line 176
    invoke-virtual {v11, v13}, Ljava/lang/String;->charAt(I)C

    .line 177
    .line 178
    .line 179
    move-result v15

    .line 180
    invoke-static {v15}, Ljava/lang/Character;->isWhitespace(C)Z

    .line 181
    .line 182
    .line 183
    move-result v16

    .line 184
    if-nez v16, :cond_5

    .line 185
    .line 186
    invoke-static {v15}, Ljava/lang/Character;->isSpaceChar(C)Z

    .line 187
    .line 188
    .line 189
    move-result v15

    .line 190
    if-eqz v15, :cond_7

    .line 191
    .line 192
    :cond_5
    add-int/lit8 v13, v13, 0x1

    .line 193
    .line 194
    goto :goto_4

    .line 195
    :cond_6
    move v13, v14

    .line 196
    :cond_7
    if-ne v13, v14, :cond_8

    .line 197
    .line 198
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    .line 199
    .line 200
    .line 201
    move-result v13

    .line 202
    :cond_8
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 203
    .line 204
    .line 205
    move-result-object v11

    .line 206
    invoke-virtual {v8, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    goto :goto_3

    .line 210
    :cond_9
    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 211
    .line 212
    .line 213
    move-result-object v7

    .line 214
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 215
    .line 216
    .line 217
    move-result v8

    .line 218
    if-nez v8, :cond_a

    .line 219
    .line 220
    move-object v8, v4

    .line 221
    goto :goto_6

    .line 222
    :cond_a
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 223
    .line 224
    .line 225
    move-result-object v8

    .line 226
    check-cast v8, Ljava/lang/Comparable;

    .line 227
    .line 228
    :cond_b
    :goto_5
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 229
    .line 230
    .line 231
    move-result v9

    .line 232
    if-eqz v9, :cond_c

    .line 233
    .line 234
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object v9

    .line 238
    check-cast v9, Ljava/lang/Comparable;

    .line 239
    .line 240
    invoke-interface {v8, v9}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    .line 241
    .line 242
    .line 243
    move-result v10

    .line 244
    if-lez v10, :cond_b

    .line 245
    .line 246
    move-object v8, v9

    .line 247
    goto :goto_5

    .line 248
    :cond_c
    :goto_6
    check-cast v8, Ljava/lang/Integer;

    .line 249
    .line 250
    if-eqz v8, :cond_d

    .line 251
    .line 252
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    .line 253
    .line 254
    .line 255
    move-result v7

    .line 256
    goto :goto_7

    .line 257
    :cond_d
    move v7, v6

    .line 258
    :goto_7
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 259
    .line 260
    .line 261
    move-result v1

    .line 262
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 263
    .line 264
    .line 265
    invoke-static {v5}, Lz3/e;->R(Ljava/util/List;)I

    .line 266
    .line 267
    .line 268
    move-result v8

    .line 269
    new-instance v9, Ljava/util/ArrayList;

    .line 270
    .line 271
    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 272
    .line 273
    .line 274
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 275
    .line 276
    .line 277
    move-result-object v5

    .line 278
    :goto_8
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 279
    .line 280
    .line 281
    move-result v10

    .line 282
    if-eqz v10, :cond_14

    .line 283
    .line 284
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 285
    .line 286
    .line 287
    move-result-object v10

    .line 288
    add-int/lit8 v11, v6, 0x1

    .line 289
    .line 290
    if-ltz v6, :cond_13

    .line 291
    .line 292
    check-cast v10, Ljava/lang/String;

    .line 293
    .line 294
    if-eqz v6, :cond_e

    .line 295
    .line 296
    if-ne v6, v8, :cond_f

    .line 297
    .line 298
    :cond_e
    invoke-static {v10}, LM3/l;->g0(Ljava/lang/CharSequence;)Z

    .line 299
    .line 300
    .line 301
    move-result v6

    .line 302
    if-eqz v6, :cond_f

    .line 303
    .line 304
    move-object v6, v4

    .line 305
    goto :goto_a

    .line 306
    :cond_f
    invoke-static {v10, v3}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 307
    .line 308
    .line 309
    if-ltz v7, :cond_12

    .line 310
    .line 311
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    .line 312
    .line 313
    .line 314
    move-result v6

    .line 315
    if-le v7, v6, :cond_10

    .line 316
    .line 317
    goto :goto_9

    .line 318
    :cond_10
    move v6, v7

    .line 319
    :goto_9
    invoke-virtual {v10, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v6

    .line 323
    const-string v10, "substring(...)"

    .line 324
    .line 325
    invoke-static {v6, v10}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 326
    .line 327
    .line 328
    :goto_a
    if-eqz v6, :cond_11

    .line 329
    .line 330
    invoke-virtual {v9, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 331
    .line 332
    .line 333
    :cond_11
    move v6, v11

    .line 334
    goto :goto_8

    .line 335
    :cond_12
    const-string v1, "Requested character count "

    .line 336
    .line 337
    const-string v2, " is less than zero."

    .line 338
    .line 339
    invoke-static {v7, v1, v2}, LE1/j;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 340
    .line 341
    .line 342
    move-result-object v1

    .line 343
    new-instance v2, Ljava/lang/IllegalArgumentException;

    .line 344
    .line 345
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 346
    .line 347
    .line 348
    move-result-object v1

    .line 349
    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 350
    .line 351
    .line 352
    throw v2

    .line 353
    :cond_13
    new-instance v1, Ljava/lang/ArithmeticException;

    .line 354
    .line 355
    const-string v2, "Index overflow has happened."

    .line 356
    .line 357
    invoke-direct {v1, v2}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    .line 358
    .line 359
    .line 360
    throw v1

    .line 361
    :cond_14
    new-instance v10, Ljava/lang/StringBuilder;

    .line 362
    .line 363
    invoke-direct {v10, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 364
    .line 365
    .line 366
    const-string v12, ""

    .line 367
    .line 368
    const-string v14, "..."

    .line 369
    .line 370
    const-string v11, "\n"

    .line 371
    .line 372
    const/4 v15, 0x0

    .line 373
    move-object v13, v12

    .line 374
    invoke-static/range {v9 .. v15}, Lz3/d;->U(Ljava/lang/Iterable;Ljava/lang/StringBuilder;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;LH3/l;)V

    .line 375
    .line 376
    .line 377
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 378
    .line 379
    .line 380
    move-result-object v1

    .line 381
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 382
    .line 383
    .line 384
    move-result-object v1

    .line 385
    invoke-direct {v2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 386
    .line 387
    .line 388
    throw v2

    .line 389
    :cond_15
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 390
    .line 391
    .line 392
    move-result-object v3

    .line 393
    new-instance v5, LM3/k;

    .line 394
    .line 395
    const/4 v6, 0x1

    .line 396
    invoke-direct {v5, v6, v0}, LM3/k;-><init>(ILjava/lang/Object;)V

    .line 397
    .line 398
    .line 399
    invoke-interface {v2, v3, v5}, LA3/i;->i(Ljava/lang/Object;LH3/p;)Ljava/lang/Object;

    .line 400
    .line 401
    .line 402
    move-result-object v3

    .line 403
    check-cast v3, Ljava/lang/Number;

    .line 404
    .line 405
    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    .line 406
    .line 407
    .line 408
    move-result v3

    .line 409
    iget v5, v0, LR3/l;->j:I

    .line 410
    .line 411
    if-ne v3, v5, :cond_17

    .line 412
    .line 413
    iput-object v2, v0, LR3/l;->k:LA3/i;

    .line 414
    .line 415
    :cond_16
    move-object/from16 v2, p1

    .line 416
    .line 417
    goto :goto_b

    .line 418
    :cond_17
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 419
    .line 420
    new-instance v3, Ljava/lang/StringBuilder;

    .line 421
    .line 422
    const-string v4, "Flow invariant is violated:\n\t\tFlow was collected in "

    .line 423
    .line 424
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 425
    .line 426
    .line 427
    iget-object v4, v0, LR3/l;->i:LA3/i;

    .line 428
    .line 429
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 430
    .line 431
    .line 432
    const-string v4, ",\n\t\tbut emission happened in "

    .line 433
    .line 434
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 435
    .line 436
    .line 437
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 438
    .line 439
    .line 440
    const-string v2, ".\n\t\tPlease refer to \'flow\' documentation or use \'flowOn\' instead"

    .line 441
    .line 442
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 443
    .line 444
    .line 445
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 446
    .line 447
    .line 448
    move-result-object v2

    .line 449
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 450
    .line 451
    .line 452
    move-result-object v2

    .line 453
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 454
    .line 455
    .line 456
    throw v1

    .line 457
    :goto_b
    iput-object v2, v0, LR3/l;->l:LA3/d;

    .line 458
    .line 459
    sget-object v2, LR3/n;->a:LH3/q;

    .line 460
    .line 461
    const-string v3, "null cannot be cast to non-null type kotlinx.coroutines.flow.FlowCollector<kotlin.Any?>"

    .line 462
    .line 463
    iget-object v5, v0, LR3/l;->h:LQ3/e;

    .line 464
    .line 465
    invoke-static {v5, v3}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 466
    .line 467
    .line 468
    invoke-interface {v2, v5, v1, v0}, LH3/q;->f(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 469
    .line 470
    .line 471
    move-result-object v1

    .line 472
    sget-object v2, LB3/a;->e:LB3/a;

    .line 473
    .line 474
    invoke-static {v1, v2}, LI3/h;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 475
    .line 476
    .line 477
    move-result v2

    .line 478
    if-nez v2, :cond_18

    .line 479
    .line 480
    iput-object v4, v0, LR3/l;->l:LA3/d;

    .line 481
    .line 482
    :cond_18
    return-object v1
.end method
