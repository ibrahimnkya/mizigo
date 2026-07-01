.class public final LN3/a0;
.super LA3/a;
.source "SourceFile"

# interfaces
.implements LN3/P;


# static fields
.field public static final f:LN3/a0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LN3/a0;

    .line 2
    .line 3
    sget-object v1, LN3/s;->f:LN3/s;

    .line 4
    .line 5
    invoke-direct {v0, v1}, LA3/a;-><init>(LA3/h;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, LN3/a0;->f:LN3/a0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Ljava/util/concurrent/CancellationException;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final b()Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    return v0
.end method

.method public final c(ZZLN3/T;)LN3/D;
    .locals 0

    .line 1
    sget-object p1, LN3/b0;->a:LN3/b0;

    .line 2
    .line 3
    return-object p1
.end method

.method public final j(LH3/l;)LN3/D;
    .locals 0

    .line 1
    sget-object p1, LN3/b0;->a:LN3/b0;

    .line 2
    .line 3
    return-object p1
.end method

.method public final l()Ljava/util/concurrent/CancellationException;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 2
    .line 3
    const-string v1, "This job is always active"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw v0
.end method

.method public final o(LN3/Y;)LN3/j;
    .locals 0

    .line 1
    sget-object p1, LN3/b0;->a:LN3/b0;

    .line 2
    .line 3
    return-object p1
.end method

.method public final start()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "NonCancellable"

    .line 2
    .line 3
    return-object v0
.end method
