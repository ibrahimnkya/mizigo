.class public final LW3/f;
.super Landroid/print/PrintDocumentAdapter;
.source "SourceFile"


# static fields
.field public static h:Landroid/print/PrintManager;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:LA/c;

.field public c:Landroid/print/PrintJob;

.field public d:[B

.field public e:Ljava/lang/String;

.field public f:Landroid/print/PrintDocumentAdapter$LayoutResultCallback;

.field public final g:I


# direct methods
.method public constructor <init>(Landroid/content/Context;LA/c;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/print/PrintDocumentAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LW3/f;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, LW3/f;->b:LA/c;

    .line 7
    .line 8
    iput p3, p0, LW3/f;->g:I

    .line 9
    .line 10
    const-string p2, "print"

    .line 11
    .line 12
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Landroid/print/PrintManager;

    .line 17
    .line 18
    sput-object p1, LW3/f;->h:Landroid/print/PrintManager;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, LW3/f;->f:Landroid/print/PrintDocumentAdapter$LayoutResultCallback;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/print/PrintDocumentAdapter$LayoutResultCallback;->onLayoutCancelled()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, LW3/f;->c:Landroid/print/PrintJob;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/print/PrintJob;->cancel()V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, LW3/f;->b:LA/c;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, p0, v1, p1}, LA/c;->K(LW3/f;ZLjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final onFinish()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/Thread;

    .line 2
    .line 3
    new-instance v1, LD1/o;

    .line 4
    .line 5
    const/16 v2, 0x9

    .line 6
    .line 7
    invoke-direct {v1, v2, p0}, LD1/o;-><init>(ILjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final onLayout(Landroid/print/PrintAttributes;Landroid/print/PrintAttributes;Landroid/os/CancellationSignal;Landroid/print/PrintDocumentAdapter$LayoutResultCallback;Landroid/os/Bundle;)V
    .locals 10

    .line 1
    invoke-virtual {p3}, Landroid/os/CancellationSignal;->isCanceled()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p4}, Landroid/print/PrintDocumentAdapter$LayoutResultCallback;->onLayoutCancelled()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iput-object p4, p0, LW3/f;->f:Landroid/print/PrintDocumentAdapter$LayoutResultCallback;

    .line 12
    .line 13
    invoke-virtual {p2}, Landroid/print/PrintAttributes;->getMediaSize()Landroid/print/PrintAttributes$MediaSize;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p2}, Landroid/print/PrintAttributes;->getMinMargins()Landroid/print/PrintAttributes$Margins;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p1}, Landroid/print/PrintAttributes$MediaSize;->getWidthMils()I

    .line 22
    .line 23
    .line 24
    move-result p3

    .line 25
    int-to-double p3, p3

    .line 26
    const-wide/high16 v0, 0x4052000000000000L    # 72.0

    .line 27
    .line 28
    mul-double/2addr p3, v0

    .line 29
    const-wide v2, 0x408f400000000000L    # 1000.0

    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    div-double/2addr p3, v2

    .line 35
    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    invoke-virtual {p1}, Landroid/print/PrintAttributes$MediaSize;->getHeightMils()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    int-to-double p4, p1

    .line 44
    mul-double/2addr p4, v0

    .line 45
    div-double/2addr p4, v2

    .line 46
    invoke-virtual {p2}, Landroid/print/PrintAttributes$Margins;->getLeftMils()I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    int-to-double v4, p1

    .line 51
    mul-double/2addr v4, v0

    .line 52
    div-double/2addr v4, v2

    .line 53
    invoke-virtual {p2}, Landroid/print/PrintAttributes$Margins;->getTopMils()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    int-to-double v6, p1

    .line 58
    mul-double/2addr v6, v0

    .line 59
    div-double/2addr v6, v2

    .line 60
    invoke-virtual {p2}, Landroid/print/PrintAttributes$Margins;->getRightMils()I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    int-to-double v8, p1

    .line 65
    mul-double/2addr v8, v0

    .line 66
    div-double/2addr v8, v2

    .line 67
    invoke-virtual {p2}, Landroid/print/PrintAttributes$Margins;->getBottomMils()I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    int-to-double p1, p1

    .line 72
    mul-double/2addr p1, v0

    .line 73
    div-double/2addr p1, v2

    .line 74
    iget-object v0, p0, LW3/f;->b:LA/c;

    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 77
    .line 78
    .line 79
    new-instance v1, Ljava/util/HashMap;

    .line 80
    .line 81
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 82
    .line 83
    .line 84
    const-string v2, "width"

    .line 85
    .line 86
    invoke-virtual {v1, v2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    const-string p3, "height"

    .line 90
    .line 91
    invoke-static {p4, p5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 92
    .line 93
    .line 94
    move-result-object p4

    .line 95
    invoke-virtual {v1, p3, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    const-string p3, "marginLeft"

    .line 99
    .line 100
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 101
    .line 102
    .line 103
    move-result-object p4

    .line 104
    invoke-virtual {v1, p3, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    const-string p3, "marginTop"

    .line 108
    .line 109
    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 110
    .line 111
    .line 112
    move-result-object p4

    .line 113
    invoke-virtual {v1, p3, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    const-string p3, "marginRight"

    .line 117
    .line 118
    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 119
    .line 120
    .line 121
    move-result-object p4

    .line 122
    invoke-virtual {v1, p3, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    const-string p3, "marginBottom"

    .line 126
    .line 127
    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-virtual {v1, p3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    iget p1, p0, LW3/f;->g:I

    .line 135
    .line 136
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    const-string p2, "job"

    .line 141
    .line 142
    invoke-virtual {v1, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    iget-object p1, v0, LA/c;->g:Ljava/lang/Object;

    .line 146
    .line 147
    check-cast p1, Lk3/o;

    .line 148
    .line 149
    new-instance p2, LW3/a;

    .line 150
    .line 151
    const/4 p3, 0x0

    .line 152
    invoke-direct {p2, p3, p0}, LW3/a;-><init>(ILjava/lang/Object;)V

    .line 153
    .line 154
    .line 155
    const-string p3, "onLayout"

    .line 156
    .line 157
    invoke-virtual {p1, p3, v1, p2}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 158
    .line 159
    .line 160
    return-void
.end method

.method public final onWrite([Landroid/print/PageRange;Landroid/os/ParcelFileDescriptor;Landroid/os/CancellationSignal;Landroid/print/PrintDocumentAdapter$WriteResultCallback;)V
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    :try_start_0
    new-instance p3, Ljava/io/FileOutputStream;

    .line 3
    .line 4
    invoke-virtual {p2}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    invoke-direct {p3, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/FileDescriptor;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 9
    .line 10
    .line 11
    :try_start_1
    iget-object p1, p0, LW3/f;->d:[B

    .line 12
    .line 13
    array-length p2, p1

    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p3, p1, v0, p2}, Ljava/io/OutputStream;->write([BII)V

    .line 16
    .line 17
    .line 18
    sget-object p1, Landroid/print/PageRange;->ALL_PAGES:Landroid/print/PageRange;

    .line 19
    .line 20
    filled-new-array {p1}, [Landroid/print/PageRange;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p4, p1}, Landroid/print/PrintDocumentAdapter$WriteResultCallback;->onWriteFinished([Landroid/print/PageRange;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    .line 26
    .line 27
    :try_start_2
    invoke-virtual {p3}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :catch_0
    move-exception p1

    .line 32
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 33
    .line 34
    .line 35
    goto :goto_1

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_2

    .line 38
    :catch_1
    move-exception p1

    .line 39
    goto :goto_0

    .line 40
    :catchall_1
    move-exception p2

    .line 41
    move-object p3, p1

    .line 42
    move-object p1, p2

    .line 43
    goto :goto_2

    .line 44
    :catch_2
    move-exception p2

    .line 45
    move-object p3, p1

    .line 46
    move-object p1, p2

    .line 47
    :goto_0
    :try_start_3
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 48
    .line 49
    .line 50
    if-eqz p3, :cond_0

    .line 51
    .line 52
    :try_start_4
    invoke-virtual {p3}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 53
    .line 54
    .line 55
    :cond_0
    :goto_1
    return-void

    .line 56
    :goto_2
    if-eqz p3, :cond_1

    .line 57
    .line 58
    :try_start_5
    invoke-virtual {p3}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 59
    .line 60
    .line 61
    goto :goto_3

    .line 62
    :catch_3
    move-exception p2

    .line 63
    invoke-virtual {p2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 64
    .line 65
    .line 66
    :cond_1
    :goto_3
    throw p1
.end method
