.class public final LQ2/g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lk3/n;


# instance fields
.field public final synthetic a:I

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, LQ2/g;->a:I

    iput-object p2, p0, LQ2/g;->c:Ljava/lang/Object;

    iput-object p3, p0, LQ2/g;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(LQ2/g;)V
    .locals 2

    const/4 v0, 0x0

    iput v0, p0, LQ2/g;->a:I

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, LQ2/g;->c:Ljava/lang/Object;

    .line 4
    iput-object p1, p0, LQ2/g;->b:Ljava/lang/Object;

    return-void
.end method

.method private final d()V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget v0, p0, LQ2/g;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LQ2/g;->b:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lb3/g;

    .line 9
    .line 10
    iget-object v1, p0, LQ2/g;->c:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v1, LZ2/s;

    .line 13
    .line 14
    iget-object v1, v1, LZ2/s;->g:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v1, Lk3/o;

    .line 17
    .line 18
    iget-object v1, v1, Lk3/o;->c:Lk3/p;

    .line 19
    .line 20
    invoke-interface {v1, p1}, Lk3/p;->a(Ljava/lang/Object;)Ljava/nio/ByteBuffer;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {v0, p1}, Lb3/g;->a(Ljava/nio/ByteBuffer;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :pswitch_0
    iget-object p1, p0, LQ2/g;->c:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast p1, Lj3/j;

    .line 31
    .line 32
    iget-object v0, p0, LQ2/g;->b:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v0, [B

    .line 35
    .line 36
    iput-object v0, p1, Lj3/j;->b:[B

    .line 37
    .line 38
    return-void

    .line 39
    :pswitch_1
    iget-object v0, p0, LQ2/g;->c:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast v0, Landroid/os/Handler;

    .line 42
    .line 43
    new-instance v1, LD1/h;

    .line 44
    .line 45
    const/4 v2, 0x5

    .line 46
    invoke-direct {v1, v2, p0, p1}, LD1/h;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final b()V
    .locals 4

    .line 1
    iget v0, p0, LQ2/g;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LQ2/g;->b:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lb3/g;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Lb3/g;->a(Ljava/nio/ByteBuffer;)V

    .line 12
    .line 13
    .line 14
    :pswitch_0
    return-void

    .line 15
    :pswitch_1
    iget-object v0, p0, LQ2/g;->c:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Landroid/os/Handler;

    .line 18
    .line 19
    iget-object v1, p0, LQ2/g;->b:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v1, LQ2/g;

    .line 22
    .line 23
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    new-instance v2, LD1/o;

    .line 27
    .line 28
    const/4 v3, 0x3

    .line 29
    invoke-direct {v2, v3, v1}, LD1/o;-><init>(ILjava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    nop

    .line 37
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget v0, p0, LQ2/g;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LQ2/g;->b:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lb3/g;

    .line 9
    .line 10
    iget-object v1, p0, LQ2/g;->c:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v1, LZ2/s;

    .line 13
    .line 14
    iget-object v1, v1, LZ2/s;->g:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v1, Lk3/o;

    .line 17
    .line 18
    iget-object v1, v1, Lk3/o;->c:Lk3/p;

    .line 19
    .line 20
    invoke-interface {v1, p1, p2, p3}, Lk3/p;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/nio/ByteBuffer;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {v0, p1}, Lb3/g;->a(Ljava/nio/ByteBuffer;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :pswitch_0
    new-instance p3, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    const-string v0, "Error "

    .line 31
    .line 32
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string p1, " while sending restoration data to framework: "

    .line 39
    .line 40
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const-string p2, "RestorationChannel"

    .line 51
    .line 52
    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :pswitch_1
    iget-object v0, p0, LQ2/g;->c:Ljava/lang/Object;

    .line 57
    .line 58
    check-cast v0, Landroid/os/Handler;

    .line 59
    .line 60
    new-instance v1, LQ2/f;

    .line 61
    .line 62
    const/4 v6, 0x0

    .line 63
    move-object v2, p0

    .line 64
    move-object v3, p1

    .line 65
    move-object v4, p2

    .line 66
    move-object v5, p3

    .line 67
    invoke-direct/range {v1 .. v6}, LQ2/f;-><init>(Ljava/lang/Object;Ljava/io/Serializable;Ljava/io/Serializable;Ljava/lang/Object;I)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    nop

    .line 75
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
