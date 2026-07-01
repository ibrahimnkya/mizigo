.class public final Lk2/l;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final a:Lk2/n;

.field public final b:Le1/o;

.field public final c:Lcom/google/android/gms/maps/model/LatLng;

.field public final d:Lcom/google/android/gms/maps/model/LatLng;

.field public e:Z

.field public f:Ll2/b;

.field public final synthetic g:Lk2/o;


# direct methods
.method public constructor <init>(Lk2/o;Lk2/n;Lcom/google/android/gms/maps/model/LatLng;Lcom/google/android/gms/maps/model/LatLng;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lk2/l;->g:Lk2/o;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lk2/l;->a:Lk2/n;

    .line 7
    .line 8
    iget-object p1, p2, Lk2/n;->a:Le1/o;

    .line 9
    .line 10
    iput-object p1, p0, Lk2/l;->b:Le1/o;

    .line 11
    .line 12
    iput-object p3, p0, Lk2/l;->c:Lcom/google/android/gms/maps/model/LatLng;

    .line 13
    .line 14
    iput-object p4, p0, Lk2/l;->d:Lcom/google/android/gms/maps/model/LatLng;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-boolean p1, p0, Lk2/l;->e:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lk2/l;->g:Lk2/o;

    .line 6
    .line 7
    iget-object v0, p1, Lk2/o;->j:Lk2/e;

    .line 8
    .line 9
    iget-object v1, p0, Lk2/l;->b:Le1/o;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lk2/e;->c(Le1/o;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p1, Lk2/o;->m:Lk2/e;

    .line 15
    .line 16
    invoke-virtual {p1, v1}, Lk2/e;->c(Le1/o;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lk2/l;->f:Ll2/b;

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Ll2/b;->c(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p1, p0, Lk2/l;->a:Lk2/n;

    .line 25
    .line 26
    iget-object v0, p0, Lk2/l;->d:Lcom/google/android/gms/maps/model/LatLng;

    .line 27
    .line 28
    iput-object v0, p1, Lk2/n;->b:Lcom/google/android/gms/maps/model/LatLng;

    .line 29
    .line 30
    return-void
.end method

.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 13

    .line 1
    iget-object v0, p0, Lk2/l;->d:Lcom/google/android/gms/maps/model/LatLng;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v1, p0, Lk2/l;->c:Lcom/google/android/gms/maps/model/LatLng;

    .line 6
    .line 7
    if-eqz v1, :cond_2

    .line 8
    .line 9
    iget-object v2, p0, Lk2/l;->b:Le1/o;

    .line 10
    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iget-wide v3, v0, Lcom/google/android/gms/maps/model/LatLng;->e:D

    .line 19
    .line 20
    iget-wide v5, v1, Lcom/google/android/gms/maps/model/LatLng;->e:D

    .line 21
    .line 22
    sub-double/2addr v3, v5

    .line 23
    float-to-double v7, p1

    .line 24
    mul-double/2addr v3, v7

    .line 25
    add-double/2addr v3, v5

    .line 26
    iget-wide v5, v0, Lcom/google/android/gms/maps/model/LatLng;->f:D

    .line 27
    .line 28
    iget-wide v9, v1, Lcom/google/android/gms/maps/model/LatLng;->f:D

    .line 29
    .line 30
    sub-double/2addr v5, v9

    .line 31
    invoke-static {v5, v6}, Ljava/lang/Math;->abs(D)D

    .line 32
    .line 33
    .line 34
    move-result-wide v9

    .line 35
    const-wide v11, 0x4066800000000000L    # 180.0

    .line 36
    .line 37
    .line 38
    .line 39
    .line 40
    cmpl-double p1, v9, v11

    .line 41
    .line 42
    if-lez p1, :cond_1

    .line 43
    .line 44
    invoke-static {v5, v6}, Ljava/lang/Math;->signum(D)D

    .line 45
    .line 46
    .line 47
    move-result-wide v9

    .line 48
    const-wide v11, 0x4076800000000000L    # 360.0

    .line 49
    .line 50
    .line 51
    .line 52
    .line 53
    mul-double/2addr v9, v11

    .line 54
    sub-double/2addr v5, v9

    .line 55
    :cond_1
    mul-double/2addr v5, v7

    .line 56
    iget-wide v0, v1, Lcom/google/android/gms/maps/model/LatLng;->f:D

    .line 57
    .line 58
    add-double/2addr v5, v0

    .line 59
    new-instance p1, Lcom/google/android/gms/maps/model/LatLng;

    .line 60
    .line 61
    invoke-direct {p1, v3, v4, v5, v6}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2, p1}, Le1/o;->g(Lcom/google/android/gms/maps/model/LatLng;)V

    .line 65
    .line 66
    .line 67
    :cond_2
    :goto_0
    return-void
.end method
