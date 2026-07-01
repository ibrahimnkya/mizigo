.class public final LI/K;
.super LI3/i;
.source "SourceFile"

# interfaces
.implements LH3/l;


# instance fields
.field public final synthetic f:LI/O;


# direct methods
.method public constructor <init>(LI/O;)V
    .locals 0

    .line 1
    iput-object p1, p0, LI/K;->f:LI/O;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-direct {p0, p1}, LI3/i;-><init>(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final i(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    check-cast p1, Ljava/lang/Throwable;

    .line 2
    .line 3
    iget-object v0, p0, LI/K;->f:LI/O;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object v1, v0, LI/O;->l:LE/i;

    .line 8
    .line 9
    new-instance v2, LI/a0;

    .line 10
    .line 11
    invoke-direct {v2, p1}, LI/a0;-><init>(Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, v2}, LE/i;->E(LI/k0;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p1, v0, LI/O;->n:Ly3/f;

    .line 18
    .line 19
    iget-object p1, p1, Ly3/f;->f:Ljava/lang/Object;

    .line 20
    .line 21
    sget-object v1, Ly3/g;->a:Ly3/g;

    .line 22
    .line 23
    if-eq p1, v1, :cond_1

    .line 24
    .line 25
    iget-object p1, v0, LI/O;->n:Ly3/f;

    .line 26
    .line 27
    invoke-virtual {p1}, Ly3/f;->a()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, LI/X;

    .line 32
    .line 33
    invoke-virtual {p1}, LI/X;->close()V

    .line 34
    .line 35
    .line 36
    :cond_1
    sget-object p1, Ly3/h;->a:Ly3/h;

    .line 37
    .line 38
    return-object p1
.end method
