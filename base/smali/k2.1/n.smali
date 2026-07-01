.class public final Lk2/n;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Le1/o;

.field public b:Lcom/google/android/gms/maps/model/LatLng;


# direct methods
.method public constructor <init>(Le1/o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lk2/n;->a:Le1/o;

    .line 5
    .line 6
    invoke-virtual {p1}, Le1/o;->b()Lcom/google/android/gms/maps/model/LatLng;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lk2/n;->b:Lcom/google/android/gms/maps/model/LatLng;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Lk2/n;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lk2/n;

    .line 6
    .line 7
    iget-object p1, p1, Lk2/n;->a:Le1/o;

    .line 8
    .line 9
    iget-object v0, p0, Lk2/n;->a:Le1/o;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Le1/o;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    return p1

    .line 16
    :cond_0
    const/4 p1, 0x0

    .line 17
    return p1
.end method

.method public final hashCode()I
    .locals 1

    .line 1
    iget-object v0, p0, Lk2/n;->a:Le1/o;

    .line 2
    .line 3
    invoke-virtual {v0}, Le1/o;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method
