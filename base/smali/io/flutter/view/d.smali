.class public final Lio/flutter/view/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/accessibility/AccessibilityManager$AccessibilityStateChangeListener;


# instance fields
.field public final synthetic a:Lio/flutter/view/i;


# direct methods
.method public constructor <init>(Lio/flutter/view/i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lio/flutter/view/d;->a:Lio/flutter/view/i;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onAccessibilityStateChanged(Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Lio/flutter/view/d;->a:Lio/flutter/view/i;

    .line 2
    .line 3
    iget-object v1, v0, Lio/flutter/view/i;->b:LB2/a;

    .line 4
    .line 5
    iget-boolean v2, v0, Lio/flutter/view/i;->u:Z

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    goto :goto_2

    .line 10
    :cond_0
    const/4 v2, 0x1

    .line 11
    const/4 v3, 0x0

    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    iget-object v1, v1, LB2/a;->g:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v1, Lio/flutter/embedding/engine/FlutterJNI;

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Lio/flutter/embedding/engine/FlutterJNI;->setSemanticsEnabled(Z)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    invoke-virtual {v0, v3}, Lio/flutter/view/i;->j(Z)V

    .line 23
    .line 24
    .line 25
    iget-object v1, v1, LB2/a;->g:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v1, Lio/flutter/embedding/engine/FlutterJNI;

    .line 28
    .line 29
    invoke-virtual {v1, v3}, Lio/flutter/embedding/engine/FlutterJNI;->setSemanticsEnabled(Z)V

    .line 30
    .line 31
    .line 32
    :goto_0
    iget-object v1, v0, Lio/flutter/view/i;->s:LE/i;

    .line 33
    .line 34
    if-eqz v1, :cond_4

    .line 35
    .line 36
    iget-object v0, v0, Lio/flutter/view/i;->c:Landroid/view/accessibility/AccessibilityManager;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isTouchExplorationEnabled()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iget-object v1, v1, LE/i;->f:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v1, LZ2/p;

    .line 45
    .line 46
    iget-object v4, v1, LZ2/p;->n:La3/c;

    .line 47
    .line 48
    iget-object v4, v4, La3/c;->b:Lio/flutter/embedding/engine/renderer/j;

    .line 49
    .line 50
    iget-object v4, v4, Lio/flutter/embedding/engine/renderer/j;->a:Lio/flutter/embedding/engine/FlutterJNI;

    .line 51
    .line 52
    invoke-virtual {v4}, Lio/flutter/embedding/engine/FlutterJNI;->getIsSoftwareRenderingEnabled()Z

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    if-nez v4, :cond_3

    .line 57
    .line 58
    if-nez p1, :cond_2

    .line 59
    .line 60
    if-nez v0, :cond_2

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    move v2, v3

    .line 64
    :goto_1
    invoke-virtual {v1, v2}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_3
    invoke-virtual {v1, v3}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 69
    .line 70
    .line 71
    :cond_4
    :goto_2
    return-void
.end method
