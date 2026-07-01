.class public final Lk2/c;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final a:Lk2/g;

.field public final b:Le1/o;

.field public final c:Lcom/google/android/gms/maps/model/LatLng;

.field public final d:Lcom/google/android/gms/maps/model/LatLng;

.field public e:Z

.field public f:Ll2/b;

.field public final synthetic g:Lk2/j;


# direct methods
.method public constructor <init>(Lk2/j;Lk2/g;Lcom/google/android/gms/maps/model/LatLng;Lcom/google/android/gms/maps/model/LatLng;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lk2/c;->g:Lk2/j;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lk2/c;->a:Lk2/g;

    .line 7
    .line 8
    iget-object p1, p2, Lk2/g;->a:Le1/o;

    .line 9
    .line 10
    iput-object p1, p0, Lk2/c;->b:Le1/o;

    .line 11
    .line 12
    iput-object p3, p0, Lk2/c;->c:Lcom/google/android/gms/maps/model/LatLng;

    .line 13
    .line 14
    iput-object p4, p0, Lk2/c;->d:Lcom/google/android/gms/maps/model/LatLng;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-boolean p1, p0, Lk2/c;->e:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lk2/c;->g:Lk2/j;

    .line 6
    .line 7
    iget-object v0, p1, Lk2/j;->j:Lk2/e;

    .line 8
    .line 9
    iget-object v1, p0, Lk2/c;->b:Le1/o;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lk2/e;->c(Le1/o;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p1, Lk2/j;->m:Lk2/e;

    .line 15
    .line 16
    invoke-virtual {p1, v1}, Lk2/e;->c(Le1/o;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lk2/c;->f:Ll2/b;

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Ll2/b;->c(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p1, p0, Lk2/c;->a:Lk2/g;

    .line 25
    .line 26
    iget-object v0, p0, Lk2/c;->d:Lcom/google/android/gms/maps/model/LatLng;

    .line 27
    .line 28
    iput-object v0, p1, Lk2/g;->b:Lcom/google/android/gms/maps/model/LatLng;

    .line 29
    .line 30
    return-void
.end method

.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 12

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lk2/c;->d:Lcom/google/android/gms/maps/model/LatLng;

    .line 6
    .line 7
    iget-wide v1, v0, Lcom/google/android/gms/maps/model/LatLng;->e:D

    .line 8
    .line 9
    iget-object v3, p0, Lk2/c;->c:Lcom/google/android/gms/maps/model/LatLng;

    .line 10
    .line 11
    iget-wide v4, v3, Lcom/google/android/gms/maps/model/LatLng;->e:D

    .line 12
    .line 13
    sub-double/2addr v1, v4

    .line 14
    float-to-double v6, p1

    .line 15
    mul-double/2addr v1, v6

    .line 16
    add-double/2addr v1, v4

    .line 17
    iget-wide v4, v0, Lcom/google/android/gms/maps/model/LatLng;->f:D

    .line 18
    .line 19
    iget-wide v8, v3, Lcom/google/android/gms/maps/model/LatLng;->f:D

    .line 20
    .line 21
    sub-double/2addr v4, v8

    .line 22
    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    .line 23
    .line 24
    .line 25
    move-result-wide v8

    .line 26
    const-wide v10, 0x4066800000000000L    # 180.0

    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    cmpl-double p1, v8, v10

    .line 32
    .line 33
    if-lez p1, :cond_0

    .line 34
    .line 35
    invoke-static {v4, v5}, Ljava/lang/Math;->signum(D)D

    .line 36
    .line 37
    .line 38
    move-result-wide v8

    .line 39
    const-wide v10, 0x4076800000000000L    # 360.0

    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    mul-double/2addr v8, v10

    .line 45
    sub-double/2addr v4, v8

    .line 46
    :cond_0
    mul-double/2addr v4, v6

    .line 47
    iget-wide v6, v3, Lcom/google/android/gms/maps/model/LatLng;->f:D

    .line 48
    .line 49
    add-double/2addr v4, v6

    .line 50
    new-instance p1, Lcom/google/android/gms/maps/model/LatLng;

    .line 51
    .line 52
    invoke-direct {p1, v1, v2, v4, v5}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lk2/c;->b:Le1/o;

    .line 56
    .line 57
    invoke-virtual {v0, p1}, Le1/o;->g(Lcom/google/android/gms/maps/model/LatLng;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method
