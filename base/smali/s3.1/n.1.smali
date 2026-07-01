.class public Ls3/n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lg3/b;
.implements Lh3/a;


# instance fields
.field public e:Landroidx/lifecycle/l;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final onAttachedToActivity(Lh3/b;)V
    .locals 0

    .line 1
    check-cast p1, Lm/J0;

    .line 2
    .line 3
    iget-object p1, p1, Lm/J0;->f:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p1, Lio/flutter/embedding/engine/plugins/lifecycle/HiddenLifecycleReference;

    .line 6
    .line 7
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/lifecycle/HiddenLifecycleReference;->getLifecycle()Landroidx/lifecycle/l;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ls3/n;->e:Landroidx/lifecycle/l;

    .line 12
    .line 13
    return-void
.end method

.method public final onAttachedToEngine(Lg3/a;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lg3/a;->c:Lio/flutter/plugin/platform/m;

    .line 2
    .line 3
    new-instance v1, Ls3/k;

    .line 4
    .line 5
    iget-object v2, p1, Lg3/a;->b:Lk3/f;

    .line 6
    .line 7
    iget-object p1, p1, Lg3/a;->a:Landroid/content/Context;

    .line 8
    .line 9
    new-instance v3, Lj3/b;

    .line 10
    .line 11
    const/16 v4, 0xf

    .line 12
    .line 13
    invoke-direct {v3, v4, p0}, Lj3/b;-><init>(ILjava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {v1, v2, p1, v3}, Ls3/k;-><init>(Lk3/f;Landroid/content/Context;Lj3/b;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, v0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p1, Ljava/util/HashMap;

    .line 22
    .line 23
    const-string v0, "plugins.flutter.dev/google_maps_android"

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final onDetachedFromActivity()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ls3/n;->e:Landroidx/lifecycle/l;

    .line 3
    .line 4
    return-void
.end method

.method public final onDetachedFromActivityForConfigChanges()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ls3/n;->e:Landroidx/lifecycle/l;

    .line 3
    .line 4
    return-void
.end method

.method public final onDetachedFromEngine(Lg3/a;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final onReattachedToActivityForConfigChanges(Lh3/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ls3/n;->onAttachedToActivity(Lh3/b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
