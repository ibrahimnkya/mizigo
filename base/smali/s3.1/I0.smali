.class public final Ls3/I0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/HashMap;

.field public final b:Ljava/util/HashMap;

.field public final c:LZ2/s;

.field public d:LB2/a;

.field public final e:F

.field public final f:Landroid/content/res/AssetManager;


# direct methods
.method public constructor <init>(LZ2/s;Landroid/content/res/AssetManager;F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ls3/I0;->f:Landroid/content/res/AssetManager;

    .line 5
    .line 6
    new-instance p2, Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p2, p0, Ls3/I0;->a:Ljava/util/HashMap;

    .line 12
    .line 13
    new-instance p2, Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p2, p0, Ls3/I0;->b:Ljava/util/HashMap;

    .line 19
    .line 20
    iput-object p1, p0, Ls3/I0;->c:LZ2/s;

    .line 21
    .line 22
    iput p3, p0, Ls3/I0;->e:F

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final a(Ljava/util/List;)V
    .locals 9

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ls3/w0;

    .line 16
    .line 17
    new-instance v1, Ls3/a;

    .line 18
    .line 19
    const/4 v2, 0x2

    .line 20
    iget v3, p0, Ls3/I0;->e:F

    .line 21
    .line 22
    invoke-direct {v1, v3, v2}, Ls3/a;-><init>(FI)V

    .line 23
    .line 24
    .line 25
    iget-object v2, p0, Ls3/I0;->f:Landroid/content/res/AssetManager;

    .line 26
    .line 27
    invoke-static {v0, v1, v2, v3}, Landroid/support/v4/media/session/a;->z(Ls3/w0;Ls3/H0;Landroid/content/res/AssetManager;F)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v2, v1, Ls3/a;->d:LO0/a;

    .line 32
    .line 33
    check-cast v2, Le1/w;

    .line 34
    .line 35
    iget-boolean v1, v1, Ls3/a;->c:Z

    .line 36
    .line 37
    iget-object v4, p0, Ls3/I0;->d:LB2/a;

    .line 38
    .line 39
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    :try_start_0
    const-string v5, "PolylineOptions must not be null"

    .line 43
    .line 44
    invoke-static {v2, v5}, LN0/n;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    new-instance v5, Le1/v;

    .line 48
    .line 49
    iget-object v4, v4, LB2/a;->f:Ljava/lang/Object;

    .line 50
    .line 51
    check-cast v4, Ld1/g;

    .line 52
    .line 53
    invoke-virtual {v4}, LY0/a;->c()Landroid/os/Parcel;

    .line 54
    .line 55
    .line 56
    move-result-object v6

    .line 57
    invoke-static {v6, v2}, LZ0/r;->c(Landroid/os/Parcel;Landroid/os/Parcelable;)V

    .line 58
    .line 59
    .line 60
    const/16 v2, 0x9

    .line 61
    .line 62
    invoke-virtual {v4, v6, v2}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    sget v6, LZ0/k;->d:I

    .line 71
    .line 72
    const-string v6, "com.google.android.gms.maps.model.internal.IPolylineDelegate"

    .line 73
    .line 74
    if-nez v4, :cond_0

    .line 75
    .line 76
    const/4 v4, 0x0

    .line 77
    goto :goto_1

    .line 78
    :cond_0
    invoke-interface {v4, v6}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    instance-of v8, v7, LZ0/l;

    .line 83
    .line 84
    if-eqz v8, :cond_1

    .line 85
    .line 86
    move-object v4, v7

    .line 87
    check-cast v4, LZ0/l;

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_1
    new-instance v7, LZ0/j;

    .line 91
    .line 92
    const/4 v8, 0x1

    .line 93
    invoke-direct {v7, v4, v6, v8}, LY0/a;-><init>(Landroid/os/IBinder;Ljava/lang/String;I)V

    .line 94
    .line 95
    .line 96
    move-object v4, v7

    .line 97
    :goto_1
    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V

    .line 98
    .line 99
    .line 100
    invoke-direct {v5, v4}, Le1/v;-><init>(LZ0/l;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    .line 102
    .line 103
    new-instance v2, Ls3/G0;

    .line 104
    .line 105
    invoke-direct {v2, v5, v1, v3}, Ls3/G0;-><init>(Le1/v;ZF)V

    .line 106
    .line 107
    .line 108
    iget-object v1, p0, Ls3/I0;->a:Ljava/util/HashMap;

    .line 109
    .line 110
    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    iget-object v1, p0, Ls3/I0;->b:Ljava/util/HashMap;

    .line 114
    .line 115
    invoke-virtual {v5}, Le1/v;->a()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    goto :goto_0

    .line 123
    :catch_0
    move-exception p1

    .line 124
    new-instance v0, Le1/x;

    .line 125
    .line 126
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 127
    .line 128
    .line 129
    throw v0

    .line 130
    :cond_2
    return-void
.end method
