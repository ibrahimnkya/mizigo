.class public final Ls3/k;
.super Lio/flutter/plugin/platform/f;
.source "SourceFile"


# instance fields
.field public final b:Lk3/f;

.field public final c:Lj3/b;


# direct methods
.method public constructor <init>(Lk3/f;Landroid/content/Context;Lj3/b;)V
    .locals 1

    .line 1
    sget-object v0, Ls3/B;->d:Ls3/B;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lio/flutter/plugin/platform/f;-><init>(Lk3/u;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Ls3/k;->b:Lk3/f;

    .line 7
    .line 8
    iput-object p3, p0, Ls3/k;->c:Lj3/b;

    .line 9
    .line 10
    new-instance p3, Ls3/l;

    .line 11
    .line 12
    invoke-direct {p3, p2, p1}, Ls3/l;-><init>(Landroid/content/Context;Lk3/f;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;ILjava/lang/Object;)Lio/flutter/plugin/platform/e;
    .locals 11

    .line 1
    check-cast p3, Ls3/o0;

    .line 2
    .line 3
    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    new-instance v0, Ls3/h;

    .line 7
    .line 8
    invoke-direct {v0}, Ls3/h;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v1, p3, Ls3/o0;->b:Ls3/m0;

    .line 12
    .line 13
    invoke-static {v1, v0}, Landroid/support/v4/media/session/a;->w(Ls3/m0;Ls3/m;)V

    .line 14
    .line 15
    .line 16
    iget-object v2, p3, Ls3/o0;->a:Ls3/K;

    .line 17
    .line 18
    iget-object v3, v2, Ls3/K;->a:Ljava/lang/Double;

    .line 19
    .line 20
    invoke-virtual {v3}, Ljava/lang/Double;->floatValue()F

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    iget-object v4, v2, Ls3/K;->b:Ls3/j0;

    .line 25
    .line 26
    invoke-static {v4}, Landroid/support/v4/media/session/a;->D(Ls3/j0;)Lcom/google/android/gms/maps/model/LatLng;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    iget-object v5, v2, Ls3/K;->c:Ljava/lang/Double;

    .line 31
    .line 32
    invoke-virtual {v5}, Ljava/lang/Double;->floatValue()F

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    iget-object v2, v2, Ls3/K;->d:Ljava/lang/Double;

    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/Double;->floatValue()F

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    new-instance v6, Lcom/google/android/gms/maps/model/CameraPosition;

    .line 43
    .line 44
    invoke-direct {v6, v4, v2, v5, v3}, Lcom/google/android/gms/maps/model/CameraPosition;-><init>(Lcom/google/android/gms/maps/model/LatLng;FFF)V

    .line 45
    .line 46
    .line 47
    iget-object v2, v0, Ls3/h;->e:Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 48
    .line 49
    iput-object v6, v2, Lcom/google/android/gms/maps/GoogleMapOptions;->h:Lcom/google/android/gms/maps/model/CameraPosition;

    .line 50
    .line 51
    iget-object v3, p3, Ls3/o0;->i:Ljava/util/List;

    .line 52
    .line 53
    iput-object v3, v0, Ls3/h;->m:Ljava/util/List;

    .line 54
    .line 55
    iget-object v3, p3, Ls3/o0;->d:Ljava/util/List;

    .line 56
    .line 57
    iput-object v3, v0, Ls3/h;->l:Ljava/util/List;

    .line 58
    .line 59
    iget-object v3, p3, Ls3/o0;->e:Ljava/util/List;

    .line 60
    .line 61
    iput-object v3, v0, Ls3/h;->n:Ljava/util/List;

    .line 62
    .line 63
    iget-object v3, p3, Ls3/o0;->f:Ljava/util/List;

    .line 64
    .line 65
    iput-object v3, v0, Ls3/h;->o:Ljava/util/List;

    .line 66
    .line 67
    iget-object v3, p3, Ls3/o0;->c:Ljava/util/List;

    .line 68
    .line 69
    iput-object v3, v0, Ls3/h;->p:Ljava/util/List;

    .line 70
    .line 71
    iget-object v3, p3, Ls3/o0;->g:Ljava/util/List;

    .line 72
    .line 73
    iput-object v3, v0, Ls3/h;->q:Ljava/util/List;

    .line 74
    .line 75
    iget-object v3, p3, Ls3/o0;->h:Ljava/util/List;

    .line 76
    .line 77
    iput-object v3, v0, Ls3/h;->r:Ljava/util/List;

    .line 78
    .line 79
    iget-object p3, p3, Ls3/o0;->j:Ljava/util/List;

    .line 80
    .line 81
    iput-object p3, v0, Ls3/h;->s:Ljava/util/List;

    .line 82
    .line 83
    iget-object p3, v1, Ls3/m0;->t:Ljava/lang/String;

    .line 84
    .line 85
    if-eqz p3, :cond_0

    .line 86
    .line 87
    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    if-nez v3, :cond_0

    .line 92
    .line 93
    iput-object p3, v2, Lcom/google/android/gms/maps/GoogleMapOptions;->w:Ljava/lang/String;

    .line 94
    .line 95
    :cond_0
    iget-object v10, v1, Ls3/m0;->s:Ls3/r0;

    .line 96
    .line 97
    new-instance v4, Ls3/j;

    .line 98
    .line 99
    iget-object v9, v0, Ls3/h;->e:Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 100
    .line 101
    iget-object v7, p0, Ls3/k;->b:Lk3/f;

    .line 102
    .line 103
    iget-object v8, p0, Ls3/k;->c:Lj3/b;

    .line 104
    .line 105
    move-object v6, p1

    .line 106
    move v5, p2

    .line 107
    invoke-direct/range {v4 .. v10}, Ls3/j;-><init>(ILandroid/content/Context;Lk3/f;Lj3/b;Lcom/google/android/gms/maps/GoogleMapOptions;Ls3/r0;)V

    .line 108
    .line 109
    .line 110
    iget-object p1, v4, Ls3/j;->v:Lj3/b;

    .line 111
    .line 112
    iget-object p1, p1, Lj3/b;->f:Ljava/lang/Object;

    .line 113
    .line 114
    check-cast p1, Ls3/n;

    .line 115
    .line 116
    iget-object p1, p1, Ls3/n;->e:Landroidx/lifecycle/l;

    .line 117
    .line 118
    invoke-virtual {p1, v4}, Landroidx/lifecycle/l;->a(Landroidx/lifecycle/p;)V

    .line 119
    .line 120
    .line 121
    iget-object p1, v4, Ls3/j;->i:Lc1/f;

    .line 122
    .line 123
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 124
    .line 125
    .line 126
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 131
    .line 132
    .line 133
    move-result-object p3

    .line 134
    if-ne p2, p3, :cond_a

    .line 135
    .line 136
    iget-object p1, p1, Lc1/f;->e:Lc1/j;

    .line 137
    .line 138
    iget-object p2, p1, Lc1/j;->a:LB2/a;

    .line 139
    .line 140
    if-eqz p2, :cond_1

    .line 141
    .line 142
    invoke-virtual {p2, v4}, LB2/a;->z(Ls3/j;)V

    .line 143
    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_1
    iget-object p1, p1, Lc1/j;->i:Ljava/util/ArrayList;

    .line 147
    .line 148
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    :goto_0
    iget-boolean p1, v0, Ls3/h;->g:Z

    .line 152
    .line 153
    invoke-virtual {v4, p1}, Ls3/j;->z(Z)V

    .line 154
    .line 155
    .line 156
    iget-boolean p1, v0, Ls3/h;->h:Z

    .line 157
    .line 158
    invoke-virtual {v4, p1}, Ls3/j;->l(Z)V

    .line 159
    .line 160
    .line 161
    iget-boolean p1, v0, Ls3/h;->i:Z

    .line 162
    .line 163
    iput-boolean p1, v4, Ls3/j;->o:Z

    .line 164
    .line 165
    iget-boolean p1, v0, Ls3/h;->j:Z

    .line 166
    .line 167
    invoke-virtual {v4, p1}, Ls3/j;->F(Z)V

    .line 168
    .line 169
    .line 170
    iget-boolean p1, v0, Ls3/h;->k:Z

    .line 171
    .line 172
    iput-boolean p1, v4, Ls3/j;->q:Z

    .line 173
    .line 174
    iget-boolean p1, v0, Ls3/h;->f:Z

    .line 175
    .line 176
    iput-boolean p1, v4, Ls3/j;->k:Z

    .line 177
    .line 178
    iget-object p1, v0, Ls3/h;->m:Ljava/util/List;

    .line 179
    .line 180
    iput-object p1, v4, Ls3/j;->H:Ljava/util/List;

    .line 181
    .line 182
    iget-object p2, v4, Ls3/j;->j:LB2/a;

    .line 183
    .line 184
    if-eqz p2, :cond_2

    .line 185
    .line 186
    if-eqz p1, :cond_2

    .line 187
    .line 188
    iget-object p2, v4, Ls3/j;->x:Ls3/g;

    .line 189
    .line 190
    invoke-virtual {p2, p1}, Ls3/g;->a(Ljava/util/List;)V

    .line 191
    .line 192
    .line 193
    :cond_2
    iget-object p1, v0, Ls3/h;->l:Ljava/util/List;

    .line 194
    .line 195
    iput-object p1, v4, Ls3/j;->G:Ljava/util/List;

    .line 196
    .line 197
    iget-object p2, v4, Ls3/j;->j:LB2/a;

    .line 198
    .line 199
    if-eqz p2, :cond_3

    .line 200
    .line 201
    if-eqz p1, :cond_3

    .line 202
    .line 203
    iget-object p2, v4, Ls3/j;->w:Ls3/w;

    .line 204
    .line 205
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 206
    .line 207
    .line 208
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 213
    .line 214
    .line 215
    move-result p3

    .line 216
    if-eqz p3, :cond_3

    .line 217
    .line 218
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object p3

    .line 222
    check-cast p3, Ls3/p0;

    .line 223
    .line 224
    invoke-virtual {p2, p3}, Ls3/w;->a(Ls3/p0;)V

    .line 225
    .line 226
    .line 227
    goto :goto_1

    .line 228
    :cond_3
    iget-object p1, v0, Ls3/h;->n:Ljava/util/List;

    .line 229
    .line 230
    iput-object p1, v4, Ls3/j;->I:Ljava/util/List;

    .line 231
    .line 232
    iget-object p2, v4, Ls3/j;->j:LB2/a;

    .line 233
    .line 234
    if-eqz p2, :cond_4

    .line 235
    .line 236
    if-eqz p1, :cond_4

    .line 237
    .line 238
    iget-object p2, v4, Ls3/j;->y:Ls3/d;

    .line 239
    .line 240
    invoke-virtual {p2, p1}, Ls3/d;->b(Ljava/util/List;)V

    .line 241
    .line 242
    .line 243
    :cond_4
    iget-object p1, v0, Ls3/h;->o:Ljava/util/List;

    .line 244
    .line 245
    iput-object p1, v4, Ls3/j;->J:Ljava/util/List;

    .line 246
    .line 247
    iget-object p2, v4, Ls3/j;->j:LB2/a;

    .line 248
    .line 249
    if-eqz p2, :cond_5

    .line 250
    .line 251
    if-eqz p1, :cond_5

    .line 252
    .line 253
    iget-object p2, v4, Ls3/j;->z:Ls3/I0;

    .line 254
    .line 255
    invoke-virtual {p2, p1}, Ls3/I0;->a(Ljava/util/List;)V

    .line 256
    .line 257
    .line 258
    :cond_5
    iget-object p1, v0, Ls3/h;->p:Ljava/util/List;

    .line 259
    .line 260
    iput-object p1, v4, Ls3/j;->K:Ljava/util/List;

    .line 261
    .line 262
    iget-object p2, v4, Ls3/j;->j:LB2/a;

    .line 263
    .line 264
    if-eqz p2, :cond_6

    .line 265
    .line 266
    if-eqz p1, :cond_6

    .line 267
    .line 268
    iget-object p2, v4, Ls3/j;->A:Ls3/d;

    .line 269
    .line 270
    invoke-virtual {p2, p1}, Ls3/d;->a(Ljava/util/List;)V

    .line 271
    .line 272
    .line 273
    :cond_6
    iget-object p1, v0, Ls3/h;->q:Ljava/util/List;

    .line 274
    .line 275
    iput-object p1, v4, Ls3/j;->L:Ljava/util/List;

    .line 276
    .line 277
    iget-object p2, v4, Ls3/j;->j:LB2/a;

    .line 278
    .line 279
    if-eqz p2, :cond_7

    .line 280
    .line 281
    if-eqz p1, :cond_7

    .line 282
    .line 283
    iget-object p2, v4, Ls3/j;->B:Ll2/b;

    .line 284
    .line 285
    invoke-virtual {p2, p1}, Ll2/b;->b(Ljava/util/List;)V

    .line 286
    .line 287
    .line 288
    :cond_7
    iget-object p1, v0, Ls3/h;->t:Landroid/graphics/Rect;

    .line 289
    .line 290
    iget p2, p1, Landroid/graphics/Rect;->top:I

    .line 291
    .line 292
    int-to-float p2, p2

    .line 293
    iget p3, p1, Landroid/graphics/Rect;->left:I

    .line 294
    .line 295
    int-to-float p3, p3

    .line 296
    iget v1, p1, Landroid/graphics/Rect;->bottom:I

    .line 297
    .line 298
    int-to-float v1, v1

    .line 299
    iget p1, p1, Landroid/graphics/Rect;->right:I

    .line 300
    .line 301
    int-to-float p1, p1

    .line 302
    invoke-virtual {v4, p2, p3, v1, p1}, Ls3/j;->c(FFFF)V

    .line 303
    .line 304
    .line 305
    iget-object p1, v0, Ls3/h;->r:Ljava/util/List;

    .line 306
    .line 307
    iput-object p1, v4, Ls3/j;->M:Ljava/util/List;

    .line 308
    .line 309
    iget-object p2, v4, Ls3/j;->j:LB2/a;

    .line 310
    .line 311
    if-eqz p2, :cond_8

    .line 312
    .line 313
    if-eqz p1, :cond_8

    .line 314
    .line 315
    iget-object p2, v4, Ls3/j;->C:Lm/x0;

    .line 316
    .line 317
    invoke-virtual {p2, p1}, Lm/x0;->r(Ljava/util/List;)V

    .line 318
    .line 319
    .line 320
    :cond_8
    iget-object p1, v0, Ls3/h;->s:Ljava/util/List;

    .line 321
    .line 322
    iput-object p1, v4, Ls3/j;->N:Ljava/util/List;

    .line 323
    .line 324
    iget-object p2, v4, Ls3/j;->j:LB2/a;

    .line 325
    .line 326
    if-eqz p2, :cond_9

    .line 327
    .line 328
    if-eqz p1, :cond_9

    .line 329
    .line 330
    iget-object p2, v4, Ls3/j;->D:Ls3/q;

    .line 331
    .line 332
    invoke-virtual {p2, p1}, Ls3/q;->a(Ljava/util/List;)V

    .line 333
    .line 334
    .line 335
    :cond_9
    iget-object p1, v0, Ls3/h;->u:Ljava/lang/String;

    .line 336
    .line 337
    invoke-virtual {v4, p1}, Ls3/j;->B(Ljava/lang/String;)V

    .line 338
    .line 339
    .line 340
    return-object v4

    .line 341
    :cond_a
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 342
    .line 343
    const-string p2, "getMapAsync() must be called on the main thread"

    .line 344
    .line 345
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    throw p1
.end method
