.class public abstract LX/t;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:LB2/a;

.field public b:Landroidx/recyclerview/widget/RecyclerView;

.field public final c:LA/c;

.field public final d:LA/c;

.field public e:Z

.field public f:I

.field public g:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, LA0/c;

    .line 5
    .line 6
    const/16 v1, 0x15

    .line 7
    .line 8
    invoke-direct {v0, v1, p0}, LA0/c;-><init>(ILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    new-instance v1, LE/i;

    .line 12
    .line 13
    const/16 v2, 0x13

    .line 14
    .line 15
    invoke-direct {v1, v2, p0}, LE/i;-><init>(ILjava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    new-instance v2, LA/c;

    .line 19
    .line 20
    invoke-direct {v2, v0}, LA/c;-><init>(LX/L;)V

    .line 21
    .line 22
    .line 23
    iput-object v2, p0, LX/t;->c:LA/c;

    .line 24
    .line 25
    new-instance v0, LA/c;

    .line 26
    .line 27
    invoke-direct {v0, v1}, LA/c;-><init>(LX/L;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, LX/t;->d:LA/c;

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, LX/t;->e:Z

    .line 34
    .line 35
    return-void
.end method

.method public static e(III)I
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p0}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/high16 v1, -0x80000000

    .line 10
    .line 11
    if-eq v0, v1, :cond_1

    .line 12
    .line 13
    const/high16 v1, 0x40000000    # 2.0f

    .line 14
    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    :cond_0
    return p0

    .line 22
    :cond_1
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0
.end method

.method public static v(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, LX/u;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    throw p0
.end method

.method public static w(Landroid/content/Context;Landroid/util/AttributeSet;II)LX/l;
    .locals 2

    .line 1
    new-instance v0, LX/l;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, LX/l;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sget-object v1, LW/a;->a:[I

    .line 8
    .line 9
    invoke-virtual {p0, p1, v1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 p1, 0x0

    .line 14
    const/4 p2, 0x1

    .line 15
    invoke-virtual {p0, p1, p2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    iput p3, v0, LX/l;->b:I

    .line 20
    .line 21
    const/16 p3, 0x9

    .line 22
    .line 23
    invoke-virtual {p0, p3, p2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    iput p2, v0, LX/l;->c:I

    .line 28
    .line 29
    const/16 p2, 0x8

    .line 30
    .line 31
    invoke-virtual {p0, p2, p1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    iput-boolean p2, v0, LX/l;->d:Z

    .line 36
    .line 37
    const/16 p2, 0xa

    .line 38
    .line 39
    invoke-virtual {p0, p2, p1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    iput-boolean p1, v0, LX/l;->e:Z

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 46
    .line 47
    .line 48
    return-object v0
.end method


# virtual methods
.method public A(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 3

    .line 1
    iget-object v0, p0, LX/t;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->e:LX/z;

    .line 4
    .line 5
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->b0:LX/C;

    .line 6
    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    const/4 v1, 0x1

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->canScrollVertically(I)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iget-object v0, p0, LX/t;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 20
    .line 21
    const/4 v2, -0x1

    .line 22
    invoke-virtual {v0, v2}, Landroid/view/View;->canScrollVertically(I)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    iget-object v0, p0, LX/t;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Landroid/view/View;->canScrollHorizontally(I)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_2

    .line 35
    .line 36
    iget-object v0, p0, LX/t;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/view/View;->canScrollHorizontally(I)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const/4 v1, 0x0

    .line 46
    :cond_2
    :goto_0
    invoke-virtual {p1, v1}, Landroid/view/accessibility/AccessibilityRecord;->setScrollable(Z)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, LX/t;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    .line 53
    .line 54
    :cond_3
    :goto_1
    return-void
.end method

.method public abstract B(Landroid/os/Parcelable;)V
.end method

.method public abstract C()Landroid/os/Parcelable;
.end method

.method public D(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public final E()V
    .locals 1

    .line 1
    invoke-virtual {p0}, LX/t;->p()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    if-gez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0, v0}, LX/t;->o(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Landroidx/recyclerview/widget/RecyclerView;->j(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    throw v0
.end method

.method public final F(LX/z;)V
    .locals 2

    .line 1
    iget-object p1, p1, LX/z;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int/lit8 v1, v0, -0x1

    .line 10
    .line 11
    if-gez v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 14
    .line 15
    .line 16
    if-lez v0, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, LX/t;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void

    .line 24
    :cond_1
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    new-instance p1, Ljava/lang/ClassCastException;

    .line 32
    .line 33
    invoke-direct {p1}, Ljava/lang/ClassCastException;-><init>()V

    .line 34
    .line 35
    .line 36
    throw p1
.end method

.method public final G(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Landroid/graphics/Rect;ZZ)Z
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    invoke-virtual {v0}, LX/t;->s()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    invoke-virtual {v0}, LX/t;->u()I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    iget v5, v0, LX/t;->f:I

    .line 16
    .line 17
    invoke-virtual {v0}, LX/t;->t()I

    .line 18
    .line 19
    .line 20
    move-result v6

    .line 21
    sub-int/2addr v5, v6

    .line 22
    iget v6, v0, LX/t;->g:I

    .line 23
    .line 24
    invoke-virtual {v0}, LX/t;->r()I

    .line 25
    .line 26
    .line 27
    move-result v7

    .line 28
    sub-int/2addr v6, v7

    .line 29
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getLeft()I

    .line 30
    .line 31
    .line 32
    move-result v7

    .line 33
    iget v8, v2, Landroid/graphics/Rect;->left:I

    .line 34
    .line 35
    add-int/2addr v7, v8

    .line 36
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getScrollX()I

    .line 37
    .line 38
    .line 39
    move-result v8

    .line 40
    sub-int/2addr v7, v8

    .line 41
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getTop()I

    .line 42
    .line 43
    .line 44
    move-result v8

    .line 45
    iget v9, v2, Landroid/graphics/Rect;->top:I

    .line 46
    .line 47
    add-int/2addr v8, v9

    .line 48
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getScrollY()I

    .line 49
    .line 50
    .line 51
    move-result v9

    .line 52
    sub-int/2addr v8, v9

    .line 53
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 54
    .line 55
    .line 56
    move-result v9

    .line 57
    add-int/2addr v9, v7

    .line 58
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    add-int/2addr v2, v8

    .line 63
    sub-int/2addr v7, v3

    .line 64
    const/4 v3, 0x0

    .line 65
    invoke-static {v3, v7}, Ljava/lang/Math;->min(II)I

    .line 66
    .line 67
    .line 68
    move-result v10

    .line 69
    sub-int/2addr v8, v4

    .line 70
    invoke-static {v3, v8}, Ljava/lang/Math;->min(II)I

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    sub-int/2addr v9, v5

    .line 75
    invoke-static {v3, v9}, Ljava/lang/Math;->max(II)I

    .line 76
    .line 77
    .line 78
    move-result v5

    .line 79
    sub-int/2addr v2, v6

    .line 80
    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    iget-object v6, v0, LX/t;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 85
    .line 86
    sget-object v11, LD/z;->a:Ljava/lang/reflect/Field;

    .line 87
    .line 88
    invoke-virtual {v6}, Landroid/view/View;->getLayoutDirection()I

    .line 89
    .line 90
    .line 91
    move-result v6

    .line 92
    const/4 v11, 0x1

    .line 93
    if-ne v6, v11, :cond_1

    .line 94
    .line 95
    if-eqz v5, :cond_0

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_0
    invoke-static {v10, v9}, Ljava/lang/Math;->max(II)I

    .line 99
    .line 100
    .line 101
    move-result v5

    .line 102
    goto :goto_1

    .line 103
    :cond_1
    if-eqz v10, :cond_2

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_2
    invoke-static {v7, v5}, Ljava/lang/Math;->min(II)I

    .line 107
    .line 108
    .line 109
    move-result v10

    .line 110
    :goto_0
    move v5, v10

    .line 111
    :goto_1
    if-eqz v4, :cond_3

    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_3
    invoke-static {v8, v2}, Ljava/lang/Math;->min(II)I

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    :goto_2
    filled-new-array {v5, v4}, [I

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    aget v4, v2, v3

    .line 123
    .line 124
    aget v2, v2, v11

    .line 125
    .line 126
    if-eqz p5, :cond_5

    .line 127
    .line 128
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getFocusedChild()Landroid/view/View;

    .line 129
    .line 130
    .line 131
    move-result-object v5

    .line 132
    if-nez v5, :cond_4

    .line 133
    .line 134
    move/from16 p2, v3

    .line 135
    .line 136
    goto/16 :goto_3

    .line 137
    .line 138
    :cond_4
    invoke-virtual {v0}, LX/t;->s()I

    .line 139
    .line 140
    .line 141
    move-result v6

    .line 142
    invoke-virtual {v0}, LX/t;->u()I

    .line 143
    .line 144
    .line 145
    move-result v7

    .line 146
    iget v8, v0, LX/t;->f:I

    .line 147
    .line 148
    invoke-virtual {v0}, LX/t;->t()I

    .line 149
    .line 150
    .line 151
    move-result v9

    .line 152
    sub-int/2addr v8, v9

    .line 153
    iget v9, v0, LX/t;->g:I

    .line 154
    .line 155
    invoke-virtual {v0}, LX/t;->r()I

    .line 156
    .line 157
    .line 158
    move-result v10

    .line 159
    sub-int/2addr v9, v10

    .line 160
    iget-object v10, v0, LX/t;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 161
    .line 162
    iget-object v10, v10, Landroidx/recyclerview/widget/RecyclerView;->k:Landroid/graphics/Rect;

    .line 163
    .line 164
    sget-object v12, Landroidx/recyclerview/widget/RecyclerView;->l0:[I

    .line 165
    .line 166
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 167
    .line 168
    .line 169
    move-result-object v12

    .line 170
    check-cast v12, LX/u;

    .line 171
    .line 172
    iget-object v13, v12, LX/u;->a:Landroid/graphics/Rect;

    .line 173
    .line 174
    invoke-virtual {v5}, Landroid/view/View;->getLeft()I

    .line 175
    .line 176
    .line 177
    move-result v14

    .line 178
    iget v15, v13, Landroid/graphics/Rect;->left:I

    .line 179
    .line 180
    sub-int/2addr v14, v15

    .line 181
    iget v15, v12, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 182
    .line 183
    sub-int/2addr v14, v15

    .line 184
    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    .line 185
    .line 186
    .line 187
    move-result v15

    .line 188
    move/from16 p2, v3

    .line 189
    .line 190
    iget v3, v13, Landroid/graphics/Rect;->top:I

    .line 191
    .line 192
    sub-int/2addr v15, v3

    .line 193
    iget v3, v12, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 194
    .line 195
    sub-int/2addr v15, v3

    .line 196
    invoke-virtual {v5}, Landroid/view/View;->getRight()I

    .line 197
    .line 198
    .line 199
    move-result v3

    .line 200
    move/from16 p3, v11

    .line 201
    .line 202
    iget v11, v13, Landroid/graphics/Rect;->right:I

    .line 203
    .line 204
    add-int/2addr v3, v11

    .line 205
    iget v11, v12, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 206
    .line 207
    add-int/2addr v3, v11

    .line 208
    invoke-virtual {v5}, Landroid/view/View;->getBottom()I

    .line 209
    .line 210
    .line 211
    move-result v5

    .line 212
    iget v11, v13, Landroid/graphics/Rect;->bottom:I

    .line 213
    .line 214
    add-int/2addr v5, v11

    .line 215
    iget v11, v12, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 216
    .line 217
    add-int/2addr v5, v11

    .line 218
    invoke-virtual {v10, v14, v15, v3, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 219
    .line 220
    .line 221
    iget v3, v10, Landroid/graphics/Rect;->left:I

    .line 222
    .line 223
    sub-int/2addr v3, v4

    .line 224
    if-ge v3, v8, :cond_7

    .line 225
    .line 226
    iget v3, v10, Landroid/graphics/Rect;->right:I

    .line 227
    .line 228
    sub-int/2addr v3, v4

    .line 229
    if-le v3, v6, :cond_7

    .line 230
    .line 231
    iget v3, v10, Landroid/graphics/Rect;->top:I

    .line 232
    .line 233
    sub-int/2addr v3, v2

    .line 234
    if-ge v3, v9, :cond_7

    .line 235
    .line 236
    iget v3, v10, Landroid/graphics/Rect;->bottom:I

    .line 237
    .line 238
    sub-int/2addr v3, v2

    .line 239
    if-gt v3, v7, :cond_6

    .line 240
    .line 241
    goto :goto_3

    .line 242
    :cond_5
    move/from16 p2, v3

    .line 243
    .line 244
    move/from16 p3, v11

    .line 245
    .line 246
    :cond_6
    if-nez v4, :cond_8

    .line 247
    .line 248
    if-eqz v2, :cond_7

    .line 249
    .line 250
    goto :goto_4

    .line 251
    :cond_7
    :goto_3
    return p2

    .line 252
    :cond_8
    :goto_4
    if-eqz p4, :cond_9

    .line 253
    .line 254
    invoke-virtual {v1, v4, v2}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    .line 255
    .line 256
    .line 257
    return p3

    .line 258
    :cond_9
    invoke-virtual {v1, v4, v2}, Landroidx/recyclerview/widget/RecyclerView;->r(II)V

    .line 259
    .line 260
    .line 261
    return p3
.end method

.method public final H()V
    .locals 1

    .line 1
    iget-object v0, p0, LX/t;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final I(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, LX/t;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 5
    .line 6
    iput-object p1, p0, LX/t;->a:LB2/a;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput p1, p0, LX/t;->f:I

    .line 10
    .line 11
    iput p1, p0, LX/t;->g:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iput-object p1, p0, LX/t;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 15
    .line 16
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView;->h:LB2/a;

    .line 17
    .line 18
    iput-object v0, p0, LX/t;->a:LB2/a;

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iput v0, p0, LX/t;->f:I

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iput p1, p0, LX/t;->g:I

    .line 31
    .line 32
    :goto_0
    return-void
.end method

.method public abstract a(Ljava/lang/String;)V
.end method

.method public abstract b()Z
.end method

.method public abstract c()Z
.end method

.method public d(LX/u;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    return p1

    .line 5
    :cond_0
    const/4 p1, 0x0

    .line 6
    return p1
.end method

.method public abstract f(LX/C;)I
.end method

.method public abstract g(LX/C;)V
.end method

.method public abstract h(LX/C;)I
.end method

.method public abstract i(LX/C;)I
.end method

.method public abstract j(LX/C;)V
.end method

.method public abstract k(LX/C;)I
.end method

.method public abstract l()LX/u;
.end method

.method public m(Landroid/content/Context;Landroid/util/AttributeSet;)LX/u;
    .locals 1

    .line 1
    new-instance v0, LX/u;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, LX/u;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public n(Landroid/view/ViewGroup$LayoutParams;)LX/u;
    .locals 1

    .line 1
    instance-of v0, p1, LX/u;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, LX/u;

    .line 6
    .line 7
    check-cast p1, LX/u;

    .line 8
    .line 9
    invoke-direct {v0, p1}, LX/u;-><init>(LX/u;)V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    new-instance v0, LX/u;

    .line 18
    .line 19
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 20
    .line 21
    invoke-direct {v0, p1}, LX/u;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 22
    .line 23
    .line 24
    return-object v0

    .line 25
    :cond_1
    new-instance v0, LX/u;

    .line 26
    .line 27
    invoke-direct {v0, p1}, LX/u;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    .line 29
    .line 30
    return-object v0
.end method

.method public final o(I)Landroid/view/View;
    .locals 6

    .line 1
    iget-object v0, p0, LX/t;->a:LB2/a;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v1, v0, LB2/a;->g:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, LX/b;

    .line 8
    .line 9
    const/4 v2, -0x1

    .line 10
    if-gez p1, :cond_0

    .line 11
    .line 12
    goto :goto_2

    .line 13
    :cond_0
    iget-object v3, v0, LB2/a;->f:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v3, LE/i;

    .line 16
    .line 17
    iget-object v3, v3, LE/i;->f:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v3, Landroidx/recyclerview/widget/RecyclerView;

    .line 20
    .line 21
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    move v4, p1

    .line 26
    :goto_0
    if-ge v4, v3, :cond_2

    .line 27
    .line 28
    invoke-virtual {v1, v4}, LX/b;->a(I)I

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    sub-int v5, v4, v5

    .line 33
    .line 34
    sub-int v5, p1, v5

    .line 35
    .line 36
    if-nez v5, :cond_1

    .line 37
    .line 38
    move v2, v4

    .line 39
    :goto_1
    invoke-virtual {v1, v2}, LX/b;->b(I)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_2

    .line 44
    .line 45
    add-int/lit8 v2, v2, 0x1

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    add-int/2addr v4, v5

    .line 49
    goto :goto_0

    .line 50
    :cond_2
    :goto_2
    iget-object p1, v0, LB2/a;->f:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast p1, LE/i;

    .line 53
    .line 54
    iget-object p1, p1, LE/i;->f:Ljava/lang/Object;

    .line 55
    .line 56
    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    .line 57
    .line 58
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    return-object p1

    .line 63
    :cond_3
    const/4 p1, 0x0

    .line 64
    return-object p1
.end method

.method public final p()I
    .locals 2

    .line 1
    iget-object v0, p0, LX/t;->a:LB2/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, v0, LB2/a;->f:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, LE/i;

    .line 8
    .line 9
    iget-object v1, v1, LE/i;->f:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iget-object v0, v0, LB2/a;->h:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    sub-int/2addr v1, v0

    .line 26
    return v1

    .line 27
    :cond_0
    const/4 v0, 0x0

    .line 28
    return v0
.end method

.method public q(LX/z;LX/C;)I
    .locals 0

    .line 1
    iget-object p1, p0, LX/t;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 p1, 0x1

    .line 9
    return p1
.end method

.method public final r()I
    .locals 1

    .line 1
    iget-object v0, p0, LX/t;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    return v0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    return v0
.end method

.method public final s()I
    .locals 1

    .line 1
    iget-object v0, p0, LX/t;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    return v0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    return v0
.end method

.method public final t()I
    .locals 1

    .line 1
    iget-object v0, p0, LX/t;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    return v0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    return v0
.end method

.method public final u()I
    .locals 1

    .line 1
    iget-object v0, p0, LX/t;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    return v0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    return v0
.end method

.method public x(LX/z;LX/C;)I
    .locals 0

    .line 1
    iget-object p1, p0, LX/t;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 p1, 0x1

    .line 9
    return p1
.end method

.method public abstract y()Z
.end method

.method public abstract z(Landroidx/recyclerview/widget/RecyclerView;)V
.end method
