.class public final LM0/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# static fields
.field public static final o:Lcom/google/android/gms/common/api/Status;

.field public static final p:Lcom/google/android/gms/common/api/Status;

.field public static final q:Ljava/lang/Object;

.field public static r:LM0/d;


# instance fields
.field public a:J

.field public b:Z

.field public c:LN0/h;

.field public d:LP0/c;

.field public final e:Landroid/content/Context;

.field public final f:LK0/d;

.field public final g:LA/c;

.field public final h:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final i:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final j:Ljava/util/concurrent/ConcurrentHashMap;

.field public final k:Lp/f;

.field public final l:Lp/f;

.field public final m:LW0/e;

.field public volatile n:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    const-string v2, "Sign-out occurred while this API call was in progress."

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-direct {v0, v1, v2, v3, v3}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;LK0/a;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, LM0/d;->o:Lcom/google/android/gms/common/api/Status;

    .line 11
    .line 12
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    .line 13
    .line 14
    const-string v2, "The user must be signed in to make this API call."

    .line 15
    .line 16
    invoke-direct {v0, v1, v2, v3, v3}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;LK0/a;)V

    .line 17
    .line 18
    .line 19
    sput-object v0, LM0/d;->p:Lcom/google/android/gms/common/api/Status;

    .line 20
    .line 21
    new-instance v0, Ljava/lang/Object;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 24
    .line 25
    .line 26
    sput-object v0, LM0/d;->q:Ljava/lang/Object;

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;)V
    .locals 6

    .line 1
    sget-object v0, LK0/d;->d:LK0/d;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0x2710

    .line 7
    .line 8
    iput-wide v1, p0, LM0/d;->a:J

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput-boolean v1, p0, LM0/d;->b:Z

    .line 12
    .line 13
    new-instance v2, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v2, v3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 17
    .line 18
    .line 19
    iput-object v2, p0, LM0/d;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 20
    .line 21
    new-instance v2, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 22
    .line 23
    invoke-direct {v2, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 24
    .line 25
    .line 26
    iput-object v2, p0, LM0/d;->i:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 27
    .line 28
    new-instance v2, Ljava/util/concurrent/ConcurrentHashMap;

    .line 29
    .line 30
    const/4 v4, 0x5

    .line 31
    const/high16 v5, 0x3f400000    # 0.75f

    .line 32
    .line 33
    invoke-direct {v2, v4, v5, v3}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(IFI)V

    .line 34
    .line 35
    .line 36
    iput-object v2, p0, LM0/d;->j:Ljava/util/concurrent/ConcurrentHashMap;

    .line 37
    .line 38
    new-instance v2, Lp/f;

    .line 39
    .line 40
    invoke-direct {v2, v1}, Lp/f;-><init>(I)V

    .line 41
    .line 42
    .line 43
    iput-object v2, p0, LM0/d;->k:Lp/f;

    .line 44
    .line 45
    new-instance v2, Lp/f;

    .line 46
    .line 47
    invoke-direct {v2, v1}, Lp/f;-><init>(I)V

    .line 48
    .line 49
    .line 50
    iput-object v2, p0, LM0/d;->l:Lp/f;

    .line 51
    .line 52
    iput-boolean v3, p0, LM0/d;->n:Z

    .line 53
    .line 54
    iput-object p1, p0, LM0/d;->e:Landroid/content/Context;

    .line 55
    .line 56
    new-instance v2, LW0/e;

    .line 57
    .line 58
    invoke-direct {v2, p2, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 59
    .line 60
    .line 61
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 62
    .line 63
    .line 64
    iput-object v2, p0, LM0/d;->m:LW0/e;

    .line 65
    .line 66
    iput-object v0, p0, LM0/d;->f:LK0/d;

    .line 67
    .line 68
    new-instance p2, LA/c;

    .line 69
    .line 70
    const/16 v0, 0xd

    .line 71
    .line 72
    invoke-direct {p2, v0}, LA/c;-><init>(I)V

    .line 73
    .line 74
    .line 75
    iput-object p2, p0, LM0/d;->g:LA/c;

    .line 76
    .line 77
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    sget-object p2, LR0/b;->e:Ljava/lang/Boolean;

    .line 82
    .line 83
    if-nez p2, :cond_1

    .line 84
    .line 85
    invoke-static {}, LR0/b;->b()Z

    .line 86
    .line 87
    .line 88
    move-result p2

    .line 89
    if-eqz p2, :cond_0

    .line 90
    .line 91
    const-string p2, "android.hardware.type.automotive"

    .line 92
    .line 93
    invoke-virtual {p1, p2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-eqz p1, :cond_0

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_0
    move v3, v1

    .line 101
    :goto_0
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    sput-object p1, LR0/b;->e:Ljava/lang/Boolean;

    .line 106
    .line 107
    :cond_1
    sget-object p1, LR0/b;->e:Ljava/lang/Boolean;

    .line 108
    .line 109
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-eqz p1, :cond_2

    .line 114
    .line 115
    iput-boolean v1, p0, LM0/d;->n:Z

    .line 116
    .line 117
    :cond_2
    const/4 p1, 0x6

    .line 118
    invoke-virtual {v2, p1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-virtual {v2, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public static b(LM0/a;LK0/a;)Lcom/google/android/gms/common/api/Status;
    .locals 4

    .line 1
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    .line 2
    .line 3
    iget-object p0, p0, LM0/a;->b:LA/c;

    .line 4
    .line 5
    iget-object p0, p0, LA/c;->g:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v3, "API: "

    .line 16
    .line 17
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p0, " is not available on this device. Connection failed with: "

    .line 24
    .line 25
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const/16 v1, 0x11

    .line 36
    .line 37
    iget-object v2, p1, LK0/a;->g:Landroid/app/PendingIntent;

    .line 38
    .line 39
    invoke-direct {v0, v1, p0, v2, p1}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;LK0/a;)V

    .line 40
    .line 41
    .line 42
    return-object v0
.end method

.method public static d(Landroid/content/Context;)LM0/d;
    .locals 5

    .line 1
    sget-object v0, LM0/d;->q:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, LM0/d;->r:LM0/d;

    .line 5
    .line 6
    if-nez v1, :cond_1

    .line 7
    .line 8
    sget-object v1, LN0/y;->g:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 11
    :try_start_1
    sget-object v2, LN0/y;->i:Landroid/os/HandlerThread;

    .line 12
    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    monitor-exit v1

    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    new-instance v2, Landroid/os/HandlerThread;

    .line 20
    .line 21
    const-string v3, "GoogleApiHandler"

    .line 22
    .line 23
    const/16 v4, 0x9

    .line 24
    .line 25
    invoke-direct {v2, v3, v4}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    .line 26
    .line 27
    .line 28
    sput-object v2, LN0/y;->i:Landroid/os/HandlerThread;

    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 31
    .line 32
    .line 33
    sget-object v2, LN0/y;->i:Landroid/os/HandlerThread;

    .line 34
    .line 35
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    :goto_0
    :try_start_2
    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    new-instance v2, LM0/d;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    sget-object v3, LK0/d;->c:Ljava/lang/Object;

    .line 47
    .line 48
    invoke-direct {v2, p0, v1}, LM0/d;-><init>(Landroid/content/Context;Landroid/os/Looper;)V

    .line 49
    .line 50
    .line 51
    sput-object v2, LM0/d;->r:LM0/d;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :catchall_1
    move-exception p0

    .line 55
    goto :goto_3

    .line 56
    :goto_1
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 57
    :try_start_4
    throw p0

    .line 58
    :cond_1
    :goto_2
    sget-object p0, LM0/d;->r:LM0/d;

    .line 59
    .line 60
    monitor-exit v0

    .line 61
    return-object p0

    .line 62
    :goto_3
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 63
    throw p0
.end method


# virtual methods
.method public final a(LK0/a;I)Z
    .locals 7

    .line 1
    iget-object v0, p0, LM0/d;->f:LK0/d;

    .line 2
    .line 3
    iget-object v1, p0, LM0/d;->e:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    const-class v2, LT0/a;

    .line 9
    .line 10
    monitor-enter v2

    .line 11
    :try_start_0
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    sget-object v4, LT0/a;->f:Landroid/content/Context;

    .line 16
    .line 17
    const/4 v5, 0x0

    .line 18
    if-eqz v4, :cond_1

    .line 19
    .line 20
    sget-object v6, LT0/a;->g:Ljava/lang/Boolean;

    .line 21
    .line 22
    if-eqz v6, :cond_1

    .line 23
    .line 24
    if-eq v4, v3, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    .line 28
    .line 29
    .line 30
    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    monitor-exit v2

    .line 32
    goto :goto_2

    .line 33
    :catchall_0
    move-exception p1

    .line 34
    goto/16 :goto_7

    .line 35
    .line 36
    :cond_1
    :goto_0
    :try_start_1
    sput-object v5, LT0/a;->g:Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-static {}, LR0/b;->b()Z

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    if-eqz v4, :cond_2

    .line 43
    .line 44
    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    invoke-static {v4}, LB/a;->w(Landroid/content/pm/PackageManager;)Z

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    sput-object v4, LT0/a;->g:Ljava/lang/Boolean;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_2
    :try_start_2
    invoke-virtual {v1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    const-string v6, "com.google.android.instantapps.supervisor.InstantAppsRuntime"

    .line 64
    .line 65
    invoke-virtual {v4, v6}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 66
    .line 67
    .line 68
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 69
    .line 70
    sput-object v4, LT0/a;->g:Ljava/lang/Boolean;
    :try_end_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :catch_0
    :try_start_3
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 74
    .line 75
    sput-object v4, LT0/a;->g:Ljava/lang/Boolean;

    .line 76
    .line 77
    :goto_1
    sput-object v3, LT0/a;->f:Landroid/content/Context;

    .line 78
    .line 79
    sget-object v3, LT0/a;->g:Ljava/lang/Boolean;

    .line 80
    .line 81
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 82
    .line 83
    .line 84
    move-result v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 85
    monitor-exit v2

    .line 86
    :goto_2
    const/4 v2, 0x0

    .line 87
    if-eqz v3, :cond_3

    .line 88
    .line 89
    goto :goto_6

    .line 90
    :cond_3
    iget v3, p1, LK0/a;->f:I

    .line 91
    .line 92
    const/4 v4, 0x1

    .line 93
    if-eqz v3, :cond_4

    .line 94
    .line 95
    iget-object v6, p1, LK0/a;->g:Landroid/app/PendingIntent;

    .line 96
    .line 97
    if-eqz v6, :cond_4

    .line 98
    .line 99
    move v6, v4

    .line 100
    goto :goto_3

    .line 101
    :cond_4
    move v6, v2

    .line 102
    :goto_3
    if-eqz v6, :cond_5

    .line 103
    .line 104
    iget-object v3, p1, LK0/a;->g:Landroid/app/PendingIntent;

    .line 105
    .line 106
    goto :goto_5

    .line 107
    :cond_5
    invoke-virtual {v0, v3, v1, v5}, LK0/e;->a(ILandroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    if-nez v3, :cond_6

    .line 112
    .line 113
    goto :goto_4

    .line 114
    :cond_6
    const/high16 v5, 0xc000000

    .line 115
    .line 116
    invoke-static {v1, v2, v3, v5}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 117
    .line 118
    .line 119
    move-result-object v5

    .line 120
    :goto_4
    move-object v3, v5

    .line 121
    :goto_5
    if-eqz v3, :cond_7

    .line 122
    .line 123
    iget p1, p1, LK0/a;->f:I

    .line 124
    .line 125
    sget v5, Lcom/google/android/gms/common/api/GoogleApiActivity;->f:I

    .line 126
    .line 127
    const-class v5, Lcom/google/android/gms/common/api/GoogleApiActivity;

    .line 128
    .line 129
    new-instance v6, Landroid/content/Intent;

    .line 130
    .line 131
    invoke-direct {v6, v1, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 132
    .line 133
    .line 134
    const-string v5, "pending_intent"

    .line 135
    .line 136
    invoke-virtual {v6, v5, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 137
    .line 138
    .line 139
    const-string v3, "failing_client_id"

    .line 140
    .line 141
    invoke-virtual {v6, v3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 142
    .line 143
    .line 144
    const-string p2, "notify_manager"

    .line 145
    .line 146
    invoke-virtual {v6, p2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 147
    .line 148
    .line 149
    sget p2, LW0/d;->a:I

    .line 150
    .line 151
    const/high16 v3, 0x8000000

    .line 152
    .line 153
    or-int/2addr p2, v3

    .line 154
    invoke-static {v1, v2, v6, p2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 155
    .line 156
    .line 157
    move-result-object p2

    .line 158
    invoke-virtual {v0, v1, p1, p2}, LK0/d;->f(Landroid/content/Context;ILandroid/app/PendingIntent;)V

    .line 159
    .line 160
    .line 161
    move v2, v4

    .line 162
    :cond_7
    :goto_6
    return v2

    .line 163
    :goto_7
    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 164
    throw p1
.end method

.method public final c(LP0/c;)LM0/j;
    .locals 3

    .line 1
    iget-object v0, p1, LP0/c;->e:LM0/a;

    .line 2
    .line 3
    iget-object v1, p0, LM0/d;->j:Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    invoke-virtual {v1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    check-cast v2, LM0/j;

    .line 10
    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    new-instance v2, LM0/j;

    .line 14
    .line 15
    invoke-direct {v2, p0, p1}, LM0/j;-><init>(LM0/d;LP0/c;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, v0, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object p1, v2, LM0/j;->d:LL0/a;

    .line 22
    .line 23
    invoke-interface {p1}, LL0/a;->n()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    iget-object p1, p0, LM0/d;->l:Lp/f;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Lp/f;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    :cond_1
    invoke-virtual {v2}, LM0/j;->m()V

    .line 35
    .line 36
    .line 37
    return-object v2
.end method

.method public final e(LK0/a;I)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1, p2}, LM0/d;->a(LK0/a;I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x5

    .line 8
    const/4 v1, 0x0

    .line 9
    iget-object v2, p0, LM0/d;->m:LW0/e;

    .line 10
    .line 11
    invoke-virtual {v2, v0, p2, v1, p1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {v2, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final handleMessage(Landroid/os/Message;)Z
    .locals 14

    .line 1
    iget-object v0, p0, LM0/d;->e:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, LM0/d;->l:Lp/f;

    .line 4
    .line 5
    const-string v2, "GoogleApiManager"

    .line 6
    .line 7
    iget-object v3, p0, LM0/d;->m:LW0/e;

    .line 8
    .line 9
    iget-object v4, p0, LM0/d;->j:Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    iget v5, p1, Landroid/os/Message;->what:I

    .line 12
    .line 13
    const v6, 0xc1fa340

    .line 14
    .line 15
    .line 16
    const/4 v7, -0x1

    .line 17
    const-wide/32 v8, 0x493e0

    .line 18
    .line 19
    .line 20
    const/16 v10, 0x11

    .line 21
    .line 22
    const/4 v11, 0x0

    .line 23
    const/4 v12, 0x0

    .line 24
    const/4 v13, 0x1

    .line 25
    packed-switch v5, :pswitch_data_0

    .line 26
    .line 27
    .line 28
    new-instance p1, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    const-string v0, "Unknown message id: "

    .line 31
    .line 32
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {v2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    return v11

    .line 46
    :pswitch_0
    iput-boolean v11, p0, LM0/d;->b:Z

    .line 47
    .line 48
    return v13

    .line 49
    :pswitch_1
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 50
    .line 51
    check-cast p1, LM0/p;

    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 54
    .line 55
    .line 56
    const-wide/16 v0, 0x0

    .line 57
    .line 58
    cmp-long p1, v0, v0

    .line 59
    .line 60
    if-nez p1, :cond_1

    .line 61
    .line 62
    new-instance p1, LN0/h;

    .line 63
    .line 64
    filled-new-array {v12}, [LN0/e;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-direct {p1, v11, v0}, LN0/h;-><init>(ILjava/util/List;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, LM0/d;->d:LP0/c;

    .line 76
    .line 77
    if-nez v0, :cond_0

    .line 78
    .line 79
    iget-object v0, p0, LM0/d;->e:Landroid/content/Context;

    .line 80
    .line 81
    new-instance v1, LP0/c;

    .line 82
    .line 83
    sget-object v2, LP0/c;->i:LA/c;

    .line 84
    .line 85
    sget-object v3, LL0/b;->b:LL0/b;

    .line 86
    .line 87
    invoke-direct {v1, v0, v2, v3}, LP0/c;-><init>(Landroid/content/Context;LA/c;LL0/b;)V

    .line 88
    .line 89
    .line 90
    iput-object v1, p0, LM0/d;->d:LP0/c;

    .line 91
    .line 92
    :cond_0
    iget-object v0, p0, LM0/d;->d:LP0/c;

    .line 93
    .line 94
    invoke-virtual {v0, p1}, LP0/c;->a(LN0/h;)Li1/p;

    .line 95
    .line 96
    .line 97
    return v13

    .line 98
    :cond_1
    iget-object p1, p0, LM0/d;->c:LN0/h;

    .line 99
    .line 100
    if-eqz p1, :cond_a

    .line 101
    .line 102
    iget-object v2, p1, LN0/h;->f:Ljava/util/List;

    .line 103
    .line 104
    iget p1, p1, LN0/h;->e:I

    .line 105
    .line 106
    if-nez p1, :cond_4

    .line 107
    .line 108
    if-eqz v2, :cond_2

    .line 109
    .line 110
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-ltz p1, :cond_2

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_2
    iget-object p1, p0, LM0/d;->c:LN0/h;

    .line 118
    .line 119
    iget-object v2, p1, LN0/h;->f:Ljava/util/List;

    .line 120
    .line 121
    if-nez v2, :cond_3

    .line 122
    .line 123
    new-instance v2, Ljava/util/ArrayList;

    .line 124
    .line 125
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 126
    .line 127
    .line 128
    iput-object v2, p1, LN0/h;->f:Ljava/util/List;

    .line 129
    .line 130
    :cond_3
    iget-object p1, p1, LN0/h;->f:Ljava/util/List;

    .line 131
    .line 132
    invoke-interface {p1, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    goto :goto_5

    .line 136
    :cond_4
    :goto_0
    invoke-virtual {v3, v10}, Landroid/os/Handler;->removeMessages(I)V

    .line 137
    .line 138
    .line 139
    iget-object p1, p0, LM0/d;->c:LN0/h;

    .line 140
    .line 141
    if-eqz p1, :cond_a

    .line 142
    .line 143
    iget v2, p1, LN0/h;->e:I

    .line 144
    .line 145
    if-gtz v2, :cond_7

    .line 146
    .line 147
    iget-boolean v2, p0, LM0/d;->b:Z

    .line 148
    .line 149
    if-eqz v2, :cond_5

    .line 150
    .line 151
    goto :goto_4

    .line 152
    :cond_5
    const-class v2, LN0/f;

    .line 153
    .line 154
    monitor-enter v2

    .line 155
    :try_start_0
    sget-object v4, LN0/f;->f:LN0/f;

    .line 156
    .line 157
    if-nez v4, :cond_6

    .line 158
    .line 159
    new-instance v4, LN0/f;

    .line 160
    .line 161
    invoke-direct {v4, v11}, LN0/f;-><init>(I)V

    .line 162
    .line 163
    .line 164
    sput-object v4, LN0/f;->f:LN0/f;

    .line 165
    .line 166
    goto :goto_1

    .line 167
    :catchall_0
    move-exception p1

    .line 168
    goto :goto_2

    .line 169
    :cond_6
    :goto_1
    sget-object v4, LN0/f;->f:LN0/f;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 170
    .line 171
    monitor-exit v2

    .line 172
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 173
    .line 174
    .line 175
    iget-object v2, p0, LM0/d;->g:LA/c;

    .line 176
    .line 177
    iget-object v2, v2, LA/c;->f:Ljava/lang/Object;

    .line 178
    .line 179
    check-cast v2, Landroid/util/SparseIntArray;

    .line 180
    .line 181
    invoke-virtual {v2, v6, v7}, Landroid/util/SparseIntArray;->get(II)I

    .line 182
    .line 183
    .line 184
    move-result v2

    .line 185
    if-eq v2, v7, :cond_7

    .line 186
    .line 187
    if-nez v2, :cond_9

    .line 188
    .line 189
    goto :goto_3

    .line 190
    :goto_2
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 191
    throw p1

    .line 192
    :cond_7
    :goto_3
    iget-object v2, p0, LM0/d;->d:LP0/c;

    .line 193
    .line 194
    if-nez v2, :cond_8

    .line 195
    .line 196
    iget-object v2, p0, LM0/d;->e:Landroid/content/Context;

    .line 197
    .line 198
    new-instance v4, LP0/c;

    .line 199
    .line 200
    sget-object v5, LP0/c;->i:LA/c;

    .line 201
    .line 202
    sget-object v6, LL0/b;->b:LL0/b;

    .line 203
    .line 204
    invoke-direct {v4, v2, v5, v6}, LP0/c;-><init>(Landroid/content/Context;LA/c;LL0/b;)V

    .line 205
    .line 206
    .line 207
    iput-object v4, p0, LM0/d;->d:LP0/c;

    .line 208
    .line 209
    :cond_8
    iget-object v2, p0, LM0/d;->d:LP0/c;

    .line 210
    .line 211
    invoke-virtual {v2, p1}, LP0/c;->a(LN0/h;)Li1/p;

    .line 212
    .line 213
    .line 214
    :cond_9
    :goto_4
    iput-object v12, p0, LM0/d;->c:LN0/h;

    .line 215
    .line 216
    :cond_a
    :goto_5
    iget-object p1, p0, LM0/d;->c:LN0/h;

    .line 217
    .line 218
    if-nez p1, :cond_28

    .line 219
    .line 220
    new-instance p1, Ljava/util/ArrayList;

    .line 221
    .line 222
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 223
    .line 224
    .line 225
    invoke-virtual {p1, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    new-instance v2, LN0/h;

    .line 229
    .line 230
    invoke-direct {v2, v11, p1}, LN0/h;-><init>(ILjava/util/List;)V

    .line 231
    .line 232
    .line 233
    iput-object v2, p0, LM0/d;->c:LN0/h;

    .line 234
    .line 235
    invoke-virtual {v3, v10}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    invoke-virtual {v3, p1, v0, v1}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 240
    .line 241
    .line 242
    return v13

    .line 243
    :pswitch_2
    iget-object p1, p0, LM0/d;->c:LN0/h;

    .line 244
    .line 245
    if-eqz p1, :cond_28

    .line 246
    .line 247
    iget v0, p1, LN0/h;->e:I

    .line 248
    .line 249
    if-gtz v0, :cond_d

    .line 250
    .line 251
    iget-boolean v0, p0, LM0/d;->b:Z

    .line 252
    .line 253
    if-eqz v0, :cond_b

    .line 254
    .line 255
    goto :goto_9

    .line 256
    :cond_b
    const-class v0, LN0/f;

    .line 257
    .line 258
    monitor-enter v0

    .line 259
    :try_start_2
    sget-object v1, LN0/f;->f:LN0/f;

    .line 260
    .line 261
    if-nez v1, :cond_c

    .line 262
    .line 263
    new-instance v1, LN0/f;

    .line 264
    .line 265
    invoke-direct {v1, v11}, LN0/f;-><init>(I)V

    .line 266
    .line 267
    .line 268
    sput-object v1, LN0/f;->f:LN0/f;

    .line 269
    .line 270
    goto :goto_6

    .line 271
    :catchall_1
    move-exception p1

    .line 272
    goto :goto_7

    .line 273
    :cond_c
    :goto_6
    sget-object v1, LN0/f;->f:LN0/f;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 274
    .line 275
    monitor-exit v0

    .line 276
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 277
    .line 278
    .line 279
    iget-object v0, p0, LM0/d;->g:LA/c;

    .line 280
    .line 281
    iget-object v0, v0, LA/c;->f:Ljava/lang/Object;

    .line 282
    .line 283
    check-cast v0, Landroid/util/SparseIntArray;

    .line 284
    .line 285
    invoke-virtual {v0, v6, v7}, Landroid/util/SparseIntArray;->get(II)I

    .line 286
    .line 287
    .line 288
    move-result v0

    .line 289
    if-eq v0, v7, :cond_d

    .line 290
    .line 291
    if-nez v0, :cond_f

    .line 292
    .line 293
    goto :goto_8

    .line 294
    :goto_7
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 295
    throw p1

    .line 296
    :cond_d
    :goto_8
    iget-object v0, p0, LM0/d;->d:LP0/c;

    .line 297
    .line 298
    if-nez v0, :cond_e

    .line 299
    .line 300
    iget-object v0, p0, LM0/d;->e:Landroid/content/Context;

    .line 301
    .line 302
    new-instance v1, LP0/c;

    .line 303
    .line 304
    sget-object v2, LP0/c;->i:LA/c;

    .line 305
    .line 306
    sget-object v3, LL0/b;->b:LL0/b;

    .line 307
    .line 308
    invoke-direct {v1, v0, v2, v3}, LP0/c;-><init>(Landroid/content/Context;LA/c;LL0/b;)V

    .line 309
    .line 310
    .line 311
    iput-object v1, p0, LM0/d;->d:LP0/c;

    .line 312
    .line 313
    :cond_e
    iget-object v0, p0, LM0/d;->d:LP0/c;

    .line 314
    .line 315
    invoke-virtual {v0, p1}, LP0/c;->a(LN0/h;)Li1/p;

    .line 316
    .line 317
    .line 318
    :cond_f
    :goto_9
    iput-object v12, p0, LM0/d;->c:LN0/h;

    .line 319
    .line 320
    return v13

    .line 321
    :pswitch_3
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 322
    .line 323
    check-cast p1, LM0/k;

    .line 324
    .line 325
    iget-object v0, p1, LM0/k;->a:LM0/a;

    .line 326
    .line 327
    invoke-virtual {v4, v0}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 328
    .line 329
    .line 330
    move-result v0

    .line 331
    if-eqz v0, :cond_28

    .line 332
    .line 333
    iget-object v0, p1, LM0/k;->a:LM0/a;

    .line 334
    .line 335
    invoke-virtual {v4, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    check-cast v0, LM0/j;

    .line 340
    .line 341
    iget-object v1, v0, LM0/j;->k:Ljava/util/ArrayList;

    .line 342
    .line 343
    iget-object v2, v0, LM0/j;->m:LM0/d;

    .line 344
    .line 345
    iget-object v3, v0, LM0/j;->c:Ljava/util/LinkedList;

    .line 346
    .line 347
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 348
    .line 349
    .line 350
    move-result v1

    .line 351
    if-eqz v1, :cond_28

    .line 352
    .line 353
    iget-object v1, v2, LM0/d;->m:LW0/e;

    .line 354
    .line 355
    const/16 v4, 0xf

    .line 356
    .line 357
    invoke-virtual {v1, v4, p1}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    .line 358
    .line 359
    .line 360
    iget-object v1, v2, LM0/d;->m:LW0/e;

    .line 361
    .line 362
    const/16 v2, 0x10

    .line 363
    .line 364
    invoke-virtual {v1, v2, p1}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    .line 365
    .line 366
    .line 367
    iget-object p1, p1, LM0/k;->b:LK0/c;

    .line 368
    .line 369
    new-instance v1, Ljava/util/ArrayList;

    .line 370
    .line 371
    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    .line 372
    .line 373
    .line 374
    move-result v2

    .line 375
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 376
    .line 377
    .line 378
    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 379
    .line 380
    .line 381
    move-result-object v2

    .line 382
    :cond_10
    :goto_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 383
    .line 384
    .line 385
    move-result v4

    .line 386
    if-eqz v4, :cond_12

    .line 387
    .line 388
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 389
    .line 390
    .line 391
    move-result-object v4

    .line 392
    check-cast v4, LM0/o;

    .line 393
    .line 394
    if-eqz v4, :cond_10

    .line 395
    .line 396
    invoke-virtual {v4, v0}, LM0/o;->b(LM0/j;)[LK0/c;

    .line 397
    .line 398
    .line 399
    move-result-object v5

    .line 400
    if-eqz v5, :cond_10

    .line 401
    .line 402
    array-length v6, v5

    .line 403
    move v7, v11

    .line 404
    :goto_b
    if-ge v7, v6, :cond_10

    .line 405
    .line 406
    aget-object v8, v5, v7

    .line 407
    .line 408
    invoke-static {v8, p1}, LN0/n;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 409
    .line 410
    .line 411
    move-result v8

    .line 412
    if-eqz v8, :cond_11

    .line 413
    .line 414
    if-ltz v7, :cond_10

    .line 415
    .line 416
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 417
    .line 418
    .line 419
    goto :goto_a

    .line 420
    :cond_11
    add-int/lit8 v7, v7, 0x1

    .line 421
    .line 422
    goto :goto_b

    .line 423
    :cond_12
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 424
    .line 425
    .line 426
    move-result v0

    .line 427
    :goto_c
    if-ge v11, v0, :cond_28

    .line 428
    .line 429
    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 430
    .line 431
    .line 432
    move-result-object v2

    .line 433
    check-cast v2, LM0/o;

    .line 434
    .line 435
    invoke-virtual {v3, v2}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 436
    .line 437
    .line 438
    new-instance v4, LL0/g;

    .line 439
    .line 440
    invoke-direct {v4, p1}, LL0/g;-><init>(LK0/c;)V

    .line 441
    .line 442
    .line 443
    invoke-virtual {v2, v4}, LM0/o;->d(Ljava/lang/Exception;)V

    .line 444
    .line 445
    .line 446
    add-int/lit8 v11, v11, 0x1

    .line 447
    .line 448
    goto :goto_c

    .line 449
    :pswitch_4
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 450
    .line 451
    check-cast p1, LM0/k;

    .line 452
    .line 453
    iget-object v0, p1, LM0/k;->a:LM0/a;

    .line 454
    .line 455
    invoke-virtual {v4, v0}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 456
    .line 457
    .line 458
    move-result v0

    .line 459
    if-eqz v0, :cond_28

    .line 460
    .line 461
    iget-object v0, p1, LM0/k;->a:LM0/a;

    .line 462
    .line 463
    invoke-virtual {v4, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 464
    .line 465
    .line 466
    move-result-object v0

    .line 467
    check-cast v0, LM0/j;

    .line 468
    .line 469
    iget-object v1, v0, LM0/j;->k:Ljava/util/ArrayList;

    .line 470
    .line 471
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 472
    .line 473
    .line 474
    move-result p1

    .line 475
    if-nez p1, :cond_13

    .line 476
    .line 477
    goto/16 :goto_17

    .line 478
    .line 479
    :cond_13
    iget-boolean p1, v0, LM0/j;->j:Z

    .line 480
    .line 481
    if-nez p1, :cond_28

    .line 482
    .line 483
    iget-object p1, v0, LM0/j;->d:LL0/a;

    .line 484
    .line 485
    invoke-interface {p1}, LL0/a;->b()Z

    .line 486
    .line 487
    .line 488
    move-result p1

    .line 489
    if-nez p1, :cond_14

    .line 490
    .line 491
    invoke-virtual {v0}, LM0/j;->m()V

    .line 492
    .line 493
    .line 494
    return v13

    .line 495
    :cond_14
    invoke-virtual {v0}, LM0/j;->g()V

    .line 496
    .line 497
    .line 498
    return v13

    .line 499
    :pswitch_5
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 500
    .line 501
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 502
    .line 503
    .line 504
    new-instance p1, Ljava/lang/ClassCastException;

    .line 505
    .line 506
    invoke-direct {p1}, Ljava/lang/ClassCastException;-><init>()V

    .line 507
    .line 508
    .line 509
    throw p1

    .line 510
    :pswitch_6
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 511
    .line 512
    invoke-virtual {v4, v0}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 513
    .line 514
    .line 515
    move-result v0

    .line 516
    if-eqz v0, :cond_28

    .line 517
    .line 518
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 519
    .line 520
    invoke-virtual {v4, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 521
    .line 522
    .line 523
    move-result-object p1

    .line 524
    check-cast p1, LM0/j;

    .line 525
    .line 526
    iget-object v0, p1, LM0/j;->m:LM0/d;

    .line 527
    .line 528
    iget-object v0, v0, LM0/d;->m:LW0/e;

    .line 529
    .line 530
    invoke-static {v0}, LN0/n;->b(Landroid/os/Handler;)V

    .line 531
    .line 532
    .line 533
    iget-object v0, p1, LM0/j;->d:LL0/a;

    .line 534
    .line 535
    invoke-interface {v0}, LL0/a;->b()Z

    .line 536
    .line 537
    .line 538
    move-result v1

    .line 539
    if-eqz v1, :cond_17

    .line 540
    .line 541
    iget-object v1, p1, LM0/j;->h:Ljava/util/HashMap;

    .line 542
    .line 543
    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    .line 544
    .line 545
    .line 546
    move-result v1

    .line 547
    if-eqz v1, :cond_17

    .line 548
    .line 549
    iget-object v1, p1, LM0/j;->f:LM0/f;

    .line 550
    .line 551
    iget-object v2, v1, LM0/f;->a:Ljava/util/Map;

    .line 552
    .line 553
    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    .line 554
    .line 555
    .line 556
    move-result v2

    .line 557
    if-eqz v2, :cond_16

    .line 558
    .line 559
    iget-object v1, v1, LM0/f;->b:Ljava/util/Map;

    .line 560
    .line 561
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    .line 562
    .line 563
    .line 564
    move-result v1

    .line 565
    if-nez v1, :cond_15

    .line 566
    .line 567
    goto :goto_d

    .line 568
    :cond_15
    const-string p1, "Timing out service connection."

    .line 569
    .line 570
    invoke-interface {v0, p1}, LL0/a;->e(Ljava/lang/String;)V

    .line 571
    .line 572
    .line 573
    return v13

    .line 574
    :cond_16
    :goto_d
    invoke-virtual {p1}, LM0/j;->j()V

    .line 575
    .line 576
    .line 577
    :cond_17
    return v13

    .line 578
    :pswitch_7
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 579
    .line 580
    invoke-virtual {v4, v0}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 581
    .line 582
    .line 583
    move-result v0

    .line 584
    if-eqz v0, :cond_28

    .line 585
    .line 586
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 587
    .line 588
    invoke-virtual {v4, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 589
    .line 590
    .line 591
    move-result-object p1

    .line 592
    check-cast p1, LM0/j;

    .line 593
    .line 594
    iget-object v0, p1, LM0/j;->m:LM0/d;

    .line 595
    .line 596
    iget-object v1, v0, LM0/d;->m:LW0/e;

    .line 597
    .line 598
    invoke-static {v1}, LN0/n;->b(Landroid/os/Handler;)V

    .line 599
    .line 600
    .line 601
    iget-boolean v1, p1, LM0/j;->j:Z

    .line 602
    .line 603
    if-eqz v1, :cond_28

    .line 604
    .line 605
    iget-object v2, p1, LM0/j;->e:LM0/a;

    .line 606
    .line 607
    iget-object v3, p1, LM0/j;->m:LM0/d;

    .line 608
    .line 609
    iget-object v3, v3, LM0/d;->m:LW0/e;

    .line 610
    .line 611
    if-eqz v1, :cond_18

    .line 612
    .line 613
    const/16 v1, 0xb

    .line 614
    .line 615
    invoke-virtual {v3, v1, v2}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    .line 616
    .line 617
    .line 618
    const/16 v1, 0x9

    .line 619
    .line 620
    invoke-virtual {v3, v1, v2}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    .line 621
    .line 622
    .line 623
    iput-boolean v11, p1, LM0/j;->j:Z

    .line 624
    .line 625
    :cond_18
    iget-object v1, v0, LM0/d;->f:LK0/d;

    .line 626
    .line 627
    iget-object v0, v0, LM0/d;->e:Landroid/content/Context;

    .line 628
    .line 629
    sget v2, LK0/e;->a:I

    .line 630
    .line 631
    invoke-virtual {v1, v0, v2}, LK0/e;->b(Landroid/content/Context;I)I

    .line 632
    .line 633
    .line 634
    move-result v0

    .line 635
    const/16 v1, 0x12

    .line 636
    .line 637
    if-ne v0, v1, :cond_19

    .line 638
    .line 639
    const-string v0, "Connection timed out waiting for Google Play services update to complete."

    .line 640
    .line 641
    new-instance v1, Lcom/google/android/gms/common/api/Status;

    .line 642
    .line 643
    const/16 v2, 0x15

    .line 644
    .line 645
    invoke-direct {v1, v2, v0, v12, v12}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;LK0/a;)V

    .line 646
    .line 647
    .line 648
    goto :goto_e

    .line 649
    :cond_19
    const-string v0, "API failed to connect while resuming due to an unknown error."

    .line 650
    .line 651
    new-instance v1, Lcom/google/android/gms/common/api/Status;

    .line 652
    .line 653
    const/16 v2, 0x16

    .line 654
    .line 655
    invoke-direct {v1, v2, v0, v12, v12}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;LK0/a;)V

    .line 656
    .line 657
    .line 658
    :goto_e
    invoke-virtual {p1, v1}, LM0/j;->e(Lcom/google/android/gms/common/api/Status;)V

    .line 659
    .line 660
    .line 661
    iget-object p1, p1, LM0/j;->d:LL0/a;

    .line 662
    .line 663
    const-string v0, "Timing out connection while resuming."

    .line 664
    .line 665
    invoke-interface {p1, v0}, LL0/a;->e(Ljava/lang/String;)V

    .line 666
    .line 667
    .line 668
    return v13

    .line 669
    :pswitch_8
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 670
    .line 671
    .line 672
    new-instance p1, Lp/a;

    .line 673
    .line 674
    invoke-direct {p1, v1}, Lp/a;-><init>(Lp/f;)V

    .line 675
    .line 676
    .line 677
    :cond_1a
    :goto_f
    invoke-virtual {p1}, Lp/a;->hasNext()Z

    .line 678
    .line 679
    .line 680
    move-result v0

    .line 681
    if-eqz v0, :cond_1b

    .line 682
    .line 683
    invoke-virtual {p1}, Lp/a;->next()Ljava/lang/Object;

    .line 684
    .line 685
    .line 686
    move-result-object v0

    .line 687
    check-cast v0, LM0/a;

    .line 688
    .line 689
    invoke-virtual {v4, v0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 690
    .line 691
    .line 692
    move-result-object v0

    .line 693
    check-cast v0, LM0/j;

    .line 694
    .line 695
    if-eqz v0, :cond_1a

    .line 696
    .line 697
    invoke-virtual {v0}, LM0/j;->p()V

    .line 698
    .line 699
    .line 700
    goto :goto_f

    .line 701
    :cond_1b
    invoke-virtual {v1}, Lp/f;->clear()V

    .line 702
    .line 703
    .line 704
    return v13

    .line 705
    :pswitch_9
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 706
    .line 707
    invoke-virtual {v4, v0}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 708
    .line 709
    .line 710
    move-result v0

    .line 711
    if-eqz v0, :cond_28

    .line 712
    .line 713
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 714
    .line 715
    invoke-virtual {v4, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 716
    .line 717
    .line 718
    move-result-object p1

    .line 719
    check-cast p1, LM0/j;

    .line 720
    .line 721
    iget-object v0, p1, LM0/j;->m:LM0/d;

    .line 722
    .line 723
    iget-object v0, v0, LM0/d;->m:LW0/e;

    .line 724
    .line 725
    invoke-static {v0}, LN0/n;->b(Landroid/os/Handler;)V

    .line 726
    .line 727
    .line 728
    iget-boolean v0, p1, LM0/j;->j:Z

    .line 729
    .line 730
    if-eqz v0, :cond_28

    .line 731
    .line 732
    invoke-virtual {p1}, LM0/j;->m()V

    .line 733
    .line 734
    .line 735
    return v13

    .line 736
    :pswitch_a
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 737
    .line 738
    check-cast p1, LP0/c;

    .line 739
    .line 740
    invoke-virtual {p0, p1}, LM0/d;->c(LP0/c;)LM0/j;

    .line 741
    .line 742
    .line 743
    return v13

    .line 744
    :pswitch_b
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 745
    .line 746
    .line 747
    move-result-object p1

    .line 748
    instance-of p1, p1, Landroid/app/Application;

    .line 749
    .line 750
    if-eqz p1, :cond_28

    .line 751
    .line 752
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 753
    .line 754
    .line 755
    move-result-object p1

    .line 756
    check-cast p1, Landroid/app/Application;

    .line 757
    .line 758
    invoke-static {p1}, LM0/c;->a(Landroid/app/Application;)V

    .line 759
    .line 760
    .line 761
    sget-object p1, LM0/c;->i:LM0/c;

    .line 762
    .line 763
    new-instance v0, LM0/h;

    .line 764
    .line 765
    invoke-direct {v0, p0}, LM0/h;-><init>(LM0/d;)V

    .line 766
    .line 767
    .line 768
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 769
    .line 770
    .line 771
    monitor-enter p1

    .line 772
    :try_start_4
    iget-object v1, p1, LM0/c;->g:Ljava/util/ArrayList;

    .line 773
    .line 774
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 775
    .line 776
    .line 777
    monitor-exit p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 778
    iget-object v0, p1, LM0/c;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 779
    .line 780
    iget-object p1, p1, LM0/c;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 781
    .line 782
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 783
    .line 784
    .line 785
    move-result v1

    .line 786
    if-nez v1, :cond_20

    .line 787
    .line 788
    sget-object v1, LR0/b;->h:Ljava/lang/Boolean;

    .line 789
    .line 790
    if-nez v1, :cond_1e

    .line 791
    .line 792
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 793
    .line 794
    const/16 v2, 0x1c

    .line 795
    .line 796
    if-lt v1, v2, :cond_1c

    .line 797
    .line 798
    invoke-static {}, LQ2/a;->w()Z

    .line 799
    .line 800
    .line 801
    move-result v1

    .line 802
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 803
    .line 804
    .line 805
    move-result-object v1

    .line 806
    goto :goto_10

    .line 807
    :cond_1c
    :try_start_5
    const-class v1, Landroid/os/Process;

    .line 808
    .line 809
    const-string v2, "isIsolated"

    .line 810
    .line 811
    invoke-virtual {v1, v2, v12}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 812
    .line 813
    .line 814
    move-result-object v1

    .line 815
    invoke-virtual {v1, v12, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 816
    .line 817
    .line 818
    move-result-object v1

    .line 819
    new-array v2, v11, [Ljava/lang/Object;

    .line 820
    .line 821
    const-string v3, "expected a non-null reference"

    .line 822
    .line 823
    if-eqz v1, :cond_1d

    .line 824
    .line 825
    check-cast v1, Ljava/lang/Boolean;

    .line 826
    .line 827
    goto :goto_10

    .line 828
    :cond_1d
    new-instance v1, LD1/n;

    .line 829
    .line 830
    invoke-static {v3, v2}, LT0/a;->P(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 831
    .line 832
    .line 833
    move-result-object v2

    .line 834
    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 835
    .line 836
    .line 837
    throw v1
    :try_end_5
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_5 .. :try_end_5} :catch_0

    .line 838
    :catch_0
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 839
    .line 840
    :goto_10
    sput-object v1, LR0/b;->h:Ljava/lang/Boolean;

    .line 841
    .line 842
    :cond_1e
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 843
    .line 844
    .line 845
    move-result v1

    .line 846
    if-nez v1, :cond_1f

    .line 847
    .line 848
    new-instance v1, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 849
    .line 850
    invoke-direct {v1}, Landroid/app/ActivityManager$RunningAppProcessInfo;-><init>()V

    .line 851
    .line 852
    .line 853
    invoke-static {v1}, Landroid/app/ActivityManager;->getMyMemoryState(Landroid/app/ActivityManager$RunningAppProcessInfo;)V

    .line 854
    .line 855
    .line 856
    invoke-virtual {p1, v13}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    .line 857
    .line 858
    .line 859
    move-result p1

    .line 860
    if-nez p1, :cond_20

    .line 861
    .line 862
    iget p1, v1, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    .line 863
    .line 864
    const/16 v1, 0x64

    .line 865
    .line 866
    if-le p1, v1, :cond_20

    .line 867
    .line 868
    invoke-virtual {v0, v13}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 869
    .line 870
    .line 871
    goto :goto_11

    .line 872
    :cond_1f
    move p1, v13

    .line 873
    goto :goto_12

    .line 874
    :cond_20
    :goto_11
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 875
    .line 876
    .line 877
    move-result p1

    .line 878
    :goto_12
    if-nez p1, :cond_28

    .line 879
    .line 880
    iput-wide v8, p0, LM0/d;->a:J

    .line 881
    .line 882
    goto/16 :goto_17

    .line 883
    .line 884
    :catchall_2
    move-exception v0

    .line 885
    :try_start_6
    monitor-exit p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 886
    throw v0

    .line 887
    :pswitch_c
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 888
    .line 889
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 890
    .line 891
    check-cast p1, LK0/a;

    .line 892
    .line 893
    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 894
    .line 895
    .line 896
    move-result-object v1

    .line 897
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 898
    .line 899
    .line 900
    move-result-object v1

    .line 901
    :cond_21
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 902
    .line 903
    .line 904
    move-result v3

    .line 905
    if-eqz v3, :cond_22

    .line 906
    .line 907
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 908
    .line 909
    .line 910
    move-result-object v3

    .line 911
    check-cast v3, LM0/j;

    .line 912
    .line 913
    iget v4, v3, LM0/j;->i:I

    .line 914
    .line 915
    if-ne v4, v0, :cond_21

    .line 916
    .line 917
    goto :goto_13

    .line 918
    :cond_22
    move-object v3, v12

    .line 919
    :goto_13
    if-eqz v3, :cond_24

    .line 920
    .line 921
    iget v0, p1, LK0/a;->f:I

    .line 922
    .line 923
    const/16 v1, 0xd

    .line 924
    .line 925
    if-ne v0, v1, :cond_23

    .line 926
    .line 927
    iget-object v1, p0, LM0/d;->f:LK0/d;

    .line 928
    .line 929
    new-instance v2, Lcom/google/android/gms/common/api/Status;

    .line 930
    .line 931
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 932
    .line 933
    .line 934
    sget v1, LK0/g;->c:I

    .line 935
    .line 936
    invoke-static {v0}, LK0/a;->a(I)Ljava/lang/String;

    .line 937
    .line 938
    .line 939
    move-result-object v0

    .line 940
    iget-object p1, p1, LK0/a;->h:Ljava/lang/String;

    .line 941
    .line 942
    new-instance v1, Ljava/lang/StringBuilder;

    .line 943
    .line 944
    const-string v4, "Error resolution was canceled by the user, original error message: "

    .line 945
    .line 946
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 947
    .line 948
    .line 949
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 950
    .line 951
    .line 952
    const-string v0, ": "

    .line 953
    .line 954
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 955
    .line 956
    .line 957
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 958
    .line 959
    .line 960
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 961
    .line 962
    .line 963
    move-result-object p1

    .line 964
    invoke-direct {v2, v10, p1, v12, v12}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;LK0/a;)V

    .line 965
    .line 966
    .line 967
    invoke-virtual {v3, v2}, LM0/j;->e(Lcom/google/android/gms/common/api/Status;)V

    .line 968
    .line 969
    .line 970
    return v13

    .line 971
    :cond_23
    iget-object v0, v3, LM0/j;->e:LM0/a;

    .line 972
    .line 973
    invoke-static {v0, p1}, LM0/d;->b(LM0/a;LK0/a;)Lcom/google/android/gms/common/api/Status;

    .line 974
    .line 975
    .line 976
    move-result-object p1

    .line 977
    invoke-virtual {v3, p1}, LM0/j;->e(Lcom/google/android/gms/common/api/Status;)V

    .line 978
    .line 979
    .line 980
    return v13

    .line 981
    :cond_24
    const-string p1, "Could not find API instance "

    .line 982
    .line 983
    const-string v1, " while trying to fail enqueued calls."

    .line 984
    .line 985
    invoke-static {v0, p1, v1}, LE1/j;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 986
    .line 987
    .line 988
    move-result-object p1

    .line 989
    new-instance v0, Ljava/lang/Exception;

    .line 990
    .line 991
    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    .line 992
    .line 993
    .line 994
    invoke-static {v2, p1, v0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 995
    .line 996
    .line 997
    return v13

    .line 998
    :pswitch_d
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 999
    .line 1000
    check-cast p1, LM0/q;

    .line 1001
    .line 1002
    iget-object v0, p1, LM0/q;->c:LP0/c;

    .line 1003
    .line 1004
    iget-object v1, p1, LM0/q;->a:LM0/u;

    .line 1005
    .line 1006
    iget-object v0, v0, LP0/c;->e:LM0/a;

    .line 1007
    .line 1008
    invoke-virtual {v4, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1009
    .line 1010
    .line 1011
    move-result-object v0

    .line 1012
    check-cast v0, LM0/j;

    .line 1013
    .line 1014
    if-nez v0, :cond_25

    .line 1015
    .line 1016
    iget-object v0, p1, LM0/q;->c:LP0/c;

    .line 1017
    .line 1018
    invoke-virtual {p0, v0}, LM0/d;->c(LP0/c;)LM0/j;

    .line 1019
    .line 1020
    .line 1021
    move-result-object v0

    .line 1022
    :cond_25
    iget-object v2, v0, LM0/j;->d:LL0/a;

    .line 1023
    .line 1024
    invoke-interface {v2}, LL0/a;->n()Z

    .line 1025
    .line 1026
    .line 1027
    move-result v2

    .line 1028
    if-eqz v2, :cond_26

    .line 1029
    .line 1030
    iget-object v2, p0, LM0/d;->i:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 1031
    .line 1032
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 1033
    .line 1034
    .line 1035
    move-result v2

    .line 1036
    iget p1, p1, LM0/q;->b:I

    .line 1037
    .line 1038
    if-eq v2, p1, :cond_26

    .line 1039
    .line 1040
    sget-object p1, LM0/d;->o:Lcom/google/android/gms/common/api/Status;

    .line 1041
    .line 1042
    invoke-virtual {v1, p1}, LM0/u;->c(Lcom/google/android/gms/common/api/Status;)V

    .line 1043
    .line 1044
    .line 1045
    invoke-virtual {v0}, LM0/j;->p()V

    .line 1046
    .line 1047
    .line 1048
    return v13

    .line 1049
    :cond_26
    invoke-virtual {v0, v1}, LM0/j;->n(LM0/o;)V

    .line 1050
    .line 1051
    .line 1052
    return v13

    .line 1053
    :pswitch_e
    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 1054
    .line 1055
    .line 1056
    move-result-object p1

    .line 1057
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 1058
    .line 1059
    .line 1060
    move-result-object p1

    .line 1061
    :goto_14
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 1062
    .line 1063
    .line 1064
    move-result v0

    .line 1065
    if-eqz v0, :cond_28

    .line 1066
    .line 1067
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1068
    .line 1069
    .line 1070
    move-result-object v0

    .line 1071
    check-cast v0, LM0/j;

    .line 1072
    .line 1073
    iget-object v1, v0, LM0/j;->m:LM0/d;

    .line 1074
    .line 1075
    iget-object v1, v1, LM0/d;->m:LW0/e;

    .line 1076
    .line 1077
    invoke-static {v1}, LN0/n;->b(Landroid/os/Handler;)V

    .line 1078
    .line 1079
    .line 1080
    iput-object v12, v0, LM0/j;->l:LK0/a;

    .line 1081
    .line 1082
    invoke-virtual {v0}, LM0/j;->m()V

    .line 1083
    .line 1084
    .line 1085
    goto :goto_14

    .line 1086
    :pswitch_f
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1087
    .line 1088
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1089
    .line 1090
    .line 1091
    new-instance p1, Ljava/lang/ClassCastException;

    .line 1092
    .line 1093
    invoke-direct {p1}, Ljava/lang/ClassCastException;-><init>()V

    .line 1094
    .line 1095
    .line 1096
    throw p1

    .line 1097
    :pswitch_10
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1098
    .line 1099
    check-cast p1, Ljava/lang/Boolean;

    .line 1100
    .line 1101
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 1102
    .line 1103
    .line 1104
    move-result p1

    .line 1105
    if-eq v13, p1, :cond_27

    .line 1106
    .line 1107
    goto :goto_15

    .line 1108
    :cond_27
    const-wide/16 v8, 0x2710

    .line 1109
    .line 1110
    :goto_15
    iput-wide v8, p0, LM0/d;->a:J

    .line 1111
    .line 1112
    const/16 p1, 0xc

    .line 1113
    .line 1114
    invoke-virtual {v3, p1}, Landroid/os/Handler;->removeMessages(I)V

    .line 1115
    .line 1116
    .line 1117
    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->keySet()Ljava/util/Set;

    .line 1118
    .line 1119
    .line 1120
    move-result-object v0

    .line 1121
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 1122
    .line 1123
    .line 1124
    move-result-object v0

    .line 1125
    :goto_16
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 1126
    .line 1127
    .line 1128
    move-result v1

    .line 1129
    if-eqz v1, :cond_28

    .line 1130
    .line 1131
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1132
    .line 1133
    .line 1134
    move-result-object v1

    .line 1135
    check-cast v1, LM0/a;

    .line 1136
    .line 1137
    invoke-virtual {v3, p1, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 1138
    .line 1139
    .line 1140
    move-result-object v1

    .line 1141
    iget-wide v4, p0, LM0/d;->a:J

    .line 1142
    .line 1143
    invoke-virtual {v3, v1, v4, v5}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 1144
    .line 1145
    .line 1146
    goto :goto_16

    .line 1147
    :cond_28
    :goto_17
    return v13

    .line 1148
    nop

    .line 1149
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_d
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_d
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
