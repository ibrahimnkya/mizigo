.class public LA/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LA0/b;
.implements Li1/a;
.implements Li1/c;
.implements LN/o;
.implements LQ2/i;
.implements LQ3/d;
.implements LR2/a;
.implements LT2/a;
.implements Lk3/m;


# instance fields
.field public final synthetic e:I

.field public f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    iput p1, p0, LA/c;->e:I

    packed-switch p1, :pswitch_data_0

    sget-object p1, LK0/d;->d:LK0/d;

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, LA/c;->f:Ljava/lang/Object;

    .line 38
    iput-object p1, p0, LA/c;->g:Ljava/lang/Object;

    return-void

    .line 39
    :pswitch_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

    :pswitch_data_0
    .packed-switch 0x19
        :pswitch_0
    .end packed-switch
.end method

.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, LA/c;->e:I

    iput-object p2, p0, LA/c;->f:Ljava/lang/Object;

    iput-object p3, p0, LA/c;->g:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(LA1/g;)V
    .locals 1

    const/16 v0, 0x16

    iput v0, p0, LA/c;->e:I

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object p1, p0, LA/c;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(LK2/c;)V
    .locals 1

    const/4 v0, 0x5

    iput v0, p0, LA/c;->e:I

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v0, LK2/c;

    invoke-direct {v0, p1}, LK2/c;-><init>(LK2/c;)V

    iput-object v0, p0, LA/c;->f:Ljava/lang/Object;

    .line 53
    iget v0, p1, LK2/c;->i:I

    .line 54
    iget p1, p1, LK2/c;->h:I

    sub-int/2addr v0, p1

    add-int/lit8 v0, v0, 0x1

    .line 55
    new-array p1, v0, [LK2/a;

    iput-object p1, p0, LA/c;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(LL2/a;[I)V
    .locals 3

    const/4 v0, 0x7

    iput v0, p0, LA/c;->e:I

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    array-length v0, p2

    if-eqz v0, :cond_3

    .line 42
    iput-object p1, p0, LA/c;->f:Ljava/lang/Object;

    .line 43
    array-length p1, p2

    const/4 v0, 0x1

    if-le p1, v0, :cond_2

    const/4 v1, 0x0

    .line 44
    aget v2, p2, v1

    if-nez v2, :cond_2

    :goto_0
    if-ge v0, p1, :cond_0

    .line 45
    aget v2, p2, v0

    if-nez v2, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    if-ne v0, p1, :cond_1

    .line 46
    filled-new-array {v1}, [I

    move-result-object p1

    iput-object p1, p0, LA/c;->g:Ljava/lang/Object;

    goto :goto_1

    :cond_1
    sub-int/2addr p1, v0

    .line 47
    new-array v2, p1, [I

    iput-object v2, p0, LA/c;->g:Ljava/lang/Object;

    .line 48
    invoke-static {p2, v0, v2, v1, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_1

    .line 49
    :cond_2
    iput-object p2, p0, LA/c;->g:Ljava/lang/Object;

    :goto_1
    return-void

    .line 50
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1
.end method

.method public constructor <init>(LP0/b;LN1/e;)V
    .locals 0

    const/4 p2, 0x6

    iput p2, p0, LA/c;->e:I

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    const-string p2, "ClientTelemetry.API"

    iput-object p2, p0, LA/c;->g:Ljava/lang/Object;

    iput-object p1, p0, LA/c;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(LX/L;)V
    .locals 1

    const/16 v0, 0x1b

    iput v0, p0, LA/c;->e:I

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput-object p1, p0, LA/c;->f:Ljava/lang/Object;

    .line 65
    new-instance p1, LK2/a;

    .line 66
    invoke-direct {p1}, LK2/a;-><init>()V

    const/4 v0, 0x0

    .line 67
    iput v0, p1, LK2/a;->b:I

    .line 68
    iput-object p1, p0, LA/c;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 4

    iput p2, p0, LA/c;->e:I

    packed-switch p2, :pswitch_data_0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, LN0/n;->e(Ljava/lang/Object;)V

    .line 6
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iput-object p1, p0, LA/c;->f:Ljava/lang/Object;

    const p2, 0x7f0e002c

    .line 7
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getResourcePackageName(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, LA/c;->g:Ljava/lang/Object;

    return-void

    .line 8
    :pswitch_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput-object p1, p0, LA/c;->g:Ljava/lang/Object;

    .line 10
    invoke-virtual {p0}, LA/c;->q()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, LA/c;->f:Ljava/lang/Object;

    .line 11
    const-string p2, "AndroidKeyStore"

    invoke-static {p2}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v0

    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Ljava/security/KeyStore;->load(Ljava/security/KeyStore$LoadStoreParameter;)V

    .line 13
    invoke-virtual {v0, p1, v1}, Ljava/security/KeyStore;->getKey(Ljava/lang/String;[C)Ljava/security/Key;

    move-result-object v1

    .line 14
    invoke-virtual {v0, p1}, Ljava/security/KeyStore;->getCertificate(Ljava/lang/String;)Ljava/security/cert/Certificate;

    move-result-object p1

    if-eqz v1, :cond_0

    if-nez p1, :cond_1

    .line 15
    :cond_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p1

    .line 16
    :try_start_0
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p0, v0}, LA/c;->P(Ljava/util/Locale;)V

    .line 17
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 18
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    const/4 v2, 0x1

    const/16 v3, 0x19

    .line 19
    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->add(II)V

    .line 20
    const-string v2, "RSA"

    invoke-static {v2, p2}, Ljava/security/KeyPairGenerator;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/KeyPairGenerator;

    move-result-object p2

    .line 21
    invoke-virtual {p0, v0, v1}, LA/c;->G(Ljava/util/Calendar;Ljava/util/Calendar;)Landroid/security/keystore/KeyGenParameterSpec;

    move-result-object v0

    .line 22
    invoke-virtual {p2, v0}, Ljava/security/KeyPairGenerator;->initialize(Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 23
    invoke-virtual {p2}, Ljava/security/KeyPairGenerator;->generateKeyPair()Ljava/security/KeyPair;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    invoke-virtual {p0, p1}, LA/c;->P(Ljava/util/Locale;)V

    :cond_1
    return-void

    :catchall_0
    move-exception p2

    invoke-virtual {p0, p1}, LA/c;->P(Ljava/util/Locale;)V

    .line 25
    throw p2

    :pswitch_data_0
    .packed-switch 0x17
        :pswitch_0
    .end packed-switch
.end method

.method public constructor <init>(Landroid/os/IBinder;)V
    .locals 3

    const/4 v0, 0x3

    iput v0, p0, LA/c;->e:I

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-interface {p1}, Landroid/os/IBinder;->getInterfaceDescriptor()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.os.IMessenger"

    .line 27
    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 28
    new-instance v0, Landroid/os/Messenger;

    invoke-direct {v0, p1}, Landroid/os/Messenger;-><init>(Landroid/os/IBinder;)V

    iput-object v0, p0, LA/c;->f:Ljava/lang/Object;

    iput-object v2, p0, LA/c;->g:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    const-string v1, "com.google.android.gms.iid.IMessengerCompat"

    .line 29
    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 30
    new-instance v0, LJ0/g;

    .line 31
    invoke-direct {v0, p1}, LJ0/g;-><init>(Landroid/os/IBinder;)V

    iput-object v0, p0, LA/c;->g:Ljava/lang/Object;

    iput-object v2, p0, LA/c;->f:Ljava/lang/Object;

    :goto_0
    return-void

    .line 32
    :cond_1
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "MessengerIpcClient"

    const-string v1, "Invalid interface descriptor: "

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 33
    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    new-instance p1, Landroid/os/RemoteException;

    invoke-direct {p1}, Landroid/os/RemoteException;-><init>()V

    throw p1
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .locals 1

    const/16 v0, 0xb

    iput v0, p0, LA/c;->e:I

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, LN0/n;->e(Ljava/lang/Object;)V

    iput-object p1, p0, LA/c;->g:Ljava/lang/Object;

    new-instance p1, Ljava/util/ArrayList;

    .line 36
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, LA/c;->f:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V
    .locals 0

    .line 2
    iput p3, p0, LA/c;->e:I

    iput-object p1, p0, LA/c;->g:Ljava/lang/Object;

    iput-object p2, p0, LA/c;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lm/n;)V
    .locals 5

    const/16 v0, 0xe

    iput v0, p0, LA/c;->e:I

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    iput-object p1, p0, LA/c;->f:Ljava/lang/Object;

    .line 71
    new-instance v0, LP/i;

    invoke-direct {v0, p1}, LP/i;-><init>(Lm/n;)V

    iput-object v0, p0, LA/c;->g:Ljava/lang/Object;

    .line 72
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 73
    sget-object v0, LP/a;->b:LP/a;

    if-nez v0, :cond_1

    .line 74
    sget-object v0, LP/a;->a:Ljava/lang/Object;

    monitor-enter v0

    .line 75
    :try_start_0
    sget-object v1, LP/a;->b:LP/a;

    if-nez v1, :cond_0

    .line 76
    new-instance v1, LP/a;

    .line 77
    invoke-direct {v1}, Landroid/text/Editable$Factory;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 78
    :try_start_1
    const-string v2, "android.text.DynamicLayout$ChangeWatcher"

    .line 79
    const-class v3, LP/a;

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v2, v4, v3}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, LP/a;->c:Ljava/lang/Class;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 80
    :catchall_0
    :try_start_2
    sput-object v1, LP/a;->b:LP/a;

    goto :goto_0

    :catchall_1
    move-exception p1

    goto :goto_1

    .line 81
    :cond_0
    :goto_0
    monitor-exit v0

    goto :goto_2

    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p1

    .line 82
    :cond_1
    :goto_2
    sget-object v0, LP/a;->b:LP/a;

    .line 83
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setEditableFactory(Landroid/text/Editable$Factory;)V

    return-void
.end method

.method public constructor <init>(Lx2/b;I)V
    .locals 0

    iput p2, p0, LA/c;->e:I

    packed-switch p2, :pswitch_data_0

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p1, p0, LA/c;->f:Ljava/lang/Object;

    .line 58
    new-instance p2, Ld3/d;

    invoke-direct {p2, p1}, Ld3/d;-><init>(Lx2/b;)V

    iput-object p2, p0, LA/c;->g:Ljava/lang/Object;

    return-void

    .line 59
    :pswitch_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p1, p0, LA/c;->f:Ljava/lang/Object;

    return-void

    :pswitch_data_0
    .packed-switch 0xf
        :pswitch_0
    .end packed-switch
.end method

.method public static H(Lr2/o;FF)Lr2/o;
    .locals 2

    .line 1
    iget v0, p0, Lr2/o;->a:F

    .line 2
    .line 3
    iget p0, p0, Lr2/o;->b:F

    .line 4
    .line 5
    cmpg-float p1, v0, p1

    .line 6
    .line 7
    const/high16 v1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    if-gez p1, :cond_0

    .line 10
    .line 11
    sub-float/2addr v0, v1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    add-float/2addr v0, v1

    .line 14
    :goto_0
    cmpg-float p1, p0, p2

    .line 15
    .line 16
    if-gez p1, :cond_1

    .line 17
    .line 18
    sub-float/2addr p0, v1

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    add-float/2addr p0, v1

    .line 21
    :goto_1
    new-instance p1, Lr2/o;

    .line 22
    .line 23
    invoke-direct {p1, v0, p0}, Lr2/o;-><init>(FF)V

    .line 24
    .line 25
    .line 26
    return-object p1
.end method

.method public static Q(Lr2/o;Lr2/o;I)Lr2/o;
    .locals 2

    .line 1
    iget v0, p1, Lr2/o;->a:F

    .line 2
    .line 3
    iget v1, p0, Lr2/o;->a:F

    .line 4
    .line 5
    sub-float/2addr v0, v1

    .line 6
    add-int/lit8 p2, p2, 0x1

    .line 7
    .line 8
    int-to-float p2, p2

    .line 9
    div-float/2addr v0, p2

    .line 10
    iget p1, p1, Lr2/o;->b:F

    .line 11
    .line 12
    iget p0, p0, Lr2/o;->b:F

    .line 13
    .line 14
    sub-float/2addr p1, p0

    .line 15
    div-float/2addr p1, p2

    .line 16
    new-instance p2, Lr2/o;

    .line 17
    .line 18
    add-float/2addr v1, v0

    .line 19
    add-float/2addr p0, p1

    .line 20
    invoke-direct {p2, v1, p0}, Lr2/o;-><init>(FF)V

    .line 21
    .line 22
    .line 23
    return-object p2
.end method

.method public static m(Landroid/content/Context;)LA/c;
    .locals 5

    .line 1
    const-string v0, "generatefid.lock"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    new-instance v2, Ljava/io/File;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-direct {v2, p0, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    new-instance p0, Ljava/io/RandomAccessFile;

    .line 14
    .line 15
    const-string v0, "rw"

    .line 16
    .line 17
    invoke-direct {p0, v2, v0}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    .line 21
    .line 22
    .line 23
    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_8
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_7
    .catch Ljava/nio/channels/OverlappingFileLockException; {:try_start_0 .. :try_end_0} :catch_6

    .line 24
    :try_start_1
    invoke-virtual {p0}, Ljava/nio/channels/FileChannel;->lock()Ljava/nio/channels/FileLock;

    .line 25
    .line 26
    .line 27
    move-result-object v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/nio/channels/OverlappingFileLockException; {:try_start_1 .. :try_end_1} :catch_3

    .line 28
    :try_start_2
    new-instance v2, LA/c;

    .line 29
    .line 30
    const/16 v3, 0x10

    .line 31
    .line 32
    invoke-direct {v2, v3, p0, v0}, LA/c;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Error; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/nio/channels/OverlappingFileLockException; {:try_start_2 .. :try_end_2} :catch_0

    .line 33
    .line 34
    .line 35
    return-object v2

    .line 36
    :catch_0
    move-exception v2

    .line 37
    goto :goto_2

    .line 38
    :catch_1
    move-exception v2

    .line 39
    goto :goto_2

    .line 40
    :catch_2
    move-exception v2

    .line 41
    goto :goto_2

    .line 42
    :catch_3
    move-exception v2

    .line 43
    :goto_0
    move-object v0, v1

    .line 44
    goto :goto_2

    .line 45
    :catch_4
    move-exception v2

    .line 46
    goto :goto_0

    .line 47
    :catch_5
    move-exception v2

    .line 48
    goto :goto_0

    .line 49
    :catch_6
    move-exception v2

    .line 50
    :goto_1
    move-object p0, v1

    .line 51
    move-object v0, p0

    .line 52
    goto :goto_2

    .line 53
    :catch_7
    move-exception v2

    .line 54
    goto :goto_1

    .line 55
    :catch_8
    move-exception v2

    .line 56
    goto :goto_1

    .line 57
    :goto_2
    const-string v3, "CrossProcessLock"

    .line 58
    .line 59
    const-string v4, "encountered error while creating and acquiring the lock, ignoring"

    .line 60
    .line 61
    invoke-static {v3, v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 62
    .line 63
    .line 64
    if-eqz v0, :cond_0

    .line 65
    .line 66
    :try_start_3
    invoke-virtual {v0}, Ljava/nio/channels/FileLock;->release()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_9

    .line 67
    .line 68
    .line 69
    :catch_9
    :cond_0
    if-eqz p0, :cond_1

    .line 70
    .line 71
    :try_start_4
    invoke-virtual {p0}, Ljava/nio/channels/spi/AbstractInterruptibleChannel;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_a

    .line 72
    .line 73
    .line 74
    :catch_a
    :cond_1
    return-object v1
.end method


# virtual methods
.method public A()Ljavax/crypto/Cipher;
    .locals 2

    .line 1
    const-string v0, "RSA/ECB/PKCS1Padding"

    .line 2
    .line 3
    const-string v1, "AndroidKeyStoreBCWorkaround"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljavax/crypto/Cipher;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public B(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, LA/c;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/String;

    .line 4
    .line 5
    iget-object v1, p0, LA/c;->f:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Landroid/content/res/Resources;

    .line 8
    .line 9
    const-string v2, "string"

    .line 10
    .line 11
    invoke-virtual {v1, p1, v2, v0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    return-object p1

    .line 19
    :cond_0
    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    return-object p1
.end method

.method public C(I)I
    .locals 1

    .line 1
    iget-object v0, p0, LA/c;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LK2/c;

    .line 4
    .line 5
    iget v0, v0, LK2/c;->h:I

    .line 6
    .line 7
    sub-int/2addr p1, v0

    .line 8
    return p1
.end method

.method public D(LR1/b;)V
    .locals 4

    .line 1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "Fid"

    .line 7
    .line 8
    iget-object v2, p1, LR1/b;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    const-string v1, "Status"

    .line 14
    .line 15
    iget v2, p1, LR1/b;->b:I

    .line 16
    .line 17
    invoke-static {v2}, LL/i;->b(I)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 22
    .line 23
    .line 24
    const-string v1, "AuthToken"

    .line 25
    .line 26
    iget-object v2, p1, LR1/b;->c:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 29
    .line 30
    .line 31
    const-string v1, "RefreshToken"

    .line 32
    .line 33
    iget-object v2, p1, LR1/b;->d:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 36
    .line 37
    .line 38
    const-string v1, "TokenCreationEpochInSecs"

    .line 39
    .line 40
    iget-wide v2, p1, LR1/b;->f:J

    .line 41
    .line 42
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 43
    .line 44
    .line 45
    const-string v1, "ExpiresInSecs"

    .line 46
    .line 47
    iget-wide v2, p1, LR1/b;->e:J

    .line 48
    .line 49
    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 50
    .line 51
    .line 52
    const-string v1, "FisError"

    .line 53
    .line 54
    iget-object p1, p1, LR1/b;->g:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 57
    .line 58
    .line 59
    const-string p1, "PersistedInstallation"

    .line 60
    .line 61
    const-string v1, "tmp"

    .line 62
    .line 63
    iget-object v2, p0, LA/c;->g:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast v2, LA1/g;

    .line 66
    .line 67
    invoke-virtual {v2}, LA1/g;->a()V

    .line 68
    .line 69
    .line 70
    iget-object v2, v2, LA1/g;->a:Landroid/content/Context;

    .line 71
    .line 72
    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-static {p1, v1, v2}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    new-instance v1, Ljava/io/FileOutputStream;

    .line 81
    .line 82
    invoke-direct {v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    const-string v2, "UTF-8"

    .line 90
    .line 91
    invoke-virtual {v0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v1, v0}, Ljava/io/FileOutputStream;->write([B)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0}, LA/c;->y()Ljava/io/File;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {p1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-eqz p1, :cond_0

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_0
    new-instance p1, Ljava/io/IOException;

    .line 113
    .line 114
    const-string v0, "unable to rename the tmpfile to PersistedInstallation"

    .line 115
    .line 116
    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    throw p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    :catch_0
    :goto_0
    return-void
.end method

.method public E(Lr2/o;)Z
    .locals 5

    .line 1
    iget v0, p1, Lr2/o;->a:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    cmpl-float v2, v0, v1

    .line 5
    .line 6
    if-ltz v2, :cond_0

    .line 7
    .line 8
    iget-object v2, p0, LA/c;->f:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v2, Lx2/b;

    .line 11
    .line 12
    iget v3, v2, Lx2/b;->e:I

    .line 13
    .line 14
    const/4 v4, 0x1

    .line 15
    sub-int/2addr v3, v4

    .line 16
    int-to-float v3, v3

    .line 17
    cmpg-float v0, v0, v3

    .line 18
    .line 19
    if-gtz v0, :cond_0

    .line 20
    .line 21
    iget p1, p1, Lr2/o;->b:F

    .line 22
    .line 23
    cmpl-float v0, p1, v1

    .line 24
    .line 25
    if-lez v0, :cond_0

    .line 26
    .line 27
    iget v0, v2, Lx2/b;->f:I

    .line 28
    .line 29
    sub-int/2addr v0, v4

    .line 30
    int-to-float v0, v0

    .line 31
    cmpg-float p1, p1, v0

    .line 32
    .line 33
    if-gtz p1, :cond_0

    .line 34
    .line 35
    return v4

    .line 36
    :cond_0
    const/4 p1, 0x0

    .line 37
    return p1
.end method

.method public F()Z
    .locals 2

    .line 1
    iget-object v0, p0, LA/c;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, [I

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    aget v0, v0, v1

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    return v0

    .line 12
    :cond_0
    return v1
.end method

.method public G(Ljava/util/Calendar;Ljava/util/Calendar;)Landroid/security/keystore/KeyGenParameterSpec;
    .locals 4

    .line 1
    new-instance v0, Landroid/security/keystore/KeyGenParameterSpec$Builder;

    .line 2
    .line 3
    iget-object v1, p0, LA/c;->f:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Ljava/lang/String;

    .line 6
    .line 7
    const/4 v2, 0x3

    .line 8
    invoke-direct {v0, v1, v2}, Landroid/security/keystore/KeyGenParameterSpec$Builder;-><init>(Ljava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    new-instance v2, Ljavax/security/auth/x500/X500Principal;

    .line 12
    .line 13
    const-string v3, "CN="

    .line 14
    .line 15
    invoke-static {v3, v1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-direct {v2, v1}, Ljavax/security/auth/x500/X500Principal;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v2}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setCertificateSubject(Ljavax/security/auth/x500/X500Principal;)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "SHA-256"

    .line 27
    .line 28
    filled-new-array {v1}, [Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setDigests([Ljava/lang/String;)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-string v1, "ECB"

    .line 37
    .line 38
    filled-new-array {v1}, [Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setBlockModes([Ljava/lang/String;)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const-string v1, "PKCS1Padding"

    .line 47
    .line 48
    filled-new-array {v1}, [Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setEncryptionPaddings([Ljava/lang/String;)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-wide/16 v1, 0x1

    .line 57
    .line 58
    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v1}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setCertificateSerialNumber(Ljava/math/BigInteger;)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {v0, p1}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setCertificateNotBefore(Ljava/util/Date;)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-virtual {p1, p2}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setCertificateNotAfter(Ljava/util/Date;)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {p1}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->build()Landroid/security/keystore/KeyGenParameterSpec;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    return-object p1
.end method

.method public I(I)LA/c;
    .locals 6

    .line 1
    iget-object v0, p0, LA/c;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, [I

    .line 4
    .line 5
    iget-object v1, p0, LA/c;->f:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, LL2/a;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    iget-object p1, v1, LL2/a;->c:LA/c;

    .line 12
    .line 13
    return-object p1

    .line 14
    :cond_0
    const/4 v2, 0x1

    .line 15
    if-ne p1, v2, :cond_1

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_1
    array-length v2, v0

    .line 19
    new-array v3, v2, [I

    .line 20
    .line 21
    const/4 v4, 0x0

    .line 22
    :goto_0
    if-ge v4, v2, :cond_2

    .line 23
    .line 24
    aget v5, v0, v4

    .line 25
    .line 26
    invoke-virtual {v1, v5, p1}, LL2/a;->c(II)I

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    aput v5, v3, v4

    .line 31
    .line 32
    add-int/lit8 v4, v4, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_2
    new-instance p1, LA/c;

    .line 36
    .line 37
    invoke-direct {p1, v1, v3}, LA/c;-><init>(LL2/a;[I)V

    .line 38
    .line 39
    .line 40
    return-object p1
.end method

.method public J(LA/c;)LA/c;
    .locals 12

    .line 1
    iget-object v0, p0, LA/c;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LL2/a;

    .line 4
    .line 5
    iget-object v1, p1, LA/c;->f:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, LL2/a;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_4

    .line 14
    .line 15
    invoke-virtual {p0}, LA/c;->F()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_3

    .line 20
    .line 21
    invoke-virtual {p1}, LA/c;->F()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    goto :goto_2

    .line 28
    :cond_0
    iget-object v1, p0, LA/c;->g:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v1, [I

    .line 31
    .line 32
    array-length v2, v1

    .line 33
    iget-object p1, p1, LA/c;->g:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast p1, [I

    .line 36
    .line 37
    array-length v3, p1

    .line 38
    add-int v4, v2, v3

    .line 39
    .line 40
    add-int/lit8 v4, v4, -0x1

    .line 41
    .line 42
    new-array v4, v4, [I

    .line 43
    .line 44
    const/4 v5, 0x0

    .line 45
    move v6, v5

    .line 46
    :goto_0
    if-ge v6, v2, :cond_2

    .line 47
    .line 48
    aget v7, v1, v6

    .line 49
    .line 50
    move v8, v5

    .line 51
    :goto_1
    if-ge v8, v3, :cond_1

    .line 52
    .line 53
    add-int v9, v6, v8

    .line 54
    .line 55
    aget v10, v4, v9

    .line 56
    .line 57
    aget v11, p1, v8

    .line 58
    .line 59
    invoke-virtual {v0, v7, v11}, LL2/a;->c(II)I

    .line 60
    .line 61
    .line 62
    move-result v11

    .line 63
    invoke-virtual {v0, v10, v11}, LL2/a;->a(II)I

    .line 64
    .line 65
    .line 66
    move-result v10

    .line 67
    aput v10, v4, v9

    .line 68
    .line 69
    add-int/lit8 v8, v8, 0x1

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_1
    add-int/lit8 v6, v6, 0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_2
    new-instance p1, LA/c;

    .line 76
    .line 77
    invoke-direct {p1, v0, v4}, LA/c;-><init>(LL2/a;[I)V

    .line 78
    .line 79
    .line 80
    return-object p1

    .line 81
    :cond_3
    :goto_2
    iget-object p1, v0, LL2/a;->c:LA/c;

    .line 82
    .line 83
    return-object p1

    .line 84
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 85
    .line 86
    const-string v0, "ModulusPolys do not have same ModulusGF field"

    .line 87
    .line 88
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    throw p1
.end method

.method public K(LW3/f;ZLjava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "completed"

    .line 7
    .line 8
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    const-string p2, "error"

    .line 16
    .line 17
    invoke-virtual {v0, p2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    iget p1, p1, LW3/f;->g:I

    .line 21
    .line 22
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string p2, "job"

    .line 27
    .line 28
    invoke-virtual {v0, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, LA/c;->g:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast p1, Lk3/o;

    .line 34
    .line 35
    const-string p2, "onCompleted"

    .line 36
    .line 37
    const/4 p3, 0x0

    .line 38
    invoke-virtual {p1, p2, v0, p3}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public L(LW3/f;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    iget p1, p1, LW3/f;->g:I

    .line 7
    .line 8
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const-string v1, "job"

    .line 13
    .line 14
    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    const-string p1, "error"

    .line 20
    .line 21
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p1, p0, LA/c;->g:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast p1, Lk3/o;

    .line 27
    .line 28
    const-string p2, "onPageRasterEnd"

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    invoke-virtual {p1, p2, v0, v1}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public M(LA/j;)V
    .locals 4

    .line 1
    iget-object v0, p0, LA/c;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LA/p;

    .line 4
    .line 5
    iget-object v1, p0, LA/c;->f:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Lio/flutter/plugin/editing/j;

    .line 8
    .line 9
    iget v2, p1, LA/j;->b:I

    .line 10
    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    iget-object p1, p1, LA/j;->a:Landroid/graphics/Typeface;

    .line 14
    .line 15
    new-instance v2, LA/a;

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    invoke-direct {v2, v3, v1, p1}, LA/a;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v2}, LA/p;->execute(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    new-instance p1, LA/b;

    .line 26
    .line 27
    invoke-direct {p1, v1, v2}, LA/b;-><init>(Lio/flutter/plugin/editing/j;I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, p1}, LA/p;->execute(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public N()LR1/b;
    .locals 14

    .line 1
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x4000

    .line 7
    .line 8
    new-array v2, v1, [B

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    :try_start_0
    new-instance v4, Ljava/io/FileInputStream;

    .line 12
    .line 13
    invoke-virtual {p0}, LA/c;->y()Ljava/io/File;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    invoke-direct {v4, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    :goto_0
    :try_start_1
    invoke-virtual {v4, v2, v3, v1}, Ljava/io/FileInputStream;->read([BII)I

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    if-gez v5, :cond_0

    .line 25
    .line 26
    new-instance v1, Lorg/json/JSONObject;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    .line 34
    .line 35
    :try_start_2
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    .line 36
    .line 37
    .line 38
    goto :goto_3

    .line 39
    :catchall_0
    move-exception v0

    .line 40
    move-object v1, v0

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    :try_start_3
    invoke-virtual {v0, v2, v3, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :goto_1
    :try_start_4
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 47
    .line 48
    .line 49
    goto :goto_2

    .line 50
    :catchall_1
    move-exception v0

    .line 51
    :try_start_5
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    :goto_2
    throw v1
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_0

    .line 55
    :catch_0
    new-instance v1, Lorg/json/JSONObject;

    .line 56
    .line 57
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 58
    .line 59
    .line 60
    :goto_3
    const-string v0, "Fid"

    .line 61
    .line 62
    const/4 v2, 0x0

    .line 63
    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    const-string v0, "Status"

    .line 68
    .line 69
    invoke-virtual {v1, v0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    const-string v3, "AuthToken"

    .line 74
    .line 75
    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v7

    .line 79
    const-string v3, "RefreshToken"

    .line 80
    .line 81
    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v8

    .line 85
    const-string v3, "TokenCreationEpochInSecs"

    .line 86
    .line 87
    const-wide/16 v9, 0x0

    .line 88
    .line 89
    invoke-virtual {v1, v3, v9, v10}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    .line 90
    .line 91
    .line 92
    move-result-wide v11

    .line 93
    const-string v3, "ExpiresInSecs"

    .line 94
    .line 95
    invoke-virtual {v1, v3, v9, v10}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    .line 96
    .line 97
    .line 98
    move-result-wide v9

    .line 99
    const-string v3, "FisError"

    .line 100
    .line 101
    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v13

    .line 105
    sget v1, LR1/b;->h:I

    .line 106
    .line 107
    const/4 v1, 0x0

    .line 108
    or-int/lit8 v1, v1, 0x2

    .line 109
    .line 110
    int-to-byte v1, v1

    .line 111
    or-int/lit8 v1, v1, 0x1

    .line 112
    .line 113
    int-to-byte v1, v1

    .line 114
    const/4 v2, 0x5

    .line 115
    invoke-static {v2}, LL/i;->c(I)[I

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    aget v6, v2, v0

    .line 120
    .line 121
    if-eqz v6, :cond_6

    .line 122
    .line 123
    or-int/lit8 v0, v1, 0x2

    .line 124
    .line 125
    int-to-byte v0, v0

    .line 126
    or-int/lit8 v0, v0, 0x1

    .line 127
    .line 128
    int-to-byte v0, v0

    .line 129
    const/4 v1, 0x3

    .line 130
    if-ne v0, v1, :cond_2

    .line 131
    .line 132
    if-nez v6, :cond_1

    .line 133
    .line 134
    goto :goto_4

    .line 135
    :cond_1
    new-instance v4, LR1/b;

    .line 136
    .line 137
    invoke-direct/range {v4 .. v13}, LR1/b;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;JJLjava/lang/String;)V

    .line 138
    .line 139
    .line 140
    return-object v4

    .line 141
    :cond_2
    :goto_4
    new-instance v1, Ljava/lang/StringBuilder;

    .line 142
    .line 143
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 144
    .line 145
    .line 146
    if-nez v6, :cond_3

    .line 147
    .line 148
    const-string v2, " registrationStatus"

    .line 149
    .line 150
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    :cond_3
    and-int/lit8 v2, v0, 0x1

    .line 154
    .line 155
    if-nez v2, :cond_4

    .line 156
    .line 157
    const-string v2, " expiresInSecs"

    .line 158
    .line 159
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    :cond_4
    and-int/lit8 v0, v0, 0x2

    .line 163
    .line 164
    if-nez v0, :cond_5

    .line 165
    .line 166
    const-string v0, " tokenCreationEpochInSecs"

    .line 167
    .line 168
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    :cond_5
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 172
    .line 173
    new-instance v2, Ljava/lang/StringBuilder;

    .line 174
    .line 175
    const-string v3, "Missing required properties:"

    .line 176
    .line 177
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    throw v0

    .line 191
    :cond_6
    new-instance v0, Ljava/lang/NullPointerException;

    .line 192
    .line 193
    const-string v1, "Null registrationStatus"

    .line 194
    .line 195
    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    throw v0
.end method

.method public O()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, LA/c;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/nio/channels/FileLock;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/nio/channels/FileLock;->release()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, LA/c;->f:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v0, Ljava/nio/channels/FileChannel;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/nio/channels/spi/AbstractInterruptibleChannel;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :catch_0
    move-exception v0

    .line 17
    const-string v1, "CrossProcessLock"

    .line 18
    .line 19
    const-string v2, "encountered error while releasing, ignoring"

    .line 20
    .line 21
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public P(Ljava/util/Locale;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ljava/util/Locale;->setDefault(Ljava/util/Locale;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, LA/c;->g:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v0, Landroid/content/Context;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1, p1}, Landroid/content/res/Configuration;->setLocale(Ljava/util/Locale;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/content/Context;->createConfigurationContext(Landroid/content/res/Configuration;)Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public R(IIII)F
    .locals 17

    .line 1
    sub-int v0, p4, p2

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sub-int v1, p3, p1

    .line 8
    .line 9
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v3, 0x1

    .line 14
    if-le v0, v1, :cond_0

    .line 15
    .line 16
    move v0, v3

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    :goto_0
    if-eqz v0, :cond_1

    .line 20
    .line 21
    move/from16 v4, p1

    .line 22
    .line 23
    move/from16 v1, p2

    .line 24
    .line 25
    move/from16 v6, p3

    .line 26
    .line 27
    move/from16 v5, p4

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    move/from16 v1, p1

    .line 31
    .line 32
    move/from16 v4, p2

    .line 33
    .line 34
    move/from16 v5, p3

    .line 35
    .line 36
    move/from16 v6, p4

    .line 37
    .line 38
    :goto_1
    sub-int v7, v5, v1

    .line 39
    .line 40
    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    .line 41
    .line 42
    .line 43
    move-result v7

    .line 44
    sub-int v8, v6, v4

    .line 45
    .line 46
    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    .line 47
    .line 48
    .line 49
    move-result v8

    .line 50
    neg-int v9, v7

    .line 51
    const/4 v10, 0x2

    .line 52
    div-int/2addr v9, v10

    .line 53
    const/4 v11, -0x1

    .line 54
    if-ge v1, v5, :cond_2

    .line 55
    .line 56
    move v12, v3

    .line 57
    goto :goto_2

    .line 58
    :cond_2
    move v12, v11

    .line 59
    :goto_2
    if-ge v4, v6, :cond_3

    .line 60
    .line 61
    move v11, v3

    .line 62
    :cond_3
    add-int/2addr v5, v12

    .line 63
    move v13, v1

    .line 64
    move v14, v4

    .line 65
    const/4 v15, 0x0

    .line 66
    :goto_3
    if-eq v13, v5, :cond_b

    .line 67
    .line 68
    if-eqz v0, :cond_4

    .line 69
    .line 70
    move v2, v14

    .line 71
    goto :goto_4

    .line 72
    :cond_4
    move v2, v13

    .line 73
    :goto_4
    if-eqz v0, :cond_5

    .line 74
    .line 75
    move v10, v13

    .line 76
    goto :goto_5

    .line 77
    :cond_5
    move v10, v14

    .line 78
    :goto_5
    move/from16 v16, v0

    .line 79
    .line 80
    if-ne v15, v3, :cond_6

    .line 81
    .line 82
    move v0, v3

    .line 83
    move/from16 p2, v7

    .line 84
    .line 85
    move-object/from16 v3, p0

    .line 86
    .line 87
    goto :goto_6

    .line 88
    :cond_6
    const/4 v0, 0x0

    .line 89
    move-object/from16 v3, p0

    .line 90
    .line 91
    move/from16 p2, v7

    .line 92
    .line 93
    :goto_6
    iget-object v7, v3, LA/c;->f:Ljava/lang/Object;

    .line 94
    .line 95
    check-cast v7, Lx2/b;

    .line 96
    .line 97
    invoke-virtual {v7, v2, v10}, Lx2/b;->b(II)Z

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    if-ne v0, v2, :cond_8

    .line 102
    .line 103
    const/4 v0, 0x2

    .line 104
    if-ne v15, v0, :cond_7

    .line 105
    .line 106
    invoke-static {v13, v14, v1, v4}, Ld1/d;->h(IIII)F

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    return v0

    .line 111
    :cond_7
    add-int/lit8 v15, v15, 0x1

    .line 112
    .line 113
    :cond_8
    add-int/2addr v9, v8

    .line 114
    if-lez v9, :cond_a

    .line 115
    .line 116
    if-ne v14, v6, :cond_9

    .line 117
    .line 118
    const/4 v0, 0x2

    .line 119
    goto :goto_7

    .line 120
    :cond_9
    add-int/2addr v14, v11

    .line 121
    sub-int v9, v9, p2

    .line 122
    .line 123
    :cond_a
    add-int/2addr v13, v12

    .line 124
    move/from16 v7, p2

    .line 125
    .line 126
    move/from16 v0, v16

    .line 127
    .line 128
    const/4 v3, 0x1

    .line 129
    const/4 v10, 0x2

    .line 130
    goto :goto_3

    .line 131
    :cond_b
    move-object/from16 v3, p0

    .line 132
    .line 133
    move v0, v10

    .line 134
    :goto_7
    if-ne v15, v0, :cond_c

    .line 135
    .line 136
    invoke-static {v5, v6, v1, v4}, Ld1/d;->h(IIII)F

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    return v0

    .line 141
    :cond_c
    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 142
    .line 143
    return v0
.end method

.method public S(IIII)F
    .locals 7

    .line 1
    iget-object v0, p0, LA/c;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lx2/b;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, LA/c;->R(IIII)F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr p3, p1

    .line 10
    sub-int p3, p1, p3

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    const/high16 v3, 0x3f800000    # 1.0f

    .line 14
    .line 15
    if-gez p3, :cond_0

    .line 16
    .line 17
    int-to-float v4, p1

    .line 18
    sub-int p3, p1, p3

    .line 19
    .line 20
    int-to-float p3, p3

    .line 21
    div-float/2addr v4, p3

    .line 22
    move p3, v2

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget v4, v0, Lx2/b;->e:I

    .line 25
    .line 26
    if-lt p3, v4, :cond_1

    .line 27
    .line 28
    add-int/lit8 v5, v4, -0x1

    .line 29
    .line 30
    sub-int/2addr v5, p1

    .line 31
    int-to-float v5, v5

    .line 32
    sub-int/2addr p3, p1

    .line 33
    int-to-float p3, p3

    .line 34
    div-float p3, v5, p3

    .line 35
    .line 36
    add-int/lit8 v4, v4, -0x1

    .line 37
    .line 38
    move v6, v4

    .line 39
    move v4, p3

    .line 40
    move p3, v6

    .line 41
    goto :goto_0

    .line 42
    :cond_1
    move v4, v3

    .line 43
    :goto_0
    int-to-float v5, p2

    .line 44
    sub-int/2addr p4, p2

    .line 45
    int-to-float p4, p4

    .line 46
    mul-float/2addr p4, v4

    .line 47
    sub-float p4, v5, p4

    .line 48
    .line 49
    float-to-int p4, p4

    .line 50
    if-gez p4, :cond_2

    .line 51
    .line 52
    sub-int p4, p2, p4

    .line 53
    .line 54
    int-to-float p4, p4

    .line 55
    div-float/2addr v5, p4

    .line 56
    goto :goto_1

    .line 57
    :cond_2
    iget v0, v0, Lx2/b;->f:I

    .line 58
    .line 59
    if-lt p4, v0, :cond_3

    .line 60
    .line 61
    add-int/lit8 v2, v0, -0x1

    .line 62
    .line 63
    sub-int/2addr v2, p2

    .line 64
    int-to-float v2, v2

    .line 65
    sub-int/2addr p4, p2

    .line 66
    int-to-float p4, p4

    .line 67
    div-float v5, v2, p4

    .line 68
    .line 69
    add-int/lit8 v2, v0, -0x1

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_3
    move v2, p4

    .line 73
    move v5, v3

    .line 74
    :goto_1
    int-to-float p4, p1

    .line 75
    sub-int/2addr p3, p1

    .line 76
    int-to-float p3, p3

    .line 77
    mul-float/2addr p3, v5

    .line 78
    add-float/2addr p3, p4

    .line 79
    float-to-int p3, p3

    .line 80
    invoke-virtual {p0, p1, p2, p3, v2}, LA/c;->R(IIII)F

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    add-float/2addr p1, v1

    .line 85
    sub-float/2addr p1, v3

    .line 86
    return p1
.end method

.method public T(LA/c;)LA/c;
    .locals 5

    .line 1
    iget-object v0, p0, LA/c;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LL2/a;

    .line 4
    .line 5
    iget-object v1, p1, LA/c;->f:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, LL2/a;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    invoke-virtual {p1}, LA/c;->F()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    iget-object v0, p1, LA/c;->f:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v0, LL2/a;

    .line 25
    .line 26
    iget-object p1, p1, LA/c;->g:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast p1, [I

    .line 29
    .line 30
    array-length v1, p1

    .line 31
    new-array v2, v1, [I

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    :goto_0
    if-ge v3, v1, :cond_1

    .line 35
    .line 36
    aget v4, p1, v3

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    rsub-int v4, v4, 0x3a1

    .line 42
    .line 43
    rem-int/lit16 v4, v4, 0x3a1

    .line 44
    .line 45
    aput v4, v2, v3

    .line 46
    .line 47
    add-int/lit8 v3, v3, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    new-instance p1, LA/c;

    .line 51
    .line 52
    invoke-direct {p1, v0, v2}, LA/c;-><init>(LL2/a;[I)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, p1}, LA/c;->n(LA/c;)LA/c;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    return-object p1

    .line 60
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 61
    .line 62
    const-string v0, "ModulusPolys do not have same ModulusGF field"

    .line 63
    .line 64
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    throw p1
.end method

.method public U(Lr2/o;Lr2/o;)I
    .locals 17

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    iget v2, v0, Lr2/o;->a:F

    .line 6
    .line 7
    float-to-int v2, v2

    .line 8
    iget v0, v0, Lr2/o;->b:F

    .line 9
    .line 10
    float-to-int v0, v0

    .line 11
    iget v3, v1, Lr2/o;->a:F

    .line 12
    .line 13
    float-to-int v3, v3

    .line 14
    move-object/from16 v4, p0

    .line 15
    .line 16
    iget-object v5, v4, LA/c;->f:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v5, Lx2/b;

    .line 19
    .line 20
    iget v6, v5, Lx2/b;->f:I

    .line 21
    .line 22
    const/4 v7, 0x1

    .line 23
    sub-int/2addr v6, v7

    .line 24
    iget v1, v1, Lr2/o;->b:F

    .line 25
    .line 26
    float-to-int v1, v1

    .line 27
    invoke-static {v6, v1}, Ljava/lang/Math;->min(II)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    sub-int v6, v1, v0

    .line 32
    .line 33
    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    .line 34
    .line 35
    .line 36
    move-result v6

    .line 37
    sub-int v8, v3, v2

    .line 38
    .line 39
    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    .line 40
    .line 41
    .line 42
    move-result v8

    .line 43
    const/4 v9, 0x0

    .line 44
    if-le v6, v8, :cond_0

    .line 45
    .line 46
    move v6, v7

    .line 47
    goto :goto_0

    .line 48
    :cond_0
    move v6, v9

    .line 49
    :goto_0
    if-eqz v6, :cond_1

    .line 50
    .line 51
    move/from16 v16, v2

    .line 52
    .line 53
    move v2, v0

    .line 54
    move/from16 v0, v16

    .line 55
    .line 56
    move/from16 v16, v3

    .line 57
    .line 58
    move v3, v1

    .line 59
    move/from16 v1, v16

    .line 60
    .line 61
    :cond_1
    sub-int v8, v3, v2

    .line 62
    .line 63
    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    .line 64
    .line 65
    .line 66
    move-result v8

    .line 67
    sub-int v10, v1, v0

    .line 68
    .line 69
    invoke-static {v10}, Ljava/lang/Math;->abs(I)I

    .line 70
    .line 71
    .line 72
    move-result v10

    .line 73
    neg-int v11, v8

    .line 74
    div-int/lit8 v11, v11, 0x2

    .line 75
    .line 76
    const/4 v12, -0x1

    .line 77
    if-ge v0, v1, :cond_2

    .line 78
    .line 79
    move v13, v7

    .line 80
    goto :goto_1

    .line 81
    :cond_2
    move v13, v12

    .line 82
    :goto_1
    if-ge v2, v3, :cond_3

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_3
    move v7, v12

    .line 86
    :goto_2
    if-eqz v6, :cond_4

    .line 87
    .line 88
    move v12, v0

    .line 89
    goto :goto_3

    .line 90
    :cond_4
    move v12, v2

    .line 91
    :goto_3
    if-eqz v6, :cond_5

    .line 92
    .line 93
    move v14, v2

    .line 94
    goto :goto_4

    .line 95
    :cond_5
    move v14, v0

    .line 96
    :goto_4
    invoke-virtual {v5, v12, v14}, Lx2/b;->b(II)Z

    .line 97
    .line 98
    .line 99
    move-result v12

    .line 100
    :goto_5
    if-eq v2, v3, :cond_b

    .line 101
    .line 102
    if-eqz v6, :cond_6

    .line 103
    .line 104
    move v14, v0

    .line 105
    goto :goto_6

    .line 106
    :cond_6
    move v14, v2

    .line 107
    :goto_6
    if-eqz v6, :cond_7

    .line 108
    .line 109
    move v15, v2

    .line 110
    goto :goto_7

    .line 111
    :cond_7
    move v15, v0

    .line 112
    :goto_7
    invoke-virtual {v5, v14, v15}, Lx2/b;->b(II)Z

    .line 113
    .line 114
    .line 115
    move-result v14

    .line 116
    if-eq v14, v12, :cond_8

    .line 117
    .line 118
    add-int/lit8 v9, v9, 0x1

    .line 119
    .line 120
    move v12, v14

    .line 121
    :cond_8
    add-int/2addr v11, v10

    .line 122
    if-lez v11, :cond_a

    .line 123
    .line 124
    if-ne v0, v1, :cond_9

    .line 125
    .line 126
    return v9

    .line 127
    :cond_9
    add-int/2addr v0, v13

    .line 128
    sub-int/2addr v11, v8

    .line 129
    :cond_a
    add-int/2addr v2, v7

    .line 130
    goto :goto_5

    .line 131
    :cond_b
    return v9
.end method

.method public a()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, LA/c;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LN/y;

    .line 4
    .line 5
    return-object v0
.end method

.method public b(Ljava/lang/Object;)V
    .locals 10

    .line 1
    iget v0, p0, LA/c;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    check-cast p1, Ljava/lang/Void;

    .line 7
    .line 8
    iget-object p1, p0, LA/c;->g:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast p1, LA/q;

    .line 11
    .line 12
    iget-object v0, p1, LA/q;->h:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, LQ2/h;

    .line 15
    .line 16
    iget-object v1, p1, LA/q;->g:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v1, LQ2/g;

    .line 19
    .line 20
    :try_start_0
    iget-object v2, p1, LA/q;->f:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast v2, Lk3/l;

    .line 23
    .line 24
    iget-object v3, v2, Lk3/l;->a:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 27
    .line 28
    .line 29
    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    const/4 v5, 0x1

    .line 31
    const-string v6, "read"

    .line 32
    .line 33
    const/4 v7, 0x0

    .line 34
    const-string v8, "write"

    .line 35
    .line 36
    const-string v9, "readAll"

    .line 37
    .line 38
    sparse-switch v4, :sswitch_data_0

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :sswitch_0
    :try_start_1
    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eqz v3, :cond_0

    .line 47
    .line 48
    const/4 v3, 0x2

    .line 49
    goto :goto_1

    .line 50
    :catch_0
    move-exception v2

    .line 51
    goto/16 :goto_6

    .line 52
    .line 53
    :sswitch_1
    const-string v4, "containsKey"

    .line 54
    .line 55
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-eqz v3, :cond_0

    .line 60
    .line 61
    const/4 v3, 0x3

    .line 62
    goto :goto_1

    .line 63
    :sswitch_2
    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-eqz v3, :cond_0

    .line 68
    .line 69
    move v3, v7

    .line 70
    goto :goto_1

    .line 71
    :sswitch_3
    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    if-eqz v3, :cond_0

    .line 76
    .line 77
    move v3, v5

    .line 78
    goto :goto_1

    .line 79
    :sswitch_4
    const-string v4, "deleteAll"

    .line 80
    .line 81
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    if-eqz v3, :cond_0

    .line 86
    .line 87
    const/4 v3, 0x5

    .line 88
    goto :goto_1

    .line 89
    :sswitch_5
    const-string v4, "delete"

    .line 90
    .line 91
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    if-eqz v3, :cond_0

    .line 96
    .line 97
    const/4 v3, 0x4

    .line 98
    goto :goto_1

    .line 99
    :sswitch_6
    const-string v4, "isBiometricAvailable"

    .line 100
    .line 101
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    if-eqz v3, :cond_0

    .line 106
    .line 107
    const/4 v3, 0x6

    .line 108
    goto :goto_1

    .line 109
    :sswitch_7
    const-string v4, "isDeviceSecure"

    .line 110
    .line 111
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    if-eqz v3, :cond_0

    .line 116
    .line 117
    const/4 v3, 0x7

    .line 118
    goto :goto_1

    .line 119
    :cond_0
    :goto_0
    const/4 v3, -0x1

    .line 120
    :goto_1
    const/4 v4, 0x0

    .line 121
    packed-switch v3, :pswitch_data_1

    .line 122
    .line 123
    .line 124
    invoke-virtual {v1}, LQ2/g;->b()V

    .line 125
    .line 126
    .line 127
    goto/16 :goto_7

    .line 128
    .line 129
    :pswitch_0
    iget-object v2, v0, LQ2/h;->f:LQ2/d;

    .line 130
    .line 131
    invoke-virtual {v2}, LQ2/d;->j()Z

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    invoke-virtual {v1, v2}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 140
    .line 141
    .line 142
    goto/16 :goto_7

    .line 143
    .line 144
    :pswitch_1
    iget-object v2, v0, LQ2/h;->f:LQ2/d;

    .line 145
    .line 146
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 147
    .line 148
    const/16 v4, 0x1e

    .line 149
    .line 150
    if-lt v3, v4, :cond_3

    .line 151
    .line 152
    iget-object v3, v2, LQ2/d;->b:Landroid/content/Context;

    .line 153
    .line 154
    invoke-static {}, LD/D;->k()Ljava/lang/Class;

    .line 155
    .line 156
    .line 157
    move-result-object v4

    .line 158
    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object v3

    .line 162
    invoke-static {v3}, LD/D;->d(Ljava/lang/Object;)Landroid/hardware/biometrics/BiometricManager;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    if-nez v3, :cond_2

    .line 167
    .line 168
    :cond_1
    move v5, v7

    .line 169
    goto :goto_2

    .line 170
    :cond_2
    invoke-static {v3}, LD/N;->b(Landroid/hardware/biometrics/BiometricManager;)I

    .line 171
    .line 172
    .line 173
    move-result v3

    .line 174
    if-nez v3, :cond_1

    .line 175
    .line 176
    invoke-virtual {v2}, LQ2/d;->j()Z

    .line 177
    .line 178
    .line 179
    move-result v2

    .line 180
    if-eqz v2, :cond_1

    .line 181
    .line 182
    goto :goto_2

    .line 183
    :cond_3
    invoke-virtual {v2}, LQ2/d;->j()Z

    .line 184
    .line 185
    .line 186
    move-result v5

    .line 187
    :goto_2
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    invoke-virtual {v1, v2}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 192
    .line 193
    .line 194
    goto/16 :goto_7

    .line 195
    .line 196
    :pswitch_2
    iget-object v2, v0, LQ2/h;->f:LQ2/d;

    .line 197
    .line 198
    iget-object v2, v2, LQ2/d;->c:Landroid/content/SharedPreferences;

    .line 199
    .line 200
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 205
    .line 206
    .line 207
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 208
    .line 209
    .line 210
    invoke-virtual {v1, v4}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 211
    .line 212
    .line 213
    goto/16 :goto_7

    .line 214
    .line 215
    :pswitch_3
    invoke-static {v0, v2}, LQ2/h;->a(LQ2/h;Lk3/l;)Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v2

    .line 219
    iget-object v3, v0, LQ2/h;->f:LQ2/d;

    .line 220
    .line 221
    iget-object v3, v3, LQ2/d;->c:Landroid/content/SharedPreferences;

    .line 222
    .line 223
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 224
    .line 225
    .line 226
    move-result-object v3

    .line 227
    invoke-interface {v3, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 228
    .line 229
    .line 230
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 231
    .line 232
    .line 233
    invoke-virtual {v1, v4}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 234
    .line 235
    .line 236
    goto/16 :goto_7

    .line 237
    .line 238
    :pswitch_4
    invoke-static {v0, v2}, LQ2/h;->a(LQ2/h;Lk3/l;)Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v2

    .line 242
    iget-object v3, v0, LQ2/h;->f:LQ2/d;

    .line 243
    .line 244
    iget-object v3, v3, LQ2/d;->c:Landroid/content/SharedPreferences;

    .line 245
    .line 246
    invoke-interface {v3, v2}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    .line 247
    .line 248
    .line 249
    move-result v2

    .line 250
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 251
    .line 252
    .line 253
    move-result-object v2

    .line 254
    invoke-virtual {v1, v2}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 255
    .line 256
    .line 257
    goto/16 :goto_7

    .line 258
    .line 259
    :pswitch_5
    iget-object v2, v0, LQ2/h;->f:LQ2/d;

    .line 260
    .line 261
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 262
    .line 263
    .line 264
    :try_start_2
    invoke-virtual {v2}, LQ2/d;->p()Ljava/util/HashMap;

    .line 265
    .line 266
    .line 267
    move-result-object v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 268
    goto :goto_3

    .line 269
    :catch_1
    move-exception v3

    .line 270
    :try_start_3
    invoke-virtual {v2, v9, v4, v3}, LQ2/d;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)Z

    .line 271
    .line 272
    .line 273
    move-result v4

    .line 274
    if-eqz v4, :cond_4

    .line 275
    .line 276
    invoke-virtual {v2}, LQ2/d;->p()Ljava/util/HashMap;

    .line 277
    .line 278
    .line 279
    move-result-object v2

    .line 280
    :goto_3
    invoke-virtual {v1, v2}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 281
    .line 282
    .line 283
    goto/16 :goto_7

    .line 284
    .line 285
    :cond_4
    throw v3

    .line 286
    :pswitch_6
    invoke-static {v0, v2}, LQ2/h;->a(LQ2/h;Lk3/l;)Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object v2

    .line 290
    iget-object v3, v0, LQ2/h;->f:LQ2/d;

    .line 291
    .line 292
    iget-object v3, v3, LQ2/d;->c:Landroid/content/SharedPreferences;

    .line 293
    .line 294
    invoke-interface {v3, v2}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    .line 295
    .line 296
    .line 297
    move-result v3

    .line 298
    if-eqz v3, :cond_a

    .line 299
    .line 300
    iget-object v3, v0, LQ2/h;->f:LQ2/d;

    .line 301
    .line 302
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 303
    .line 304
    .line 305
    :try_start_4
    iget-object v5, v3, LQ2/d;->c:Landroid/content/SharedPreferences;

    .line 306
    .line 307
    invoke-interface {v5, v2, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object v5

    .line 311
    iget-object v8, v3, LQ2/d;->a:LQ2/e;

    .line 312
    .line 313
    iget-boolean v9, v8, LQ2/e;->e:Z

    .line 314
    .line 315
    if-eqz v9, :cond_5

    .line 316
    .line 317
    iget-boolean v8, v8, LQ2/e;->d:Z

    .line 318
    .line 319
    if-nez v8, :cond_5

    .line 320
    .line 321
    move-object v4, v5

    .line 322
    goto :goto_4

    .line 323
    :cond_5
    if-nez v5, :cond_6

    .line 324
    .line 325
    goto :goto_4

    .line 326
    :cond_6
    invoke-static {v5, v7}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 327
    .line 328
    .line 329
    move-result-object v5

    .line 330
    iget-object v8, v3, LQ2/d;->d:LR2/e;

    .line 331
    .line 332
    invoke-interface {v8, v5}, LR2/e;->d([B)[B

    .line 333
    .line 334
    .line 335
    move-result-object v5

    .line 336
    new-instance v8, Ljava/lang/String;

    .line 337
    .line 338
    sget-object v9, LQ2/d;->f:Ljava/nio/charset/Charset;

    .line 339
    .line 340
    invoke-direct {v8, v5, v9}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 341
    .line 342
    .line 343
    move-object v4, v8

    .line 344
    goto :goto_4

    .line 345
    :catch_2
    move-exception v5

    .line 346
    :try_start_5
    invoke-virtual {v3, v6, v2, v5}, LQ2/d;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)Z

    .line 347
    .line 348
    .line 349
    move-result v6

    .line 350
    if-eqz v6, :cond_9

    .line 351
    .line 352
    iget-object v5, v3, LQ2/d;->c:Landroid/content/SharedPreferences;

    .line 353
    .line 354
    invoke-interface {v5, v2, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 355
    .line 356
    .line 357
    move-result-object v2

    .line 358
    iget-object v5, v3, LQ2/d;->a:LQ2/e;

    .line 359
    .line 360
    iget-boolean v6, v5, LQ2/e;->e:Z

    .line 361
    .line 362
    if-eqz v6, :cond_7

    .line 363
    .line 364
    iget-boolean v5, v5, LQ2/e;->d:Z

    .line 365
    .line 366
    if-nez v5, :cond_7

    .line 367
    .line 368
    move-object v4, v2

    .line 369
    goto :goto_4

    .line 370
    :cond_7
    if-nez v2, :cond_8

    .line 371
    .line 372
    goto :goto_4

    .line 373
    :cond_8
    invoke-static {v2, v7}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 374
    .line 375
    .line 376
    move-result-object v2

    .line 377
    iget-object v3, v3, LQ2/d;->d:LR2/e;

    .line 378
    .line 379
    invoke-interface {v3, v2}, LR2/e;->d([B)[B

    .line 380
    .line 381
    .line 382
    move-result-object v2

    .line 383
    new-instance v4, Ljava/lang/String;

    .line 384
    .line 385
    sget-object v3, LQ2/d;->f:Ljava/nio/charset/Charset;

    .line 386
    .line 387
    invoke-direct {v4, v2, v3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 388
    .line 389
    .line 390
    :goto_4
    invoke-virtual {v1, v4}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 391
    .line 392
    .line 393
    goto :goto_7

    .line 394
    :cond_9
    throw v5

    .line 395
    :cond_a
    invoke-virtual {v1, v4}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 396
    .line 397
    .line 398
    goto :goto_7

    .line 399
    :pswitch_7
    invoke-static {v0, v2}, LQ2/h;->a(LQ2/h;Lk3/l;)Ljava/lang/String;

    .line 400
    .line 401
    .line 402
    move-result-object v3

    .line 403
    iget-object v2, v2, Lk3/l;->b:Ljava/lang/Object;

    .line 404
    .line 405
    check-cast v2, Ljava/util/Map;

    .line 406
    .line 407
    const-string v5, "value"

    .line 408
    .line 409
    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 410
    .line 411
    .line 412
    move-result-object v2

    .line 413
    check-cast v2, Ljava/lang/String;

    .line 414
    .line 415
    if-eqz v2, :cond_c

    .line 416
    .line 417
    iget-object v5, v0, LQ2/h;->f:LQ2/d;

    .line 418
    .line 419
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 420
    .line 421
    .line 422
    :try_start_6
    invoke-virtual {v5, v3, v2}, LQ2/d;->r(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3

    .line 423
    .line 424
    .line 425
    goto :goto_5

    .line 426
    :catch_3
    move-exception v6

    .line 427
    :try_start_7
    invoke-virtual {v5, v8, v3, v6}, LQ2/d;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)Z

    .line 428
    .line 429
    .line 430
    move-result v7

    .line 431
    if-eqz v7, :cond_b

    .line 432
    .line 433
    invoke-virtual {v5, v3, v2}, LQ2/d;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 434
    .line 435
    .line 436
    :goto_5
    invoke-virtual {v1, v4}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 437
    .line 438
    .line 439
    goto :goto_7

    .line 440
    :cond_b
    throw v6

    .line 441
    :cond_c
    const-string v2, "null"

    .line 442
    .line 443
    invoke-virtual {v1, v2, v4, v4}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0

    .line 444
    .line 445
    .line 446
    goto :goto_7

    .line 447
    :goto_6
    iget-object v3, p0, LA/c;->f:Ljava/lang/Object;

    .line 448
    .line 449
    check-cast v3, LQ2/e;

    .line 450
    .line 451
    iget-boolean v3, v3, LQ2/e;->c:Z

    .line 452
    .line 453
    if-eqz v3, :cond_d

    .line 454
    .line 455
    :try_start_8
    iget-object v0, v0, LQ2/h;->f:LQ2/d;

    .line 456
    .line 457
    iget-object v0, v0, LQ2/d;->c:Landroid/content/SharedPreferences;

    .line 458
    .line 459
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 460
    .line 461
    .line 462
    move-result-object v0

    .line 463
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 464
    .line 465
    .line 466
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 467
    .line 468
    .line 469
    const-string v0, "Data has been reset"

    .line 470
    .line 471
    invoke-virtual {v1, v0}, LQ2/g;->a(Ljava/lang/Object;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_4

    .line 472
    .line 473
    .line 474
    goto :goto_7

    .line 475
    :catch_4
    move-exception v0

    .line 476
    invoke-static {p1, v0}, LA/q;->a(LA/q;Ljava/lang/Exception;)V

    .line 477
    .line 478
    .line 479
    goto :goto_7

    .line 480
    :cond_d
    invoke-static {p1, v2}, LA/q;->a(LA/q;Ljava/lang/Exception;)V

    .line 481
    .line 482
    .line 483
    :goto_7
    return-void

    .line 484
    :pswitch_8
    invoke-static {p1}, LQ2/a;->g(Ljava/lang/Object;)Landroid/hardware/biometrics/BiometricPrompt$AuthenticationResult;

    .line 485
    .line 486
    .line 487
    move-result-object p1

    .line 488
    iget-object v0, p0, LA/c;->f:Ljava/lang/Object;

    .line 489
    .line 490
    check-cast v0, LQ2/i;

    .line 491
    .line 492
    const-string v1, "FlutterSecureStorage"

    .line 493
    .line 494
    :try_start_9
    iget-object v2, p0, LA/c;->g:Ljava/lang/Object;

    .line 495
    .line 496
    check-cast v2, LQ2/d;

    .line 497
    .line 498
    iget-object v3, v2, LQ2/d;->e:LD0/d;

    .line 499
    .line 500
    iget-object v4, v2, LQ2/d;->b:Landroid/content/Context;

    .line 501
    .line 502
    invoke-static {p1}, LQ2/a;->h(Landroid/hardware/biometrics/BiometricPrompt$AuthenticationResult;)Landroid/hardware/biometrics/BiometricPrompt$CryptoObject;

    .line 503
    .line 504
    .line 505
    move-result-object p1

    .line 506
    invoke-static {p1}, LQ2/a;->n(Landroid/hardware/biometrics/BiometricPrompt$CryptoObject;)Ljavax/crypto/Cipher;

    .line 507
    .line 508
    .line 509
    move-result-object p1

    .line 510
    invoke-virtual {v3, v4, p1}, LD0/d;->d(Landroid/content/Context;Ljavax/crypto/Cipher;)LR2/e;

    .line 511
    .line 512
    .line 513
    move-result-object p1

    .line 514
    iput-object p1, v2, LQ2/d;->d:LR2/e;

    .line 515
    .line 516
    const-string p1, "Biometric authentication succeeded"

    .line 517
    .line 518
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_5

    .line 519
    .line 520
    .line 521
    goto :goto_8

    .line 522
    :catch_5
    move-exception p1

    .line 523
    const-string v2, "Failed to initialize storage cipher after authentication"

    .line 524
    .line 525
    invoke-static {v1, v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 526
    .line 527
    .line 528
    invoke-interface {v0, p1}, LQ2/i;->h(Ljava/lang/Exception;)V

    .line 529
    .line 530
    .line 531
    :goto_8
    const/4 p1, 0x0

    .line 532
    invoke-interface {v0, p1}, LQ2/i;->b(Ljava/lang/Object;)V

    .line 533
    .line 534
    .line 535
    return-void

    .line 536
    nop

    .line 537
    :pswitch_data_0
    .packed-switch 0x11
        :pswitch_8
    .end packed-switch

    .line 538
    .line 539
    .line 540
    .line 541
    .line 542
    .line 543
    :sswitch_data_0
    .sparse-switch
        -0x658c4049 -> :sswitch_7
        -0x543e8045 -> :sswitch_6
        -0x4f997a55 -> :sswitch_5
        -0x1561e80a -> :sswitch_4
        0x355996 -> :sswitch_3
        0x6c257df -> :sswitch_2
        0xc6607c0 -> :sswitch_1
        0x4065382b -> :sswitch_0
    .end sparse-switch

    .line 544
    .line 545
    .line 546
    .line 547
    .line 548
    .line 549
    .line 550
    .line 551
    .line 552
    .line 553
    .line 554
    .line 555
    .line 556
    .line 557
    .line 558
    .line 559
    .line 560
    .line 561
    .line 562
    .line 563
    .line 564
    .line 565
    .line 566
    .line 567
    .line 568
    .line 569
    .line 570
    .line 571
    .line 572
    .line 573
    .line 574
    .line 575
    .line 576
    .line 577
    :pswitch_data_1
    .packed-switch 0x0
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

.method public c(LQ3/e;LA3/d;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget v0, p0, LA/c;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    instance-of v0, p2, LQ3/m;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    move-object v0, p2

    .line 11
    check-cast v0, LQ3/m;

    .line 12
    .line 13
    iget v1, v0, LQ3/m;->i:I

    .line 14
    .line 15
    const/high16 v2, -0x80000000

    .line 16
    .line 17
    and-int v3, v1, v2

    .line 18
    .line 19
    if-eqz v3, :cond_0

    .line 20
    .line 21
    sub-int/2addr v1, v2

    .line 22
    iput v1, v0, LQ3/m;->i:I

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    new-instance v0, LQ3/m;

    .line 26
    .line 27
    invoke-direct {v0, p0, p2}, LQ3/m;-><init>(LA/c;LA3/d;)V

    .line 28
    .line 29
    .line 30
    :goto_0
    iget-object p2, v0, LQ3/m;->h:Ljava/lang/Object;

    .line 31
    .line 32
    iget v1, v0, LQ3/m;->i:I

    .line 33
    .line 34
    const/4 v2, 0x1

    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    if-ne v1, v2, :cond_1

    .line 38
    .line 39
    iget-object p1, v0, LQ3/m;->k:Lv3/n;

    .line 40
    .line 41
    :try_start_0
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_0
    .catch LR3/a; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .line 43
    .line 44
    goto :goto_2

    .line 45
    :catch_0
    move-exception p2

    .line 46
    goto :goto_1

    .line 47
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 48
    .line 49
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 50
    .line 51
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    throw p1

    .line 55
    :cond_2
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    iget-object p2, p0, LA/c;->f:Ljava/lang/Object;

    .line 59
    .line 60
    check-cast p2, LA/c;

    .line 61
    .line 62
    new-instance v1, Lv3/n;

    .line 63
    .line 64
    iget-object v3, p0, LA/c;->g:Ljava/lang/Object;

    .line 65
    .line 66
    check-cast v3, LI/p;

    .line 67
    .line 68
    invoke-direct {v1, v3, p1}, Lv3/n;-><init>(LI/p;LQ3/e;)V

    .line 69
    .line 70
    .line 71
    :try_start_1
    iput-object v1, v0, LQ3/m;->k:Lv3/n;

    .line 72
    .line 73
    iput v2, v0, LQ3/m;->i:I

    .line 74
    .line 75
    invoke-virtual {p2, v1, v0}, LA/c;->c(LQ3/e;LA3/d;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p1
    :try_end_1
    .catch LR3/a; {:try_start_1 .. :try_end_1} :catch_1

    .line 79
    sget-object p2, LB3/a;->e:LB3/a;

    .line 80
    .line 81
    if-ne p1, p2, :cond_3

    .line 82
    .line 83
    goto :goto_3

    .line 84
    :catch_1
    move-exception p2

    .line 85
    move-object p1, v1

    .line 86
    :goto_1
    iget-object v1, p2, LR3/a;->e:Ljava/lang/Object;

    .line 87
    .line 88
    if-ne v1, p1, :cond_4

    .line 89
    .line 90
    iget-object p1, v0, LC3/c;->f:LA3/i;

    .line 91
    .line 92
    invoke-static {p1}, LI3/h;->b(Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    invoke-static {p1}, LN3/v;->a(LA3/i;)V

    .line 96
    .line 97
    .line 98
    :cond_3
    :goto_2
    sget-object p2, Ly3/h;->a:Ly3/h;

    .line 99
    .line 100
    :goto_3
    return-object p2

    .line 101
    :cond_4
    throw p2

    .line 102
    :pswitch_0
    new-instance v0, LI3/n;

    .line 103
    .line 104
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 105
    .line 106
    .line 107
    iget-object v1, p0, LA/c;->f:Ljava/lang/Object;

    .line 108
    .line 109
    check-cast v1, LA/c;

    .line 110
    .line 111
    new-instance v2, LQ3/l;

    .line 112
    .line 113
    iget-object v3, p0, LA/c;->g:Ljava/lang/Object;

    .line 114
    .line 115
    check-cast v3, LI/q;

    .line 116
    .line 117
    invoke-direct {v2, v0, p1, v3}, LQ3/l;-><init>(LI3/n;LQ3/e;LI/q;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1, v2, p2}, LA/c;->c(LQ3/e;LA3/d;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    sget-object p2, LB3/a;->e:LB3/a;

    .line 125
    .line 126
    if-ne p1, p2, :cond_5

    .line 127
    .line 128
    goto :goto_4

    .line 129
    :cond_5
    sget-object p1, Ly3/h;->a:Ly3/h;

    .line 130
    .line 131
    :goto_4
    return-object p1

    .line 132
    :pswitch_1
    instance-of v0, p2, LQ3/j;

    .line 133
    .line 134
    if-eqz v0, :cond_6

    .line 135
    .line 136
    move-object v0, p2

    .line 137
    check-cast v0, LQ3/j;

    .line 138
    .line 139
    iget v1, v0, LQ3/j;->i:I

    .line 140
    .line 141
    const/high16 v2, -0x80000000

    .line 142
    .line 143
    and-int v3, v1, v2

    .line 144
    .line 145
    if-eqz v3, :cond_6

    .line 146
    .line 147
    sub-int/2addr v1, v2

    .line 148
    iput v1, v0, LQ3/j;->i:I

    .line 149
    .line 150
    goto :goto_5

    .line 151
    :cond_6
    new-instance v0, LQ3/j;

    .line 152
    .line 153
    invoke-direct {v0, p0, p2}, LQ3/j;-><init>(LA/c;LA3/d;)V

    .line 154
    .line 155
    .line 156
    :goto_5
    iget-object p2, v0, LQ3/j;->h:Ljava/lang/Object;

    .line 157
    .line 158
    iget v1, v0, LQ3/j;->i:I

    .line 159
    .line 160
    const/4 v2, 0x2

    .line 161
    const/4 v3, 0x1

    .line 162
    sget-object v4, LB3/a;->e:LB3/a;

    .line 163
    .line 164
    if-eqz v1, :cond_9

    .line 165
    .line 166
    if-eq v1, v3, :cond_8

    .line 167
    .line 168
    if-ne v1, v2, :cond_7

    .line 169
    .line 170
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 171
    .line 172
    .line 173
    goto :goto_7

    .line 174
    :cond_7
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 175
    .line 176
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 177
    .line 178
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    throw p1

    .line 182
    :cond_8
    iget-object p1, v0, LQ3/j;->m:LR3/l;

    .line 183
    .line 184
    iget-object v1, v0, LQ3/j;->l:LQ3/e;

    .line 185
    .line 186
    iget-object v3, v0, LQ3/j;->k:LA/c;

    .line 187
    .line 188
    :try_start_2
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 189
    .line 190
    .line 191
    goto :goto_6

    .line 192
    :catchall_0
    move-exception p2

    .line 193
    goto :goto_9

    .line 194
    :cond_9
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 195
    .line 196
    .line 197
    new-instance p2, LR3/l;

    .line 198
    .line 199
    iget-object v1, v0, LC3/c;->f:LA3/i;

    .line 200
    .line 201
    invoke-static {v1}, LI3/h;->b(Ljava/lang/Object;)V

    .line 202
    .line 203
    .line 204
    invoke-direct {p2, p1, v1}, LR3/l;-><init>(LQ3/e;LA3/i;)V

    .line 205
    .line 206
    .line 207
    :try_start_3
    iget-object v1, p0, LA/c;->f:Ljava/lang/Object;

    .line 208
    .line 209
    check-cast v1, LI/o;

    .line 210
    .line 211
    iput-object p0, v0, LQ3/j;->k:LA/c;

    .line 212
    .line 213
    iput-object p1, v0, LQ3/j;->l:LQ3/e;

    .line 214
    .line 215
    iput-object p2, v0, LQ3/j;->m:LR3/l;

    .line 216
    .line 217
    iput v3, v0, LQ3/j;->i:I

    .line 218
    .line 219
    invoke-virtual {v1, p2, v0}, LI/o;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    move-result-object v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 223
    if-ne v1, v4, :cond_a

    .line 224
    .line 225
    goto :goto_8

    .line 226
    :cond_a
    move-object v3, p0

    .line 227
    move-object v1, p1

    .line 228
    move-object p1, p2

    .line 229
    :goto_6
    invoke-virtual {p1}, LC3/c;->n()V

    .line 230
    .line 231
    .line 232
    iget-object p1, v3, LA/c;->g:Ljava/lang/Object;

    .line 233
    .line 234
    check-cast p1, LQ3/d;

    .line 235
    .line 236
    const/4 p2, 0x0

    .line 237
    iput-object p2, v0, LQ3/j;->k:LA/c;

    .line 238
    .line 239
    iput-object p2, v0, LQ3/j;->l:LQ3/e;

    .line 240
    .line 241
    iput-object p2, v0, LQ3/j;->m:LR3/l;

    .line 242
    .line 243
    iput v2, v0, LQ3/j;->i:I

    .line 244
    .line 245
    invoke-interface {p1, v1, v0}, LQ3/d;->c(LQ3/e;LA3/d;)Ljava/lang/Object;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    if-ne p1, v4, :cond_b

    .line 250
    .line 251
    goto :goto_8

    .line 252
    :cond_b
    :goto_7
    sget-object v4, Ly3/h;->a:Ly3/h;

    .line 253
    .line 254
    :goto_8
    return-object v4

    .line 255
    :catchall_1
    move-exception p1

    .line 256
    move-object v5, p2

    .line 257
    move-object p2, p1

    .line 258
    move-object p1, v5

    .line 259
    :goto_9
    invoke-virtual {p1}, LC3/c;->n()V

    .line 260
    .line 261
    .line 262
    throw p2

    .line 263
    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public d(LT2/b;)V
    .locals 4

    .line 1
    iget v0, p0, LA/c;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object p1, p1, LT2/b;->a:Lr2/m;

    .line 7
    .line 8
    iget-object v0, p1, Lr2/m;->d:Lr2/a;

    .line 9
    .line 10
    iget-object v1, p0, LA/c;->f:Ljava/lang/Object;

    .line 11
    .line 12
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    :cond_0
    iget-object v1, p1, Lr2/m;->a:Ljava/lang/String;

    .line 25
    .line 26
    new-instance v2, Ly3/c;

    .line 27
    .line 28
    const-string v3, "code"

    .line 29
    .line 30
    invoke-direct {v2, v3, v1}, Ly3/c;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ly3/c;

    .line 38
    .line 39
    const-string v3, "type"

    .line 40
    .line 41
    invoke-direct {v1, v3, v0}, Ly3/c;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p1, Lr2/m;->b:[B

    .line 45
    .line 46
    new-instance v0, Ly3/c;

    .line 47
    .line 48
    const-string v3, "rawBytes"

    .line 49
    .line 50
    invoke-direct {v0, v3, p1}, Ly3/c;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    filled-new-array {v2, v1, v0}, [Ly3/c;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-static {p1}, Lz3/o;->L([Ly3/c;)Ljava/util/Map;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iget-object v0, p0, LA/c;->g:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast v0, LX3/d;

    .line 64
    .line 65
    iget-object v0, v0, LX3/d;->h:Lk3/o;

    .line 66
    .line 67
    const-string v1, "onRecognizeQR"

    .line 68
    .line 69
    const/4 v2, 0x0

    .line 70
    invoke-virtual {v0, v1, p1, v2}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    return-void

    .line 74
    :pswitch_0
    iget-object v0, p0, LA/c;->f:Ljava/lang/Object;

    .line 75
    .line 76
    check-cast v0, LA0/c;

    .line 77
    .line 78
    invoke-virtual {v0, p1}, LA0/c;->d(LT2/b;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    nop

    .line 83
    :pswitch_data_0
    .packed-switch 0x18
        :pswitch_0
    .end packed-switch
.end method

.method public e(Li1/h;)Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, LA/c;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LJ0/b;

    .line 4
    .line 5
    iget-object v1, p0, LA/c;->g:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Landroid/os/Bundle;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Li1/h;->e()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    return-object p1

    .line 19
    :cond_0
    invoke-virtual {p1}, Li1/h;->c()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Landroid/os/Bundle;

    .line 24
    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    const-string v3, "google.messenger"

    .line 28
    .line 29
    invoke-virtual {v2, v3}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_1

    .line 34
    .line 35
    invoke-virtual {v0, v1}, LJ0/b;->a(Landroid/os/Bundle;)Li1/p;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    sget-object v0, LJ0/h;->g:LJ0/h;

    .line 40
    .line 41
    sget-object v1, LJ0/d;->h:LJ0/d;

    .line 42
    .line 43
    invoke-virtual {p1, v0, v1}, Li1/p;->j(Ljava/util/concurrent/Executor;Li1/g;)Li1/p;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    :cond_1
    return-object p1
.end method

.method public f(Li1/h;)V
    .locals 1

    .line 1
    iget-object p1, p0, LA/c;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, LM0/f;

    .line 4
    .line 5
    iget-object p1, p1, LM0/f;->b:Ljava/util/Map;

    .line 6
    .line 7
    iget-object v0, p0, LA/c;->f:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Li1/i;

    .line 10
    .line 11
    invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public g(Landroid/content/Context;)Ljavax/crypto/Cipher;
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    return-object p1
.end method

.method public get()Ljava/lang/Object;
    .locals 6

    .line 1
    new-instance v1, LK0/h;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    invoke-direct {v1, v0}, LK0/h;-><init>(I)V

    .line 5
    .line 6
    .line 7
    new-instance v2, LN1/e;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-direct {v2, v0}, LN1/e;-><init>(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, LA/c;->f:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, Lx3/a;

    .line 16
    .line 17
    invoke-interface {v0}, Lx3/a;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v3, p0, LA/c;->g:Ljava/lang/Object;

    .line 22
    .line 23
    move-object v5, v3

    .line 24
    check-cast v5, Lx3/a;

    .line 25
    .line 26
    move-object v3, v0

    .line 27
    new-instance v0, LF0/h;

    .line 28
    .line 29
    move-object v4, v3

    .line 30
    check-cast v4, LF0/j;

    .line 31
    .line 32
    sget-object v3, LF0/a;->f:LF0/a;

    .line 33
    .line 34
    invoke-direct/range {v0 .. v5}, LF0/h;-><init>(LH0/a;LH0/a;LF0/a;LF0/j;Lx3/a;)V

    .line 35
    .line 36
    .line 37
    return-object v0
.end method

.method public h(Ljava/lang/Exception;)V
    .locals 1

    .line 1
    iget v0, p0, LA/c;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LA/c;->g:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, LA/q;

    .line 9
    .line 10
    invoke-static {v0, p1}, LA/q;->a(LA/q;Ljava/lang/Exception;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :pswitch_0
    iget-object v0, p0, LA/c;->f:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, LQ2/i;

    .line 17
    .line 18
    invoke-interface {v0, p1}, LQ2/i;->h(Ljava/lang/Exception;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    nop

    .line 23
    :pswitch_data_0
    .packed-switch 0x11
        :pswitch_0
    .end packed-switch
.end method

.method public i([B)Ljava/security/Key;
    .locals 4

    .line 1
    const-string v0, "AndroidKeyStore"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Ljava/security/KeyStore;->load(Ljava/security/KeyStore$LoadStoreParameter;)V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, LA/c;->f:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v2, Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v2, v1}, Ljava/security/KeyStore;->getKey(Ljava/lang/String;[C)Ljava/security/Key;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    instance-of v1, v0, Ljava/security/PrivateKey;

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    check-cast v0, Ljava/security/PrivateKey;

    .line 26
    .line 27
    invoke-virtual {p0}, LA/c;->A()Ljavax/crypto/Cipher;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const/4 v2, 0x4

    .line 32
    invoke-virtual {p0}, LA/c;->v()Ljava/security/spec/AlgorithmParameterSpec;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-virtual {v1, v2, v0, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 37
    .line 38
    .line 39
    const/4 v0, 0x3

    .line 40
    const-string v2, "AES"

    .line 41
    .line 42
    invoke-virtual {v1, p1, v2, v0}, Ljavax/crypto/Cipher;->unwrap([BLjava/lang/String;I)Ljava/security/Key;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    return-object p1

    .line 47
    :cond_0
    new-instance p1, Ljava/lang/Exception;

    .line 48
    .line 49
    const-string v0, "Not an instance of a PrivateKey"

    .line 50
    .line 51
    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    throw p1

    .line 55
    :cond_1
    new-instance p1, Ljava/lang/Exception;

    .line 56
    .line 57
    const-string v0, "No key found under alias: "

    .line 58
    .line 59
    invoke-static {v0, v2}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    throw p1
.end method

.method public j(Ljavax/crypto/spec/SecretKeySpec;)[B
    .locals 4

    .line 1
    const-string v0, "AndroidKeyStore"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Ljava/security/KeyStore;->load(Ljava/security/KeyStore$LoadStoreParameter;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, LA/c;->f:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v1, Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/security/KeyStore;->getCertificate(Ljava/lang/String;)Ljava/security/cert/Certificate;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/security/cert/Certificate;->getPublicKey()Ljava/security/PublicKey;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, LA/c;->A()Ljavax/crypto/Cipher;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const/4 v2, 0x3

    .line 32
    invoke-virtual {p0}, LA/c;->v()Ljava/security/spec/AlgorithmParameterSpec;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-virtual {v1, v2, v0, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, p1}, Ljavax/crypto/Cipher;->wrap(Ljava/security/Key;)[B

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    return-object p1

    .line 44
    :cond_0
    new-instance p1, Ljava/lang/Exception;

    .line 45
    .line 46
    const-string v0, "No key found under alias: "

    .line 47
    .line 48
    invoke-static {v0, v1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    throw p1

    .line 56
    :cond_1
    new-instance p1, Ljava/lang/Exception;

    .line 57
    .line 58
    const-string v0, "No certificate found under alias: "

    .line 59
    .line 60
    invoke-static {v0, v1}, Lr/a;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    throw p1
.end method

.method public k(Ljava/util/List;)V
    .locals 4

    .line 1
    iget v0, p0, LA/c;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const-string v0, "resultPoints"

    .line 7
    .line 8
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :pswitch_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lr2/o;

    .line 27
    .line 28
    iget-object v1, p0, LA/c;->g:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v1, Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;->f:Lcom/journeyapps/barcodescanner/ViewfinderView;

    .line 33
    .line 34
    iget-object v2, v1, Lcom/journeyapps/barcodescanner/ViewfinderView;->k:Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    const/16 v3, 0x14

    .line 41
    .line 42
    if-ge v2, v3, :cond_0

    .line 43
    .line 44
    iget-object v1, v1, Lcom/journeyapps/barcodescanner/ViewfinderView;->k:Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    return-void

    .line 51
    :pswitch_data_0
    .packed-switch 0x18
        :pswitch_0
    .end packed-switch
.end method

.method public l()V
    .locals 2

    .line 1
    const-string v0, "AndroidKeyStore"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Ljava/security/KeyStore;->load(Ljava/security/KeyStore$LoadStoreParameter;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, LA/c;->f:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v1, Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/security/KeyStore;->deleteEntry(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public n(LA/c;)LA/c;
    .locals 8

    .line 1
    iget-object v0, p0, LA/c;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LL2/a;

    .line 4
    .line 5
    iget-object v1, p1, LA/c;->f:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, LL2/a;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_4

    .line 14
    .line 15
    invoke-virtual {p0}, LA/c;->F()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    return-object p1

    .line 22
    :cond_0
    invoke-virtual {p1}, LA/c;->F()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    iget-object v1, p0, LA/c;->g:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast v1, [I

    .line 32
    .line 33
    iget-object p1, p1, LA/c;->g:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast p1, [I

    .line 36
    .line 37
    array-length v2, v1

    .line 38
    array-length v3, p1

    .line 39
    if-le v2, v3, :cond_2

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    move-object v7, v1

    .line 43
    move-object v1, p1

    .line 44
    move-object p1, v7

    .line 45
    :goto_0
    array-length v2, v1

    .line 46
    new-array v2, v2, [I

    .line 47
    .line 48
    array-length v3, v1

    .line 49
    array-length v4, p1

    .line 50
    sub-int/2addr v3, v4

    .line 51
    const/4 v4, 0x0

    .line 52
    invoke-static {v1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 53
    .line 54
    .line 55
    move v4, v3

    .line 56
    :goto_1
    array-length v5, v1

    .line 57
    if-ge v4, v5, :cond_3

    .line 58
    .line 59
    sub-int v5, v4, v3

    .line 60
    .line 61
    aget v5, p1, v5

    .line 62
    .line 63
    aget v6, v1, v4

    .line 64
    .line 65
    invoke-virtual {v0, v5, v6}, LL2/a;->a(II)I

    .line 66
    .line 67
    .line 68
    move-result v5

    .line 69
    aput v5, v2, v4

    .line 70
    .line 71
    add-int/lit8 v4, v4, 0x1

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_3
    new-instance p1, LA/c;

    .line 75
    .line 76
    invoke-direct {p1, v0, v2}, LA/c;-><init>(LL2/a;[I)V

    .line 77
    .line 78
    .line 79
    return-object p1

    .line 80
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 81
    .line 82
    const-string v0, "ModulusPolys do not have same ModulusGF field"

    .line 83
    .line 84
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    throw p1
.end method

.method public o(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    new-instance v2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    add-int/lit8 v0, v0, 0x1

    .line 16
    .line 17
    add-int/2addr v0, v1

    .line 18
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string p2, "="

    .line 25
    .line 26
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object p2, p0, LA/c;->f:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast p2, Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public onMethodCall(Lk3/l;Lk3/n;)V
    .locals 18

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    iget-object v2, v1, LA/c;->f:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v2, Landroid/content/Context;

    .line 8
    .line 9
    const/4 v3, 0x1

    .line 10
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v4

    .line 14
    iget-object v5, v0, Lk3/l;->a:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    .line 20
    .line 21
    .line 22
    move-result v6

    .line 23
    const/4 v7, 0x3

    .line 24
    const/4 v8, 0x0

    .line 25
    const/4 v9, -0x1

    .line 26
    sparse-switch v6, :sswitch_data_0

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :sswitch_0
    const-string v6, "cancelJob"

    .line 31
    .line 32
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    if-nez v5, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const/4 v9, 0x5

    .line 40
    goto :goto_0

    .line 41
    :sswitch_1
    const-string v6, "printingInfo"

    .line 42
    .line 43
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    if-nez v5, :cond_1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    const/4 v9, 0x4

    .line 51
    goto :goto_0

    .line 52
    :sswitch_2
    const-string v6, "rasterPdf"

    .line 53
    .line 54
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    if-nez v5, :cond_2

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    move v9, v7

    .line 62
    goto :goto_0

    .line 63
    :sswitch_3
    const-string v6, "sharePdf"

    .line 64
    .line 65
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v5

    .line 69
    if-nez v5, :cond_3

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_3
    const/4 v9, 0x2

    .line 73
    goto :goto_0

    .line 74
    :sswitch_4
    const-string v6, "convertHtml"

    .line 75
    .line 76
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v5

    .line 80
    if-nez v5, :cond_4

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_4
    move v9, v3

    .line 84
    goto :goto_0

    .line 85
    :sswitch_5
    const-string v6, "printPdf"

    .line 86
    .line 87
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v5

    .line 91
    if-nez v5, :cond_5

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_5
    move v9, v8

    .line 95
    :goto_0
    const-string v5, "height"

    .line 96
    .line 97
    const-string v6, "width"

    .line 98
    .line 99
    const-string v10, "name"

    .line 100
    .line 101
    const-string v11, "doc"

    .line 102
    .line 103
    const/4 v12, 0x0

    .line 104
    const-string v13, "job"

    .line 105
    .line 106
    const-wide/high16 v14, 0x4052000000000000L    # 72.0

    .line 107
    .line 108
    const-wide v16, 0x408f400000000000L    # 1000.0

    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    packed-switch v9, :pswitch_data_0

    .line 114
    .line 115
    .line 116
    move-object/from16 v0, p2

    .line 117
    .line 118
    check-cast v0, LQ2/g;

    .line 119
    .line 120
    invoke-virtual {v0}, LQ2/g;->b()V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :pswitch_0
    new-instance v3, LW3/f;

    .line 125
    .line 126
    invoke-virtual {v0, v13}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    check-cast v0, Ljava/lang/Integer;

    .line 131
    .line 132
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    invoke-direct {v3, v2, v1, v0}, LW3/f;-><init>(Landroid/content/Context;LA/c;I)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v3, v12}, LW3/f;->a(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    move-object/from16 v0, p2

    .line 143
    .line 144
    check-cast v0, LQ2/g;

    .line 145
    .line 146
    invoke-virtual {v0, v4}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :pswitch_1
    sget-object v0, LW3/f;->h:Landroid/print/PrintManager;

    .line 151
    .line 152
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 153
    .line 154
    new-instance v2, Ljava/util/HashMap;

    .line 155
    .line 156
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 157
    .line 158
    .line 159
    const-string v3, "directPrint"

    .line 160
    .line 161
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 162
    .line 163
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    const-string v3, "dynamicLayout"

    .line 167
    .line 168
    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    const-string v3, "canPrint"

    .line 172
    .line 173
    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    const-string v3, "canShare"

    .line 177
    .line 178
    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    const-string v3, "canRaster"

    .line 182
    .line 183
    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-object/from16 v0, p2

    .line 187
    .line 188
    check-cast v0, LQ2/g;

    .line 189
    .line 190
    invoke-virtual {v0, v2}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 191
    .line 192
    .line 193
    return-void

    .line 194
    :pswitch_2
    invoke-virtual {v0, v11}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v3

    .line 198
    move-object v7, v3

    .line 199
    check-cast v7, [B

    .line 200
    .line 201
    const-string v3, "pages"

    .line 202
    .line 203
    invoke-virtual {v0, v3}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object v3

    .line 207
    move-object v8, v3

    .line 208
    check-cast v8, Ljava/util/ArrayList;

    .line 209
    .line 210
    const-string v3, "scale"

    .line 211
    .line 212
    invoke-virtual {v0, v3}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object v3

    .line 216
    move-object v9, v3

    .line 217
    check-cast v9, Ljava/lang/Double;

    .line 218
    .line 219
    new-instance v6, LW3/f;

    .line 220
    .line 221
    invoke-virtual {v0, v13}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    check-cast v0, Ljava/lang/Integer;

    .line 226
    .line 227
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    invoke-direct {v6, v2, v1, v0}, LW3/f;-><init>(Landroid/content/Context;LA/c;I)V

    .line 232
    .line 233
    .line 234
    new-instance v0, Ljava/lang/Thread;

    .line 235
    .line 236
    new-instance v5, LQ2/f;

    .line 237
    .line 238
    const/4 v10, 0x1

    .line 239
    invoke-direct/range {v5 .. v10}, LQ2/f;-><init>(Ljava/lang/Object;Ljava/io/Serializable;Ljava/io/Serializable;Ljava/lang/Object;I)V

    .line 240
    .line 241
    .line 242
    invoke-direct {v0, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 243
    .line 244
    .line 245
    new-instance v2, LW3/b;

    .line 246
    .line 247
    invoke-direct {v2, v6}, LW3/b;-><init>(LW3/f;)V

    .line 248
    .line 249
    .line 250
    invoke-virtual {v0, v2}, Ljava/lang/Thread;->setUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 251
    .line 252
    .line 253
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 254
    .line 255
    .line 256
    move-object/from16 v0, p2

    .line 257
    .line 258
    check-cast v0, LQ2/g;

    .line 259
    .line 260
    invoke-virtual {v0, v4}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 261
    .line 262
    .line 263
    return-void

    .line 264
    :pswitch_3
    invoke-virtual {v0, v11}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 265
    .line 266
    .line 267
    move-result-object v5

    .line 268
    check-cast v5, [B

    .line 269
    .line 270
    invoke-virtual {v0, v10}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 271
    .line 272
    .line 273
    move-result-object v6

    .line 274
    check-cast v6, Ljava/lang/String;

    .line 275
    .line 276
    const-string v9, "subject"

    .line 277
    .line 278
    invoke-virtual {v0, v9}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 279
    .line 280
    .line 281
    move-result-object v9

    .line 282
    check-cast v9, Ljava/lang/String;

    .line 283
    .line 284
    const-string v10, "body"

    .line 285
    .line 286
    invoke-virtual {v0, v10}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 287
    .line 288
    .line 289
    move-result-object v10

    .line 290
    check-cast v10, Ljava/lang/String;

    .line 291
    .line 292
    const-string v11, "emails"

    .line 293
    .line 294
    invoke-virtual {v0, v11}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 295
    .line 296
    .line 297
    move-result-object v0

    .line 298
    check-cast v0, Ljava/util/ArrayList;

    .line 299
    .line 300
    sget-object v11, LW3/f;->h:Landroid/print/PrintManager;

    .line 301
    .line 302
    :try_start_0
    new-instance v11, Ljava/io/File;

    .line 303
    .line 304
    invoke-virtual {v2}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    .line 305
    .line 306
    .line 307
    move-result-object v13

    .line 308
    const-string v14, "share"

    .line 309
    .line 310
    invoke-direct {v11, v13, v14}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 311
    .line 312
    .line 313
    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    .line 314
    .line 315
    .line 316
    move-result v13

    .line 317
    if-nez v13, :cond_7

    .line 318
    .line 319
    invoke-virtual {v11}, Ljava/io/File;->mkdirs()Z

    .line 320
    .line 321
    .line 322
    move-result v13

    .line 323
    if-eqz v13, :cond_6

    .line 324
    .line 325
    goto :goto_1

    .line 326
    :cond_6
    new-instance v0, Ljava/io/IOException;

    .line 327
    .line 328
    const-string v2, "Unable to create cache directory"

    .line 329
    .line 330
    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 331
    .line 332
    .line 333
    throw v0

    .line 334
    :catch_0
    move-exception v0

    .line 335
    goto/16 :goto_4

    .line 336
    .line 337
    :cond_7
    :goto_1
    new-instance v13, Ljava/io/File;

    .line 338
    .line 339
    invoke-direct {v13, v11, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 340
    .line 341
    .line 342
    new-instance v6, Ljava/io/FileOutputStream;

    .line 343
    .line 344
    invoke-direct {v6, v13}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 345
    .line 346
    .line 347
    invoke-virtual {v6, v5}, Ljava/io/FileOutputStream;->write([B)V

    .line 348
    .line 349
    .line 350
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V

    .line 351
    .line 352
    .line 353
    new-instance v5, Ljava/lang/StringBuilder;

    .line 354
    .line 355
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 356
    .line 357
    .line 358
    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 359
    .line 360
    .line 361
    move-result-object v6

    .line 362
    invoke-virtual {v6}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 363
    .line 364
    .line 365
    move-result-object v6

    .line 366
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 367
    .line 368
    .line 369
    const-string v6, ".flutter.printing"

    .line 370
    .line 371
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 372
    .line 373
    .line 374
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 375
    .line 376
    .line 377
    move-result-object v5

    .line 378
    invoke-static {v2, v5, v13}, Lu/e;->d(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    .line 379
    .line 380
    .line 381
    move-result-object v5

    .line 382
    new-instance v6, Landroid/content/Intent;

    .line 383
    .line 384
    invoke-direct {v6}, Landroid/content/Intent;-><init>()V

    .line 385
    .line 386
    .line 387
    const-string v11, "android.intent.action.SEND"

    .line 388
    .line 389
    invoke-virtual {v6, v11}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 390
    .line 391
    .line 392
    const-string v11, "application/pdf"

    .line 393
    .line 394
    invoke-virtual {v6, v11}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 395
    .line 396
    .line 397
    const-string v11, "android.intent.extra.STREAM"

    .line 398
    .line 399
    invoke-virtual {v6, v11, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 400
    .line 401
    .line 402
    invoke-virtual {v6, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 403
    .line 404
    .line 405
    const-string v3, "android.intent.extra.SUBJECT"

    .line 406
    .line 407
    invoke-virtual {v6, v3, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 408
    .line 409
    .line 410
    const-string v3, "android.intent.extra.TEXT"

    .line 411
    .line 412
    invoke-virtual {v6, v3, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 413
    .line 414
    .line 415
    const-string v3, "android.intent.extra.EMAIL"

    .line 416
    .line 417
    if-eqz v0, :cond_8

    .line 418
    .line 419
    new-array v8, v8, [Ljava/lang/String;

    .line 420
    .line 421
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 422
    .line 423
    .line 424
    move-result-object v0

    .line 425
    check-cast v0, [Ljava/lang/String;

    .line 426
    .line 427
    goto :goto_2

    .line 428
    :cond_8
    move-object v0, v12

    .line 429
    :goto_2
    invoke-virtual {v6, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 430
    .line 431
    .line 432
    invoke-static {v6, v12}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    .line 433
    .line 434
    .line 435
    move-result-object v0

    .line 436
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 437
    .line 438
    .line 439
    move-result-object v3

    .line 440
    const/high16 v6, 0x10000

    .line 441
    .line 442
    invoke-virtual {v3, v0, v6}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    .line 443
    .line 444
    .line 445
    move-result-object v3

    .line 446
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 447
    .line 448
    .line 449
    move-result-object v3

    .line 450
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 451
    .line 452
    .line 453
    move-result v6

    .line 454
    if-eqz v6, :cond_9

    .line 455
    .line 456
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 457
    .line 458
    .line 459
    move-result-object v6

    .line 460
    check-cast v6, Landroid/content/pm/ResolveInfo;

    .line 461
    .line 462
    iget-object v6, v6, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    .line 463
    .line 464
    iget-object v6, v6, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 465
    .line 466
    invoke-virtual {v2, v6, v5, v7}, Landroid/content/Context;->grantUriPermission(Ljava/lang/String;Landroid/net/Uri;I)V

    .line 467
    .line 468
    .line 469
    goto :goto_3

    .line 470
    :cond_9
    invoke-virtual {v2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 471
    .line 472
    .line 473
    invoke-virtual {v13}, Ljava/io/File;->deleteOnExit()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 474
    .line 475
    .line 476
    goto :goto_5

    .line 477
    :goto_4
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 478
    .line 479
    .line 480
    :goto_5
    move-object/from16 v0, p2

    .line 481
    .line 482
    check-cast v0, LQ2/g;

    .line 483
    .line 484
    invoke-virtual {v0, v4}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 485
    .line 486
    .line 487
    return-void

    .line 488
    :pswitch_4
    invoke-virtual {v0, v6}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 489
    .line 490
    .line 491
    move-result-object v3

    .line 492
    check-cast v3, Ljava/lang/Double;

    .line 493
    .line 494
    invoke-virtual {v0, v5}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 495
    .line 496
    .line 497
    move-result-object v5

    .line 498
    check-cast v5, Ljava/lang/Double;

    .line 499
    .line 500
    const-string v6, "marginLeft"

    .line 501
    .line 502
    invoke-virtual {v0, v6}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 503
    .line 504
    .line 505
    move-result-object v6

    .line 506
    check-cast v6, Ljava/lang/Double;

    .line 507
    .line 508
    const-string v7, "marginTop"

    .line 509
    .line 510
    invoke-virtual {v0, v7}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 511
    .line 512
    .line 513
    move-result-object v7

    .line 514
    check-cast v7, Ljava/lang/Double;

    .line 515
    .line 516
    const-string v8, "marginRight"

    .line 517
    .line 518
    invoke-virtual {v0, v8}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 519
    .line 520
    .line 521
    move-result-object v8

    .line 522
    check-cast v8, Ljava/lang/Double;

    .line 523
    .line 524
    const-string v9, "marginBottom"

    .line 525
    .line 526
    invoke-virtual {v0, v9}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 527
    .line 528
    .line 529
    move-result-object v9

    .line 530
    check-cast v9, Ljava/lang/Double;

    .line 531
    .line 532
    new-instance v10, LW3/f;

    .line 533
    .line 534
    invoke-virtual {v0, v13}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 535
    .line 536
    .line 537
    move-result-object v11

    .line 538
    check-cast v11, Ljava/lang/Integer;

    .line 539
    .line 540
    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    .line 541
    .line 542
    .line 543
    move-result v11

    .line 544
    invoke-direct {v10, v2, v1, v11}, LW3/f;-><init>(Landroid/content/Context;LA/c;I)V

    .line 545
    .line 546
    .line 547
    new-instance v2, Landroid/print/PrintAttributes$Margins;

    .line 548
    .line 549
    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    .line 550
    .line 551
    .line 552
    move-result-wide v11

    .line 553
    mul-double v11, v11, v16

    .line 554
    .line 555
    invoke-static {v11, v12}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 556
    .line 557
    .line 558
    move-result-object v6

    .line 559
    invoke-virtual {v6}, Ljava/lang/Double;->intValue()I

    .line 560
    .line 561
    .line 562
    move-result v6

    .line 563
    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    .line 564
    .line 565
    .line 566
    move-result-wide v11

    .line 567
    mul-double v11, v11, v16

    .line 568
    .line 569
    div-double/2addr v11, v14

    .line 570
    invoke-static {v11, v12}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 571
    .line 572
    .line 573
    move-result-object v7

    .line 574
    invoke-virtual {v7}, Ljava/lang/Double;->intValue()I

    .line 575
    .line 576
    .line 577
    move-result v7

    .line 578
    invoke-virtual {v8}, Ljava/lang/Double;->doubleValue()D

    .line 579
    .line 580
    .line 581
    move-result-wide v11

    .line 582
    mul-double v11, v11, v16

    .line 583
    .line 584
    div-double/2addr v11, v14

    .line 585
    invoke-static {v11, v12}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 586
    .line 587
    .line 588
    move-result-object v8

    .line 589
    invoke-virtual {v8}, Ljava/lang/Double;->intValue()I

    .line 590
    .line 591
    .line 592
    move-result v8

    .line 593
    invoke-virtual {v9}, Ljava/lang/Double;->doubleValue()D

    .line 594
    .line 595
    .line 596
    move-result-wide v11

    .line 597
    mul-double v11, v11, v16

    .line 598
    .line 599
    div-double/2addr v11, v14

    .line 600
    invoke-static {v11, v12}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 601
    .line 602
    .line 603
    move-result-object v9

    .line 604
    invoke-virtual {v9}, Ljava/lang/Double;->intValue()I

    .line 605
    .line 606
    .line 607
    move-result v9

    .line 608
    invoke-direct {v2, v6, v7, v8, v9}, Landroid/print/PrintAttributes$Margins;-><init>(IIII)V

    .line 609
    .line 610
    .line 611
    new-instance v6, Landroid/print/PrintAttributes$MediaSize;

    .line 612
    .line 613
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    .line 614
    .line 615
    .line 616
    move-result-wide v7

    .line 617
    mul-double v7, v7, v16

    .line 618
    .line 619
    div-double/2addr v7, v14

    .line 620
    invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 621
    .line 622
    .line 623
    move-result-object v3

    .line 624
    invoke-virtual {v3}, Ljava/lang/Double;->intValue()I

    .line 625
    .line 626
    .line 627
    move-result v3

    .line 628
    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    .line 629
    .line 630
    .line 631
    move-result-wide v7

    .line 632
    mul-double v7, v7, v16

    .line 633
    .line 634
    div-double/2addr v7, v14

    .line 635
    invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 636
    .line 637
    .line 638
    move-result-object v5

    .line 639
    invoke-virtual {v5}, Ljava/lang/Double;->intValue()I

    .line 640
    .line 641
    .line 642
    move-result v5

    .line 643
    const-string v7, "flutter_printing"

    .line 644
    .line 645
    const-string v8, "Provided size"

    .line 646
    .line 647
    invoke-direct {v6, v7, v8, v3, v5}, Landroid/print/PrintAttributes$MediaSize;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    .line 648
    .line 649
    .line 650
    const-string v3, "html"

    .line 651
    .line 652
    invoke-virtual {v0, v3}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 653
    .line 654
    .line 655
    move-result-object v3

    .line 656
    move-object v13, v3

    .line 657
    check-cast v13, Ljava/lang/String;

    .line 658
    .line 659
    const-string v3, "baseUrl"

    .line 660
    .line 661
    invoke-virtual {v0, v3}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 662
    .line 663
    .line 664
    move-result-object v0

    .line 665
    move-object v12, v0

    .line 666
    check-cast v12, Ljava/lang/String;

    .line 667
    .line 668
    iget-object v0, v10, LW3/f;->a:Landroid/content/Context;

    .line 669
    .line 670
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 671
    .line 672
    .line 673
    move-result-object v3

    .line 674
    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 675
    .line 676
    .line 677
    move-result-object v3

    .line 678
    const/high16 v5, 0x3f800000    # 1.0f

    .line 679
    .line 680
    iput v5, v3, Landroid/content/res/Configuration;->fontScale:F

    .line 681
    .line 682
    invoke-virtual {v0, v3}, Landroid/content/Context;->createConfigurationContext(Landroid/content/res/Configuration;)Landroid/content/Context;

    .line 683
    .line 684
    .line 685
    move-result-object v0

    .line 686
    new-instance v11, Landroid/webkit/WebView;

    .line 687
    .line 688
    invoke-direct {v11, v0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 689
    .line 690
    .line 691
    const-string v15, "UTF-8"

    .line 692
    .line 693
    const/16 v16, 0x0

    .line 694
    .line 695
    const-string v14, "text/HTML"

    .line 696
    .line 697
    invoke-virtual/range {v11 .. v16}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 698
    .line 699
    .line 700
    new-instance v0, LW3/e;

    .line 701
    .line 702
    invoke-direct {v0, v10, v6, v2, v11}, LW3/e;-><init>(LW3/f;Landroid/print/PrintAttributes$MediaSize;Landroid/print/PrintAttributes$Margins;Landroid/webkit/WebView;)V

    .line 703
    .line 704
    .line 705
    invoke-virtual {v11, v0}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 706
    .line 707
    .line 708
    move-object/from16 v0, p2

    .line 709
    .line 710
    check-cast v0, LQ2/g;

    .line 711
    .line 712
    invoke-virtual {v0, v4}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 713
    .line 714
    .line 715
    return-void

    .line 716
    :pswitch_5
    invoke-virtual {v0, v10}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 717
    .line 718
    .line 719
    move-result-object v7

    .line 720
    check-cast v7, Ljava/lang/String;

    .line 721
    .line 722
    invoke-virtual {v0, v6}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 723
    .line 724
    .line 725
    move-result-object v6

    .line 726
    check-cast v6, Ljava/lang/Double;

    .line 727
    .line 728
    invoke-virtual {v0, v5}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 729
    .line 730
    .line 731
    move-result-object v5

    .line 732
    check-cast v5, Ljava/lang/Double;

    .line 733
    .line 734
    new-instance v9, LW3/f;

    .line 735
    .line 736
    invoke-virtual {v0, v13}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 737
    .line 738
    .line 739
    move-result-object v0

    .line 740
    check-cast v0, Ljava/lang/Integer;

    .line 741
    .line 742
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 743
    .line 744
    .line 745
    move-result v0

    .line 746
    invoke-direct {v9, v2, v1, v0}, LW3/f;-><init>(Landroid/content/Context;LA/c;I)V

    .line 747
    .line 748
    .line 749
    iput-object v7, v9, LW3/f;->e:Ljava/lang/String;

    .line 750
    .line 751
    new-instance v0, Landroid/print/PrintAttributes$Builder;

    .line 752
    .line 753
    invoke-direct {v0}, Landroid/print/PrintAttributes$Builder;-><init>()V

    .line 754
    .line 755
    .line 756
    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    .line 757
    .line 758
    .line 759
    move-result-wide v10

    .line 760
    mul-double v10, v10, v16

    .line 761
    .line 762
    div-double/2addr v10, v14

    .line 763
    invoke-static {v10, v11}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 764
    .line 765
    .line 766
    move-result-object v2

    .line 767
    invoke-virtual {v2}, Ljava/lang/Double;->intValue()I

    .line 768
    .line 769
    .line 770
    move-result v2

    .line 771
    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    .line 772
    .line 773
    .line 774
    move-result-wide v5

    .line 775
    mul-double v5, v5, v16

    .line 776
    .line 777
    div-double/2addr v5, v14

    .line 778
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 779
    .line 780
    .line 781
    move-result-object v5

    .line 782
    invoke-virtual {v5}, Ljava/lang/Double;->intValue()I

    .line 783
    .line 784
    .line 785
    move-result v5

    .line 786
    if-lt v5, v2, :cond_a

    .line 787
    .line 788
    goto :goto_6

    .line 789
    :cond_a
    move v3, v8

    .line 790
    :goto_6
    new-instance v6, Ljava/util/ArrayList;

    .line 791
    .line 792
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 793
    .line 794
    .line 795
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_A0:Landroid/print/PrintAttributes$MediaSize;

    .line 796
    .line 797
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 798
    .line 799
    .line 800
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_A1:Landroid/print/PrintAttributes$MediaSize;

    .line 801
    .line 802
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 803
    .line 804
    .line 805
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_A2:Landroid/print/PrintAttributes$MediaSize;

    .line 806
    .line 807
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 808
    .line 809
    .line 810
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_A3:Landroid/print/PrintAttributes$MediaSize;

    .line 811
    .line 812
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 813
    .line 814
    .line 815
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_A4:Landroid/print/PrintAttributes$MediaSize;

    .line 816
    .line 817
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 818
    .line 819
    .line 820
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_A5:Landroid/print/PrintAttributes$MediaSize;

    .line 821
    .line 822
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 823
    .line 824
    .line 825
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_A6:Landroid/print/PrintAttributes$MediaSize;

    .line 826
    .line 827
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 828
    .line 829
    .line 830
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_A7:Landroid/print/PrintAttributes$MediaSize;

    .line 831
    .line 832
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 833
    .line 834
    .line 835
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_A8:Landroid/print/PrintAttributes$MediaSize;

    .line 836
    .line 837
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 838
    .line 839
    .line 840
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_A9:Landroid/print/PrintAttributes$MediaSize;

    .line 841
    .line 842
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 843
    .line 844
    .line 845
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_A10:Landroid/print/PrintAttributes$MediaSize;

    .line 846
    .line 847
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 848
    .line 849
    .line 850
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_B0:Landroid/print/PrintAttributes$MediaSize;

    .line 851
    .line 852
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 853
    .line 854
    .line 855
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_B1:Landroid/print/PrintAttributes$MediaSize;

    .line 856
    .line 857
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 858
    .line 859
    .line 860
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_B2:Landroid/print/PrintAttributes$MediaSize;

    .line 861
    .line 862
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 863
    .line 864
    .line 865
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_B3:Landroid/print/PrintAttributes$MediaSize;

    .line 866
    .line 867
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 868
    .line 869
    .line 870
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_B4:Landroid/print/PrintAttributes$MediaSize;

    .line 871
    .line 872
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 873
    .line 874
    .line 875
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_B5:Landroid/print/PrintAttributes$MediaSize;

    .line 876
    .line 877
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 878
    .line 879
    .line 880
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_B6:Landroid/print/PrintAttributes$MediaSize;

    .line 881
    .line 882
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 883
    .line 884
    .line 885
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_B7:Landroid/print/PrintAttributes$MediaSize;

    .line 886
    .line 887
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 888
    .line 889
    .line 890
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_B8:Landroid/print/PrintAttributes$MediaSize;

    .line 891
    .line 892
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 893
    .line 894
    .line 895
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_B9:Landroid/print/PrintAttributes$MediaSize;

    .line 896
    .line 897
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 898
    .line 899
    .line 900
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_B10:Landroid/print/PrintAttributes$MediaSize;

    .line 901
    .line 902
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 903
    .line 904
    .line 905
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_C0:Landroid/print/PrintAttributes$MediaSize;

    .line 906
    .line 907
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 908
    .line 909
    .line 910
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_C1:Landroid/print/PrintAttributes$MediaSize;

    .line 911
    .line 912
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 913
    .line 914
    .line 915
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_C2:Landroid/print/PrintAttributes$MediaSize;

    .line 916
    .line 917
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 918
    .line 919
    .line 920
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_C3:Landroid/print/PrintAttributes$MediaSize;

    .line 921
    .line 922
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 923
    .line 924
    .line 925
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_C4:Landroid/print/PrintAttributes$MediaSize;

    .line 926
    .line 927
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 928
    .line 929
    .line 930
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_C5:Landroid/print/PrintAttributes$MediaSize;

    .line 931
    .line 932
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 933
    .line 934
    .line 935
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_C6:Landroid/print/PrintAttributes$MediaSize;

    .line 936
    .line 937
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 938
    .line 939
    .line 940
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_C7:Landroid/print/PrintAttributes$MediaSize;

    .line 941
    .line 942
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 943
    .line 944
    .line 945
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_C8:Landroid/print/PrintAttributes$MediaSize;

    .line 946
    .line 947
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 948
    .line 949
    .line 950
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_C9:Landroid/print/PrintAttributes$MediaSize;

    .line 951
    .line 952
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 953
    .line 954
    .line 955
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ISO_C10:Landroid/print/PrintAttributes$MediaSize;

    .line 956
    .line 957
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 958
    .line 959
    .line 960
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->NA_LETTER:Landroid/print/PrintAttributes$MediaSize;

    .line 961
    .line 962
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 963
    .line 964
    .line 965
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->NA_GOVT_LETTER:Landroid/print/PrintAttributes$MediaSize;

    .line 966
    .line 967
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 968
    .line 969
    .line 970
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->NA_LEGAL:Landroid/print/PrintAttributes$MediaSize;

    .line 971
    .line 972
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 973
    .line 974
    .line 975
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->NA_JUNIOR_LEGAL:Landroid/print/PrintAttributes$MediaSize;

    .line 976
    .line 977
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 978
    .line 979
    .line 980
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->NA_LEDGER:Landroid/print/PrintAttributes$MediaSize;

    .line 981
    .line 982
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 983
    .line 984
    .line 985
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->NA_TABLOID:Landroid/print/PrintAttributes$MediaSize;

    .line 986
    .line 987
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 988
    .line 989
    .line 990
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->NA_INDEX_3X5:Landroid/print/PrintAttributes$MediaSize;

    .line 991
    .line 992
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 993
    .line 994
    .line 995
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->NA_INDEX_4X6:Landroid/print/PrintAttributes$MediaSize;

    .line 996
    .line 997
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 998
    .line 999
    .line 1000
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->NA_INDEX_5X8:Landroid/print/PrintAttributes$MediaSize;

    .line 1001
    .line 1002
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1003
    .line 1004
    .line 1005
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->NA_MONARCH:Landroid/print/PrintAttributes$MediaSize;

    .line 1006
    .line 1007
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1008
    .line 1009
    .line 1010
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->NA_QUARTO:Landroid/print/PrintAttributes$MediaSize;

    .line 1011
    .line 1012
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1013
    .line 1014
    .line 1015
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->NA_FOOLSCAP:Landroid/print/PrintAttributes$MediaSize;

    .line 1016
    .line 1017
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1018
    .line 1019
    .line 1020
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ROC_8K:Landroid/print/PrintAttributes$MediaSize;

    .line 1021
    .line 1022
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1023
    .line 1024
    .line 1025
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->ROC_16K:Landroid/print/PrintAttributes$MediaSize;

    .line 1026
    .line 1027
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1028
    .line 1029
    .line 1030
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->PRC_1:Landroid/print/PrintAttributes$MediaSize;

    .line 1031
    .line 1032
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1033
    .line 1034
    .line 1035
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->PRC_2:Landroid/print/PrintAttributes$MediaSize;

    .line 1036
    .line 1037
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1038
    .line 1039
    .line 1040
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->PRC_3:Landroid/print/PrintAttributes$MediaSize;

    .line 1041
    .line 1042
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1043
    .line 1044
    .line 1045
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->PRC_4:Landroid/print/PrintAttributes$MediaSize;

    .line 1046
    .line 1047
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1048
    .line 1049
    .line 1050
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->PRC_5:Landroid/print/PrintAttributes$MediaSize;

    .line 1051
    .line 1052
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1053
    .line 1054
    .line 1055
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->PRC_6:Landroid/print/PrintAttributes$MediaSize;

    .line 1056
    .line 1057
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1058
    .line 1059
    .line 1060
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->PRC_7:Landroid/print/PrintAttributes$MediaSize;

    .line 1061
    .line 1062
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1063
    .line 1064
    .line 1065
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->PRC_8:Landroid/print/PrintAttributes$MediaSize;

    .line 1066
    .line 1067
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1068
    .line 1069
    .line 1070
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->PRC_9:Landroid/print/PrintAttributes$MediaSize;

    .line 1071
    .line 1072
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1073
    .line 1074
    .line 1075
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->PRC_10:Landroid/print/PrintAttributes$MediaSize;

    .line 1076
    .line 1077
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1078
    .line 1079
    .line 1080
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->PRC_16K:Landroid/print/PrintAttributes$MediaSize;

    .line 1081
    .line 1082
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1083
    .line 1084
    .line 1085
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->OM_PA_KAI:Landroid/print/PrintAttributes$MediaSize;

    .line 1086
    .line 1087
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1088
    .line 1089
    .line 1090
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->OM_DAI_PA_KAI:Landroid/print/PrintAttributes$MediaSize;

    .line 1091
    .line 1092
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1093
    .line 1094
    .line 1095
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->OM_JUURO_KU_KAI:Landroid/print/PrintAttributes$MediaSize;

    .line 1096
    .line 1097
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1098
    .line 1099
    .line 1100
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->JIS_B10:Landroid/print/PrintAttributes$MediaSize;

    .line 1101
    .line 1102
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1103
    .line 1104
    .line 1105
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->JIS_B9:Landroid/print/PrintAttributes$MediaSize;

    .line 1106
    .line 1107
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1108
    .line 1109
    .line 1110
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->JIS_B8:Landroid/print/PrintAttributes$MediaSize;

    .line 1111
    .line 1112
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1113
    .line 1114
    .line 1115
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->JIS_B7:Landroid/print/PrintAttributes$MediaSize;

    .line 1116
    .line 1117
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1118
    .line 1119
    .line 1120
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->JIS_B6:Landroid/print/PrintAttributes$MediaSize;

    .line 1121
    .line 1122
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1123
    .line 1124
    .line 1125
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->JIS_B5:Landroid/print/PrintAttributes$MediaSize;

    .line 1126
    .line 1127
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1128
    .line 1129
    .line 1130
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->JIS_B4:Landroid/print/PrintAttributes$MediaSize;

    .line 1131
    .line 1132
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1133
    .line 1134
    .line 1135
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->JIS_B3:Landroid/print/PrintAttributes$MediaSize;

    .line 1136
    .line 1137
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1138
    .line 1139
    .line 1140
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->JIS_B2:Landroid/print/PrintAttributes$MediaSize;

    .line 1141
    .line 1142
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1143
    .line 1144
    .line 1145
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->JIS_B1:Landroid/print/PrintAttributes$MediaSize;

    .line 1146
    .line 1147
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1148
    .line 1149
    .line 1150
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->JIS_B0:Landroid/print/PrintAttributes$MediaSize;

    .line 1151
    .line 1152
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1153
    .line 1154
    .line 1155
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->JIS_EXEC:Landroid/print/PrintAttributes$MediaSize;

    .line 1156
    .line 1157
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1158
    .line 1159
    .line 1160
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->JPN_CHOU4:Landroid/print/PrintAttributes$MediaSize;

    .line 1161
    .line 1162
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1163
    .line 1164
    .line 1165
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->JPN_CHOU3:Landroid/print/PrintAttributes$MediaSize;

    .line 1166
    .line 1167
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1168
    .line 1169
    .line 1170
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->JPN_CHOU2:Landroid/print/PrintAttributes$MediaSize;

    .line 1171
    .line 1172
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1173
    .line 1174
    .line 1175
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->JPN_HAGAKI:Landroid/print/PrintAttributes$MediaSize;

    .line 1176
    .line 1177
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1178
    .line 1179
    .line 1180
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->JPN_OUFUKU:Landroid/print/PrintAttributes$MediaSize;

    .line 1181
    .line 1182
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1183
    .line 1184
    .line 1185
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->JPN_KAHU:Landroid/print/PrintAttributes$MediaSize;

    .line 1186
    .line 1187
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1188
    .line 1189
    .line 1190
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->JPN_KAKU2:Landroid/print/PrintAttributes$MediaSize;

    .line 1191
    .line 1192
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1193
    .line 1194
    .line 1195
    sget-object v10, Landroid/print/PrintAttributes$MediaSize;->JPN_YOU4:Landroid/print/PrintAttributes$MediaSize;

    .line 1196
    .line 1197
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1198
    .line 1199
    .line 1200
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 1201
    .line 1202
    .line 1203
    move-result v10

    .line 1204
    :cond_b
    if-ge v8, v10, :cond_d

    .line 1205
    .line 1206
    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1207
    .line 1208
    .line 1209
    move-result-object v11

    .line 1210
    add-int/lit8 v8, v8, 0x1

    .line 1211
    .line 1212
    check-cast v11, Landroid/print/PrintAttributes$MediaSize;

    .line 1213
    .line 1214
    if-eqz v3, :cond_c

    .line 1215
    .line 1216
    invoke-virtual {v11}, Landroid/print/PrintAttributes$MediaSize;->asPortrait()Landroid/print/PrintAttributes$MediaSize;

    .line 1217
    .line 1218
    .line 1219
    move-result-object v11

    .line 1220
    goto :goto_7

    .line 1221
    :cond_c
    invoke-virtual {v11}, Landroid/print/PrintAttributes$MediaSize;->asLandscape()Landroid/print/PrintAttributes$MediaSize;

    .line 1222
    .line 1223
    .line 1224
    move-result-object v11

    .line 1225
    :goto_7
    add-int/lit8 v13, v2, 0x14

    .line 1226
    .line 1227
    invoke-virtual {v11}, Landroid/print/PrintAttributes$MediaSize;->getWidthMils()I

    .line 1228
    .line 1229
    .line 1230
    move-result v14

    .line 1231
    if-lt v13, v14, :cond_b

    .line 1232
    .line 1233
    add-int/lit8 v13, v2, -0x14

    .line 1234
    .line 1235
    invoke-virtual {v11}, Landroid/print/PrintAttributes$MediaSize;->getWidthMils()I

    .line 1236
    .line 1237
    .line 1238
    move-result v14

    .line 1239
    if-gt v13, v14, :cond_b

    .line 1240
    .line 1241
    add-int/lit8 v13, v5, 0x14

    .line 1242
    .line 1243
    invoke-virtual {v11}, Landroid/print/PrintAttributes$MediaSize;->getHeightMils()I

    .line 1244
    .line 1245
    .line 1246
    move-result v14

    .line 1247
    if-lt v13, v14, :cond_b

    .line 1248
    .line 1249
    add-int/lit8 v13, v5, -0x14

    .line 1250
    .line 1251
    invoke-virtual {v11}, Landroid/print/PrintAttributes$MediaSize;->getHeightMils()I

    .line 1252
    .line 1253
    .line 1254
    move-result v14

    .line 1255
    if-gt v13, v14, :cond_b

    .line 1256
    .line 1257
    move-object v12, v11

    .line 1258
    :cond_d
    if-nez v12, :cond_f

    .line 1259
    .line 1260
    if-eqz v3, :cond_e

    .line 1261
    .line 1262
    sget-object v2, Landroid/print/PrintAttributes$MediaSize;->UNKNOWN_PORTRAIT:Landroid/print/PrintAttributes$MediaSize;

    .line 1263
    .line 1264
    :goto_8
    move-object v12, v2

    .line 1265
    goto :goto_9

    .line 1266
    :cond_e
    sget-object v2, Landroid/print/PrintAttributes$MediaSize;->UNKNOWN_LANDSCAPE:Landroid/print/PrintAttributes$MediaSize;

    .line 1267
    .line 1268
    goto :goto_8

    .line 1269
    :cond_f
    :goto_9
    invoke-virtual {v0, v12}, Landroid/print/PrintAttributes$Builder;->setMediaSize(Landroid/print/PrintAttributes$MediaSize;)Landroid/print/PrintAttributes$Builder;

    .line 1270
    .line 1271
    .line 1272
    invoke-virtual {v0}, Landroid/print/PrintAttributes$Builder;->build()Landroid/print/PrintAttributes;

    .line 1273
    .line 1274
    .line 1275
    move-result-object v0

    .line 1276
    sget-object v2, LW3/f;->h:Landroid/print/PrintManager;

    .line 1277
    .line 1278
    invoke-virtual {v2, v7, v9, v0}, Landroid/print/PrintManager;->print(Ljava/lang/String;Landroid/print/PrintDocumentAdapter;Landroid/print/PrintAttributes;)Landroid/print/PrintJob;

    .line 1279
    .line 1280
    .line 1281
    move-result-object v0

    .line 1282
    iput-object v0, v9, LW3/f;->c:Landroid/print/PrintJob;

    .line 1283
    .line 1284
    move-object/from16 v0, p2

    .line 1285
    .line 1286
    check-cast v0, LQ2/g;

    .line 1287
    .line 1288
    invoke-virtual {v0, v4}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 1289
    .line 1290
    .line 1291
    return-void

    .line 1292
    nop

    .line 1293
    :sswitch_data_0
    .sparse-switch
        -0x458514fb -> :sswitch_5
        -0x40a17802 -> :sswitch_4
        -0x2c55176d -> :sswitch_3
        -0xe1179cb -> :sswitch_2
        0x19111063 -> :sswitch_1
        0x1c67aae3 -> :sswitch_0
    .end sparse-switch

    .line 1294
    .line 1295
    .line 1296
    .line 1297
    .line 1298
    .line 1299
    .line 1300
    .line 1301
    .line 1302
    .line 1303
    .line 1304
    .line 1305
    .line 1306
    .line 1307
    .line 1308
    .line 1309
    .line 1310
    .line 1311
    .line 1312
    .line 1313
    .line 1314
    .line 1315
    .line 1316
    .line 1317
    .line 1318
    .line 1319
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public p(LP2/c;LP2/c;)F
    .locals 4

    .line 1
    iget v0, p1, Lr2/o;->a:F

    .line 2
    .line 3
    float-to-int v0, v0

    .line 4
    iget v1, p1, Lr2/o;->b:F

    .line 5
    .line 6
    float-to-int v1, v1

    .line 7
    iget v2, p2, Lr2/o;->a:F

    .line 8
    .line 9
    float-to-int v2, v2

    .line 10
    iget v3, p2, Lr2/o;->b:F

    .line 11
    .line 12
    float-to-int v3, v3

    .line 13
    invoke-virtual {p0, v0, v1, v2, v3}, LA/c;->S(IIII)F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget p2, p2, Lr2/o;->a:F

    .line 18
    .line 19
    float-to-int p2, p2

    .line 20
    iget p1, p1, Lr2/o;->a:F

    .line 21
    .line 22
    float-to-int p1, p1

    .line 23
    invoke-virtual {p0, p2, v3, p1, v1}, LA/c;->S(IIII)F

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    const/high16 v1, 0x40e00000    # 7.0f

    .line 32
    .line 33
    if-eqz p2, :cond_0

    .line 34
    .line 35
    div-float/2addr p1, v1

    .line 36
    return p1

    .line 37
    :cond_0
    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-eqz p2, :cond_1

    .line 42
    .line 43
    div-float/2addr v0, v1

    .line 44
    return v0

    .line 45
    :cond_1
    add-float/2addr v0, p1

    .line 46
    const/high16 p1, 0x41600000    # 14.0f

    .line 47
    .line 48
    div-float/2addr v0, p1

    .line 49
    return v0
.end method

.method public q()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, LA/c;->g:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v1, Landroid/content/Context;

    .line 9
    .line 10
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, ".FlutterSecureStoragePluginKey"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    return-object v0
.end method

.method public r(I)I
    .locals 6

    .line 1
    iget-object v0, p0, LA/c;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LL2/a;

    .line 4
    .line 5
    iget-object v1, p0, LA/c;->g:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, [I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, v2}, LA/c;->x(I)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    return p1

    .line 17
    :cond_0
    const/4 v3, 0x1

    .line 18
    if-ne p1, v3, :cond_2

    .line 19
    .line 20
    array-length p1, v1

    .line 21
    move v3, v2

    .line 22
    :goto_0
    if-ge v2, p1, :cond_1

    .line 23
    .line 24
    aget v4, v1, v2

    .line 25
    .line 26
    invoke-virtual {v0, v3, v4}, LL2/a;->a(II)I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    add-int/lit8 v2, v2, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    return v3

    .line 34
    :cond_2
    aget v2, v1, v2

    .line 35
    .line 36
    array-length v4, v1

    .line 37
    :goto_1
    if-ge v3, v4, :cond_3

    .line 38
    .line 39
    invoke-virtual {v0, p1, v2}, LL2/a;->c(II)I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    aget v5, v1, v3

    .line 44
    .line 45
    invoke-virtual {v0, v2, v5}, LL2/a;->a(II)I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    add-int/lit8 v3, v3, 0x1

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_3
    return v2
.end method

.method public s(FIIF)LP2/a;
    .locals 11

    .line 1
    mul-float/2addr p4, p1

    .line 2
    float-to-int p4, p4

    .line 3
    sub-int v0, p2, p4

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 7
    .line 8
    .line 9
    move-result v4

    .line 10
    iget-object v0, p0, LA/c;->f:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v0, Lx2/b;

    .line 13
    .line 14
    iget v2, v0, Lx2/b;->e:I

    .line 15
    .line 16
    const/4 v10, 0x1

    .line 17
    sub-int/2addr v2, v10

    .line 18
    add-int/2addr p2, p4

    .line 19
    invoke-static {v2, p2}, Ljava/lang/Math;->min(II)I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    sub-int v6, p2, v4

    .line 24
    .line 25
    int-to-float p2, v6

    .line 26
    const/high16 v2, 0x40400000    # 3.0f

    .line 27
    .line 28
    mul-float/2addr v2, p1

    .line 29
    cmpg-float p2, p2, v2

    .line 30
    .line 31
    if-ltz p2, :cond_c

    .line 32
    .line 33
    sub-int p2, p3, p4

    .line 34
    .line 35
    invoke-static {v1, p2}, Ljava/lang/Math;->max(II)I

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    iget p2, v0, Lx2/b;->f:I

    .line 40
    .line 41
    sub-int/2addr p2, v10

    .line 42
    add-int/2addr p3, p4

    .line 43
    invoke-static {p2, p3}, Ljava/lang/Math;->min(II)I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    sub-int v7, p2, v5

    .line 48
    .line 49
    int-to-float p2, v7

    .line 50
    cmpg-float p2, p2, v2

    .line 51
    .line 52
    if-ltz p2, :cond_b

    .line 53
    .line 54
    new-instance v2, LP2/b;

    .line 55
    .line 56
    iget-object p2, p0, LA/c;->f:Ljava/lang/Object;

    .line 57
    .line 58
    move-object v3, p2

    .line 59
    check-cast v3, Lx2/b;

    .line 60
    .line 61
    iget-object p2, p0, LA/c;->g:Ljava/lang/Object;

    .line 62
    .line 63
    move-object v9, p2

    .line 64
    check-cast v9, Lr2/p;

    .line 65
    .line 66
    move v8, p1

    .line 67
    invoke-direct/range {v2 .. v9}, LP2/b;-><init>(Lx2/b;IIIIFLr2/p;)V

    .line 68
    .line 69
    .line 70
    iget p1, v2, LP2/b;->e:I

    .line 71
    .line 72
    iget p2, v2, LP2/b;->c:I

    .line 73
    .line 74
    add-int/2addr p1, p2

    .line 75
    iget p3, v2, LP2/b;->f:I

    .line 76
    .line 77
    div-int/lit8 p4, p3, 0x2

    .line 78
    .line 79
    iget v0, v2, LP2/b;->d:I

    .line 80
    .line 81
    add-int/2addr p4, v0

    .line 82
    const/4 v0, 0x3

    .line 83
    new-array v0, v0, [I

    .line 84
    .line 85
    move v4, v1

    .line 86
    :goto_0
    if-ge v4, p3, :cond_9

    .line 87
    .line 88
    and-int/lit8 v5, v4, 0x1

    .line 89
    .line 90
    const/4 v6, 0x2

    .line 91
    if-nez v5, :cond_0

    .line 92
    .line 93
    add-int/lit8 v5, v4, 0x1

    .line 94
    .line 95
    div-int/2addr v5, v6

    .line 96
    goto :goto_1

    .line 97
    :cond_0
    add-int/lit8 v5, v4, 0x1

    .line 98
    .line 99
    div-int/2addr v5, v6

    .line 100
    neg-int v5, v5

    .line 101
    :goto_1
    add-int/2addr v5, p4

    .line 102
    aput v1, v0, v1

    .line 103
    .line 104
    aput v1, v0, v10

    .line 105
    .line 106
    aput v1, v0, v6

    .line 107
    .line 108
    move v7, p2

    .line 109
    :goto_2
    if-ge v7, p1, :cond_1

    .line 110
    .line 111
    invoke-virtual {v3, v7, v5}, Lx2/b;->b(II)Z

    .line 112
    .line 113
    .line 114
    move-result v8

    .line 115
    if-nez v8, :cond_1

    .line 116
    .line 117
    add-int/lit8 v7, v7, 0x1

    .line 118
    .line 119
    goto :goto_2

    .line 120
    :cond_1
    move v8, v1

    .line 121
    :goto_3
    if-ge v7, p1, :cond_7

    .line 122
    .line 123
    invoke-virtual {v3, v7, v5}, Lx2/b;->b(II)Z

    .line 124
    .line 125
    .line 126
    move-result v9

    .line 127
    if-eqz v9, :cond_5

    .line 128
    .line 129
    if-ne v8, v10, :cond_2

    .line 130
    .line 131
    aget v9, v0, v10

    .line 132
    .line 133
    add-int/2addr v9, v10

    .line 134
    aput v9, v0, v10

    .line 135
    .line 136
    goto :goto_4

    .line 137
    :cond_2
    if-ne v8, v6, :cond_4

    .line 138
    .line 139
    invoke-virtual {v2, v0}, LP2/b;->a([I)Z

    .line 140
    .line 141
    .line 142
    move-result v8

    .line 143
    if-eqz v8, :cond_3

    .line 144
    .line 145
    invoke-virtual {v2, v5, v7, v0}, LP2/b;->b(II[I)LP2/a;

    .line 146
    .line 147
    .line 148
    move-result-object v8

    .line 149
    if-eqz v8, :cond_3

    .line 150
    .line 151
    return-object v8

    .line 152
    :cond_3
    aget v8, v0, v6

    .line 153
    .line 154
    aput v8, v0, v1

    .line 155
    .line 156
    aput v10, v0, v10

    .line 157
    .line 158
    aput v1, v0, v6

    .line 159
    .line 160
    move v8, v10

    .line 161
    goto :goto_4

    .line 162
    :cond_4
    add-int/lit8 v8, v8, 0x1

    .line 163
    .line 164
    aget v9, v0, v8

    .line 165
    .line 166
    add-int/2addr v9, v10

    .line 167
    aput v9, v0, v8

    .line 168
    .line 169
    goto :goto_4

    .line 170
    :cond_5
    if-ne v8, v10, :cond_6

    .line 171
    .line 172
    add-int/lit8 v8, v8, 0x1

    .line 173
    .line 174
    :cond_6
    aget v9, v0, v8

    .line 175
    .line 176
    add-int/2addr v9, v10

    .line 177
    aput v9, v0, v8

    .line 178
    .line 179
    :goto_4
    add-int/lit8 v7, v7, 0x1

    .line 180
    .line 181
    goto :goto_3

    .line 182
    :cond_7
    invoke-virtual {v2, v0}, LP2/b;->a([I)Z

    .line 183
    .line 184
    .line 185
    move-result v6

    .line 186
    if-eqz v6, :cond_8

    .line 187
    .line 188
    invoke-virtual {v2, v5, p1, v0}, LP2/b;->b(II[I)LP2/a;

    .line 189
    .line 190
    .line 191
    move-result-object v5

    .line 192
    if-eqz v5, :cond_8

    .line 193
    .line 194
    return-object v5

    .line 195
    :cond_8
    add-int/lit8 v4, v4, 0x1

    .line 196
    .line 197
    goto :goto_0

    .line 198
    :cond_9
    iget-object p1, v2, LP2/b;->b:Ljava/util/ArrayList;

    .line 199
    .line 200
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 201
    .line 202
    .line 203
    move-result p2

    .line 204
    if-nez p2, :cond_a

    .line 205
    .line 206
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    check-cast p1, LP2/a;

    .line 211
    .line 212
    return-object p1

    .line 213
    :cond_a
    invoke-static {}, Lr2/i;->a()Lr2/i;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    throw p1

    .line 218
    :cond_b
    invoke-static {}, Lr2/i;->a()Lr2/i;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    throw p1

    .line 223
    :cond_c
    invoke-static {}, Lr2/i;->a()Lr2/i;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    throw p1
.end method

.method public t(Ljava/lang/CharSequence;IILN/v;)Z
    .locals 3

    .line 1
    iget v0, p4, LN/v;->c:I

    .line 2
    .line 3
    and-int/lit8 v0, v0, 0x4

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p0, LA/c;->f:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, LN/y;

    .line 12
    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    new-instance v0, LN/y;

    .line 16
    .line 17
    instance-of v2, p1, Landroid/text/Spannable;

    .line 18
    .line 19
    if-eqz v2, :cond_1

    .line 20
    .line 21
    check-cast p1, Landroid/text/Spannable;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    new-instance v2, Landroid/text/SpannableString;

    .line 25
    .line 26
    invoke-direct {v2, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    move-object p1, v2

    .line 30
    :goto_0
    invoke-direct {v0, p1}, LN/y;-><init>(Landroid/text/Spannable;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, LA/c;->f:Ljava/lang/Object;

    .line 34
    .line 35
    :cond_2
    iget-object p1, p0, LA/c;->g:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast p1, LN1/e;

    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    new-instance p1, LN/w;

    .line 43
    .line 44
    invoke-direct {p1, p4}, LN/w;-><init>(LN/v;)V

    .line 45
    .line 46
    .line 47
    iget-object p4, p0, LA/c;->f:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast p4, LN/y;

    .line 50
    .line 51
    const/16 v0, 0x21

    .line 52
    .line 53
    invoke-virtual {p4, p1, p2, p3, v0}, LN/y;->setSpan(Ljava/lang/Object;III)V

    .line 54
    .line 55
    .line 56
    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 9

    .line 1
    iget v0, p0, LA/c;->e:I

    .line 2
    .line 3
    sparse-switch v0, :sswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    return-object v0

    .line 11
    :sswitch_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const/16 v1, 0x64

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, LA/c;->g:Ljava/lang/Object;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const/16 v1, 0x7b

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, LA/c;->f:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v1, Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    const/4 v3, 0x0

    .line 45
    :goto_0
    if-ge v3, v2, :cond_1

    .line 46
    .line 47
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    check-cast v4, Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    add-int/lit8 v4, v2, -0x1

    .line 57
    .line 58
    if-ge v3, v4, :cond_0

    .line 59
    .line 60
    const-string v4, ", "

    .line 61
    .line 62
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    const/16 v1, 0x7d

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    return-object v0

    .line 78
    :sswitch_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    invoke-virtual {p0}, LA/c;->z()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    mul-int/lit8 v1, v1, 0x8

    .line 85
    .line 86
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, LA/c;->z()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    :goto_1
    if-ltz v1, :cond_8

    .line 94
    .line 95
    invoke-virtual {p0, v1}, LA/c;->x(I)I

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    if-eqz v2, :cond_7

    .line 100
    .line 101
    if-gez v2, :cond_2

    .line 102
    .line 103
    const-string v3, " - "

    .line 104
    .line 105
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    neg-int v2, v2

    .line 109
    goto :goto_2

    .line 110
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    if-lez v3, :cond_3

    .line 115
    .line 116
    const-string v3, " + "

    .line 117
    .line 118
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    :cond_3
    :goto_2
    const/4 v3, 0x1

    .line 122
    if-eqz v1, :cond_4

    .line 123
    .line 124
    if-eq v2, v3, :cond_5

    .line 125
    .line 126
    :cond_4
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    :cond_5
    if-eqz v1, :cond_7

    .line 130
    .line 131
    if-ne v1, v3, :cond_6

    .line 132
    .line 133
    const/16 v2, 0x78

    .line 134
    .line 135
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    goto :goto_3

    .line 139
    :cond_6
    const-string v2, "x^"

    .line 140
    .line 141
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    :cond_7
    :goto_3
    add-int/lit8 v1, v1, -0x1

    .line 148
    .line 149
    goto :goto_1

    .line 150
    :cond_8
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    return-object v0

    .line 155
    :sswitch_2
    new-instance v0, Ljava/util/Formatter;

    .line 156
    .line 157
    invoke-direct {v0}, Ljava/util/Formatter;-><init>()V

    .line 158
    .line 159
    .line 160
    :try_start_0
    iget-object v1, p0, LA/c;->g:Ljava/lang/Object;

    .line 161
    .line 162
    check-cast v1, [LK2/a;

    .line 163
    .line 164
    array-length v2, v1

    .line 165
    const/4 v3, 0x0

    .line 166
    move v4, v3

    .line 167
    :goto_4
    if-ge v3, v2, :cond_a

    .line 168
    .line 169
    aget-object v5, v1, v3

    .line 170
    .line 171
    if-nez v5, :cond_9

    .line 172
    .line 173
    const-string v5, "%3d:    |   %n"

    .line 174
    .line 175
    add-int/lit8 v6, v4, 0x1

    .line 176
    .line 177
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 178
    .line 179
    .line 180
    move-result-object v4

    .line 181
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object v4

    .line 185
    invoke-virtual {v0, v5, v4}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 186
    .line 187
    .line 188
    move v4, v6

    .line 189
    goto :goto_5

    .line 190
    :catchall_0
    move-exception v1

    .line 191
    goto :goto_6

    .line 192
    :cond_9
    const-string v6, "%3d: %3d|%3d%n"

    .line 193
    .line 194
    add-int/lit8 v7, v4, 0x1

    .line 195
    .line 196
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 197
    .line 198
    .line 199
    move-result-object v4

    .line 200
    iget v8, v5, LK2/a;->f:I

    .line 201
    .line 202
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 203
    .line 204
    .line 205
    move-result-object v8

    .line 206
    iget v5, v5, LK2/a;->e:I

    .line 207
    .line 208
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 209
    .line 210
    .line 211
    move-result-object v5

    .line 212
    filled-new-array {v4, v8, v5}, [Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object v4

    .line 216
    invoke-virtual {v0, v6, v4}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 217
    .line 218
    .line 219
    move v4, v7

    .line 220
    :goto_5
    add-int/lit8 v3, v3, 0x1

    .line 221
    .line 222
    goto :goto_4

    .line 223
    :cond_a
    invoke-virtual {v0}, Ljava/util/Formatter;->toString()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 227
    invoke-virtual {v0}, Ljava/util/Formatter;->close()V

    .line 228
    .line 229
    .line 230
    return-object v1

    .line 231
    :goto_6
    :try_start_1
    invoke-virtual {v0}, Ljava/util/Formatter;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 232
    .line 233
    .line 234
    goto :goto_7

    .line 235
    :catchall_1
    move-exception v0

    .line 236
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 237
    .line 238
    .line 239
    :goto_7
    throw v1

    .line 240
    nop

    .line 241
    :sswitch_data_0
    .sparse-switch
        0x5 -> :sswitch_2
        0x7 -> :sswitch_1
        0xb -> :sswitch_0
    .end sparse-switch
.end method

.method public u(IIII)Landroid/view/View;
    .locals 9

    .line 1
    iget-object v0, p0, LA/c;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LK2/a;

    .line 4
    .line 5
    iget-object v1, p0, LA/c;->f:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, LX/L;

    .line 8
    .line 9
    invoke-interface {v1}, LX/L;->p()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-interface {v1}, LX/L;->b()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-le p2, p1, :cond_0

    .line 18
    .line 19
    const/4 v4, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v4, -0x1

    .line 22
    :goto_0
    const/4 v5, 0x0

    .line 23
    :goto_1
    if-eq p1, p2, :cond_3

    .line 24
    .line 25
    invoke-interface {v1, p1}, LX/L;->n(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v6

    .line 29
    invoke-interface {v1, v6}, LX/L;->g(Landroid/view/View;)I

    .line 30
    .line 31
    .line 32
    move-result v7

    .line 33
    invoke-interface {v1, v6}, LX/L;->q(Landroid/view/View;)I

    .line 34
    .line 35
    .line 36
    move-result v8

    .line 37
    iput v2, v0, LK2/a;->c:I

    .line 38
    .line 39
    iput v3, v0, LK2/a;->d:I

    .line 40
    .line 41
    iput v7, v0, LK2/a;->e:I

    .line 42
    .line 43
    iput v8, v0, LK2/a;->f:I

    .line 44
    .line 45
    if-eqz p3, :cond_1

    .line 46
    .line 47
    iput p3, v0, LK2/a;->b:I

    .line 48
    .line 49
    invoke-virtual {v0}, LK2/a;->a()Z

    .line 50
    .line 51
    .line 52
    move-result v7

    .line 53
    if-eqz v7, :cond_1

    .line 54
    .line 55
    return-object v6

    .line 56
    :cond_1
    if-eqz p4, :cond_2

    .line 57
    .line 58
    iput p4, v0, LK2/a;->b:I

    .line 59
    .line 60
    invoke-virtual {v0}, LK2/a;->a()Z

    .line 61
    .line 62
    .line 63
    move-result v7

    .line 64
    if-eqz v7, :cond_2

    .line 65
    .line 66
    move-object v5, v6

    .line 67
    :cond_2
    add-int/2addr p1, v4

    .line 68
    goto :goto_1

    .line 69
    :cond_3
    return-object v5
.end method

.method public v()Ljava/security/spec/AlgorithmParameterSpec;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return-object v0
.end method

.method public w(I)LK2/a;
    .locals 4

    .line 1
    iget-object v0, p0, LA/c;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, [LK2/a;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, LA/c;->C(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget-object v1, v0, v1

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    return-object v1

    .line 14
    :cond_0
    const/4 v1, 0x1

    .line 15
    :goto_0
    const/4 v2, 0x5

    .line 16
    if-ge v1, v2, :cond_3

    .line 17
    .line 18
    invoke-virtual {p0, p1}, LA/c;->C(I)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    sub-int/2addr v2, v1

    .line 23
    if-ltz v2, :cond_1

    .line 24
    .line 25
    aget-object v2, v0, v2

    .line 26
    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    return-object v2

    .line 30
    :cond_1
    invoke-virtual {p0, p1}, LA/c;->C(I)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    add-int/2addr v2, v1

    .line 35
    array-length v3, v0

    .line 36
    if-ge v2, v3, :cond_2

    .line 37
    .line 38
    aget-object v2, v0, v2

    .line 39
    .line 40
    if-eqz v2, :cond_2

    .line 41
    .line 42
    return-object v2

    .line 43
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_3
    const/4 p1, 0x0

    .line 47
    return-object p1
.end method

.method public x(I)I
    .locals 2

    .line 1
    iget-object v0, p0, LA/c;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, [I

    .line 4
    .line 5
    array-length v1, v0

    .line 6
    add-int/lit8 v1, v1, -0x1

    .line 7
    .line 8
    sub-int/2addr v1, p1

    .line 9
    aget p1, v0, v1

    .line 10
    .line 11
    return p1
.end method

.method public y()Ljava/io/File;
    .locals 4

    .line 1
    const-string v0, "PersistedInstallation."

    .line 2
    .line 3
    iget-object v1, p0, LA/c;->f:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Ljava/io/File;

    .line 6
    .line 7
    if-nez v1, :cond_1

    .line 8
    .line 9
    monitor-enter p0

    .line 10
    :try_start_0
    iget-object v1, p0, LA/c;->f:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v1, Ljava/io/File;

    .line 13
    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    new-instance v1, Ljava/io/File;

    .line 17
    .line 18
    iget-object v2, p0, LA/c;->g:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v2, LA1/g;

    .line 21
    .line 22
    invoke-virtual {v2}, LA1/g;->a()V

    .line 23
    .line 24
    .line 25
    iget-object v2, v2, LA1/g;->a:Landroid/content/Context;

    .line 26
    .line 27
    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    new-instance v3, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, LA/c;->g:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v0, LA1/g;

    .line 39
    .line 40
    invoke-virtual {v0}, LA1/g;->f()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v0, ".json"

    .line 48
    .line 49
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-direct {v1, v2, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iput-object v1, p0, LA/c;->f:Ljava/lang/Object;

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :catchall_0
    move-exception v0

    .line 63
    goto :goto_1

    .line 64
    :cond_0
    :goto_0
    monitor-exit p0

    .line 65
    goto :goto_2

    .line 66
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    throw v0

    .line 68
    :cond_1
    :goto_2
    iget-object v0, p0, LA/c;->f:Ljava/lang/Object;

    .line 69
    .line 70
    check-cast v0, Ljava/io/File;

    .line 71
    .line 72
    return-object v0
.end method

.method public z()I
    .locals 1

    .line 1
    iget-object v0, p0, LA/c;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, [I

    .line 4
    .line 5
    array-length v0, v0

    .line 6
    add-int/lit8 v0, v0, -0x1

    .line 7
    .line 8
    return v0
.end method
