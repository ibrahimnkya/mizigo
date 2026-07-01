.class public final LT2/t;
.super Landroid/view/OrientationEventListener;
.source "SourceFile"


# instance fields
.field public final synthetic a:LJ0/p;


# direct methods
.method public constructor <init>(LJ0/p;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, LT2/t;->a:LJ0/p;

    .line 2
    .line 3
    const/4 p1, 0x3

    .line 4
    invoke-direct {p0, p2, p1}, Landroid/view/OrientationEventListener;-><init>(Landroid/content/Context;I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final onOrientationChanged(I)V
    .locals 3

    .line 1
    iget-object p1, p0, LT2/t;->a:LJ0/p;

    .line 2
    .line 3
    iget-object v0, p1, LJ0/p;->c:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Landroid/view/WindowManager;

    .line 6
    .line 7
    iget-object v1, p1, LJ0/p;->e:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v1, LE/i;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget v2, p1, LJ0/p;->b:I

    .line 24
    .line 25
    if-eq v0, v2, :cond_0

    .line 26
    .line 27
    iput v0, p1, LJ0/p;->b:I

    .line 28
    .line 29
    iget-object p1, v1, LE/i;->f:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast p1, Lcom/journeyapps/barcodescanner/BarcodeView;

    .line 32
    .line 33
    iget-object p1, p1, LT2/g;->g:Landroid/os/Handler;

    .line 34
    .line 35
    new-instance v0, LD1/o;

    .line 36
    .line 37
    const/4 v2, 0x4

    .line 38
    invoke-direct {v0, v2, v1}, LD1/o;-><init>(ILjava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    const-wide/16 v1, 0xfa

    .line 42
    .line 43
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method
