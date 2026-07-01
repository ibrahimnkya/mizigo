.class public final synthetic LQ2/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Ljava/lang/Object;

.field public final synthetic g:Ljava/io/Serializable;

.field public final synthetic h:Ljava/lang/Object;

.field public final synthetic i:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/io/Serializable;Ljava/io/Serializable;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    iput p5, p0, LQ2/f;->e:I

    iput-object p1, p0, LQ2/f;->f:Ljava/lang/Object;

    iput-object p2, p0, LQ2/f;->g:Ljava/io/Serializable;

    iput-object p3, p0, LQ2/f;->h:Ljava/lang/Object;

    iput-object p4, p0, LQ2/f;->i:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lp3/d;Lp3/f;Ljava/lang/String;Li1/i;)V
    .locals 1

    .line 2
    const/4 v0, 0x2

    iput v0, p0, LQ2/f;->e:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LQ2/f;->f:Ljava/lang/Object;

    iput-object p2, p0, LQ2/f;->h:Ljava/lang/Object;

    iput-object p3, p0, LQ2/f;->g:Ljava/io/Serializable;

    iput-object p4, p0, LQ2/f;->i:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 16

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget v0, v1, LQ2/f;->e:I

    .line 4
    .line 5
    iget-object v2, v1, LQ2/f;->i:Ljava/lang/Object;

    .line 6
    .line 7
    iget-object v3, v1, LQ2/f;->g:Ljava/io/Serializable;

    .line 8
    .line 9
    iget-object v4, v1, LQ2/f;->h:Ljava/lang/Object;

    .line 10
    .line 11
    iget-object v5, v1, LQ2/f;->f:Ljava/lang/Object;

    .line 12
    .line 13
    packed-switch v0, :pswitch_data_0

    .line 14
    .line 15
    .line 16
    check-cast v5, Lp3/d;

    .line 17
    .line 18
    check-cast v4, Lp3/f;

    .line 19
    .line 20
    check-cast v3, Ljava/lang/String;

    .line 21
    .line 22
    check-cast v2, Li1/i;

    .line 23
    .line 24
    sget-object v0, Lp3/d;->g:Ljava/util/HashMap;

    .line 25
    .line 26
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    :try_start_0
    iget-object v8, v4, Lp3/f;->a:Ljava/lang/String;

    .line 30
    .line 31
    const-string v0, "ApiKey must be set."

    .line 32
    .line 33
    invoke-static {v8, v0}, LN0/n;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v7, v4, Lp3/f;->b:Ljava/lang/String;

    .line 37
    .line 38
    const-string v0, "ApplicationId must be set."

    .line 39
    .line 40
    invoke-static {v7, v0}, LN0/n;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object v9, v4, Lp3/f;->f:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v11, v4, Lp3/f;->c:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v13, v4, Lp3/f;->d:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v12, v4, Lp3/f;->g:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v10, v4, Lp3/f;->i:Ljava/lang/String;

    .line 52
    .line 53
    new-instance v6, LA1/i;

    .line 54
    .line 55
    invoke-direct/range {v6 .. v13}, LA1/i;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 56
    .line 57
    .line 58
    :try_start_1
    invoke-static {}, Landroid/os/Looper;->prepare()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 59
    .line 60
    .line 61
    :catch_0
    :try_start_2
    iget-object v0, v4, Lp3/f;->e:Ljava/lang/String;

    .line 62
    .line 63
    if-eqz v0, :cond_0

    .line 64
    .line 65
    sget-object v4, Lp3/d;->g:Ljava/util/HashMap;

    .line 66
    .line 67
    invoke-virtual {v4, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :catch_1
    move-exception v0

    .line 72
    goto :goto_1

    .line 73
    :cond_0
    :goto_0
    iget-object v0, v5, Lp3/d;->e:Landroid/content/Context;

    .line 74
    .line 75
    invoke-static {v6, v0, v3}, LA1/g;->h(LA1/i;Landroid/content/Context;Ljava/lang/String;)LA1/g;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v3, Li1/i;

    .line 80
    .line 81
    invoke-direct {v3}, Li1/i;-><init>()V

    .line 82
    .line 83
    .line 84
    sget-object v4, Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 85
    .line 86
    new-instance v6, Lp3/c;

    .line 87
    .line 88
    invoke-direct {v6, v5, v0, v3}, Lp3/c;-><init>(Lp3/d;LA1/g;Li1/i;)V

    .line 89
    .line 90
    .line 91
    invoke-interface {v4, v6}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 92
    .line 93
    .line 94
    iget-object v0, v3, Li1/i;->a:Li1/p;

    .line 95
    .line 96
    invoke-static {v0}, LV0/g;->a(Li1/h;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    check-cast v0, Lp3/g;

    .line 101
    .line 102
    invoke-virtual {v2, v0}, Li1/i;->b(Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 103
    .line 104
    .line 105
    goto :goto_2

    .line 106
    :goto_1
    invoke-virtual {v2, v0}, Li1/i;->a(Ljava/lang/Exception;)V

    .line 107
    .line 108
    .line 109
    :goto_2
    return-void

    .line 110
    :pswitch_0
    check-cast v5, LW3/f;

    .line 111
    .line 112
    check-cast v3, [B

    .line 113
    .line 114
    check-cast v4, Ljava/util/ArrayList;

    .line 115
    .line 116
    check-cast v2, Ljava/lang/Double;

    .line 117
    .line 118
    :try_start_3
    iget-object v0, v5, LW3/f;->a:Landroid/content/Context;

    .line 119
    .line 120
    invoke-virtual {v0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    const-string v7, "printing"

    .line 125
    .line 126
    const/4 v8, 0x0

    .line 127
    invoke-static {v7, v8, v0}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    new-instance v7, Ljava/io/FileOutputStream;

    .line 132
    .line 133
    invoke-direct {v7, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v7, v3}, Ljava/io/FileOutputStream;->write([B)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V

    .line 140
    .line 141
    .line 142
    new-instance v3, Ljava/io/FileInputStream;

    .line 143
    .line 144
    invoke-direct {v3, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v3}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    .line 148
    .line 149
    .line 150
    move-result-object v7

    .line 151
    invoke-static {v7}, Landroid/os/ParcelFileDescriptor;->dup(Ljava/io/FileDescriptor;)Landroid/os/ParcelFileDescriptor;

    .line 152
    .line 153
    .line 154
    move-result-object v7

    .line 155
    new-instance v9, Landroid/graphics/pdf/PdfRenderer;

    .line 156
    .line 157
    invoke-direct {v9, v7}, Landroid/graphics/pdf/PdfRenderer;-><init>(Landroid/os/ParcelFileDescriptor;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    if-nez v0, :cond_1

    .line 165
    .line 166
    const-string v0, "PDF"

    .line 167
    .line 168
    const-string v7, "Unable to delete temporary file"

    .line 169
    .line 170
    invoke-static {v0, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    .line 172
    .line 173
    goto :goto_3

    .line 174
    :catch_2
    move-exception v0

    .line 175
    goto/16 :goto_7

    .line 176
    .line 177
    :cond_1
    :goto_3
    if-eqz v4, :cond_2

    .line 178
    .line 179
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    goto :goto_4

    .line 184
    :cond_2
    invoke-virtual {v9}, Landroid/graphics/pdf/PdfRenderer;->getPageCount()I

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    :goto_4
    const/4 v7, 0x0

    .line 189
    :goto_5
    if-ge v7, v0, :cond_4

    .line 190
    .line 191
    if-nez v4, :cond_3

    .line 192
    .line 193
    move v10, v7

    .line 194
    goto :goto_6

    .line 195
    :cond_3
    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object v10

    .line 199
    check-cast v10, Ljava/lang/Integer;

    .line 200
    .line 201
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    .line 202
    .line 203
    .line 204
    move-result v10

    .line 205
    :goto_6
    invoke-virtual {v9, v10}, Landroid/graphics/pdf/PdfRenderer;->openPage(I)Landroid/graphics/pdf/PdfRenderer$Page;

    .line 206
    .line 207
    .line 208
    move-result-object v10

    .line 209
    invoke-virtual {v10}, Landroid/graphics/pdf/PdfRenderer$Page;->getWidth()I

    .line 210
    .line 211
    .line 212
    move-result v11

    .line 213
    int-to-double v11, v11

    .line 214
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    .line 215
    .line 216
    .line 217
    move-result-wide v13

    .line 218
    mul-double/2addr v11, v13

    .line 219
    invoke-static {v11, v12}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 220
    .line 221
    .line 222
    move-result-object v11

    .line 223
    invoke-virtual {v11}, Ljava/lang/Double;->intValue()I

    .line 224
    .line 225
    .line 226
    move-result v11

    .line 227
    invoke-virtual {v10}, Landroid/graphics/pdf/PdfRenderer$Page;->getHeight()I

    .line 228
    .line 229
    .line 230
    move-result v12

    .line 231
    int-to-double v12, v12

    .line 232
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    .line 233
    .line 234
    .line 235
    move-result-wide v14

    .line 236
    mul-double/2addr v12, v14

    .line 237
    invoke-static {v12, v13}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 238
    .line 239
    .line 240
    move-result-object v12

    .line 241
    invoke-virtual {v12}, Ljava/lang/Double;->intValue()I

    .line 242
    .line 243
    .line 244
    move-result v12

    .line 245
    mul-int/lit8 v13, v11, 0x4

    .line 246
    .line 247
    new-instance v14, Landroid/graphics/Matrix;

    .line 248
    .line 249
    invoke-direct {v14}, Landroid/graphics/Matrix;-><init>()V

    .line 250
    .line 251
    .line 252
    invoke-virtual {v2}, Ljava/lang/Double;->floatValue()F

    .line 253
    .line 254
    .line 255
    move-result v15

    .line 256
    invoke-virtual {v2}, Ljava/lang/Double;->floatValue()F

    .line 257
    .line 258
    .line 259
    move-result v6

    .line 260
    invoke-virtual {v14, v15, v6}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 261
    .line 262
    .line 263
    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 264
    .line 265
    invoke-static {v11, v12, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 266
    .line 267
    .line 268
    move-result-object v6

    .line 269
    const/4 v15, 0x1

    .line 270
    invoke-virtual {v10, v6, v8, v14, v15}, Landroid/graphics/pdf/PdfRenderer$Page;->render(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Matrix;I)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {v10}, Landroid/graphics/pdf/PdfRenderer$Page;->close()V

    .line 274
    .line 275
    .line 276
    mul-int/2addr v13, v12

    .line 277
    invoke-static {v13}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 278
    .line 279
    .line 280
    move-result-object v10

    .line 281
    invoke-virtual {v6, v10}, Landroid/graphics/Bitmap;->copyPixelsToBuffer(Ljava/nio/Buffer;)V

    .line 282
    .line 283
    .line 284
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->recycle()V

    .line 285
    .line 286
    .line 287
    new-instance v6, Landroid/os/Handler;

    .line 288
    .line 289
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 290
    .line 291
    .line 292
    move-result-object v13

    .line 293
    invoke-direct {v6, v13}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 294
    .line 295
    .line 296
    new-instance v13, LW3/c;

    .line 297
    .line 298
    invoke-direct {v13, v5, v10, v11, v12}, LW3/c;-><init>(LW3/f;Ljava/nio/ByteBuffer;II)V

    .line 299
    .line 300
    .line 301
    invoke-virtual {v6, v13}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 302
    .line 303
    .line 304
    add-int/lit8 v7, v7, 0x1

    .line 305
    .line 306
    goto :goto_5

    .line 307
    :cond_4
    invoke-virtual {v9}, Landroid/graphics/pdf/PdfRenderer;->close()V

    .line 308
    .line 309
    .line 310
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 311
    .line 312
    .line 313
    goto :goto_8

    .line 314
    :goto_7
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 315
    .line 316
    .line 317
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object v8

    .line 321
    :goto_8
    new-instance v0, Landroid/os/Handler;

    .line 322
    .line 323
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 324
    .line 325
    .line 326
    move-result-object v2

    .line 327
    invoke-direct {v0, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 328
    .line 329
    .line 330
    new-instance v2, LW3/d;

    .line 331
    .line 332
    const/4 v3, 0x0

    .line 333
    invoke-direct {v2, v5, v8, v3}, LW3/d;-><init>(LW3/f;Ljava/lang/String;I)V

    .line 334
    .line 335
    .line 336
    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 337
    .line 338
    .line 339
    return-void

    .line 340
    :pswitch_1
    check-cast v5, LQ2/g;

    .line 341
    .line 342
    check-cast v3, Ljava/lang/String;

    .line 343
    .line 344
    check-cast v4, Ljava/lang/String;

    .line 345
    .line 346
    iget-object v0, v5, LQ2/g;->b:Ljava/lang/Object;

    .line 347
    .line 348
    check-cast v0, LQ2/g;

    .line 349
    .line 350
    invoke-virtual {v0, v3, v4, v2}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 351
    .line 352
    .line 353
    return-void

    .line 354
    nop

    .line 355
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
