.class public abstract Lk2/j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lk2/a;


# static fields
.field public static final r:[I

.field public static final s:Landroid/view/animation/DecelerateInterpolator;


# instance fields
.field public final a:LB2/a;

.field public final b:LV1/y;

.field public final c:Li2/c;

.field public final d:Z

.field public final e:J

.field public final f:Ljava/util/concurrent/ExecutorService;

.field public final g:Landroid/graphics/drawable/ShapeDrawable;

.field public h:Ljava/util/Set;

.field public final i:Landroid/util/SparseArray;

.field public final j:Lk2/e;

.field public final k:I

.field public l:Ljava/util/Set;

.field public final m:Lk2/e;

.field public n:F

.field public final o:Lk2/i;

.field public p:Ls3/g;

.field public q:Ls3/j;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x7

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    sput-object v0, Lk2/j;->r:[I

    .line 8
    .line 9
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lk2/j;->s:Landroid/view/animation/DecelerateInterpolator;

    .line 15
    .line 16
    return-void

    .line 17
    :array_0
    .array-data 4
        0xa
        0x14
        0x32
        0x64
        0xc8
        0x1f4
        0x3e8
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;LB2/a;Li2/c;)V
    .locals 11

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lk2/j;->f:Ljava/util/concurrent/ExecutorService;

    .line 9
    .line 10
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lk2/j;->h:Ljava/util/Set;

    .line 20
    .line 21
    new-instance v0, Landroid/util/SparseArray;

    .line 22
    .line 23
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lk2/j;->i:Landroid/util/SparseArray;

    .line 27
    .line 28
    new-instance v0, Lk2/e;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    invoke-direct {v0, v1}, Lk2/e;-><init>(I)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lk2/j;->j:Lk2/e;

    .line 35
    .line 36
    const/4 v0, 0x4

    .line 37
    iput v0, p0, Lk2/j;->k:I

    .line 38
    .line 39
    new-instance v0, Lk2/e;

    .line 40
    .line 41
    invoke-direct {v0, v1}, Lk2/e;-><init>(I)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lk2/j;->m:Lk2/e;

    .line 45
    .line 46
    new-instance v0, Lk2/i;

    .line 47
    .line 48
    invoke-direct {v0, p0, v1}, Lk2/i;-><init>(Lk2/a;I)V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Lk2/j;->o:Lk2/i;

    .line 52
    .line 53
    iput-object p2, p0, Lk2/j;->a:LB2/a;

    .line 54
    .line 55
    const/4 p2, 0x1

    .line 56
    iput-boolean p2, p0, Lk2/j;->d:Z

    .line 57
    .line 58
    const-wide/16 v2, 0x12c

    .line 59
    .line 60
    iput-wide v2, p0, Lk2/j;->e:J

    .line 61
    .line 62
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 71
    .line 72
    new-instance v2, LV1/y;

    .line 73
    .line 74
    invoke-direct {v2, p1}, LV1/y;-><init>(Landroid/content/Context;)V

    .line 75
    .line 76
    .line 77
    iput-object v2, p0, Lk2/j;->b:LV1/y;

    .line 78
    .line 79
    new-instance v3, Lq2/b;

    .line 80
    .line 81
    invoke-direct {v3, p1}, Lq2/b;-><init>(Landroid/content/Context;)V

    .line 82
    .line 83
    .line 84
    new-instance v4, Landroid/view/ViewGroup$LayoutParams;

    .line 85
    .line 86
    const/4 v5, -0x2

    .line 87
    invoke-direct {v4, v5, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v3, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 91
    .line 92
    .line 93
    const v4, 0x7f080044

    .line 94
    .line 95
    .line 96
    invoke-virtual {v3, v4}, Landroid/view/View;->setId(I)V

    .line 97
    .line 98
    .line 99
    const/high16 v5, 0x41400000    # 12.0f

    .line 100
    .line 101
    mul-float/2addr v5, v0

    .line 102
    float-to-int v5, v5

    .line 103
    invoke-virtual {v3, v5, v5, v5, v5}, Landroid/view/View;->setPadding(IIII)V

    .line 104
    .line 105
    .line 106
    iget-object v5, v2, LV1/y;->h:Ljava/lang/Object;

    .line 107
    .line 108
    check-cast v5, Lcom/google/maps/android/ui/RotationLayout;

    .line 109
    .line 110
    invoke-virtual {v5}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v5, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v5, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    instance-of v4, v3, Landroid/widget/TextView;

    .line 121
    .line 122
    if-eqz v4, :cond_0

    .line 123
    .line 124
    check-cast v3, Landroid/widget/TextView;

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_0
    const/4 v3, 0x0

    .line 128
    :goto_0
    iput-object v3, v2, LV1/y;->i:Ljava/lang/Object;

    .line 129
    .line 130
    if-eqz v3, :cond_1

    .line 131
    .line 132
    const v4, 0x7f0f0188

    .line 133
    .line 134
    .line 135
    invoke-virtual {v3, p1, v4}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 136
    .line 137
    .line 138
    :cond_1
    new-instance p1, Landroid/graphics/drawable/ShapeDrawable;

    .line 139
    .line 140
    new-instance v3, Landroid/graphics/drawable/shapes/OvalShape;

    .line 141
    .line 142
    invoke-direct {v3}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    .line 143
    .line 144
    .line 145
    invoke-direct {p1, v3}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 146
    .line 147
    .line 148
    iput-object p1, p0, Lk2/j;->g:Landroid/graphics/drawable/ShapeDrawable;

    .line 149
    .line 150
    new-instance p1, Landroid/graphics/drawable/ShapeDrawable;

    .line 151
    .line 152
    new-instance v3, Landroid/graphics/drawable/shapes/OvalShape;

    .line 153
    .line 154
    invoke-direct {v3}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    .line 155
    .line 156
    .line 157
    invoke-direct {p1, v3}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p1}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 161
    .line 162
    .line 163
    move-result-object v3

    .line 164
    const v4, -0x7f000001

    .line 165
    .line 166
    .line 167
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 168
    .line 169
    .line 170
    new-instance v5, Landroid/graphics/drawable/LayerDrawable;

    .line 171
    .line 172
    iget-object v3, p0, Lk2/j;->g:Landroid/graphics/drawable/ShapeDrawable;

    .line 173
    .line 174
    const/4 v4, 0x2

    .line 175
    new-array v4, v4, [Landroid/graphics/drawable/Drawable;

    .line 176
    .line 177
    aput-object p1, v4, v1

    .line 178
    .line 179
    aput-object v3, v4, p2

    .line 180
    .line 181
    invoke-direct {v5, v4}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 182
    .line 183
    .line 184
    const/high16 p1, 0x40400000    # 3.0f

    .line 185
    .line 186
    mul-float/2addr v0, p1

    .line 187
    float-to-int v7, v0

    .line 188
    const/4 v6, 0x1

    .line 189
    move v8, v7

    .line 190
    move v9, v7

    .line 191
    move v10, v7

    .line 192
    invoke-virtual/range {v5 .. v10}, Landroid/graphics/drawable/LayerDrawable;->setLayerInset(IIIII)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {v2, v5}, LV1/y;->w(Landroid/graphics/drawable/Drawable;)V

    .line 196
    .line 197
    .line 198
    iput-object p3, p0, Lk2/j;->c:Li2/c;

    .line 199
    .line 200
    return-void
.end method

.method public static f(Lk2/j;Ljava/util/ArrayList;Lo2/a;)Lo2/a;
    .locals 11

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_2

    .line 3
    .line 4
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    iget-object p0, p0, Lk2/j;->c:Li2/c;

    .line 12
    .line 13
    iget-object p0, p0, Li2/c;->h:Lj2/d;

    .line 14
    .line 15
    iget-object p0, p0, Lj2/d;->b:Lj2/c;

    .line 16
    .line 17
    iget-object p0, p0, Lj2/c;->b:Lj2/b;

    .line 18
    .line 19
    iget p0, p0, Lj2/b;->b:I

    .line 20
    .line 21
    mul-int/2addr p0, p0

    .line 22
    int-to-double v1, p0

    .line 23
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    const/4 v3, 0x0

    .line 28
    :cond_1
    :goto_0
    if-ge v3, p0, :cond_2

    .line 29
    .line 30
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    add-int/lit8 v3, v3, 0x1

    .line 35
    .line 36
    check-cast v4, Lo2/a;

    .line 37
    .line 38
    iget-wide v5, v4, Lo2/a;->a:D

    .line 39
    .line 40
    iget-wide v7, p2, Lo2/a;->a:D

    .line 41
    .line 42
    sub-double/2addr v5, v7

    .line 43
    mul-double/2addr v5, v5

    .line 44
    iget-wide v7, v4, Lo2/a;->b:D

    .line 45
    .line 46
    iget-wide v9, p2, Lo2/a;->b:D

    .line 47
    .line 48
    sub-double/2addr v7, v9

    .line 49
    mul-double/2addr v7, v7

    .line 50
    add-double/2addr v7, v5

    .line 51
    cmpg-double v5, v7, v1

    .line 52
    .line 53
    if-gez v5, :cond_1

    .line 54
    .line 55
    move-object v0, v4

    .line 56
    move-wide v1, v7

    .line 57
    goto :goto_0

    .line 58
    :cond_2
    :goto_1
    return-object v0
.end method


# virtual methods
.method public final a(Ljava/util/Set;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lk2/j;->o:Lk2/i;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    new-instance v1, Lk2/h;

    .line 5
    .line 6
    iget-object v2, v0, Lk2/i;->d:Lk2/a;

    .line 7
    .line 8
    check-cast v2, Lk2/j;

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    invoke-direct {v1, v2, p1, v3}, Lk2/h;-><init>(Lk2/a;Ljava/util/Set;I)V

    .line 12
    .line 13
    .line 14
    iput-object v1, v0, Lk2/i;->c:Ljava/lang/Runnable;

    .line 15
    .line 16
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception p1

    .line 23
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw p1
.end method

.method public final b()V
    .locals 4

    .line 1
    iget-object v0, p0, Lk2/j;->c:Li2/c;

    .line 2
    .line 3
    iget-object v1, v0, Li2/c;->f:Ll2/a;

    .line 4
    .line 5
    new-instance v2, Lio/flutter/plugin/editing/j;

    .line 6
    .line 7
    const/16 v3, 0xc

    .line 8
    .line 9
    invoke-direct {v2, v3, p0}, Lio/flutter/plugin/editing/j;-><init>(ILjava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iput-object v2, v1, Ll2/a;->e:Lc1/d;

    .line 13
    .line 14
    new-instance v2, Lj3/b;

    .line 15
    .line 16
    const/16 v3, 0x8

    .line 17
    .line 18
    invoke-direct {v2, v3, p0}, Lj3/b;-><init>(ILjava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    iput-object v2, v1, Ll2/a;->c:Lc1/b;

    .line 22
    .line 23
    new-instance v2, Lk2/b;

    .line 24
    .line 25
    invoke-direct {v2, p0}, Lk2/b;-><init>(Lk2/j;)V

    .line 26
    .line 27
    .line 28
    iput-object v2, v1, Ll2/a;->d:Lc1/c;

    .line 29
    .line 30
    iget-object v0, v0, Li2/c;->g:Ll2/a;

    .line 31
    .line 32
    new-instance v1, Lk2/b;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Lk2/b;-><init>(Lk2/j;)V

    .line 35
    .line 36
    .line 37
    iput-object v1, v0, Ll2/a;->e:Lc1/d;

    .line 38
    .line 39
    new-instance v1, Lk2/b;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Lk2/b;-><init>(Lk2/j;)V

    .line 42
    .line 43
    .line 44
    iput-object v1, v0, Ll2/a;->c:Lc1/b;

    .line 45
    .line 46
    new-instance v1, Lk2/b;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Lk2/b;-><init>(Lk2/j;)V

    .line 49
    .line 50
    .line 51
    iput-object v1, v0, Ll2/a;->d:Lc1/c;

    .line 52
    .line 53
    return-void
.end method

.method public final c(Ls3/g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lk2/j;->p:Ls3/g;

    .line 2
    .line 3
    return-void
.end method

.method public final d()V
    .locals 3

    .line 1
    iget-object v0, p0, Lk2/j;->c:Li2/c;

    .line 2
    .line 3
    iget-object v1, v0, Li2/c;->f:Ll2/a;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iput-object v2, v1, Ll2/a;->e:Lc1/d;

    .line 7
    .line 8
    iput-object v2, v1, Ll2/a;->c:Lc1/b;

    .line 9
    .line 10
    iput-object v2, v1, Ll2/a;->d:Lc1/c;

    .line 11
    .line 12
    iget-object v0, v0, Li2/c;->g:Ll2/a;

    .line 13
    .line 14
    iput-object v2, v0, Ll2/a;->e:Lc1/d;

    .line 15
    .line 16
    iput-object v2, v0, Ll2/a;->c:Lc1/b;

    .line 17
    .line 18
    iput-object v2, v0, Ll2/a;->d:Lc1/c;

    .line 19
    .line 20
    return-void
.end method

.method public final e(Ls3/j;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lk2/j;->q:Ls3/j;

    .line 2
    .line 3
    return-void
.end method

.method public final g(Li2/a;)Le1/c;
    .locals 7

    .line 1
    invoke-interface {p1}, Li2/a;->c()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    sget-object v0, Lk2/j;->r:[I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    aget v2, v0, v1

    .line 9
    .line 10
    if-gt p1, v2, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    move v2, v1

    .line 14
    :goto_0
    const/4 v3, 0x6

    .line 15
    if-ge v2, v3, :cond_2

    .line 16
    .line 17
    add-int/lit8 v3, v2, 0x1

    .line 18
    .line 19
    aget v4, v0, v3

    .line 20
    .line 21
    if-ge p1, v4, :cond_1

    .line 22
    .line 23
    aget p1, v0, v2

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    move v2, v3

    .line 27
    goto :goto_0

    .line 28
    :cond_2
    aget p1, v0, v3

    .line 29
    .line 30
    :goto_1
    iget-object v2, p0, Lk2/j;->i:Landroid/util/SparseArray;

    .line 31
    .line 32
    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    check-cast v3, Le1/c;

    .line 37
    .line 38
    if-nez v3, :cond_5

    .line 39
    .line 40
    iget-object v3, p0, Lk2/j;->g:Landroid/graphics/drawable/ShapeDrawable;

    .line 41
    .line 42
    invoke-virtual {v3}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    int-to-float v4, p1

    .line 47
    const/high16 v5, 0x43960000    # 300.0f

    .line 48
    .line 49
    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    sub-float/2addr v5, v4

    .line 54
    mul-float/2addr v5, v5

    .line 55
    const v4, 0x47afc800    # 90000.0f

    .line 56
    .line 57
    .line 58
    div-float/2addr v5, v4

    .line 59
    const/high16 v4, 0x435c0000    # 220.0f

    .line 60
    .line 61
    mul-float/2addr v5, v4

    .line 62
    const/4 v4, 0x3

    .line 63
    new-array v4, v4, [F

    .line 64
    .line 65
    aput v5, v4, v1

    .line 66
    .line 67
    const/high16 v5, 0x3f800000    # 1.0f

    .line 68
    .line 69
    const/4 v6, 0x1

    .line 70
    aput v5, v4, v6

    .line 71
    .line 72
    const v5, 0x3f19999a    # 0.6f

    .line 73
    .line 74
    .line 75
    const/4 v6, 0x2

    .line 76
    aput v5, v4, v6

    .line 77
    .line 78
    invoke-static {v4}, Landroid/graphics/Color;->HSVToColor([F)I

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 83
    .line 84
    .line 85
    iget-object v3, p0, Lk2/j;->b:LV1/y;

    .line 86
    .line 87
    iget-object v4, v3, LV1/y;->f:Ljava/lang/Object;

    .line 88
    .line 89
    check-cast v4, Landroid/content/Context;

    .line 90
    .line 91
    iget-object v5, v3, LV1/y;->i:Ljava/lang/Object;

    .line 92
    .line 93
    check-cast v5, Landroid/widget/TextView;

    .line 94
    .line 95
    if-eqz v5, :cond_3

    .line 96
    .line 97
    const v6, 0x7f0f0188

    .line 98
    .line 99
    .line 100
    invoke-virtual {v5, v4, v6}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 101
    .line 102
    .line 103
    :cond_3
    aget v0, v0, v1

    .line 104
    .line 105
    if-ge p1, v0, :cond_4

    .line 106
    .line 107
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    goto :goto_2

    .line 112
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string v1, "+"

    .line 121
    .line 122
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    :goto_2
    invoke-virtual {v3, v0}, LV1/y;->p(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->r(Landroid/graphics/Bitmap;)Le1/c;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {v2, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 138
    .line 139
    .line 140
    return-object v0

    .line 141
    :cond_5
    return-object v3
.end method
