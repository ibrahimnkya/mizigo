.class public final Lt3/q;
.super Lk3/u;
.source "SourceFile"


# static fields
.field public static final d:Lt3/q;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lt3/q;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lt3/q;->d:Lt3/q;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final f(BLjava/nio/ByteBuffer;)Ljava/lang/Object;
    .locals 4

    .line 1
    const-string v0, "Nonnull field \"type\" is null."

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x1

    .line 5
    const/4 v3, 0x0

    .line 6
    packed-switch p1, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    invoke-super {p0, p1, p2}, Lk3/u;->f(BLjava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    return-object p1

    .line 14
    :pswitch_0
    invoke-virtual {p0, p2}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Ljava/util/ArrayList;

    .line 19
    .line 20
    new-instance p2, Lt3/j;

    .line 21
    .line 22
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Lt3/k;

    .line 30
    .line 31
    if-eqz v3, :cond_1

    .line 32
    .line 33
    iput-object v3, p2, Lt3/j;->a:Lt3/k;

    .line 34
    .line 35
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Lt3/i;

    .line 40
    .line 41
    iput-object v0, p2, Lt3/j;->b:Lt3/i;

    .line 42
    .line 43
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Ljava/util/List;

    .line 48
    .line 49
    if-eqz p1, :cond_0

    .line 50
    .line 51
    iput-object p1, p2, Lt3/j;->c:Ljava/util/List;

    .line 52
    .line 53
    return-object p2

    .line 54
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 55
    .line 56
    const-string p2, "Nonnull field \"paths\" is null."

    .line 57
    .line 58
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    throw p1

    .line 62
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 63
    .line 64
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    throw p1

    .line 68
    :pswitch_1
    invoke-virtual {p0, p2}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    check-cast p1, Ljava/util/ArrayList;

    .line 73
    .line 74
    new-instance p2, Lt3/i;

    .line 75
    .line 76
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    check-cast v0, Ljava/lang/String;

    .line 84
    .line 85
    if-eqz v0, :cond_2

    .line 86
    .line 87
    iput-object v0, p2, Lt3/i;->a:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    check-cast p1, Ljava/lang/String;

    .line 94
    .line 95
    iput-object p1, p2, Lt3/i;->b:Ljava/lang/String;

    .line 96
    .line 97
    return-object p2

    .line 98
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 99
    .line 100
    const-string p2, "Nonnull field \"code\" is null."

    .line 101
    .line 102
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    throw p1

    .line 106
    :pswitch_2
    invoke-virtual {p0, p2}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    check-cast p1, Ljava/util/ArrayList;

    .line 111
    .line 112
    new-instance p2, Lt3/s;

    .line 113
    .line 114
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    check-cast v1, Lt3/t;

    .line 122
    .line 123
    if-eqz v1, :cond_3

    .line 124
    .line 125
    iput-object v1, p2, Lt3/s;->a:Lt3/t;

    .line 126
    .line 127
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    check-cast p1, Lt3/r;

    .line 132
    .line 133
    iput-object p1, p2, Lt3/s;->b:Lt3/r;

    .line 134
    .line 135
    return-object p2

    .line 136
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 137
    .line 138
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    throw p1

    .line 142
    :pswitch_3
    invoke-virtual {p0, p2}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    check-cast p1, Ljava/util/ArrayList;

    .line 147
    .line 148
    new-instance p2, Lt3/u;

    .line 149
    .line 150
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    check-cast p1, Ljava/lang/Long;

    .line 158
    .line 159
    iput-object p1, p2, Lt3/u;->a:Ljava/lang/Long;

    .line 160
    .line 161
    return-object p2

    .line 162
    :pswitch_4
    invoke-virtual {p0, p2}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    check-cast p1, Ljava/util/ArrayList;

    .line 167
    .line 168
    new-instance p2, Lt3/p;

    .line 169
    .line 170
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 171
    .line 172
    .line 173
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    check-cast p1, Lt3/o;

    .line 178
    .line 179
    if-eqz p1, :cond_4

    .line 180
    .line 181
    iput-object p1, p2, Lt3/p;->a:Lt3/o;

    .line 182
    .line 183
    return-object p2

    .line 184
    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 185
    .line 186
    const-string p2, "Nonnull field \"imageSelectionOptions\" is null."

    .line 187
    .line 188
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    throw p1

    .line 192
    :pswitch_5
    invoke-virtual {p0, p2}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    check-cast p1, Ljava/util/ArrayList;

    .line 197
    .line 198
    new-instance p2, Lt3/o;

    .line 199
    .line 200
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 201
    .line 202
    .line 203
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    check-cast v0, Ljava/lang/Double;

    .line 208
    .line 209
    iput-object v0, p2, Lt3/o;->a:Ljava/lang/Double;

    .line 210
    .line 211
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    check-cast v0, Ljava/lang/Double;

    .line 216
    .line 217
    iput-object v0, p2, Lt3/o;->b:Ljava/lang/Double;

    .line 218
    .line 219
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    move-result-object p1

    .line 223
    check-cast p1, Ljava/lang/Long;

    .line 224
    .line 225
    if-eqz p1, :cond_5

    .line 226
    .line 227
    iput-object p1, p2, Lt3/o;->c:Ljava/lang/Long;

    .line 228
    .line 229
    return-object p2

    .line 230
    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 231
    .line 232
    const-string p2, "Nonnull field \"quality\" is null."

    .line 233
    .line 234
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    throw p1

    .line 238
    :pswitch_6
    invoke-virtual {p0, p2}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 239
    .line 240
    .line 241
    move-result-object p1

    .line 242
    check-cast p1, Ljava/util/ArrayList;

    .line 243
    .line 244
    new-instance p2, Lt3/m;

    .line 245
    .line 246
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 247
    .line 248
    .line 249
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    check-cast v0, Ljava/lang/Boolean;

    .line 254
    .line 255
    if-eqz v0, :cond_7

    .line 256
    .line 257
    iput-object v0, p2, Lt3/m;->a:Ljava/lang/Boolean;

    .line 258
    .line 259
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    check-cast v0, Ljava/lang/Boolean;

    .line 264
    .line 265
    if-eqz v0, :cond_6

    .line 266
    .line 267
    iput-object v0, p2, Lt3/m;->b:Ljava/lang/Boolean;

    .line 268
    .line 269
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 270
    .line 271
    .line 272
    move-result-object p1

    .line 273
    check-cast p1, Ljava/lang/Long;

    .line 274
    .line 275
    iput-object p1, p2, Lt3/m;->c:Ljava/lang/Long;

    .line 276
    .line 277
    return-object p2

    .line 278
    :cond_6
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 279
    .line 280
    const-string p2, "Nonnull field \"usePhotoPicker\" is null."

    .line 281
    .line 282
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    throw p1

    .line 286
    :cond_7
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 287
    .line 288
    const-string p2, "Nonnull field \"allowMultiple\" is null."

    .line 289
    .line 290
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 291
    .line 292
    .line 293
    throw p1

    .line 294
    :pswitch_7
    invoke-virtual {p0, p2}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 295
    .line 296
    .line 297
    move-result-object p1

    .line 298
    if-nez p1, :cond_8

    .line 299
    .line 300
    goto :goto_0

    .line 301
    :cond_8
    invoke-static {}, Lt3/k;->values()[Lt3/k;

    .line 302
    .line 303
    .line 304
    move-result-object p2

    .line 305
    check-cast p1, Ljava/lang/Long;

    .line 306
    .line 307
    invoke-virtual {p1}, Ljava/lang/Long;->intValue()I

    .line 308
    .line 309
    .line 310
    move-result p1

    .line 311
    aget-object p1, p2, p1

    .line 312
    .line 313
    return-object p1

    .line 314
    :pswitch_8
    invoke-virtual {p0, p2}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 315
    .line 316
    .line 317
    move-result-object p1

    .line 318
    if-nez p1, :cond_9

    .line 319
    .line 320
    goto :goto_0

    .line 321
    :cond_9
    invoke-static {}, Lt3/t;->values()[Lt3/t;

    .line 322
    .line 323
    .line 324
    move-result-object p2

    .line 325
    check-cast p1, Ljava/lang/Long;

    .line 326
    .line 327
    invoke-virtual {p1}, Ljava/lang/Long;->intValue()I

    .line 328
    .line 329
    .line 330
    move-result p1

    .line 331
    aget-object p1, p2, p1

    .line 332
    .line 333
    return-object p1

    .line 334
    :pswitch_9
    invoke-virtual {p0, p2}, Lk3/u;->e(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    .line 335
    .line 336
    .line 337
    move-result-object p1

    .line 338
    if-nez p1, :cond_a

    .line 339
    .line 340
    :goto_0
    const/4 p1, 0x0

    .line 341
    return-object p1

    .line 342
    :cond_a
    invoke-static {}, Lt3/r;->values()[Lt3/r;

    .line 343
    .line 344
    .line 345
    move-result-object p2

    .line 346
    check-cast p1, Ljava/lang/Long;

    .line 347
    .line 348
    invoke-virtual {p1}, Ljava/lang/Long;->intValue()I

    .line 349
    .line 350
    .line 351
    move-result p1

    .line 352
    aget-object p1, p2, p1

    .line 353
    .line 354
    return-object p1

    .line 355
    :pswitch_data_0
    .packed-switch -0x7f
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

.method public final k(Lk3/t;Ljava/lang/Object;)V
    .locals 3

    .line 1
    instance-of v0, p2, Lt3/r;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    const/16 v0, 0x81

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 9
    .line 10
    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    check-cast p2, Lt3/r;

    .line 15
    .line 16
    iget p2, p2, Lt3/r;->e:I

    .line 17
    .line 18
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    :goto_0
    invoke-virtual {p0, p1, v1}, Lt3/q;->k(Lk3/t;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    instance-of v0, p2, Lt3/t;

    .line 27
    .line 28
    if-eqz v0, :cond_3

    .line 29
    .line 30
    const/16 v0, 0x82

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 33
    .line 34
    .line 35
    if-nez p2, :cond_2

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_2
    check-cast p2, Lt3/t;

    .line 39
    .line 40
    iget p2, p2, Lt3/t;->e:I

    .line 41
    .line 42
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    :goto_1
    invoke-virtual {p0, p1, v1}, Lt3/q;->k(Lk3/t;Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_3
    instance-of v0, p2, Lt3/k;

    .line 51
    .line 52
    if-eqz v0, :cond_5

    .line 53
    .line 54
    const/16 v0, 0x83

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 57
    .line 58
    .line 59
    if-nez p2, :cond_4

    .line 60
    .line 61
    goto :goto_2

    .line 62
    :cond_4
    check-cast p2, Lt3/k;

    .line 63
    .line 64
    iget p2, p2, Lt3/k;->e:I

    .line 65
    .line 66
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    :goto_2
    invoke-virtual {p0, p1, v1}, Lt3/q;->k(Lk3/t;Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_5
    instance-of v0, p2, Lt3/m;

    .line 75
    .line 76
    const/4 v1, 0x3

    .line 77
    if-eqz v0, :cond_6

    .line 78
    .line 79
    const/16 v0, 0x84

    .line 80
    .line 81
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 82
    .line 83
    .line 84
    check-cast p2, Lt3/m;

    .line 85
    .line 86
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 87
    .line 88
    .line 89
    new-instance v0, Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 92
    .line 93
    .line 94
    iget-object v1, p2, Lt3/m;->a:Ljava/lang/Boolean;

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    iget-object v1, p2, Lt3/m;->b:Ljava/lang/Boolean;

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    iget-object p2, p2, Lt3/m;->c:Ljava/lang/Long;

    .line 105
    .line 106
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0, p1, v0}, Lt3/q;->k(Lk3/t;Ljava/lang/Object;)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_6
    instance-of v0, p2, Lt3/o;

    .line 114
    .line 115
    if-eqz v0, :cond_7

    .line 116
    .line 117
    const/16 v0, 0x85

    .line 118
    .line 119
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 120
    .line 121
    .line 122
    check-cast p2, Lt3/o;

    .line 123
    .line 124
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 125
    .line 126
    .line 127
    new-instance v0, Ljava/util/ArrayList;

    .line 128
    .line 129
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 130
    .line 131
    .line 132
    iget-object v1, p2, Lt3/o;->a:Ljava/lang/Double;

    .line 133
    .line 134
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    iget-object v1, p2, Lt3/o;->b:Ljava/lang/Double;

    .line 138
    .line 139
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    iget-object p2, p2, Lt3/o;->c:Ljava/lang/Long;

    .line 143
    .line 144
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    invoke-virtual {p0, p1, v0}, Lt3/q;->k(Lk3/t;Ljava/lang/Object;)V

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :cond_7
    instance-of v0, p2, Lt3/p;

    .line 152
    .line 153
    const/4 v2, 0x1

    .line 154
    if-eqz v0, :cond_8

    .line 155
    .line 156
    const/16 v0, 0x86

    .line 157
    .line 158
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 159
    .line 160
    .line 161
    check-cast p2, Lt3/p;

    .line 162
    .line 163
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 164
    .line 165
    .line 166
    new-instance v0, Ljava/util/ArrayList;

    .line 167
    .line 168
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 169
    .line 170
    .line 171
    iget-object p2, p2, Lt3/p;->a:Lt3/o;

    .line 172
    .line 173
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    invoke-virtual {p0, p1, v0}, Lt3/q;->k(Lk3/t;Ljava/lang/Object;)V

    .line 177
    .line 178
    .line 179
    return-void

    .line 180
    :cond_8
    instance-of v0, p2, Lt3/u;

    .line 181
    .line 182
    if-eqz v0, :cond_9

    .line 183
    .line 184
    const/16 v0, 0x87

    .line 185
    .line 186
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 187
    .line 188
    .line 189
    check-cast p2, Lt3/u;

    .line 190
    .line 191
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 192
    .line 193
    .line 194
    new-instance v0, Ljava/util/ArrayList;

    .line 195
    .line 196
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 197
    .line 198
    .line 199
    iget-object p2, p2, Lt3/u;->a:Ljava/lang/Long;

    .line 200
    .line 201
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    invoke-virtual {p0, p1, v0}, Lt3/q;->k(Lk3/t;Ljava/lang/Object;)V

    .line 205
    .line 206
    .line 207
    return-void

    .line 208
    :cond_9
    instance-of v0, p2, Lt3/s;

    .line 209
    .line 210
    const/4 v2, 0x2

    .line 211
    if-eqz v0, :cond_a

    .line 212
    .line 213
    const/16 v0, 0x88

    .line 214
    .line 215
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 216
    .line 217
    .line 218
    check-cast p2, Lt3/s;

    .line 219
    .line 220
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 221
    .line 222
    .line 223
    new-instance v0, Ljava/util/ArrayList;

    .line 224
    .line 225
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 226
    .line 227
    .line 228
    iget-object v1, p2, Lt3/s;->a:Lt3/t;

    .line 229
    .line 230
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 231
    .line 232
    .line 233
    iget-object p2, p2, Lt3/s;->b:Lt3/r;

    .line 234
    .line 235
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    invoke-virtual {p0, p1, v0}, Lt3/q;->k(Lk3/t;Ljava/lang/Object;)V

    .line 239
    .line 240
    .line 241
    return-void

    .line 242
    :cond_a
    instance-of v0, p2, Lt3/i;

    .line 243
    .line 244
    if-eqz v0, :cond_b

    .line 245
    .line 246
    const/16 v0, 0x89

    .line 247
    .line 248
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 249
    .line 250
    .line 251
    check-cast p2, Lt3/i;

    .line 252
    .line 253
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 254
    .line 255
    .line 256
    new-instance v0, Ljava/util/ArrayList;

    .line 257
    .line 258
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 259
    .line 260
    .line 261
    iget-object v1, p2, Lt3/i;->a:Ljava/lang/String;

    .line 262
    .line 263
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 264
    .line 265
    .line 266
    iget-object p2, p2, Lt3/i;->b:Ljava/lang/String;

    .line 267
    .line 268
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 269
    .line 270
    .line 271
    invoke-virtual {p0, p1, v0}, Lt3/q;->k(Lk3/t;Ljava/lang/Object;)V

    .line 272
    .line 273
    .line 274
    return-void

    .line 275
    :cond_b
    instance-of v0, p2, Lt3/j;

    .line 276
    .line 277
    if-eqz v0, :cond_c

    .line 278
    .line 279
    const/16 v0, 0x8a

    .line 280
    .line 281
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 282
    .line 283
    .line 284
    check-cast p2, Lt3/j;

    .line 285
    .line 286
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 287
    .line 288
    .line 289
    new-instance v0, Ljava/util/ArrayList;

    .line 290
    .line 291
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 292
    .line 293
    .line 294
    iget-object v1, p2, Lt3/j;->a:Lt3/k;

    .line 295
    .line 296
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 297
    .line 298
    .line 299
    iget-object v1, p2, Lt3/j;->b:Lt3/i;

    .line 300
    .line 301
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 302
    .line 303
    .line 304
    iget-object p2, p2, Lt3/j;->c:Ljava/util/List;

    .line 305
    .line 306
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 307
    .line 308
    .line 309
    invoke-virtual {p0, p1, v0}, Lt3/q;->k(Lk3/t;Ljava/lang/Object;)V

    .line 310
    .line 311
    .line 312
    return-void

    .line 313
    :cond_c
    invoke-super {p0, p1, p2}, Lk3/u;->k(Lk3/t;Ljava/lang/Object;)V

    .line 314
    .line 315
    .line 316
    return-void
.end method
