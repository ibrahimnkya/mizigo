.class public final LT2/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;I)V
    .locals 0

    .line 1
    iput p2, p0, LT2/e;->a:I

    iput-object p1, p0, LT2/e;->b:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 1

    .line 1
    iget p2, p0, LT2/e;->a:I

    .line 2
    .line 3
    iget-object v0, p0, LT2/e;->b:Landroid/view/View;

    .line 4
    .line 5
    packed-switch p2, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast v0, LZ2/j;

    .line 9
    .line 10
    iget-object p1, v0, LZ2/j;->g:Lio/flutter/embedding/engine/renderer/j;

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    iget-boolean p2, v0, LZ2/j;->f:Z

    .line 15
    .line 16
    if-nez p2, :cond_1

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p1, p1, Lio/flutter/embedding/engine/renderer/j;->a:Lio/flutter/embedding/engine/FlutterJNI;

    .line 21
    .line 22
    invoke-virtual {p1, p3, p4}, Lio/flutter/embedding/engine/FlutterJNI;->onSurfaceChanged(II)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 27
    .line 28
    const-string p2, "changeSurfaceSize() should only be called when flutterRenderer is non-null."

    .line 29
    .line 30
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    throw p1

    .line 34
    :cond_1
    :goto_0
    return-void

    .line 35
    :pswitch_0
    if-nez p1, :cond_2

    .line 36
    .line 37
    sget p1, LT2/g;->E:I

    .line 38
    .line 39
    const-string p1, "g"

    .line 40
    .line 41
    const-string p2, "*** WARNING *** surfaceChanged() gave us a null surface!"

    .line 42
    .line 43
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    check-cast v0, Lcom/journeyapps/barcodescanner/BarcodeView;

    .line 48
    .line 49
    new-instance p1, LT2/u;

    .line 50
    .line 51
    invoke-direct {p1, p3, p4}, LT2/u;-><init>(II)V

    .line 52
    .line 53
    .line 54
    iput-object p1, v0, LT2/g;->t:LT2/u;

    .line 55
    .line 56
    invoke-virtual {v0}, LT2/g;->g()V

    .line 57
    .line 58
    .line 59
    :goto_1
    return-void

    .line 60
    nop

    .line 61
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 1
    iget p1, p0, LT2/e;->a:I

    .line 2
    .line 3
    packed-switch p1, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, LT2/e;->b:Landroid/view/View;

    .line 7
    .line 8
    check-cast p1, LZ2/j;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p1, LZ2/j;->e:Z

    .line 12
    .line 13
    iget-object v0, p1, LZ2/j;->g:Lio/flutter/embedding/engine/renderer/j;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-boolean v0, p1, LZ2/j;->f:Z

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, LZ2/j;->e()V

    .line 22
    .line 23
    .line 24
    :cond_0
    :pswitch_0
    return-void

    .line 25
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 1
    iget p1, p0, LT2/e;->a:I

    .line 2
    .line 3
    packed-switch p1, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, LT2/e;->b:Landroid/view/View;

    .line 7
    .line 8
    check-cast p1, LZ2/j;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p1, LZ2/j;->e:Z

    .line 12
    .line 13
    iget-object v0, p1, LZ2/j;->g:Lio/flutter/embedding/engine/renderer/j;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-boolean p1, p1, LZ2/j;->f:Z

    .line 18
    .line 19
    if-nez p1, :cond_1

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0}, Lio/flutter/embedding/engine/renderer/j;->j()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 28
    .line 29
    const-string v0, "disconnectSurfaceFromRenderer() should only be called when flutterRenderer is non-null."

    .line 30
    .line 31
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    throw p1

    .line 35
    :cond_1
    :goto_0
    return-void

    .line 36
    :pswitch_0
    iget-object p1, p0, LT2/e;->b:Landroid/view/View;

    .line 37
    .line 38
    check-cast p1, Lcom/journeyapps/barcodescanner/BarcodeView;

    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    iput-object v0, p1, LT2/g;->t:LT2/u;

    .line 42
    .line 43
    return-void

    .line 44
    nop

    .line 45
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
