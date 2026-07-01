.class public final Ls3/d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/HashMap;

.field public final b:Ljava/util/HashMap;

.field public final c:LZ2/s;

.field public final d:F

.field public e:LB2/a;


# direct methods
.method public constructor <init>(LZ2/s;FI)V
    .locals 0

    .line 1
    packed-switch p3, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    new-instance p3, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p3, p0, Ls3/d;->a:Ljava/util/HashMap;

    .line 13
    .line 14
    new-instance p3, Ljava/util/HashMap;

    .line 15
    .line 16
    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p3, p0, Ls3/d;->b:Ljava/util/HashMap;

    .line 20
    .line 21
    iput-object p1, p0, Ls3/d;->c:LZ2/s;

    .line 22
    .line 23
    iput p2, p0, Ls3/d;->d:F

    .line 24
    .line 25
    return-void

    .line 26
    :pswitch_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    .line 28
    .line 29
    new-instance p3, Ljava/util/HashMap;

    .line 30
    .line 31
    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object p3, p0, Ls3/d;->a:Ljava/util/HashMap;

    .line 35
    .line 36
    new-instance p3, Ljava/util/HashMap;

    .line 37
    .line 38
    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object p3, p0, Ls3/d;->b:Ljava/util/HashMap;

    .line 42
    .line 43
    iput-object p1, p0, Ls3/d;->c:LZ2/s;

    .line 44
    .line 45
    iput p2, p0, Ls3/d;->d:F

    .line 46
    .line 47
    return-void

    .line 48
    nop

    .line 49
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public a(Ljava/util/List;)V
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
    check-cast v0, Ls3/Y;

    .line 16
    .line 17
    new-instance v1, Ls3/a;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    iget v3, p0, Ls3/d;->d:F

    .line 21
    .line 22
    invoke-direct {v1, v3, v2}, Ls3/a;-><init>(FI)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v1}, Landroid/support/v4/media/session/a;->t(Ls3/Y;Ls3/c;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v2, v1, Ls3/a;->d:LO0/a;

    .line 30
    .line 31
    check-cast v2, Le1/g;

    .line 32
    .line 33
    iget-boolean v1, v1, Ls3/a;->c:Z

    .line 34
    .line 35
    iget-object v4, p0, Ls3/d;->e:LB2/a;

    .line 36
    .line 37
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    :try_start_0
    new-instance v5, Le1/f;

    .line 41
    .line 42
    iget-object v4, v4, LB2/a;->f:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v4, Ld1/g;

    .line 45
    .line 46
    invoke-virtual {v4}, LY0/a;->c()Landroid/os/Parcel;

    .line 47
    .line 48
    .line 49
    move-result-object v6

    .line 50
    invoke-static {v6, v2}, LZ0/r;->c(Landroid/os/Parcel;Landroid/os/Parcelable;)V

    .line 51
    .line 52
    .line 53
    const/16 v2, 0x23

    .line 54
    .line 55
    invoke-virtual {v4, v6, v2}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    sget v6, LZ0/w;->d:I

    .line 64
    .line 65
    const-string v6, "com.google.android.gms.maps.model.internal.ICircleDelegate"

    .line 66
    .line 67
    if-nez v4, :cond_0

    .line 68
    .line 69
    const/4 v4, 0x0

    .line 70
    goto :goto_1

    .line 71
    :cond_0
    invoke-interface {v4, v6}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 72
    .line 73
    .line 74
    move-result-object v7

    .line 75
    instance-of v8, v7, LZ0/x;

    .line 76
    .line 77
    if-eqz v8, :cond_1

    .line 78
    .line 79
    move-object v4, v7

    .line 80
    check-cast v4, LZ0/x;

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_1
    new-instance v7, LZ0/v;

    .line 84
    .line 85
    const/4 v8, 0x1

    .line 86
    invoke-direct {v7, v4, v6, v8}, LY0/a;-><init>(Landroid/os/IBinder;Ljava/lang/String;I)V

    .line 87
    .line 88
    .line 89
    move-object v4, v7

    .line 90
    :goto_1
    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V

    .line 91
    .line 92
    .line 93
    invoke-direct {v5, v4}, Le1/f;-><init>(LZ0/x;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 94
    .line 95
    .line 96
    new-instance v2, Ls3/b;

    .line 97
    .line 98
    invoke-direct {v2, v5, v1, v3}, Ls3/b;-><init>(Le1/f;ZF)V

    .line 99
    .line 100
    .line 101
    iget-object v1, p0, Ls3/d;->a:Ljava/util/HashMap;

    .line 102
    .line 103
    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    iget-object v1, p0, Ls3/d;->b:Ljava/util/HashMap;

    .line 107
    .line 108
    invoke-virtual {v5}, Le1/f;->a()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    goto :goto_0

    .line 116
    :catch_0
    move-exception p1

    .line 117
    new-instance v0, Le1/x;

    .line 118
    .line 119
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 120
    .line 121
    .line 122
    throw v0

    .line 123
    :cond_2
    return-void
.end method

.method public b(Ljava/util/List;)V
    .locals 10

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
    check-cast v0, Ls3/v0;

    .line 16
    .line 17
    new-instance v1, Ls3/a;

    .line 18
    .line 19
    iget v2, p0, Ls3/d;->d:F

    .line 20
    .line 21
    const/4 v3, 0x1

    .line 22
    invoke-direct {v1, v2, v3}, Ls3/a;-><init>(FI)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v1}, Landroid/support/v4/media/session/a;->y(Ls3/v0;Ls3/F0;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v4, v1, Ls3/a;->d:LO0/a;

    .line 30
    .line 31
    check-cast v4, Le1/u;

    .line 32
    .line 33
    iget-boolean v1, v1, Ls3/a;->c:Z

    .line 34
    .line 35
    iget-object v5, p0, Ls3/d;->e:LB2/a;

    .line 36
    .line 37
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    :try_start_0
    const-string v6, "PolygonOptions must not be null"

    .line 41
    .line 42
    invoke-static {v4, v6}, LN0/n;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    new-instance v6, Le1/t;

    .line 46
    .line 47
    iget-object v5, v5, LB2/a;->f:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast v5, Ld1/g;

    .line 50
    .line 51
    invoke-virtual {v5}, LY0/a;->c()Landroid/os/Parcel;

    .line 52
    .line 53
    .line 54
    move-result-object v7

    .line 55
    invoke-static {v7, v4}, LZ0/r;->c(Landroid/os/Parcel;Landroid/os/Parcelable;)V

    .line 56
    .line 57
    .line 58
    const/16 v4, 0xa

    .line 59
    .line 60
    invoke-virtual {v5, v7, v4}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-virtual {v4}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    sget v7, LZ0/h;->d:I

    .line 69
    .line 70
    const-string v7, "com.google.android.gms.maps.model.internal.IPolygonDelegate"

    .line 71
    .line 72
    if-nez v5, :cond_0

    .line 73
    .line 74
    const/4 v3, 0x0

    .line 75
    goto :goto_1

    .line 76
    :cond_0
    invoke-interface {v5, v7}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 77
    .line 78
    .line 79
    move-result-object v8

    .line 80
    instance-of v9, v8, LZ0/i;

    .line 81
    .line 82
    if-eqz v9, :cond_1

    .line 83
    .line 84
    move-object v3, v8

    .line 85
    check-cast v3, LZ0/i;

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_1
    new-instance v8, LZ0/g;

    .line 89
    .line 90
    invoke-direct {v8, v5, v7, v3}, LY0/a;-><init>(Landroid/os/IBinder;Ljava/lang/String;I)V

    .line 91
    .line 92
    .line 93
    move-object v3, v8

    .line 94
    :goto_1
    invoke-virtual {v4}, Landroid/os/Parcel;->recycle()V

    .line 95
    .line 96
    .line 97
    invoke-direct {v6, v3}, Le1/t;-><init>(LZ0/i;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    .line 99
    .line 100
    new-instance v3, Ls3/E0;

    .line 101
    .line 102
    invoke-direct {v3, v6, v1, v2}, Ls3/E0;-><init>(Le1/t;ZF)V

    .line 103
    .line 104
    .line 105
    iget-object v1, p0, Ls3/d;->a:Ljava/util/HashMap;

    .line 106
    .line 107
    invoke-virtual {v1, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    iget-object v1, p0, Ls3/d;->b:Ljava/util/HashMap;

    .line 111
    .line 112
    invoke-virtual {v6}, Le1/t;->a()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    goto :goto_0

    .line 120
    :catch_0
    move-exception p1

    .line 121
    new-instance v0, Le1/x;

    .line 122
    .line 123
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 124
    .line 125
    .line 126
    throw v0

    .line 127
    :cond_2
    return-void
.end method
