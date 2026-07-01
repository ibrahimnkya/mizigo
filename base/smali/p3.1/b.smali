.class public final synthetic Lp3/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Lp3/d;

.field public final synthetic g:Li1/i;


# direct methods
.method public synthetic constructor <init>(Lp3/d;Li1/i;I)V
    .locals 0

    .line 1
    iput p3, p0, Lp3/b;->e:I

    iput-object p1, p0, Lp3/b;->f:Lp3/d;

    iput-object p2, p0, Lp3/b;->g:Li1/i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 10

    .line 1
    iget v0, p0, Lp3/b;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lp3/b;->f:Lp3/d;

    .line 7
    .line 8
    iget-object v1, p0, Lp3/b;->g:Li1/i;

    .line 9
    .line 10
    sget-object v2, Lp3/d;->g:Ljava/util/HashMap;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    :try_start_0
    iget-boolean v2, v0, Lp3/d;->f:Z

    .line 16
    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    iput-boolean v2, v0, Lp3/d;->f:Z

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catch_0
    move-exception v0

    .line 24
    goto :goto_2

    .line 25
    :cond_0
    invoke-static {}, Lio/flutter/plugins/firebase/core/FlutterFirebasePluginRegistry;->didReinitializeFirebaseCore()Li1/h;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-static {v2}, LV0/g;->a(Li1/h;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    :goto_0
    sget-object v2, LA1/g;->k:Ljava/lang/Object;

    .line 33
    .line 34
    monitor-enter v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    :try_start_1
    new-instance v3, Ljava/util/ArrayList;

    .line 36
    .line 37
    sget-object v4, LA1/g;->l:Lp/e;

    .line 38
    .line 39
    invoke-virtual {v4}, Lp/e;->values()Ljava/util/Collection;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 44
    .line 45
    .line 46
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    :try_start_2
    new-instance v2, Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    const/4 v5, 0x0

    .line 61
    :goto_1
    if-ge v5, v4, :cond_1

    .line 62
    .line 63
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v6

    .line 67
    add-int/lit8 v5, v5, 0x1

    .line 68
    .line 69
    check-cast v6, LA1/g;

    .line 70
    .line 71
    new-instance v7, Li1/i;

    .line 72
    .line 73
    invoke-direct {v7}, Li1/i;-><init>()V

    .line 74
    .line 75
    .line 76
    sget-object v8, Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 77
    .line 78
    new-instance v9, Lp3/c;

    .line 79
    .line 80
    invoke-direct {v9, v0, v6, v7}, Lp3/c;-><init>(Lp3/d;LA1/g;Li1/i;)V

    .line 81
    .line 82
    .line 83
    invoke-interface {v8, v9}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 84
    .line 85
    .line 86
    iget-object v6, v7, Li1/i;->a:Li1/p;

    .line 87
    .line 88
    invoke-static {v6}, LV0/g;->a(Li1/h;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v6

    .line 92
    check-cast v6, Lp3/g;

    .line 93
    .line 94
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_1
    invoke-virtual {v1, v2}, Li1/i;->b(Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 99
    .line 100
    .line 101
    goto :goto_3

    .line 102
    :catchall_0
    move-exception v0

    .line 103
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 104
    :try_start_4
    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 105
    :goto_2
    invoke-virtual {v1, v0}, Li1/i;->a(Ljava/lang/Exception;)V

    .line 106
    .line 107
    .line 108
    :goto_3
    return-void

    .line 109
    :pswitch_0
    iget-object v0, p0, Lp3/b;->f:Lp3/d;

    .line 110
    .line 111
    iget-object v1, p0, Lp3/b;->g:Li1/i;

    .line 112
    .line 113
    sget-object v2, Lp3/d;->g:Ljava/util/HashMap;

    .line 114
    .line 115
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 116
    .line 117
    .line 118
    :try_start_5
    iget-object v0, v0, Lp3/d;->e:Landroid/content/Context;

    .line 119
    .line 120
    invoke-static {v0}, LA1/i;->a(Landroid/content/Context;)LA1/i;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    if-nez v0, :cond_2

    .line 125
    .line 126
    new-instance v0, Ljava/lang/Exception;

    .line 127
    .line 128
    const-string v2, "Failed to load FirebaseOptions from resource. Check that you have defined values.xml correctly."

    .line 129
    .line 130
    invoke-direct {v0, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v1, v0}, Li1/i;->a(Ljava/lang/Exception;)V

    .line 134
    .line 135
    .line 136
    goto :goto_5

    .line 137
    :catch_1
    move-exception v0

    .line 138
    goto :goto_4

    .line 139
    :cond_2
    invoke-static {v0}, Lp3/d;->c(LA1/i;)Lp3/f;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {v1, v0}, Li1/i;->b(Ljava/lang/Object;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    .line 144
    .line 145
    .line 146
    goto :goto_5

    .line 147
    :goto_4
    invoke-virtual {v1, v0}, Li1/i;->a(Ljava/lang/Exception;)V

    .line 148
    .line 149
    .line 150
    :goto_5
    return-void

    .line 151
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
