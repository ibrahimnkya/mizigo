.class public LQ2/h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lk3/m;
.implements Lg3/b;


# instance fields
.field public e:Lk3/o;

.field public f:LQ2/d;

.field public g:Landroid/os/HandlerThread;

.field public h:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(LQ2/h;Lk3/l;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p1, p1, Lk3/l;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Ljava/util/Map;

    .line 4
    .line 5
    iget-object p0, p0, LQ2/h;->f:LQ2/d;

    .line 6
    .line 7
    const-string v0, "key"

    .line 8
    .line 9
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Ljava/lang/String;

    .line 14
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, LQ2/d;->a:LQ2/e;

    .line 21
    .line 22
    iget-object p0, p0, LQ2/e;->b:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string p0, "_"

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method


# virtual methods
.method public final onAttachedToEngine(Lg3/a;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lg3/a;->b:Lk3/f;

    .line 2
    .line 3
    iget-object p1, p1, Lg3/a;->a:Landroid/content/Context;

    .line 4
    .line 5
    :try_start_0
    new-instance v1, LQ2/d;

    .line 6
    .line 7
    invoke-direct {v1, p1}, LQ2/d;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v1, p0, LQ2/h;->f:LQ2/d;

    .line 11
    .line 12
    new-instance p1, Landroid/os/HandlerThread;

    .line 13
    .line 14
    const-string v1, "com.it_nomads.fluttersecurestorage.worker"

    .line 15
    .line 16
    invoke-direct {p1, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, LQ2/h;->g:Landroid/os/HandlerThread;

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 22
    .line 23
    .line 24
    new-instance p1, Landroid/os/Handler;

    .line 25
    .line 26
    iget-object v1, p0, LQ2/h;->g:Landroid/os/HandlerThread;

    .line 27
    .line 28
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-direct {p1, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, LQ2/h;->h:Landroid/os/Handler;

    .line 36
    .line 37
    new-instance p1, Lk3/o;

    .line 38
    .line 39
    const-string v1, "plugins.it_nomads.com/flutter_secure_storage"

    .line 40
    .line 41
    invoke-direct {p1, v0, v1}, Lk3/o;-><init>(Lk3/f;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, LQ2/h;->e:Lk3/o;

    .line 45
    .line 46
    invoke-virtual {p1, p0}, Lk3/o;->b(Lk3/m;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :catch_0
    move-exception p1

    .line 51
    const-string v0, "FlutterSecureStoragePlugin"

    .line 52
    .line 53
    const-string v1, "Registration failed"

    .line 54
    .line 55
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final onDetachedFromEngine(Lg3/a;)V
    .locals 1

    .line 1
    iget-object p1, p0, LQ2/h;->e:Lk3/o;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, LQ2/h;->g:Landroid/os/HandlerThread;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, LQ2/h;->g:Landroid/os/HandlerThread;

    .line 12
    .line 13
    iget-object p1, p0, LQ2/h;->e:Lk3/o;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lk3/o;->b(Lk3/m;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, LQ2/h;->e:Lk3/o;

    .line 19
    .line 20
    :cond_0
    iput-object v0, p0, LQ2/h;->f:LQ2/d;

    .line 21
    .line 22
    return-void
.end method

.method public final onMethodCall(Lk3/l;Lk3/n;)V
    .locals 3

    .line 1
    new-instance v0, LQ2/g;

    .line 2
    .line 3
    check-cast p2, LQ2/g;

    .line 4
    .line 5
    invoke-direct {v0, p2}, LQ2/g;-><init>(LQ2/g;)V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, LQ2/h;->h:Landroid/os/Handler;

    .line 9
    .line 10
    new-instance v1, LA/q;

    .line 11
    .line 12
    const/4 v2, 0x2

    .line 13
    invoke-direct {v1, p0, p1, v0, v2}, LA/q;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lk3/n;I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method
