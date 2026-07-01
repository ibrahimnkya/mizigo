.class public final synthetic Lio/flutter/embedding/engine/renderer/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# instance fields
.field public final synthetic a:Lio/flutter/embedding/engine/renderer/g;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/embedding/engine/renderer/g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/embedding/engine/renderer/f;->a:Lio/flutter/embedding/engine/renderer/g;

    return-void
.end method


# virtual methods
.method public final onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lio/flutter/embedding/engine/renderer/f;->a:Lio/flutter/embedding/engine/renderer/g;

    .line 2
    .line 3
    iget-object v0, p1, Lio/flutter/embedding/engine/renderer/g;->e:Lio/flutter/embedding/engine/renderer/j;

    .line 4
    .line 5
    iget-object v0, v0, Lio/flutter/embedding/engine/renderer/j;->a:Lio/flutter/embedding/engine/FlutterJNI;

    .line 6
    .line 7
    iget-boolean v1, p1, Lio/flutter/embedding/engine/renderer/g;->c:Z

    .line 8
    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0}, Lio/flutter/embedding/engine/FlutterJNI;->isAttached()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p1, p1, Lio/flutter/embedding/engine/renderer/g;->b:Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;

    .line 19
    .line 20
    invoke-virtual {p1}, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;->markDirty()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Lio/flutter/embedding/engine/FlutterJNI;->scheduleFrame()V

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_0
    return-void
.end method
