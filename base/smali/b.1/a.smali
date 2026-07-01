.class public final Lb/a;
.super Landroid/print/PrintDocumentAdapter$WriteResultCallback;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ljava/io/File;

.field public final synthetic b:Lb/b;


# direct methods
.method public constructor <init>(Lb/b;Ljava/io/File;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lb/a;->b:Lb/b;

    .line 2
    .line 3
    iput-object p2, p0, Lb/a;->a:Ljava/io/File;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/print/PrintDocumentAdapter$WriteResultCallback;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onWriteFinished([Landroid/print/PageRange;)V
    .locals 8

    .line 1
    invoke-super {p0, p1}, Landroid/print/PrintDocumentAdapter$WriteResultCallback;->onWriteFinished([Landroid/print/PageRange;)V

    .line 2
    .line 3
    .line 4
    array-length p1, p1

    .line 5
    iget-object v0, p0, Lb/a;->b:Lb/b;

    .line 6
    .line 7
    const-string v1, "Unable to delete temporary file"

    .line 8
    .line 9
    const-string v2, "PDF"

    .line 10
    .line 11
    iget-object v3, p0, Lb/a;->a:Ljava/io/File;

    .line 12
    .line 13
    if-nez p1, :cond_1

    .line 14
    .line 15
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p1, v0, Lb/b;->b:LE/i;

    .line 25
    .line 26
    const-string v4, "No page created"

    .line 27
    .line 28
    invoke-virtual {p1, v4}, LE/i;->B(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    iget-object p1, v0, Lb/b;->b:LE/i;

    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    :try_start_0
    invoke-virtual {v3}, Ljava/io/File;->length()J

    .line 37
    .line 38
    .line 39
    move-result-wide v4

    .line 40
    long-to-int v0, v4

    .line 41
    new-array v0, v0, [B

    .line 42
    .line 43
    new-instance v4, Ljava/io/FileInputStream;

    .line 44
    .line 45
    invoke-direct {v4, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    .line 47
    .line 48
    :try_start_1
    invoke-virtual {v4, v0}, Ljava/io/InputStream;->read([B)I

    .line 49
    .line 50
    .line 51
    move-result v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 52
    const/4 v6, -0x1

    .line 53
    if-eq v5, v6, :cond_2

    .line 54
    .line 55
    :try_start_2
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 56
    .line 57
    .line 58
    iget-object v4, p1, LE/i;->f:Ljava/lang/Object;

    .line 59
    .line 60
    check-cast v4, LW3/e;

    .line 61
    .line 62
    iget-object v4, v4, LW3/e;->d:LW3/f;

    .line 63
    .line 64
    iget-object v5, v4, LW3/f;->b:LA/c;

    .line 65
    .line 66
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 67
    .line 68
    .line 69
    new-instance v6, Ljava/util/HashMap;

    .line 70
    .line 71
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 72
    .line 73
    .line 74
    const-string v7, "doc"

    .line 75
    .line 76
    invoke-virtual {v6, v7, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    const-string v0, "job"

    .line 80
    .line 81
    iget v4, v4, LW3/f;->g:I

    .line 82
    .line 83
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    invoke-virtual {v6, v0, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    iget-object v0, v5, LA/c;->g:Ljava/lang/Object;

    .line 91
    .line 92
    check-cast v0, Lk3/o;

    .line 93
    .line 94
    const-string v4, "onHtmlRendered"

    .line 95
    .line 96
    const/4 v5, 0x0

    .line 97
    invoke-virtual {v0, v4, v6, v5}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 98
    .line 99
    .line 100
    goto :goto_2

    .line 101
    :catch_0
    move-exception v0

    .line 102
    goto :goto_1

    .line 103
    :cond_2
    :try_start_3
    new-instance v0, Ljava/io/IOException;

    .line 104
    .line 105
    const-string v5, "EOF reached while trying to read the whole file"

    .line 106
    .line 107
    invoke-direct {v0, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 111
    :catchall_0
    move-exception v0

    .line 112
    :try_start_4
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 113
    .line 114
    .line 115
    goto :goto_0

    .line 116
    :catchall_1
    move-exception v4

    .line 117
    :try_start_5
    invoke-virtual {v0, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 118
    .line 119
    .line 120
    :goto_0
    throw v0
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    .line 121
    :goto_1
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {p1, v0}, LE/i;->B(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    :goto_2
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    if-nez p1, :cond_3

    .line 133
    .line 134
    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    .line 136
    .line 137
    :cond_3
    return-void
.end method
