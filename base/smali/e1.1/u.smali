.class public final Le1/u;
.super LO0/a;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Le1/u;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final e:Ljava/util/List;

.field public final f:Ljava/util/ArrayList;

.field public g:F

.field public h:I

.field public i:I

.field public j:F

.field public k:Z

.field public l:Z

.field public m:Z

.field public final n:I

.field public final o:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Le1/I;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Le1/I;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Le1/u;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x41200000    # 10.0f

    .line 2
    iput v0, p0, Le1/u;->g:F

    const/high16 v0, -0x1000000

    iput v0, p0, Le1/u;->h:I

    const/4 v0, 0x0

    iput v0, p0, Le1/u;->i:I

    const/4 v1, 0x0

    iput v1, p0, Le1/u;->j:F

    const/4 v1, 0x1

    iput-boolean v1, p0, Le1/u;->k:Z

    iput-boolean v0, p0, Le1/u;->l:Z

    iput-boolean v0, p0, Le1/u;->m:Z

    iput v0, p0, Le1/u;->n:I

    const/4 v0, 0x0

    iput-object v0, p0, Le1/u;->o:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le1/u;->e:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    .line 4
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le1/u;->f:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;Ljava/util/ArrayList;FIIFZZZILjava/util/ArrayList;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    iput-object p1, p0, Le1/u;->e:Ljava/util/List;

    iput-object p2, p0, Le1/u;->f:Ljava/util/ArrayList;

    iput p3, p0, Le1/u;->g:F

    iput p4, p0, Le1/u;->h:I

    iput p5, p0, Le1/u;->i:I

    iput p6, p0, Le1/u;->j:F

    iput-boolean p7, p0, Le1/u;->k:Z

    iput-boolean p8, p0, Le1/u;->l:Z

    iput-boolean p9, p0, Le1/u;->m:Z

    iput p10, p0, Le1/u;->n:I

    iput-object p11, p0, Le1/u;->o:Ljava/util/List;

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
    const/4 v0, 0x2

    .line 8
    iget-object v1, p0, Le1/u;->e:Ljava/util/List;

    .line 9
    .line 10
    invoke-static {p1, v0, v1}, Landroid/support/v4/media/session/a;->W(Landroid/os/Parcel;ILjava/util/List;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Le1/u;->f:Ljava/util/ArrayList;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v1, 0x3

    .line 19
    invoke-static {p1, v1}, Landroid/support/v4/media/session/a;->Z(Landroid/os/Parcel;I)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeList(Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1, v1}, Landroid/support/v4/media/session/a;->b0(Landroid/os/Parcel;I)V

    .line 27
    .line 28
    .line 29
    :goto_0
    iget v0, p0, Le1/u;->g:F

    .line 30
    .line 31
    const/4 v1, 0x4

    .line 32
    invoke-static {p1, v1, v1}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 36
    .line 37
    .line 38
    iget v0, p0, Le1/u;->h:I

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
    iget v0, p0, Le1/u;->i:I

    .line 48
    .line 49
    const/4 v2, 0x6

    .line 50
    invoke-static {p1, v2, v1}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 54
    .line 55
    .line 56
    iget v0, p0, Le1/u;->j:F

    .line 57
    .line 58
    const/4 v2, 0x7

    .line 59
    invoke-static {p1, v2, v1}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 63
    .line 64
    .line 65
    iget-boolean v0, p0, Le1/u;->k:Z

    .line 66
    .line 67
    const/16 v2, 0x8

    .line 68
    .line 69
    invoke-static {p1, v2, v1}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 73
    .line 74
    .line 75
    iget-boolean v0, p0, Le1/u;->l:Z

    .line 76
    .line 77
    const/16 v2, 0x9

    .line 78
    .line 79
    invoke-static {p1, v2, v1}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 83
    .line 84
    .line 85
    iget-boolean v0, p0, Le1/u;->m:Z

    .line 86
    .line 87
    const/16 v2, 0xa

    .line 88
    .line 89
    invoke-static {p1, v2, v1}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 93
    .line 94
    .line 95
    const/16 v0, 0xb

    .line 96
    .line 97
    invoke-static {p1, v0, v1}, Landroid/support/v4/media/session/a;->Y(Landroid/os/Parcel;II)V

    .line 98
    .line 99
    .line 100
    iget v0, p0, Le1/u;->n:I

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 103
    .line 104
    .line 105
    const/16 v0, 0xc

    .line 106
    .line 107
    iget-object v1, p0, Le1/u;->o:Ljava/util/List;

    .line 108
    .line 109
    invoke-static {p1, v0, v1}, Landroid/support/v4/media/session/a;->W(Landroid/os/Parcel;ILjava/util/List;)V

    .line 110
    .line 111
    .line 112
    invoke-static {p1, p2}, Landroid/support/v4/media/session/a;->b0(Landroid/os/Parcel;I)V

    .line 113
    .line 114
    .line 115
    return-void
.end method
