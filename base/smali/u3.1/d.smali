.class public Lu3/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lg3/b;


# instance fields
.field public e:Landroid/content/Context;


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

.method public static b(Lk3/f;Lu3/d;)V
    .locals 6

    .line 1
    invoke-interface {p0}, Lk3/f;->e()LN1/e;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, LV1/y;

    .line 6
    .line 7
    sget-object v2, Lu3/b;->d:Lu3/b;

    .line 8
    .line 9
    const-string v3, "dev.flutter.pigeon.path_provider_android.PathProviderApi.getTemporaryPath"

    .line 10
    .line 11
    invoke-direct {v1, p0, v3, v2, v0}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 12
    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    new-instance v4, Lu3/a;

    .line 18
    .line 19
    const/4 v5, 0x0

    .line 20
    invoke-direct {v4, p1, v5}, Lu3/a;-><init>(Lu3/d;I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v4}, LV1/y;->A(Lk3/b;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-virtual {v1, v3}, LV1/y;->A(Lk3/b;)V

    .line 28
    .line 29
    .line 30
    :goto_0
    new-instance v1, LV1/y;

    .line 31
    .line 32
    const-string v4, "dev.flutter.pigeon.path_provider_android.PathProviderApi.getApplicationSupportPath"

    .line 33
    .line 34
    invoke-direct {v1, p0, v4, v2, v0}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 35
    .line 36
    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    new-instance v4, Lu3/a;

    .line 40
    .line 41
    const/4 v5, 0x1

    .line 42
    invoke-direct {v4, p1, v5}, Lu3/a;-><init>(Lu3/d;I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v4}, LV1/y;->A(Lk3/b;)V

    .line 46
    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    invoke-virtual {v1, v3}, LV1/y;->A(Lk3/b;)V

    .line 50
    .line 51
    .line 52
    :goto_1
    new-instance v1, LV1/y;

    .line 53
    .line 54
    const-string v4, "dev.flutter.pigeon.path_provider_android.PathProviderApi.getApplicationDocumentsPath"

    .line 55
    .line 56
    invoke-direct {v1, p0, v4, v2, v0}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 57
    .line 58
    .line 59
    if-eqz p1, :cond_2

    .line 60
    .line 61
    new-instance v4, Lu3/a;

    .line 62
    .line 63
    const/4 v5, 0x2

    .line 64
    invoke-direct {v4, p1, v5}, Lu3/a;-><init>(Lu3/d;I)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1, v4}, LV1/y;->A(Lk3/b;)V

    .line 68
    .line 69
    .line 70
    goto :goto_2

    .line 71
    :cond_2
    invoke-virtual {v1, v3}, LV1/y;->A(Lk3/b;)V

    .line 72
    .line 73
    .line 74
    :goto_2
    new-instance v1, LV1/y;

    .line 75
    .line 76
    const-string v4, "dev.flutter.pigeon.path_provider_android.PathProviderApi.getApplicationCachePath"

    .line 77
    .line 78
    invoke-direct {v1, p0, v4, v2, v0}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 79
    .line 80
    .line 81
    if-eqz p1, :cond_3

    .line 82
    .line 83
    new-instance v4, Lu3/a;

    .line 84
    .line 85
    const/4 v5, 0x3

    .line 86
    invoke-direct {v4, p1, v5}, Lu3/a;-><init>(Lu3/d;I)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1, v4}, LV1/y;->A(Lk3/b;)V

    .line 90
    .line 91
    .line 92
    goto :goto_3

    .line 93
    :cond_3
    invoke-virtual {v1, v3}, LV1/y;->A(Lk3/b;)V

    .line 94
    .line 95
    .line 96
    :goto_3
    new-instance v1, LV1/y;

    .line 97
    .line 98
    const-string v4, "dev.flutter.pigeon.path_provider_android.PathProviderApi.getExternalStoragePath"

    .line 99
    .line 100
    invoke-direct {v1, p0, v4, v2, v0}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 101
    .line 102
    .line 103
    if-eqz p1, :cond_4

    .line 104
    .line 105
    new-instance v4, Lu3/a;

    .line 106
    .line 107
    const/4 v5, 0x4

    .line 108
    invoke-direct {v4, p1, v5}, Lu3/a;-><init>(Lu3/d;I)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v1, v4}, LV1/y;->A(Lk3/b;)V

    .line 112
    .line 113
    .line 114
    goto :goto_4

    .line 115
    :cond_4
    invoke-virtual {v1, v3}, LV1/y;->A(Lk3/b;)V

    .line 116
    .line 117
    .line 118
    :goto_4
    new-instance v1, LV1/y;

    .line 119
    .line 120
    const-string v4, "dev.flutter.pigeon.path_provider_android.PathProviderApi.getExternalCachePaths"

    .line 121
    .line 122
    invoke-direct {v1, p0, v4, v2, v0}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 123
    .line 124
    .line 125
    if-eqz p1, :cond_5

    .line 126
    .line 127
    new-instance v4, Lu3/a;

    .line 128
    .line 129
    const/4 v5, 0x5

    .line 130
    invoke-direct {v4, p1, v5}, Lu3/a;-><init>(Lu3/d;I)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v1, v4}, LV1/y;->A(Lk3/b;)V

    .line 134
    .line 135
    .line 136
    goto :goto_5

    .line 137
    :cond_5
    invoke-virtual {v1, v3}, LV1/y;->A(Lk3/b;)V

    .line 138
    .line 139
    .line 140
    :goto_5
    new-instance v1, LV1/y;

    .line 141
    .line 142
    const-string v4, "dev.flutter.pigeon.path_provider_android.PathProviderApi.getExternalStoragePaths"

    .line 143
    .line 144
    invoke-direct {v1, p0, v4, v2, v0}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 145
    .line 146
    .line 147
    if-eqz p1, :cond_6

    .line 148
    .line 149
    new-instance p0, Lu3/a;

    .line 150
    .line 151
    const/4 v0, 0x6

    .line 152
    invoke-direct {p0, p1, v0}, Lu3/a;-><init>(Lu3/d;I)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v1, p0}, LV1/y;->A(Lk3/b;)V

    .line 156
    .line 157
    .line 158
    return-void

    .line 159
    :cond_6
    invoke-virtual {v1, v3}, LV1/y;->A(Lk3/b;)V

    .line 160
    .line 161
    .line 162
    return-void
.end method


# virtual methods
.method public final a(Lu3/c;)Ljava/util/ArrayList;
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lu3/d;->e:Landroid/content/Context;

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    packed-switch v2, :pswitch_data_0

    .line 13
    .line 14
    .line 15
    new-instance v0, Ljava/lang/RuntimeException;

    .line 16
    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v2, "Unrecognized directory: "

    .line 20
    .line 21
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    throw v0

    .line 35
    :pswitch_0
    const-string p1, "documents"

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :pswitch_1
    const-string p1, "dcim"

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :pswitch_2
    const-string p1, "downloads"

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :pswitch_3
    const-string p1, "movies"

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :pswitch_4
    const-string p1, "pictures"

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :pswitch_5
    const-string p1, "notifications"

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :pswitch_6
    const-string p1, "alarms"

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :pswitch_7
    const-string p1, "ringtones"

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :pswitch_8
    const-string p1, "podcasts"

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :pswitch_9
    const-string p1, "music"

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :pswitch_a
    const/4 p1, 0x0

    .line 66
    :goto_0
    invoke-virtual {v1, p1}, Landroid/content/Context;->getExternalFilesDirs(Ljava/lang/String;)[Ljava/io/File;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    array-length v1, p1

    .line 71
    const/4 v2, 0x0

    .line 72
    :goto_1
    if-ge v2, v1, :cond_1

    .line 73
    .line 74
    aget-object v3, p1, v2

    .line 75
    .line 76
    if-eqz v3, :cond_0

    .line 77
    .line 78
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_1
    return-object v0

    .line 89
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final onAttachedToEngine(Lg3/a;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lg3/a;->b:Lk3/f;

    .line 2
    .line 3
    iget-object p1, p1, Lg3/a;->a:Landroid/content/Context;

    .line 4
    .line 5
    :try_start_0
    invoke-static {v0, p0}, Lu3/d;->b(Lk3/f;Lu3/d;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catch_0
    move-exception v0

    .line 10
    const-string v1, "PathProviderPlugin"

    .line 11
    .line 12
    const-string v2, "Received exception while setting up PathProviderPlugin"

    .line 13
    .line 14
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :goto_0
    iput-object p1, p0, Lu3/d;->e:Landroid/content/Context;

    .line 18
    .line 19
    return-void
.end method

.method public final onDetachedFromEngine(Lg3/a;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lg3/a;->b:Lk3/f;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Lu3/d;->b(Lk3/f;Lu3/d;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
