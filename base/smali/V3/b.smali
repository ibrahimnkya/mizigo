.class public final LV3/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LN3/e;
.implements LN3/l0;


# instance fields
.field public final e:LN3/g;

.field public final synthetic f:LV3/c;


# direct methods
.method public constructor <init>(LV3/c;LN3/g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LV3/b;->f:LV3/c;

    .line 5
    .line 6
    iput-object p2, p0, LV3/b;->e:LN3/g;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(LS3/s;I)V
    .locals 1

    .line 1
    iget-object v0, p0, LV3/b;->e:LN3/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, LN3/g;->a(LS3/s;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final e()LA3/i;
    .locals 1

    .line 1
    iget-object v0, p0, LV3/b;->e:LN3/g;

    .line 2
    .line 3
    iget-object v0, v0, LN3/g;->i:LA3/i;

    .line 4
    .line 5
    return-object v0
.end method

.method public final g(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, LV3/b;->e:LN3/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, LN3/g;->g(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final k(Ljava/lang/Object;LH3/q;)LE/i;
    .locals 2

    .line 1
    check-cast p1, Ly3/h;

    .line 2
    .line 3
    new-instance p2, LN3/f;

    .line 4
    .line 5
    iget-object v0, p0, LV3/b;->f:LV3/c;

    .line 6
    .line 7
    invoke-direct {p2, v0, p0}, LN3/f;-><init>(LV3/c;LV3/b;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, LV3/b;->e:LN3/g;

    .line 11
    .line 12
    invoke-virtual {v1, p1, p2}, LN3/g;->k(Ljava/lang/Object;LH3/q;)LE/i;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    sget-object p2, LV3/c;->g:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {p2, v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-object p1
.end method

.method public final q(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, LV3/b;->e:LN3/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, LN3/g;->q(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
