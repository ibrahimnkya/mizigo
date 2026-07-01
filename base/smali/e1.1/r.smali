.class public final Le1/r;
.super LO0/a;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Le1/r;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public e:Ljava/lang/String;

.field public f:Le1/c;

.field public g:I

.field public h:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Le1/G;

    .line 2
    .line 3
    const/4 v1, 0x6

    .line 4
    invoke-direct {v0, v1}, Le1/G;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Le1/r;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, -0x1000000

    .line 2
    iput v0, p0, Le1/r;->h:I

    iput p1, p0, Le1/r;->g:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, -0x4cebee

    .line 4
    iput v0, p0, Le1/r;->g:I

    iput-object p1, p0, Le1/r;->e:Ljava/lang/String;

    iput p2, p0, Le1/r;->h:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Le1/r;

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
    check-cast p1, Le1/r;

    .line 12
    .line 13
    iget v1, p0, Le1/r;->g:I

    .line 14
    .line 15
    iget v3, p1, Le1/r;->g:I

    .line 16
    .line 17
    iget-object v4, p1, Le1/r;->f:Le1/c;

    .line 18
    .line 19
    if-ne v1, v3, :cond_7

    .line 20
    .line 21
    iget-object v1, p0, Le1/r;->e:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v3, p1, Le1/r;->e:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v1, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_7

    .line 30
    .line 31
    iget v1, p0, Le1/r;->h:I

    .line 32
    .line 33
    iget p1, p1, Le1/r;->h:I

    .line 34
    .line 35
    if-eq v1, p1, :cond_2

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    iget-object p1, p0, Le1/r;->f:Le1/c;

    .line 39
    .line 40
    if-nez p1, :cond_3

    .line 41
    .line 42
    if-nez v4, :cond_4

    .line 43
    .line 44
    :cond_3
    if-eqz p1, :cond_5

    .line 45
    .line 46
    if-nez v4, :cond_5

    .line 47
    .line 48
    :cond_4
    return v2

    .line 49
    :cond_5
    if-eqz p1, :cond_6

    .line 50
    .line 51
    if-eqz v4, :cond_6

    .line 52
    .line 53
    iget-object p1, p1, Le1/c;->a:LU0/a;

    .line 54
    .line 55
    invoke-static {p1}, LU0/b;->f(LU0/a;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iget-object v0, v4, Le1/c;->a:LU0/a;

    .line 60
    .line 61
    invoke-static {v0}, LU0/b;->f(LU0/a;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {p1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    return p1

    .line 70
    :cond_6
    return v0

    .line 71
    :cond_7
    :goto_0
    return v2
.end method

.method public final hashCode()I
    .locals 3

    .line 1
    iget-object v0, p0, Le1/r;->e:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Le1/r;->f:Le1/c;

    .line 4
    .line 5
    iget v2, p0, Le1/r;->g:I

    .line 6
    .line 7
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    filled-new-array {v0, v1, v2}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    return v0
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
    iget-object v1, p0, Le1/r;->e:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p1, v0, v1}, Landroid/support/v4/media/session/a;->U(Landroid/os/Parcel;ILjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Le1/r;->f:Le1/c;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v0, v0, Le1/c;->a:LU0/a;

    .line 20
    .line 21
    invoke-interface {v0}, Landroid/os/IInterface;->asBinder()Landroid/os/IBinder;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :goto_0
    const/4 v1, 0x3

    .line 26
    invoke-static {p1, v1, v0}, Landroid/support/v4/media/session/a;->R(Landroid/os/Parcel;ILandroid/os/IBinder;)V

    .line 27
    .line 28
    .line 29
    iget v0, p0, Le1/r;->g:I

    .line 30
    .line 31
    const/4 v1, 0x4

    .line 32
    invoke-static {p1, v1, v1}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 36
    .line 37
    .line 38
    iget v0, p0, Le1/r;->h:I

    .line 39
    .line 40
    const/4 v2, 0x5

    .line 41
    invoke-static {p1, v2, v1}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 45
    .line 46
    .line 47
    invoke-static {p1, p2}, Landroid/support/v4/media/session/a;->b0(Landroid/os/Parcel;I)V

    .line 48
    .line 49
    .line 50
    return-void
.end method
