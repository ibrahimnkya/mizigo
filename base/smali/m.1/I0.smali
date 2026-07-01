.class public final Lm/I0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;
.implements Landroid/view/View$OnHoverListener;
.implements Landroid/view/View$OnAttachStateChangeListener;


# static fields
.field public static o:Lm/I0;

.field public static p:Lm/I0;


# instance fields
.field public final e:Landroid/view/View;

.field public final f:Ljava/lang/CharSequence;

.field public final g:I

.field public final h:Lm/H0;

.field public final i:Lm/H0;

.field public j:I

.field public k:I

.field public l:Lm/J0;

.field public m:Z

.field public n:Z


# direct methods
.method public constructor <init>(Landroid/view/View;Ljava/lang/CharSequence;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lm/H0;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, p0, v1}, Lm/H0;-><init>(Lm/I0;I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lm/I0;->h:Lm/H0;

    .line 11
    .line 12
    new-instance v0, Lm/H0;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-direct {v0, p0, v1}, Lm/H0;-><init>(Lm/I0;I)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lm/I0;->i:Lm/H0;

    .line 19
    .line 20
    iput-object p1, p0, Lm/I0;->e:Landroid/view/View;

    .line 21
    .line 22
    iput-object p2, p0, Lm/I0;->f:Ljava/lang/CharSequence;

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-static {p2}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    sget-object v0, LD/A;->a:Ljava/lang/reflect/Method;

    .line 33
    .line 34
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 35
    .line 36
    const/16 v2, 0x1c

    .line 37
    .line 38
    if-lt v0, v2, :cond_0

    .line 39
    .line 40
    invoke-static {p2}, LD/d;->k(Landroid/view/ViewConfiguration;)I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-virtual {p2}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    div-int/lit8 p2, p2, 0x2

    .line 50
    .line 51
    :goto_0
    iput p2, p0, Lm/I0;->g:I

    .line 52
    .line 53
    iput-boolean v1, p0, Lm/I0;->n:Z

    .line 54
    .line 55
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnHoverListener(Landroid/view/View$OnHoverListener;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public static b(Lm/I0;)V
    .locals 3

    .line 1
    sget-object v0, Lm/I0;->o:Lm/I0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, v0, Lm/I0;->e:Landroid/view/View;

    .line 6
    .line 7
    iget-object v0, v0, Lm/I0;->h:Lm/H0;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 10
    .line 11
    .line 12
    :cond_0
    sput-object p0, Lm/I0;->o:Lm/I0;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lm/I0;->e:Landroid/view/View;

    .line 17
    .line 18
    iget-object p0, p0, Lm/I0;->h:Lm/H0;

    .line 19
    .line 20
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    int-to-long v1, v1

    .line 25
    invoke-virtual {v0, p0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 5

    .line 1
    sget-object v0, Lm/I0;->p:Lm/I0;

    .line 2
    .line 3
    iget-object v1, p0, Lm/I0;->e:Landroid/view/View;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-ne v0, p0, :cond_2

    .line 7
    .line 8
    sput-object v2, Lm/I0;->p:Lm/I0;

    .line 9
    .line 10
    iget-object v0, p0, Lm/I0;->l:Lm/J0;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v3, v0, Lm/J0;->f:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v3, Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    if-eqz v4, :cond_0

    .line 23
    .line 24
    iget-object v0, v0, Lm/J0;->e:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v0, Landroid/content/Context;

    .line 27
    .line 28
    const-string v4, "window"

    .line 29
    .line 30
    invoke-virtual {v0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Landroid/view/WindowManager;

    .line 35
    .line 36
    invoke-interface {v0, v3}, Landroid/view/ViewManager;->removeView(Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    iput-object v2, p0, Lm/I0;->l:Lm/J0;

    .line 40
    .line 41
    const/4 v0, 0x1

    .line 42
    iput-boolean v0, p0, Lm/I0;->n:Z

    .line 43
    .line 44
    invoke-virtual {v1, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    const-string v0, "TooltipCompatHandler"

    .line 49
    .line 50
    const-string v3, "sActiveHandler.mPopup == null"

    .line 51
    .line 52
    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    :cond_2
    :goto_0
    sget-object v0, Lm/I0;->o:Lm/I0;

    .line 56
    .line 57
    if-ne v0, p0, :cond_3

    .line 58
    .line 59
    invoke-static {v2}, Lm/I0;->b(Lm/I0;)V

    .line 60
    .line 61
    .line 62
    :cond_3
    iget-object v0, p0, Lm/I0;->i:Lm/H0;

    .line 63
    .line 64
    invoke-virtual {v1, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final c(Z)V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lm/I0;->e:Landroid/view/View;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/view/View;->isAttachedToWindow()Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/4 v2, 0x0

    .line 13
    invoke-static {v2}, Lm/I0;->b(Lm/I0;)V

    .line 14
    .line 15
    .line 16
    sget-object v3, Lm/I0;->p:Lm/I0;

    .line 17
    .line 18
    if-eqz v3, :cond_1

    .line 19
    .line 20
    invoke-virtual {v3}, Lm/I0;->a()V

    .line 21
    .line 22
    .line 23
    :cond_1
    sput-object v0, Lm/I0;->p:Lm/I0;

    .line 24
    .line 25
    move/from16 v3, p1

    .line 26
    .line 27
    iput-boolean v3, v0, Lm/I0;->m:Z

    .line 28
    .line 29
    new-instance v3, Lm/J0;

    .line 30
    .line 31
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 36
    .line 37
    .line 38
    new-instance v5, Landroid/view/WindowManager$LayoutParams;

    .line 39
    .line 40
    invoke-direct {v5}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v5, v3, Lm/J0;->h:Ljava/lang/Object;

    .line 44
    .line 45
    new-instance v6, Landroid/graphics/Rect;

    .line 46
    .line 47
    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object v6, v3, Lm/J0;->i:Ljava/lang/Object;

    .line 51
    .line 52
    const/4 v6, 0x2

    .line 53
    new-array v7, v6, [I

    .line 54
    .line 55
    iput-object v7, v3, Lm/J0;->j:Ljava/lang/Object;

    .line 56
    .line 57
    new-array v7, v6, [I

    .line 58
    .line 59
    iput-object v7, v3, Lm/J0;->k:Ljava/lang/Object;

    .line 60
    .line 61
    iput-object v4, v3, Lm/J0;->e:Ljava/lang/Object;

    .line 62
    .line 63
    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 64
    .line 65
    .line 66
    move-result-object v7

    .line 67
    const v8, 0x7f0b001b

    .line 68
    .line 69
    .line 70
    invoke-virtual {v7, v8, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    iput-object v2, v3, Lm/J0;->f:Ljava/lang/Object;

    .line 75
    .line 76
    const v7, 0x7f080088

    .line 77
    .line 78
    .line 79
    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    check-cast v2, Landroid/widget/TextView;

    .line 84
    .line 85
    iput-object v2, v3, Lm/J0;->g:Ljava/lang/Object;

    .line 86
    .line 87
    const-class v2, Lm/J0;

    .line 88
    .line 89
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {v5, v2}, Landroid/view/WindowManager$LayoutParams;->setTitle(Ljava/lang/CharSequence;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    iput-object v2, v5, Landroid/view/WindowManager$LayoutParams;->packageName:Ljava/lang/String;

    .line 101
    .line 102
    const/16 v2, 0x3ea

    .line 103
    .line 104
    iput v2, v5, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 105
    .line 106
    const/4 v2, -0x2

    .line 107
    iput v2, v5, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 108
    .line 109
    iput v2, v5, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 110
    .line 111
    const/4 v2, -0x3

    .line 112
    iput v2, v5, Landroid/view/WindowManager$LayoutParams;->format:I

    .line 113
    .line 114
    const v2, 0x7f0f0004

    .line 115
    .line 116
    .line 117
    iput v2, v5, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    .line 118
    .line 119
    const/16 v2, 0x18

    .line 120
    .line 121
    iput v2, v5, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 122
    .line 123
    iget-object v2, v3, Lm/J0;->f:Ljava/lang/Object;

    .line 124
    .line 125
    check-cast v2, Landroid/view/View;

    .line 126
    .line 127
    iget-object v4, v3, Lm/J0;->e:Ljava/lang/Object;

    .line 128
    .line 129
    check-cast v4, Landroid/content/Context;

    .line 130
    .line 131
    iput-object v3, v0, Lm/I0;->l:Lm/J0;

    .line 132
    .line 133
    iget v5, v0, Lm/I0;->j:I

    .line 134
    .line 135
    iget v7, v0, Lm/I0;->k:I

    .line 136
    .line 137
    iget-boolean v8, v0, Lm/I0;->m:Z

    .line 138
    .line 139
    iget-object v9, v3, Lm/J0;->h:Ljava/lang/Object;

    .line 140
    .line 141
    check-cast v9, Landroid/view/WindowManager$LayoutParams;

    .line 142
    .line 143
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 144
    .line 145
    .line 146
    move-result-object v10

    .line 147
    const-string v11, "window"

    .line 148
    .line 149
    if-eqz v10, :cond_2

    .line 150
    .line 151
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 152
    .line 153
    .line 154
    move-result-object v10

    .line 155
    if-eqz v10, :cond_2

    .line 156
    .line 157
    invoke-virtual {v4, v11}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object v10

    .line 161
    check-cast v10, Landroid/view/WindowManager;

    .line 162
    .line 163
    invoke-interface {v10, v2}, Landroid/view/ViewManager;->removeView(Landroid/view/View;)V

    .line 164
    .line 165
    .line 166
    :cond_2
    iget-object v10, v3, Lm/J0;->g:Ljava/lang/Object;

    .line 167
    .line 168
    check-cast v10, Landroid/widget/TextView;

    .line 169
    .line 170
    iget-object v12, v0, Lm/I0;->f:Ljava/lang/CharSequence;

    .line 171
    .line 172
    invoke-virtual {v10, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 173
    .line 174
    .line 175
    iget-object v10, v3, Lm/J0;->k:Ljava/lang/Object;

    .line 176
    .line 177
    check-cast v10, [I

    .line 178
    .line 179
    iget-object v12, v3, Lm/J0;->j:Ljava/lang/Object;

    .line 180
    .line 181
    check-cast v12, [I

    .line 182
    .line 183
    iget-object v3, v3, Lm/J0;->i:Ljava/lang/Object;

    .line 184
    .line 185
    check-cast v3, Landroid/graphics/Rect;

    .line 186
    .line 187
    invoke-virtual {v1}, Landroid/view/View;->getApplicationWindowToken()Landroid/os/IBinder;

    .line 188
    .line 189
    .line 190
    move-result-object v13

    .line 191
    iput-object v13, v9, Landroid/view/WindowManager$LayoutParams;->token:Landroid/os/IBinder;

    .line 192
    .line 193
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 194
    .line 195
    .line 196
    move-result-object v13

    .line 197
    const v14, 0x7f060085

    .line 198
    .line 199
    .line 200
    invoke-virtual {v13, v14}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    .line 201
    .line 202
    .line 203
    move-result v13

    .line 204
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 205
    .line 206
    .line 207
    move-result v14

    .line 208
    if-lt v14, v13, :cond_3

    .line 209
    .line 210
    goto :goto_0

    .line 211
    :cond_3
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 212
    .line 213
    .line 214
    move-result v5

    .line 215
    div-int/2addr v5, v6

    .line 216
    :goto_0
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 217
    .line 218
    .line 219
    move-result v14

    .line 220
    if-lt v14, v13, :cond_4

    .line 221
    .line 222
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 223
    .line 224
    .line 225
    move-result-object v13

    .line 226
    const v14, 0x7f060084

    .line 227
    .line 228
    .line 229
    invoke-virtual {v13, v14}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    .line 230
    .line 231
    .line 232
    move-result v13

    .line 233
    add-int v14, v7, v13

    .line 234
    .line 235
    sub-int/2addr v7, v13

    .line 236
    goto :goto_1

    .line 237
    :cond_4
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 238
    .line 239
    .line 240
    move-result v14

    .line 241
    const/4 v7, 0x0

    .line 242
    :goto_1
    const/16 v13, 0x31

    .line 243
    .line 244
    iput v13, v9, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 245
    .line 246
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 247
    .line 248
    .line 249
    move-result-object v13

    .line 250
    if-eqz v8, :cond_5

    .line 251
    .line 252
    const v16, 0x7f060088

    .line 253
    .line 254
    .line 255
    :goto_2
    move/from16 v15, v16

    .line 256
    .line 257
    goto :goto_3

    .line 258
    :cond_5
    const v16, 0x7f060087

    .line 259
    .line 260
    .line 261
    goto :goto_2

    .line 262
    :goto_3
    invoke-virtual {v13, v15}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    .line 263
    .line 264
    .line 265
    move-result v13

    .line 266
    invoke-virtual {v1}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 267
    .line 268
    .line 269
    move-result-object v15

    .line 270
    invoke-virtual {v15}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 271
    .line 272
    .line 273
    move-result-object v6

    .line 274
    move/from16 v17, v5

    .line 275
    .line 276
    instance-of v5, v6, Landroid/view/WindowManager$LayoutParams;

    .line 277
    .line 278
    if-eqz v5, :cond_6

    .line 279
    .line 280
    check-cast v6, Landroid/view/WindowManager$LayoutParams;

    .line 281
    .line 282
    iget v5, v6, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 283
    .line 284
    const/4 v6, 0x2

    .line 285
    if-ne v5, v6, :cond_6

    .line 286
    .line 287
    goto :goto_5

    .line 288
    :cond_6
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 289
    .line 290
    .line 291
    move-result-object v5

    .line 292
    :goto_4
    instance-of v6, v5, Landroid/content/ContextWrapper;

    .line 293
    .line 294
    if-eqz v6, :cond_8

    .line 295
    .line 296
    instance-of v6, v5, Landroid/app/Activity;

    .line 297
    .line 298
    if-eqz v6, :cond_7

    .line 299
    .line 300
    check-cast v5, Landroid/app/Activity;

    .line 301
    .line 302
    invoke-virtual {v5}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 303
    .line 304
    .line 305
    move-result-object v5

    .line 306
    invoke-virtual {v5}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 307
    .line 308
    .line 309
    move-result-object v15

    .line 310
    goto :goto_5

    .line 311
    :cond_7
    check-cast v5, Landroid/content/ContextWrapper;

    .line 312
    .line 313
    invoke-virtual {v5}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    .line 314
    .line 315
    .line 316
    move-result-object v5

    .line 317
    goto :goto_4

    .line 318
    :cond_8
    :goto_5
    if-nez v15, :cond_9

    .line 319
    .line 320
    const-string v3, "TooltipPopup"

    .line 321
    .line 322
    const-string v6, "Cannot find app view"

    .line 323
    .line 324
    invoke-static {v3, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 325
    .line 326
    .line 327
    const/16 v18, 0x1

    .line 328
    .line 329
    goto/16 :goto_8

    .line 330
    .line 331
    :cond_9
    invoke-virtual {v15, v3}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 332
    .line 333
    .line 334
    iget v6, v3, Landroid/graphics/Rect;->left:I

    .line 335
    .line 336
    if-gez v6, :cond_b

    .line 337
    .line 338
    iget v6, v3, Landroid/graphics/Rect;->top:I

    .line 339
    .line 340
    if-gez v6, :cond_b

    .line 341
    .line 342
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 343
    .line 344
    .line 345
    move-result-object v6

    .line 346
    const/16 v18, 0x1

    .line 347
    .line 348
    const-string v5, "dimen"

    .line 349
    .line 350
    move/from16 v19, v7

    .line 351
    .line 352
    const-string v7, "android"

    .line 353
    .line 354
    move/from16 v20, v8

    .line 355
    .line 356
    const-string v8, "status_bar_height"

    .line 357
    .line 358
    invoke-virtual {v6, v8, v5, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 359
    .line 360
    .line 361
    move-result v5

    .line 362
    if-eqz v5, :cond_a

    .line 363
    .line 364
    invoke-virtual {v6, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 365
    .line 366
    .line 367
    move-result v5

    .line 368
    goto :goto_6

    .line 369
    :cond_a
    const/4 v5, 0x0

    .line 370
    :goto_6
    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 371
    .line 372
    .line 373
    move-result-object v6

    .line 374
    iget v7, v6, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 375
    .line 376
    iget v6, v6, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 377
    .line 378
    const/4 v8, 0x0

    .line 379
    invoke-virtual {v3, v8, v5, v7, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 380
    .line 381
    .line 382
    goto :goto_7

    .line 383
    :cond_b
    move/from16 v19, v7

    .line 384
    .line 385
    move/from16 v20, v8

    .line 386
    .line 387
    const/4 v8, 0x0

    .line 388
    const/16 v18, 0x1

    .line 389
    .line 390
    :goto_7
    invoke-virtual {v15, v10}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 391
    .line 392
    .line 393
    invoke-virtual {v1, v12}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 394
    .line 395
    .line 396
    aget v5, v12, v8

    .line 397
    .line 398
    aget v6, v10, v8

    .line 399
    .line 400
    sub-int/2addr v5, v6

    .line 401
    aput v5, v12, v8

    .line 402
    .line 403
    aget v6, v12, v18

    .line 404
    .line 405
    aget v7, v10, v18

    .line 406
    .line 407
    sub-int/2addr v6, v7

    .line 408
    aput v6, v12, v18

    .line 409
    .line 410
    add-int v5, v5, v17

    .line 411
    .line 412
    invoke-virtual {v15}, Landroid/view/View;->getWidth()I

    .line 413
    .line 414
    .line 415
    move-result v6

    .line 416
    const/16 v16, 0x2

    .line 417
    .line 418
    div-int/lit8 v6, v6, 0x2

    .line 419
    .line 420
    sub-int/2addr v5, v6

    .line 421
    iput v5, v9, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 422
    .line 423
    invoke-static {v8, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 424
    .line 425
    .line 426
    move-result v5

    .line 427
    invoke-virtual {v2, v5, v5}, Landroid/view/View;->measure(II)V

    .line 428
    .line 429
    .line 430
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 431
    .line 432
    .line 433
    move-result v5

    .line 434
    aget v6, v12, v18

    .line 435
    .line 436
    add-int v7, v6, v19

    .line 437
    .line 438
    sub-int/2addr v7, v13

    .line 439
    sub-int/2addr v7, v5

    .line 440
    add-int/2addr v6, v14

    .line 441
    add-int/2addr v6, v13

    .line 442
    if-eqz v20, :cond_d

    .line 443
    .line 444
    if-ltz v7, :cond_c

    .line 445
    .line 446
    iput v7, v9, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 447
    .line 448
    goto :goto_8

    .line 449
    :cond_c
    iput v6, v9, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 450
    .line 451
    goto :goto_8

    .line 452
    :cond_d
    add-int/2addr v5, v6

    .line 453
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    .line 454
    .line 455
    .line 456
    move-result v3

    .line 457
    if-gt v5, v3, :cond_e

    .line 458
    .line 459
    iput v6, v9, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 460
    .line 461
    goto :goto_8

    .line 462
    :cond_e
    iput v7, v9, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 463
    .line 464
    :goto_8
    invoke-virtual {v4, v11}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 465
    .line 466
    .line 467
    move-result-object v3

    .line 468
    check-cast v3, Landroid/view/WindowManager;

    .line 469
    .line 470
    invoke-interface {v3, v2, v9}, Landroid/view/ViewManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 471
    .line 472
    .line 473
    invoke-virtual {v1, v0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 474
    .line 475
    .line 476
    iget-boolean v2, v0, Lm/I0;->m:Z

    .line 477
    .line 478
    if-eqz v2, :cond_f

    .line 479
    .line 480
    const-wide/16 v2, 0x9c4

    .line 481
    .line 482
    goto :goto_a

    .line 483
    :cond_f
    sget-object v2, LD/z;->a:Ljava/lang/reflect/Field;

    .line 484
    .line 485
    invoke-virtual {v1}, Landroid/view/View;->getWindowSystemUiVisibility()I

    .line 486
    .line 487
    .line 488
    move-result v2

    .line 489
    and-int/lit8 v2, v2, 0x1

    .line 490
    .line 491
    move/from16 v3, v18

    .line 492
    .line 493
    if-ne v2, v3, :cond_10

    .line 494
    .line 495
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    .line 496
    .line 497
    .line 498
    move-result v2

    .line 499
    int-to-long v2, v2

    .line 500
    const-wide/16 v4, 0xbb8

    .line 501
    .line 502
    :goto_9
    sub-long v2, v4, v2

    .line 503
    .line 504
    goto :goto_a

    .line 505
    :cond_10
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    .line 506
    .line 507
    .line 508
    move-result v2

    .line 509
    int-to-long v2, v2

    .line 510
    const-wide/16 v4, 0x3a98

    .line 511
    .line 512
    goto :goto_9

    .line 513
    :goto_a
    iget-object v4, v0, Lm/I0;->i:Lm/H0;

    .line 514
    .line 515
    invoke-virtual {v1, v4}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 516
    .line 517
    .line 518
    invoke-virtual {v1, v4, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 519
    .line 520
    .line 521
    return-void
.end method

.method public final onHover(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    iget-object p1, p0, Lm/I0;->l:Lm/J0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-boolean p1, p0, Lm/I0;->m:Z

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object p1, p0, Lm/I0;->e:Landroid/view/View;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "accessibility"

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Landroid/view/accessibility/AccessibilityManager;

    .line 24
    .line 25
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityManager;->isTouchExplorationEnabled()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    const/4 v2, 0x7

    .line 43
    if-eq v1, v2, :cond_3

    .line 44
    .line 45
    const/16 p1, 0xa

    .line 46
    .line 47
    if-eq v1, p1, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    const/4 p1, 0x1

    .line 51
    iput-boolean p1, p0, Lm/I0;->n:Z

    .line 52
    .line 53
    invoke-virtual {p0}, Lm/I0;->a()V

    .line 54
    .line 55
    .line 56
    return v0

    .line 57
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->isEnabled()Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_5

    .line 62
    .line 63
    iget-object p1, p0, Lm/I0;->l:Lm/J0;

    .line 64
    .line 65
    if-nez p1, :cond_5

    .line 66
    .line 67
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    float-to-int p1, p1

    .line 72
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    float-to-int p2, p2

    .line 77
    iget-boolean v1, p0, Lm/I0;->n:Z

    .line 78
    .line 79
    if-nez v1, :cond_4

    .line 80
    .line 81
    iget v1, p0, Lm/I0;->j:I

    .line 82
    .line 83
    sub-int v1, p1, v1

    .line 84
    .line 85
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    iget v2, p0, Lm/I0;->g:I

    .line 90
    .line 91
    if-gt v1, v2, :cond_4

    .line 92
    .line 93
    iget v1, p0, Lm/I0;->k:I

    .line 94
    .line 95
    sub-int v1, p2, v1

    .line 96
    .line 97
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-le v1, v2, :cond_5

    .line 102
    .line 103
    :cond_4
    iput p1, p0, Lm/I0;->j:I

    .line 104
    .line 105
    iput p2, p0, Lm/I0;->k:I

    .line 106
    .line 107
    iput-boolean v0, p0, Lm/I0;->n:Z

    .line 108
    .line 109
    invoke-static {p0}, Lm/I0;->b(Lm/I0;)V

    .line 110
    .line 111
    .line 112
    :cond_5
    :goto_0
    return v0
.end method

.method public final onLongClick(Landroid/view/View;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    div-int/lit8 v0, v0, 0x2

    .line 6
    .line 7
    iput v0, p0, Lm/I0;->j:I

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    div-int/lit8 p1, p1, 0x2

    .line 14
    .line 15
    iput p1, p0, Lm/I0;->k:I

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    invoke-virtual {p0, p1}, Lm/I0;->c(Z)V

    .line 19
    .line 20
    .line 21
    return p1
.end method

.method public final onViewAttachedToWindow(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lm/I0;->a()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
