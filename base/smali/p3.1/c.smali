.class public final synthetic Lp3/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:LA1/g;

.field public final synthetic g:Li1/i;


# direct methods
.method public synthetic constructor <init>(LA1/g;Li1/i;I)V
    .locals 0

    .line 1
    iput p3, p0, Lp3/c;->e:I

    iput-object p1, p0, Lp3/c;->f:LA1/g;

    iput-object p2, p0, Lp3/c;->g:Li1/i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lp3/d;LA1/g;Li1/i;)V
    .locals 0

    .line 2
    const/4 p1, 0x0

    iput p1, p0, Lp3/c;->e:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lp3/c;->f:LA1/g;

    iput-object p3, p0, Lp3/c;->g:Li1/i;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget v0, p0, Lp3/c;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lp3/c;->f:LA1/g;

    .line 7
    .line 8
    iget-object v1, p0, Lp3/c;->g:Li1/i;

    .line 9
    .line 10
    :try_start_0
    new-instance v2, Ljava/util/HashMap;

    .line 11
    .line 12
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, LA1/g;->a()V

    .line 16
    .line 17
    .line 18
    iget-object v0, v0, LA1/g;->b:Ljava/lang/String;

    .line 19
    .line 20
    const-string v3, "[DEFAULT]"

    .line 21
    .line 22
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-static {}, Lcom/google/firebase/messaging/FirebaseMessaging;->c()Lcom/google/firebase/messaging/FirebaseMessaging;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v3, "AUTO_INIT_ENABLED"

    .line 33
    .line 34
    iget-object v0, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->e:LV1/q;

    .line 35
    .line 36
    invoke-virtual {v0}, LV1/q;->b()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catch_0
    move-exception v0

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    :goto_0
    invoke-virtual {v1, v2}, Li1/i;->b(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    goto :goto_2

    .line 54
    :goto_1
    invoke-virtual {v1, v0}, Li1/i;->a(Ljava/lang/Exception;)V

    .line 55
    .line 56
    .line 57
    :goto_2
    return-void

    .line 58
    :pswitch_0
    iget-object v0, p0, Lp3/c;->f:LA1/g;

    .line 59
    .line 60
    iget-object v1, p0, Lp3/c;->g:Li1/i;

    .line 61
    .line 62
    invoke-static {v0, v1}, Lio/flutter/plugins/firebase/core/FlutterFirebasePluginRegistry;->b(LA1/g;Li1/i;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :pswitch_1
    iget-object v0, p0, Lp3/c;->f:LA1/g;

    .line 67
    .line 68
    iget-object v1, p0, Lp3/c;->g:Li1/i;

    .line 69
    .line 70
    sget-object v2, Lp3/d;->g:Ljava/util/HashMap;

    .line 71
    .line 72
    :try_start_1
    invoke-virtual {v0}, LA1/g;->a()V

    .line 73
    .line 74
    .line 75
    iget-object v2, v0, LA1/g;->b:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {v0}, LA1/g;->a()V

    .line 78
    .line 79
    .line 80
    iget-object v3, v0, LA1/g;->c:LA1/i;

    .line 81
    .line 82
    invoke-static {v3}, Lp3/d;->c(LA1/i;)Lp3/f;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-virtual {v0}, LA1/g;->a()V

    .line 87
    .line 88
    .line 89
    iget-object v4, v0, LA1/g;->g:LD1/r;

    .line 90
    .line 91
    invoke-virtual {v4}, LD1/r;->get()Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    check-cast v4, LU1/a;

    .line 96
    .line 97
    monitor-enter v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 98
    :try_start_2
    iget-boolean v5, v4, LU1/a;->d:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 99
    .line 100
    :try_start_3
    monitor-exit v4

    .line 101
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    invoke-static {v0}, Lio/flutter/plugins/firebase/core/FlutterFirebasePluginRegistry;->getPluginConstantsForFirebaseApp(LA1/g;)Li1/h;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-static {v0}, LV0/g;->a(Li1/h;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    check-cast v0, Ljava/util/Map;

    .line 114
    .line 115
    new-instance v5, Lp3/g;

    .line 116
    .line 117
    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    .line 118
    .line 119
    .line 120
    if-eqz v2, :cond_2

    .line 121
    .line 122
    iput-object v2, v5, Lp3/g;->a:Ljava/lang/String;

    .line 123
    .line 124
    iput-object v3, v5, Lp3/g;->b:Lp3/f;

    .line 125
    .line 126
    iput-object v4, v5, Lp3/g;->c:Ljava/lang/Boolean;

    .line 127
    .line 128
    if-eqz v0, :cond_1

    .line 129
    .line 130
    iput-object v0, v5, Lp3/g;->d:Ljava/util/Map;

    .line 131
    .line 132
    invoke-virtual {v1, v5}, Li1/i;->b(Ljava/lang/Object;)V

    .line 133
    .line 134
    .line 135
    goto :goto_4

    .line 136
    :catch_1
    move-exception v0

    .line 137
    goto :goto_3

    .line 138
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 139
    .line 140
    const-string v2, "Nonnull field \"pluginConstants\" is null."

    .line 141
    .line 142
    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    throw v0

    .line 146
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 147
    .line 148
    const-string v2, "Nonnull field \"name\" is null."

    .line 149
    .line 150
    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    throw v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 154
    :catchall_0
    move-exception v0

    .line 155
    :try_start_4
    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 156
    :try_start_5
    throw v0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    .line 157
    :goto_3
    invoke-virtual {v1, v0}, Li1/i;->a(Ljava/lang/Exception;)V

    .line 158
    .line 159
    .line 160
    :goto_4
    return-void

    .line 161
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
