.class public final Ls3/E0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ls3/F0;


# instance fields
.field public final a:Le1/t;

.field public final b:Ljava/lang/String;

.field public final c:F


# direct methods
.method public constructor <init>(Le1/t;ZF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ls3/E0;->a:Le1/t;

    .line 5
    .line 6
    iput p3, p0, Ls3/E0;->c:F

    .line 7
    .line 8
    invoke-virtual {p1}, Le1/t;->a()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ls3/E0;->b:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final a(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Ls3/E0;->a:Le1/t;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v0, v0, Le1/t;->a:LZ0/i;

    .line 7
    .line 8
    check-cast v0, LZ0/g;

    .line 9
    .line 10
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeFloat(F)V

    .line 15
    .line 16
    .line 17
    const/16 p1, 0xd

    .line 18
    .line 19
    invoke-virtual {v0, v1, p1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :catch_0
    move-exception p1

    .line 24
    new-instance v0, Le1/x;

    .line 25
    .line 26
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    throw v0
.end method

.method public final b(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ls3/E0;->a:Le1/t;

    .line 2
    .line 3
    :try_start_0
    iget-object v0, v0, Le1/t;->a:LZ0/i;

    .line 4
    .line 5
    check-cast v0, LZ0/g;

    .line 6
    .line 7
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sget v2, LZ0/r;->a:I

    .line 12
    .line 13
    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 14
    .line 15
    .line 16
    const/16 p1, 0x15

    .line 17
    .line 18
    invoke-virtual {v0, v1, p1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :catch_0
    move-exception p1

    .line 23
    new-instance v0, Le1/x;

    .line 24
    .line 25
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    throw v0
.end method

.method public final c(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ls3/E0;->a:Le1/t;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v0, v0, Le1/t;->a:LZ0/i;

    .line 7
    .line 8
    check-cast v0, LZ0/g;

    .line 9
    .line 10
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 15
    .line 16
    .line 17
    const/16 p1, 0x9

    .line 18
    .line 19
    invoke-virtual {v0, v1, p1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :catch_0
    move-exception p1

    .line 24
    new-instance v0, Le1/x;

    .line 25
    .line 26
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    throw v0
.end method

.method public final d(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ls3/E0;->a:Le1/t;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v0, v0, Le1/t;->a:LZ0/i;

    .line 7
    .line 8
    check-cast v0, LZ0/g;

    .line 9
    .line 10
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sget v2, LZ0/r;->a:I

    .line 15
    .line 16
    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 17
    .line 18
    .line 19
    const/16 p1, 0x11

    .line 20
    .line 21
    invoke-virtual {v0, v1, p1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catch_0
    move-exception p1

    .line 26
    new-instance v0, Le1/x;

    .line 27
    .line 28
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    throw v0
.end method

.method public final e(Ljava/util/ArrayList;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ls3/E0;->a:Le1/t;

    .line 2
    .line 3
    :try_start_0
    iget-object v0, v0, Le1/t;->a:LZ0/i;

    .line 4
    .line 5
    check-cast v0, LZ0/g;

    .line 6
    .line 7
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x3

    .line 15
    invoke-virtual {v0, v1, p1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catch_0
    move-exception p1

    .line 20
    new-instance v0, Le1/x;

    .line 21
    .line 22
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    throw v0
.end method

.method public final f(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ls3/E0;->a:Le1/t;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v0, v0, Le1/t;->a:LZ0/i;

    .line 7
    .line 8
    check-cast v0, LZ0/g;

    .line 9
    .line 10
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 15
    .line 16
    .line 17
    const/16 p1, 0xb

    .line 18
    .line 19
    invoke-virtual {v0, v1, p1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :catch_0
    move-exception p1

    .line 24
    new-instance v0, Le1/x;

    .line 25
    .line 26
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    throw v0
.end method

.method public final g(F)V
    .locals 2

    .line 1
    iget v0, p0, Ls3/E0;->c:F

    .line 2
    .line 3
    mul-float/2addr p1, v0

    .line 4
    iget-object v0, p0, Ls3/E0;->a:Le1/t;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    :try_start_0
    iget-object v0, v0, Le1/t;->a:LZ0/i;

    .line 10
    .line 11
    check-cast v0, LZ0/g;

    .line 12
    .line 13
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeFloat(F)V

    .line 18
    .line 19
    .line 20
    const/4 p1, 0x7

    .line 21
    invoke-virtual {v0, v1, p1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catch_0
    move-exception p1

    .line 26
    new-instance v0, Le1/x;

    .line 27
    .line 28
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    throw v0
.end method

.method public final l(Ljava/util/ArrayList;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ls3/E0;->a:Le1/t;

    .line 2
    .line 3
    :try_start_0
    iget-object v0, v0, Le1/t;->a:LZ0/i;

    .line 4
    .line 5
    check-cast v0, LZ0/g;

    .line 6
    .line 7
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeList(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x5

    .line 15
    invoke-virtual {v0, v1, p1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catch_0
    move-exception p1

    .line 20
    new-instance v0, Le1/x;

    .line 21
    .line 22
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    throw v0
.end method

.method public final setVisible(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ls3/E0;->a:Le1/t;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v0, v0, Le1/t;->a:LZ0/i;

    .line 7
    .line 8
    check-cast v0, LZ0/g;

    .line 9
    .line 10
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sget v2, LZ0/r;->a:I

    .line 15
    .line 16
    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 17
    .line 18
    .line 19
    const/16 p1, 0xf

    .line 20
    .line 21
    invoke-virtual {v0, v1, p1}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catch_0
    move-exception p1

    .line 26
    new-instance v0, Le1/x;

    .line 27
    .line 28
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    throw v0
.end method
