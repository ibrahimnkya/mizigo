.class public final LZ1/e;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final h:LZ1/a;

.field public static final i:LZ1/m;

.field public static final j:LZ1/n;


# instance fields
.field public final a:Ljava/lang/ThreadLocal;

.field public final b:Ljava/util/concurrent/ConcurrentHashMap;

.field public final c:LZ2/s;

.field public final d:Lc2/l;

.field public final e:Ljava/util/List;

.field public final f:Z

.field public final g:LZ1/a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, LZ1/a;->d:LZ1/a;

    .line 2
    .line 3
    sput-object v0, LZ1/e;->h:LZ1/a;

    .line 4
    .line 5
    sget-object v0, LZ1/q;->e:LZ1/m;

    .line 6
    .line 7
    sput-object v0, LZ1/e;->i:LZ1/m;

    .line 8
    .line 9
    sget-object v0, LZ1/q;->f:LZ1/n;

    .line 10
    .line 11
    sput-object v0, LZ1/e;->j:LZ1/n;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Lb2/h;Ljava/util/HashMap;LZ1/a;Ljava/util/ArrayList;LZ1/q;LZ1/q;Ljava/util/ArrayList;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/ThreadLocal;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, LZ1/e;->a:Ljava/lang/ThreadLocal;

    .line 10
    .line 11
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, LZ1/e;->b:Ljava/util/concurrent/ConcurrentHashMap;

    .line 17
    .line 18
    new-instance v0, LZ2/s;

    .line 19
    .line 20
    invoke-direct {v0, p2, p7}, LZ2/s;-><init>(Ljava/util/HashMap;Ljava/util/ArrayList;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, LZ1/e;->c:LZ2/s;

    .line 24
    .line 25
    const/4 p2, 0x1

    .line 26
    iput-boolean p2, p0, LZ1/e;->f:Z

    .line 27
    .line 28
    iput-object p3, p0, LZ1/e;->g:LZ1/a;

    .line 29
    .line 30
    new-instance p2, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    sget-object p3, Lc2/i0;->A:Lc2/Y;

    .line 36
    .line 37
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    sget-object p3, LZ1/q;->e:LZ1/m;

    .line 41
    .line 42
    if-ne p5, p3, :cond_0

    .line 43
    .line 44
    sget-object p3, Lc2/u;->c:Lc2/s;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    new-instance p3, Lc2/s;

    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    invoke-direct {p3, v1, p5}, Lc2/s;-><init>(ILjava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    :goto_0
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 60
    .line 61
    .line 62
    sget-object p3, Lc2/i0;->p:Lc2/Y;

    .line 63
    .line 64
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    sget-object p3, Lc2/i0;->g:Lc2/a0;

    .line 68
    .line 69
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    sget-object p3, Lc2/i0;->d:Lc2/a0;

    .line 73
    .line 74
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    sget-object p3, Lc2/i0;->e:Lc2/a0;

    .line 78
    .line 79
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    sget-object p3, Lc2/i0;->f:Lc2/a0;

    .line 83
    .line 84
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    sget-object p3, Lc2/i0;->k:Lc2/F;

    .line 88
    .line 89
    new-instance p4, Lc2/a0;

    .line 90
    .line 91
    sget-object p5, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    .line 92
    .line 93
    const-class v1, Ljava/lang/Long;

    .line 94
    .line 95
    invoke-direct {p4, p5, v1, p3}, Lc2/a0;-><init>(Ljava/lang/Class;Ljava/lang/Class;LZ1/s;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    new-instance p4, LZ1/b;

    .line 102
    .line 103
    const/4 p5, 0x0

    .line 104
    invoke-direct {p4, p5}, LZ1/b;-><init>(I)V

    .line 105
    .line 106
    .line 107
    new-instance p5, Lc2/a0;

    .line 108
    .line 109
    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    .line 110
    .line 111
    const-class v2, Ljava/lang/Double;

    .line 112
    .line 113
    invoke-direct {p5, v1, v2, p4}, Lc2/a0;-><init>(Ljava/lang/Class;Ljava/lang/Class;LZ1/s;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p2, p5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    new-instance p4, LZ1/b;

    .line 120
    .line 121
    const/4 p5, 0x1

    .line 122
    invoke-direct {p4, p5}, LZ1/b;-><init>(I)V

    .line 123
    .line 124
    .line 125
    new-instance p5, Lc2/a0;

    .line 126
    .line 127
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 128
    .line 129
    const-class v2, Ljava/lang/Float;

    .line 130
    .line 131
    invoke-direct {p5, v1, v2, p4}, Lc2/a0;-><init>(Ljava/lang/Class;Ljava/lang/Class;LZ1/s;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p2, p5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    sget-object p4, LZ1/q;->f:LZ1/n;

    .line 138
    .line 139
    if-ne p6, p4, :cond_1

    .line 140
    .line 141
    sget-object p4, Lc2/t;->b:Lc2/s;

    .line 142
    .line 143
    goto :goto_1

    .line 144
    :cond_1
    new-instance p4, Lc2/t;

    .line 145
    .line 146
    invoke-direct {p4, p6}, Lc2/t;-><init>(LZ1/q;)V

    .line 147
    .line 148
    .line 149
    new-instance p5, Lc2/s;

    .line 150
    .line 151
    const/4 p6, 0x0

    .line 152
    invoke-direct {p5, p6, p4}, Lc2/s;-><init>(ILjava/lang/Object;)V

    .line 153
    .line 154
    .line 155
    move-object p4, p5

    .line 156
    :goto_1
    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    sget-object p4, Lc2/i0;->h:Lc2/Y;

    .line 160
    .line 161
    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    sget-object p4, Lc2/i0;->i:Lc2/Y;

    .line 165
    .line 166
    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    new-instance p4, LZ1/c;

    .line 170
    .line 171
    const/4 p5, 0x0

    .line 172
    invoke-direct {p4, p3, p5}, LZ1/c;-><init>(LZ1/s;I)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p4}, LZ1/s;->a()LZ1/r;

    .line 176
    .line 177
    .line 178
    move-result-object p4

    .line 179
    new-instance p5, Lc2/Y;

    .line 180
    .line 181
    const/4 p6, 0x0

    .line 182
    const-class v1, Ljava/util/concurrent/atomic/AtomicLong;

    .line 183
    .line 184
    invoke-direct {p5, v1, p4, p6}, Lc2/Y;-><init>(Ljava/lang/Object;LZ1/s;I)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p2, p5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    new-instance p4, LZ1/c;

    .line 191
    .line 192
    const/4 p5, 0x1

    .line 193
    invoke-direct {p4, p3, p5}, LZ1/c;-><init>(LZ1/s;I)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {p4}, LZ1/s;->a()LZ1/r;

    .line 197
    .line 198
    .line 199
    move-result-object p3

    .line 200
    new-instance p4, Lc2/Y;

    .line 201
    .line 202
    const/4 p5, 0x0

    .line 203
    const-class p6, Ljava/util/concurrent/atomic/AtomicLongArray;

    .line 204
    .line 205
    invoke-direct {p4, p6, p3, p5}, Lc2/Y;-><init>(Ljava/lang/Object;LZ1/s;I)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    sget-object p3, Lc2/i0;->j:Lc2/Y;

    .line 212
    .line 213
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    sget-object p3, Lc2/i0;->l:Lc2/a0;

    .line 217
    .line 218
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 219
    .line 220
    .line 221
    sget-object p3, Lc2/i0;->q:Lc2/Y;

    .line 222
    .line 223
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    sget-object p3, Lc2/i0;->r:Lc2/Y;

    .line 227
    .line 228
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    sget-object p3, Lc2/i0;->m:Lc2/K;

    .line 232
    .line 233
    new-instance p4, Lc2/Y;

    .line 234
    .line 235
    const-class p6, Ljava/math/BigDecimal;

    .line 236
    .line 237
    invoke-direct {p4, p6, p3, p5}, Lc2/Y;-><init>(Ljava/lang/Object;LZ1/s;I)V

    .line 238
    .line 239
    .line 240
    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    sget-object p3, Lc2/i0;->n:Lc2/L;

    .line 244
    .line 245
    new-instance p4, Lc2/Y;

    .line 246
    .line 247
    const-class p6, Ljava/math/BigInteger;

    .line 248
    .line 249
    invoke-direct {p4, p6, p3, p5}, Lc2/Y;-><init>(Ljava/lang/Object;LZ1/s;I)V

    .line 250
    .line 251
    .line 252
    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 253
    .line 254
    .line 255
    sget-object p3, Lc2/i0;->o:Lc2/M;

    .line 256
    .line 257
    new-instance p4, Lc2/Y;

    .line 258
    .line 259
    const-class p6, Lb2/j;

    .line 260
    .line 261
    invoke-direct {p4, p6, p3, p5}, Lc2/Y;-><init>(Ljava/lang/Object;LZ1/s;I)V

    .line 262
    .line 263
    .line 264
    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 265
    .line 266
    .line 267
    sget-object p3, Lc2/i0;->s:Lc2/Y;

    .line 268
    .line 269
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 270
    .line 271
    .line 272
    sget-object p3, Lc2/i0;->t:Lc2/Y;

    .line 273
    .line 274
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 275
    .line 276
    .line 277
    sget-object p3, Lc2/i0;->v:Lc2/Y;

    .line 278
    .line 279
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 280
    .line 281
    .line 282
    sget-object p3, Lc2/i0;->w:Lc2/Y;

    .line 283
    .line 284
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 285
    .line 286
    .line 287
    sget-object p3, Lc2/i0;->y:Lc2/Y;

    .line 288
    .line 289
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 290
    .line 291
    .line 292
    sget-object p3, Lc2/i0;->u:Lc2/Y;

    .line 293
    .line 294
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 295
    .line 296
    .line 297
    sget-object p3, Lc2/i0;->b:Lc2/Y;

    .line 298
    .line 299
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 300
    .line 301
    .line 302
    sget-object p3, Lc2/h;->c:Lc2/e;

    .line 303
    .line 304
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 305
    .line 306
    .line 307
    sget-object p3, Lc2/i0;->x:Lc2/s;

    .line 308
    .line 309
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 310
    .line 311
    .line 312
    sget-boolean p3, Lf2/f;->a:Z

    .line 313
    .line 314
    if-eqz p3, :cond_2

    .line 315
    .line 316
    sget-object p3, Lf2/f;->c:Lf2/b$a;

    .line 317
    .line 318
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 319
    .line 320
    .line 321
    sget-object p3, Lf2/f;->b:Lf2/a$a;

    .line 322
    .line 323
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 324
    .line 325
    .line 326
    sget-object p3, Lf2/f;->d:Lf2/c;

    .line 327
    .line 328
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 329
    .line 330
    .line 331
    :cond_2
    sget-object p3, Lc2/b;->c:Lc2/a;

    .line 332
    .line 333
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 334
    .line 335
    .line 336
    sget-object p3, Lc2/i0;->a:Lc2/Y;

    .line 337
    .line 338
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 339
    .line 340
    .line 341
    new-instance p3, Lc2/d;

    .line 342
    .line 343
    const/4 p4, 0x0

    .line 344
    invoke-direct {p3, v0, p4}, Lc2/d;-><init>(LZ2/s;I)V

    .line 345
    .line 346
    .line 347
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 348
    .line 349
    .line 350
    new-instance p3, Lc2/d;

    .line 351
    .line 352
    const/4 p4, 0x1

    .line 353
    invoke-direct {p3, v0, p4}, Lc2/d;-><init>(LZ2/s;I)V

    .line 354
    .line 355
    .line 356
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 357
    .line 358
    .line 359
    new-instance p3, Lc2/l;

    .line 360
    .line 361
    invoke-direct {p3, v0}, Lc2/l;-><init>(LZ2/s;)V

    .line 362
    .line 363
    .line 364
    iput-object p3, p0, LZ1/e;->d:Lc2/l;

    .line 365
    .line 366
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 367
    .line 368
    .line 369
    sget-object p4, Lc2/i0;->B:Lc2/i;

    .line 370
    .line 371
    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 372
    .line 373
    .line 374
    new-instance p4, Lc2/A;

    .line 375
    .line 376
    invoke-direct {p4, v0, p1, p3, p7}, Lc2/A;-><init>(LZ2/s;Lb2/h;Lc2/l;Ljava/util/ArrayList;)V

    .line 377
    .line 378
    .line 379
    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 380
    .line 381
    .line 382
    invoke-static {p2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 383
    .line 384
    .line 385
    move-result-object p1

    .line 386
    iput-object p1, p0, LZ1/e;->e:Ljava/util/List;

    .line 387
    .line 388
    return-void
.end method

.method public static a(D)V
    .locals 2

    .line 1
    invoke-static {p0, p1}, Ljava/lang/Double;->isNaN(D)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0, p1}, Ljava/lang/Double;->isInfinite(D)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 15
    .line 16
    new-instance v1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string p0, " is not a valid double value as per JSON specification. To override this behavior, use GsonBuilder.serializeSpecialFloatingPointValues() method."

    .line 25
    .line 26
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    throw v0
.end method


# virtual methods
.method public final b(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;
    .locals 4

    .line 1
    new-instance v0, Lg2/a;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Lg2/a;-><init>(Ljava/lang/reflect/Type;)V

    .line 4
    .line 5
    .line 6
    const/4 p2, 0x0

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    return-object p2

    .line 10
    :cond_0
    new-instance v1, Ljava/io/StringReader;

    .line 11
    .line 12
    invoke-direct {v1, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    new-instance p1, Lh2/a;

    .line 16
    .line 17
    invoke-direct {p1, v1}, Lh2/a;-><init>(Ljava/io/Reader;)V

    .line 18
    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    iput v1, p1, Lh2/a;->s:I

    .line 22
    .line 23
    const-string v2, "AssertionError (GSON 2.12.0): "

    .line 24
    .line 25
    const/4 v3, 0x1

    .line 26
    iput v3, p1, Lh2/a;->s:I

    .line 27
    .line 28
    :try_start_0
    invoke-virtual {p1}, Lh2/a;->x()I

    .line 29
    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    invoke-virtual {p0, v0}, LZ1/e;->c(Lg2/a;)LZ1/s;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0, p1}, LZ1/s;->b(Lh2/a;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p2
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/AssertionError; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    :goto_0
    iput v1, p1, Lh2/a;->s:I

    .line 41
    .line 42
    goto :goto_5

    .line 43
    :catchall_0
    move-exception p2

    .line 44
    goto :goto_9

    .line 45
    :catch_0
    move-exception p2

    .line 46
    goto :goto_1

    .line 47
    :catch_1
    move-exception p2

    .line 48
    goto :goto_2

    .line 49
    :catch_2
    move-exception p2

    .line 50
    goto :goto_3

    .line 51
    :catch_3
    move-exception v0

    .line 52
    goto :goto_4

    .line 53
    :goto_1
    :try_start_1
    new-instance v0, Ljava/lang/AssertionError;

    .line 54
    .line 55
    new-instance v3, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-direct {v0, v2, p2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 72
    .line 73
    .line 74
    throw v0

    .line 75
    :goto_2
    new-instance v0, LZ1/i;

    .line 76
    .line 77
    invoke-direct {v0, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    throw v0

    .line 81
    :goto_3
    new-instance v0, LZ1/i;

    .line 82
    .line 83
    invoke-direct {v0, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 84
    .line 85
    .line 86
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 87
    :goto_4
    if-eqz v3, :cond_3

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :goto_5
    if-eqz p2, :cond_2

    .line 91
    .line 92
    :try_start_2
    invoke-virtual {p1}, Lh2/a;->x()I

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    const/16 v0, 0xa

    .line 97
    .line 98
    if-ne p1, v0, :cond_1

    .line 99
    .line 100
    goto :goto_8

    .line 101
    :cond_1
    new-instance p1, LZ1/i;

    .line 102
    .line 103
    const-string p2, "JSON document was not fully consumed."

    .line 104
    .line 105
    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    throw p1
    :try_end_2
    .catch Lh2/c; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4

    .line 109
    :catch_4
    move-exception p1

    .line 110
    goto :goto_6

    .line 111
    :catch_5
    move-exception p1

    .line 112
    goto :goto_7

    .line 113
    :goto_6
    new-instance p2, LZ1/i;

    .line 114
    .line 115
    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 116
    .line 117
    .line 118
    throw p2

    .line 119
    :goto_7
    new-instance p2, LZ1/i;

    .line 120
    .line 121
    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 122
    .line 123
    .line 124
    throw p2

    .line 125
    :cond_2
    :goto_8
    return-object p2

    .line 126
    :cond_3
    :try_start_3
    new-instance p2, LZ1/i;

    .line 127
    .line 128
    invoke-direct {p2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 129
    .line 130
    .line 131
    throw p2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 132
    :goto_9
    iput v1, p1, Lh2/a;->s:I

    .line 133
    .line 134
    throw p2
.end method

.method public final c(Lg2/a;)LZ1/s;
    .locals 8

    .line 1
    const-string v0, "type must not be null"

    .line 2
    .line 3
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LZ1/e;->b:Ljava/util/concurrent/ConcurrentHashMap;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, LZ1/s;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    return-object v1

    .line 17
    :cond_0
    iget-object v1, p0, LZ1/e;->a:Ljava/lang/ThreadLocal;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Ljava/util/Map;

    .line 24
    .line 25
    if-nez v2, :cond_1

    .line 26
    .line 27
    new-instance v2, Ljava/util/HashMap;

    .line 28
    .line 29
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    const/4 v3, 0x1

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    check-cast v3, LZ1/s;

    .line 42
    .line 43
    if-eqz v3, :cond_2

    .line 44
    .line 45
    return-object v3

    .line 46
    :cond_2
    const/4 v3, 0x0

    .line 47
    :goto_0
    :try_start_0
    new-instance v4, LZ1/d;

    .line 48
    .line 49
    invoke-direct {v4}, LZ1/d;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-interface {v2, p1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    iget-object v5, p0, LZ1/e;->e:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    const/4 v6, 0x0

    .line 62
    :cond_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 63
    .line 64
    .line 65
    move-result v7

    .line 66
    if-eqz v7, :cond_5

    .line 67
    .line 68
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    check-cast v6, LZ1/t;

    .line 73
    .line 74
    invoke-interface {v6, p0, p1}, LZ1/t;->create(LZ1/e;Lg2/a;)LZ1/s;

    .line 75
    .line 76
    .line 77
    move-result-object v6

    .line 78
    if-eqz v6, :cond_3

    .line 79
    .line 80
    iget-object v5, v4, LZ1/d;->a:LZ1/s;

    .line 81
    .line 82
    if-nez v5, :cond_4

    .line 83
    .line 84
    iput-object v6, v4, LZ1/d;->a:LZ1/s;

    .line 85
    .line 86
    invoke-interface {v2, p1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    goto :goto_1

    .line 90
    :catchall_0
    move-exception p1

    .line 91
    goto :goto_2

    .line 92
    :cond_4
    new-instance p1, Ljava/lang/AssertionError;

    .line 93
    .line 94
    const-string v0, "Delegate is already set"

    .line 95
    .line 96
    invoke-direct {p1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    throw p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 100
    :cond_5
    :goto_1
    if-eqz v3, :cond_6

    .line 101
    .line 102
    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->remove()V

    .line 103
    .line 104
    .line 105
    :cond_6
    if-eqz v6, :cond_8

    .line 106
    .line 107
    if-eqz v3, :cond_7

    .line 108
    .line 109
    invoke-virtual {v0, v2}, Ljava/util/concurrent/ConcurrentHashMap;->putAll(Ljava/util/Map;)V

    .line 110
    .line 111
    .line 112
    :cond_7
    return-object v6

    .line 113
    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 114
    .line 115
    new-instance v1, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    const-string v2, "GSON (2.12.0) cannot handle "

    .line 118
    .line 119
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    throw v0

    .line 133
    :goto_2
    if-eqz v3, :cond_9

    .line 134
    .line 135
    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->remove()V

    .line 136
    .line 137
    .line 138
    :cond_9
    throw p1
.end method

.method public final d(LZ1/t;Lg2/a;)LZ1/s;
    .locals 6

    .line 1
    const-string v0, "skipPast must not be null"

    .line 2
    .line 3
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    const-string v0, "type must not be null"

    .line 7
    .line 8
    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, LZ1/e;->d:Lc2/l;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    iget-object v1, v0, Lc2/l;->f:Ljava/util/concurrent/ConcurrentHashMap;

    .line 17
    .line 18
    sget-object v2, Lc2/l;->g:Lc2/k;

    .line 19
    .line 20
    if-ne p1, v2, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v2, p2, Lg2/a;->a:Ljava/lang/Class;

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, LZ1/t;

    .line 30
    .line 31
    if-eqz v3, :cond_1

    .line 32
    .line 33
    if-ne v3, p1, :cond_5

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const-class v3, La2/a;

    .line 37
    .line 38
    invoke-virtual {v2, v3}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    check-cast v3, La2/a;

    .line 43
    .line 44
    if-nez v3, :cond_2

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    invoke-interface {v3}, La2/a;->value()Ljava/lang/Class;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    const-class v4, LZ1/t;

    .line 52
    .line 53
    invoke-virtual {v4, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    if-nez v4, :cond_3

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_3
    iget-object v4, v0, Lc2/l;->e:LZ2/s;

    .line 61
    .line 62
    new-instance v5, Lg2/a;

    .line 63
    .line 64
    invoke-direct {v5, v3}, Lg2/a;-><init>(Ljava/lang/reflect/Type;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v4, v5}, LZ2/s;->z(Lg2/a;)Lb2/o;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-interface {v3}, Lb2/o;->g()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    check-cast v3, LZ1/t;

    .line 76
    .line 77
    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    check-cast v1, LZ1/t;

    .line 82
    .line 83
    if-eqz v1, :cond_4

    .line 84
    .line 85
    move-object v3, v1

    .line 86
    :cond_4
    if-ne v3, p1, :cond_5

    .line 87
    .line 88
    :goto_0
    move-object p1, v0

    .line 89
    :cond_5
    :goto_1
    iget-object v0, p0, LZ1/e;->e:Ljava/util/List;

    .line 90
    .line 91
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    const/4 v1, 0x0

    .line 96
    :cond_6
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    if-eqz v2, :cond_8

    .line 101
    .line 102
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    check-cast v2, LZ1/t;

    .line 107
    .line 108
    if-nez v1, :cond_7

    .line 109
    .line 110
    if-ne v2, p1, :cond_6

    .line 111
    .line 112
    const/4 v1, 0x1

    .line 113
    goto :goto_2

    .line 114
    :cond_7
    invoke-interface {v2, p0, p2}, LZ1/t;->create(LZ1/e;Lg2/a;)LZ1/s;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    if-eqz v2, :cond_6

    .line 119
    .line 120
    return-object v2

    .line 121
    :cond_8
    if-nez v1, :cond_9

    .line 122
    .line 123
    invoke-virtual {p0, p2}, LZ1/e;->c(Lg2/a;)LZ1/s;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    return-object p1

    .line 128
    :cond_9
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 129
    .line 130
    new-instance v0, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    const-string v1, "GSON cannot serialize or deserialize "

    .line 133
    .line 134
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    throw p1
.end method

.method public final e(Ljava/io/Writer;)Lh2/b;
    .locals 1

    .line 1
    new-instance v0, Lh2/b;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lh2/b;-><init>(Ljava/io/Writer;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, LZ1/e;->g:LZ1/a;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lh2/b;->k(LZ1/a;)V

    .line 9
    .line 10
    .line 11
    iget-boolean p1, p0, LZ1/e;->f:Z

    .line 12
    .line 13
    iput-boolean p1, v0, Lh2/b;->m:Z

    .line 14
    .line 15
    const/4 p1, 0x2

    .line 16
    invoke-virtual {v0, p1}, Lh2/b;->l(I)V

    .line 17
    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    iput-boolean p1, v0, Lh2/b;->o:Z

    .line 21
    .line 22
    return-object v0
.end method

.method public final f(Ljava/io/Serializable;)Ljava/lang/String;
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Ljava/io/StringWriter;

    .line 4
    .line 5
    invoke-direct {p1}, Ljava/io/StringWriter;-><init>()V

    .line 6
    .line 7
    .line 8
    :try_start_0
    invoke-virtual {p0, p1}, LZ1/e;->e(Ljava/io/Writer;)Lh2/b;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, LZ1/e;->g(Lh2/b;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    return-object p1

    .line 20
    :catch_0
    move-exception p1

    .line 21
    new-instance v0, LZ1/i;

    .line 22
    .line 23
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    throw v0

    .line 27
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ljava/io/StringWriter;

    .line 32
    .line 33
    invoke-direct {v1}, Ljava/io/StringWriter;-><init>()V

    .line 34
    .line 35
    .line 36
    :try_start_1
    invoke-virtual {p0, v1}, LZ1/e;->e(Ljava/io/Writer;)Lh2/b;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {p0, p1, v0, v2}, LZ1/e;->h(Ljava/lang/Object;Ljava/lang/Class;Lh2/b;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    return-object p1

    .line 48
    :catch_1
    move-exception p1

    .line 49
    new-instance v0, LZ1/i;

    .line 50
    .line 51
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    throw v0
.end method

.method public final g(Lh2/b;)V
    .locals 7

    .line 1
    sget-object v0, LZ1/j;->e:LZ1/j;

    .line 2
    .line 3
    const-string v1, "AssertionError (GSON 2.12.0): "

    .line 4
    .line 5
    iget v2, p1, Lh2/b;->l:I

    .line 6
    .line 7
    iget-boolean v3, p1, Lh2/b;->m:Z

    .line 8
    .line 9
    iget-boolean v4, p1, Lh2/b;->o:Z

    .line 10
    .line 11
    iget-boolean v5, p0, LZ1/e;->f:Z

    .line 12
    .line 13
    iput-boolean v5, p1, Lh2/b;->m:Z

    .line 14
    .line 15
    const/4 v5, 0x0

    .line 16
    iput-boolean v5, p1, Lh2/b;->o:Z

    .line 17
    .line 18
    const/4 v5, 0x2

    .line 19
    if-ne v2, v5, :cond_0

    .line 20
    .line 21
    const/4 v5, 0x1

    .line 22
    iput v5, p1, Lh2/b;->l:I

    .line 23
    .line 24
    :cond_0
    :try_start_0
    sget-object v5, Lc2/i0;->z:Lc2/m;

    .line 25
    .line 26
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    invoke-static {p1, v0}, Lc2/m;->e(Lh2/b;LZ1/h;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/AssertionError; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v2}, Lh2/b;->l(I)V

    .line 33
    .line 34
    .line 35
    iput-boolean v3, p1, Lh2/b;->m:Z

    .line 36
    .line 37
    iput-boolean v4, p1, Lh2/b;->o:Z

    .line 38
    .line 39
    return-void

    .line 40
    :catch_0
    move-exception v0

    .line 41
    :try_start_1
    new-instance v5, Ljava/lang/AssertionError;

    .line 42
    .line 43
    new-instance v6, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-direct {v5, v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 60
    .line 61
    .line 62
    throw v5

    .line 63
    :catchall_0
    move-exception v0

    .line 64
    goto :goto_0

    .line 65
    :catch_1
    move-exception v0

    .line 66
    new-instance v1, LZ1/i;

    .line 67
    .line 68
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 69
    .line 70
    .line 71
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 72
    :goto_0
    invoke-virtual {p1, v2}, Lh2/b;->l(I)V

    .line 73
    .line 74
    .line 75
    iput-boolean v3, p1, Lh2/b;->m:Z

    .line 76
    .line 77
    iput-boolean v4, p1, Lh2/b;->o:Z

    .line 78
    .line 79
    throw v0
.end method

.method public final h(Ljava/lang/Object;Ljava/lang/Class;Lh2/b;)V
    .locals 5

    .line 1
    const-string v0, "AssertionError (GSON 2.12.0): "

    .line 2
    .line 3
    new-instance v1, Lg2/a;

    .line 4
    .line 5
    invoke-direct {v1, p2}, Lg2/a;-><init>(Ljava/lang/reflect/Type;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v1}, LZ1/e;->c(Lg2/a;)LZ1/s;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    iget v1, p3, Lh2/b;->l:I

    .line 13
    .line 14
    const/4 v2, 0x2

    .line 15
    if-ne v1, v2, :cond_0

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    iput v2, p3, Lh2/b;->l:I

    .line 19
    .line 20
    :cond_0
    iget-boolean v2, p3, Lh2/b;->m:Z

    .line 21
    .line 22
    iget-boolean v3, p3, Lh2/b;->o:Z

    .line 23
    .line 24
    iget-boolean v4, p0, LZ1/e;->f:Z

    .line 25
    .line 26
    iput-boolean v4, p3, Lh2/b;->m:Z

    .line 27
    .line 28
    const/4 v4, 0x0

    .line 29
    iput-boolean v4, p3, Lh2/b;->o:Z

    .line 30
    .line 31
    :try_start_0
    invoke-virtual {p2, p3, p1}, LZ1/s;->c(Lh2/b;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/AssertionError; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    .line 33
    .line 34
    invoke-virtual {p3, v1}, Lh2/b;->l(I)V

    .line 35
    .line 36
    .line 37
    iput-boolean v2, p3, Lh2/b;->m:Z

    .line 38
    .line 39
    iput-boolean v3, p3, Lh2/b;->o:Z

    .line 40
    .line 41
    return-void

    .line 42
    :catchall_0
    move-exception p1

    .line 43
    goto :goto_0

    .line 44
    :catch_0
    move-exception p1

    .line 45
    :try_start_1
    new-instance p2, Ljava/lang/AssertionError;

    .line 46
    .line 47
    new-instance v4, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-direct {p2, v0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 64
    .line 65
    .line 66
    throw p2

    .line 67
    :catch_1
    move-exception p1

    .line 68
    new-instance p2, LZ1/i;

    .line 69
    .line 70
    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 71
    .line 72
    .line 73
    throw p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 74
    :goto_0
    invoke-virtual {p3, v1}, Lh2/b;->l(I)V

    .line 75
    .line 76
    .line 77
    iput-boolean v2, p3, Lh2/b;->m:Z

    .line 78
    .line 79
    iput-boolean v3, p3, Lh2/b;->o:Z

    .line 80
    .line 81
    throw p1
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "{serializeNulls:false,factories:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, LZ1/e;->e:Ljava/util/List;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ",instanceCreators:"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, LZ1/e;->c:LZ2/s;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "}"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    return-object v0
.end method
