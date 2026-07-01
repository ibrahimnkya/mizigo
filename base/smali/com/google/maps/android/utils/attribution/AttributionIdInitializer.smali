.class public final Lcom/google/maps/android/utils/attribution/AttributionIdInitializer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LZ/b;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LZ/b;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a()Ljava/util/List;
    .locals 1

    .line 1
    sget-object v0, Lz3/l;->e:Lz3/l;

    .line 2
    .line 3
    return-object v0
.end method

.method public final b(Landroid/content/Context;)Ljava/lang/Object;
    .locals 3

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    new-instance v0, Lc1/k;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Lc1/k;-><init>(Landroid/content/Context;)V

    .line 9
    .line 10
    .line 11
    sget-object v1, Ld1/e;->b:Ld1/f;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    sget-object v0, Ld1/e;->b:Ld1/f;

    .line 16
    .line 17
    new-instance v1, LU0/b;

    .line 18
    .line 19
    invoke-direct {v1, p1}, LU0/b;-><init>(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    const-string p1, "gmp_git_androidmapsutils_v4.1.0"

    .line 23
    .line 24
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-static {v2, v1}, LZ0/r;->d(Landroid/os/Parcel;Landroid/os/IInterface;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const/16 p1, 0xc

    .line 35
    .line 36
    invoke-virtual {v0, v2, p1}, LY0/a;->d(Landroid/os/Parcel;I)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    sget-object p1, Ld1/e;->c:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catch_0
    move-exception p1

    .line 47
    const-string v0, "a"

    .line 48
    .line 49
    const-string v1, "Failed to add internal usage attribution id."

    .line 50
    .line 51
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 52
    .line 53
    .line 54
    :goto_0
    sget-object p1, Ly3/h;->a:Ly3/h;

    .line 55
    .line 56
    return-object p1
.end method
