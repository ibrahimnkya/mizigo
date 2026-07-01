.class public Le1/e;
.super LO0/a;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Le1/e;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final e:I

.field public final f:Le1/c;

.field public final g:Ljava/lang/Float;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Le1/G;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-direct {v0, v1}, Le1/G;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Le1/e;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(ILe1/c;Ljava/lang/Float;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz p3, :cond_0

    .line 7
    .line 8
    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/4 v3, 0x0

    .line 13
    cmpl-float v2, v2, v3

    .line 14
    .line 15
    if-lez v2, :cond_0

    .line 16
    .line 17
    move v2, v0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v2, v1

    .line 20
    :goto_0
    const/4 v3, 0x3

    .line 21
    if-ne p1, v3, :cond_2

    .line 22
    .line 23
    if-eqz p2, :cond_1

    .line 24
    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    :goto_1
    move p1, v3

    .line 28
    goto :goto_2

    .line 29
    :cond_1
    move v0, v1

    .line 30
    goto :goto_1

    .line 31
    :cond_2
    :goto_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v2, "Invalid Cap: type="

    .line 34
    .line 35
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v2, " bitmapDescriptor="

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v2, " bitmapRefWidth="

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-static {v1, v0}, LN0/n;->a(Ljava/lang/String;Z)V

    .line 62
    .line 63
    .line 64
    iput p1, p0, Le1/e;->e:I

    .line 65
    .line 66
    iput-object p2, p0, Le1/e;->f:Le1/c;

    .line 67
    .line 68
    iput-object p3, p0, Le1/e;->g:Ljava/lang/Float;

    .line 69
    .line 70
    return-void
.end method


# virtual methods
.method public final a()Le1/e;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iget v1, p0, Le1/e;->e:I

    .line 3
    .line 4
    if-eqz v1, :cond_5

    .line 5
    .line 6
    const/4 v2, 0x2

    .line 7
    const/4 v3, 0x1

    .line 8
    if-eq v1, v3, :cond_4

    .line 9
    .line 10
    if-eq v1, v2, :cond_3

    .line 11
    .line 12
    const/4 v2, 0x3

    .line 13
    if-eq v1, v2, :cond_0

    .line 14
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v2, "Unknown Cap type: "

    .line 18
    .line 19
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "e"

    .line 30
    .line 31
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_0
    iget-object v1, p0, Le1/e;->f:Le1/c;

    .line 36
    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    move v2, v3

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    move v2, v0

    .line 42
    :goto_0
    const-string v4, "bitmapDescriptor must not be null"

    .line 43
    .line 44
    invoke-static {v4, v2}, LN0/n;->g(Ljava/lang/String;Z)V

    .line 45
    .line 46
    .line 47
    iget-object v2, p0, Le1/e;->g:Ljava/lang/Float;

    .line 48
    .line 49
    if-eqz v2, :cond_2

    .line 50
    .line 51
    move v0, v3

    .line 52
    :cond_2
    const-string v3, "bitmapRefWidth must not be null"

    .line 53
    .line 54
    invoke-static {v3, v0}, LN0/n;->g(Ljava/lang/String;Z)V

    .line 55
    .line 56
    .line 57
    new-instance v0, Le1/h;

    .line 58
    .line 59
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    invoke-direct {v0, v1, v2}, Le1/h;-><init>(Le1/c;F)V

    .line 64
    .line 65
    .line 66
    return-object v0

    .line 67
    :cond_3
    new-instance v0, Le1/d;

    .line 68
    .line 69
    invoke-direct {v0, v3}, Le1/d;-><init>(I)V

    .line 70
    .line 71
    .line 72
    return-object v0

    .line 73
    :cond_4
    new-instance v0, Le1/d;

    .line 74
    .line 75
    invoke-direct {v0, v2}, Le1/d;-><init>(I)V

    .line 76
    .line 77
    .line 78
    return-object v0

    .line 79
    :cond_5
    new-instance v1, Le1/d;

    .line 80
    .line 81
    invoke-direct {v1, v0}, Le1/d;-><init>(I)V

    .line 82
    .line 83
    .line 84
    return-object v1
.end method

.method public final equals(Ljava/lang/Object;)Z
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
    instance-of v1, p1, Le1/e;

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
    check-cast p1, Le1/e;

    .line 12
    .line 13
    iget v1, p0, Le1/e;->e:I

    .line 14
    .line 15
    iget v3, p1, Le1/e;->e:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-object v1, p0, Le1/e;->f:Le1/c;

    .line 20
    .line 21
    iget-object v3, p1, Le1/e;->f:Le1/c;

    .line 22
    .line 23
    invoke-static {v1, v3}, LN0/n;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    iget-object v1, p0, Le1/e;->g:Ljava/lang/Float;

    .line 30
    .line 31
    iget-object p1, p1, Le1/e;->g:Ljava/lang/Float;

    .line 32
    .line 33
    invoke-static {v1, p1}, LN0/n;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_2

    .line 38
    .line 39
    return v0

    .line 40
    :cond_2
    return v2
.end method

.method public final hashCode()I
    .locals 3

    .line 1
    iget v0, p0, Le1/e;->e:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Le1/e;->f:Le1/c;

    .line 8
    .line 9
    iget-object v2, p0, Le1/e;->g:Ljava/lang/Float;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "[Cap: type="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Le1/e;->e:I

    .line 9
    .line 10
    const-string v2, "]"

    .line 11
    .line 12
    invoke-static {v0, v1, v2}, LE1/j;->l(Ljava/lang/StringBuilder;ILjava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    return-object v0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 3

    .line 1
    const/16 p2, 0x4f45

    .line 2
    .line 3
    invoke-static {p1, p2}, Landroid/support/v4/media/session/a;->Z(Landroid/os/Parcel;I)I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const/4 v0, 0x2

    .line 8
    const/4 v1, 0x4

    .line 9
    invoke-static {p1, v0, v1}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 10
    .line 11
    .line 12
    iget v0, p0, Le1/e;->e:I

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Le1/e;->f:Le1/c;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v0, v0, Le1/c;->a:LU0/a;

    .line 24
    .line 25
    invoke-interface {v0}, Landroid/os/IInterface;->asBinder()Landroid/os/IBinder;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    :goto_0
    const/4 v2, 0x3

    .line 30
    invoke-static {p1, v2, v0}, Landroid/support/v4/media/session/a;->R(Landroid/os/Parcel;ILandroid/os/IBinder;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Le1/e;->g:Ljava/lang/Float;

    .line 34
    .line 35
    invoke-static {p1, v1, v0}, Landroid/support/v4/media/session/a;->Q(Landroid/os/Parcel;ILjava/lang/Float;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p1, p2}, Landroid/support/v4/media/session/a;->b0(Landroid/os/Parcel;I)V

    .line 39
    .line 40
    .line 41
    return-void
.end method
