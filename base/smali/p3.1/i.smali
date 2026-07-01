.class public final Lp3/i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ls3/D0;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/util/ArrayList;

.field public final synthetic c:LZ2/s;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;LZ2/s;I)V
    .locals 0

    .line 1
    iput p3, p0, Lp3/i;->a:I

    iput-object p1, p0, Lp3/i;->b:Ljava/util/ArrayList;

    iput-object p2, p0, Lp3/i;->c:LZ2/s;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget v0, p0, Lp3/i;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    :pswitch_0
    check-cast p1, Ls3/x0;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iget-object v1, p0, Lp3/i;->b:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v1, v0, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lp3/i;->c:LZ2/s;

    .line 15
    .line 16
    invoke-virtual {p1, v1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :pswitch_1
    check-cast p1, [B

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iget-object v1, p0, Lp3/i;->b:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v1, v0, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lp3/i;->c:LZ2/s;

    .line 29
    .line 30
    invoke-virtual {p1, v1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :pswitch_2
    check-cast p1, Lp3/f;

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    iget-object v1, p0, Lp3/i;->b:Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-virtual {v1, v0, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lp3/i;->c:LZ2/s;

    .line 43
    .line 44
    invoke-virtual {p1, v1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :pswitch_3
    check-cast p1, Ljava/util/List;

    .line 49
    .line 50
    const/4 v0, 0x0

    .line 51
    iget-object v1, p0, Lp3/i;->b:Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-virtual {v1, v0, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lp3/i;->c:LZ2/s;

    .line 57
    .line 58
    invoke-virtual {p1, v1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :pswitch_4
    check-cast p1, Lp3/g;

    .line 63
    .line 64
    const/4 v0, 0x0

    .line 65
    iget-object v1, p0, Lp3/i;->b:Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-virtual {v1, v0, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lp3/i;->c:LZ2/s;

    .line 71
    .line 72
    invoke-virtual {p1, v1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    nop

    .line 77
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public b(Ls3/x;)V
    .locals 1

    .line 1
    iget v0, p0, Lp3/i;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object v0, p0, Lp3/i;->c:LZ2/s;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :pswitch_0
    invoke-static {p1}, Lc1/g;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object v0, p0, Lp3/i;->c:LZ2/s;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    nop

    .line 27
    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_0
    .end packed-switch
.end method

.method public c(Ljava/lang/Exception;)V
    .locals 1

    .line 1
    iget v0, p0, Lp3/i;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Landroid/support/v4/media/session/a;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object v0, p0, Lp3/i;->c:LZ2/s;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :pswitch_0
    invoke-static {p1}, Landroid/support/v4/media/session/a;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object v0, p0, Lp3/i;->c:LZ2/s;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :pswitch_1
    invoke-static {p1}, Landroid/support/v4/media/session/a;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object v0, p0, Lp3/i;->c:LZ2/s;

    .line 31
    .line 32
    invoke-virtual {v0, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :pswitch_2
    invoke-static {p1}, Landroid/support/v4/media/session/a;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iget-object v0, p0, Lp3/i;->c:LZ2/s;

    .line 41
    .line 42
    invoke-virtual {v0, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :pswitch_3
    invoke-static {p1}, Landroid/support/v4/media/session/a;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget-object v0, p0, Lp3/i;->c:LZ2/s;

    .line 51
    .line 52
    invoke-virtual {v0, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :pswitch_4
    invoke-static {p1}, Landroid/support/v4/media/session/a;->N(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iget-object v0, p0, Lp3/i;->c:LZ2/s;

    .line 61
    .line 62
    invoke-virtual {v0, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    nop

    .line 67
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public d(Lt3/l;)V
    .locals 1

    .line 1
    iget v0, p0, Lp3/i;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, LV0/g;->G(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object v0, p0, Lp3/i;->c:LZ2/s;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :pswitch_0
    invoke-static {p1}, LV0/g;->G(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object v0, p0, Lp3/i;->c:LZ2/s;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :pswitch_1
    invoke-static {p1}, LV0/g;->G(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object v0, p0, Lp3/i;->c:LZ2/s;

    .line 31
    .line 32
    invoke-virtual {v0, p1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    nop

    .line 37
    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public e()V
    .locals 3

    .line 1
    iget v0, p0, Lp3/i;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    const/4 v1, 0x0

    .line 8
    iget-object v2, p0, Lp3/i;->b:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v2, v0, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lp3/i;->c:LZ2/s;

    .line 14
    .line 15
    invoke-virtual {v0, v2}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :pswitch_0
    const/4 v0, 0x0

    .line 20
    const/4 v1, 0x0

    .line 21
    iget-object v2, p0, Lp3/i;->b:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-virtual {v2, v0, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lp3/i;->c:LZ2/s;

    .line 27
    .line 28
    invoke-virtual {v0, v2}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :pswitch_1
    const/4 v0, 0x0

    .line 33
    const/4 v1, 0x0

    .line 34
    iget-object v2, p0, Lp3/i;->b:Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-virtual {v2, v0, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lp3/i;->c:LZ2/s;

    .line 40
    .line 41
    invoke-virtual {v0, v2}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :pswitch_2
    const/4 v0, 0x0

    .line 46
    const/4 v1, 0x0

    .line 47
    iget-object v2, p0, Lp3/i;->b:Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-virtual {v2, v0, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lp3/i;->c:LZ2/s;

    .line 53
    .line 54
    invoke-virtual {v0, v2}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    nop

    .line 59
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public f(Ljava/util/ArrayList;)V
    .locals 2

    .line 1
    iget v0, p0, Lp3/i;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iget-object v1, p0, Lp3/i;->b:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v1, v0, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lp3/i;->c:LZ2/s;

    .line 13
    .line 14
    invoke-virtual {p1, v1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :pswitch_0
    const/4 v0, 0x0

    .line 19
    iget-object v1, p0, Lp3/i;->b:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {v1, v0, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lp3/i;->c:LZ2/s;

    .line 25
    .line 26
    invoke-virtual {p1, v1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :pswitch_1
    const/4 v0, 0x0

    .line 31
    iget-object v1, p0, Lp3/i;->b:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-virtual {v1, v0, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lp3/i;->c:LZ2/s;

    .line 37
    .line 38
    invoke-virtual {p1, v1}, LZ2/s;->o(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    nop

    .line 43
    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
