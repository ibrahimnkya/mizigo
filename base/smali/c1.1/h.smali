.class public final Lc1/h;
.super LW0/a;
.source "SourceFile"


# instance fields
.field public final synthetic d:I

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(LB2/a;LD1/a;)V
    .locals 1

    const/4 v0, 0x5

    iput v0, p0, Lc1/h;->d:I

    .line 1
    iput-object p2, p0, Lc1/h;->e:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    const-string p1, "com.google.android.gms.maps.internal.ISnapshotReadyCallback"

    const/4 p2, 0x2

    invoke-direct {p0, p1, p2}, LW0/a;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(LB2/a;Lc1/b;)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, Lc1/h;->d:I

    .line 3
    iput-object p2, p0, Lc1/h;->e:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    const-string p1, "com.google.android.gms.maps.internal.IOnInfoWindowClickListener"

    const/4 p2, 0x2

    invoke-direct {p0, p1, p2}, LW0/a;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(LB2/a;Lc1/c;)V
    .locals 1

    const/4 v0, 0x3

    iput v0, p0, Lc1/h;->d:I

    .line 5
    iput-object p2, p0, Lc1/h;->e:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    const-string p1, "com.google.android.gms.maps.internal.IOnInfoWindowLongClickListener"

    const/4 p2, 0x2

    invoke-direct {p0, p1, p2}, LW0/a;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(LB2/a;Lc1/d;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lc1/h;->d:I

    .line 7
    iput-object p2, p0, Lc1/h;->e:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    const-string p1, "com.google.android.gms.maps.internal.IOnMarkerClickListener"

    const/4 p2, 0x2

    invoke-direct {p0, p1, p2}, LW0/a;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(LB2/a;Lc1/e;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lc1/h;->d:I

    .line 9
    iput-object p2, p0, Lc1/h;->e:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    const-string p1, "com.google.android.gms.maps.internal.IOnMarkerDragListener"

    const/4 p2, 0x2

    invoke-direct {p0, p1, p2}, LW0/a;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(LB2/a;Ll2/b;)V
    .locals 1

    const/4 v0, 0x4

    iput v0, p0, Lc1/h;->d:I

    .line 11
    iput-object p2, p0, Lc1/h;->e:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    const-string p1, "com.google.android.gms.maps.internal.IInfoWindowAdapter"

    const/4 p2, 0x2

    invoke-direct {p0, p1, p2}, LW0/a;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(LB2/a;Ls3/j;)V
    .locals 1

    const/4 v0, 0x6

    iput v0, p0, Lc1/h;->d:I

    .line 13
    iput-object p2, p0, Lc1/h;->e:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    const-string p1, "com.google.android.gms.maps.internal.IOnCameraIdleListener"

    const/4 p2, 0x2

    invoke-direct {p0, p1, p2}, LW0/a;-><init>(Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final d(ILandroid/os/Parcel;Landroid/os/Parcel;)Z
    .locals 4

    .line 1
    iget v0, p0, Lc1/h;->d:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const/4 p2, 0x1

    .line 7
    if-ne p1, p2, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lc1/h;->e:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p1, Lc1/a;

    .line 12
    .line 13
    invoke-interface {p1}, Lc1/a;->H()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p2, 0x0

    .line 21
    :goto_0
    return p2

    .line 22
    :pswitch_0
    iget-object v0, p0, Lc1/h;->e:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v0, LD1/a;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    if-eq p1, v1, :cond_2

    .line 28
    .line 29
    const/4 v2, 0x2

    .line 30
    if-eq p1, v2, :cond_1

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    goto :goto_2

    .line 34
    :cond_1
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {p1}, LU0/b;->e(Landroid/os/IBinder;)LU0/a;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {p2}, LZ0/r;->b(Landroid/os/Parcel;)V

    .line 43
    .line 44
    .line 45
    invoke-static {p1}, LU0/b;->f(LU0/a;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Landroid/graphics/Bitmap;

    .line 50
    .line 51
    invoke-virtual {v0, p1}, LD1/a;->e(Landroid/graphics/Bitmap;)V

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    sget-object p1, Landroid/graphics/Bitmap;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 56
    .line 57
    invoke-static {p2, p1}, LZ0/r;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, Landroid/graphics/Bitmap;

    .line 62
    .line 63
    invoke-static {p2}, LZ0/r;->b(Landroid/os/Parcel;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, p1}, LD1/a;->e(Landroid/graphics/Bitmap;)V

    .line 67
    .line 68
    .line 69
    :goto_1
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 70
    .line 71
    .line 72
    :goto_2
    return v1

    .line 73
    :pswitch_1
    iget-object v0, p0, Lc1/h;->e:Ljava/lang/Object;

    .line 74
    .line 75
    check-cast v0, Ll2/b;

    .line 76
    .line 77
    iget-object v0, v0, Ll2/b;->e:Ljava/util/HashMap;

    .line 78
    .line 79
    const/4 v1, 0x0

    .line 80
    const/4 v2, 0x1

    .line 81
    if-eq p1, v2, :cond_4

    .line 82
    .line 83
    const/4 v3, 0x2

    .line 84
    if-eq p1, v3, :cond_3

    .line 85
    .line 86
    const/4 v2, 0x0

    .line 87
    goto :goto_3

    .line 88
    :cond_3
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-static {p1}, LZ0/e;->e(Landroid/os/IBinder;)LZ0/f;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-static {p2}, LZ0/r;->b(Landroid/os/Parcel;)V

    .line 97
    .line 98
    .line 99
    new-instance p2, Le1/o;

    .line 100
    .line 101
    invoke-direct {p2, p1}, Le1/o;-><init>(LZ0/f;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    check-cast p1, Ll2/a;

    .line 109
    .line 110
    new-instance p1, LU0/b;

    .line 111
    .line 112
    invoke-direct {p1, v1}, LU0/b;-><init>(Ljava/lang/Object;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 116
    .line 117
    .line 118
    invoke-static {p3, p1}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 119
    .line 120
    .line 121
    goto :goto_3

    .line 122
    :cond_4
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-static {p1}, LZ0/e;->e(Landroid/os/IBinder;)LZ0/f;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-static {p2}, LZ0/r;->b(Landroid/os/Parcel;)V

    .line 131
    .line 132
    .line 133
    new-instance p2, Le1/o;

    .line 134
    .line 135
    invoke-direct {p2, p1}, Le1/o;-><init>(LZ0/f;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    check-cast p1, Ll2/a;

    .line 143
    .line 144
    new-instance p1, LU0/b;

    .line 145
    .line 146
    invoke-direct {p1, v1}, LU0/b;-><init>(Ljava/lang/Object;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 150
    .line 151
    .line 152
    invoke-static {p3, p1}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 153
    .line 154
    .line 155
    :goto_3
    return v2

    .line 156
    :pswitch_2
    const/4 v0, 0x1

    .line 157
    if-ne p1, v0, :cond_5

    .line 158
    .line 159
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    invoke-static {p1}, LZ0/e;->e(Landroid/os/IBinder;)LZ0/f;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    invoke-static {p2}, LZ0/r;->b(Landroid/os/Parcel;)V

    .line 168
    .line 169
    .line 170
    new-instance p2, Le1/o;

    .line 171
    .line 172
    invoke-direct {p2, p1}, Le1/o;-><init>(LZ0/f;)V

    .line 173
    .line 174
    .line 175
    iget-object p1, p0, Lc1/h;->e:Ljava/lang/Object;

    .line 176
    .line 177
    check-cast p1, Lc1/c;

    .line 178
    .line 179
    invoke-interface {p1, p2}, Lc1/c;->a(Le1/o;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 183
    .line 184
    .line 185
    goto :goto_4

    .line 186
    :cond_5
    const/4 v0, 0x0

    .line 187
    :goto_4
    return v0

    .line 188
    :pswitch_3
    const/4 v0, 0x1

    .line 189
    if-ne p1, v0, :cond_6

    .line 190
    .line 191
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    invoke-static {p1}, LZ0/e;->e(Landroid/os/IBinder;)LZ0/f;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    invoke-static {p2}, LZ0/r;->b(Landroid/os/Parcel;)V

    .line 200
    .line 201
    .line 202
    new-instance p2, Le1/o;

    .line 203
    .line 204
    invoke-direct {p2, p1}, Le1/o;-><init>(LZ0/f;)V

    .line 205
    .line 206
    .line 207
    iget-object p1, p0, Lc1/h;->e:Ljava/lang/Object;

    .line 208
    .line 209
    check-cast p1, Lc1/b;

    .line 210
    .line 211
    invoke-interface {p1, p2}, Lc1/b;->e(Le1/o;)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 215
    .line 216
    .line 217
    goto :goto_5

    .line 218
    :cond_6
    const/4 v0, 0x0

    .line 219
    :goto_5
    return v0

    .line 220
    :pswitch_4
    iget-object v0, p0, Lc1/h;->e:Ljava/lang/Object;

    .line 221
    .line 222
    check-cast v0, Lc1/e;

    .line 223
    .line 224
    const/4 v1, 0x1

    .line 225
    if-eq p1, v1, :cond_9

    .line 226
    .line 227
    const/4 v2, 0x2

    .line 228
    if-eq p1, v2, :cond_8

    .line 229
    .line 230
    const/4 v2, 0x3

    .line 231
    if-eq p1, v2, :cond_7

    .line 232
    .line 233
    const/4 v1, 0x0

    .line 234
    goto :goto_7

    .line 235
    :cond_7
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    invoke-static {p1}, LZ0/e;->e(Landroid/os/IBinder;)LZ0/f;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    invoke-static {p2}, LZ0/r;->b(Landroid/os/Parcel;)V

    .line 244
    .line 245
    .line 246
    new-instance p2, Le1/o;

    .line 247
    .line 248
    invoke-direct {p2, p1}, Le1/o;-><init>(LZ0/f;)V

    .line 249
    .line 250
    .line 251
    invoke-interface {v0, p2}, Lc1/e;->j(Le1/o;)V

    .line 252
    .line 253
    .line 254
    goto :goto_6

    .line 255
    :cond_8
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    invoke-static {p1}, LZ0/e;->e(Landroid/os/IBinder;)LZ0/f;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    invoke-static {p2}, LZ0/r;->b(Landroid/os/Parcel;)V

    .line 264
    .line 265
    .line 266
    new-instance p2, Le1/o;

    .line 267
    .line 268
    invoke-direct {p2, p1}, Le1/o;-><init>(LZ0/f;)V

    .line 269
    .line 270
    .line 271
    invoke-interface {v0, p2}, Lc1/e;->w(Le1/o;)V

    .line 272
    .line 273
    .line 274
    goto :goto_6

    .line 275
    :cond_9
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    invoke-static {p1}, LZ0/e;->e(Landroid/os/IBinder;)LZ0/f;

    .line 280
    .line 281
    .line 282
    move-result-object p1

    .line 283
    invoke-static {p2}, LZ0/r;->b(Landroid/os/Parcel;)V

    .line 284
    .line 285
    .line 286
    new-instance p2, Le1/o;

    .line 287
    .line 288
    invoke-direct {p2, p1}, Le1/o;-><init>(LZ0/f;)V

    .line 289
    .line 290
    .line 291
    invoke-interface {v0, p2}, Lc1/e;->i(Le1/o;)V

    .line 292
    .line 293
    .line 294
    :goto_6
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 295
    .line 296
    .line 297
    :goto_7
    return v1

    .line 298
    :pswitch_5
    const/4 v0, 0x1

    .line 299
    if-ne p1, v0, :cond_a

    .line 300
    .line 301
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    invoke-static {p1}, LZ0/e;->e(Landroid/os/IBinder;)LZ0/f;

    .line 306
    .line 307
    .line 308
    move-result-object p1

    .line 309
    invoke-static {p2}, LZ0/r;->b(Landroid/os/Parcel;)V

    .line 310
    .line 311
    .line 312
    new-instance p2, Le1/o;

    .line 313
    .line 314
    invoke-direct {p2, p1}, Le1/o;-><init>(LZ0/f;)V

    .line 315
    .line 316
    .line 317
    iget-object p1, p0, Lc1/h;->e:Ljava/lang/Object;

    .line 318
    .line 319
    check-cast p1, Lc1/d;

    .line 320
    .line 321
    invoke-interface {p1, p2}, Lc1/d;->v(Le1/o;)Z

    .line 322
    .line 323
    .line 324
    move-result p1

    .line 325
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 326
    .line 327
    .line 328
    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 329
    .line 330
    .line 331
    goto :goto_8

    .line 332
    :cond_a
    const/4 v0, 0x0

    .line 333
    :goto_8
    return v0

    .line 334
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
