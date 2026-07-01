.class public final LX3/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/flutter/plugin/platform/e;
.implements Lk3/m;
.implements Lk3/s;


# instance fields
.field public final e:Landroid/content/Context;

.field public final f:Ljava/util/HashMap;

.field public final g:I

.field public final h:Lk3/o;

.field public final i:I

.field public j:Z

.field public k:Z

.field public l:LX3/a;

.field public final m:LA/c;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lk3/f;ILjava/util/HashMap;)V
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "messenger"

    .line 7
    .line 8
    invoke-static {p2, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "params"

    .line 12
    .line 13
    invoke-static {p4, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, LX3/d;->e:Landroid/content/Context;

    .line 20
    .line 21
    iput-object p4, p0, LX3/d;->f:Ljava/util/HashMap;

    .line 22
    .line 23
    const p1, 0x1e9aed64

    .line 24
    .line 25
    .line 26
    add-int/2addr p1, p3

    .line 27
    iput p1, p0, LX3/d;->g:I

    .line 28
    .line 29
    new-instance p1, Lk3/o;

    .line 30
    .line 31
    const-string p4, "net.touchcapture.qr.flutterqrplus/qrview_"

    .line 32
    .line 33
    invoke-static {p4, p3}, LE1/j;->j(Ljava/lang/String;I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    invoke-direct {p1, p2, p3}, Lk3/o;-><init>(Lk3/f;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, LX3/d;->h:Lk3/o;

    .line 41
    .line 42
    const/4 p2, 0x1

    .line 43
    iput p2, p0, LX3/d;->i:I

    .line 44
    .line 45
    sget-object p2, Landroid/support/v4/media/session/a;->b:Lh3/b;

    .line 46
    .line 47
    if-eqz p2, :cond_0

    .line 48
    .line 49
    check-cast p2, Lm/J0;

    .line 50
    .line 51
    invoke-virtual {p2, p0}, Lm/J0;->b(Lk3/s;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    invoke-virtual {p1, p0}, Lk3/o;->b(Lk3/m;)V

    .line 55
    .line 56
    .line 57
    sget-object p1, Landroid/support/v4/media/session/a;->a:Landroid/app/Activity;

    .line 58
    .line 59
    if-eqz p1, :cond_1

    .line 60
    .line 61
    new-instance p2, LX3/c;

    .line 62
    .line 63
    const/4 p3, 0x0

    .line 64
    invoke-direct {p2, p0, p3}, LX3/c;-><init>(LX3/d;I)V

    .line 65
    .line 66
    .line 67
    new-instance p3, LX3/c;

    .line 68
    .line 69
    const/4 p4, 0x1

    .line 70
    invoke-direct {p3, p0, p4}, LX3/c;-><init>(LX3/d;I)V

    .line 71
    .line 72
    .line 73
    new-instance p4, LX3/f;

    .line 74
    .line 75
    invoke-direct {p4, p1, p2, p3}, LX3/f;-><init>(Landroid/app/Activity;LX3/c;LX3/c;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    invoke-virtual {p2, p4}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 83
    .line 84
    .line 85
    new-instance p2, LA/c;

    .line 86
    .line 87
    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    const-string p3, "getApplication(...)"

    .line 92
    .line 93
    invoke-static {p1, p3}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    const/16 p3, 0x1d

    .line 97
    .line 98
    invoke-direct {p2, p3, p1, p4}, LA/c;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_1
    const/4 p2, 0x0

    .line 103
    :goto_0
    iput-object p2, p0, LX3/d;->m:LA/c;

    .line 104
    .line 105
    return-void
.end method

.method public static b(LQ2/g;)V
    .locals 3

    .line 1
    const-string v0, "No barcode view found"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "404"

    .line 5
    .line 6
    invoke-virtual {p0, v2, v0, v1}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    iget-object v0, p0, LX3/d;->m:LA/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, v0, LA/c;->f:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Landroid/app/Application;

    .line 8
    .line 9
    iget-object v0, v0, LA/c;->g:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, LX3/f;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    sget-object v0, Landroid/support/v4/media/session/a;->b:Lh3/b;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    check-cast v0, Lm/J0;

    .line 21
    .line 22
    iget-object v0, v0, Lm/J0;->g:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v0, Ljava/util/HashSet;

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object v0, p0, LX3/d;->l:LX3/a;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/BarcodeView;->i()V

    .line 34
    .line 35
    .line 36
    :cond_2
    const/4 v0, 0x0

    .line 37
    iput-object v0, p0, LX3/d;->l:LX3/a;

    .line 38
    .line 39
    return-void
.end method

.method public final c()V
    .locals 4

    .line 1
    invoke-virtual {p0}, LX3/d;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iget-object v2, p0, LX3/d;->h:Lk3/o;

    .line 11
    .line 12
    const-string v3, "onPermissionSet"

    .line 13
    .line 14
    invoke-virtual {v2, v3, v0, v1}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    sget-object v0, Landroid/support/v4/media/session/a;->a:Landroid/app/Activity;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const-string v1, "android.permission.CAMERA"

    .line 23
    .line 24
    filled-new-array {v1}, [Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget v2, p0, LX3/d;->g:I

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public final d()Z
    .locals 2

    .line 1
    iget-object v0, p0, LX3/d;->e:Landroid/content/Context;

    .line 2
    .line 3
    const-string v1, "android.permission.CAMERA"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lu/c;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    return v0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    return v0
.end method

.method public final onMethodCall(Lk3/l;Lk3/n;)V
    .locals 10

    .line 1
    const-string v0, "call"

    .line 2
    .line 3
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lk3/l;->a:Ljava/lang/String;

    .line 7
    .line 8
    if-eqz v0, :cond_27

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x1

    .line 15
    iget-object v3, p0, LX3/d;->e:Landroid/content/Context;

    .line 16
    .line 17
    const-string v4, ""

    .line 18
    .line 19
    const-string v5, "android.hardware.camera.flash"

    .line 20
    .line 21
    const/4 v6, 0x0

    .line 22
    const/4 v7, 0x0

    .line 23
    sparse-switch v1, :sswitch_data_0

    .line 24
    .line 25
    .line 26
    goto/16 :goto_8

    .line 27
    .line 28
    :sswitch_0
    const-string p1, "pauseCamera"

    .line 29
    .line 30
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_0

    .line 35
    .line 36
    goto/16 :goto_8

    .line 37
    .line 38
    :cond_0
    check-cast p2, LQ2/g;

    .line 39
    .line 40
    iget-object p1, p0, LX3/d;->l:LX3/a;

    .line 41
    .line 42
    if-nez p1, :cond_1

    .line 43
    .line 44
    invoke-static {p2}, LX3/d;->b(LQ2/g;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    iget-boolean v0, p1, LT2/g;->k:Z

    .line 49
    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    iput-boolean v2, p0, LX3/d;->k:Z

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/journeyapps/barcodescanner/BarcodeView;->i()V

    .line 55
    .line 56
    .line 57
    :cond_2
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 58
    .line 59
    invoke-virtual {p2, p1}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :sswitch_1
    const-string p1, "getCameraInfo"

    .line 64
    .line 65
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-nez p1, :cond_3

    .line 70
    .line 71
    goto/16 :goto_8

    .line 72
    .line 73
    :cond_3
    iget-object p1, p0, LX3/d;->l:LX3/a;

    .line 74
    .line 75
    if-nez p1, :cond_4

    .line 76
    .line 77
    check-cast p2, LQ2/g;

    .line 78
    .line 79
    invoke-static {p2}, LX3/d;->b(LQ2/g;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_4
    invoke-virtual {p1}, LT2/g;->getCameraSettings()LU2/j;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iget p1, p1, LU2/j;->a:I

    .line 88
    .line 89
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    check-cast p2, LQ2/g;

    .line 94
    .line 95
    invoke-virtual {p2, p1}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :sswitch_2
    const-string v1, "invertScan"

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_5

    .line 106
    .line 107
    goto/16 :goto_8

    .line 108
    .line 109
    :cond_5
    const-string p2, "isInvertScan"

    .line 110
    .line 111
    invoke-virtual {p1, p2}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    check-cast p1, Ljava/lang/Boolean;

    .line 116
    .line 117
    if-eqz p1, :cond_6

    .line 118
    .line 119
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 120
    .line 121
    .line 122
    move-result v6

    .line 123
    :cond_6
    iget-object p1, p0, LX3/d;->l:LX3/a;

    .line 124
    .line 125
    if-nez p1, :cond_7

    .line 126
    .line 127
    goto/16 :goto_7

    .line 128
    .line 129
    :cond_7
    invoke-virtual {p1}, Lcom/journeyapps/barcodescanner/BarcodeView;->i()V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p1}, LT2/g;->getCameraSettings()LU2/j;

    .line 133
    .line 134
    .line 135
    move-result-object p2

    .line 136
    iput-boolean v6, p2, LU2/j;->b:Z

    .line 137
    .line 138
    invoke-virtual {p1}, LT2/g;->e()V

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    :sswitch_3
    const-string p1, "stopScan"

    .line 143
    .line 144
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result p1

    .line 148
    if-nez p1, :cond_8

    .line 149
    .line 150
    goto/16 :goto_8

    .line 151
    .line 152
    :cond_8
    iget-object p1, p0, LX3/d;->l:LX3/a;

    .line 153
    .line 154
    if-eqz p1, :cond_26

    .line 155
    .line 156
    iput v2, p1, Lcom/journeyapps/barcodescanner/BarcodeView;->F:I

    .line 157
    .line 158
    iput-object v7, p1, Lcom/journeyapps/barcodescanner/BarcodeView;->G:LT2/a;

    .line 159
    .line 160
    invoke-virtual {p1}, Lcom/journeyapps/barcodescanner/BarcodeView;->k()V

    .line 161
    .line 162
    .line 163
    return-void

    .line 164
    :sswitch_4
    const-string p1, "requestPermissions"

    .line 165
    .line 166
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    if-nez p1, :cond_9

    .line 171
    .line 172
    goto/16 :goto_8

    .line 173
    .line 174
    :cond_9
    invoke-virtual {p0}, LX3/d;->c()V

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :sswitch_5
    const-string p1, "resumeCamera"

    .line 179
    .line 180
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    move-result p1

    .line 184
    if-nez p1, :cond_a

    .line 185
    .line 186
    goto/16 :goto_8

    .line 187
    .line 188
    :cond_a
    iget-object p1, p0, LX3/d;->l:LX3/a;

    .line 189
    .line 190
    if-nez p1, :cond_b

    .line 191
    .line 192
    check-cast p2, LQ2/g;

    .line 193
    .line 194
    invoke-static {p2}, LX3/d;->b(LQ2/g;)V

    .line 195
    .line 196
    .line 197
    return-void

    .line 198
    :cond_b
    iget-boolean v0, p1, LT2/g;->k:Z

    .line 199
    .line 200
    if-nez v0, :cond_c

    .line 201
    .line 202
    iput-boolean v6, p0, LX3/d;->k:Z

    .line 203
    .line 204
    invoke-virtual {p1}, LT2/g;->e()V

    .line 205
    .line 206
    .line 207
    :cond_c
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 208
    .line 209
    check-cast p2, LQ2/g;

    .line 210
    .line 211
    invoke-virtual {p2, p1}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 212
    .line 213
    .line 214
    return-void

    .line 215
    :sswitch_6
    const-string p1, "flipCamera"

    .line 216
    .line 217
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 218
    .line 219
    .line 220
    move-result p1

    .line 221
    if-nez p1, :cond_d

    .line 222
    .line 223
    goto/16 :goto_8

    .line 224
    .line 225
    :cond_d
    iget-object p1, p0, LX3/d;->l:LX3/a;

    .line 226
    .line 227
    if-nez p1, :cond_e

    .line 228
    .line 229
    check-cast p2, LQ2/g;

    .line 230
    .line 231
    invoke-static {p2}, LX3/d;->b(LQ2/g;)V

    .line 232
    .line 233
    .line 234
    return-void

    .line 235
    :cond_e
    invoke-virtual {p1}, Lcom/journeyapps/barcodescanner/BarcodeView;->i()V

    .line 236
    .line 237
    .line 238
    invoke-virtual {p1}, LT2/g;->getCameraSettings()LU2/j;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    iget v1, v0, LU2/j;->a:I

    .line 243
    .line 244
    iget v2, p0, LX3/d;->i:I

    .line 245
    .line 246
    if-ne v1, v2, :cond_f

    .line 247
    .line 248
    iput v6, v0, LU2/j;->a:I

    .line 249
    .line 250
    goto :goto_0

    .line 251
    :cond_f
    iput v2, v0, LU2/j;->a:I

    .line 252
    .line 253
    :goto_0
    invoke-virtual {p1}, LT2/g;->e()V

    .line 254
    .line 255
    .line 256
    iget p1, v0, LU2/j;->a:I

    .line 257
    .line 258
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 259
    .line 260
    .line 261
    move-result-object p1

    .line 262
    check-cast p2, LQ2/g;

    .line 263
    .line 264
    invoke-virtual {p2, p1}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 265
    .line 266
    .line 267
    return-void

    .line 268
    :sswitch_7
    const-string p1, "toggleFlash"

    .line 269
    .line 270
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 271
    .line 272
    .line 273
    move-result p1

    .line 274
    if-nez p1, :cond_10

    .line 275
    .line 276
    goto/16 :goto_8

    .line 277
    .line 278
    :cond_10
    iget-object p1, p0, LX3/d;->l:LX3/a;

    .line 279
    .line 280
    if-nez p1, :cond_11

    .line 281
    .line 282
    check-cast p2, LQ2/g;

    .line 283
    .line 284
    invoke-static {p2}, LX3/d;->b(LQ2/g;)V

    .line 285
    .line 286
    .line 287
    return-void

    .line 288
    :cond_11
    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 289
    .line 290
    .line 291
    move-result-object v0

    .line 292
    invoke-virtual {v0, v5}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 293
    .line 294
    .line 295
    move-result v0

    .line 296
    if-eqz v0, :cond_12

    .line 297
    .line 298
    iget-boolean v0, p0, LX3/d;->j:Z

    .line 299
    .line 300
    xor-int/2addr v0, v2

    .line 301
    invoke-virtual {p1, v0}, LT2/g;->setTorch(Z)V

    .line 302
    .line 303
    .line 304
    iget-boolean p1, p0, LX3/d;->j:Z

    .line 305
    .line 306
    xor-int/2addr p1, v2

    .line 307
    iput-boolean p1, p0, LX3/d;->j:Z

    .line 308
    .line 309
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 310
    .line 311
    .line 312
    move-result-object p1

    .line 313
    check-cast p2, LQ2/g;

    .line 314
    .line 315
    invoke-virtual {p2, p1}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 316
    .line 317
    .line 318
    return-void

    .line 319
    :cond_12
    const-string p1, "This device doesn\'t support flash"

    .line 320
    .line 321
    check-cast p2, LQ2/g;

    .line 322
    .line 323
    const-string v0, "404"

    .line 324
    .line 325
    invoke-virtual {p2, v0, p1, v7}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 326
    .line 327
    .line 328
    return-void

    .line 329
    :sswitch_8
    const-string p1, "getFlashInfo"

    .line 330
    .line 331
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 332
    .line 333
    .line 334
    move-result p1

    .line 335
    if-nez p1, :cond_13

    .line 336
    .line 337
    goto/16 :goto_8

    .line 338
    .line 339
    :cond_13
    iget-object p1, p0, LX3/d;->l:LX3/a;

    .line 340
    .line 341
    if-nez p1, :cond_14

    .line 342
    .line 343
    check-cast p2, LQ2/g;

    .line 344
    .line 345
    invoke-static {p2}, LX3/d;->b(LQ2/g;)V

    .line 346
    .line 347
    .line 348
    return-void

    .line 349
    :cond_14
    iget-boolean p1, p0, LX3/d;->j:Z

    .line 350
    .line 351
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 352
    .line 353
    .line 354
    move-result-object p1

    .line 355
    check-cast p2, LQ2/g;

    .line 356
    .line 357
    invoke-virtual {p2, p1}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 358
    .line 359
    .line 360
    return-void

    .line 361
    :sswitch_9
    const-string v1, "changeScanArea"

    .line 362
    .line 363
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 364
    .line 365
    .line 366
    move-result v0

    .line 367
    if-nez v0, :cond_15

    .line 368
    .line 369
    goto/16 :goto_8

    .line 370
    .line 371
    :cond_15
    const-string v0, "scanAreaWidth"

    .line 372
    .line 373
    invoke-virtual {p1, v0}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 374
    .line 375
    .line 376
    move-result-object v0

    .line 377
    const-string v1, "Required value was null."

    .line 378
    .line 379
    if-eqz v0, :cond_19

    .line 380
    .line 381
    check-cast v0, Ljava/lang/Number;

    .line 382
    .line 383
    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    .line 384
    .line 385
    .line 386
    move-result-wide v4

    .line 387
    const-string v0, "scanAreaHeight"

    .line 388
    .line 389
    invoke-virtual {p1, v0}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 390
    .line 391
    .line 392
    move-result-object v0

    .line 393
    if-eqz v0, :cond_18

    .line 394
    .line 395
    check-cast v0, Ljava/lang/Number;

    .line 396
    .line 397
    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    .line 398
    .line 399
    .line 400
    move-result-wide v6

    .line 401
    const-string v0, "cutOutBottomOffset"

    .line 402
    .line 403
    invoke-virtual {p1, v0}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 404
    .line 405
    .line 406
    move-result-object p1

    .line 407
    if-eqz p1, :cond_17

    .line 408
    .line 409
    check-cast p1, Ljava/lang/Number;

    .line 410
    .line 411
    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    .line 412
    .line 413
    .line 414
    move-result-wide v0

    .line 415
    iget-object p1, p0, LX3/d;->l:LX3/a;

    .line 416
    .line 417
    if-eqz p1, :cond_16

    .line 418
    .line 419
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 420
    .line 421
    .line 422
    move-result-object v2

    .line 423
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 424
    .line 425
    .line 426
    move-result-object v2

    .line 427
    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    .line 428
    .line 429
    float-to-double v8, v2

    .line 430
    mul-double/2addr v4, v8

    .line 431
    double-to-int v2, v4

    .line 432
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 433
    .line 434
    .line 435
    move-result-object v4

    .line 436
    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 437
    .line 438
    .line 439
    move-result-object v4

    .line 440
    iget v4, v4, Landroid/util/DisplayMetrics;->density:F

    .line 441
    .line 442
    float-to-double v4, v4

    .line 443
    mul-double/2addr v6, v4

    .line 444
    double-to-int v4, v6

    .line 445
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 446
    .line 447
    .line 448
    move-result-object v3

    .line 449
    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 450
    .line 451
    .line 452
    move-result-object v3

    .line 453
    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    .line 454
    .line 455
    float-to-double v5, v3

    .line 456
    mul-double/2addr v0, v5

    .line 457
    double-to-int v0, v0

    .line 458
    iput v0, p1, LX3/a;->K:I

    .line 459
    .line 460
    new-instance v0, LT2/u;

    .line 461
    .line 462
    invoke-direct {v0, v2, v4}, LT2/u;-><init>(II)V

    .line 463
    .line 464
    .line 465
    invoke-virtual {p1, v0}, LT2/g;->setFramingRectSize(LT2/u;)V

    .line 466
    .line 467
    .line 468
    :cond_16
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 469
    .line 470
    check-cast p2, LQ2/g;

    .line 471
    .line 472
    invoke-virtual {p2, p1}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 473
    .line 474
    .line 475
    return-void

    .line 476
    :cond_17
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 477
    .line 478
    invoke-direct {p1, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 479
    .line 480
    .line 481
    throw p1

    .line 482
    :cond_18
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 483
    .line 484
    invoke-direct {p1, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 485
    .line 486
    .line 487
    throw p1

    .line 488
    :cond_19
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 489
    .line 490
    invoke-direct {p1, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 491
    .line 492
    .line 493
    throw p1

    .line 494
    :sswitch_a
    const-string p1, "stopCamera"

    .line 495
    .line 496
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 497
    .line 498
    .line 499
    move-result p1

    .line 500
    if-nez p1, :cond_1a

    .line 501
    .line 502
    goto/16 :goto_8

    .line 503
    .line 504
    :cond_1a
    check-cast p2, LQ2/g;

    .line 505
    .line 506
    iget-object p1, p0, LX3/d;->l:LX3/a;

    .line 507
    .line 508
    if-nez p1, :cond_1b

    .line 509
    .line 510
    invoke-static {p2}, LX3/d;->b(LQ2/g;)V

    .line 511
    .line 512
    .line 513
    return-void

    .line 514
    :cond_1b
    iget-boolean v0, p1, LT2/g;->k:Z

    .line 515
    .line 516
    if-eqz v0, :cond_1c

    .line 517
    .line 518
    iput-boolean v2, p0, LX3/d;->k:Z

    .line 519
    .line 520
    invoke-virtual {p1}, Lcom/journeyapps/barcodescanner/BarcodeView;->i()V

    .line 521
    .line 522
    .line 523
    :cond_1c
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 524
    .line 525
    invoke-virtual {p2, p1}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 526
    .line 527
    .line 528
    return-void

    .line 529
    :sswitch_b
    const-string p1, "getSystemFeatures"

    .line 530
    .line 531
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 532
    .line 533
    .line 534
    move-result p1

    .line 535
    if-nez p1, :cond_1d

    .line 536
    .line 537
    goto/16 :goto_8

    .line 538
    .line 539
    :cond_1d
    :try_start_0
    const-string p1, "hasFrontCamera"

    .line 540
    .line 541
    const-string v0, "android.hardware.camera.front"

    .line 542
    .line 543
    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 544
    .line 545
    .line 546
    move-result-object v1

    .line 547
    invoke-virtual {v1, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 548
    .line 549
    .line 550
    move-result v0

    .line 551
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 552
    .line 553
    .line 554
    move-result-object v0

    .line 555
    new-instance v1, Ly3/c;

    .line 556
    .line 557
    invoke-direct {v1, p1, v0}, Ly3/c;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 558
    .line 559
    .line 560
    const-string p1, "hasBackCamera"

    .line 561
    .line 562
    const-string v0, "android.hardware.camera"

    .line 563
    .line 564
    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 565
    .line 566
    .line 567
    move-result-object v2

    .line 568
    invoke-virtual {v2, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 569
    .line 570
    .line 571
    move-result v0

    .line 572
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 573
    .line 574
    .line 575
    move-result-object v0

    .line 576
    new-instance v2, Ly3/c;

    .line 577
    .line 578
    invoke-direct {v2, p1, v0}, Ly3/c;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 579
    .line 580
    .line 581
    const-string p1, "hasFlash"

    .line 582
    .line 583
    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 584
    .line 585
    .line 586
    move-result-object v0

    .line 587
    invoke-virtual {v0, v5}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 588
    .line 589
    .line 590
    move-result v0

    .line 591
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 592
    .line 593
    .line 594
    move-result-object v0

    .line 595
    new-instance v3, Ly3/c;

    .line 596
    .line 597
    invoke-direct {v3, p1, v0}, Ly3/c;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 598
    .line 599
    .line 600
    const-string p1, "activeCamera"

    .line 601
    .line 602
    iget-object v0, p0, LX3/d;->l:LX3/a;

    .line 603
    .line 604
    if-eqz v0, :cond_1e

    .line 605
    .line 606
    invoke-virtual {v0}, LT2/g;->getCameraSettings()LU2/j;

    .line 607
    .line 608
    .line 609
    move-result-object v0

    .line 610
    if-eqz v0, :cond_1e

    .line 611
    .line 612
    iget v0, v0, LU2/j;->a:I

    .line 613
    .line 614
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 615
    .line 616
    .line 617
    move-result-object v0

    .line 618
    goto :goto_1

    .line 619
    :catch_0
    move-exception p1

    .line 620
    goto :goto_2

    .line 621
    :cond_1e
    move-object v0, v7

    .line 622
    :goto_1
    new-instance v5, Ly3/c;

    .line 623
    .line 624
    invoke-direct {v5, p1, v0}, Ly3/c;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 625
    .line 626
    .line 627
    filled-new-array {v1, v2, v3, v5}, [Ly3/c;

    .line 628
    .line 629
    .line 630
    move-result-object p1

    .line 631
    invoke-static {p1}, Lz3/o;->L([Ly3/c;)Ljava/util/Map;

    .line 632
    .line 633
    .line 634
    move-result-object p1

    .line 635
    move-object v0, p2

    .line 636
    check-cast v0, LQ2/g;

    .line 637
    .line 638
    invoke-virtual {v0, p1}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 639
    .line 640
    .line 641
    goto/16 :goto_7

    .line 642
    .line 643
    :goto_2
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 644
    .line 645
    .line 646
    move-result-object p1

    .line 647
    check-cast p2, LQ2/g;

    .line 648
    .line 649
    invoke-virtual {p2, v4, p1, v7}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 650
    .line 651
    .line 652
    goto/16 :goto_7

    .line 653
    .line 654
    :sswitch_c
    const-string v1, "startScan"

    .line 655
    .line 656
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 657
    .line 658
    .line 659
    move-result v0

    .line 660
    if-nez v0, :cond_1f

    .line 661
    .line 662
    goto/16 :goto_8

    .line 663
    .line 664
    :cond_1f
    iget-object p1, p1, Lk3/l;->b:Ljava/lang/Object;

    .line 665
    .line 666
    instance-of v0, p1, Ljava/util/List;

    .line 667
    .line 668
    if-eqz v0, :cond_20

    .line 669
    .line 670
    check-cast p1, Ljava/util/List;

    .line 671
    .line 672
    goto :goto_3

    .line 673
    :cond_20
    move-object p1, v7

    .line 674
    :goto_3
    invoke-virtual {p0}, LX3/d;->c()V

    .line 675
    .line 676
    .line 677
    sget-object v0, Lz3/l;->e:Lz3/l;

    .line 678
    .line 679
    if-eqz p1, :cond_21

    .line 680
    .line 681
    :try_start_1
    new-instance v1, Ljava/util/ArrayList;

    .line 682
    .line 683
    invoke-static {p1}, Lz3/f;->T(Ljava/lang/Iterable;)I

    .line 684
    .line 685
    .line 686
    move-result v2

    .line 687
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 688
    .line 689
    .line 690
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 691
    .line 692
    .line 693
    move-result-object v2

    .line 694
    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 695
    .line 696
    .line 697
    move-result v3

    .line 698
    if-eqz v3, :cond_22

    .line 699
    .line 700
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 701
    .line 702
    .line 703
    move-result-object v3

    .line 704
    check-cast v3, Ljava/lang/Number;

    .line 705
    .line 706
    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    .line 707
    .line 708
    .line 709
    move-result v3

    .line 710
    invoke-static {}, Lr2/a;->values()[Lr2/a;

    .line 711
    .line 712
    .line 713
    move-result-object v5

    .line 714
    aget-object v3, v5, v3

    .line 715
    .line 716
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 717
    .line 718
    .line 719
    goto :goto_4

    .line 720
    :catch_1
    move-exception v1

    .line 721
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 722
    .line 723
    .line 724
    move-result-object v1

    .line 725
    check-cast p2, LQ2/g;

    .line 726
    .line 727
    invoke-virtual {p2, v4, v1, v7}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 728
    .line 729
    .line 730
    goto :goto_5

    .line 731
    :cond_21
    move-object v1, v7

    .line 732
    :cond_22
    if-nez v1, :cond_23

    .line 733
    .line 734
    goto :goto_5

    .line 735
    :cond_23
    move-object v0, v1

    .line 736
    :goto_5
    const/4 p2, 0x2

    .line 737
    if-nez p1, :cond_24

    .line 738
    .line 739
    iget-object p1, p0, LX3/d;->l:LX3/a;

    .line 740
    .line 741
    if-eqz p1, :cond_25

    .line 742
    .line 743
    new-instance v1, LJ0/p;

    .line 744
    .line 745
    invoke-direct {v1, v7, v7, v7, p2}, LJ0/p;-><init>(Ljava/util/Collection;Ljava/util/EnumMap;Ljava/lang/String;I)V

    .line 746
    .line 747
    .line 748
    invoke-virtual {p1, v1}, Lcom/journeyapps/barcodescanner/BarcodeView;->setDecoderFactory(LT2/m;)V

    .line 749
    .line 750
    .line 751
    goto :goto_6

    .line 752
    :cond_24
    iget-object p1, p0, LX3/d;->l:LX3/a;

    .line 753
    .line 754
    if-eqz p1, :cond_25

    .line 755
    .line 756
    new-instance v1, LJ0/p;

    .line 757
    .line 758
    invoke-direct {v1, v0, v7, v7, p2}, LJ0/p;-><init>(Ljava/util/Collection;Ljava/util/EnumMap;Ljava/lang/String;I)V

    .line 759
    .line 760
    .line 761
    invoke-virtual {p1, v1}, Lcom/journeyapps/barcodescanner/BarcodeView;->setDecoderFactory(LT2/m;)V

    .line 762
    .line 763
    .line 764
    :cond_25
    :goto_6
    iget-object p1, p0, LX3/d;->l:LX3/a;

    .line 765
    .line 766
    if-eqz p1, :cond_26

    .line 767
    .line 768
    new-instance p2, LA/c;

    .line 769
    .line 770
    const/16 v1, 0x1c

    .line 771
    .line 772
    invoke-direct {p2, v1, v0, p0}, LA/c;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 773
    .line 774
    .line 775
    const/4 v0, 0x3

    .line 776
    iput v0, p1, Lcom/journeyapps/barcodescanner/BarcodeView;->F:I

    .line 777
    .line 778
    iput-object p2, p1, Lcom/journeyapps/barcodescanner/BarcodeView;->G:LT2/a;

    .line 779
    .line 780
    invoke-virtual {p1}, Lcom/journeyapps/barcodescanner/BarcodeView;->j()V

    .line 781
    .line 782
    .line 783
    :cond_26
    :goto_7
    return-void

    .line 784
    :cond_27
    :goto_8
    check-cast p2, LQ2/g;

    .line 785
    .line 786
    invoke-virtual {p2}, LQ2/g;->b()V

    .line 787
    .line 788
    .line 789
    return-void

    .line 790
    nop

    .line 791
    :sswitch_data_0
    .sparse-switch
        -0x7eeb0201 -> :sswitch_c
        -0x7dc6177e -> :sswitch_b
        -0x6cc4d239 -> :sswitch_a
        -0x4621b386 -> :sswitch_9
        -0x44f93df8 -> :sswitch_8
        -0x27ddc704 -> :sswitch_7
        0x1a15e9f2 -> :sswitch_6
        0x3d2ee1b2 -> :sswitch_5
        0x637dca75 -> :sswitch_4
        0x6635719f -> :sswitch_3
        0x71397f73 -> :sswitch_2
        0x764d3969 -> :sswitch_1
        0x780404bb -> :sswitch_0
    .end sparse-switch
.end method

.method public final onRequestPermissionsResult(I[Ljava/lang/String;[I)Z
    .locals 2

    .line 1
    const-string v0, "permissions"

    .line 2
    .line 3
    invoke-static {p2, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p2, "grantResults"

    .line 7
    .line 8
    invoke-static {p3, p2}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget p2, p0, LX3/d;->g:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    if-eq p1, p2, :cond_0

    .line 15
    .line 16
    return v0

    .line 17
    :cond_0
    array-length p1, p3

    .line 18
    const/4 p2, 0x0

    .line 19
    if-nez p1, :cond_1

    .line 20
    .line 21
    move-object p1, p2

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    aget p1, p3, v0

    .line 24
    .line 25
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    :goto_0
    if-nez p1, :cond_2

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-nez p1, :cond_3

    .line 37
    .line 38
    const/4 v0, 0x1

    .line 39
    :cond_3
    :goto_1
    const-string p1, "onPermissionSet"

    .line 40
    .line 41
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    iget-object v1, p0, LX3/d;->h:Lk3/o;

    .line 46
    .line 47
    invoke-virtual {v1, p1, p3, p2}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 48
    .line 49
    .line 50
    return v0
.end method

.method public final u()Landroid/view/View;
    .locals 4

    .line 1
    iget-object v0, p0, LX3/d;->l:LX3/a;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    new-instance v0, LX3/a;

    .line 6
    .line 7
    sget-object v1, Landroid/support/v4/media/session/a;->a:Landroid/app/Activity;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Lcom/journeyapps/barcodescanner/BarcodeView;-><init>(Landroid/app/Activity;)V

    .line 10
    .line 11
    .line 12
    const/4 v1, -0x1

    .line 13
    iput v1, v0, LX3/a;->K:I

    .line 14
    .line 15
    iput-object v0, p0, LX3/d;->l:LX3/a;

    .line 16
    .line 17
    new-instance v1, LJ0/p;

    .line 18
    .line 19
    const/4 v2, 0x2

    .line 20
    const/4 v3, 0x0

    .line 21
    invoke-direct {v1, v3, v3, v3, v2}, LJ0/p;-><init>(Ljava/util/Collection;Ljava/util/EnumMap;Ljava/lang/String;I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/journeyapps/barcodescanner/BarcodeView;->setDecoderFactory(LT2/m;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, LX3/d;->f:Ljava/util/HashMap;

    .line 28
    .line 29
    const-string v2, "cameraFacing"

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v2, "null cannot be cast to non-null type kotlin.Int"

    .line 36
    .line 37
    invoke-static {v1, v2}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    check-cast v1, Ljava/lang/Integer;

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    const/4 v2, 0x1

    .line 47
    if-ne v1, v2, :cond_0

    .line 48
    .line 49
    invoke-virtual {v0}, LT2/g;->getCameraSettings()LU2/j;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    if-eqz v1, :cond_0

    .line 54
    .line 55
    iget v2, p0, LX3/d;->i:I

    .line 56
    .line 57
    iput v2, v1, LU2/j;->a:I

    .line 58
    .line 59
    :cond_0
    return-object v0

    .line 60
    :cond_1
    iget-boolean v1, p0, LX3/d;->k:Z

    .line 61
    .line 62
    if-nez v1, :cond_2

    .line 63
    .line 64
    invoke-virtual {v0}, LT2/g;->e()V

    .line 65
    .line 66
    .line 67
    :cond_2
    return-object v0
.end method
