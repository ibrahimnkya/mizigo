.class public final LM0/u;
.super LM0/o;
.source "SourceFile"


# instance fields
.field public final b:LM0/t;

.field public final c:Li1/i;

.field public final d:LK0/h;


# direct methods
.method public constructor <init>(LM0/t;Li1/i;LK0/h;)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, LM0/o;-><init>(I)V

    .line 3
    .line 4
    .line 5
    iput-object p2, p0, LM0/u;->c:Li1/i;

    .line 6
    .line 7
    iput-object p1, p0, LM0/u;->b:LM0/t;

    .line 8
    .line 9
    iput-object p3, p0, LM0/u;->d:LK0/h;

    .line 10
    .line 11
    iget-boolean p1, p1, LM0/t;->a:Z

    .line 12
    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 17
    .line 18
    const-string p2, "Best-effort write calls cannot pass methods that should auto-resolve missing features."

    .line 19
    .line 20
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    throw p1
.end method


# virtual methods
.method public final a(LM0/j;)Z
    .locals 0

    .line 1
    iget-object p1, p0, LM0/u;->b:LM0/t;

    .line 2
    .line 3
    iget-boolean p1, p1, LM0/t;->a:Z

    .line 4
    .line 5
    return p1
.end method

.method public final b(LM0/j;)[LK0/c;
    .locals 0

    .line 1
    iget-object p1, p0, LM0/u;->b:LM0/t;

    .line 2
    .line 3
    iget-object p1, p1, LM0/t;->b:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p1, [LK0/c;

    .line 6
    .line 7
    return-object p1
.end method

.method public final c(Lcom/google/android/gms/common/api/Status;)V
    .locals 1

    .line 1
    iget-object v0, p0, LM0/u;->d:LK0/h;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/google/android/gms/common/api/Status;->g:Landroid/app/PendingIntent;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v0, LL0/f;

    .line 11
    .line 12
    invoke-direct {v0, p1}, LJ0/o;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    new-instance v0, LJ0/o;

    .line 17
    .line 18
    invoke-direct {v0, p1}, LJ0/o;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 19
    .line 20
    .line 21
    :goto_0
    iget-object p1, p0, LM0/u;->c:Li1/i;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Li1/i;->c(Ljava/lang/Exception;)Z

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final d(Ljava/lang/Exception;)V
    .locals 1

    .line 1
    iget-object v0, p0, LM0/u;->c:Li1/i;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Li1/i;->c(Ljava/lang/Exception;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final e(LM0/j;)V
    .locals 2

    .line 1
    iget-object v0, p0, LM0/u;->c:Li1/i;

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, LM0/u;->b:LM0/t;

    .line 4
    .line 5
    iget-object p1, p1, LM0/j;->d:LL0/a;

    .line 6
    .line 7
    invoke-virtual {v1, p1, v0}, LM0/t;->a(LL0/a;Li1/i;)V
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p1

    .line 12
    goto :goto_0

    .line 13
    :catch_1
    move-exception p1

    .line 14
    goto :goto_1

    .line 15
    :catch_2
    move-exception p1

    .line 16
    goto :goto_2

    .line 17
    :goto_0
    invoke-virtual {v0, p1}, Li1/i;->c(Ljava/lang/Exception;)Z

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :goto_1
    invoke-static {p1}, LM0/o;->g(Landroid/os/RemoteException;)Lcom/google/android/gms/common/api/Status;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, LM0/u;->c(Lcom/google/android/gms/common/api/Status;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :goto_2
    throw p1
.end method

.method public final f(LM0/f;Z)V
    .locals 4

    .line 1
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object v0, p1, LM0/f;->b:Ljava/util/Map;

    .line 6
    .line 7
    iget-object v1, p0, LM0/u;->c:Li1/i;

    .line 8
    .line 9
    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    iget-object p2, v1, Li1/i;->a:Li1/p;

    .line 13
    .line 14
    new-instance v0, LA/c;

    .line 15
    .line 16
    const/16 v2, 0x8

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    invoke-direct {v0, p1, v1, v2, v3}, LA/c;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p2, v0}, Li1/p;->f(Li1/c;)Li1/p;

    .line 23
    .line 24
    .line 25
    return-void
.end method
