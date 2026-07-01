.class public final LU2/i;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic m:I


# instance fields
.field public a:Landroid/hardware/Camera;

.field public b:Landroid/hardware/Camera$CameraInfo;

.field public c:LU2/b;

.field public d:Lv2/a;

.field public e:Z

.field public f:Ljava/lang/String;

.field public g:LU2/j;

.field public h:LM2/b;

.field public i:LT2/u;

.field public j:LT2/u;

.field public k:I

.field public final l:LU2/h;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p1, LU2/j;

    .line 5
    .line 6
    invoke-direct {p1}, LU2/j;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, LU2/i;->g:LU2/j;

    .line 10
    .line 11
    const/4 p1, -0x1

    .line 12
    iput p1, p0, LU2/i;->k:I

    .line 13
    .line 14
    new-instance p1, LU2/h;

    .line 15
    .line 16
    invoke-direct {p1, p0}, LU2/h;-><init>(LU2/i;)V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, LU2/i;->l:LU2/h;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 4

    .line 1
    iget-object v0, p0, LU2/i;->h:LM2/b;

    .line 2
    .line 3
    iget v0, v0, LM2/b;->a:I

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    if-eq v0, v1, :cond_2

    .line 10
    .line 11
    const/4 v3, 0x2

    .line 12
    if-eq v0, v3, :cond_1

    .line 13
    .line 14
    const/4 v3, 0x3

    .line 15
    if-eq v0, v3, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/16 v2, 0x10e

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const/16 v2, 0xb4

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_2
    const/16 v2, 0x5a

    .line 25
    .line 26
    :cond_3
    :goto_0
    iget-object v0, p0, LU2/i;->b:Landroid/hardware/Camera$CameraInfo;

    .line 27
    .line 28
    iget v3, v0, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 29
    .line 30
    if-ne v3, v1, :cond_4

    .line 31
    .line 32
    iget v0, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    .line 33
    .line 34
    add-int/2addr v0, v2

    .line 35
    rem-int/lit16 v0, v0, 0x168

    .line 36
    .line 37
    rsub-int v0, v0, 0x168

    .line 38
    .line 39
    rem-int/lit16 v0, v0, 0x168

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_4
    iget v0, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    .line 43
    .line 44
    sub-int/2addr v0, v2

    .line 45
    add-int/lit16 v0, v0, 0x168

    .line 46
    .line 47
    rem-int/lit16 v0, v0, 0x168

    .line 48
    .line 49
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    const-string v2, "Camera Display Orientation: "

    .line 52
    .line 53
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const-string v2, "i"

    .line 64
    .line 65
    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    return v0
.end method

.method public final b()V
    .locals 3

    .line 1
    iget-object v0, p0, LU2/i;->a:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const-string v0, "i"

    .line 6
    .line 7
    :try_start_0
    invoke-virtual {p0}, LU2/i;->a()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iput v1, p0, LU2/i;->k:I

    .line 12
    .line 13
    iget-object v2, p0, LU2/i;->a:Landroid/hardware/Camera;

    .line 14
    .line 15
    invoke-virtual {v2, v1}, Landroid/hardware/Camera;->setDisplayOrientation(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catch_0
    const-string v1, "Failed to set rotation."

    .line 20
    .line 21
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    :goto_0
    const/4 v1, 0x0

    .line 25
    :try_start_1
    invoke-virtual {p0, v1}, LU2/i;->d(Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 26
    .line 27
    .line 28
    goto :goto_1

    .line 29
    :catch_1
    const/4 v1, 0x1

    .line 30
    :try_start_2
    invoke-virtual {p0, v1}, LU2/i;->d(Z)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 31
    .line 32
    .line 33
    goto :goto_1

    .line 34
    :catch_2
    const-string v1, "Camera rejected even safe-mode parameters! No configuration"

    .line 35
    .line 36
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    :goto_1
    iget-object v0, p0, LU2/i;->a:Landroid/hardware/Camera;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    if-nez v0, :cond_0

    .line 50
    .line 51
    iget-object v0, p0, LU2/i;->i:LT2/u;

    .line 52
    .line 53
    iput-object v0, p0, LU2/i;->j:LT2/u;

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_0
    new-instance v1, LT2/u;

    .line 57
    .line 58
    iget v2, v0, Landroid/hardware/Camera$Size;->width:I

    .line 59
    .line 60
    iget v0, v0, Landroid/hardware/Camera$Size;->height:I

    .line 61
    .line 62
    invoke-direct {v1, v2, v0}, LT2/u;-><init>(II)V

    .line 63
    .line 64
    .line 65
    iput-object v1, p0, LU2/i;->j:LT2/u;

    .line 66
    .line 67
    :goto_2
    iget-object v0, p0, LU2/i;->l:LU2/h;

    .line 68
    .line 69
    iget-object v1, p0, LU2/i;->j:LT2/u;

    .line 70
    .line 71
    iput-object v1, v0, LU2/h;->b:LT2/u;

    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    .line 75
    .line 76
    const-string v1, "Camera not open"

    .line 77
    .line 78
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    throw v0
.end method

.method public final c()V
    .locals 2

    .line 1
    iget-object v0, p0, LU2/i;->g:LU2/j;

    .line 2
    .line 3
    iget v0, v0, LU2/j;->a:I

    .line 4
    .line 5
    invoke-static {v0}, Landroid/support/v4/media/session/a;->l(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, -0x1

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {v0}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    :goto_0
    iput-object v0, p0, LU2/i;->a:Landroid/hardware/Camera;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, LU2/i;->g:LU2/j;

    .line 23
    .line 24
    iget v0, v0, LU2/j;->a:I

    .line 25
    .line 26
    invoke-static {v0}, Landroid/support/v4/media/session/a;->l(I)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    new-instance v1, Landroid/hardware/Camera$CameraInfo;

    .line 31
    .line 32
    invoke-direct {v1}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v1, p0, LU2/i;->b:Landroid/hardware/Camera$CameraInfo;

    .line 36
    .line 37
    invoke-static {v0, v1}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    .line 42
    .line 43
    const-string v1, "Failed to open camera"

    .line 44
    .line 45
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    throw v0
.end method

.method public final d(Z)V
    .locals 10

    .line 1
    iget-object v0, p0, LU2/i;->a:Landroid/hardware/Camera;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, LU2/i;->f:Ljava/lang/String;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->flatten()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, p0, LU2/i;->f:Ljava/lang/String;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->unflatten(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :goto_0
    const-string v1, "i"

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    const-string p1, "Device error: no camera parameters are available. Proceeding without configuration."

    .line 26
    .line 27
    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v3, "Initial camera parameters: "

    .line 34
    .line 35
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->flatten()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    if-eqz p1, :cond_2

    .line 53
    .line 54
    const-string v2, "In camera config safe mode -- most settings will not be honored"

    .line 55
    .line 56
    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    :cond_2
    iget-object v2, p0, LU2/i;->g:LU2/j;

    .line 60
    .line 61
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 62
    .line 63
    .line 64
    sget v2, LU2/c;->a:I

    .line 65
    .line 66
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    const-string v3, "auto"

    .line 71
    .line 72
    filled-new-array {v3}, [Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    const-string v4, "focus mode"

    .line 77
    .line 78
    invoke-static {v4, v2, v3}, LU2/c;->a(Ljava/lang/String;Ljava/util/List;[Ljava/lang/String;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    if-nez p1, :cond_3

    .line 83
    .line 84
    if-nez v3, :cond_3

    .line 85
    .line 86
    const-string v3, "edof"

    .line 87
    .line 88
    const-string v5, "macro"

    .line 89
    .line 90
    filled-new-array {v5, v3}, [Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    invoke-static {v4, v2, v3}, LU2/c;->a(Ljava/lang/String;Ljava/util/List;[Ljava/lang/String;)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    :cond_3
    const-string v2, "CameraConfiguration"

    .line 99
    .line 100
    if-eqz v3, :cond_5

    .line 101
    .line 102
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getFocusMode()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    if-eqz v4, :cond_4

    .line 111
    .line 112
    const-string v4, "Focus mode already set to "

    .line 113
    .line 114
    invoke-virtual {v4, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_4
    invoke-virtual {v0, v3}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    :cond_5
    :goto_1
    const/4 v3, 0x0

    .line 126
    if-nez p1, :cond_8

    .line 127
    .line 128
    invoke-static {v0, v3}, LU2/c;->b(Landroid/hardware/Camera$Parameters;Z)V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, LU2/i;->g:LU2/j;

    .line 132
    .line 133
    iget-boolean p1, p1, LU2/j;->b:Z

    .line 134
    .line 135
    if-eqz p1, :cond_7

    .line 136
    .line 137
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getColorEffect()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    const-string v4, "negative"

    .line 142
    .line 143
    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    if-eqz p1, :cond_6

    .line 148
    .line 149
    const-string p1, "Negative effect already set"

    .line 150
    .line 151
    invoke-static {v2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    .line 153
    .line 154
    goto :goto_2

    .line 155
    :cond_6
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedColorEffects()Ljava/util/List;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    filled-new-array {v4}, [Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v4

    .line 163
    const-string v5, "color effect"

    .line 164
    .line 165
    invoke-static {v5, p1, v4}, LU2/c;->a(Ljava/lang/String;Ljava/util/List;[Ljava/lang/String;)Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    if-eqz p1, :cond_7

    .line 170
    .line 171
    invoke-virtual {v0, p1}, Landroid/hardware/Camera$Parameters;->setColorEffect(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    :cond_7
    :goto_2
    iget-object p1, p0, LU2/i;->g:LU2/j;

    .line 175
    .line 176
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 177
    .line 178
    .line 179
    iget-object p1, p0, LU2/i;->g:LU2/j;

    .line 180
    .line 181
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 182
    .line 183
    .line 184
    :cond_8
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    new-instance v4, Ljava/util/ArrayList;

    .line 189
    .line 190
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 191
    .line 192
    .line 193
    if-nez p1, :cond_9

    .line 194
    .line 195
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    if-eqz p1, :cond_a

    .line 200
    .line 201
    iget v5, p1, Landroid/hardware/Camera$Size;->width:I

    .line 202
    .line 203
    iget p1, p1, Landroid/hardware/Camera$Size;->height:I

    .line 204
    .line 205
    new-instance v6, LT2/u;

    .line 206
    .line 207
    invoke-direct {v6, v5, p1}, LT2/u;-><init>(II)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    goto :goto_4

    .line 214
    :cond_9
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 219
    .line 220
    .line 221
    move-result v5

    .line 222
    if-eqz v5, :cond_a

    .line 223
    .line 224
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    move-result-object v5

    .line 228
    check-cast v5, Landroid/hardware/Camera$Size;

    .line 229
    .line 230
    new-instance v6, LT2/u;

    .line 231
    .line 232
    iget v7, v5, Landroid/hardware/Camera$Size;->width:I

    .line 233
    .line 234
    iget v5, v5, Landroid/hardware/Camera$Size;->height:I

    .line 235
    .line 236
    invoke-direct {v6, v7, v5}, LT2/u;-><init>(II)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    goto :goto_3

    .line 243
    :cond_a
    :goto_4
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 244
    .line 245
    .line 246
    move-result p1

    .line 247
    const/4 v5, 0x1

    .line 248
    const/4 v6, 0x0

    .line 249
    if-nez p1, :cond_b

    .line 250
    .line 251
    iput-object v6, p0, LU2/i;->i:LT2/u;

    .line 252
    .line 253
    goto :goto_8

    .line 254
    :cond_b
    iget-object p1, p0, LU2/i;->h:LM2/b;

    .line 255
    .line 256
    iget v7, p0, LU2/i;->k:I

    .line 257
    .line 258
    const/4 v8, -0x1

    .line 259
    if-eq v7, v8, :cond_19

    .line 260
    .line 261
    rem-int/lit16 v7, v7, 0xb4

    .line 262
    .line 263
    if-eqz v7, :cond_c

    .line 264
    .line 265
    move v7, v5

    .line 266
    goto :goto_5

    .line 267
    :cond_c
    move v7, v3

    .line 268
    :goto_5
    iget-object v8, p1, LM2/b;->b:Ljava/lang/Object;

    .line 269
    .line 270
    check-cast v8, LT2/u;

    .line 271
    .line 272
    if-nez v8, :cond_d

    .line 273
    .line 274
    move-object v8, v6

    .line 275
    goto :goto_6

    .line 276
    :cond_d
    if-eqz v7, :cond_e

    .line 277
    .line 278
    new-instance v7, LT2/u;

    .line 279
    .line 280
    iget v9, v8, LT2/u;->f:I

    .line 281
    .line 282
    iget v8, v8, LT2/u;->e:I

    .line 283
    .line 284
    invoke-direct {v7, v9, v8}, LT2/u;-><init>(II)V

    .line 285
    .line 286
    .line 287
    move-object v8, v7

    .line 288
    :cond_e
    :goto_6
    iget-object p1, p1, LM2/b;->c:Ljava/lang/Object;

    .line 289
    .line 290
    check-cast p1, LU2/m;

    .line 291
    .line 292
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 293
    .line 294
    .line 295
    if-nez v8, :cond_f

    .line 296
    .line 297
    goto :goto_7

    .line 298
    :cond_f
    new-instance v7, LU2/l;

    .line 299
    .line 300
    invoke-direct {v7, p1, v8}, LU2/l;-><init>(LU2/m;LT2/u;)V

    .line 301
    .line 302
    .line 303
    invoke-static {v4, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 304
    .line 305
    .line 306
    :goto_7
    new-instance p1, Ljava/lang/StringBuilder;

    .line 307
    .line 308
    const-string v7, "Viewfinder size: "

    .line 309
    .line 310
    invoke-direct {p1, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 311
    .line 312
    .line 313
    invoke-virtual {p1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 314
    .line 315
    .line 316
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 317
    .line 318
    .line 319
    move-result-object p1

    .line 320
    const-string v7, "m"

    .line 321
    .line 322
    invoke-static {v7, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 323
    .line 324
    .line 325
    new-instance p1, Ljava/lang/StringBuilder;

    .line 326
    .line 327
    const-string v8, "Preview in order of preference: "

    .line 328
    .line 329
    invoke-direct {p1, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 330
    .line 331
    .line 332
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 333
    .line 334
    .line 335
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object p1

    .line 339
    invoke-static {v7, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 340
    .line 341
    .line 342
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 343
    .line 344
    .line 345
    move-result-object p1

    .line 346
    check-cast p1, LT2/u;

    .line 347
    .line 348
    iput-object p1, p0, LU2/i;->i:LT2/u;

    .line 349
    .line 350
    iget v4, p1, LT2/u;->e:I

    .line 351
    .line 352
    iget p1, p1, LT2/u;->f:I

    .line 353
    .line 354
    invoke-virtual {v0, v4, p1}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 355
    .line 356
    .line 357
    :goto_8
    sget-object p1, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    .line 358
    .line 359
    const-string v4, "glass-1"

    .line 360
    .line 361
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 362
    .line 363
    .line 364
    move-result p1

    .line 365
    if-eqz p1, :cond_18

    .line 366
    .line 367
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFpsRange()Ljava/util/List;

    .line 368
    .line 369
    .line 370
    move-result-object p1

    .line 371
    new-instance v4, Ljava/lang/StringBuilder;

    .line 372
    .line 373
    const-string v7, "Supported FPS ranges: "

    .line 374
    .line 375
    invoke-direct {v4, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 376
    .line 377
    .line 378
    if-eqz p1, :cond_13

    .line 379
    .line 380
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    .line 381
    .line 382
    .line 383
    move-result v7

    .line 384
    if-eqz v7, :cond_10

    .line 385
    .line 386
    goto :goto_a

    .line 387
    :cond_10
    new-instance v7, Ljava/lang/StringBuilder;

    .line 388
    .line 389
    const-string v8, "["

    .line 390
    .line 391
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 392
    .line 393
    .line 394
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 395
    .line 396
    .line 397
    move-result-object v8

    .line 398
    :cond_11
    :goto_9
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 399
    .line 400
    .line 401
    move-result v9

    .line 402
    if-eqz v9, :cond_12

    .line 403
    .line 404
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 405
    .line 406
    .line 407
    move-result-object v9

    .line 408
    check-cast v9, [I

    .line 409
    .line 410
    invoke-static {v9}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 411
    .line 412
    .line 413
    move-result-object v9

    .line 414
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 415
    .line 416
    .line 417
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 418
    .line 419
    .line 420
    move-result v9

    .line 421
    if-eqz v9, :cond_11

    .line 422
    .line 423
    const-string v9, ", "

    .line 424
    .line 425
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 426
    .line 427
    .line 428
    goto :goto_9

    .line 429
    :cond_12
    const/16 v8, 0x5d

    .line 430
    .line 431
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 432
    .line 433
    .line 434
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 435
    .line 436
    .line 437
    move-result-object v7

    .line 438
    goto :goto_b

    .line 439
    :cond_13
    :goto_a
    const-string v7, "[]"

    .line 440
    .line 441
    :goto_b
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 442
    .line 443
    .line 444
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 445
    .line 446
    .line 447
    move-result-object v4

    .line 448
    invoke-static {v2, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 449
    .line 450
    .line 451
    if-eqz p1, :cond_18

    .line 452
    .line 453
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 454
    .line 455
    .line 456
    move-result v4

    .line 457
    if-nez v4, :cond_18

    .line 458
    .line 459
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 460
    .line 461
    .line 462
    move-result-object p1

    .line 463
    :cond_14
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 464
    .line 465
    .line 466
    move-result v4

    .line 467
    if-eqz v4, :cond_15

    .line 468
    .line 469
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 470
    .line 471
    .line 472
    move-result-object v4

    .line 473
    check-cast v4, [I

    .line 474
    .line 475
    aget v7, v4, v3

    .line 476
    .line 477
    aget v8, v4, v5

    .line 478
    .line 479
    const/16 v9, 0x2710

    .line 480
    .line 481
    if-lt v7, v9, :cond_14

    .line 482
    .line 483
    const/16 v7, 0x4e20

    .line 484
    .line 485
    if-gt v8, v7, :cond_14

    .line 486
    .line 487
    move-object v6, v4

    .line 488
    :cond_15
    if-nez v6, :cond_16

    .line 489
    .line 490
    const-string p1, "No suitable FPS range?"

    .line 491
    .line 492
    invoke-static {v2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 493
    .line 494
    .line 495
    goto :goto_c

    .line 496
    :cond_16
    const/4 p1, 0x2

    .line 497
    new-array p1, p1, [I

    .line 498
    .line 499
    invoke-virtual {v0, p1}, Landroid/hardware/Camera$Parameters;->getPreviewFpsRange([I)V

    .line 500
    .line 501
    .line 502
    invoke-static {p1, v6}, Ljava/util/Arrays;->equals([I[I)Z

    .line 503
    .line 504
    .line 505
    move-result p1

    .line 506
    if-eqz p1, :cond_17

    .line 507
    .line 508
    new-instance p1, Ljava/lang/StringBuilder;

    .line 509
    .line 510
    const-string v3, "FPS range already set to "

    .line 511
    .line 512
    invoke-direct {p1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 513
    .line 514
    .line 515
    invoke-static {v6}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 516
    .line 517
    .line 518
    move-result-object v3

    .line 519
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 520
    .line 521
    .line 522
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 523
    .line 524
    .line 525
    move-result-object p1

    .line 526
    invoke-static {v2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 527
    .line 528
    .line 529
    goto :goto_c

    .line 530
    :cond_17
    new-instance p1, Ljava/lang/StringBuilder;

    .line 531
    .line 532
    const-string v4, "Setting FPS range to "

    .line 533
    .line 534
    invoke-direct {p1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 535
    .line 536
    .line 537
    invoke-static {v6}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 538
    .line 539
    .line 540
    move-result-object v4

    .line 541
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 542
    .line 543
    .line 544
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 545
    .line 546
    .line 547
    move-result-object p1

    .line 548
    invoke-static {v2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 549
    .line 550
    .line 551
    aget p1, v6, v3

    .line 552
    .line 553
    aget v2, v6, v5

    .line 554
    .line 555
    invoke-virtual {v0, p1, v2}, Landroid/hardware/Camera$Parameters;->setPreviewFpsRange(II)V

    .line 556
    .line 557
    .line 558
    :cond_18
    :goto_c
    new-instance p1, Ljava/lang/StringBuilder;

    .line 559
    .line 560
    const-string v2, "Final camera parameters: "

    .line 561
    .line 562
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 563
    .line 564
    .line 565
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->flatten()Ljava/lang/String;

    .line 566
    .line 567
    .line 568
    move-result-object v2

    .line 569
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 570
    .line 571
    .line 572
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 573
    .line 574
    .line 575
    move-result-object p1

    .line 576
    invoke-static {v1, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 577
    .line 578
    .line 579
    iget-object p1, p0, LU2/i;->a:Landroid/hardware/Camera;

    .line 580
    .line 581
    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 582
    .line 583
    .line 584
    return-void

    .line 585
    :cond_19
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 586
    .line 587
    const-string v0, "Rotation not calculated yet. Call configure() first."

    .line 588
    .line 589
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 590
    .line 591
    .line 592
    throw p1
.end method

.method public final e(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, LU2/i;->a:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getFlashMode()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const-string v2, "on"

    .line 19
    .line 20
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-nez v2, :cond_0

    .line 25
    .line 26
    const-string v2, "torch"

    .line 27
    .line 28
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    :cond_0
    const/4 v0, 0x1

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    move v0, v1

    .line 37
    :goto_0
    if-eq p1, v0, :cond_3

    .line 38
    .line 39
    iget-object v0, p0, LU2/i;->c:LU2/b;

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    invoke-virtual {v0}, LU2/b;->c()V

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :catch_0
    move-exception p1

    .line 48
    goto :goto_2

    .line 49
    :cond_2
    :goto_1
    iget-object v0, p0, LU2/i;->a:Landroid/hardware/Camera;

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {v0, p1}, LU2/c;->b(Landroid/hardware/Camera$Parameters;Z)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, LU2/i;->g:LU2/j;

    .line 59
    .line 60
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, LU2/i;->a:Landroid/hardware/Camera;

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, LU2/i;->c:LU2/b;

    .line 69
    .line 70
    if-eqz p1, :cond_3

    .line 71
    .line 72
    iput-boolean v1, p1, LU2/b;->a:Z

    .line 73
    .line 74
    invoke-virtual {p1}, LU2/b;->b()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :goto_2
    const-string v0, "i"

    .line 79
    .line 80
    const-string v1, "Failed to set torch"

    .line 81
    .line 82
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 83
    .line 84
    .line 85
    :cond_3
    return-void
.end method

.method public final f()V
    .locals 3

    .line 1
    iget-object v0, p0, LU2/i;->a:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v1, p0, LU2/i;->e:Z

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/hardware/Camera;->startPreview()V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, LU2/i;->e:Z

    .line 14
    .line 15
    new-instance v0, LU2/b;

    .line 16
    .line 17
    iget-object v1, p0, LU2/i;->a:Landroid/hardware/Camera;

    .line 18
    .line 19
    iget-object v2, p0, LU2/i;->g:LU2/j;

    .line 20
    .line 21
    invoke-direct {v0, v1, v2}, LU2/b;-><init>(Landroid/hardware/Camera;LU2/j;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, LU2/i;->c:LU2/b;

    .line 25
    .line 26
    new-instance v0, Lv2/a;

    .line 27
    .line 28
    iget-object v1, p0, LU2/i;->g:LU2/j;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object p0, v0, Lv2/a;->a:LU2/i;

    .line 34
    .line 35
    new-instance v2, Landroid/os/Handler;

    .line 36
    .line 37
    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v2, v0, Lv2/a;->b:Landroid/os/Handler;

    .line 41
    .line 42
    iput-object v0, p0, LU2/i;->d:Lv2/a;

    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method
