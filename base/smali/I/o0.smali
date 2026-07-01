.class public final LI/o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LA3/g;


# instance fields
.field public final e:LI/o0;

.field public final f:LI/O;


# direct methods
.method public constructor <init>(LI/o0;LI/O;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LI/o0;->e:LI/o0;

    .line 5
    .line 6
    iput-object p2, p0, LI/o0;->f:LI/O;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final d(LI/O;)V
    .locals 1

    .line 1
    iget-object v0, p0, LI/o0;->f:LI/O;

    .line 2
    .line 3
    if-eq v0, p1, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, LI/o0;->e:LI/o0;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, p1}, LI/o0;->d(LI/O;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 14
    .line 15
    const-string v0, "Calling updateData inside updateData on the same DataStore instance is not supported\nsince updates made in the parent updateData call will not be visible to the nested\nupdateData call. See https://issuetracker.google.com/issues/241760537 for details."

    .line 16
    .line 17
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    throw p1
.end method

.method public final getKey()LA3/h;
    .locals 1

    .line 1
    sget-object v0, LI/n0;->e:LI/n0;

    .line 2
    .line 3
    return-object v0
.end method

.method public final h(LA3/i;)LA3/i;
    .locals 2

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, LA3/j;->e:LA3/j;

    .line 7
    .line 8
    if-ne p1, v0, :cond_0

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    new-instance v0, LA3/b;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-direct {v0, v1}, LA3/b;-><init>(I)V

    .line 15
    .line 16
    .line 17
    invoke-interface {p1, p0, v0}, LA3/i;->i(Ljava/lang/Object;LH3/p;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, LA3/i;

    .line 22
    .line 23
    return-object p1
.end method

.method public final i(Ljava/lang/Object;LH3/p;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-interface {p2, p1, p0}, LH3/p;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    return-object p1
.end method

.method public final m(LA3/h;)LA3/g;
    .locals 0

    .line 1
    invoke-static {p0, p1}, LT0/a;->p(LA3/g;LA3/h;)LA3/g;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    return-object p1
.end method

.method public final r(LA3/h;)LA3/i;
    .locals 0

    .line 1
    invoke-static {p0, p1}, LT0/a;->D(LA3/g;LA3/h;)LA3/i;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    return-object p1
.end method
