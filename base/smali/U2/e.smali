.class public final synthetic LU2/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Z

.field public final synthetic g:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;ZI)V
    .locals 0

    .line 1
    iput p3, p0, LU2/e;->e:I

    iput-object p1, p0, LU2/e;->g:Ljava/lang/Object;

    iput-boolean p2, p0, LU2/e;->f:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget v0, p0, LU2/e;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LU2/e;->g:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lv2/f;

    .line 9
    .line 10
    iget-object v0, v0, Lv2/f;->a:La3/f;

    .line 11
    .line 12
    iget-boolean v1, p0, LU2/e;->f:Z

    .line 13
    .line 14
    iput-boolean v1, v0, La3/f;->b:Z

    .line 15
    .line 16
    iget-boolean v1, v0, La3/f;->a:Z

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    iget-object v1, v0, La3/f;->e:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast v1, Landroid/os/Handler;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    iget-boolean v1, v0, La3/f;->b:Z

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    iget-object v1, v0, La3/f;->e:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v1, Landroid/os/Handler;

    .line 35
    .line 36
    iget-object v0, v0, La3/f;->f:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v0, LT2/h;

    .line 39
    .line 40
    const-wide/32 v2, 0x493e0

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void

    .line 47
    :pswitch_0
    iget-object v0, p0, LU2/e;->g:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast v0, Lv2/a;

    .line 50
    .line 51
    iget-boolean v1, p0, LU2/e;->f:Z

    .line 52
    .line 53
    iget-object v0, v0, Lv2/a;->a:LU2/i;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, LU2/i;->e(Z)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :pswitch_1
    iget-object v0, p0, LU2/e;->g:Ljava/lang/Object;

    .line 60
    .line 61
    check-cast v0, LU2/g;

    .line 62
    .line 63
    iget-boolean v1, p0, LU2/e;->f:Z

    .line 64
    .line 65
    iget-object v0, v0, LU2/g;->c:LU2/i;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, LU2/i;->e(Z)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
