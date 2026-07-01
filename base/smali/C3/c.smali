.class public abstract LC3/c;
.super LC3/a;
.source "SourceFile"


# instance fields
.field public final f:LA3/i;

.field public transient g:LA3/d;


# direct methods
.method public constructor <init>(LA3/d;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 3
    invoke-interface {p1}, LA3/d;->e()LA3/i;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-direct {p0, p1, v0}, LC3/c;-><init>(LA3/d;LA3/i;)V

    return-void
.end method

.method public constructor <init>(LA3/d;LA3/i;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LC3/a;-><init>(LA3/d;)V

    .line 2
    iput-object p2, p0, LC3/c;->f:LA3/i;

    return-void
.end method


# virtual methods
.method public e()LA3/i;
    .locals 1

    .line 1
    iget-object v0, p0, LC3/c;->f:LA3/i;

    .line 2
    .line 3
    invoke-static {v0}, LI3/h;->b(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public n()V
    .locals 4

    .line 1
    iget-object v0, p0, LC3/c;->g:LA3/d;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    if-eq v0, p0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, LC3/c;->e()LA3/i;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sget-object v2, LA3/e;->e:LA3/e;

    .line 12
    .line 13
    invoke-interface {v1, v2}, LA3/i;->m(LA3/h;)LA3/g;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v1}, LI3/h;->b(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    check-cast v1, LA3/f;

    .line 21
    .line 22
    check-cast v0, LS3/g;

    .line 23
    .line 24
    sget-object v1, LS3/g;->l:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 25
    .line 26
    :cond_0
    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    sget-object v3, LS3/b;->c:LE/i;

    .line 31
    .line 32
    if-eq v2, v3, :cond_0

    .line 33
    .line 34
    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    instance-of v1, v0, LN3/g;

    .line 39
    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    check-cast v0, LN3/g;

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const/4 v0, 0x0

    .line 46
    :goto_0
    if-eqz v0, :cond_2

    .line 47
    .line 48
    invoke-virtual {v0}, LN3/g;->p()V

    .line 49
    .line 50
    .line 51
    :cond_2
    sget-object v0, LC3/b;->e:LC3/b;

    .line 52
    .line 53
    iput-object v0, p0, LC3/c;->g:LA3/d;

    .line 54
    .line 55
    return-void
.end method
