.class public final LR/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:LR/e;


# direct methods
.method public synthetic constructor <init>(LR/e;I)V
    .locals 0

    .line 1
    iput p2, p0, LR/b;->e:I

    iput-object p1, p0, LR/b;->f:LR/e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget v0, p0, LR/b;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LR/b;->f:LR/e;

    .line 7
    .line 8
    iget-object v1, v0, LR/e;->i:LB2/a;

    .line 9
    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    iget-object v1, v0, LR/e;->i:LB2/a;

    .line 13
    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    new-instance v1, LB2/a;

    .line 17
    .line 18
    const/16 v2, 0xa

    .line 19
    .line 20
    invoke-direct {v1, v2}, LB2/a;-><init>(I)V

    .line 21
    .line 22
    .line 23
    sget-object v2, LR/e;->t:Ljava/lang/Object;

    .line 24
    .line 25
    iput-object v2, v1, LB2/a;->f:Ljava/lang/Object;

    .line 26
    .line 27
    iput-object v2, v1, LB2/a;->g:Ljava/lang/Object;

    .line 28
    .line 29
    iput-object v2, v1, LB2/a;->h:Ljava/lang/Object;

    .line 30
    .line 31
    iput-object v1, v0, LR/e;->i:LB2/a;

    .line 32
    .line 33
    :cond_0
    iget-object v0, v0, LR/e;->i:LB2/a;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void

    .line 39
    :pswitch_0
    iget-object v0, p0, LR/b;->f:LR/e;

    .line 40
    .line 41
    iget-object v0, v0, LR/e;->o:LR/d;

    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    invoke-virtual {v0, v1}, LR/d;->onDismiss(Landroid/content/DialogInterface;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    nop

    .line 49
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
