.class public final Ls3/q;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/HashMap;

.field public final b:Ljava/util/HashMap;

.field public final c:LZ2/s;

.field public d:LB2/a;

.field public final e:Landroid/content/res/AssetManager;

.field public final f:F

.field public final g:LN1/e;


# direct methods
.method public constructor <init>(LZ2/s;Landroid/content/res/AssetManager;F)V
    .locals 2

    .line 1
    new-instance v0, LN1/e;

    .line 2
    .line 3
    const/16 v1, 0x10

    .line 4
    .line 5
    invoke-direct {v0, v1}, LN1/e;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v1, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Ls3/q;->a:Ljava/util/HashMap;

    .line 17
    .line 18
    new-instance v1, Ljava/util/HashMap;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Ls3/q;->b:Ljava/util/HashMap;

    .line 24
    .line 25
    iput-object p1, p0, Ls3/q;->c:LZ2/s;

    .line 26
    .line 27
    iput-object p2, p0, Ls3/q;->e:Landroid/content/res/AssetManager;

    .line 28
    .line 29
    iput p3, p0, Ls3/q;->f:F

    .line 30
    .line 31
    iput-object v0, p0, Ls3/q;->g:LN1/e;

    .line 32
    .line 33
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
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_5

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ls3/e0;

    .line 16
    .line 17
    new-instance v1, Lio/flutter/plugin/editing/j;

    .line 18
    .line 19
    const/16 v2, 0x13

    .line 20
    .line 21
    invoke-direct {v1, v2}, Lio/flutter/plugin/editing/j;-><init>(I)V

    .line 22
    .line 23
    .line 24
    iget v2, p0, Ls3/q;->f:F

    .line 25
    .line 26
    iget-object v3, p0, Ls3/q;->g:LN1/e;

    .line 27
    .line 28
    iget-object v4, p0, Ls3/q;->e:Landroid/content/res/AssetManager;

    .line 29
    .line 30
    invoke-static {v0, v1, v4, v2, v3}, Landroid/support/v4/media/session/a;->u(Ls3/e0;Ls3/p;Landroid/content/res/AssetManager;FLN1/e;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    iget-object v1, v1, Lio/flutter/plugin/editing/j;->f:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v1, Le1/l;

    .line 37
    .line 38
    iget-object v3, p0, Ls3/q;->d:LB2/a;

    .line 39
    .line 40
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    :try_start_0
    iget-object v3, v3, LB2/a;->f:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v3, Ld1/g;

    .line 46
    .line 47
    invoke-virtual {v3}, LY0/a;->c()Landroid/os/Parcel;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-static {v4, v1}, LZ0/r;->c(Landroid/os/Parcel;Landroid/os/Parcelable;)V

    .line 52
    .line 53
    .line 54
    const/16 v1, 0xc

    .line 55
    .line 56
    invoke-virtual {v3, v4, v1}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v1}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    sget v4, LZ0/z;->d:I

    .line 65
    .line 66
    const-string v4, "com.google.android.gms.maps.model.internal.IGroundOverlayDelegate"

    .line 67
    .line 68
    const/4 v5, 0x1

    .line 69
    const/4 v6, 0x0

    .line 70
    if-nez v3, :cond_1

    .line 71
    .line 72
    move-object v7, v6

    .line 73
    goto :goto_1

    .line 74
    :cond_1
    invoke-interface {v3, v4}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 75
    .line 76
    .line 77
    move-result-object v7

    .line 78
    instance-of v8, v7, LZ0/A;

    .line 79
    .line 80
    if-eqz v8, :cond_2

    .line 81
    .line 82
    check-cast v7, LZ0/A;

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_2
    new-instance v7, LZ0/y;

    .line 86
    .line 87
    invoke-direct {v7, v3, v4, v5}, LY0/a;-><init>(Landroid/os/IBinder;Ljava/lang/String;I)V

    .line 88
    .line 89
    .line 90
    :goto_1
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 91
    .line 92
    .line 93
    if-eqz v7, :cond_3

    .line 94
    .line 95
    new-instance v6, Le1/k;

    .line 96
    .line 97
    invoke-direct {v6, v7}, Le1/k;-><init>(LZ0/A;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    .line 99
    .line 100
    goto :goto_2

    .line 101
    :catch_0
    move-exception p1

    .line 102
    goto :goto_4

    .line 103
    :cond_3
    :goto_2
    if-eqz v6, :cond_0

    .line 104
    .line 105
    new-instance v1, Ls3/o;

    .line 106
    .line 107
    iget-object v0, v0, Ls3/e0;->d:Ls3/k0;

    .line 108
    .line 109
    if-eqz v0, :cond_4

    .line 110
    .line 111
    goto :goto_3

    .line 112
    :cond_4
    const/4 v5, 0x0

    .line 113
    :goto_3
    invoke-direct {v1, v6, v5}, Ls3/o;-><init>(Le1/k;Z)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Ls3/q;->a:Ljava/util/HashMap;

    .line 117
    .line 118
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Ls3/q;->b:Ljava/util/HashMap;

    .line 122
    .line 123
    invoke-virtual {v6}, Le1/k;->b()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    goto :goto_0

    .line 131
    :goto_4
    new-instance v0, Le1/x;

    .line 132
    .line 133
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 134
    .line 135
    .line 136
    throw v0

    .line 137
    :cond_5
    return-void
.end method
