.class public final synthetic Lio/flutter/plugin/platform/k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lio/flutter/plugin/platform/p;

.field public final synthetic c:Lj3/e;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugin/platform/p;Lj3/e;I)V
    .locals 0

    .line 1
    iput p3, p0, Lio/flutter/plugin/platform/k;->a:I

    iput-object p1, p0, Lio/flutter/plugin/platform/k;->b:Lio/flutter/plugin/platform/p;

    iput-object p2, p0, Lio/flutter/plugin/platform/k;->c:Lj3/e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onFocusChange(Landroid/view/View;Z)V
    .locals 2

    .line 1
    iget p1, p0, Lio/flutter/plugin/platform/k;->a:I

    .line 2
    .line 3
    packed-switch p1, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_1

    .line 7
    .line 8
    iget-object p1, p0, Lio/flutter/plugin/platform/k;->b:Lio/flutter/plugin/platform/p;

    .line 9
    .line 10
    iget-object p1, p1, Lio/flutter/plugin/platform/p;->l:LZ2/s;

    .line 11
    .line 12
    iget-object p2, p0, Lio/flutter/plugin/platform/k;->c:Lj3/e;

    .line 13
    .line 14
    iget p2, p2, Lj3/e;->a:I

    .line 15
    .line 16
    iget-object p1, p1, LZ2/s;->f:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast p1, Lk3/o;

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    const/4 v0, 0x0

    .line 28
    const-string v1, "viewFocused"

    .line 29
    .line 30
    invoke-virtual {p1, v1, p2, v0}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    :goto_0
    return-void

    .line 34
    :pswitch_0
    iget-object p1, p0, Lio/flutter/plugin/platform/k;->c:Lj3/e;

    .line 35
    .line 36
    iget p1, p1, Lj3/e;->a:I

    .line 37
    .line 38
    iget-object v0, p0, Lio/flutter/plugin/platform/k;->b:Lio/flutter/plugin/platform/p;

    .line 39
    .line 40
    if-eqz p2, :cond_3

    .line 41
    .line 42
    iget-object p2, v0, Lio/flutter/plugin/platform/p;->l:LZ2/s;

    .line 43
    .line 44
    iget-object p2, p2, LZ2/s;->f:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast p2, Lk3/o;

    .line 47
    .line 48
    if-nez p2, :cond_2

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_2
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const/4 v0, 0x0

    .line 56
    const-string v1, "viewFocused"

    .line 57
    .line 58
    invoke-virtual {p2, v1, p1, v0}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_3
    iget-object p2, v0, Lio/flutter/plugin/platform/p;->k:Lio/flutter/plugin/editing/k;

    .line 63
    .line 64
    if-eqz p2, :cond_4

    .line 65
    .line 66
    invoke-virtual {p2, p1}, Lio/flutter/plugin/editing/k;->b(I)V

    .line 67
    .line 68
    .line 69
    :cond_4
    :goto_1
    return-void

    .line 70
    nop

    .line 71
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
