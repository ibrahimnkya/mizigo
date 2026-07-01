.class public final Lm/B0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/o;


# instance fields
.field public e:Ll/i;

.field public f:Ll/j;

.field public final synthetic g:Landroidx/appcompat/widget/Toolbar;


# direct methods
.method public constructor <init>(Landroidx/appcompat/widget/Toolbar;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lm/B0;->g:Landroidx/appcompat/widget/Toolbar;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final b()V
    .locals 4

    .line 1
    iget-object v0, p0, Lm/B0;->f:Ll/j;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lm/B0;->e:Ll/i;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, v0, Ll/i;->f:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    :goto_0
    if-ge v1, v0, :cond_1

    .line 17
    .line 18
    iget-object v2, p0, Lm/B0;->e:Ll/i;

    .line 19
    .line 20
    invoke-virtual {v2, v1}, Ll/i;->getItem(I)Landroid/view/MenuItem;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    iget-object v3, p0, Lm/B0;->f:Ll/j;

    .line 25
    .line 26
    if-ne v2, v3, :cond_0

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    iget-object v0, p0, Lm/B0;->f:Ll/j;

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Lm/B0;->j(Ll/j;)Z

    .line 35
    .line 36
    .line 37
    :cond_2
    :goto_1
    return-void
.end method

.method public final d(Ll/i;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public final f(Ll/j;)Z
    .locals 6

    .line 1
    iget-object v0, p0, Lm/B0;->g:Landroidx/appcompat/widget/Toolbar;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->c()V

    .line 4
    .line 5
    .line 6
    iget-object v1, v0, Landroidx/appcompat/widget/Toolbar;->l:Lm/r;

    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    if-eq v1, v0, :cond_1

    .line 13
    .line 14
    instance-of v2, v1, Landroid/view/ViewGroup;

    .line 15
    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    check-cast v1, Landroid/view/ViewGroup;

    .line 19
    .line 20
    iget-object v2, v0, Landroidx/appcompat/widget/Toolbar;->l:Lm/r;

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v1, v0, Landroidx/appcompat/widget/Toolbar;->l:Lm/r;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    iget-object v1, p1, Ll/j;->z:Landroid/view/View;

    .line 31
    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_2
    const/4 v1, 0x0

    .line 36
    :goto_0
    iput-object v1, v0, Landroidx/appcompat/widget/Toolbar;->m:Landroid/view/View;

    .line 37
    .line 38
    iput-object p1, p0, Lm/B0;->f:Ll/j;

    .line 39
    .line 40
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const/4 v2, 0x2

    .line 45
    if-eq v1, v0, :cond_4

    .line 46
    .line 47
    instance-of v3, v1, Landroid/view/ViewGroup;

    .line 48
    .line 49
    if-eqz v3, :cond_3

    .line 50
    .line 51
    check-cast v1, Landroid/view/ViewGroup;

    .line 52
    .line 53
    iget-object v3, v0, Landroidx/appcompat/widget/Toolbar;->m:Landroid/view/View;

    .line 54
    .line 55
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 56
    .line 57
    .line 58
    :cond_3
    invoke-static {}, Landroidx/appcompat/widget/Toolbar;->g()Lm/C0;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iget v3, v0, Landroidx/appcompat/widget/Toolbar;->r:I

    .line 63
    .line 64
    and-int/lit8 v3, v3, 0x70

    .line 65
    .line 66
    const v4, 0x800003

    .line 67
    .line 68
    .line 69
    or-int/2addr v3, v4

    .line 70
    iput v3, v1, Lm/C0;->a:I

    .line 71
    .line 72
    iput v2, v1, Lm/C0;->b:I

    .line 73
    .line 74
    iget-object v3, v0, Landroidx/appcompat/widget/Toolbar;->m:Landroid/view/View;

    .line 75
    .line 76
    invoke-virtual {v3, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 77
    .line 78
    .line 79
    iget-object v1, v0, Landroidx/appcompat/widget/Toolbar;->m:Landroid/view/View;

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 82
    .line 83
    .line 84
    :cond_4
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    const/4 v3, 0x1

    .line 89
    sub-int/2addr v1, v3

    .line 90
    :goto_1
    if-ltz v1, :cond_6

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    check-cast v5, Lm/C0;

    .line 101
    .line 102
    iget v5, v5, Lm/C0;->b:I

    .line 103
    .line 104
    if-eq v5, v2, :cond_5

    .line 105
    .line 106
    iget-object v5, v0, Landroidx/appcompat/widget/Toolbar;->e:Landroidx/appcompat/widget/ActionMenuView;

    .line 107
    .line 108
    if-eq v4, v5, :cond_5

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeViewAt(I)V

    .line 111
    .line 112
    .line 113
    iget-object v5, v0, Landroidx/appcompat/widget/Toolbar;->I:Ljava/util/ArrayList;

    .line 114
    .line 115
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    :cond_5
    add-int/lit8 v1, v1, -0x1

    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_6
    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    .line 122
    .line 123
    .line 124
    iput-boolean v3, p1, Ll/j;->B:Z

    .line 125
    .line 126
    iget-object p1, p1, Ll/j;->n:Ll/i;

    .line 127
    .line 128
    const/4 v1, 0x0

    .line 129
    invoke-virtual {p1, v1}, Ll/i;->o(Z)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->s()V

    .line 133
    .line 134
    .line 135
    return v3
.end method

.method public final g(Landroid/content/Context;Ll/i;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lm/B0;->e:Ll/i;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lm/B0;->f:Ll/j;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ll/i;->d(Ll/j;)Z

    .line 10
    .line 11
    .line 12
    :cond_0
    iput-object p2, p0, Lm/B0;->e:Ll/i;

    .line 13
    .line 14
    return-void
.end method

.method public final h()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return v0
.end method

.method public final i(Ll/s;)Z
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    return p1
.end method

.method public final j(Ll/j;)Z
    .locals 6

    .line 1
    iget-object v0, p0, Lm/B0;->g:Landroidx/appcompat/widget/Toolbar;

    .line 2
    .line 3
    iget-object v1, v0, Landroidx/appcompat/widget/Toolbar;->m:Landroid/view/View;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, v0, Landroidx/appcompat/widget/Toolbar;->l:Lm/r;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    iput-object v1, v0, Landroidx/appcompat/widget/Toolbar;->m:Landroid/view/View;

    .line 15
    .line 16
    iget-object v2, v0, Landroidx/appcompat/widget/Toolbar;->I:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    const/4 v4, 0x1

    .line 23
    sub-int/2addr v3, v4

    .line 24
    :goto_0
    if-ltz v3, :cond_0

    .line 25
    .line 26
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    check-cast v5, Landroid/view/View;

    .line 31
    .line 32
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    add-int/lit8 v3, v3, -0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 39
    .line 40
    .line 41
    iput-object v1, p0, Lm/B0;->f:Ll/j;

    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    .line 44
    .line 45
    .line 46
    const/4 v1, 0x0

    .line 47
    iput-boolean v1, p1, Ll/j;->B:Z

    .line 48
    .line 49
    iget-object p1, p1, Ll/j;->n:Ll/i;

    .line 50
    .line 51
    invoke-virtual {p1, v1}, Ll/i;->o(Z)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->s()V

    .line 55
    .line 56
    .line 57
    return v4
.end method
