.class public final Le1/D;
.super LO0/a;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Le1/D;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public e:LZ0/q;

.field public f:Z

.field public g:F

.field public h:Z

.field public i:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Le1/G;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-direct {v0, v1}, Le1/G;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Le1/D;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Le1/D;->f:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Le1/D;->h:Z

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Le1/D;->i:F

    .line 11
    .line 12
    return-void
.end method


# virtual methods
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
    iget-object v0, p0, Le1/D;->e:LZ0/q;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-interface {v0}, Landroid/os/IInterface;->asBinder()Landroid/os/IBinder;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    :goto_0
    const/4 v1, 0x2

    .line 18
    invoke-static {p1, v1, v0}, Landroid/support/v4/media/session/a;->R(Landroid/os/Parcel;ILandroid/os/IBinder;)V

    .line 19
    .line 20
    .line 21
    iget-boolean v0, p0, Le1/D;->f:Z

    .line 22
    .line 23
    const/4 v1, 0x3

    .line 24
    const/4 v2, 0x4

    .line 25
    invoke-static {p1, v1, v2}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 29
    .line 30
    .line 31
    iget v0, p0, Le1/D;->g:F

    .line 32
    .line 33
    invoke-static {p1, v2, v2}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 37
    .line 38
    .line 39
    iget-boolean v0, p0, Le1/D;->h:Z

    .line 40
    .line 41
    const/4 v1, 0x5

    .line 42
    invoke-static {p1, v1, v2}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 46
    .line 47
    .line 48
    iget v0, p0, Le1/D;->i:F

    .line 49
    .line 50
    const/4 v1, 0x6

    .line 51
    invoke-static {p1, v1, v2}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 55
    .line 56
    .line 57
    invoke-static {p1, p2}, Landroid/support/v4/media/session/a;->b0(Landroid/os/Parcel;I)V

    .line 58
    .line 59
    .line 60
    return-void
.end method
