.class public final LT2/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/journeyapps/barcodescanner/BarcodeView;


# direct methods
.method public synthetic constructor <init>(Lcom/journeyapps/barcodescanner/BarcodeView;I)V
    .locals 0

    .line 1
    iput p2, p0, LT2/c;->a:I

    iput-object p1, p0, LT2/c;->b:Lcom/journeyapps/barcodescanner/BarcodeView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)Z
    .locals 11

    .line 1
    iget v0, p0, LT2/c;->a:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    iget-object v3, p0, LT2/c;->b:Lcom/journeyapps/barcodescanner/BarcodeView;

    .line 6
    .line 7
    const/4 v4, 0x0

    .line 8
    packed-switch v0, :pswitch_data_0

    .line 9
    .line 10
    .line 11
    iget-object v0, v3, LT2/g;->D:LT2/f;

    .line 12
    .line 13
    iget v5, p1, Landroid/os/Message;->what:I

    .line 14
    .line 15
    const v6, 0x7f080101

    .line 16
    .line 17
    .line 18
    if-ne v5, v6, :cond_5

    .line 19
    .line 20
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p1, LT2/u;

    .line 23
    .line 24
    iput-object p1, v3, LT2/g;->r:LT2/u;

    .line 25
    .line 26
    iget-object v5, v3, LT2/g;->q:LT2/u;

    .line 27
    .line 28
    if-eqz v5, :cond_8

    .line 29
    .line 30
    if-eqz p1, :cond_4

    .line 31
    .line 32
    iget-object v6, v3, LT2/g;->o:LM2/b;

    .line 33
    .line 34
    if-eqz v6, :cond_4

    .line 35
    .line 36
    iget v7, p1, LT2/u;->e:I

    .line 37
    .line 38
    iget v8, p1, LT2/u;->f:I

    .line 39
    .line 40
    iget v9, v5, LT2/u;->e:I

    .line 41
    .line 42
    iget v5, v5, LT2/u;->f:I

    .line 43
    .line 44
    iget-object v10, v6, LM2/b;->c:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast v10, LU2/m;

    .line 47
    .line 48
    iget-object v6, v6, LM2/b;->b:Ljava/lang/Object;

    .line 49
    .line 50
    check-cast v6, LT2/u;

    .line 51
    .line 52
    invoke-virtual {v10, p1, v6}, LU2/m;->b(LT2/u;LT2/u;)Landroid/graphics/Rect;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 57
    .line 58
    .line 59
    move-result v6

    .line 60
    if-lez v6, :cond_3

    .line 61
    .line 62
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 63
    .line 64
    .line 65
    move-result v6

    .line 66
    if-gtz v6, :cond_0

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_0
    iput-object p1, v3, LT2/g;->s:Landroid/graphics/Rect;

    .line 70
    .line 71
    new-instance p1, Landroid/graphics/Rect;

    .line 72
    .line 73
    invoke-direct {p1, v4, v4, v9, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 74
    .line 75
    .line 76
    iget-object v4, v3, LT2/g;->s:Landroid/graphics/Rect;

    .line 77
    .line 78
    invoke-virtual {v3, p1, v4}, LT2/g;->b(Landroid/graphics/Rect;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iput-object p1, v3, LT2/g;->u:Landroid/graphics/Rect;

    .line 83
    .line 84
    new-instance p1, Landroid/graphics/Rect;

    .line 85
    .line 86
    iget-object v4, v3, LT2/g;->u:Landroid/graphics/Rect;

    .line 87
    .line 88
    invoke-direct {p1, v4}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 89
    .line 90
    .line 91
    iget-object v4, v3, LT2/g;->s:Landroid/graphics/Rect;

    .line 92
    .line 93
    iget v5, v4, Landroid/graphics/Rect;->left:I

    .line 94
    .line 95
    neg-int v5, v5

    .line 96
    iget v4, v4, Landroid/graphics/Rect;->top:I

    .line 97
    .line 98
    neg-int v4, v4

    .line 99
    invoke-virtual {p1, v5, v4}, Landroid/graphics/Rect;->offset(II)V

    .line 100
    .line 101
    .line 102
    new-instance v4, Landroid/graphics/Rect;

    .line 103
    .line 104
    iget v5, p1, Landroid/graphics/Rect;->left:I

    .line 105
    .line 106
    mul-int/2addr v5, v7

    .line 107
    iget-object v6, v3, LT2/g;->s:Landroid/graphics/Rect;

    .line 108
    .line 109
    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    .line 110
    .line 111
    .line 112
    move-result v6

    .line 113
    div-int/2addr v5, v6

    .line 114
    iget v6, p1, Landroid/graphics/Rect;->top:I

    .line 115
    .line 116
    mul-int/2addr v6, v8

    .line 117
    iget-object v9, v3, LT2/g;->s:Landroid/graphics/Rect;

    .line 118
    .line 119
    invoke-virtual {v9}, Landroid/graphics/Rect;->height()I

    .line 120
    .line 121
    .line 122
    move-result v9

    .line 123
    div-int/2addr v6, v9

    .line 124
    iget v9, p1, Landroid/graphics/Rect;->right:I

    .line 125
    .line 126
    mul-int/2addr v9, v7

    .line 127
    iget-object v7, v3, LT2/g;->s:Landroid/graphics/Rect;

    .line 128
    .line 129
    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    .line 130
    .line 131
    .line 132
    move-result v7

    .line 133
    div-int/2addr v9, v7

    .line 134
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 135
    .line 136
    mul-int/2addr p1, v8

    .line 137
    iget-object v7, v3, LT2/g;->s:Landroid/graphics/Rect;

    .line 138
    .line 139
    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    .line 140
    .line 141
    .line 142
    move-result v7

    .line 143
    div-int/2addr p1, v7

    .line 144
    invoke-direct {v4, v5, v6, v9, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 145
    .line 146
    .line 147
    iput-object v4, v3, LT2/g;->v:Landroid/graphics/Rect;

    .line 148
    .line 149
    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    if-lez p1, :cond_2

    .line 154
    .line 155
    iget-object p1, v3, LT2/g;->v:Landroid/graphics/Rect;

    .line 156
    .line 157
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 158
    .line 159
    .line 160
    move-result p1

    .line 161
    if-gtz p1, :cond_1

    .line 162
    .line 163
    goto :goto_0

    .line 164
    :cond_1
    invoke-virtual {v0}, LT2/f;->e()V

    .line 165
    .line 166
    .line 167
    goto :goto_1

    .line 168
    :cond_2
    :goto_0
    iput-object v2, v3, LT2/g;->v:Landroid/graphics/Rect;

    .line 169
    .line 170
    iput-object v2, v3, LT2/g;->u:Landroid/graphics/Rect;

    .line 171
    .line 172
    const-string p1, "g"

    .line 173
    .line 174
    const-string v0, "Preview frame is too small"

    .line 175
    .line 176
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    .line 178
    .line 179
    :cond_3
    :goto_1
    invoke-virtual {v3}, Landroid/view/View;->requestLayout()V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v3}, LT2/g;->g()V

    .line 183
    .line 184
    .line 185
    goto :goto_3

    .line 186
    :cond_4
    iput-object v2, v3, LT2/g;->v:Landroid/graphics/Rect;

    .line 187
    .line 188
    iput-object v2, v3, LT2/g;->u:Landroid/graphics/Rect;

    .line 189
    .line 190
    iput-object v2, v3, LT2/g;->s:Landroid/graphics/Rect;

    .line 191
    .line 192
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 193
    .line 194
    const-string v0, "containerSize or previewSize is not set yet"

    .line 195
    .line 196
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    throw p1

    .line 200
    :cond_5
    const v1, 0x7f0800fb

    .line 201
    .line 202
    .line 203
    if-ne v5, v1, :cond_7

    .line 204
    .line 205
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 206
    .line 207
    check-cast p1, Ljava/lang/Exception;

    .line 208
    .line 209
    iget-object v1, v3, LT2/g;->e:LU2/g;

    .line 210
    .line 211
    if-eqz v1, :cond_6

    .line 212
    .line 213
    invoke-virtual {v3}, Lcom/journeyapps/barcodescanner/BarcodeView;->i()V

    .line 214
    .line 215
    .line 216
    invoke-virtual {v0, p1}, LT2/f;->c(Ljava/lang/Exception;)V

    .line 217
    .line 218
    .line 219
    :cond_6
    :goto_2
    move v1, v4

    .line 220
    goto :goto_3

    .line 221
    :cond_7
    const p1, 0x7f0800fa

    .line 222
    .line 223
    .line 224
    if-ne v5, p1, :cond_6

    .line 225
    .line 226
    invoke-virtual {v0}, LT2/f;->a()V

    .line 227
    .line 228
    .line 229
    goto :goto_2

    .line 230
    :cond_8
    :goto_3
    return v1

    .line 231
    :pswitch_0
    iget v0, p1, Landroid/os/Message;->what:I

    .line 232
    .line 233
    const v5, 0x7f0800fe

    .line 234
    .line 235
    .line 236
    if-ne v0, v5, :cond_9

    .line 237
    .line 238
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 239
    .line 240
    check-cast p1, LT2/b;

    .line 241
    .line 242
    if-eqz p1, :cond_c

    .line 243
    .line 244
    iget-object v0, v3, Lcom/journeyapps/barcodescanner/BarcodeView;->G:LT2/a;

    .line 245
    .line 246
    if-eqz v0, :cond_c

    .line 247
    .line 248
    iget v4, v3, Lcom/journeyapps/barcodescanner/BarcodeView;->F:I

    .line 249
    .line 250
    if-eq v4, v1, :cond_c

    .line 251
    .line 252
    invoke-interface {v0, p1}, LT2/a;->d(LT2/b;)V

    .line 253
    .line 254
    .line 255
    iget p1, v3, Lcom/journeyapps/barcodescanner/BarcodeView;->F:I

    .line 256
    .line 257
    const/4 v0, 0x2

    .line 258
    if-ne p1, v0, :cond_c

    .line 259
    .line 260
    iput v1, v3, Lcom/journeyapps/barcodescanner/BarcodeView;->F:I

    .line 261
    .line 262
    iput-object v2, v3, Lcom/journeyapps/barcodescanner/BarcodeView;->G:LT2/a;

    .line 263
    .line 264
    invoke-virtual {v3}, Lcom/journeyapps/barcodescanner/BarcodeView;->k()V

    .line 265
    .line 266
    .line 267
    goto :goto_4

    .line 268
    :cond_9
    const v2, 0x7f0800fd

    .line 269
    .line 270
    .line 271
    if-ne v0, v2, :cond_a

    .line 272
    .line 273
    goto :goto_4

    .line 274
    :cond_a
    const v2, 0x7f0800ff

    .line 275
    .line 276
    .line 277
    if-ne v0, v2, :cond_b

    .line 278
    .line 279
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 280
    .line 281
    check-cast p1, Ljava/util/List;

    .line 282
    .line 283
    iget-object v0, v3, Lcom/journeyapps/barcodescanner/BarcodeView;->G:LT2/a;

    .line 284
    .line 285
    if-eqz v0, :cond_c

    .line 286
    .line 287
    iget v2, v3, Lcom/journeyapps/barcodescanner/BarcodeView;->F:I

    .line 288
    .line 289
    if-eq v2, v1, :cond_c

    .line 290
    .line 291
    invoke-interface {v0, p1}, LT2/a;->k(Ljava/util/List;)V

    .line 292
    .line 293
    .line 294
    goto :goto_4

    .line 295
    :cond_b
    move v1, v4

    .line 296
    :cond_c
    :goto_4
    return v1

    .line 297
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
