.class public final LZ2/m;
.super Landroid/database/ContentObserver;
.source "SourceFile"


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Landroid/os/Handler;I)V
    .locals 0

    .line 1
    iput p3, p0, LZ2/m;->a:I

    iput-object p1, p0, LZ2/m;->b:Ljava/lang/Object;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public deliverSelfNotifications()Z
    .locals 1

    .line 1
    iget v0, p0, LZ2/m;->a:I

    packed-switch v0, :pswitch_data_0

    invoke-super {p0}, Landroid/database/ContentObserver;->deliverSelfNotifications()Z

    move-result v0

    return v0

    :pswitch_0
    const/4 v0, 0x1

    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final onChange(Z)V
    .locals 1

    iget v0, p0, LZ2/m;->a:I

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, p1, v0}, LZ2/m;->onChange(ZLandroid/net/Uri;)V

    return-void

    .line 2
    :pswitch_0
    invoke-super {p0, p1}, Landroid/database/ContentObserver;->onChange(Z)V

    .line 3
    iget-object p1, p0, LZ2/m;->b:Ljava/lang/Object;

    check-cast p1, LZ2/p;

    .line 4
    iget-object v0, p1, LZ2/p;->n:La3/c;

    if-nez v0, :cond_0

    goto :goto_0

    .line 5
    :cond_0
    invoke-virtual {p1}, LZ2/p;->d()V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public onChange(ZLandroid/net/Uri;)V
    .locals 2

    iget v0, p0, LZ2/m;->a:I

    packed-switch v0, :pswitch_data_0

    invoke-super {p0, p1, p2}, Landroid/database/ContentObserver;->onChange(ZLandroid/net/Uri;)V

    return-void

    .line 6
    :pswitch_0
    iget-object p1, p0, LZ2/m;->b:Ljava/lang/Object;

    check-cast p1, Lio/flutter/view/i;

    .line 7
    iget-boolean p2, p1, Lio/flutter/view/i;->u:Z

    if-eqz p2, :cond_0

    goto :goto_1

    .line 8
    :cond_0
    iget-object p2, p1, Lio/flutter/view/i;->f:Landroid/content/ContentResolver;

    .line 9
    const-string v0, "transition_animation_scale"

    const/high16 v1, 0x3f800000    # 1.0f

    .line 10
    invoke-static {p2, v0, v1}, Landroid/provider/Settings$Global;->getFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)F

    move-result p2

    const/4 v0, 0x0

    cmpl-float p2, p2, v0

    if-nez p2, :cond_1

    .line 11
    iget p2, p1, Lio/flutter/view/i;->l:I

    or-int/lit8 p2, p2, 0x4

    iput p2, p1, Lio/flutter/view/i;->l:I

    goto :goto_0

    .line 12
    :cond_1
    iget p2, p1, Lio/flutter/view/i;->l:I

    and-int/lit8 p2, p2, -0x5

    iput p2, p1, Lio/flutter/view/i;->l:I

    .line 13
    :goto_0
    iget-object p2, p1, Lio/flutter/view/i;->b:LB2/a;

    iget p1, p1, Lio/flutter/view/i;->l:I

    .line 14
    iget-object p2, p2, LB2/a;->g:Ljava/lang/Object;

    check-cast p2, Lio/flutter/embedding/engine/FlutterJNI;

    .line 15
    invoke-virtual {p2, p1}, Lio/flutter/embedding/engine/FlutterJNI;->setAccessibilityFeatures(I)V

    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
