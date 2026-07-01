.class public final LK0/d;
.super LK0/e;
.source "SourceFile"


# static fields
.field public static final c:Ljava/lang/Object;

.field public static final d:LK0/d;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LK0/d;->c:Ljava/lang/Object;

    .line 7
    .line 8
    new-instance v0, LK0/d;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, LK0/d;->d:LK0/d;

    .line 14
    .line 15
    return-void
.end method

.method public static d(Landroid/app/Activity;ILN0/k;Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    new-instance v1, Landroid/util/TypedValue;

    .line 6
    .line 7
    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    const v3, 0x1010309

    .line 15
    .line 16
    .line 17
    const/4 v4, 0x1

    .line 18
    invoke-virtual {v2, v3, v1, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget v1, v1, Landroid/util/TypedValue;->resourceId:I

    .line 26
    .line 27
    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "Theme.Dialog.Alert"

    .line 32
    .line 33
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    new-instance v0, Landroid/app/AlertDialog$Builder;

    .line 40
    .line 41
    const/4 v1, 0x5

    .line 42
    invoke-direct {v0, p0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    if-nez v0, :cond_2

    .line 46
    .line 47
    new-instance v0, Landroid/app/AlertDialog$Builder;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 50
    .line 51
    .line 52
    :cond_2
    invoke-static {p0, p1}, LN0/j;->c(Landroid/content/Context;I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 57
    .line 58
    .line 59
    if-eqz p3, :cond_3

    .line 60
    .line 61
    invoke-virtual {v0, p3}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    .line 62
    .line 63
    .line 64
    :cond_3
    invoke-static {p0, p1}, LN0/j;->b(Landroid/content/Context;I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p3

    .line 68
    if-eqz p3, :cond_4

    .line 69
    .line 70
    invoke-virtual {v0, p3, p2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 71
    .line 72
    .line 73
    :cond_4
    invoke-static {p0, p1}, LN0/j;->d(Landroid/content/Context;I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    if-eqz p0, :cond_5

    .line 78
    .line 79
    invoke-virtual {v0, p0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 80
    .line 81
    .line 82
    :cond_5
    const-string p0, "Creating dialog for Google Play services availability issue. ConnectionResult="

    .line 83
    .line 84
    invoke-static {p0, p1}, LE1/j;->j(Ljava/lang/String;I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 89
    .line 90
    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 91
    .line 92
    .line 93
    const-string p2, "GoogleApiAvailability"

    .line 94
    .line 95
    invoke-static {p2, p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    return-object p0
.end method

.method public static e(Landroid/app/Activity;Landroid/app/AlertDialog;Ljava/lang/String;Landroid/content/DialogInterface$OnCancelListener;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, LK0/b;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/app/DialogFragment;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v1, "Cannot display null dialog"

    .line 11
    .line 12
    invoke-static {p1, v1}, LN0/n;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p1, v1}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 20
    .line 21
    .line 22
    iput-object p1, v0, LK0/b;->e:Landroid/app/Dialog;

    .line 23
    .line 24
    if-eqz p3, :cond_0

    .line 25
    .line 26
    iput-object p3, v0, LK0/b;->f:Landroid/content/DialogInterface$OnCancelListener;

    .line 27
    .line 28
    :cond_0
    invoke-virtual {v0, p0, p2}, Landroid/app/DialogFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public final c(Lcom/google/android/gms/common/api/GoogleApiActivity;ILcom/google/android/gms/common/api/GoogleApiActivity;)V
    .locals 3

    .line 1
    const-string v0, "d"

    .line 2
    .line 3
    invoke-super {p0, p2, p1, v0}, LK0/e;->a(ILandroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, LN0/k;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-direct {v1, v0, p1, v2}, LN0/k;-><init>(Landroid/content/Intent;Ljava/lang/Object;I)V

    .line 11
    .line 12
    .line 13
    invoke-static {p1, p2, v1, p3}, LK0/d;->d(Landroid/app/Activity;ILN0/k;Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    if-nez p2, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const-string v0, "GooglePlayServicesErrorDialog"

    .line 21
    .line 22
    invoke-static {p1, p2, v0, p3}, LK0/d;->e(Landroid/app/Activity;Landroid/app/AlertDialog;Ljava/lang/String;Landroid/content/DialogInterface$OnCancelListener;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final f(Landroid/content/Context;ILandroid/app/PendingIntent;)V
    .locals 18

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    const-string v2, "GMS core API Availability. ConnectionResult="

    .line 6
    .line 7
    const-string v3, ", tag=null"

    .line 8
    .line 9
    invoke-static {v1, v2, v3}, LE1/j;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    new-instance v3, Ljava/lang/IllegalArgumentException;

    .line 14
    .line 15
    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v4, "GoogleApiAvailability"

    .line 19
    .line 20
    invoke-static {v4, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 21
    .line 22
    .line 23
    const/16 v2, 0x12

    .line 24
    .line 25
    const/4 v13, 0x1

    .line 26
    if-ne v1, v2, :cond_0

    .line 27
    .line 28
    new-instance v1, LK0/j;

    .line 29
    .line 30
    move-object/from16 v14, p0

    .line 31
    .line 32
    invoke-direct {v1, v14, v0}, LK0/j;-><init>(LK0/d;Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    const-wide/32 v2, 0x1d4c0

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, v13, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    move-object/from16 v14, p0

    .line 43
    .line 44
    const/4 v2, 0x6

    .line 45
    if-nez p3, :cond_2

    .line 46
    .line 47
    if-ne v1, v2, :cond_1

    .line 48
    .line 49
    const-string v0, "GoogleApiAvailability"

    .line 50
    .line 51
    const-string v1, "Missing resolution for ConnectionResult.RESOLUTION_REQUIRED. Call GoogleApiAvailability#showErrorNotification(Context, ConnectionResult) instead."

    .line 52
    .line 53
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void

    .line 57
    :cond_2
    if-ne v1, v2, :cond_3

    .line 58
    .line 59
    const-string v3, "common_google_play_services_resolution_required_title"

    .line 60
    .line 61
    invoke-static {v0, v3}, LN0/j;->f(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    goto :goto_0

    .line 66
    :cond_3
    invoke-static/range {p1 .. p2}, LN0/j;->d(Landroid/content/Context;I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    :goto_0
    const v4, 0x7f0e002b

    .line 71
    .line 72
    .line 73
    if-nez v3, :cond_4

    .line 74
    .line 75
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    :cond_4
    if-eq v1, v2, :cond_6

    .line 84
    .line 85
    const/16 v2, 0x13

    .line 86
    .line 87
    if-ne v1, v2, :cond_5

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_5
    invoke-static/range {p1 .. p2}, LN0/j;->c(Landroid/content/Context;I)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    goto :goto_2

    .line 95
    :cond_6
    :goto_1
    invoke-static {v0}, LN0/j;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    const-string v5, "common_google_play_services_resolution_required_text"

    .line 100
    .line 101
    invoke-static {v0, v5, v2}, LN0/j;->e(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    :goto_2
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    const-string v6, "notification"

    .line 110
    .line 111
    invoke-virtual {v0, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v6

    .line 115
    invoke-static {v6}, LN0/n;->e(Ljava/lang/Object;)V

    .line 116
    .line 117
    .line 118
    move-object v15, v6

    .line 119
    check-cast v15, Landroid/app/NotificationManager;

    .line 120
    .line 121
    new-instance v6, Lt/i;

    .line 122
    .line 123
    const/4 v7, 0x0

    .line 124
    invoke-direct {v6, v0, v7}, Lt/i;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    iput-boolean v13, v6, Lt/i;->u:Z

    .line 128
    .line 129
    const/16 v8, 0x10

    .line 130
    .line 131
    invoke-virtual {v6, v8, v13}, Lt/i;->c(IZ)V

    .line 132
    .line 133
    .line 134
    invoke-static {v3}, Lt/i;->b(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    iput-object v3, v6, Lt/i;->e:Ljava/lang/CharSequence;

    .line 139
    .line 140
    new-instance v3, Lt/g;

    .line 141
    .line 142
    const/4 v8, 0x0

    .line 143
    invoke-direct {v3, v8}, Lt/g;-><init>(I)V

    .line 144
    .line 145
    .line 146
    invoke-static {v2}, Lt/i;->b(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 147
    .line 148
    .line 149
    move-result-object v8

    .line 150
    iput-object v8, v3, Lt/g;->f:Ljava/lang/Object;

    .line 151
    .line 152
    invoke-virtual {v6, v3}, Lt/i;->f(Lt/A;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 156
    .line 157
    .line 158
    move-result-object v3

    .line 159
    sget-object v8, LR0/b;->b:Ljava/lang/Boolean;

    .line 160
    .line 161
    if-nez v8, :cond_7

    .line 162
    .line 163
    const-string v8, "android.hardware.type.watch"

    .line 164
    .line 165
    invoke-virtual {v3, v8}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 166
    .line 167
    .line 168
    move-result v3

    .line 169
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 170
    .line 171
    .line 172
    move-result-object v3

    .line 173
    sput-object v3, LR0/b;->b:Ljava/lang/Boolean;

    .line 174
    .line 175
    :cond_7
    sget-object v3, LR0/b;->b:Ljava/lang/Boolean;

    .line 176
    .line 177
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 178
    .line 179
    .line 180
    move-result v3

    .line 181
    const/4 v8, 0x2

    .line 182
    if-eqz v3, :cond_9

    .line 183
    .line 184
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    iget v2, v2, Landroid/content/pm/ApplicationInfo;->icon:I

    .line 189
    .line 190
    iget-object v3, v6, Lt/i;->G:Landroid/app/Notification;

    .line 191
    .line 192
    iput v2, v3, Landroid/app/Notification;->icon:I

    .line 193
    .line 194
    iput v8, v6, Lt/i;->k:I

    .line 195
    .line 196
    invoke-static {v0}, LR0/b;->c(Landroid/content/Context;)Z

    .line 197
    .line 198
    .line 199
    move-result v2

    .line 200
    if-eqz v2, :cond_8

    .line 201
    .line 202
    const v2, 0x7f0e0033

    .line 203
    .line 204
    .line 205
    invoke-virtual {v5, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v4

    .line 209
    iget-object v2, v6, Lt/i;->b:Ljava/util/ArrayList;

    .line 210
    .line 211
    move-object v3, v2

    .line 212
    new-instance v2, Lt/c;

    .line 213
    .line 214
    const-string v5, ""

    .line 215
    .line 216
    const v9, 0x7f070059

    .line 217
    .line 218
    .line 219
    invoke-static {v7, v5, v9}, Landroidx/core/graphics/drawable/IconCompat;->e(Landroid/content/res/Resources;Ljava/lang/String;I)Landroidx/core/graphics/drawable/IconCompat;

    .line 220
    .line 221
    .line 222
    move-result-object v5

    .line 223
    move-object v7, v6

    .line 224
    new-instance v6, Landroid/os/Bundle;

    .line 225
    .line 226
    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    .line 227
    .line 228
    .line 229
    const/4 v11, 0x1

    .line 230
    const/4 v12, 0x0

    .line 231
    move-object v9, v7

    .line 232
    const/4 v7, 0x0

    .line 233
    move v10, v8

    .line 234
    const/4 v8, 0x0

    .line 235
    move-object/from16 v16, v9

    .line 236
    .line 237
    const/4 v9, 0x1

    .line 238
    move/from16 v17, v10

    .line 239
    .line 240
    const/4 v10, 0x0

    .line 241
    move-object v0, v3

    .line 242
    move-object v3, v5

    .line 243
    move-object/from16 v13, v16

    .line 244
    .line 245
    move/from16 v14, v17

    .line 246
    .line 247
    move-object/from16 v5, p3

    .line 248
    .line 249
    invoke-direct/range {v2 .. v12}, Lt/c;-><init>(Landroidx/core/graphics/drawable/IconCompat;Ljava/lang/CharSequence;Landroid/app/PendingIntent;Landroid/os/Bundle;[Lt/J;[Lt/J;ZIZZ)V

    .line 250
    .line 251
    .line 252
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 253
    .line 254
    .line 255
    goto :goto_3

    .line 256
    :cond_8
    move-object/from16 v0, p3

    .line 257
    .line 258
    move-object v13, v6

    .line 259
    move v14, v8

    .line 260
    iput-object v0, v13, Lt/i;->g:Landroid/app/PendingIntent;

    .line 261
    .line 262
    goto :goto_3

    .line 263
    :cond_9
    move-object/from16 v0, p3

    .line 264
    .line 265
    move-object v13, v6

    .line 266
    move v14, v8

    .line 267
    const v3, 0x108008a

    .line 268
    .line 269
    .line 270
    iget-object v6, v13, Lt/i;->G:Landroid/app/Notification;

    .line 271
    .line 272
    iput v3, v6, Landroid/app/Notification;->icon:I

    .line 273
    .line 274
    invoke-virtual {v5, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v3

    .line 278
    iget-object v4, v13, Lt/i;->G:Landroid/app/Notification;

    .line 279
    .line 280
    invoke-static {v3}, Lt/i;->b(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 281
    .line 282
    .line 283
    move-result-object v3

    .line 284
    iput-object v3, v4, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    .line 285
    .line 286
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 287
    .line 288
    .line 289
    move-result-wide v3

    .line 290
    iget-object v5, v13, Lt/i;->G:Landroid/app/Notification;

    .line 291
    .line 292
    iput-wide v3, v5, Landroid/app/Notification;->when:J

    .line 293
    .line 294
    iput-object v0, v13, Lt/i;->g:Landroid/app/PendingIntent;

    .line 295
    .line 296
    invoke-static {v2}, Lt/i;->b(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    iput-object v0, v13, Lt/i;->f:Ljava/lang/CharSequence;

    .line 301
    .line 302
    :goto_3
    invoke-static {}, LR0/b;->b()Z

    .line 303
    .line 304
    .line 305
    move-result v0

    .line 306
    if-nez v0, :cond_a

    .line 307
    .line 308
    goto :goto_5

    .line 309
    :cond_a
    invoke-static {}, LR0/b;->b()Z

    .line 310
    .line 311
    .line 312
    move-result v0

    .line 313
    if-eqz v0, :cond_e

    .line 314
    .line 315
    sget-object v2, LK0/d;->c:Ljava/lang/Object;

    .line 316
    .line 317
    monitor-enter v2

    .line 318
    :try_start_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 319
    const-string v0, "com.google.android.gms.availability"

    .line 320
    .line 321
    invoke-static {v15}, LB/a;->c(Landroid/app/NotificationManager;)Landroid/app/NotificationChannel;

    .line 322
    .line 323
    .line 324
    move-result-object v2

    .line 325
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 326
    .line 327
    .line 328
    move-result-object v3

    .line 329
    const v4, 0x7f0e002a

    .line 330
    .line 331
    .line 332
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object v3

    .line 336
    if-nez v2, :cond_b

    .line 337
    .line 338
    invoke-static {v3}, LB/a;->d(Ljava/lang/String;)Landroid/app/NotificationChannel;

    .line 339
    .line 340
    .line 341
    move-result-object v2

    .line 342
    invoke-static {v15, v2}, Lcom/dexterous/flutterlocalnotifications/a;->s(Landroid/app/NotificationManager;Landroid/app/NotificationChannel;)V

    .line 343
    .line 344
    .line 345
    goto :goto_4

    .line 346
    :cond_b
    invoke-static {v2}, Lcom/dexterous/flutterlocalnotifications/a;->k(Landroid/app/NotificationChannel;)Ljava/lang/CharSequence;

    .line 347
    .line 348
    .line 349
    move-result-object v4

    .line 350
    invoke-virtual {v3, v4}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    .line 351
    .line 352
    .line 353
    move-result v4

    .line 354
    if-nez v4, :cond_c

    .line 355
    .line 356
    invoke-static {v2, v3}, LB/a;->p(Landroid/app/NotificationChannel;Ljava/lang/String;)V

    .line 357
    .line 358
    .line 359
    invoke-static {v15, v2}, Lcom/dexterous/flutterlocalnotifications/a;->s(Landroid/app/NotificationManager;Landroid/app/NotificationChannel;)V

    .line 360
    .line 361
    .line 362
    :cond_c
    :goto_4
    iput-object v0, v13, Lt/i;->B:Ljava/lang/String;

    .line 363
    .line 364
    :goto_5
    invoke-virtual {v13}, Lt/i;->a()Landroid/app/Notification;

    .line 365
    .line 366
    .line 367
    move-result-object v0

    .line 368
    const/4 v2, 0x1

    .line 369
    if-eq v1, v2, :cond_d

    .line 370
    .line 371
    if-eq v1, v14, :cond_d

    .line 372
    .line 373
    const/4 v2, 0x3

    .line 374
    if-eq v1, v2, :cond_d

    .line 375
    .line 376
    const v1, 0x9b6d

    .line 377
    .line 378
    .line 379
    goto :goto_6

    .line 380
    :cond_d
    sget-object v1, LK0/g;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 381
    .line 382
    const/4 v2, 0x0

    .line 383
    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 384
    .line 385
    .line 386
    const/16 v1, 0x28c4

    .line 387
    .line 388
    :goto_6
    invoke-virtual {v15, v1, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 389
    .line 390
    .line 391
    return-void

    .line 392
    :catchall_0
    move-exception v0

    .line 393
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 394
    throw v0

    .line 395
    :cond_e
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 396
    .line 397
    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    .line 398
    .line 399
    .line 400
    throw v0
.end method

.method public final g(Landroid/app/Activity;LM0/x;ILandroid/content/DialogInterface$OnCancelListener;)V
    .locals 3

    .line 1
    const-string v0, "d"

    .line 2
    .line 3
    invoke-super {p0, p3, p1, v0}, LK0/e;->a(ILandroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, LN0/k;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-direct {v1, v0, p2, v2}, LN0/k;-><init>(Landroid/content/Intent;Ljava/lang/Object;I)V

    .line 11
    .line 12
    .line 13
    invoke-static {p1, p3, v1, p4}, LK0/d;->d(Landroid/app/Activity;ILN0/k;Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    if-nez p2, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const-string p3, "GooglePlayServicesErrorDialog"

    .line 21
    .line 22
    invoke-static {p1, p2, p3, p4}, LK0/d;->e(Landroid/app/Activity;Landroid/app/AlertDialog;Ljava/lang/String;Landroid/content/DialogInterface$OnCancelListener;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
