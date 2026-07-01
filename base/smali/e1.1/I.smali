.class public final Le1/I;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Le1/I;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(LN0/c;Landroid/os/Parcel;I)V
    .locals 4

    .line 1
    const/16 v0, 0x4f45

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/support/v4/media/session/a;->Z(Landroid/os/Parcel;I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, LN0/c;->e:I

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    const/4 v3, 0x4

    .line 11
    invoke-static {p1, v2, v3}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 15
    .line 16
    .line 17
    iget v1, p0, LN0/c;->f:I

    .line 18
    .line 19
    const/4 v2, 0x2

    .line 20
    invoke-static {p1, v2, v3}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 24
    .line 25
    .line 26
    iget v1, p0, LN0/c;->g:I

    .line 27
    .line 28
    const/4 v2, 0x3

    .line 29
    invoke-static {p1, v2, v3}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, LN0/c;->h:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p1, v3, v1}, Landroid/support/v4/media/session/a;->U(Landroid/os/Parcel;ILjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const/4 v1, 0x5

    .line 41
    iget-object v2, p0, LN0/c;->i:Landroid/os/IBinder;

    .line 42
    .line 43
    invoke-static {p1, v1, v2}, Landroid/support/v4/media/session/a;->R(Landroid/os/Parcel;ILandroid/os/IBinder;)V

    .line 44
    .line 45
    .line 46
    const/4 v1, 0x6

    .line 47
    iget-object v2, p0, LN0/c;->j:[Lcom/google/android/gms/common/api/Scope;

    .line 48
    .line 49
    invoke-static {p1, v1, v2, p2}, Landroid/support/v4/media/session/a;->V(Landroid/os/Parcel;I[Landroid/os/Parcelable;I)V

    .line 50
    .line 51
    .line 52
    const/4 v1, 0x7

    .line 53
    iget-object v2, p0, LN0/c;->k:Landroid/os/Bundle;

    .line 54
    .line 55
    invoke-static {p1, v1, v2}, Landroid/support/v4/media/session/a;->P(Landroid/os/Parcel;ILandroid/os/Bundle;)V

    .line 56
    .line 57
    .line 58
    const/16 v1, 0x8

    .line 59
    .line 60
    iget-object v2, p0, LN0/c;->l:Landroid/accounts/Account;

    .line 61
    .line 62
    invoke-static {p1, v1, v2, p2}, Landroid/support/v4/media/session/a;->T(Landroid/os/Parcel;ILandroid/os/Parcelable;I)V

    .line 63
    .line 64
    .line 65
    const/16 v1, 0xa

    .line 66
    .line 67
    iget-object v2, p0, LN0/c;->m:[LK0/c;

    .line 68
    .line 69
    invoke-static {p1, v1, v2, p2}, Landroid/support/v4/media/session/a;->V(Landroid/os/Parcel;I[Landroid/os/Parcelable;I)V

    .line 70
    .line 71
    .line 72
    const/16 v1, 0xb

    .line 73
    .line 74
    iget-object v2, p0, LN0/c;->n:[LK0/c;

    .line 75
    .line 76
    invoke-static {p1, v1, v2, p2}, Landroid/support/v4/media/session/a;->V(Landroid/os/Parcel;I[Landroid/os/Parcelable;I)V

    .line 77
    .line 78
    .line 79
    iget-boolean p2, p0, LN0/c;->o:Z

    .line 80
    .line 81
    const/16 v1, 0xc

    .line 82
    .line 83
    invoke-static {p1, v1, v3}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 87
    .line 88
    .line 89
    iget p2, p0, LN0/c;->p:I

    .line 90
    .line 91
    const/16 v1, 0xd

    .line 92
    .line 93
    invoke-static {p1, v1, v3}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 97
    .line 98
    .line 99
    iget-boolean p2, p0, LN0/c;->q:Z

    .line 100
    .line 101
    const/16 v1, 0xe

    .line 102
    .line 103
    invoke-static {p1, v1, v3}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 107
    .line 108
    .line 109
    const/16 p2, 0xf

    .line 110
    .line 111
    iget-object p0, p0, LN0/c;->r:Ljava/lang/String;

    .line 112
    .line 113
    invoke-static {p1, p2, p0}, Landroid/support/v4/media/session/a;->U(Landroid/os/Parcel;ILjava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-static {p1, v0}, Landroid/support/v4/media/session/a;->b0(Landroid/os/Parcel;I)V

    .line 117
    .line 118
    .line 119
    return-void
.end method


# virtual methods
.method public final createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 27

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget v2, v0, Le1/I;->a:I

    .line 6
    .line 7
    const/16 v3, 0x8

    .line 8
    .line 9
    const/4 v5, 0x0

    .line 10
    const/4 v6, 0x5

    .line 11
    const/4 v7, 0x4

    .line 12
    const/4 v8, 0x3

    .line 13
    const/4 v9, 0x1

    .line 14
    const/4 v10, 0x2

    .line 15
    const/4 v11, 0x0

    .line 16
    packed-switch v2, :pswitch_data_0

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    move v14, v5

    .line 24
    move v15, v11

    .line 25
    move/from16 v16, v15

    .line 26
    .line 27
    move/from16 v17, v16

    .line 28
    .line 29
    const/16 v18, 0x0

    .line 30
    .line 31
    :goto_0
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-ge v3, v2, :cond_5

    .line 36
    .line 37
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    int-to-char v4, v3

    .line 42
    if-eq v4, v10, :cond_4

    .line 43
    .line 44
    if-eq v4, v8, :cond_3

    .line 45
    .line 46
    if-eq v4, v7, :cond_2

    .line 47
    .line 48
    if-eq v4, v6, :cond_1

    .line 49
    .line 50
    const/4 v5, 0x6

    .line 51
    if-eq v4, v5, :cond_0

    .line 52
    .line 53
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    sget-object v4, Le1/y;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 58
    .line 59
    invoke-static {v1, v3, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->h(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    move-object/from16 v18, v3

    .line 64
    .line 65
    check-cast v18, Le1/y;

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->A(Landroid/os/Parcel;I)Z

    .line 69
    .line 70
    .line 71
    move-result v17

    .line 72
    goto :goto_0

    .line 73
    :cond_2
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 74
    .line 75
    .line 76
    move-result v16

    .line 77
    goto :goto_0

    .line 78
    :cond_3
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 79
    .line 80
    .line 81
    move-result v15

    .line 82
    goto :goto_0

    .line 83
    :cond_4
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->C(Landroid/os/Parcel;I)F

    .line 84
    .line 85
    .line 86
    move-result v14

    .line 87
    goto :goto_0

    .line 88
    :cond_5
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 89
    .line 90
    .line 91
    new-instance v13, Le1/z;

    .line 92
    .line 93
    invoke-direct/range {v13 .. v18}, Le1/z;-><init>(FIIZLe1/y;)V

    .line 94
    .line 95
    .line 96
    return-object v13

    .line 97
    :pswitch_0
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    move v3, v5

    .line 102
    move v4, v3

    .line 103
    const/4 v12, 0x0

    .line 104
    :goto_1
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 105
    .line 106
    .line 107
    move-result v9

    .line 108
    if-ge v9, v2, :cond_a

    .line 109
    .line 110
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 111
    .line 112
    .line 113
    move-result v9

    .line 114
    int-to-char v11, v9

    .line 115
    if-eq v11, v10, :cond_9

    .line 116
    .line 117
    if-eq v11, v8, :cond_8

    .line 118
    .line 119
    if-eq v11, v7, :cond_7

    .line 120
    .line 121
    if-eq v11, v6, :cond_6

    .line 122
    .line 123
    invoke-static {v1, v9}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 124
    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_6
    invoke-static {v1, v9}, Lcom/google/crypto/tink/shaded/protobuf/i0;->C(Landroid/os/Parcel;I)F

    .line 128
    .line 129
    .line 130
    move-result v4

    .line 131
    goto :goto_1

    .line 132
    :cond_7
    invoke-static {v1, v9}, Lcom/google/crypto/tink/shaded/protobuf/i0;->C(Landroid/os/Parcel;I)F

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    goto :goto_1

    .line 137
    :cond_8
    invoke-static {v1, v9}, Lcom/google/crypto/tink/shaded/protobuf/i0;->C(Landroid/os/Parcel;I)F

    .line 138
    .line 139
    .line 140
    move-result v5

    .line 141
    goto :goto_1

    .line 142
    :cond_9
    sget-object v11, Lcom/google/android/gms/maps/model/LatLng;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 143
    .line 144
    invoke-static {v1, v9, v11}, Lcom/google/crypto/tink/shaded/protobuf/i0;->h(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 145
    .line 146
    .line 147
    move-result-object v9

    .line 148
    move-object v12, v9

    .line 149
    check-cast v12, Lcom/google/android/gms/maps/model/LatLng;

    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_a
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 153
    .line 154
    .line 155
    new-instance v1, Lcom/google/android/gms/maps/model/CameraPosition;

    .line 156
    .line 157
    invoke-direct {v1, v12, v5, v3, v4}, Lcom/google/android/gms/maps/model/CameraPosition;-><init>(Lcom/google/android/gms/maps/model/LatLng;FFF)V

    .line 158
    .line 159
    .line 160
    return-object v1

    .line 161
    :pswitch_1
    new-instance v2, Ld/d;

    .line 162
    .line 163
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v1}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    sget v3, Ld/c;->d:I

    .line 171
    .line 172
    if-nez v1, :cond_b

    .line 173
    .line 174
    const/4 v12, 0x0

    .line 175
    goto :goto_2

    .line 176
    :cond_b
    sget-object v3, Ld/b;->b:Ljava/lang/String;

    .line 177
    .line 178
    invoke-interface {v1, v3}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 179
    .line 180
    .line 181
    move-result-object v3

    .line 182
    if-eqz v3, :cond_c

    .line 183
    .line 184
    instance-of v4, v3, Ld/b;

    .line 185
    .line 186
    if-eqz v4, :cond_c

    .line 187
    .line 188
    move-object v12, v3

    .line 189
    check-cast v12, Ld/b;

    .line 190
    .line 191
    goto :goto_2

    .line 192
    :cond_c
    new-instance v12, Ld/a;

    .line 193
    .line 194
    invoke-direct {v12}, Ljava/lang/Object;-><init>()V

    .line 195
    .line 196
    .line 197
    iput-object v1, v12, Ld/a;->c:Landroid/os/IBinder;

    .line 198
    .line 199
    :goto_2
    iput-object v12, v2, Ld/d;->e:Ld/b;

    .line 200
    .line 201
    return-object v2

    .line 202
    :pswitch_2
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 203
    .line 204
    .line 205
    move-result v2

    .line 206
    move v3, v11

    .line 207
    const/4 v5, -0x1

    .line 208
    const/4 v6, -0x1

    .line 209
    const/4 v7, 0x0

    .line 210
    const/4 v8, -0x1

    .line 211
    const/4 v9, -0x1

    .line 212
    const/4 v10, -0x1

    .line 213
    const/4 v13, -0x1

    .line 214
    const/4 v14, -0x1

    .line 215
    const/4 v15, -0x1

    .line 216
    const/16 v16, -0x1

    .line 217
    .line 218
    const/16 v17, -0x1

    .line 219
    .line 220
    const/16 v18, -0x1

    .line 221
    .line 222
    const/16 v19, 0x0

    .line 223
    .line 224
    const/16 v20, 0x0

    .line 225
    .line 226
    const/16 v21, 0x0

    .line 227
    .line 228
    const/16 v22, -0x1

    .line 229
    .line 230
    const/16 v23, 0x0

    .line 231
    .line 232
    const/16 v24, 0x0

    .line 233
    .line 234
    :goto_3
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 235
    .line 236
    .line 237
    move-result v12

    .line 238
    if-ge v12, v2, :cond_e

    .line 239
    .line 240
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 241
    .line 242
    .line 243
    move-result v12

    .line 244
    int-to-char v4, v12

    .line 245
    packed-switch v4, :pswitch_data_1

    .line 246
    .line 247
    .line 248
    :pswitch_3
    invoke-static {v1, v12}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 249
    .line 250
    .line 251
    goto :goto_3

    .line 252
    :pswitch_4
    invoke-static {v1, v12}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 253
    .line 254
    .line 255
    move-result v3

    .line 256
    goto :goto_3

    .line 257
    :pswitch_5
    invoke-static {v1, v12}, Lcom/google/crypto/tink/shaded/protobuf/i0;->i(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v24

    .line 261
    goto :goto_3

    .line 262
    :pswitch_6
    invoke-static {v1, v12}, Lcom/google/crypto/tink/shaded/protobuf/i0;->G(Landroid/os/Parcel;I)I

    .line 263
    .line 264
    .line 265
    move-result v4

    .line 266
    if-nez v4, :cond_d

    .line 267
    .line 268
    const/16 v23, 0x0

    .line 269
    .line 270
    goto :goto_3

    .line 271
    :cond_d
    invoke-static {v1, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->V(Landroid/os/Parcel;I)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 275
    .line 276
    .line 277
    move-result v4

    .line 278
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 279
    .line 280
    .line 281
    move-result-object v4

    .line 282
    move-object/from16 v23, v4

    .line 283
    .line 284
    goto :goto_3

    .line 285
    :pswitch_7
    invoke-static {v1, v12}, Lcom/google/crypto/tink/shaded/protobuf/i0;->B(Landroid/os/Parcel;I)B

    .line 286
    .line 287
    .line 288
    move-result v22

    .line 289
    goto :goto_3

    .line 290
    :pswitch_8
    sget-object v4, Lcom/google/android/gms/maps/model/LatLngBounds;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 291
    .line 292
    invoke-static {v1, v12, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->h(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 293
    .line 294
    .line 295
    move-result-object v4

    .line 296
    move-object/from16 v21, v4

    .line 297
    .line 298
    check-cast v21, Lcom/google/android/gms/maps/model/LatLngBounds;

    .line 299
    .line 300
    goto :goto_3

    .line 301
    :pswitch_9
    invoke-static {v1, v12}, Lcom/google/crypto/tink/shaded/protobuf/i0;->D(Landroid/os/Parcel;I)Ljava/lang/Float;

    .line 302
    .line 303
    .line 304
    move-result-object v20

    .line 305
    goto :goto_3

    .line 306
    :pswitch_a
    invoke-static {v1, v12}, Lcom/google/crypto/tink/shaded/protobuf/i0;->D(Landroid/os/Parcel;I)Ljava/lang/Float;

    .line 307
    .line 308
    .line 309
    move-result-object v19

    .line 310
    goto :goto_3

    .line 311
    :pswitch_b
    invoke-static {v1, v12}, Lcom/google/crypto/tink/shaded/protobuf/i0;->B(Landroid/os/Parcel;I)B

    .line 312
    .line 313
    .line 314
    move-result v18

    .line 315
    goto :goto_3

    .line 316
    :pswitch_c
    invoke-static {v1, v12}, Lcom/google/crypto/tink/shaded/protobuf/i0;->B(Landroid/os/Parcel;I)B

    .line 317
    .line 318
    .line 319
    move-result v17

    .line 320
    goto :goto_3

    .line 321
    :pswitch_d
    invoke-static {v1, v12}, Lcom/google/crypto/tink/shaded/protobuf/i0;->B(Landroid/os/Parcel;I)B

    .line 322
    .line 323
    .line 324
    move-result v16

    .line 325
    goto :goto_3

    .line 326
    :pswitch_e
    invoke-static {v1, v12}, Lcom/google/crypto/tink/shaded/protobuf/i0;->B(Landroid/os/Parcel;I)B

    .line 327
    .line 328
    .line 329
    move-result v15

    .line 330
    goto :goto_3

    .line 331
    :pswitch_f
    invoke-static {v1, v12}, Lcom/google/crypto/tink/shaded/protobuf/i0;->B(Landroid/os/Parcel;I)B

    .line 332
    .line 333
    .line 334
    move-result v14

    .line 335
    goto :goto_3

    .line 336
    :pswitch_10
    invoke-static {v1, v12}, Lcom/google/crypto/tink/shaded/protobuf/i0;->B(Landroid/os/Parcel;I)B

    .line 337
    .line 338
    .line 339
    move-result v13

    .line 340
    goto :goto_3

    .line 341
    :pswitch_11
    invoke-static {v1, v12}, Lcom/google/crypto/tink/shaded/protobuf/i0;->B(Landroid/os/Parcel;I)B

    .line 342
    .line 343
    .line 344
    move-result v10

    .line 345
    goto :goto_3

    .line 346
    :pswitch_12
    invoke-static {v1, v12}, Lcom/google/crypto/tink/shaded/protobuf/i0;->B(Landroid/os/Parcel;I)B

    .line 347
    .line 348
    .line 349
    move-result v9

    .line 350
    goto :goto_3

    .line 351
    :pswitch_13
    invoke-static {v1, v12}, Lcom/google/crypto/tink/shaded/protobuf/i0;->B(Landroid/os/Parcel;I)B

    .line 352
    .line 353
    .line 354
    move-result v8

    .line 355
    goto :goto_3

    .line 356
    :pswitch_14
    sget-object v4, Lcom/google/android/gms/maps/model/CameraPosition;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 357
    .line 358
    invoke-static {v1, v12, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->h(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 359
    .line 360
    .line 361
    move-result-object v4

    .line 362
    move-object v7, v4

    .line 363
    check-cast v7, Lcom/google/android/gms/maps/model/CameraPosition;

    .line 364
    .line 365
    goto/16 :goto_3

    .line 366
    .line 367
    :pswitch_15
    invoke-static {v1, v12}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 368
    .line 369
    .line 370
    move-result v11

    .line 371
    goto/16 :goto_3

    .line 372
    .line 373
    :pswitch_16
    invoke-static {v1, v12}, Lcom/google/crypto/tink/shaded/protobuf/i0;->B(Landroid/os/Parcel;I)B

    .line 374
    .line 375
    .line 376
    move-result v6

    .line 377
    goto/16 :goto_3

    .line 378
    .line 379
    :pswitch_17
    invoke-static {v1, v12}, Lcom/google/crypto/tink/shaded/protobuf/i0;->B(Landroid/os/Parcel;I)B

    .line 380
    .line 381
    .line 382
    move-result v5

    .line 383
    goto/16 :goto_3

    .line 384
    .line 385
    :cond_e
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 386
    .line 387
    .line 388
    new-instance v1, Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 389
    .line 390
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 391
    .line 392
    .line 393
    const/4 v2, -0x1

    .line 394
    iput v2, v1, Lcom/google/android/gms/maps/GoogleMapOptions;->g:I

    .line 395
    .line 396
    const/4 v2, 0x0

    .line 397
    iput-object v2, v1, Lcom/google/android/gms/maps/GoogleMapOptions;->r:Ljava/lang/Float;

    .line 398
    .line 399
    iput-object v2, v1, Lcom/google/android/gms/maps/GoogleMapOptions;->s:Ljava/lang/Float;

    .line 400
    .line 401
    iput-object v2, v1, Lcom/google/android/gms/maps/GoogleMapOptions;->t:Lcom/google/android/gms/maps/model/LatLngBounds;

    .line 402
    .line 403
    iput-object v2, v1, Lcom/google/android/gms/maps/GoogleMapOptions;->v:Ljava/lang/Integer;

    .line 404
    .line 405
    iput-object v2, v1, Lcom/google/android/gms/maps/GoogleMapOptions;->w:Ljava/lang/String;

    .line 406
    .line 407
    invoke-static {v5}, Landroid/support/v4/media/session/a;->a0(B)Ljava/lang/Boolean;

    .line 408
    .line 409
    .line 410
    move-result-object v2

    .line 411
    iput-object v2, v1, Lcom/google/android/gms/maps/GoogleMapOptions;->e:Ljava/lang/Boolean;

    .line 412
    .line 413
    invoke-static {v6}, Landroid/support/v4/media/session/a;->a0(B)Ljava/lang/Boolean;

    .line 414
    .line 415
    .line 416
    move-result-object v2

    .line 417
    iput-object v2, v1, Lcom/google/android/gms/maps/GoogleMapOptions;->f:Ljava/lang/Boolean;

    .line 418
    .line 419
    iput v11, v1, Lcom/google/android/gms/maps/GoogleMapOptions;->g:I

    .line 420
    .line 421
    iput-object v7, v1, Lcom/google/android/gms/maps/GoogleMapOptions;->h:Lcom/google/android/gms/maps/model/CameraPosition;

    .line 422
    .line 423
    invoke-static {v8}, Landroid/support/v4/media/session/a;->a0(B)Ljava/lang/Boolean;

    .line 424
    .line 425
    .line 426
    move-result-object v2

    .line 427
    iput-object v2, v1, Lcom/google/android/gms/maps/GoogleMapOptions;->i:Ljava/lang/Boolean;

    .line 428
    .line 429
    invoke-static {v9}, Landroid/support/v4/media/session/a;->a0(B)Ljava/lang/Boolean;

    .line 430
    .line 431
    .line 432
    move-result-object v2

    .line 433
    iput-object v2, v1, Lcom/google/android/gms/maps/GoogleMapOptions;->j:Ljava/lang/Boolean;

    .line 434
    .line 435
    invoke-static {v10}, Landroid/support/v4/media/session/a;->a0(B)Ljava/lang/Boolean;

    .line 436
    .line 437
    .line 438
    move-result-object v2

    .line 439
    iput-object v2, v1, Lcom/google/android/gms/maps/GoogleMapOptions;->k:Ljava/lang/Boolean;

    .line 440
    .line 441
    invoke-static {v13}, Landroid/support/v4/media/session/a;->a0(B)Ljava/lang/Boolean;

    .line 442
    .line 443
    .line 444
    move-result-object v2

    .line 445
    iput-object v2, v1, Lcom/google/android/gms/maps/GoogleMapOptions;->l:Ljava/lang/Boolean;

    .line 446
    .line 447
    invoke-static {v14}, Landroid/support/v4/media/session/a;->a0(B)Ljava/lang/Boolean;

    .line 448
    .line 449
    .line 450
    move-result-object v2

    .line 451
    iput-object v2, v1, Lcom/google/android/gms/maps/GoogleMapOptions;->m:Ljava/lang/Boolean;

    .line 452
    .line 453
    invoke-static {v15}, Landroid/support/v4/media/session/a;->a0(B)Ljava/lang/Boolean;

    .line 454
    .line 455
    .line 456
    move-result-object v2

    .line 457
    iput-object v2, v1, Lcom/google/android/gms/maps/GoogleMapOptions;->n:Ljava/lang/Boolean;

    .line 458
    .line 459
    invoke-static/range {v16 .. v16}, Landroid/support/v4/media/session/a;->a0(B)Ljava/lang/Boolean;

    .line 460
    .line 461
    .line 462
    move-result-object v2

    .line 463
    iput-object v2, v1, Lcom/google/android/gms/maps/GoogleMapOptions;->o:Ljava/lang/Boolean;

    .line 464
    .line 465
    invoke-static/range {v17 .. v17}, Landroid/support/v4/media/session/a;->a0(B)Ljava/lang/Boolean;

    .line 466
    .line 467
    .line 468
    move-result-object v2

    .line 469
    iput-object v2, v1, Lcom/google/android/gms/maps/GoogleMapOptions;->p:Ljava/lang/Boolean;

    .line 470
    .line 471
    invoke-static/range {v18 .. v18}, Landroid/support/v4/media/session/a;->a0(B)Ljava/lang/Boolean;

    .line 472
    .line 473
    .line 474
    move-result-object v2

    .line 475
    iput-object v2, v1, Lcom/google/android/gms/maps/GoogleMapOptions;->q:Ljava/lang/Boolean;

    .line 476
    .line 477
    move-object/from16 v12, v19

    .line 478
    .line 479
    iput-object v12, v1, Lcom/google/android/gms/maps/GoogleMapOptions;->r:Ljava/lang/Float;

    .line 480
    .line 481
    move-object/from16 v12, v20

    .line 482
    .line 483
    iput-object v12, v1, Lcom/google/android/gms/maps/GoogleMapOptions;->s:Ljava/lang/Float;

    .line 484
    .line 485
    move-object/from16 v12, v21

    .line 486
    .line 487
    iput-object v12, v1, Lcom/google/android/gms/maps/GoogleMapOptions;->t:Lcom/google/android/gms/maps/model/LatLngBounds;

    .line 488
    .line 489
    invoke-static/range {v22 .. v22}, Landroid/support/v4/media/session/a;->a0(B)Ljava/lang/Boolean;

    .line 490
    .line 491
    .line 492
    move-result-object v2

    .line 493
    iput-object v2, v1, Lcom/google/android/gms/maps/GoogleMapOptions;->u:Ljava/lang/Boolean;

    .line 494
    .line 495
    move-object/from16 v12, v23

    .line 496
    .line 497
    iput-object v12, v1, Lcom/google/android/gms/maps/GoogleMapOptions;->v:Ljava/lang/Integer;

    .line 498
    .line 499
    move-object/from16 v12, v24

    .line 500
    .line 501
    iput-object v12, v1, Lcom/google/android/gms/maps/GoogleMapOptions;->w:Ljava/lang/String;

    .line 502
    .line 503
    iput v3, v1, Lcom/google/android/gms/maps/GoogleMapOptions;->x:I

    .line 504
    .line 505
    return-object v1

    .line 506
    :pswitch_18
    new-instance v2, Landroidx/versionedparcelable/ParcelImpl;

    .line 507
    .line 508
    invoke-direct {v2, v1}, Landroidx/versionedparcelable/ParcelImpl;-><init>(Landroid/os/Parcel;)V

    .line 509
    .line 510
    .line 511
    return-object v2

    .line 512
    :pswitch_19
    new-instance v2, Landroid/support/v4/media/session/PlaybackStateCompat;

    .line 513
    .line 514
    invoke-direct {v2, v1}, Landroid/support/v4/media/session/PlaybackStateCompat;-><init>(Landroid/os/Parcel;)V

    .line 515
    .line 516
    .line 517
    return-object v2

    .line 518
    :pswitch_1a
    new-instance v2, Landroid/support/v4/media/session/ParcelableVolumeInfo;

    .line 519
    .line 520
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 521
    .line 522
    .line 523
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 524
    .line 525
    .line 526
    move-result v3

    .line 527
    iput v3, v2, Landroid/support/v4/media/session/ParcelableVolumeInfo;->e:I

    .line 528
    .line 529
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 530
    .line 531
    .line 532
    move-result v3

    .line 533
    iput v3, v2, Landroid/support/v4/media/session/ParcelableVolumeInfo;->g:I

    .line 534
    .line 535
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 536
    .line 537
    .line 538
    move-result v3

    .line 539
    iput v3, v2, Landroid/support/v4/media/session/ParcelableVolumeInfo;->h:I

    .line 540
    .line 541
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 542
    .line 543
    .line 544
    move-result v3

    .line 545
    iput v3, v2, Landroid/support/v4/media/session/ParcelableVolumeInfo;->i:I

    .line 546
    .line 547
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 548
    .line 549
    .line 550
    move-result v1

    .line 551
    iput v1, v2, Landroid/support/v4/media/session/ParcelableVolumeInfo;->f:I

    .line 552
    .line 553
    return-object v2

    .line 554
    :pswitch_1b
    const/4 v4, 0x0

    .line 555
    invoke-virtual {v1, v4}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 556
    .line 557
    .line 558
    move-result-object v1

    .line 559
    new-instance v2, Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 560
    .line 561
    invoke-direct {v2, v1}, Landroid/support/v4/media/session/MediaSessionCompat$Token;-><init>(Landroid/os/Parcelable;)V

    .line 562
    .line 563
    .line 564
    return-object v2

    .line 565
    :pswitch_1c
    new-instance v2, Landroid/support/v4/media/session/MediaSessionCompat$ResultReceiverWrapper;

    .line 566
    .line 567
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 568
    .line 569
    .line 570
    sget-object v3, Landroid/os/ResultReceiver;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 571
    .line 572
    invoke-interface {v3, v1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    .line 573
    .line 574
    .line 575
    move-result-object v1

    .line 576
    check-cast v1, Landroid/os/ResultReceiver;

    .line 577
    .line 578
    iput-object v1, v2, Landroid/support/v4/media/session/MediaSessionCompat$ResultReceiverWrapper;->e:Landroid/os/ResultReceiver;

    .line 579
    .line 580
    return-object v2

    .line 581
    :pswitch_1d
    new-instance v2, Landroid/support/v4/media/session/MediaSessionCompat$QueueItem;

    .line 582
    .line 583
    invoke-direct {v2, v1}, Landroid/support/v4/media/session/MediaSessionCompat$QueueItem;-><init>(Landroid/os/Parcel;)V

    .line 584
    .line 585
    .line 586
    return-object v2

    .line 587
    :pswitch_1e
    new-instance v2, Landroid/support/v4/media/RatingCompat;

    .line 588
    .line 589
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 590
    .line 591
    .line 592
    move-result v3

    .line 593
    invoke-virtual {v1}, Landroid/os/Parcel;->readFloat()F

    .line 594
    .line 595
    .line 596
    move-result v1

    .line 597
    invoke-direct {v2, v1, v3}, Landroid/support/v4/media/RatingCompat;-><init>(FI)V

    .line 598
    .line 599
    .line 600
    return-object v2

    .line 601
    :pswitch_1f
    new-instance v2, Landroid/support/v4/media/MediaMetadataCompat;

    .line 602
    .line 603
    invoke-direct {v2, v1}, Landroid/support/v4/media/MediaMetadataCompat;-><init>(Landroid/os/Parcel;)V

    .line 604
    .line 605
    .line 606
    return-object v2

    .line 607
    :pswitch_20
    const/4 v4, 0x0

    .line 608
    sget-object v2, Landroid/media/MediaDescription;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 609
    .line 610
    invoke-interface {v2, v1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    .line 611
    .line 612
    .line 613
    move-result-object v1

    .line 614
    if-eqz v1, :cond_13

    .line 615
    .line 616
    check-cast v1, Landroid/media/MediaDescription;

    .line 617
    .line 618
    invoke-virtual {v1}, Landroid/media/MediaDescription;->getMediaId()Ljava/lang/String;

    .line 619
    .line 620
    .line 621
    move-result-object v12

    .line 622
    invoke-virtual {v1}, Landroid/media/MediaDescription;->getTitle()Ljava/lang/CharSequence;

    .line 623
    .line 624
    .line 625
    move-result-object v13

    .line 626
    invoke-virtual {v1}, Landroid/media/MediaDescription;->getSubtitle()Ljava/lang/CharSequence;

    .line 627
    .line 628
    .line 629
    move-result-object v14

    .line 630
    invoke-virtual {v1}, Landroid/media/MediaDescription;->getDescription()Ljava/lang/CharSequence;

    .line 631
    .line 632
    .line 633
    move-result-object v15

    .line 634
    invoke-virtual {v1}, Landroid/media/MediaDescription;->getIconBitmap()Landroid/graphics/Bitmap;

    .line 635
    .line 636
    .line 637
    move-result-object v16

    .line 638
    invoke-virtual {v1}, Landroid/media/MediaDescription;->getIconUri()Landroid/net/Uri;

    .line 639
    .line 640
    .line 641
    move-result-object v17

    .line 642
    invoke-virtual {v1}, Landroid/media/MediaDescription;->getExtras()Landroid/os/Bundle;

    .line 643
    .line 644
    .line 645
    move-result-object v2

    .line 646
    const-string v3, "android.support.v4.media.description.MEDIA_URI"

    .line 647
    .line 648
    if-eqz v2, :cond_f

    .line 649
    .line 650
    const-class v5, Landroid/support/v4/media/session/a;

    .line 651
    .line 652
    invoke-virtual {v5}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 653
    .line 654
    .line 655
    move-result-object v5

    .line 656
    invoke-virtual {v2, v5}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 657
    .line 658
    .line 659
    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 660
    .line 661
    .line 662
    move-result-object v5

    .line 663
    check-cast v5, Landroid/net/Uri;

    .line 664
    .line 665
    goto :goto_4

    .line 666
    :cond_f
    move-object v5, v4

    .line 667
    :goto_4
    if-eqz v5, :cond_11

    .line 668
    .line 669
    const-string v6, "android.support.v4.media.description.NULL_BUNDLE_FLAG"

    .line 670
    .line 671
    invoke-virtual {v2, v6}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 672
    .line 673
    .line 674
    move-result v7

    .line 675
    if-eqz v7, :cond_10

    .line 676
    .line 677
    invoke-virtual {v2}, Landroid/os/BaseBundle;->size()I

    .line 678
    .line 679
    .line 680
    move-result v7

    .line 681
    if-ne v7, v10, :cond_10

    .line 682
    .line 683
    move-object/from16 v18, v4

    .line 684
    .line 685
    goto :goto_5

    .line 686
    :cond_10
    invoke-virtual {v2, v3}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 687
    .line 688
    .line 689
    invoke-virtual {v2, v6}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 690
    .line 691
    .line 692
    :cond_11
    move-object/from16 v18, v2

    .line 693
    .line 694
    :goto_5
    if-eqz v5, :cond_12

    .line 695
    .line 696
    :goto_6
    move-object/from16 v19, v5

    .line 697
    .line 698
    goto :goto_7

    .line 699
    :cond_12
    invoke-virtual {v1}, Landroid/media/MediaDescription;->getMediaUri()Landroid/net/Uri;

    .line 700
    .line 701
    .line 702
    move-result-object v5

    .line 703
    goto :goto_6

    .line 704
    :goto_7
    new-instance v11, Landroid/support/v4/media/MediaDescriptionCompat;

    .line 705
    .line 706
    invoke-direct/range {v11 .. v19}, Landroid/support/v4/media/MediaDescriptionCompat;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/graphics/Bitmap;Landroid/net/Uri;Landroid/os/Bundle;Landroid/net/Uri;)V

    .line 707
    .line 708
    .line 709
    iput-object v1, v11, Landroid/support/v4/media/MediaDescriptionCompat;->m:Landroid/media/MediaDescription;

    .line 710
    .line 711
    move-object v12, v11

    .line 712
    goto :goto_8

    .line 713
    :cond_13
    move-object v12, v4

    .line 714
    :goto_8
    return-object v12

    .line 715
    :pswitch_21
    new-instance v2, Landroid/support/v4/media/MediaBrowserCompat$MediaItem;

    .line 716
    .line 717
    invoke-direct {v2, v1}, Landroid/support/v4/media/MediaBrowserCompat$MediaItem;-><init>(Landroid/os/Parcel;)V

    .line 718
    .line 719
    .line 720
    return-object v2

    .line 721
    :pswitch_22
    new-instance v2, LX/J;

    .line 722
    .line 723
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 724
    .line 725
    .line 726
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 727
    .line 728
    .line 729
    move-result v3

    .line 730
    iput v3, v2, LX/J;->e:I

    .line 731
    .line 732
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 733
    .line 734
    .line 735
    move-result v3

    .line 736
    iput v3, v2, LX/J;->f:I

    .line 737
    .line 738
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 739
    .line 740
    .line 741
    move-result v3

    .line 742
    iput v3, v2, LX/J;->g:I

    .line 743
    .line 744
    if-lez v3, :cond_14

    .line 745
    .line 746
    new-array v3, v3, [I

    .line 747
    .line 748
    iput-object v3, v2, LX/J;->h:[I

    .line 749
    .line 750
    invoke-virtual {v1, v3}, Landroid/os/Parcel;->readIntArray([I)V

    .line 751
    .line 752
    .line 753
    :cond_14
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 754
    .line 755
    .line 756
    move-result v3

    .line 757
    iput v3, v2, LX/J;->i:I

    .line 758
    .line 759
    if-lez v3, :cond_15

    .line 760
    .line 761
    new-array v3, v3, [I

    .line 762
    .line 763
    iput-object v3, v2, LX/J;->j:[I

    .line 764
    .line 765
    invoke-virtual {v1, v3}, Landroid/os/Parcel;->readIntArray([I)V

    .line 766
    .line 767
    .line 768
    :cond_15
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 769
    .line 770
    .line 771
    move-result v3

    .line 772
    if-ne v3, v9, :cond_16

    .line 773
    .line 774
    move v3, v9

    .line 775
    goto :goto_9

    .line 776
    :cond_16
    move v3, v11

    .line 777
    :goto_9
    iput-boolean v3, v2, LX/J;->l:Z

    .line 778
    .line 779
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 780
    .line 781
    .line 782
    move-result v3

    .line 783
    if-ne v3, v9, :cond_17

    .line 784
    .line 785
    move v3, v9

    .line 786
    goto :goto_a

    .line 787
    :cond_17
    move v3, v11

    .line 788
    :goto_a
    iput-boolean v3, v2, LX/J;->m:Z

    .line 789
    .line 790
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 791
    .line 792
    .line 793
    move-result v3

    .line 794
    if-ne v3, v9, :cond_18

    .line 795
    .line 796
    goto :goto_b

    .line 797
    :cond_18
    move v9, v11

    .line 798
    :goto_b
    iput-boolean v9, v2, LX/J;->n:Z

    .line 799
    .line 800
    const-class v3, LX/I;

    .line 801
    .line 802
    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 803
    .line 804
    .line 805
    move-result-object v3

    .line 806
    invoke-virtual {v1, v3}, Landroid/os/Parcel;->readArrayList(Ljava/lang/ClassLoader;)Ljava/util/ArrayList;

    .line 807
    .line 808
    .line 809
    move-result-object v1

    .line 810
    iput-object v1, v2, LX/J;->k:Ljava/util/ArrayList;

    .line 811
    .line 812
    return-object v2

    .line 813
    :pswitch_23
    new-instance v2, LX/I;

    .line 814
    .line 815
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 816
    .line 817
    .line 818
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 819
    .line 820
    .line 821
    move-result v3

    .line 822
    iput v3, v2, LX/I;->e:I

    .line 823
    .line 824
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 825
    .line 826
    .line 827
    move-result v3

    .line 828
    iput v3, v2, LX/I;->f:I

    .line 829
    .line 830
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 831
    .line 832
    .line 833
    move-result v3

    .line 834
    if-ne v3, v9, :cond_19

    .line 835
    .line 836
    goto :goto_c

    .line 837
    :cond_19
    move v9, v11

    .line 838
    :goto_c
    iput-boolean v9, v2, LX/I;->h:Z

    .line 839
    .line 840
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 841
    .line 842
    .line 843
    move-result v3

    .line 844
    if-lez v3, :cond_1a

    .line 845
    .line 846
    new-array v3, v3, [I

    .line 847
    .line 848
    iput-object v3, v2, LX/I;->g:[I

    .line 849
    .line 850
    invoke-virtual {v1, v3}, Landroid/os/Parcel;->readIntArray([I)V

    .line 851
    .line 852
    .line 853
    :cond_1a
    return-object v2

    .line 854
    :pswitch_24
    new-instance v2, LX/m;

    .line 855
    .line 856
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 857
    .line 858
    .line 859
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 860
    .line 861
    .line 862
    move-result v3

    .line 863
    iput v3, v2, LX/m;->e:I

    .line 864
    .line 865
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 866
    .line 867
    .line 868
    move-result v3

    .line 869
    iput v3, v2, LX/m;->f:I

    .line 870
    .line 871
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 872
    .line 873
    .line 874
    move-result v1

    .line 875
    if-ne v1, v9, :cond_1b

    .line 876
    .line 877
    goto :goto_d

    .line 878
    :cond_1b
    move v9, v11

    .line 879
    :goto_d
    iput-boolean v9, v2, LX/m;->g:Z

    .line 880
    .line 881
    return-object v2

    .line 882
    :pswitch_25
    const/4 v4, 0x0

    .line 883
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 884
    .line 885
    .line 886
    move-result v2

    .line 887
    move-object v12, v4

    .line 888
    :goto_e
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 889
    .line 890
    .line 891
    move-result v3

    .line 892
    if-ge v3, v2, :cond_1d

    .line 893
    .line 894
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 895
    .line 896
    .line 897
    move-result v3

    .line 898
    int-to-char v4, v3

    .line 899
    if-eq v4, v10, :cond_1c

    .line 900
    .line 901
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 902
    .line 903
    .line 904
    goto :goto_e

    .line 905
    :cond_1c
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->g(Landroid/os/Parcel;I)Landroid/os/Bundle;

    .line 906
    .line 907
    .line 908
    move-result-object v3

    .line 909
    move-object v12, v3

    .line 910
    goto :goto_e

    .line 911
    :cond_1d
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 912
    .line 913
    .line 914
    new-instance v1, LV1/x;

    .line 915
    .line 916
    invoke-direct {v1, v12}, LV1/x;-><init>(Landroid/os/Bundle;)V

    .line 917
    .line 918
    .line 919
    return-object v1

    .line 920
    :pswitch_26
    const/4 v4, 0x0

    .line 921
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 922
    .line 923
    .line 924
    move-result v2

    .line 925
    new-instance v3, Landroid/os/Bundle;

    .line 926
    .line 927
    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 928
    .line 929
    .line 930
    sget-object v5, LN0/c;->s:[Lcom/google/android/gms/common/api/Scope;

    .line 931
    .line 932
    sget-object v6, LN0/c;->t:[LK0/c;

    .line 933
    .line 934
    move-object/from16 v19, v3

    .line 935
    .line 936
    move-object/from16 v16, v4

    .line 937
    .line 938
    move-object/from16 v17, v16

    .line 939
    .line 940
    move-object/from16 v20, v17

    .line 941
    .line 942
    move-object/from16 v26, v20

    .line 943
    .line 944
    move-object/from16 v18, v5

    .line 945
    .line 946
    move-object/from16 v21, v6

    .line 947
    .line 948
    move-object/from16 v22, v21

    .line 949
    .line 950
    move v13, v11

    .line 951
    move v14, v13

    .line 952
    move v15, v14

    .line 953
    move/from16 v23, v15

    .line 954
    .line 955
    move/from16 v24, v23

    .line 956
    .line 957
    move/from16 v25, v24

    .line 958
    .line 959
    :goto_f
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 960
    .line 961
    .line 962
    move-result v3

    .line 963
    if-ge v3, v2, :cond_1e

    .line 964
    .line 965
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 966
    .line 967
    .line 968
    move-result v3

    .line 969
    int-to-char v4, v3

    .line 970
    packed-switch v4, :pswitch_data_2

    .line 971
    .line 972
    .line 973
    :pswitch_27
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 974
    .line 975
    .line 976
    goto :goto_f

    .line 977
    :pswitch_28
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->i(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 978
    .line 979
    .line 980
    move-result-object v26

    .line 981
    goto :goto_f

    .line 982
    :pswitch_29
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->A(Landroid/os/Parcel;I)Z

    .line 983
    .line 984
    .line 985
    move-result v25

    .line 986
    goto :goto_f

    .line 987
    :pswitch_2a
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 988
    .line 989
    .line 990
    move-result v24

    .line 991
    goto :goto_f

    .line 992
    :pswitch_2b
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->A(Landroid/os/Parcel;I)Z

    .line 993
    .line 994
    .line 995
    move-result v23

    .line 996
    goto :goto_f

    .line 997
    :pswitch_2c
    sget-object v4, LK0/c;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 998
    .line 999
    invoke-static {v1, v3, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->j(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    .line 1000
    .line 1001
    .line 1002
    move-result-object v3

    .line 1003
    move-object/from16 v22, v3

    .line 1004
    .line 1005
    check-cast v22, [LK0/c;

    .line 1006
    .line 1007
    goto :goto_f

    .line 1008
    :pswitch_2d
    sget-object v4, LK0/c;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1009
    .line 1010
    invoke-static {v1, v3, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->j(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    .line 1011
    .line 1012
    .line 1013
    move-result-object v3

    .line 1014
    move-object/from16 v21, v3

    .line 1015
    .line 1016
    check-cast v21, [LK0/c;

    .line 1017
    .line 1018
    goto :goto_f

    .line 1019
    :pswitch_2e
    sget-object v4, Landroid/accounts/Account;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1020
    .line 1021
    invoke-static {v1, v3, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->h(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 1022
    .line 1023
    .line 1024
    move-result-object v3

    .line 1025
    move-object/from16 v20, v3

    .line 1026
    .line 1027
    check-cast v20, Landroid/accounts/Account;

    .line 1028
    .line 1029
    goto :goto_f

    .line 1030
    :pswitch_2f
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->g(Landroid/os/Parcel;I)Landroid/os/Bundle;

    .line 1031
    .line 1032
    .line 1033
    move-result-object v19

    .line 1034
    goto :goto_f

    .line 1035
    :pswitch_30
    sget-object v4, Lcom/google/android/gms/common/api/Scope;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1036
    .line 1037
    invoke-static {v1, v3, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->j(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    .line 1038
    .line 1039
    .line 1040
    move-result-object v3

    .line 1041
    move-object/from16 v18, v3

    .line 1042
    .line 1043
    check-cast v18, [Lcom/google/android/gms/common/api/Scope;

    .line 1044
    .line 1045
    goto :goto_f

    .line 1046
    :pswitch_31
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->E(Landroid/os/Parcel;I)Landroid/os/IBinder;

    .line 1047
    .line 1048
    .line 1049
    move-result-object v17

    .line 1050
    goto :goto_f

    .line 1051
    :pswitch_32
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->i(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 1052
    .line 1053
    .line 1054
    move-result-object v16

    .line 1055
    goto :goto_f

    .line 1056
    :pswitch_33
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1057
    .line 1058
    .line 1059
    move-result v15

    .line 1060
    goto :goto_f

    .line 1061
    :pswitch_34
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1062
    .line 1063
    .line 1064
    move-result v14

    .line 1065
    goto :goto_f

    .line 1066
    :pswitch_35
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1067
    .line 1068
    .line 1069
    move-result v13

    .line 1070
    goto :goto_f

    .line 1071
    :cond_1e
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 1072
    .line 1073
    .line 1074
    new-instance v12, LN0/c;

    .line 1075
    .line 1076
    invoke-direct/range {v12 .. v26}, LN0/c;-><init>(IIILjava/lang/String;Landroid/os/IBinder;[Lcom/google/android/gms/common/api/Scope;Landroid/os/Bundle;Landroid/accounts/Account;[LK0/c;[LK0/c;ZIZLjava/lang/String;)V

    .line 1077
    .line 1078
    .line 1079
    return-object v12

    .line 1080
    :pswitch_36
    const/4 v4, 0x0

    .line 1081
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 1082
    .line 1083
    .line 1084
    move-result v2

    .line 1085
    move-object v13, v4

    .line 1086
    move-object/from16 v16, v13

    .line 1087
    .line 1088
    move-object/from16 v18, v16

    .line 1089
    .line 1090
    move v14, v11

    .line 1091
    move v15, v14

    .line 1092
    move/from16 v17, v15

    .line 1093
    .line 1094
    :goto_10
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1095
    .line 1096
    .line 1097
    move-result v3

    .line 1098
    if-ge v3, v2, :cond_21

    .line 1099
    .line 1100
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1101
    .line 1102
    .line 1103
    move-result v3

    .line 1104
    int-to-char v5, v3

    .line 1105
    packed-switch v5, :pswitch_data_3

    .line 1106
    .line 1107
    .line 1108
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 1109
    .line 1110
    .line 1111
    goto :goto_10

    .line 1112
    :pswitch_37
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->G(Landroid/os/Parcel;I)I

    .line 1113
    .line 1114
    .line 1115
    move-result v3

    .line 1116
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1117
    .line 1118
    .line 1119
    move-result v5

    .line 1120
    if-nez v3, :cond_1f

    .line 1121
    .line 1122
    move-object/from16 v18, v4

    .line 1123
    .line 1124
    goto :goto_10

    .line 1125
    :cond_1f
    invoke-virtual {v1}, Landroid/os/Parcel;->createIntArray()[I

    .line 1126
    .line 1127
    .line 1128
    move-result-object v6

    .line 1129
    add-int/2addr v5, v3

    .line 1130
    invoke-virtual {v1, v5}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 1131
    .line 1132
    .line 1133
    move-object/from16 v18, v6

    .line 1134
    .line 1135
    goto :goto_10

    .line 1136
    :pswitch_38
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1137
    .line 1138
    .line 1139
    move-result v17

    .line 1140
    goto :goto_10

    .line 1141
    :pswitch_39
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->G(Landroid/os/Parcel;I)I

    .line 1142
    .line 1143
    .line 1144
    move-result v3

    .line 1145
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1146
    .line 1147
    .line 1148
    move-result v5

    .line 1149
    if-nez v3, :cond_20

    .line 1150
    .line 1151
    move-object/from16 v16, v4

    .line 1152
    .line 1153
    goto :goto_10

    .line 1154
    :cond_20
    invoke-virtual {v1}, Landroid/os/Parcel;->createIntArray()[I

    .line 1155
    .line 1156
    .line 1157
    move-result-object v6

    .line 1158
    add-int/2addr v5, v3

    .line 1159
    invoke-virtual {v1, v5}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 1160
    .line 1161
    .line 1162
    move-object/from16 v16, v6

    .line 1163
    .line 1164
    goto :goto_10

    .line 1165
    :pswitch_3a
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->A(Landroid/os/Parcel;I)Z

    .line 1166
    .line 1167
    .line 1168
    move-result v15

    .line 1169
    goto :goto_10

    .line 1170
    :pswitch_3b
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->A(Landroid/os/Parcel;I)Z

    .line 1171
    .line 1172
    .line 1173
    move-result v14

    .line 1174
    goto :goto_10

    .line 1175
    :pswitch_3c
    sget-object v5, LN0/g;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1176
    .line 1177
    invoke-static {v1, v3, v5}, Lcom/google/crypto/tink/shaded/protobuf/i0;->h(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 1178
    .line 1179
    .line 1180
    move-result-object v3

    .line 1181
    move-object v13, v3

    .line 1182
    check-cast v13, LN0/g;

    .line 1183
    .line 1184
    goto :goto_10

    .line 1185
    :cond_21
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 1186
    .line 1187
    .line 1188
    new-instance v12, LN0/b;

    .line 1189
    .line 1190
    invoke-direct/range {v12 .. v18}, LN0/b;-><init>(LN0/g;ZZ[II[I)V

    .line 1191
    .line 1192
    .line 1193
    return-object v12

    .line 1194
    :pswitch_3d
    const/4 v4, 0x0

    .line 1195
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 1196
    .line 1197
    .line 1198
    move-result v2

    .line 1199
    move-object v3, v4

    .line 1200
    move-object v12, v3

    .line 1201
    :goto_11
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1202
    .line 1203
    .line 1204
    move-result v5

    .line 1205
    if-ge v5, v2, :cond_26

    .line 1206
    .line 1207
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1208
    .line 1209
    .line 1210
    move-result v5

    .line 1211
    int-to-char v6, v5

    .line 1212
    if-eq v6, v9, :cond_25

    .line 1213
    .line 1214
    if-eq v6, v10, :cond_24

    .line 1215
    .line 1216
    if-eq v6, v8, :cond_23

    .line 1217
    .line 1218
    if-eq v6, v7, :cond_22

    .line 1219
    .line 1220
    invoke-static {v1, v5}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 1221
    .line 1222
    .line 1223
    goto :goto_11

    .line 1224
    :cond_22
    sget-object v3, LN0/b;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1225
    .line 1226
    invoke-static {v1, v5, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->h(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 1227
    .line 1228
    .line 1229
    move-result-object v3

    .line 1230
    check-cast v3, LN0/b;

    .line 1231
    .line 1232
    goto :goto_11

    .line 1233
    :cond_23
    invoke-static {v1, v5}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1234
    .line 1235
    .line 1236
    move-result v11

    .line 1237
    goto :goto_11

    .line 1238
    :cond_24
    sget-object v4, LK0/c;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1239
    .line 1240
    invoke-static {v1, v5, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->j(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    .line 1241
    .line 1242
    .line 1243
    move-result-object v4

    .line 1244
    check-cast v4, [LK0/c;

    .line 1245
    .line 1246
    goto :goto_11

    .line 1247
    :cond_25
    invoke-static {v1, v5}, Lcom/google/crypto/tink/shaded/protobuf/i0;->g(Landroid/os/Parcel;I)Landroid/os/Bundle;

    .line 1248
    .line 1249
    .line 1250
    move-result-object v12

    .line 1251
    goto :goto_11

    .line 1252
    :cond_26
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 1253
    .line 1254
    .line 1255
    new-instance v1, LN0/v;

    .line 1256
    .line 1257
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 1258
    .line 1259
    .line 1260
    iput-object v12, v1, LN0/v;->e:Landroid/os/Bundle;

    .line 1261
    .line 1262
    iput-object v4, v1, LN0/v;->f:[LK0/c;

    .line 1263
    .line 1264
    iput v11, v1, LN0/v;->g:I

    .line 1265
    .line 1266
    iput-object v3, v1, LN0/v;->h:LN0/b;

    .line 1267
    .line 1268
    return-object v1

    .line 1269
    :pswitch_3e
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 1270
    .line 1271
    .line 1272
    move-result v2

    .line 1273
    move v13, v11

    .line 1274
    move v14, v13

    .line 1275
    move v15, v14

    .line 1276
    move/from16 v16, v15

    .line 1277
    .line 1278
    move/from16 v17, v16

    .line 1279
    .line 1280
    :goto_12
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1281
    .line 1282
    .line 1283
    move-result v3

    .line 1284
    if-ge v3, v2, :cond_2c

    .line 1285
    .line 1286
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1287
    .line 1288
    .line 1289
    move-result v3

    .line 1290
    int-to-char v4, v3

    .line 1291
    if-eq v4, v9, :cond_2b

    .line 1292
    .line 1293
    if-eq v4, v10, :cond_2a

    .line 1294
    .line 1295
    if-eq v4, v8, :cond_29

    .line 1296
    .line 1297
    if-eq v4, v7, :cond_28

    .line 1298
    .line 1299
    if-eq v4, v6, :cond_27

    .line 1300
    .line 1301
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 1302
    .line 1303
    .line 1304
    goto :goto_12

    .line 1305
    :cond_27
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1306
    .line 1307
    .line 1308
    move-result v17

    .line 1309
    goto :goto_12

    .line 1310
    :cond_28
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1311
    .line 1312
    .line 1313
    move-result v16

    .line 1314
    goto :goto_12

    .line 1315
    :cond_29
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->A(Landroid/os/Parcel;I)Z

    .line 1316
    .line 1317
    .line 1318
    move-result v15

    .line 1319
    goto :goto_12

    .line 1320
    :cond_2a
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->A(Landroid/os/Parcel;I)Z

    .line 1321
    .line 1322
    .line 1323
    move-result v14

    .line 1324
    goto :goto_12

    .line 1325
    :cond_2b
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1326
    .line 1327
    .line 1328
    move-result v13

    .line 1329
    goto :goto_12

    .line 1330
    :cond_2c
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 1331
    .line 1332
    .line 1333
    new-instance v12, LN0/g;

    .line 1334
    .line 1335
    invoke-direct/range {v12 .. v17}, LN0/g;-><init>(IZZII)V

    .line 1336
    .line 1337
    .line 1338
    return-object v12

    .line 1339
    :pswitch_3f
    const/4 v2, -0x1

    .line 1340
    const/4 v4, 0x0

    .line 1341
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 1342
    .line 1343
    .line 1344
    move-result v5

    .line 1345
    const-wide/16 v6, 0x0

    .line 1346
    .line 1347
    move/from16 v23, v2

    .line 1348
    .line 1349
    move-object/from16 v20, v4

    .line 1350
    .line 1351
    move-object/from16 v21, v20

    .line 1352
    .line 1353
    move-wide/from16 v16, v6

    .line 1354
    .line 1355
    move-wide/from16 v18, v16

    .line 1356
    .line 1357
    move v13, v11

    .line 1358
    move v14, v13

    .line 1359
    move v15, v14

    .line 1360
    move/from16 v22, v15

    .line 1361
    .line 1362
    :goto_13
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1363
    .line 1364
    .line 1365
    move-result v2

    .line 1366
    if-ge v2, v5, :cond_2d

    .line 1367
    .line 1368
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1369
    .line 1370
    .line 1371
    move-result v2

    .line 1372
    int-to-char v4, v2

    .line 1373
    packed-switch v4, :pswitch_data_4

    .line 1374
    .line 1375
    .line 1376
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 1377
    .line 1378
    .line 1379
    goto :goto_13

    .line 1380
    :pswitch_40
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1381
    .line 1382
    .line 1383
    move-result v2

    .line 1384
    move/from16 v23, v2

    .line 1385
    .line 1386
    goto :goto_13

    .line 1387
    :pswitch_41
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1388
    .line 1389
    .line 1390
    move-result v2

    .line 1391
    move/from16 v22, v2

    .line 1392
    .line 1393
    goto :goto_13

    .line 1394
    :pswitch_42
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->i(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 1395
    .line 1396
    .line 1397
    move-result-object v2

    .line 1398
    move-object/from16 v21, v2

    .line 1399
    .line 1400
    goto :goto_13

    .line 1401
    :pswitch_43
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->i(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 1402
    .line 1403
    .line 1404
    move-result-object v2

    .line 1405
    move-object/from16 v20, v2

    .line 1406
    .line 1407
    goto :goto_13

    .line 1408
    :pswitch_44
    invoke-static {v1, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->T(Landroid/os/Parcel;II)V

    .line 1409
    .line 1410
    .line 1411
    invoke-virtual {v1}, Landroid/os/Parcel;->readLong()J

    .line 1412
    .line 1413
    .line 1414
    move-result-wide v6

    .line 1415
    move-wide/from16 v18, v6

    .line 1416
    .line 1417
    goto :goto_13

    .line 1418
    :pswitch_45
    invoke-static {v1, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->T(Landroid/os/Parcel;II)V

    .line 1419
    .line 1420
    .line 1421
    invoke-virtual {v1}, Landroid/os/Parcel;->readLong()J

    .line 1422
    .line 1423
    .line 1424
    move-result-wide v6

    .line 1425
    move-wide/from16 v16, v6

    .line 1426
    .line 1427
    goto :goto_13

    .line 1428
    :pswitch_46
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1429
    .line 1430
    .line 1431
    move-result v2

    .line 1432
    move v15, v2

    .line 1433
    goto :goto_13

    .line 1434
    :pswitch_47
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1435
    .line 1436
    .line 1437
    move-result v2

    .line 1438
    move v14, v2

    .line 1439
    goto :goto_13

    .line 1440
    :pswitch_48
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1441
    .line 1442
    .line 1443
    move-result v2

    .line 1444
    move v13, v2

    .line 1445
    goto :goto_13

    .line 1446
    :cond_2d
    invoke-static {v1, v5}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 1447
    .line 1448
    .line 1449
    new-instance v12, LN0/e;

    .line 1450
    .line 1451
    invoke-direct/range {v12 .. v23}, LN0/e;-><init>(IIIJJLjava/lang/String;Ljava/lang/String;II)V

    .line 1452
    .line 1453
    .line 1454
    return-object v12

    .line 1455
    :pswitch_49
    const/4 v4, 0x0

    .line 1456
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 1457
    .line 1458
    .line 1459
    move-result v2

    .line 1460
    move-object v12, v4

    .line 1461
    :goto_14
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1462
    .line 1463
    .line 1464
    move-result v3

    .line 1465
    if-ge v3, v2, :cond_30

    .line 1466
    .line 1467
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1468
    .line 1469
    .line 1470
    move-result v3

    .line 1471
    int-to-char v4, v3

    .line 1472
    if-eq v4, v9, :cond_2f

    .line 1473
    .line 1474
    if-eq v4, v10, :cond_2e

    .line 1475
    .line 1476
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 1477
    .line 1478
    .line 1479
    goto :goto_14

    .line 1480
    :cond_2e
    sget-object v4, LN0/e;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1481
    .line 1482
    invoke-static {v1, v3, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->k(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    .line 1483
    .line 1484
    .line 1485
    move-result-object v12

    .line 1486
    goto :goto_14

    .line 1487
    :cond_2f
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1488
    .line 1489
    .line 1490
    move-result v11

    .line 1491
    goto :goto_14

    .line 1492
    :cond_30
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 1493
    .line 1494
    .line 1495
    new-instance v1, LN0/h;

    .line 1496
    .line 1497
    invoke-direct {v1, v11, v12}, LN0/h;-><init>(ILjava/util/List;)V

    .line 1498
    .line 1499
    .line 1500
    return-object v1

    .line 1501
    :pswitch_4a
    const/4 v4, 0x0

    .line 1502
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 1503
    .line 1504
    .line 1505
    move-result v2

    .line 1506
    move-object v3, v4

    .line 1507
    move-object v12, v3

    .line 1508
    :goto_15
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1509
    .line 1510
    .line 1511
    move-result v5

    .line 1512
    if-ge v5, v2, :cond_35

    .line 1513
    .line 1514
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1515
    .line 1516
    .line 1517
    move-result v5

    .line 1518
    int-to-char v6, v5

    .line 1519
    if-eq v6, v9, :cond_34

    .line 1520
    .line 1521
    if-eq v6, v10, :cond_33

    .line 1522
    .line 1523
    if-eq v6, v8, :cond_32

    .line 1524
    .line 1525
    if-eq v6, v7, :cond_31

    .line 1526
    .line 1527
    invoke-static {v1, v5}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 1528
    .line 1529
    .line 1530
    goto :goto_15

    .line 1531
    :cond_31
    sget-object v3, LK0/a;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1532
    .line 1533
    invoke-static {v1, v5, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->h(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 1534
    .line 1535
    .line 1536
    move-result-object v3

    .line 1537
    check-cast v3, LK0/a;

    .line 1538
    .line 1539
    goto :goto_15

    .line 1540
    :cond_32
    sget-object v4, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1541
    .line 1542
    invoke-static {v1, v5, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->h(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 1543
    .line 1544
    .line 1545
    move-result-object v4

    .line 1546
    check-cast v4, Landroid/app/PendingIntent;

    .line 1547
    .line 1548
    goto :goto_15

    .line 1549
    :cond_33
    invoke-static {v1, v5}, Lcom/google/crypto/tink/shaded/protobuf/i0;->i(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 1550
    .line 1551
    .line 1552
    move-result-object v12

    .line 1553
    goto :goto_15

    .line 1554
    :cond_34
    invoke-static {v1, v5}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1555
    .line 1556
    .line 1557
    move-result v11

    .line 1558
    goto :goto_15

    .line 1559
    :cond_35
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 1560
    .line 1561
    .line 1562
    new-instance v1, Lcom/google/android/gms/common/api/Status;

    .line 1563
    .line 1564
    invoke-direct {v1, v11, v12, v4, v3}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;LK0/a;)V

    .line 1565
    .line 1566
    .line 1567
    return-object v1

    .line 1568
    :pswitch_4b
    const/4 v4, 0x0

    .line 1569
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 1570
    .line 1571
    .line 1572
    move-result v2

    .line 1573
    move-object v12, v4

    .line 1574
    :goto_16
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1575
    .line 1576
    .line 1577
    move-result v3

    .line 1578
    if-ge v3, v2, :cond_38

    .line 1579
    .line 1580
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1581
    .line 1582
    .line 1583
    move-result v3

    .line 1584
    int-to-char v4, v3

    .line 1585
    if-eq v4, v9, :cond_37

    .line 1586
    .line 1587
    if-eq v4, v10, :cond_36

    .line 1588
    .line 1589
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 1590
    .line 1591
    .line 1592
    goto :goto_16

    .line 1593
    :cond_36
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->i(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 1594
    .line 1595
    .line 1596
    move-result-object v12

    .line 1597
    goto :goto_16

    .line 1598
    :cond_37
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1599
    .line 1600
    .line 1601
    move-result v11

    .line 1602
    goto :goto_16

    .line 1603
    :cond_38
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 1604
    .line 1605
    .line 1606
    new-instance v1, Lcom/google/android/gms/common/api/Scope;

    .line 1607
    .line 1608
    invoke-direct {v1, v12, v11}, Lcom/google/android/gms/common/api/Scope;-><init>(Ljava/lang/String;I)V

    .line 1609
    .line 1610
    .line 1611
    return-object v1

    .line 1612
    :pswitch_4c
    const/4 v4, 0x0

    .line 1613
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 1614
    .line 1615
    .line 1616
    move-result v2

    .line 1617
    const-wide/16 v5, -0x1

    .line 1618
    .line 1619
    move-object v13, v4

    .line 1620
    move-wide v15, v5

    .line 1621
    move v14, v11

    .line 1622
    move/from16 v17, v14

    .line 1623
    .line 1624
    :goto_17
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1625
    .line 1626
    .line 1627
    move-result v4

    .line 1628
    if-ge v4, v2, :cond_3d

    .line 1629
    .line 1630
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1631
    .line 1632
    .line 1633
    move-result v4

    .line 1634
    int-to-char v5, v4

    .line 1635
    if-eq v5, v9, :cond_3c

    .line 1636
    .line 1637
    if-eq v5, v10, :cond_3b

    .line 1638
    .line 1639
    if-eq v5, v8, :cond_3a

    .line 1640
    .line 1641
    if-eq v5, v7, :cond_39

    .line 1642
    .line 1643
    invoke-static {v1, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 1644
    .line 1645
    .line 1646
    goto :goto_17

    .line 1647
    :cond_39
    invoke-static {v1, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->A(Landroid/os/Parcel;I)Z

    .line 1648
    .line 1649
    .line 1650
    move-result v4

    .line 1651
    move/from16 v17, v4

    .line 1652
    .line 1653
    goto :goto_17

    .line 1654
    :cond_3a
    invoke-static {v1, v4, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->T(Landroid/os/Parcel;II)V

    .line 1655
    .line 1656
    .line 1657
    invoke-virtual {v1}, Landroid/os/Parcel;->readLong()J

    .line 1658
    .line 1659
    .line 1660
    move-result-wide v4

    .line 1661
    move-wide v15, v4

    .line 1662
    goto :goto_17

    .line 1663
    :cond_3b
    invoke-static {v1, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1664
    .line 1665
    .line 1666
    move-result v4

    .line 1667
    move v14, v4

    .line 1668
    goto :goto_17

    .line 1669
    :cond_3c
    invoke-static {v1, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->i(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 1670
    .line 1671
    .line 1672
    move-result-object v4

    .line 1673
    move-object v13, v4

    .line 1674
    goto :goto_17

    .line 1675
    :cond_3d
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 1676
    .line 1677
    .line 1678
    new-instance v12, LK0/c;

    .line 1679
    .line 1680
    invoke-direct/range {v12 .. v17}, LK0/c;-><init>(Ljava/lang/String;IJZ)V

    .line 1681
    .line 1682
    .line 1683
    return-object v12

    .line 1684
    :pswitch_4d
    const/4 v4, 0x0

    .line 1685
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 1686
    .line 1687
    .line 1688
    move-result v2

    .line 1689
    move-object v15, v4

    .line 1690
    move-object/from16 v16, v15

    .line 1691
    .line 1692
    move-object/from16 v17, v16

    .line 1693
    .line 1694
    move v13, v11

    .line 1695
    move v14, v13

    .line 1696
    :goto_18
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1697
    .line 1698
    .line 1699
    move-result v3

    .line 1700
    if-ge v3, v2, :cond_44

    .line 1701
    .line 1702
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1703
    .line 1704
    .line 1705
    move-result v3

    .line 1706
    int-to-char v5, v3

    .line 1707
    if-eq v5, v9, :cond_43

    .line 1708
    .line 1709
    if-eq v5, v10, :cond_42

    .line 1710
    .line 1711
    if-eq v5, v8, :cond_41

    .line 1712
    .line 1713
    if-eq v5, v7, :cond_40

    .line 1714
    .line 1715
    if-eq v5, v6, :cond_3e

    .line 1716
    .line 1717
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 1718
    .line 1719
    .line 1720
    goto :goto_18

    .line 1721
    :cond_3e
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->G(Landroid/os/Parcel;I)I

    .line 1722
    .line 1723
    .line 1724
    move-result v3

    .line 1725
    if-nez v3, :cond_3f

    .line 1726
    .line 1727
    move-object/from16 v17, v4

    .line 1728
    .line 1729
    goto :goto_18

    .line 1730
    :cond_3f
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->V(Landroid/os/Parcel;I)V

    .line 1731
    .line 1732
    .line 1733
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1734
    .line 1735
    .line 1736
    move-result v3

    .line 1737
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1738
    .line 1739
    .line 1740
    move-result-object v3

    .line 1741
    move-object/from16 v17, v3

    .line 1742
    .line 1743
    goto :goto_18

    .line 1744
    :cond_40
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->i(Landroid/os/Parcel;I)Ljava/lang/String;

    .line 1745
    .line 1746
    .line 1747
    move-result-object v16

    .line 1748
    goto :goto_18

    .line 1749
    :cond_41
    sget-object v5, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1750
    .line 1751
    invoke-static {v1, v3, v5}, Lcom/google/crypto/tink/shaded/protobuf/i0;->h(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 1752
    .line 1753
    .line 1754
    move-result-object v3

    .line 1755
    move-object v15, v3

    .line 1756
    check-cast v15, Landroid/app/PendingIntent;

    .line 1757
    .line 1758
    goto :goto_18

    .line 1759
    :cond_42
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1760
    .line 1761
    .line 1762
    move-result v14

    .line 1763
    goto :goto_18

    .line 1764
    :cond_43
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1765
    .line 1766
    .line 1767
    move-result v13

    .line 1768
    goto :goto_18

    .line 1769
    :cond_44
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 1770
    .line 1771
    .line 1772
    new-instance v12, LK0/a;

    .line 1773
    .line 1774
    invoke-direct/range {v12 .. v17}, LK0/a;-><init>(IILandroid/app/PendingIntent;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1775
    .line 1776
    .line 1777
    return-object v12

    .line 1778
    :pswitch_4e
    new-instance v2, LG/g;

    .line 1779
    .line 1780
    invoke-direct {v2, v1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    .line 1781
    .line 1782
    .line 1783
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1784
    .line 1785
    .line 1786
    move-result v1

    .line 1787
    iput v1, v2, LG/g;->e:I

    .line 1788
    .line 1789
    return-object v2

    .line 1790
    :pswitch_4f
    const/4 v4, 0x0

    .line 1791
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->P(Landroid/os/Parcel;)I

    .line 1792
    .line 1793
    .line 1794
    move-result v2

    .line 1795
    new-instance v14, Ljava/util/ArrayList;

    .line 1796
    .line 1797
    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 1798
    .line 1799
    .line 1800
    move-object v13, v4

    .line 1801
    move-object/from16 v23, v13

    .line 1802
    .line 1803
    move v15, v5

    .line 1804
    move/from16 v18, v15

    .line 1805
    .line 1806
    move/from16 v16, v11

    .line 1807
    .line 1808
    move/from16 v17, v16

    .line 1809
    .line 1810
    move/from16 v19, v17

    .line 1811
    .line 1812
    move/from16 v20, v19

    .line 1813
    .line 1814
    move/from16 v21, v20

    .line 1815
    .line 1816
    move/from16 v22, v21

    .line 1817
    .line 1818
    :goto_19
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1819
    .line 1820
    .line 1821
    move-result v3

    .line 1822
    if-ge v3, v2, :cond_46

    .line 1823
    .line 1824
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    .line 1825
    .line 1826
    .line 1827
    move-result v3

    .line 1828
    int-to-char v4, v3

    .line 1829
    packed-switch v4, :pswitch_data_5

    .line 1830
    .line 1831
    .line 1832
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->J(Landroid/os/Parcel;I)V

    .line 1833
    .line 1834
    .line 1835
    goto :goto_19

    .line 1836
    :pswitch_50
    sget-object v4, Le1/q;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1837
    .line 1838
    invoke-static {v1, v3, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->k(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    .line 1839
    .line 1840
    .line 1841
    move-result-object v23

    .line 1842
    goto :goto_19

    .line 1843
    :pswitch_51
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1844
    .line 1845
    .line 1846
    move-result v22

    .line 1847
    goto :goto_19

    .line 1848
    :pswitch_52
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->A(Landroid/os/Parcel;I)Z

    .line 1849
    .line 1850
    .line 1851
    move-result v21

    .line 1852
    goto :goto_19

    .line 1853
    :pswitch_53
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->A(Landroid/os/Parcel;I)Z

    .line 1854
    .line 1855
    .line 1856
    move-result v20

    .line 1857
    goto :goto_19

    .line 1858
    :pswitch_54
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->A(Landroid/os/Parcel;I)Z

    .line 1859
    .line 1860
    .line 1861
    move-result v19

    .line 1862
    goto :goto_19

    .line 1863
    :pswitch_55
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->C(Landroid/os/Parcel;I)F

    .line 1864
    .line 1865
    .line 1866
    move-result v18

    .line 1867
    goto :goto_19

    .line 1868
    :pswitch_56
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1869
    .line 1870
    .line 1871
    move-result v17

    .line 1872
    goto :goto_19

    .line 1873
    :pswitch_57
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->F(Landroid/os/Parcel;I)I

    .line 1874
    .line 1875
    .line 1876
    move-result v16

    .line 1877
    goto :goto_19

    .line 1878
    :pswitch_58
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->C(Landroid/os/Parcel;I)F

    .line 1879
    .line 1880
    .line 1881
    move-result v15

    .line 1882
    goto :goto_19

    .line 1883
    :pswitch_59
    const-class v4, Le1/I;

    .line 1884
    .line 1885
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 1886
    .line 1887
    .line 1888
    move-result-object v4

    .line 1889
    invoke-static {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->G(Landroid/os/Parcel;I)I

    .line 1890
    .line 1891
    .line 1892
    move-result v3

    .line 1893
    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    .line 1894
    .line 1895
    .line 1896
    move-result v5

    .line 1897
    if-nez v3, :cond_45

    .line 1898
    .line 1899
    goto :goto_19

    .line 1900
    :cond_45
    invoke-virtual {v1, v14, v4}, Landroid/os/Parcel;->readList(Ljava/util/List;Ljava/lang/ClassLoader;)V

    .line 1901
    .line 1902
    .line 1903
    add-int/2addr v5, v3

    .line 1904
    invoke-virtual {v1, v5}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 1905
    .line 1906
    .line 1907
    goto :goto_19

    .line 1908
    :pswitch_5a
    sget-object v4, Lcom/google/android/gms/maps/model/LatLng;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 1909
    .line 1910
    invoke-static {v1, v3, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->k(Landroid/os/Parcel;ILandroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    .line 1911
    .line 1912
    .line 1913
    move-result-object v13

    .line 1914
    goto :goto_19

    .line 1915
    :cond_46
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->p(Landroid/os/Parcel;I)V

    .line 1916
    .line 1917
    .line 1918
    new-instance v12, Le1/u;

    .line 1919
    .line 1920
    invoke-direct/range {v12 .. v23}, Le1/u;-><init>(Ljava/util/ArrayList;Ljava/util/ArrayList;FIIFZZZILjava/util/ArrayList;)V

    .line 1921
    .line 1922
    .line 1923
    return-object v12

    .line 1924
    nop

    .line 1925
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4f
        :pswitch_4e
        :pswitch_4d
        :pswitch_4c
        :pswitch_4b
        :pswitch_4a
        :pswitch_49
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_36
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 1926
    .line 1927
    .line 1928
    .line 1929
    .line 1930
    .line 1931
    .line 1932
    .line 1933
    .line 1934
    .line 1935
    .line 1936
    .line 1937
    .line 1938
    .line 1939
    .line 1940
    .line 1941
    .line 1942
    .line 1943
    .line 1944
    .line 1945
    .line 1946
    .line 1947
    .line 1948
    .line 1949
    .line 1950
    .line 1951
    .line 1952
    .line 1953
    .line 1954
    .line 1955
    .line 1956
    .line 1957
    .line 1958
    .line 1959
    .line 1960
    .line 1961
    .line 1962
    .line 1963
    .line 1964
    .line 1965
    .line 1966
    .line 1967
    .line 1968
    .line 1969
    .line 1970
    .line 1971
    .line 1972
    .line 1973
    .line 1974
    .line 1975
    .line 1976
    .line 1977
    .line 1978
    .line 1979
    .line 1980
    .line 1981
    .line 1982
    .line 1983
    .line 1984
    .line 1985
    .line 1986
    .line 1987
    :pswitch_data_1
    .packed-switch 0x2
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_3
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_3
        :pswitch_4
    .end packed-switch

    .line 1988
    .line 1989
    .line 1990
    .line 1991
    .line 1992
    .line 1993
    .line 1994
    .line 1995
    .line 1996
    .line 1997
    .line 1998
    .line 1999
    .line 2000
    .line 2001
    .line 2002
    .line 2003
    .line 2004
    .line 2005
    .line 2006
    .line 2007
    .line 2008
    .line 2009
    .line 2010
    .line 2011
    .line 2012
    .line 2013
    .line 2014
    .line 2015
    .line 2016
    .line 2017
    .line 2018
    .line 2019
    .line 2020
    .line 2021
    .line 2022
    .line 2023
    .line 2024
    .line 2025
    .line 2026
    .line 2027
    .line 2028
    .line 2029
    .line 2030
    .line 2031
    .line 2032
    .line 2033
    .line 2034
    .line 2035
    :pswitch_data_2
    .packed-switch 0x1
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_27
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
    .end packed-switch

    .line 2036
    .line 2037
    .line 2038
    .line 2039
    .line 2040
    .line 2041
    .line 2042
    .line 2043
    .line 2044
    .line 2045
    .line 2046
    .line 2047
    .line 2048
    .line 2049
    .line 2050
    .line 2051
    .line 2052
    .line 2053
    .line 2054
    .line 2055
    .line 2056
    .line 2057
    .line 2058
    .line 2059
    .line 2060
    .line 2061
    .line 2062
    .line 2063
    .line 2064
    .line 2065
    .line 2066
    .line 2067
    .line 2068
    .line 2069
    :pswitch_data_3
    .packed-switch 0x1
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
    .end packed-switch

    .line 2070
    .line 2071
    .line 2072
    .line 2073
    .line 2074
    :pswitch_data_4
    .packed-switch 0x1
        :pswitch_48
        :pswitch_47
        :pswitch_46
        :pswitch_45
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
    .end packed-switch

    :pswitch_data_5
    .packed-switch 0x2
        :pswitch_5a
        :pswitch_59
        :pswitch_58
        :pswitch_57
        :pswitch_56
        :pswitch_55
        :pswitch_54
        :pswitch_53
        :pswitch_52
        :pswitch_51
        :pswitch_50
    .end packed-switch
.end method

.method public final newArray(I)[Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Le1/I;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    new-array p1, p1, [Le1/z;

    .line 7
    .line 8
    return-object p1

    .line 9
    :pswitch_0
    new-array p1, p1, [Lcom/google/android/gms/maps/model/CameraPosition;

    .line 10
    .line 11
    return-object p1

    .line 12
    :pswitch_1
    new-array p1, p1, [Ld/d;

    .line 13
    .line 14
    return-object p1

    .line 15
    :pswitch_2
    new-array p1, p1, [Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 16
    .line 17
    return-object p1

    .line 18
    :pswitch_3
    new-array p1, p1, [Landroidx/versionedparcelable/ParcelImpl;

    .line 19
    .line 20
    return-object p1

    .line 21
    :pswitch_4
    new-array p1, p1, [Landroid/support/v4/media/session/PlaybackStateCompat;

    .line 22
    .line 23
    return-object p1

    .line 24
    :pswitch_5
    new-array p1, p1, [Landroid/support/v4/media/session/ParcelableVolumeInfo;

    .line 25
    .line 26
    return-object p1

    .line 27
    :pswitch_6
    new-array p1, p1, [Landroid/support/v4/media/session/MediaSessionCompat$Token;

    .line 28
    .line 29
    return-object p1

    .line 30
    :pswitch_7
    new-array p1, p1, [Landroid/support/v4/media/session/MediaSessionCompat$ResultReceiverWrapper;

    .line 31
    .line 32
    return-object p1

    .line 33
    :pswitch_8
    new-array p1, p1, [Landroid/support/v4/media/session/MediaSessionCompat$QueueItem;

    .line 34
    .line 35
    return-object p1

    .line 36
    :pswitch_9
    new-array p1, p1, [Landroid/support/v4/media/RatingCompat;

    .line 37
    .line 38
    return-object p1

    .line 39
    :pswitch_a
    new-array p1, p1, [Landroid/support/v4/media/MediaMetadataCompat;

    .line 40
    .line 41
    return-object p1

    .line 42
    :pswitch_b
    new-array p1, p1, [Landroid/support/v4/media/MediaDescriptionCompat;

    .line 43
    .line 44
    return-object p1

    .line 45
    :pswitch_c
    new-array p1, p1, [Landroid/support/v4/media/MediaBrowserCompat$MediaItem;

    .line 46
    .line 47
    return-object p1

    .line 48
    :pswitch_d
    new-array p1, p1, [LX/J;

    .line 49
    .line 50
    return-object p1

    .line 51
    :pswitch_e
    new-array p1, p1, [LX/I;

    .line 52
    .line 53
    return-object p1

    .line 54
    :pswitch_f
    new-array p1, p1, [LX/m;

    .line 55
    .line 56
    return-object p1

    .line 57
    :pswitch_10
    new-array p1, p1, [LV1/x;

    .line 58
    .line 59
    return-object p1

    .line 60
    :pswitch_11
    new-array p1, p1, [LN0/c;

    .line 61
    .line 62
    return-object p1

    .line 63
    :pswitch_12
    new-array p1, p1, [LN0/b;

    .line 64
    .line 65
    return-object p1

    .line 66
    :pswitch_13
    new-array p1, p1, [LN0/v;

    .line 67
    .line 68
    return-object p1

    .line 69
    :pswitch_14
    new-array p1, p1, [LN0/g;

    .line 70
    .line 71
    return-object p1

    .line 72
    :pswitch_15
    new-array p1, p1, [LN0/e;

    .line 73
    .line 74
    return-object p1

    .line 75
    :pswitch_16
    new-array p1, p1, [LN0/h;

    .line 76
    .line 77
    return-object p1

    .line 78
    :pswitch_17
    new-array p1, p1, [Lcom/google/android/gms/common/api/Status;

    .line 79
    .line 80
    return-object p1

    .line 81
    :pswitch_18
    new-array p1, p1, [Lcom/google/android/gms/common/api/Scope;

    .line 82
    .line 83
    return-object p1

    .line 84
    :pswitch_19
    new-array p1, p1, [LK0/c;

    .line 85
    .line 86
    return-object p1

    .line 87
    :pswitch_1a
    new-array p1, p1, [LK0/a;

    .line 88
    .line 89
    return-object p1

    .line 90
    :pswitch_1b
    new-array p1, p1, [LG/g;

    .line 91
    .line 92
    return-object p1

    .line 93
    :pswitch_1c
    new-array p1, p1, [Le1/u;

    .line 94
    .line 95
    return-object p1

    .line 96
    nop

    .line 97
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
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
