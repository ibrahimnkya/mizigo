.class public final LD0/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LA0/b;
.implements LQ2/i;


# instance fields
.field public final synthetic e:I

.field public final f:Ljava/lang/Object;

.field public final g:Ljava/lang/Object;

.field public final h:Ljava/lang/Object;

.field public final i:Ljava/lang/Object;

.field public final j:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(LQ2/d;Ljava/lang/Object;Ljava/lang/Object;Landroid/content/SharedPreferences;LQ2/i;I)V
    .locals 0

    .line 1
    iput p6, p0, LD0/d;->e:I

    iput-object p1, p0, LD0/d;->j:Ljava/lang/Object;

    iput-object p2, p0, LD0/d;->f:Ljava/lang/Object;

    iput-object p3, p0, LD0/d;->g:Ljava/lang/Object;

    iput-object p4, p0, LD0/d;->h:Ljava/lang/Object;

    iput-object p5, p0, LD0/d;->i:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;LQ2/e;)V
    .locals 7

    const/4 v0, 0x3

    iput v0, p0, LD0/d;->e:I

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p4, p0, LD0/d;->j:Ljava/lang/Object;

    .line 4
    const-string p4, "FlutterSecureSAlgorithmKey"

    const/4 v0, 0x0

    invoke-interface {p1, p4, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    .line 5
    const-string v1, "FlutterSecureSAlgorithmStorage"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 6
    sget-object v1, LR2/f;->h:LR2/f;

    sget-object v2, LR2/b;->h:LR2/b;

    const-string v3, "AES_GCM_NoPadding_BIOMETRIC"

    sget-object v4, LR2/f;->g:LR2/f;

    sget-object v5, LR2/b;->g:LR2/b;

    if-eqz p4, :cond_3

    if-nez v0, :cond_0

    goto :goto_2

    .line 7
    :cond_0
    invoke-virtual {v3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    move-object v6, v2

    goto :goto_0

    .line 8
    :cond_1
    invoke-static {p4}, LR2/b;->valueOf(Ljava/lang/String;)LR2/b;

    move-result-object v6

    .line 9
    :goto_0
    iput-object v6, p0, LD0/d;->f:Ljava/lang/Object;

    .line 10
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    move-object v6, v1

    goto :goto_1

    .line 11
    :cond_2
    invoke-static {v0}, LR2/f;->valueOf(Ljava/lang/String;)LR2/f;

    move-result-object v6

    .line 12
    :goto_1
    iput-object v6, p0, LD0/d;->g:Ljava/lang/Object;

    goto :goto_3

    .line 13
    :cond_3
    :goto_2
    iput-object v5, p0, LD0/d;->f:Ljava/lang/Object;

    .line 14
    iput-object v4, p0, LD0/d;->g:Ljava/lang/Object;

    .line 15
    :goto_3
    invoke-virtual {v3, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    goto :goto_4

    .line 16
    :cond_4
    invoke-static {p3}, LR2/f;->valueOf(Ljava/lang/String;)LR2/f;

    move-result-object v1

    .line 17
    :goto_4
    iget p3, v1, LR2/f;->f:I

    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    if-gt p3, v6, :cond_5

    move-object v4, v1

    :cond_5
    iput-object v4, p0, LD0/d;->i:Ljava/lang/Object;

    .line 18
    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_6

    goto :goto_5

    .line 19
    :cond_6
    invoke-static {p2}, LR2/b;->valueOf(Ljava/lang/String;)LR2/b;

    move-result-object v2

    .line 20
    :goto_5
    iget p2, v2, LR2/b;->f:I

    if-gt p2, v6, :cond_7

    move-object v5, v2

    :cond_7
    iput-object v5, p0, LD0/d;->h:Ljava/lang/Object;

    if-eqz p4, :cond_8

    if-nez v0, :cond_9

    .line 21
    :cond_8
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, LD0/d;->i(Landroid/content/SharedPreferences$Editor;)V

    .line 23
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_9
    return-void
.end method

.method public constructor <init>(Landroid/content/SharedPreferences;Ljava/util/concurrent/ScheduledThreadPoolExecutor;)V
    .locals 1

    const/4 v0, 0x4

    iput v0, p0, LD0/d;->e:I

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, LD0/d;->i:Ljava/lang/Object;

    .line 32
    iput-object p1, p0, LD0/d;->f:Ljava/lang/Object;

    .line 33
    const-string p1, "topic_operation_queue"

    iput-object p1, p0, LD0/d;->g:Ljava/lang/Object;

    .line 34
    const-string p1, ","

    iput-object p1, p0, LD0/d;->h:Ljava/lang/Object;

    .line 35
    iput-object p2, p0, LD0/d;->j:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lx3/a;Lx3/a;LB2/a;Lx3/a;Lx3/a;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, LD0/d;->e:I

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, LD0/d;->f:Ljava/lang/Object;

    .line 26
    iput-object p2, p0, LD0/d;->g:Ljava/lang/Object;

    .line 27
    iput-object p3, p0, LD0/d;->j:Ljava/lang/Object;

    .line 28
    iput-object p4, p0, LD0/d;->h:Ljava/lang/Object;

    .line 29
    iput-object p5, p0, LD0/d;->i:Ljava/lang/Object;

    return-void
.end method

.method public static a(Landroid/content/SharedPreferences;Ljava/util/concurrent/ScheduledThreadPoolExecutor;)LD0/d;
    .locals 5

    .line 1
    new-instance v0, LD0/d;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, LD0/d;-><init>(Landroid/content/SharedPreferences;Ljava/util/concurrent/ScheduledThreadPoolExecutor;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, v0, LD0/d;->i:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, Ljava/util/ArrayDeque;

    .line 9
    .line 10
    monitor-enter p0

    .line 11
    :try_start_0
    iget-object p1, v0, LD0/d;->i:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p1, Ljava/util/ArrayDeque;

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/util/ArrayDeque;->clear()V

    .line 16
    .line 17
    .line 18
    iget-object p1, v0, LD0/d;->f:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p1, Landroid/content/SharedPreferences;

    .line 21
    .line 22
    iget-object v1, v0, LD0/d;->g:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v1, Ljava/lang/String;

    .line 25
    .line 26
    const-string v2, ""

    .line 27
    .line 28
    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_4

    .line 37
    .line 38
    iget-object v1, v0, LD0/d;->h:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast v1, Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_0

    .line 47
    .line 48
    goto :goto_2

    .line 49
    :cond_0
    iget-object v1, v0, LD0/d;->h:Ljava/lang/Object;

    .line 50
    .line 51
    check-cast v1, Ljava/lang/String;

    .line 52
    .line 53
    const/4 v2, -0x1

    .line 54
    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    array-length v1, p1

    .line 59
    if-nez v1, :cond_1

    .line 60
    .line 61
    const-string v1, "FirebaseMessaging"

    .line 62
    .line 63
    const-string v2, "Corrupted queue. Please check the queue contents and item separator provided"

    .line 64
    .line 65
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :catchall_0
    move-exception p1

    .line 70
    goto :goto_3

    .line 71
    :cond_1
    :goto_0
    array-length v1, p1

    .line 72
    const/4 v2, 0x0

    .line 73
    :goto_1
    if-ge v2, v1, :cond_3

    .line 74
    .line 75
    aget-object v3, p1, v2

    .line 76
    .line 77
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    if-nez v4, :cond_2

    .line 82
    .line 83
    iget-object v4, v0, LD0/d;->i:Ljava/lang/Object;

    .line 84
    .line 85
    check-cast v4, Ljava/util/ArrayDeque;

    .line 86
    .line 87
    invoke-virtual {v4, v3}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_3
    monitor-exit p0

    .line 94
    return-object v0

    .line 95
    :cond_4
    :goto_2
    monitor-exit p0

    .line 96
    return-object v0

    .line 97
    :goto_3
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 98
    throw p1
.end method

.method public static c(Landroid/content/Context;LR2/a;Ljavax/crypto/Cipher;LR2/f;)LR2/e;
    .locals 1

    .line 1
    sget-object v0, LR2/f;->h:LR2/f;

    .line 2
    .line 3
    if-ne p3, v0, :cond_1

    .line 4
    .line 5
    instance-of p3, p1, LR2/c;

    .line 6
    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    new-instance p1, LB2/a;

    .line 10
    .line 11
    invoke-direct {p1, p0, p2}, LB2/a;-><init>(Landroid/content/Context;Ljavax/crypto/Cipher;)V

    .line 12
    .line 13
    .line 14
    return-object p1

    .line 15
    :cond_0
    new-instance p2, LR2/g;

    .line 16
    .line 17
    const/4 p3, 0x1

    .line 18
    invoke-direct {p2, p0, p1, p3}, LR2/g;-><init>(Landroid/content/Context;LR2/a;I)V

    .line 19
    .line 20
    .line 21
    return-object p2

    .line 22
    :cond_1
    iget-object p2, p3, LR2/f;->e:LA1/h;

    .line 23
    .line 24
    if-eqz p2, :cond_2

    .line 25
    .line 26
    new-instance p2, LR2/g;

    .line 27
    .line 28
    const/4 p3, 0x0

    .line 29
    invoke-direct {p2, p0, p1, p3}, LR2/g;-><init>(Landroid/content/Context;LR2/a;I)V

    .line 30
    .line 31
    .line 32
    return-object p2

    .line 33
    :cond_2
    new-instance p0, Ljava/lang/Exception;

    .line 34
    .line 35
    new-instance p1, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string p2, "No implementation available for algorithm: "

    .line 38
    .line 39
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p3}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    throw p0
.end method


# virtual methods
.method public b(Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget v0, p0, LD0/d;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, LQ2/a;->v(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, LD0/d;->i:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p1, LV1/y;

    .line 12
    .line 13
    iget-object v0, p0, LD0/d;->j:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, LQ2/d;

    .line 16
    .line 17
    const-string v1, "FlutterSecureStorage"

    .line 18
    .line 19
    :try_start_0
    const-string v2, "Step 5/6: Initializing current biometric cipher..."

    .line 20
    .line 21
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    iget-object v2, v0, LQ2/d;->e:LD0/d;

    .line 25
    .line 26
    iget-object v3, v0, LQ2/d;->b:Landroid/content/Context;

    .line 27
    .line 28
    iget-object v4, p0, LD0/d;->f:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v4, Ljavax/crypto/Cipher;

    .line 31
    .line 32
    invoke-virtual {v2, v3, v4}, LD0/d;->d(Landroid/content/Context;Ljavax/crypto/Cipher;)LR2/e;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    const-string v3, "Step 6/6: Encrypting all data with current biometric cipher..."

    .line 37
    .line 38
    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    iget-object v3, p0, LD0/d;->g:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast v3, Ljava/util/HashMap;

    .line 44
    .line 45
    iget-object v4, p0, LD0/d;->h:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast v4, Landroid/content/SharedPreferences;

    .line 48
    .line 49
    invoke-static {v3, v4, v2}, LQ2/d;->e(Ljava/util/HashMap;Landroid/content/SharedPreferences;LR2/e;)V

    .line 50
    .line 51
    .line 52
    iput-object v2, v0, LQ2/d;->d:LR2/e;

    .line 53
    .line 54
    const-string v0, "Non-biometric\u2192Biometric migration completed! Data now requires biometric authentication."

    .line 55
    .line 56
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    const/4 v0, 0x0

    .line 60
    invoke-virtual {p1, v0}, LV1/y;->b(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :catch_0
    move-exception v0

    .line 65
    const-string v2, "Failed to complete migration after authentication"

    .line 66
    .line 67
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1, v0}, LV1/y;->h(Ljava/lang/Exception;)V

    .line 71
    .line 72
    .line 73
    :goto_0
    return-void

    .line 74
    :pswitch_0
    check-cast p1, Ljava/lang/Void;

    .line 75
    .line 76
    iget-object p1, p0, LD0/d;->i:Ljava/lang/Object;

    .line 77
    .line 78
    check-cast p1, LA/c;

    .line 79
    .line 80
    const-string v0, "FlutterSecureStorage"

    .line 81
    .line 82
    iget-object v1, p0, LD0/d;->g:Ljava/lang/Object;

    .line 83
    .line 84
    check-cast v1, Landroid/content/SharedPreferences;

    .line 85
    .line 86
    iget-object v2, p0, LD0/d;->f:Ljava/lang/Object;

    .line 87
    .line 88
    check-cast v2, LS2/b;

    .line 89
    .line 90
    iget-object v3, p0, LD0/d;->j:Ljava/lang/Object;

    .line 91
    .line 92
    check-cast v3, LQ2/d;

    .line 93
    .line 94
    const/4 v4, 0x0

    .line 95
    :try_start_1
    invoke-static {v3, v2, v1}, LQ2/d;->a(LQ2/d;LS2/b;Landroid/content/SharedPreferences;)V

    .line 96
    .line 97
    .line 98
    iput-object v1, v3, LQ2/d;->c:Landroid/content/SharedPreferences;

    .line 99
    .line 100
    const-string v1, "Migration completed successfully. Now using custom cipher storage."

    .line 101
    .line 102
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    iget-object v1, p0, LD0/d;->h:Ljava/lang/Object;

    .line 106
    .line 107
    check-cast v1, Landroid/content/SharedPreferences;

    .line 108
    .line 109
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    const-string v5, "ENCRYPTED_PREFERENCES_MIGRATED"

    .line 114
    .line 115
    const/4 v6, 0x1

    .line 116
    invoke-interface {v1, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 117
    .line 118
    .line 119
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1, v4}, LA/c;->b(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 123
    .line 124
    .line 125
    goto :goto_1

    .line 126
    :catch_1
    move-exception v1

    .line 127
    const-string v5, "Migration failed. Falling back to EncryptedSharedPreferences."

    .line 128
    .line 129
    invoke-static {v0, v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 130
    .line 131
    .line 132
    iput-object v2, v3, LQ2/d;->c:Landroid/content/SharedPreferences;

    .line 133
    .line 134
    invoke-virtual {p1, v4}, LA/c;->b(Ljava/lang/Object;)V

    .line 135
    .line 136
    .line 137
    :goto_1
    return-void

    .line 138
    nop

    .line 139
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public d(Landroid/content/Context;Ljavax/crypto/Cipher;)LR2/e;
    .locals 2

    .line 1
    iget-object v0, p0, LD0/d;->h:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LR2/b;

    .line 4
    .line 5
    iget-object v0, v0, LR2/b;->e:LA1/h;

    .line 6
    .line 7
    iget-object v1, p0, LD0/d;->j:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v1, LQ2/e;

    .line 10
    .line 11
    invoke-virtual {v0, p1, v1}, LA1/h;->a(Landroid/content/Context;LQ2/e;)LR2/a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, LD0/d;->i:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v1, LR2/f;

    .line 18
    .line 19
    invoke-static {p1, v0, p2, v1}, LD0/d;->c(Landroid/content/Context;LR2/a;Ljavax/crypto/Cipher;LR2/f;)LR2/e;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    return-object p1
.end method

.method public e(Landroid/content/Context;)LR2/a;
    .locals 2

    .line 1
    iget-object v0, p0, LD0/d;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LR2/b;

    .line 4
    .line 5
    iget-object v0, v0, LR2/b;->e:LA1/h;

    .line 6
    .line 7
    iget-object v1, p0, LD0/d;->j:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v1, LQ2/e;

    .line 10
    .line 11
    invoke-virtual {v0, p1, v1}, LA1/h;->a(Landroid/content/Context;LQ2/e;)LR2/a;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    return-object p1
.end method

.method public f(Landroid/content/Context;Ljavax/crypto/Cipher;)LR2/e;
    .locals 2

    .line 1
    iget-object v0, p0, LD0/d;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LR2/b;

    .line 4
    .line 5
    iget-object v0, v0, LR2/b;->e:LA1/h;

    .line 6
    .line 7
    iget-object v1, p0, LD0/d;->j:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v1, LQ2/e;

    .line 10
    .line 11
    invoke-virtual {v0, p1, v1}, LA1/h;->a(Landroid/content/Context;LQ2/e;)LR2/a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, LD0/d;->g:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v1, LR2/f;

    .line 18
    .line 19
    invoke-static {p1, v0, p2, v1}, LD0/d;->c(Landroid/content/Context;LR2/a;Ljavax/crypto/Cipher;LR2/f;)LR2/e;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    return-object p1
.end method

.method public g()Z
    .locals 2

    .line 1
    iget-object v0, p0, LD0/d;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LR2/b;

    .line 4
    .line 5
    iget-object v1, p0, LD0/d;->h:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, LR2/b;

    .line 8
    .line 9
    if-ne v0, v1, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, LD0/d;->g:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, LR2/f;

    .line 14
    .line 15
    iget-object v1, p0, LD0/d;->i:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v1, LR2/f;

    .line 18
    .line 19
    if-eq v0, v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    return v0

    .line 24
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 25
    return v0
.end method

.method public get()Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, LD0/d;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lx3/a;

    .line 4
    .line 5
    invoke-interface {v0}, Lx3/a;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    move-object v2, v0

    .line 10
    check-cast v2, Ljava/util/concurrent/Executor;

    .line 11
    .line 12
    iget-object v0, p0, LD0/d;->g:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Lx3/a;

    .line 15
    .line 16
    invoke-interface {v0}, Lx3/a;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    move-object v3, v0

    .line 21
    check-cast v3, Lz0/e;

    .line 22
    .line 23
    iget-object v0, p0, LD0/d;->j:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v0, LB2/a;

    .line 26
    .line 27
    invoke-virtual {v0}, LB2/a;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    move-object v4, v0

    .line 32
    check-cast v4, LE0/d;

    .line 33
    .line 34
    iget-object v0, p0, LD0/d;->h:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v0, Lx3/a;

    .line 37
    .line 38
    invoke-interface {v0}, Lx3/a;->get()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    move-object v5, v0

    .line 43
    check-cast v5, LF0/d;

    .line 44
    .line 45
    iget-object v0, p0, LD0/d;->i:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast v0, Lx3/a;

    .line 48
    .line 49
    invoke-interface {v0}, Lx3/a;->get()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    move-object v6, v0

    .line 54
    check-cast v6, LG0/c;

    .line 55
    .line 56
    new-instance v1, LD0/c;

    .line 57
    .line 58
    invoke-direct/range {v1 .. v6}, LD0/c;-><init>(Ljava/util/concurrent/Executor;Lz0/e;LE0/d;LF0/d;LG0/c;)V

    .line 59
    .line 60
    .line 61
    return-object v1
.end method

.method public h(Ljava/lang/Exception;)V
    .locals 3

    .line 1
    iget v0, p0, LD0/d;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const-string v0, "FlutterSecureStorage"

    .line 7
    .line 8
    const-string v1, "Biometric authentication failed for migration"

    .line 9
    .line 10
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, LD0/d;->i:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, LV1/y;

    .line 16
    .line 17
    new-instance v1, Ljava/lang/Exception;

    .line 18
    .line 19
    const-string v2, "Migration cancelled: Biometric authentication failed"

    .line 20
    .line 21
    invoke-direct {v1, v2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, LV1/y;->h(Ljava/lang/Exception;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :pswitch_0
    const-string v0, "FlutterSecureStorage"

    .line 29
    .line 30
    const-string v1, "Cipher initialization failed during migration. Using EncryptedSharedPreferences."

    .line 31
    .line 32
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, LD0/d;->j:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast p1, LQ2/d;

    .line 38
    .line 39
    iget-object v0, p0, LD0/d;->f:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast v0, LS2/b;

    .line 42
    .line 43
    iput-object v0, p1, LQ2/d;->c:Landroid/content/SharedPreferences;

    .line 44
    .line 45
    iget-object p1, p0, LD0/d;->i:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast p1, LA/c;

    .line 48
    .line 49
    const/4 v0, 0x0

    .line 50
    invoke-virtual {p1, v0}, LA/c;->b(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    nop

    .line 55
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public i(Landroid/content/SharedPreferences$Editor;)V
    .locals 2

    .line 1
    iget-object v0, p0, LD0/d;->h:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LR2/b;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "FlutterSecureSAlgorithmKey"

    .line 10
    .line 11
    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, LD0/d;->i:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, LR2/f;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "FlutterSecureSAlgorithmStorage"

    .line 23
    .line 24
    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 25
    .line 26
    .line 27
    return-void
.end method
