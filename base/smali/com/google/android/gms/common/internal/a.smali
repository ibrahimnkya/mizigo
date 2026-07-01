.class public abstract Lcom/google/android/gms/common/internal/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LL0/a;


# static fields
.field public static final x:[LK0/c;


# instance fields
.field public volatile a:Ljava/lang/String;

.field public b:LI2/h;

.field public final c:Landroid/content/Context;

.field public final d:LN0/y;

.field public final e:LN0/q;

.field public final f:Ljava/lang/Object;

.field public final g:Ljava/lang/Object;

.field public h:LN0/m;

.field public i:LM0/l;

.field public j:Landroid/os/IInterface;

.field public final k:Ljava/util/ArrayList;

.field public l:LN0/s;

.field public m:I

.field public final n:LE/i;

.field public final o:LA0/c;

.field public final p:I

.field public final q:Ljava/lang/String;

.field public volatile r:Ljava/lang/String;

.field public s:LK0/a;

.field public t:Z

.field public volatile u:LN0/v;

.field public final v:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final w:Ljava/util/Set;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [LK0/c;

    .line 3
    .line 4
    sput-object v0, Lcom/google/android/gms/common/internal/a;->x:[LK0/c;

    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;ILB2/a;LL0/c;LL0/d;)V
    .locals 4

    .line 1
    sget-object v0, LN0/y;->g:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, LN0/y;->h:LN0/y;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, LN0/y;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-direct {v1, v2, v3}, LN0/y;-><init>(Landroid/content/Context;Landroid/os/Looper;)V

    .line 19
    .line 20
    .line 21
    sput-object v1, LN0/y;->h:LN0/y;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p1

    .line 25
    goto/16 :goto_2

    .line 26
    .line 27
    :cond_0
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    sget-object v0, LN0/y;->h:LN0/y;

    .line 29
    .line 30
    sget-object v1, LK0/d;->c:Ljava/lang/Object;

    .line 31
    .line 32
    invoke-static {p5}, LN0/n;->e(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p6}, LN0/n;->e(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    new-instance v1, LE/i;

    .line 39
    .line 40
    const/4 v2, 0x7

    .line 41
    invoke-direct {v1, v2, p5}, LE/i;-><init>(ILjava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    new-instance p5, LA0/c;

    .line 45
    .line 46
    const/16 v2, 0xc

    .line 47
    .line 48
    invoke-direct {p5, v2, p6}, LA0/c;-><init>(ILjava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    iget-object p6, p4, LB2/a;->g:Ljava/lang/Object;

    .line 52
    .line 53
    check-cast p6, Ljava/lang/String;

    .line 54
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    .line 57
    .line 58
    const/4 v2, 0x0

    .line 59
    iput-object v2, p0, Lcom/google/android/gms/common/internal/a;->a:Ljava/lang/String;

    .line 60
    .line 61
    new-instance v3, Ljava/lang/Object;

    .line 62
    .line 63
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object v3, p0, Lcom/google/android/gms/common/internal/a;->f:Ljava/lang/Object;

    .line 67
    .line 68
    new-instance v3, Ljava/lang/Object;

    .line 69
    .line 70
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 71
    .line 72
    .line 73
    iput-object v3, p0, Lcom/google/android/gms/common/internal/a;->g:Ljava/lang/Object;

    .line 74
    .line 75
    new-instance v3, Ljava/util/ArrayList;

    .line 76
    .line 77
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 78
    .line 79
    .line 80
    iput-object v3, p0, Lcom/google/android/gms/common/internal/a;->k:Ljava/util/ArrayList;

    .line 81
    .line 82
    const/4 v3, 0x1

    .line 83
    iput v3, p0, Lcom/google/android/gms/common/internal/a;->m:I

    .line 84
    .line 85
    iput-object v2, p0, Lcom/google/android/gms/common/internal/a;->s:LK0/a;

    .line 86
    .line 87
    const/4 v3, 0x0

    .line 88
    iput-boolean v3, p0, Lcom/google/android/gms/common/internal/a;->t:Z

    .line 89
    .line 90
    iput-object v2, p0, Lcom/google/android/gms/common/internal/a;->u:LN0/v;

    .line 91
    .line 92
    new-instance v2, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 93
    .line 94
    invoke-direct {v2, v3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 95
    .line 96
    .line 97
    iput-object v2, p0, Lcom/google/android/gms/common/internal/a;->v:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 98
    .line 99
    const-string v2, "Context must not be null"

    .line 100
    .line 101
    invoke-static {p1, v2}, LN0/n;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    iput-object p1, p0, Lcom/google/android/gms/common/internal/a;->c:Landroid/content/Context;

    .line 105
    .line 106
    const-string p1, "Looper must not be null"

    .line 107
    .line 108
    invoke-static {p2, p1}, LN0/n;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    const-string p1, "Supervisor must not be null"

    .line 112
    .line 113
    invoke-static {v0, p1}, LN0/n;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    iput-object v0, p0, Lcom/google/android/gms/common/internal/a;->d:LN0/y;

    .line 117
    .line 118
    new-instance p1, LN0/q;

    .line 119
    .line 120
    invoke-direct {p1, p0, p2}, LN0/q;-><init>(Lcom/google/android/gms/common/internal/a;Landroid/os/Looper;)V

    .line 121
    .line 122
    .line 123
    iput-object p1, p0, Lcom/google/android/gms/common/internal/a;->e:LN0/q;

    .line 124
    .line 125
    iput p3, p0, Lcom/google/android/gms/common/internal/a;->p:I

    .line 126
    .line 127
    iput-object v1, p0, Lcom/google/android/gms/common/internal/a;->n:LE/i;

    .line 128
    .line 129
    iput-object p5, p0, Lcom/google/android/gms/common/internal/a;->o:LA0/c;

    .line 130
    .line 131
    iput-object p6, p0, Lcom/google/android/gms/common/internal/a;->q:Ljava/lang/String;

    .line 132
    .line 133
    iget-object p1, p4, LB2/a;->f:Ljava/lang/Object;

    .line 134
    .line 135
    check-cast p1, Ljava/util/Set;

    .line 136
    .line 137
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 138
    .line 139
    .line 140
    move-result-object p2

    .line 141
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 142
    .line 143
    .line 144
    move-result p3

    .line 145
    if-eqz p3, :cond_2

    .line 146
    .line 147
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object p3

    .line 151
    check-cast p3, Lcom/google/android/gms/common/api/Scope;

    .line 152
    .line 153
    invoke-interface {p1, p3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result p3

    .line 157
    if-eqz p3, :cond_1

    .line 158
    .line 159
    goto :goto_1

    .line 160
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 161
    .line 162
    const-string p2, "Expanding scopes is not permitted, use implied scopes instead"

    .line 163
    .line 164
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    throw p1

    .line 168
    :cond_2
    iput-object p1, p0, Lcom/google/android/gms/common/internal/a;->w:Ljava/util/Set;

    .line 169
    .line 170
    return-void

    .line 171
    :goto_2
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 172
    throw p1
.end method


# virtual methods
.method public final b()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/internal/a;->f:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Lcom/google/android/gms/common/internal/a;->m:I

    .line 5
    .line 6
    const/4 v2, 0x4

    .line 7
    if-ne v1, v2, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v1, 0x0

    .line 12
    :goto_0
    monitor-exit v0

    .line 13
    return v1

    .line 14
    :catchall_0
    move-exception v1

    .line 15
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    throw v1
.end method

.method public final c()Ljava/util/Set;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/a;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/google/android/gms/common/internal/a;->w:Ljava/util/Set;

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    sget-object v0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    .line 11
    .line 12
    return-object v0
.end method

.method public final d(LE/i;)V
    .locals 3

    .line 1
    iget-object v0, p1, LE/i;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LM0/j;

    .line 4
    .line 5
    iget-object v0, v0, LM0/j;->m:LM0/d;

    .line 6
    .line 7
    iget-object v0, v0, LM0/d;->m:LW0/e;

    .line 8
    .line 9
    new-instance v1, LA/b;

    .line 10
    .line 11
    const/4 v2, 0x4

    .line 12
    invoke-direct {v1, v2, p1}, LA/b;-><init>(ILjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final e(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/internal/a;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/a;->m()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final f(LN0/d;Ljava/util/Set;)V
    .locals 18

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p2

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/google/android/gms/common/internal/a;->q()Landroid/os/Bundle;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    new-instance v3, LN0/c;

    .line 10
    .line 11
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 12
    .line 13
    const/16 v5, 0x1f

    .line 14
    .line 15
    if-ge v4, v5, :cond_0

    .line 16
    .line 17
    iget-object v4, v1, Lcom/google/android/gms/common/internal/a;->r:Ljava/lang/String;

    .line 18
    .line 19
    :goto_0
    move-object/from16 v17, v4

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    iget-object v4, v1, Lcom/google/android/gms/common/internal/a;->r:Ljava/lang/String;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :goto_1
    iget v5, v1, Lcom/google/android/gms/common/internal/a;->p:I

    .line 26
    .line 27
    sget v6, LK0/e;->a:I

    .line 28
    .line 29
    sget-object v9, LN0/c;->s:[Lcom/google/android/gms/common/api/Scope;

    .line 30
    .line 31
    new-instance v10, Landroid/os/Bundle;

    .line 32
    .line 33
    invoke-direct {v10}, Landroid/os/Bundle;-><init>()V

    .line 34
    .line 35
    .line 36
    sget-object v12, LN0/c;->t:[LK0/c;

    .line 37
    .line 38
    const/4 v15, 0x0

    .line 39
    const/16 v16, 0x0

    .line 40
    .line 41
    const/4 v4, 0x6

    .line 42
    const/4 v7, 0x0

    .line 43
    const/4 v8, 0x0

    .line 44
    const/4 v11, 0x0

    .line 45
    const/4 v14, 0x1

    .line 46
    move-object v13, v12

    .line 47
    invoke-direct/range {v3 .. v17}, LN0/c;-><init>(IIILjava/lang/String;Landroid/os/IBinder;[Lcom/google/android/gms/common/api/Scope;Landroid/os/Bundle;Landroid/accounts/Account;[LK0/c;[LK0/c;ZIZLjava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object v4, v1, Lcom/google/android/gms/common/internal/a;->c:Landroid/content/Context;

    .line 51
    .line 52
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    iput-object v4, v3, LN0/c;->h:Ljava/lang/String;

    .line 57
    .line 58
    iput-object v2, v3, LN0/c;->k:Landroid/os/Bundle;

    .line 59
    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    const/4 v2, 0x0

    .line 63
    new-array v2, v2, [Lcom/google/android/gms/common/api/Scope;

    .line 64
    .line 65
    invoke-interface {v0, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, [Lcom/google/android/gms/common/api/Scope;

    .line 70
    .line 71
    iput-object v0, v3, LN0/c;->j:[Lcom/google/android/gms/common/api/Scope;

    .line 72
    .line 73
    :cond_1
    invoke-virtual {v1}, Lcom/google/android/gms/common/internal/a;->n()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_2

    .line 78
    .line 79
    new-instance v0, Landroid/accounts/Account;

    .line 80
    .line 81
    const-string v2, "<<default account>>"

    .line 82
    .line 83
    const-string v4, "com.google"

    .line 84
    .line 85
    invoke-direct {v0, v2, v4}, Landroid/accounts/Account;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iput-object v0, v3, LN0/c;->l:Landroid/accounts/Account;

    .line 89
    .line 90
    if-eqz p1, :cond_2

    .line 91
    .line 92
    move-object/from16 v0, p1

    .line 93
    .line 94
    check-cast v0, LY0/a;

    .line 95
    .line 96
    iget-object v0, v0, LY0/a;->d:Landroid/os/IBinder;

    .line 97
    .line 98
    iput-object v0, v3, LN0/c;->i:Landroid/os/IBinder;

    .line 99
    .line 100
    :cond_2
    sget-object v0, Lcom/google/android/gms/common/internal/a;->x:[LK0/c;

    .line 101
    .line 102
    iput-object v0, v3, LN0/c;->m:[LK0/c;

    .line 103
    .line 104
    invoke-virtual {v1}, Lcom/google/android/gms/common/internal/a;->p()[LK0/c;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iput-object v0, v3, LN0/c;->n:[LK0/c;

    .line 109
    .line 110
    :try_start_0
    iget-object v2, v1, Lcom/google/android/gms/common/internal/a;->g:Ljava/lang/Object;

    .line 111
    .line 112
    monitor-enter v2
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    :try_start_1
    iget-object v0, v1, Lcom/google/android/gms/common/internal/a;->h:LN0/m;

    .line 114
    .line 115
    if-eqz v0, :cond_3

    .line 116
    .line 117
    new-instance v4, LN0/r;

    .line 118
    .line 119
    iget-object v5, v1, Lcom/google/android/gms/common/internal/a;->v:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 120
    .line 121
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 122
    .line 123
    .line 124
    move-result v5

    .line 125
    invoke-direct {v4, v1, v5}, LN0/r;-><init>(Lcom/google/android/gms/common/internal/a;I)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0, v4, v3}, LN0/m;->a(LN0/r;LN0/c;)V

    .line 129
    .line 130
    .line 131
    goto :goto_2

    .line 132
    :catchall_0
    move-exception v0

    .line 133
    goto :goto_3

    .line 134
    :cond_3
    const-string v0, "GmsClient"

    .line 135
    .line 136
    const-string v3, "mServiceBroker is null, client disconnected"

    .line 137
    .line 138
    invoke-static {v0, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    .line 140
    .line 141
    :goto_2
    monitor-exit v2

    .line 142
    return-void

    .line 143
    :goto_3
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 144
    :try_start_2
    throw v0
    :try_end_2
    .catch Landroid/os/DeadObjectException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0

    .line 145
    :catch_0
    move-exception v0

    .line 146
    goto :goto_4

    .line 147
    :catch_1
    move-exception v0

    .line 148
    goto :goto_4

    .line 149
    :catch_2
    move-exception v0

    .line 150
    goto :goto_5

    .line 151
    :catch_3
    move-exception v0

    .line 152
    goto :goto_6

    .line 153
    :goto_4
    const-string v2, "GmsClient"

    .line 154
    .line 155
    const-string v3, "IGmsServiceBroker.getService failed"

    .line 156
    .line 157
    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 158
    .line 159
    .line 160
    iget-object v0, v1, Lcom/google/android/gms/common/internal/a;->v:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 161
    .line 162
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    new-instance v2, LN0/t;

    .line 167
    .line 168
    const/16 v3, 0x8

    .line 169
    .line 170
    const/4 v4, 0x0

    .line 171
    invoke-direct {v2, v1, v3, v4, v4}, LN0/t;-><init>(Lcom/google/android/gms/common/internal/a;ILandroid/os/IBinder;Landroid/os/Bundle;)V

    .line 172
    .line 173
    .line 174
    iget-object v3, v1, Lcom/google/android/gms/common/internal/a;->e:LN0/q;

    .line 175
    .line 176
    const/4 v4, 0x1

    .line 177
    const/4 v5, -0x1

    .line 178
    invoke-virtual {v3, v4, v0, v5, v2}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-virtual {v3, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 183
    .line 184
    .line 185
    return-void

    .line 186
    :goto_5
    throw v0

    .line 187
    :goto_6
    const-string v2, "GmsClient"

    .line 188
    .line 189
    const-string v3, "IGmsServiceBroker.getService failed"

    .line 190
    .line 191
    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 192
    .line 193
    .line 194
    iget-object v0, v1, Lcom/google/android/gms/common/internal/a;->v:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 195
    .line 196
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    iget-object v2, v1, Lcom/google/android/gms/common/internal/a;->e:LN0/q;

    .line 201
    .line 202
    const/4 v3, 0x6

    .line 203
    const/4 v4, 0x3

    .line 204
    invoke-virtual {v2, v3, v0, v4}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-virtual {v2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 209
    .line 210
    .line 211
    return-void
.end method

.method public final h()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/internal/a;->f:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Lcom/google/android/gms/common/internal/a;->m:I

    .line 5
    .line 6
    const/4 v2, 0x2

    .line 7
    const/4 v3, 0x1

    .line 8
    if-eq v1, v2, :cond_1

    .line 9
    .line 10
    const/4 v2, 0x3

    .line 11
    if-ne v1, v2, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v3, 0x0

    .line 15
    :cond_1
    :goto_0
    monitor-exit v0

    .line 16
    return v3

    .line 17
    :catchall_0
    move-exception v1

    .line 18
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw v1
.end method

.method public final i()[LK0/c;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/internal/a;->u:LN0/v;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    return-object v0

    .line 7
    :cond_0
    iget-object v0, v0, LN0/v;->f:[LK0/c;

    .line 8
    .line 9
    return-object v0
.end method

.method public final j()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/a;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/google/android/gms/common/internal/a;->b:LI2/h;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    .line 13
    .line 14
    const-string v1, "Failed to connect when checking package"

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    throw v0
.end method

.method public final k(LM0/l;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/internal/a;->i:LM0/l;

    .line 2
    .line 3
    const/4 p1, 0x2

    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/common/internal/a;->v(ILandroid/os/IInterface;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final l()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/internal/a;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public final m()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/internal/a;->v:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/google/android/gms/common/internal/a;->k:Ljava/util/ArrayList;

    .line 7
    .line 8
    monitor-enter v0

    .line 9
    :try_start_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    :goto_0
    const/4 v3, 0x0

    .line 15
    if-ge v2, v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    check-cast v4, LN0/l;

    .line 22
    .line 23
    monitor-enter v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 24
    :try_start_1
    iput-object v3, v4, LN0/l;->a:Ljava/lang/Boolean;

    .line 25
    .line 26
    monitor-exit v4

    .line 27
    add-int/lit8 v2, v2, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception v1

    .line 31
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    :try_start_2
    throw v1

    .line 33
    :catchall_1
    move-exception v1

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 36
    .line 37
    .line 38
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 39
    iget-object v1, p0, Lcom/google/android/gms/common/internal/a;->g:Ljava/lang/Object;

    .line 40
    .line 41
    monitor-enter v1

    .line 42
    :try_start_3
    iput-object v3, p0, Lcom/google/android/gms/common/internal/a;->h:LN0/m;

    .line 43
    .line 44
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 45
    const/4 v0, 0x1

    .line 46
    invoke-virtual {p0, v0, v3}, Lcom/google/android/gms/common/internal/a;->v(ILandroid/os/IInterface;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :catchall_2
    move-exception v0

    .line 51
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 52
    throw v0

    .line 53
    :goto_1
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 54
    throw v1
.end method

.method public n()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return v0
.end method

.method public abstract o(Landroid/os/IBinder;)Landroid/os/IInterface;
.end method

.method public abstract p()[LK0/c;
.end method

.method public abstract q()Landroid/os/Bundle;
.end method

.method public abstract r()Ljava/lang/String;
.end method

.method public abstract s()Ljava/lang/String;
.end method

.method public abstract t()Z
.end method

.method public final synthetic u(IILandroid/os/IInterface;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/internal/a;->f:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Lcom/google/android/gms/common/internal/a;->m:I

    .line 5
    .line 6
    if-eq v1, p1, :cond_0

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    const/4 p1, 0x0

    .line 10
    return p1

    .line 11
    :catchall_0
    move-exception p1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {p0, p2, p3}, Lcom/google/android/gms/common/internal/a;->v(ILandroid/os/IInterface;)V

    .line 14
    .line 15
    .line 16
    monitor-exit v0

    .line 17
    const/4 p1, 0x1

    .line 18
    return p1

    .line 19
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    throw p1
.end method

.method public final v(ILandroid/os/IInterface;)V
    .locals 12

    .line 1
    const-string v0, " on com.google.android.gms"

    .line 2
    .line 3
    const-string v1, " on com.google.android.gms"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    const/4 v4, 0x4

    .line 8
    if-eq p1, v4, :cond_0

    .line 9
    .line 10
    move v5, v2

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v5, v3

    .line 13
    :goto_0
    if-nez p2, :cond_1

    .line 14
    .line 15
    move v6, v2

    .line 16
    goto :goto_1

    .line 17
    :cond_1
    move v6, v3

    .line 18
    :goto_1
    if-ne v5, v6, :cond_f

    .line 19
    .line 20
    iget-object v5, p0, Lcom/google/android/gms/common/internal/a;->f:Ljava/lang/Object;

    .line 21
    .line 22
    monitor-enter v5

    .line 23
    :try_start_0
    iput p1, p0, Lcom/google/android/gms/common/internal/a;->m:I

    .line 24
    .line 25
    iput-object p2, p0, Lcom/google/android/gms/common/internal/a;->j:Landroid/os/IInterface;

    .line 26
    .line 27
    const/4 v6, 0x0

    .line 28
    if-eq p1, v3, :cond_c

    .line 29
    .line 30
    const/4 v7, 0x2

    .line 31
    if-eq p1, v7, :cond_3

    .line 32
    .line 33
    const/4 v7, 0x3

    .line 34
    if-eq p1, v7, :cond_3

    .line 35
    .line 36
    if-eq p1, v4, :cond_2

    .line 37
    .line 38
    goto/16 :goto_3

    .line 39
    .line 40
    :cond_2
    invoke-static {p2}, LN0/n;->e(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 44
    .line 45
    .line 46
    goto/16 :goto_3

    .line 47
    .line 48
    :catchall_0
    move-exception p1

    .line 49
    goto/16 :goto_4

    .line 50
    .line 51
    :cond_3
    const-string p1, "Calling connect() while still connected, missing disconnect() for "

    .line 52
    .line 53
    const-string p2, "Internal Error, the minimum apk version of this BaseGmsClient is too low to support dynamic lookup. Start service action: "

    .line 54
    .line 55
    const-string v4, "unable to connect to service: "

    .line 56
    .line 57
    iget-object v7, p0, Lcom/google/android/gms/common/internal/a;->l:LN0/s;

    .line 58
    .line 59
    if-eqz v7, :cond_5

    .line 60
    .line 61
    iget-object v8, p0, Lcom/google/android/gms/common/internal/a;->b:LI2/h;

    .line 62
    .line 63
    if-eqz v8, :cond_5

    .line 64
    .line 65
    const-string v9, "GmsClient"

    .line 66
    .line 67
    iget-object v8, v8, LI2/h;->b:Ljava/lang/Object;

    .line 68
    .line 69
    check-cast v8, Ljava/lang/String;

    .line 70
    .line 71
    const-string v10, "com.google.android.gms"

    .line 72
    .line 73
    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v11

    .line 77
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    .line 78
    .line 79
    .line 80
    move-result v11

    .line 81
    add-int/lit8 v11, v11, 0x46

    .line 82
    .line 83
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    .line 84
    .line 85
    .line 86
    move-result v10

    .line 87
    add-int/2addr v11, v10

    .line 88
    new-instance v10, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-static {v9, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/google/android/gms/common/internal/a;->d:LN0/y;

    .line 110
    .line 111
    iget-object v1, p0, Lcom/google/android/gms/common/internal/a;->b:LI2/h;

    .line 112
    .line 113
    iget-object v1, v1, LI2/h;->b:Ljava/lang/Object;

    .line 114
    .line 115
    check-cast v1, Ljava/lang/String;

    .line 116
    .line 117
    invoke-static {v1}, LN0/n;->e(Ljava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    iget-object v8, p0, Lcom/google/android/gms/common/internal/a;->b:LI2/h;

    .line 121
    .line 122
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 123
    .line 124
    .line 125
    iget-object v8, p0, Lcom/google/android/gms/common/internal/a;->q:Ljava/lang/String;

    .line 126
    .line 127
    if-nez v8, :cond_4

    .line 128
    .line 129
    iget-object v8, p0, Lcom/google/android/gms/common/internal/a;->c:Landroid/content/Context;

    .line 130
    .line 131
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 132
    .line 133
    .line 134
    :cond_4
    iget-object v8, p0, Lcom/google/android/gms/common/internal/a;->b:LI2/h;

    .line 135
    .line 136
    iget-boolean v8, v8, LI2/h;->a:Z

    .line 137
    .line 138
    invoke-virtual {p1, v1, v7, v8}, LN0/y;->b(Ljava/lang/String;Landroid/content/ServiceConnection;Z)V

    .line 139
    .line 140
    .line 141
    iget-object p1, p0, Lcom/google/android/gms/common/internal/a;->v:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 142
    .line 143
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 144
    .line 145
    .line 146
    :cond_5
    new-instance p1, LN0/s;

    .line 147
    .line 148
    iget-object v1, p0, Lcom/google/android/gms/common/internal/a;->v:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 149
    .line 150
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    invoke-direct {p1, p0, v1}, LN0/s;-><init>(Lcom/google/android/gms/common/internal/a;I)V

    .line 155
    .line 156
    .line 157
    iput-object p1, p0, Lcom/google/android/gms/common/internal/a;->l:LN0/s;

    .line 158
    .line 159
    new-instance v1, LI2/h;

    .line 160
    .line 161
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/a;->s()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v7

    .line 165
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/a;->t()Z

    .line 166
    .line 167
    .line 168
    move-result v8

    .line 169
    invoke-direct {v1, v7, v8}, LI2/h;-><init>(Ljava/lang/Object;Z)V

    .line 170
    .line 171
    .line 172
    iput-object v1, p0, Lcom/google/android/gms/common/internal/a;->b:LI2/h;

    .line 173
    .line 174
    if-eqz v8, :cond_7

    .line 175
    .line 176
    invoke-interface {p0}, LL0/a;->g()I

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    const v7, 0x1110e58

    .line 181
    .line 182
    .line 183
    if-lt v1, v7, :cond_6

    .line 184
    .line 185
    goto :goto_2

    .line 186
    :cond_6
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 187
    .line 188
    iget-object v0, p0, Lcom/google/android/gms/common/internal/a;->b:LI2/h;

    .line 189
    .line 190
    iget-object v0, v0, LI2/h;->b:Ljava/lang/Object;

    .line 191
    .line 192
    check-cast v0, Ljava/lang/String;

    .line 193
    .line 194
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-virtual {p2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p2

    .line 202
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    throw p1

    .line 206
    :cond_7
    :goto_2
    iget-object p2, p0, Lcom/google/android/gms/common/internal/a;->d:LN0/y;

    .line 207
    .line 208
    iget-object v1, p0, Lcom/google/android/gms/common/internal/a;->b:LI2/h;

    .line 209
    .line 210
    iget-object v1, v1, LI2/h;->b:Ljava/lang/Object;

    .line 211
    .line 212
    check-cast v1, Ljava/lang/String;

    .line 213
    .line 214
    invoke-static {v1}, LN0/n;->e(Ljava/lang/Object;)V

    .line 215
    .line 216
    .line 217
    iget-object v7, p0, Lcom/google/android/gms/common/internal/a;->b:LI2/h;

    .line 218
    .line 219
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 220
    .line 221
    .line 222
    iget-object v7, p0, Lcom/google/android/gms/common/internal/a;->q:Ljava/lang/String;

    .line 223
    .line 224
    if-nez v7, :cond_8

    .line 225
    .line 226
    iget-object v7, p0, Lcom/google/android/gms/common/internal/a;->c:Landroid/content/Context;

    .line 227
    .line 228
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 229
    .line 230
    .line 231
    move-result-object v7

    .line 232
    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v7

    .line 236
    :cond_8
    iget-object v8, p0, Lcom/google/android/gms/common/internal/a;->b:LI2/h;

    .line 237
    .line 238
    iget-boolean v8, v8, LI2/h;->a:Z

    .line 239
    .line 240
    new-instance v9, LN0/w;

    .line 241
    .line 242
    invoke-direct {v9, v1, v8}, LN0/w;-><init>(Ljava/lang/String;Z)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {p2, v9, p1, v7}, LN0/y;->a(LN0/w;LN0/s;Ljava/lang/String;)LK0/a;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    iget p2, p1, LK0/a;->f:I

    .line 250
    .line 251
    if-nez p2, :cond_9

    .line 252
    .line 253
    move v2, v3

    .line 254
    :cond_9
    if-nez v2, :cond_e

    .line 255
    .line 256
    const-string p2, "GmsClient"

    .line 257
    .line 258
    iget-object v1, p0, Lcom/google/android/gms/common/internal/a;->b:LI2/h;

    .line 259
    .line 260
    iget-object v1, v1, LI2/h;->b:Ljava/lang/Object;

    .line 261
    .line 262
    check-cast v1, Ljava/lang/String;

    .line 263
    .line 264
    const-string v2, "com.google.android.gms"

    .line 265
    .line 266
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v3

    .line 270
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 271
    .line 272
    .line 273
    move-result v3

    .line 274
    add-int/lit8 v3, v3, 0x22

    .line 275
    .line 276
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 277
    .line 278
    .line 279
    move-result v2

    .line 280
    add-int/2addr v3, v2

    .line 281
    new-instance v2, Ljava/lang/StringBuilder;

    .line 282
    .line 283
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 284
    .line 285
    .line 286
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 287
    .line 288
    .line 289
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 290
    .line 291
    .line 292
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 293
    .line 294
    .line 295
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    invoke-static {p2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 300
    .line 301
    .line 302
    iget p2, p1, LK0/a;->f:I

    .line 303
    .line 304
    const/4 v0, -0x1

    .line 305
    if-ne p2, v0, :cond_a

    .line 306
    .line 307
    const/16 p2, 0x10

    .line 308
    .line 309
    :cond_a
    iget-object v1, p1, LK0/a;->g:Landroid/app/PendingIntent;

    .line 310
    .line 311
    if-eqz v1, :cond_b

    .line 312
    .line 313
    new-instance v6, Landroid/os/Bundle;

    .line 314
    .line 315
    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    .line 316
    .line 317
    .line 318
    const-string v1, "pendingIntent"

    .line 319
    .line 320
    iget-object p1, p1, LK0/a;->g:Landroid/app/PendingIntent;

    .line 321
    .line 322
    invoke-virtual {v6, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 323
    .line 324
    .line 325
    :cond_b
    iget-object p1, p0, Lcom/google/android/gms/common/internal/a;->v:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 326
    .line 327
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 328
    .line 329
    .line 330
    move-result p1

    .line 331
    new-instance v1, LN0/u;

    .line 332
    .line 333
    invoke-direct {v1, p0, p2, v6}, LN0/u;-><init>(Lcom/google/android/gms/common/internal/a;ILandroid/os/Bundle;)V

    .line 334
    .line 335
    .line 336
    iget-object p2, p0, Lcom/google/android/gms/common/internal/a;->e:LN0/q;

    .line 337
    .line 338
    const/4 v2, 0x7

    .line 339
    invoke-virtual {p2, v2, p1, v0, v1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 340
    .line 341
    .line 342
    move-result-object p1

    .line 343
    invoke-virtual {p2, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 344
    .line 345
    .line 346
    goto :goto_3

    .line 347
    :cond_c
    iget-object p1, p0, Lcom/google/android/gms/common/internal/a;->l:LN0/s;

    .line 348
    .line 349
    if-eqz p1, :cond_e

    .line 350
    .line 351
    iget-object p2, p0, Lcom/google/android/gms/common/internal/a;->d:LN0/y;

    .line 352
    .line 353
    iget-object v0, p0, Lcom/google/android/gms/common/internal/a;->b:LI2/h;

    .line 354
    .line 355
    iget-object v0, v0, LI2/h;->b:Ljava/lang/Object;

    .line 356
    .line 357
    check-cast v0, Ljava/lang/String;

    .line 358
    .line 359
    invoke-static {v0}, LN0/n;->e(Ljava/lang/Object;)V

    .line 360
    .line 361
    .line 362
    iget-object v1, p0, Lcom/google/android/gms/common/internal/a;->b:LI2/h;

    .line 363
    .line 364
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 365
    .line 366
    .line 367
    iget-object v1, p0, Lcom/google/android/gms/common/internal/a;->q:Ljava/lang/String;

    .line 368
    .line 369
    if-nez v1, :cond_d

    .line 370
    .line 371
    iget-object v1, p0, Lcom/google/android/gms/common/internal/a;->c:Landroid/content/Context;

    .line 372
    .line 373
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 374
    .line 375
    .line 376
    :cond_d
    iget-object v1, p0, Lcom/google/android/gms/common/internal/a;->b:LI2/h;

    .line 377
    .line 378
    iget-boolean v1, v1, LI2/h;->a:Z

    .line 379
    .line 380
    invoke-virtual {p2, v0, p1, v1}, LN0/y;->b(Ljava/lang/String;Landroid/content/ServiceConnection;Z)V

    .line 381
    .line 382
    .line 383
    iput-object v6, p0, Lcom/google/android/gms/common/internal/a;->l:LN0/s;

    .line 384
    .line 385
    :cond_e
    :goto_3
    monitor-exit v5

    .line 386
    return-void

    .line 387
    :goto_4
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 388
    throw p1

    .line 389
    :cond_f
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 390
    .line 391
    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 392
    .line 393
    .line 394
    throw p1
.end method
