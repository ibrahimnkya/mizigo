.class public LR/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;
.implements Landroid/content/DialogInterface$OnDismissListener;
.implements Landroid/content/ComponentCallbacks;
.implements Landroid/view/View$OnCreateContextMenuListener;
.implements Landroidx/lifecycle/q;
.implements LY/e;


# static fields
.field public static final t:Ljava/lang/Object;


# instance fields
.field public final e:I

.field public final f:Ljava/lang/String;

.field public final g:LR/j;

.field public final h:Z

.field public i:LB2/a;

.field public final j:Landroidx/lifecycle/k;

.field public k:Landroidx/lifecycle/s;

.field public l:LM0/t;

.field public final m:Ljava/util/ArrayList;

.field public final n:LE/i;

.field public final o:LR/d;

.field public final p:Z

.field public q:I

.field public r:Z

.field public s:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LR/e;->t:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, LR/e;->e:I

    .line 6
    .line 7
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, LR/e;->f:Ljava/lang/String;

    .line 16
    .line 17
    new-instance v0, LR/j;

    .line 18
    .line 19
    invoke-direct {v0}, LR/j;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, LR/e;->g:LR/j;

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    iput-boolean v0, p0, LR/e;->h:Z

    .line 26
    .line 27
    new-instance v0, LR/b;

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    invoke-direct {v0, p0, v1}, LR/b;-><init>(LR/e;I)V

    .line 31
    .line 32
    .line 33
    sget-object v0, Landroidx/lifecycle/k;->i:Landroidx/lifecycle/k;

    .line 34
    .line 35
    iput-object v0, p0, LR/e;->j:Landroidx/lifecycle/k;

    .line 36
    .line 37
    new-instance v0, Landroidx/lifecycle/v;

    .line 38
    .line 39
    invoke-direct {v0}, Landroidx/lifecycle/v;-><init>()V

    .line 40
    .line 41
    .line 42
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 43
    .line 44
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 45
    .line 46
    .line 47
    new-instance v0, Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, LR/e;->m:Ljava/util/ArrayList;

    .line 53
    .line 54
    new-instance v0, LE/i;

    .line 55
    .line 56
    const/16 v1, 0xa

    .line 57
    .line 58
    invoke-direct {v0, v1, p0}, LE/i;-><init>(ILjava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    iput-object v0, p0, LR/e;->n:LE/i;

    .line 62
    .line 63
    new-instance v0, Landroidx/lifecycle/s;

    .line 64
    .line 65
    invoke-direct {v0, p0}, Landroidx/lifecycle/s;-><init>(Landroidx/lifecycle/q;)V

    .line 66
    .line 67
    .line 68
    iput-object v0, p0, LR/e;->k:Landroidx/lifecycle/s;

    .line 69
    .line 70
    new-instance v0, LM0/t;

    .line 71
    .line 72
    invoke-direct {v0, p0}, LM0/t;-><init>(LY/e;)V

    .line 73
    .line 74
    .line 75
    iput-object v0, p0, LR/e;->l:LM0/t;

    .line 76
    .line 77
    iget-object v0, p0, LR/e;->m:Ljava/util/ArrayList;

    .line 78
    .line 79
    iget-object v1, p0, LR/e;->n:LE/i;

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-nez v2, :cond_d

    .line 86
    .line 87
    iget v2, p0, LR/e;->e:I

    .line 88
    .line 89
    if-ltz v2, :cond_c

    .line 90
    .line 91
    iget-object v0, v1, LE/i;->f:Ljava/lang/Object;

    .line 92
    .line 93
    check-cast v0, LR/e;

    .line 94
    .line 95
    iget-object v1, v0, LR/e;->l:LM0/t;

    .line 96
    .line 97
    invoke-virtual {v1}, LM0/t;->c()V

    .line 98
    .line 99
    .line 100
    iget-object v1, v0, LR/e;->k:Landroidx/lifecycle/s;

    .line 101
    .line 102
    iget-object v1, v1, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/k;

    .line 103
    .line 104
    sget-object v2, Landroidx/lifecycle/k;->f:Landroidx/lifecycle/k;

    .line 105
    .line 106
    if-eq v1, v2, :cond_1

    .line 107
    .line 108
    sget-object v2, Landroidx/lifecycle/k;->g:Landroidx/lifecycle/k;

    .line 109
    .line 110
    if-ne v1, v2, :cond_0

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 114
    .line 115
    const-string v1, "Failed requirement."

    .line 116
    .line 117
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    throw v0

    .line 121
    :cond_1
    :goto_0
    iget-object v1, v0, LR/e;->l:LM0/t;

    .line 122
    .line 123
    iget-object v1, v1, LM0/t;->c:Ljava/lang/Object;

    .line 124
    .line 125
    check-cast v1, LY/d;

    .line 126
    .line 127
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 128
    .line 129
    .line 130
    iget-object v1, v1, LY/d;->c:Ljava/lang/Object;

    .line 131
    .line 132
    check-cast v1, Lo/f;

    .line 133
    .line 134
    invoke-virtual {v1}, Lo/f;->iterator()Ljava/util/Iterator;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    :cond_2
    move-object v2, v1

    .line 139
    check-cast v2, Lo/b;

    .line 140
    .line 141
    invoke-virtual {v2}, Lo/b;->hasNext()Z

    .line 142
    .line 143
    .line 144
    move-result v3

    .line 145
    const/4 v4, 0x0

    .line 146
    const-string v5, "androidx.lifecycle.internal.SavedStateHandlesProvider"

    .line 147
    .line 148
    if-eqz v3, :cond_3

    .line 149
    .line 150
    invoke-virtual {v2}, Lo/b;->next()Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    check-cast v2, Ljava/util/Map$Entry;

    .line 155
    .line 156
    const-string v3, "components"

    .line 157
    .line 158
    invoke-static {v2, v3}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    check-cast v3, Ljava/lang/String;

    .line 166
    .line 167
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v2

    .line 171
    check-cast v2, Landroidx/lifecycle/E;

    .line 172
    .line 173
    invoke-static {v3, v5}, LI3/h;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    move-result v3

    .line 177
    if-eqz v3, :cond_2

    .line 178
    .line 179
    goto :goto_1

    .line 180
    :cond_3
    move-object v2, v4

    .line 181
    :goto_1
    if-nez v2, :cond_7

    .line 182
    .line 183
    new-instance v1, Landroidx/lifecycle/E;

    .line 184
    .line 185
    iget-object v2, v0, LR/e;->l:LM0/t;

    .line 186
    .line 187
    iget-object v2, v2, LM0/t;->c:Ljava/lang/Object;

    .line 188
    .line 189
    check-cast v2, LY/d;

    .line 190
    .line 191
    invoke-direct {v1, v2, v0}, Landroidx/lifecycle/E;-><init>(LY/d;LR/e;)V

    .line 192
    .line 193
    .line 194
    iget-object v2, v0, LR/e;->l:LM0/t;

    .line 195
    .line 196
    iget-object v2, v2, LM0/t;->c:Ljava/lang/Object;

    .line 197
    .line 198
    check-cast v2, LY/d;

    .line 199
    .line 200
    iget-object v2, v2, LY/d;->c:Ljava/lang/Object;

    .line 201
    .line 202
    check-cast v2, Lo/f;

    .line 203
    .line 204
    invoke-virtual {v2, v5}, Lo/f;->b(Ljava/lang/Object;)Lo/c;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    if-eqz v3, :cond_4

    .line 209
    .line 210
    iget-object v4, v3, Lo/c;->f:Ljava/lang/Object;

    .line 211
    .line 212
    goto :goto_2

    .line 213
    :cond_4
    new-instance v3, Lo/c;

    .line 214
    .line 215
    invoke-direct {v3, v5, v1}, Lo/c;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 216
    .line 217
    .line 218
    iget v5, v2, Lo/f;->h:I

    .line 219
    .line 220
    add-int/lit8 v5, v5, 0x1

    .line 221
    .line 222
    iput v5, v2, Lo/f;->h:I

    .line 223
    .line 224
    iget-object v5, v2, Lo/f;->f:Lo/c;

    .line 225
    .line 226
    if-nez v5, :cond_5

    .line 227
    .line 228
    iput-object v3, v2, Lo/f;->e:Lo/c;

    .line 229
    .line 230
    iput-object v3, v2, Lo/f;->f:Lo/c;

    .line 231
    .line 232
    goto :goto_2

    .line 233
    :cond_5
    iput-object v3, v5, Lo/c;->g:Lo/c;

    .line 234
    .line 235
    iput-object v5, v3, Lo/c;->h:Lo/c;

    .line 236
    .line 237
    iput-object v3, v2, Lo/f;->f:Lo/c;

    .line 238
    .line 239
    :goto_2
    check-cast v4, Landroidx/lifecycle/E;

    .line 240
    .line 241
    if-nez v4, :cond_6

    .line 242
    .line 243
    iget-object v2, v0, LR/e;->k:Landroidx/lifecycle/s;

    .line 244
    .line 245
    new-instance v3, LY/a;

    .line 246
    .line 247
    const/4 v4, 0x2

    .line 248
    invoke-direct {v3, v4, v1}, LY/a;-><init>(ILjava/lang/Object;)V

    .line 249
    .line 250
    .line 251
    invoke-virtual {v2, v3}, Landroidx/lifecycle/s;->a(Landroidx/lifecycle/p;)V

    .line 252
    .line 253
    .line 254
    goto :goto_3

    .line 255
    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 256
    .line 257
    const-string v1, "SavedStateProvider with the given key is already registered"

    .line 258
    .line 259
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 260
    .line 261
    .line 262
    throw v0

    .line 263
    :cond_7
    :goto_3
    iget-object v0, v0, LR/e;->l:LM0/t;

    .line 264
    .line 265
    iget-boolean v1, v0, LM0/t;->a:Z

    .line 266
    .line 267
    if-nez v1, :cond_8

    .line 268
    .line 269
    invoke-virtual {v0}, LM0/t;->c()V

    .line 270
    .line 271
    .line 272
    :cond_8
    iget-object v1, v0, LM0/t;->b:Ljava/lang/Object;

    .line 273
    .line 274
    invoke-interface {v1}, Landroidx/lifecycle/q;->b()Landroidx/lifecycle/s;

    .line 275
    .line 276
    .line 277
    move-result-object v1

    .line 278
    iget-object v2, v1, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/k;

    .line 279
    .line 280
    sget-object v3, Landroidx/lifecycle/k;->h:Landroidx/lifecycle/k;

    .line 281
    .line 282
    invoke-virtual {v2, v3}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 283
    .line 284
    .line 285
    move-result v2

    .line 286
    if-gez v2, :cond_b

    .line 287
    .line 288
    iget-object v0, v0, LM0/t;->c:Ljava/lang/Object;

    .line 289
    .line 290
    check-cast v0, LY/d;

    .line 291
    .line 292
    iget-boolean v1, v0, LY/d;->a:Z

    .line 293
    .line 294
    if-eqz v1, :cond_a

    .line 295
    .line 296
    iget-boolean v1, v0, LY/d;->b:Z

    .line 297
    .line 298
    if-nez v1, :cond_9

    .line 299
    .line 300
    const/4 v1, 0x0

    .line 301
    iput-object v1, v0, LY/d;->d:Ljava/lang/Object;

    .line 302
    .line 303
    const/4 v1, 0x1

    .line 304
    iput-boolean v1, v0, LY/d;->b:Z

    .line 305
    .line 306
    goto :goto_4

    .line 307
    :cond_9
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 308
    .line 309
    const-string v1, "SavedStateRegistry was already restored."

    .line 310
    .line 311
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 312
    .line 313
    .line 314
    throw v0

    .line 315
    :cond_a
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 316
    .line 317
    const-string v1, "You must call performAttach() before calling performRestore(Bundle)."

    .line 318
    .line 319
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 320
    .line 321
    .line 322
    throw v0

    .line 323
    :cond_b
    new-instance v0, Ljava/lang/StringBuilder;

    .line 324
    .line 325
    const-string v2, "performRestore cannot be called when owner is "

    .line 326
    .line 327
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    iget-object v1, v1, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/k;

    .line 331
    .line 332
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 333
    .line 334
    .line 335
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 340
    .line 341
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object v0

    .line 345
    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    throw v1

    .line 349
    :cond_c
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 350
    .line 351
    .line 352
    :cond_d
    :goto_4
    new-instance v0, LR/b;

    .line 353
    .line 354
    const/4 v1, 0x0

    .line 355
    invoke-direct {v0, p0, v1}, LR/b;-><init>(LR/e;I)V

    .line 356
    .line 357
    .line 358
    new-instance v0, LR/c;

    .line 359
    .line 360
    invoke-direct {v0, p0}, LR/c;-><init>(LR/e;)V

    .line 361
    .line 362
    .line 363
    new-instance v0, LR/d;

    .line 364
    .line 365
    invoke-direct {v0, p0}, LR/d;-><init>(LR/e;)V

    .line 366
    .line 367
    .line 368
    iput-object v0, p0, LR/e;->o:LR/d;

    .line 369
    .line 370
    const/4 v0, 0x1

    .line 371
    iput-boolean v0, p0, LR/e;->p:Z

    .line 372
    .line 373
    const/4 v0, -0x1

    .line 374
    iput v0, p0, LR/e;->q:I

    .line 375
    .line 376
    new-instance v0, LA0/c;

    .line 377
    .line 378
    const/16 v1, 0xf

    .line 379
    .line 380
    invoke-direct {v0, v1, p0}, LA0/c;-><init>(ILjava/lang/Object;)V

    .line 381
    .line 382
    .line 383
    return-void
.end method


# virtual methods
.method public final a()LY/d;
    .locals 1

    .line 1
    iget-object v0, p0, LR/e;->l:LM0/t;

    .line 2
    .line 3
    iget-object v0, v0, LM0/t;->c:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, LY/d;

    .line 6
    .line 7
    return-object v0
.end method

.method public final b()Landroidx/lifecycle/s;
    .locals 1

    .line 1
    iget-object v0, p0, LR/e;->k:Landroidx/lifecycle/s;

    .line 2
    .line 3
    return-object v0
.end method

.method public final c()LS/b;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "Fragment "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, " not attached to a context."

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    throw v0
.end method

.method public final d()LR/j;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "Fragment "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, " not associated with a fragment manager."

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    throw v0
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 0

    .line 1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 2
    .line 3
    new-instance p2, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string p3, "Fragment "

    .line 6
    .line 7
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p3, " not attached to an activity."

    .line 14
    .line 15
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    throw p1
.end method

.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 11

    .line 1
    iget-boolean p1, p0, LR/e;->r:Z

    .line 2
    .line 3
    if-nez p1, :cond_b

    .line 4
    .line 5
    const/4 p1, 0x3

    .line 6
    invoke-static {p1}, LR/j;->g(I)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string v0, "FragmentManager"

    .line 13
    .line 14
    new-instance v1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v2, "onDismiss called for DialogFragment "

    .line 17
    .line 18
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-boolean v0, p0, LR/e;->s:Z

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    goto/16 :goto_2

    .line 36
    .line 37
    :cond_1
    const/4 v0, 0x1

    .line 38
    iput-boolean v0, p0, LR/e;->s:Z

    .line 39
    .line 40
    iput-boolean v0, p0, LR/e;->r:Z

    .line 41
    .line 42
    iget v1, p0, LR/e;->q:I

    .line 43
    .line 44
    const/4 v2, -0x1

    .line 45
    if-ltz v1, :cond_3

    .line 46
    .line 47
    invoke-virtual {p0}, LR/e;->d()LR/j;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iget v0, p0, LR/e;->q:I

    .line 52
    .line 53
    if-ltz v0, :cond_2

    .line 54
    .line 55
    iget-object p1, p1, LR/j;->c:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast p1, Ljava/util/ArrayList;

    .line 58
    .line 59
    monitor-enter p1

    .line 60
    :try_start_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    iput v2, p0, LR/e;->q:I

    .line 62
    .line 63
    return-void

    .line 64
    :catchall_0
    move-exception v0

    .line 65
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    throw v0

    .line 67
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 68
    .line 69
    const-string v1, "Bad id: "

    .line 70
    .line 71
    invoke-static {v1, v0}, LE1/j;->j(Ljava/lang/String;I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    throw p1

    .line 79
    :cond_3
    invoke-virtual {p0}, LR/e;->d()LR/j;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    new-instance v3, LR/a;

    .line 84
    .line 85
    invoke-direct {v3, v1}, LR/a;-><init>(LR/j;)V

    .line 86
    .line 87
    .line 88
    new-instance v1, LR/l;

    .line 89
    .line 90
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 91
    .line 92
    .line 93
    iput p1, v1, LR/l;->a:I

    .line 94
    .line 95
    iput-object p0, v1, LR/l;->b:LR/e;

    .line 96
    .line 97
    iget-object p1, v3, LR/a;->d:Ljava/lang/Object;

    .line 98
    .line 99
    check-cast p1, Ljava/util/ArrayList;

    .line 100
    .line 101
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    const/4 p1, 0x0

    .line 105
    iput p1, v1, LR/l;->c:I

    .line 106
    .line 107
    iput p1, v1, LR/l;->d:I

    .line 108
    .line 109
    iput p1, v1, LR/l;->e:I

    .line 110
    .line 111
    iput p1, v1, LR/l;->f:I

    .line 112
    .line 113
    iget-object p1, v3, LR/a;->e:Ljava/lang/Object;

    .line 114
    .line 115
    check-cast p1, LR/j;

    .line 116
    .line 117
    const-string v1, "FragmentManager"

    .line 118
    .line 119
    iget-boolean v4, v3, LR/a;->c:Z

    .line 120
    .line 121
    if-nez v4, :cond_a

    .line 122
    .line 123
    const/4 v4, 0x2

    .line 124
    invoke-static {v4}, LR/j;->g(I)Z

    .line 125
    .line 126
    .line 127
    move-result v4

    .line 128
    if-eqz v4, :cond_9

    .line 129
    .line 130
    new-instance v4, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    const-string v5, "Commit: "

    .line 133
    .line 134
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v4

    .line 144
    invoke-static {v1, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    .line 146
    .line 147
    new-instance v1, LR/m;

    .line 148
    .line 149
    invoke-direct {v1}, LR/m;-><init>()V

    .line 150
    .line 151
    .line 152
    new-instance v4, Ljava/io/PrintWriter;

    .line 153
    .line 154
    invoke-direct {v4, v1}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 155
    .line 156
    .line 157
    const-string v1, "  "

    .line 158
    .line 159
    iget-object v5, v3, LR/a;->d:Ljava/lang/Object;

    .line 160
    .line 161
    check-cast v5, Ljava/util/ArrayList;

    .line 162
    .line 163
    invoke-virtual {v4, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    const-string v6, "mName="

    .line 167
    .line 168
    invoke-virtual {v4, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    const/4 v6, 0x0

    .line 172
    invoke-virtual {v4, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    const-string v6, " mIndex="

    .line 176
    .line 177
    invoke-virtual {v4, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    iget v6, v3, LR/a;->b:I

    .line 181
    .line 182
    invoke-virtual {v4, v6}, Ljava/io/PrintWriter;->print(I)V

    .line 183
    .line 184
    .line 185
    const-string v6, " mCommitted="

    .line 186
    .line 187
    invoke-virtual {v4, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    iget-boolean v6, v3, LR/a;->c:Z

    .line 191
    .line 192
    invoke-virtual {v4, v6}, Ljava/io/PrintWriter;->println(Z)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    .line 196
    .line 197
    .line 198
    move-result v6

    .line 199
    if-nez v6, :cond_8

    .line 200
    .line 201
    invoke-virtual {v4, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    const-string v6, "Operations:"

    .line 205
    .line 206
    invoke-virtual {v4, v6}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 210
    .line 211
    .line 212
    move-result v6

    .line 213
    const/4 v7, 0x0

    .line 214
    :goto_0
    if-ge v7, v6, :cond_8

    .line 215
    .line 216
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v8

    .line 220
    check-cast v8, LR/l;

    .line 221
    .line 222
    iget v9, v8, LR/l;->a:I

    .line 223
    .line 224
    packed-switch v9, :pswitch_data_0

    .line 225
    .line 226
    .line 227
    new-instance v9, Ljava/lang/StringBuilder;

    .line 228
    .line 229
    const-string v10, "cmd="

    .line 230
    .line 231
    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    iget v10, v8, LR/l;->a:I

    .line 235
    .line 236
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v9

    .line 243
    goto :goto_1

    .line 244
    :pswitch_0
    const-string v9, "OP_SET_MAX_LIFECYCLE"

    .line 245
    .line 246
    goto :goto_1

    .line 247
    :pswitch_1
    const-string v9, "UNSET_PRIMARY_NAV"

    .line 248
    .line 249
    goto :goto_1

    .line 250
    :pswitch_2
    const-string v9, "SET_PRIMARY_NAV"

    .line 251
    .line 252
    goto :goto_1

    .line 253
    :pswitch_3
    const-string v9, "ATTACH"

    .line 254
    .line 255
    goto :goto_1

    .line 256
    :pswitch_4
    const-string v9, "DETACH"

    .line 257
    .line 258
    goto :goto_1

    .line 259
    :pswitch_5
    const-string v9, "SHOW"

    .line 260
    .line 261
    goto :goto_1

    .line 262
    :pswitch_6
    const-string v9, "HIDE"

    .line 263
    .line 264
    goto :goto_1

    .line 265
    :pswitch_7
    const-string v9, "REMOVE"

    .line 266
    .line 267
    goto :goto_1

    .line 268
    :pswitch_8
    const-string v9, "REPLACE"

    .line 269
    .line 270
    goto :goto_1

    .line 271
    :pswitch_9
    const-string v9, "ADD"

    .line 272
    .line 273
    goto :goto_1

    .line 274
    :pswitch_a
    const-string v9, "NULL"

    .line 275
    .line 276
    :goto_1
    invoke-virtual {v4, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    const-string v10, "  Op #"

    .line 280
    .line 281
    invoke-virtual {v4, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 282
    .line 283
    .line 284
    invoke-virtual {v4, v7}, Ljava/io/PrintWriter;->print(I)V

    .line 285
    .line 286
    .line 287
    const-string v10, ": "

    .line 288
    .line 289
    invoke-virtual {v4, v10}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    invoke-virtual {v4, v9}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 293
    .line 294
    .line 295
    const-string v9, " "

    .line 296
    .line 297
    invoke-virtual {v4, v9}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 298
    .line 299
    .line 300
    iget-object v9, v8, LR/l;->b:LR/e;

    .line 301
    .line 302
    invoke-virtual {v4, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 303
    .line 304
    .line 305
    iget v9, v8, LR/l;->c:I

    .line 306
    .line 307
    if-nez v9, :cond_4

    .line 308
    .line 309
    iget v9, v8, LR/l;->d:I

    .line 310
    .line 311
    if-eqz v9, :cond_5

    .line 312
    .line 313
    :cond_4
    invoke-virtual {v4, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 314
    .line 315
    .line 316
    const-string v9, "enterAnim=#"

    .line 317
    .line 318
    invoke-virtual {v4, v9}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 319
    .line 320
    .line 321
    iget v9, v8, LR/l;->c:I

    .line 322
    .line 323
    invoke-static {v9}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 324
    .line 325
    .line 326
    move-result-object v9

    .line 327
    invoke-virtual {v4, v9}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    const-string v9, " exitAnim=#"

    .line 331
    .line 332
    invoke-virtual {v4, v9}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 333
    .line 334
    .line 335
    iget v9, v8, LR/l;->d:I

    .line 336
    .line 337
    invoke-static {v9}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object v9

    .line 341
    invoke-virtual {v4, v9}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 342
    .line 343
    .line 344
    :cond_5
    iget v9, v8, LR/l;->e:I

    .line 345
    .line 346
    if-nez v9, :cond_6

    .line 347
    .line 348
    iget v9, v8, LR/l;->f:I

    .line 349
    .line 350
    if-eqz v9, :cond_7

    .line 351
    .line 352
    :cond_6
    invoke-virtual {v4, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 353
    .line 354
    .line 355
    const-string v9, "popEnterAnim=#"

    .line 356
    .line 357
    invoke-virtual {v4, v9}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 358
    .line 359
    .line 360
    iget v9, v8, LR/l;->e:I

    .line 361
    .line 362
    invoke-static {v9}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 363
    .line 364
    .line 365
    move-result-object v9

    .line 366
    invoke-virtual {v4, v9}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 367
    .line 368
    .line 369
    const-string v9, " popExitAnim=#"

    .line 370
    .line 371
    invoke-virtual {v4, v9}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 372
    .line 373
    .line 374
    iget v8, v8, LR/l;->f:I

    .line 375
    .line 376
    invoke-static {v8}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 377
    .line 378
    .line 379
    move-result-object v8

    .line 380
    invoke-virtual {v4, v8}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 381
    .line 382
    .line 383
    :cond_7
    add-int/lit8 v7, v7, 0x1

    .line 384
    .line 385
    goto/16 :goto_0

    .line 386
    .line 387
    :cond_8
    invoke-virtual {v4}, Ljava/io/PrintWriter;->close()V

    .line 388
    .line 389
    .line 390
    :cond_9
    iput-boolean v0, v3, LR/a;->c:Z

    .line 391
    .line 392
    iput v2, v3, LR/a;->b:I

    .line 393
    .line 394
    iget-object p1, p1, LR/j;->c:Ljava/lang/Object;

    .line 395
    .line 396
    check-cast p1, Ljava/util/ArrayList;

    .line 397
    .line 398
    monitor-enter p1

    .line 399
    :try_start_2
    monitor-exit p1

    .line 400
    return-void

    .line 401
    :catchall_1
    move-exception v0

    .line 402
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 403
    throw v0

    .line 404
    :cond_a
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 405
    .line 406
    const-string v0, "commit already called"

    .line 407
    .line 408
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 409
    .line 410
    .line 411
    throw p1

    .line 412
    :cond_b
    :goto_2
    return-void

    .line 413
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final onLowMemory()V
    .locals 0

    .line 1
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const/16 v1, 0x80

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, "{"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v1, "} ("

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, LR/e;->f:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v1, ")"

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    return-object v0
.end method
