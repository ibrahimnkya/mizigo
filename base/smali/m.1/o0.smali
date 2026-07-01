.class public final Lm/o0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final f:Landroid/graphics/PorterDuff$Mode;

.field public static g:Lm/o0;

.field public static final h:Lm/n0;


# instance fields
.field public a:Ljava/util/WeakHashMap;

.field public final b:Ljava/util/WeakHashMap;

.field public c:Landroid/util/TypedValue;

.field public d:Z

.field public e:LD1/x;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 2
    .line 3
    sput-object v0, Lm/o0;->f:Landroid/graphics/PorterDuff$Mode;

    .line 4
    .line 5
    new-instance v0, Lm/n0;

    .line 6
    .line 7
    const/4 v1, 0x6

    .line 8
    invoke-direct {v0, v1}, Lp/i;-><init>(I)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lm/o0;->h:Lm/n0;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/WeakHashMap;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Ljava/util/WeakHashMap;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lm/o0;->b:Ljava/util/WeakHashMap;

    .line 11
    .line 12
    return-void
.end method

.method public static declared-synchronized b()Lm/o0;
    .locals 2

    .line 1
    const-class v0, Lm/o0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lm/o0;->g:Lm/o0;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lm/o0;

    .line 9
    .line 10
    invoke-direct {v1}, Lm/o0;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lm/o0;->g:Lm/o0;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    sget-object v1, Lm/o0;->g:Lm/o0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-object v1

    .line 22
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw v1
.end method

.method public static declared-synchronized e(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;
    .locals 4

    .line 1
    const-class v0, Lm/o0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lm/o0;->h:Lm/n0;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    const/16 v2, 0x1f

    .line 10
    .line 11
    add-int v3, v2, p0

    .line 12
    .line 13
    mul-int/2addr v3, v2

    .line 14
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    add-int/2addr v2, v3

    .line 19
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v1, v2}, Lp/i;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Landroid/graphics/PorterDuffColorFilter;

    .line 28
    .line 29
    if-nez v2, :cond_0

    .line 30
    .line 31
    new-instance v2, Landroid/graphics/PorterDuffColorFilter;

    .line 32
    .line 33
    invoke-direct {v2, p0, p1}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    add-int/2addr p0, v3

    .line 41
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v1, p0, v2}, Lp/i;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    check-cast p0, Landroid/graphics/PorterDuffColorFilter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catchall_0
    move-exception p0

    .line 53
    goto :goto_1

    .line 54
    :cond_0
    :goto_0
    monitor-exit v0

    .line 55
    return-object v2

    .line 56
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    throw p0
.end method


# virtual methods
.method public final a(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .locals 9

    .line 1
    iget-object v0, p0, Lm/o0;->c:Landroid/util/TypedValue;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/util/TypedValue;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lm/o0;->c:Landroid/util/TypedValue;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lm/o0;->c:Landroid/util/TypedValue;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const/4 v2, 0x1

    .line 19
    invoke-virtual {v1, p2, v0, v2}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    .line 20
    .line 21
    .line 22
    iget v1, v0, Landroid/util/TypedValue;->assetCookie:I

    .line 23
    .line 24
    int-to-long v1, v1

    .line 25
    const/16 v3, 0x20

    .line 26
    .line 27
    shl-long/2addr v1, v3

    .line 28
    iget v3, v0, Landroid/util/TypedValue;->data:I

    .line 29
    .line 30
    int-to-long v3, v3

    .line 31
    or-long/2addr v1, v3

    .line 32
    monitor-enter p0

    .line 33
    :try_start_0
    iget-object v3, p0, Lm/o0;->b:Ljava/util/WeakHashMap;

    .line 34
    .line 35
    invoke-virtual {v3, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    check-cast v3, Lp/g;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    .line 41
    const/4 v4, 0x0

    .line 42
    if-nez v3, :cond_1

    .line 43
    .line 44
    monitor-exit p0

    .line 45
    goto :goto_0

    .line 46
    :cond_1
    :try_start_1
    iget-object v5, v3, Lp/g;->f:[J

    .line 47
    .line 48
    iget v6, v3, Lp/g;->h:I

    .line 49
    .line 50
    invoke-static {v5, v6, v1, v2}, Lq/a;->b([JIJ)I

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    if-ltz v5, :cond_2

    .line 55
    .line 56
    iget-object v6, v3, Lp/g;->g:[Ljava/lang/Object;

    .line 57
    .line 58
    aget-object v5, v6, v5

    .line 59
    .line 60
    sget-object v6, Lp/h;->a:Ljava/lang/Object;

    .line 61
    .line 62
    if-ne v5, v6, :cond_3

    .line 63
    .line 64
    :cond_2
    const/4 v5, 0x0

    .line 65
    :cond_3
    check-cast v5, Ljava/lang/ref/WeakReference;

    .line 66
    .line 67
    if-eqz v5, :cond_5

    .line 68
    .line 69
    invoke-virtual {v5}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    check-cast v5, Landroid/graphics/drawable/Drawable$ConstantState;

    .line 74
    .line 75
    if-eqz v5, :cond_4

    .line 76
    .line 77
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-virtual {v5, v3}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    .line 82
    .line 83
    .line 84
    move-result-object v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 85
    monitor-exit p0

    .line 86
    goto :goto_0

    .line 87
    :catchall_0
    move-exception p1

    .line 88
    goto/16 :goto_5

    .line 89
    .line 90
    :cond_4
    :try_start_2
    iget-object v5, v3, Lp/g;->f:[J

    .line 91
    .line 92
    iget v6, v3, Lp/g;->h:I

    .line 93
    .line 94
    invoke-static {v5, v6, v1, v2}, Lq/a;->b([JIJ)I

    .line 95
    .line 96
    .line 97
    move-result v5

    .line 98
    if-ltz v5, :cond_5

    .line 99
    .line 100
    iget-object v6, v3, Lp/g;->g:[Ljava/lang/Object;

    .line 101
    .line 102
    aget-object v7, v6, v5

    .line 103
    .line 104
    sget-object v8, Lp/h;->a:Ljava/lang/Object;

    .line 105
    .line 106
    if-eq v7, v8, :cond_5

    .line 107
    .line 108
    aput-object v8, v6, v5

    .line 109
    .line 110
    const/4 v5, 0x1

    .line 111
    iput-boolean v5, v3, Lp/g;->e:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 112
    .line 113
    :cond_5
    monitor-exit p0

    .line 114
    :goto_0
    if-eqz v4, :cond_6

    .line 115
    .line 116
    return-object v4

    .line 117
    :cond_6
    iget-object v3, p0, Lm/o0;->e:LD1/x;

    .line 118
    .line 119
    const/4 v4, 0x0

    .line 120
    if-nez v3, :cond_7

    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_7
    const v3, 0x7f070010

    .line 124
    .line 125
    .line 126
    if-ne p2, v3, :cond_8

    .line 127
    .line 128
    new-instance v4, Landroid/graphics/drawable/LayerDrawable;

    .line 129
    .line 130
    const p2, 0x7f07000f

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0, p1, p2}, Lm/o0;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    const v3, 0x7f070011

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0, p1, v3}, Lm/o0;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    filled-new-array {p2, v3}, [Landroid/graphics/drawable/Drawable;

    .line 145
    .line 146
    .line 147
    move-result-object p2

    .line 148
    invoke-direct {v4, p2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 149
    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_8
    const v3, 0x7f070033

    .line 153
    .line 154
    .line 155
    if-ne p2, v3, :cond_9

    .line 156
    .line 157
    const p2, 0x7f06003b

    .line 158
    .line 159
    .line 160
    invoke-static {p0, p1, p2}, LD1/x;->m(Lm/o0;Landroid/content/Context;I)Landroid/graphics/drawable/LayerDrawable;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    goto :goto_1

    .line 165
    :cond_9
    const v3, 0x7f070032

    .line 166
    .line 167
    .line 168
    if-ne p2, v3, :cond_a

    .line 169
    .line 170
    const p2, 0x7f06003c

    .line 171
    .line 172
    .line 173
    invoke-static {p0, p1, p2}, LD1/x;->m(Lm/o0;Landroid/content/Context;I)Landroid/graphics/drawable/LayerDrawable;

    .line 174
    .line 175
    .line 176
    move-result-object v4

    .line 177
    goto :goto_1

    .line 178
    :cond_a
    const v3, 0x7f070034

    .line 179
    .line 180
    .line 181
    if-ne p2, v3, :cond_b

    .line 182
    .line 183
    const p2, 0x7f06003d

    .line 184
    .line 185
    .line 186
    invoke-static {p0, p1, p2}, LD1/x;->m(Lm/o0;Landroid/content/Context;I)Landroid/graphics/drawable/LayerDrawable;

    .line 187
    .line 188
    .line 189
    move-result-object v4

    .line 190
    :cond_b
    :goto_1
    if-eqz v4, :cond_e

    .line 191
    .line 192
    iget p2, v0, Landroid/util/TypedValue;->changingConfigurations:I

    .line 193
    .line 194
    invoke-virtual {v4, p2}, Landroid/graphics/drawable/Drawable;->setChangingConfigurations(I)V

    .line 195
    .line 196
    .line 197
    monitor-enter p0

    .line 198
    :try_start_3
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 199
    .line 200
    .line 201
    move-result-object p2

    .line 202
    if-eqz p2, :cond_d

    .line 203
    .line 204
    iget-object v0, p0, Lm/o0;->b:Ljava/util/WeakHashMap;

    .line 205
    .line 206
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    check-cast v0, Lp/g;

    .line 211
    .line 212
    if-nez v0, :cond_c

    .line 213
    .line 214
    new-instance v0, Lp/g;

    .line 215
    .line 216
    invoke-direct {v0}, Lp/g;-><init>()V

    .line 217
    .line 218
    .line 219
    iget-object v3, p0, Lm/o0;->b:Ljava/util/WeakHashMap;

    .line 220
    .line 221
    invoke-virtual {v3, p1, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    goto :goto_2

    .line 225
    :catchall_1
    move-exception p1

    .line 226
    goto :goto_4

    .line 227
    :cond_c
    :goto_2
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 228
    .line 229
    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {v0, v1, v2, p1}, Lp/g;->a(JLjava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 233
    .line 234
    .line 235
    monitor-exit p0

    .line 236
    goto :goto_3

    .line 237
    :cond_d
    monitor-exit p0

    .line 238
    :goto_3
    return-object v4

    .line 239
    :goto_4
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 240
    throw p1

    .line 241
    :cond_e
    return-object v4

    .line 242
    :goto_5
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 243
    throw p1
.end method

.method public final declared-synchronized c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lm/o0;->d(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 3
    .line 4
    .line 5
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    monitor-exit p0

    .line 7
    return-object p1

    .line 8
    :catchall_0
    move-exception p1

    .line 9
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10
    throw p1
.end method

.method public final declared-synchronized d(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lm/o0;->d:Z

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lm/o0;->d:Z

    .line 9
    .line 10
    const v0, 0x7f07004e

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1, v0}, Lm/o0;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_5

    .line 18
    .line 19
    instance-of v1, v0, Lb0/a;

    .line 20
    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    const-string v1, "android.graphics.drawable.VectorDrawable"

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_5

    .line 38
    .line 39
    :cond_1
    :goto_0
    invoke-virtual {p0, p1, p2}, Lm/o0;->a(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    if-nez v0, :cond_2

    .line 44
    .line 45
    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    goto :goto_1

    .line 50
    :catchall_0
    move-exception p1

    .line 51
    goto :goto_2

    .line 52
    :cond_2
    :goto_1
    if-eqz v0, :cond_3

    .line 53
    .line 54
    invoke-virtual {p0, p1, p2, v0}, Lm/o0;->g(Landroid/content/Context;ILandroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    :cond_3
    if-eqz v0, :cond_4

    .line 59
    .line 60
    invoke-static {v0}, Lm/O;->a(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    .line 62
    .line 63
    :cond_4
    monitor-exit p0

    .line 64
    return-object v0

    .line 65
    :cond_5
    const/4 p1, 0x0

    .line 66
    :try_start_1
    iput-boolean p1, p0, Lm/o0;->d:Z

    .line 67
    .line 68
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 69
    .line 70
    const-string p2, "This app has been built with an incorrect configuration. Please configure your build for VectorDrawableCompat."

    .line 71
    .line 72
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    throw p1

    .line 76
    :goto_2
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 77
    throw p1
.end method

.method public final declared-synchronized f(Landroid/content/Context;I)Landroid/content/res/ColorStateList;
    .locals 6

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lm/o0;->a:Ljava/util/WeakHashMap;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lp/k;

    .line 12
    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v2, v0, Lp/k;->e:[I

    .line 16
    .line 17
    iget v3, v0, Lp/k;->g:I

    .line 18
    .line 19
    invoke-static {v3, p2, v2}, Lq/a;->a(II[I)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-ltz v2, :cond_0

    .line 24
    .line 25
    iget-object v0, v0, Lp/k;->f:[Ljava/lang/Object;

    .line 26
    .line 27
    aget-object v0, v0, v2

    .line 28
    .line 29
    sget-object v2, Lp/h;->b:Ljava/lang/Object;

    .line 30
    .line 31
    if-ne v0, v2, :cond_1

    .line 32
    .line 33
    :cond_0
    move-object v0, v1

    .line 34
    :cond_1
    check-cast v0, Landroid/content/res/ColorStateList;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    move-object v0, v1

    .line 38
    :goto_0
    if-nez v0, :cond_9

    .line 39
    .line 40
    iget-object v0, p0, Lm/o0;->e:LD1/x;

    .line 41
    .line 42
    if-nez v0, :cond_3

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_3
    invoke-virtual {v0, p1, p2}, LD1/x;->n(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    :goto_1
    if-eqz v1, :cond_8

    .line 50
    .line 51
    iget-object v0, p0, Lm/o0;->a:Ljava/util/WeakHashMap;

    .line 52
    .line 53
    if-nez v0, :cond_4

    .line 54
    .line 55
    new-instance v0, Ljava/util/WeakHashMap;

    .line 56
    .line 57
    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 58
    .line 59
    .line 60
    iput-object v0, p0, Lm/o0;->a:Ljava/util/WeakHashMap;

    .line 61
    .line 62
    :cond_4
    iget-object v0, p0, Lm/o0;->a:Ljava/util/WeakHashMap;

    .line 63
    .line 64
    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lp/k;

    .line 69
    .line 70
    if-nez v0, :cond_7

    .line 71
    .line 72
    new-instance v0, Lp/k;

    .line 73
    .line 74
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 75
    .line 76
    .line 77
    const/4 v2, 0x4

    .line 78
    move v3, v2

    .line 79
    :goto_2
    const/16 v4, 0x20

    .line 80
    .line 81
    const/16 v5, 0x28

    .line 82
    .line 83
    if-ge v3, v4, :cond_6

    .line 84
    .line 85
    const/4 v4, 0x1

    .line 86
    shl-int/2addr v4, v3

    .line 87
    add-int/lit8 v4, v4, -0xc

    .line 88
    .line 89
    if-gt v5, v4, :cond_5

    .line 90
    .line 91
    move v5, v4

    .line 92
    goto :goto_3

    .line 93
    :cond_5
    add-int/lit8 v3, v3, 0x1

    .line 94
    .line 95
    goto :goto_2

    .line 96
    :cond_6
    :goto_3
    div-int/2addr v5, v2

    .line 97
    new-array v2, v5, [I

    .line 98
    .line 99
    iput-object v2, v0, Lp/k;->e:[I

    .line 100
    .line 101
    new-array v2, v5, [Ljava/lang/Object;

    .line 102
    .line 103
    iput-object v2, v0, Lp/k;->f:[Ljava/lang/Object;

    .line 104
    .line 105
    iget-object v2, p0, Lm/o0;->a:Ljava/util/WeakHashMap;

    .line 106
    .line 107
    invoke-virtual {v2, p1, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    :cond_7
    invoke-virtual {v0, p2, v1}, Lp/k;->a(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 111
    .line 112
    .line 113
    :cond_8
    move-object v0, v1

    .line 114
    goto :goto_4

    .line 115
    :catchall_0
    move-exception p1

    .line 116
    goto :goto_5

    .line 117
    :cond_9
    :goto_4
    monitor-exit p0

    .line 118
    return-object v0

    .line 119
    :goto_5
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 120
    throw p1
.end method

.method public final g(Landroid/content/Context;ILandroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 8

    .line 1
    invoke-virtual {p0, p1, p2}, Lm/o0;->f(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    .line 12
    .line 13
    .line 14
    iget-object p3, p0, Lm/o0;->e:LD1/x;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    if-nez p3, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const p3, 0x7f070041

    .line 21
    .line 22
    .line 23
    if-ne p2, p3, :cond_1

    .line 24
    .line 25
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    .line 26
    .line 27
    :cond_1
    :goto_0
    if-eqz v0, :cond_2

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setTintMode(Landroid/graphics/PorterDuff$Mode;)V

    .line 30
    .line 31
    .line 32
    :cond_2
    return-object p1

    .line 33
    :cond_3
    iget-object v0, p0, Lm/o0;->e:LD1/x;

    .line 34
    .line 35
    if-eqz v0, :cond_6

    .line 36
    .line 37
    const v0, 0x7f07003c

    .line 38
    .line 39
    .line 40
    const v1, 0x102000d

    .line 41
    .line 42
    .line 43
    const v2, 0x102000f

    .line 44
    .line 45
    .line 46
    const/high16 v3, 0x1020000

    .line 47
    .line 48
    const v4, 0x7f030069

    .line 49
    .line 50
    .line 51
    const v5, 0x7f03006b

    .line 52
    .line 53
    .line 54
    if-ne p2, v0, :cond_4

    .line 55
    .line 56
    move-object p2, p3

    .line 57
    check-cast p2, Landroid/graphics/drawable/LayerDrawable;

    .line 58
    .line 59
    invoke-virtual {p2, v3}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-static {p1, v5}, Lm/u0;->c(Landroid/content/Context;I)I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    sget-object v6, Lm/p;->b:Landroid/graphics/PorterDuff$Mode;

    .line 68
    .line 69
    invoke-static {v0, v3, v6}, LD1/x;->s(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p2, v2}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {p1, v5}, Lm/u0;->c(Landroid/content/Context;I)I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    invoke-static {v0, v2, v6}, LD1/x;->s(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p2, v1}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    invoke-static {p1, v4}, Lm/u0;->c(Landroid/content/Context;I)I

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    invoke-static {p2, p1, v6}, LD1/x;->s(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    .line 92
    .line 93
    .line 94
    return-object p3

    .line 95
    :cond_4
    const v0, 0x7f070033

    .line 96
    .line 97
    .line 98
    if-eq p2, v0, :cond_5

    .line 99
    .line 100
    const v0, 0x7f070032

    .line 101
    .line 102
    .line 103
    if-eq p2, v0, :cond_5

    .line 104
    .line 105
    const v0, 0x7f070034

    .line 106
    .line 107
    .line 108
    if-ne p2, v0, :cond_6

    .line 109
    .line 110
    :cond_5
    move-object p2, p3

    .line 111
    check-cast p2, Landroid/graphics/drawable/LayerDrawable;

    .line 112
    .line 113
    invoke-virtual {p2, v3}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-static {p1, v5}, Lm/u0;->b(Landroid/content/Context;I)I

    .line 118
    .line 119
    .line 120
    move-result v3

    .line 121
    sget-object v5, Lm/p;->b:Landroid/graphics/PorterDuff$Mode;

    .line 122
    .line 123
    invoke-static {v0, v3, v5}, LD1/x;->s(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p2, v2}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-static {p1, v4}, Lm/u0;->c(Landroid/content/Context;I)I

    .line 131
    .line 132
    .line 133
    move-result v2

    .line 134
    invoke-static {v0, v2, v5}, LD1/x;->s(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p2, v1}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 138
    .line 139
    .line 140
    move-result-object p2

    .line 141
    invoke-static {p1, v4}, Lm/u0;->c(Landroid/content/Context;I)I

    .line 142
    .line 143
    .line 144
    move-result p1

    .line 145
    invoke-static {p2, p1, v5}, LD1/x;->s(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    .line 146
    .line 147
    .line 148
    return-object p3

    .line 149
    :cond_6
    iget-object v0, p0, Lm/o0;->e:LD1/x;

    .line 150
    .line 151
    if-eqz v0, :cond_c

    .line 152
    .line 153
    sget-object v1, Lm/p;->b:Landroid/graphics/PorterDuff$Mode;

    .line 154
    .line 155
    iget-object v2, v0, LD1/x;->a:Ljava/lang/Object;

    .line 156
    .line 157
    check-cast v2, [I

    .line 158
    .line 159
    invoke-static {v2, p2}, LD1/x;->h([II)Z

    .line 160
    .line 161
    .line 162
    move-result v2

    .line 163
    const/4 v3, 0x1

    .line 164
    const/4 v4, -0x1

    .line 165
    if-eqz v2, :cond_7

    .line 166
    .line 167
    const p2, 0x7f03006b

    .line 168
    .line 169
    .line 170
    :goto_1
    move v0, v4

    .line 171
    goto :goto_3

    .line 172
    :cond_7
    iget-object v2, v0, LD1/x;->c:Ljava/lang/Object;

    .line 173
    .line 174
    check-cast v2, [I

    .line 175
    .line 176
    invoke-static {v2, p2}, LD1/x;->h([II)Z

    .line 177
    .line 178
    .line 179
    move-result v2

    .line 180
    if-eqz v2, :cond_8

    .line 181
    .line 182
    const p2, 0x7f030069

    .line 183
    .line 184
    .line 185
    goto :goto_1

    .line 186
    :cond_8
    iget-object v0, v0, LD1/x;->d:Ljava/lang/Object;

    .line 187
    .line 188
    check-cast v0, [I

    .line 189
    .line 190
    invoke-static {v0, p2}, LD1/x;->h([II)Z

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    const v2, 0x1010031

    .line 195
    .line 196
    .line 197
    if-eqz v0, :cond_9

    .line 198
    .line 199
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    .line 200
    .line 201
    :goto_2
    move p2, v2

    .line 202
    goto :goto_1

    .line 203
    :cond_9
    const v0, 0x7f070025

    .line 204
    .line 205
    .line 206
    if-ne p2, v0, :cond_a

    .line 207
    .line 208
    const p2, 0x42233333    # 40.8f

    .line 209
    .line 210
    .line 211
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    .line 212
    .line 213
    .line 214
    move-result p2

    .line 215
    const v0, 0x1010030

    .line 216
    .line 217
    .line 218
    move v7, v0

    .line 219
    move v0, p2

    .line 220
    move p2, v7

    .line 221
    goto :goto_3

    .line 222
    :cond_a
    const v0, 0x7f070013

    .line 223
    .line 224
    .line 225
    if-ne p2, v0, :cond_b

    .line 226
    .line 227
    goto :goto_2

    .line 228
    :cond_b
    const/4 v3, 0x0

    .line 229
    move p2, v3

    .line 230
    goto :goto_1

    .line 231
    :goto_3
    if-eqz v3, :cond_c

    .line 232
    .line 233
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 234
    .line 235
    .line 236
    move-result-object v2

    .line 237
    invoke-static {p1, p2}, Lm/u0;->c(Landroid/content/Context;I)I

    .line 238
    .line 239
    .line 240
    move-result p1

    .line 241
    const-class p2, Lm/p;

    .line 242
    .line 243
    monitor-enter p2

    .line 244
    :try_start_0
    invoke-static {p1, v1}, Lm/o0;->e(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    .line 245
    .line 246
    .line 247
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 248
    monitor-exit p2

    .line 249
    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 250
    .line 251
    .line 252
    if-eq v0, v4, :cond_c

    .line 253
    .line 254
    invoke-virtual {v2, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 255
    .line 256
    .line 257
    goto :goto_4

    .line 258
    :catchall_0
    move-exception p1

    .line 259
    :try_start_1
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 260
    throw p1

    .line 261
    :cond_c
    :goto_4
    return-object p3
.end method
