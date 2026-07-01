.class public final synthetic Le3/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Le3/e;

.field public final synthetic g:Landroid/content/Context;

.field public final synthetic h:Landroid/os/Handler;

.field public final synthetic i:LZ2/v;


# direct methods
.method public synthetic constructor <init>(Le3/e;Landroid/content/Context;Landroid/os/Handler;LZ2/v;I)V
    .locals 0

    .line 1
    iput p5, p0, Le3/b;->e:I

    iput-object p1, p0, Le3/b;->f:Le3/e;

    iput-object p2, p0, Le3/b;->g:Landroid/content/Context;

    iput-object p3, p0, Le3/b;->h:Landroid/os/Handler;

    iput-object p4, p0, Le3/b;->i:LZ2/v;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    .line 1
    iget v0, p0, Le3/b;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Le3/b;->g:Landroid/content/Context;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Le3/b;->f:Le3/e;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-virtual {v1, v0, v2}, Le3/e;->a(Landroid/content/Context;[Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Le3/b;->h:Landroid/os/Handler;

    .line 19
    .line 20
    iget-object v1, p0, Le3/b;->i:LZ2/v;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :pswitch_0
    iget-object v3, p0, Le3/b;->f:Le3/e;

    .line 27
    .line 28
    :try_start_0
    iget-object v0, v3, Le3/e;->g:Ljava/util/concurrent/Future;

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Le3/d;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 41
    .line 42
    const/16 v2, 0x1c

    .line 43
    .line 44
    if-lt v1, v2, :cond_0

    .line 45
    .line 46
    invoke-static {v0}, LB/b;->h(Landroid/os/Looper;)Landroid/os/Handler;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    goto :goto_0

    .line 51
    :cond_0
    new-instance v1, Landroid/os/Handler;

    .line 52
    .line 53
    invoke-direct {v1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 54
    .line 55
    .line 56
    move-object v0, v1

    .line 57
    :goto_0
    new-instance v2, Le3/b;

    .line 58
    .line 59
    const/4 v7, 0x1

    .line 60
    iget-object v4, p0, Le3/b;->g:Landroid/content/Context;

    .line 61
    .line 62
    iget-object v5, p0, Le3/b;->h:Landroid/os/Handler;

    .line 63
    .line 64
    iget-object v6, p0, Le3/b;->i:LZ2/v;

    .line 65
    .line 66
    invoke-direct/range {v2 .. v7}, Le3/b;-><init>(Le3/e;Landroid/content/Context;Landroid/os/Handler;LZ2/v;I)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :catch_0
    move-exception v0

    .line 74
    const-string v1, "FlutterLoader"

    .line 75
    .line 76
    const-string v2, "Flutter initialization failed."

    .line 77
    .line 78
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 79
    .line 80
    .line 81
    new-instance v1, Ljava/lang/RuntimeException;

    .line 82
    .line 83
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 84
    .line 85
    .line 86
    throw v1

    .line 87
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
