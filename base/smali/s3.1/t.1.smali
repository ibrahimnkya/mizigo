.class public final Ls3/t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ls3/v;


# instance fields
.field public final a:Le1/p;

.field public final b:Le1/b;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public e:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ls3/r0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    .line 5
    .line 6
    .line 7
    move-result p3

    .line 8
    const/4 v0, 0x1

    .line 9
    if-eq p3, v0, :cond_0

    .line 10
    .line 11
    new-instance p3, Le1/p;

    .line 12
    .line 13
    invoke-direct {p3}, Le1/p;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p3, p0, Ls3/t;->a:Le1/p;

    .line 17
    .line 18
    const/4 p3, 0x0

    .line 19
    iput-object p3, p0, Ls3/t;->b:Le1/b;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-instance p3, Le1/b;

    .line 23
    .line 24
    invoke-direct {p3}, Le1/p;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object p3, p0, Ls3/t;->b:Le1/b;

    .line 28
    .line 29
    iput-object p3, p0, Ls3/t;->a:Le1/p;

    .line 30
    .line 31
    :goto_0
    iput-object p1, p0, Ls3/t;->d:Ljava/lang/String;

    .line 32
    .line 33
    iput-object p2, p0, Ls3/t;->c:Ljava/lang/String;

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public final a(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/t;->a:Le1/p;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Le1/p;->l(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final b(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ls3/t;->e:Z

    .line 2
    .line 3
    return-void
.end method

.method public final c(FF)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/t;->a:Le1/p;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Le1/p;->b(FF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final d(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/t;->a:Le1/p;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Le1/p;->a(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final e(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/t;->a:Le1/p;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Le1/p;->c(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final f(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/t;->a:Le1/p;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Le1/p;->d(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final g(FF)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/t;->a:Le1/p;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Le1/p;->f(FF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final h(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/t;->a:Le1/p;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Le1/p;->h(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final i(Lcom/google/android/gms/maps/model/LatLng;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/t;->a:Le1/p;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Le1/p;->g(Lcom/google/android/gms/maps/model/LatLng;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final j(Le1/c;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/t;->a:Le1/p;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Le1/p;->e(Le1/c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final k(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/t;->b:Le1/b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iput p1, v0, Le1/p;->s:I

    .line 6
    .line 7
    :cond_0
    return-void
.end method

.method public final l(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/t;->a:Le1/p;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Le1/p;->j(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p2}, Le1/p;->i(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final m()Ljava/lang/Float;
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/t;->a:Le1/p;

    .line 2
    .line 3
    iget v0, v0, Le1/p;->r:F

    .line 4
    .line 5
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public final n(Le1/p;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ls3/t;->a:Le1/p;

    .line 2
    .line 3
    iget v1, v0, Le1/p;->q:F

    .line 4
    .line 5
    invoke-virtual {p1, v1}, Le1/p;->a(F)V

    .line 6
    .line 7
    .line 8
    iget v1, v0, Le1/p;->i:F

    .line 9
    .line 10
    iget v2, v0, Le1/p;->j:F

    .line 11
    .line 12
    invoke-virtual {p1, v1, v2}, Le1/p;->b(FF)V

    .line 13
    .line 14
    .line 15
    iget-boolean v1, v0, Le1/p;->k:Z

    .line 16
    .line 17
    invoke-virtual {p1, v1}, Le1/p;->c(Z)V

    .line 18
    .line 19
    .line 20
    iget-boolean v1, v0, Le1/p;->m:Z

    .line 21
    .line 22
    invoke-virtual {p1, v1}, Le1/p;->d(Z)V

    .line 23
    .line 24
    .line 25
    iget-object v1, v0, Le1/p;->h:Le1/c;

    .line 26
    .line 27
    invoke-virtual {p1, v1}, Le1/p;->e(Le1/c;)V

    .line 28
    .line 29
    .line 30
    iget v1, v0, Le1/p;->o:F

    .line 31
    .line 32
    iget v2, v0, Le1/p;->p:F

    .line 33
    .line 34
    invoke-virtual {p1, v1, v2}, Le1/p;->f(FF)V

    .line 35
    .line 36
    .line 37
    iget-object v1, v0, Le1/p;->f:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p1, v1}, Le1/p;->j(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v1, v0, Le1/p;->g:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p1, v1}, Le1/p;->i(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, v0, Le1/p;->e:Lcom/google/android/gms/maps/model/LatLng;

    .line 48
    .line 49
    invoke-virtual {p1, v1}, Le1/p;->g(Lcom/google/android/gms/maps/model/LatLng;)V

    .line 50
    .line 51
    .line 52
    iget v1, v0, Le1/p;->n:F

    .line 53
    .line 54
    invoke-virtual {p1, v1}, Le1/p;->h(F)V

    .line 55
    .line 56
    .line 57
    iget-boolean v1, v0, Le1/p;->l:Z

    .line 58
    .line 59
    invoke-virtual {p1, v1}, Le1/p;->k(Z)V

    .line 60
    .line 61
    .line 62
    iget v0, v0, Le1/p;->r:F

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Le1/p;->l(F)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final setVisible(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/t;->a:Le1/p;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Le1/p;->k(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
