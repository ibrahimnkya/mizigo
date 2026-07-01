.class public final Li2/b;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# instance fields
.field public final synthetic a:Li2/c;


# direct methods
.method public constructor <init>(Li2/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Li2/b;->a:Li2/c;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    check-cast p1, [Ljava/lang/Float;

    .line 2
    .line 3
    iget-object v0, p0, Li2/b;->a:Li2/c;

    .line 4
    .line 5
    iget-object v0, v0, Li2/c;->h:Lj2/d;

    .line 6
    .line 7
    iget-object v1, v0, LS/b;->a:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v1, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    :try_start_0
    aget-object p1, p1, v1

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iget-object v1, v0, Lj2/d;->b:Lj2/c;

    .line 26
    .line 27
    invoke-virtual {v1, p1}, Lj2/c;->i(F)Ljava/util/Set;

    .line 28
    .line 29
    .line 30
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    invoke-virtual {v0}, LS/b;->g()V

    .line 32
    .line 33
    .line 34
    return-object p1

    .line 35
    :catchall_0
    move-exception p1

    .line 36
    invoke-virtual {v0}, LS/b;->g()V

    .line 37
    .line 38
    .line 39
    throw p1
.end method

.method public final onPostExecute(Ljava/lang/Object;)V
    .locals 1

    .line 1
    check-cast p1, Ljava/util/Set;

    .line 2
    .line 3
    iget-object v0, p0, Li2/b;->a:Li2/c;

    .line 4
    .line 5
    iget-object v0, v0, Li2/c;->i:Lk2/a;

    .line 6
    .line 7
    invoke-interface {v0, p1}, Lk2/a;->a(Ljava/util/Set;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
