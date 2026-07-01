.class public final Lio/flutter/plugin/editing/c;
.super Landroid/view/inputmethod/BaseInputConnection;
.source "SourceFile"

# interfaces
.implements Lio/flutter/plugin/editing/e;


# instance fields
.field public final a:LZ2/p;

.field public final b:I

.field public final c:LZ2/s;

.field public final d:Lio/flutter/plugin/editing/f;

.field public final e:Landroid/view/inputmethod/EditorInfo;

.field public f:Landroid/view/inputmethod/ExtractedTextRequest;

.field public g:Z

.field public h:Landroid/view/inputmethod/CursorAnchorInfo$Builder;

.field public final i:Landroid/view/inputmethod/ExtractedText;

.field public final j:Landroid/view/inputmethod/InputMethodManager;

.field public final k:Landroid/text/DynamicLayout;

.field public final l:LA0/c;

.field public final m:LB2/a;

.field public n:I


# direct methods
.method public constructor <init>(LZ2/p;ILZ2/s;LB2/a;Lio/flutter/plugin/editing/f;Landroid/view/inputmethod/EditorInfo;)V
    .locals 9

    .line 1
    new-instance v0, Lio/flutter/embedding/engine/FlutterJNI;

    .line 2
    .line 3
    invoke-direct {v0}, Lio/flutter/embedding/engine/FlutterJNI;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-direct {p0, p1, v1}, Landroid/view/inputmethod/BaseInputConnection;-><init>(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput-boolean v1, p0, Lio/flutter/plugin/editing/c;->g:Z

    .line 12
    .line 13
    new-instance v2, Landroid/view/inputmethod/ExtractedText;

    .line 14
    .line 15
    invoke-direct {v2}, Landroid/view/inputmethod/ExtractedText;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v2, p0, Lio/flutter/plugin/editing/c;->i:Landroid/view/inputmethod/ExtractedText;

    .line 19
    .line 20
    iput v1, p0, Lio/flutter/plugin/editing/c;->n:I

    .line 21
    .line 22
    iput-object p1, p0, Lio/flutter/plugin/editing/c;->a:LZ2/p;

    .line 23
    .line 24
    iput p2, p0, Lio/flutter/plugin/editing/c;->b:I

    .line 25
    .line 26
    iput-object p3, p0, Lio/flutter/plugin/editing/c;->c:LZ2/s;

    .line 27
    .line 28
    iput-object p5, p0, Lio/flutter/plugin/editing/c;->d:Lio/flutter/plugin/editing/f;

    .line 29
    .line 30
    invoke-virtual {p5, p0}, Lio/flutter/plugin/editing/f;->a(Lio/flutter/plugin/editing/e;)V

    .line 31
    .line 32
    .line 33
    iput-object p6, p0, Lio/flutter/plugin/editing/c;->e:Landroid/view/inputmethod/EditorInfo;

    .line 34
    .line 35
    iput-object p4, p0, Lio/flutter/plugin/editing/c;->m:LB2/a;

    .line 36
    .line 37
    new-instance p2, LA0/c;

    .line 38
    .line 39
    const/16 p3, 0x1d

    .line 40
    .line 41
    invoke-direct {p2, p3, v0}, LA0/c;-><init>(ILjava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    iput-object p2, p0, Lio/flutter/plugin/editing/c;->l:LA0/c;

    .line 45
    .line 46
    new-instance v1, Landroid/text/DynamicLayout;

    .line 47
    .line 48
    new-instance v3, Landroid/text/TextPaint;

    .line 49
    .line 50
    invoke-direct {v3}, Landroid/text/TextPaint;-><init>()V

    .line 51
    .line 52
    .line 53
    sget-object v5, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    .line 54
    .line 55
    const/4 v7, 0x0

    .line 56
    const/4 v8, 0x0

    .line 57
    const v4, 0x7fffffff

    .line 58
    .line 59
    .line 60
    const/high16 v6, 0x3f800000    # 1.0f

    .line 61
    .line 62
    move-object v2, p5

    .line 63
    invoke-direct/range {v1 .. v8}, Landroid/text/DynamicLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 64
    .line 65
    .line 66
    iput-object v1, p0, Lio/flutter/plugin/editing/c;->k:Landroid/text/DynamicLayout;

    .line 67
    .line 68
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    const-string p2, "input_method"

    .line 73
    .line 74
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    check-cast p1, Landroid/view/inputmethod/InputMethodManager;

    .line 79
    .line 80
    iput-object p1, p0, Lio/flutter/plugin/editing/c;->j:Landroid/view/inputmethod/InputMethodManager;

    .line 81
    .line 82
    return-void
.end method


# virtual methods
.method public final a(Z)V
    .locals 6

    .line 1
    iget-object p1, p0, Lio/flutter/plugin/editing/c;->d:Lio/flutter/plugin/editing/f;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    invoke-static {p1}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    invoke-static {p1}, Landroid/view/inputmethod/BaseInputConnection;->getComposingSpanStart(Landroid/text/Spannable;)I

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    invoke-static {p1}, Landroid/view/inputmethod/BaseInputConnection;->getComposingSpanEnd(Landroid/text/Spannable;)I

    .line 19
    .line 20
    .line 21
    move-result v5

    .line 22
    iget-object v0, p0, Lio/flutter/plugin/editing/c;->j:Landroid/view/inputmethod/InputMethodManager;

    .line 23
    .line 24
    iget-object v1, p0, Lio/flutter/plugin/editing/c;->a:LZ2/p;

    .line 25
    .line 26
    invoke-virtual/range {v0 .. v5}, Landroid/view/inputmethod/InputMethodManager;->updateSelection(Landroid/view/View;IIII)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lio/flutter/plugin/editing/c;->f:Landroid/view/inputmethod/ExtractedTextRequest;

    .line 30
    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    iget v2, p1, Landroid/view/inputmethod/ExtractedTextRequest;->token:I

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lio/flutter/plugin/editing/c;->c(Landroid/view/inputmethod/ExtractedTextRequest;)Landroid/view/inputmethod/ExtractedText;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {v0, v1, v2, p1}, Landroid/view/inputmethod/InputMethodManager;->updateExtractedText(Landroid/view/View;ILandroid/view/inputmethod/ExtractedText;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    iget-boolean p1, p0, Lio/flutter/plugin/editing/c;->g:Z

    .line 43
    .line 44
    if-eqz p1, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0}, Lio/flutter/plugin/editing/c;->b()Landroid/view/inputmethod/CursorAnchorInfo;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {v0, v1, p1}, Landroid/view/inputmethod/InputMethodManager;->updateCursorAnchorInfo(Landroid/view/View;Landroid/view/inputmethod/CursorAnchorInfo;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public final b()Landroid/view/inputmethod/CursorAnchorInfo;
    .locals 4

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/editing/c;->h:Landroid/view/inputmethod/CursorAnchorInfo$Builder;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/view/inputmethod/CursorAnchorInfo$Builder;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/view/inputmethod/CursorAnchorInfo$Builder;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lio/flutter/plugin/editing/c;->h:Landroid/view/inputmethod/CursorAnchorInfo$Builder;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {v0}, Landroid/view/inputmethod/CursorAnchorInfo$Builder;->reset()V

    .line 14
    .line 15
    .line 16
    :goto_0
    iget-object v0, p0, Lio/flutter/plugin/editing/c;->h:Landroid/view/inputmethod/CursorAnchorInfo$Builder;

    .line 17
    .line 18
    iget-object v1, p0, Lio/flutter/plugin/editing/c;->d:Lio/flutter/plugin/editing/f;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    invoke-virtual {v0, v2, v3}, Landroid/view/inputmethod/CursorAnchorInfo$Builder;->setSelectionRange(II)Landroid/view/inputmethod/CursorAnchorInfo$Builder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    invoke-static {v1}, Landroid/view/inputmethod/BaseInputConnection;->getComposingSpanStart(Landroid/text/Spannable;)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 45
    .line 46
    .line 47
    invoke-static {v1}, Landroid/view/inputmethod/BaseInputConnection;->getComposingSpanEnd(Landroid/text/Spannable;)I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-ltz v0, :cond_1

    .line 52
    .line 53
    if-le v2, v0, :cond_1

    .line 54
    .line 55
    iget-object v3, p0, Lio/flutter/plugin/editing/c;->h:Landroid/view/inputmethod/CursorAnchorInfo$Builder;

    .line 56
    .line 57
    invoke-virtual {v1}, Lio/flutter/plugin/editing/f;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v3, v0, v1}, Landroid/view/inputmethod/CursorAnchorInfo$Builder;->setComposingText(ILjava/lang/CharSequence;)Landroid/view/inputmethod/CursorAnchorInfo$Builder;

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_1
    iget-object v0, p0, Lio/flutter/plugin/editing/c;->h:Landroid/view/inputmethod/CursorAnchorInfo$Builder;

    .line 70
    .line 71
    const/4 v1, -0x1

    .line 72
    const-string v2, ""

    .line 73
    .line 74
    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/CursorAnchorInfo$Builder;->setComposingText(ILjava/lang/CharSequence;)Landroid/view/inputmethod/CursorAnchorInfo$Builder;

    .line 75
    .line 76
    .line 77
    :goto_1
    iget-object v0, p0, Lio/flutter/plugin/editing/c;->h:Landroid/view/inputmethod/CursorAnchorInfo$Builder;

    .line 78
    .line 79
    invoke-virtual {v0}, Landroid/view/inputmethod/CursorAnchorInfo$Builder;->build()Landroid/view/inputmethod/CursorAnchorInfo;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    return-object v0
.end method

.method public final beginBatchEdit()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/editing/c;->d:Lio/flutter/plugin/editing/f;

    .line 2
    .line 3
    invoke-virtual {v0}, Lio/flutter/plugin/editing/f;->b()V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Lio/flutter/plugin/editing/c;->n:I

    .line 7
    .line 8
    add-int/lit8 v0, v0, 0x1

    .line 9
    .line 10
    iput v0, p0, Lio/flutter/plugin/editing/c;->n:I

    .line 11
    .line 12
    invoke-super {p0}, Landroid/view/inputmethod/BaseInputConnection;->beginBatchEdit()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    return v0
.end method

.method public final c(Landroid/view/inputmethod/ExtractedTextRequest;)Landroid/view/inputmethod/ExtractedText;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iget-object v1, p0, Lio/flutter/plugin/editing/c;->i:Landroid/view/inputmethod/ExtractedText;

    .line 3
    .line 4
    iput v0, v1, Landroid/view/inputmethod/ExtractedText;->startOffset:I

    .line 5
    .line 6
    const/4 v0, -0x1

    .line 7
    iput v0, v1, Landroid/view/inputmethod/ExtractedText;->partialStartOffset:I

    .line 8
    .line 9
    iput v0, v1, Landroid/view/inputmethod/ExtractedText;->partialEndOffset:I

    .line 10
    .line 11
    iget-object v0, p0, Lio/flutter/plugin/editing/c;->d:Lio/flutter/plugin/editing/f;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-static {v0}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    iput v2, v1, Landroid/view/inputmethod/ExtractedText;->selectionStart:I

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    invoke-static {v0}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    iput v2, v1, Landroid/view/inputmethod/ExtractedText;->selectionEnd:I

    .line 30
    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    iget p1, p1, Landroid/view/inputmethod/ExtractedTextRequest;->flags:I

    .line 34
    .line 35
    and-int/lit8 p1, p1, 0x1

    .line 36
    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    :cond_0
    invoke-virtual {v0}, Lio/flutter/plugin/editing/f;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    :cond_1
    iput-object v0, v1, Landroid/view/inputmethod/ExtractedText;->text:Ljava/lang/CharSequence;

    .line 44
    .line 45
    return-object v1
.end method

.method public final closeConnection()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/inputmethod/BaseInputConnection;->closeConnection()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lio/flutter/plugin/editing/c;->d:Lio/flutter/plugin/editing/f;

    .line 5
    .line 6
    invoke-virtual {v0, p0}, Lio/flutter/plugin/editing/f;->e(Lio/flutter/plugin/editing/e;)V

    .line 7
    .line 8
    .line 9
    :goto_0
    iget v0, p0, Lio/flutter/plugin/editing/c;->n:I

    .line 10
    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lio/flutter/plugin/editing/c;->endBatchEdit()Z

    .line 14
    .line 15
    .line 16
    iget v0, p0, Lio/flutter/plugin/editing/c;->n:I

    .line 17
    .line 18
    add-int/lit8 v0, v0, -0x1

    .line 19
    .line 20
    iput v0, p0, Lio/flutter/plugin/editing/c;->n:I

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public final commitContent(Landroid/view/inputmethod/InputContentInfo;ILandroid/os/Bundle;)Z
    .locals 7

    .line 1
    sget p3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v0, 0x19

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-lt p3, v0, :cond_2

    .line 7
    .line 8
    const/4 p3, 0x1

    .line 9
    and-int/2addr p2, p3

    .line 10
    if-eqz p2, :cond_2

    .line 11
    .line 12
    :try_start_0
    invoke-static {p1}, LF/a;->d(Landroid/view/inputmethod/InputContentInfo;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 13
    .line 14
    .line 15
    invoke-static {p1}, LF/a;->a(Landroid/view/inputmethod/InputContentInfo;)Landroid/content/ClipDescription;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p2}, Landroid/content/ClipDescription;->getMimeTypeCount()I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-lez p2, :cond_2

    .line 24
    .line 25
    invoke-static {p1}, LF/a;->d(Landroid/view/inputmethod/InputContentInfo;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p1}, LF/a;->b(Landroid/view/inputmethod/InputContentInfo;)Landroid/net/Uri;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-static {p1}, LF/a;->a(Landroid/view/inputmethod/InputContentInfo;)Landroid/content/ClipDescription;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0, v1}, Landroid/content/ClipDescription;->getMimeType(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v2, p0, Lio/flutter/plugin/editing/c;->a:LZ2/p;

    .line 41
    .line 42
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    if-eqz p2, :cond_1

    .line 47
    .line 48
    :try_start_1
    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v2, p2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    .line 53
    .line 54
    .line 55
    move-result-object v2
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 56
    if-eqz v2, :cond_1

    .line 57
    .line 58
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    .line 59
    .line 60
    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 61
    .line 62
    .line 63
    const/high16 v4, 0x10000

    .line 64
    .line 65
    new-array v4, v4, [B

    .line 66
    .line 67
    :goto_0
    const/4 v5, -0x1

    .line 68
    :try_start_2
    invoke-virtual {v2, v4}, Ljava/io/InputStream;->read([B)I

    .line 69
    .line 70
    .line 71
    move-result v6
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 72
    goto :goto_1

    .line 73
    :catch_0
    move v6, v5

    .line 74
    :goto_1
    if-ne v6, v5, :cond_0

    .line 75
    .line 76
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    new-instance v2, Ljava/util/HashMap;

    .line 81
    .line 82
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 83
    .line 84
    .line 85
    const-string v3, "mimeType"

    .line 86
    .line 87
    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    const-string v0, "data"

    .line 91
    .line 92
    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    const-string v0, "uri"

    .line 96
    .line 97
    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    invoke-virtual {v2, v0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    iget-object p2, p0, Lio/flutter/plugin/editing/c;->c:LZ2/s;

    .line 105
    .line 106
    iget-object p2, p2, LZ2/s;->f:Ljava/lang/Object;

    .line 107
    .line 108
    check-cast p2, Lk3/o;

    .line 109
    .line 110
    iget v0, p0, Lio/flutter/plugin/editing/c;->b:I

    .line 111
    .line 112
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    const-string v1, "TextInputAction.commitContent"

    .line 117
    .line 118
    filled-new-array {v0, v1, v2}, [Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    const/4 v1, 0x0

    .line 127
    const-string v2, "TextInputClient.performAction"

    .line 128
    .line 129
    invoke-virtual {p2, v2, v0, v1}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 130
    .line 131
    .line 132
    invoke-static {p1}, LF/a;->e(Landroid/view/inputmethod/InputContentInfo;)V

    .line 133
    .line 134
    .line 135
    return p3

    .line 136
    :cond_0
    invoke-virtual {v3, v4, v1, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 137
    .line 138
    .line 139
    goto :goto_0

    .line 140
    :catch_1
    invoke-static {p1}, LF/a;->e(Landroid/view/inputmethod/InputContentInfo;)V

    .line 141
    .line 142
    .line 143
    return v1

    .line 144
    :cond_1
    invoke-static {p1}, LF/a;->e(Landroid/view/inputmethod/InputContentInfo;)V

    .line 145
    .line 146
    .line 147
    :catch_2
    :cond_2
    return v1
.end method

.method public final d(ZZ)Z
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lio/flutter/plugin/editing/c;->d:Lio/flutter/plugin/editing/f;

    .line 4
    .line 5
    invoke-static {v1}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    invoke-static {v1}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    const/4 v4, 0x0

    .line 14
    if-ltz v2, :cond_2f

    .line 15
    .line 16
    if-gez v3, :cond_0

    .line 17
    .line 18
    goto/16 :goto_15

    .line 19
    .line 20
    :cond_0
    const/16 v5, 0x200d

    .line 21
    .line 22
    const/16 v6, 0x20e3

    .line 23
    .line 24
    const/16 v7, 0xd

    .line 25
    .line 26
    const/16 v8, 0xa

    .line 27
    .line 28
    iget-object v9, v0, Lio/flutter/plugin/editing/c;->l:LA0/c;

    .line 29
    .line 30
    const/4 v10, 0x1

    .line 31
    if-eqz p1, :cond_17

    .line 32
    .line 33
    iget-object v9, v9, LA0/c;->f:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast v9, Lio/flutter/embedding/engine/FlutterJNI;

    .line 36
    .line 37
    if-gt v3, v10, :cond_1

    .line 38
    .line 39
    :goto_0
    move v1, v4

    .line 40
    goto/16 :goto_9

    .line 41
    .line 42
    :cond_1
    invoke-static {v1, v3}, Ljava/lang/Character;->codePointBefore(Ljava/lang/CharSequence;I)I

    .line 43
    .line 44
    .line 45
    move-result v11

    .line 46
    invoke-static {v11}, Ljava/lang/Character;->charCount(I)I

    .line 47
    .line 48
    .line 49
    move-result v12

    .line 50
    sub-int v13, v3, v12

    .line 51
    .line 52
    if-nez v13, :cond_2

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    if-ne v11, v8, :cond_4

    .line 56
    .line 57
    invoke-static {v1, v13}, Ljava/lang/Character;->codePointBefore(Ljava/lang/CharSequence;I)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-ne v1, v7, :cond_3

    .line 62
    .line 63
    add-int/lit8 v12, v12, 0x1

    .line 64
    .line 65
    :cond_3
    :goto_1
    sub-int v1, v3, v12

    .line 66
    .line 67
    goto/16 :goto_9

    .line 68
    .line 69
    :cond_4
    invoke-virtual {v9, v11}, Lio/flutter/embedding/engine/FlutterJNI;->isCodePointRegionalIndicator(I)Z

    .line 70
    .line 71
    .line 72
    move-result v7

    .line 73
    if-eqz v7, :cond_6

    .line 74
    .line 75
    invoke-static {v1, v13}, Ljava/lang/Character;->codePointBefore(Ljava/lang/CharSequence;I)I

    .line 76
    .line 77
    .line 78
    move-result v5

    .line 79
    invoke-static {v5}, Ljava/lang/Character;->charCount(I)I

    .line 80
    .line 81
    .line 82
    move-result v6

    .line 83
    sub-int/2addr v13, v6

    .line 84
    move v6, v10

    .line 85
    :goto_2
    if-lez v13, :cond_5

    .line 86
    .line 87
    invoke-virtual {v9, v5}, Lio/flutter/embedding/engine/FlutterJNI;->isCodePointRegionalIndicator(I)Z

    .line 88
    .line 89
    .line 90
    move-result v5

    .line 91
    if-eqz v5, :cond_5

    .line 92
    .line 93
    invoke-static {v1, v13}, Ljava/lang/Character;->codePointBefore(Ljava/lang/CharSequence;I)I

    .line 94
    .line 95
    .line 96
    move-result v5

    .line 97
    invoke-static {v5}, Ljava/lang/Character;->charCount(I)I

    .line 98
    .line 99
    .line 100
    move-result v7

    .line 101
    sub-int/2addr v13, v7

    .line 102
    add-int/lit8 v6, v6, 0x1

    .line 103
    .line 104
    goto :goto_2

    .line 105
    :cond_5
    rem-int/lit8 v6, v6, 0x2

    .line 106
    .line 107
    if-nez v6, :cond_3

    .line 108
    .line 109
    add-int/lit8 v12, v12, 0x2

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_6
    if-ne v11, v6, :cond_8

    .line 113
    .line 114
    invoke-static {v1, v13}, Ljava/lang/Character;->codePointBefore(Ljava/lang/CharSequence;I)I

    .line 115
    .line 116
    .line 117
    move-result v5

    .line 118
    invoke-static {v5}, Ljava/lang/Character;->charCount(I)I

    .line 119
    .line 120
    .line 121
    move-result v6

    .line 122
    sub-int/2addr v13, v6

    .line 123
    if-lez v13, :cond_7

    .line 124
    .line 125
    invoke-virtual {v9, v5}, Lio/flutter/embedding/engine/FlutterJNI;->isCodePointVariantSelector(I)Z

    .line 126
    .line 127
    .line 128
    move-result v6

    .line 129
    if-eqz v6, :cond_7

    .line 130
    .line 131
    invoke-static {v1, v13}, Ljava/lang/Character;->codePointBefore(Ljava/lang/CharSequence;I)I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    invoke-static {v1}, LA0/c;->y(I)Z

    .line 136
    .line 137
    .line 138
    move-result v6

    .line 139
    if-eqz v6, :cond_3

    .line 140
    .line 141
    invoke-static {v5}, Ljava/lang/Character;->charCount(I)I

    .line 142
    .line 143
    .line 144
    move-result v5

    .line 145
    invoke-static {v1}, Ljava/lang/Character;->charCount(I)I

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    add-int/2addr v1, v5

    .line 150
    goto :goto_3

    .line 151
    :cond_7
    invoke-static {v5}, LA0/c;->y(I)Z

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    if-eqz v1, :cond_3

    .line 156
    .line 157
    invoke-static {v5}, Ljava/lang/Character;->charCount(I)I

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    :goto_3
    add-int/2addr v12, v1

    .line 162
    goto :goto_1

    .line 163
    :cond_8
    const v6, 0xe007f

    .line 164
    .line 165
    .line 166
    if-ne v11, v6, :cond_b

    .line 167
    .line 168
    invoke-static {v1, v13}, Ljava/lang/Character;->codePointBefore(Ljava/lang/CharSequence;I)I

    .line 169
    .line 170
    .line 171
    move-result v6

    .line 172
    invoke-static {v6}, Ljava/lang/Character;->charCount(I)I

    .line 173
    .line 174
    .line 175
    move-result v7

    .line 176
    sub-int/2addr v13, v7

    .line 177
    move v11, v6

    .line 178
    :goto_4
    if-lez v13, :cond_9

    .line 179
    .line 180
    const v6, 0xe0020

    .line 181
    .line 182
    .line 183
    if-gt v6, v11, :cond_9

    .line 184
    .line 185
    const v6, 0xe007e

    .line 186
    .line 187
    .line 188
    if-gt v11, v6, :cond_9

    .line 189
    .line 190
    invoke-static {v11}, Ljava/lang/Character;->charCount(I)I

    .line 191
    .line 192
    .line 193
    move-result v6

    .line 194
    add-int/2addr v12, v6

    .line 195
    invoke-static {v1, v13}, Ljava/lang/Character;->codePointBefore(Ljava/lang/CharSequence;I)I

    .line 196
    .line 197
    .line 198
    move-result v11

    .line 199
    invoke-static {v11}, Ljava/lang/Character;->charCount(I)I

    .line 200
    .line 201
    .line 202
    move-result v6

    .line 203
    sub-int/2addr v13, v6

    .line 204
    goto :goto_4

    .line 205
    :cond_9
    invoke-virtual {v9, v11}, Lio/flutter/embedding/engine/FlutterJNI;->isCodePointEmoji(I)Z

    .line 206
    .line 207
    .line 208
    move-result v6

    .line 209
    if-nez v6, :cond_a

    .line 210
    .line 211
    add-int/lit8 v1, v3, -0x2

    .line 212
    .line 213
    goto/16 :goto_9

    .line 214
    .line 215
    :cond_a
    invoke-static {v11}, Ljava/lang/Character;->charCount(I)I

    .line 216
    .line 217
    .line 218
    move-result v6

    .line 219
    add-int/2addr v12, v6

    .line 220
    :cond_b
    invoke-virtual {v9, v11}, Lio/flutter/embedding/engine/FlutterJNI;->isCodePointVariantSelector(I)Z

    .line 221
    .line 222
    .line 223
    move-result v6

    .line 224
    if-eqz v6, :cond_d

    .line 225
    .line 226
    invoke-static {v1, v13}, Ljava/lang/Character;->codePointBefore(Ljava/lang/CharSequence;I)I

    .line 227
    .line 228
    .line 229
    move-result v11

    .line 230
    invoke-virtual {v9, v11}, Lio/flutter/embedding/engine/FlutterJNI;->isCodePointEmoji(I)Z

    .line 231
    .line 232
    .line 233
    move-result v6

    .line 234
    if-nez v6, :cond_c

    .line 235
    .line 236
    goto/16 :goto_1

    .line 237
    .line 238
    :cond_c
    invoke-static {v11}, Ljava/lang/Character;->charCount(I)I

    .line 239
    .line 240
    .line 241
    move-result v6

    .line 242
    add-int/2addr v12, v6

    .line 243
    sub-int/2addr v13, v12

    .line 244
    :cond_d
    invoke-virtual {v9, v11}, Lio/flutter/embedding/engine/FlutterJNI;->isCodePointEmoji(I)Z

    .line 245
    .line 246
    .line 247
    move-result v6

    .line 248
    if-eqz v6, :cond_3

    .line 249
    .line 250
    move v6, v4

    .line 251
    move v7, v6

    .line 252
    :cond_e
    if-eqz v6, :cond_f

    .line 253
    .line 254
    invoke-static {v11}, Ljava/lang/Character;->charCount(I)I

    .line 255
    .line 256
    .line 257
    move-result v6

    .line 258
    add-int/2addr v6, v7

    .line 259
    add-int/2addr v6, v10

    .line 260
    add-int/2addr v6, v12

    .line 261
    move v12, v6

    .line 262
    move v6, v4

    .line 263
    :cond_f
    invoke-virtual {v9, v11}, Lio/flutter/embedding/engine/FlutterJNI;->isCodePointEmojiModifier(I)Z

    .line 264
    .line 265
    .line 266
    move-result v7

    .line 267
    if-eqz v7, :cond_12

    .line 268
    .line 269
    invoke-static {v1, v13}, Ljava/lang/Character;->codePointBefore(Ljava/lang/CharSequence;I)I

    .line 270
    .line 271
    .line 272
    move-result v5

    .line 273
    invoke-static {v5}, Ljava/lang/Character;->charCount(I)I

    .line 274
    .line 275
    .line 276
    move-result v6

    .line 277
    sub-int/2addr v13, v6

    .line 278
    if-lez v13, :cond_11

    .line 279
    .line 280
    invoke-virtual {v9, v5}, Lio/flutter/embedding/engine/FlutterJNI;->isCodePointVariantSelector(I)Z

    .line 281
    .line 282
    .line 283
    move-result v6

    .line 284
    if-eqz v6, :cond_11

    .line 285
    .line 286
    invoke-static {v1, v13}, Ljava/lang/Character;->codePointBefore(Ljava/lang/CharSequence;I)I

    .line 287
    .line 288
    .line 289
    move-result v5

    .line 290
    invoke-virtual {v9, v5}, Lio/flutter/embedding/engine/FlutterJNI;->isCodePointEmoji(I)Z

    .line 291
    .line 292
    .line 293
    move-result v1

    .line 294
    if-nez v1, :cond_10

    .line 295
    .line 296
    goto/16 :goto_1

    .line 297
    .line 298
    :cond_10
    invoke-static {v5}, Ljava/lang/Character;->charCount(I)I

    .line 299
    .line 300
    .line 301
    move-result v1

    .line 302
    invoke-static {v5}, Ljava/lang/Character;->charCount(I)I

    .line 303
    .line 304
    .line 305
    goto :goto_5

    .line 306
    :cond_11
    move v1, v4

    .line 307
    :goto_5
    invoke-virtual {v9, v5}, Lio/flutter/embedding/engine/FlutterJNI;->isCodePointEmojiModifierBase(I)Z

    .line 308
    .line 309
    .line 310
    move-result v6

    .line 311
    if-eqz v6, :cond_3

    .line 312
    .line 313
    invoke-static {v5}, Ljava/lang/Character;->charCount(I)I

    .line 314
    .line 315
    .line 316
    move-result v5

    .line 317
    add-int/2addr v5, v1

    .line 318
    add-int/2addr v12, v5

    .line 319
    goto :goto_8

    .line 320
    :cond_12
    if-lez v13, :cond_15

    .line 321
    .line 322
    invoke-static {v1, v13}, Ljava/lang/Character;->codePointBefore(Ljava/lang/CharSequence;I)I

    .line 323
    .line 324
    .line 325
    move-result v7

    .line 326
    invoke-static {v7}, Ljava/lang/Character;->charCount(I)I

    .line 327
    .line 328
    .line 329
    move-result v8

    .line 330
    sub-int/2addr v13, v8

    .line 331
    if-ne v7, v5, :cond_14

    .line 332
    .line 333
    invoke-static {v1, v13}, Ljava/lang/Character;->codePointBefore(Ljava/lang/CharSequence;I)I

    .line 334
    .line 335
    .line 336
    move-result v6

    .line 337
    invoke-static {v6}, Ljava/lang/Character;->charCount(I)I

    .line 338
    .line 339
    .line 340
    move-result v7

    .line 341
    sub-int/2addr v13, v7

    .line 342
    if-lez v13, :cond_13

    .line 343
    .line 344
    invoke-virtual {v9, v6}, Lio/flutter/embedding/engine/FlutterJNI;->isCodePointVariantSelector(I)Z

    .line 345
    .line 346
    .line 347
    move-result v7

    .line 348
    if-eqz v7, :cond_13

    .line 349
    .line 350
    invoke-static {v1, v13}, Ljava/lang/Character;->codePointBefore(Ljava/lang/CharSequence;I)I

    .line 351
    .line 352
    .line 353
    move-result v6

    .line 354
    invoke-static {v6}, Ljava/lang/Character;->charCount(I)I

    .line 355
    .line 356
    .line 357
    move-result v7

    .line 358
    invoke-static {v6}, Ljava/lang/Character;->charCount(I)I

    .line 359
    .line 360
    .line 361
    move-result v8

    .line 362
    sub-int/2addr v13, v8

    .line 363
    :goto_6
    move v11, v6

    .line 364
    move v6, v10

    .line 365
    goto :goto_7

    .line 366
    :cond_13
    move v7, v4

    .line 367
    goto :goto_6

    .line 368
    :cond_14
    move v11, v7

    .line 369
    :cond_15
    move v7, v4

    .line 370
    :goto_7
    if-nez v13, :cond_16

    .line 371
    .line 372
    goto :goto_8

    .line 373
    :cond_16
    if-eqz v6, :cond_3

    .line 374
    .line 375
    invoke-virtual {v9, v11}, Lio/flutter/embedding/engine/FlutterJNI;->isCodePointEmoji(I)Z

    .line 376
    .line 377
    .line 378
    move-result v8

    .line 379
    if-nez v8, :cond_e

    .line 380
    .line 381
    :goto_8
    goto/16 :goto_1

    .line 382
    .line 383
    :goto_9
    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    .line 384
    .line 385
    .line 386
    move-result v1

    .line 387
    goto/16 :goto_14

    .line 388
    .line 389
    :cond_17
    iget-object v9, v9, LA0/c;->f:Ljava/lang/Object;

    .line 390
    .line 391
    check-cast v9, Lio/flutter/embedding/engine/FlutterJNI;

    .line 392
    .line 393
    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 394
    .line 395
    .line 396
    move-result v11

    .line 397
    add-int/lit8 v12, v11, -0x1

    .line 398
    .line 399
    if-lt v3, v12, :cond_18

    .line 400
    .line 401
    move v4, v11

    .line 402
    goto/16 :goto_13

    .line 403
    .line 404
    :cond_18
    invoke-static {v1, v3}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 405
    .line 406
    .line 407
    move-result v13

    .line 408
    invoke-static {v13}, Ljava/lang/Character;->charCount(I)I

    .line 409
    .line 410
    .line 411
    move-result v14

    .line 412
    add-int v15, v3, v14

    .line 413
    .line 414
    if-nez v15, :cond_19

    .line 415
    .line 416
    goto/16 :goto_13

    .line 417
    .line 418
    :cond_19
    if-ne v13, v8, :cond_1b

    .line 419
    .line 420
    invoke-static {v1, v15}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 421
    .line 422
    .line 423
    move-result v4

    .line 424
    if-ne v4, v7, :cond_1a

    .line 425
    .line 426
    add-int/lit8 v14, v14, 0x1

    .line 427
    .line 428
    :cond_1a
    :goto_a
    add-int v4, v3, v14

    .line 429
    .line 430
    goto/16 :goto_13

    .line 431
    .line 432
    :cond_1b
    invoke-virtual {v9, v13}, Lio/flutter/embedding/engine/FlutterJNI;->isCodePointRegionalIndicator(I)Z

    .line 433
    .line 434
    .line 435
    move-result v7

    .line 436
    if-eqz v7, :cond_1f

    .line 437
    .line 438
    if-ge v15, v12, :cond_1e

    .line 439
    .line 440
    invoke-static {v1, v15}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 441
    .line 442
    .line 443
    move-result v5

    .line 444
    invoke-virtual {v9, v5}, Lio/flutter/embedding/engine/FlutterJNI;->isCodePointRegionalIndicator(I)Z

    .line 445
    .line 446
    .line 447
    move-result v5

    .line 448
    if-nez v5, :cond_1c

    .line 449
    .line 450
    goto :goto_c

    .line 451
    :cond_1c
    move v5, v3

    .line 452
    :goto_b
    if-lez v5, :cond_1d

    .line 453
    .line 454
    invoke-static {v1, v3}, Ljava/lang/Character;->codePointBefore(Ljava/lang/CharSequence;I)I

    .line 455
    .line 456
    .line 457
    move-result v6

    .line 458
    invoke-virtual {v9, v6}, Lio/flutter/embedding/engine/FlutterJNI;->isCodePointRegionalIndicator(I)Z

    .line 459
    .line 460
    .line 461
    move-result v6

    .line 462
    if-eqz v6, :cond_1d

    .line 463
    .line 464
    invoke-static {v1, v3}, Ljava/lang/Character;->codePointBefore(Ljava/lang/CharSequence;I)I

    .line 465
    .line 466
    .line 467
    move-result v6

    .line 468
    invoke-static {v6}, Ljava/lang/Character;->charCount(I)I

    .line 469
    .line 470
    .line 471
    move-result v6

    .line 472
    sub-int/2addr v5, v6

    .line 473
    add-int/lit8 v4, v4, 0x1

    .line 474
    .line 475
    goto :goto_b

    .line 476
    :cond_1d
    rem-int/lit8 v4, v4, 0x2

    .line 477
    .line 478
    if-nez v4, :cond_1a

    .line 479
    .line 480
    add-int/lit8 v14, v14, 0x2

    .line 481
    .line 482
    goto :goto_a

    .line 483
    :cond_1e
    :goto_c
    move v4, v15

    .line 484
    goto/16 :goto_13

    .line 485
    .line 486
    :cond_1f
    invoke-static {v13}, LA0/c;->y(I)Z

    .line 487
    .line 488
    .line 489
    move-result v7

    .line 490
    if-eqz v7, :cond_20

    .line 491
    .line 492
    invoke-static {v13}, Ljava/lang/Character;->charCount(I)I

    .line 493
    .line 494
    .line 495
    move-result v7

    .line 496
    add-int/2addr v14, v7

    .line 497
    :cond_20
    if-ne v13, v6, :cond_22

    .line 498
    .line 499
    invoke-static {v1, v15}, Ljava/lang/Character;->codePointBefore(Ljava/lang/CharSequence;I)I

    .line 500
    .line 501
    .line 502
    move-result v4

    .line 503
    invoke-static {v4}, Ljava/lang/Character;->charCount(I)I

    .line 504
    .line 505
    .line 506
    move-result v5

    .line 507
    add-int/2addr v5, v15

    .line 508
    if-ge v5, v11, :cond_21

    .line 509
    .line 510
    invoke-virtual {v9, v4}, Lio/flutter/embedding/engine/FlutterJNI;->isCodePointVariantSelector(I)Z

    .line 511
    .line 512
    .line 513
    move-result v6

    .line 514
    if-eqz v6, :cond_21

    .line 515
    .line 516
    invoke-static {v1, v5}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 517
    .line 518
    .line 519
    move-result v5

    .line 520
    invoke-static {v5}, LA0/c;->y(I)Z

    .line 521
    .line 522
    .line 523
    move-result v6

    .line 524
    if-eqz v6, :cond_1a

    .line 525
    .line 526
    invoke-static {v4}, Ljava/lang/Character;->charCount(I)I

    .line 527
    .line 528
    .line 529
    move-result v4

    .line 530
    invoke-static {v5}, Ljava/lang/Character;->charCount(I)I

    .line 531
    .line 532
    .line 533
    move-result v5

    .line 534
    :goto_d
    add-int/2addr v5, v4

    .line 535
    add-int/2addr v14, v5

    .line 536
    goto :goto_a

    .line 537
    :cond_21
    invoke-static {v4}, LA0/c;->y(I)Z

    .line 538
    .line 539
    .line 540
    move-result v5

    .line 541
    if-eqz v5, :cond_1a

    .line 542
    .line 543
    invoke-static {v4}, Ljava/lang/Character;->charCount(I)I

    .line 544
    .line 545
    .line 546
    move-result v4

    .line 547
    :goto_e
    add-int/2addr v14, v4

    .line 548
    goto :goto_a

    .line 549
    :cond_22
    invoke-virtual {v9, v13}, Lio/flutter/embedding/engine/FlutterJNI;->isCodePointEmoji(I)Z

    .line 550
    .line 551
    .line 552
    move-result v7

    .line 553
    if-eqz v7, :cond_1a

    .line 554
    .line 555
    move v7, v4

    .line 556
    move v8, v7

    .line 557
    :cond_23
    if-eqz v7, :cond_24

    .line 558
    .line 559
    invoke-static {v13}, Ljava/lang/Character;->charCount(I)I

    .line 560
    .line 561
    .line 562
    move-result v7

    .line 563
    add-int/2addr v7, v8

    .line 564
    add-int/2addr v7, v10

    .line 565
    add-int/2addr v7, v14

    .line 566
    move v14, v7

    .line 567
    move v7, v4

    .line 568
    :cond_24
    invoke-virtual {v9, v13}, Lio/flutter/embedding/engine/FlutterJNI;->isCodePointEmojiModifier(I)Z

    .line 569
    .line 570
    .line 571
    move-result v8

    .line 572
    if-eqz v8, :cond_25

    .line 573
    .line 574
    goto/16 :goto_12

    .line 575
    .line 576
    :cond_25
    if-ge v15, v11, :cond_2b

    .line 577
    .line 578
    invoke-static {v1, v15}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 579
    .line 580
    .line 581
    move-result v8

    .line 582
    invoke-static {v8}, Ljava/lang/Character;->charCount(I)I

    .line 583
    .line 584
    .line 585
    move-result v12

    .line 586
    add-int/2addr v12, v15

    .line 587
    if-ne v8, v6, :cond_27

    .line 588
    .line 589
    invoke-static {v1, v12}, Ljava/lang/Character;->codePointBefore(Ljava/lang/CharSequence;I)I

    .line 590
    .line 591
    .line 592
    move-result v4

    .line 593
    invoke-static {v4}, Ljava/lang/Character;->charCount(I)I

    .line 594
    .line 595
    .line 596
    move-result v5

    .line 597
    add-int/2addr v5, v12

    .line 598
    if-ge v5, v11, :cond_26

    .line 599
    .line 600
    invoke-virtual {v9, v4}, Lio/flutter/embedding/engine/FlutterJNI;->isCodePointVariantSelector(I)Z

    .line 601
    .line 602
    .line 603
    move-result v6

    .line 604
    if-eqz v6, :cond_26

    .line 605
    .line 606
    invoke-static {v1, v5}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 607
    .line 608
    .line 609
    move-result v5

    .line 610
    invoke-static {v5}, LA0/c;->y(I)Z

    .line 611
    .line 612
    .line 613
    move-result v6

    .line 614
    if-eqz v6, :cond_1a

    .line 615
    .line 616
    invoke-static {v4}, Ljava/lang/Character;->charCount(I)I

    .line 617
    .line 618
    .line 619
    move-result v4

    .line 620
    invoke-static {v5}, Ljava/lang/Character;->charCount(I)I

    .line 621
    .line 622
    .line 623
    move-result v5

    .line 624
    goto :goto_d

    .line 625
    :cond_26
    invoke-static {v4}, LA0/c;->y(I)Z

    .line 626
    .line 627
    .line 628
    move-result v5

    .line 629
    if-eqz v5, :cond_1a

    .line 630
    .line 631
    invoke-static {v4}, Ljava/lang/Character;->charCount(I)I

    .line 632
    .line 633
    .line 634
    move-result v4

    .line 635
    goto :goto_e

    .line 636
    :cond_27
    invoke-virtual {v9, v8}, Lio/flutter/embedding/engine/FlutterJNI;->isCodePointEmojiModifier(I)Z

    .line 637
    .line 638
    .line 639
    move-result v13

    .line 640
    if-eqz v13, :cond_28

    .line 641
    .line 642
    invoke-static {v8}, Ljava/lang/Character;->charCount(I)I

    .line 643
    .line 644
    .line 645
    move-result v4

    .line 646
    :goto_f
    add-int/2addr v14, v4

    .line 647
    goto :goto_12

    .line 648
    :cond_28
    invoke-virtual {v9, v8}, Lio/flutter/embedding/engine/FlutterJNI;->isCodePointVariantSelector(I)Z

    .line 649
    .line 650
    .line 651
    move-result v13

    .line 652
    if-eqz v13, :cond_29

    .line 653
    .line 654
    invoke-static {v8}, Ljava/lang/Character;->charCount(I)I

    .line 655
    .line 656
    .line 657
    move-result v4

    .line 658
    goto :goto_f

    .line 659
    :cond_29
    if-ne v8, v5, :cond_2c

    .line 660
    .line 661
    invoke-static {v1, v12}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 662
    .line 663
    .line 664
    move-result v7

    .line 665
    invoke-static {v7}, Ljava/lang/Character;->charCount(I)I

    .line 666
    .line 667
    .line 668
    move-result v8

    .line 669
    add-int/2addr v8, v12

    .line 670
    if-ge v8, v11, :cond_2a

    .line 671
    .line 672
    invoke-virtual {v9, v7}, Lio/flutter/embedding/engine/FlutterJNI;->isCodePointVariantSelector(I)Z

    .line 673
    .line 674
    .line 675
    move-result v12

    .line 676
    if-eqz v12, :cond_2a

    .line 677
    .line 678
    invoke-static {v1, v8}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 679
    .line 680
    .line 681
    move-result v7

    .line 682
    invoke-static {v7}, Ljava/lang/Character;->charCount(I)I

    .line 683
    .line 684
    .line 685
    move-result v12

    .line 686
    invoke-static {v7}, Ljava/lang/Character;->charCount(I)I

    .line 687
    .line 688
    .line 689
    move-result v13

    .line 690
    add-int/2addr v13, v8

    .line 691
    move v8, v12

    .line 692
    move v15, v13

    .line 693
    move v13, v7

    .line 694
    move v7, v10

    .line 695
    goto :goto_11

    .line 696
    :cond_2a
    move v13, v7

    .line 697
    move v15, v8

    .line 698
    move v7, v10

    .line 699
    :cond_2b
    :goto_10
    move v8, v4

    .line 700
    goto :goto_11

    .line 701
    :cond_2c
    move v13, v8

    .line 702
    move v15, v12

    .line 703
    goto :goto_10

    .line 704
    :goto_11
    if-lt v15, v11, :cond_2d

    .line 705
    .line 706
    goto :goto_12

    .line 707
    :cond_2d
    if-eqz v7, :cond_1a

    .line 708
    .line 709
    invoke-virtual {v9, v13}, Lio/flutter/embedding/engine/FlutterJNI;->isCodePointEmoji(I)Z

    .line 710
    .line 711
    .line 712
    move-result v12

    .line 713
    if-nez v12, :cond_23

    .line 714
    .line 715
    :goto_12
    goto/16 :goto_a

    .line 716
    .line 717
    :goto_13
    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 718
    .line 719
    .line 720
    move-result v1

    .line 721
    invoke-static {v4, v1}, Ljava/lang/Math;->min(II)I

    .line 722
    .line 723
    .line 724
    move-result v1

    .line 725
    :goto_14
    if-ne v2, v3, :cond_2e

    .line 726
    .line 727
    if-nez p2, :cond_2e

    .line 728
    .line 729
    invoke-virtual {v0, v1, v1}, Lio/flutter/plugin/editing/c;->setSelection(II)Z

    .line 730
    .line 731
    .line 732
    return v10

    .line 733
    :cond_2e
    invoke-virtual {v0, v2, v1}, Lio/flutter/plugin/editing/c;->setSelection(II)Z

    .line 734
    .line 735
    .line 736
    return v10

    .line 737
    :cond_2f
    :goto_15
    return v4
.end method

.method public final deleteSurroundingText(II)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/editing/c;->d:Lio/flutter/plugin/editing/f;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, -0x1

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    return p1

    .line 15
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/BaseInputConnection;->deleteSurroundingText(II)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    return p1
.end method

.method public final e(ZZ)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/editing/c;->d:Lio/flutter/plugin/editing/f;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static {v0}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, 0x0

    .line 12
    if-ltz v1, :cond_5

    .line 13
    .line 14
    if-gez v2, :cond_0

    .line 15
    .line 16
    goto :goto_3

    .line 17
    :cond_0
    const/4 v4, 0x1

    .line 18
    if-ne v1, v2, :cond_1

    .line 19
    .line 20
    if-nez p2, :cond_1

    .line 21
    .line 22
    move v3, v4

    .line 23
    :cond_1
    invoke-virtual {p0}, Lio/flutter/plugin/editing/c;->beginBatchEdit()Z

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Lio/flutter/plugin/editing/c;->k:Landroid/text/DynamicLayout;

    .line 27
    .line 28
    if-eqz v3, :cond_3

    .line 29
    .line 30
    if-eqz p1, :cond_2

    .line 31
    .line 32
    invoke-static {v0, p2}, Landroid/text/Selection;->moveUp(Landroid/text/Spannable;Landroid/text/Layout;)Z

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    invoke-static {v0, p2}, Landroid/text/Selection;->moveDown(Landroid/text/Spannable;Landroid/text/Layout;)Z

    .line 37
    .line 38
    .line 39
    :goto_0
    invoke-static {v0}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    invoke-virtual {p0, p1, p1}, Lio/flutter/plugin/editing/c;->setSelection(II)Z

    .line 44
    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_3
    if-eqz p1, :cond_4

    .line 48
    .line 49
    invoke-static {v0, p2}, Landroid/text/Selection;->extendUp(Landroid/text/Spannable;Landroid/text/Layout;)Z

    .line 50
    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_4
    invoke-static {v0, p2}, Landroid/text/Selection;->extendDown(Landroid/text/Spannable;Landroid/text/Layout;)Z

    .line 54
    .line 55
    .line 56
    :goto_1
    invoke-static {v0}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    invoke-static {v0}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    invoke-virtual {p0, p1, p2}, Lio/flutter/plugin/editing/c;->setSelection(II)Z

    .line 65
    .line 66
    .line 67
    :goto_2
    invoke-virtual {p0}, Lio/flutter/plugin/editing/c;->endBatchEdit()Z

    .line 68
    .line 69
    .line 70
    return v4

    .line 71
    :cond_5
    :goto_3
    return v3
.end method

.method public final endBatchEdit()Z
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/inputmethod/BaseInputConnection;->endBatchEdit()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lio/flutter/plugin/editing/c;->n:I

    .line 6
    .line 7
    add-int/lit8 v1, v1, -0x1

    .line 8
    .line 9
    iput v1, p0, Lio/flutter/plugin/editing/c;->n:I

    .line 10
    .line 11
    iget-object v1, p0, Lio/flutter/plugin/editing/c;->d:Lio/flutter/plugin/editing/f;

    .line 12
    .line 13
    invoke-virtual {v1}, Lio/flutter/plugin/editing/f;->c()V

    .line 14
    .line 15
    .line 16
    return v0
.end method

.method public final getEditable()Landroid/text/Editable;
    .locals 1

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/editing/c;->d:Lio/flutter/plugin/editing/f;

    .line 2
    .line 3
    return-object v0
.end method

.method public final getExtractedText(Landroid/view/inputmethod/ExtractedTextRequest;I)Landroid/view/inputmethod/ExtractedText;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    and-int/2addr p2, v0

    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    :goto_0
    if-eqz v0, :cond_1

    .line 8
    .line 9
    move-object p2, p1

    .line 10
    goto :goto_1

    .line 11
    :cond_1
    const/4 p2, 0x0

    .line 12
    :goto_1
    iput-object p2, p0, Lio/flutter/plugin/editing/c;->f:Landroid/view/inputmethod/ExtractedTextRequest;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lio/flutter/plugin/editing/c;->c(Landroid/view/inputmethod/ExtractedTextRequest;)Landroid/view/inputmethod/ExtractedText;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    return-object p1
.end method

.method public final performContextMenuAction(I)Z
    .locals 7

    .line 1
    invoke-virtual {p0}, Lio/flutter/plugin/editing/c;->beginBatchEdit()Z

    .line 2
    .line 3
    .line 4
    const v0, 0x102001f

    .line 5
    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    iget-object v3, p0, Lio/flutter/plugin/editing/c;->d:Lio/flutter/plugin/editing/f;

    .line 10
    .line 11
    if-ne p1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {p0, v2, p1}, Lio/flutter/plugin/editing/c;->setSelection(II)Z

    .line 18
    .line 19
    .line 20
    goto/16 :goto_0

    .line 21
    .line 22
    :cond_0
    const v0, 0x1020020

    .line 23
    .line 24
    .line 25
    const-string v4, "text label?"

    .line 26
    .line 27
    const-string v5, "clipboard"

    .line 28
    .line 29
    iget-object v6, p0, Lio/flutter/plugin/editing/c;->a:LZ2/p;

    .line 30
    .line 31
    if-ne p1, v0, :cond_1

    .line 32
    .line 33
    invoke-static {v3}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    invoke-static {v3}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eq p1, v0, :cond_5

    .line 42
    .line 43
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    invoke-virtual {v3, v2, p1}, Landroid/text/SpannableStringBuilder;->subSequence(II)Ljava/lang/CharSequence;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object v6

    .line 59
    invoke-virtual {v6, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    check-cast v5, Landroid/content/ClipboardManager;

    .line 64
    .line 65
    invoke-static {v4, v0}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v5, v0}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v3, v2, p1}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, v2, v2}, Lio/flutter/plugin/editing/c;->setSelection(II)Z

    .line 76
    .line 77
    .line 78
    goto/16 :goto_0

    .line 79
    .line 80
    :cond_1
    const v0, 0x1020021

    .line 81
    .line 82
    .line 83
    if-ne p1, v0, :cond_2

    .line 84
    .line 85
    invoke-static {v3}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    invoke-static {v3}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eq p1, v0, :cond_5

    .line 94
    .line 95
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    invoke-virtual {v3, v2, p1}, Landroid/text/SpannableStringBuilder;->subSequence(II)Ljava/lang/CharSequence;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {v0, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Landroid/content/ClipboardManager;

    .line 116
    .line 117
    invoke-static {v4, p1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-virtual {v0, p1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 122
    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_2
    const v0, 0x1020022

    .line 126
    .line 127
    .line 128
    if-ne p1, v0, :cond_4

    .line 129
    .line 130
    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-virtual {p1, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    check-cast p1, Landroid/content/ClipboardManager;

    .line 139
    .line 140
    invoke-virtual {p1}, Landroid/content/ClipboardManager;->getPrimaryClip()Landroid/content/ClipData;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    if-eqz p1, :cond_5

    .line 145
    .line 146
    invoke-virtual {p1, v2}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-virtual {p1, v0}, Landroid/content/ClipData$Item;->coerceToText(Landroid/content/Context;)Ljava/lang/CharSequence;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-static {v3}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    invoke-static {v3}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    .line 167
    .line 168
    .line 169
    move-result v4

    .line 170
    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    .line 171
    .line 172
    .line 173
    move-result v2

    .line 174
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 175
    .line 176
    .line 177
    move-result v4

    .line 178
    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    if-eq v4, v0, :cond_3

    .line 183
    .line 184
    invoke-virtual {v3, v4, v0}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 185
    .line 186
    .line 187
    :cond_3
    invoke-virtual {v3, v4, p1}, Landroid/text/SpannableStringBuilder;->insert(ILjava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 191
    .line 192
    .line 193
    move-result p1

    .line 194
    add-int/2addr p1, v4

    .line 195
    invoke-virtual {p0, p1, p1}, Lio/flutter/plugin/editing/c;->setSelection(II)Z

    .line 196
    .line 197
    .line 198
    goto :goto_0

    .line 199
    :cond_4
    move v1, v2

    .line 200
    :cond_5
    :goto_0
    invoke-virtual {p0}, Lio/flutter/plugin/editing/c;->endBatchEdit()Z

    .line 201
    .line 202
    .line 203
    return v1
.end method

.method public final performEditorAction(I)Z
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x2

    .line 3
    const/4 v2, 0x1

    .line 4
    const/4 v3, 0x0

    .line 5
    const-string v4, "TextInputClient.performAction"

    .line 6
    .line 7
    iget v5, p0, Lio/flutter/plugin/editing/c;->b:I

    .line 8
    .line 9
    iget-object v6, p0, Lio/flutter/plugin/editing/c;->c:LZ2/s;

    .line 10
    .line 11
    if-eqz p1, :cond_6

    .line 12
    .line 13
    if-eq p1, v2, :cond_5

    .line 14
    .line 15
    if-eq p1, v1, :cond_4

    .line 16
    .line 17
    const/4 v7, 0x3

    .line 18
    if-eq p1, v7, :cond_3

    .line 19
    .line 20
    const/4 v7, 0x4

    .line 21
    if-eq p1, v7, :cond_2

    .line 22
    .line 23
    const/4 v7, 0x5

    .line 24
    if-eq p1, v7, :cond_1

    .line 25
    .line 26
    const/4 v7, 0x7

    .line 27
    if-eq p1, v7, :cond_0

    .line 28
    .line 29
    iget-object p1, v6, LZ2/s;->f:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast p1, Lk3/o;

    .line 32
    .line 33
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    new-array v1, v1, [Ljava/io/Serializable;

    .line 38
    .line 39
    aput-object v5, v1, v0

    .line 40
    .line 41
    const-string v0, "TextInputAction.done"

    .line 42
    .line 43
    aput-object v0, v1, v2

    .line 44
    .line 45
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p1, v4, v0, v3}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 50
    .line 51
    .line 52
    goto/16 :goto_0

    .line 53
    .line 54
    :cond_0
    iget-object p1, v6, LZ2/s;->f:Ljava/lang/Object;

    .line 55
    .line 56
    check-cast p1, Lk3/o;

    .line 57
    .line 58
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    new-array v1, v1, [Ljava/io/Serializable;

    .line 63
    .line 64
    aput-object v5, v1, v0

    .line 65
    .line 66
    const-string v0, "TextInputAction.previous"

    .line 67
    .line 68
    aput-object v0, v1, v2

    .line 69
    .line 70
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {p1, v4, v0, v3}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 75
    .line 76
    .line 77
    goto/16 :goto_0

    .line 78
    .line 79
    :cond_1
    iget-object p1, v6, LZ2/s;->f:Ljava/lang/Object;

    .line 80
    .line 81
    check-cast p1, Lk3/o;

    .line 82
    .line 83
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    new-array v1, v1, [Ljava/io/Serializable;

    .line 88
    .line 89
    aput-object v5, v1, v0

    .line 90
    .line 91
    const-string v0, "TextInputAction.next"

    .line 92
    .line 93
    aput-object v0, v1, v2

    .line 94
    .line 95
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {p1, v4, v0, v3}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 100
    .line 101
    .line 102
    goto/16 :goto_0

    .line 103
    .line 104
    :cond_2
    iget-object p1, v6, LZ2/s;->f:Ljava/lang/Object;

    .line 105
    .line 106
    check-cast p1, Lk3/o;

    .line 107
    .line 108
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 109
    .line 110
    .line 111
    move-result-object v5

    .line 112
    new-array v1, v1, [Ljava/io/Serializable;

    .line 113
    .line 114
    aput-object v5, v1, v0

    .line 115
    .line 116
    const-string v0, "TextInputAction.send"

    .line 117
    .line 118
    aput-object v0, v1, v2

    .line 119
    .line 120
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {p1, v4, v0, v3}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 125
    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_3
    iget-object p1, v6, LZ2/s;->f:Ljava/lang/Object;

    .line 129
    .line 130
    check-cast p1, Lk3/o;

    .line 131
    .line 132
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 133
    .line 134
    .line 135
    move-result-object v5

    .line 136
    new-array v1, v1, [Ljava/io/Serializable;

    .line 137
    .line 138
    aput-object v5, v1, v0

    .line 139
    .line 140
    const-string v0, "TextInputAction.search"

    .line 141
    .line 142
    aput-object v0, v1, v2

    .line 143
    .line 144
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-virtual {p1, v4, v0, v3}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 149
    .line 150
    .line 151
    goto :goto_0

    .line 152
    :cond_4
    iget-object p1, v6, LZ2/s;->f:Ljava/lang/Object;

    .line 153
    .line 154
    check-cast p1, Lk3/o;

    .line 155
    .line 156
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 157
    .line 158
    .line 159
    move-result-object v5

    .line 160
    new-array v1, v1, [Ljava/io/Serializable;

    .line 161
    .line 162
    aput-object v5, v1, v0

    .line 163
    .line 164
    const-string v0, "TextInputAction.go"

    .line 165
    .line 166
    aput-object v0, v1, v2

    .line 167
    .line 168
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    invoke-virtual {p1, v4, v0, v3}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 173
    .line 174
    .line 175
    goto :goto_0

    .line 176
    :cond_5
    iget-object p1, v6, LZ2/s;->f:Ljava/lang/Object;

    .line 177
    .line 178
    check-cast p1, Lk3/o;

    .line 179
    .line 180
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 181
    .line 182
    .line 183
    move-result-object v5

    .line 184
    new-array v1, v1, [Ljava/io/Serializable;

    .line 185
    .line 186
    aput-object v5, v1, v0

    .line 187
    .line 188
    const-string v0, "TextInputAction.newline"

    .line 189
    .line 190
    aput-object v0, v1, v2

    .line 191
    .line 192
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {p1, v4, v0, v3}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 197
    .line 198
    .line 199
    goto :goto_0

    .line 200
    :cond_6
    iget-object p1, v6, LZ2/s;->f:Ljava/lang/Object;

    .line 201
    .line 202
    check-cast p1, Lk3/o;

    .line 203
    .line 204
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 205
    .line 206
    .line 207
    move-result-object v5

    .line 208
    new-array v1, v1, [Ljava/io/Serializable;

    .line 209
    .line 210
    aput-object v5, v1, v0

    .line 211
    .line 212
    const-string v0, "TextInputAction.unspecified"

    .line 213
    .line 214
    aput-object v0, v1, v2

    .line 215
    .line 216
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    invoke-virtual {p1, v4, v0, v3}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 221
    .line 222
    .line 223
    :goto_0
    return v2
.end method

.method public final performPrivateCommand(Ljava/lang/String;Landroid/os/Bundle;)Z
    .locals 6

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/editing/c;->c:LZ2/s;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "action"

    .line 12
    .line 13
    invoke-virtual {v1, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    if-eqz p2, :cond_9

    .line 17
    .line 18
    new-instance p1, Ljava/util/HashMap;

    .line 19
    .line 20
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_8

    .line 36
    .line 37
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    check-cast v3, Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p2, v3}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    instance-of v5, v4, [B

    .line 48
    .line 49
    if-eqz v5, :cond_1

    .line 50
    .line 51
    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-virtual {p1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    instance-of v5, v4, Ljava/lang/Byte;

    .line 60
    .line 61
    if-eqz v5, :cond_2

    .line 62
    .line 63
    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getByte(Ljava/lang/String;)B

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    invoke-static {v4}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    invoke-virtual {p1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_2
    instance-of v5, v4, [C

    .line 76
    .line 77
    if-eqz v5, :cond_3

    .line 78
    .line 79
    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getCharArray(Ljava/lang/String;)[C

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    invoke-virtual {p1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_3
    instance-of v5, v4, Ljava/lang/Character;

    .line 88
    .line 89
    if-eqz v5, :cond_4

    .line 90
    .line 91
    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getChar(Ljava/lang/String;)C

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    invoke-static {v4}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    invoke-virtual {p1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_4
    instance-of v5, v4, [Ljava/lang/CharSequence;

    .line 104
    .line 105
    if-eqz v5, :cond_5

    .line 106
    .line 107
    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getCharSequenceArray(Ljava/lang/String;)[Ljava/lang/CharSequence;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    invoke-virtual {p1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_5
    instance-of v5, v4, Ljava/lang/CharSequence;

    .line 116
    .line 117
    if-eqz v5, :cond_6

    .line 118
    .line 119
    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    invoke-virtual {p1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_6
    instance-of v5, v4, [F

    .line 128
    .line 129
    if-eqz v5, :cond_7

    .line 130
    .line 131
    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getFloatArray(Ljava/lang/String;)[F

    .line 132
    .line 133
    .line 134
    move-result-object v4

    .line 135
    invoke-virtual {p1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    goto :goto_0

    .line 139
    :cond_7
    instance-of v4, v4, Ljava/lang/Float;

    .line 140
    .line 141
    if-eqz v4, :cond_0

    .line 142
    .line 143
    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    .line 144
    .line 145
    .line 146
    move-result v4

    .line 147
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 148
    .line 149
    .line 150
    move-result-object v4

    .line 151
    invoke-virtual {p1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    goto :goto_0

    .line 155
    :cond_8
    const-string p2, "data"

    .line 156
    .line 157
    invoke-virtual {v1, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    :cond_9
    iget-object p1, v0, LZ2/s;->f:Ljava/lang/Object;

    .line 161
    .line 162
    check-cast p1, Lk3/o;

    .line 163
    .line 164
    iget p2, p0, Lio/flutter/plugin/editing/c;->b:I

    .line 165
    .line 166
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 167
    .line 168
    .line 169
    move-result-object p2

    .line 170
    const/4 v0, 0x2

    .line 171
    new-array v0, v0, [Ljava/io/Serializable;

    .line 172
    .line 173
    const/4 v2, 0x0

    .line 174
    aput-object p2, v0, v2

    .line 175
    .line 176
    const/4 p2, 0x1

    .line 177
    aput-object v1, v0, p2

    .line 178
    .line 179
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    const/4 v1, 0x0

    .line 184
    const-string v2, "TextInputClient.performPrivateCommand"

    .line 185
    .line 186
    invoke-virtual {p1, v2, v0, v1}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 187
    .line 188
    .line 189
    return p2
.end method

.method public final requestCursorUpdates(I)Z
    .locals 3

    .line 1
    and-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lio/flutter/plugin/editing/c;->a:LZ2/p;

    .line 6
    .line 7
    invoke-virtual {p0}, Lio/flutter/plugin/editing/c;->b()Landroid/view/inputmethod/CursorAnchorInfo;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v2, p0, Lio/flutter/plugin/editing/c;->j:Landroid/view/inputmethod/InputMethodManager;

    .line 12
    .line 13
    invoke-virtual {v2, v0, v1}, Landroid/view/inputmethod/InputMethodManager;->updateCursorAnchorInfo(Landroid/view/View;Landroid/view/inputmethod/CursorAnchorInfo;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    and-int/lit8 p1, p1, 0x2

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    move p1, v0

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const/4 p1, 0x0

    .line 24
    :goto_0
    iput-boolean p1, p0, Lio/flutter/plugin/editing/c;->g:Z

    .line 25
    .line 26
    return v0
.end method

.method public final sendKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/editing/c;->m:LB2/a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, LB2/a;->G(Landroid/view/KeyEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    return p1
.end method

.method public final setComposingText(Ljava/lang/CharSequence;I)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lio/flutter/plugin/editing/c;->beginBatchEdit()Z

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/BaseInputConnection;->commitText(Ljava/lang/CharSequence;I)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/BaseInputConnection;->setComposingText(Ljava/lang/CharSequence;I)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    :goto_0
    invoke-virtual {p0}, Lio/flutter/plugin/editing/c;->endBatchEdit()Z

    .line 20
    .line 21
    .line 22
    return p1
.end method

.method public final setSelection(II)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lio/flutter/plugin/editing/c;->beginBatchEdit()Z

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/BaseInputConnection;->setSelection(II)Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-virtual {p0}, Lio/flutter/plugin/editing/c;->endBatchEdit()Z

    .line 9
    .line 10
    .line 11
    return p1
.end method
