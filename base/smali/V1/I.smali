.class public final LV1/I;
.super Landroid/os/Binder;
.source "SourceFile"


# instance fields
.field public final c:LA0/c;


# direct methods
.method public constructor <init>(LA0/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LV1/I;->c:LA0/c;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(LV1/J;)V
    .locals 6

    .line 1
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

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
    if-ne v0, v1, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x3

    .line 12
    const-string v1, "FirebaseMessaging"

    .line 13
    .line 14
    invoke-static {v1, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    const-string v0, "service received new intent via bind strategy"

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v0, p1, LV1/J;->a:Landroid/content/Intent;

    .line 26
    .line 27
    iget-object v1, p0, LV1/I;->c:LA0/c;

    .line 28
    .line 29
    iget-object v1, v1, LA0/c;->f:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast v1, LV1/g;

    .line 32
    .line 33
    new-instance v2, Li1/i;

    .line 34
    .line 35
    invoke-direct {v2}, Li1/i;-><init>()V

    .line 36
    .line 37
    .line 38
    iget-object v3, v1, LV1/g;->e:Ljava/util/concurrent/ExecutorService;

    .line 39
    .line 40
    new-instance v4, LD0/a;

    .line 41
    .line 42
    const/4 v5, 0x2

    .line 43
    invoke-direct {v4, v1, v0, v2, v5}, LD0/a;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 44
    .line 45
    .line 46
    invoke-interface {v3, v4}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 47
    .line 48
    .line 49
    new-instance v0, LV/c;

    .line 50
    .line 51
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 52
    .line 53
    .line 54
    new-instance v1, LD1/a;

    .line 55
    .line 56
    const/4 v3, 0x6

    .line 57
    invoke-direct {v1, v3, p1}, LD1/a;-><init>(ILjava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    iget-object p1, v2, Li1/i;->a:Li1/p;

    .line 61
    .line 62
    invoke-virtual {p1, v0, v1}, Li1/p;->g(Ljava/util/concurrent/Executor;Li1/c;)Li1/p;

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    new-instance p1, Ljava/lang/SecurityException;

    .line 67
    .line 68
    const-string v0, "Binding only allowed within app"

    .line 69
    .line 70
    invoke-direct {p1, v0}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    throw p1
.end method
