.class public final Lio/flutter/plugin/editing/f;
.super Landroid/text/SpannableStringBuilder;
.source "SourceFile"


# instance fields
.field public e:I

.field public f:I

.field public final g:Ljava/util/ArrayList;

.field public final h:Ljava/util/ArrayList;

.field public final i:Ljava/util/ArrayList;

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public final p:Lio/flutter/plugin/editing/d;


# direct methods
.method public constructor <init>(Lj3/o;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lio/flutter/plugin/editing/f;->e:I

    .line 6
    .line 7
    iput v0, p0, Lio/flutter/plugin/editing/f;->f:I

    .line 8
    .line 9
    new-instance v0, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lio/flutter/plugin/editing/f;->g:Ljava/util/ArrayList;

    .line 15
    .line 16
    new-instance v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lio/flutter/plugin/editing/f;->h:Ljava/util/ArrayList;

    .line 22
    .line 23
    new-instance v0, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lio/flutter/plugin/editing/f;->i:Ljava/util/ArrayList;

    .line 29
    .line 30
    new-instance v0, Lio/flutter/plugin/editing/d;

    .line 31
    .line 32
    invoke-direct {v0, p2, p0}, Lio/flutter/plugin/editing/d;-><init>(Landroid/view/View;Lio/flutter/plugin/editing/f;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lio/flutter/plugin/editing/f;->p:Lio/flutter/plugin/editing/d;

    .line 36
    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lio/flutter/plugin/editing/f;->f(Lj3/o;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method


# virtual methods
.method public final a(Lio/flutter/plugin/editing/e;)V
    .locals 3

    .line 1
    iget v0, p0, Lio/flutter/plugin/editing/f;->f:I

    .line 2
    .line 3
    const-string v1, "ListenableEditingState"

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "adding a listener "

    .line 10
    .line 11
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, " in a listener callback"

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    :cond_0
    iget v0, p0, Lio/flutter/plugin/editing/f;->e:I

    .line 34
    .line 35
    if-lez v0, :cond_1

    .line 36
    .line 37
    const-string v0, "a listener was added to EditingState while a batch edit was in progress"

    .line 38
    .line 39
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lio/flutter/plugin/editing/f;->h:Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    iget-object v0, p0, Lio/flutter/plugin/editing/f;->g:Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final b()V
    .locals 3

    .line 1
    iget v0, p0, Lio/flutter/plugin/editing/f;->e:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    add-int/2addr v0, v1

    .line 5
    iput v0, p0, Lio/flutter/plugin/editing/f;->e:I

    .line 6
    .line 7
    iget v0, p0, Lio/flutter/plugin/editing/f;->f:I

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    const-string v0, "ListenableEditingState"

    .line 12
    .line 13
    const-string v2, "editing state should not be changed in a listener callback"

    .line 14
    .line 15
    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    :cond_0
    iget v0, p0, Lio/flutter/plugin/editing/f;->e:I

    .line 19
    .line 20
    if-ne v0, v1, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lio/flutter/plugin/editing/f;->g:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Lio/flutter/plugin/editing/f;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iput-object v0, p0, Lio/flutter/plugin/editing/f;->k:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {p0}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iput v0, p0, Lio/flutter/plugin/editing/f;->l:I

    .line 41
    .line 42
    invoke-static {p0}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    iput v0, p0, Lio/flutter/plugin/editing/f;->m:I

    .line 47
    .line 48
    invoke-static {p0}, Landroid/view/inputmethod/BaseInputConnection;->getComposingSpanStart(Landroid/text/Spannable;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iput v0, p0, Lio/flutter/plugin/editing/f;->n:I

    .line 53
    .line 54
    invoke-static {p0}, Landroid/view/inputmethod/BaseInputConnection;->getComposingSpanEnd(Landroid/text/Spannable;)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iput v0, p0, Lio/flutter/plugin/editing/f;->o:I

    .line 59
    .line 60
    :cond_1
    return-void
.end method

.method public final c()V
    .locals 8

    .line 1
    iget v0, p0, Lio/flutter/plugin/editing/f;->e:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "ListenableEditingState"

    .line 6
    .line 7
    const-string v1, "endBatchEdit called without a matching beginBatchEdit"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v1, p0, Lio/flutter/plugin/editing/f;->g:Ljava/util/ArrayList;

    .line 14
    .line 15
    iget-object v2, p0, Lio/flutter/plugin/editing/f;->h:Ljava/util/ArrayList;

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    if-ne v0, v3, :cond_6

    .line 19
    .line 20
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v4, 0x0

    .line 25
    move v5, v4

    .line 26
    :goto_0
    if-ge v5, v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v6

    .line 32
    add-int/lit8 v5, v5, 0x1

    .line 33
    .line 34
    check-cast v6, Lio/flutter/plugin/editing/e;

    .line 35
    .line 36
    iget v7, p0, Lio/flutter/plugin/editing/f;->f:I

    .line 37
    .line 38
    add-int/2addr v7, v3

    .line 39
    iput v7, p0, Lio/flutter/plugin/editing/f;->f:I

    .line 40
    .line 41
    invoke-interface {v6, v3}, Lio/flutter/plugin/editing/e;->a(Z)V

    .line 42
    .line 43
    .line 44
    iget v6, p0, Lio/flutter/plugin/editing/f;->f:I

    .line 45
    .line 46
    sub-int/2addr v6, v3

    .line 47
    iput v6, p0, Lio/flutter/plugin/editing/f;->f:I

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_6

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Lio/flutter/plugin/editing/f;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object v5, p0, Lio/flutter/plugin/editing/f;->k:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    xor-int/2addr v0, v3

    .line 70
    iget v5, p0, Lio/flutter/plugin/editing/f;->l:I

    .line 71
    .line 72
    invoke-static {p0}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    .line 73
    .line 74
    .line 75
    move-result v6

    .line 76
    if-ne v5, v6, :cond_3

    .line 77
    .line 78
    iget v5, p0, Lio/flutter/plugin/editing/f;->m:I

    .line 79
    .line 80
    invoke-static {p0}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    .line 81
    .line 82
    .line 83
    move-result v6

    .line 84
    if-eq v5, v6, :cond_2

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_2
    move v5, v4

    .line 88
    goto :goto_2

    .line 89
    :cond_3
    :goto_1
    move v5, v3

    .line 90
    :goto_2
    iget v6, p0, Lio/flutter/plugin/editing/f;->n:I

    .line 91
    .line 92
    invoke-static {p0}, Landroid/view/inputmethod/BaseInputConnection;->getComposingSpanStart(Landroid/text/Spannable;)I

    .line 93
    .line 94
    .line 95
    move-result v7

    .line 96
    if-ne v6, v7, :cond_4

    .line 97
    .line 98
    iget v6, p0, Lio/flutter/plugin/editing/f;->o:I

    .line 99
    .line 100
    invoke-static {p0}, Landroid/view/inputmethod/BaseInputConnection;->getComposingSpanEnd(Landroid/text/Spannable;)I

    .line 101
    .line 102
    .line 103
    move-result v7

    .line 104
    if-eq v6, v7, :cond_5

    .line 105
    .line 106
    :cond_4
    move v4, v3

    .line 107
    :cond_5
    invoke-virtual {p0, v0, v5, v4}, Lio/flutter/plugin/editing/f;->d(ZZZ)V

    .line 108
    .line 109
    .line 110
    :cond_6
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 111
    .line 112
    .line 113
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 114
    .line 115
    .line 116
    iget v0, p0, Lio/flutter/plugin/editing/f;->e:I

    .line 117
    .line 118
    sub-int/2addr v0, v3

    .line 119
    iput v0, p0, Lio/flutter/plugin/editing/f;->e:I

    .line 120
    .line 121
    return-void
.end method

.method public final d(ZZZ)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    if-eqz p3, :cond_1

    .line 6
    .line 7
    :cond_0
    iget-object p2, p0, Lio/flutter/plugin/editing/f;->g:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    const/4 v0, 0x0

    .line 14
    :goto_0
    if-ge v0, p3, :cond_1

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    add-int/lit8 v0, v0, 0x1

    .line 21
    .line 22
    check-cast v1, Lio/flutter/plugin/editing/e;

    .line 23
    .line 24
    iget v2, p0, Lio/flutter/plugin/editing/f;->f:I

    .line 25
    .line 26
    add-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    iput v2, p0, Lio/flutter/plugin/editing/f;->f:I

    .line 29
    .line 30
    invoke-interface {v1, p1}, Lio/flutter/plugin/editing/e;->a(Z)V

    .line 31
    .line 32
    .line 33
    iget v1, p0, Lio/flutter/plugin/editing/f;->f:I

    .line 34
    .line 35
    add-int/lit8 v1, v1, -0x1

    .line 36
    .line 37
    iput v1, p0, Lio/flutter/plugin/editing/f;->f:I

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    return-void
.end method

.method public final e(Lio/flutter/plugin/editing/e;)V
    .locals 2

    .line 1
    iget v0, p0, Lio/flutter/plugin/editing/f;->f:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "removing a listener "

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, " in a listener callback"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "ListenableEditingState"

    .line 29
    .line 30
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object v0, p0, Lio/flutter/plugin/editing/f;->g:Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    iget v0, p0, Lio/flutter/plugin/editing/f;->e:I

    .line 39
    .line 40
    if-lez v0, :cond_1

    .line 41
    .line 42
    iget-object v0, p0, Lio/flutter/plugin/editing/f;->h:Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public final f(Lj3/o;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lio/flutter/plugin/editing/f;->b()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iget-object v1, p1, Lj3/o;->a:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {p0, v2, v0, v1}, Landroid/text/SpannableStringBuilder;->replace(IILjava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 12
    .line 13
    .line 14
    iget v0, p1, Lj3/o;->b:I

    .line 15
    .line 16
    if-ltz v0, :cond_0

    .line 17
    .line 18
    iget v1, p1, Lj3/o;->c:I

    .line 19
    .line 20
    invoke-static {p0, v0, v1}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;II)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-static {p0}, Landroid/text/Selection;->removeSelection(Landroid/text/Spannable;)V

    .line 25
    .line 26
    .line 27
    :goto_0
    iget v0, p1, Lj3/o;->d:I

    .line 28
    .line 29
    iget p1, p1, Lj3/o;->e:I

    .line 30
    .line 31
    if-ltz v0, :cond_2

    .line 32
    .line 33
    if-lt v0, p1, :cond_1

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    iget-object v1, p0, Lio/flutter/plugin/editing/f;->p:Lio/flutter/plugin/editing/d;

    .line 37
    .line 38
    invoke-virtual {v1, v0, p1}, Landroid/view/inputmethod/BaseInputConnection;->setComposingRegion(II)Z

    .line 39
    .line 40
    .line 41
    goto :goto_2

    .line 42
    :cond_2
    :goto_1
    invoke-static {p0}, Landroid/view/inputmethod/BaseInputConnection;->removeComposingSpans(Landroid/text/Spannable;)V

    .line 43
    .line 44
    .line 45
    :goto_2
    iget-object p1, p0, Lio/flutter/plugin/editing/f;->i:Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Lio/flutter/plugin/editing/f;->c()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final bridge synthetic replace(IILjava/lang/CharSequence;II)Landroid/text/Editable;
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lio/flutter/plugin/editing/f;->replace(IILjava/lang/CharSequence;II)Landroid/text/SpannableStringBuilder;

    move-result-object p1

    return-object p1
.end method

.method public final replace(IILjava/lang/CharSequence;II)Landroid/text/SpannableStringBuilder;
    .locals 16

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    .line 2
    iget v3, v0, Lio/flutter/plugin/editing/f;->f:I

    if-lez v3, :cond_0

    .line 3
    const-string v3, "ListenableEditingState"

    const-string v4, "editing state should not be changed in a listener callback"

    .line 4
    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 5
    :cond_0
    invoke-virtual {v0}, Lio/flutter/plugin/editing/f;->toString()Ljava/lang/String;

    move-result-object v3

    sub-int v4, v2, v1

    sub-int v5, p5, p4

    if-eq v4, v5, :cond_1

    const/4 v5, 0x1

    goto :goto_0

    :cond_1
    const/4 v5, 0x0

    :goto_0
    const/4 v8, 0x0

    :goto_1
    if-ge v8, v4, :cond_3

    if-nez v5, :cond_3

    add-int v9, v1, v8

    .line 6
    invoke-virtual {v0, v9}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v9

    add-int v10, p4, v8

    move-object/from16 v11, p3

    invoke-interface {v11, v10}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v10

    if-eq v9, v10, :cond_2

    const/4 v9, 0x1

    goto :goto_2

    :cond_2
    const/4 v9, 0x0

    :goto_2
    or-int/2addr v5, v9

    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    :cond_3
    move-object/from16 v11, p3

    if-eqz v5, :cond_4

    const/4 v4, 0x0

    .line 7
    iput-object v4, v0, Lio/flutter/plugin/editing/f;->j:Ljava/lang/String;

    .line 8
    :cond_4
    invoke-static {v0}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    move-result v4

    .line 9
    invoke-static {v0}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    move-result v8

    .line 10
    invoke-static {v0}, Landroid/view/inputmethod/BaseInputConnection;->getComposingSpanStart(Landroid/text/Spannable;)I

    move-result v9

    .line 11
    invoke-static {v0}, Landroid/view/inputmethod/BaseInputConnection;->getComposingSpanEnd(Landroid/text/Spannable;)I

    move-result v10

    .line 12
    invoke-super/range {p0 .. p5}, Landroid/text/SpannableStringBuilder;->replace(IILjava/lang/CharSequence;II)Landroid/text/SpannableStringBuilder;

    move-result-object v12

    .line 13
    new-instance v13, Lio/flutter/plugin/editing/h;

    .line 14
    invoke-static {v0}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    move-result v14

    .line 15
    invoke-static {v0}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    move-result v15

    .line 16
    invoke-static {v0}, Landroid/view/inputmethod/BaseInputConnection;->getComposingSpanStart(Landroid/text/Spannable;)I

    move-result v6

    .line 17
    invoke-static {v0}, Landroid/view/inputmethod/BaseInputConnection;->getComposingSpanEnd(Landroid/text/Spannable;)I

    move-result v7

    .line 18
    invoke-direct {v13}, Ljava/lang/Object;-><init>()V

    .line 19
    iput v14, v13, Lio/flutter/plugin/editing/h;->e:I

    .line 20
    iput v15, v13, Lio/flutter/plugin/editing/h;->f:I

    .line 21
    iput v6, v13, Lio/flutter/plugin/editing/h;->g:I

    .line 22
    iput v7, v13, Lio/flutter/plugin/editing/h;->h:I

    .line 23
    invoke-interface {v11}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    .line 24
    iput-object v3, v13, Lio/flutter/plugin/editing/h;->a:Ljava/lang/CharSequence;

    .line 25
    iput-object v6, v13, Lio/flutter/plugin/editing/h;->b:Ljava/lang/CharSequence;

    .line 26
    iput v1, v13, Lio/flutter/plugin/editing/h;->c:I

    .line 27
    iput v2, v13, Lio/flutter/plugin/editing/h;->d:I

    .line 28
    iget-object v1, v0, Lio/flutter/plugin/editing/f;->i:Ljava/util/ArrayList;

    invoke-virtual {v1, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 29
    iget v1, v0, Lio/flutter/plugin/editing/f;->e:I

    if-lez v1, :cond_5

    return-object v12

    .line 30
    :cond_5
    invoke-static {v0}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    move-result v1

    if-ne v1, v4, :cond_7

    .line 31
    invoke-static {v0}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    move-result v1

    if-eq v1, v8, :cond_6

    goto :goto_3

    :cond_6
    const/4 v1, 0x0

    goto :goto_4

    :cond_7
    :goto_3
    const/4 v1, 0x1

    .line 32
    :goto_4
    invoke-static {v0}, Landroid/view/inputmethod/BaseInputConnection;->getComposingSpanStart(Landroid/text/Spannable;)I

    move-result v2

    if-ne v2, v9, :cond_9

    .line 33
    invoke-static {v0}, Landroid/view/inputmethod/BaseInputConnection;->getComposingSpanEnd(Landroid/text/Spannable;)I

    move-result v2

    if-eq v2, v10, :cond_8

    goto :goto_5

    :cond_8
    const/4 v6, 0x0

    goto :goto_6

    :cond_9
    :goto_5
    const/4 v6, 0x1

    .line 34
    :goto_6
    invoke-virtual {v0, v5, v1, v6}, Lio/flutter/plugin/editing/f;->d(ZZZ)V

    return-object v12
.end method

.method public final setSpan(Ljava/lang/Object;III)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lio/flutter/plugin/editing/h;

    .line 5
    .line 6
    invoke-virtual {p0}, Lio/flutter/plugin/editing/f;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-static {p0}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    .line 11
    .line 12
    .line 13
    move-result p3

    .line 14
    invoke-static {p0}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    .line 15
    .line 16
    .line 17
    move-result p4

    .line 18
    invoke-static {p0}, Landroid/view/inputmethod/BaseInputConnection;->getComposingSpanStart(Landroid/text/Spannable;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-static {p0}, Landroid/view/inputmethod/BaseInputConnection;->getComposingSpanEnd(Landroid/text/Spannable;)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 27
    .line 28
    .line 29
    iput p3, p1, Lio/flutter/plugin/editing/h;->e:I

    .line 30
    .line 31
    iput p4, p1, Lio/flutter/plugin/editing/h;->f:I

    .line 32
    .line 33
    iput v0, p1, Lio/flutter/plugin/editing/h;->g:I

    .line 34
    .line 35
    iput v1, p1, Lio/flutter/plugin/editing/h;->h:I

    .line 36
    .line 37
    iput-object p2, p1, Lio/flutter/plugin/editing/h;->a:Ljava/lang/CharSequence;

    .line 38
    .line 39
    const-string p2, ""

    .line 40
    .line 41
    iput-object p2, p1, Lio/flutter/plugin/editing/h;->b:Ljava/lang/CharSequence;

    .line 42
    .line 43
    const/4 p2, -0x1

    .line 44
    iput p2, p1, Lio/flutter/plugin/editing/h;->c:I

    .line 45
    .line 46
    iput p2, p1, Lio/flutter/plugin/editing/h;->d:I

    .line 47
    .line 48
    iget-object p2, p0, Lio/flutter/plugin/editing/f;->i:Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/editing/f;->j:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    invoke-super {p0}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lio/flutter/plugin/editing/f;->j:Ljava/lang/String;

    .line 11
    .line 12
    return-object v0
.end method
