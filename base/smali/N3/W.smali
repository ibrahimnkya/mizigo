.class public final LN3/W;
.super LN3/U;
.source "SourceFile"


# instance fields
.field public final e:LN3/Y;

.field public final f:LN3/X;

.field public final g:LN3/k;

.field public final h:Ljava/lang/Object;


# direct methods
.method public constructor <init>(LN3/Y;LN3/X;LN3/k;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LS3/k;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LN3/W;->e:LN3/Y;

    .line 5
    .line 6
    iput-object p2, p0, LN3/W;->f:LN3/X;

    .line 7
    .line 8
    iput-object p3, p0, LN3/W;->g:LN3/k;

    .line 9
    .line 10
    iput-object p4, p0, LN3/W;->h:Ljava/lang/Object;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final k()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return v0
.end method

.method public final l(Ljava/lang/Throwable;)V
    .locals 6

    .line 1
    iget-object p1, p0, LN3/W;->g:LN3/k;

    .line 2
    .line 3
    invoke-static {p1}, LN3/Y;->M(LS3/k;)LN3/k;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, LN3/W;->e:LN3/Y;

    .line 8
    .line 9
    iget-object v2, p0, LN3/W;->f:LN3/X;

    .line 10
    .line 11
    iget-object v3, p0, LN3/W;->h:Ljava/lang/Object;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1, v2, v0, v3}, LN3/Y;->V(LN3/X;LN3/k;Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v0, v2, LN3/X;->a:LN3/Z;

    .line 23
    .line 24
    new-instance v4, LS3/i;

    .line 25
    .line 26
    const/4 v5, 0x2

    .line 27
    invoke-direct {v4, v5}, LS3/i;-><init>(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v4, v5}, LS3/k;->e(LS3/k;I)Z

    .line 31
    .line 32
    .line 33
    invoke-static {p1}, LN3/Y;->M(LS3/k;)LN3/k;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    invoke-virtual {v1, v2, p1, v3}, LN3/Y;->V(LN3/X;LN3/k;Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    :goto_0
    return-void

    .line 46
    :cond_1
    invoke-virtual {v1, v2, v3}, LN3/Y;->B(LN3/X;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {v1, p1}, LN3/Y;->s(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method
