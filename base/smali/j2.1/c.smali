.class public final Lj2/c;
.super LS/b;
.source "SourceFile"


# instance fields
.field public final b:Lj2/b;

.field public final c:Lp/i;

.field public final d:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

.field public final e:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>(Lj2/b;)V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, LS/b;-><init>(I)V

    .line 3
    .line 4
    .line 5
    new-instance v0, Lp/i;

    .line 6
    .line 7
    const/4 v1, 0x5

    .line 8
    invoke-direct {v0, v1}, Lp/i;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lj2/c;->c:Lp/i;

    .line 12
    .line 13
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lj2/c;->d:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 19
    .line 20
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lj2/c;->e:Ljava/util/concurrent/ExecutorService;

    .line 25
    .line 26
    iput-object p1, p0, Lj2/c;->b:Lj2/b;

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public final h(Ls3/t;)Z
    .locals 10

    .line 1
    iget-object v0, p0, Lj2/c;->b:Lj2/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    new-instance v6, Lj2/a;

    .line 7
    .line 8
    invoke-direct {v6, p1}, Lj2/a;-><init>(Ls3/t;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, v0, Lj2/b;->d:Lp2/b;

    .line 12
    .line 13
    monitor-enter p1

    .line 14
    :try_start_0
    iget-object v1, v0, Lj2/b;->c:Ljava/util/LinkedHashSet;

    .line 15
    .line 16
    invoke-interface {v1, v6}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v7

    .line 20
    if-eqz v7, :cond_0

    .line 21
    .line 22
    iget-object v1, v0, Lj2/b;->d:Lp2/b;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v6}, Lj2/a;->a()Lo2/a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v2, v1, Lp2/b;->a:Lm2/a;

    .line 32
    .line 33
    iget-wide v3, v0, Lo2/a;->a:D

    .line 34
    .line 35
    iget-wide v8, v0, Lo2/a;->b:D

    .line 36
    .line 37
    invoke-virtual {v2, v3, v4, v8, v9}, Lm2/a;->a(DD)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    iget-wide v2, v0, Lo2/a;->a:D

    .line 44
    .line 45
    iget-wide v4, v0, Lo2/a;->b:D

    .line 46
    .line 47
    invoke-virtual/range {v1 .. v6}, Lp2/b;->a(DDLp2/a;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catchall_0
    move-exception v0

    .line 52
    goto :goto_1

    .line 53
    :cond_0
    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    if-eqz v7, :cond_1

    .line 55
    .line 56
    iget-object p1, p0, Lj2/c;->c:Lp/i;

    .line 57
    .line 58
    const/4 v0, -0x1

    .line 59
    invoke-virtual {p1, v0}, Lp/i;->c(I)V

    .line 60
    .line 61
    .line 62
    :cond_1
    return v7

    .line 63
    :goto_1
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 64
    throw v0
.end method

.method public final i(F)Ljava/util/Set;
    .locals 6

    .line 1
    float-to-int p1, p1

    .line 2
    invoke-virtual {p0, p1}, Lj2/c;->j(I)Ljava/util/Set;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    add-int/lit8 v1, p1, 0x1

    .line 7
    .line 8
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    iget-object v3, p0, Lj2/c;->c:Lp/i;

    .line 13
    .line 14
    invoke-virtual {v3, v2}, Lp/i;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    iget-object v4, p0, Lj2/c;->e:Ljava/util/concurrent/ExecutorService;

    .line 19
    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    new-instance v2, LM0/i;

    .line 23
    .line 24
    const/4 v5, 0x2

    .line 25
    invoke-direct {v2, p0, v1, v5}, LM0/i;-><init>(Ljava/lang/Object;II)V

    .line 26
    .line 27
    .line 28
    invoke-interface {v4, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    add-int/lit8 p1, p1, -0x1

    .line 32
    .line 33
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v3, v1}, Lp/i;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    if-nez v1, :cond_1

    .line 42
    .line 43
    new-instance v1, LM0/i;

    .line 44
    .line 45
    const/4 v2, 0x2

    .line 46
    invoke-direct {v1, p0, p1, v2}, LM0/i;-><init>(Ljava/lang/Object;II)V

    .line 47
    .line 48
    .line 49
    invoke-interface {v4, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-object v0
.end method

.method public final j(I)Ljava/util/Set;
    .locals 29

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget-object v0, v1, Lj2/c;->d:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 10
    .line 11
    .line 12
    iget-object v2, v1, Lj2/c;->c:Lp/i;

    .line 13
    .line 14
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {v2, v3}, Lp/i;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    check-cast v3, Ljava/util/Set;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    invoke-interface {v4}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 29
    .line 30
    .line 31
    if-nez v3, :cond_7

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 38
    .line 39
    .line 40
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v2, v3}, Lp/i;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    check-cast v3, Ljava/util/Set;

    .line 49
    .line 50
    if-nez v3, :cond_6

    .line 51
    .line 52
    iget-object v3, v1, Lj2/c;->b:Lj2/b;

    .line 53
    .line 54
    move/from16 v4, p1

    .line 55
    .line 56
    int-to-float v5, v4

    .line 57
    float-to-int v5, v5

    .line 58
    iget v6, v3, Lj2/b;->b:I

    .line 59
    .line 60
    int-to-double v6, v6

    .line 61
    int-to-double v8, v5

    .line 62
    const-wide/high16 v10, 0x4000000000000000L    # 2.0

    .line 63
    .line 64
    invoke-static {v10, v11, v8, v9}, Ljava/lang/Math;->pow(DD)D

    .line 65
    .line 66
    .line 67
    move-result-wide v8

    .line 68
    div-double/2addr v6, v8

    .line 69
    const-wide/high16 v8, 0x4070000000000000L    # 256.0

    .line 70
    .line 71
    div-double/2addr v6, v8

    .line 72
    new-instance v5, Ljava/util/HashSet;

    .line 73
    .line 74
    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 75
    .line 76
    .line 77
    new-instance v8, Ljava/util/HashSet;

    .line 78
    .line 79
    invoke-direct {v8}, Ljava/util/HashSet;-><init>()V

    .line 80
    .line 81
    .line 82
    new-instance v9, Ljava/util/HashMap;

    .line 83
    .line 84
    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 85
    .line 86
    .line 87
    new-instance v12, Ljava/util/HashMap;

    .line 88
    .line 89
    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    .line 90
    .line 91
    .line 92
    iget-object v13, v3, Lj2/b;->d:Lp2/b;

    .line 93
    .line 94
    monitor-enter v13

    .line 95
    :try_start_0
    iget-object v14, v3, Lj2/b;->c:Ljava/util/LinkedHashSet;

    .line 96
    .line 97
    invoke-interface {v14}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 98
    .line 99
    .line 100
    move-result-object v14

    .line 101
    :goto_0
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    .line 102
    .line 103
    .line 104
    move-result v15

    .line 105
    if-eqz v15, :cond_5

    .line 106
    .line 107
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v15

    .line 111
    check-cast v15, Lj2/a;

    .line 112
    .line 113
    invoke-virtual {v5, v15}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result v16

    .line 117
    if-eqz v16, :cond_0

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_0
    move-wide/from16 v16, v10

    .line 121
    .line 122
    iget-object v10, v15, Lj2/a;->b:Lo2/a;

    .line 123
    .line 124
    div-double v18, v6, v16

    .line 125
    .line 126
    new-instance v20, Lm2/a;

    .line 127
    .line 128
    move-object v11, v0

    .line 129
    iget-wide v0, v10, Lo2/a;->a:D

    .line 130
    .line 131
    sub-double v21, v0, v18

    .line 132
    .line 133
    add-double v23, v0, v18

    .line 134
    .line 135
    iget-wide v0, v10, Lo2/a;->b:D

    .line 136
    .line 137
    sub-double v25, v0, v18

    .line 138
    .line 139
    add-double v27, v0, v18

    .line 140
    .line 141
    invoke-direct/range {v20 .. v28}, Lm2/a;-><init>(DDDD)V

    .line 142
    .line 143
    .line 144
    move-object/from16 v0, v20

    .line 145
    .line 146
    iget-object v1, v3, Lj2/b;->d:Lp2/b;

    .line 147
    .line 148
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 149
    .line 150
    .line 151
    new-instance v10, Ljava/util/ArrayList;

    .line 152
    .line 153
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v1, v0, v10}, Lp2/b;->c(Lm2/a;Ljava/util/ArrayList;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    const/4 v1, 0x1

    .line 164
    if-ne v0, v1, :cond_1

    .line 165
    .line 166
    invoke-virtual {v8, v15}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    invoke-virtual {v5, v15}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    const-wide/16 v0, 0x0

    .line 173
    .line 174
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-virtual {v9, v15, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-object/from16 v1, p0

    .line 182
    .line 183
    move-object v0, v11

    .line 184
    move-wide/from16 v10, v16

    .line 185
    .line 186
    goto :goto_0

    .line 187
    :catchall_0
    move-exception v0

    .line 188
    goto/16 :goto_3

    .line 189
    .line 190
    :cond_1
    new-instance v0, Lj2/e;

    .line 191
    .line 192
    iget-object v1, v15, Lj2/a;->a:Ls3/t;

    .line 193
    .line 194
    iget-object v1, v1, Ls3/t;->a:Le1/p;

    .line 195
    .line 196
    iget-object v1, v1, Le1/p;->e:Lcom/google/android/gms/maps/model/LatLng;

    .line 197
    .line 198
    invoke-direct {v0, v1}, Lj2/e;-><init>(Lcom/google/android/gms/maps/model/LatLng;)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {v8, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    const/16 v18, 0x0

    .line 209
    .line 210
    move-object/from16 v19, v3

    .line 211
    .line 212
    move/from16 v3, v18

    .line 213
    .line 214
    :goto_1
    if-ge v3, v1, :cond_4

    .line 215
    .line 216
    invoke-virtual {v10, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v18

    .line 220
    add-int/lit8 v3, v3, 0x1

    .line 221
    .line 222
    move/from16 v20, v1

    .line 223
    .line 224
    move-object/from16 v1, v18

    .line 225
    .line 226
    check-cast v1, Lj2/a;

    .line 227
    .line 228
    invoke-virtual {v9, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    .line 230
    .line 231
    move-result-object v18

    .line 232
    check-cast v18, Ljava/lang/Double;

    .line 233
    .line 234
    move/from16 v21, v3

    .line 235
    .line 236
    iget-object v3, v1, Lj2/a;->b:Lo2/a;

    .line 237
    .line 238
    iget-object v4, v15, Lj2/a;->b:Lo2/a;

    .line 239
    .line 240
    move-wide/from16 v22, v6

    .line 241
    .line 242
    iget-wide v6, v3, Lo2/a;->a:D

    .line 243
    .line 244
    move-wide/from16 v24, v6

    .line 245
    .line 246
    iget-wide v6, v4, Lo2/a;->a:D

    .line 247
    .line 248
    sub-double v6, v24, v6

    .line 249
    .line 250
    mul-double/2addr v6, v6

    .line 251
    move-wide/from16 v24, v6

    .line 252
    .line 253
    iget-wide v6, v3, Lo2/a;->b:D

    .line 254
    .line 255
    iget-wide v3, v4, Lo2/a;->b:D

    .line 256
    .line 257
    sub-double/2addr v6, v3

    .line 258
    mul-double/2addr v6, v6

    .line 259
    add-double v6, v6, v24

    .line 260
    .line 261
    if-eqz v18, :cond_3

    .line 262
    .line 263
    invoke-virtual/range {v18 .. v18}, Ljava/lang/Double;->doubleValue()D

    .line 264
    .line 265
    .line 266
    move-result-wide v3

    .line 267
    cmpg-double v3, v3, v6

    .line 268
    .line 269
    if-gez v3, :cond_2

    .line 270
    .line 271
    :goto_2
    move/from16 v4, p1

    .line 272
    .line 273
    move/from16 v1, v20

    .line 274
    .line 275
    move/from16 v3, v21

    .line 276
    .line 277
    move-wide/from16 v6, v22

    .line 278
    .line 279
    goto :goto_1

    .line 280
    :cond_2
    invoke-virtual {v12, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 281
    .line 282
    .line 283
    move-result-object v3

    .line 284
    check-cast v3, Lj2/e;

    .line 285
    .line 286
    iget-object v4, v1, Lj2/a;->a:Ls3/t;

    .line 287
    .line 288
    iget-object v3, v3, Lj2/e;->b:Ljava/util/LinkedHashSet;

    .line 289
    .line 290
    invoke-interface {v3, v4}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 291
    .line 292
    .line 293
    :cond_3
    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 294
    .line 295
    .line 296
    move-result-object v3

    .line 297
    invoke-virtual {v9, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    .line 299
    .line 300
    iget-object v3, v1, Lj2/a;->a:Ls3/t;

    .line 301
    .line 302
    iget-object v4, v0, Lj2/e;->b:Ljava/util/LinkedHashSet;

    .line 303
    .line 304
    invoke-interface {v4, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 305
    .line 306
    .line 307
    invoke-virtual {v12, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 308
    .line 309
    .line 310
    goto :goto_2

    .line 311
    :cond_4
    move-wide/from16 v22, v6

    .line 312
    .line 313
    invoke-interface {v5, v10}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 314
    .line 315
    .line 316
    move-object/from16 v1, p0

    .line 317
    .line 318
    move/from16 v4, p1

    .line 319
    .line 320
    move-object v0, v11

    .line 321
    move-wide/from16 v10, v16

    .line 322
    .line 323
    move-object/from16 v3, v19

    .line 324
    .line 325
    move-wide/from16 v6, v22

    .line 326
    .line 327
    goto/16 :goto_0

    .line 328
    .line 329
    :cond_5
    move-object v11, v0

    .line 330
    monitor-exit v13
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 331
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 332
    .line 333
    .line 334
    move-result-object v0

    .line 335
    invoke-virtual {v2, v0, v8}, Lp/i;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 336
    .line 337
    .line 338
    move-object v3, v8

    .line 339
    goto :goto_4

    .line 340
    :goto_3
    :try_start_1
    monitor-exit v13
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 341
    throw v0

    .line 342
    :cond_6
    move-object v11, v0

    .line 343
    :goto_4
    invoke-virtual {v11}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 344
    .line 345
    .line 346
    move-result-object v0

    .line 347
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 348
    .line 349
    .line 350
    :cond_7
    return-object v3
.end method

.method public final k(Ls3/t;)Z
    .locals 10

    .line 1
    iget-object v0, p0, Lj2/c;->b:Lj2/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    new-instance v6, Lj2/a;

    .line 7
    .line 8
    invoke-direct {v6, p1}, Lj2/a;-><init>(Ls3/t;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, v0, Lj2/b;->d:Lp2/b;

    .line 12
    .line 13
    monitor-enter p1

    .line 14
    :try_start_0
    iget-object v1, v0, Lj2/b;->c:Ljava/util/LinkedHashSet;

    .line 15
    .line 16
    invoke-interface {v1, v6}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v7

    .line 20
    if-eqz v7, :cond_0

    .line 21
    .line 22
    iget-object v1, v0, Lj2/b;->d:Lp2/b;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    iget-object v0, v6, Lj2/a;->b:Lo2/a;

    .line 28
    .line 29
    iget-object v2, v1, Lp2/b;->a:Lm2/a;

    .line 30
    .line 31
    iget-wide v3, v0, Lo2/a;->a:D

    .line 32
    .line 33
    iget-wide v8, v0, Lo2/a;->b:D

    .line 34
    .line 35
    invoke-virtual {v2, v3, v4, v8, v9}, Lm2/a;->a(DD)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_0

    .line 40
    .line 41
    iget-wide v2, v0, Lo2/a;->a:D

    .line 42
    .line 43
    iget-wide v4, v0, Lo2/a;->b:D

    .line 44
    .line 45
    invoke-virtual/range {v1 .. v6}, Lp2/b;->b(DDLj2/a;)Z

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catchall_0
    move-exception v0

    .line 50
    goto :goto_1

    .line 51
    :cond_0
    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    if-eqz v7, :cond_1

    .line 53
    .line 54
    iget-object p1, p0, Lj2/c;->c:Lp/i;

    .line 55
    .line 56
    const/4 v0, -0x1

    .line 57
    invoke-virtual {p1, v0}, Lp/i;->c(I)V

    .line 58
    .line 59
    .line 60
    :cond_1
    return v7

    .line 61
    :goto_1
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 62
    throw v0
.end method
