.class public final LI/y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LQ3/e;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, LI/y;->e:I

    iput-object p2, p0, LI/y;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;LA3/d;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, LI/y;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, LI/y;->f:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p2, LC/a;

    .line 9
    .line 10
    invoke-interface {p2, p1}, LC/a;->accept(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    sget-object p1, Ly3/h;->a:Ly3/h;

    .line 14
    .line 15
    return-object p1

    .line 16
    :pswitch_0
    iget-object p2, p0, LI/y;->f:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast p2, LI3/p;

    .line 19
    .line 20
    iput-object p1, p2, LI3/p;->e:Ljava/lang/Object;

    .line 21
    .line 22
    new-instance p1, LR3/a;

    .line 23
    .line 24
    invoke-direct {p1, p0}, LR3/a;-><init>(LQ3/e;)V

    .line 25
    .line 26
    .line 27
    throw p1

    .line 28
    :pswitch_1
    check-cast p1, Ly3/h;

    .line 29
    .line 30
    iget-object p1, p0, LI/y;->f:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast p1, LI/O;

    .line 33
    .line 34
    iget-object v0, p1, LI/O;->l:LE/i;

    .line 35
    .line 36
    invoke-virtual {v0}, LE/i;->l()LI/k0;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    instance-of v0, v0, LI/a0;

    .line 41
    .line 42
    if-nez v0, :cond_0

    .line 43
    .line 44
    const/4 v0, 0x1

    .line 45
    invoke-static {p1, v0, p2}, LI/O;->f(LI/O;ZLA3/d;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    sget-object p2, LB3/a;->e:LB3/a;

    .line 50
    .line 51
    if-ne p1, p2, :cond_0

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    sget-object p1, Ly3/h;->a:Ly3/h;

    .line 55
    .line 56
    :goto_0
    return-object p1

    .line 57
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
