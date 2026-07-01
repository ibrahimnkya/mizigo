.class public final synthetic LR/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LC/a;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:LR/j;


# direct methods
.method public synthetic constructor <init>(LR/j;I)V
    .locals 0

    .line 1
    iput p2, p0, LR/f;->a:I

    iput-object p1, p0, LR/f;->b:LR/j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget v0, p0, LR/f;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    check-cast p1, Ljava/lang/Integer;

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/16 v0, 0x50

    .line 13
    .line 14
    if-ne p1, v0, :cond_0

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iget-object v0, p0, LR/f;->b:LR/j;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, LR/j;->d(Z)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void

    .line 23
    :pswitch_0
    check-cast p1, Landroid/content/res/Configuration;

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    iget-object v0, p0, LR/f;->b:LR/j;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, LR/j;->b(Z)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    nop

    .line 33
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
