.class public final Ls3/j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/lifecycle/DefaultLifecycleObserver;
.implements Ls3/m;
.implements Lio/flutter/plugin/platform/e;
.implements Lc1/a;
.implements Lc1/b;
.implements Lc1/d;
.implements Lc1/e;


# instance fields
.field public final A:Ls3/d;

.field public final B:Ll2/b;

.field public final C:Lm/x0;

.field public final D:Ls3/q;

.field public E:Ll2/b;

.field public F:Ll2/a;

.field public G:Ljava/util/List;

.field public H:Ljava/util/List;

.field public I:Ljava/util/List;

.field public J:Ljava/util/List;

.field public K:Ljava/util/List;

.field public L:Ljava/util/List;

.field public M:Ljava/util/List;

.field public N:Ljava/util/List;

.field public O:Ljava/lang/String;

.field public P:Z

.field public Q:Ljava/util/ArrayList;

.field public final e:I

.field public final f:LZ2/s;

.field public final g:Lk3/f;

.field public final h:Lcom/google/android/gms/maps/GoogleMapOptions;

.field public i:Lc1/f;

.field public j:LB2/a;

.field public k:Z

.field public l:Z

.field public m:Z

.field public n:Z

.field public o:Z

.field public p:Z

.field public q:Z

.field public r:Z

.field public final s:F

.field public t:Lp3/i;

.field public final u:Landroid/content/Context;

.field public final v:Lj3/b;

.field public final w:Ls3/w;

.field public final x:Ls3/g;

.field public final y:Ls3/d;

.field public final z:Ls3/I0;


# direct methods
.method public constructor <init>(ILandroid/content/Context;Lk3/f;Lj3/b;Lcom/google/android/gms/maps/GoogleMapOptions;Ls3/r0;)V
    .locals 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ls3/j;->k:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ls3/j;->l:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Ls3/j;->m:Z

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    iput-boolean v1, p0, Ls3/j;->n:Z

    .line 13
    .line 14
    iput-boolean v1, p0, Ls3/j;->o:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Ls3/j;->p:Z

    .line 17
    .line 18
    iput-boolean v1, p0, Ls3/j;->q:Z

    .line 19
    .line 20
    iput-boolean v0, p0, Ls3/j;->r:Z

    .line 21
    .line 22
    iput p1, p0, Ls3/j;->e:I

    .line 23
    .line 24
    iput-object p2, p0, Ls3/j;->u:Landroid/content/Context;

    .line 25
    .line 26
    iput-object p5, p0, Ls3/j;->h:Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 27
    .line 28
    new-instance v0, Lc1/f;

    .line 29
    .line 30
    invoke-direct {v0, p2, p5}, Lc1/f;-><init>(Landroid/content/Context;Lcom/google/android/gms/maps/GoogleMapOptions;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ls3/j;->i:Lc1/f;

    .line 34
    .line 35
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object p5

    .line 39
    invoke-virtual {p5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 40
    .line 41
    .line 42
    move-result-object p5

    .line 43
    iget v4, p5, Landroid/util/DisplayMetrics;->density:F

    .line 44
    .line 45
    iput v4, p0, Ls3/j;->s:F

    .line 46
    .line 47
    iput-object p3, p0, Ls3/j;->g:Lk3/f;

    .line 48
    .line 49
    new-instance v1, LZ2/s;

    .line 50
    .line 51
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p5

    .line 55
    invoke-direct {v1, p3, p5}, LZ2/s;-><init>(Lk3/f;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iput-object v1, p0, Ls3/j;->f:LZ2/s;

    .line 59
    .line 60
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p5

    .line 64
    invoke-static {p3, p5, p0}, Ls3/j;->V(Lk3/f;Ljava/lang/String;Ls3/j;)V

    .line 65
    .line 66
    .line 67
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-static {p3, p1, p0}, Ls3/j;->W(Lk3/f;Ljava/lang/String;Ls3/j;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p2}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    iput-object p4, p0, Ls3/j;->v:Lj3/b;

    .line 79
    .line 80
    new-instance v2, Ls3/g;

    .line 81
    .line 82
    invoke-direct {v2, v1, p2, p6}, Ls3/g;-><init>(LZ2/s;Landroid/content/Context;Ls3/r0;)V

    .line 83
    .line 84
    .line 85
    iput-object v2, p0, Ls3/j;->x:Ls3/g;

    .line 86
    .line 87
    new-instance v0, Ls3/w;

    .line 88
    .line 89
    new-instance v5, LN1/e;

    .line 90
    .line 91
    const/16 p1, 0x10

    .line 92
    .line 93
    invoke-direct {v5, p1}, LN1/e;-><init>(I)V

    .line 94
    .line 95
    .line 96
    move-object v6, p6

    .line 97
    invoke-direct/range {v0 .. v6}, Ls3/w;-><init>(LZ2/s;Ls3/g;Landroid/content/res/AssetManager;FLN1/e;Ls3/r0;)V

    .line 98
    .line 99
    .line 100
    iput-object v0, p0, Ls3/j;->w:Ls3/w;

    .line 101
    .line 102
    new-instance p1, Ls3/d;

    .line 103
    .line 104
    const/4 p2, 0x1

    .line 105
    invoke-direct {p1, v1, v4, p2}, Ls3/d;-><init>(LZ2/s;FI)V

    .line 106
    .line 107
    .line 108
    iput-object p1, p0, Ls3/j;->y:Ls3/d;

    .line 109
    .line 110
    new-instance p1, Ls3/I0;

    .line 111
    .line 112
    invoke-direct {p1, v1, v3, v4}, Ls3/I0;-><init>(LZ2/s;Landroid/content/res/AssetManager;F)V

    .line 113
    .line 114
    .line 115
    iput-object p1, p0, Ls3/j;->z:Ls3/I0;

    .line 116
    .line 117
    new-instance p1, Ls3/d;

    .line 118
    .line 119
    const/4 p2, 0x0

    .line 120
    invoke-direct {p1, v1, v4, p2}, Ls3/d;-><init>(LZ2/s;FI)V

    .line 121
    .line 122
    .line 123
    iput-object p1, p0, Ls3/j;->A:Ls3/d;

    .line 124
    .line 125
    new-instance p1, Ll2/b;

    .line 126
    .line 127
    invoke-direct {p1}, Ll2/b;-><init>()V

    .line 128
    .line 129
    .line 130
    iput-object p1, p0, Ls3/j;->B:Ll2/b;

    .line 131
    .line 132
    new-instance p1, Lm/x0;

    .line 133
    .line 134
    invoke-direct {p1, v1}, Lm/x0;-><init>(LZ2/s;)V

    .line 135
    .line 136
    .line 137
    iput-object p1, p0, Ls3/j;->C:Lm/x0;

    .line 138
    .line 139
    new-instance p1, Ls3/q;

    .line 140
    .line 141
    invoke-direct {p1, v1, v3, v4}, Ls3/q;-><init>(LZ2/s;Landroid/content/res/AssetManager;F)V

    .line 142
    .line 143
    .line 144
    iput-object p1, p0, Ls3/j;->D:Ls3/q;

    .line 145
    .line 146
    return-void
.end method

.method public static J(Landroid/view/ViewGroup;)Landroid/view/TextureView;
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    if-ge v1, v0, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    instance-of v3, v2, Landroid/view/TextureView;

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    check-cast v2, Landroid/view/TextureView;

    .line 17
    .line 18
    return-object v2

    .line 19
    :cond_0
    instance-of v3, v2, Landroid/view/ViewGroup;

    .line 20
    .line 21
    if-eqz v3, :cond_1

    .line 22
    .line 23
    check-cast v2, Landroid/view/ViewGroup;

    .line 24
    .line 25
    invoke-static {v2}, Ls3/j;->J(Landroid/view/ViewGroup;)Landroid/view/TextureView;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    return-object v2

    .line 32
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_2
    const/4 p0, 0x0

    .line 36
    return-object p0
.end method

.method public static V(Lk3/f;Ljava/lang/String;Ls3/j;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p1, ""

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, "."

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    :goto_0
    new-instance v0, LV1/y;

    .line 17
    .line 18
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsApi.waitForMap"

    .line 19
    .line 20
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget-object v2, Ls3/B;->d:Ls3/B;

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 28
    .line 29
    .line 30
    if-eqz p2, :cond_1

    .line 31
    .line 32
    new-instance v1, Ls3/y;

    .line 33
    .line 34
    const/4 v4, 0x0

    .line 35
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 43
    .line 44
    .line 45
    :goto_1
    new-instance v0, LV1/y;

    .line 46
    .line 47
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsApi.updateMapConfiguration"

    .line 48
    .line 49
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 54
    .line 55
    .line 56
    if-eqz p2, :cond_2

    .line 57
    .line 58
    new-instance v1, Ls3/y;

    .line 59
    .line 60
    const/4 v4, 0x2

    .line 61
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 65
    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_2
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 69
    .line 70
    .line 71
    :goto_2
    new-instance v0, LV1/y;

    .line 72
    .line 73
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsApi.updateCircles"

    .line 74
    .line 75
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 80
    .line 81
    .line 82
    if-eqz p2, :cond_3

    .line 83
    .line 84
    new-instance v1, Ls3/y;

    .line 85
    .line 86
    const/4 v4, 0x7

    .line 87
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 91
    .line 92
    .line 93
    goto :goto_3

    .line 94
    :cond_3
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 95
    .line 96
    .line 97
    :goto_3
    new-instance v0, LV1/y;

    .line 98
    .line 99
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsApi.updateHeatmaps"

    .line 100
    .line 101
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 106
    .line 107
    .line 108
    if-eqz p2, :cond_4

    .line 109
    .line 110
    new-instance v1, Ls3/y;

    .line 111
    .line 112
    const/16 v4, 0x8

    .line 113
    .line 114
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 118
    .line 119
    .line 120
    goto :goto_4

    .line 121
    :cond_4
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 122
    .line 123
    .line 124
    :goto_4
    new-instance v0, LV1/y;

    .line 125
    .line 126
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsApi.updateClusterManagers"

    .line 127
    .line 128
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 133
    .line 134
    .line 135
    if-eqz p2, :cond_5

    .line 136
    .line 137
    new-instance v1, Ls3/y;

    .line 138
    .line 139
    const/16 v4, 0x9

    .line 140
    .line 141
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 145
    .line 146
    .line 147
    goto :goto_5

    .line 148
    :cond_5
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 149
    .line 150
    .line 151
    :goto_5
    new-instance v0, LV1/y;

    .line 152
    .line 153
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsApi.updateMarkers"

    .line 154
    .line 155
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 160
    .line 161
    .line 162
    if-eqz p2, :cond_6

    .line 163
    .line 164
    new-instance v1, Ls3/y;

    .line 165
    .line 166
    const/16 v4, 0xa

    .line 167
    .line 168
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 172
    .line 173
    .line 174
    goto :goto_6

    .line 175
    :cond_6
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 176
    .line 177
    .line 178
    :goto_6
    new-instance v0, LV1/y;

    .line 179
    .line 180
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsApi.updatePolygons"

    .line 181
    .line 182
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v1

    .line 186
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 187
    .line 188
    .line 189
    if-eqz p2, :cond_7

    .line 190
    .line 191
    new-instance v1, Ls3/y;

    .line 192
    .line 193
    const/16 v4, 0xc

    .line 194
    .line 195
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 199
    .line 200
    .line 201
    goto :goto_7

    .line 202
    :cond_7
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 203
    .line 204
    .line 205
    :goto_7
    new-instance v0, LV1/y;

    .line 206
    .line 207
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsApi.updatePolylines"

    .line 208
    .line 209
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 214
    .line 215
    .line 216
    if-eqz p2, :cond_8

    .line 217
    .line 218
    new-instance v1, Ls3/y;

    .line 219
    .line 220
    const/16 v4, 0xd

    .line 221
    .line 222
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 226
    .line 227
    .line 228
    goto :goto_8

    .line 229
    :cond_8
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 230
    .line 231
    .line 232
    :goto_8
    new-instance v0, LV1/y;

    .line 233
    .line 234
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsApi.updateTileOverlays"

    .line 235
    .line 236
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 241
    .line 242
    .line 243
    if-eqz p2, :cond_9

    .line 244
    .line 245
    new-instance v1, Ls3/y;

    .line 246
    .line 247
    const/16 v4, 0xe

    .line 248
    .line 249
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 250
    .line 251
    .line 252
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 253
    .line 254
    .line 255
    goto :goto_9

    .line 256
    :cond_9
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 257
    .line 258
    .line 259
    :goto_9
    new-instance v0, LV1/y;

    .line 260
    .line 261
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsApi.updateGroundOverlays"

    .line 262
    .line 263
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object v1

    .line 267
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 268
    .line 269
    .line 270
    if-eqz p2, :cond_a

    .line 271
    .line 272
    new-instance v1, Ls3/y;

    .line 273
    .line 274
    const/16 v4, 0xf

    .line 275
    .line 276
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 277
    .line 278
    .line 279
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 280
    .line 281
    .line 282
    goto :goto_a

    .line 283
    :cond_a
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 284
    .line 285
    .line 286
    :goto_a
    new-instance v0, LV1/y;

    .line 287
    .line 288
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsApi.getScreenCoordinate"

    .line 289
    .line 290
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object v1

    .line 294
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 295
    .line 296
    .line 297
    if-eqz p2, :cond_b

    .line 298
    .line 299
    new-instance v1, Ls3/y;

    .line 300
    .line 301
    const/16 v4, 0xb

    .line 302
    .line 303
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 304
    .line 305
    .line 306
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 307
    .line 308
    .line 309
    goto :goto_b

    .line 310
    :cond_b
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 311
    .line 312
    .line 313
    :goto_b
    new-instance v0, LV1/y;

    .line 314
    .line 315
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsApi.getLatLng"

    .line 316
    .line 317
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object v1

    .line 321
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 322
    .line 323
    .line 324
    if-eqz p2, :cond_c

    .line 325
    .line 326
    new-instance v1, Ls3/y;

    .line 327
    .line 328
    const/16 v4, 0x10

    .line 329
    .line 330
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 331
    .line 332
    .line 333
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 334
    .line 335
    .line 336
    goto :goto_c

    .line 337
    :cond_c
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 338
    .line 339
    .line 340
    :goto_c
    new-instance v0, LV1/y;

    .line 341
    .line 342
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsApi.getVisibleRegion"

    .line 343
    .line 344
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 345
    .line 346
    .line 347
    move-result-object v1

    .line 348
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 349
    .line 350
    .line 351
    if-eqz p2, :cond_d

    .line 352
    .line 353
    new-instance v1, Ls3/y;

    .line 354
    .line 355
    const/16 v4, 0x11

    .line 356
    .line 357
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 358
    .line 359
    .line 360
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 361
    .line 362
    .line 363
    goto :goto_d

    .line 364
    :cond_d
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 365
    .line 366
    .line 367
    :goto_d
    new-instance v0, LV1/y;

    .line 368
    .line 369
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsApi.moveCamera"

    .line 370
    .line 371
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 372
    .line 373
    .line 374
    move-result-object v1

    .line 375
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 376
    .line 377
    .line 378
    if-eqz p2, :cond_e

    .line 379
    .line 380
    new-instance v1, Ls3/y;

    .line 381
    .line 382
    const/16 v4, 0x12

    .line 383
    .line 384
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 385
    .line 386
    .line 387
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 388
    .line 389
    .line 390
    goto :goto_e

    .line 391
    :cond_e
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 392
    .line 393
    .line 394
    :goto_e
    new-instance v0, LV1/y;

    .line 395
    .line 396
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsApi.animateCamera"

    .line 397
    .line 398
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 399
    .line 400
    .line 401
    move-result-object v1

    .line 402
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 403
    .line 404
    .line 405
    if-eqz p2, :cond_f

    .line 406
    .line 407
    new-instance v1, Ls3/y;

    .line 408
    .line 409
    const/16 v4, 0x13

    .line 410
    .line 411
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 412
    .line 413
    .line 414
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 415
    .line 416
    .line 417
    goto :goto_f

    .line 418
    :cond_f
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 419
    .line 420
    .line 421
    :goto_f
    new-instance v0, LV1/y;

    .line 422
    .line 423
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsApi.getZoomLevel"

    .line 424
    .line 425
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 426
    .line 427
    .line 428
    move-result-object v1

    .line 429
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 430
    .line 431
    .line 432
    if-eqz p2, :cond_10

    .line 433
    .line 434
    new-instance v1, Ls3/y;

    .line 435
    .line 436
    const/16 v4, 0x14

    .line 437
    .line 438
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 439
    .line 440
    .line 441
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 442
    .line 443
    .line 444
    goto :goto_10

    .line 445
    :cond_10
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 446
    .line 447
    .line 448
    :goto_10
    new-instance v0, LV1/y;

    .line 449
    .line 450
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsApi.showInfoWindow"

    .line 451
    .line 452
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 453
    .line 454
    .line 455
    move-result-object v1

    .line 456
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 457
    .line 458
    .line 459
    if-eqz p2, :cond_11

    .line 460
    .line 461
    new-instance v1, Ls3/y;

    .line 462
    .line 463
    const/16 v4, 0x15

    .line 464
    .line 465
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 466
    .line 467
    .line 468
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 469
    .line 470
    .line 471
    goto :goto_11

    .line 472
    :cond_11
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 473
    .line 474
    .line 475
    :goto_11
    new-instance v0, LV1/y;

    .line 476
    .line 477
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsApi.hideInfoWindow"

    .line 478
    .line 479
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 480
    .line 481
    .line 482
    move-result-object v1

    .line 483
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 484
    .line 485
    .line 486
    if-eqz p2, :cond_12

    .line 487
    .line 488
    new-instance v1, Ls3/y;

    .line 489
    .line 490
    const/16 v4, 0x16

    .line 491
    .line 492
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 493
    .line 494
    .line 495
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 496
    .line 497
    .line 498
    goto :goto_12

    .line 499
    :cond_12
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 500
    .line 501
    .line 502
    :goto_12
    new-instance v0, LV1/y;

    .line 503
    .line 504
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsApi.isInfoWindowShown"

    .line 505
    .line 506
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 507
    .line 508
    .line 509
    move-result-object v1

    .line 510
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 511
    .line 512
    .line 513
    if-eqz p2, :cond_13

    .line 514
    .line 515
    new-instance v1, Ls3/y;

    .line 516
    .line 517
    const/16 v4, 0x17

    .line 518
    .line 519
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 520
    .line 521
    .line 522
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 523
    .line 524
    .line 525
    goto :goto_13

    .line 526
    :cond_13
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 527
    .line 528
    .line 529
    :goto_13
    new-instance v0, LV1/y;

    .line 530
    .line 531
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsApi.setStyle"

    .line 532
    .line 533
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 534
    .line 535
    .line 536
    move-result-object v1

    .line 537
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 538
    .line 539
    .line 540
    if-eqz p2, :cond_14

    .line 541
    .line 542
    new-instance v1, Ls3/y;

    .line 543
    .line 544
    const/4 v4, 0x1

    .line 545
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 546
    .line 547
    .line 548
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 549
    .line 550
    .line 551
    goto :goto_14

    .line 552
    :cond_14
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 553
    .line 554
    .line 555
    :goto_14
    new-instance v0, LV1/y;

    .line 556
    .line 557
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsApi.didLastStyleSucceed"

    .line 558
    .line 559
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 560
    .line 561
    .line 562
    move-result-object v1

    .line 563
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 564
    .line 565
    .line 566
    if-eqz p2, :cond_15

    .line 567
    .line 568
    new-instance v1, Ls3/y;

    .line 569
    .line 570
    const/4 v4, 0x3

    .line 571
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 572
    .line 573
    .line 574
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 575
    .line 576
    .line 577
    goto :goto_15

    .line 578
    :cond_15
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 579
    .line 580
    .line 581
    :goto_15
    new-instance v0, LV1/y;

    .line 582
    .line 583
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsApi.isAdvancedMarkersAvailable"

    .line 584
    .line 585
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 586
    .line 587
    .line 588
    move-result-object v1

    .line 589
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 590
    .line 591
    .line 592
    if-eqz p2, :cond_16

    .line 593
    .line 594
    new-instance v1, Ls3/y;

    .line 595
    .line 596
    const/4 v4, 0x4

    .line 597
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 598
    .line 599
    .line 600
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 601
    .line 602
    .line 603
    goto :goto_16

    .line 604
    :cond_16
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 605
    .line 606
    .line 607
    :goto_16
    new-instance v0, LV1/y;

    .line 608
    .line 609
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsApi.clearTileCache"

    .line 610
    .line 611
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 612
    .line 613
    .line 614
    move-result-object v1

    .line 615
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 616
    .line 617
    .line 618
    if-eqz p2, :cond_17

    .line 619
    .line 620
    new-instance v1, Ls3/y;

    .line 621
    .line 622
    const/4 v4, 0x5

    .line 623
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 624
    .line 625
    .line 626
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 627
    .line 628
    .line 629
    goto :goto_17

    .line 630
    :cond_17
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 631
    .line 632
    .line 633
    :goto_17
    new-instance v0, LV1/y;

    .line 634
    .line 635
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsApi.takeSnapshot"

    .line 636
    .line 637
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 638
    .line 639
    .line 640
    move-result-object p1

    .line 641
    invoke-direct {v0, p0, p1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 642
    .line 643
    .line 644
    if-eqz p2, :cond_18

    .line 645
    .line 646
    new-instance p0, Ls3/y;

    .line 647
    .line 648
    const/4 p1, 0x6

    .line 649
    invoke-direct {p0, p2, p1}, Ls3/y;-><init>(Ls3/j;I)V

    .line 650
    .line 651
    .line 652
    invoke-virtual {v0, p0}, LV1/y;->A(Lk3/b;)V

    .line 653
    .line 654
    .line 655
    return-void

    .line 656
    :cond_18
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 657
    .line 658
    .line 659
    return-void
.end method

.method public static W(Lk3/f;Ljava/lang/String;Ls3/j;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p1, ""

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, "."

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    :goto_0
    new-instance v0, LV1/y;

    .line 17
    .line 18
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsInspectorApi.areBuildingsEnabled"

    .line 19
    .line 20
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget-object v2, Ls3/B;->d:Ls3/B;

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 28
    .line 29
    .line 30
    if-eqz p2, :cond_1

    .line 31
    .line 32
    new-instance v1, Ls3/y;

    .line 33
    .line 34
    const/16 v4, 0x18

    .line 35
    .line 36
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 40
    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 44
    .line 45
    .line 46
    :goto_1
    new-instance v0, LV1/y;

    .line 47
    .line 48
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsInspectorApi.areRotateGesturesEnabled"

    .line 49
    .line 50
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 55
    .line 56
    .line 57
    if-eqz p2, :cond_2

    .line 58
    .line 59
    new-instance v1, Ls3/A;

    .line 60
    .line 61
    const/4 v4, 0x7

    .line 62
    invoke-direct {v1, p2, v4}, Ls3/A;-><init>(Ls3/j;I)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 66
    .line 67
    .line 68
    goto :goto_2

    .line 69
    :cond_2
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 70
    .line 71
    .line 72
    :goto_2
    new-instance v0, LV1/y;

    .line 73
    .line 74
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsInspectorApi.areZoomControlsEnabled"

    .line 75
    .line 76
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 81
    .line 82
    .line 83
    if-eqz p2, :cond_3

    .line 84
    .line 85
    new-instance v1, Ls3/A;

    .line 86
    .line 87
    const/16 v4, 0x8

    .line 88
    .line 89
    invoke-direct {v1, p2, v4}, Ls3/A;-><init>(Ls3/j;I)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 93
    .line 94
    .line 95
    goto :goto_3

    .line 96
    :cond_3
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 97
    .line 98
    .line 99
    :goto_3
    new-instance v0, LV1/y;

    .line 100
    .line 101
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsInspectorApi.areScrollGesturesEnabled"

    .line 102
    .line 103
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 108
    .line 109
    .line 110
    if-eqz p2, :cond_4

    .line 111
    .line 112
    new-instance v1, Ls3/A;

    .line 113
    .line 114
    const/16 v4, 0x9

    .line 115
    .line 116
    invoke-direct {v1, p2, v4}, Ls3/A;-><init>(Ls3/j;I)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 120
    .line 121
    .line 122
    goto :goto_4

    .line 123
    :cond_4
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 124
    .line 125
    .line 126
    :goto_4
    new-instance v0, LV1/y;

    .line 127
    .line 128
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsInspectorApi.areTiltGesturesEnabled"

    .line 129
    .line 130
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 135
    .line 136
    .line 137
    if-eqz p2, :cond_5

    .line 138
    .line 139
    new-instance v1, Ls3/y;

    .line 140
    .line 141
    const/16 v4, 0x19

    .line 142
    .line 143
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 147
    .line 148
    .line 149
    goto :goto_5

    .line 150
    :cond_5
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 151
    .line 152
    .line 153
    :goto_5
    new-instance v0, LV1/y;

    .line 154
    .line 155
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsInspectorApi.areZoomGesturesEnabled"

    .line 156
    .line 157
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 162
    .line 163
    .line 164
    if-eqz p2, :cond_6

    .line 165
    .line 166
    new-instance v1, Ls3/y;

    .line 167
    .line 168
    const/16 v4, 0x1a

    .line 169
    .line 170
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 174
    .line 175
    .line 176
    goto :goto_6

    .line 177
    :cond_6
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 178
    .line 179
    .line 180
    :goto_6
    new-instance v0, LV1/y;

    .line 181
    .line 182
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsInspectorApi.isCompassEnabled"

    .line 183
    .line 184
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 189
    .line 190
    .line 191
    if-eqz p2, :cond_7

    .line 192
    .line 193
    new-instance v1, Ls3/y;

    .line 194
    .line 195
    const/16 v4, 0x1b

    .line 196
    .line 197
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 201
    .line 202
    .line 203
    goto :goto_7

    .line 204
    :cond_7
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 205
    .line 206
    .line 207
    :goto_7
    new-instance v0, LV1/y;

    .line 208
    .line 209
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsInspectorApi.isLiteModeEnabled"

    .line 210
    .line 211
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 216
    .line 217
    .line 218
    if-eqz p2, :cond_8

    .line 219
    .line 220
    new-instance v1, Ls3/y;

    .line 221
    .line 222
    const/16 v4, 0x1c

    .line 223
    .line 224
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 225
    .line 226
    .line 227
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 228
    .line 229
    .line 230
    goto :goto_8

    .line 231
    :cond_8
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 232
    .line 233
    .line 234
    :goto_8
    new-instance v0, LV1/y;

    .line 235
    .line 236
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsInspectorApi.isMapToolbarEnabled"

    .line 237
    .line 238
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 243
    .line 244
    .line 245
    if-eqz p2, :cond_9

    .line 246
    .line 247
    new-instance v1, Ls3/y;

    .line 248
    .line 249
    const/16 v4, 0x1d

    .line 250
    .line 251
    invoke-direct {v1, p2, v4}, Ls3/y;-><init>(Ls3/j;I)V

    .line 252
    .line 253
    .line 254
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 255
    .line 256
    .line 257
    goto :goto_9

    .line 258
    :cond_9
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 259
    .line 260
    .line 261
    :goto_9
    new-instance v0, LV1/y;

    .line 262
    .line 263
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsInspectorApi.isMyLocationButtonEnabled"

    .line 264
    .line 265
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 270
    .line 271
    .line 272
    if-eqz p2, :cond_a

    .line 273
    .line 274
    new-instance v1, Ls3/A;

    .line 275
    .line 276
    const/4 v4, 0x0

    .line 277
    invoke-direct {v1, p2, v4}, Ls3/A;-><init>(Ls3/j;I)V

    .line 278
    .line 279
    .line 280
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 281
    .line 282
    .line 283
    goto :goto_a

    .line 284
    :cond_a
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 285
    .line 286
    .line 287
    :goto_a
    new-instance v0, LV1/y;

    .line 288
    .line 289
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsInspectorApi.isTrafficEnabled"

    .line 290
    .line 291
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v1

    .line 295
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 296
    .line 297
    .line 298
    if-eqz p2, :cond_b

    .line 299
    .line 300
    new-instance v1, Ls3/A;

    .line 301
    .line 302
    const/4 v4, 0x1

    .line 303
    invoke-direct {v1, p2, v4}, Ls3/A;-><init>(Ls3/j;I)V

    .line 304
    .line 305
    .line 306
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 307
    .line 308
    .line 309
    goto :goto_b

    .line 310
    :cond_b
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 311
    .line 312
    .line 313
    :goto_b
    new-instance v0, LV1/y;

    .line 314
    .line 315
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsInspectorApi.getTileOverlayInfo"

    .line 316
    .line 317
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object v1

    .line 321
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 322
    .line 323
    .line 324
    if-eqz p2, :cond_c

    .line 325
    .line 326
    new-instance v1, Ls3/A;

    .line 327
    .line 328
    const/4 v4, 0x2

    .line 329
    invoke-direct {v1, p2, v4}, Ls3/A;-><init>(Ls3/j;I)V

    .line 330
    .line 331
    .line 332
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 333
    .line 334
    .line 335
    goto :goto_c

    .line 336
    :cond_c
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 337
    .line 338
    .line 339
    :goto_c
    new-instance v0, LV1/y;

    .line 340
    .line 341
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsInspectorApi.getGroundOverlayInfo"

    .line 342
    .line 343
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object v1

    .line 347
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 348
    .line 349
    .line 350
    if-eqz p2, :cond_d

    .line 351
    .line 352
    new-instance v1, Ls3/A;

    .line 353
    .line 354
    const/4 v4, 0x3

    .line 355
    invoke-direct {v1, p2, v4}, Ls3/A;-><init>(Ls3/j;I)V

    .line 356
    .line 357
    .line 358
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 359
    .line 360
    .line 361
    goto :goto_d

    .line 362
    :cond_d
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 363
    .line 364
    .line 365
    :goto_d
    new-instance v0, LV1/y;

    .line 366
    .line 367
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsInspectorApi.getZoomRange"

    .line 368
    .line 369
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 370
    .line 371
    .line 372
    move-result-object v1

    .line 373
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 374
    .line 375
    .line 376
    if-eqz p2, :cond_e

    .line 377
    .line 378
    new-instance v1, Ls3/A;

    .line 379
    .line 380
    const/4 v4, 0x4

    .line 381
    invoke-direct {v1, p2, v4}, Ls3/A;-><init>(Ls3/j;I)V

    .line 382
    .line 383
    .line 384
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 385
    .line 386
    .line 387
    goto :goto_e

    .line 388
    :cond_e
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 389
    .line 390
    .line 391
    :goto_e
    new-instance v0, LV1/y;

    .line 392
    .line 393
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsInspectorApi.getClusters"

    .line 394
    .line 395
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 396
    .line 397
    .line 398
    move-result-object v1

    .line 399
    invoke-direct {v0, p0, v1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 400
    .line 401
    .line 402
    if-eqz p2, :cond_f

    .line 403
    .line 404
    new-instance v1, Ls3/A;

    .line 405
    .line 406
    const/4 v4, 0x5

    .line 407
    invoke-direct {v1, p2, v4}, Ls3/A;-><init>(Ls3/j;I)V

    .line 408
    .line 409
    .line 410
    invoke-virtual {v0, v1}, LV1/y;->A(Lk3/b;)V

    .line 411
    .line 412
    .line 413
    goto :goto_f

    .line 414
    :cond_f
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 415
    .line 416
    .line 417
    :goto_f
    new-instance v0, LV1/y;

    .line 418
    .line 419
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsInspectorApi.getCameraPosition"

    .line 420
    .line 421
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 422
    .line 423
    .line 424
    move-result-object p1

    .line 425
    invoke-direct {v0, p0, p1, v2, v3}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 426
    .line 427
    .line 428
    if-eqz p2, :cond_10

    .line 429
    .line 430
    new-instance p0, Ls3/A;

    .line 431
    .line 432
    const/4 p1, 0x6

    .line 433
    invoke-direct {p0, p2, p1}, Ls3/A;-><init>(Ls3/j;I)V

    .line 434
    .line 435
    .line 436
    invoke-virtual {v0, p0}, LV1/y;->A(Lk3/b;)V

    .line 437
    .line 438
    .line 439
    return-void

    .line 440
    :cond_10
    invoke-virtual {v0, v3}, LV1/y;->A(Lk3/b;)V

    .line 441
    .line 442
    .line 443
    return-void
.end method


# virtual methods
.method public final A(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 2
    .line 3
    invoke-virtual {v0}, LB2/a;->D()LA0/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    :try_start_0
    iget-object v0, v0, LA0/c;->f:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v0, Ld1/c;

    .line 13
    .line 14
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget v2, LZ0/r;->a:I

    .line 19
    .line 20
    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 21
    .line 22
    .line 23
    const/4 p1, 0x5

    .line 24
    invoke-virtual {v0, v1, p1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :catch_0
    move-exception p1

    .line 29
    new-instance v0, Le1/x;

    .line 30
    .line 31
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    throw v0
.end method

.method public final B(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Ls3/j;->O:Ljava/lang/String;

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0, p1}, Ls3/j;->b0(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final C(Landroidx/lifecycle/q;)V
    .locals 2

    .line 1
    iget-boolean p1, p0, Ls3/j;->r:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p1, p0, Ls3/j;->i:Lc1/f;

    .line 7
    .line 8
    iget-object p1, p1, Lc1/f;->e:Lc1/j;

    .line 9
    .line 10
    iget-object v0, p1, Lc1/j;->a:LB2/a;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    :try_start_0
    iget-object p1, v0, LB2/a;->g:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p1, Ld1/h;

    .line 17
    .line 18
    invoke-virtual {p1}, LY0/a;->c()Landroid/os/Parcel;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/16 v1, 0xd

    .line 23
    .line 24
    invoke-virtual {p1, v0, v1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :catch_0
    move-exception p1

    .line 29
    new-instance v0, Le1/x;

    .line 30
    .line 31
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    throw v0

    .line 35
    :cond_1
    const/4 v0, 0x4

    .line 36
    invoke-virtual {p1, v0}, Lc1/j;->b(I)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final D(Z)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ls3/j;->n:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iput-boolean p1, p0, Ls3/j;->n:Z

    .line 7
    .line 8
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, LB2/a;->D()LA0/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    :try_start_0
    iget-object v0, v0, LA0/c;->f:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v0, Ld1/c;

    .line 22
    .line 23
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget v2, LZ0/r;->a:I

    .line 28
    .line 29
    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 30
    .line 31
    .line 32
    const/4 p1, 0x1

    .line 33
    invoke-virtual {v0, v1, p1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :catch_0
    move-exception p1

    .line 38
    new-instance v0, Le1/x;

    .line 39
    .line 40
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    throw v0

    .line 44
    :cond_1
    :goto_0
    return-void
.end method

.method public final E(Ljava/lang/Float;Ljava/lang/Float;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v0, v0, LB2/a;->f:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Ld1/g;

    .line 9
    .line 10
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/16 v2, 0x5e

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_2

    .line 17
    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    :try_start_1
    iget-object v0, v0, LB2/a;->f:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v0, Ld1/g;

    .line 33
    .line 34
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeFloat(F)V

    .line 39
    .line 40
    .line 41
    const/16 p1, 0x5c

    .line 42
    .line 43
    invoke-virtual {v0, v1, p1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catch_0
    move-exception p1

    .line 48
    new-instance p2, Le1/x;

    .line 49
    .line 50
    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 51
    .line 52
    .line 53
    throw p2

    .line 54
    :cond_0
    :goto_0
    if-eqz p2, :cond_1

    .line 55
    .line 56
    iget-object p1, p0, Ls3/j;->j:LB2/a;

    .line 57
    .line 58
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 63
    .line 64
    .line 65
    :try_start_2
    iget-object p1, p1, LB2/a;->f:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast p1, Ld1/g;

    .line 68
    .line 69
    invoke-virtual {p1}, LY0/a;->c()Landroid/os/Parcel;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeFloat(F)V

    .line 74
    .line 75
    .line 76
    const/16 p2, 0x5d

    .line 77
    .line 78
    invoke-virtual {p1, v0, p2}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_1

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :catch_1
    move-exception p1

    .line 83
    new-instance p2, Le1/x;

    .line 84
    .line 85
    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 86
    .line 87
    .line 88
    throw p2

    .line 89
    :cond_1
    return-void

    .line 90
    :catch_2
    move-exception p1

    .line 91
    new-instance p2, Le1/x;

    .line 92
    .line 93
    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 94
    .line 95
    .line 96
    throw p2
.end method

.method public final F(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Ls3/j;->p:Z

    .line 2
    .line 3
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {v0, p1}, LB2/a;->S(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final G(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 2
    .line 3
    invoke-virtual {v0}, LB2/a;->D()LA0/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    :try_start_0
    iget-object v0, v0, LA0/c;->f:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v0, Ld1/c;

    .line 13
    .line 14
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget v2, LZ0/r;->a:I

    .line 19
    .line 20
    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 21
    .line 22
    .line 23
    const/4 p1, 0x7

    .line 24
    invoke-virtual {v0, v1, p1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :catch_0
    move-exception p1

    .line 29
    new-instance v0, Le1/x;

    .line 30
    .line 31
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    throw v0
.end method

.method public final H()V
    .locals 6

    .line 1
    iget-object v0, p0, Ls3/j;->x:Ls3/g;

    .line 2
    .line 3
    invoke-virtual {v0}, Ls3/g;->H()V

    .line 4
    .line 5
    .line 6
    new-instance v0, LK0/h;

    .line 7
    .line 8
    const/16 v1, 0x11

    .line 9
    .line 10
    invoke-direct {v0, v1}, LK0/h;-><init>(I)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v2, "dev.flutter.pigeon.google_maps_flutter_android.MapsCallbackApi.onCameraIdle"

    .line 16
    .line 17
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v2, p0, Ls3/j;->f:LZ2/s;

    .line 21
    .line 22
    iget-object v3, v2, LZ2/s;->g:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v3, Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    new-instance v3, LV1/y;

    .line 34
    .line 35
    iget-object v2, v2, LZ2/s;->f:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast v2, Lk3/f;

    .line 38
    .line 39
    sget-object v4, Ls3/B;->d:Ls3/B;

    .line 40
    .line 41
    const/4 v5, 0x0

    .line 42
    invoke-direct {v3, v2, v1, v4, v5}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 43
    .line 44
    .line 45
    new-instance v2, LV1/n;

    .line 46
    .line 47
    const/4 v4, 0x5

    .line 48
    invoke-direct {v2, v0, v1, v4}, LV1/n;-><init>(LK0/h;Ljava/lang/String;I)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3, v5, v2}, LV1/y;->v(Ljava/io/Serializable;Lk3/c;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final I(Ls3/M;Ljava/lang/Long;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget v0, p0, Ls3/j;->s:F

    .line 7
    .line 8
    invoke-static {p1, v0}, Landroid/support/v4/media/session/a;->c(Ls3/M;F)LA0/c;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p1, p1, LA0/c;->f:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast p1, LU0/a;

    .line 15
    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 19
    .line 20
    invoke-virtual {p2}, Ljava/lang/Long;->intValue()I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    :try_start_0
    iget-object v0, v0, LB2/a;->f:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast v0, Ld1/g;

    .line 30
    .line 31
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-static {v2, p1}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 39
    .line 40
    .line 41
    invoke-static {v2, v1}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 42
    .line 43
    .line 44
    const/4 p1, 0x7

    .line 45
    invoke-virtual {v0, v2, p1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :catch_0
    move-exception p1

    .line 50
    new-instance p2, Le1/x;

    .line 51
    .line 52
    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    throw p2

    .line 56
    :cond_0
    iget-object p2, p0, Ls3/j;->j:LB2/a;

    .line 57
    .line 58
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 59
    .line 60
    .line 61
    :try_start_1
    iget-object p2, p2, LB2/a;->f:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast p2, Ld1/g;

    .line 64
    .line 65
    invoke-virtual {p2}, LY0/a;->c()Landroid/os/Parcel;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {v0, p1}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 70
    .line 71
    .line 72
    const/4 p1, 0x5

    .line 73
    invoke-virtual {p2, v0, p1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :catch_1
    move-exception p1

    .line 78
    new-instance p2, Le1/x;

    .line 79
    .line 80
    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 81
    .line 82
    .line 83
    throw p2

    .line 84
    :cond_1
    new-instance p1, Ls3/x;

    .line 85
    .line 86
    const-string p2, "GoogleMap uninitialized"

    .line 87
    .line 88
    const-string v0, "animateCamera called prior to map initialization"

    .line 89
    .line 90
    invoke-direct {p1, p2, v0, v1}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    throw p1
.end method

.method public final K(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 3

    .line 1
    iget-object v0, p0, Ls3/j;->x:Ls3/g;

    .line 2
    .line 3
    iget-object v1, v0, Ls3/g;->f:Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Li2/c;

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    iget-object v1, v1, Li2/c;->h:Lj2/d;

    .line 14
    .line 15
    iget-object v0, v0, Ls3/g;->i:LB2/a;

    .line 16
    .line 17
    invoke-virtual {v0}, LB2/a;->x()Lcom/google/android/gms/maps/model/CameraPosition;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget v0, v0, Lcom/google/android/gms/maps/model/CameraPosition;->f:F

    .line 22
    .line 23
    iget-object v1, v1, Lj2/d;->b:Lj2/c;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Lj2/c;->i(F)Ljava/util/Set;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/Set;->size()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 36
    .line 37
    .line 38
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_0

    .line 47
    .line 48
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    check-cast v2, Li2/a;

    .line 53
    .line 54
    invoke-static {p1, v2}, Landroid/support/v4/media/session/a;->e(Ljava/lang/String;Li2/a;)Ls3/Z;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    return-object v1

    .line 63
    :cond_1
    new-instance v0, Ls3/x;

    .line 64
    .line 65
    const-string v1, "getClusters called with invalid clusterManagerId:"

    .line 66
    .line 67
    invoke-static {v1, p1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    const/4 v1, 0x0

    .line 72
    const-string v2, "Invalid clusterManagerId"

    .line 73
    .line 74
    invoke-direct {v0, v2, p1, v1}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    throw v0
.end method

.method public final L(Ljava/lang/String;)Ls3/e0;
    .locals 25

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    iget-object v2, v1, Ls3/j;->D:Ls3/q;

    .line 6
    .line 7
    iget-object v3, v2, Ls3/q;->a:Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    check-cast v3, Ls3/o;

    .line 14
    .line 15
    const/4 v4, 0x0

    .line 16
    if-nez v3, :cond_0

    .line 17
    .line 18
    move-object v3, v4

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v3, v3, Ls3/o;->e:Le1/k;

    .line 21
    .line 22
    :goto_0
    if-nez v3, :cond_1

    .line 23
    .line 24
    return-object v4

    .line 25
    :cond_1
    iget-object v2, v2, Ls3/q;->a:Ljava/util/HashMap;

    .line 26
    .line 27
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Ls3/o;

    .line 32
    .line 33
    const/4 v5, 0x0

    .line 34
    if-nez v2, :cond_2

    .line 35
    .line 36
    move v2, v5

    .line 37
    goto :goto_1

    .line 38
    :cond_2
    iget-boolean v2, v2, Ls3/o;->g:Z

    .line 39
    .line 40
    :goto_1
    const/4 v6, 0x1

    .line 41
    new-array v7, v6, [B

    .line 42
    .line 43
    aput-byte v5, v7, v5

    .line 44
    .line 45
    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    .line 46
    .line 47
    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 48
    .line 49
    .line 50
    move-result-object v10

    .line 51
    new-instance v11, Ls3/H;

    .line 52
    .line 53
    invoke-direct {v11}, Ljava/lang/Object;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v7, v11, Ls3/H;->a:[B

    .line 57
    .line 58
    sget-object v7, Ls3/l0;->f:Ls3/l0;

    .line 59
    .line 60
    iput-object v7, v11, Ls3/H;->b:Ls3/l0;

    .line 61
    .line 62
    iput-object v10, v11, Ls3/H;->c:Ljava/lang/Double;

    .line 63
    .line 64
    iput-object v4, v11, Ls3/H;->d:Ljava/lang/Double;

    .line 65
    .line 66
    iput-object v4, v11, Ls3/H;->e:Ljava/lang/Double;

    .line 67
    .line 68
    new-instance v7, Ls3/C;

    .line 69
    .line 70
    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    .line 71
    .line 72
    .line 73
    iput-object v11, v7, Ls3/C;->a:Ljava/lang/Object;

    .line 74
    .line 75
    iget-object v10, v3, Le1/k;->a:LZ0/A;

    .line 76
    .line 77
    :try_start_0
    move-object v11, v10

    .line 78
    check-cast v11, LZ0/y;

    .line 79
    .line 80
    invoke-virtual {v11}, LY0/a;->c()Landroid/os/Parcel;

    .line 81
    .line 82
    .line 83
    move-result-object v12

    .line 84
    const/4 v13, 0x7

    .line 85
    invoke-virtual {v11, v12, v13}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 86
    .line 87
    .line 88
    move-result-object v11

    .line 89
    invoke-virtual {v11}, Landroid/os/Parcel;->readFloat()F

    .line 90
    .line 91
    .line 92
    move-result v12

    .line 93
    invoke-virtual {v11}, Landroid/os/Parcel;->recycle()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_6

    .line 94
    .line 95
    .line 96
    float-to-double v11, v12

    .line 97
    invoke-static {v11, v12}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 98
    .line 99
    .line 100
    move-result-object v11

    .line 101
    :try_start_1
    move-object v12, v10

    .line 102
    check-cast v12, LZ0/y;

    .line 103
    .line 104
    invoke-virtual {v12}, LY0/a;->c()Landroid/os/Parcel;

    .line 105
    .line 106
    .line 107
    move-result-object v13

    .line 108
    const/16 v14, 0x8

    .line 109
    .line 110
    invoke-virtual {v12, v13, v14}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 111
    .line 112
    .line 113
    move-result-object v12

    .line 114
    invoke-virtual {v12}, Landroid/os/Parcel;->readFloat()F

    .line 115
    .line 116
    .line 117
    move-result v13

    .line 118
    invoke-virtual {v12}, Landroid/os/Parcel;->recycle()V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_5

    .line 119
    .line 120
    .line 121
    float-to-double v12, v13

    .line 122
    invoke-static {v12, v13}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 123
    .line 124
    .line 125
    move-result-object v12

    .line 126
    :try_start_2
    move-object v13, v10

    .line 127
    check-cast v13, LZ0/y;

    .line 128
    .line 129
    invoke-virtual {v13}, LY0/a;->c()Landroid/os/Parcel;

    .line 130
    .line 131
    .line 132
    move-result-object v14

    .line 133
    const/16 v15, 0xc

    .line 134
    .line 135
    invoke-virtual {v13, v14, v15}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 136
    .line 137
    .line 138
    move-result-object v13

    .line 139
    invoke-virtual {v13}, Landroid/os/Parcel;->readFloat()F

    .line 140
    .line 141
    .line 142
    move-result v14

    .line 143
    invoke-virtual {v13}, Landroid/os/Parcel;->recycle()V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_4

    .line 144
    .line 145
    .line 146
    float-to-double v13, v14

    .line 147
    invoke-static {v13, v14}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 148
    .line 149
    .line 150
    move-result-object v13

    .line 151
    :try_start_3
    move-object v14, v10

    .line 152
    check-cast v14, LZ0/y;

    .line 153
    .line 154
    invoke-virtual {v14}, LY0/a;->c()Landroid/os/Parcel;

    .line 155
    .line 156
    .line 157
    move-result-object v15

    .line 158
    const/16 v4, 0x12

    .line 159
    .line 160
    invoke-virtual {v14, v15, v4}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    invoke-virtual {v4}, Landroid/os/Parcel;->readFloat()F

    .line 165
    .line 166
    .line 167
    move-result v14

    .line 168
    invoke-virtual {v4}, Landroid/os/Parcel;->recycle()V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_3

    .line 169
    .line 170
    .line 171
    float-to-double v14, v14

    .line 172
    invoke-static {v14, v15}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 173
    .line 174
    .line 175
    move-result-object v4

    .line 176
    :try_start_4
    move-object v14, v10

    .line 177
    check-cast v14, LZ0/y;

    .line 178
    .line 179
    invoke-virtual {v14}, LY0/a;->c()Landroid/os/Parcel;

    .line 180
    .line 181
    .line 182
    move-result-object v15

    .line 183
    const/16 v5, 0xe

    .line 184
    .line 185
    invoke-virtual {v14, v15, v5}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 186
    .line 187
    .line 188
    move-result-object v5

    .line 189
    invoke-virtual {v5}, Landroid/os/Parcel;->readFloat()F

    .line 190
    .line 191
    .line 192
    move-result v14

    .line 193
    invoke-virtual {v5}, Landroid/os/Parcel;->recycle()V
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_2

    .line 194
    .line 195
    .line 196
    float-to-long v14, v14

    .line 197
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 198
    .line 199
    .line 200
    move-result-object v5

    .line 201
    :try_start_5
    move-object v14, v10

    .line 202
    check-cast v14, LZ0/y;

    .line 203
    .line 204
    invoke-virtual {v14}, LY0/a;->c()Landroid/os/Parcel;

    .line 205
    .line 206
    .line 207
    move-result-object v15

    .line 208
    const/16 v6, 0x10

    .line 209
    .line 210
    invoke-virtual {v14, v15, v6}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 211
    .line 212
    .line 213
    move-result-object v6

    .line 214
    sget v14, LZ0/r;->a:I

    .line 215
    .line 216
    invoke-virtual {v6}, Landroid/os/Parcel;->readInt()I

    .line 217
    .line 218
    .line 219
    move-result v14

    .line 220
    if-eqz v14, :cond_3

    .line 221
    .line 222
    const/4 v14, 0x1

    .line 223
    goto :goto_2

    .line 224
    :cond_3
    const/4 v14, 0x0

    .line 225
    :goto_2
    invoke-virtual {v6}, Landroid/os/Parcel;->recycle()V
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_1

    .line 226
    .line 227
    .line 228
    invoke-static {v14}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 229
    .line 230
    .line 231
    move-result-object v6

    .line 232
    :try_start_6
    check-cast v10, LZ0/y;

    .line 233
    .line 234
    invoke-virtual {v10}, LY0/a;->c()Landroid/os/Parcel;

    .line 235
    .line 236
    .line 237
    move-result-object v14

    .line 238
    const/16 v15, 0x17

    .line 239
    .line 240
    invoke-virtual {v10, v14, v15}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 241
    .line 242
    .line 243
    move-result-object v10

    .line 244
    invoke-virtual {v10}, Landroid/os/Parcel;->readInt()I

    .line 245
    .line 246
    .line 247
    move-result v14

    .line 248
    if-eqz v14, :cond_4

    .line 249
    .line 250
    const/16 v17, 0x1

    .line 251
    .line 252
    goto :goto_3

    .line 253
    :cond_4
    const/16 v17, 0x0

    .line 254
    .line 255
    :goto_3
    invoke-virtual {v10}, Landroid/os/Parcel;->recycle()V
    :try_end_6
    .catch Landroid/os/RemoteException; {:try_start_6 .. :try_end_6} :catch_0

    .line 256
    .line 257
    .line 258
    invoke-static/range {v17 .. v17}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 259
    .line 260
    .line 261
    move-result-object v10

    .line 262
    if-eqz v2, :cond_5

    .line 263
    .line 264
    invoke-virtual {v3}, Le1/k;->a()Lcom/google/android/gms/maps/model/LatLngBounds;

    .line 265
    .line 266
    .line 267
    move-result-object v2

    .line 268
    invoke-static {v2}, Landroid/support/v4/media/session/a;->C(Lcom/google/android/gms/maps/model/LatLngBounds;)Ls3/k0;

    .line 269
    .line 270
    .line 271
    move-result-object v2

    .line 272
    move-object v14, v2

    .line 273
    const/4 v2, 0x0

    .line 274
    goto :goto_4

    .line 275
    :cond_5
    invoke-virtual {v3}, Le1/k;->c()Lcom/google/android/gms/maps/model/LatLng;

    .line 276
    .line 277
    .line 278
    move-result-object v2

    .line 279
    invoke-static {v2}, Landroid/support/v4/media/session/a;->E(Lcom/google/android/gms/maps/model/LatLng;)Ls3/j0;

    .line 280
    .line 281
    .line 282
    move-result-object v2

    .line 283
    const/4 v14, 0x0

    .line 284
    :goto_4
    invoke-virtual {v3}, Le1/k;->c()Lcom/google/android/gms/maps/model/LatLng;

    .line 285
    .line 286
    .line 287
    move-result-object v15

    .line 288
    invoke-virtual {v3}, Le1/k;->a()Lcom/google/android/gms/maps/model/LatLngBounds;

    .line 289
    .line 290
    .line 291
    move-result-object v3

    .line 292
    move-wide/from16 v16, v8

    .line 293
    .line 294
    iget-object v8, v3, Lcom/google/android/gms/maps/model/LatLngBounds;->f:Lcom/google/android/gms/maps/model/LatLng;

    .line 295
    .line 296
    move-object/from16 v18, v10

    .line 297
    .line 298
    iget-wide v9, v8, Lcom/google/android/gms/maps/model/LatLng;->e:D

    .line 299
    .line 300
    iget-object v3, v3, Lcom/google/android/gms/maps/model/LatLngBounds;->e:Lcom/google/android/gms/maps/model/LatLng;

    .line 301
    .line 302
    move-wide/from16 v19, v9

    .line 303
    .line 304
    iget-wide v9, v3, Lcom/google/android/gms/maps/model/LatLng;->e:D

    .line 305
    .line 306
    sub-double v19, v19, v9

    .line 307
    .line 308
    move-wide/from16 v21, v9

    .line 309
    .line 310
    iget-wide v9, v15, Lcom/google/android/gms/maps/model/LatLng;->e:D

    .line 311
    .line 312
    sub-double v9, v9, v21

    .line 313
    .line 314
    div-double v9, v9, v19

    .line 315
    .line 316
    sub-double v9, v16, v9

    .line 317
    .line 318
    move-wide/from16 v16, v9

    .line 319
    .line 320
    iget-wide v9, v3, Lcom/google/android/gms/maps/model/LatLng;->f:D

    .line 321
    .line 322
    move-wide/from16 v19, v9

    .line 323
    .line 324
    iget-wide v8, v8, Lcom/google/android/gms/maps/model/LatLng;->f:D

    .line 325
    .line 326
    cmpg-double v3, v19, v8

    .line 327
    .line 328
    const-wide v21, 0x4076800000000000L    # 360.0

    .line 329
    .line 330
    .line 331
    .line 332
    .line 333
    if-gtz v3, :cond_6

    .line 334
    .line 335
    sub-double v8, v8, v19

    .line 336
    .line 337
    :goto_5
    move-wide/from16 v23, v8

    .line 338
    .line 339
    goto :goto_6

    .line 340
    :cond_6
    sub-double v9, v19, v8

    .line 341
    .line 342
    sub-double v8, v21, v9

    .line 343
    .line 344
    goto :goto_5

    .line 345
    :goto_6
    iget-wide v8, v15, Lcom/google/android/gms/maps/model/LatLng;->f:D

    .line 346
    .line 347
    cmpg-double v3, v8, v19

    .line 348
    .line 349
    if-gez v3, :cond_7

    .line 350
    .line 351
    add-double v8, v8, v21

    .line 352
    .line 353
    :cond_7
    sub-double v8, v8, v19

    .line 354
    .line 355
    div-double v8, v8, v23

    .line 356
    .line 357
    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 358
    .line 359
    .line 360
    move-result-object v3

    .line 361
    invoke-static/range {v16 .. v17}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 362
    .line 363
    .line 364
    move-result-object v8

    .line 365
    new-instance v9, Ls3/c0;

    .line 366
    .line 367
    invoke-direct {v9}, Ljava/lang/Object;-><init>()V

    .line 368
    .line 369
    .line 370
    iput-object v3, v9, Ls3/c0;->a:Ljava/lang/Double;

    .line 371
    .line 372
    iput-object v8, v9, Ls3/c0;->b:Ljava/lang/Double;

    .line 373
    .line 374
    new-instance v3, Ls3/e0;

    .line 375
    .line 376
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 377
    .line 378
    .line 379
    if-eqz v0, :cond_8

    .line 380
    .line 381
    iput-object v0, v3, Ls3/e0;->a:Ljava/lang/String;

    .line 382
    .line 383
    iput-object v7, v3, Ls3/e0;->b:Ls3/C;

    .line 384
    .line 385
    iput-object v2, v3, Ls3/e0;->c:Ls3/j0;

    .line 386
    .line 387
    iput-object v14, v3, Ls3/e0;->d:Ls3/k0;

    .line 388
    .line 389
    iput-object v11, v3, Ls3/e0;->e:Ljava/lang/Double;

    .line 390
    .line 391
    iput-object v12, v3, Ls3/e0;->f:Ljava/lang/Double;

    .line 392
    .line 393
    iput-object v9, v3, Ls3/e0;->g:Ls3/c0;

    .line 394
    .line 395
    iput-object v4, v3, Ls3/e0;->h:Ljava/lang/Double;

    .line 396
    .line 397
    iput-object v13, v3, Ls3/e0;->i:Ljava/lang/Double;

    .line 398
    .line 399
    iput-object v5, v3, Ls3/e0;->j:Ljava/lang/Long;

    .line 400
    .line 401
    iput-object v6, v3, Ls3/e0;->k:Ljava/lang/Boolean;

    .line 402
    .line 403
    move-object/from16 v0, v18

    .line 404
    .line 405
    iput-object v0, v3, Ls3/e0;->l:Ljava/lang/Boolean;

    .line 406
    .line 407
    return-object v3

    .line 408
    :cond_8
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 409
    .line 410
    const-string v2, "Nonnull field \"groundOverlayId\" is null."

    .line 411
    .line 412
    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 413
    .line 414
    .line 415
    throw v0

    .line 416
    :catch_0
    move-exception v0

    .line 417
    new-instance v2, Le1/x;

    .line 418
    .line 419
    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 420
    .line 421
    .line 422
    throw v2

    .line 423
    :catch_1
    move-exception v0

    .line 424
    new-instance v2, Le1/x;

    .line 425
    .line 426
    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 427
    .line 428
    .line 429
    throw v2

    .line 430
    :catch_2
    move-exception v0

    .line 431
    new-instance v2, Le1/x;

    .line 432
    .line 433
    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 434
    .line 435
    .line 436
    throw v2

    .line 437
    :catch_3
    move-exception v0

    .line 438
    new-instance v2, Le1/x;

    .line 439
    .line 440
    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 441
    .line 442
    .line 443
    throw v2

    .line 444
    :catch_4
    move-exception v0

    .line 445
    new-instance v2, Le1/x;

    .line 446
    .line 447
    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 448
    .line 449
    .line 450
    throw v2

    .line 451
    :catch_5
    move-exception v0

    .line 452
    new-instance v2, Le1/x;

    .line 453
    .line 454
    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 455
    .line 456
    .line 457
    throw v2

    .line 458
    :catch_6
    move-exception v0

    .line 459
    new-instance v2, Le1/x;

    .line 460
    .line 461
    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 462
    .line 463
    .line 464
    throw v2
.end method

.method public final M(Ls3/u0;)Ls3/j0;
    .locals 3

    .line 1
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, LB2/a;->C()LE/i;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Landroid/graphics/Point;

    .line 10
    .line 11
    iget-object v2, p1, Ls3/u0;->a:Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {v2}, Ljava/lang/Long;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    iget-object p1, p1, Ls3/u0;->b:Ljava/lang/Long;

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/Long;->intValue()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-direct {v1, v2, p1}, Landroid/graphics/Point;-><init>(II)V

    .line 24
    .line 25
    .line 26
    :try_start_0
    iget-object p1, v0, LE/i;->f:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast p1, Ld1/b;

    .line 29
    .line 30
    new-instance v0, LU0/b;

    .line 31
    .line 32
    invoke-direct {v0, v1}, LU0/b;-><init>(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, LY0/a;->c()Landroid/os/Parcel;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-static {v1, v0}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 40
    .line 41
    .line 42
    const/4 v0, 0x1

    .line 43
    invoke-virtual {p1, v1, v0}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    sget-object v0, Lcom/google/android/gms/maps/model/LatLng;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 48
    .line 49
    invoke-static {p1, v0}, LZ0/r;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Lcom/google/android/gms/maps/model/LatLng;

    .line 54
    .line 55
    invoke-virtual {p1}, Landroid/os/Parcel;->recycle()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    .line 57
    .line 58
    invoke-static {v0}, Landroid/support/v4/media/session/a;->E(Lcom/google/android/gms/maps/model/LatLng;)Ls3/j0;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    return-object p1

    .line 63
    :catch_0
    move-exception p1

    .line 64
    new-instance v0, Le1/x;

    .line 65
    .line 66
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 67
    .line 68
    .line 69
    throw v0

    .line 70
    :cond_0
    new-instance p1, Ls3/x;

    .line 71
    .line 72
    const-string v0, "getLatLng called prior to map initialization"

    .line 73
    .line 74
    const/4 v1, 0x0

    .line 75
    const-string v2, "GoogleMap uninitialized"

    .line 76
    .line 77
    invoke-direct {p1, v2, v0, v1}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    throw p1
.end method

.method public final N(Ls3/j0;)Ls3/u0;
    .locals 3

    .line 1
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, LB2/a;->C()LE/i;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p1}, Landroid/support/v4/media/session/a;->D(Ls3/j0;)Lcom/google/android/gms/maps/model/LatLng;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    :try_start_0
    iget-object v0, v0, LE/i;->f:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, Ld1/b;

    .line 16
    .line 17
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v1, p1}, LZ0/r;->c(Landroid/os/Parcel;Landroid/os/Parcelable;)V

    .line 22
    .line 23
    .line 24
    const/4 p1, 0x2

    .line 25
    invoke-virtual {v0, v1, p1}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, LU0/b;->e(Landroid/os/IBinder;)LU0/a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p1}, Landroid/os/Parcel;->recycle()V

    .line 38
    .line 39
    .line 40
    invoke-static {v0}, LU0/b;->f(LU0/a;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Landroid/graphics/Point;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .line 46
    iget v0, p1, Landroid/graphics/Point;->x:I

    .line 47
    .line 48
    int-to-long v0, v0

    .line 49
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget p1, p1, Landroid/graphics/Point;->y:I

    .line 54
    .line 55
    int-to-long v1, p1

    .line 56
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    new-instance v1, Ls3/u0;

    .line 61
    .line 62
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object v0, v1, Ls3/u0;->a:Ljava/lang/Long;

    .line 66
    .line 67
    iput-object p1, v1, Ls3/u0;->b:Ljava/lang/Long;

    .line 68
    .line 69
    return-object v1

    .line 70
    :catch_0
    move-exception p1

    .line 71
    new-instance v0, Le1/x;

    .line 72
    .line 73
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 74
    .line 75
    .line 76
    throw v0

    .line 77
    :cond_0
    new-instance p1, Ls3/x;

    .line 78
    .line 79
    const-string v0, "getScreenCoordinate called prior to map initialization"

    .line 80
    .line 81
    const/4 v1, 0x0

    .line 82
    const-string v2, "GoogleMap uninitialized"

    .line 83
    .line 84
    invoke-direct {p1, v2, v0, v1}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    throw p1
.end method

.method public final O(Ljava/lang/String;)Ls3/z0;
    .locals 7

    .line 1
    iget-object v0, p0, Ls3/j;->C:Lm/x0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    :goto_0
    move-object p1, v1

    .line 10
    goto :goto_1

    .line 11
    :cond_0
    iget-object v0, v0, Lm/x0;->f:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Ls3/J0;

    .line 20
    .line 21
    if-nez p1, :cond_1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    iget-object p1, p1, Ls3/J0;->e:Le1/C;

    .line 25
    .line 26
    :goto_1
    if-nez p1, :cond_2

    .line 27
    .line 28
    return-object v1

    .line 29
    :cond_2
    :try_start_0
    iget-object p1, p1, Le1/C;->a:LZ0/o;

    .line 30
    .line 31
    move-object v0, p1

    .line 32
    check-cast v0, LZ0/m;

    .line 33
    .line 34
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const/16 v2, 0xb

    .line 39
    .line 40
    invoke-virtual {v0, v1, v2}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    sget v1, LZ0/r;->a:I

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    const/4 v2, 0x0

    .line 51
    const/4 v3, 0x1

    .line 52
    if-eqz v1, :cond_3

    .line 53
    .line 54
    move v1, v3

    .line 55
    goto :goto_2

    .line 56
    :cond_3
    move v1, v2

    .line 57
    :goto_2
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_3

    .line 58
    .line 59
    .line 60
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    :try_start_1
    move-object v1, p1

    .line 65
    check-cast v1, LZ0/m;

    .line 66
    .line 67
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    const/16 v5, 0xd

    .line 72
    .line 73
    invoke-virtual {v1, v4, v5}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v1}, Landroid/os/Parcel;->readFloat()F

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_2

    .line 82
    .line 83
    .line 84
    float-to-double v4, v4

    .line 85
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    :try_start_2
    move-object v4, p1

    .line 90
    check-cast v4, LZ0/m;

    .line 91
    .line 92
    invoke-virtual {v4}, LY0/a;->c()Landroid/os/Parcel;

    .line 93
    .line 94
    .line 95
    move-result-object v5

    .line 96
    const/4 v6, 0x5

    .line 97
    invoke-virtual {v4, v5, v6}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    invoke-virtual {v4}, Landroid/os/Parcel;->readFloat()F

    .line 102
    .line 103
    .line 104
    move-result v5

    .line 105
    invoke-virtual {v4}, Landroid/os/Parcel;->recycle()V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_1

    .line 106
    .line 107
    .line 108
    float-to-double v4, v5

    .line 109
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    :try_start_3
    check-cast p1, LZ0/m;

    .line 114
    .line 115
    invoke-virtual {p1}, LY0/a;->c()Landroid/os/Parcel;

    .line 116
    .line 117
    .line 118
    move-result-object v5

    .line 119
    const/4 v6, 0x7

    .line 120
    invoke-virtual {p1, v5, v6}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 125
    .line 126
    .line 127
    move-result v5

    .line 128
    if-eqz v5, :cond_4

    .line 129
    .line 130
    move v2, v3

    .line 131
    :cond_4
    invoke-virtual {p1}, Landroid/os/Parcel;->recycle()V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_0

    .line 132
    .line 133
    .line 134
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    new-instance v2, Ls3/z0;

    .line 139
    .line 140
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 141
    .line 142
    .line 143
    iput-object p1, v2, Ls3/z0;->a:Ljava/lang/Boolean;

    .line 144
    .line 145
    iput-object v0, v2, Ls3/z0;->b:Ljava/lang/Boolean;

    .line 146
    .line 147
    iput-object v1, v2, Ls3/z0;->c:Ljava/lang/Double;

    .line 148
    .line 149
    iput-object v4, v2, Ls3/z0;->d:Ljava/lang/Double;

    .line 150
    .line 151
    return-object v2

    .line 152
    :catch_0
    move-exception p1

    .line 153
    new-instance v0, Le1/x;

    .line 154
    .line 155
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 156
    .line 157
    .line 158
    throw v0

    .line 159
    :catch_1
    move-exception p1

    .line 160
    new-instance v0, Le1/x;

    .line 161
    .line 162
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 163
    .line 164
    .line 165
    throw v0

    .line 166
    :catch_2
    move-exception p1

    .line 167
    new-instance v0, Le1/x;

    .line 168
    .line 169
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 170
    .line 171
    .line 172
    throw v0

    .line 173
    :catch_3
    move-exception p1

    .line 174
    new-instance v0, Le1/x;

    .line 175
    .line 176
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 177
    .line 178
    .line 179
    throw v0
.end method

.method public final P()Ls3/C0;
    .locals 4

    .line 1
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v0, v0, LB2/a;->f:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Ld1/g;

    .line 9
    .line 10
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v2, 0x3

    .line 15
    invoke-virtual {v0, v1, v2}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Landroid/os/Parcel;->readFloat()F

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1

    .line 24
    .line 25
    .line 26
    float-to-double v0, v1

    .line 27
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v1, p0, Ls3/j;->j:LB2/a;

    .line 32
    .line 33
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    :try_start_1
    iget-object v1, v1, LB2/a;->f:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v1, Ld1/g;

    .line 39
    .line 40
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    const/4 v3, 0x2

    .line 45
    invoke-virtual {v1, v2, v3}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1}, Landroid/os/Parcel;->readFloat()F

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 54
    .line 55
    .line 56
    float-to-double v1, v2

    .line 57
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    new-instance v2, Ls3/C0;

    .line 62
    .line 63
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object v0, v2, Ls3/C0;->a:Ljava/lang/Double;

    .line 67
    .line 68
    iput-object v1, v2, Ls3/C0;->b:Ljava/lang/Double;

    .line 69
    .line 70
    return-object v2

    .line 71
    :catch_0
    move-exception v0

    .line 72
    new-instance v1, Le1/x;

    .line 73
    .line 74
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 75
    .line 76
    .line 77
    throw v1

    .line 78
    :catch_1
    move-exception v0

    .line 79
    new-instance v1, Le1/x;

    .line 80
    .line 81
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 82
    .line 83
    .line 84
    throw v1
.end method

.method public final Q(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ls3/j;->w:Ls3/w;

    .line 2
    .line 3
    iget-object v0, v0, Ls3/w;->b:Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ls3/u;

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    iget-object p1, p1, Ls3/u;->a:Ljava/lang/ref/WeakReference;

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Le1/o;

    .line 20
    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    :try_start_0
    iget-object p1, p1, Le1/o;->a:LZ0/f;

    .line 25
    .line 26
    check-cast p1, LZ0/d;

    .line 27
    .line 28
    invoke-virtual {p1}, LY0/a;->c()Landroid/os/Parcel;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/16 v1, 0xc

    .line 33
    .line 34
    invoke-virtual {p1, v0, v1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :catch_0
    move-exception p1

    .line 39
    new-instance v0, Le1/x;

    .line 40
    .line 41
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 42
    .line 43
    .line 44
    throw v0

    .line 45
    :cond_1
    new-instance p1, Ls3/x;

    .line 46
    .line 47
    const-string v0, "hideInfoWindow called with invalid markerId"

    .line 48
    .line 49
    const/4 v1, 0x0

    .line 50
    const-string v2, "Invalid markerId"

    .line 51
    .line 52
    invoke-direct {p1, v2, v0, v1}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    throw p1
.end method

.method public final R()Ljava/lang/Boolean;
    .locals 8

    .line 1
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_4

    .line 5
    .line 6
    iget-object v2, v0, LB2/a;->g:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v2, LA0/c;

    .line 9
    .line 10
    const/4 v3, 0x1

    .line 11
    if-nez v2, :cond_2

    .line 12
    .line 13
    :try_start_0
    new-instance v2, LA0/c;

    .line 14
    .line 15
    iget-object v4, v0, LB2/a;->f:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v4, Ld1/g;

    .line 18
    .line 19
    invoke-virtual {v4}, LY0/a;->c()Landroid/os/Parcel;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    const/16 v6, 0x6d

    .line 24
    .line 25
    invoke-virtual {v4, v5, v6}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    invoke-virtual {v4}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    sget v6, LZ0/b;->d:I

    .line 34
    .line 35
    const-string v6, "com.google.android.gms.maps.model.internal.IMapCapabilitiesDelegate"

    .line 36
    .line 37
    if-nez v5, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-interface {v5, v6}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    instance-of v7, v1, LZ0/c;

    .line 45
    .line 46
    if-eqz v7, :cond_1

    .line 47
    .line 48
    check-cast v1, LZ0/c;

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    new-instance v1, LZ0/a;

    .line 52
    .line 53
    invoke-direct {v1, v5, v6, v3}, LY0/a;-><init>(Landroid/os/IBinder;Ljava/lang/String;I)V

    .line 54
    .line 55
    .line 56
    :goto_0
    invoke-virtual {v4}, Landroid/os/Parcel;->recycle()V

    .line 57
    .line 58
    .line 59
    invoke-direct {v2, v1}, LA0/c;-><init>(LZ0/c;)V

    .line 60
    .line 61
    .line 62
    iput-object v2, v0, LB2/a;->g:Ljava/lang/Object;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :catch_0
    move-exception v0

    .line 66
    new-instance v1, Le1/x;

    .line 67
    .line 68
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 69
    .line 70
    .line 71
    throw v1

    .line 72
    :cond_2
    :goto_1
    iget-object v0, v0, LB2/a;->g:Ljava/lang/Object;

    .line 73
    .line 74
    check-cast v0, LA0/c;

    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 77
    .line 78
    .line 79
    :try_start_1
    iget-object v0, v0, LA0/c;->f:Ljava/lang/Object;

    .line 80
    .line 81
    check-cast v0, LZ0/c;

    .line 82
    .line 83
    check-cast v0, LZ0/a;

    .line 84
    .line 85
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v0, v1, v3}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    sget v1, LZ0/r;->a:I

    .line 94
    .line 95
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-eqz v1, :cond_3

    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_3
    const/4 v3, 0x0

    .line 103
    :goto_2
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 104
    .line 105
    .line 106
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    return-object v0

    .line 111
    :catch_1
    move-exception v0

    .line 112
    new-instance v1, Le1/x;

    .line 113
    .line 114
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 115
    .line 116
    .line 117
    throw v1

    .line 118
    :cond_4
    new-instance v0, Ls3/x;

    .line 119
    .line 120
    const-string v2, "GoogleMap uninitialized"

    .line 121
    .line 122
    const-string v3, "isAdvancedMarkersAvailable() called prior to map initialization"

    .line 123
    .line 124
    invoke-direct {v0, v2, v3, v1}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 125
    .line 126
    .line 127
    throw v0
.end method

.method public final S(Ls3/M;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v1, p0, Ls3/j;->s:F

    .line 6
    .line 7
    invoke-static {p1, v1}, Landroid/support/v4/media/session/a;->c(Ls3/M;F)LA0/c;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    :try_start_0
    iget-object v0, v0, LB2/a;->f:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Ld1/g;

    .line 17
    .line 18
    iget-object p1, p1, LA0/c;->f:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p1, LU0/a;

    .line 21
    .line 22
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-static {v1, p1}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 27
    .line 28
    .line 29
    const/4 p1, 0x4

    .line 30
    invoke-virtual {v0, v1, p1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :catch_0
    move-exception p1

    .line 35
    new-instance v0, Le1/x;

    .line 36
    .line 37
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 38
    .line 39
    .line 40
    throw v0

    .line 41
    :cond_0
    new-instance p1, Ls3/x;

    .line 42
    .line 43
    const-string v0, "moveCamera called prior to map initialization"

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    const-string v2, "GoogleMap uninitialized"

    .line 47
    .line 48
    invoke-direct {p1, v2, v0, v1}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    throw p1
.end method

.method public final T(Ls3/j;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p1, "GoogleMapController"

    .line 6
    .line 7
    const-string v0, "Controller was disposed before GoogleMap was ready."

    .line 8
    .line 9
    invoke-static {p1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Ls3/j;->x:Ls3/g;

    .line 14
    .line 15
    iput-object p1, v0, Ls3/g;->k:Ls3/j;

    .line 16
    .line 17
    iget-object p1, v0, Ls3/g;->f:Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Ljava/util/Map$Entry;

    .line 38
    .line 39
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Li2/c;

    .line 44
    .line 45
    iget-object v2, v0, Ls3/g;->k:Ls3/j;

    .line 46
    .line 47
    iput-object v0, v1, Li2/c;->o:Ls3/g;

    .line 48
    .line 49
    iget-object v3, v1, Li2/c;->i:Lk2/a;

    .line 50
    .line 51
    invoke-interface {v3, v0}, Lk2/a;->c(Ls3/g;)V

    .line 52
    .line 53
    .line 54
    iput-object v2, v1, Li2/c;->n:Ls3/j;

    .line 55
    .line 56
    iget-object v1, v1, Li2/c;->i:Lk2/a;

    .line 57
    .line 58
    invoke-interface {v1, v2}, Lk2/a;->e(Ls3/j;)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    return-void
.end method

.method public final U(Ls3/j;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p1, "GoogleMapController"

    .line 6
    .line 7
    const-string v0, "Controller was disposed before GoogleMap was ready."

    .line 8
    .line 9
    invoke-static {p1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v1, v0, LB2/a;->f:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v1, Ld1/g;

    .line 16
    .line 17
    const/16 v2, 0x60

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    :try_start_0
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0, v3}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, v0, v2}, LY0/a;->d(Landroid/os/Parcel;I)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    new-instance v4, Lc1/i;

    .line 34
    .line 35
    const/4 v5, 0x6

    .line 36
    invoke-direct {v4, v0, p1, v5}, Lc1/i;-><init>(LB2/a;Ls3/j;I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {v0, v4}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v0, v2}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_8

    .line 47
    .line 48
    .line 49
    :goto_0
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 50
    .line 51
    iget-object v1, v0, LB2/a;->f:Ljava/lang/Object;

    .line 52
    .line 53
    check-cast v1, Ld1/g;

    .line 54
    .line 55
    const/16 v2, 0x61

    .line 56
    .line 57
    if-nez p1, :cond_2

    .line 58
    .line 59
    :try_start_1
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-static {v0, v3}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1, v0, v2}, LY0/a;->d(Landroid/os/Parcel;I)V

    .line 67
    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_2
    new-instance v4, Lc1/i;

    .line 71
    .line 72
    const/4 v5, 0x7

    .line 73
    invoke-direct {v4, v0, p1, v5}, Lc1/i;-><init>(LB2/a;Ls3/j;I)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {v0, v4}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v1, v0, v2}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_7

    .line 84
    .line 85
    .line 86
    :goto_1
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 87
    .line 88
    iget-object v1, v0, LB2/a;->f:Ljava/lang/Object;

    .line 89
    .line 90
    check-cast v1, Ld1/g;

    .line 91
    .line 92
    const/16 v2, 0x63

    .line 93
    .line 94
    if-nez p1, :cond_3

    .line 95
    .line 96
    :try_start_2
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-static {v0, v3}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v1, v0, v2}, LY0/a;->d(Landroid/os/Parcel;I)V

    .line 104
    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_3
    new-instance v4, Lc1/h;

    .line 108
    .line 109
    invoke-direct {v4, v0, p1}, Lc1/h;-><init>(LB2/a;Ls3/j;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-static {v0, v4}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v1, v0, v2}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_6

    .line 120
    .line 121
    .line 122
    :goto_2
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 123
    .line 124
    iget-object v1, v0, LB2/a;->f:Ljava/lang/Object;

    .line 125
    .line 126
    check-cast v1, Ld1/g;

    .line 127
    .line 128
    const/16 v2, 0x55

    .line 129
    .line 130
    if-nez p1, :cond_4

    .line 131
    .line 132
    :try_start_3
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-static {v0, v3}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v1, v0, v2}, LY0/a;->d(Landroid/os/Parcel;I)V

    .line 140
    .line 141
    .line 142
    goto :goto_3

    .line 143
    :cond_4
    new-instance v4, Lc1/i;

    .line 144
    .line 145
    const/4 v5, 0x4

    .line 146
    invoke-direct {v4, v0, p1, v5}, Lc1/i;-><init>(LB2/a;Ls3/j;I)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-static {v0, v4}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v1, v0, v2}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_5

    .line 157
    .line 158
    .line 159
    :goto_3
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 160
    .line 161
    iget-object v1, v0, LB2/a;->f:Ljava/lang/Object;

    .line 162
    .line 163
    check-cast v1, Ld1/g;

    .line 164
    .line 165
    const/16 v2, 0x57

    .line 166
    .line 167
    if-nez p1, :cond_5

    .line 168
    .line 169
    :try_start_4
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-static {v0, v3}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v1, v0, v2}, LY0/a;->d(Landroid/os/Parcel;I)V

    .line 177
    .line 178
    .line 179
    goto :goto_4

    .line 180
    :cond_5
    new-instance v4, Lc1/i;

    .line 181
    .line 182
    const/4 v5, 0x5

    .line 183
    invoke-direct {v4, v0, p1, v5}, Lc1/i;-><init>(LB2/a;Ls3/j;I)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    invoke-static {v0, v4}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v1, v0, v2}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_4

    .line 194
    .line 195
    .line 196
    :goto_4
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 197
    .line 198
    iget-object v1, v0, LB2/a;->f:Ljava/lang/Object;

    .line 199
    .line 200
    check-cast v1, Ld1/g;

    .line 201
    .line 202
    const/16 v2, 0x59

    .line 203
    .line 204
    if-nez p1, :cond_6

    .line 205
    .line 206
    :try_start_5
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    invoke-static {v0, v3}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {v1, v0, v2}, LY0/a;->d(Landroid/os/Parcel;I)V

    .line 214
    .line 215
    .line 216
    goto :goto_5

    .line 217
    :cond_6
    new-instance v4, Lc1/i;

    .line 218
    .line 219
    const/4 v5, 0x3

    .line 220
    invoke-direct {v4, v0, p1, v5}, Lc1/i;-><init>(LB2/a;Ls3/j;I)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    invoke-static {v0, v4}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 228
    .line 229
    .line 230
    invoke-virtual {v1, v0, v2}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_3

    .line 231
    .line 232
    .line 233
    :goto_5
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 234
    .line 235
    iget-object v1, v0, LB2/a;->f:Ljava/lang/Object;

    .line 236
    .line 237
    check-cast v1, Ld1/g;

    .line 238
    .line 239
    const/16 v2, 0x1c

    .line 240
    .line 241
    if-nez p1, :cond_7

    .line 242
    .line 243
    :try_start_6
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    invoke-static {v0, v3}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 248
    .line 249
    .line 250
    invoke-virtual {v1, v0, v2}, LY0/a;->d(Landroid/os/Parcel;I)V

    .line 251
    .line 252
    .line 253
    goto :goto_6

    .line 254
    :cond_7
    new-instance v4, Lc1/i;

    .line 255
    .line 256
    const/16 v5, 0x8

    .line 257
    .line 258
    invoke-direct {v4, v0, p1, v5}, Lc1/i;-><init>(LB2/a;Ls3/j;I)V

    .line 259
    .line 260
    .line 261
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    invoke-static {v0, v4}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 266
    .line 267
    .line 268
    invoke-virtual {v1, v0, v2}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_6
    .catch Landroid/os/RemoteException; {:try_start_6 .. :try_end_6} :catch_2

    .line 269
    .line 270
    .line 271
    :goto_6
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 272
    .line 273
    iget-object v1, v0, LB2/a;->f:Ljava/lang/Object;

    .line 274
    .line 275
    check-cast v1, Ld1/g;

    .line 276
    .line 277
    const/16 v2, 0x1d

    .line 278
    .line 279
    if-nez p1, :cond_8

    .line 280
    .line 281
    :try_start_7
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    invoke-static {v0, v3}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {v1, v0, v2}, LY0/a;->d(Landroid/os/Parcel;I)V

    .line 289
    .line 290
    .line 291
    goto :goto_7

    .line 292
    :cond_8
    new-instance v4, Lc1/i;

    .line 293
    .line 294
    const/4 v5, 0x0

    .line 295
    invoke-direct {v4, v0, p1, v5}, Lc1/i;-><init>(LB2/a;Ls3/j;I)V

    .line 296
    .line 297
    .line 298
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    invoke-static {v0, v4}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 303
    .line 304
    .line 305
    invoke-virtual {v1, v0, v2}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_7
    .catch Landroid/os/RemoteException; {:try_start_7 .. :try_end_7} :catch_1

    .line 306
    .line 307
    .line 308
    :goto_7
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 309
    .line 310
    iget-object v1, v0, LB2/a;->f:Ljava/lang/Object;

    .line 311
    .line 312
    check-cast v1, Ld1/g;

    .line 313
    .line 314
    const/16 v2, 0x53

    .line 315
    .line 316
    if-nez p1, :cond_9

    .line 317
    .line 318
    :try_start_8
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 319
    .line 320
    .line 321
    move-result-object p1

    .line 322
    invoke-static {p1, v3}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 323
    .line 324
    .line 325
    invoke-virtual {v1, p1, v2}, LY0/a;->d(Landroid/os/Parcel;I)V

    .line 326
    .line 327
    .line 328
    return-void

    .line 329
    :cond_9
    new-instance v3, Lc1/i;

    .line 330
    .line 331
    const/4 v4, 0x2

    .line 332
    invoke-direct {v3, v0, p1, v4}, Lc1/i;-><init>(LB2/a;Ls3/j;I)V

    .line 333
    .line 334
    .line 335
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 336
    .line 337
    .line 338
    move-result-object p1

    .line 339
    invoke-static {p1, v3}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 340
    .line 341
    .line 342
    invoke-virtual {v1, p1, v2}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_8
    .catch Landroid/os/RemoteException; {:try_start_8 .. :try_end_8} :catch_0

    .line 343
    .line 344
    .line 345
    return-void

    .line 346
    :catch_0
    move-exception p1

    .line 347
    new-instance v0, Le1/x;

    .line 348
    .line 349
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 350
    .line 351
    .line 352
    throw v0

    .line 353
    :catch_1
    move-exception p1

    .line 354
    new-instance v0, Le1/x;

    .line 355
    .line 356
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 357
    .line 358
    .line 359
    throw v0

    .line 360
    :catch_2
    move-exception p1

    .line 361
    new-instance v0, Le1/x;

    .line 362
    .line 363
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 364
    .line 365
    .line 366
    throw v0

    .line 367
    :catch_3
    move-exception p1

    .line 368
    new-instance v0, Le1/x;

    .line 369
    .line 370
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 371
    .line 372
    .line 373
    throw v0

    .line 374
    :catch_4
    move-exception p1

    .line 375
    new-instance v0, Le1/x;

    .line 376
    .line 377
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 378
    .line 379
    .line 380
    throw v0

    .line 381
    :catch_5
    move-exception p1

    .line 382
    new-instance v0, Le1/x;

    .line 383
    .line 384
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 385
    .line 386
    .line 387
    throw v0

    .line 388
    :catch_6
    move-exception p1

    .line 389
    new-instance v0, Le1/x;

    .line 390
    .line 391
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 392
    .line 393
    .line 394
    throw v0

    .line 395
    :catch_7
    move-exception p1

    .line 396
    new-instance v0, Le1/x;

    .line 397
    .line 398
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 399
    .line 400
    .line 401
    throw v0

    .line 402
    :catch_8
    move-exception p1

    .line 403
    new-instance v0, Le1/x;

    .line 404
    .line 405
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 406
    .line 407
    .line 408
    throw v0
.end method

.method public final X(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ls3/j;->A:Ls3/d;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ls3/d;->a(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, v0, Ls3/d;->a:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ls3/Y;

    .line 23
    .line 24
    iget-object v2, v1, Ls3/Y;->i:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Ls3/b;

    .line 31
    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    invoke-static {v1, v2}, Landroid/support/v4/media/session/a;->t(Ls3/Y;Ls3/c;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    :cond_2
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 43
    .line 44
    .line 45
    move-result p3

    .line 46
    if-eqz p3, :cond_3

    .line 47
    .line 48
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    check-cast p3, Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p1, p3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    check-cast p3, Ls3/b;

    .line 59
    .line 60
    if-eqz p3, :cond_2

    .line 61
    .line 62
    iget-object v1, p3, Ls3/b;->a:Le1/f;

    .line 63
    .line 64
    :try_start_0
    iget-object v1, v1, Le1/f;->a:LZ0/x;

    .line 65
    .line 66
    check-cast v1, LZ0/v;

    .line 67
    .line 68
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    const/4 v3, 0x1

    .line 73
    invoke-virtual {v1, v2, v3}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    .line 75
    .line 76
    iget-object v1, v0, Ls3/d;->b:Ljava/util/HashMap;

    .line 77
    .line 78
    iget-object p3, p3, Ls3/b;->b:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v1, p3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :catch_0
    move-exception p1

    .line 85
    new-instance p2, Le1/x;

    .line 86
    .line 87
    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 88
    .line 89
    .line 90
    throw p2

    .line 91
    :cond_3
    return-void
.end method

.method public final Y(Ljava/util/List;Ljava/util/List;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ls3/j;->x:Ls3/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ls3/g;->a(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-eqz p2, :cond_1

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    check-cast p2, Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, v0, Ls3/g;->f:Ljava/util/HashMap;

    .line 23
    .line 24
    invoke-virtual {v1, p2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    check-cast p2, Li2/c;

    .line 29
    .line 30
    if-nez p2, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 v1, 0x0

    .line 34
    iput-object v1, p2, Li2/c;->o:Ls3/g;

    .line 35
    .line 36
    iget-object v2, p2, Li2/c;->i:Lk2/a;

    .line 37
    .line 38
    invoke-interface {v2, v1}, Lk2/a;->c(Ls3/g;)V

    .line 39
    .line 40
    .line 41
    iput-object v1, p2, Li2/c;->n:Ls3/j;

    .line 42
    .line 43
    iget-object v2, p2, Li2/c;->i:Lk2/a;

    .line 44
    .line 45
    invoke-interface {v2, v1}, Lk2/a;->e(Ls3/j;)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p2, Li2/c;->h:Lj2/d;

    .line 49
    .line 50
    iget-object v2, v1, LS/b;->a:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast v2, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 53
    .line 54
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 59
    .line 60
    .line 61
    :try_start_0
    invoke-virtual {v1}, Lj2/d;->h()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1}, LS/b;->g()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p2}, Li2/c;->a()V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :catchall_0
    move-exception p1

    .line 72
    invoke-virtual {v1}, LS/b;->g()V

    .line 73
    .line 74
    .line 75
    throw p1

    .line 76
    :cond_1
    return-void
.end method

.method public final Z(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ls3/j;->D:Ls3/q;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ls3/q;->a(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, v0, Ls3/q;->a:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ls3/e0;

    .line 23
    .line 24
    iget-object v2, v1, Ls3/e0;->a:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Ls3/o;

    .line 31
    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    iget-object v3, v0, Ls3/q;->e:Landroid/content/res/AssetManager;

    .line 35
    .line 36
    iget v4, v0, Ls3/q;->f:F

    .line 37
    .line 38
    iget-object v5, v0, Ls3/q;->g:LN1/e;

    .line 39
    .line 40
    invoke-static {v1, v2, v3, v4, v5}, Landroid/support/v4/media/session/a;->u(Ls3/e0;Ls3/p;Landroid/content/res/AssetManager;FLN1/e;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    :cond_2
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 49
    .line 50
    .line 51
    move-result p3

    .line 52
    if-eqz p3, :cond_3

    .line 53
    .line 54
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    check-cast p3, Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p1, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    check-cast v1, Ls3/o;

    .line 65
    .line 66
    if-eqz v1, :cond_2

    .line 67
    .line 68
    iget-object v2, v1, Ls3/o;->e:Le1/k;

    .line 69
    .line 70
    :try_start_0
    iget-object v2, v2, Le1/k;->a:LZ0/A;

    .line 71
    .line 72
    check-cast v2, LZ0/y;

    .line 73
    .line 74
    invoke-virtual {v2}, LY0/a;->c()Landroid/os/Parcel;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    const/4 v4, 0x1

    .line 79
    invoke-virtual {v2, v3, v4}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1, p3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    iget-object p3, v0, Ls3/q;->b:Ljava/util/HashMap;

    .line 86
    .line 87
    iget-object v1, v1, Ls3/o;->f:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {p3, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    goto :goto_1

    .line 93
    :catch_0
    move-exception p1

    .line 94
    new-instance p2, Le1/x;

    .line 95
    .line 96
    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 97
    .line 98
    .line 99
    throw p2

    .line 100
    :cond_3
    return-void
.end method

.method public final a()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ls3/j;->r:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_3

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ls3/j;->r:Z

    .line 8
    .line 9
    iget v0, p0, Ls3/j;->e:I

    .line 10
    .line 11
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v2, p0, Ls3/j;->g:Lk3/f;

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    invoke-static {v2, v1, v3}, Ls3/j;->V(Lk3/f;Ljava/lang/String;Ls3/j;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v2, v0, v3}, Ls3/j;->W(Lk3/f;Ljava/lang/String;Ls3/j;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v3}, Ls3/j;->U(Ls3/j;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 32
    .line 33
    const-string v1, "Controller was disposed before GoogleMap was ready."

    .line 34
    .line 35
    const-string v2, "GoogleMapController"

    .line 36
    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    invoke-static {v2, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    iget-object v0, p0, Ls3/j;->F:Ll2/a;

    .line 44
    .line 45
    iput-object v3, v0, Ll2/a;->e:Lc1/d;

    .line 46
    .line 47
    iput-object v3, v0, Ll2/a;->f:Ls3/j;

    .line 48
    .line 49
    iput-object v3, v0, Ll2/a;->c:Lc1/b;

    .line 50
    .line 51
    :goto_0
    invoke-virtual {p0, v3}, Ls3/j;->T(Ls3/j;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 55
    .line 56
    if-nez v0, :cond_2

    .line 57
    .line 58
    invoke-static {v2, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    iget-object v0, p0, Ls3/j;->x:Ls3/g;

    .line 63
    .line 64
    iput-object v3, v0, Ls3/g;->l:Ls3/j;

    .line 65
    .line 66
    :goto_1
    iget-object v0, p0, Ls3/j;->i:Lc1/f;

    .line 67
    .line 68
    if-nez v0, :cond_3

    .line 69
    .line 70
    goto :goto_2

    .line 71
    :cond_3
    invoke-virtual {v0}, Lc1/f;->b()V

    .line 72
    .line 73
    .line 74
    iput-object v3, p0, Ls3/j;->i:Lc1/f;

    .line 75
    .line 76
    :goto_2
    iget-object v0, p0, Ls3/j;->v:Lj3/b;

    .line 77
    .line 78
    iget-object v0, v0, Lj3/b;->f:Ljava/lang/Object;

    .line 79
    .line 80
    check-cast v0, Ls3/n;

    .line 81
    .line 82
    iget-object v0, v0, Ls3/n;->e:Landroidx/lifecycle/l;

    .line 83
    .line 84
    if-eqz v0, :cond_4

    .line 85
    .line 86
    invoke-virtual {v0, p0}, Landroidx/lifecycle/l;->b(Landroidx/lifecycle/p;)V

    .line 87
    .line 88
    .line 89
    :cond_4
    :goto_3
    return-void
.end method

.method public final a0(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ls3/j;->B:Ll2/b;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll2/b;->b(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, v0, Ll2/b;->e:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ls3/f0;

    .line 23
    .line 24
    iget-object v1, v0, Ls3/f0;->a:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ls3/r;

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-static {v0, v1}, Landroid/support/v4/media/session/a;->v(Ls3/f0;Ls3/s;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    iget-object v0, v1, Ls3/r;->f:Le1/C;

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    :try_start_0
    iget-object v0, v0, Le1/C;->a:LZ0/o;

    .line 43
    .line 44
    check-cast v0, LZ0/m;

    .line 45
    .line 46
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const/4 v2, 0x2

    .line 51
    invoke-virtual {v0, v1, v2}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :catch_0
    move-exception p1

    .line 56
    new-instance p2, Le1/x;

    .line 57
    .line 58
    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 59
    .line 60
    .line 61
    throw p2

    .line 62
    :cond_1
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    :cond_2
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 67
    .line 68
    .line 69
    move-result p3

    .line 70
    if-eqz p3, :cond_3

    .line 71
    .line 72
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p3

    .line 76
    check-cast p3, Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {p1, p3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Ls3/r;

    .line 83
    .line 84
    if-eqz v0, :cond_2

    .line 85
    .line 86
    iget-object v0, v0, Ls3/r;->f:Le1/C;

    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 89
    .line 90
    .line 91
    :try_start_1
    iget-object v0, v0, Le1/C;->a:LZ0/o;

    .line 92
    .line 93
    check-cast v0, LZ0/m;

    .line 94
    .line 95
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    const/4 v2, 0x1

    .line 100
    invoke-virtual {v0, v1, v2}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 101
    .line 102
    .line 103
    invoke-virtual {p1, p3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    goto :goto_1

    .line 107
    :catch_1
    move-exception p1

    .line 108
    new-instance p2, Le1/x;

    .line 109
    .line 110
    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 111
    .line 112
    .line 113
    throw p2

    .line 114
    :cond_3
    return-void
.end method

.method public final b(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v0, v0, LB2/a;->f:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Ld1/g;

    .line 9
    .line 10
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 15
    .line 16
    .line 17
    const/16 p1, 0x10

    .line 18
    .line 19
    invoke-virtual {v0, v1, p1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :catch_0
    move-exception p1

    .line 24
    new-instance v0, Le1/x;

    .line 25
    .line 26
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    throw v0
.end method

.method public final b0(Ljava/lang/String;)Z
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v0, Le1/n;

    .line 11
    .line 12
    invoke-direct {v0, p1}, Le1/n;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 17
    :goto_1
    iget-object p1, p0, Ls3/j;->j:LB2/a;

    .line 18
    .line 19
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    :try_start_0
    iget-object p1, p1, LB2/a;->f:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast p1, Ld1/g;

    .line 25
    .line 26
    invoke-virtual {p1}, LY0/a;->c()Landroid/os/Parcel;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {v1, v0}, LZ0/r;->c(Landroid/os/Parcel;Landroid/os/Parcelable;)V

    .line 31
    .line 32
    .line 33
    const/16 v0, 0x5b

    .line 34
    .line 35
    invoke-virtual {p1, v1, v0}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    const/4 v0, 0x1

    .line 46
    goto :goto_2

    .line 47
    :cond_2
    const/4 v0, 0x0

    .line 48
    :goto_2
    invoke-virtual {p1}, Landroid/os/Parcel;->recycle()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    .line 50
    .line 51
    iput-boolean v0, p0, Ls3/j;->P:Z

    .line 52
    .line 53
    return v0

    .line 54
    :catch_0
    move-exception p1

    .line 55
    new-instance v0, Le1/x;

    .line 56
    .line 57
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 58
    .line 59
    .line 60
    throw v0
.end method

.method public final c(FFFF)V
    .locals 2

    .line 1
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v1, p0, Ls3/j;->s:F

    .line 6
    .line 7
    mul-float/2addr p2, v1

    .line 8
    float-to-int p2, p2

    .line 9
    mul-float/2addr p1, v1

    .line 10
    float-to-int p1, p1

    .line 11
    mul-float/2addr p4, v1

    .line 12
    float-to-int p4, p4

    .line 13
    mul-float/2addr p3, v1

    .line 14
    float-to-int p3, p3

    .line 15
    :try_start_0
    iget-object v0, v0, LB2/a;->f:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Ld1/g;

    .line 18
    .line 19
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, p4}, Landroid/os/Parcel;->writeInt(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, p3}, Landroid/os/Parcel;->writeInt(I)V

    .line 33
    .line 34
    .line 35
    const/16 p1, 0x27

    .line 36
    .line 37
    invoke-virtual {v0, v1, p1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :catch_0
    move-exception p1

    .line 42
    new-instance p2, Le1/x;

    .line 43
    .line 44
    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    throw p2

    .line 48
    :cond_0
    iget-object v0, p0, Ls3/j;->Q:Ljava/util/ArrayList;

    .line 49
    .line 50
    if-nez v0, :cond_1

    .line 51
    .line 52
    new-instance v0, Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 55
    .line 56
    .line 57
    iput-object v0, p0, Ls3/j;->Q:Ljava/util/ArrayList;

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 61
    .line 62
    .line 63
    :goto_0
    iget-object v0, p0, Ls3/j;->Q:Ljava/util/ArrayList;

    .line 64
    .line 65
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Ls3/j;->Q:Ljava/util/ArrayList;

    .line 73
    .line 74
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Ls3/j;->Q:Ljava/util/ArrayList;

    .line 82
    .line 83
    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Ls3/j;->Q:Ljava/util/ArrayList;

    .line 91
    .line 92
    invoke-static {p4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public final c0(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ls3/j;->w:Ls3/w;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ls3/p0;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ls3/w;->a(Ls3/p0;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    :cond_1
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-eqz p2, :cond_4

    .line 35
    .line 36
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    check-cast p2, Ls3/p0;

    .line 41
    .line 42
    iget-object v1, v0, Ls3/w;->i:LN1/e;

    .line 43
    .line 44
    iget v2, v0, Ls3/w;->h:F

    .line 45
    .line 46
    iget-object v3, v0, Ls3/w;->g:Landroid/content/res/AssetManager;

    .line 47
    .line 48
    iget-object v4, p2, Ls3/p0;->l:Ljava/lang/String;

    .line 49
    .line 50
    iget-object v5, v0, Ls3/w;->a:Ljava/util/HashMap;

    .line 51
    .line 52
    invoke-virtual {v5, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    check-cast v5, Ls3/t;

    .line 57
    .line 58
    if-nez v5, :cond_2

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    iget-object v6, p2, Ls3/p0;->m:Ljava/lang/String;

    .line 62
    .line 63
    iget-object v7, v5, Ls3/t;->c:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v6, v7}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v6

    .line 69
    if-nez v6, :cond_3

    .line 70
    .line 71
    invoke-virtual {v0, v4}, Ls3/w;->c(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, p2}, Ls3/w;->a(Ls3/p0;)V

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    invoke-static {p2, v5, v3, v2, v1}, Landroid/support/v4/media/session/a;->x(Ls3/p0;Ls3/v;Landroid/content/res/AssetManager;FLN1/e;)V

    .line 79
    .line 80
    .line 81
    iget-object v5, v0, Ls3/w;->b:Ljava/util/HashMap;

    .line 82
    .line 83
    invoke-virtual {v5, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    check-cast v4, Ls3/u;

    .line 88
    .line 89
    if-eqz v4, :cond_1

    .line 90
    .line 91
    invoke-static {p2, v4, v3, v2, v1}, Landroid/support/v4/media/session/a;->x(Ls3/p0;Ls3/v;Landroid/content/res/AssetManager;FLN1/e;)V

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_4
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 100
    .line 101
    .line 102
    move-result p2

    .line 103
    if-eqz p2, :cond_5

    .line 104
    .line 105
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    check-cast p2, Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {v0, p2}, Ls3/w;->c(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    goto :goto_2

    .line 115
    :cond_5
    return-void
.end method

.method public final d(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ls3/j;->q:Z

    .line 2
    .line 3
    return-void
.end method

.method public final d0()V
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {}, Landroid/os/Process;->myUid()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Ls3/j;->u:Landroid/content/Context;

    .line 10
    .line 11
    const-string v3, "android.permission.ACCESS_FINE_LOCATION"

    .line 12
    .line 13
    invoke-virtual {v2, v3, v0, v1}, Landroid/content/Context;->checkPermission(Ljava/lang/String;II)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-static {}, Landroid/os/Process;->myUid()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const-string v3, "android.permission.ACCESS_COARSE_LOCATION"

    .line 28
    .line 29
    invoke-virtual {v2, v3, v0, v1}, Landroid/content/Context;->checkPermission(Ljava/lang/String;II)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const-string v0, "GoogleMapController"

    .line 37
    .line 38
    const-string v1, "Cannot enable MyLocation layer as location permissions are not granted"

    .line 39
    .line 40
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    :goto_0
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 45
    .line 46
    iget-boolean v1, p0, Ls3/j;->l:Z

    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    :try_start_0
    iget-object v0, v0, LB2/a;->f:Ljava/lang/Object;

    .line 52
    .line 53
    check-cast v0, Ld1/g;

    .line 54
    .line 55
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    sget v3, LZ0/r;->a:I

    .line 60
    .line 61
    invoke-virtual {v2, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 62
    .line 63
    .line 64
    const/16 v1, 0x16

    .line 65
    .line 66
    invoke-virtual {v0, v2, v1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 70
    .line 71
    invoke-virtual {v0}, LB2/a;->D()LA0/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iget-boolean v1, p0, Ls3/j;->m:Z

    .line 76
    .line 77
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 78
    .line 79
    .line 80
    :try_start_1
    iget-object v0, v0, LA0/c;->f:Ljava/lang/Object;

    .line 81
    .line 82
    check-cast v0, Ld1/c;

    .line 83
    .line 84
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {v2, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 89
    .line 90
    .line 91
    const/4 v1, 0x3

    .line 92
    invoke-virtual {v0, v2, v1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :catch_0
    move-exception v0

    .line 97
    new-instance v1, Le1/x;

    .line 98
    .line 99
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 100
    .line 101
    .line 102
    throw v1

    .line 103
    :catch_1
    move-exception v0

    .line 104
    new-instance v1, Le1/x;

    .line 105
    .line 106
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 107
    .line 108
    .line 109
    throw v1
.end method

.method public final e(Le1/o;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Le1/o;->a()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ls3/j;->w:Ls3/w;

    .line 6
    .line 7
    iget-object v1, v0, Ls3/w;->c:Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Ljava/lang/String;

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object v0, v0, Ls3/w;->d:LZ2/s;

    .line 19
    .line 20
    new-instance v1, LK0/h;

    .line 21
    .line 22
    const/16 v2, 0x11

    .line 23
    .line 24
    invoke-direct {v1, v2}, LK0/h;-><init>(I)V

    .line 25
    .line 26
    .line 27
    new-instance v2, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v3, "dev.flutter.pigeon.google_maps_flutter_android.MapsCallbackApi.onInfoWindowTap"

    .line 30
    .line 31
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object v3, v0, LZ2/s;->g:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v3, Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    new-instance v3, LV1/y;

    .line 46
    .line 47
    iget-object v0, v0, LZ2/s;->f:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast v0, Lk3/f;

    .line 50
    .line 51
    sget-object v4, Ls3/B;->d:Ls3/B;

    .line 52
    .line 53
    const/4 v5, 0x0

    .line 54
    invoke-direct {v3, v0, v2, v4, v5}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 55
    .line 56
    .line 57
    new-instance v0, Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 64
    .line 65
    .line 66
    new-instance p1, LV1/n;

    .line 67
    .line 68
    const/4 v4, 0x7

    .line 69
    invoke-direct {p1, v1, v2, v4}, LV1/n;-><init>(LK0/h;Ljava/lang/String;I)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v3, v0, p1}, LV1/y;->v(Ljava/io/Serializable;Lk3/c;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final e0(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ls3/j;->y:Ls3/d;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ls3/d;->b(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, v0, Ls3/d;->a:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ls3/v0;

    .line 23
    .line 24
    iget-object v2, v1, Ls3/v0;->a:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Ls3/E0;

    .line 31
    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    invoke-static {v1, v2}, Landroid/support/v4/media/session/a;->y(Ls3/v0;Ls3/F0;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    :cond_2
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 43
    .line 44
    .line 45
    move-result p3

    .line 46
    if-eqz p3, :cond_3

    .line 47
    .line 48
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    check-cast p3, Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p1, p3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    check-cast p3, Ls3/E0;

    .line 59
    .line 60
    if-eqz p3, :cond_2

    .line 61
    .line 62
    iget-object v1, p3, Ls3/E0;->a:Le1/t;

    .line 63
    .line 64
    :try_start_0
    iget-object v1, v1, Le1/t;->a:LZ0/i;

    .line 65
    .line 66
    check-cast v1, LZ0/g;

    .line 67
    .line 68
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    const/4 v3, 0x1

    .line 73
    invoke-virtual {v1, v2, v3}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    .line 75
    .line 76
    iget-object v1, v0, Ls3/d;->b:Ljava/util/HashMap;

    .line 77
    .line 78
    iget-object p3, p3, Ls3/E0;->b:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v1, p3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :catch_0
    move-exception p1

    .line 85
    new-instance p2, Le1/x;

    .line 86
    .line 87
    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 88
    .line 89
    .line 90
    throw p2

    .line 91
    :cond_3
    return-void
.end method

.method public final f(Landroidx/lifecycle/q;)V
    .locals 2

    .line 1
    iget-boolean p1, p0, Ls3/j;->r:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p1, p0, Ls3/j;->i:Lc1/f;

    .line 7
    .line 8
    iget-object p1, p1, Lc1/f;->e:Lc1/j;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    new-instance v0, LU0/e;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-direct {v0, p1, v1}, LU0/e;-><init>(Lc1/j;I)V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {p1, v1, v0}, Lc1/j;->c(Landroid/os/Bundle;LU0/f;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final f0(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ls3/j;->z:Ls3/I0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ls3/I0;->a(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, v0, Ls3/I0;->a:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ls3/w0;

    .line 23
    .line 24
    iget-object v2, v1, Ls3/w0;->a:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Ls3/G0;

    .line 31
    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    iget-object v3, v0, Ls3/I0;->f:Landroid/content/res/AssetManager;

    .line 35
    .line 36
    iget v4, v0, Ls3/I0;->e:F

    .line 37
    .line 38
    invoke-static {v1, v2, v3, v4}, Landroid/support/v4/media/session/a;->z(Ls3/w0;Ls3/H0;Landroid/content/res/AssetManager;F)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    :cond_2
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 47
    .line 48
    .line 49
    move-result p3

    .line 50
    if-eqz p3, :cond_3

    .line 51
    .line 52
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p3

    .line 56
    check-cast p3, Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {p1, p3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    check-cast p3, Ls3/G0;

    .line 63
    .line 64
    if-eqz p3, :cond_2

    .line 65
    .line 66
    iget-object v1, p3, Ls3/G0;->a:Le1/v;

    .line 67
    .line 68
    :try_start_0
    iget-object v1, v1, Le1/v;->a:LZ0/l;

    .line 69
    .line 70
    check-cast v1, LZ0/j;

    .line 71
    .line 72
    invoke-virtual {v1}, LY0/a;->c()Landroid/os/Parcel;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    const/4 v3, 0x1

    .line 77
    invoke-virtual {v1, v2, v3}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    .line 79
    .line 80
    iget-object v1, v0, Ls3/I0;->b:Ljava/util/HashMap;

    .line 81
    .line 82
    iget-object p3, p3, Ls3/G0;->b:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v1, p3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :catch_0
    move-exception p1

    .line 89
    new-instance p2, Le1/x;

    .line 90
    .line 91
    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 92
    .line 93
    .line 94
    throw p2

    .line 95
    :cond_3
    return-void
.end method

.method public final g(Landroidx/lifecycle/q;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Landroidx/lifecycle/q;->b()Landroidx/lifecycle/s;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p0}, Landroidx/lifecycle/s;->b(Landroidx/lifecycle/p;)V

    .line 6
    .line 7
    .line 8
    iget-boolean p1, p0, Ls3/j;->r:Z

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object p1, p0, Ls3/j;->i:Lc1/f;

    .line 14
    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    :goto_0
    return-void

    .line 18
    :cond_1
    invoke-virtual {p1}, Lc1/f;->b()V

    .line 19
    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    iput-object p1, p0, Ls3/j;->i:Lc1/f;

    .line 23
    .line 24
    return-void
.end method

.method public final g0(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ls3/j;->C:Lm/x0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lm/x0;->r(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, v0, Lm/x0;->f:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p1, Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ls3/A0;

    .line 25
    .line 26
    iget-object v1, v0, Ls3/A0;->a:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Ls3/J0;

    .line 33
    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    invoke-static {v0, v1}, Landroid/support/v4/media/session/a;->A(Ls3/A0;Ls3/K0;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    if-nez p3, :cond_2

    .line 41
    .line 42
    goto :goto_2

    .line 43
    :cond_2
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    :cond_3
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result p3

    .line 51
    if-eqz p3, :cond_5

    .line 52
    .line 53
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    check-cast p3, Ljava/lang/String;

    .line 58
    .line 59
    if-nez p3, :cond_4

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_4
    invoke-virtual {p1, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Ls3/J0;

    .line 67
    .line 68
    if-eqz v0, :cond_3

    .line 69
    .line 70
    iget-object v0, v0, Ls3/J0;->e:Le1/C;

    .line 71
    .line 72
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 73
    .line 74
    .line 75
    :try_start_0
    iget-object v0, v0, Le1/C;->a:LZ0/o;

    .line 76
    .line 77
    check-cast v0, LZ0/m;

    .line 78
    .line 79
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    const/4 v2, 0x1

    .line 84
    invoke-virtual {v0, v1, v2}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1, p3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    goto :goto_1

    .line 91
    :catch_0
    move-exception p1

    .line 92
    new-instance p2, Le1/x;

    .line 93
    .line 94
    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 95
    .line 96
    .line 97
    throw p2

    .line 98
    :cond_5
    :goto_2
    return-void
.end method

.method public final h(Landroidx/lifecycle/q;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Ls3/j;->r:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p1, p0, Ls3/j;->i:Lc1/f;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Lc1/f;->a(Landroid/os/Bundle;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final i(Le1/o;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Le1/o;->a()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Le1/o;->b()Lcom/google/android/gms/maps/model/LatLng;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v1, p0, Ls3/j;->w:Ls3/w;

    .line 10
    .line 11
    iget-object v2, v1, Ls3/w;->c:Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/String;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object v1, v1, Ls3/w;->d:LZ2/s;

    .line 23
    .line 24
    invoke-static {p1}, Landroid/support/v4/media/session/a;->E(Lcom/google/android/gms/maps/model/LatLng;)Ls3/j0;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v2, LK0/h;

    .line 29
    .line 30
    const/16 v3, 0x11

    .line 31
    .line 32
    invoke-direct {v2, v3}, LK0/h;-><init>(I)V

    .line 33
    .line 34
    .line 35
    new-instance v3, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v4, "dev.flutter.pigeon.google_maps_flutter_android.MapsCallbackApi.onMarkerDragStart"

    .line 38
    .line 39
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v4, v1, LZ2/s;->g:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v4, Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    new-instance v4, LV1/y;

    .line 54
    .line 55
    iget-object v1, v1, LZ2/s;->f:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast v1, Lk3/f;

    .line 58
    .line 59
    sget-object v5, Ls3/B;->d:Ls3/B;

    .line 60
    .line 61
    const/4 v6, 0x0

    .line 62
    invoke-direct {v4, v1, v3, v5, v6}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 63
    .line 64
    .line 65
    new-instance v1, Ljava/util/ArrayList;

    .line 66
    .line 67
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 76
    .line 77
    .line 78
    new-instance p1, LV1/n;

    .line 79
    .line 80
    const/16 v0, 0xd

    .line 81
    .line 82
    invoke-direct {p1, v2, v3, v0}, LV1/n;-><init>(LK0/h;Ljava/lang/String;I)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v4, v1, p1}, LV1/y;->v(Ljava/io/Serializable;Lk3/c;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final j(Le1/o;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Le1/o;->a()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Le1/o;->b()Lcom/google/android/gms/maps/model/LatLng;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v1, p0, Ls3/j;->w:Ls3/w;

    .line 10
    .line 11
    iget-object v2, v1, Ls3/w;->c:Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/String;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object v1, v1, Ls3/w;->d:LZ2/s;

    .line 23
    .line 24
    invoke-static {p1}, Landroid/support/v4/media/session/a;->E(Lcom/google/android/gms/maps/model/LatLng;)Ls3/j0;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v2, LK0/h;

    .line 29
    .line 30
    const/16 v3, 0x11

    .line 31
    .line 32
    invoke-direct {v2, v3}, LK0/h;-><init>(I)V

    .line 33
    .line 34
    .line 35
    new-instance v3, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v4, "dev.flutter.pigeon.google_maps_flutter_android.MapsCallbackApi.onMarkerDragEnd"

    .line 38
    .line 39
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v4, v1, LZ2/s;->g:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v4, Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    new-instance v4, LV1/y;

    .line 54
    .line 55
    iget-object v1, v1, LZ2/s;->f:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast v1, Lk3/f;

    .line 58
    .line 59
    sget-object v5, Ls3/B;->d:Ls3/B;

    .line 60
    .line 61
    const/4 v6, 0x0

    .line 62
    invoke-direct {v4, v1, v3, v5, v6}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 63
    .line 64
    .line 65
    new-instance v1, Ljava/util/ArrayList;

    .line 66
    .line 67
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 76
    .line 77
    .line 78
    new-instance p1, LV1/n;

    .line 79
    .line 80
    const/4 v0, 0x4

    .line 81
    invoke-direct {p1, v2, v3, v0}, LV1/n;-><init>(LK0/h;Ljava/lang/String;I)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v4, v1, p1}, LV1/y;->v(Ljava/io/Serializable;Lk3/c;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public final k(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ls3/j;->o:Z

    .line 2
    .line 3
    return-void
.end method

.method public final l(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ls3/j;->m:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iput-boolean p1, p0, Ls3/j;->m:Z

    .line 7
    .line 8
    iget-object p1, p0, Ls3/j;->j:LB2/a;

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Ls3/j;->d0()V

    .line 13
    .line 14
    .line 15
    :cond_1
    :goto_0
    return-void
.end method

.method public final n(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 2
    .line 3
    invoke-virtual {v0}, LB2/a;->D()LA0/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    :try_start_0
    iget-object v0, v0, LA0/c;->f:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v0, Ld1/c;

    .line 13
    .line 14
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget v2, LZ0/r;->a:I

    .line 19
    .line 20
    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 21
    .line 22
    .line 23
    const/4 p1, 0x2

    .line 24
    invoke-virtual {v0, v1, p1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :catch_0
    move-exception p1

    .line 29
    new-instance v0, Le1/x;

    .line 30
    .line 31
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    throw v0
.end method

.method public final o(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 2
    .line 3
    invoke-virtual {v0}, LB2/a;->D()LA0/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    :try_start_0
    iget-object v0, v0, LA0/c;->f:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v0, Ld1/c;

    .line 13
    .line 14
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget v2, LZ0/r;->a:I

    .line 19
    .line 20
    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 21
    .line 22
    .line 23
    const/16 p1, 0x12

    .line 24
    .line 25
    invoke-virtual {v0, v1, p1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :catch_0
    move-exception p1

    .line 30
    new-instance v0, Le1/x;

    .line 31
    .line 32
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 33
    .line 34
    .line 35
    throw v0
.end method

.method public final p(Landroidx/lifecycle/q;)V
    .locals 2

    .line 1
    iget-boolean p1, p0, Ls3/j;->r:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p1, p0, Ls3/j;->i:Lc1/f;

    .line 7
    .line 8
    iget-object p1, p1, Lc1/f;->e:Lc1/j;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    new-instance v0, LU0/e;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-direct {v0, p1, v1}, LU0/e;-><init>(Lc1/j;I)V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {p1, v1, v0}, Lc1/j;->c(Landroid/os/Bundle;LU0/f;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final q(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ls3/j;->k:Z

    .line 2
    .line 3
    return-void
.end method

.method public final r(Landroidx/lifecycle/q;)V
    .locals 2

    .line 1
    iget-boolean p1, p0, Ls3/j;->r:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p1, p0, Ls3/j;->i:Lc1/f;

    .line 7
    .line 8
    iget-object p1, p1, Lc1/f;->e:Lc1/j;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    new-instance v0, LU0/e;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-direct {v0, p1, v1}, LU0/e;-><init>(Lc1/j;I)V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {p1, v1, v0}, Lc1/j;->c(Landroid/os/Bundle;LU0/f;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final s(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 2
    .line 3
    invoke-virtual {v0}, LB2/a;->D()LA0/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    :try_start_0
    iget-object v0, v0, LA0/c;->f:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v0, Ld1/c;

    .line 13
    .line 14
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget v2, LZ0/r;->a:I

    .line 19
    .line 20
    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 21
    .line 22
    .line 23
    const/4 p1, 0x4

    .line 24
    invoke-virtual {v0, v1, p1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :catch_0
    move-exception p1

    .line 29
    new-instance v0, Le1/x;

    .line 30
    .line 31
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    throw v0
.end method

.method public final t(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/j;->h:Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, v0, Lcom/google/android/gms/maps/GoogleMapOptions;->o:Ljava/lang/Boolean;

    .line 8
    .line 9
    return-void
.end method

.method public final u()Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/j;->i:Lc1/f;

    .line 2
    .line 3
    return-object v0
.end method

.method public final v(Le1/o;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Le1/o;->a()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ls3/j;->w:Ls3/w;

    .line 6
    .line 7
    iget-object v1, v0, Ls3/w;->c:Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Ljava/lang/String;

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    return p1

    .line 19
    :cond_0
    invoke-virtual {v0, p1}, Ls3/w;->b(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    return p1
.end method

.method public final w(Le1/o;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Le1/o;->a()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Le1/o;->b()Lcom/google/android/gms/maps/model/LatLng;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v1, p0, Ls3/j;->w:Ls3/w;

    .line 10
    .line 11
    iget-object v2, v1, Ls3/w;->c:Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/String;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object v1, v1, Ls3/w;->d:LZ2/s;

    .line 23
    .line 24
    invoke-static {p1}, Landroid/support/v4/media/session/a;->E(Lcom/google/android/gms/maps/model/LatLng;)Ls3/j0;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v2, LK0/h;

    .line 29
    .line 30
    const/16 v3, 0x11

    .line 31
    .line 32
    invoke-direct {v2, v3}, LK0/h;-><init>(I)V

    .line 33
    .line 34
    .line 35
    new-instance v3, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v4, "dev.flutter.pigeon.google_maps_flutter_android.MapsCallbackApi.onMarkerDrag"

    .line 38
    .line 39
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v4, v1, LZ2/s;->g:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v4, Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    new-instance v4, LV1/y;

    .line 54
    .line 55
    iget-object v1, v1, LZ2/s;->f:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast v1, Lk3/f;

    .line 58
    .line 59
    sget-object v5, Ls3/B;->d:Ls3/B;

    .line 60
    .line 61
    const/4 v6, 0x0

    .line 62
    invoke-direct {v4, v1, v3, v5, v6}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 63
    .line 64
    .line 65
    new-instance v1, Ljava/util/ArrayList;

    .line 66
    .line 67
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 76
    .line 77
    .line 78
    new-instance p1, LV1/n;

    .line 79
    .line 80
    const/16 v0, 0x11

    .line 81
    .line 82
    invoke-direct {p1, v2, v3, v0}, LV1/n;-><init>(LK0/h;Ljava/lang/String;I)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v4, v1, p1}, LV1/y;->v(Ljava/io/Serializable;Lk3/c;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final x(Lcom/google/android/gms/maps/model/LatLngBounds;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v0, v0, LB2/a;->f:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Ld1/g;

    .line 9
    .line 10
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-static {v1, p1}, LZ0/r;->c(Landroid/os/Parcel;Landroid/os/Parcelable;)V

    .line 15
    .line 16
    .line 17
    const/16 p1, 0x5f

    .line 18
    .line 19
    invoke-virtual {v0, v1, p1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :catch_0
    move-exception p1

    .line 24
    new-instance v0, Le1/x;

    .line 25
    .line 26
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    throw v0
.end method

.method public final y(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ls3/j;->j:LB2/a;

    .line 2
    .line 3
    invoke-virtual {v0}, LB2/a;->D()LA0/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    :try_start_0
    iget-object v0, v0, LA0/c;->f:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v0, Ld1/c;

    .line 13
    .line 14
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget v2, LZ0/r;->a:I

    .line 19
    .line 20
    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 21
    .line 22
    .line 23
    const/4 p1, 0x6

    .line 24
    invoke-virtual {v0, v1, p1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :catch_0
    move-exception p1

    .line 29
    new-instance v0, Le1/x;

    .line 30
    .line 31
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    throw v0
.end method

.method public final z(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ls3/j;->l:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iput-boolean p1, p0, Ls3/j;->l:Z

    .line 7
    .line 8
    iget-object p1, p0, Ls3/j;->j:LB2/a;

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Ls3/j;->d0()V

    .line 13
    .line 14
    .line 15
    :cond_1
    :goto_0
    return-void
.end method
