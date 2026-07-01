.class public final Ls3/h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ls3/m;


# instance fields
.field public final e:Lcom/google/android/gms/maps/GoogleMapOptions;

.field public f:Z

.field public g:Z

.field public h:Z

.field public i:Z

.field public j:Z

.field public k:Z

.field public l:Ljava/util/List;

.field public m:Ljava/util/List;

.field public n:Ljava/util/List;

.field public o:Ljava/util/List;

.field public p:Ljava/util/List;

.field public q:Ljava/util/List;

.field public r:Ljava/util/List;

.field public s:Ljava/util/List;

.field public t:Landroid/graphics/Rect;

.field public u:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/google/android/gms/maps/GoogleMapOptions;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ls3/h;->e:Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ls3/h;->f:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Ls3/h;->g:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Ls3/h;->h:Z

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    iput-boolean v1, p0, Ls3/h;->i:Z

    .line 20
    .line 21
    iput-boolean v0, p0, Ls3/h;->j:Z

    .line 22
    .line 23
    iput-boolean v1, p0, Ls3/h;->k:Z

    .line 24
    .line 25
    new-instance v1, Landroid/graphics/Rect;

    .line 26
    .line 27
    invoke-direct {v1, v0, v0, v0, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Ls3/h;->t:Landroid/graphics/Rect;

    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public final A(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/h;->e:Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, v0, Lcom/google/android/gms/maps/GoogleMapOptions;->l:Ljava/lang/Boolean;

    .line 8
    .line 9
    return-void
.end method

.method public final B(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ls3/h;->u:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final D(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/h;->e:Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, v0, Lcom/google/android/gms/maps/GoogleMapOptions;->i:Ljava/lang/Boolean;

    .line 8
    .line 9
    return-void
.end method

.method public final E(Ljava/lang/Float;Ljava/lang/Float;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/h;->e:Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iput-object p1, v0, Lcom/google/android/gms/maps/GoogleMapOptions;->r:Ljava/lang/Float;

    .line 6
    .line 7
    :cond_0
    if-eqz p2, :cond_1

    .line 8
    .line 9
    iput-object p2, v0, Lcom/google/android/gms/maps/GoogleMapOptions;->s:Ljava/lang/Float;

    .line 10
    .line 11
    :cond_1
    return-void
.end method

.method public final F(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ls3/h;->j:Z

    .line 2
    .line 3
    return-void
.end method

.method public final G(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/h;->e:Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, v0, Lcom/google/android/gms/maps/GoogleMapOptions;->n:Ljava/lang/Boolean;

    .line 8
    .line 9
    return-void
.end method

.method public final b(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/h;->e:Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 2
    .line 3
    iput p1, v0, Lcom/google/android/gms/maps/GoogleMapOptions;->g:I

    .line 4
    .line 5
    return-void
.end method

.method public final c(FFFF)V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    float-to-int p2, p2

    .line 4
    float-to-int p1, p1

    .line 5
    float-to-int p4, p4

    .line 6
    float-to-int p3, p3

    .line 7
    invoke-direct {v0, p2, p1, p4, p3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ls3/h;->t:Landroid/graphics/Rect;

    .line 11
    .line 12
    return-void
.end method

.method public final d(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ls3/h;->k:Z

    .line 2
    .line 3
    return-void
.end method

.method public final k(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ls3/h;->i:Z

    .line 2
    .line 3
    return-void
.end method

.method public final l(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ls3/h;->h:Z

    .line 2
    .line 3
    return-void
.end method

.method public final n(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/h;->e:Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, v0, Lcom/google/android/gms/maps/GoogleMapOptions;->j:Ljava/lang/Boolean;

    .line 8
    .line 9
    return-void
.end method

.method public final o(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/h;->e:Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, v0, Lcom/google/android/gms/maps/GoogleMapOptions;->p:Ljava/lang/Boolean;

    .line 8
    .line 9
    return-void
.end method

.method public final q(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ls3/h;->f:Z

    .line 2
    .line 3
    return-void
.end method

.method public final s(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/h;->e:Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, v0, Lcom/google/android/gms/maps/GoogleMapOptions;->k:Ljava/lang/Boolean;

    .line 8
    .line 9
    return-void
.end method

.method public final t(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/h;->e:Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, v0, Lcom/google/android/gms/maps/GoogleMapOptions;->o:Ljava/lang/Boolean;

    .line 8
    .line 9
    return-void
.end method

.method public final x(Lcom/google/android/gms/maps/model/LatLngBounds;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/h;->e:Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 2
    .line 3
    iput-object p1, v0, Lcom/google/android/gms/maps/GoogleMapOptions;->t:Lcom/google/android/gms/maps/model/LatLngBounds;

    .line 4
    .line 5
    return-void
.end method

.method public final y(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ls3/h;->e:Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, v0, Lcom/google/android/gms/maps/GoogleMapOptions;->m:Ljava/lang/Boolean;

    .line 8
    .line 9
    return-void
.end method

.method public final z(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ls3/h;->g:Z

    .line 2
    .line 3
    return-void
.end method
