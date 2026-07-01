.class public final LM0/l;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:LL0/a;

.field public final b:LM0/a;

.field public final c:LN0/d;

.field public final d:Ljava/util/Set;

.field public e:Z

.field public final synthetic f:LM0/d;


# direct methods
.method public constructor <init>(LM0/d;LL0/a;LM0/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LM0/l;->f:LM0/d;

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-object p1, p0, LM0/l;->c:LN0/d;

    .line 8
    .line 9
    iput-object p1, p0, LM0/l;->d:Ljava/util/Set;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, LM0/l;->e:Z

    .line 13
    .line 14
    iput-object p2, p0, LM0/l;->a:LL0/a;

    .line 15
    .line 16
    iput-object p3, p0, LM0/l;->b:LM0/a;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final a(LK0/a;)V
    .locals 4

    .line 1
    iget-object v0, p0, LM0/l;->f:LM0/d;

    .line 2
    .line 3
    iget-object v0, v0, LM0/d;->m:LW0/e;

    .line 4
    .line 5
    new-instance v1, LA/a;

    .line 6
    .line 7
    const/4 v2, 0x5

    .line 8
    const/4 v3, 0x0

    .line 9
    invoke-direct {v1, p0, p1, v2, v3}, LA/a;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final b(LK0/a;)V
    .locals 6

    .line 1
    iget-object v0, p0, LM0/l;->f:LM0/d;

    .line 2
    .line 3
    iget-object v0, v0, LM0/d;->j:Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    iget-object v1, p0, LM0/l;->b:LM0/a;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, LM0/j;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v1, v0, LM0/j;->m:LM0/d;

    .line 16
    .line 17
    iget-object v1, v1, LM0/d;->m:LW0/e;

    .line 18
    .line 19
    invoke-static {v1}, LN0/n;->b(Landroid/os/Handler;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, v0, LM0/j;->d:LL0/a;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    new-instance v4, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    const-string v5, "onSignInFailed for "

    .line 39
    .line 40
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v2, " with "

    .line 47
    .line 48
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-interface {v1, v2}, LL0/a;->e(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    const/4 v1, 0x0

    .line 62
    invoke-virtual {v0, p1, v1}, LM0/j;->o(LK0/a;Ljava/lang/RuntimeException;)V

    .line 63
    .line 64
    .line 65
    :cond_0
    return-void
.end method
