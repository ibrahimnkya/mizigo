.class public final Lb/b;
.super Landroid/print/PrintDocumentAdapter$LayoutResultCallback;
.source "SourceFile"


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:LE/i;

.field public final synthetic c:Landroid/print/PrintDocumentAdapter;


# direct methods
.method public constructor <init>(Landroid/content/Context;LE/i;Landroid/print/PrintDocumentAdapter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lb/b;->a:Landroid/content/Context;

    .line 2
    .line 3
    iput-object p2, p0, Lb/b;->b:LE/i;

    .line 4
    .line 5
    iput-object p3, p0, Lb/b;->c:Landroid/print/PrintDocumentAdapter;

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/print/PrintDocumentAdapter$LayoutResultCallback;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onLayoutFinished(Landroid/print/PrintDocumentInfo;Z)V
    .locals 5

    .line 1
    iget-object p1, p0, Lb/b;->b:LE/i;

    .line 2
    .line 3
    iget-object p2, p0, Lb/b;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {p2}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    :try_start_0
    const-string v0, "printing"

    .line 10
    .line 11
    const-string v1, "pdf"

    .line 12
    .line 13
    invoke-static {v0, v1, p2}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    .line 14
    .line 15
    .line 16
    move-result-object p2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 17
    :try_start_1
    iget-object v0, p0, Lb/b;->c:Landroid/print/PrintDocumentAdapter;

    .line 18
    .line 19
    sget-object v1, Landroid/print/PageRange;->ALL_PAGES:Landroid/print/PageRange;

    .line 20
    .line 21
    filled-new-array {v1}, [Landroid/print/PageRange;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const/high16 v2, 0x30000000

    .line 26
    .line 27
    invoke-static {p2, v2}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    new-instance v3, Landroid/os/CancellationSignal;

    .line 32
    .line 33
    invoke-direct {v3}, Landroid/os/CancellationSignal;-><init>()V

    .line 34
    .line 35
    .line 36
    new-instance v4, Lb/a;

    .line 37
    .line 38
    invoke-direct {v4, p0, p2}, Lb/a;-><init>(Lb/b;Ljava/io/File;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/print/PrintDocumentAdapter;->onWrite([Landroid/print/PageRange;Landroid/os/ParcelFileDescriptor;Landroid/os/CancellationSignal;Landroid/print/PrintDocumentAdapter$WriteResultCallback;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :catch_0
    move-exception v0

    .line 46
    invoke-virtual {p2}, Ljava/io/File;->delete()Z

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    if-nez p2, :cond_0

    .line 51
    .line 52
    const-string p2, "PDF"

    .line 53
    .line 54
    const-string v1, "Unable to delete temporary file"

    .line 55
    .line 56
    invoke-static {p2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-virtual {p1, p2}, LE/i;->B(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :catch_1
    move-exception p2

    .line 68
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-virtual {p1, p2}, LE/i;->B(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method
