.class public final LX3/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lg3/b;
.implements Lh3/a;


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
    .locals 1

    .line 1
    const-string v0, "activityPluginBinding"

    .line 2
    .line 3
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    move-object v0, p1

    .line 7
    check-cast v0, Lm/J0;

    .line 8
    .line 9
    iget-object v0, v0, Lm/J0;->e:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Landroid/app/Activity;

    .line 12
    .line 13
    sput-object v0, Landroid/support/v4/media/session/a;->a:Landroid/app/Activity;

    .line 14
    .line 15
    sput-object p1, Landroid/support/v4/media/session/a;->b:Lh3/b;

    .line 16
    .line 17
    return-void
.end method

.method public final onAttachedToEngine(Lg3/a;)V
    .locals 3

    .line 1
    const-string v0, "flutterPluginBinding"

    .line 2
    .line 3
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lg3/a;->c:Lio/flutter/plugin/platform/m;

    .line 7
    .line 8
    new-instance v1, LX3/e;

    .line 9
    .line 10
    iget-object p1, p1, Lg3/a;->b:Lk3/f;

    .line 11
    .line 12
    const-string v2, "getBinaryMessenger(...)"

    .line 13
    .line 14
    invoke-static {p1, v2}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {v1, p1}, LX3/e;-><init>(Lk3/f;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, v0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p1, Ljava/util/HashMap;

    .line 23
    .line 24
    const-string v0, "net.touchcapture.qr.flutterqrplus/qrview"

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final onDetachedFromActivity()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Landroid/support/v4/media/session/a;->a:Landroid/app/Activity;

    .line 3
    .line 4
    sput-object v0, Landroid/support/v4/media/session/a;->b:Lh3/b;

    .line 5
    .line 6
    return-void
.end method

.method public final onDetachedFromActivityForConfigChanges()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Landroid/support/v4/media/session/a;->a:Landroid/app/Activity;

    .line 3
    .line 4
    sput-object v0, Landroid/support/v4/media/session/a;->b:Lh3/b;

    .line 5
    .line 6
    return-void
.end method

.method public final onDetachedFromEngine(Lg3/a;)V
    .locals 1

    .line 1
    const-string v0, "binding"

    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public final onReattachedToActivityForConfigChanges(Lh3/b;)V
    .locals 1

    .line 1
    const-string v0, "activityPluginBinding"

    .line 2
    .line 3
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    move-object v0, p1

    .line 7
    check-cast v0, Lm/J0;

    .line 8
    .line 9
    iget-object v0, v0, Lm/J0;->e:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Landroid/app/Activity;

    .line 12
    .line 13
    sput-object v0, Landroid/support/v4/media/session/a;->a:Landroid/app/Activity;

    .line 14
    .line 15
    sput-object p1, Landroid/support/v4/media/session/a;->b:Lh3/b;

    .line 16
    .line 17
    return-void
.end method
