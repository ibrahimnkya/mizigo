.class public LD/E;
.super LD/I;
.source "SourceFile"


# instance fields
.field public final a:Landroid/view/WindowInsets$Builder;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, LD/I;-><init>()V

    .line 2
    invoke-static {}, LD/D;->f()Landroid/view/WindowInsets$Builder;

    move-result-object v0

    iput-object v0, p0, LD/E;->a:Landroid/view/WindowInsets$Builder;

    return-void
.end method

.method public constructor <init>(LD/W;)V
    .locals 0

    .line 3
    invoke-direct {p0, p1}, LD/I;-><init>(LD/W;)V

    .line 4
    invoke-virtual {p1}, LD/W;->b()Landroid/view/WindowInsets;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 5
    invoke-static {p1}, LD/D;->g(Landroid/view/WindowInsets;)Landroid/view/WindowInsets$Builder;

    move-result-object p1

    goto :goto_0

    .line 6
    :cond_0
    invoke-static {}, LD/D;->f()Landroid/view/WindowInsets$Builder;

    move-result-object p1

    :goto_0
    iput-object p1, p0, LD/E;->a:Landroid/view/WindowInsets$Builder;

    return-void
.end method


# virtual methods
.method public b()LD/W;
    .locals 3

    .line 1
    invoke-virtual {p0}, LD/I;->a()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, LD/E;->a:Landroid/view/WindowInsets$Builder;

    .line 5
    .line 6
    invoke-static {v0}, LD/D;->h(Landroid/view/WindowInsets$Builder;)Landroid/view/WindowInsets;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {v1, v0}, LD/W;->c(Landroid/view/View;Landroid/view/WindowInsets;)LD/W;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v2, v0, LD/W;->a:LD/S;

    .line 16
    .line 17
    invoke-virtual {v2, v1}, LD/S;->o([Lw/b;)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public c(Lw/b;)V
    .locals 1

    .line 1
    iget-object v0, p0, LD/E;->a:Landroid/view/WindowInsets$Builder;

    .line 2
    .line 3
    invoke-virtual {p1}, Lw/b;->c()Landroid/graphics/Insets;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {v0, p1}, LD/D;->z(Landroid/view/WindowInsets$Builder;Landroid/graphics/Insets;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public d(Lw/b;)V
    .locals 1

    .line 1
    iget-object v0, p0, LD/E;->a:Landroid/view/WindowInsets$Builder;

    .line 2
    .line 3
    invoke-virtual {p1}, Lw/b;->c()Landroid/graphics/Insets;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {v0, p1}, LD/D;->r(Landroid/view/WindowInsets$Builder;Landroid/graphics/Insets;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
