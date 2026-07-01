.class public final synthetic Lp3/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Li1/i;


# direct methods
.method public synthetic constructor <init>(Li1/i;I)V
    .locals 0

    .line 1
    iput p2, p0, Lp3/e;->e:I

    iput-object p1, p0, Lp3/e;->f:Li1/i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lq3/e;Li1/i;)V
    .locals 0

    .line 2
    const/4 p1, 0x2

    iput p1, p0, Lp3/e;->e:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lp3/e;->f:Li1/i;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget v0, p0, Lp3/e;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lp3/e;->f:Li1/i;

    .line 7
    .line 8
    :try_start_0
    invoke-static {}, Lcom/google/firebase/messaging/FirebaseMessaging;->c()Lcom/google/firebase/messaging/FirebaseMessaging;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Lcom/google/firebase/messaging/FirebaseMessaging;->f()LV1/z;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    const/4 v3, 0x0

    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    invoke-static {v3}, LV0/g;->o(Ljava/lang/Object;)Li1/p;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    new-instance v2, Li1/i;

    .line 25
    .line 26
    invoke-direct {v2}, Li1/i;-><init>()V

    .line 27
    .line 28
    .line 29
    new-instance v4, LS0/a;

    .line 30
    .line 31
    const-string v5, "Firebase-Messaging-Network-Io"

    .line 32
    .line 33
    invoke-direct {v4, v5}, LS0/a;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v4}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    new-instance v5, LV1/o;

    .line 41
    .line 42
    const/4 v6, 0x1

    .line 43
    invoke-direct {v5, v1, v2, v6}, LV1/o;-><init>(Lcom/google/firebase/messaging/FirebaseMessaging;Li1/i;I)V

    .line 44
    .line 45
    .line 46
    invoke-interface {v4, v5}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 47
    .line 48
    .line 49
    iget-object v1, v2, Li1/i;->a:Li1/p;

    .line 50
    .line 51
    :goto_0
    invoke-static {v1}, LV0/g;->a(Li1/h;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v3}, Li1/i;->b(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :catch_0
    move-exception v1

    .line 59
    invoke-virtual {v0, v1}, Li1/i;->a(Ljava/lang/Exception;)V

    .line 60
    .line 61
    .line 62
    :goto_1
    return-void

    .line 63
    :pswitch_0
    iget-object v0, p0, Lp3/e;->f:Li1/i;

    .line 64
    .line 65
    :try_start_1
    invoke-static {}, Lcom/google/firebase/messaging/FirebaseMessaging;->c()Lcom/google/firebase/messaging/FirebaseMessaging;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 70
    .line 71
    .line 72
    new-instance v2, Li1/i;

    .line 73
    .line 74
    invoke-direct {v2}, Li1/i;-><init>()V

    .line 75
    .line 76
    .line 77
    iget-object v3, v1, Lcom/google/firebase/messaging/FirebaseMessaging;->f:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 78
    .line 79
    new-instance v4, LV1/o;

    .line 80
    .line 81
    const/4 v5, 0x0

    .line 82
    invoke-direct {v4, v1, v2, v5}, LV1/o;-><init>(Lcom/google/firebase/messaging/FirebaseMessaging;Li1/i;I)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v3, v4}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 86
    .line 87
    .line 88
    iget-object v1, v2, Li1/i;->a:Li1/p;

    .line 89
    .line 90
    invoke-static {v1}, LV0/g;->a(Li1/h;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    check-cast v1, Ljava/lang/String;

    .line 95
    .line 96
    new-instance v2, LZ2/z;

    .line 97
    .line 98
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 99
    .line 100
    .line 101
    const-string v3, "token"

    .line 102
    .line 103
    invoke-virtual {v2, v3, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0, v2}, Li1/i;->b(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 107
    .line 108
    .line 109
    goto :goto_2

    .line 110
    :catch_1
    move-exception v1

    .line 111
    invoke-virtual {v0, v1}, Li1/i;->a(Ljava/lang/Exception;)V

    .line 112
    .line 113
    .line 114
    :goto_2
    return-void

    .line 115
    :pswitch_1
    iget-object v0, p0, Lp3/e;->f:Li1/i;

    .line 116
    .line 117
    const/4 v1, 0x0

    .line 118
    invoke-virtual {v0, v1}, Li1/i;->b(Ljava/lang/Object;)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :pswitch_2
    iget-object v0, p0, Lp3/e;->f:Li1/i;

    .line 123
    .line 124
    invoke-static {v0}, Lio/flutter/plugins/firebase/core/FlutterFirebasePluginRegistry;->a(Li1/i;)V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    nop

    .line 129
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
