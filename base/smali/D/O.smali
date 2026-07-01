.class public LD/O;
.super LD/M;
.source "SourceFile"


# static fields
.field public static final r:LD/W;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, LD/N;->f()Landroid/view/WindowInsets;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v1, v0}, LD/W;->c(Landroid/view/View;Landroid/view/WindowInsets;)LD/W;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, LD/O;->r:LD/W;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(LD/W;Landroid/view/WindowInsets;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, LD/M;-><init>(LD/W;Landroid/view/WindowInsets;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public n(I)Z
    .locals 1

    .line 1
    iget-object v0, p0, LD/J;->c:Landroid/view/WindowInsets;

    .line 2
    .line 3
    invoke-static {p1}, LD/T;->a(I)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-static {v0, p1}, LD/N;->q(Landroid/view/WindowInsets;I)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    return p1
.end method
