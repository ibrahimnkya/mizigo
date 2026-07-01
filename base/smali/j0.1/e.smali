.class public abstract Lj0/e;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Lh0/k;Landroidx/window/extensions/layout/FoldingFeature;)Lh0/c;
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroidx/window/extensions/layout/FoldingFeature;->getType()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eq v0, v2, :cond_1

    .line 8
    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    goto :goto_2

    .line 12
    :cond_0
    sget-object v0, Lh0/b;->l:Lh0/b;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    sget-object v0, Lh0/b;->k:Lh0/b;

    .line 16
    .line 17
    :goto_0
    invoke-virtual {p1}, Landroidx/window/extensions/layout/FoldingFeature;->getState()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-eq v3, v2, :cond_3

    .line 22
    .line 23
    if-eq v3, v1, :cond_2

    .line 24
    .line 25
    goto :goto_2

    .line 26
    :cond_2
    sget-object v1, Lh0/b;->j:Lh0/b;

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_3
    sget-object v1, Lh0/b;->i:Lh0/b;

    .line 30
    .line 31
    :goto_1
    invoke-virtual {p1}, Landroidx/window/extensions/layout/FoldingFeature;->getBounds()Landroid/graphics/Rect;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    const-string v3, "oemFeature.bounds"

    .line 36
    .line 37
    invoke-static {v2, v3}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget v4, v2, Landroid/graphics/Rect;->left:I

    .line 41
    .line 42
    iget v5, v2, Landroid/graphics/Rect;->top:I

    .line 43
    .line 44
    iget v6, v2, Landroid/graphics/Rect;->right:I

    .line 45
    .line 46
    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    .line 47
    .line 48
    if-gt v4, v6, :cond_9

    .line 49
    .line 50
    if-gt v5, v2, :cond_8

    .line 51
    .line 52
    iget-object p0, p0, Lh0/k;->a:Le0/b;

    .line 53
    .line 54
    invoke-virtual {p0}, Le0/b;->a()Landroid/graphics/Rect;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    sub-int/2addr v2, v5

    .line 59
    if-nez v2, :cond_4

    .line 60
    .line 61
    sub-int v5, v6, v4

    .line 62
    .line 63
    if-nez v5, :cond_4

    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_4
    sub-int/2addr v6, v4

    .line 67
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    if-eq v6, v4, :cond_5

    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    if-eq v2, v4, :cond_5

    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_5
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    if-ge v6, v4, :cond_6

    .line 85
    .line 86
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    if-ge v2, v4, :cond_6

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_6
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 94
    .line 95
    .line 96
    move-result v4

    .line 97
    if-ne v6, v4, :cond_7

    .line 98
    .line 99
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    if-ne v2, p0, :cond_7

    .line 104
    .line 105
    :goto_2
    const/4 p0, 0x0

    .line 106
    return-object p0

    .line 107
    :cond_7
    new-instance p0, Lh0/c;

    .line 108
    .line 109
    new-instance v2, Le0/b;

    .line 110
    .line 111
    invoke-virtual {p1}, Landroidx/window/extensions/layout/FoldingFeature;->getBounds()Landroid/graphics/Rect;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-static {p1, v3}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    invoke-direct {v2, p1}, Le0/b;-><init>(Landroid/graphics/Rect;)V

    .line 119
    .line 120
    .line 121
    invoke-direct {p0, v2, v0, v1}, Lh0/c;-><init>(Le0/b;Lh0/b;Lh0/b;)V

    .line 122
    .line 123
    .line 124
    return-object p0

    .line 125
    :cond_8
    const-string p0, "top must be less than or equal to bottom, top: "

    .line 126
    .line 127
    const-string p1, ", bottom: "

    .line 128
    .line 129
    invoke-static {p0, v5, p1, v2}, LE1/j;->k(Ljava/lang/String;ILjava/lang/String;I)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 134
    .line 135
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    throw p1

    .line 143
    :cond_9
    const-string p0, "Left must be less than or equal to right, left: "

    .line 144
    .line 145
    const-string p1, ", right: "

    .line 146
    .line 147
    invoke-static {p0, v4, p1, v6}, LE1/j;->k(Ljava/lang/String;ILjava/lang/String;I)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 152
    .line 153
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    throw p1
.end method

.method public static b(Landroid/content/Context;Landroidx/window/extensions/layout/WindowLayoutInfo;)Lh0/j;
    .locals 7

    .line 1
    const-string v0, "info"

    .line 2
    .line 3
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 7
    .line 8
    const/16 v1, 0x1d

    .line 9
    .line 10
    const/16 v2, 0x1e

    .line 11
    .line 12
    if-lt v0, v2, :cond_b

    .line 13
    .line 14
    sget v3, Lh0/m;->b:I

    .line 15
    .line 16
    if-lt v0, v2, :cond_0

    .line 17
    .line 18
    const-class v0, Landroid/view/WindowManager;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Landroid/view/WindowManager;

    .line 25
    .line 26
    invoke-static {p0}, Lio/flutter/view/a;->g(Landroid/view/WindowManager;)Landroid/view/WindowMetrics;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v0}, Lio/flutter/view/a;->b(Landroid/view/WindowMetrics;)Landroid/view/WindowInsets;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-static {v1, v0}, LD/W;->c(Landroid/view/View;Landroid/view/WindowInsets;)LD/W;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Lh0/k;

    .line 40
    .line 41
    invoke-static {p0}, Lio/flutter/view/a;->g(Landroid/view/WindowManager;)Landroid/view/WindowMetrics;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p0}, Lio/flutter/view/a;->a(Landroid/view/WindowMetrics;)Landroid/graphics/Rect;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string v2, "wm.currentWindowMetrics.bounds"

    .line 50
    .line 51
    invoke-static {p0, v2}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    new-instance v2, Le0/b;

    .line 55
    .line 56
    invoke-direct {v2, p0}, Le0/b;-><init>(Landroid/graphics/Rect;)V

    .line 57
    .line 58
    .line 59
    invoke-direct {v1, v2, v0}, Lh0/k;-><init>(Le0/b;LD/W;)V

    .line 60
    .line 61
    .line 62
    goto/16 :goto_3

    .line 63
    .line 64
    :cond_0
    move-object v0, p0

    .line 65
    :goto_0
    instance-of v3, v0, Landroid/content/ContextWrapper;

    .line 66
    .line 67
    const-string v4, " is not a UiContext"

    .line 68
    .line 69
    if-eqz v3, :cond_a

    .line 70
    .line 71
    instance-of v3, v0, Landroid/app/Activity;

    .line 72
    .line 73
    if-eqz v3, :cond_1

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_1
    instance-of v5, v0, Landroid/inputmethodservice/InputMethodService;

    .line 77
    .line 78
    if-eqz v5, :cond_2

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_2
    move-object v5, v0

    .line 82
    check-cast v5, Landroid/content/ContextWrapper;

    .line 83
    .line 84
    invoke-virtual {v5}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    if-nez v6, :cond_9

    .line 89
    .line 90
    :goto_1
    if-eqz v3, :cond_3

    .line 91
    .line 92
    check-cast p0, Landroid/app/Activity;

    .line 93
    .line 94
    invoke-static {p0}, Lh0/m;->a(Landroid/app/Activity;)Lh0/k;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    goto :goto_3

    .line 99
    :cond_3
    instance-of v0, v0, Landroid/inputmethodservice/InputMethodService;

    .line 100
    .line 101
    if-eqz v0, :cond_8

    .line 102
    .line 103
    const-string v0, "window"

    .line 104
    .line 105
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    const-string v0, "null cannot be cast to non-null type android.view.WindowManager"

    .line 110
    .line 111
    invoke-static {p0, v0}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    check-cast p0, Landroid/view/WindowManager;

    .line 115
    .line 116
    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    const-string v0, "wm.defaultDisplay"

    .line 121
    .line 122
    invoke-static {p0, v0}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    new-instance v0, Landroid/graphics/Point;

    .line 126
    .line 127
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0, v0}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    .line 131
    .line 132
    .line 133
    new-instance p0, Landroid/graphics/Rect;

    .line 134
    .line 135
    iget v3, v0, Landroid/graphics/Point;->x:I

    .line 136
    .line 137
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 138
    .line 139
    const/4 v4, 0x0

    .line 140
    invoke-direct {p0, v4, v4, v3, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 141
    .line 142
    .line 143
    new-instance v0, Lh0/k;

    .line 144
    .line 145
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 146
    .line 147
    const/16 v4, 0x22

    .line 148
    .line 149
    if-lt v3, v4, :cond_4

    .line 150
    .line 151
    new-instance v1, LD/H;

    .line 152
    .line 153
    invoke-direct {v1}, LD/H;-><init>()V

    .line 154
    .line 155
    .line 156
    goto :goto_2

    .line 157
    :cond_4
    const/16 v4, 0x1f

    .line 158
    .line 159
    if-lt v3, v4, :cond_5

    .line 160
    .line 161
    new-instance v1, LD/G;

    .line 162
    .line 163
    invoke-direct {v1}, LD/G;-><init>()V

    .line 164
    .line 165
    .line 166
    goto :goto_2

    .line 167
    :cond_5
    if-lt v3, v2, :cond_6

    .line 168
    .line 169
    new-instance v1, LD/F;

    .line 170
    .line 171
    invoke-direct {v1}, LD/F;-><init>()V

    .line 172
    .line 173
    .line 174
    goto :goto_2

    .line 175
    :cond_6
    if-lt v3, v1, :cond_7

    .line 176
    .line 177
    new-instance v1, LD/E;

    .line 178
    .line 179
    invoke-direct {v1}, LD/E;-><init>()V

    .line 180
    .line 181
    .line 182
    goto :goto_2

    .line 183
    :cond_7
    new-instance v1, LD/C;

    .line 184
    .line 185
    invoke-direct {v1}, LD/C;-><init>()V

    .line 186
    .line 187
    .line 188
    :goto_2
    invoke-virtual {v1}, LD/I;->b()LD/W;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    const-string v2, "Builder().build()"

    .line 193
    .line 194
    invoke-static {v1, v2}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    new-instance v2, Le0/b;

    .line 198
    .line 199
    invoke-direct {v2, p0}, Le0/b;-><init>(Landroid/graphics/Rect;)V

    .line 200
    .line 201
    .line 202
    invoke-direct {v0, v2, v1}, Lh0/k;-><init>(Le0/b;LD/W;)V

    .line 203
    .line 204
    .line 205
    move-object v1, v0

    .line 206
    :goto_3
    invoke-static {v1, p1}, Lj0/e;->c(Lh0/k;Landroidx/window/extensions/layout/WindowLayoutInfo;)Lh0/j;

    .line 207
    .line 208
    .line 209
    move-result-object p0

    .line 210
    return-object p0

    .line 211
    :cond_8
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 212
    .line 213
    new-instance v0, Ljava/lang/StringBuilder;

    .line 214
    .line 215
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 216
    .line 217
    .line 218
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    throw p1

    .line 232
    :cond_9
    invoke-virtual {v5}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    const-string v3, "iterator.baseContext"

    .line 237
    .line 238
    invoke-static {v0, v3}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    goto/16 :goto_0

    .line 242
    .line 243
    :cond_a
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 244
    .line 245
    new-instance v0, Ljava/lang/StringBuilder;

    .line 246
    .line 247
    const-string v1, "Context "

    .line 248
    .line 249
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 250
    .line 251
    .line 252
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object p0

    .line 262
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    throw p1

    .line 266
    :cond_b
    if-lt v0, v1, :cond_c

    .line 267
    .line 268
    instance-of v0, p0, Landroid/app/Activity;

    .line 269
    .line 270
    if-eqz v0, :cond_c

    .line 271
    .line 272
    sget v0, Lh0/m;->b:I

    .line 273
    .line 274
    check-cast p0, Landroid/app/Activity;

    .line 275
    .line 276
    invoke-static {p0}, Lh0/m;->a(Landroid/app/Activity;)Lh0/k;

    .line 277
    .line 278
    .line 279
    move-result-object p0

    .line 280
    invoke-static {p0, p1}, Lj0/e;->c(Lh0/k;Landroidx/window/extensions/layout/WindowLayoutInfo;)Lh0/j;

    .line 281
    .line 282
    .line 283
    move-result-object p0

    .line 284
    return-object p0

    .line 285
    :cond_c
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 286
    .line 287
    const-string p1, "Display Features are only supported after Q. Display features for non-Activity contexts are not expected to be reported on devices running Q."

    .line 288
    .line 289
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    throw p0
.end method

.method public static c(Lh0/k;Landroidx/window/extensions/layout/WindowLayoutInfo;)Lh0/j;
    .locals 3

    .line 1
    const-string v0, "info"

    .line 2
    .line 3
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroidx/window/extensions/layout/WindowLayoutInfo;->getDisplayFeatures()Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const-string v0, "info.displayFeatures"

    .line 11
    .line 12
    invoke-static {p1, v0}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Landroidx/window/extensions/layout/DisplayFeature;

    .line 35
    .line 36
    instance-of v2, v1, Landroidx/window/extensions/layout/FoldingFeature;

    .line 37
    .line 38
    if-eqz v2, :cond_1

    .line 39
    .line 40
    const-string v2, "feature"

    .line 41
    .line 42
    invoke-static {v1, v2}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    check-cast v1, Landroidx/window/extensions/layout/FoldingFeature;

    .line 46
    .line 47
    invoke-static {p0, v1}, Lj0/e;->a(Lh0/k;Landroidx/window/extensions/layout/FoldingFeature;)Lh0/c;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    goto :goto_1

    .line 52
    :cond_1
    const/4 v1, 0x0

    .line 53
    :goto_1
    if-eqz v1, :cond_0

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    new-instance p0, Lh0/j;

    .line 60
    .line 61
    invoke-direct {p0, v0}, Lh0/j;-><init>(Ljava/util/List;)V

    .line 62
    .line 63
    .line 64
    return-object p0
.end method
