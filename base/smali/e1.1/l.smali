.class public final Le1/l;
.super LO0/a;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Le1/l;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public e:Le1/c;

.field public f:Lcom/google/android/gms/maps/model/LatLng;

.field public g:F

.field public h:F

.field public i:Lcom/google/android/gms/maps/model/LatLngBounds;

.field public j:F

.field public k:F

.field public l:Z

.field public m:F

.field public n:F

.field public o:F

.field public p:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Le1/G;

    .line 2
    .line 3
    const/4 v1, 0x7

    .line 4
    invoke-direct {v0, v1}, Le1/G;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Le1/l;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 4

    .line 1
    const/16 v0, 0x4f45

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/support/v4/media/session/a;->Z(Landroid/os/Parcel;I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Le1/l;->e:Le1/c;

    .line 8
    .line 9
    iget-object v1, v1, Le1/c;->a:LU0/a;

    .line 10
    .line 11
    invoke-interface {v1}, Landroid/os/IInterface;->asBinder()Landroid/os/IBinder;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/4 v2, 0x2

    .line 16
    invoke-static {p1, v2, v1}, Landroid/support/v4/media/session/a;->R(Landroid/os/Parcel;ILandroid/os/IBinder;)V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x3

    .line 20
    iget-object v2, p0, Le1/l;->f:Lcom/google/android/gms/maps/model/LatLng;

    .line 21
    .line 22
    invoke-static {p1, v1, v2, p2}, Landroid/support/v4/media/session/a;->T(Landroid/os/Parcel;ILandroid/os/Parcelable;I)V

    .line 23
    .line 24
    .line 25
    iget v1, p0, Le1/l;->g:F

    .line 26
    .line 27
    const/4 v2, 0x4

    .line 28
    invoke-static {p1, v2, v2}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeFloat(F)V

    .line 32
    .line 33
    .line 34
    iget v1, p0, Le1/l;->h:F

    .line 35
    .line 36
    const/4 v3, 0x5

    .line 37
    invoke-static {p1, v3, v2}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeFloat(F)V

    .line 41
    .line 42
    .line 43
    const/4 v1, 0x6

    .line 44
    iget-object v3, p0, Le1/l;->i:Lcom/google/android/gms/maps/model/LatLngBounds;

    .line 45
    .line 46
    invoke-static {p1, v1, v3, p2}, Landroid/support/v4/media/session/a;->T(Landroid/os/Parcel;ILandroid/os/Parcelable;I)V

    .line 47
    .line 48
    .line 49
    iget p2, p0, Le1/l;->j:F

    .line 50
    .line 51
    const/4 v1, 0x7

    .line 52
    invoke-static {p1, v1, v2}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    .line 56
    .line 57
    .line 58
    iget p2, p0, Le1/l;->k:F

    .line 59
    .line 60
    const/16 v1, 0x8

    .line 61
    .line 62
    invoke-static {p1, v1, v2}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    .line 66
    .line 67
    .line 68
    iget-boolean p2, p0, Le1/l;->l:Z

    .line 69
    .line 70
    const/16 v1, 0x9

    .line 71
    .line 72
    invoke-static {p1, v1, v2}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 76
    .line 77
    .line 78
    iget p2, p0, Le1/l;->m:F

    .line 79
    .line 80
    const/16 v1, 0xa

    .line 81
    .line 82
    invoke-static {p1, v1, v2}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    .line 86
    .line 87
    .line 88
    iget p2, p0, Le1/l;->n:F

    .line 89
    .line 90
    const/16 v1, 0xb

    .line 91
    .line 92
    invoke-static {p1, v1, v2}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    .line 96
    .line 97
    .line 98
    iget p2, p0, Le1/l;->o:F

    .line 99
    .line 100
    const/16 v1, 0xc

    .line 101
    .line 102
    invoke-static {p1, v1, v2}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    .line 106
    .line 107
    .line 108
    iget-boolean p2, p0, Le1/l;->p:Z

    .line 109
    .line 110
    const/16 v1, 0xd

    .line 111
    .line 112
    invoke-static {p1, v1, v2}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 116
    .line 117
    .line 118
    invoke-static {p1, v0}, Landroid/support/v4/media/session/a;->b0(Landroid/os/Parcel;I)V

    .line 119
    .line 120
    .line 121
    return-void
.end method
