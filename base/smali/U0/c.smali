.class public final LU0/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LU0/f;


# instance fields
.field public final synthetic a:Landroid/os/Bundle;

.field public final synthetic b:Lc1/j;


# direct methods
.method public constructor <init>(Lc1/j;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LU0/c;->b:Lc1/j;

    .line 5
    .line 6
    iput-object p2, p0, LU0/c;->a:Landroid/os/Bundle;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 6

    .line 1
    iget-object v0, p0, LU0/c;->b:Lc1/j;

    .line 2
    .line 3
    iget-object v0, v0, Lc1/j;->a:LB2/a;

    .line 4
    .line 5
    iget-object v1, p0, LU0/c;->a:Landroid/os/Bundle;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    :try_start_0
    new-instance v2, Landroid/os/Bundle;

    .line 11
    .line 12
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {v1, v2}, Ld1/d;->E(Landroid/os/Bundle;Landroid/os/Bundle;)V

    .line 16
    .line 17
    .line 18
    iget-object v3, v0, LB2/a;->g:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v3, Ld1/h;

    .line 21
    .line 22
    invoke-virtual {v3}, LY0/a;->c()Landroid/os/Parcel;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    invoke-static {v4, v2}, LZ0/r;->c(Landroid/os/Parcel;Landroid/os/Parcelable;)V

    .line 27
    .line 28
    .line 29
    const/4 v5, 0x2

    .line 30
    invoke-virtual {v3, v4, v5}, LY0/a;->d(Landroid/os/Parcel;I)V

    .line 31
    .line 32
    .line 33
    invoke-static {v2, v1}, Ld1/d;->E(Landroid/os/Bundle;Landroid/os/Bundle;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v3}, LY0/a;->c()Landroid/os/Parcel;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    const/16 v2, 0x8

    .line 41
    .line 42
    invoke-virtual {v3, v1, v2}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-static {v2}, LU0/b;->e(Landroid/os/IBinder;)LU0/a;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 55
    .line 56
    .line 57
    invoke-static {v2}, LU0/b;->f(LU0/a;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    check-cast v1, Landroid/view/View;

    .line 62
    .line 63
    iput-object v1, v0, LB2/a;->h:Ljava/lang/Object;

    .line 64
    .line 65
    iget-object v1, v0, LB2/a;->f:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast v1, Landroid/view/ViewGroup;

    .line 68
    .line 69
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 70
    .line 71
    .line 72
    iget-object v0, v0, LB2/a;->h:Ljava/lang/Object;

    .line 73
    .line 74
    check-cast v0, Landroid/view/View;

    .line 75
    .line 76
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :catch_0
    move-exception v0

    .line 81
    new-instance v1, Le1/x;

    .line 82
    .line 83
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 84
    .line 85
    .line 86
    throw v1
.end method

.method public final b()I
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    return v0
.end method
