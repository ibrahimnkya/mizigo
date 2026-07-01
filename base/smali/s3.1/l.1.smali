.class public final Ls3/l;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static c:Lp3/i;


# instance fields
.field public final a:Landroid/content/Context;

.field public b:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lk3/f;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ls3/l;->b:Z

    .line 3
    iput-object p1, p0, Ls3/l;->a:Landroid/content/Context;

    .line 4
    new-instance p1, LV1/y;

    .line 5
    sget-object v0, Ls3/B;->d:Ls3/B;

    .line 6
    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsInitializerApi.initializeWithPreferredRenderer"

    const/4 v2, 0x0

    invoke-direct {p1, p2, v1, v0, v2}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 7
    new-instance v1, Ls3/z;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Ls3/z;-><init>(Ls3/l;I)V

    invoke-virtual {p1, v1}, LV1/y;->A(Lk3/b;)V

    .line 8
    new-instance p1, LV1/y;

    const-string v1, "dev.flutter.pigeon.google_maps_flutter_android.MapsInitializerApi.warmup"

    .line 9
    invoke-direct {p1, p2, v1, v0, v2}, LV1/y;-><init>(Lk3/f;Ljava/lang/String;Lk3/k;LN1/e;)V

    .line 10
    new-instance p2, Ls3/z;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Ls3/z;-><init>(Ls3/l;I)V

    invoke-virtual {p1, p2}, LV1/y;->A(Lk3/b;)V

    return-void
.end method

.method public constructor <init>(Lcom/journeyapps/barcodescanner/CaptureActivity;)V
    .locals 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Ls3/l;->b:Z

    const/4 v0, 0x3

    .line 13
    invoke-virtual {p1, v0}, Landroid/app/Activity;->setVolumeControlStream(I)V

    .line 14
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Ls3/l;->a:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ls3/l;->b:Z

    .line 3
    .line 4
    sget-object v1, Ls3/l;->c:Lp3/i;

    .line 5
    .line 6
    if-eqz v1, :cond_4

    .line 7
    .line 8
    invoke-static {p1}, LL/i;->b(I)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_3

    .line 13
    .line 14
    if-eq v1, v0, :cond_2

    .line 15
    .line 16
    sget-object v0, Ls3/l;->c:Lp3/i;

    .line 17
    .line 18
    new-instance v1, Ls3/x;

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    if-eq p1, v2, :cond_1

    .line 22
    .line 23
    const/4 v2, 0x2

    .line 24
    if-ne p1, v2, :cond_0

    .line 25
    .line 26
    const-string p1, "LATEST"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 p1, 0x0

    .line 30
    throw p1

    .line 31
    :cond_1
    const-string p1, "LEGACY"

    .line 32
    .line 33
    :goto_0
    const-string v2, "Unknown renderer type"

    .line 34
    .line 35
    const-string v3, "Initialized with unknown renderer type"

    .line 36
    .line 37
    invoke-direct {v1, v2, v3, p1}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lp3/i;->b(Ls3/x;)V

    .line 41
    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_2
    sget-object p1, Ls3/l;->c:Lp3/i;

    .line 45
    .line 46
    sget-object v0, Ls3/x0;->g:Ls3/x0;

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Lp3/i;->a(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_3
    sget-object p1, Ls3/l;->c:Lp3/i;

    .line 53
    .line 54
    sget-object v0, Ls3/x0;->f:Ls3/x0;

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Lp3/i;->a(Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    :goto_1
    const/4 p1, 0x0

    .line 60
    sput-object p1, Ls3/l;->c:Lp3/i;

    .line 61
    .line 62
    :cond_4
    return-void
.end method

.method public b()V
    .locals 8

    .line 1
    new-instance v1, Landroid/media/MediaPlayer;

    .line 2
    .line 3
    invoke-direct {v1}, Landroid/media/MediaPlayer;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/media/AudioAttributes$Builder;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/media/AudioAttributes$Builder;-><init>()V

    .line 9
    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    invoke-virtual {v0, v2}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v1, v0}, Landroid/media/MediaPlayer;->setAudioAttributes(Landroid/media/AudioAttributes;)V

    .line 21
    .line 22
    .line 23
    new-instance v0, Lv2/b;

    .line 24
    .line 25
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, v0}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 29
    .line 30
    .line 31
    new-instance v0, Lv2/c;

    .line 32
    .line 33
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v0}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 37
    .line 38
    .line 39
    :try_start_0
    iget-object v0, p0, Ls3/l;->a:Landroid/content/Context;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const v2, 0x7f0d0001

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->openRawResourceFd(I)Landroid/content/res/AssetFileDescriptor;

    .line 49
    .line 50
    .line 51
    move-result-object v7
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    :try_start_1
    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    .line 57
    .line 58
    .line 59
    move-result-wide v3

    .line 60
    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    .line 61
    .line 62
    .line 63
    move-result-wide v5

    .line 64
    invoke-virtual/range {v1 .. v6}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 65
    .line 66
    .line 67
    :try_start_2
    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->close()V

    .line 68
    .line 69
    .line 70
    const v0, 0x3dcccccd    # 0.1f

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1, v0, v0}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1}, Landroid/media/MediaPlayer;->prepare()V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :catch_0
    move-exception v0

    .line 84
    goto :goto_0

    .line 85
    :catchall_0
    move-exception v0

    .line 86
    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->close()V

    .line 87
    .line 88
    .line 89
    throw v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 90
    :goto_0
    const-string v2, "l"

    .line 91
    .line 92
    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 93
    .line 94
    .line 95
    invoke-virtual {v1}, Landroid/media/MediaPlayer;->reset()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v1}, Landroid/media/MediaPlayer;->release()V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public c()V
    .locals 6

    .line 1
    const-string v0, "Google Maps warmup started."

    .line 2
    .line 3
    const-string v1, "GoogleMapInitializer"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    :try_start_0
    new-instance v2, Lc1/f;

    .line 10
    .line 11
    iget-object v3, p0, Ls3/l;->a:Landroid/content/Context;

    .line 12
    .line 13
    invoke-direct {v2, v3}, Lc1/f;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    iget-object v3, v2, Lc1/f;->e:Lc1/j;

    .line 17
    .line 18
    invoke-virtual {v2, v0}, Lc1/f;->a(Landroid/os/Bundle;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    new-instance v4, LU0/e;

    .line 25
    .line 26
    const/4 v5, 0x1

    .line 27
    invoke-direct {v4, v3, v5}, LU0/e;-><init>(Lc1/j;I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v3, v0, v4}, Lc1/j;->c(Landroid/os/Bundle;LU0/f;)V

    .line 31
    .line 32
    .line 33
    iget-object v4, v3, Lc1/j;->a:LB2/a;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 34
    .line 35
    if-eqz v4, :cond_0

    .line 36
    .line 37
    :try_start_1
    iget-object v3, v4, LB2/a;->g:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast v3, Ld1/h;

    .line 40
    .line 41
    invoke-virtual {v3}, LY0/a;->c()Landroid/os/Parcel;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    const/4 v5, 0x4

    .line 46
    invoke-virtual {v3, v4, v5}, LY0/a;->d(Landroid/os/Parcel;I)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :catch_0
    move-exception v1

    .line 51
    :try_start_2
    new-instance v2, Le1/x;

    .line 52
    .line 53
    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    throw v2

    .line 57
    :cond_0
    const/4 v4, 0x5

    .line 58
    invoke-virtual {v3, v4}, Lc1/j;->b(I)V

    .line 59
    .line 60
    .line 61
    :goto_0
    invoke-virtual {v2}, Lc1/f;->b()V

    .line 62
    .line 63
    .line 64
    const-string v2, "Maps warmup complete."

    .line 65
    .line 66
    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :catch_1
    move-exception v1

    .line 71
    new-instance v2, Ls3/x;

    .line 72
    .line 73
    const-string v3, "Could not warm up"

    .line 74
    .line 75
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-direct {v2, v3, v1, v0}, Ls3/x;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    throw v2
.end method
