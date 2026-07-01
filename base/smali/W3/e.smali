.class public final LW3/e;
.super Landroid/webkit/WebViewClient;
.source "SourceFile"


# instance fields
.field public final synthetic a:Landroid/print/PrintAttributes$MediaSize;

.field public final synthetic b:Landroid/print/PrintAttributes$Margins;

.field public final synthetic c:Landroid/webkit/WebView;

.field public final synthetic d:LW3/f;


# direct methods
.method public constructor <init>(LW3/f;Landroid/print/PrintAttributes$MediaSize;Landroid/print/PrintAttributes$Margins;Landroid/webkit/WebView;)V
    .locals 0

    .line 1
    iput-object p1, p0, LW3/e;->d:LW3/f;

    .line 2
    .line 3
    iput-object p2, p0, LW3/e;->a:Landroid/print/PrintAttributes$MediaSize;

    .line 4
    .line 5
    iput-object p3, p0, LW3/e;->b:Landroid/print/PrintAttributes$Margins;

    .line 6
    .line 7
    iput-object p4, p0, LW3/e;->c:Landroid/webkit/WebView;

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/print/PrintAttributes$Builder;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/print/PrintAttributes$Builder;-><init>()V

    .line 7
    .line 8
    .line 9
    iget-object p2, p0, LW3/e;->a:Landroid/print/PrintAttributes$MediaSize;

    .line 10
    .line 11
    invoke-virtual {p1, p2}, Landroid/print/PrintAttributes$Builder;->setMediaSize(Landroid/print/PrintAttributes$MediaSize;)Landroid/print/PrintAttributes$Builder;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance p2, Landroid/print/PrintAttributes$Resolution;

    .line 16
    .line 17
    const-string v0, "pdf"

    .line 18
    .line 19
    const/16 v1, 0x258

    .line 20
    .line 21
    invoke-direct {p2, v0, v0, v1, v1}, Landroid/print/PrintAttributes$Resolution;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, p2}, Landroid/print/PrintAttributes$Builder;->setResolution(Landroid/print/PrintAttributes$Resolution;)Landroid/print/PrintAttributes$Builder;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object p2, p0, LW3/e;->b:Landroid/print/PrintAttributes$Margins;

    .line 29
    .line 30
    invoke-virtual {p1, p2}, Landroid/print/PrintAttributes$Builder;->setMinMargins(Landroid/print/PrintAttributes$Margins;)Landroid/print/PrintAttributes$Builder;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Landroid/print/PrintAttributes$Builder;->build()Landroid/print/PrintAttributes;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    iget-object p1, p0, LW3/e;->c:Landroid/webkit/WebView;

    .line 39
    .line 40
    const-string p2, "printing"

    .line 41
    .line 42
    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->createPrintDocumentAdapter(Ljava/lang/String;)Landroid/print/PrintDocumentAdapter;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object p1, p0, LW3/e;->d:LW3/f;

    .line 47
    .line 48
    iget-object p1, p1, LW3/f;->a:Landroid/content/Context;

    .line 49
    .line 50
    new-instance p2, LE/i;

    .line 51
    .line 52
    const/16 v1, 0x11

    .line 53
    .line 54
    invoke-direct {p2, v1, p0}, LE/i;-><init>(ILjava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    new-instance v4, Lb/b;

    .line 58
    .line 59
    invoke-direct {v4, p1, p2, v0}, Lb/b;-><init>(Landroid/content/Context;LE/i;Landroid/print/PrintDocumentAdapter;)V

    .line 60
    .line 61
    .line 62
    const/4 v5, 0x0

    .line 63
    const/4 v1, 0x0

    .line 64
    const/4 v3, 0x0

    .line 65
    invoke-virtual/range {v0 .. v5}, Landroid/print/PrintDocumentAdapter;->onLayout(Landroid/print/PrintAttributes;Landroid/print/PrintAttributes;Landroid/os/CancellationSignal;Landroid/print/PrintDocumentAdapter$LayoutResultCallback;Landroid/os/Bundle;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method
