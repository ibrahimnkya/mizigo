.class public abstract LU3/h;
.super LN3/J;
.source "SourceFile"


# instance fields
.field public g:LU3/c;


# virtual methods
.method public final d(LA3/i;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-object p1, p0, LU3/h;->g:LU3/c;

    .line 2
    .line 3
    sget-object v0, LU3/c;->l:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, p2, v0}, LU3/c;->b(Ljava/lang/Runnable;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
