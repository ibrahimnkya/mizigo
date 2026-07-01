.class public final Lc1/i;
.super LW0/a;
.source "SourceFile"


# instance fields
.field public final synthetic d:I

.field public final synthetic e:Ls3/j;


# direct methods
.method public constructor <init>(LB2/a;Ls3/j;I)V
    .locals 0

    iput p3, p0, Lc1/i;->d:I

    packed-switch p3, :pswitch_data_0

    .line 1
    iput-object p2, p0, Lc1/i;->e:Ls3/j;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    const-string p1, "com.google.android.gms.maps.internal.IOnMapLongClickListener"

    const/4 p2, 0x2

    invoke-direct {p0, p1, p2}, LW0/a;-><init>(Ljava/lang/String;I)V

    return-void

    .line 3
    :pswitch_0
    iput-object p2, p0, Lc1/i;->e:Ls3/j;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    const-string p1, "com.google.android.gms.maps.internal.IOnMapClickListener"

    const/4 p2, 0x2

    invoke-direct {p0, p1, p2}, LW0/a;-><init>(Ljava/lang/String;I)V

    return-void

    .line 5
    :pswitch_1
    iput-object p2, p0, Lc1/i;->e:Ls3/j;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    const-string p1, "com.google.android.gms.maps.internal.IOnCameraMoveListener"

    const/4 p2, 0x2

    invoke-direct {p0, p1, p2}, LW0/a;-><init>(Ljava/lang/String;I)V

    return-void

    .line 7
    :pswitch_2
    iput-object p2, p0, Lc1/i;->e:Ls3/j;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    const-string p1, "com.google.android.gms.maps.internal.IOnCameraMoveStartedListener"

    const/4 p2, 0x2

    invoke-direct {p0, p1, p2}, LW0/a;-><init>(Ljava/lang/String;I)V

    return-void

    .line 9
    :pswitch_3
    iput-object p2, p0, Lc1/i;->e:Ls3/j;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    const-string p1, "com.google.android.gms.maps.internal.IOnPolylineClickListener"

    const/4 p2, 0x2

    invoke-direct {p0, p1, p2}, LW0/a;-><init>(Ljava/lang/String;I)V

    return-void

    .line 11
    :pswitch_4
    iput-object p2, p0, Lc1/i;->e:Ls3/j;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    const-string p1, "com.google.android.gms.maps.internal.IOnPolygonClickListener"

    const/4 p2, 0x2

    invoke-direct {p0, p1, p2}, LW0/a;-><init>(Ljava/lang/String;I)V

    return-void

    .line 13
    :pswitch_5
    iput-object p2, p0, Lc1/i;->e:Ls3/j;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    const-string p1, "com.google.android.gms.maps.internal.IOnCircleClickListener"

    const/4 p2, 0x2

    invoke-direct {p0, p1, p2}, LW0/a;-><init>(Ljava/lang/String;I)V

    return-void

    .line 15
    :pswitch_6
    iput-object p2, p0, Lc1/i;->e:Ls3/j;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    const-string p1, "com.google.android.gms.maps.internal.IOnGroundOverlayClickListener"

    const/4 p2, 0x2

    invoke-direct {p0, p1, p2}, LW0/a;-><init>(Ljava/lang/String;I)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public constructor <init>(LB2/a;Ls3/j;ZS)V
    .locals 0

    const/4 p1, 0x1

    iput p1, p0, Lc1/i;->d:I

    .line 17
    iput-object p2, p0, Lc1/i;->e:Ls3/j;

    .line 18
    const-string p1, "com.google.android.gms.maps.internal.IOnMapReadyCallback"

    const/4 p2, 0x2

    invoke-direct {p0, p1, p2}, LW0/a;-><init>(Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final d(ILandroid/os/Parcel;Landroid/os/Parcel;)Z
    .locals 16

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move/from16 v0, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    iget v3, v1, Lc1/i;->d:I

    .line 8
    .line 9
    packed-switch v3, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    const/4 v3, 0x1

    .line 13
    if-ne v0, v3, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/google/android/gms/maps/model/LatLng;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 16
    .line 17
    invoke-static {v2, v0}, LZ0/r;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/google/android/gms/maps/model/LatLng;

    .line 22
    .line 23
    invoke-static {v2}, LZ0/r;->b(Landroid/os/Parcel;)V

    .line 24
    .line 25
    .line 26
    iget-object v2, v1, Lc1/i;->e:Ls3/j;

    .line 27
    .line 28
    iget-object v2, v2, Ls3/j;->f:LZ2/s;

    .line 29
    .line 30
    invoke-static {v0}, Landroid/support/v4/media/session/a;->E(Lcom/google/android/gms/maps/model/LatLng;)Ls3/j0;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v4, LK0/h;

    .line 35
    .line 36
    const/16 v5, 0x11

    .line 37
    .line 38
    invoke-direct {v4, v5}, LK0/h;-><init>(I)V

    .line 39
    .line 40
    .line 41
    new-instance v5, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v6, "dev.flutter.pigeon.google_maps_flutter_android.MapsCallbackApi.onTap"

    .line 44
    .line 45
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v6, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 49
    .line 50
    check-cast v6, Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    new-instance v6, LV1/y;

    .line 60
    .line 61
    iget-object v2, v2, LZ2/s;->f:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast v2, Lk3/f;

    .line 64
    .line 65
    sget-object v7, Ls3/B;->d:Ls3/B;

    .line 66
    .line 67
    const/4 v8, 0x0

    .line 68
    invoke-direct {v6, v2, v5, v7, v8}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 69
    .line 70
    .line 71
    new-instance v2, Ljava/util/ArrayList;

    .line 72
    .line 73
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 78
    .line 79
    .line 80
    new-instance v0, LV1/n;

    .line 81
    .line 82
    const/16 v7, 0xf

    .line 83
    .line 84
    invoke-direct {v0, v4, v5, v7}, LV1/n;-><init>(LK0/h;Ljava/lang/String;I)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v6, v2, v0}, LV1/y;->v(Ljava/io/Serializable;Lk3/c;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_0
    const/4 v3, 0x0

    .line 95
    :goto_0
    return v3

    .line 96
    :pswitch_0
    const/4 v2, 0x1

    .line 97
    if-ne v0, v2, :cond_2

    .line 98
    .line 99
    iget-object v0, v1, Lc1/i;->e:Ls3/j;

    .line 100
    .line 101
    iget-boolean v3, v0, Ls3/j;->k:Z

    .line 102
    .line 103
    if-nez v3, :cond_1

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_1
    iget-object v3, v0, Ls3/j;->f:LZ2/s;

    .line 107
    .line 108
    iget-object v0, v0, Ls3/j;->j:LB2/a;

    .line 109
    .line 110
    invoke-virtual {v0}, LB2/a;->x()Lcom/google/android/gms/maps/model/CameraPosition;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-static {v0}, Landroid/support/v4/media/session/a;->b(Lcom/google/android/gms/maps/model/CameraPosition;)Ls3/K;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    new-instance v4, LK0/h;

    .line 119
    .line 120
    const/16 v5, 0x11

    .line 121
    .line 122
    invoke-direct {v4, v5}, LK0/h;-><init>(I)V

    .line 123
    .line 124
    .line 125
    new-instance v5, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    const-string v6, "dev.flutter.pigeon.google_maps_flutter_android.MapsCallbackApi.onCameraMove"

    .line 128
    .line 129
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    iget-object v6, v3, LZ2/s;->g:Ljava/lang/Object;

    .line 133
    .line 134
    check-cast v6, Ljava/lang/String;

    .line 135
    .line 136
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v5

    .line 143
    new-instance v6, LV1/y;

    .line 144
    .line 145
    iget-object v3, v3, LZ2/s;->f:Ljava/lang/Object;

    .line 146
    .line 147
    check-cast v3, Lk3/f;

    .line 148
    .line 149
    sget-object v7, Ls3/B;->d:Ls3/B;

    .line 150
    .line 151
    const/4 v8, 0x0

    .line 152
    invoke-direct {v6, v3, v5, v7, v8}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 153
    .line 154
    .line 155
    new-instance v3, Ljava/util/ArrayList;

    .line 156
    .line 157
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 162
    .line 163
    .line 164
    new-instance v0, LV1/n;

    .line 165
    .line 166
    const/16 v7, 0xc

    .line 167
    .line 168
    invoke-direct {v0, v4, v5, v7}, LV1/n;-><init>(LK0/h;Ljava/lang/String;I)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v6, v3, v0}, LV1/y;->v(Ljava/io/Serializable;Lk3/c;)V

    .line 172
    .line 173
    .line 174
    :goto_1
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 175
    .line 176
    .line 177
    goto :goto_2

    .line 178
    :cond_2
    const/4 v2, 0x0

    .line 179
    :goto_2
    return v2

    .line 180
    :pswitch_1
    const/4 v3, 0x1

    .line 181
    if-ne v0, v3, :cond_3

    .line 182
    .line 183
    invoke-virtual {v2}, Landroid/os/Parcel;->readInt()I

    .line 184
    .line 185
    .line 186
    invoke-static {v2}, LZ0/r;->b(Landroid/os/Parcel;)V

    .line 187
    .line 188
    .line 189
    iget-object v0, v1, Lc1/i;->e:Ls3/j;

    .line 190
    .line 191
    iget-object v0, v0, Ls3/j;->f:LZ2/s;

    .line 192
    .line 193
    new-instance v2, LK0/h;

    .line 194
    .line 195
    const/16 v4, 0x11

    .line 196
    .line 197
    invoke-direct {v2, v4}, LK0/h;-><init>(I)V

    .line 198
    .line 199
    .line 200
    new-instance v4, Ljava/lang/StringBuilder;

    .line 201
    .line 202
    const-string v5, "dev.flutter.pigeon.google_maps_flutter_android.MapsCallbackApi.onCameraMoveStarted"

    .line 203
    .line 204
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    iget-object v5, v0, LZ2/s;->g:Ljava/lang/Object;

    .line 208
    .line 209
    check-cast v5, Ljava/lang/String;

    .line 210
    .line 211
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v4

    .line 218
    new-instance v5, LV1/y;

    .line 219
    .line 220
    iget-object v0, v0, LZ2/s;->f:Ljava/lang/Object;

    .line 221
    .line 222
    check-cast v0, Lk3/f;

    .line 223
    .line 224
    sget-object v6, Ls3/B;->d:Ls3/B;

    .line 225
    .line 226
    const/4 v7, 0x0

    .line 227
    invoke-direct {v5, v0, v4, v6, v7}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 228
    .line 229
    .line 230
    new-instance v0, LV1/n;

    .line 231
    .line 232
    const/16 v6, 0xe

    .line 233
    .line 234
    invoke-direct {v0, v2, v4, v6}, LV1/n;-><init>(LK0/h;Ljava/lang/String;I)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {v5, v7, v0}, LV1/y;->v(Ljava/io/Serializable;Lk3/c;)V

    .line 238
    .line 239
    .line 240
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 241
    .line 242
    .line 243
    goto :goto_3

    .line 244
    :cond_3
    const/4 v3, 0x0

    .line 245
    :goto_3
    return v3

    .line 246
    :pswitch_2
    const/4 v3, 0x1

    .line 247
    if-ne v0, v3, :cond_7

    .line 248
    .line 249
    invoke-virtual {v2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    const/4 v4, 0x0

    .line 254
    if-nez v0, :cond_4

    .line 255
    .line 256
    move-object v6, v4

    .line 257
    goto :goto_4

    .line 258
    :cond_4
    const-string v5, "com.google.android.gms.maps.model.internal.IPolylineDelegate"

    .line 259
    .line 260
    invoke-interface {v0, v5}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 261
    .line 262
    .line 263
    move-result-object v6

    .line 264
    instance-of v7, v6, LZ0/l;

    .line 265
    .line 266
    if-eqz v7, :cond_5

    .line 267
    .line 268
    check-cast v6, LZ0/l;

    .line 269
    .line 270
    goto :goto_4

    .line 271
    :cond_5
    new-instance v6, LZ0/j;

    .line 272
    .line 273
    const/4 v7, 0x1

    .line 274
    invoke-direct {v6, v0, v5, v7}, LY0/a;-><init>(Landroid/os/IBinder;Ljava/lang/String;I)V

    .line 275
    .line 276
    .line 277
    :goto_4
    invoke-static {v2}, LZ0/r;->b(Landroid/os/Parcel;)V

    .line 278
    .line 279
    .line 280
    invoke-static {v6}, LN0/n;->e(Ljava/lang/Object;)V

    .line 281
    .line 282
    .line 283
    iget-object v0, v1, Lc1/i;->e:Ls3/j;

    .line 284
    .line 285
    iget-object v0, v0, Ls3/j;->z:Ls3/I0;

    .line 286
    .line 287
    :try_start_0
    check-cast v6, LZ0/j;

    .line 288
    .line 289
    invoke-virtual {v6}, LY0/a;->c()Landroid/os/Parcel;

    .line 290
    .line 291
    .line 292
    move-result-object v2

    .line 293
    const/4 v5, 0x2

    .line 294
    invoke-virtual {v6, v2, v5}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 295
    .line 296
    .line 297
    move-result-object v2

    .line 298
    invoke-virtual {v2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object v5

    .line 302
    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 303
    .line 304
    .line 305
    iget-object v2, v0, Ls3/I0;->b:Ljava/util/HashMap;

    .line 306
    .line 307
    invoke-virtual {v2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 308
    .line 309
    .line 310
    move-result-object v2

    .line 311
    check-cast v2, Ljava/lang/String;

    .line 312
    .line 313
    if-nez v2, :cond_6

    .line 314
    .line 315
    goto :goto_5

    .line 316
    :cond_6
    iget-object v5, v0, Ls3/I0;->c:LZ2/s;

    .line 317
    .line 318
    new-instance v6, LK0/h;

    .line 319
    .line 320
    const/16 v7, 0x11

    .line 321
    .line 322
    invoke-direct {v6, v7}, LK0/h;-><init>(I)V

    .line 323
    .line 324
    .line 325
    new-instance v7, Ljava/lang/StringBuilder;

    .line 326
    .line 327
    const-string v8, "dev.flutter.pigeon.google_maps_flutter_android.MapsCallbackApi.onPolylineTap"

    .line 328
    .line 329
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 330
    .line 331
    .line 332
    iget-object v8, v5, LZ2/s;->g:Ljava/lang/Object;

    .line 333
    .line 334
    check-cast v8, Ljava/lang/String;

    .line 335
    .line 336
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 337
    .line 338
    .line 339
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 340
    .line 341
    .line 342
    move-result-object v7

    .line 343
    new-instance v8, LV1/y;

    .line 344
    .line 345
    iget-object v5, v5, LZ2/s;->f:Ljava/lang/Object;

    .line 346
    .line 347
    check-cast v5, Lk3/f;

    .line 348
    .line 349
    sget-object v9, Ls3/B;->d:Ls3/B;

    .line 350
    .line 351
    invoke-direct {v8, v5, v7, v9, v4}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 352
    .line 353
    .line 354
    new-instance v4, Ljava/util/ArrayList;

    .line 355
    .line 356
    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 357
    .line 358
    .line 359
    move-result-object v5

    .line 360
    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 361
    .line 362
    .line 363
    new-instance v5, LV1/n;

    .line 364
    .line 365
    const/16 v9, 0xb

    .line 366
    .line 367
    invoke-direct {v5, v6, v7, v9}, LV1/n;-><init>(LK0/h;Ljava/lang/String;I)V

    .line 368
    .line 369
    .line 370
    invoke-virtual {v8, v4, v5}, LV1/y;->v(Ljava/io/Serializable;Lk3/c;)V

    .line 371
    .line 372
    .line 373
    iget-object v0, v0, Ls3/I0;->a:Ljava/util/HashMap;

    .line 374
    .line 375
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 376
    .line 377
    .line 378
    move-result-object v0

    .line 379
    check-cast v0, Ls3/G0;

    .line 380
    .line 381
    :goto_5
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 382
    .line 383
    .line 384
    goto :goto_6

    .line 385
    :catch_0
    move-exception v0

    .line 386
    new-instance v2, Le1/x;

    .line 387
    .line 388
    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 389
    .line 390
    .line 391
    throw v2

    .line 392
    :cond_7
    const/4 v3, 0x0

    .line 393
    :goto_6
    return v3

    .line 394
    :pswitch_3
    const/4 v3, 0x1

    .line 395
    if-ne v0, v3, :cond_b

    .line 396
    .line 397
    invoke-virtual {v2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 398
    .line 399
    .line 400
    move-result-object v0

    .line 401
    const/4 v4, 0x0

    .line 402
    if-nez v0, :cond_8

    .line 403
    .line 404
    move-object v6, v4

    .line 405
    goto :goto_7

    .line 406
    :cond_8
    const-string v5, "com.google.android.gms.maps.model.internal.IPolygonDelegate"

    .line 407
    .line 408
    invoke-interface {v0, v5}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 409
    .line 410
    .line 411
    move-result-object v6

    .line 412
    instance-of v7, v6, LZ0/i;

    .line 413
    .line 414
    if-eqz v7, :cond_9

    .line 415
    .line 416
    check-cast v6, LZ0/i;

    .line 417
    .line 418
    goto :goto_7

    .line 419
    :cond_9
    new-instance v6, LZ0/g;

    .line 420
    .line 421
    const/4 v7, 0x1

    .line 422
    invoke-direct {v6, v0, v5, v7}, LY0/a;-><init>(Landroid/os/IBinder;Ljava/lang/String;I)V

    .line 423
    .line 424
    .line 425
    :goto_7
    invoke-static {v2}, LZ0/r;->b(Landroid/os/Parcel;)V

    .line 426
    .line 427
    .line 428
    invoke-static {v6}, LN0/n;->e(Ljava/lang/Object;)V

    .line 429
    .line 430
    .line 431
    iget-object v0, v1, Lc1/i;->e:Ls3/j;

    .line 432
    .line 433
    iget-object v0, v0, Ls3/j;->y:Ls3/d;

    .line 434
    .line 435
    :try_start_1
    check-cast v6, LZ0/g;

    .line 436
    .line 437
    invoke-virtual {v6}, LY0/a;->c()Landroid/os/Parcel;

    .line 438
    .line 439
    .line 440
    move-result-object v2

    .line 441
    const/4 v5, 0x2

    .line 442
    invoke-virtual {v6, v2, v5}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 443
    .line 444
    .line 445
    move-result-object v2

    .line 446
    invoke-virtual {v2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 447
    .line 448
    .line 449
    move-result-object v5

    .line 450
    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 451
    .line 452
    .line 453
    iget-object v2, v0, Ls3/d;->b:Ljava/util/HashMap;

    .line 454
    .line 455
    invoke-virtual {v2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 456
    .line 457
    .line 458
    move-result-object v2

    .line 459
    check-cast v2, Ljava/lang/String;

    .line 460
    .line 461
    if-nez v2, :cond_a

    .line 462
    .line 463
    goto :goto_8

    .line 464
    :cond_a
    iget-object v5, v0, Ls3/d;->c:LZ2/s;

    .line 465
    .line 466
    new-instance v6, LK0/h;

    .line 467
    .line 468
    const/16 v7, 0x11

    .line 469
    .line 470
    invoke-direct {v6, v7}, LK0/h;-><init>(I)V

    .line 471
    .line 472
    .line 473
    new-instance v7, Ljava/lang/StringBuilder;

    .line 474
    .line 475
    const-string v8, "dev.flutter.pigeon.google_maps_flutter_android.MapsCallbackApi.onPolygonTap"

    .line 476
    .line 477
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 478
    .line 479
    .line 480
    iget-object v8, v5, LZ2/s;->g:Ljava/lang/Object;

    .line 481
    .line 482
    check-cast v8, Ljava/lang/String;

    .line 483
    .line 484
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 485
    .line 486
    .line 487
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 488
    .line 489
    .line 490
    move-result-object v7

    .line 491
    new-instance v8, LV1/y;

    .line 492
    .line 493
    iget-object v5, v5, LZ2/s;->f:Ljava/lang/Object;

    .line 494
    .line 495
    check-cast v5, Lk3/f;

    .line 496
    .line 497
    sget-object v9, Ls3/B;->d:Ls3/B;

    .line 498
    .line 499
    invoke-direct {v8, v5, v7, v9, v4}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 500
    .line 501
    .line 502
    new-instance v4, Ljava/util/ArrayList;

    .line 503
    .line 504
    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 505
    .line 506
    .line 507
    move-result-object v5

    .line 508
    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 509
    .line 510
    .line 511
    new-instance v5, LV1/n;

    .line 512
    .line 513
    const/16 v9, 0x12

    .line 514
    .line 515
    invoke-direct {v5, v6, v7, v9}, LV1/n;-><init>(LK0/h;Ljava/lang/String;I)V

    .line 516
    .line 517
    .line 518
    invoke-virtual {v8, v4, v5}, LV1/y;->v(Ljava/io/Serializable;Lk3/c;)V

    .line 519
    .line 520
    .line 521
    iget-object v0, v0, Ls3/d;->a:Ljava/util/HashMap;

    .line 522
    .line 523
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 524
    .line 525
    .line 526
    move-result-object v0

    .line 527
    check-cast v0, Ls3/E0;

    .line 528
    .line 529
    :goto_8
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 530
    .line 531
    .line 532
    goto :goto_9

    .line 533
    :catch_1
    move-exception v0

    .line 534
    new-instance v2, Le1/x;

    .line 535
    .line 536
    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 537
    .line 538
    .line 539
    throw v2

    .line 540
    :cond_b
    const/4 v3, 0x0

    .line 541
    :goto_9
    return v3

    .line 542
    :pswitch_4
    const/4 v3, 0x1

    .line 543
    if-ne v0, v3, :cond_f

    .line 544
    .line 545
    invoke-virtual {v2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 546
    .line 547
    .line 548
    move-result-object v0

    .line 549
    const/4 v4, 0x0

    .line 550
    if-nez v0, :cond_c

    .line 551
    .line 552
    move-object v6, v4

    .line 553
    goto :goto_a

    .line 554
    :cond_c
    const-string v5, "com.google.android.gms.maps.model.internal.ICircleDelegate"

    .line 555
    .line 556
    invoke-interface {v0, v5}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 557
    .line 558
    .line 559
    move-result-object v6

    .line 560
    instance-of v7, v6, LZ0/x;

    .line 561
    .line 562
    if-eqz v7, :cond_d

    .line 563
    .line 564
    check-cast v6, LZ0/x;

    .line 565
    .line 566
    goto :goto_a

    .line 567
    :cond_d
    new-instance v6, LZ0/v;

    .line 568
    .line 569
    const/4 v7, 0x1

    .line 570
    invoke-direct {v6, v0, v5, v7}, LY0/a;-><init>(Landroid/os/IBinder;Ljava/lang/String;I)V

    .line 571
    .line 572
    .line 573
    :goto_a
    invoke-static {v2}, LZ0/r;->b(Landroid/os/Parcel;)V

    .line 574
    .line 575
    .line 576
    invoke-static {v6}, LN0/n;->e(Ljava/lang/Object;)V

    .line 577
    .line 578
    .line 579
    iget-object v0, v1, Lc1/i;->e:Ls3/j;

    .line 580
    .line 581
    iget-object v0, v0, Ls3/j;->A:Ls3/d;

    .line 582
    .line 583
    :try_start_2
    check-cast v6, LZ0/v;

    .line 584
    .line 585
    invoke-virtual {v6}, LY0/a;->c()Landroid/os/Parcel;

    .line 586
    .line 587
    .line 588
    move-result-object v2

    .line 589
    const/4 v5, 0x2

    .line 590
    invoke-virtual {v6, v2, v5}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 591
    .line 592
    .line 593
    move-result-object v2

    .line 594
    invoke-virtual {v2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 595
    .line 596
    .line 597
    move-result-object v5

    .line 598
    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_2

    .line 599
    .line 600
    .line 601
    iget-object v2, v0, Ls3/d;->b:Ljava/util/HashMap;

    .line 602
    .line 603
    invoke-virtual {v2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 604
    .line 605
    .line 606
    move-result-object v2

    .line 607
    check-cast v2, Ljava/lang/String;

    .line 608
    .line 609
    if-nez v2, :cond_e

    .line 610
    .line 611
    goto :goto_b

    .line 612
    :cond_e
    iget-object v5, v0, Ls3/d;->c:LZ2/s;

    .line 613
    .line 614
    new-instance v6, LK0/h;

    .line 615
    .line 616
    const/16 v7, 0x11

    .line 617
    .line 618
    invoke-direct {v6, v7}, LK0/h;-><init>(I)V

    .line 619
    .line 620
    .line 621
    new-instance v7, Ljava/lang/StringBuilder;

    .line 622
    .line 623
    const-string v8, "dev.flutter.pigeon.google_maps_flutter_android.MapsCallbackApi.onCircleTap"

    .line 624
    .line 625
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 626
    .line 627
    .line 628
    iget-object v8, v5, LZ2/s;->g:Ljava/lang/Object;

    .line 629
    .line 630
    check-cast v8, Ljava/lang/String;

    .line 631
    .line 632
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 633
    .line 634
    .line 635
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 636
    .line 637
    .line 638
    move-result-object v7

    .line 639
    new-instance v8, LV1/y;

    .line 640
    .line 641
    iget-object v5, v5, LZ2/s;->f:Ljava/lang/Object;

    .line 642
    .line 643
    check-cast v5, Lk3/f;

    .line 644
    .line 645
    sget-object v9, Ls3/B;->d:Ls3/B;

    .line 646
    .line 647
    invoke-direct {v8, v5, v7, v9, v4}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 648
    .line 649
    .line 650
    new-instance v4, Ljava/util/ArrayList;

    .line 651
    .line 652
    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 653
    .line 654
    .line 655
    move-result-object v5

    .line 656
    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 657
    .line 658
    .line 659
    new-instance v5, LV1/n;

    .line 660
    .line 661
    const/4 v9, 0x6

    .line 662
    invoke-direct {v5, v6, v7, v9}, LV1/n;-><init>(LK0/h;Ljava/lang/String;I)V

    .line 663
    .line 664
    .line 665
    invoke-virtual {v8, v4, v5}, LV1/y;->v(Ljava/io/Serializable;Lk3/c;)V

    .line 666
    .line 667
    .line 668
    iget-object v0, v0, Ls3/d;->a:Ljava/util/HashMap;

    .line 669
    .line 670
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 671
    .line 672
    .line 673
    move-result-object v0

    .line 674
    check-cast v0, Ls3/b;

    .line 675
    .line 676
    :goto_b
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 677
    .line 678
    .line 679
    goto :goto_c

    .line 680
    :catch_2
    move-exception v0

    .line 681
    new-instance v2, Le1/x;

    .line 682
    .line 683
    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 684
    .line 685
    .line 686
    throw v2

    .line 687
    :cond_f
    const/4 v3, 0x0

    .line 688
    :goto_c
    return v3

    .line 689
    :pswitch_5
    const/4 v3, 0x1

    .line 690
    if-ne v0, v3, :cond_13

    .line 691
    .line 692
    invoke-virtual {v2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 693
    .line 694
    .line 695
    move-result-object v0

    .line 696
    const/4 v4, 0x0

    .line 697
    if-nez v0, :cond_10

    .line 698
    .line 699
    move-object v6, v4

    .line 700
    goto :goto_d

    .line 701
    :cond_10
    const-string v5, "com.google.android.gms.maps.model.internal.IGroundOverlayDelegate"

    .line 702
    .line 703
    invoke-interface {v0, v5}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 704
    .line 705
    .line 706
    move-result-object v6

    .line 707
    instance-of v7, v6, LZ0/A;

    .line 708
    .line 709
    if-eqz v7, :cond_11

    .line 710
    .line 711
    check-cast v6, LZ0/A;

    .line 712
    .line 713
    goto :goto_d

    .line 714
    :cond_11
    new-instance v6, LZ0/y;

    .line 715
    .line 716
    const/4 v7, 0x1

    .line 717
    invoke-direct {v6, v0, v5, v7}, LY0/a;-><init>(Landroid/os/IBinder;Ljava/lang/String;I)V

    .line 718
    .line 719
    .line 720
    :goto_d
    invoke-static {v2}, LZ0/r;->b(Landroid/os/Parcel;)V

    .line 721
    .line 722
    .line 723
    invoke-static {v6}, LN0/n;->e(Ljava/lang/Object;)V

    .line 724
    .line 725
    .line 726
    iget-object v0, v1, Lc1/i;->e:Ls3/j;

    .line 727
    .line 728
    iget-object v0, v0, Ls3/j;->D:Ls3/q;

    .line 729
    .line 730
    :try_start_3
    check-cast v6, LZ0/y;

    .line 731
    .line 732
    invoke-virtual {v6}, LY0/a;->c()Landroid/os/Parcel;

    .line 733
    .line 734
    .line 735
    move-result-object v2

    .line 736
    const/4 v5, 0x2

    .line 737
    invoke-virtual {v6, v2, v5}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 738
    .line 739
    .line 740
    move-result-object v2

    .line 741
    invoke-virtual {v2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 742
    .line 743
    .line 744
    move-result-object v5

    .line 745
    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_3

    .line 746
    .line 747
    .line 748
    iget-object v2, v0, Ls3/q;->b:Ljava/util/HashMap;

    .line 749
    .line 750
    invoke-virtual {v2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 751
    .line 752
    .line 753
    move-result-object v2

    .line 754
    check-cast v2, Ljava/lang/String;

    .line 755
    .line 756
    if-nez v2, :cond_12

    .line 757
    .line 758
    goto :goto_e

    .line 759
    :cond_12
    iget-object v0, v0, Ls3/q;->c:LZ2/s;

    .line 760
    .line 761
    new-instance v5, LK0/h;

    .line 762
    .line 763
    const/16 v6, 0x11

    .line 764
    .line 765
    invoke-direct {v5, v6}, LK0/h;-><init>(I)V

    .line 766
    .line 767
    .line 768
    new-instance v6, Ljava/lang/StringBuilder;

    .line 769
    .line 770
    const-string v7, "dev.flutter.pigeon.google_maps_flutter_android.MapsCallbackApi.onGroundOverlayTap"

    .line 771
    .line 772
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 773
    .line 774
    .line 775
    iget-object v7, v0, LZ2/s;->g:Ljava/lang/Object;

    .line 776
    .line 777
    check-cast v7, Ljava/lang/String;

    .line 778
    .line 779
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 780
    .line 781
    .line 782
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 783
    .line 784
    .line 785
    move-result-object v6

    .line 786
    new-instance v7, LV1/y;

    .line 787
    .line 788
    iget-object v0, v0, LZ2/s;->f:Ljava/lang/Object;

    .line 789
    .line 790
    check-cast v0, Lk3/f;

    .line 791
    .line 792
    sget-object v8, Ls3/B;->d:Ls3/B;

    .line 793
    .line 794
    invoke-direct {v7, v0, v6, v8, v4}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 795
    .line 796
    .line 797
    new-instance v0, Ljava/util/ArrayList;

    .line 798
    .line 799
    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 800
    .line 801
    .line 802
    move-result-object v2

    .line 803
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 804
    .line 805
    .line 806
    new-instance v2, LV1/n;

    .line 807
    .line 808
    const/16 v4, 0x8

    .line 809
    .line 810
    invoke-direct {v2, v5, v6, v4}, LV1/n;-><init>(LK0/h;Ljava/lang/String;I)V

    .line 811
    .line 812
    .line 813
    invoke-virtual {v7, v0, v2}, LV1/y;->v(Ljava/io/Serializable;Lk3/c;)V

    .line 814
    .line 815
    .line 816
    :goto_e
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 817
    .line 818
    .line 819
    goto :goto_f

    .line 820
    :catch_3
    move-exception v0

    .line 821
    new-instance v2, Le1/x;

    .line 822
    .line 823
    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 824
    .line 825
    .line 826
    throw v2

    .line 827
    :cond_13
    const/4 v3, 0x0

    .line 828
    :goto_f
    return v3

    .line 829
    :pswitch_6
    const/4 v4, 0x1

    .line 830
    if-ne v0, v4, :cond_25

    .line 831
    .line 832
    invoke-virtual {v2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 833
    .line 834
    .line 835
    move-result-object v0

    .line 836
    if-nez v0, :cond_14

    .line 837
    .line 838
    const/4 v7, 0x0

    .line 839
    goto :goto_10

    .line 840
    :cond_14
    const-string v6, "com.google.android.gms.maps.internal.IGoogleMapDelegate"

    .line 841
    .line 842
    invoke-interface {v0, v6}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 843
    .line 844
    .line 845
    move-result-object v7

    .line 846
    instance-of v8, v7, Ld1/g;

    .line 847
    .line 848
    if-eqz v8, :cond_15

    .line 849
    .line 850
    check-cast v7, Ld1/g;

    .line 851
    .line 852
    goto :goto_10

    .line 853
    :cond_15
    new-instance v7, Ld1/g;

    .line 854
    .line 855
    const/4 v8, 0x1

    .line 856
    invoke-direct {v7, v0, v6, v8}, LY0/a;-><init>(Landroid/os/IBinder;Ljava/lang/String;I)V

    .line 857
    .line 858
    .line 859
    :goto_10
    invoke-static {v2}, LZ0/r;->b(Landroid/os/Parcel;)V

    .line 860
    .line 861
    .line 862
    new-instance v0, LB2/a;

    .line 863
    .line 864
    invoke-direct {v0, v7}, LB2/a;-><init>(Ld1/g;)V

    .line 865
    .line 866
    .line 867
    iget-object v2, v1, Lc1/i;->e:Ls3/j;

    .line 868
    .line 869
    iput-object v0, v2, Ls3/j;->j:LB2/a;

    .line 870
    .line 871
    iget-object v6, v2, Ls3/j;->D:Ls3/q;

    .line 872
    .line 873
    iget-object v7, v2, Ls3/j;->C:Lm/x0;

    .line 874
    .line 875
    iget-object v8, v2, Ls3/j;->B:Ll2/b;

    .line 876
    .line 877
    iget-object v9, v2, Ls3/j;->A:Ls3/d;

    .line 878
    .line 879
    iget-object v10, v2, Ls3/j;->z:Ls3/I0;

    .line 880
    .line 881
    iget-object v11, v2, Ls3/j;->y:Ls3/d;

    .line 882
    .line 883
    iget-object v12, v2, Ls3/j;->w:Ls3/w;

    .line 884
    .line 885
    iget-object v13, v2, Ls3/j;->x:Ls3/g;

    .line 886
    .line 887
    iget-boolean v14, v2, Ls3/j;->o:Z

    .line 888
    .line 889
    :try_start_4
    iget-object v15, v0, LB2/a;->f:Ljava/lang/Object;

    .line 890
    .line 891
    check-cast v15, Ld1/g;

    .line 892
    .line 893
    invoke-virtual {v15}, LY0/a;->c()Landroid/os/Parcel;

    .line 894
    .line 895
    .line 896
    move-result-object v4

    .line 897
    invoke-virtual {v4, v14}, Landroid/os/Parcel;->writeInt(I)V

    .line 898
    .line 899
    .line 900
    const/16 v14, 0x14

    .line 901
    .line 902
    invoke-virtual {v15, v4, v14}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 903
    .line 904
    .line 905
    move-result-object v4

    .line 906
    invoke-virtual {v4}, Landroid/os/Parcel;->readInt()I

    .line 907
    .line 908
    .line 909
    invoke-virtual {v4}, Landroid/os/Parcel;->recycle()V
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_5

    .line 910
    .line 911
    .line 912
    iget-object v4, v2, Ls3/j;->j:LB2/a;

    .line 913
    .line 914
    iget-boolean v14, v2, Ls3/j;->p:Z

    .line 915
    .line 916
    invoke-virtual {v4, v14}, LB2/a;->S(Z)V

    .line 917
    .line 918
    .line 919
    iget-object v4, v2, Ls3/j;->j:LB2/a;

    .line 920
    .line 921
    iget-boolean v14, v2, Ls3/j;->q:Z

    .line 922
    .line 923
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 924
    .line 925
    .line 926
    :try_start_5
    iget-object v4, v4, LB2/a;->f:Ljava/lang/Object;

    .line 927
    .line 928
    check-cast v4, Ld1/g;

    .line 929
    .line 930
    invoke-virtual {v4}, LY0/a;->c()Landroid/os/Parcel;

    .line 931
    .line 932
    .line 933
    move-result-object v15

    .line 934
    invoke-virtual {v15, v14}, Landroid/os/Parcel;->writeInt(I)V

    .line 935
    .line 936
    .line 937
    const/16 v14, 0x29

    .line 938
    .line 939
    invoke-virtual {v4, v15, v14}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_4

    .line 940
    .line 941
    .line 942
    iget-object v4, v2, Ls3/j;->i:Lc1/f;

    .line 943
    .line 944
    const-string v14, "GoogleMapController"

    .line 945
    .line 946
    if-nez v4, :cond_16

    .line 947
    .line 948
    goto :goto_11

    .line 949
    :cond_16
    invoke-static {v4}, Ls3/j;->J(Landroid/view/ViewGroup;)Landroid/view/TextureView;

    .line 950
    .line 951
    .line 952
    move-result-object v4

    .line 953
    if-nez v4, :cond_17

    .line 954
    .line 955
    const-string v4, "No TextureView found. Likely using the LEGACY renderer."

    .line 956
    .line 957
    invoke-static {v14, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 958
    .line 959
    .line 960
    goto :goto_11

    .line 961
    :cond_17
    const-string v15, "Installing custom TextureView driven invalidator."

    .line 962
    .line 963
    invoke-static {v14, v15}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 964
    .line 965
    .line 966
    invoke-virtual {v4}, Landroid/view/TextureView;->getSurfaceTextureListener()Landroid/view/TextureView$SurfaceTextureListener;

    .line 967
    .line 968
    .line 969
    move-result-object v15

    .line 970
    iget-object v3, v2, Ls3/j;->i:Lc1/f;

    .line 971
    .line 972
    new-instance v5, Ls3/i;

    .line 973
    .line 974
    invoke-direct {v5, v15, v3}, Ls3/i;-><init>(Landroid/view/TextureView$SurfaceTextureListener;Lc1/f;)V

    .line 975
    .line 976
    .line 977
    invoke-virtual {v4, v5}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 978
    .line 979
    .line 980
    :goto_11
    iget-object v3, v2, Ls3/j;->t:Lp3/i;

    .line 981
    .line 982
    if-eqz v3, :cond_18

    .line 983
    .line 984
    invoke-virtual {v3}, Lp3/i;->e()V

    .line 985
    .line 986
    .line 987
    const/4 v3, 0x0

    .line 988
    iput-object v3, v2, Ls3/j;->t:Lp3/i;

    .line 989
    .line 990
    :cond_18
    invoke-virtual {v2, v2}, Ls3/j;->U(Ls3/j;)V

    .line 991
    .line 992
    .line 993
    new-instance v3, Ll2/b;

    .line 994
    .line 995
    invoke-direct {v3, v0}, Ll2/b;-><init>(LB2/a;)V

    .line 996
    .line 997
    .line 998
    iput-object v3, v2, Ls3/j;->E:Ll2/b;

    .line 999
    .line 1000
    new-instance v4, Ll2/a;

    .line 1001
    .line 1002
    invoke-direct {v4, v3}, Ll2/a;-><init>(Ll2/b;)V

    .line 1003
    .line 1004
    .line 1005
    iput-object v4, v2, Ls3/j;->F:Ll2/a;

    .line 1006
    .line 1007
    invoke-virtual {v2}, Ls3/j;->d0()V

    .line 1008
    .line 1009
    .line 1010
    iget-object v3, v2, Ls3/j;->F:Ll2/a;

    .line 1011
    .line 1012
    iput-object v3, v12, Ls3/w;->e:Ll2/a;

    .line 1013
    .line 1014
    iget-object v4, v2, Ls3/j;->E:Ll2/b;

    .line 1015
    .line 1016
    iput-object v4, v13, Ls3/g;->h:Ll2/b;

    .line 1017
    .line 1018
    iput-object v0, v13, Ls3/g;->i:LB2/a;

    .line 1019
    .line 1020
    iput-object v0, v11, Ls3/d;->e:LB2/a;

    .line 1021
    .line 1022
    iput-object v0, v10, Ls3/I0;->d:LB2/a;

    .line 1023
    .line 1024
    iput-object v0, v9, Ls3/d;->e:LB2/a;

    .line 1025
    .line 1026
    iput-object v0, v8, Ll2/b;->f:LB2/a;

    .line 1027
    .line 1028
    iput-object v0, v7, Lm/x0;->h:Ljava/lang/Object;

    .line 1029
    .line 1030
    iput-object v0, v6, Ls3/q;->d:LB2/a;

    .line 1031
    .line 1032
    iget-object v0, v2, Ls3/j;->j:LB2/a;

    .line 1033
    .line 1034
    const-string v4, "Controller was disposed before GoogleMap was ready."

    .line 1035
    .line 1036
    if-nez v0, :cond_19

    .line 1037
    .line 1038
    invoke-static {v14, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1039
    .line 1040
    .line 1041
    goto :goto_12

    .line 1042
    :cond_19
    iput-object v2, v3, Ll2/a;->e:Lc1/d;

    .line 1043
    .line 1044
    iput-object v2, v3, Ll2/a;->f:Ls3/j;

    .line 1045
    .line 1046
    iput-object v2, v3, Ll2/a;->c:Lc1/b;

    .line 1047
    .line 1048
    :goto_12
    invoke-virtual {v2, v2}, Ls3/j;->T(Ls3/j;)V

    .line 1049
    .line 1050
    .line 1051
    iget-object v0, v2, Ls3/j;->j:LB2/a;

    .line 1052
    .line 1053
    if-nez v0, :cond_1a

    .line 1054
    .line 1055
    invoke-static {v14, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1056
    .line 1057
    .line 1058
    goto :goto_13

    .line 1059
    :cond_1a
    iput-object v2, v13, Ls3/g;->l:Ls3/j;

    .line 1060
    .line 1061
    :goto_13
    iget-object v0, v2, Ls3/j;->H:Ljava/util/List;

    .line 1062
    .line 1063
    if-eqz v0, :cond_1b

    .line 1064
    .line 1065
    invoke-virtual {v13, v0}, Ls3/g;->a(Ljava/util/List;)V

    .line 1066
    .line 1067
    .line 1068
    :cond_1b
    iget-object v0, v2, Ls3/j;->G:Ljava/util/List;

    .line 1069
    .line 1070
    if-eqz v0, :cond_1c

    .line 1071
    .line 1072
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1073
    .line 1074
    .line 1075
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 1076
    .line 1077
    .line 1078
    move-result-object v0

    .line 1079
    :goto_14
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 1080
    .line 1081
    .line 1082
    move-result v3

    .line 1083
    if-eqz v3, :cond_1c

    .line 1084
    .line 1085
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1086
    .line 1087
    .line 1088
    move-result-object v3

    .line 1089
    check-cast v3, Ls3/p0;

    .line 1090
    .line 1091
    invoke-virtual {v12, v3}, Ls3/w;->a(Ls3/p0;)V

    .line 1092
    .line 1093
    .line 1094
    goto :goto_14

    .line 1095
    :cond_1c
    iget-object v0, v2, Ls3/j;->I:Ljava/util/List;

    .line 1096
    .line 1097
    if-eqz v0, :cond_1d

    .line 1098
    .line 1099
    invoke-virtual {v11, v0}, Ls3/d;->b(Ljava/util/List;)V

    .line 1100
    .line 1101
    .line 1102
    :cond_1d
    iget-object v0, v2, Ls3/j;->J:Ljava/util/List;

    .line 1103
    .line 1104
    if-eqz v0, :cond_1e

    .line 1105
    .line 1106
    invoke-virtual {v10, v0}, Ls3/I0;->a(Ljava/util/List;)V

    .line 1107
    .line 1108
    .line 1109
    :cond_1e
    iget-object v0, v2, Ls3/j;->K:Ljava/util/List;

    .line 1110
    .line 1111
    if-eqz v0, :cond_1f

    .line 1112
    .line 1113
    invoke-virtual {v9, v0}, Ls3/d;->a(Ljava/util/List;)V

    .line 1114
    .line 1115
    .line 1116
    :cond_1f
    iget-object v0, v2, Ls3/j;->L:Ljava/util/List;

    .line 1117
    .line 1118
    if-eqz v0, :cond_20

    .line 1119
    .line 1120
    invoke-virtual {v8, v0}, Ll2/b;->b(Ljava/util/List;)V

    .line 1121
    .line 1122
    .line 1123
    :cond_20
    iget-object v0, v2, Ls3/j;->M:Ljava/util/List;

    .line 1124
    .line 1125
    if-eqz v0, :cond_21

    .line 1126
    .line 1127
    invoke-virtual {v7, v0}, Lm/x0;->r(Ljava/util/List;)V

    .line 1128
    .line 1129
    .line 1130
    :cond_21
    iget-object v0, v2, Ls3/j;->N:Ljava/util/List;

    .line 1131
    .line 1132
    if-eqz v0, :cond_22

    .line 1133
    .line 1134
    invoke-virtual {v6, v0}, Ls3/q;->a(Ljava/util/List;)V

    .line 1135
    .line 1136
    .line 1137
    :cond_22
    iget-object v0, v2, Ls3/j;->Q:Ljava/util/ArrayList;

    .line 1138
    .line 1139
    if-eqz v0, :cond_23

    .line 1140
    .line 1141
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 1142
    .line 1143
    .line 1144
    move-result v0

    .line 1145
    const/4 v3, 0x4

    .line 1146
    if-ne v0, v3, :cond_23

    .line 1147
    .line 1148
    iget-object v0, v2, Ls3/j;->Q:Ljava/util/ArrayList;

    .line 1149
    .line 1150
    const/4 v3, 0x0

    .line 1151
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1152
    .line 1153
    .line 1154
    move-result-object v0

    .line 1155
    check-cast v0, Ljava/lang/Float;

    .line 1156
    .line 1157
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 1158
    .line 1159
    .line 1160
    move-result v0

    .line 1161
    iget-object v3, v2, Ls3/j;->Q:Ljava/util/ArrayList;

    .line 1162
    .line 1163
    const/4 v4, 0x1

    .line 1164
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1165
    .line 1166
    .line 1167
    move-result-object v3

    .line 1168
    check-cast v3, Ljava/lang/Float;

    .line 1169
    .line 1170
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 1171
    .line 1172
    .line 1173
    move-result v3

    .line 1174
    iget-object v5, v2, Ls3/j;->Q:Ljava/util/ArrayList;

    .line 1175
    .line 1176
    const/4 v6, 0x2

    .line 1177
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1178
    .line 1179
    .line 1180
    move-result-object v5

    .line 1181
    check-cast v5, Ljava/lang/Float;

    .line 1182
    .line 1183
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    .line 1184
    .line 1185
    .line 1186
    move-result v5

    .line 1187
    iget-object v6, v2, Ls3/j;->Q:Ljava/util/ArrayList;

    .line 1188
    .line 1189
    const/4 v7, 0x3

    .line 1190
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1191
    .line 1192
    .line 1193
    move-result-object v6

    .line 1194
    check-cast v6, Ljava/lang/Float;

    .line 1195
    .line 1196
    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    .line 1197
    .line 1198
    .line 1199
    move-result v6

    .line 1200
    invoke-virtual {v2, v0, v3, v5, v6}, Ls3/j;->c(FFFF)V

    .line 1201
    .line 1202
    .line 1203
    goto :goto_15

    .line 1204
    :cond_23
    const/4 v4, 0x1

    .line 1205
    :goto_15
    iget-object v0, v2, Ls3/j;->O:Ljava/lang/String;

    .line 1206
    .line 1207
    if-eqz v0, :cond_24

    .line 1208
    .line 1209
    invoke-virtual {v2, v0}, Ls3/j;->b0(Ljava/lang/String;)Z

    .line 1210
    .line 1211
    .line 1212
    const/4 v3, 0x0

    .line 1213
    iput-object v3, v2, Ls3/j;->O:Ljava/lang/String;

    .line 1214
    .line 1215
    :cond_24
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 1216
    .line 1217
    .line 1218
    move v3, v4

    .line 1219
    goto :goto_16

    .line 1220
    :catch_4
    move-exception v0

    .line 1221
    new-instance v2, Le1/x;

    .line 1222
    .line 1223
    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 1224
    .line 1225
    .line 1226
    throw v2

    .line 1227
    :catch_5
    move-exception v0

    .line 1228
    new-instance v2, Le1/x;

    .line 1229
    .line 1230
    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 1231
    .line 1232
    .line 1233
    throw v2

    .line 1234
    :cond_25
    const/4 v3, 0x0

    .line 1235
    :goto_16
    return v3

    .line 1236
    :pswitch_7
    const/4 v3, 0x1

    .line 1237
    if-ne v0, v3, :cond_26

    .line 1238
    .line 1239
    sget-object v0, Lcom/google/android/gms/maps/model/LatLng;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1240
    .line 1241
    invoke-static {v2, v0}, LZ0/r;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 1242
    .line 1243
    .line 1244
    move-result-object v0

    .line 1245
    check-cast v0, Lcom/google/android/gms/maps/model/LatLng;

    .line 1246
    .line 1247
    invoke-static {v2}, LZ0/r;->b(Landroid/os/Parcel;)V

    .line 1248
    .line 1249
    .line 1250
    iget-object v2, v1, Lc1/i;->e:Ls3/j;

    .line 1251
    .line 1252
    iget-object v2, v2, Ls3/j;->f:LZ2/s;

    .line 1253
    .line 1254
    invoke-static {v0}, Landroid/support/v4/media/session/a;->E(Lcom/google/android/gms/maps/model/LatLng;)Ls3/j0;

    .line 1255
    .line 1256
    .line 1257
    move-result-object v0

    .line 1258
    new-instance v4, LK0/h;

    .line 1259
    .line 1260
    const/16 v5, 0x11

    .line 1261
    .line 1262
    invoke-direct {v4, v5}, LK0/h;-><init>(I)V

    .line 1263
    .line 1264
    .line 1265
    new-instance v5, Ljava/lang/StringBuilder;

    .line 1266
    .line 1267
    const-string v6, "dev.flutter.pigeon.google_maps_flutter_android.MapsCallbackApi.onLongPress"

    .line 1268
    .line 1269
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1270
    .line 1271
    .line 1272
    iget-object v6, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 1273
    .line 1274
    check-cast v6, Ljava/lang/String;

    .line 1275
    .line 1276
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1277
    .line 1278
    .line 1279
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1280
    .line 1281
    .line 1282
    move-result-object v5

    .line 1283
    new-instance v6, LV1/y;

    .line 1284
    .line 1285
    iget-object v2, v2, LZ2/s;->f:Ljava/lang/Object;

    .line 1286
    .line 1287
    check-cast v2, Lk3/f;

    .line 1288
    .line 1289
    sget-object v7, Ls3/B;->d:Ls3/B;

    .line 1290
    .line 1291
    const/4 v8, 0x0

    .line 1292
    invoke-direct {v6, v2, v5, v7, v8}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 1293
    .line 1294
    .line 1295
    new-instance v2, Ljava/util/ArrayList;

    .line 1296
    .line 1297
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 1298
    .line 1299
    .line 1300
    move-result-object v0

    .line 1301
    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 1302
    .line 1303
    .line 1304
    new-instance v0, LV1/n;

    .line 1305
    .line 1306
    const/16 v7, 0xa

    .line 1307
    .line 1308
    invoke-direct {v0, v4, v5, v7}, LV1/n;-><init>(LK0/h;Ljava/lang/String;I)V

    .line 1309
    .line 1310
    .line 1311
    invoke-virtual {v6, v2, v0}, LV1/y;->v(Ljava/io/Serializable;Lk3/c;)V

    .line 1312
    .line 1313
    .line 1314
    invoke-virtual/range {p3 .. p3}, Landroid/os/Parcel;->writeNoException()V

    .line 1315
    .line 1316
    .line 1317
    goto :goto_17

    .line 1318
    :cond_26
    const/4 v3, 0x0

    .line 1319
    :goto_17
    return v3

    .line 1320
    nop

    .line 1321
    :pswitch_data_0
    .packed-switch 0x0
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
