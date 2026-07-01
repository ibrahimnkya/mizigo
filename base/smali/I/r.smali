.class public final LI/r;
.super LC3/g;
.source "SourceFile"

# interfaces
.implements LH3/q;


# instance fields
.field public final synthetic i:I

.field public j:I

.field public synthetic k:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILA3/d;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    iput v0, p0, LI/r;->i:I

    invoke-direct {p0, p1, p2}, LC3/g;-><init>(ILA3/d;)V

    return-void
.end method

.method public constructor <init>(LI/O;LA3/d;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, LI/r;->i:I

    .line 2
    iput-object p1, p0, LI/r;->k:Ljava/lang/Object;

    const/4 p1, 0x3

    invoke-direct {p0, p1, p2}, LC3/g;-><init>(ILA3/d;)V

    return-void
.end method


# virtual methods
.method public final f(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, LI/r;->i:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    check-cast p1, LI/Q;

    .line 7
    .line 8
    check-cast p2, Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    check-cast p3, LA3/d;

    .line 14
    .line 15
    new-instance p2, LI/r;

    .line 16
    .line 17
    const/4 v0, 0x3

    .line 18
    invoke-direct {p2, v0, p3}, LI/r;-><init>(ILA3/d;)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p2, LI/r;->k:Ljava/lang/Object;

    .line 22
    .line 23
    sget-object p1, Ly3/h;->a:Ly3/h;

    .line 24
    .line 25
    invoke-virtual {p2, p1}, LI/r;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    return-object p1

    .line 30
    :pswitch_0
    check-cast p1, LQ3/e;

    .line 31
    .line 32
    check-cast p2, Ljava/lang/Throwable;

    .line 33
    .line 34
    check-cast p3, LA3/d;

    .line 35
    .line 36
    new-instance p1, LI/r;

    .line 37
    .line 38
    iget-object p2, p0, LI/r;->k:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast p2, LI/O;

    .line 41
    .line 42
    invoke-direct {p1, p2, p3}, LI/r;-><init>(LI/O;LA3/d;)V

    .line 43
    .line 44
    .line 45
    sget-object p2, Ly3/h;->a:Ly3/h;

    .line 46
    .line 47
    invoke-virtual {p1, p2}, LI/r;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    return-object p1

    .line 52
    nop

    .line 53
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget v0, p0, LI/r;->i:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget v0, p0, LI/r;->j:I

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 18
    .line 19
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 20
    .line 21
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    throw p1

    .line 25
    :cond_1
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, LI/r;->k:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast p1, LI/Q;

    .line 31
    .line 32
    iput v1, p0, LI/r;->j:I

    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    invoke-static {p1, p0}, LI/Q;->a(LI/Q;LC3/c;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    sget-object v0, LB3/a;->e:LB3/a;

    .line 42
    .line 43
    if-ne p1, v0, :cond_2

    .line 44
    .line 45
    move-object p1, v0

    .line 46
    :cond_2
    :goto_0
    return-object p1

    .line 47
    :pswitch_0
    iget v0, p0, LI/r;->j:I

    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    if-eqz v0, :cond_4

    .line 51
    .line 52
    if-ne v0, v1, :cond_3

    .line 53
    .line 54
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 59
    .line 60
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 61
    .line 62
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    throw p1

    .line 66
    :cond_4
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, LI/r;->k:Ljava/lang/Object;

    .line 70
    .line 71
    check-cast p1, LI/O;

    .line 72
    .line 73
    iput v1, p0, LI/r;->j:I

    .line 74
    .line 75
    invoke-static {p1, p0}, LI/O;->a(LI/O;LC3/c;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    sget-object v0, LB3/a;->e:LB3/a;

    .line 80
    .line 81
    if-ne p1, v0, :cond_5

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_5
    :goto_1
    sget-object v0, Ly3/h;->a:Ly3/h;

    .line 85
    .line 86
    :goto_2
    return-object v0

    .line 87
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
