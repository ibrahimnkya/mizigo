.class public final LN1/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LN1/f;
.implements LN1/g;


# instance fields
.field public final a:LD1/r;

.field public final b:Landroid/content/Context;

.field public final c:LP1/a;

.field public final d:Ljava/util/Set;

.field public final e:Ljava/util/concurrent/Executor;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/util/Set;LP1/a;Ljava/util/concurrent/Executor;)V
    .locals 2

    .line 1
    new-instance v0, LD1/r;

    .line 2
    .line 3
    new-instance v1, LA1/c;

    .line 4
    .line 5
    invoke-direct {v1, p1, p2}, LA1/c;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, LD1/r;-><init>(LP1/a;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, LN1/d;->a:LD1/r;

    .line 15
    .line 16
    iput-object p3, p0, LN1/d;->d:Ljava/util/Set;

    .line 17
    .line 18
    iput-object p5, p0, LN1/d;->e:Ljava/util/concurrent/Executor;

    .line 19
    .line 20
    iput-object p4, p0, LN1/d;->c:LP1/a;

    .line 21
    .line 22
    iput-object p1, p0, LN1/d;->b:Landroid/content/Context;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final a()Li1/p;
    .locals 2

    .line 1
    iget-object v0, p0, LN1/d;->b:Landroid/content/Context;

    .line 2
    .line 3
    const-class v1, Landroid/os/UserManager;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/os/UserManager;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/os/UserManager;->isUserUnlocked()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const-string v0, ""

    .line 18
    .line 19
    invoke-static {v0}, LV0/g;->o(Ljava/lang/Object;)Li1/p;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    return-object v0

    .line 24
    :cond_0
    new-instance v0, LN1/c;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-direct {v0, p0, v1}, LN1/c;-><init>(LN1/d;I)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, LN1/d;->e:Ljava/util/concurrent/Executor;

    .line 31
    .line 32
    invoke-static {v1, v0}, LV0/g;->d(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Li1/p;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    return-object v0
.end method

.method public final b()V
    .locals 3

    .line 1
    iget-object v0, p0, LN1/d;->d:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Set;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-gtz v0, :cond_0

    .line 9
    .line 10
    invoke-static {v1}, LV0/g;->o(Ljava/lang/Object;)Li1/p;

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, LN1/d;->b:Landroid/content/Context;

    .line 15
    .line 16
    const-class v2, Landroid/os/UserManager;

    .line 17
    .line 18
    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroid/os/UserManager;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/os/UserManager;->isUserUnlocked()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    invoke-static {v1}, LV0/g;->o(Ljava/lang/Object;)Li1/p;

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    new-instance v0, LN1/c;

    .line 35
    .line 36
    const/4 v1, 0x1

    .line 37
    invoke-direct {v0, p0, v1}, LN1/c;-><init>(LN1/d;I)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, LN1/d;->e:Ljava/util/concurrent/Executor;

    .line 41
    .line 42
    invoke-static {v1, v0}, LV0/g;->d(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Li1/p;

    .line 43
    .line 44
    .line 45
    return-void
.end method
