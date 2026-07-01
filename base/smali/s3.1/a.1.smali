.class public final Ls3/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ls3/c;
.implements Ls3/F0;
.implements Ls3/H0;


# instance fields
.field public final synthetic a:I

.field public final b:F

.field public c:Z

.field public final d:LO0/a;


# direct methods
.method public constructor <init>(FI)V
    .locals 3

    .line 1
    iput p2, p0, Ls3/a;->a:I

    .line 2
    .line 3
    packed-switch p2, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance p2, Le1/g;

    .line 10
    .line 11
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p2, Le1/g;->e:Lcom/google/android/gms/maps/model/LatLng;

    .line 16
    .line 17
    const-wide/16 v1, 0x0

    .line 18
    .line 19
    iput-wide v1, p2, Le1/g;->f:D

    .line 20
    .line 21
    const/high16 v1, 0x41200000    # 10.0f

    .line 22
    .line 23
    iput v1, p2, Le1/g;->g:F

    .line 24
    .line 25
    const/high16 v1, -0x1000000

    .line 26
    .line 27
    iput v1, p2, Le1/g;->h:I

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    iput v1, p2, Le1/g;->i:I

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    iput v2, p2, Le1/g;->j:F

    .line 34
    .line 35
    const/4 v2, 0x1

    .line 36
    iput-boolean v2, p2, Le1/g;->k:Z

    .line 37
    .line 38
    iput-boolean v1, p2, Le1/g;->l:Z

    .line 39
    .line 40
    iput-object v0, p2, Le1/g;->m:Ljava/util/ArrayList;

    .line 41
    .line 42
    iput-object p2, p0, Ls3/a;->d:LO0/a;

    .line 43
    .line 44
    iput p1, p0, Ls3/a;->b:F

    .line 45
    .line 46
    return-void

    .line 47
    :pswitch_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    .line 49
    .line 50
    new-instance p2, Le1/w;

    .line 51
    .line 52
    invoke-direct {p2}, Le1/w;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object p2, p0, Ls3/a;->d:LO0/a;

    .line 56
    .line 57
    iput p1, p0, Ls3/a;->b:F

    .line 58
    .line 59
    return-void

    .line 60
    :pswitch_1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    .line 62
    .line 63
    new-instance p2, Le1/u;

    .line 64
    .line 65
    invoke-direct {p2}, Le1/u;-><init>()V

    .line 66
    .line 67
    .line 68
    iput-object p2, p0, Ls3/a;->d:LO0/a;

    .line 69
    .line 70
    iput p1, p0, Ls3/a;->b:F

    .line 71
    .line 72
    return-void

    .line 73
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final a(F)V
    .locals 1

    .line 1
    iget v0, p0, Ls3/a;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 7
    .line 8
    check-cast v0, Le1/w;

    .line 9
    .line 10
    iput p1, v0, Le1/w;->h:F

    .line 11
    .line 12
    return-void

    .line 13
    :pswitch_0
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 14
    .line 15
    check-cast v0, Le1/u;

    .line 16
    .line 17
    iput p1, v0, Le1/u;->j:F

    .line 18
    .line 19
    return-void

    .line 20
    :pswitch_1
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 21
    .line 22
    check-cast v0, Le1/g;

    .line 23
    .line 24
    iput p1, v0, Le1/g;->j:F

    .line 25
    .line 26
    return-void

    .line 27
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final b(Z)V
    .locals 1

    .line 1
    iget v0, p0, Ls3/a;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iput-boolean p1, p0, Ls3/a;->c:Z

    .line 7
    .line 8
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 9
    .line 10
    check-cast v0, Le1/w;

    .line 11
    .line 12
    iput-boolean p1, v0, Le1/w;->k:Z

    .line 13
    .line 14
    return-void

    .line 15
    :pswitch_0
    iput-boolean p1, p0, Ls3/a;->c:Z

    .line 16
    .line 17
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 18
    .line 19
    check-cast v0, Le1/u;

    .line 20
    .line 21
    iput-boolean p1, v0, Le1/u;->m:Z

    .line 22
    .line 23
    return-void

    .line 24
    :pswitch_1
    iput-boolean p1, p0, Ls3/a;->c:Z

    .line 25
    .line 26
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 27
    .line 28
    check-cast v0, Le1/g;

    .line 29
    .line 30
    iput-boolean p1, v0, Le1/g;->l:Z

    .line 31
    .line 32
    return-void

    .line 33
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public c(I)V
    .locals 1

    .line 1
    iget v0, p0, Ls3/a;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 7
    .line 8
    check-cast v0, Le1/u;

    .line 9
    .line 10
    iput p1, v0, Le1/u;->h:I

    .line 11
    .line 12
    return-void

    .line 13
    :pswitch_0
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 14
    .line 15
    check-cast v0, Le1/g;

    .line 16
    .line 17
    iput p1, v0, Le1/g;->h:I

    .line 18
    .line 19
    return-void

    .line 20
    nop

    .line 21
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public d(Z)V
    .locals 1

    .line 1
    iget v0, p0, Ls3/a;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 7
    .line 8
    check-cast v0, Le1/w;

    .line 9
    .line 10
    iput-boolean p1, v0, Le1/w;->j:Z

    .line 11
    .line 12
    return-void

    .line 13
    :pswitch_0
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 14
    .line 15
    check-cast v0, Le1/u;

    .line 16
    .line 17
    iput-boolean p1, v0, Le1/u;->l:Z

    .line 18
    .line 19
    return-void

    .line 20
    nop

    .line 21
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public e(Ljava/util/ArrayList;)V
    .locals 5

    .line 1
    iget v0, p0, Ls3/a;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 7
    .line 8
    check-cast v0, Le1/w;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x0

    .line 18
    :goto_0
    if-ge v2, v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    add-int/lit8 v2, v2, 0x1

    .line 25
    .line 26
    check-cast v3, Lcom/google/android/gms/maps/model/LatLng;

    .line 27
    .line 28
    iget-object v4, v0, Le1/w;->e:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return-void

    .line 35
    :pswitch_0
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 36
    .line 37
    check-cast v0, Le1/u;

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    const/4 v2, 0x0

    .line 47
    :goto_1
    if-ge v2, v1, :cond_1

    .line 48
    .line 49
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    add-int/lit8 v2, v2, 0x1

    .line 54
    .line 55
    check-cast v3, Lcom/google/android/gms/maps/model/LatLng;

    .line 56
    .line 57
    iget-object v4, v0, Le1/u;->e:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_1
    return-void

    .line 64
    nop

    .line 65
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public f(I)V
    .locals 1

    .line 1
    iget v0, p0, Ls3/a;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 7
    .line 8
    check-cast v0, Le1/u;

    .line 9
    .line 10
    iput p1, v0, Le1/u;->i:I

    .line 11
    .line 12
    return-void

    .line 13
    :pswitch_0
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 14
    .line 15
    check-cast v0, Le1/g;

    .line 16
    .line 17
    iput p1, v0, Le1/g;->i:I

    .line 18
    .line 19
    return-void

    .line 20
    nop

    .line 21
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public g(F)V
    .locals 2

    .line 1
    iget v0, p0, Ls3/a;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 7
    .line 8
    check-cast v0, Le1/u;

    .line 9
    .line 10
    iget v1, p0, Ls3/a;->b:F

    .line 11
    .line 12
    mul-float/2addr p1, v1

    .line 13
    iput p1, v0, Le1/u;->g:F

    .line 14
    .line 15
    return-void

    .line 16
    :pswitch_0
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 17
    .line 18
    check-cast v0, Le1/g;

    .line 19
    .line 20
    iget v1, p0, Ls3/a;->b:F

    .line 21
    .line 22
    mul-float/2addr p1, v1

    .line 23
    iput p1, v0, Le1/g;->g:F

    .line 24
    .line 25
    return-void

    .line 26
    nop

    .line 27
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public h(Le1/e;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 2
    .line 3
    check-cast v0, Le1/w;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    iput-object p1, v0, Le1/w;->l:Le1/e;

    .line 9
    .line 10
    return-void
.end method

.method public i(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 2
    .line 3
    check-cast v0, Le1/w;

    .line 4
    .line 5
    iput p1, v0, Le1/w;->n:I

    .line 6
    .line 7
    return-void
.end method

.method public j(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 2
    .line 3
    check-cast v0, Le1/w;

    .line 4
    .line 5
    iget v1, p0, Ls3/a;->b:F

    .line 6
    .line 7
    mul-float/2addr p1, v1

    .line 8
    iput p1, v0, Le1/w;->f:F

    .line 9
    .line 10
    return-void
.end method

.method public k(Ljava/util/ArrayList;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 2
    .line 3
    check-cast v0, Le1/w;

    .line 4
    .line 5
    iput-object p1, v0, Le1/w;->o:Ljava/util/List;

    .line 6
    .line 7
    return-void
.end method

.method public l(Ljava/util/ArrayList;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    if-ge v1, v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    add-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    check-cast v2, Ljava/util/List;

    .line 15
    .line 16
    iget-object v3, p0, Ls3/a;->d:LO0/a;

    .line 17
    .line 18
    check-cast v3, Le1/u;

    .line 19
    .line 20
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    const-string v4, "points must not be null."

    .line 24
    .line 25
    invoke-static {v2, v4}, LN0/n;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    new-instance v4, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    if-eqz v5, :cond_0

    .line 42
    .line 43
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    check-cast v5, Lcom/google/android/gms/maps/model/LatLng;

    .line 48
    .line 49
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_0
    iget-object v2, v3, Le1/u;->f:Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    return-void
.end method

.method public m(Le1/e;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 2
    .line 3
    check-cast v0, Le1/w;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    iput-object p1, v0, Le1/w;->m:Le1/e;

    .line 9
    .line 10
    return-void
.end method

.method public n(D)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 2
    .line 3
    check-cast v0, Le1/g;

    .line 4
    .line 5
    iput-wide p1, v0, Le1/g;->f:D

    .line 6
    .line 7
    return-void
.end method

.method public o(Lcom/google/android/gms/maps/model/LatLng;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 2
    .line 3
    check-cast v0, Le1/g;

    .line 4
    .line 5
    iput-object p1, v0, Le1/g;->e:Lcom/google/android/gms/maps/model/LatLng;

    .line 6
    .line 7
    return-void
.end method

.method public p(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 2
    .line 3
    check-cast v0, Le1/w;

    .line 4
    .line 5
    iput p1, v0, Le1/w;->g:I

    .line 6
    .line 7
    return-void
.end method

.method public final setVisible(Z)V
    .locals 1

    .line 1
    iget v0, p0, Ls3/a;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 7
    .line 8
    check-cast v0, Le1/w;

    .line 9
    .line 10
    iput-boolean p1, v0, Le1/w;->i:Z

    .line 11
    .line 12
    return-void

    .line 13
    :pswitch_0
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 14
    .line 15
    check-cast v0, Le1/u;

    .line 16
    .line 17
    iput-boolean p1, v0, Le1/u;->k:Z

    .line 18
    .line 19
    return-void

    .line 20
    :pswitch_1
    iget-object v0, p0, Ls3/a;->d:LO0/a;

    .line 21
    .line 22
    check-cast v0, Le1/g;

    .line 23
    .line 24
    iput-boolean p1, v0, Le1/g;->k:Z

    .line 25
    .line 26
    return-void

    .line 27
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
