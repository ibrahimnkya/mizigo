.class public final Landroidx/lifecycle/s;
.super Landroidx/lifecycle/l;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public b:Lo/a;

.field public c:Landroidx/lifecycle/k;

.field public final d:Ljava/lang/ref/WeakReference;

.field public e:I

.field public f:Z

.field public g:Z

.field public final h:Ljava/util/ArrayList;

.field public final i:LQ3/q;


# direct methods
.method public constructor <init>(Landroidx/lifecycle/q;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Landroidx/lifecycle/s;->a:Z

    .line 11
    .line 12
    new-instance v0, Lo/a;

    .line 13
    .line 14
    invoke-direct {v0}, Lo/a;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Landroidx/lifecycle/s;->b:Lo/a;

    .line 18
    .line 19
    sget-object v0, Landroidx/lifecycle/k;->f:Landroidx/lifecycle/k;

    .line 20
    .line 21
    iput-object v0, p0, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/k;

    .line 22
    .line 23
    new-instance v1, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Landroidx/lifecycle/s;->h:Ljava/util/ArrayList;

    .line 29
    .line 30
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 31
    .line 32
    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    iput-object v1, p0, Landroidx/lifecycle/s;->d:Ljava/lang/ref/WeakReference;

    .line 36
    .line 37
    new-instance p1, LQ3/q;

    .line 38
    .line 39
    invoke-direct {p1, v0}, LQ3/q;-><init>(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Landroidx/lifecycle/s;->i:LQ3/q;

    .line 43
    .line 44
    return-void
.end method


# virtual methods
.method public final a(Landroidx/lifecycle/p;)V
    .locals 9

    .line 1
    const-string v0, "observer"

    .line 2
    .line 3
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "addObserver"

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroidx/lifecycle/s;->d(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/k;

    .line 12
    .line 13
    sget-object v1, Landroidx/lifecycle/k;->e:Landroidx/lifecycle/k;

    .line 14
    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget-object v1, Landroidx/lifecycle/k;->f:Landroidx/lifecycle/k;

    .line 19
    .line 20
    :goto_0
    new-instance v0, Landroidx/lifecycle/r;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 23
    .line 24
    .line 25
    sget-object v2, Landroidx/lifecycle/t;->a:Ljava/util/HashMap;

    .line 26
    .line 27
    instance-of v2, p1, Landroidx/lifecycle/o;

    .line 28
    .line 29
    instance-of v3, p1, Landroidx/lifecycle/DefaultLifecycleObserver;

    .line 30
    .line 31
    const/4 v4, 0x2

    .line 32
    const/4 v5, 0x0

    .line 33
    const/4 v6, 0x0

    .line 34
    const/4 v7, 0x1

    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    if-eqz v3, :cond_1

    .line 38
    .line 39
    new-instance v2, Landroidx/lifecycle/e;

    .line 40
    .line 41
    move-object v3, p1

    .line 42
    check-cast v3, Landroidx/lifecycle/DefaultLifecycleObserver;

    .line 43
    .line 44
    move-object v8, p1

    .line 45
    check-cast v8, Landroidx/lifecycle/o;

    .line 46
    .line 47
    invoke-direct {v2, v3, v8}, Landroidx/lifecycle/e;-><init>(Landroidx/lifecycle/DefaultLifecycleObserver;Landroidx/lifecycle/o;)V

    .line 48
    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    if-eqz v3, :cond_2

    .line 52
    .line 53
    new-instance v2, Landroidx/lifecycle/e;

    .line 54
    .line 55
    move-object v3, p1

    .line 56
    check-cast v3, Landroidx/lifecycle/DefaultLifecycleObserver;

    .line 57
    .line 58
    invoke-direct {v2, v3, v5}, Landroidx/lifecycle/e;-><init>(Landroidx/lifecycle/DefaultLifecycleObserver;Landroidx/lifecycle/o;)V

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    if-eqz v2, :cond_3

    .line 63
    .line 64
    move-object v2, p1

    .line 65
    check-cast v2, Landroidx/lifecycle/o;

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-static {v2}, Landroidx/lifecycle/t;->c(Ljava/lang/Class;)I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    if-ne v3, v4, :cond_6

    .line 77
    .line 78
    sget-object v3, Landroidx/lifecycle/t;->b:Ljava/util/HashMap;

    .line 79
    .line 80
    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-static {v2}, LI3/h;->b(Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    check-cast v2, Ljava/util/List;

    .line 88
    .line 89
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    if-eq v3, v7, :cond_5

    .line 94
    .line 95
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    new-array v8, v3, [Landroidx/lifecycle/g;

    .line 100
    .line 101
    if-gtz v3, :cond_4

    .line 102
    .line 103
    new-instance v2, LY/a;

    .line 104
    .line 105
    invoke-direct {v2, v7, v8}, LY/a;-><init>(ILjava/lang/Object;)V

    .line 106
    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_4
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    check-cast v0, Ljava/lang/reflect/Constructor;

    .line 114
    .line 115
    invoke-static {v0, p1}, Landroidx/lifecycle/t;->a(Ljava/lang/reflect/Constructor;Landroidx/lifecycle/p;)V

    .line 116
    .line 117
    .line 118
    throw v5

    .line 119
    :cond_5
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    check-cast v0, Ljava/lang/reflect/Constructor;

    .line 124
    .line 125
    invoke-static {v0, p1}, Landroidx/lifecycle/t;->a(Ljava/lang/reflect/Constructor;Landroidx/lifecycle/p;)V

    .line 126
    .line 127
    .line 128
    throw v5

    .line 129
    :cond_6
    new-instance v2, Landroidx/lifecycle/e;

    .line 130
    .line 131
    invoke-direct {v2, p1}, Landroidx/lifecycle/e;-><init>(Landroidx/lifecycle/p;)V

    .line 132
    .line 133
    .line 134
    :goto_1
    iput-object v2, v0, Landroidx/lifecycle/r;->b:Landroidx/lifecycle/o;

    .line 135
    .line 136
    iput-object v1, v0, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/k;

    .line 137
    .line 138
    iget-object v1, p0, Landroidx/lifecycle/s;->b:Lo/a;

    .line 139
    .line 140
    invoke-virtual {v1, p1}, Lo/a;->b(Ljava/lang/Object;)Lo/c;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    if-eqz v2, :cond_7

    .line 145
    .line 146
    iget-object v1, v2, Lo/c;->f:Ljava/lang/Object;

    .line 147
    .line 148
    goto :goto_3

    .line 149
    :cond_7
    iget-object v2, v1, Lo/a;->i:Ljava/util/HashMap;

    .line 150
    .line 151
    new-instance v3, Lo/c;

    .line 152
    .line 153
    invoke-direct {v3, p1, v0}, Lo/c;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 154
    .line 155
    .line 156
    iget v8, v1, Lo/f;->h:I

    .line 157
    .line 158
    add-int/2addr v8, v7

    .line 159
    iput v8, v1, Lo/f;->h:I

    .line 160
    .line 161
    iget-object v8, v1, Lo/f;->f:Lo/c;

    .line 162
    .line 163
    if-nez v8, :cond_8

    .line 164
    .line 165
    iput-object v3, v1, Lo/f;->e:Lo/c;

    .line 166
    .line 167
    iput-object v3, v1, Lo/f;->f:Lo/c;

    .line 168
    .line 169
    goto :goto_2

    .line 170
    :cond_8
    iput-object v3, v8, Lo/c;->g:Lo/c;

    .line 171
    .line 172
    iput-object v8, v3, Lo/c;->h:Lo/c;

    .line 173
    .line 174
    iput-object v3, v1, Lo/f;->f:Lo/c;

    .line 175
    .line 176
    :goto_2
    invoke-virtual {v2, p1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-object v1, v5

    .line 180
    :goto_3
    check-cast v1, Landroidx/lifecycle/r;

    .line 181
    .line 182
    if-eqz v1, :cond_9

    .line 183
    .line 184
    goto :goto_4

    .line 185
    :cond_9
    iget-object v1, p0, Landroidx/lifecycle/s;->d:Ljava/lang/ref/WeakReference;

    .line 186
    .line 187
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    check-cast v1, Landroidx/lifecycle/q;

    .line 192
    .line 193
    if-nez v1, :cond_a

    .line 194
    .line 195
    :goto_4
    return-void

    .line 196
    :cond_a
    iget v2, p0, Landroidx/lifecycle/s;->e:I

    .line 197
    .line 198
    if-nez v2, :cond_b

    .line 199
    .line 200
    iget-boolean v2, p0, Landroidx/lifecycle/s;->f:Z

    .line 201
    .line 202
    if-eqz v2, :cond_c

    .line 203
    .line 204
    :cond_b
    move v6, v7

    .line 205
    :cond_c
    invoke-virtual {p0, p1}, Landroidx/lifecycle/s;->c(Landroidx/lifecycle/p;)Landroidx/lifecycle/k;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    iget v3, p0, Landroidx/lifecycle/s;->e:I

    .line 210
    .line 211
    add-int/2addr v3, v7

    .line 212
    iput v3, p0, Landroidx/lifecycle/s;->e:I

    .line 213
    .line 214
    :goto_5
    iget-object v3, v0, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/k;

    .line 215
    .line 216
    invoke-virtual {v3, v2}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 217
    .line 218
    .line 219
    move-result v2

    .line 220
    if-gez v2, :cond_11

    .line 221
    .line 222
    iget-object v2, p0, Landroidx/lifecycle/s;->b:Lo/a;

    .line 223
    .line 224
    iget-object v2, v2, Lo/a;->i:Ljava/util/HashMap;

    .line 225
    .line 226
    invoke-virtual {v2, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 227
    .line 228
    .line 229
    move-result v2

    .line 230
    if-eqz v2, :cond_11

    .line 231
    .line 232
    iget-object v2, v0, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/k;

    .line 233
    .line 234
    iget-object v3, p0, Landroidx/lifecycle/s;->h:Ljava/util/ArrayList;

    .line 235
    .line 236
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 237
    .line 238
    .line 239
    sget-object v2, Landroidx/lifecycle/j;->Companion:Landroidx/lifecycle/h;

    .line 240
    .line 241
    iget-object v8, v0, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/k;

    .line 242
    .line 243
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 244
    .line 245
    .line 246
    const-string v2, "state"

    .line 247
    .line 248
    invoke-static {v8, v2}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    invoke-virtual {v8}, Ljava/lang/Enum;->ordinal()I

    .line 252
    .line 253
    .line 254
    move-result v2

    .line 255
    if-eq v2, v7, :cond_f

    .line 256
    .line 257
    if-eq v2, v4, :cond_e

    .line 258
    .line 259
    const/4 v8, 0x3

    .line 260
    if-eq v2, v8, :cond_d

    .line 261
    .line 262
    move-object v2, v5

    .line 263
    goto :goto_6

    .line 264
    :cond_d
    sget-object v2, Landroidx/lifecycle/j;->ON_RESUME:Landroidx/lifecycle/j;

    .line 265
    .line 266
    goto :goto_6

    .line 267
    :cond_e
    sget-object v2, Landroidx/lifecycle/j;->ON_START:Landroidx/lifecycle/j;

    .line 268
    .line 269
    goto :goto_6

    .line 270
    :cond_f
    sget-object v2, Landroidx/lifecycle/j;->ON_CREATE:Landroidx/lifecycle/j;

    .line 271
    .line 272
    :goto_6
    if-eqz v2, :cond_10

    .line 273
    .line 274
    invoke-virtual {v0, v1, v2}, Landroidx/lifecycle/r;->a(Landroidx/lifecycle/q;Landroidx/lifecycle/j;)V

    .line 275
    .line 276
    .line 277
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 278
    .line 279
    .line 280
    move-result v2

    .line 281
    sub-int/2addr v2, v7

    .line 282
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    invoke-virtual {p0, p1}, Landroidx/lifecycle/s;->c(Landroidx/lifecycle/p;)Landroidx/lifecycle/k;

    .line 286
    .line 287
    .line 288
    move-result-object v2

    .line 289
    goto :goto_5

    .line 290
    :cond_10
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 291
    .line 292
    new-instance v1, Ljava/lang/StringBuilder;

    .line 293
    .line 294
    const-string v2, "no event up from "

    .line 295
    .line 296
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    iget-object v0, v0, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/k;

    .line 300
    .line 301
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 302
    .line 303
    .line 304
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 305
    .line 306
    .line 307
    move-result-object v0

    .line 308
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 309
    .line 310
    .line 311
    throw p1

    .line 312
    :cond_11
    if-nez v6, :cond_12

    .line 313
    .line 314
    invoke-virtual {p0}, Landroidx/lifecycle/s;->f()V

    .line 315
    .line 316
    .line 317
    :cond_12
    iget p1, p0, Landroidx/lifecycle/s;->e:I

    .line 318
    .line 319
    add-int/lit8 p1, p1, -0x1

    .line 320
    .line 321
    iput p1, p0, Landroidx/lifecycle/s;->e:I

    .line 322
    .line 323
    return-void
.end method

.method public final b(Landroidx/lifecycle/p;)V
    .locals 1

    .line 1
    const-string v0, "observer"

    .line 2
    .line 3
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "removeObserver"

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroidx/lifecycle/s;->d(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Landroidx/lifecycle/s;->b:Lo/a;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lo/a;->c(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final c(Landroidx/lifecycle/p;)Landroidx/lifecycle/k;
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/lifecycle/s;->b:Lo/a;

    .line 2
    .line 3
    iget-object v0, v0, Lo/a;->i:Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lo/c;

    .line 17
    .line 18
    iget-object p1, p1, Lo/c;->h:Lo/c;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move-object p1, v2

    .line 22
    :goto_0
    if-eqz p1, :cond_1

    .line 23
    .line 24
    iget-object p1, p1, Lo/c;->f:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast p1, Landroidx/lifecycle/r;

    .line 27
    .line 28
    iget-object p1, p1, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/k;

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    move-object p1, v2

    .line 32
    :goto_1
    iget-object v0, p0, Landroidx/lifecycle/s;->h:Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-nez v1, :cond_2

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    add-int/lit8 v1, v1, -0x1

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    move-object v2, v0

    .line 51
    check-cast v2, Landroidx/lifecycle/k;

    .line 52
    .line 53
    :cond_2
    iget-object v0, p0, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/k;

    .line 54
    .line 55
    const-string v1, "state1"

    .line 56
    .line 57
    invoke-static {v0, v1}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    if-eqz p1, :cond_3

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-gez v1, :cond_3

    .line 67
    .line 68
    goto :goto_2

    .line 69
    :cond_3
    move-object p1, v0

    .line 70
    :goto_2
    if-eqz v2, :cond_4

    .line 71
    .line 72
    invoke-virtual {v2, p1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-gez v0, :cond_4

    .line 77
    .line 78
    return-object v2

    .line 79
    :cond_4
    return-object p1
.end method

.method public final d(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Landroidx/lifecycle/s;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Ln/a;->I()Ln/a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Ln/a;->b:Ln/c;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    if-ne v0, v1, :cond_0

    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const-string v0, "Method "

    .line 30
    .line 31
    const-string v1, " must be called on the main thread"

    .line 32
    .line 33
    invoke-static {v0, p1, v1}, Lr/a;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    throw v0

    .line 47
    :cond_1
    return-void
.end method

.method public final e(Landroidx/lifecycle/j;)V
    .locals 3

    .line 1
    const-string v0, "event"

    .line 2
    .line 3
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "handleLifecycleEvent"

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroidx/lifecycle/s;->d(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroidx/lifecycle/j;->a()Landroidx/lifecycle/k;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v0, p0, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/k;

    .line 16
    .line 17
    if-ne v0, p1, :cond_0

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    sget-object v1, Landroidx/lifecycle/k;->f:Landroidx/lifecycle/k;

    .line 21
    .line 22
    sget-object v2, Landroidx/lifecycle/k;->e:Landroidx/lifecycle/k;

    .line 23
    .line 24
    if-ne v0, v1, :cond_2

    .line 25
    .line 26
    if-eq p1, v2, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v0, "no event down from "

    .line 32
    .line 33
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/k;

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v0, " in component "

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Landroidx/lifecycle/s;->d:Ljava/lang/ref/WeakReference;

    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 60
    .line 61
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    throw v0

    .line 69
    :cond_2
    :goto_0
    iput-object p1, p0, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/k;

    .line 70
    .line 71
    iget-boolean p1, p0, Landroidx/lifecycle/s;->f:Z

    .line 72
    .line 73
    const/4 v0, 0x1

    .line 74
    if-nez p1, :cond_5

    .line 75
    .line 76
    iget p1, p0, Landroidx/lifecycle/s;->e:I

    .line 77
    .line 78
    if-eqz p1, :cond_3

    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_3
    iput-boolean v0, p0, Landroidx/lifecycle/s;->f:Z

    .line 82
    .line 83
    invoke-virtual {p0}, Landroidx/lifecycle/s;->f()V

    .line 84
    .line 85
    .line 86
    const/4 p1, 0x0

    .line 87
    iput-boolean p1, p0, Landroidx/lifecycle/s;->f:Z

    .line 88
    .line 89
    iget-object p1, p0, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/k;

    .line 90
    .line 91
    if-ne p1, v2, :cond_4

    .line 92
    .line 93
    new-instance p1, Lo/a;

    .line 94
    .line 95
    invoke-direct {p1}, Lo/a;-><init>()V

    .line 96
    .line 97
    .line 98
    iput-object p1, p0, Landroidx/lifecycle/s;->b:Lo/a;

    .line 99
    .line 100
    :cond_4
    :goto_1
    return-void

    .line 101
    :cond_5
    :goto_2
    iput-boolean v0, p0, Landroidx/lifecycle/s;->g:Z

    .line 102
    .line 103
    return-void
.end method

.method public final f()V
    .locals 12

    .line 1
    iget-object v0, p0, Landroidx/lifecycle/s;->d:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroidx/lifecycle/q;

    .line 8
    .line 9
    if-eqz v0, :cond_f

    .line 10
    .line 11
    :cond_0
    iget-object v1, p0, Landroidx/lifecycle/s;->b:Lo/a;

    .line 12
    .line 13
    iget v2, v1, Lo/f;->h:I

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    const/4 v4, 0x0

    .line 17
    if-nez v2, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    iget-object v1, v1, Lo/f;->e:Lo/c;

    .line 21
    .line 22
    invoke-static {v1}, LI3/h;->b(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, v1, Lo/c;->f:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v1, Landroidx/lifecycle/r;

    .line 28
    .line 29
    iget-object v1, v1, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/k;

    .line 30
    .line 31
    iget-object v2, p0, Landroidx/lifecycle/s;->b:Lo/a;

    .line 32
    .line 33
    iget-object v2, v2, Lo/f;->f:Lo/c;

    .line 34
    .line 35
    invoke-static {v2}, LI3/h;->b(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    iget-object v2, v2, Lo/c;->f:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast v2, Landroidx/lifecycle/r;

    .line 41
    .line 42
    iget-object v2, v2, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/k;

    .line 43
    .line 44
    if-ne v1, v2, :cond_3

    .line 45
    .line 46
    iget-object v1, p0, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/k;

    .line 47
    .line 48
    if-ne v1, v2, :cond_3

    .line 49
    .line 50
    :goto_0
    iput-boolean v4, p0, Landroidx/lifecycle/s;->g:Z

    .line 51
    .line 52
    iget-object v0, p0, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/k;

    .line 53
    .line 54
    iget-object v1, p0, Landroidx/lifecycle/s;->i:LQ3/q;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 57
    .line 58
    .line 59
    if-nez v0, :cond_2

    .line 60
    .line 61
    sget-object v0, LR3/k;->a:LE/i;

    .line 62
    .line 63
    :cond_2
    invoke-virtual {v1, v3, v0}, LQ3/q;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_3
    iput-boolean v4, p0, Landroidx/lifecycle/s;->g:Z

    .line 68
    .line 69
    iget-object v1, p0, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/k;

    .line 70
    .line 71
    iget-object v2, p0, Landroidx/lifecycle/s;->b:Lo/a;

    .line 72
    .line 73
    iget-object v2, v2, Lo/f;->e:Lo/c;

    .line 74
    .line 75
    invoke-static {v2}, LI3/h;->b(Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    iget-object v2, v2, Lo/c;->f:Ljava/lang/Object;

    .line 79
    .line 80
    check-cast v2, Landroidx/lifecycle/r;

    .line 81
    .line 82
    iget-object v2, v2, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/k;

    .line 83
    .line 84
    invoke-virtual {v1, v2}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    const/4 v2, 0x3

    .line 89
    const/4 v4, 0x2

    .line 90
    const-string v5, "state"

    .line 91
    .line 92
    const/4 v6, 0x1

    .line 93
    if-gez v1, :cond_9

    .line 94
    .line 95
    iget-object v1, p0, Landroidx/lifecycle/s;->b:Lo/a;

    .line 96
    .line 97
    new-instance v7, Lo/b;

    .line 98
    .line 99
    iget-object v8, v1, Lo/f;->f:Lo/c;

    .line 100
    .line 101
    iget-object v9, v1, Lo/f;->e:Lo/c;

    .line 102
    .line 103
    const/4 v10, 0x1

    .line 104
    invoke-direct {v7, v8, v9, v10}, Lo/b;-><init>(Lo/c;Lo/c;I)V

    .line 105
    .line 106
    .line 107
    iget-object v1, v1, Lo/f;->g:Ljava/util/WeakHashMap;

    .line 108
    .line 109
    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 110
    .line 111
    invoke-virtual {v1, v7, v8}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    :cond_4
    invoke-virtual {v7}, Lo/b;->hasNext()Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-eqz v1, :cond_9

    .line 119
    .line 120
    iget-boolean v1, p0, Landroidx/lifecycle/s;->g:Z

    .line 121
    .line 122
    if-nez v1, :cond_9

    .line 123
    .line 124
    invoke-virtual {v7}, Lo/b;->next()Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    check-cast v1, Ljava/util/Map$Entry;

    .line 129
    .line 130
    const-string v8, "next()"

    .line 131
    .line 132
    invoke-static {v1, v8}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v8

    .line 139
    check-cast v8, Landroidx/lifecycle/p;

    .line 140
    .line 141
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    check-cast v1, Landroidx/lifecycle/r;

    .line 146
    .line 147
    :goto_1
    iget-object v9, v1, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/k;

    .line 148
    .line 149
    iget-object v10, p0, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/k;

    .line 150
    .line 151
    invoke-virtual {v9, v10}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 152
    .line 153
    .line 154
    move-result v9

    .line 155
    if-lez v9, :cond_4

    .line 156
    .line 157
    iget-boolean v9, p0, Landroidx/lifecycle/s;->g:Z

    .line 158
    .line 159
    if-nez v9, :cond_4

    .line 160
    .line 161
    iget-object v9, p0, Landroidx/lifecycle/s;->b:Lo/a;

    .line 162
    .line 163
    iget-object v9, v9, Lo/a;->i:Ljava/util/HashMap;

    .line 164
    .line 165
    invoke-virtual {v9, v8}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result v9

    .line 169
    if-eqz v9, :cond_4

    .line 170
    .line 171
    sget-object v9, Landroidx/lifecycle/j;->Companion:Landroidx/lifecycle/h;

    .line 172
    .line 173
    iget-object v10, v1, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/k;

    .line 174
    .line 175
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 176
    .line 177
    .line 178
    invoke-static {v10, v5}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v10}, Ljava/lang/Enum;->ordinal()I

    .line 182
    .line 183
    .line 184
    move-result v9

    .line 185
    if-eq v9, v4, :cond_7

    .line 186
    .line 187
    if-eq v9, v2, :cond_6

    .line 188
    .line 189
    const/4 v10, 0x4

    .line 190
    if-eq v9, v10, :cond_5

    .line 191
    .line 192
    move-object v9, v3

    .line 193
    goto :goto_2

    .line 194
    :cond_5
    sget-object v9, Landroidx/lifecycle/j;->ON_PAUSE:Landroidx/lifecycle/j;

    .line 195
    .line 196
    goto :goto_2

    .line 197
    :cond_6
    sget-object v9, Landroidx/lifecycle/j;->ON_STOP:Landroidx/lifecycle/j;

    .line 198
    .line 199
    goto :goto_2

    .line 200
    :cond_7
    sget-object v9, Landroidx/lifecycle/j;->ON_DESTROY:Landroidx/lifecycle/j;

    .line 201
    .line 202
    :goto_2
    if-eqz v9, :cond_8

    .line 203
    .line 204
    invoke-virtual {v9}, Landroidx/lifecycle/j;->a()Landroidx/lifecycle/k;

    .line 205
    .line 206
    .line 207
    move-result-object v10

    .line 208
    iget-object v11, p0, Landroidx/lifecycle/s;->h:Ljava/util/ArrayList;

    .line 209
    .line 210
    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    invoke-virtual {v1, v0, v9}, Landroidx/lifecycle/r;->a(Landroidx/lifecycle/q;Landroidx/lifecycle/j;)V

    .line 214
    .line 215
    .line 216
    iget-object v9, p0, Landroidx/lifecycle/s;->h:Ljava/util/ArrayList;

    .line 217
    .line 218
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 219
    .line 220
    .line 221
    move-result v10

    .line 222
    sub-int/2addr v10, v6

    .line 223
    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 224
    .line 225
    .line 226
    goto :goto_1

    .line 227
    :cond_8
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 228
    .line 229
    new-instance v2, Ljava/lang/StringBuilder;

    .line 230
    .line 231
    const-string v3, "no event down from "

    .line 232
    .line 233
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    iget-object v1, v1, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/k;

    .line 237
    .line 238
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    throw v0

    .line 249
    :cond_9
    iget-object v1, p0, Landroidx/lifecycle/s;->b:Lo/a;

    .line 250
    .line 251
    iget-object v1, v1, Lo/f;->f:Lo/c;

    .line 252
    .line 253
    iget-boolean v7, p0, Landroidx/lifecycle/s;->g:Z

    .line 254
    .line 255
    if-nez v7, :cond_0

    .line 256
    .line 257
    if-eqz v1, :cond_0

    .line 258
    .line 259
    iget-object v7, p0, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/k;

    .line 260
    .line 261
    iget-object v1, v1, Lo/c;->f:Ljava/lang/Object;

    .line 262
    .line 263
    check-cast v1, Landroidx/lifecycle/r;

    .line 264
    .line 265
    iget-object v1, v1, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/k;

    .line 266
    .line 267
    invoke-virtual {v7, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 268
    .line 269
    .line 270
    move-result v1

    .line 271
    if-lez v1, :cond_0

    .line 272
    .line 273
    iget-object v1, p0, Landroidx/lifecycle/s;->b:Lo/a;

    .line 274
    .line 275
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 276
    .line 277
    .line 278
    new-instance v7, Lo/d;

    .line 279
    .line 280
    invoke-direct {v7, v1}, Lo/d;-><init>(Lo/f;)V

    .line 281
    .line 282
    .line 283
    iget-object v1, v1, Lo/f;->g:Ljava/util/WeakHashMap;

    .line 284
    .line 285
    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 286
    .line 287
    invoke-virtual {v1, v7, v8}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 288
    .line 289
    .line 290
    :cond_a
    invoke-virtual {v7}, Lo/d;->hasNext()Z

    .line 291
    .line 292
    .line 293
    move-result v1

    .line 294
    if-eqz v1, :cond_0

    .line 295
    .line 296
    iget-boolean v1, p0, Landroidx/lifecycle/s;->g:Z

    .line 297
    .line 298
    if-nez v1, :cond_0

    .line 299
    .line 300
    invoke-virtual {v7}, Lo/d;->next()Ljava/lang/Object;

    .line 301
    .line 302
    .line 303
    move-result-object v1

    .line 304
    check-cast v1, Ljava/util/Map$Entry;

    .line 305
    .line 306
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 307
    .line 308
    .line 309
    move-result-object v8

    .line 310
    check-cast v8, Landroidx/lifecycle/p;

    .line 311
    .line 312
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 313
    .line 314
    .line 315
    move-result-object v1

    .line 316
    check-cast v1, Landroidx/lifecycle/r;

    .line 317
    .line 318
    :goto_3
    iget-object v9, v1, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/k;

    .line 319
    .line 320
    iget-object v10, p0, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/k;

    .line 321
    .line 322
    invoke-virtual {v9, v10}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 323
    .line 324
    .line 325
    move-result v9

    .line 326
    if-gez v9, :cond_a

    .line 327
    .line 328
    iget-boolean v9, p0, Landroidx/lifecycle/s;->g:Z

    .line 329
    .line 330
    if-nez v9, :cond_a

    .line 331
    .line 332
    iget-object v9, p0, Landroidx/lifecycle/s;->b:Lo/a;

    .line 333
    .line 334
    iget-object v9, v9, Lo/a;->i:Ljava/util/HashMap;

    .line 335
    .line 336
    invoke-virtual {v9, v8}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 337
    .line 338
    .line 339
    move-result v9

    .line 340
    if-eqz v9, :cond_a

    .line 341
    .line 342
    iget-object v9, v1, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/k;

    .line 343
    .line 344
    iget-object v10, p0, Landroidx/lifecycle/s;->h:Ljava/util/ArrayList;

    .line 345
    .line 346
    invoke-virtual {v10, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 347
    .line 348
    .line 349
    sget-object v9, Landroidx/lifecycle/j;->Companion:Landroidx/lifecycle/h;

    .line 350
    .line 351
    iget-object v10, v1, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/k;

    .line 352
    .line 353
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 354
    .line 355
    .line 356
    invoke-static {v10, v5}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 357
    .line 358
    .line 359
    invoke-virtual {v10}, Ljava/lang/Enum;->ordinal()I

    .line 360
    .line 361
    .line 362
    move-result v9

    .line 363
    if-eq v9, v6, :cond_d

    .line 364
    .line 365
    if-eq v9, v4, :cond_c

    .line 366
    .line 367
    if-eq v9, v2, :cond_b

    .line 368
    .line 369
    move-object v9, v3

    .line 370
    goto :goto_4

    .line 371
    :cond_b
    sget-object v9, Landroidx/lifecycle/j;->ON_RESUME:Landroidx/lifecycle/j;

    .line 372
    .line 373
    goto :goto_4

    .line 374
    :cond_c
    sget-object v9, Landroidx/lifecycle/j;->ON_START:Landroidx/lifecycle/j;

    .line 375
    .line 376
    goto :goto_4

    .line 377
    :cond_d
    sget-object v9, Landroidx/lifecycle/j;->ON_CREATE:Landroidx/lifecycle/j;

    .line 378
    .line 379
    :goto_4
    if-eqz v9, :cond_e

    .line 380
    .line 381
    invoke-virtual {v1, v0, v9}, Landroidx/lifecycle/r;->a(Landroidx/lifecycle/q;Landroidx/lifecycle/j;)V

    .line 382
    .line 383
    .line 384
    iget-object v9, p0, Landroidx/lifecycle/s;->h:Ljava/util/ArrayList;

    .line 385
    .line 386
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 387
    .line 388
    .line 389
    move-result v10

    .line 390
    sub-int/2addr v10, v6

    .line 391
    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 392
    .line 393
    .line 394
    goto :goto_3

    .line 395
    :cond_e
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 396
    .line 397
    new-instance v2, Ljava/lang/StringBuilder;

    .line 398
    .line 399
    const-string v3, "no event up from "

    .line 400
    .line 401
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 402
    .line 403
    .line 404
    iget-object v1, v1, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/k;

    .line 405
    .line 406
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 407
    .line 408
    .line 409
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 410
    .line 411
    .line 412
    move-result-object v1

    .line 413
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 414
    .line 415
    .line 416
    throw v0

    .line 417
    :cond_f
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 418
    .line 419
    const-string v1, "LifecycleOwner of this LifecycleRegistry is already garbage collected. It is too late to change lifecycle state."

    .line 420
    .line 421
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 422
    .line 423
    .line 424
    throw v0
.end method
