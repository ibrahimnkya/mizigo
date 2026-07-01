.class public final LT2/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;I)V
    .locals 0

    .line 1
    iput p2, p0, LT2/d;->a:I

    iput-object p1, p0, LT2/d;->b:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 1
    return-void
.end method

.method private final b(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 1

    .line 1
    iget v0, p0, LT2/d;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, LT2/d;->b:Landroid/view/View;

    .line 7
    .line 8
    check-cast p1, LZ2/k;

    .line 9
    .line 10
    const/4 p2, 0x1

    .line 11
    iput-boolean p2, p1, LZ2/k;->e:Z

    .line 12
    .line 13
    iget-object p2, p1, LZ2/k;->g:Lio/flutter/embedding/engine/renderer/j;

    .line 14
    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    iget-boolean p2, p1, LZ2/k;->f:Z

    .line 18
    .line 19
    if-nez p2, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, LZ2/k;->e()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void

    .line 25
    :pswitch_0
    invoke-virtual {p0, p1, p2, p3}, LT2/d;->onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 3

    .line 1
    iget p1, p0, LT2/d;->a:I

    .line 2
    .line 3
    packed-switch p1, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, LT2/d;->b:Landroid/view/View;

    .line 7
    .line 8
    check-cast p1, LZ2/k;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p1, LZ2/k;->e:Z

    .line 12
    .line 13
    iget-object v0, p1, LZ2/k;->g:Lio/flutter/embedding/engine/renderer/j;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-boolean v2, p1, LZ2/k;->f:Z

    .line 19
    .line 20
    if-nez v2, :cond_1

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0}, Lio/flutter/embedding/engine/renderer/j;->j()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p1, LZ2/k;->h:Landroid/view/Surface;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 32
    .line 33
    .line 34
    iput-object v1, p1, LZ2/k;->h:Landroid/view/Surface;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 38
    .line 39
    const-string v0, "disconnectSurfaceFromRenderer() should only be called when flutterRenderer is non-null."

    .line 40
    .line 41
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    throw p1

    .line 45
    :cond_1
    :goto_0
    iget-object v0, p1, LZ2/k;->h:Landroid/view/Surface;

    .line 46
    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 50
    .line 51
    .line 52
    iput-object v1, p1, LZ2/k;->h:Landroid/view/Surface;

    .line 53
    .line 54
    :cond_2
    const/4 p1, 0x1

    .line 55
    return p1

    .line 56
    :pswitch_0
    const/4 p1, 0x0

    .line 57
    return p1

    .line 58
    nop

    .line 59
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 1

    .line 1
    iget p1, p0, LT2/d;->a:I

    .line 2
    .line 3
    packed-switch p1, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, LT2/d;->b:Landroid/view/View;

    .line 7
    .line 8
    check-cast p1, LZ2/k;

    .line 9
    .line 10
    iget-object v0, p1, LZ2/k;->g:Lio/flutter/embedding/engine/renderer/j;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-boolean p1, p1, LZ2/k;->f:Z

    .line 15
    .line 16
    if-nez p1, :cond_1

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object p1, v0, Lio/flutter/embedding/engine/renderer/j;->a:Lio/flutter/embedding/engine/FlutterJNI;

    .line 21
    .line 22
    invoke-virtual {p1, p2, p3}, Lio/flutter/embedding/engine/FlutterJNI;->onSurfaceChanged(II)V

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
    iget-object p1, p0, LT2/d;->b:Landroid/view/View;

    .line 36
    .line 37
    check-cast p1, LT2/g;

    .line 38
    .line 39
    new-instance v0, LT2/u;

    .line 40
    .line 41
    invoke-direct {v0, p2, p3}, LT2/u;-><init>(II)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p1, LT2/g;->t:LT2/u;

    .line 45
    .line 46
    invoke-virtual {p1}, LT2/g;->g()V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    nop

    .line 51
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 1
    iget p1, p0, LT2/d;->a:I

    return-void
.end method
