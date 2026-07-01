.class public final LT2/k;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic n:I


# instance fields
.field public final a:Lcom/journeyapps/barcodescanner/CaptureActivity;

.field public final b:Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;

.field public c:I

.field public d:Z

.field public e:Z

.field public f:Ljava/lang/String;

.field public g:Z

.field public final h:La3/f;

.field public final i:Ls3/l;

.field public final j:Landroid/os/Handler;

.field public k:Z

.field public final l:LA0/c;

.field public m:Z


# direct methods
.method public constructor <init>(Lcom/journeyapps/barcodescanner/CaptureActivity;Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, LT2/k;->c:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, LT2/k;->d:Z

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    iput-boolean v1, p0, LT2/k;->e:Z

    .line 12
    .line 13
    const-string v1, ""

    .line 14
    .line 15
    iput-object v1, p0, LT2/k;->f:Ljava/lang/String;

    .line 16
    .line 17
    iput-boolean v0, p0, LT2/k;->g:Z

    .line 18
    .line 19
    iput-boolean v0, p0, LT2/k;->k:Z

    .line 20
    .line 21
    new-instance v1, LA0/c;

    .line 22
    .line 23
    const/16 v2, 0x10

    .line 24
    .line 25
    invoke-direct {v1, v2, p0}, LA0/c;-><init>(ILjava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, LT2/k;->l:LA0/c;

    .line 29
    .line 30
    new-instance v1, LT2/f;

    .line 31
    .line 32
    const/4 v2, 0x1

    .line 33
    invoke-direct {v1, v2, p0}, LT2/f;-><init>(ILjava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    iput-boolean v0, p0, LT2/k;->m:Z

    .line 37
    .line 38
    iput-object p1, p0, LT2/k;->a:Lcom/journeyapps/barcodescanner/CaptureActivity;

    .line 39
    .line 40
    iput-object p2, p0, LT2/k;->b:Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;

    .line 41
    .line 42
    invoke-virtual {p2}, Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;->getBarcodeView()Lcom/journeyapps/barcodescanner/BarcodeView;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    iget-object p2, p2, LT2/g;->n:Ljava/util/ArrayList;

    .line 47
    .line 48
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    new-instance p2, Landroid/os/Handler;

    .line 52
    .line 53
    invoke-direct {p2}, Landroid/os/Handler;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object p2, p0, LT2/k;->j:Landroid/os/Handler;

    .line 57
    .line 58
    new-instance p2, La3/f;

    .line 59
    .line 60
    new-instance v0, LT2/h;

    .line 61
    .line 62
    const/4 v1, 0x0

    .line 63
    invoke-direct {v0, p0, v1}, LT2/h;-><init>(LT2/k;I)V

    .line 64
    .line 65
    .line 66
    invoke-direct {p2, p1, v0}, La3/f;-><init>(Lcom/journeyapps/barcodescanner/CaptureActivity;LT2/h;)V

    .line 67
    .line 68
    .line 69
    iput-object p2, p0, LT2/k;->h:La3/f;

    .line 70
    .line 71
    new-instance p2, Ls3/l;

    .line 72
    .line 73
    invoke-direct {p2, p1}, Ls3/l;-><init>(Lcom/journeyapps/barcodescanner/CaptureActivity;)V

    .line 74
    .line 75
    .line 76
    iput-object p2, p0, LT2/k;->i:Ls3/l;

    .line 77
    .line 78
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    iget-object v0, p0, LT2/k;->b:Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;->getBarcodeView()Lcom/journeyapps/barcodescanner/BarcodeView;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v1, v1, LT2/g;->e:LU2/g;

    .line 8
    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    iget-boolean v1, v1, LU2/g;->g:Z

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v1, 0x1

    .line 17
    iput-boolean v1, p0, LT2/k;->k:Z

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    iget-object v1, p0, LT2/k;->a:Lcom/journeyapps/barcodescanner/CaptureActivity;

    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 23
    .line 24
    .line 25
    :goto_1
    iget-object v0, v0, Lcom/journeyapps/barcodescanner/DecoratedBarcodeView;->e:Lcom/journeyapps/barcodescanner/BarcodeView;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/journeyapps/barcodescanner/BarcodeView;->i()V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, LT2/k;->h:La3/f;

    .line 31
    .line 32
    invoke-virtual {v0}, La3/f;->a()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, LT2/k;->a:Lcom/journeyapps/barcodescanner/CaptureActivity;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_2

    .line 8
    .line 9
    iget-boolean v1, p0, LT2/k;->g:Z

    .line 10
    .line 11
    if-nez v1, :cond_2

    .line 12
    .line 13
    iget-boolean v1, p0, LT2/k;->k:Z

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    const p1, 0x7f0e0054

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    :cond_1
    new-instance v1, Landroid/app/AlertDialog$Builder;

    .line 32
    .line 33
    invoke-direct {v1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 34
    .line 35
    .line 36
    const v2, 0x7f0e0052

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 47
    .line 48
    .line 49
    new-instance p1, LT2/i;

    .line 50
    .line 51
    invoke-direct {p1, p0}, LT2/i;-><init>(LT2/k;)V

    .line 52
    .line 53
    .line 54
    const v0, 0x7f0e0053

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1, v0, p1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 58
    .line 59
    .line 60
    new-instance p1, LT2/j;

    .line 61
    .line 62
    invoke-direct {p1, p0}, LT2/j;-><init>(LT2/k;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1, p1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 69
    .line 70
    .line 71
    :cond_2
    :goto_0
    return-void
.end method
