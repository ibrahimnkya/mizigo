.class public final Lt/z;
.super Lt/A;
.source "SourceFile"


# instance fields
.field public e:Ljava/util/ArrayList;

.field public f:Ljava/util/ArrayList;

.field public g:I

.field public h:Z

.field public i:Z

.field public j:Landroidx/core/graphics/drawable/IconCompat;

.field public k:Landroidx/core/graphics/drawable/IconCompat;

.field public l:Landroidx/core/graphics/drawable/IconCompat;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lt/A;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lt/z;->e:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lt/z;->f:Ljava/util/ArrayList;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput v0, p0, Lt/z;->g:I

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    iput-boolean v0, p0, Lt/z;->i:Z

    .line 23
    .line 24
    return-void
.end method

.method public static e(Landroid/os/Parcelable;)Landroidx/core/graphics/drawable/IconCompat;
    .locals 1

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    instance-of v0, p0, Landroid/graphics/drawable/Icon;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Landroid/graphics/drawable/Icon;

    .line 8
    .line 9
    invoke-static {p0}, Landroidx/core/graphics/drawable/IconCompat;->b(Landroid/graphics/drawable/Icon;)Landroidx/core/graphics/drawable/IconCompat;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    instance-of v0, p0, Landroid/graphics/Bitmap;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    check-cast p0, Landroid/graphics/Bitmap;

    .line 19
    .line 20
    invoke-static {p0}, Landroidx/core/graphics/drawable/IconCompat;->d(Landroid/graphics/Bitmap;)Landroidx/core/graphics/drawable/IconCompat;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method


# virtual methods
.method public final a(Landroid/os/Bundle;)V
    .locals 10

    .line 1
    invoke-super {p0, p1}, Lt/A;->a(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 5
    .line 6
    const/16 v1, 0x24

    .line 7
    .line 8
    if-ge v0, v1, :cond_8

    .line 9
    .line 10
    iget-object v0, p0, Lt/z;->e:Ljava/util/ArrayList;

    .line 11
    .line 12
    new-instance v1, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v2, "colorInt"

    .line 18
    .line 19
    const-string v3, "id"

    .line 20
    .line 21
    const/4 v4, 0x0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 25
    .line 26
    .line 27
    move-result v5

    .line 28
    if-nez v5, :cond_1

    .line 29
    .line 30
    move v5, v4

    .line 31
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 32
    .line 33
    .line 34
    move-result v6

    .line 35
    if-ge v5, v6, :cond_1

    .line 36
    .line 37
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    check-cast v6, Lt/y;

    .line 42
    .line 43
    iget v7, v6, Lt/y;->a:I

    .line 44
    .line 45
    if-gtz v7, :cond_0

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_0
    new-instance v7, Landroid/os/Bundle;

    .line 49
    .line 50
    invoke-direct {v7}, Landroid/os/Bundle;-><init>()V

    .line 51
    .line 52
    .line 53
    const-string v8, "length"

    .line 54
    .line 55
    iget v9, v6, Lt/y;->a:I

    .line 56
    .line 57
    invoke-virtual {v7, v8, v9}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 58
    .line 59
    .line 60
    iget v8, v6, Lt/y;->b:I

    .line 61
    .line 62
    invoke-virtual {v7, v3, v8}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 63
    .line 64
    .line 65
    iget v6, v6, Lt/y;->c:I

    .line 66
    .line 67
    invoke-virtual {v7, v2, v6}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    :goto_1
    add-int/lit8 v5, v5, 0x1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_1
    const-string v0, "android.progressSegments"

    .line 77
    .line 78
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lt/z;->f:Ljava/util/ArrayList;

    .line 82
    .line 83
    new-instance v1, Ljava/util/ArrayList;

    .line 84
    .line 85
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 86
    .line 87
    .line 88
    if-eqz v0, :cond_3

    .line 89
    .line 90
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 91
    .line 92
    .line 93
    move-result v5

    .line 94
    if-nez v5, :cond_3

    .line 95
    .line 96
    :goto_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 97
    .line 98
    .line 99
    move-result v5

    .line 100
    if-ge v4, v5, :cond_3

    .line 101
    .line 102
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v5

    .line 106
    check-cast v5, Lt/x;

    .line 107
    .line 108
    iget v6, v5, Lt/x;->a:I

    .line 109
    .line 110
    if-gez v6, :cond_2

    .line 111
    .line 112
    goto :goto_3

    .line 113
    :cond_2
    new-instance v6, Landroid/os/Bundle;

    .line 114
    .line 115
    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    .line 116
    .line 117
    .line 118
    const-string v7, "position"

    .line 119
    .line 120
    iget v8, v5, Lt/x;->a:I

    .line 121
    .line 122
    invoke-virtual {v6, v7, v8}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 123
    .line 124
    .line 125
    iget v7, v5, Lt/x;->b:I

    .line 126
    .line 127
    invoke-virtual {v6, v3, v7}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 128
    .line 129
    .line 130
    iget v5, v5, Lt/x;->c:I

    .line 131
    .line 132
    invoke-virtual {v6, v2, v5}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    :goto_3
    add-int/lit8 v4, v4, 0x1

    .line 139
    .line 140
    goto :goto_2

    .line 141
    :cond_3
    const-string v0, "android.progressPoints"

    .line 142
    .line 143
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 144
    .line 145
    .line 146
    const-string v0, "android.progress"

    .line 147
    .line 148
    iget v1, p0, Lt/z;->g:I

    .line 149
    .line 150
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 151
    .line 152
    .line 153
    const-string v0, "android.progressIndeterminate"

    .line 154
    .line 155
    iget-boolean v1, p0, Lt/z;->h:Z

    .line 156
    .line 157
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 158
    .line 159
    .line 160
    const-string v0, "android.progressMax"

    .line 161
    .line 162
    invoke-virtual {p0}, Lt/z;->f()I

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 167
    .line 168
    .line 169
    const-string v0, "android.styledByProgress"

    .line 170
    .line 171
    iget-boolean v1, p0, Lt/z;->i:Z

    .line 172
    .line 173
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Lt/A;->a:Lt/i;

    .line 177
    .line 178
    if-eqz v0, :cond_4

    .line 179
    .line 180
    iget-object v0, v0, Lt/i;->a:Landroid/content/Context;

    .line 181
    .line 182
    goto :goto_4

    .line 183
    :cond_4
    const/4 v0, 0x0

    .line 184
    :goto_4
    if-eqz v0, :cond_8

    .line 185
    .line 186
    iget-object v1, p0, Lt/z;->j:Landroidx/core/graphics/drawable/IconCompat;

    .line 187
    .line 188
    const-string v2, "android.progressTrackerIcon"

    .line 189
    .line 190
    if-eqz v1, :cond_5

    .line 191
    .line 192
    invoke-virtual {v1, v0}, Landroidx/core/graphics/drawable/IconCompat;->h(Landroid/content/Context;)Landroid/graphics/drawable/Icon;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    invoke-virtual {p1, v2, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 197
    .line 198
    .line 199
    goto :goto_5

    .line 200
    :cond_5
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    :goto_5
    iget-object v1, p0, Lt/z;->k:Landroidx/core/graphics/drawable/IconCompat;

    .line 204
    .line 205
    const-string v2, "android.progressStartIcon"

    .line 206
    .line 207
    if-eqz v1, :cond_6

    .line 208
    .line 209
    invoke-virtual {v1, v0}, Landroidx/core/graphics/drawable/IconCompat;->h(Landroid/content/Context;)Landroid/graphics/drawable/Icon;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    invoke-virtual {p1, v2, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 214
    .line 215
    .line 216
    goto :goto_6

    .line 217
    :cond_6
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    :goto_6
    iget-object v1, p0, Lt/z;->l:Landroidx/core/graphics/drawable/IconCompat;

    .line 221
    .line 222
    const-string v2, "android.progressEndIcon"

    .line 223
    .line 224
    if-eqz v1, :cond_7

    .line 225
    .line 226
    invoke-virtual {v1, v0}, Landroidx/core/graphics/drawable/IconCompat;->h(Landroid/content/Context;)Landroid/graphics/drawable/Icon;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    invoke-virtual {p1, v2, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 231
    .line 232
    .line 233
    return-void

    .line 234
    :cond_7
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    :cond_8
    return-void
.end method

.method public final b(LR/j;)V
    .locals 4

    .line 1
    iget-object v0, p1, LR/j;->d:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/app/Notification$Builder;

    .line 4
    .line 5
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 6
    .line 7
    const/16 v2, 0x24

    .line 8
    .line 9
    if-lt v1, v2, :cond_3

    .line 10
    .line 11
    iget-object p1, p1, LR/j;->c:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p1, Landroid/content/Context;

    .line 14
    .line 15
    new-instance v1, Landroid/app/Notification$ProgressStyle;

    .line 16
    .line 17
    invoke-direct {v1}, Landroid/app/Notification$ProgressStyle;-><init>()V

    .line 18
    .line 19
    .line 20
    iget-boolean v2, p0, Lt/z;->i:Z

    .line 21
    .line 22
    invoke-static {v1, v2}, Lt/w;->h(Landroid/app/Notification$ProgressStyle;Z)V

    .line 23
    .line 24
    .line 25
    iget v2, p0, Lt/z;->g:I

    .line 26
    .line 27
    invoke-static {v1, v2}, Lt/w;->a(Landroid/app/Notification$ProgressStyle;I)V

    .line 28
    .line 29
    .line 30
    iget-boolean v2, p0, Lt/z;->h:Z

    .line 31
    .line 32
    invoke-static {v1, v2}, Lt/w;->c(Landroid/app/Notification$ProgressStyle;Z)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Lt/z;->k:Landroidx/core/graphics/drawable/IconCompat;

    .line 36
    .line 37
    const/4 v3, 0x0

    .line 38
    if-eqz v2, :cond_0

    .line 39
    .line 40
    invoke-virtual {v2, p1}, Landroidx/core/graphics/drawable/IconCompat;->h(Landroid/content/Context;)Landroid/graphics/drawable/Icon;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    move-object v2, v3

    .line 46
    :goto_0
    invoke-static {v1, v2}, Lt/w;->f(Landroid/app/Notification$ProgressStyle;Landroid/graphics/drawable/Icon;)V

    .line 47
    .line 48
    .line 49
    iget-object v2, p0, Lt/z;->l:Landroidx/core/graphics/drawable/IconCompat;

    .line 50
    .line 51
    if-eqz v2, :cond_1

    .line 52
    .line 53
    invoke-virtual {v2, p1}, Landroidx/core/graphics/drawable/IconCompat;->h(Landroid/content/Context;)Landroid/graphics/drawable/Icon;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    goto :goto_1

    .line 58
    :cond_1
    move-object v2, v3

    .line 59
    :goto_1
    invoke-static {v1, v2}, Lt/w;->b(Landroid/app/Notification$ProgressStyle;Landroid/graphics/drawable/Icon;)V

    .line 60
    .line 61
    .line 62
    iget-object v2, p0, Lt/z;->j:Landroidx/core/graphics/drawable/IconCompat;

    .line 63
    .line 64
    if-eqz v2, :cond_2

    .line 65
    .line 66
    invoke-virtual {v2, p1}, Landroidx/core/graphics/drawable/IconCompat;->h(Landroid/content/Context;)Landroid/graphics/drawable/Icon;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    :cond_2
    invoke-static {v1, v3}, Lt/w;->g(Landroid/app/Notification$ProgressStyle;Landroid/graphics/drawable/Icon;)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lt/z;->f:Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-static {v1, p1}, Lt/w;->d(Landroid/app/Notification$ProgressStyle;Ljava/util/List;)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lt/z;->e:Ljava/util/ArrayList;

    .line 79
    .line 80
    invoke-static {v1, p1}, Lt/w;->e(Landroid/app/Notification$ProgressStyle;Ljava/util/List;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setStyle(Landroid/app/Notification$Style;)Landroid/app/Notification$Builder;

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_3
    invoke-virtual {p0}, Lt/z;->f()I

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    iget v1, p0, Lt/z;->g:I

    .line 92
    .line 93
    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    iget-boolean v2, p0, Lt/z;->h:Z

    .line 98
    .line 99
    invoke-virtual {v0, p1, v1, v2}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public final c()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "androidx.core.app.NotificationCompat$ProgressStyle"

    .line 2
    .line 3
    return-object v0
.end method

.method public final d(Landroid/os/Bundle;)V
    .locals 11

    .line 1
    invoke-super {p0, p1}, Lt/A;->d(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 5
    .line 6
    const-string v1, "android.progressSegments"

    .line 7
    .line 8
    const/16 v2, 0x22

    .line 9
    .line 10
    if-lt v0, v2, :cond_0

    .line 11
    .line 12
    invoke-static {v1, p1}, LE/f;->b(Ljava/lang/String;Landroid/os/Bundle;)Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    :goto_0
    new-instance v1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    const-string v3, "colorInt"

    .line 27
    .line 28
    const-string v4, "id"

    .line 29
    .line 30
    const/4 v5, 0x0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 34
    .line 35
    .line 36
    move-result v6

    .line 37
    if-nez v6, :cond_2

    .line 38
    .line 39
    move v6, v5

    .line 40
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result v7

    .line 44
    if-ge v6, v7, :cond_2

    .line 45
    .line 46
    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v7

    .line 50
    check-cast v7, Landroid/os/Bundle;

    .line 51
    .line 52
    const-string v8, "length"

    .line 53
    .line 54
    invoke-virtual {v7, v8}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v8

    .line 58
    if-gtz v8, :cond_1

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_1
    invoke-virtual {v7, v4}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v9

    .line 65
    invoke-virtual {v7, v3, v5}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 66
    .line 67
    .line 68
    move-result v7

    .line 69
    new-instance v10, Lt/y;

    .line 70
    .line 71
    invoke-direct {v10}, Ljava/lang/Object;-><init>()V

    .line 72
    .line 73
    .line 74
    iput v8, v10, Lt/y;->a:I

    .line 75
    .line 76
    iput v9, v10, Lt/y;->b:I

    .line 77
    .line 78
    iput v7, v10, Lt/y;->c:I

    .line 79
    .line 80
    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    :goto_2
    add-int/lit8 v6, v6, 0x1

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_2
    iput-object v1, p0, Lt/z;->e:Ljava/util/ArrayList;

    .line 87
    .line 88
    const-string v0, "android.progress"

    .line 89
    .line 90
    invoke-virtual {p1, v0, v5}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    iput v0, p0, Lt/z;->g:I

    .line 95
    .line 96
    const-string v0, "android.progressIndeterminate"

    .line 97
    .line 98
    invoke-virtual {p1, v0, v5}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    iput-boolean v0, p0, Lt/z;->h:Z

    .line 103
    .line 104
    const-string v0, "android.styledByProgress"

    .line 105
    .line 106
    const/4 v1, 0x1

    .line 107
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    iput-boolean v0, p0, Lt/z;->i:Z

    .line 112
    .line 113
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 114
    .line 115
    const-string v1, "android.progressPoints"

    .line 116
    .line 117
    if-lt v0, v2, :cond_3

    .line 118
    .line 119
    invoke-static {v1, p1}, LE/f;->b(Ljava/lang/String;Landroid/os/Bundle;)Ljava/util/ArrayList;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    goto :goto_3

    .line 124
    :cond_3
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    :goto_3
    new-instance v1, Ljava/util/ArrayList;

    .line 129
    .line 130
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 131
    .line 132
    .line 133
    if-eqz v0, :cond_5

    .line 134
    .line 135
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    if-nez v2, :cond_5

    .line 140
    .line 141
    move v2, v5

    .line 142
    :goto_4
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 143
    .line 144
    .line 145
    move-result v6

    .line 146
    if-ge v2, v6, :cond_5

    .line 147
    .line 148
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v6

    .line 152
    check-cast v6, Landroid/os/Bundle;

    .line 153
    .line 154
    const-string v7, "position"

    .line 155
    .line 156
    invoke-virtual {v6, v7}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result v7

    .line 160
    if-gez v7, :cond_4

    .line 161
    .line 162
    goto :goto_5

    .line 163
    :cond_4
    invoke-virtual {v6, v4}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 164
    .line 165
    .line 166
    move-result v8

    .line 167
    invoke-virtual {v6, v3, v5}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 168
    .line 169
    .line 170
    move-result v6

    .line 171
    new-instance v9, Lt/x;

    .line 172
    .line 173
    invoke-direct {v9}, Ljava/lang/Object;-><init>()V

    .line 174
    .line 175
    .line 176
    iput v7, v9, Lt/x;->a:I

    .line 177
    .line 178
    iput v8, v9, Lt/x;->b:I

    .line 179
    .line 180
    iput v6, v9, Lt/x;->c:I

    .line 181
    .line 182
    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    :goto_5
    add-int/lit8 v2, v2, 0x1

    .line 186
    .line 187
    goto :goto_4

    .line 188
    :cond_5
    iput-object v1, p0, Lt/z;->f:Ljava/util/ArrayList;

    .line 189
    .line 190
    const-string v0, "android.progressTrackerIcon"

    .line 191
    .line 192
    invoke-static {v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->v(Ljava/lang/String;Landroid/os/Bundle;)Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    check-cast v0, Landroid/os/Parcelable;

    .line 197
    .line 198
    invoke-static {v0}, Lt/z;->e(Landroid/os/Parcelable;)Landroidx/core/graphics/drawable/IconCompat;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    iput-object v0, p0, Lt/z;->j:Landroidx/core/graphics/drawable/IconCompat;

    .line 203
    .line 204
    const-string v0, "android.progressStartIcon"

    .line 205
    .line 206
    invoke-static {v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->v(Ljava/lang/String;Landroid/os/Bundle;)Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    check-cast v0, Landroid/os/Parcelable;

    .line 211
    .line 212
    invoke-static {v0}, Lt/z;->e(Landroid/os/Parcelable;)Landroidx/core/graphics/drawable/IconCompat;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    iput-object v0, p0, Lt/z;->k:Landroidx/core/graphics/drawable/IconCompat;

    .line 217
    .line 218
    const-string v0, "android.progressEndIcon"

    .line 219
    .line 220
    invoke-static {v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->v(Ljava/lang/String;Landroid/os/Bundle;)Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    check-cast p1, Landroid/os/Parcelable;

    .line 225
    .line 226
    invoke-static {p1}, Lt/z;->e(Landroid/os/Parcelable;)Landroidx/core/graphics/drawable/IconCompat;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    iput-object p1, p0, Lt/z;->l:Landroidx/core/graphics/drawable/IconCompat;

    .line 231
    .line 232
    return-void
.end method

.method public final f()I
    .locals 6

    .line 1
    iget-object v0, p0, Lt/z;->e:Ljava/util/ArrayList;

    .line 2
    .line 3
    const/16 v1, 0x64

    .line 4
    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    goto :goto_2

    .line 14
    :cond_0
    const/4 v2, 0x0

    .line 15
    move v3, v2

    .line 16
    move v4, v3

    .line 17
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    if-ge v2, v5, :cond_2

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    check-cast v5, Lt/y;

    .line 28
    .line 29
    iget v5, v5, Lt/y;->a:I

    .line 30
    .line 31
    if-lez v5, :cond_1

    .line 32
    .line 33
    :try_start_0
    invoke-static {v4, v5}, Ljava/lang/Math;->addExact(II)I

    .line 34
    .line 35
    .line 36
    move-result v4
    :try_end_0
    .catch Ljava/lang/ArithmeticException; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    add-int/lit8 v3, v3, 0x1

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :catch_0
    return v1

    .line 41
    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    if-nez v3, :cond_3

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_3
    return v4

    .line 48
    :cond_4
    :goto_2
    return v1
.end method
