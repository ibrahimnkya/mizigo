.class public final LQ3/q;
.super LR3/b;
.source "SourceFile"

# interfaces
.implements LQ3/d;
.implements LQ3/e;
.implements LR3/i;


# static fields
.field public static final synthetic i:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;


# instance fields
.field private volatile synthetic _state$volatile:Ljava/lang/Object;

.field public h:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-class v0, Ljava/lang/Object;

    .line 2
    .line 3
    const-string v1, "_state$volatile"

    .line 4
    .line 5
    const-class v2, LQ3/q;

    .line 6
    .line 7
    invoke-static {v2, v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, LQ3/q;->i:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LQ3/q;->_state$volatile:Ljava/lang/Object;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .locals 2

    .line 1
    sget-object v0, LQ3/q;->i:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, LR3/k;->a:LE/i;

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    :cond_0
    return-object v0
.end method

.method public final b(Ljava/lang/Object;LA3/d;)Ljava/lang/Object;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p1, LR3/k;->a:LE/i;

    .line 4
    .line 5
    :cond_0
    const/4 p2, 0x0

    .line 6
    invoke-virtual {p0, p2, p1}, LQ3/q;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    sget-object p1, Ly3/h;->a:Ly3/h;

    .line 10
    .line 11
    return-object p1
.end method

.method public final c(LQ3/e;LA3/d;)Ljava/lang/Object;
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p2

    .line 4
    .line 5
    instance-of v2, v0, LQ3/p;

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    move-object v2, v0

    .line 10
    check-cast v2, LQ3/p;

    .line 11
    .line 12
    iget v3, v2, LQ3/p;->o:I

    .line 13
    .line 14
    const/high16 v4, -0x80000000

    .line 15
    .line 16
    and-int v5, v3, v4

    .line 17
    .line 18
    if-eqz v5, :cond_0

    .line 19
    .line 20
    sub-int/2addr v3, v4

    .line 21
    iput v3, v2, LQ3/p;->o:I

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    new-instance v2, LQ3/p;

    .line 25
    .line 26
    invoke-direct {v2, v1, v0}, LQ3/p;-><init>(LQ3/q;LA3/d;)V

    .line 27
    .line 28
    .line 29
    :goto_0
    iget-object v0, v2, LQ3/p;->m:Ljava/lang/Object;

    .line 30
    .line 31
    sget-object v3, LB3/a;->e:LB3/a;

    .line 32
    .line 33
    iget v4, v2, LQ3/p;->o:I

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    const/4 v6, 0x0

    .line 37
    const/4 v7, 0x0

    .line 38
    const/4 v8, 0x2

    .line 39
    const/4 v9, 0x1

    .line 40
    if-eqz v4, :cond_4

    .line 41
    .line 42
    if-eq v4, v9, :cond_3

    .line 43
    .line 44
    if-eq v4, v8, :cond_2

    .line 45
    .line 46
    if-ne v4, v5, :cond_1

    .line 47
    .line 48
    iget-object v4, v2, LQ3/p;->l:Ljava/lang/Object;

    .line 49
    .line 50
    iget-object v10, v2, LQ3/p;->k:LN3/P;

    .line 51
    .line 52
    iget-object v11, v2, LQ3/p;->j:LQ3/s;

    .line 53
    .line 54
    iget-object v12, v2, LQ3/p;->i:LQ3/e;

    .line 55
    .line 56
    iget-object v13, v2, LQ3/p;->h:LQ3/q;

    .line 57
    .line 58
    :try_start_0
    invoke-static {v0}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    .line 60
    .line 61
    move-object v0, v4

    .line 62
    goto/16 :goto_b

    .line 63
    .line 64
    :catchall_0
    move-exception v0

    .line 65
    goto/16 :goto_c

    .line 66
    .line 67
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 68
    .line 69
    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 70
    .line 71
    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    throw v0

    .line 75
    :cond_2
    iget-object v4, v2, LQ3/p;->l:Ljava/lang/Object;

    .line 76
    .line 77
    iget-object v10, v2, LQ3/p;->k:LN3/P;

    .line 78
    .line 79
    iget-object v11, v2, LQ3/p;->j:LQ3/s;

    .line 80
    .line 81
    iget-object v12, v2, LQ3/p;->i:LQ3/e;

    .line 82
    .line 83
    iget-object v13, v2, LQ3/p;->h:LQ3/q;

    .line 84
    .line 85
    :try_start_1
    invoke-static {v0}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 86
    .line 87
    .line 88
    goto/16 :goto_7

    .line 89
    .line 90
    :cond_3
    iget-object v11, v2, LQ3/p;->j:LQ3/s;

    .line 91
    .line 92
    iget-object v4, v2, LQ3/p;->i:LQ3/e;

    .line 93
    .line 94
    iget-object v13, v2, LQ3/p;->h:LQ3/q;

    .line 95
    .line 96
    :try_start_2
    invoke-static {v0}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 97
    .line 98
    .line 99
    goto :goto_3

    .line 100
    :cond_4
    invoke-static {v0}, LV0/g;->E(Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    monitor-enter p0

    .line 104
    :try_start_3
    iget-object v0, v1, LR3/b;->e:[LQ3/s;

    .line 105
    .line 106
    if-nez v0, :cond_5

    .line 107
    .line 108
    new-array v0, v8, [LQ3/s;

    .line 109
    .line 110
    iput-object v0, v1, LR3/b;->e:[LQ3/s;

    .line 111
    .line 112
    goto :goto_1

    .line 113
    :catchall_1
    move-exception v0

    .line 114
    goto/16 :goto_f

    .line 115
    .line 116
    :cond_5
    iget v4, v1, LR3/b;->f:I

    .line 117
    .line 118
    array-length v10, v0

    .line 119
    if-lt v4, v10, :cond_6

    .line 120
    .line 121
    array-length v4, v0

    .line 122
    mul-int/2addr v4, v8

    .line 123
    invoke-static {v0, v4}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    const-string v4, "copyOf(...)"

    .line 128
    .line 129
    invoke-static {v0, v4}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    move-object v4, v0

    .line 133
    check-cast v4, [LQ3/s;

    .line 134
    .line 135
    iput-object v4, v1, LR3/b;->e:[LQ3/s;

    .line 136
    .line 137
    check-cast v0, [LQ3/s;

    .line 138
    .line 139
    :cond_6
    :goto_1
    iget v4, v1, LR3/b;->g:I

    .line 140
    .line 141
    :goto_2
    aget-object v10, v0, v4

    .line 142
    .line 143
    if-nez v10, :cond_7

    .line 144
    .line 145
    new-instance v10, LQ3/s;

    .line 146
    .line 147
    invoke-direct {v10}, LQ3/s;-><init>()V

    .line 148
    .line 149
    .line 150
    aput-object v10, v0, v4

    .line 151
    .line 152
    :cond_7
    add-int/lit8 v4, v4, 0x1

    .line 153
    .line 154
    array-length v11, v0

    .line 155
    if-lt v4, v11, :cond_8

    .line 156
    .line 157
    move v4, v7

    .line 158
    :cond_8
    iget-object v11, v10, LQ3/s;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 159
    .line 160
    invoke-virtual {v11}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v12

    .line 164
    if-eqz v12, :cond_9

    .line 165
    .line 166
    goto :goto_2

    .line 167
    :cond_9
    sget-object v0, LQ3/r;->a:LE/i;

    .line 168
    .line 169
    invoke-virtual {v11, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 170
    .line 171
    .line 172
    iput v4, v1, LR3/b;->g:I

    .line 173
    .line 174
    iget v0, v1, LR3/b;->f:I

    .line 175
    .line 176
    add-int/2addr v0, v9

    .line 177
    iput v0, v1, LR3/b;->f:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 178
    .line 179
    monitor-exit p0

    .line 180
    move-object/from16 v4, p1

    .line 181
    .line 182
    move-object v13, v1

    .line 183
    move-object v11, v10

    .line 184
    :goto_3
    :try_start_4
    iget-object v0, v2, LC3/c;->f:LA3/i;

    .line 185
    .line 186
    invoke-static {v0}, LI3/h;->b(Ljava/lang/Object;)V

    .line 187
    .line 188
    .line 189
    sget-object v10, LN3/s;->f:LN3/s;

    .line 190
    .line 191
    invoke-interface {v0, v10}, LA3/i;->m(LA3/h;)LA3/g;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    check-cast v0, LN3/P;

    .line 196
    .line 197
    move-object v10, v0

    .line 198
    move-object v12, v4

    .line 199
    move-object v0, v6

    .line 200
    :goto_4
    sget-object v4, LQ3/q;->i:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 201
    .line 202
    invoke-virtual {v4, v13}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object v4

    .line 206
    if-eqz v10, :cond_b

    .line 207
    .line 208
    invoke-interface {v10}, LN3/P;->b()Z

    .line 209
    .line 210
    .line 211
    move-result v14

    .line 212
    if-eqz v14, :cond_a

    .line 213
    .line 214
    goto :goto_5

    .line 215
    :cond_a
    invoke-interface {v10}, LN3/P;->l()Ljava/util/concurrent/CancellationException;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    throw v0

    .line 220
    :cond_b
    :goto_5
    if-eqz v0, :cond_c

    .line 221
    .line 222
    invoke-virtual {v0, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    move-result v14

    .line 226
    if-nez v14, :cond_f

    .line 227
    .line 228
    :cond_c
    sget-object v0, LR3/k;->a:LE/i;

    .line 229
    .line 230
    if-ne v4, v0, :cond_d

    .line 231
    .line 232
    move-object v0, v6

    .line 233
    goto :goto_6

    .line 234
    :cond_d
    move-object v0, v4

    .line 235
    :goto_6
    iput-object v13, v2, LQ3/p;->h:LQ3/q;

    .line 236
    .line 237
    iput-object v12, v2, LQ3/p;->i:LQ3/e;

    .line 238
    .line 239
    iput-object v11, v2, LQ3/p;->j:LQ3/s;

    .line 240
    .line 241
    iput-object v10, v2, LQ3/p;->k:LN3/P;

    .line 242
    .line 243
    iput-object v4, v2, LQ3/p;->l:Ljava/lang/Object;

    .line 244
    .line 245
    iput v8, v2, LQ3/p;->o:I

    .line 246
    .line 247
    invoke-interface {v12, v0, v2}, LQ3/e;->b(Ljava/lang/Object;LA3/d;)Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    if-ne v0, v3, :cond_e

    .line 252
    .line 253
    goto :goto_a

    .line 254
    :cond_e
    :goto_7
    move-object v0, v4

    .line 255
    :cond_f
    iget-object v4, v11, LQ3/s;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 256
    .line 257
    sget-object v14, LQ3/r;->a:LE/i;

    .line 258
    .line 259
    invoke-virtual {v4, v14}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    .line 261
    .line 262
    move-result-object v4

    .line 263
    invoke-static {v4}, LI3/h;->b(Ljava/lang/Object;)V

    .line 264
    .line 265
    .line 266
    sget-object v15, LQ3/r;->b:LE/i;

    .line 267
    .line 268
    if-ne v4, v15, :cond_10

    .line 269
    .line 270
    goto :goto_4

    .line 271
    :cond_10
    iput-object v13, v2, LQ3/p;->h:LQ3/q;

    .line 272
    .line 273
    iput-object v12, v2, LQ3/p;->i:LQ3/e;

    .line 274
    .line 275
    iput-object v11, v2, LQ3/p;->j:LQ3/s;

    .line 276
    .line 277
    iput-object v10, v2, LQ3/p;->k:LN3/P;

    .line 278
    .line 279
    iput-object v0, v2, LQ3/p;->l:Ljava/lang/Object;

    .line 280
    .line 281
    iput v5, v2, LQ3/p;->o:I

    .line 282
    .line 283
    sget-object v4, Ly3/h;->a:Ly3/h;

    .line 284
    .line 285
    new-instance v15, LN3/g;

    .line 286
    .line 287
    invoke-static {v2}, LV0/g;->s(LA3/d;)LA3/d;

    .line 288
    .line 289
    .line 290
    move-result-object v5

    .line 291
    invoke-direct {v15, v9, v5}, LN3/g;-><init>(ILA3/d;)V

    .line 292
    .line 293
    .line 294
    invoke-virtual {v15}, LN3/g;->u()V

    .line 295
    .line 296
    .line 297
    iget-object v5, v11, LQ3/s;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 298
    .line 299
    :goto_8
    invoke-virtual {v5, v14, v15}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 300
    .line 301
    .line 302
    move-result v16

    .line 303
    if-eqz v16, :cond_11

    .line 304
    .line 305
    goto :goto_9

    .line 306
    :cond_11
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 307
    .line 308
    .line 309
    move-result-object v8

    .line 310
    if-eq v8, v14, :cond_14

    .line 311
    .line 312
    invoke-virtual {v15, v4}, LN3/g;->g(Ljava/lang/Object;)V

    .line 313
    .line 314
    .line 315
    :goto_9
    invoke-virtual {v15}, LN3/g;->t()Ljava/lang/Object;

    .line 316
    .line 317
    .line 318
    move-result-object v5

    .line 319
    sget-object v8, LB3/a;->e:LB3/a;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 320
    .line 321
    if-ne v5, v8, :cond_12

    .line 322
    .line 323
    move-object v4, v5

    .line 324
    :cond_12
    if-ne v4, v3, :cond_13

    .line 325
    .line 326
    :goto_a
    return-object v3

    .line 327
    :cond_13
    :goto_b
    const/4 v5, 0x3

    .line 328
    const/4 v8, 0x2

    .line 329
    goto/16 :goto_4

    .line 330
    .line 331
    :cond_14
    const/4 v8, 0x2

    .line 332
    goto :goto_8

    .line 333
    :goto_c
    monitor-enter v13

    .line 334
    :try_start_5
    iget v2, v13, LR3/b;->f:I

    .line 335
    .line 336
    add-int/lit8 v2, v2, -0x1

    .line 337
    .line 338
    iput v2, v13, LR3/b;->f:I

    .line 339
    .line 340
    if-nez v2, :cond_15

    .line 341
    .line 342
    iput v7, v13, LR3/b;->g:I

    .line 343
    .line 344
    goto :goto_d

    .line 345
    :catchall_2
    move-exception v0

    .line 346
    goto :goto_e

    .line 347
    :cond_15
    :goto_d
    const-string v2, "null cannot be cast to non-null type kotlinx.coroutines.flow.internal.AbstractSharedFlowSlot<kotlin.Any>"

    .line 348
    .line 349
    invoke-static {v11, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 350
    .line 351
    .line 352
    iget-object v2, v11, LQ3/s;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 353
    .line 354
    invoke-virtual {v2, v6}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 355
    .line 356
    .line 357
    monitor-exit v13

    .line 358
    throw v0

    .line 359
    :goto_e
    monitor-exit v13

    .line 360
    throw v0

    .line 361
    :goto_f
    monitor-exit p0

    .line 362
    throw v0
.end method

.method public final d(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 9

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    sget-object v0, LQ3/q;->i:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 3
    .line 4
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-static {v1, p1}, LI3/h;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    monitor-exit p0

    .line 18
    return v2

    .line 19
    :catchall_0
    move-exception p1

    .line 20
    goto/16 :goto_5

    .line 21
    .line 22
    :cond_0
    :try_start_1
    invoke-static {v1, p2}, LI3/h;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    const/4 v1, 0x1

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    monitor-exit p0

    .line 30
    return v1

    .line 31
    :cond_1
    :try_start_2
    invoke-virtual {v0, p0, p2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    iget p1, p0, LQ3/q;->h:I

    .line 35
    .line 36
    and-int/lit8 p2, p1, 0x1

    .line 37
    .line 38
    if-nez p2, :cond_b

    .line 39
    .line 40
    add-int/2addr p1, v1

    .line 41
    iput p1, p0, LQ3/q;->h:I

    .line 42
    .line 43
    iget-object p2, p0, LR3/b;->e:[LQ3/s;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 44
    .line 45
    monitor-exit p0

    .line 46
    :goto_0
    if-eqz p2, :cond_9

    .line 47
    .line 48
    array-length v0, p2

    .line 49
    move v3, v2

    .line 50
    :goto_1
    if-ge v3, v0, :cond_9

    .line 51
    .line 52
    aget-object v4, p2, v3

    .line 53
    .line 54
    if-eqz v4, :cond_8

    .line 55
    .line 56
    iget-object v4, v4, LQ3/s;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 57
    .line 58
    :goto_2
    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    if-nez v5, :cond_2

    .line 63
    .line 64
    goto :goto_3

    .line 65
    :cond_2
    sget-object v6, LQ3/r;->b:LE/i;

    .line 66
    .line 67
    if-ne v5, v6, :cond_3

    .line 68
    .line 69
    goto :goto_3

    .line 70
    :cond_3
    sget-object v7, LQ3/r;->a:LE/i;

    .line 71
    .line 72
    if-ne v5, v7, :cond_6

    .line 73
    .line 74
    :cond_4
    invoke-virtual {v4, v5, v6}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v7

    .line 78
    if-eqz v7, :cond_5

    .line 79
    .line 80
    goto :goto_3

    .line 81
    :cond_5
    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v7

    .line 85
    if-eq v7, v5, :cond_4

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_6
    invoke-virtual {v4, v5, v7}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v6

    .line 92
    if-eqz v6, :cond_7

    .line 93
    .line 94
    check-cast v5, LN3/g;

    .line 95
    .line 96
    sget-object v4, Ly3/h;->a:Ly3/h;

    .line 97
    .line 98
    invoke-virtual {v5, v4}, LN3/g;->g(Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    goto :goto_3

    .line 102
    :cond_7
    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v6

    .line 106
    if-eq v6, v5, :cond_6

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_8
    :goto_3
    add-int/lit8 v3, v3, 0x1

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_9
    monitor-enter p0

    .line 113
    :try_start_3
    iget p2, p0, LQ3/q;->h:I

    .line 114
    .line 115
    if-ne p2, p1, :cond_a

    .line 116
    .line 117
    add-int/2addr p1, v1

    .line 118
    iput p1, p0, LQ3/q;->h:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 119
    .line 120
    monitor-exit p0

    .line 121
    return v1

    .line 122
    :catchall_1
    move-exception p1

    .line 123
    goto :goto_4

    .line 124
    :cond_a
    :try_start_4
    iget-object p1, p0, LR3/b;->e:[LQ3/s;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 125
    .line 126
    monitor-exit p0

    .line 127
    move v8, p2

    .line 128
    move-object p2, p1

    .line 129
    move p1, v8

    .line 130
    goto :goto_0

    .line 131
    :goto_4
    monitor-exit p0

    .line 132
    throw p1

    .line 133
    :cond_b
    add-int/lit8 p1, p1, 0x2

    .line 134
    .line 135
    :try_start_5
    iput p1, p0, LQ3/q;->h:I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 136
    .line 137
    monitor-exit p0

    .line 138
    return v1

    .line 139
    :goto_5
    monitor-exit p0

    .line 140
    throw p1
.end method
