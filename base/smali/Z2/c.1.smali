.class public final LZ2/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/window/OnBackAnimationCallback;


# instance fields
.field public final synthetic a:LZ2/d;


# direct methods
.method public constructor <init>(LZ2/d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LZ2/c;->a:LZ2/d;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onBackCancelled()V
    .locals 3

    .line 1
    iget-object v0, p0, LZ2/c;->a:LZ2/d;

    .line 2
    .line 3
    const-string v1, "cancelBackGesture"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, LZ2/d;->l(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_1

    .line 10
    .line 11
    iget-object v0, v0, LZ2/d;->f:LZ2/h;

    .line 12
    .line 13
    invoke-virtual {v0}, LZ2/h;->c()V

    .line 14
    .line 15
    .line 16
    iget-object v0, v0, LZ2/h;->b:La3/c;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, v0, La3/c;->j:Lio/flutter/plugin/editing/j;

    .line 21
    .line 22
    iget-object v0, v0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v0, Lk3/o;

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-virtual {v0, v1, v2, v2}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    const-string v0, "FlutterActivityAndFragmentDelegate"

    .line 32
    .line 33
    const-string v1, "Invoked cancelBackGesture() before FlutterFragment was attached to an Activity."

    .line 34
    .line 35
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public final onBackInvoked()V
    .locals 3

    .line 1
    iget-object v0, p0, LZ2/c;->a:LZ2/d;

    .line 2
    .line 3
    const-string v1, "commitBackGesture"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, LZ2/d;->l(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_1

    .line 10
    .line 11
    iget-object v0, v0, LZ2/d;->f:LZ2/h;

    .line 12
    .line 13
    invoke-virtual {v0}, LZ2/h;->c()V

    .line 14
    .line 15
    .line 16
    iget-object v0, v0, LZ2/h;->b:La3/c;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, v0, La3/c;->j:Lio/flutter/plugin/editing/j;

    .line 21
    .line 22
    iget-object v0, v0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v0, Lk3/o;

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-virtual {v0, v1, v2, v2}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    const-string v0, "FlutterActivityAndFragmentDelegate"

    .line 32
    .line 33
    const-string v1, "Invoked commitBackGesture() before FlutterFragment was attached to an Activity."

    .line 34
    .line 35
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public final onBackProgressed(Landroid/window/BackEvent;)V
    .locals 3

    .line 1
    iget-object v0, p0, LZ2/c;->a:LZ2/d;

    .line 2
    .line 3
    const-string v1, "updateBackGestureProgress"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, LZ2/d;->l(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_1

    .line 10
    .line 11
    iget-object v0, v0, LZ2/d;->f:LZ2/h;

    .line 12
    .line 13
    invoke-virtual {v0}, LZ2/h;->c()V

    .line 14
    .line 15
    .line 16
    iget-object v0, v0, LZ2/h;->b:La3/c;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, v0, La3/c;->j:Lio/flutter/plugin/editing/j;

    .line 21
    .line 22
    iget-object v0, v0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v0, Lk3/o;

    .line 25
    .line 26
    invoke-static {p1}, Lio/flutter/plugin/editing/j;->o(Landroid/window/BackEvent;)Ljava/util/HashMap;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const/4 v2, 0x0

    .line 31
    invoke-virtual {v0, v1, p1, v2}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    const-string p1, "FlutterActivityAndFragmentDelegate"

    .line 36
    .line 37
    const-string v0, "Invoked updateBackGestureProgress() before FlutterFragment was attached to an Activity."

    .line 38
    .line 39
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method

.method public final onBackStarted(Landroid/window/BackEvent;)V
    .locals 3

    .line 1
    iget-object v0, p0, LZ2/c;->a:LZ2/d;

    .line 2
    .line 3
    const-string v1, "startBackGesture"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, LZ2/d;->l(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_1

    .line 10
    .line 11
    iget-object v0, v0, LZ2/d;->f:LZ2/h;

    .line 12
    .line 13
    invoke-virtual {v0}, LZ2/h;->c()V

    .line 14
    .line 15
    .line 16
    iget-object v0, v0, LZ2/h;->b:La3/c;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, v0, La3/c;->j:Lio/flutter/plugin/editing/j;

    .line 21
    .line 22
    iget-object v0, v0, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v0, Lk3/o;

    .line 25
    .line 26
    invoke-static {p1}, Lio/flutter/plugin/editing/j;->o(Landroid/window/BackEvent;)Ljava/util/HashMap;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const/4 v2, 0x0

    .line 31
    invoke-virtual {v0, v1, p1, v2}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    const-string p1, "FlutterActivityAndFragmentDelegate"

    .line 36
    .line 37
    const-string v0, "Invoked startBackGesture() before FlutterFragment was attached to an Activity."

    .line 38
    .line 39
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method
