.class public final LX/E;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public e:I

.field public f:I

.field public g:Landroid/widget/OverScroller;

.field public h:Landroid/view/animation/Interpolator;

.field public i:Z

.field public j:Z

.field public final synthetic k:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LX/E;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 5
    .line 6
    sget-object v0, Landroidx/recyclerview/widget/RecyclerView;->o0:LX/o;

    .line 7
    .line 8
    iput-object v0, p0, LX/E;->h:Landroid/view/animation/Interpolator;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput-boolean v1, p0, LX/E;->i:Z

    .line 12
    .line 13
    iput-boolean v1, p0, LX/E;->j:Z

    .line 14
    .line 15
    new-instance v1, Landroid/widget/OverScroller;

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-direct {v1, p1, v0}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    .line 22
    .line 23
    .line 24
    iput-object v1, p0, LX/E;->g:Landroid/widget/OverScroller;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    iget-boolean v0, p0, LX/E;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, LX/E;->j:Z

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, LX/E;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 12
    .line 13
    .line 14
    sget-object v1, LD/z;->a:Ljava/lang/reflect/Field;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final run()V
    .locals 9

    .line 1
    iget-object v0, p0, LX/E;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->m:LX/t;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, LX/E;->g:Landroid/widget/OverScroller;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/widget/OverScroller;->abortAnimation()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const/4 v6, 0x0

    .line 17
    iput-boolean v6, p0, LX/E;->j:Z

    .line 18
    .line 19
    const/4 v7, 0x1

    .line 20
    iput-boolean v7, p0, LX/E;->i:Z

    .line 21
    .line 22
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->d()V

    .line 23
    .line 24
    .line 25
    iget-object v8, p0, LX/E;->g:Landroid/widget/OverScroller;

    .line 26
    .line 27
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->m:LX/t;

    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v8}, Landroid/widget/OverScroller;->computeScrollOffset()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_c

    .line 37
    .line 38
    iget-object v4, v0, Landroidx/recyclerview/widget/RecyclerView;->h0:[I

    .line 39
    .line 40
    invoke-virtual {v8}, Landroid/widget/OverScroller;->getCurrX()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {v8}, Landroid/widget/OverScroller;->getCurrY()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    iget v3, p0, LX/E;->e:I

    .line 49
    .line 50
    sub-int v3, v1, v3

    .line 51
    .line 52
    iget v5, p0, LX/E;->f:I

    .line 53
    .line 54
    sub-int v5, v2, v5

    .line 55
    .line 56
    iput v1, p0, LX/E;->e:I

    .line 57
    .line 58
    iput v2, p0, LX/E;->f:I

    .line 59
    .line 60
    move v2, v5

    .line 61
    const/4 v5, 0x0

    .line 62
    move v1, v3

    .line 63
    const/4 v3, 0x1

    .line 64
    invoke-virtual/range {v0 .. v5}, Landroidx/recyclerview/widget/RecyclerView;->f(III[I[I)Z

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    if-eqz v3, :cond_1

    .line 69
    .line 70
    aget v3, v4, v6

    .line 71
    .line 72
    sub-int v3, v1, v3

    .line 73
    .line 74
    aget v1, v4, v7

    .line 75
    .line 76
    sub-int v5, v2, v1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_1
    move v3, v1

    .line 80
    move v5, v2

    .line 81
    :goto_0
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->n:Ljava/util/ArrayList;

    .line 82
    .line 83
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-nez v1, :cond_2

    .line 88
    .line 89
    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 90
    .line 91
    .line 92
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getOverScrollMode()I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    const/4 v2, 0x2

    .line 97
    if-eq v1, v2, :cond_3

    .line 98
    .line 99
    invoke-virtual {v0, v3, v5}, Landroidx/recyclerview/widget/RecyclerView;->c(II)V

    .line 100
    .line 101
    .line 102
    :cond_3
    const/4 v1, 0x0

    .line 103
    invoke-virtual {v0, v1, v7}, Landroidx/recyclerview/widget/RecyclerView;->g([II)Z

    .line 104
    .line 105
    .line 106
    invoke-static {v0}, Landroidx/recyclerview/widget/RecyclerView;->a(Landroidx/recyclerview/widget/RecyclerView;)Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    if-nez v1, :cond_4

    .line 111
    .line 112
    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 113
    .line 114
    .line 115
    :cond_4
    if-eqz v5, :cond_5

    .line 116
    .line 117
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->m:LX/t;

    .line 118
    .line 119
    invoke-virtual {v1}, LX/t;->c()Z

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    if-eqz v1, :cond_5

    .line 124
    .line 125
    if-nez v5, :cond_5

    .line 126
    .line 127
    move v1, v7

    .line 128
    goto :goto_1

    .line 129
    :cond_5
    move v1, v6

    .line 130
    :goto_1
    if-eqz v3, :cond_6

    .line 131
    .line 132
    iget-object v2, v0, Landroidx/recyclerview/widget/RecyclerView;->m:LX/t;

    .line 133
    .line 134
    invoke-virtual {v2}, LX/t;->b()Z

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    if-eqz v2, :cond_6

    .line 139
    .line 140
    if-nez v3, :cond_6

    .line 141
    .line 142
    move v2, v7

    .line 143
    goto :goto_2

    .line 144
    :cond_6
    move v2, v6

    .line 145
    :goto_2
    if-nez v3, :cond_7

    .line 146
    .line 147
    if-eqz v5, :cond_9

    .line 148
    .line 149
    :cond_7
    if-nez v2, :cond_9

    .line 150
    .line 151
    if-eqz v1, :cond_8

    .line 152
    .line 153
    goto :goto_3

    .line 154
    :cond_8
    move v1, v6

    .line 155
    goto :goto_4

    .line 156
    :cond_9
    :goto_3
    move v1, v7

    .line 157
    :goto_4
    invoke-virtual {v8}, Landroid/widget/OverScroller;->isFinished()Z

    .line 158
    .line 159
    .line 160
    move-result v2

    .line 161
    if-nez v2, :cond_b

    .line 162
    .line 163
    if-nez v1, :cond_a

    .line 164
    .line 165
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->k()Z

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    if-nez v1, :cond_a

    .line 170
    .line 171
    goto :goto_5

    .line 172
    :cond_a
    invoke-virtual {p0}, LX/E;->a()V

    .line 173
    .line 174
    .line 175
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->W:LX/j;

    .line 176
    .line 177
    if-eqz v1, :cond_c

    .line 178
    .line 179
    invoke-virtual {v1, v0, v3, v5}, LX/j;->a(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 180
    .line 181
    .line 182
    goto :goto_6

    .line 183
    :cond_b
    :goto_5
    invoke-virtual {v0, v6}, Landroidx/recyclerview/widget/RecyclerView;->setScrollState(I)V

    .line 184
    .line 185
    .line 186
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->a0:LV0/d;

    .line 187
    .line 188
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 189
    .line 190
    .line 191
    iput v6, v1, LV0/d;->c:I

    .line 192
    .line 193
    invoke-virtual {v0, v7}, Landroidx/recyclerview/widget/RecyclerView;->s(I)V

    .line 194
    .line 195
    .line 196
    :cond_c
    :goto_6
    iput-boolean v6, p0, LX/E;->i:Z

    .line 197
    .line 198
    iget-boolean v0, p0, LX/E;->j:Z

    .line 199
    .line 200
    if-eqz v0, :cond_d

    .line 201
    .line 202
    invoke-virtual {p0}, LX/E;->a()V

    .line 203
    .line 204
    .line 205
    :cond_d
    return-void
.end method
