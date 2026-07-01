.class public LD/S;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:LD/W;


# instance fields
.field public final a:LD/W;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x22

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    new-instance v0, LD/H;

    .line 8
    .line 9
    invoke-direct {v0}, LD/H;-><init>()V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/16 v1, 0x1f

    .line 14
    .line 15
    if-lt v0, v1, :cond_1

    .line 16
    .line 17
    new-instance v0, LD/G;

    .line 18
    .line 19
    invoke-direct {v0}, LD/G;-><init>()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const/16 v1, 0x1e

    .line 24
    .line 25
    if-lt v0, v1, :cond_2

    .line 26
    .line 27
    new-instance v0, LD/F;

    .line 28
    .line 29
    invoke-direct {v0}, LD/F;-><init>()V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_2
    const/16 v1, 0x1d

    .line 34
    .line 35
    if-lt v0, v1, :cond_3

    .line 36
    .line 37
    new-instance v0, LD/E;

    .line 38
    .line 39
    invoke-direct {v0}, LD/E;-><init>()V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_3
    new-instance v0, LD/C;

    .line 44
    .line 45
    invoke-direct {v0}, LD/C;-><init>()V

    .line 46
    .line 47
    .line 48
    :goto_0
    invoke-virtual {v0}, LD/I;->b()LD/W;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget-object v0, v0, LD/W;->a:LD/S;

    .line 53
    .line 54
    invoke-virtual {v0}, LD/S;->a()LD/W;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget-object v0, v0, LD/W;->a:LD/S;

    .line 59
    .line 60
    invoke-virtual {v0}, LD/S;->b()LD/W;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iget-object v0, v0, LD/W;->a:LD/S;

    .line 65
    .line 66
    invoke-virtual {v0}, LD/S;->c()LD/W;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    sput-object v0, LD/S;->b:LD/W;

    .line 71
    .line 72
    return-void
.end method

.method public constructor <init>(LD/W;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LD/S;->a:LD/W;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()LD/W;
    .locals 1

    .line 1
    iget-object v0, p0, LD/S;->a:LD/W;

    .line 2
    .line 3
    return-object v0
.end method

.method public b()LD/W;
    .locals 1

    .line 1
    iget-object v0, p0, LD/S;->a:LD/W;

    .line 2
    .line 3
    return-object v0
.end method

.method public c()LD/W;
    .locals 1

    .line 1
    iget-object v0, p0, LD/S;->a:LD/W;

    .line 2
    .line 3
    return-object v0
.end method

.method public d(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public e()LD/e;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, LD/S;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, LD/S;

    .line 12
    .line 13
    invoke-virtual {p0}, LD/S;->m()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {p1}, LD/S;->m()Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-ne v1, v3, :cond_2

    .line 22
    .line 23
    invoke-virtual {p0}, LD/S;->l()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {p1}, LD/S;->l()Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-ne v1, v3, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0}, LD/S;->i()Lw/b;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {p1}, LD/S;->i()Lw/b;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-static {v1, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0}, LD/S;->g()Lw/b;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {p1}, LD/S;->g()Lw/b;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-static {v1, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    invoke-virtual {p0}, LD/S;->e()LD/e;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {p1}, LD/S;->e()LD/e;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-static {v1, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_2

    .line 74
    .line 75
    return v0

    .line 76
    :cond_2
    return v2
.end method

.method public f()Lw/b;
    .locals 1

    .line 1
    invoke-virtual {p0}, LD/S;->i()Lw/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public g()Lw/b;
    .locals 1

    .line 1
    sget-object v0, Lw/b;->e:Lw/b;

    .line 2
    .line 3
    return-object v0
.end method

.method public h()Lw/b;
    .locals 1

    .line 1
    invoke-virtual {p0}, LD/S;->i()Lw/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .line 1
    invoke-virtual {p0}, LD/S;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, LD/S;->l()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p0}, LD/S;->i()Lw/b;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {p0}, LD/S;->g()Lw/b;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {p0}, LD/S;->e()LD/e;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    filled-new-array {v0, v1, v2, v3, v4}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    return v0
.end method

.method public i()Lw/b;
    .locals 1

    .line 1
    sget-object v0, Lw/b;->e:Lw/b;

    .line 2
    .line 3
    return-object v0
.end method

.method public j()Lw/b;
    .locals 1

    .line 1
    invoke-virtual {p0}, LD/S;->i()Lw/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public k(IIII)LD/W;
    .locals 0

    .line 1
    sget-object p1, LD/S;->b:LD/W;

    .line 2
    .line 3
    return-object p1
.end method

.method public l()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return v0
.end method

.method public m()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return v0
.end method

.method public n(I)Z
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    return p1
.end method

.method public o([Lw/b;)V
    .locals 0

    .line 1
    return-void
.end method

.method public p(LD/W;)V
    .locals 0

    .line 1
    return-void
.end method

.method public q(Lw/b;)V
    .locals 0

    .line 1
    return-void
.end method

.method public r(I)V
    .locals 0

    .line 1
    return-void
.end method
