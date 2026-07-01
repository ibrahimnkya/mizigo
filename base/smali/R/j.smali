.class public final LR/j;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:I

.field public b:I

.field public final c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x0

    iput v0, p0, LR/j;->a:I

    .line 199
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 200
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, LR/j;->c:Ljava/lang/Object;

    .line 201
    new-instance v0, LR/k;

    .line 202
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 203
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, LR/k;->a:Ljava/util/ArrayList;

    .line 204
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 205
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 206
    iput-object v0, p0, LR/j;->e:Ljava/lang/Object;

    .line 207
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 208
    new-instance v0, LK0/h;

    .line 209
    invoke-direct {v0}, LK0/h;-><init>()V

    .line 210
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, LR/j;->f:Ljava/lang/Object;

    .line 211
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 212
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    .line 213
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 214
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    .line 215
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 216
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    .line 217
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 218
    new-instance v0, LN1/e;

    invoke-direct {v0, p0}, LN1/e;-><init>(LR/j;)V

    .line 219
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 220
    new-instance v0, LR/f;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, LR/f;-><init>(LR/j;I)V

    .line 221
    new-instance v0, LR/f;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, LR/f;-><init>(LR/j;I)V

    .line 222
    new-instance v0, LR/g;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, LR/g;-><init>(LR/j;I)V

    .line 223
    new-instance v0, LR/g;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, LR/g;-><init>(LR/j;I)V

    const/4 v0, -0x1

    .line 224
    iput v0, p0, LR/j;->b:I

    .line 225
    new-instance v0, LR/i;

    .line 226
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    .line 227
    new-instance v0, LA/b;

    const/4 v1, 0x6

    invoke-direct {v0, v1, p0}, LA/b;-><init>(ILjava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(LZ2/d;LZ2/s;LZ2/d;)V
    .locals 2

    const/4 v0, 0x1

    iput v0, p0, LR/j;->a:I

    .line 228
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 229
    new-instance v0, Lio/flutter/plugin/platform/m;

    const/4 v1, 0x1

    invoke-direct {v0, v1, p0}, Lio/flutter/plugin/platform/m;-><init>(ILjava/lang/Object;)V

    .line 230
    iput-object p1, p0, LR/j;->c:Ljava/lang/Object;

    .line 231
    iput-object p2, p0, LR/j;->d:Ljava/lang/Object;

    .line 232
    iput-object v0, p2, LZ2/s;->g:Ljava/lang/Object;

    .line 233
    iput-object p3, p0, LR/j;->e:Ljava/lang/Object;

    const/16 p1, 0x500

    .line 234
    iput p1, p0, LR/j;->b:I

    return-void
.end method

.method public constructor <init>(Lt/i;)V
    .locals 25

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/4 v2, 0x2

    iput v2, v0, LR/j;->a:I

    .line 1
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 3
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    iput-object v2, v0, LR/j;->f:Ljava/lang/Object;

    .line 4
    iput-object v1, v0, LR/j;->e:Ljava/lang/Object;

    .line 5
    iget-object v2, v1, Lt/i;->a:Landroid/content/Context;

    iget-object v3, v1, Lt/i;->I:Ljava/util/ArrayList;

    iget-object v4, v1, Lt/i;->c:Ljava/util/ArrayList;

    iget-object v5, v1, Lt/i;->d:Ljava/util/ArrayList;

    iput-object v2, v0, LR/j;->c:Ljava/lang/Object;

    .line 6
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x1a

    if-lt v6, v7, :cond_0

    .line 7
    iget-object v6, v1, Lt/i;->B:Ljava/lang/String;

    invoke-static {v2, v6}, LD/f;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/app/Notification$Builder;

    move-result-object v6

    iput-object v6, v0, LR/j;->d:Ljava/lang/Object;

    goto :goto_0

    .line 8
    :cond_0
    new-instance v6, Landroid/app/Notification$Builder;

    iget-object v8, v1, Lt/i;->a:Landroid/content/Context;

    invoke-direct {v6, v8}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    iput-object v6, v0, LR/j;->d:Ljava/lang/Object;

    .line 9
    :goto_0
    iget-object v6, v1, Lt/i;->G:Landroid/app/Notification;

    .line 10
    iget-object v8, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v8, Landroid/app/Notification$Builder;

    iget-wide v9, v6, Landroid/app/Notification;->when:J

    invoke-virtual {v8, v9, v10}, Landroid/app/Notification$Builder;->setWhen(J)Landroid/app/Notification$Builder;

    move-result-object v8

    iget v9, v6, Landroid/app/Notification;->icon:I

    iget v10, v6, Landroid/app/Notification;->iconLevel:I

    .line 11
    invoke-virtual {v8, v9, v10}, Landroid/app/Notification$Builder;->setSmallIcon(II)Landroid/app/Notification$Builder;

    move-result-object v8

    iget-object v9, v6, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    .line 12
    invoke-virtual {v8, v9}, Landroid/app/Notification$Builder;->setContent(Landroid/widget/RemoteViews;)Landroid/app/Notification$Builder;

    move-result-object v8

    iget-object v9, v6, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    const/4 v10, 0x0

    .line 13
    invoke-virtual {v8, v9, v10}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;Landroid/widget/RemoteViews;)Landroid/app/Notification$Builder;

    move-result-object v8

    iget-object v9, v6, Landroid/app/Notification;->vibrate:[J

    .line 14
    invoke-virtual {v8, v9}, Landroid/app/Notification$Builder;->setVibrate([J)Landroid/app/Notification$Builder;

    move-result-object v8

    iget v9, v6, Landroid/app/Notification;->ledARGB:I

    iget v11, v6, Landroid/app/Notification;->ledOnMS:I

    iget v12, v6, Landroid/app/Notification;->ledOffMS:I

    .line 15
    invoke-virtual {v8, v9, v11, v12}, Landroid/app/Notification$Builder;->setLights(III)Landroid/app/Notification$Builder;

    move-result-object v8

    iget v9, v6, Landroid/app/Notification;->flags:I

    const/4 v11, 0x2

    and-int/2addr v9, v11

    const/4 v12, 0x1

    if-eqz v9, :cond_1

    move v9, v12

    goto :goto_1

    :cond_1
    const/4 v9, 0x0

    .line 16
    :goto_1
    invoke-virtual {v8, v9}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    move-result-object v8

    iget v9, v6, Landroid/app/Notification;->flags:I

    and-int/lit8 v9, v9, 0x8

    if-eqz v9, :cond_2

    move v9, v12

    goto :goto_2

    :cond_2
    const/4 v9, 0x0

    .line 17
    :goto_2
    invoke-virtual {v8, v9}, Landroid/app/Notification$Builder;->setOnlyAlertOnce(Z)Landroid/app/Notification$Builder;

    move-result-object v8

    iget v9, v6, Landroid/app/Notification;->flags:I

    and-int/lit8 v9, v9, 0x10

    if-eqz v9, :cond_3

    move v9, v12

    goto :goto_3

    :cond_3
    const/4 v9, 0x0

    .line 18
    :goto_3
    invoke-virtual {v8, v9}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object v8

    iget v9, v6, Landroid/app/Notification;->defaults:I

    .line 19
    invoke-virtual {v8, v9}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    move-result-object v8

    iget-object v9, v1, Lt/i;->e:Ljava/lang/CharSequence;

    .line 20
    invoke-virtual {v8, v9}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v8

    iget-object v9, v1, Lt/i;->f:Ljava/lang/CharSequence;

    .line 21
    invoke-virtual {v8, v9}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v8

    .line 22
    invoke-virtual {v8, v10}, Landroid/app/Notification$Builder;->setContentInfo(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v8

    iget-object v9, v1, Lt/i;->g:Landroid/app/PendingIntent;

    .line 23
    invoke-virtual {v8, v9}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v8

    iget-object v9, v6, Landroid/app/Notification;->deleteIntent:Landroid/app/PendingIntent;

    .line 24
    invoke-virtual {v8, v9}, Landroid/app/Notification$Builder;->setDeleteIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v8

    iget-object v9, v1, Lt/i;->h:Landroid/app/PendingIntent;

    iget v14, v6, Landroid/app/Notification;->flags:I

    and-int/lit16 v14, v14, 0x80

    if-eqz v14, :cond_4

    move v14, v12

    goto :goto_4

    :cond_4
    const/4 v14, 0x0

    .line 25
    :goto_4
    invoke-virtual {v8, v9, v14}, Landroid/app/Notification$Builder;->setFullScreenIntent(Landroid/app/PendingIntent;Z)Landroid/app/Notification$Builder;

    move-result-object v8

    iget v9, v1, Lt/i;->j:I

    .line 26
    invoke-virtual {v8, v9}, Landroid/app/Notification$Builder;->setNumber(I)Landroid/app/Notification$Builder;

    move-result-object v8

    iget v9, v1, Lt/i;->p:I

    iget v14, v1, Lt/i;->q:I

    iget-boolean v15, v1, Lt/i;->r:Z

    .line 27
    invoke-virtual {v8, v9, v14, v15}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    .line 28
    iget-object v8, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v8, Landroid/app/Notification$Builder;

    .line 29
    iget-object v9, v1, Lt/i;->i:Landroidx/core/graphics/drawable/IconCompat;

    if-nez v9, :cond_5

    move-object v2, v10

    goto :goto_5

    :cond_5
    invoke-virtual {v9, v2}, Landroidx/core/graphics/drawable/IconCompat;->h(Landroid/content/Context;)Landroid/graphics/drawable/Icon;

    move-result-object v2

    .line 30
    :goto_5
    invoke-virtual {v8, v2}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/drawable/Icon;)Landroid/app/Notification$Builder;

    .line 31
    iget-object v2, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v2, Landroid/app/Notification$Builder;

    iget-object v8, v1, Lt/i;->o:Ljava/lang/CharSequence;

    invoke-virtual {v2, v8}, Landroid/app/Notification$Builder;->setSubText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v2

    .line 32
    iget-boolean v8, v1, Lt/i;->m:Z

    invoke-virtual {v2, v8}, Landroid/app/Notification$Builder;->setUsesChronometer(Z)Landroid/app/Notification$Builder;

    move-result-object v2

    .line 33
    iget v8, v1, Lt/i;->k:I

    invoke-virtual {v2, v8}, Landroid/app/Notification$Builder;->setPriority(I)Landroid/app/Notification$Builder;

    .line 34
    iget-object v2, v1, Lt/i;->n:Lt/A;

    instance-of v8, v2, Lt/n;

    if-eqz v8, :cond_10

    .line 35
    move-object v14, v2

    check-cast v14, Lt/n;

    .line 36
    iget-object v2, v14, Lt/n;->h:Landroid/app/PendingIntent;

    const v15, 0x7f070073

    if-nez v2, :cond_6

    .line 37
    iget-object v2, v14, Lt/n;->l:Ljava/lang/Integer;

    const v18, 0x7f05002a

    iget-object v8, v14, Lt/n;->i:Landroid/app/PendingIntent;

    const v16, 0x7f0e0020

    move-object/from16 v17, v2

    move-object/from16 v19, v8

    invoke-virtual/range {v14 .. v19}, Lt/n;->e(IILjava/lang/Integer;ILandroid/app/PendingIntent;)Lt/c;

    move-result-object v2

    goto :goto_6

    .line 38
    :cond_6
    iget-object v8, v14, Lt/n;->l:Ljava/lang/Integer;

    const v18, 0x7f05002a

    const v16, 0x7f0e001f

    move-object/from16 v19, v2

    move-object/from16 v17, v8

    invoke-virtual/range {v14 .. v19}, Lt/n;->e(IILjava/lang/Integer;ILandroid/app/PendingIntent;)Lt/c;

    move-result-object v2

    .line 39
    :goto_6
    iget-object v8, v14, Lt/n;->g:Landroid/app/PendingIntent;

    if-nez v8, :cond_7

    move-object v8, v10

    goto :goto_a

    .line 40
    :cond_7
    iget-boolean v9, v14, Lt/n;->j:Z

    if-eqz v9, :cond_8

    const v15, 0x7f070071

    goto :goto_7

    :cond_8
    const v15, 0x7f07006f

    :goto_7
    if-eqz v9, :cond_9

    const v9, 0x7f0e001e

    :goto_8
    move/from16 v16, v9

    goto :goto_9

    :cond_9
    const v9, 0x7f0e001d

    goto :goto_8

    .line 41
    :goto_9
    iget-object v9, v14, Lt/n;->k:Ljava/lang/Integer;

    const v18, 0x7f050029

    move-object/from16 v19, v8

    move-object/from16 v17, v9

    .line 42
    invoke-virtual/range {v14 .. v19}, Lt/n;->e(IILjava/lang/Integer;ILandroid/app/PendingIntent;)Lt/c;

    move-result-object v8

    .line 43
    :goto_a
    new-instance v9, Ljava/util/ArrayList;

    const/4 v15, 0x3

    invoke-direct {v9, v15}, Ljava/util/ArrayList;-><init>(I)V

    .line 44
    invoke-virtual {v9, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 45
    iget-object v2, v14, Lt/A;->a:Lt/i;

    iget-object v2, v2, Lt/i;->b:Ljava/util/ArrayList;

    if-eqz v2, :cond_d

    .line 46
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v14

    move v15, v11

    const/4 v11, 0x0

    :goto_b
    if-ge v11, v14, :cond_e

    invoke-virtual {v2, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v17

    add-int/lit8 v11, v11, 0x1

    move-object/from16 v13, v17

    check-cast v13, Lt/c;

    .line 47
    iget-boolean v7, v13, Lt/c;->g:Z

    if-eqz v7, :cond_a

    .line 48
    invoke-virtual {v9, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_c

    .line 49
    :cond_a
    iget-object v7, v13, Lt/c;->a:Landroid/os/Bundle;

    .line 50
    const-string v10, "key_action_priority"

    invoke-virtual {v7, v10}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_b

    goto :goto_c

    .line 51
    :cond_b
    invoke-virtual {v9, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v15, v15, -0x1

    :goto_c
    if-eqz v8, :cond_c

    if-ne v15, v12, :cond_c

    .line 52
    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v15, v15, -0x1

    :cond_c
    const/16 v7, 0x1a

    const/4 v10, 0x0

    goto :goto_b

    :cond_d
    const/4 v15, 0x2

    :cond_e
    if-eqz v8, :cond_f

    if-lt v15, v12, :cond_f

    .line 53
    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    :cond_f
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v7, 0x0

    :goto_d
    if-ge v7, v2, :cond_11

    invoke-virtual {v9, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    check-cast v8, Lt/c;

    .line 55
    invoke-virtual {v0, v8}, LR/j;->a(Lt/c;)V

    goto :goto_d

    .line 56
    :cond_10
    iget-object v2, v1, Lt/i;->b:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v7

    const/4 v8, 0x0

    :goto_e
    if-ge v8, v7, :cond_11

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v8, v8, 0x1

    check-cast v9, Lt/c;

    .line 57
    invoke-virtual {v0, v9}, LR/j;->a(Lt/c;)V

    goto :goto_e

    .line 58
    :cond_11
    iget-object v2, v1, Lt/i;->y:Landroid/os/Bundle;

    if-eqz v2, :cond_12

    .line 59
    iget-object v7, v0, LR/j;->f:Ljava/lang/Object;

    check-cast v7, Landroid/os/Bundle;

    invoke-virtual {v7, v2}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    .line 60
    :cond_12
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 61
    iget-object v7, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v7, Landroid/app/Notification$Builder;

    iget-boolean v8, v1, Lt/i;->l:Z

    invoke-virtual {v7, v8}, Landroid/app/Notification$Builder;->setShowWhen(Z)Landroid/app/Notification$Builder;

    .line 62
    iget-object v7, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v7, Landroid/app/Notification$Builder;

    iget-boolean v8, v1, Lt/i;->u:Z

    .line 63
    invoke-virtual {v7, v8}, Landroid/app/Notification$Builder;->setLocalOnly(Z)Landroid/app/Notification$Builder;

    .line 64
    iget-object v7, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v7, Landroid/app/Notification$Builder;

    iget-object v8, v1, Lt/i;->s:Ljava/lang/String;

    .line 65
    invoke-virtual {v7, v8}, Landroid/app/Notification$Builder;->setGroup(Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 66
    iget-object v7, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v7, Landroid/app/Notification$Builder;

    const/4 v8, 0x0

    .line 67
    invoke-virtual {v7, v8}, Landroid/app/Notification$Builder;->setSortKey(Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 68
    iget-object v7, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v7, Landroid/app/Notification$Builder;

    iget-boolean v8, v1, Lt/i;->t:Z

    .line 69
    invoke-virtual {v7, v8}, Landroid/app/Notification$Builder;->setGroupSummary(Z)Landroid/app/Notification$Builder;

    .line 70
    iget v7, v1, Lt/i;->E:I

    iput v7, v0, LR/j;->b:I

    .line 71
    iget-object v7, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v7, Landroid/app/Notification$Builder;

    iget-object v8, v1, Lt/i;->x:Ljava/lang/String;

    .line 72
    invoke-virtual {v7, v8}, Landroid/app/Notification$Builder;->setCategory(Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 73
    iget-object v7, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v7, Landroid/app/Notification$Builder;

    iget v8, v1, Lt/i;->z:I

    .line 74
    invoke-virtual {v7, v8}, Landroid/app/Notification$Builder;->setColor(I)Landroid/app/Notification$Builder;

    .line 75
    iget-object v7, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v7, Landroid/app/Notification$Builder;

    iget v8, v1, Lt/i;->A:I

    .line 76
    invoke-virtual {v7, v8}, Landroid/app/Notification$Builder;->setVisibility(I)Landroid/app/Notification$Builder;

    .line 77
    iget-object v7, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v7, Landroid/app/Notification$Builder;

    const/4 v8, 0x0

    .line 78
    invoke-virtual {v7, v8}, Landroid/app/Notification$Builder;->setPublicVersion(Landroid/app/Notification;)Landroid/app/Notification$Builder;

    .line 79
    iget-object v7, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v7, Landroid/app/Notification$Builder;

    iget-object v8, v6, Landroid/app/Notification;->sound:Landroid/net/Uri;

    iget-object v9, v6, Landroid/app/Notification;->audioAttributes:Landroid/media/AudioAttributes;

    .line 80
    invoke-virtual {v7, v8, v9}, Landroid/app/Notification$Builder;->setSound(Landroid/net/Uri;Landroid/media/AudioAttributes;)Landroid/app/Notification$Builder;

    const/16 v7, 0x1c

    if-ge v2, v7, :cond_19

    if-nez v4, :cond_13

    const/4 v2, 0x0

    goto :goto_11

    .line 81
    :cond_13
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v8

    invoke-direct {v2, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 82
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v8

    const/4 v9, 0x0

    :goto_f
    if-ge v9, v8, :cond_16

    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    add-int/lit8 v9, v9, 0x1

    check-cast v10, Lt/I;

    .line 83
    iget-object v11, v10, Lt/I;->a:Ljava/lang/CharSequence;

    .line 84
    iget-object v10, v10, Lt/I;->c:Ljava/lang/String;

    if-eqz v10, :cond_14

    goto :goto_10

    :cond_14
    if-eqz v11, :cond_15

    .line 85
    new-instance v10, Ljava/lang/StringBuilder;

    const-string v13, "name:"

    invoke-direct {v10, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    goto :goto_10

    .line 86
    :cond_15
    const-string v10, ""

    .line 87
    :goto_10
    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_f

    :cond_16
    :goto_11
    if-nez v2, :cond_17

    goto :goto_12

    :cond_17
    if-nez v3, :cond_18

    move-object v3, v2

    goto :goto_12

    .line 88
    :cond_18
    new-instance v8, Lp/f;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v9

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    add-int/2addr v10, v9

    invoke-direct {v8, v10}, Lp/f;-><init>(I)V

    .line 89
    invoke-virtual {v8, v2}, Lp/f;->addAll(Ljava/util/Collection;)Z

    .line 90
    invoke-virtual {v8, v3}, Lp/f;->addAll(Ljava/util/Collection;)Z

    .line 91
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v8}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    :cond_19
    :goto_12
    if-eqz v3, :cond_1a

    .line 92
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1a

    .line 93
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v8, 0x0

    :goto_13
    if-ge v8, v2, :cond_1a

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v8, v8, 0x1

    check-cast v9, Ljava/lang/String;

    .line 94
    iget-object v10, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v10, Landroid/app/Notification$Builder;

    .line 95
    invoke-virtual {v10, v9}, Landroid/app/Notification$Builder;->addPerson(Ljava/lang/String;)Landroid/app/Notification$Builder;

    goto :goto_13

    .line 96
    :cond_1a
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_25

    .line 97
    iget-object v2, v1, Lt/i;->y:Landroid/os/Bundle;

    if-nez v2, :cond_1b

    .line 98
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    iput-object v2, v1, Lt/i;->y:Landroid/os/Bundle;

    .line 99
    :cond_1b
    iget-object v2, v1, Lt/i;->y:Landroid/os/Bundle;

    .line 100
    const-string v3, "android.car.EXTENSIONS"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    if-nez v2, :cond_1c

    .line 101
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 102
    :cond_1c
    new-instance v8, Landroid/os/Bundle;

    invoke-direct {v8, v2}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 103
    new-instance v9, Landroid/os/Bundle;

    invoke-direct {v9}, Landroid/os/Bundle;-><init>()V

    const/4 v10, 0x0

    .line 104
    :goto_14
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-ge v10, v11, :cond_23

    .line 105
    invoke-static {v10}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v11

    .line 106
    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lt/c;

    .line 107
    new-instance v14, Landroid/os/Bundle;

    invoke-direct {v14}, Landroid/os/Bundle;-><init>()V

    .line 108
    invoke-virtual {v13}, Lt/c;->a()Landroidx/core/graphics/drawable/IconCompat;

    move-result-object v15

    iget-object v12, v13, Lt/c;->a:Landroid/os/Bundle;

    if-eqz v15, :cond_1d

    .line 109
    invoke-virtual {v15}, Landroidx/core/graphics/drawable/IconCompat;->f()I

    move-result v15

    goto :goto_15

    :cond_1d
    const/4 v15, 0x0

    :goto_15
    const-string v7, "icon"

    invoke-virtual {v14, v7, v15}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 110
    const-string v7, "title"

    .line 111
    iget-object v15, v13, Lt/c;->i:Ljava/lang/CharSequence;

    .line 112
    invoke-virtual {v14, v7, v15}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 113
    const-string v7, "actionIntent"

    .line 114
    iget-object v15, v13, Lt/c;->j:Landroid/app/PendingIntent;

    .line 115
    invoke-virtual {v14, v7, v15}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    if-eqz v12, :cond_1e

    .line 116
    new-instance v7, Landroid/os/Bundle;

    invoke-direct {v7, v12}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    goto :goto_16

    .line 117
    :cond_1e
    new-instance v7, Landroid/os/Bundle;

    invoke-direct {v7}, Landroid/os/Bundle;-><init>()V

    .line 118
    :goto_16
    const-string v12, "android.support.allowGeneratedReplies"

    .line 119
    iget-boolean v15, v13, Lt/c;->d:Z

    .line 120
    invoke-virtual {v7, v12, v15}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 121
    const-string v12, "extras"

    invoke-virtual {v14, v12, v7}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 122
    iget-object v7, v13, Lt/c;->c:[Lt/J;

    if-nez v7, :cond_1f

    move-object/from16 v20, v5

    move/from16 v21, v10

    const/4 v5, 0x0

    goto/16 :goto_19

    .line 123
    :cond_1f
    array-length v15, v7

    new-array v15, v15, [Landroid/os/Bundle;

    move-object/from16 v20, v5

    move/from16 v21, v10

    const/4 v5, 0x0

    .line 124
    :goto_17
    array-length v10, v7

    if-ge v5, v10, :cond_22

    .line 125
    aget-object v10, v7, v5

    move/from16 v22, v5

    .line 126
    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 127
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object/from16 v23, v7

    const-string v7, "FlutterLocalNotificationsPluginInputResult"

    move-object/from16 v24, v15

    .line 128
    const-string v15, "resultKey"

    invoke-virtual {v5, v15, v7}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    const-string v7, "label"

    .line 130
    iget-object v15, v10, Lt/J;->a:Ljava/lang/CharSequence;

    .line 131
    invoke-virtual {v5, v7, v15}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 132
    const-string v7, "choices"

    .line 133
    iget-object v15, v10, Lt/J;->b:[Ljava/lang/CharSequence;

    .line 134
    invoke-virtual {v5, v7, v15}, Landroid/os/Bundle;->putCharSequenceArray(Ljava/lang/String;[Ljava/lang/CharSequence;)V

    .line 135
    const-string v7, "allowFreeFormInput"

    .line 136
    iget-boolean v15, v10, Lt/J;->c:Z

    .line 137
    invoke-virtual {v5, v7, v15}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 138
    iget-object v7, v10, Lt/J;->d:Landroid/os/Bundle;

    .line 139
    invoke-virtual {v5, v12, v7}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 140
    iget-object v7, v10, Lt/J;->e:Ljava/util/HashSet;

    .line 141
    invoke-virtual {v7}, Ljava/util/HashSet;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_21

    .line 142
    new-instance v10, Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/HashSet;->size()I

    move-result v15

    invoke-direct {v10, v15}, Ljava/util/ArrayList;-><init>(I)V

    .line 143
    invoke-virtual {v7}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_18
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_20

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    .line 144
    invoke-virtual {v10, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_18

    .line 145
    :cond_20
    const-string v7, "allowedDataTypes"

    invoke-virtual {v5, v7, v10}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 146
    :cond_21
    aput-object v5, v24, v22

    add-int/lit8 v5, v22, 0x1

    move-object/from16 v7, v23

    move-object/from16 v15, v24

    goto :goto_17

    :cond_22
    move-object/from16 v24, v15

    move-object/from16 v5, v24

    .line 147
    :goto_19
    const-string v7, "remoteInputs"

    invoke-virtual {v14, v7, v5}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 148
    const-string v5, "showsUserInterface"

    .line 149
    iget-boolean v7, v13, Lt/c;->e:Z

    .line 150
    invoke-virtual {v14, v5, v7}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 151
    const-string v5, "semanticAction"

    .line 152
    iget v7, v13, Lt/c;->f:I

    .line 153
    invoke-virtual {v14, v5, v7}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 154
    invoke-virtual {v9, v11, v14}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    add-int/lit8 v10, v21, 0x1

    move-object/from16 v5, v20

    const/16 v7, 0x1c

    const/4 v12, 0x1

    goto/16 :goto_14

    .line 155
    :cond_23
    const-string v5, "invisible_actions"

    invoke-virtual {v2, v5, v9}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 156
    invoke-virtual {v8, v5, v9}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 157
    iget-object v5, v1, Lt/i;->y:Landroid/os/Bundle;

    if-nez v5, :cond_24

    .line 158
    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    iput-object v5, v1, Lt/i;->y:Landroid/os/Bundle;

    .line 159
    :cond_24
    iget-object v5, v1, Lt/i;->y:Landroid/os/Bundle;

    .line 160
    invoke-virtual {v5, v3, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 161
    iget-object v2, v0, LR/j;->f:Ljava/lang/Object;

    check-cast v2, Landroid/os/Bundle;

    invoke-virtual {v2, v3, v8}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 162
    :cond_25
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 163
    iget-object v3, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v3, Landroid/app/Notification$Builder;

    iget-object v5, v1, Lt/i;->y:Landroid/os/Bundle;

    invoke-virtual {v3, v5}, Landroid/app/Notification$Builder;->setExtras(Landroid/os/Bundle;)Landroid/app/Notification$Builder;

    .line 164
    iget-object v3, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v3, Landroid/app/Notification$Builder;

    const/4 v8, 0x0

    .line 165
    invoke-virtual {v3, v8}, Landroid/app/Notification$Builder;->setRemoteInputHistory([Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    const/16 v3, 0x1a

    if-lt v2, v3, :cond_27

    .line 166
    iget-object v3, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v3, Landroid/app/Notification$Builder;

    invoke-static {v3}, LD/f;->i(Landroid/app/Notification$Builder;)V

    .line 167
    iget-object v3, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v3, Landroid/app/Notification$Builder;

    invoke-static {v3}, LD/f;->p(Landroid/app/Notification$Builder;)V

    .line 168
    iget-object v3, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v3, Landroid/app/Notification$Builder;

    iget-object v5, v1, Lt/i;->C:Ljava/lang/String;

    invoke-static {v3, v5}, LD/f;->q(Landroid/app/Notification$Builder;Ljava/lang/String;)V

    .line 169
    iget-object v3, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v3, Landroid/app/Notification$Builder;

    iget-wide v7, v1, Lt/i;->D:J

    invoke-static {v3, v7, v8}, LD/f;->r(Landroid/app/Notification$Builder;J)V

    .line 170
    iget-object v3, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v3, Landroid/app/Notification$Builder;

    iget v5, v1, Lt/i;->E:I

    invoke-static {v3, v5}, LD/f;->l(Landroid/app/Notification$Builder;I)V

    .line 171
    iget-boolean v3, v1, Lt/i;->w:Z

    if-eqz v3, :cond_26

    .line 172
    iget-object v3, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v3, Landroid/app/Notification$Builder;

    iget-boolean v5, v1, Lt/i;->v:Z

    invoke-static {v3, v5}, LD/f;->j(Landroid/app/Notification$Builder;Z)V

    .line 173
    :cond_26
    iget-object v3, v1, Lt/i;->B:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_27

    .line 174
    iget-object v3, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v3, Landroid/app/Notification$Builder;

    const/4 v8, 0x0

    invoke-virtual {v3, v8}, Landroid/app/Notification$Builder;->setSound(Landroid/net/Uri;)Landroid/app/Notification$Builder;

    move-result-object v3

    const/4 v5, 0x0

    .line 175
    invoke-virtual {v3, v5}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    move-result-object v3

    .line 176
    invoke-virtual {v3, v5, v5, v5}, Landroid/app/Notification$Builder;->setLights(III)Landroid/app/Notification$Builder;

    move-result-object v3

    .line 177
    invoke-virtual {v3, v8}, Landroid/app/Notification$Builder;->setVibrate([J)Landroid/app/Notification$Builder;

    :goto_1a
    const/16 v3, 0x1c

    goto :goto_1b

    :cond_27
    const/4 v5, 0x0

    goto :goto_1a

    :goto_1b
    if-lt v2, v3, :cond_28

    .line 178
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v13, v5

    :goto_1c
    if-ge v13, v2, :cond_28

    invoke-virtual {v4, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v13, v13, 0x1

    check-cast v3, Lt/I;

    .line 179
    iget-object v5, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v5, Landroid/app/Notification$Builder;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 180
    invoke-static {v3}, LD/d;->r(Lt/I;)Landroid/app/Person;

    move-result-object v3

    .line 181
    invoke-static {v5, v3}, LD/d;->a(Landroid/app/Notification$Builder;Landroid/app/Person;)V

    goto :goto_1c

    .line 182
    :cond_28
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1d

    if-lt v2, v3, :cond_29

    .line 183
    iget-object v3, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v3, Landroid/app/Notification$Builder;

    iget-boolean v4, v1, Lt/i;->F:Z

    invoke-static {v3, v4}, Lt/B;->b(Landroid/app/Notification$Builder;Z)V

    .line 184
    iget-object v3, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v3, Landroid/app/Notification$Builder;

    invoke-static {v3}, Lt/B;->c(Landroid/app/Notification$Builder;)V

    :cond_29
    const/16 v3, 0x24

    if-lt v2, v3, :cond_2a

    .line 185
    iget-object v3, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v3, Landroid/app/Notification$Builder;

    invoke-static {v3}, LE/g;->e(Landroid/app/Notification$Builder;)V

    .line 186
    :cond_2a
    iget-boolean v1, v1, Lt/i;->H:Z

    if-eqz v1, :cond_2d

    .line 187
    iget-object v1, v0, LR/j;->e:Ljava/lang/Object;

    check-cast v1, Lt/i;

    iget-boolean v1, v1, Lt/i;->t:Z

    if-eqz v1, :cond_2b

    const/4 v1, 0x2

    .line 188
    iput v1, v0, LR/j;->b:I

    goto :goto_1d

    :cond_2b
    const/4 v1, 0x1

    .line 189
    iput v1, v0, LR/j;->b:I

    .line 190
    :goto_1d
    iget-object v1, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v1, Landroid/app/Notification$Builder;

    const/4 v8, 0x0

    invoke-virtual {v1, v8}, Landroid/app/Notification$Builder;->setVibrate([J)Landroid/app/Notification$Builder;

    .line 191
    iget-object v1, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v1, Landroid/app/Notification$Builder;

    invoke-virtual {v1, v8}, Landroid/app/Notification$Builder;->setSound(Landroid/net/Uri;)Landroid/app/Notification$Builder;

    .line 192
    iget v1, v6, Landroid/app/Notification;->defaults:I

    and-int/lit8 v1, v1, -0x4

    .line 193
    iput v1, v6, Landroid/app/Notification;->defaults:I

    .line 194
    iget-object v3, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v3, Landroid/app/Notification$Builder;

    invoke-virtual {v3, v1}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    const/16 v3, 0x1a

    if-lt v2, v3, :cond_2d

    .line 195
    iget-object v1, v0, LR/j;->e:Ljava/lang/Object;

    check-cast v1, Lt/i;

    iget-object v1, v1, Lt/i;->s:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2c

    .line 196
    iget-object v1, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v1, Landroid/app/Notification$Builder;

    const-string v2, "silent"

    .line 197
    invoke-virtual {v1, v2}, Landroid/app/Notification$Builder;->setGroup(Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 198
    :cond_2c
    iget-object v1, v0, LR/j;->d:Ljava/lang/Object;

    check-cast v1, Landroid/app/Notification$Builder;

    iget v2, v0, LR/j;->b:I

    invoke-static {v1, v2}, LD/f;->l(Landroid/app/Notification$Builder;I)V

    :cond_2d
    return-void
.end method

.method public static g(I)Z
    .locals 1

    .line 1
    const-string v0, "FragmentManager"

    .line 2
    .line 3
    invoke-static {v0, p0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public static h(LR/e;)Z
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-boolean p0, p0, LR/e;->h:Z

    .line 5
    .line 6
    if-eqz p0, :cond_1

    .line 7
    .line 8
    :goto_0
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_1
    const/4 p0, 0x0

    .line 11
    return p0
.end method


# virtual methods
.method public a(Lt/c;)V
    .locals 13

    .line 1
    invoke-virtual {p1}, Lt/c;->a()Landroidx/core/graphics/drawable/IconCompat;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p1, Lt/c;->f:I

    .line 6
    .line 7
    iget-boolean v2, p1, Lt/c;->d:Z

    .line 8
    .line 9
    iget-object v3, p1, Lt/c;->a:Landroid/os/Bundle;

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0, v4}, Landroidx/core/graphics/drawable/IconCompat;->h(Landroid/content/Context;)Landroid/graphics/drawable/Icon;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    :cond_0
    iget-object v0, p1, Lt/c;->i:Ljava/lang/CharSequence;

    .line 19
    .line 20
    iget-object v5, p1, Lt/c;->j:Landroid/app/PendingIntent;

    .line 21
    .line 22
    new-instance v6, Landroid/app/Notification$Action$Builder;

    .line 23
    .line 24
    invoke-direct {v6, v4, v0, v5}, Landroid/app/Notification$Action$Builder;-><init>(Landroid/graphics/drawable/Icon;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p1, Lt/c;->c:[Lt/J;

    .line 28
    .line 29
    const/16 v4, 0x1d

    .line 30
    .line 31
    if-eqz v0, :cond_4

    .line 32
    .line 33
    array-length v5, v0

    .line 34
    new-array v5, v5, [Landroid/app/RemoteInput;

    .line 35
    .line 36
    const/4 v7, 0x0

    .line 37
    move v8, v7

    .line 38
    :goto_0
    array-length v9, v0

    .line 39
    if-ge v8, v9, :cond_3

    .line 40
    .line 41
    aget-object v9, v0, v8

    .line 42
    .line 43
    new-instance v10, Landroid/app/RemoteInput$Builder;

    .line 44
    .line 45
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    .line 47
    .line 48
    const-string v11, "FlutterLocalNotificationsPluginInputResult"

    .line 49
    .line 50
    invoke-direct {v10, v11}, Landroid/app/RemoteInput$Builder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object v11, v9, Lt/J;->a:Ljava/lang/CharSequence;

    .line 54
    .line 55
    invoke-virtual {v10, v11}, Landroid/app/RemoteInput$Builder;->setLabel(Ljava/lang/CharSequence;)Landroid/app/RemoteInput$Builder;

    .line 56
    .line 57
    .line 58
    move-result-object v10

    .line 59
    iget-object v11, v9, Lt/J;->b:[Ljava/lang/CharSequence;

    .line 60
    .line 61
    invoke-virtual {v10, v11}, Landroid/app/RemoteInput$Builder;->setChoices([Ljava/lang/CharSequence;)Landroid/app/RemoteInput$Builder;

    .line 62
    .line 63
    .line 64
    move-result-object v10

    .line 65
    iget-boolean v11, v9, Lt/J;->c:Z

    .line 66
    .line 67
    invoke-virtual {v10, v11}, Landroid/app/RemoteInput$Builder;->setAllowFreeFormInput(Z)Landroid/app/RemoteInput$Builder;

    .line 68
    .line 69
    .line 70
    move-result-object v10

    .line 71
    iget-object v11, v9, Lt/J;->d:Landroid/os/Bundle;

    .line 72
    .line 73
    invoke-virtual {v10, v11}, Landroid/app/RemoteInput$Builder;->addExtras(Landroid/os/Bundle;)Landroid/app/RemoteInput$Builder;

    .line 74
    .line 75
    .line 76
    move-result-object v10

    .line 77
    sget v11, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 78
    .line 79
    const/16 v12, 0x1a

    .line 80
    .line 81
    if-lt v11, v12, :cond_1

    .line 82
    .line 83
    iget-object v9, v9, Lt/J;->e:Ljava/util/HashSet;

    .line 84
    .line 85
    invoke-virtual {v9}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 86
    .line 87
    .line 88
    move-result-object v9

    .line 89
    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 90
    .line 91
    .line 92
    move-result v11

    .line 93
    if-eqz v11, :cond_1

    .line 94
    .line 95
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v11

    .line 99
    check-cast v11, Ljava/lang/String;

    .line 100
    .line 101
    invoke-static {v10, v11}, LD/f;->g(Landroid/app/RemoteInput$Builder;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_1
    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 106
    .line 107
    if-lt v9, v4, :cond_2

    .line 108
    .line 109
    invoke-static {v10}, Lt/B;->e(Landroid/app/RemoteInput$Builder;)V

    .line 110
    .line 111
    .line 112
    :cond_2
    invoke-virtual {v10}, Landroid/app/RemoteInput$Builder;->build()Landroid/app/RemoteInput;

    .line 113
    .line 114
    .line 115
    move-result-object v9

    .line 116
    aput-object v9, v5, v8

    .line 117
    .line 118
    add-int/lit8 v8, v8, 0x1

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_3
    array-length v0, v5

    .line 122
    :goto_2
    if-ge v7, v0, :cond_4

    .line 123
    .line 124
    aget-object v8, v5, v7

    .line 125
    .line 126
    invoke-virtual {v6, v8}, Landroid/app/Notification$Action$Builder;->addRemoteInput(Landroid/app/RemoteInput;)Landroid/app/Notification$Action$Builder;

    .line 127
    .line 128
    .line 129
    add-int/lit8 v7, v7, 0x1

    .line 130
    .line 131
    goto :goto_2

    .line 132
    :cond_4
    if-eqz v3, :cond_5

    .line 133
    .line 134
    new-instance v0, Landroid/os/Bundle;

    .line 135
    .line 136
    invoke-direct {v0, v3}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 137
    .line 138
    .line 139
    goto :goto_3

    .line 140
    :cond_5
    new-instance v0, Landroid/os/Bundle;

    .line 141
    .line 142
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 143
    .line 144
    .line 145
    :goto_3
    const-string v3, "android.support.allowGeneratedReplies"

    .line 146
    .line 147
    invoke-virtual {v0, v3, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 148
    .line 149
    .line 150
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 151
    .line 152
    invoke-virtual {v6, v2}, Landroid/app/Notification$Action$Builder;->setAllowGeneratedReplies(Z)Landroid/app/Notification$Action$Builder;

    .line 153
    .line 154
    .line 155
    const-string v2, "android.support.action.semanticAction"

    .line 156
    .line 157
    invoke-virtual {v0, v2, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 158
    .line 159
    .line 160
    const/16 v2, 0x1c

    .line 161
    .line 162
    if-lt v3, v2, :cond_6

    .line 163
    .line 164
    invoke-static {v6, v1}, LD/d;->p(Landroid/app/Notification$Action$Builder;I)V

    .line 165
    .line 166
    .line 167
    :cond_6
    if-lt v3, v4, :cond_7

    .line 168
    .line 169
    iget-boolean v1, p1, Lt/c;->g:Z

    .line 170
    .line 171
    invoke-static {v6, v1}, Lt/B;->d(Landroid/app/Notification$Action$Builder;Z)V

    .line 172
    .line 173
    .line 174
    :cond_7
    const/16 v1, 0x1f

    .line 175
    .line 176
    if-lt v3, v1, :cond_8

    .line 177
    .line 178
    invoke-static {v6}, Lt/C;->a(Landroid/app/Notification$Action$Builder;)V

    .line 179
    .line 180
    .line 181
    :cond_8
    const-string v1, "android.support.action.showsUserInterface"

    .line 182
    .line 183
    iget-boolean p1, p1, Lt/c;->e:Z

    .line 184
    .line 185
    invoke-virtual {v0, v1, p1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {v6, v0}, Landroid/app/Notification$Action$Builder;->addExtras(Landroid/os/Bundle;)Landroid/app/Notification$Action$Builder;

    .line 189
    .line 190
    .line 191
    iget-object p1, p0, LR/j;->d:Ljava/lang/Object;

    .line 192
    .line 193
    check-cast p1, Landroid/app/Notification$Builder;

    .line 194
    .line 195
    invoke-virtual {v6}, Landroid/app/Notification$Action$Builder;->build()Landroid/app/Notification$Action;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    invoke-virtual {p1, v0}, Landroid/app/Notification$Builder;->addAction(Landroid/app/Notification$Action;)Landroid/app/Notification$Builder;

    .line 200
    .line 201
    .line 202
    return-void
.end method

.method public b(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, LR/j;->e:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LR/k;

    .line 4
    .line 5
    invoke-virtual {v0}, LR/k;->a()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, LR/e;

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget-object v1, v1, LR/e;->g:LR/j;

    .line 30
    .line 31
    const/4 v2, 0x1

    .line 32
    invoke-virtual {v1, v2}, LR/j;->b(Z)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    return-void
.end method

.method public c()Z
    .locals 7

    .line 1
    iget v0, p0, LR/j;->b:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ge v0, v2, :cond_0

    .line 6
    .line 7
    return v1

    .line 8
    :cond_0
    iget-object v0, p0, LR/j;->e:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v0, LR/k;

    .line 11
    .line 12
    invoke-virtual {v0}, LR/k;->a()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v3, 0x0

    .line 21
    move v4, v1

    .line 22
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    if-eqz v5, :cond_3

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    check-cast v5, LR/e;

    .line 33
    .line 34
    if-eqz v5, :cond_1

    .line 35
    .line 36
    invoke-static {v5}, LR/j;->h(LR/e;)Z

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    if-eqz v6, :cond_1

    .line 41
    .line 42
    iget-object v6, v5, LR/e;->g:LR/j;

    .line 43
    .line 44
    invoke-virtual {v6}, LR/j;->c()Z

    .line 45
    .line 46
    .line 47
    move-result v6

    .line 48
    if-eqz v6, :cond_1

    .line 49
    .line 50
    if-nez v3, :cond_2

    .line 51
    .line 52
    new-instance v3, Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 55
    .line 56
    .line 57
    :cond_2
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move v4, v2

    .line 61
    goto :goto_0

    .line 62
    :cond_3
    iget-object v0, p0, LR/j;->d:Ljava/lang/Object;

    .line 63
    .line 64
    check-cast v0, Ljava/util/ArrayList;

    .line 65
    .line 66
    if-eqz v0, :cond_6

    .line 67
    .line 68
    :goto_1
    iget-object v0, p0, LR/j;->d:Ljava/lang/Object;

    .line 69
    .line 70
    check-cast v0, Ljava/util/ArrayList;

    .line 71
    .line 72
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-ge v1, v0, :cond_6

    .line 77
    .line 78
    iget-object v0, p0, LR/j;->d:Ljava/lang/Object;

    .line 79
    .line 80
    check-cast v0, Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, LR/e;

    .line 87
    .line 88
    if-eqz v3, :cond_4

    .line 89
    .line 90
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    if-nez v2, :cond_5

    .line 95
    .line 96
    :cond_4
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 97
    .line 98
    .line 99
    :cond_5
    add-int/lit8 v1, v1, 0x1

    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_6
    iput-object v3, p0, LR/j;->d:Ljava/lang/Object;

    .line 103
    .line 104
    return v4
.end method

.method public d(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, LR/j;->e:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LR/k;

    .line 4
    .line 5
    invoke-virtual {v0}, LR/k;->a()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, LR/e;

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget-object v1, v1, LR/e;->g:LR/j;

    .line 30
    .line 31
    const/4 v2, 0x1

    .line 32
    invoke-virtual {v1, v2}, LR/j;->d(Z)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    return-void
.end method

.method public e()Z
    .locals 3

    .line 1
    iget v0, p0, LR/j;->b:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ge v0, v1, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    iget-object v0, p0, LR/j;->e:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, LR/k;

    .line 10
    .line 11
    invoke-virtual {v0}, LR/k;->a()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_2

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, LR/e;

    .line 30
    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    iget-object v2, v2, LR/e;->g:LR/j;

    .line 34
    .line 35
    invoke-virtual {v2}, LR/j;->e()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    return v1

    .line 42
    :cond_2
    :goto_0
    const/4 v0, 0x0

    .line 43
    return v0
.end method

.method public f()Z
    .locals 5

    .line 1
    iget v0, p0, LR/j;->b:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ge v0, v2, :cond_0

    .line 6
    .line 7
    return v1

    .line 8
    :cond_0
    iget-object v0, p0, LR/j;->e:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v0, LR/k;

    .line 11
    .line 12
    invoke-virtual {v0}, LR/k;->a()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-eqz v3, :cond_2

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    check-cast v3, LR/e;

    .line 31
    .line 32
    if-eqz v3, :cond_1

    .line 33
    .line 34
    invoke-static {v3}, LR/j;->h(LR/e;)Z

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    if-eqz v4, :cond_1

    .line 39
    .line 40
    iget-object v3, v3, LR/e;->g:LR/j;

    .line 41
    .line 42
    invoke-virtual {v3}, LR/j;->f()Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eqz v3, :cond_1

    .line 47
    .line 48
    move v1, v2

    .line 49
    goto :goto_0

    .line 50
    :cond_2
    return v1
.end method

.method public i(LD1/b;)V
    .locals 8

    .line 1
    iget-object v0, p0, LR/j;->c:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/app/Activity;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 13
    .line 14
    const/16 v2, 0x23

    .line 15
    .line 16
    const/16 v3, 0x1a

    .line 17
    .line 18
    const/16 v4, 0x1e

    .line 19
    .line 20
    if-lt v1, v2, :cond_0

    .line 21
    .line 22
    new-instance v1, LD/a0;

    .line 23
    .line 24
    invoke-direct {v1, v0}, LD/Z;-><init>(Landroid/view/Window;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    if-lt v1, v4, :cond_1

    .line 29
    .line 30
    new-instance v1, LD/Z;

    .line 31
    .line 32
    invoke-direct {v1, v0}, LD/Z;-><init>(Landroid/view/Window;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    if-lt v1, v3, :cond_2

    .line 37
    .line 38
    new-instance v1, LD/Y;

    .line 39
    .line 40
    invoke-direct {v1, v0}, LD/X;-><init>(Landroid/view/Window;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    new-instance v1, LD/X;

    .line 45
    .line 46
    invoke-direct {v1, v0}, LD/X;-><init>(Landroid/view/Window;)V

    .line 47
    .line 48
    .line 49
    :goto_0
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 50
    .line 51
    if-ge v2, v4, :cond_3

    .line 52
    .line 53
    const/high16 v4, -0x80000000

    .line 54
    .line 55
    invoke-virtual {v0, v4}, Landroid/view/Window;->addFlags(I)V

    .line 56
    .line 57
    .line 58
    const/high16 v4, 0xc000000

    .line 59
    .line 60
    invoke-virtual {v0, v4}, Landroid/view/Window;->clearFlags(I)V

    .line 61
    .line 62
    .line 63
    :cond_3
    iget v4, p1, LD1/b;->b:I

    .line 64
    .line 65
    const/4 v5, 0x0

    .line 66
    const/4 v6, 0x1

    .line 67
    if-eqz v4, :cond_6

    .line 68
    .line 69
    invoke-static {v4}, LL/i;->b(I)I

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    if-eqz v4, :cond_5

    .line 74
    .line 75
    if-eq v4, v6, :cond_4

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_4
    invoke-virtual {v1, v6}, Lc1/g;->H(Z)V

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_5
    invoke-virtual {v1, v5}, Lc1/g;->H(Z)V

    .line 83
    .line 84
    .line 85
    :cond_6
    :goto_1
    iget-object v4, p1, LD1/b;->a:Ljava/lang/Object;

    .line 86
    .line 87
    check-cast v4, Ljava/lang/Integer;

    .line 88
    .line 89
    if-eqz v4, :cond_7

    .line 90
    .line 91
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    invoke-virtual {v0, v4}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 96
    .line 97
    .line 98
    :cond_7
    iget-object v4, p1, LD1/b;->d:Ljava/io/Serializable;

    .line 99
    .line 100
    check-cast v4, Ljava/lang/Boolean;

    .line 101
    .line 102
    const/16 v7, 0x1d

    .line 103
    .line 104
    if-eqz v4, :cond_8

    .line 105
    .line 106
    if-lt v2, v7, :cond_8

    .line 107
    .line 108
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    invoke-static {v0, v4}, LD/D;->q(Landroid/view/Window;Z)V

    .line 113
    .line 114
    .line 115
    :cond_8
    if-lt v2, v3, :cond_c

    .line 116
    .line 117
    iget v3, p1, LD1/b;->c:I

    .line 118
    .line 119
    if-eqz v3, :cond_b

    .line 120
    .line 121
    invoke-static {v3}, LL/i;->b(I)I

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    if-eqz v3, :cond_a

    .line 126
    .line 127
    if-eq v3, v6, :cond_9

    .line 128
    .line 129
    goto :goto_2

    .line 130
    :cond_9
    invoke-virtual {v1, v6}, Lc1/g;->G(Z)V

    .line 131
    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_a
    invoke-virtual {v1, v5}, Lc1/g;->G(Z)V

    .line 135
    .line 136
    .line 137
    :cond_b
    :goto_2
    iget-object v1, p1, LD1/b;->e:Ljava/io/Serializable;

    .line 138
    .line 139
    check-cast v1, Ljava/lang/Integer;

    .line 140
    .line 141
    if-eqz v1, :cond_c

    .line 142
    .line 143
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 148
    .line 149
    .line 150
    :cond_c
    iget-object v1, p1, LD1/b;->f:Ljava/io/Serializable;

    .line 151
    .line 152
    check-cast v1, Ljava/lang/Integer;

    .line 153
    .line 154
    if-eqz v1, :cond_d

    .line 155
    .line 156
    const/16 v3, 0x1c

    .line 157
    .line 158
    if-lt v2, v3, :cond_d

    .line 159
    .line 160
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    invoke-static {v0, v1}, LQ2/a;->t(Landroid/view/Window;I)V

    .line 165
    .line 166
    .line 167
    :cond_d
    iget-object v1, p1, LD1/b;->g:Ljava/lang/Object;

    .line 168
    .line 169
    check-cast v1, Ljava/lang/Boolean;

    .line 170
    .line 171
    if-eqz v1, :cond_e

    .line 172
    .line 173
    if-lt v2, v7, :cond_e

    .line 174
    .line 175
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 176
    .line 177
    .line 178
    move-result v1

    .line 179
    invoke-static {v0, v1}, LD/D;->y(Landroid/view/Window;Z)V

    .line 180
    .line 181
    .line 182
    :cond_e
    iput-object p1, p0, LR/j;->f:Ljava/lang/Object;

    .line 183
    .line 184
    return-void
.end method

.method public j()V
    .locals 2

    .line 1
    iget-object v0, p0, LR/j;->c:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/app/Activity;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget v1, p0, LR/j;->b:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, LR/j;->f:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v0, LD1/b;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0, v0}, LR/j;->i(LD1/b;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    iget v0, p0, LR/j;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    return-object v0

    .line 11
    :pswitch_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const/16 v1, 0x80

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 16
    .line 17
    .line 18
    const-string v1, "FragmentManager{"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v1, " in "

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v1, "null"

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v1, "}}"

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    return-object v0

    .line 54
    nop

    .line 55
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
