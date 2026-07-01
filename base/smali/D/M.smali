.class public LD/M;
.super LD/L;
.source "SourceFile"


# instance fields
.field public o:Lw/b;

.field public p:Lw/b;

.field public q:Lw/b;


# direct methods
.method public constructor <init>(LD/W;Landroid/view/WindowInsets;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, LD/L;-><init>(LD/W;Landroid/view/WindowInsets;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, LD/M;->o:Lw/b;

    .line 6
    .line 7
    iput-object p1, p0, LD/M;->p:Lw/b;

    .line 8
    .line 9
    iput-object p1, p0, LD/M;->q:Lw/b;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public f()Lw/b;
    .locals 1

    .line 1
    iget-object v0, p0, LD/M;->p:Lw/b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, LD/J;->c:Landroid/view/WindowInsets;

    .line 6
    .line 7
    invoke-static {v0}, LD/D;->t(Landroid/view/WindowInsets;)Landroid/graphics/Insets;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lw/b;->b(Landroid/graphics/Insets;)Lw/b;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, LD/M;->p:Lw/b;

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, LD/M;->p:Lw/b;

    .line 18
    .line 19
    return-object v0
.end method

.method public h()Lw/b;
    .locals 1

    .line 1
    iget-object v0, p0, LD/M;->o:Lw/b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, LD/J;->c:Landroid/view/WindowInsets;

    .line 6
    .line 7
    invoke-static {v0}, LD/D;->A(Landroid/view/WindowInsets;)Landroid/graphics/Insets;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lw/b;->b(Landroid/graphics/Insets;)Lw/b;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, LD/M;->o:Lw/b;

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, LD/M;->o:Lw/b;

    .line 18
    .line 19
    return-object v0
.end method

.method public j()Lw/b;
    .locals 1

    .line 1
    iget-object v0, p0, LD/M;->q:Lw/b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, LD/J;->c:Landroid/view/WindowInsets;

    .line 6
    .line 7
    invoke-static {v0}, LD/D;->c(Landroid/view/WindowInsets;)Landroid/graphics/Insets;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lw/b;->b(Landroid/graphics/Insets;)Lw/b;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, LD/M;->q:Lw/b;

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, LD/M;->q:Lw/b;

    .line 18
    .line 19
    return-object v0
.end method

.method public k(IIII)LD/W;
    .locals 1

    .line 1
    iget-object v0, p0, LD/J;->c:Landroid/view/WindowInsets;

    .line 2
    .line 3
    invoke-static {v0, p1, p2, p3, p4}, LD/D;->i(Landroid/view/WindowInsets;IIII)Landroid/view/WindowInsets;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 p2, 0x0

    .line 8
    invoke-static {p2, p1}, LD/W;->c(Landroid/view/View;Landroid/view/WindowInsets;)LD/W;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    return-object p1
.end method

.method public q(Lw/b;)V
    .locals 0

    .line 1
    return-void
.end method
