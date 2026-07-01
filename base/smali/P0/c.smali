.class public final LP0/c;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final i:LA/c;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ljava/lang/String;

.field public final c:LA/c;

.field public final d:LN0/i;

.field public final e:LM0/a;

.field public final f:I

.field public final g:LK0/h;

.field public final h:LM0/d;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, LN1/e;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-direct {v0, v1}, LN1/e;-><init>(I)V

    .line 5
    .line 6
    .line 7
    new-instance v1, LP0/b;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v2, LA/c;

    .line 13
    .line 14
    invoke-direct {v2, v1, v0}, LA/c;-><init>(LP0/b;LN1/e;)V

    .line 15
    .line 16
    .line 17
    sput-object v2, LP0/c;->i:LA/c;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;LA/c;LL0/b;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "Null context is not permitted."

    .line 5
    .line 6
    invoke-static {p1, v0}, LN0/n;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const-string v0, "Api must not be null."

    .line 10
    .line 11
    invoke-static {p2, v0}, LN0/n;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string v0, "Settings must not be null; use Settings.DEFAULT_SETTINGS instead."

    .line 15
    .line 16
    invoke-static {p3, v0}, LN0/n;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "The provided context did not have an application context."

    .line 24
    .line 25
    invoke-static {v0, v1}, LN0/n;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, LP0/c;->a:Landroid/content/Context;

    .line 29
    .line 30
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 31
    .line 32
    const/16 v2, 0x1e

    .line 33
    .line 34
    if-lt v1, v2, :cond_0

    .line 35
    .line 36
    invoke-static {p1}, LD/N;->j(Landroid/content/Context;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const/4 p1, 0x0

    .line 42
    :goto_0
    iput-object p1, p0, LP0/c;->b:Ljava/lang/String;

    .line 43
    .line 44
    iput-object p2, p0, LP0/c;->c:LA/c;

    .line 45
    .line 46
    sget-object v1, LN0/i;->a:LN0/i;

    .line 47
    .line 48
    iput-object v1, p0, LP0/c;->d:LN0/i;

    .line 49
    .line 50
    new-instance v1, LM0/a;

    .line 51
    .line 52
    invoke-direct {v1, p2, p1}, LM0/a;-><init>(LA/c;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iput-object v1, p0, LP0/c;->e:LM0/a;

    .line 56
    .line 57
    new-instance p1, LM0/m;

    .line 58
    .line 59
    invoke-static {v0}, LM0/d;->d(Landroid/content/Context;)LM0/d;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iput-object p1, p0, LP0/c;->h:LM0/d;

    .line 64
    .line 65
    iget-object p2, p1, LM0/d;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 66
    .line 67
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    iput p2, p0, LP0/c;->f:I

    .line 72
    .line 73
    iget-object p2, p3, LL0/b;->a:LK0/h;

    .line 74
    .line 75
    iput-object p2, p0, LP0/c;->g:LK0/h;

    .line 76
    .line 77
    iget-object p1, p1, LM0/d;->m:LW0/e;

    .line 78
    .line 79
    const/4 p2, 0x7

    .line 80
    invoke-virtual {p1, p2, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    invoke-virtual {p1, p2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 85
    .line 86
    .line 87
    return-void
.end method


# virtual methods
.method public final a(LN0/h;)Li1/p;
    .locals 4

    .line 1
    new-instance v0, LA0/c;

    .line 2
    .line 3
    const/16 v1, 0x9

    .line 4
    .line 5
    invoke-direct {v0, v1}, LA0/c;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sget-object v1, LW0/c;->a:LK0/c;

    .line 9
    .line 10
    filled-new-array {v1}, [LK0/c;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    new-instance v2, LA0/c;

    .line 15
    .line 16
    const/16 v3, 0xe

    .line 17
    .line 18
    invoke-direct {v2, v3, p1}, LA0/c;-><init>(ILjava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    iput-object v2, v0, LA0/c;->f:Ljava/lang/Object;

    .line 22
    .line 23
    new-instance p1, LM0/t;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-direct {p1, v0, v1, v2}, LM0/t;-><init>(LA0/c;[LK0/c;Z)V

    .line 27
    .line 28
    .line 29
    new-instance v0, Li1/i;

    .line 30
    .line 31
    invoke-direct {v0}, Li1/i;-><init>()V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, LP0/c;->h:LM0/d;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    new-instance v2, LM0/u;

    .line 40
    .line 41
    iget-object v3, p0, LP0/c;->g:LK0/h;

    .line 42
    .line 43
    invoke-direct {v2, p1, v0, v3}, LM0/u;-><init>(LM0/t;Li1/i;LK0/h;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, v1, LM0/d;->i:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 47
    .line 48
    new-instance v3, LM0/q;

    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    invoke-direct {v3, v2, p1, p0}, LM0/q;-><init>(LM0/u;ILP0/c;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, v1, LM0/d;->m:LW0/e;

    .line 58
    .line 59
    const/4 v1, 0x4

    .line 60
    invoke-virtual {p1, v1, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {p1, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 65
    .line 66
    .line 67
    iget-object p1, v0, Li1/i;->a:Li1/p;

    .line 68
    .line 69
    return-object p1
.end method
