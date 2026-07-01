.class public final LF1/b;
.super LC3/g;
.source "SourceFile"

# interfaces
.implements LH3/p;


# instance fields
.field public synthetic i:Ljava/lang/Object;

.field public final synthetic j:LH3/l;


# direct methods
.method public constructor <init>(LH3/l;LA3/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, LF1/b;->j:LH3/l;

    .line 2
    .line 3
    const/4 p1, 0x2

    .line 4
    invoke-direct {p0, p1, p2}, LC3/g;-><init>(ILA3/d;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, LM/b;

    .line 2
    .line 3
    check-cast p2, LA3/d;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, LF1/b;->j(LA3/d;Ljava/lang/Object;)LA3/d;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, LF1/b;

    .line 10
    .line 11
    sget-object p2, Ly3/h;->a:Ly3/h;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, LF1/b;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    return-object p2
.end method

.method public final j(LA3/d;Ljava/lang/Object;)LA3/d;
    .locals 2

    .line 1
    new-instance v0, LF1/b;

    .line 2
    .line 3
    iget-object v1, p0, LF1/b;->j:LH3/l;

    .line 4
    .line 5
    invoke-direct {v0, v1, p1}, LF1/b;-><init>(LH3/l;LA3/d;)V

    .line 6
    .line 7
    .line 8
    iput-object p2, v0, LF1/b;->i:Ljava/lang/Object;

    .line 9
    .line 10
    return-object v0
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, LF1/b;->i:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast p1, LM/b;

    .line 7
    .line 8
    iget-object v0, p0, LF1/b;->j:LH3/l;

    .line 9
    .line 10
    invoke-interface {v0, p1}, LH3/l;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    sget-object p1, Ly3/h;->a:Ly3/h;

    .line 14
    .line 15
    return-object p1
.end method
