.class public final LU3/d;
.super LN3/J;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Executor;


# static fields
.field public static final g:LU3/d;

.field public static final h:LN3/r;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, LU3/d;

    .line 2
    .line 3
    invoke-direct {v0}, LN3/r;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LU3/d;->g:LU3/d;

    .line 7
    .line 8
    sget-object v0, LU3/l;->g:LU3/l;

    .line 9
    .line 10
    sget v1, LS3/u;->a:I

    .line 11
    .line 12
    const/16 v2, 0x40

    .line 13
    .line 14
    if-ge v2, v1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v1, v2

    .line 18
    :goto_0
    const/16 v2, 0xc

    .line 19
    .line 20
    const-string v3, "kotlinx.coroutines.io.parallelism"

    .line 21
    .line 22
    invoke-static {v1, v2, v3}, LS3/b;->k(IILjava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {v0, v1}, LU3/l;->f(I)LN3/r;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sput-object v0, LU3/d;->h:LN3/r;

    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public final close()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 2
    .line 3
    const-string v1, "Cannot be invoked on Dispatchers.IO"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw v0
.end method

.method public final d(LA3/i;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    sget-object v0, LU3/d;->h:LN3/r;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, LN3/r;->d(LA3/i;Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final execute(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    sget-object v0, LA3/j;->e:LA3/j;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, LU3/d;->d(LA3/i;Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "Dispatchers.IO"

    .line 2
    .line 3
    return-object v0
.end method
