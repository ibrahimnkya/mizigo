.class public final Le1/H;
.super LW0/a;
.source "SourceFile"

# interfaces
.implements LZ0/q;


# static fields
.field public static final synthetic e:I


# instance fields
.field public final synthetic d:Le1/E;


# direct methods
.method public constructor <init>(Le1/D;Le1/E;)V
    .locals 0

    .line 1
    iput-object p2, p0, Le1/H;->d:Le1/E;

    .line 2
    .line 3
    const-string p1, "com.google.android.gms.maps.model.internal.ITileProviderDelegate"

    .line 4
    .line 5
    const/4 p2, 0x2

    .line 6
    invoke-direct {p0, p1, p2}, LW0/a;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final d(ILandroid/os/Parcel;Landroid/os/Parcel;)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-ne p1, v1, :cond_1

    .line 4
    .line 5
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    invoke-static {p2}, LZ0/r;->b(Landroid/os/Parcel;)V

    .line 18
    .line 19
    .line 20
    iget-object p2, p0, Le1/H;->d:Le1/E;

    .line 21
    .line 22
    invoke-interface {p2, p1, v2, v3}, Le1/E;->j(III)Le1/B;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 27
    .line 28
    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 32
    .line 33
    .line 34
    return v1

    .line 35
    :cond_0
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, p3, v1}, Le1/B;->writeToParcel(Landroid/os/Parcel;I)V

    .line 39
    .line 40
    .line 41
    return v1

    .line 42
    :cond_1
    return v0
.end method
