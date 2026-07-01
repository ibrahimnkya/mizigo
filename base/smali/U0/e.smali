.class public final LU0/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LU0/f;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lc1/j;


# direct methods
.method public synthetic constructor <init>(Lc1/j;I)V
    .locals 0

    .line 1
    iput p2, p0, LU0/e;->a:I

    iput-object p1, p0, LU0/e;->b:Lc1/j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 3

    .line 1
    iget v0, p0, LU0/e;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LU0/e;->b:Lc1/j;

    .line 7
    .line 8
    iget-object v0, v0, Lc1/j;->a:LB2/a;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    :try_start_0
    iget-object v0, v0, LB2/a;->g:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, Ld1/h;

    .line 16
    .line 17
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const/4 v2, 0x3

    .line 22
    invoke-virtual {v0, v1, v2}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :catch_0
    move-exception v0

    .line 27
    new-instance v1, Le1/x;

    .line 28
    .line 29
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    throw v1

    .line 33
    :pswitch_0
    iget-object v0, p0, LU0/e;->b:Lc1/j;

    .line 34
    .line 35
    iget-object v0, v0, Lc1/j;->a:LB2/a;

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    :try_start_1
    iget-object v0, v0, LB2/a;->g:Ljava/lang/Object;

    .line 41
    .line 42
    check-cast v0, Ld1/h;

    .line 43
    .line 44
    invoke-virtual {v0}, LY0/a;->c()Landroid/os/Parcel;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    const/16 v2, 0xc

    .line 49
    .line 50
    invoke-virtual {v0, v1, v2}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :catch_1
    move-exception v0

    .line 55
    new-instance v1, Le1/x;

    .line 56
    .line 57
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 58
    .line 59
    .line 60
    throw v1

    .line 61
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final b()I
    .locals 1

    .line 1
    iget v0, p0, LU0/e;->a:I

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x5

    return v0

    :pswitch_0
    const/4 v0, 0x4

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
