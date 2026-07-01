.class public final Lio/flutter/view/i;
.super Landroid/view/accessibility/AccessibilityNodeProvider;
.source "SourceFile"


# static fields
.field public static final synthetic y:I


# instance fields
.field public final a:Landroid/view/View;

.field public final b:LB2/a;

.field public final c:Landroid/view/accessibility/AccessibilityManager;

.field public final d:Lio/flutter/view/AccessibilityViewEmbedder;

.field public final e:Lio/flutter/plugin/platform/i;

.field public final f:Landroid/content/ContentResolver;

.field public final g:Ljava/util/HashMap;

.field public final h:Ljava/util/HashMap;

.field public i:Lio/flutter/view/h;

.field public j:Ljava/lang/Integer;

.field public k:Ljava/lang/Integer;

.field public l:I

.field public m:Ljava/lang/String;

.field public n:Lio/flutter/view/h;

.field public o:Lio/flutter/view/h;

.field public p:Lio/flutter/view/h;

.field public final q:Ljava/util/ArrayList;

.field public r:I

.field public s:LE/i;

.field public t:Z

.field public u:Z

.field public final v:Lio/flutter/view/d;

.field public final w:Lio/flutter/view/e;

.field public final x:LZ2/m;


# direct methods
.method public constructor <init>(Landroid/view/View;LB2/a;Landroid/view/accessibility/AccessibilityManager;Landroid/content/ContentResolver;Lio/flutter/plugin/platform/i;)V
    .locals 7

    .line 1
    new-instance v0, Lio/flutter/view/AccessibilityViewEmbedder;

    .line 2
    .line 3
    const/high16 v1, 0x10000

    .line 4
    .line 5
    invoke-direct {v0, p1, v1}, Lio/flutter/view/AccessibilityViewEmbedder;-><init>(Landroid/view/View;I)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Landroid/view/accessibility/AccessibilityNodeProvider;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v1, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lio/flutter/view/i;->g:Ljava/util/HashMap;

    .line 17
    .line 18
    new-instance v1, Ljava/util/HashMap;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lio/flutter/view/i;->h:Ljava/util/HashMap;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    iput v1, p0, Lio/flutter/view/i;->l:I

    .line 27
    .line 28
    new-instance v2, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v2, p0, Lio/flutter/view/i;->q:Ljava/util/ArrayList;

    .line 34
    .line 35
    iput v1, p0, Lio/flutter/view/i;->r:I

    .line 36
    .line 37
    iput-boolean v1, p0, Lio/flutter/view/i;->t:Z

    .line 38
    .line 39
    iput-boolean v1, p0, Lio/flutter/view/i;->u:Z

    .line 40
    .line 41
    new-instance v2, Lio/flutter/view/c;

    .line 42
    .line 43
    invoke-direct {v2, p0}, Lio/flutter/view/c;-><init>(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    new-instance v3, Lio/flutter/view/d;

    .line 47
    .line 48
    invoke-direct {v3, p0}, Lio/flutter/view/d;-><init>(Lio/flutter/view/i;)V

    .line 49
    .line 50
    .line 51
    iput-object v3, p0, Lio/flutter/view/i;->v:Lio/flutter/view/d;

    .line 52
    .line 53
    new-instance v4, LZ2/m;

    .line 54
    .line 55
    new-instance v5, Landroid/os/Handler;

    .line 56
    .line 57
    invoke-direct {v5}, Landroid/os/Handler;-><init>()V

    .line 58
    .line 59
    .line 60
    const/4 v6, 0x1

    .line 61
    invoke-direct {v4, p0, v5, v6}, LZ2/m;-><init>(Ljava/lang/Object;Landroid/os/Handler;I)V

    .line 62
    .line 63
    .line 64
    iput-object v4, p0, Lio/flutter/view/i;->x:LZ2/m;

    .line 65
    .line 66
    iput-object p1, p0, Lio/flutter/view/i;->a:Landroid/view/View;

    .line 67
    .line 68
    iput-object p2, p0, Lio/flutter/view/i;->b:LB2/a;

    .line 69
    .line 70
    iput-object p3, p0, Lio/flutter/view/i;->c:Landroid/view/accessibility/AccessibilityManager;

    .line 71
    .line 72
    iput-object p4, p0, Lio/flutter/view/i;->f:Landroid/content/ContentResolver;

    .line 73
    .line 74
    iput-object v0, p0, Lio/flutter/view/i;->d:Lio/flutter/view/AccessibilityViewEmbedder;

    .line 75
    .line 76
    iput-object p5, p0, Lio/flutter/view/i;->e:Lio/flutter/plugin/platform/i;

    .line 77
    .line 78
    iput-object v2, p2, LB2/a;->h:Ljava/lang/Object;

    .line 79
    .line 80
    iget-object v0, p2, LB2/a;->g:Ljava/lang/Object;

    .line 81
    .line 82
    check-cast v0, Lio/flutter/embedding/engine/FlutterJNI;

    .line 83
    .line 84
    invoke-virtual {v0, v2}, Lio/flutter/embedding/engine/FlutterJNI;->setAccessibilityDelegate(La3/j;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p3}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    invoke-virtual {v3, v0}, Lio/flutter/view/d;->onAccessibilityStateChanged(Z)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p3, v3}, Landroid/view/accessibility/AccessibilityManager;->addAccessibilityStateChangeListener(Landroid/view/accessibility/AccessibilityManager$AccessibilityStateChangeListener;)Z

    .line 95
    .line 96
    .line 97
    new-instance v0, Lio/flutter/view/e;

    .line 98
    .line 99
    invoke-direct {v0, p0, p3}, Lio/flutter/view/e;-><init>(Lio/flutter/view/i;Landroid/view/accessibility/AccessibilityManager;)V

    .line 100
    .line 101
    .line 102
    iput-object v0, p0, Lio/flutter/view/i;->w:Lio/flutter/view/e;

    .line 103
    .line 104
    invoke-virtual {p3}, Landroid/view/accessibility/AccessibilityManager;->isTouchExplorationEnabled()Z

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    invoke-virtual {v0, v2}, Lio/flutter/view/e;->onTouchExplorationStateChanged(Z)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p3, v0}, Landroid/view/accessibility/AccessibilityManager;->addTouchExplorationStateChangeListener(Landroid/view/accessibility/AccessibilityManager$TouchExplorationStateChangeListener;)Z

    .line 112
    .line 113
    .line 114
    iget p3, p0, Lio/flutter/view/i;->l:I

    .line 115
    .line 116
    or-int/lit16 p3, p3, 0x80

    .line 117
    .line 118
    iput p3, p0, Lio/flutter/view/i;->l:I

    .line 119
    .line 120
    const/4 p3, 0x0

    .line 121
    invoke-virtual {v4, v1, p3}, LZ2/m;->onChange(ZLandroid/net/Uri;)V

    .line 122
    .line 123
    .line 124
    const-string p3, "transition_animation_scale"

    .line 125
    .line 126
    invoke-static {p3}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 127
    .line 128
    .line 129
    move-result-object p3

    .line 130
    invoke-virtual {p4, p3, v1, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 131
    .line 132
    .line 133
    sget p3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 134
    .line 135
    const/16 p4, 0x1f

    .line 136
    .line 137
    if-lt p3, p4, :cond_2

    .line 138
    .line 139
    if-eqz p1, :cond_2

    .line 140
    .line 141
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 142
    .line 143
    .line 144
    move-result-object p3

    .line 145
    if-nez p3, :cond_0

    .line 146
    .line 147
    goto :goto_1

    .line 148
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-static {p1}, LR0/e;->a(Landroid/content/res/Configuration;)I

    .line 157
    .line 158
    .line 159
    move-result p1

    .line 160
    const p3, 0x7fffffff

    .line 161
    .line 162
    .line 163
    if-eq p1, p3, :cond_1

    .line 164
    .line 165
    const/16 p3, 0x12c

    .line 166
    .line 167
    if-lt p1, p3, :cond_1

    .line 168
    .line 169
    iget p1, p0, Lio/flutter/view/i;->l:I

    .line 170
    .line 171
    or-int/lit8 p1, p1, 0x8

    .line 172
    .line 173
    iput p1, p0, Lio/flutter/view/i;->l:I

    .line 174
    .line 175
    goto :goto_0

    .line 176
    :cond_1
    iget p1, p0, Lio/flutter/view/i;->l:I

    .line 177
    .line 178
    and-int/lit8 p1, p1, -0x9

    .line 179
    .line 180
    iput p1, p0, Lio/flutter/view/i;->l:I

    .line 181
    .line 182
    :goto_0
    iget p1, p0, Lio/flutter/view/i;->l:I

    .line 183
    .line 184
    iget-object p2, p2, LB2/a;->g:Ljava/lang/Object;

    .line 185
    .line 186
    check-cast p2, Lio/flutter/embedding/engine/FlutterJNI;

    .line 187
    .line 188
    invoke-virtual {p2, p1}, Lio/flutter/embedding/engine/FlutterJNI;->setAccessibilityFeatures(I)V

    .line 189
    .line 190
    .line 191
    :cond_2
    :goto_1
    invoke-interface {p5, p0}, Lio/flutter/plugin/platform/i;->c(Lio/flutter/view/i;)V

    .line 192
    .line 193
    .line 194
    return-void
.end method

.method public static d(Ljava/nio/ByteBuffer;[Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, -0x1

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return-object p0

    .line 10
    :cond_0
    aget-object p0, p1, p0

    .line 11
    .line 12
    return-object p0
.end method


# virtual methods
.method public final a(Landroid/view/View;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lio/flutter/view/i;->d:Lio/flutter/view/AccessibilityViewEmbedder;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, Lio/flutter/view/AccessibilityViewEmbedder;->requestSendAccessibilityEvent(Landroid/view/View;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez p2, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    invoke-virtual {v0, p1, p3}, Lio/flutter/view/AccessibilityViewEmbedder;->getRecordFlutterId(Landroid/view/View;Landroid/view/accessibility/AccessibilityRecord;)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    return v1

    .line 18
    :cond_1
    invoke-virtual {p3}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    const/16 p3, 0x8

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    if-eq p2, p3, :cond_5

    .line 26
    .line 27
    const/16 p3, 0x80

    .line 28
    .line 29
    if-eq p2, p3, :cond_4

    .line 30
    .line 31
    const p3, 0x8000

    .line 32
    .line 33
    .line 34
    if-eq p2, p3, :cond_3

    .line 35
    .line 36
    const/high16 p1, 0x10000

    .line 37
    .line 38
    if-eq p2, p1, :cond_2

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    iput-object v0, p0, Lio/flutter/view/i;->k:Ljava/lang/Integer;

    .line 42
    .line 43
    iput-object v0, p0, Lio/flutter/view/i;->j:Ljava/lang/Integer;

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_3
    iput-object p1, p0, Lio/flutter/view/i;->j:Ljava/lang/Integer;

    .line 47
    .line 48
    iput-object v0, p0, Lio/flutter/view/i;->i:Lio/flutter/view/h;

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_4
    iput-object v0, p0, Lio/flutter/view/i;->p:Lio/flutter/view/h;

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_5
    iput-object p1, p0, Lio/flutter/view/i;->k:Ljava/lang/Integer;

    .line 55
    .line 56
    iput-object v0, p0, Lio/flutter/view/i;->n:Lio/flutter/view/h;

    .line 57
    .line 58
    :goto_0
    const/4 p1, 0x1

    .line 59
    return p1
.end method

.method public final b(I)Lio/flutter/view/g;
    .locals 3

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lio/flutter/view/i;->h:Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lio/flutter/view/g;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Lio/flutter/view/g;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 18
    .line 19
    .line 20
    const/4 v2, -0x1

    .line 21
    iput v2, v0, Lio/flutter/view/g;->c:I

    .line 22
    .line 23
    iput p1, v0, Lio/flutter/view/g;->b:I

    .line 24
    .line 25
    const v2, 0xff00001

    .line 26
    .line 27
    .line 28
    add-int/2addr v2, p1

    .line 29
    iput v2, v0, Lio/flutter/view/g;->a:I

    .line 30
    .line 31
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    :cond_0
    return-object v0
.end method

.method public final c(I)Lio/flutter/view/h;
    .locals 2

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lio/flutter/view/i;->g:Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lio/flutter/view/h;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Lio/flutter/view/h;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Lio/flutter/view/h;-><init>(Lio/flutter/view/i;)V

    .line 18
    .line 19
    .line 20
    iput p1, v0, Lio/flutter/view/h;->b:I

    .line 21
    .line 22
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    :cond_0
    return-object v0
.end method

.method public final createAccessibilityNodeInfo(I)Landroid/view/accessibility/AccessibilityNodeInfo;
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-virtual {v0, v2}, Lio/flutter/view/i;->j(Z)V

    .line 7
    .line 8
    .line 9
    iget-object v3, v0, Lio/flutter/view/i;->d:Lio/flutter/view/AccessibilityViewEmbedder;

    .line 10
    .line 11
    const/high16 v4, 0x10000

    .line 12
    .line 13
    if-lt v1, v4, :cond_0

    .line 14
    .line 15
    invoke-virtual {v3, v1}, Lio/flutter/view/AccessibilityViewEmbedder;->createAccessibilityNodeInfo(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    return-object v1

    .line 20
    :cond_0
    iget-object v5, v0, Lio/flutter/view/i;->g:Ljava/util/HashMap;

    .line 21
    .line 22
    const/4 v6, -0x1

    .line 23
    iget-object v7, v0, Lio/flutter/view/i;->a:Landroid/view/View;

    .line 24
    .line 25
    const/4 v8, 0x0

    .line 26
    if-ne v1, v6, :cond_2

    .line 27
    .line 28
    invoke-static {v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->obtain(Landroid/view/View;)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v7, v1}, Landroid/view/View;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v5, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    invoke-virtual {v1, v7, v8}, Landroid/view/accessibility/AccessibilityNodeInfo;->addChild(Landroid/view/View;I)V

    .line 46
    .line 47
    .line 48
    :cond_1
    invoke-virtual {v1, v8}, Landroid/view/accessibility/AccessibilityNodeInfo;->setImportantForAccessibility(Z)V

    .line 49
    .line 50
    .line 51
    return-object v1

    .line 52
    :cond_2
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v9

    .line 56
    invoke-virtual {v5, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    check-cast v5, Lio/flutter/view/h;

    .line 61
    .line 62
    const/4 v9, 0x0

    .line 63
    if-nez v5, :cond_3

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_3
    iget v10, v5, Lio/flutter/view/h;->i:I

    .line 67
    .line 68
    iget-object v11, v0, Lio/flutter/view/i;->e:Lio/flutter/plugin/platform/i;

    .line 69
    .line 70
    if-eq v10, v6, :cond_5

    .line 71
    .line 72
    invoke-interface {v11, v10}, Lio/flutter/plugin/platform/i;->g(I)Z

    .line 73
    .line 74
    .line 75
    move-result v10

    .line 76
    if-eqz v10, :cond_5

    .line 77
    .line 78
    iget v1, v5, Lio/flutter/view/h;->i:I

    .line 79
    .line 80
    invoke-interface {v11, v1}, Lio/flutter/plugin/platform/i;->h(I)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    if-nez v1, :cond_4

    .line 85
    .line 86
    :goto_0
    return-object v9

    .line 87
    :cond_4
    iget-object v2, v5, Lio/flutter/view/h;->c0:Landroid/graphics/Rect;

    .line 88
    .line 89
    iget v4, v5, Lio/flutter/view/h;->b:I

    .line 90
    .line 91
    invoke-virtual {v3, v1, v4, v2}, Lio/flutter/view/AccessibilityViewEmbedder;->getRootNode(Landroid/view/View;ILandroid/graphics/Rect;)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    return-object v1

    .line 96
    :cond_5
    invoke-static {v7, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->obtain(Landroid/view/View;I)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    const/16 v10, 0xc

    .line 101
    .line 102
    invoke-virtual {v5, v10}, Lio/flutter/view/h;->g(I)Z

    .line 103
    .line 104
    .line 105
    move-result v12

    .line 106
    if-eqz v12, :cond_7

    .line 107
    .line 108
    :cond_6
    move v12, v8

    .line 109
    goto :goto_2

    .line 110
    :cond_7
    invoke-static {v5}, Lio/flutter/view/h;->b(Lio/flutter/view/h;)Ljava/lang/CharSequence;

    .line 111
    .line 112
    .line 113
    move-result-object v12

    .line 114
    if-eqz v12, :cond_8

    .line 115
    .line 116
    :goto_1
    move v12, v2

    .line 117
    goto :goto_2

    .line 118
    :cond_8
    iget v12, v5, Lio/flutter/view/h;->d:I

    .line 119
    .line 120
    if-eqz v12, :cond_6

    .line 121
    .line 122
    goto :goto_1

    .line 123
    :goto_2
    invoke-virtual {v3, v12}, Landroid/view/accessibility/AccessibilityNodeInfo;->setImportantForAccessibility(Z)V

    .line 124
    .line 125
    .line 126
    const-string v12, ""

    .line 127
    .line 128
    invoke-virtual {v3, v12}, Landroid/view/accessibility/AccessibilityNodeInfo;->setViewIdResourceName(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    iget-object v13, v5, Lio/flutter/view/h;->o:Ljava/lang/String;

    .line 132
    .line 133
    if-eqz v13, :cond_9

    .line 134
    .line 135
    invoke-virtual {v3, v13}, Landroid/view/accessibility/AccessibilityNodeInfo;->setViewIdResourceName(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    :cond_9
    invoke-virtual {v7}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 139
    .line 140
    .line 141
    move-result-object v13

    .line 142
    invoke-virtual {v13}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v13

    .line 146
    invoke-virtual {v3, v13}, Landroid/view/accessibility/AccessibilityNodeInfo;->setPackageName(Ljava/lang/CharSequence;)V

    .line 147
    .line 148
    .line 149
    const-string v13, "android.view.View"

    .line 150
    .line 151
    invoke-virtual {v3, v13}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v3, v7, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->setSource(Landroid/view/View;I)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v5}, Lio/flutter/view/h;->i()Z

    .line 158
    .line 159
    .line 160
    move-result v13

    .line 161
    invoke-virtual {v3, v13}, Landroid/view/accessibility/AccessibilityNodeInfo;->setFocusable(Z)V

    .line 162
    .line 163
    .line 164
    iget-object v13, v0, Lio/flutter/view/i;->n:Lio/flutter/view/h;

    .line 165
    .line 166
    if-eqz v13, :cond_b

    .line 167
    .line 168
    iget v13, v13, Lio/flutter/view/h;->b:I

    .line 169
    .line 170
    if-ne v13, v1, :cond_a

    .line 171
    .line 172
    move v13, v2

    .line 173
    goto :goto_3

    .line 174
    :cond_a
    move v13, v8

    .line 175
    :goto_3
    invoke-virtual {v3, v13}, Landroid/view/accessibility/AccessibilityNodeInfo;->setFocused(Z)V

    .line 176
    .line 177
    .line 178
    :cond_b
    iget-object v13, v0, Lio/flutter/view/i;->i:Lio/flutter/view/h;

    .line 179
    .line 180
    if-eqz v13, :cond_d

    .line 181
    .line 182
    iget v13, v13, Lio/flutter/view/h;->b:I

    .line 183
    .line 184
    if-ne v13, v1, :cond_c

    .line 185
    .line 186
    move v13, v2

    .line 187
    goto :goto_4

    .line 188
    :cond_c
    move v13, v8

    .line 189
    :goto_4
    invoke-virtual {v3, v13}, Landroid/view/accessibility/AccessibilityNodeInfo;->setAccessibilityFocused(Z)V

    .line 190
    .line 191
    .line 192
    :cond_d
    const/4 v13, 0x5

    .line 193
    invoke-virtual {v5, v13}, Lio/flutter/view/h;->g(I)Z

    .line 194
    .line 195
    .line 196
    move-result v14

    .line 197
    if-eqz v14, :cond_16

    .line 198
    .line 199
    const/16 v14, 0xb

    .line 200
    .line 201
    invoke-virtual {v5, v14}, Lio/flutter/view/h;->g(I)Z

    .line 202
    .line 203
    .line 204
    move-result v14

    .line 205
    invoke-virtual {v3, v14}, Landroid/view/accessibility/AccessibilityNodeInfo;->setPassword(Z)V

    .line 206
    .line 207
    .line 208
    const/16 v14, 0x15

    .line 209
    .line 210
    invoke-virtual {v5, v14}, Lio/flutter/view/h;->g(I)Z

    .line 211
    .line 212
    .line 213
    move-result v15

    .line 214
    if-nez v15, :cond_e

    .line 215
    .line 216
    const-string v15, "android.widget.EditText"

    .line 217
    .line 218
    invoke-virtual {v3, v15}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 219
    .line 220
    .line 221
    :cond_e
    invoke-virtual {v5, v14}, Lio/flutter/view/h;->g(I)Z

    .line 222
    .line 223
    .line 224
    move-result v14

    .line 225
    xor-int/2addr v14, v2

    .line 226
    invoke-virtual {v3, v14}, Landroid/view/accessibility/AccessibilityNodeInfo;->setEditable(Z)V

    .line 227
    .line 228
    .line 229
    iget v14, v5, Lio/flutter/view/h;->g:I

    .line 230
    .line 231
    if-eq v14, v6, :cond_f

    .line 232
    .line 233
    iget v15, v5, Lio/flutter/view/h;->h:I

    .line 234
    .line 235
    if-eq v15, v6, :cond_f

    .line 236
    .line 237
    invoke-virtual {v3, v14, v15}, Landroid/view/accessibility/AccessibilityNodeInfo;->setTextSelection(II)V

    .line 238
    .line 239
    .line 240
    :cond_f
    iget-object v14, v0, Lio/flutter/view/i;->i:Lio/flutter/view/h;

    .line 241
    .line 242
    if-eqz v14, :cond_10

    .line 243
    .line 244
    iget v14, v14, Lio/flutter/view/h;->b:I

    .line 245
    .line 246
    if-ne v14, v1, :cond_10

    .line 247
    .line 248
    invoke-virtual {v3, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->setLiveRegion(I)V

    .line 249
    .line 250
    .line 251
    :cond_10
    sget-object v14, Lio/flutter/view/f;->o:Lio/flutter/view/f;

    .line 252
    .line 253
    invoke-static {v5, v14}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 254
    .line 255
    .line 256
    move-result v14

    .line 257
    const/16 v15, 0x100

    .line 258
    .line 259
    if-eqz v14, :cond_11

    .line 260
    .line 261
    invoke-virtual {v3, v15}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 262
    .line 263
    .line 264
    move v14, v2

    .line 265
    goto :goto_5

    .line 266
    :cond_11
    move v14, v8

    .line 267
    :goto_5
    sget-object v9, Lio/flutter/view/f;->p:Lio/flutter/view/f;

    .line 268
    .line 269
    invoke-static {v5, v9}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 270
    .line 271
    .line 272
    move-result v9

    .line 273
    const/16 v10, 0x200

    .line 274
    .line 275
    if-eqz v9, :cond_12

    .line 276
    .line 277
    invoke-virtual {v3, v10}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 278
    .line 279
    .line 280
    move v14, v2

    .line 281
    :cond_12
    sget-object v9, Lio/flutter/view/f;->y:Lio/flutter/view/f;

    .line 282
    .line 283
    invoke-static {v5, v9}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 284
    .line 285
    .line 286
    move-result v9

    .line 287
    if-eqz v9, :cond_13

    .line 288
    .line 289
    invoke-virtual {v3, v15}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 290
    .line 291
    .line 292
    or-int/lit8 v14, v14, 0x2

    .line 293
    .line 294
    :cond_13
    sget-object v9, Lio/flutter/view/f;->z:Lio/flutter/view/f;

    .line 295
    .line 296
    invoke-static {v5, v9}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 297
    .line 298
    .line 299
    move-result v9

    .line 300
    if-eqz v9, :cond_14

    .line 301
    .line 302
    invoke-virtual {v3, v10}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 303
    .line 304
    .line 305
    or-int/lit8 v14, v14, 0x2

    .line 306
    .line 307
    :cond_14
    invoke-virtual {v3, v14}, Landroid/view/accessibility/AccessibilityNodeInfo;->setMovementGranularities(I)V

    .line 308
    .line 309
    .line 310
    iget v9, v5, Lio/flutter/view/h;->e:I

    .line 311
    .line 312
    if-ltz v9, :cond_16

    .line 313
    .line 314
    iget-object v9, v5, Lio/flutter/view/h;->r:Ljava/lang/String;

    .line 315
    .line 316
    if-nez v9, :cond_15

    .line 317
    .line 318
    move v9, v8

    .line 319
    goto :goto_6

    .line 320
    :cond_15
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    .line 321
    .line 322
    .line 323
    move-result v9

    .line 324
    :goto_6
    iget v10, v5, Lio/flutter/view/h;->f:I

    .line 325
    .line 326
    iget v14, v5, Lio/flutter/view/h;->e:I

    .line 327
    .line 328
    sub-int/2addr v9, v10

    .line 329
    add-int/2addr v9, v14

    .line 330
    invoke-virtual {v3, v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->setMaxTextLength(I)V

    .line 331
    .line 332
    .line 333
    :cond_16
    sget-object v9, Lio/flutter/view/f;->q:Lio/flutter/view/f;

    .line 334
    .line 335
    invoke-static {v5, v9}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 336
    .line 337
    .line 338
    move-result v9

    .line 339
    if-eqz v9, :cond_17

    .line 340
    .line 341
    const/high16 v9, 0x20000

    .line 342
    .line 343
    invoke-virtual {v3, v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 344
    .line 345
    .line 346
    :cond_17
    sget-object v9, Lio/flutter/view/f;->r:Lio/flutter/view/f;

    .line 347
    .line 348
    invoke-static {v5, v9}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 349
    .line 350
    .line 351
    move-result v9

    .line 352
    if-eqz v9, :cond_18

    .line 353
    .line 354
    const/16 v9, 0x4000

    .line 355
    .line 356
    invoke-virtual {v3, v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 357
    .line 358
    .line 359
    :cond_18
    sget-object v9, Lio/flutter/view/f;->s:Lio/flutter/view/f;

    .line 360
    .line 361
    invoke-static {v5, v9}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 362
    .line 363
    .line 364
    move-result v9

    .line 365
    if-eqz v9, :cond_19

    .line 366
    .line 367
    invoke-virtual {v3, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 368
    .line 369
    .line 370
    :cond_19
    sget-object v4, Lio/flutter/view/f;->t:Lio/flutter/view/f;

    .line 371
    .line 372
    invoke-static {v5, v4}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 373
    .line 374
    .line 375
    move-result v4

    .line 376
    if-eqz v4, :cond_1a

    .line 377
    .line 378
    const v4, 0x8000

    .line 379
    .line 380
    .line 381
    invoke-virtual {v3, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 382
    .line 383
    .line 384
    :cond_1a
    sget-object v4, Lio/flutter/view/f;->A:Lio/flutter/view/f;

    .line 385
    .line 386
    invoke-static {v5, v4}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 387
    .line 388
    .line 389
    move-result v4

    .line 390
    if-eqz v4, :cond_1b

    .line 391
    .line 392
    const/high16 v4, 0x200000

    .line 393
    .line 394
    invoke-virtual {v3, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 395
    .line 396
    .line 397
    :cond_1b
    const/4 v4, 0x4

    .line 398
    invoke-virtual {v5, v4}, Lio/flutter/view/h;->g(I)Z

    .line 399
    .line 400
    .line 401
    move-result v4

    .line 402
    if-eqz v4, :cond_1c

    .line 403
    .line 404
    move v4, v2

    .line 405
    goto :goto_7

    .line 406
    :cond_1c
    iget-object v4, v5, Lio/flutter/view/h;->A:Ljava/lang/String;

    .line 407
    .line 408
    if-eqz v4, :cond_1d

    .line 409
    .line 410
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    .line 411
    .line 412
    .line 413
    move-result v4

    .line 414
    if-nez v4, :cond_1d

    .line 415
    .line 416
    move v4, v8

    .line 417
    goto :goto_7

    .line 418
    :cond_1d
    const/16 v4, 0x17

    .line 419
    .line 420
    invoke-virtual {v5, v4}, Lio/flutter/view/h;->g(I)Z

    .line 421
    .line 422
    .line 423
    move-result v4

    .line 424
    :goto_7
    if-eqz v4, :cond_1e

    .line 425
    .line 426
    const-string v4, "android.widget.Button"

    .line 427
    .line 428
    invoke-virtual {v3, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 429
    .line 430
    .line 431
    :cond_1e
    const/16 v4, 0xf

    .line 432
    .line 433
    invoke-virtual {v5, v4}, Lio/flutter/view/h;->g(I)Z

    .line 434
    .line 435
    .line 436
    move-result v4

    .line 437
    if-eqz v4, :cond_1f

    .line 438
    .line 439
    const-string v4, "android.widget.ImageView"

    .line 440
    .line 441
    invoke-virtual {v3, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 442
    .line 443
    .line 444
    :cond_1f
    sget-object v4, Lio/flutter/view/f;->x:Lio/flutter/view/f;

    .line 445
    .line 446
    invoke-static {v5, v4}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 447
    .line 448
    .line 449
    move-result v4

    .line 450
    if-eqz v4, :cond_20

    .line 451
    .line 452
    invoke-virtual {v3, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->setDismissable(Z)V

    .line 453
    .line 454
    .line 455
    const/high16 v4, 0x100000

    .line 456
    .line 457
    invoke-virtual {v3, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 458
    .line 459
    .line 460
    :cond_20
    iget-object v4, v5, Lio/flutter/view/h;->S:Lio/flutter/view/h;

    .line 461
    .line 462
    if-eqz v4, :cond_21

    .line 463
    .line 464
    iget v4, v4, Lio/flutter/view/h;->b:I

    .line 465
    .line 466
    invoke-virtual {v3, v7, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->setParent(Landroid/view/View;I)V

    .line 467
    .line 468
    .line 469
    goto :goto_8

    .line 470
    :cond_21
    invoke-virtual {v3, v7}, Landroid/view/accessibility/AccessibilityNodeInfo;->setParent(Landroid/view/View;)V

    .line 471
    .line 472
    .line 473
    :goto_8
    iget v4, v5, Lio/flutter/view/h;->D:I

    .line 474
    .line 475
    if-eq v4, v6, :cond_22

    .line 476
    .line 477
    invoke-virtual {v3, v7, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->setTraversalAfter(Landroid/view/View;I)V

    .line 478
    .line 479
    .line 480
    :cond_22
    iget-object v4, v5, Lio/flutter/view/h;->c0:Landroid/graphics/Rect;

    .line 481
    .line 482
    iget-object v9, v5, Lio/flutter/view/h;->S:Lio/flutter/view/h;

    .line 483
    .line 484
    if-eqz v9, :cond_23

    .line 485
    .line 486
    iget-object v9, v9, Lio/flutter/view/h;->c0:Landroid/graphics/Rect;

    .line 487
    .line 488
    new-instance v10, Landroid/graphics/Rect;

    .line 489
    .line 490
    invoke-direct {v10, v4}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 491
    .line 492
    .line 493
    iget v14, v9, Landroid/graphics/Rect;->left:I

    .line 494
    .line 495
    neg-int v14, v14

    .line 496
    iget v9, v9, Landroid/graphics/Rect;->top:I

    .line 497
    .line 498
    neg-int v9, v9

    .line 499
    invoke-virtual {v10, v14, v9}, Landroid/graphics/Rect;->offset(II)V

    .line 500
    .line 501
    .line 502
    invoke-virtual {v3, v10}, Landroid/view/accessibility/AccessibilityNodeInfo;->setBoundsInParent(Landroid/graphics/Rect;)V

    .line 503
    .line 504
    .line 505
    goto :goto_9

    .line 506
    :cond_23
    invoke-virtual {v3, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->setBoundsInParent(Landroid/graphics/Rect;)V

    .line 507
    .line 508
    .line 509
    :goto_9
    new-instance v9, Landroid/graphics/Rect;

    .line 510
    .line 511
    invoke-direct {v9, v4}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 512
    .line 513
    .line 514
    const/4 v4, 0x2

    .line 515
    new-array v10, v4, [I

    .line 516
    .line 517
    invoke-virtual {v7, v10}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 518
    .line 519
    .line 520
    aget v14, v10, v8

    .line 521
    .line 522
    aget v10, v10, v2

    .line 523
    .line 524
    invoke-virtual {v9, v14, v10}, Landroid/graphics/Rect;->offset(II)V

    .line 525
    .line 526
    .line 527
    invoke-virtual {v3, v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->setBoundsInScreen(Landroid/graphics/Rect;)V

    .line 528
    .line 529
    .line 530
    invoke-virtual {v3, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->setVisibleToUser(Z)V

    .line 531
    .line 532
    .line 533
    const/4 v9, 0x7

    .line 534
    invoke-virtual {v5, v9}, Lio/flutter/view/h;->g(I)Z

    .line 535
    .line 536
    .line 537
    move-result v9

    .line 538
    const/16 v10, 0x8

    .line 539
    .line 540
    if-eqz v9, :cond_25

    .line 541
    .line 542
    invoke-virtual {v5, v10}, Lio/flutter/view/h;->g(I)Z

    .line 543
    .line 544
    .line 545
    move-result v9

    .line 546
    if-eqz v9, :cond_24

    .line 547
    .line 548
    goto :goto_a

    .line 549
    :cond_24
    move v9, v8

    .line 550
    goto :goto_b

    .line 551
    :cond_25
    :goto_a
    move v9, v2

    .line 552
    :goto_b
    invoke-virtual {v3, v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->setEnabled(Z)V

    .line 553
    .line 554
    .line 555
    sget-object v9, Lio/flutter/view/f;->f:Lio/flutter/view/f;

    .line 556
    .line 557
    invoke-static {v5, v9}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 558
    .line 559
    .line 560
    move-result v9

    .line 561
    const/16 v14, 0x10

    .line 562
    .line 563
    if-eqz v9, :cond_27

    .line 564
    .line 565
    iget-object v9, v5, Lio/flutter/view/h;->W:Lio/flutter/view/g;

    .line 566
    .line 567
    if-eqz v9, :cond_26

    .line 568
    .line 569
    new-instance v9, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 570
    .line 571
    iget-object v15, v5, Lio/flutter/view/h;->W:Lio/flutter/view/g;

    .line 572
    .line 573
    iget-object v15, v15, Lio/flutter/view/g;->e:Ljava/lang/String;

    .line 574
    .line 575
    invoke-direct {v9, v14, v15}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;-><init>(ILjava/lang/CharSequence;)V

    .line 576
    .line 577
    .line 578
    invoke-virtual {v3, v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 579
    .line 580
    .line 581
    invoke-virtual {v3, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClickable(Z)V

    .line 582
    .line 583
    .line 584
    goto :goto_c

    .line 585
    :cond_26
    invoke-virtual {v3, v14}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 586
    .line 587
    .line 588
    invoke-virtual {v3, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClickable(Z)V

    .line 589
    .line 590
    .line 591
    goto :goto_c

    .line 592
    :cond_27
    const/16 v9, 0x18

    .line 593
    .line 594
    invoke-virtual {v5, v9}, Lio/flutter/view/h;->g(I)Z

    .line 595
    .line 596
    .line 597
    move-result v9

    .line 598
    if-eqz v9, :cond_28

    .line 599
    .line 600
    invoke-virtual {v3, v14}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 601
    .line 602
    .line 603
    invoke-virtual {v3, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClickable(Z)V

    .line 604
    .line 605
    .line 606
    :cond_28
    :goto_c
    sget-object v9, Lio/flutter/view/f;->g:Lio/flutter/view/f;

    .line 607
    .line 608
    invoke-static {v5, v9}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 609
    .line 610
    .line 611
    move-result v9

    .line 612
    if-eqz v9, :cond_2a

    .line 613
    .line 614
    iget-object v9, v5, Lio/flutter/view/h;->X:Lio/flutter/view/g;

    .line 615
    .line 616
    const/16 v15, 0x20

    .line 617
    .line 618
    if-eqz v9, :cond_29

    .line 619
    .line 620
    new-instance v9, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 621
    .line 622
    iget-object v6, v5, Lio/flutter/view/h;->X:Lio/flutter/view/g;

    .line 623
    .line 624
    iget-object v6, v6, Lio/flutter/view/g;->e:Ljava/lang/String;

    .line 625
    .line 626
    invoke-direct {v9, v15, v6}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;-><init>(ILjava/lang/CharSequence;)V

    .line 627
    .line 628
    .line 629
    invoke-virtual {v3, v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 630
    .line 631
    .line 632
    invoke-virtual {v3, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->setLongClickable(Z)V

    .line 633
    .line 634
    .line 635
    goto :goto_d

    .line 636
    :cond_29
    invoke-virtual {v3, v15}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 637
    .line 638
    .line 639
    invoke-virtual {v3, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->setLongClickable(Z)V

    .line 640
    .line 641
    .line 642
    :cond_2a
    :goto_d
    sget-object v6, Lio/flutter/view/f;->h:Lio/flutter/view/f;

    .line 643
    .line 644
    invoke-static {v5, v6}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 645
    .line 646
    .line 647
    move-result v9

    .line 648
    const/16 v15, 0x13

    .line 649
    .line 650
    sget-object v4, Lio/flutter/view/f;->k:Lio/flutter/view/f;

    .line 651
    .line 652
    sget-object v10, Lio/flutter/view/f;->j:Lio/flutter/view/f;

    .line 653
    .line 654
    sget-object v13, Lio/flutter/view/f;->i:Lio/flutter/view/f;

    .line 655
    .line 656
    if-nez v9, :cond_2b

    .line 657
    .line 658
    invoke-static {v5, v10}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 659
    .line 660
    .line 661
    move-result v9

    .line 662
    if-nez v9, :cond_2b

    .line 663
    .line 664
    invoke-static {v5, v13}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 665
    .line 666
    .line 667
    move-result v9

    .line 668
    if-nez v9, :cond_2b

    .line 669
    .line 670
    invoke-static {v5, v4}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 671
    .line 672
    .line 673
    move-result v9

    .line 674
    if-eqz v9, :cond_2e

    .line 675
    .line 676
    :cond_2b
    invoke-virtual {v3, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->setScrollable(Z)V

    .line 677
    .line 678
    .line 679
    invoke-virtual {v5, v15}, Lio/flutter/view/h;->g(I)Z

    .line 680
    .line 681
    .line 682
    move-result v9

    .line 683
    if-eqz v9, :cond_2e

    .line 684
    .line 685
    invoke-static {v5, v6}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 686
    .line 687
    .line 688
    move-result v9

    .line 689
    if-nez v9, :cond_2d

    .line 690
    .line 691
    invoke-static {v5, v13}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 692
    .line 693
    .line 694
    move-result v9

    .line 695
    if-eqz v9, :cond_2c

    .line 696
    .line 697
    goto :goto_e

    .line 698
    :cond_2c
    const-string v9, "android.widget.ScrollView"

    .line 699
    .line 700
    invoke-virtual {v3, v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 701
    .line 702
    .line 703
    goto :goto_f

    .line 704
    :cond_2d
    :goto_e
    const-string v9, "android.widget.HorizontalScrollView"

    .line 705
    .line 706
    invoke-virtual {v3, v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 707
    .line 708
    .line 709
    :cond_2e
    :goto_f
    invoke-virtual {v0, v5}, Lio/flutter/view/i;->k(Lio/flutter/view/h;)Z

    .line 710
    .line 711
    .line 712
    move-result v9

    .line 713
    const/16 v14, 0x21

    .line 714
    .line 715
    if-eqz v9, :cond_33

    .line 716
    .line 717
    invoke-static {v5, v6}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 718
    .line 719
    .line 720
    move-result v9

    .line 721
    if-nez v9, :cond_31

    .line 722
    .line 723
    invoke-static {v5, v13}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 724
    .line 725
    .line 726
    move-result v9

    .line 727
    if-eqz v9, :cond_2f

    .line 728
    .line 729
    goto :goto_10

    .line 730
    :cond_2f
    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 731
    .line 732
    if-ge v9, v14, :cond_30

    .line 733
    .line 734
    iget v9, v5, Lio/flutter/view/h;->j:I

    .line 735
    .line 736
    invoke-static {v9, v2, v8}, Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;->obtain(IIZ)Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;

    .line 737
    .line 738
    .line 739
    move-result-object v9

    .line 740
    invoke-virtual {v3, v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->setCollectionInfo(Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;)V

    .line 741
    .line 742
    .line 743
    goto :goto_11

    .line 744
    :cond_30
    new-instance v9, Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;

    .line 745
    .line 746
    iget v9, v5, Lio/flutter/view/h;->j:I

    .line 747
    .line 748
    invoke-static {v9}, Lio/flutter/view/a;->d(I)Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;

    .line 749
    .line 750
    .line 751
    move-result-object v9

    .line 752
    invoke-virtual {v3, v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->setCollectionInfo(Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;)V

    .line 753
    .line 754
    .line 755
    goto :goto_11

    .line 756
    :cond_31
    :goto_10
    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 757
    .line 758
    if-ge v9, v14, :cond_32

    .line 759
    .line 760
    iget v9, v5, Lio/flutter/view/h;->j:I

    .line 761
    .line 762
    invoke-static {v2, v9, v8}, Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;->obtain(IIZ)Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;

    .line 763
    .line 764
    .line 765
    move-result-object v9

    .line 766
    invoke-virtual {v3, v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->setCollectionInfo(Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;)V

    .line 767
    .line 768
    .line 769
    goto :goto_11

    .line 770
    :cond_32
    new-instance v9, Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;

    .line 771
    .line 772
    iget v9, v5, Lio/flutter/view/h;->j:I

    .line 773
    .line 774
    invoke-static {v9}, Lio/flutter/view/a;->h(I)Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;

    .line 775
    .line 776
    .line 777
    move-result-object v9

    .line 778
    invoke-virtual {v3, v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->setCollectionInfo(Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;)V

    .line 779
    .line 780
    .line 781
    :cond_33
    :goto_11
    iget-object v9, v5, Lio/flutter/view/h;->S:Lio/flutter/view/h;

    .line 782
    .line 783
    if-eqz v9, :cond_34

    .line 784
    .line 785
    invoke-virtual {v0, v9}, Lio/flutter/view/i;->k(Lio/flutter/view/h;)Z

    .line 786
    .line 787
    .line 788
    move-result v9

    .line 789
    if-eqz v9, :cond_34

    .line 790
    .line 791
    iget-object v9, v5, Lio/flutter/view/h;->S:Lio/flutter/view/h;

    .line 792
    .line 793
    invoke-virtual {v9, v15}, Lio/flutter/view/h;->g(I)Z

    .line 794
    .line 795
    .line 796
    move-result v9

    .line 797
    if-eqz v9, :cond_34

    .line 798
    .line 799
    move v9, v2

    .line 800
    goto :goto_12

    .line 801
    :cond_34
    move v9, v8

    .line 802
    :goto_12
    if-eqz v9, :cond_39

    .line 803
    .line 804
    iget-object v9, v5, Lio/flutter/view/h;->S:Lio/flutter/view/h;

    .line 805
    .line 806
    iget-object v15, v9, Lio/flutter/view/h;->T:Ljava/util/ArrayList;

    .line 807
    .line 808
    invoke-static {v9, v6}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 809
    .line 810
    .line 811
    move-result v17

    .line 812
    if-nez v17, :cond_35

    .line 813
    .line 814
    invoke-static {v9, v13}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 815
    .line 816
    .line 817
    move-result v9

    .line 818
    if-nez v9, :cond_35

    .line 819
    .line 820
    move v9, v2

    .line 821
    goto :goto_13

    .line 822
    :cond_35
    move v9, v8

    .line 823
    :goto_13
    invoke-virtual {v15, v5}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 824
    .line 825
    .line 826
    move-result v15

    .line 827
    const/16 v2, 0xa

    .line 828
    .line 829
    if-eqz v9, :cond_37

    .line 830
    .line 831
    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 832
    .line 833
    if-ge v9, v14, :cond_36

    .line 834
    .line 835
    invoke-virtual {v5, v2}, Lio/flutter/view/h;->g(I)Z

    .line 836
    .line 837
    .line 838
    move-result v2

    .line 839
    const/4 v9, 0x1

    .line 840
    invoke-static {v15, v9, v8, v9, v2}, Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;->obtain(IIIIZ)Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;

    .line 841
    .line 842
    .line 843
    move-result-object v2

    .line 844
    invoke-virtual {v3, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->setCollectionItemInfo(Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;)V

    .line 845
    .line 846
    .line 847
    goto :goto_14

    .line 848
    :cond_36
    const/4 v9, 0x1

    .line 849
    new-instance v14, Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;

    .line 850
    .line 851
    invoke-virtual {v5, v2}, Lio/flutter/view/h;->g(I)Z

    .line 852
    .line 853
    .line 854
    move-result v2

    .line 855
    invoke-static {v15, v2}, Lio/flutter/view/a;->e(IZ)Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;

    .line 856
    .line 857
    .line 858
    move-result-object v2

    .line 859
    invoke-virtual {v3, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->setCollectionItemInfo(Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;)V

    .line 860
    .line 861
    .line 862
    goto :goto_14

    .line 863
    :cond_37
    const/4 v9, 0x1

    .line 864
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 865
    .line 866
    if-ge v8, v14, :cond_38

    .line 867
    .line 868
    invoke-virtual {v5, v2}, Lio/flutter/view/h;->g(I)Z

    .line 869
    .line 870
    .line 871
    move-result v2

    .line 872
    const/4 v8, 0x0

    .line 873
    invoke-static {v8, v9, v15, v9, v2}, Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;->obtain(IIIIZ)Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;

    .line 874
    .line 875
    .line 876
    move-result-object v2

    .line 877
    invoke-virtual {v3, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->setCollectionItemInfo(Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;)V

    .line 878
    .line 879
    .line 880
    goto :goto_14

    .line 881
    :cond_38
    new-instance v8, Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;

    .line 882
    .line 883
    invoke-virtual {v5, v2}, Lio/flutter/view/h;->g(I)Z

    .line 884
    .line 885
    .line 886
    move-result v2

    .line 887
    invoke-static {v15, v2}, Lio/flutter/view/a;->i(IZ)Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;

    .line 888
    .line 889
    .line 890
    move-result-object v2

    .line 891
    invoke-virtual {v3, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->setCollectionItemInfo(Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;)V

    .line 892
    .line 893
    .line 894
    :cond_39
    :goto_14
    invoke-static {v5, v6}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 895
    .line 896
    .line 897
    move-result v2

    .line 898
    const/16 v6, 0x1000

    .line 899
    .line 900
    if-nez v2, :cond_3a

    .line 901
    .line 902
    invoke-static {v5, v10}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 903
    .line 904
    .line 905
    move-result v2

    .line 906
    if-eqz v2, :cond_3b

    .line 907
    .line 908
    :cond_3a
    invoke-virtual {v3, v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 909
    .line 910
    .line 911
    :cond_3b
    invoke-static {v5, v13}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 912
    .line 913
    .line 914
    move-result v2

    .line 915
    const/16 v8, 0x2000

    .line 916
    .line 917
    if-nez v2, :cond_3c

    .line 918
    .line 919
    invoke-static {v5, v4}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 920
    .line 921
    .line 922
    move-result v2

    .line 923
    if-eqz v2, :cond_3d

    .line 924
    .line 925
    :cond_3c
    invoke-virtual {v3, v8}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 926
    .line 927
    .line 928
    :cond_3d
    sget-object v2, Lio/flutter/view/f;->l:Lio/flutter/view/f;

    .line 929
    .line 930
    invoke-static {v5, v2}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 931
    .line 932
    .line 933
    move-result v4

    .line 934
    sget-object v9, Lio/flutter/view/f;->m:Lio/flutter/view/f;

    .line 935
    .line 936
    if-nez v4, :cond_3f

    .line 937
    .line 938
    invoke-static {v5, v9}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 939
    .line 940
    .line 941
    move-result v4

    .line 942
    if-eqz v4, :cond_3e

    .line 943
    .line 944
    goto :goto_16

    .line 945
    :cond_3e
    :goto_15
    const/16 v2, 0x10

    .line 946
    .line 947
    goto :goto_17

    .line 948
    :cond_3f
    :goto_16
    const-string v4, "android.widget.SeekBar"

    .line 949
    .line 950
    invoke-virtual {v3, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 951
    .line 952
    .line 953
    invoke-static {v5, v2}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 954
    .line 955
    .line 956
    move-result v2

    .line 957
    if-eqz v2, :cond_40

    .line 958
    .line 959
    invoke-virtual {v3, v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 960
    .line 961
    .line 962
    :cond_40
    invoke-static {v5, v9}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 963
    .line 964
    .line 965
    move-result v2

    .line 966
    if-eqz v2, :cond_3e

    .line 967
    .line 968
    invoke-virtual {v3, v8}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 969
    .line 970
    .line 971
    goto :goto_15

    .line 972
    :goto_17
    invoke-virtual {v5, v2}, Lio/flutter/view/h;->g(I)Z

    .line 973
    .line 974
    .line 975
    move-result v2

    .line 976
    if-eqz v2, :cond_41

    .line 977
    .line 978
    const/4 v9, 0x1

    .line 979
    invoke-virtual {v3, v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->setLiveRegion(I)V

    .line 980
    .line 981
    .line 982
    :cond_41
    const/4 v2, 0x5

    .line 983
    invoke-virtual {v5, v2}, Lio/flutter/view/h;->g(I)Z

    .line 984
    .line 985
    .line 986
    move-result v2

    .line 987
    const/4 v9, 0x3

    .line 988
    const/16 v4, 0x1c

    .line 989
    .line 990
    if-eqz v2, :cond_46

    .line 991
    .line 992
    new-instance v2, LV1/y;

    .line 993
    .line 994
    const/16 v6, 0x8

    .line 995
    .line 996
    const/4 v8, 0x0

    .line 997
    invoke-direct {v2, v6, v8}, LV1/y;-><init>(IZ)V

    .line 998
    .line 999
    .line 1000
    iget-object v6, v5, Lio/flutter/view/h;->r:Ljava/lang/String;

    .line 1001
    .line 1002
    iput-object v6, v2, LV1/y;->f:Ljava/lang/Object;

    .line 1003
    .line 1004
    iget-object v6, v5, Lio/flutter/view/h;->s:Ljava/util/List;

    .line 1005
    .line 1006
    iput-object v6, v2, LV1/y;->g:Ljava/lang/Object;

    .line 1007
    .line 1008
    invoke-virtual {v5}, Lio/flutter/view/h;->d()Ljava/lang/String;

    .line 1009
    .line 1010
    .line 1011
    move-result-object v6

    .line 1012
    iput-object v6, v2, LV1/y;->h:Ljava/lang/Object;

    .line 1013
    .line 1014
    invoke-virtual {v2}, LV1/y;->d()Landroid/text/SpannableString;

    .line 1015
    .line 1016
    .line 1017
    move-result-object v2

    .line 1018
    invoke-virtual {v3, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->setText(Ljava/lang/CharSequence;)V

    .line 1019
    .line 1020
    .line 1021
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 1022
    .line 1023
    if-lt v2, v4, :cond_49

    .line 1024
    .line 1025
    new-instance v2, LV1/y;

    .line 1026
    .line 1027
    const/16 v6, 0x8

    .line 1028
    .line 1029
    const/4 v8, 0x0

    .line 1030
    invoke-direct {v2, v6, v8}, LV1/y;-><init>(IZ)V

    .line 1031
    .line 1032
    .line 1033
    iget-object v10, v5, Lio/flutter/view/h;->p:Ljava/lang/String;

    .line 1034
    .line 1035
    iput-object v10, v2, LV1/y;->f:Ljava/lang/Object;

    .line 1036
    .line 1037
    iget-object v10, v5, Lio/flutter/view/h;->q:Ljava/util/ArrayList;

    .line 1038
    .line 1039
    iput-object v10, v2, LV1/y;->g:Ljava/lang/Object;

    .line 1040
    .line 1041
    iget-object v10, v5, Lio/flutter/view/h;->A:Ljava/lang/String;

    .line 1042
    .line 1043
    iput-object v10, v2, LV1/y;->i:Ljava/lang/Object;

    .line 1044
    .line 1045
    invoke-virtual {v5}, Lio/flutter/view/h;->d()Ljava/lang/String;

    .line 1046
    .line 1047
    .line 1048
    move-result-object v10

    .line 1049
    iput-object v10, v2, LV1/y;->h:Ljava/lang/Object;

    .line 1050
    .line 1051
    invoke-virtual {v2}, LV1/y;->d()Landroid/text/SpannableString;

    .line 1052
    .line 1053
    .line 1054
    move-result-object v2

    .line 1055
    new-instance v10, LV1/y;

    .line 1056
    .line 1057
    invoke-direct {v10, v6, v8}, LV1/y;-><init>(IZ)V

    .line 1058
    .line 1059
    .line 1060
    iget-object v6, v5, Lio/flutter/view/h;->x:Ljava/lang/String;

    .line 1061
    .line 1062
    iput-object v6, v10, LV1/y;->f:Ljava/lang/Object;

    .line 1063
    .line 1064
    iget-object v6, v5, Lio/flutter/view/h;->y:Ljava/util/ArrayList;

    .line 1065
    .line 1066
    iput-object v6, v10, LV1/y;->g:Ljava/lang/Object;

    .line 1067
    .line 1068
    invoke-virtual {v5}, Lio/flutter/view/h;->d()Ljava/lang/String;

    .line 1069
    .line 1070
    .line 1071
    move-result-object v6

    .line 1072
    iput-object v6, v10, LV1/y;->h:Ljava/lang/Object;

    .line 1073
    .line 1074
    invoke-virtual {v10}, LV1/y;->d()Landroid/text/SpannableString;

    .line 1075
    .line 1076
    .line 1077
    move-result-object v6

    .line 1078
    const/4 v10, 0x2

    .line 1079
    new-array v12, v10, [Ljava/lang/CharSequence;

    .line 1080
    .line 1081
    aput-object v2, v12, v8

    .line 1082
    .line 1083
    const/16 v17, 0x1

    .line 1084
    .line 1085
    aput-object v6, v12, v17

    .line 1086
    .line 1087
    const/4 v2, 0x0

    .line 1088
    const/4 v8, 0x0

    .line 1089
    :goto_18
    if-ge v8, v10, :cond_45

    .line 1090
    .line 1091
    aget-object v6, v12, v8

    .line 1092
    .line 1093
    if-eqz v6, :cond_44

    .line 1094
    .line 1095
    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    .line 1096
    .line 1097
    .line 1098
    move-result v10

    .line 1099
    if-lez v10, :cond_44

    .line 1100
    .line 1101
    if-eqz v2, :cond_43

    .line 1102
    .line 1103
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    .line 1104
    .line 1105
    .line 1106
    move-result v10

    .line 1107
    if-nez v10, :cond_42

    .line 1108
    .line 1109
    goto :goto_19

    .line 1110
    :cond_42
    new-array v10, v9, [Ljava/lang/CharSequence;

    .line 1111
    .line 1112
    const/16 v18, 0x0

    .line 1113
    .line 1114
    aput-object v2, v10, v18

    .line 1115
    .line 1116
    const-string v2, ", "

    .line 1117
    .line 1118
    const/16 v17, 0x1

    .line 1119
    .line 1120
    aput-object v2, v10, v17

    .line 1121
    .line 1122
    const/16 v16, 0x2

    .line 1123
    .line 1124
    aput-object v6, v10, v16

    .line 1125
    .line 1126
    invoke-static {v10}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 1127
    .line 1128
    .line 1129
    move-result-object v2

    .line 1130
    goto :goto_1a

    .line 1131
    :cond_43
    :goto_19
    move-object v2, v6

    .line 1132
    :cond_44
    :goto_1a
    add-int/lit8 v8, v8, 0x1

    .line 1133
    .line 1134
    const/4 v10, 0x2

    .line 1135
    goto :goto_18

    .line 1136
    :cond_45
    invoke-static {v3, v2}, Lio/flutter/plugin/editing/i;->l(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/CharSequence;)V

    .line 1137
    .line 1138
    .line 1139
    goto :goto_1b

    .line 1140
    :cond_46
    const/16 v2, 0xc

    .line 1141
    .line 1142
    invoke-virtual {v5, v2}, Lio/flutter/view/h;->g(I)Z

    .line 1143
    .line 1144
    .line 1145
    move-result v2

    .line 1146
    if-nez v2, :cond_49

    .line 1147
    .line 1148
    invoke-static {v5}, Lio/flutter/view/h;->b(Lio/flutter/view/h;)Ljava/lang/CharSequence;

    .line 1149
    .line 1150
    .line 1151
    move-result-object v2

    .line 1152
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 1153
    .line 1154
    if-ge v6, v4, :cond_48

    .line 1155
    .line 1156
    iget-object v6, v5, Lio/flutter/view/h;->z:Ljava/lang/String;

    .line 1157
    .line 1158
    if-eqz v6, :cond_48

    .line 1159
    .line 1160
    if-eqz v2, :cond_47

    .line 1161
    .line 1162
    move-object v12, v2

    .line 1163
    :cond_47
    new-instance v2, Ljava/lang/StringBuilder;

    .line 1164
    .line 1165
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 1166
    .line 1167
    .line 1168
    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1169
    .line 1170
    .line 1171
    const-string v6, "\n"

    .line 1172
    .line 1173
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1174
    .line 1175
    .line 1176
    iget-object v6, v5, Lio/flutter/view/h;->z:Ljava/lang/String;

    .line 1177
    .line 1178
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1179
    .line 1180
    .line 1181
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1182
    .line 1183
    .line 1184
    move-result-object v2

    .line 1185
    :cond_48
    if-eqz v2, :cond_49

    .line 1186
    .line 1187
    invoke-virtual {v3, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1188
    .line 1189
    .line 1190
    :cond_49
    :goto_1b
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 1191
    .line 1192
    if-lt v2, v4, :cond_4a

    .line 1193
    .line 1194
    iget-object v6, v5, Lio/flutter/view/h;->z:Ljava/lang/String;

    .line 1195
    .line 1196
    if-eqz v6, :cond_4a

    .line 1197
    .line 1198
    invoke-static {v3, v6}, LQ2/a;->u(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;)V

    .line 1199
    .line 1200
    .line 1201
    invoke-static {v5}, Lio/flutter/view/h;->b(Lio/flutter/view/h;)Ljava/lang/CharSequence;

    .line 1202
    .line 1203
    .line 1204
    move-result-object v6

    .line 1205
    if-nez v6, :cond_4a

    .line 1206
    .line 1207
    iget-object v6, v5, Lio/flutter/view/h;->z:Ljava/lang/String;

    .line 1208
    .line 1209
    invoke-virtual {v3, v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1210
    .line 1211
    .line 1212
    :cond_4a
    const/4 v6, 0x1

    .line 1213
    invoke-virtual {v5, v6}, Lio/flutter/view/h;->g(I)Z

    .line 1214
    .line 1215
    .line 1216
    move-result v8

    .line 1217
    const/16 v10, 0x11

    .line 1218
    .line 1219
    invoke-virtual {v5, v10}, Lio/flutter/view/h;->g(I)Z

    .line 1220
    .line 1221
    .line 1222
    move-result v10

    .line 1223
    if-nez v8, :cond_4c

    .line 1224
    .line 1225
    if-eqz v10, :cond_4b

    .line 1226
    .line 1227
    goto :goto_1c

    .line 1228
    :cond_4b
    const/4 v12, 0x0

    .line 1229
    goto :goto_1d

    .line 1230
    :cond_4c
    :goto_1c
    move v12, v6

    .line 1231
    :goto_1d
    invoke-virtual {v3, v12}, Landroid/view/accessibility/AccessibilityNodeInfo;->setCheckable(Z)V

    .line 1232
    .line 1233
    .line 1234
    if-eqz v8, :cond_4e

    .line 1235
    .line 1236
    const/4 v8, 0x2

    .line 1237
    invoke-virtual {v5, v8}, Lio/flutter/view/h;->g(I)Z

    .line 1238
    .line 1239
    .line 1240
    move-result v8

    .line 1241
    invoke-virtual {v3, v8}, Landroid/view/accessibility/AccessibilityNodeInfo;->setChecked(Z)V

    .line 1242
    .line 1243
    .line 1244
    const/16 v8, 0x9

    .line 1245
    .line 1246
    invoke-virtual {v5, v8}, Lio/flutter/view/h;->g(I)Z

    .line 1247
    .line 1248
    .line 1249
    move-result v8

    .line 1250
    if-eqz v8, :cond_4d

    .line 1251
    .line 1252
    const-string v8, "android.widget.RadioButton"

    .line 1253
    .line 1254
    invoke-virtual {v3, v8}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 1255
    .line 1256
    .line 1257
    goto :goto_1e

    .line 1258
    :cond_4d
    const-string v8, "android.widget.CheckBox"

    .line 1259
    .line 1260
    invoke-virtual {v3, v8}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 1261
    .line 1262
    .line 1263
    goto :goto_1e

    .line 1264
    :cond_4e
    if-eqz v10, :cond_4f

    .line 1265
    .line 1266
    const/16 v8, 0x12

    .line 1267
    .line 1268
    invoke-virtual {v5, v8}, Lio/flutter/view/h;->g(I)Z

    .line 1269
    .line 1270
    .line 1271
    move-result v8

    .line 1272
    invoke-virtual {v3, v8}, Landroid/view/accessibility/AccessibilityNodeInfo;->setChecked(Z)V

    .line 1273
    .line 1274
    .line 1275
    const-string v8, "android.widget.Switch"

    .line 1276
    .line 1277
    invoke-virtual {v3, v8}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 1278
    .line 1279
    .line 1280
    :cond_4f
    :goto_1e
    invoke-virtual {v5, v9}, Lio/flutter/view/h;->g(I)Z

    .line 1281
    .line 1282
    .line 1283
    move-result v8

    .line 1284
    invoke-virtual {v3, v8}, Landroid/view/accessibility/AccessibilityNodeInfo;->setSelected(Z)V

    .line 1285
    .line 1286
    .line 1287
    const/16 v8, 0x24

    .line 1288
    .line 1289
    if-lt v2, v8, :cond_52

    .line 1290
    .line 1291
    const/16 v8, 0x1b

    .line 1292
    .line 1293
    invoke-virtual {v5, v8}, Lio/flutter/view/h;->g(I)Z

    .line 1294
    .line 1295
    .line 1296
    move-result v8

    .line 1297
    if-eqz v8, :cond_52

    .line 1298
    .line 1299
    invoke-virtual {v5, v4}, Lio/flutter/view/h;->g(I)Z

    .line 1300
    .line 1301
    .line 1302
    move-result v8

    .line 1303
    if-eqz v8, :cond_50

    .line 1304
    .line 1305
    goto :goto_1f

    .line 1306
    :cond_50
    move v9, v6

    .line 1307
    :goto_1f
    invoke-static {v3, v9}, LV2/o;->c(Landroid/view/accessibility/AccessibilityNodeInfo;I)V

    .line 1308
    .line 1309
    .line 1310
    sget-object v8, Lio/flutter/view/f;->B:Lio/flutter/view/f;

    .line 1311
    .line 1312
    invoke-static {v5, v8}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 1313
    .line 1314
    .line 1315
    move-result v8

    .line 1316
    if-eqz v8, :cond_51

    .line 1317
    .line 1318
    const/high16 v8, 0x40000

    .line 1319
    .line 1320
    invoke-virtual {v3, v8}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 1321
    .line 1322
    .line 1323
    :cond_51
    sget-object v8, Lio/flutter/view/f;->C:Lio/flutter/view/f;

    .line 1324
    .line 1325
    invoke-static {v5, v8}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 1326
    .line 1327
    .line 1328
    move-result v8

    .line 1329
    if-eqz v8, :cond_52

    .line 1330
    .line 1331
    const/high16 v8, 0x80000

    .line 1332
    .line 1333
    invoke-virtual {v3, v8}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 1334
    .line 1335
    .line 1336
    :cond_52
    if-lt v2, v4, :cond_54

    .line 1337
    .line 1338
    iget v2, v5, Lio/flutter/view/h;->C:I

    .line 1339
    .line 1340
    if-lez v2, :cond_53

    .line 1341
    .line 1342
    move v2, v6

    .line 1343
    goto :goto_20

    .line 1344
    :cond_53
    const/4 v2, 0x0

    .line 1345
    :goto_20
    invoke-static {v3, v2}, LB/b;->D(Landroid/view/accessibility/AccessibilityNodeInfo;Z)V

    .line 1346
    .line 1347
    .line 1348
    :cond_54
    iget-object v2, v0, Lio/flutter/view/i;->i:Lio/flutter/view/h;

    .line 1349
    .line 1350
    if-eqz v2, :cond_55

    .line 1351
    .line 1352
    iget v2, v2, Lio/flutter/view/h;->b:I

    .line 1353
    .line 1354
    if-ne v2, v1, :cond_55

    .line 1355
    .line 1356
    const/16 v1, 0x80

    .line 1357
    .line 1358
    invoke-virtual {v3, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 1359
    .line 1360
    .line 1361
    goto :goto_21

    .line 1362
    :cond_55
    const/16 v1, 0x40

    .line 1363
    .line 1364
    invoke-virtual {v3, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 1365
    .line 1366
    .line 1367
    :goto_21
    iget-object v1, v5, Lio/flutter/view/h;->V:Ljava/util/ArrayList;

    .line 1368
    .line 1369
    if-eqz v1, :cond_56

    .line 1370
    .line 1371
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 1372
    .line 1373
    .line 1374
    move-result v2

    .line 1375
    const/4 v8, 0x0

    .line 1376
    :goto_22
    if-ge v8, v2, :cond_56

    .line 1377
    .line 1378
    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1379
    .line 1380
    .line 1381
    move-result-object v4

    .line 1382
    add-int/lit8 v8, v8, 0x1

    .line 1383
    .line 1384
    check-cast v4, Lio/flutter/view/g;

    .line 1385
    .line 1386
    new-instance v6, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 1387
    .line 1388
    iget v9, v4, Lio/flutter/view/g;->a:I

    .line 1389
    .line 1390
    iget-object v4, v4, Lio/flutter/view/g;->d:Ljava/lang/String;

    .line 1391
    .line 1392
    invoke-direct {v6, v9, v4}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;-><init>(ILjava/lang/CharSequence;)V

    .line 1393
    .line 1394
    .line 1395
    invoke-virtual {v3, v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    .line 1396
    .line 1397
    .line 1398
    goto :goto_22

    .line 1399
    :cond_56
    iget-object v1, v5, Lio/flutter/view/h;->T:Ljava/util/ArrayList;

    .line 1400
    .line 1401
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 1402
    .line 1403
    .line 1404
    move-result v2

    .line 1405
    const/4 v8, 0x0

    .line 1406
    :goto_23
    if-ge v8, v2, :cond_59

    .line 1407
    .line 1408
    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 1409
    .line 1410
    .line 1411
    move-result-object v4

    .line 1412
    add-int/lit8 v8, v8, 0x1

    .line 1413
    .line 1414
    check-cast v4, Lio/flutter/view/h;

    .line 1415
    .line 1416
    const/16 v5, 0xe

    .line 1417
    .line 1418
    invoke-virtual {v4, v5}, Lio/flutter/view/h;->g(I)Z

    .line 1419
    .line 1420
    .line 1421
    move-result v5

    .line 1422
    if-eqz v5, :cond_57

    .line 1423
    .line 1424
    goto :goto_23

    .line 1425
    :cond_57
    iget v5, v4, Lio/flutter/view/h;->i:I

    .line 1426
    .line 1427
    const/4 v6, -0x1

    .line 1428
    if-eq v5, v6, :cond_58

    .line 1429
    .line 1430
    invoke-interface {v11, v5}, Lio/flutter/plugin/platform/i;->h(I)Landroid/view/View;

    .line 1431
    .line 1432
    .line 1433
    move-result-object v5

    .line 1434
    iget v9, v4, Lio/flutter/view/h;->i:I

    .line 1435
    .line 1436
    invoke-interface {v11, v9}, Lio/flutter/plugin/platform/i;->g(I)Z

    .line 1437
    .line 1438
    .line 1439
    move-result v9

    .line 1440
    if-nez v9, :cond_58

    .line 1441
    .line 1442
    if-eqz v5, :cond_58

    .line 1443
    .line 1444
    const/4 v9, 0x0

    .line 1445
    invoke-virtual {v5, v9}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 1446
    .line 1447
    .line 1448
    invoke-virtual {v3, v5}, Landroid/view/accessibility/AccessibilityNodeInfo;->addChild(Landroid/view/View;)V

    .line 1449
    .line 1450
    .line 1451
    goto :goto_23

    .line 1452
    :cond_58
    const/4 v9, 0x0

    .line 1453
    iget v4, v4, Lio/flutter/view/h;->b:I

    .line 1454
    .line 1455
    invoke-virtual {v3, v7, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->addChild(Landroid/view/View;I)V

    .line 1456
    .line 1457
    .line 1458
    goto :goto_23

    .line 1459
    :cond_59
    return-object v3
.end method

.method public final e(II)Landroid/view/accessibility/AccessibilityEvent;
    .locals 2

    .line 1
    invoke-static {p2}, Landroid/view/accessibility/AccessibilityEvent;->obtain(I)Landroid/view/accessibility/AccessibilityEvent;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object v0, p0, Lio/flutter/view/i;->a:Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p2, v1}, Landroid/view/accessibility/AccessibilityEvent;->setPackageName(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2, v0, p1}, Landroid/view/accessibility/AccessibilityRecord;->setSource(Landroid/view/View;I)V

    .line 19
    .line 20
    .line 21
    return-object p2
.end method

.method public final f(Landroid/view/MotionEvent;Z)Z
    .locals 12

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iget-object v2, p0, Lio/flutter/view/i;->c:Landroid/view/accessibility/AccessibilityManager;

    .line 7
    .line 8
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityManager;->isTouchExplorationEnabled()Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object v2, p0, Lio/flutter/view/i;->g:Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/util/HashMap;->isEmpty()Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-eqz v3, :cond_1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    check-cast v3, Lio/flutter/view/h;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    const/4 v6, 0x4

    .line 39
    new-array v7, v6, [F

    .line 40
    .line 41
    aput v4, v7, v0

    .line 42
    .line 43
    const/4 v4, 0x1

    .line 44
    aput v5, v7, v4

    .line 45
    .line 46
    const/4 v5, 0x2

    .line 47
    const/4 v8, 0x0

    .line 48
    aput v8, v7, v5

    .line 49
    .line 50
    const/4 v9, 0x3

    .line 51
    const/high16 v10, 0x3f800000    # 1.0f

    .line 52
    .line 53
    aput v10, v7, v9

    .line 54
    .line 55
    invoke-virtual {v3, v7, p2}, Lio/flutter/view/h;->h([FZ)Lio/flutter/view/h;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    if-eqz v3, :cond_3

    .line 60
    .line 61
    iget v7, v3, Lio/flutter/view/h;->i:I

    .line 62
    .line 63
    const/4 v11, -0x1

    .line 64
    if-eq v7, v11, :cond_3

    .line 65
    .line 66
    if-eqz p2, :cond_2

    .line 67
    .line 68
    :goto_0
    return v0

    .line 69
    :cond_2
    iget-object p2, p0, Lio/flutter/view/i;->d:Lio/flutter/view/AccessibilityViewEmbedder;

    .line 70
    .line 71
    iget v0, v3, Lio/flutter/view/h;->b:I

    .line 72
    .line 73
    invoke-virtual {p2, v0, p1}, Lio/flutter/view/AccessibilityViewEmbedder;->onAccessibilityHoverEvent(ILandroid/view/MotionEvent;)Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    return p1

    .line 78
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    const/16 v7, 0x9

    .line 83
    .line 84
    const/16 v11, 0x100

    .line 85
    .line 86
    if-eq v3, v7, :cond_6

    .line 87
    .line 88
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    const/4 v7, 0x7

    .line 93
    if-ne v3, v7, :cond_4

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 97
    .line 98
    .line 99
    move-result p2

    .line 100
    const/16 v1, 0xa

    .line 101
    .line 102
    if-ne p2, v1, :cond_5

    .line 103
    .line 104
    iget-object p1, p0, Lio/flutter/view/i;->p:Lio/flutter/view/h;

    .line 105
    .line 106
    if-eqz p1, :cond_a

    .line 107
    .line 108
    iget p1, p1, Lio/flutter/view/h;->b:I

    .line 109
    .line 110
    invoke-virtual {p0, p1, v11}, Lio/flutter/view/i;->h(II)V

    .line 111
    .line 112
    .line 113
    const/4 p1, 0x0

    .line 114
    iput-object p1, p0, Lio/flutter/view/i;->p:Lio/flutter/view/h;

    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_5
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    return v0

    .line 121
    :cond_6
    :goto_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    invoke-virtual {v2}, Ljava/util/HashMap;->isEmpty()Z

    .line 130
    .line 131
    .line 132
    move-result v7

    .line 133
    if-eqz v7, :cond_7

    .line 134
    .line 135
    goto :goto_2

    .line 136
    :cond_7
    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    check-cast v1, Lio/flutter/view/h;

    .line 141
    .line 142
    new-array v2, v6, [F

    .line 143
    .line 144
    aput v3, v2, v0

    .line 145
    .line 146
    aput p1, v2, v4

    .line 147
    .line 148
    aput v8, v2, v5

    .line 149
    .line 150
    aput v10, v2, v9

    .line 151
    .line 152
    invoke-virtual {v1, v2, p2}, Lio/flutter/view/h;->h([FZ)Lio/flutter/view/h;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    iget-object p2, p0, Lio/flutter/view/i;->p:Lio/flutter/view/h;

    .line 157
    .line 158
    if-eq p1, p2, :cond_a

    .line 159
    .line 160
    if-eqz p1, :cond_8

    .line 161
    .line 162
    iget p2, p1, Lio/flutter/view/h;->b:I

    .line 163
    .line 164
    const/16 v0, 0x80

    .line 165
    .line 166
    invoke-virtual {p0, p2, v0}, Lio/flutter/view/i;->h(II)V

    .line 167
    .line 168
    .line 169
    :cond_8
    iget-object p2, p0, Lio/flutter/view/i;->p:Lio/flutter/view/h;

    .line 170
    .line 171
    if-eqz p2, :cond_9

    .line 172
    .line 173
    iget p2, p2, Lio/flutter/view/h;->b:I

    .line 174
    .line 175
    invoke-virtual {p0, p2, v11}, Lio/flutter/view/i;->h(II)V

    .line 176
    .line 177
    .line 178
    :cond_9
    iput-object p1, p0, Lio/flutter/view/i;->p:Lio/flutter/view/h;

    .line 179
    .line 180
    :cond_a
    :goto_2
    return v4
.end method

.method public final findFocus(I)Landroid/view/accessibility/AccessibilityNodeInfo;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p1, v0, :cond_0

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p1, v0, :cond_2

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p1, p0, Lio/flutter/view/i;->n:Lio/flutter/view/h;

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    iget p1, p1, Lio/flutter/view/h;->b:I

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lio/flutter/view/i;->createAccessibilityNodeInfo(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    return-object p1

    .line 19
    :cond_1
    iget-object p1, p0, Lio/flutter/view/i;->k:Ljava/lang/Integer;

    .line 20
    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-virtual {p0, p1}, Lio/flutter/view/i;->createAccessibilityNodeInfo(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    return-object p1

    .line 32
    :cond_2
    iget-object p1, p0, Lio/flutter/view/i;->i:Lio/flutter/view/h;

    .line 33
    .line 34
    if-eqz p1, :cond_3

    .line 35
    .line 36
    iget p1, p1, Lio/flutter/view/h;->b:I

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lio/flutter/view/i;->createAccessibilityNodeInfo(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    return-object p1

    .line 43
    :cond_3
    iget-object p1, p0, Lio/flutter/view/i;->j:Ljava/lang/Integer;

    .line 44
    .line 45
    if-eqz p1, :cond_4

    .line 46
    .line 47
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    invoke-virtual {p0, p1}, Lio/flutter/view/i;->createAccessibilityNodeInfo(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    return-object p1

    .line 56
    :cond_4
    :goto_0
    const/4 p1, 0x0

    .line 57
    return-object p1
.end method

.method public final g(Lio/flutter/view/h;ILandroid/os/Bundle;Z)Z
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v3, p3

    .line 8
    .line 9
    const-string v4, "ACTION_ARGUMENT_MOVEMENT_GRANULARITY_INT"

    .line 10
    .line 11
    invoke-virtual {v3, v4}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    const-string v5, "ACTION_ARGUMENT_EXTEND_SELECTION_BOOLEAN"

    .line 16
    .line 17
    invoke-virtual {v3, v5}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    iget v5, v1, Lio/flutter/view/h;->g:I

    .line 22
    .line 23
    iget v6, v1, Lio/flutter/view/h;->h:I

    .line 24
    .line 25
    const/16 v7, 0x10

    .line 26
    .line 27
    const/16 v8, 0x8

    .line 28
    .line 29
    const/4 v9, 0x4

    .line 30
    const/4 v10, 0x2

    .line 31
    const/4 v11, 0x0

    .line 32
    const/4 v12, 0x1

    .line 33
    if-ltz v6, :cond_d

    .line 34
    .line 35
    if-gez v5, :cond_0

    .line 36
    .line 37
    goto/16 :goto_1

    .line 38
    .line 39
    :cond_0
    if-eq v4, v12, :cond_a

    .line 40
    .line 41
    if-eq v4, v10, :cond_7

    .line 42
    .line 43
    if-eq v4, v9, :cond_3

    .line 44
    .line 45
    if-eq v4, v8, :cond_1

    .line 46
    .line 47
    if-eq v4, v7, :cond_1

    .line 48
    .line 49
    goto/16 :goto_0

    .line 50
    .line 51
    :cond_1
    if-eqz p4, :cond_2

    .line 52
    .line 53
    iget-object v13, v1, Lio/flutter/view/h;->r:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    .line 56
    .line 57
    .line 58
    move-result v13

    .line 59
    iput v13, v1, Lio/flutter/view/h;->h:I

    .line 60
    .line 61
    goto/16 :goto_0

    .line 62
    .line 63
    :cond_2
    iput v11, v1, Lio/flutter/view/h;->h:I

    .line 64
    .line 65
    goto/16 :goto_0

    .line 66
    .line 67
    :cond_3
    if-eqz p4, :cond_5

    .line 68
    .line 69
    iget-object v13, v1, Lio/flutter/view/h;->r:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    .line 72
    .line 73
    .line 74
    move-result v13

    .line 75
    if-ge v6, v13, :cond_5

    .line 76
    .line 77
    const-string v13, "(?!^)(\\n)"

    .line 78
    .line 79
    invoke-static {v13}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 80
    .line 81
    .line 82
    move-result-object v13

    .line 83
    iget-object v14, v1, Lio/flutter/view/h;->r:Ljava/lang/String;

    .line 84
    .line 85
    iget v15, v1, Lio/flutter/view/h;->h:I

    .line 86
    .line 87
    invoke-virtual {v14, v15}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v14

    .line 91
    invoke-virtual {v13, v14}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 92
    .line 93
    .line 94
    move-result-object v13

    .line 95
    invoke-virtual {v13}, Ljava/util/regex/Matcher;->find()Z

    .line 96
    .line 97
    .line 98
    move-result v14

    .line 99
    if-eqz v14, :cond_4

    .line 100
    .line 101
    invoke-virtual {v13, v12}, Ljava/util/regex/Matcher;->start(I)I

    .line 102
    .line 103
    .line 104
    move-result v13

    .line 105
    iget v14, v1, Lio/flutter/view/h;->h:I

    .line 106
    .line 107
    add-int/2addr v14, v13

    .line 108
    iput v14, v1, Lio/flutter/view/h;->h:I

    .line 109
    .line 110
    goto/16 :goto_0

    .line 111
    .line 112
    :cond_4
    iget-object v13, v1, Lio/flutter/view/h;->r:Ljava/lang/String;

    .line 113
    .line 114
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    .line 115
    .line 116
    .line 117
    move-result v13

    .line 118
    iput v13, v1, Lio/flutter/view/h;->h:I

    .line 119
    .line 120
    goto/16 :goto_0

    .line 121
    .line 122
    :cond_5
    if-nez p4, :cond_c

    .line 123
    .line 124
    iget v13, v1, Lio/flutter/view/h;->h:I

    .line 125
    .line 126
    if-lez v13, :cond_c

    .line 127
    .line 128
    const-string v13, "(?s:.*)(\\n)"

    .line 129
    .line 130
    invoke-static {v13}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 131
    .line 132
    .line 133
    move-result-object v13

    .line 134
    iget-object v14, v1, Lio/flutter/view/h;->r:Ljava/lang/String;

    .line 135
    .line 136
    iget v15, v1, Lio/flutter/view/h;->h:I

    .line 137
    .line 138
    invoke-virtual {v14, v11, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v14

    .line 142
    invoke-virtual {v13, v14}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 143
    .line 144
    .line 145
    move-result-object v13

    .line 146
    invoke-virtual {v13}, Ljava/util/regex/Matcher;->find()Z

    .line 147
    .line 148
    .line 149
    move-result v14

    .line 150
    if-eqz v14, :cond_6

    .line 151
    .line 152
    invoke-virtual {v13, v12}, Ljava/util/regex/Matcher;->start(I)I

    .line 153
    .line 154
    .line 155
    move-result v13

    .line 156
    iput v13, v1, Lio/flutter/view/h;->h:I

    .line 157
    .line 158
    goto/16 :goto_0

    .line 159
    .line 160
    :cond_6
    iput v11, v1, Lio/flutter/view/h;->h:I

    .line 161
    .line 162
    goto/16 :goto_0

    .line 163
    .line 164
    :cond_7
    if-eqz p4, :cond_9

    .line 165
    .line 166
    iget-object v13, v1, Lio/flutter/view/h;->r:Ljava/lang/String;

    .line 167
    .line 168
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    .line 169
    .line 170
    .line 171
    move-result v13

    .line 172
    if-ge v6, v13, :cond_9

    .line 173
    .line 174
    const-string v13, "\\p{L}(\\b)"

    .line 175
    .line 176
    invoke-static {v13}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 177
    .line 178
    .line 179
    move-result-object v13

    .line 180
    iget-object v14, v1, Lio/flutter/view/h;->r:Ljava/lang/String;

    .line 181
    .line 182
    iget v15, v1, Lio/flutter/view/h;->h:I

    .line 183
    .line 184
    invoke-virtual {v14, v15}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v14

    .line 188
    invoke-virtual {v13, v14}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 189
    .line 190
    .line 191
    move-result-object v13

    .line 192
    invoke-virtual {v13}, Ljava/util/regex/Matcher;->find()Z

    .line 193
    .line 194
    .line 195
    invoke-virtual {v13}, Ljava/util/regex/Matcher;->find()Z

    .line 196
    .line 197
    .line 198
    move-result v14

    .line 199
    if-eqz v14, :cond_8

    .line 200
    .line 201
    invoke-virtual {v13, v12}, Ljava/util/regex/Matcher;->start(I)I

    .line 202
    .line 203
    .line 204
    move-result v13

    .line 205
    iget v14, v1, Lio/flutter/view/h;->h:I

    .line 206
    .line 207
    add-int/2addr v14, v13

    .line 208
    iput v14, v1, Lio/flutter/view/h;->h:I

    .line 209
    .line 210
    goto :goto_0

    .line 211
    :cond_8
    iget-object v13, v1, Lio/flutter/view/h;->r:Ljava/lang/String;

    .line 212
    .line 213
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    .line 214
    .line 215
    .line 216
    move-result v13

    .line 217
    iput v13, v1, Lio/flutter/view/h;->h:I

    .line 218
    .line 219
    goto :goto_0

    .line 220
    :cond_9
    if-nez p4, :cond_c

    .line 221
    .line 222
    iget v13, v1, Lio/flutter/view/h;->h:I

    .line 223
    .line 224
    if-lez v13, :cond_c

    .line 225
    .line 226
    const-string v13, "(?s:.*)(\\b)\\p{L}"

    .line 227
    .line 228
    invoke-static {v13}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 229
    .line 230
    .line 231
    move-result-object v13

    .line 232
    iget-object v14, v1, Lio/flutter/view/h;->r:Ljava/lang/String;

    .line 233
    .line 234
    iget v15, v1, Lio/flutter/view/h;->h:I

    .line 235
    .line 236
    invoke-virtual {v14, v11, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v14

    .line 240
    invoke-virtual {v13, v14}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 241
    .line 242
    .line 243
    move-result-object v13

    .line 244
    invoke-virtual {v13}, Ljava/util/regex/Matcher;->find()Z

    .line 245
    .line 246
    .line 247
    move-result v14

    .line 248
    if-eqz v14, :cond_c

    .line 249
    .line 250
    invoke-virtual {v13, v12}, Ljava/util/regex/Matcher;->start(I)I

    .line 251
    .line 252
    .line 253
    move-result v13

    .line 254
    iput v13, v1, Lio/flutter/view/h;->h:I

    .line 255
    .line 256
    goto :goto_0

    .line 257
    :cond_a
    if-eqz p4, :cond_b

    .line 258
    .line 259
    iget-object v13, v1, Lio/flutter/view/h;->r:Ljava/lang/String;

    .line 260
    .line 261
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    .line 262
    .line 263
    .line 264
    move-result v13

    .line 265
    if-ge v6, v13, :cond_b

    .line 266
    .line 267
    iget v13, v1, Lio/flutter/view/h;->h:I

    .line 268
    .line 269
    add-int/2addr v13, v12

    .line 270
    iput v13, v1, Lio/flutter/view/h;->h:I

    .line 271
    .line 272
    goto :goto_0

    .line 273
    :cond_b
    if-nez p4, :cond_c

    .line 274
    .line 275
    iget v13, v1, Lio/flutter/view/h;->h:I

    .line 276
    .line 277
    if-lez v13, :cond_c

    .line 278
    .line 279
    sub-int/2addr v13, v12

    .line 280
    iput v13, v1, Lio/flutter/view/h;->h:I

    .line 281
    .line 282
    :cond_c
    :goto_0
    if-nez v3, :cond_d

    .line 283
    .line 284
    iget v13, v1, Lio/flutter/view/h;->h:I

    .line 285
    .line 286
    iput v13, v1, Lio/flutter/view/h;->g:I

    .line 287
    .line 288
    :cond_d
    :goto_1
    iget v13, v1, Lio/flutter/view/h;->g:I

    .line 289
    .line 290
    if-ne v5, v13, :cond_e

    .line 291
    .line 292
    iget v5, v1, Lio/flutter/view/h;->h:I

    .line 293
    .line 294
    if-eq v6, v5, :cond_10

    .line 295
    .line 296
    :cond_e
    iget-object v5, v1, Lio/flutter/view/h;->r:Ljava/lang/String;

    .line 297
    .line 298
    if-eqz v5, :cond_f

    .line 299
    .line 300
    goto :goto_2

    .line 301
    :cond_f
    const-string v5, ""

    .line 302
    .line 303
    :goto_2
    iget v6, v1, Lio/flutter/view/h;->b:I

    .line 304
    .line 305
    const/16 v13, 0x2000

    .line 306
    .line 307
    invoke-virtual {v0, v6, v13}, Lio/flutter/view/i;->e(II)Landroid/view/accessibility/AccessibilityEvent;

    .line 308
    .line 309
    .line 310
    move-result-object v6

    .line 311
    invoke-virtual {v6}, Landroid/view/accessibility/AccessibilityRecord;->getText()Ljava/util/List;

    .line 312
    .line 313
    .line 314
    move-result-object v13

    .line 315
    invoke-interface {v13, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 316
    .line 317
    .line 318
    iget v13, v1, Lio/flutter/view/h;->g:I

    .line 319
    .line 320
    invoke-virtual {v6, v13}, Landroid/view/accessibility/AccessibilityRecord;->setFromIndex(I)V

    .line 321
    .line 322
    .line 323
    iget v13, v1, Lio/flutter/view/h;->h:I

    .line 324
    .line 325
    invoke-virtual {v6, v13}, Landroid/view/accessibility/AccessibilityRecord;->setToIndex(I)V

    .line 326
    .line 327
    .line 328
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 329
    .line 330
    .line 331
    move-result v5

    .line 332
    invoke-virtual {v6, v5}, Landroid/view/accessibility/AccessibilityRecord;->setItemCount(I)V

    .line 333
    .line 334
    .line 335
    invoke-virtual {v0, v6}, Lio/flutter/view/i;->i(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 336
    .line 337
    .line 338
    :cond_10
    iget-object v5, v0, Lio/flutter/view/i;->b:LB2/a;

    .line 339
    .line 340
    if-eq v4, v12, :cond_14

    .line 341
    .line 342
    if-eq v4, v10, :cond_12

    .line 343
    .line 344
    if-eq v4, v9, :cond_11

    .line 345
    .line 346
    if-eq v4, v8, :cond_11

    .line 347
    .line 348
    if-eq v4, v7, :cond_11

    .line 349
    .line 350
    goto :goto_3

    .line 351
    :cond_11
    return v12

    .line 352
    :cond_12
    if-eqz p4, :cond_13

    .line 353
    .line 354
    sget-object v4, Lio/flutter/view/f;->y:Lio/flutter/view/f;

    .line 355
    .line 356
    invoke-static {v1, v4}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 357
    .line 358
    .line 359
    move-result v6

    .line 360
    if-eqz v6, :cond_13

    .line 361
    .line 362
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 363
    .line 364
    .line 365
    move-result-object v1

    .line 366
    invoke-virtual {v5, v2, v4, v1}, LB2/a;->r(ILio/flutter/view/f;Ljava/io/Serializable;)V

    .line 367
    .line 368
    .line 369
    return v12

    .line 370
    :cond_13
    if-nez p4, :cond_16

    .line 371
    .line 372
    sget-object v4, Lio/flutter/view/f;->z:Lio/flutter/view/f;

    .line 373
    .line 374
    invoke-static {v1, v4}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 375
    .line 376
    .line 377
    move-result v1

    .line 378
    if-eqz v1, :cond_16

    .line 379
    .line 380
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 381
    .line 382
    .line 383
    move-result-object v1

    .line 384
    invoke-virtual {v5, v2, v4, v1}, LB2/a;->r(ILio/flutter/view/f;Ljava/io/Serializable;)V

    .line 385
    .line 386
    .line 387
    return v12

    .line 388
    :cond_14
    if-eqz p4, :cond_15

    .line 389
    .line 390
    sget-object v4, Lio/flutter/view/f;->o:Lio/flutter/view/f;

    .line 391
    .line 392
    invoke-static {v1, v4}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 393
    .line 394
    .line 395
    move-result v6

    .line 396
    if-eqz v6, :cond_15

    .line 397
    .line 398
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 399
    .line 400
    .line 401
    move-result-object v1

    .line 402
    invoke-virtual {v5, v2, v4, v1}, LB2/a;->r(ILio/flutter/view/f;Ljava/io/Serializable;)V

    .line 403
    .line 404
    .line 405
    return v12

    .line 406
    :cond_15
    if-nez p4, :cond_16

    .line 407
    .line 408
    sget-object v4, Lio/flutter/view/f;->p:Lio/flutter/view/f;

    .line 409
    .line 410
    invoke-static {v1, v4}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 411
    .line 412
    .line 413
    move-result v1

    .line 414
    if-eqz v1, :cond_16

    .line 415
    .line 416
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 417
    .line 418
    .line 419
    move-result-object v1

    .line 420
    invoke-virtual {v5, v2, v4, v1}, LB2/a;->r(ILio/flutter/view/f;Ljava/io/Serializable;)V

    .line 421
    .line 422
    .line 423
    return v12

    .line 424
    :cond_16
    :goto_3
    return v11
.end method

.method public final h(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lio/flutter/view/i;->c:Landroid/view/accessibility/AccessibilityManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0, p1, p2}, Lio/flutter/view/i;->e(II)Landroid/view/accessibility/AccessibilityEvent;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Lio/flutter/view/i;->i(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final i(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lio/flutter/view/i;->c:Landroid/view/accessibility/AccessibilityManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lio/flutter/view/i;->a:Landroid/view/View;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v1, v0, p1}, Landroid/view/ViewParent;->requestSendAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final j(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lio/flutter/view/i;->t:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-boolean p1, p0, Lio/flutter/view/i;->t:Z

    .line 7
    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    iget p1, p0, Lio/flutter/view/i;->l:I

    .line 11
    .line 12
    or-int/lit8 p1, p1, 0x1

    .line 13
    .line 14
    iput p1, p0, Lio/flutter/view/i;->l:I

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    iget p1, p0, Lio/flutter/view/i;->l:I

    .line 18
    .line 19
    and-int/lit8 p1, p1, -0x2

    .line 20
    .line 21
    iput p1, p0, Lio/flutter/view/i;->l:I

    .line 22
    .line 23
    :goto_0
    iget p1, p0, Lio/flutter/view/i;->l:I

    .line 24
    .line 25
    iget-object v0, p0, Lio/flutter/view/i;->b:LB2/a;

    .line 26
    .line 27
    iget-object v0, v0, LB2/a;->g:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast v0, Lio/flutter/embedding/engine/FlutterJNI;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Lio/flutter/embedding/engine/FlutterJNI;->setAccessibilityFeatures(I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final k(Lio/flutter/view/h;)Z
    .locals 5

    .line 1
    iget v0, p1, Lio/flutter/view/h;->j:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-le v0, v2, :cond_7

    .line 6
    .line 7
    iget-object v0, p0, Lio/flutter/view/i;->i:Lio/flutter/view/h;

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    if-eqz v0, :cond_3

    .line 11
    .line 12
    iget-object v0, v0, Lio/flutter/view/h;->S:Lio/flutter/view/h;

    .line 13
    .line 14
    :goto_0
    if-eqz v0, :cond_2

    .line 15
    .line 16
    if-ne v0, p1, :cond_0

    .line 17
    .line 18
    move v4, v2

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    move v4, v1

    .line 21
    :goto_1
    if-eqz v4, :cond_1

    .line 22
    .line 23
    goto :goto_2

    .line 24
    :cond_1
    iget-object v0, v0, Lio/flutter/view/h;->S:Lio/flutter/view/h;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_2
    move-object v0, v3

    .line 28
    :goto_2
    if-eqz v0, :cond_3

    .line 29
    .line 30
    return v2

    .line 31
    :cond_3
    iget-object p1, p0, Lio/flutter/view/i;->i:Lio/flutter/view/h;

    .line 32
    .line 33
    new-instance v0, Lio/flutter/view/b;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 36
    .line 37
    .line 38
    if-eqz p1, :cond_6

    .line 39
    .line 40
    iget-object p1, p1, Lio/flutter/view/h;->S:Lio/flutter/view/h;

    .line 41
    .line 42
    :goto_3
    if-eqz p1, :cond_5

    .line 43
    .line 44
    invoke-virtual {v0, p1}, Lio/flutter/view/b;->test(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    if-eqz v4, :cond_4

    .line 49
    .line 50
    move-object v3, p1

    .line 51
    goto :goto_4

    .line 52
    :cond_4
    iget-object p1, p1, Lio/flutter/view/h;->S:Lio/flutter/view/h;

    .line 53
    .line 54
    goto :goto_3

    .line 55
    :cond_5
    :goto_4
    if-eqz v3, :cond_6

    .line 56
    .line 57
    goto :goto_5

    .line 58
    :cond_6
    return v2

    .line 59
    :cond_7
    :goto_5
    return v1
.end method

.method public final performAction(IILandroid/os/Bundle;)Z
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    const/high16 v1, 0x10000

    .line 3
    .line 4
    if-lt p1, v1, :cond_1

    .line 5
    .line 6
    iget-object v1, p0, Lio/flutter/view/i;->d:Lio/flutter/view/AccessibilityViewEmbedder;

    .line 7
    .line 8
    invoke-virtual {v1, p1, p2, p3}, Lio/flutter/view/AccessibilityViewEmbedder;->performAction(IILandroid/os/Bundle;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    const/16 p3, 0x80

    .line 15
    .line 16
    if-ne p2, p3, :cond_0

    .line 17
    .line 18
    iput-object v0, p0, Lio/flutter/view/i;->j:Ljava/lang/Integer;

    .line 19
    .line 20
    :cond_0
    return p1

    .line 21
    :cond_1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget-object v3, p0, Lio/flutter/view/i;->g:Ljava/util/HashMap;

    .line 26
    .line 27
    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Lio/flutter/view/h;

    .line 32
    .line 33
    const/4 v4, 0x0

    .line 34
    if-nez v2, :cond_2

    .line 35
    .line 36
    goto/16 :goto_2

    .line 37
    .line 38
    :cond_2
    sget-object v5, Lio/flutter/view/f;->l:Lio/flutter/view/f;

    .line 39
    .line 40
    sget-object v6, Lio/flutter/view/f;->m:Lio/flutter/view/f;

    .line 41
    .line 42
    const/4 v7, 0x4

    .line 43
    const/4 v8, 0x1

    .line 44
    iget-object v9, p0, Lio/flutter/view/i;->b:LB2/a;

    .line 45
    .line 46
    sparse-switch p2, :sswitch_data_0

    .line 47
    .line 48
    .line 49
    const p3, 0xff00001

    .line 50
    .line 51
    .line 52
    sub-int/2addr p2, p3

    .line 53
    iget-object p3, p0, Lio/flutter/view/i;->h:Ljava/util/HashMap;

    .line 54
    .line 55
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    invoke-virtual {p3, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    check-cast p2, Lio/flutter/view/g;

    .line 64
    .line 65
    if-eqz p2, :cond_9

    .line 66
    .line 67
    iget p2, p2, Lio/flutter/view/g;->b:I

    .line 68
    .line 69
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    sget-object p3, Lio/flutter/view/f;->w:Lio/flutter/view/f;

    .line 74
    .line 75
    invoke-virtual {v9, p1, p3, p2}, LB2/a;->r(ILio/flutter/view/f;Ljava/io/Serializable;)V

    .line 76
    .line 77
    .line 78
    return v8

    .line 79
    :sswitch_0
    sget-object p2, Lio/flutter/view/f;->n:Lio/flutter/view/f;

    .line 80
    .line 81
    invoke-virtual {v9, p1, p2}, LB2/a;->q(ILio/flutter/view/f;)V

    .line 82
    .line 83
    .line 84
    return v8

    .line 85
    :sswitch_1
    if-eqz p3, :cond_3

    .line 86
    .line 87
    const-string p2, "ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE"

    .line 88
    .line 89
    invoke-virtual {p3, p2}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eqz v1, :cond_3

    .line 94
    .line 95
    invoke-virtual {p3, p2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    goto :goto_0

    .line 100
    :cond_3
    const-string p2, ""

    .line 101
    .line 102
    :goto_0
    sget-object p3, Lio/flutter/view/f;->A:Lio/flutter/view/f;

    .line 103
    .line 104
    invoke-virtual {v9, p1, p3, p2}, LB2/a;->r(ILio/flutter/view/f;Ljava/io/Serializable;)V

    .line 105
    .line 106
    .line 107
    iput-object p2, v2, Lio/flutter/view/h;->r:Ljava/lang/String;

    .line 108
    .line 109
    iput-object v0, v2, Lio/flutter/view/h;->s:Ljava/util/List;

    .line 110
    .line 111
    return v8

    .line 112
    :sswitch_2
    sget-object p2, Lio/flutter/view/f;->x:Lio/flutter/view/f;

    .line 113
    .line 114
    invoke-virtual {v9, p1, p2}, LB2/a;->q(ILio/flutter/view/f;)V

    .line 115
    .line 116
    .line 117
    return v8

    .line 118
    :sswitch_3
    sget-object p2, Lio/flutter/view/f;->C:Lio/flutter/view/f;

    .line 119
    .line 120
    invoke-virtual {v9, p1, p2}, LB2/a;->q(ILio/flutter/view/f;)V

    .line 121
    .line 122
    .line 123
    return v8

    .line 124
    :sswitch_4
    sget-object p2, Lio/flutter/view/f;->B:Lio/flutter/view/f;

    .line 125
    .line 126
    invoke-virtual {v9, p1, p2}, LB2/a;->q(ILio/flutter/view/f;)V

    .line 127
    .line 128
    .line 129
    return v8

    .line 130
    :sswitch_5
    new-instance p2, Ljava/util/HashMap;

    .line 131
    .line 132
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 133
    .line 134
    .line 135
    const-string v0, "extent"

    .line 136
    .line 137
    const-string v1, "base"

    .line 138
    .line 139
    if-eqz p3, :cond_4

    .line 140
    .line 141
    const-string v4, "ACTION_ARGUMENT_SELECTION_START_INT"

    .line 142
    .line 143
    invoke-virtual {p3, v4}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 144
    .line 145
    .line 146
    move-result v5

    .line 147
    if-eqz v5, :cond_4

    .line 148
    .line 149
    const-string v5, "ACTION_ARGUMENT_SELECTION_END_INT"

    .line 150
    .line 151
    invoke-virtual {p3, v5}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 152
    .line 153
    .line 154
    move-result v6

    .line 155
    if-eqz v6, :cond_4

    .line 156
    .line 157
    invoke-virtual {p3, v4}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 158
    .line 159
    .line 160
    move-result v2

    .line 161
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    invoke-virtual {p2, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    invoke-virtual {p3, v5}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 169
    .line 170
    .line 171
    move-result p3

    .line 172
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 173
    .line 174
    .line 175
    move-result-object p3

    .line 176
    invoke-virtual {p2, v0, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    goto :goto_1

    .line 180
    :cond_4
    iget p3, v2, Lio/flutter/view/h;->h:I

    .line 181
    .line 182
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 183
    .line 184
    .line 185
    move-result-object p3

    .line 186
    invoke-virtual {p2, v1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    iget p3, v2, Lio/flutter/view/h;->h:I

    .line 190
    .line 191
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 192
    .line 193
    .line 194
    move-result-object p3

    .line 195
    invoke-virtual {p2, v0, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    :goto_1
    sget-object p3, Lio/flutter/view/f;->q:Lio/flutter/view/f;

    .line 199
    .line 200
    invoke-virtual {v9, p1, p3, p2}, LB2/a;->r(ILio/flutter/view/f;Ljava/io/Serializable;)V

    .line 201
    .line 202
    .line 203
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    invoke-virtual {v3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    check-cast p1, Lio/flutter/view/h;

    .line 212
    .line 213
    invoke-virtual {p2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object p3

    .line 217
    check-cast p3, Ljava/lang/Integer;

    .line 218
    .line 219
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 220
    .line 221
    .line 222
    move-result p3

    .line 223
    iput p3, p1, Lio/flutter/view/h;->g:I

    .line 224
    .line 225
    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    move-result-object p2

    .line 229
    check-cast p2, Ljava/lang/Integer;

    .line 230
    .line 231
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 232
    .line 233
    .line 234
    move-result p2

    .line 235
    iput p2, p1, Lio/flutter/view/h;->h:I

    .line 236
    .line 237
    return v8

    .line 238
    :sswitch_6
    sget-object p2, Lio/flutter/view/f;->s:Lio/flutter/view/f;

    .line 239
    .line 240
    invoke-virtual {v9, p1, p2}, LB2/a;->q(ILio/flutter/view/f;)V

    .line 241
    .line 242
    .line 243
    return v8

    .line 244
    :sswitch_7
    sget-object p2, Lio/flutter/view/f;->t:Lio/flutter/view/f;

    .line 245
    .line 246
    invoke-virtual {v9, p1, p2}, LB2/a;->q(ILio/flutter/view/f;)V

    .line 247
    .line 248
    .line 249
    return v8

    .line 250
    :sswitch_8
    sget-object p2, Lio/flutter/view/f;->r:Lio/flutter/view/f;

    .line 251
    .line 252
    invoke-virtual {v9, p1, p2}, LB2/a;->q(ILio/flutter/view/f;)V

    .line 253
    .line 254
    .line 255
    return v8

    .line 256
    :sswitch_9
    sget-object p2, Lio/flutter/view/f;->k:Lio/flutter/view/f;

    .line 257
    .line 258
    invoke-static {v2, p2}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 259
    .line 260
    .line 261
    move-result p3

    .line 262
    if-eqz p3, :cond_5

    .line 263
    .line 264
    invoke-virtual {v9, p1, p2}, LB2/a;->q(ILio/flutter/view/f;)V

    .line 265
    .line 266
    .line 267
    return v8

    .line 268
    :cond_5
    sget-object p2, Lio/flutter/view/f;->i:Lio/flutter/view/f;

    .line 269
    .line 270
    invoke-static {v2, p2}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 271
    .line 272
    .line 273
    move-result p3

    .line 274
    if-eqz p3, :cond_6

    .line 275
    .line 276
    invoke-virtual {v9, p1, p2}, LB2/a;->q(ILio/flutter/view/f;)V

    .line 277
    .line 278
    .line 279
    return v8

    .line 280
    :cond_6
    invoke-static {v2, v6}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 281
    .line 282
    .line 283
    move-result p2

    .line 284
    if-eqz p2, :cond_9

    .line 285
    .line 286
    iget-object p2, v2, Lio/flutter/view/h;->v:Ljava/lang/String;

    .line 287
    .line 288
    iput-object p2, v2, Lio/flutter/view/h;->r:Ljava/lang/String;

    .line 289
    .line 290
    iget-object p2, v2, Lio/flutter/view/h;->w:Ljava/util/ArrayList;

    .line 291
    .line 292
    iput-object p2, v2, Lio/flutter/view/h;->s:Ljava/util/List;

    .line 293
    .line 294
    invoke-virtual {p0, p1, v7}, Lio/flutter/view/i;->h(II)V

    .line 295
    .line 296
    .line 297
    invoke-virtual {v9, p1, v6}, LB2/a;->q(ILio/flutter/view/f;)V

    .line 298
    .line 299
    .line 300
    return v8

    .line 301
    :sswitch_a
    sget-object p2, Lio/flutter/view/f;->j:Lio/flutter/view/f;

    .line 302
    .line 303
    invoke-static {v2, p2}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 304
    .line 305
    .line 306
    move-result p3

    .line 307
    if-eqz p3, :cond_7

    .line 308
    .line 309
    invoke-virtual {v9, p1, p2}, LB2/a;->q(ILio/flutter/view/f;)V

    .line 310
    .line 311
    .line 312
    return v8

    .line 313
    :cond_7
    sget-object p2, Lio/flutter/view/f;->h:Lio/flutter/view/f;

    .line 314
    .line 315
    invoke-static {v2, p2}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 316
    .line 317
    .line 318
    move-result p3

    .line 319
    if-eqz p3, :cond_8

    .line 320
    .line 321
    invoke-virtual {v9, p1, p2}, LB2/a;->q(ILio/flutter/view/f;)V

    .line 322
    .line 323
    .line 324
    return v8

    .line 325
    :cond_8
    invoke-static {v2, v5}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 326
    .line 327
    .line 328
    move-result p2

    .line 329
    if-eqz p2, :cond_9

    .line 330
    .line 331
    iget-object p2, v2, Lio/flutter/view/h;->t:Ljava/lang/String;

    .line 332
    .line 333
    iput-object p2, v2, Lio/flutter/view/h;->r:Ljava/lang/String;

    .line 334
    .line 335
    iget-object p2, v2, Lio/flutter/view/h;->u:Ljava/util/ArrayList;

    .line 336
    .line 337
    iput-object p2, v2, Lio/flutter/view/h;->s:Ljava/util/List;

    .line 338
    .line 339
    invoke-virtual {p0, p1, v7}, Lio/flutter/view/i;->h(II)V

    .line 340
    .line 341
    .line 342
    invoke-virtual {v9, p1, v5}, LB2/a;->q(ILio/flutter/view/f;)V

    .line 343
    .line 344
    .line 345
    return v8

    .line 346
    :cond_9
    :goto_2
    return v4

    .line 347
    :sswitch_b
    invoke-virtual {p0, v2, p1, p3, v4}, Lio/flutter/view/i;->g(Lio/flutter/view/h;ILandroid/os/Bundle;Z)Z

    .line 348
    .line 349
    .line 350
    move-result p1

    .line 351
    return p1

    .line 352
    :sswitch_c
    invoke-virtual {p0, v2, p1, p3, v8}, Lio/flutter/view/i;->g(Lio/flutter/view/h;ILandroid/os/Bundle;Z)Z

    .line 353
    .line 354
    .line 355
    move-result p1

    .line 356
    return p1

    .line 357
    :sswitch_d
    iget-object p2, p0, Lio/flutter/view/i;->i:Lio/flutter/view/h;

    .line 358
    .line 359
    if-eqz p2, :cond_a

    .line 360
    .line 361
    iget p2, p2, Lio/flutter/view/h;->b:I

    .line 362
    .line 363
    if-ne p2, p1, :cond_a

    .line 364
    .line 365
    iput-object v0, p0, Lio/flutter/view/i;->i:Lio/flutter/view/h;

    .line 366
    .line 367
    :cond_a
    iget-object p2, p0, Lio/flutter/view/i;->j:Ljava/lang/Integer;

    .line 368
    .line 369
    if-eqz p2, :cond_b

    .line 370
    .line 371
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 372
    .line 373
    .line 374
    move-result p2

    .line 375
    if-ne p2, p1, :cond_b

    .line 376
    .line 377
    iput-object v0, p0, Lio/flutter/view/i;->j:Ljava/lang/Integer;

    .line 378
    .line 379
    :cond_b
    sget-object p2, Lio/flutter/view/f;->v:Lio/flutter/view/f;

    .line 380
    .line 381
    invoke-virtual {v9, p1, p2}, LB2/a;->q(ILio/flutter/view/f;)V

    .line 382
    .line 383
    .line 384
    invoke-virtual {p0, p1, v1}, Lio/flutter/view/i;->h(II)V

    .line 385
    .line 386
    .line 387
    return v8

    .line 388
    :sswitch_e
    iget-object p2, p0, Lio/flutter/view/i;->i:Lio/flutter/view/h;

    .line 389
    .line 390
    if-nez p2, :cond_c

    .line 391
    .line 392
    iget-object p2, p0, Lio/flutter/view/i;->a:Landroid/view/View;

    .line 393
    .line 394
    invoke-virtual {p2}, Landroid/view/View;->invalidate()V

    .line 395
    .line 396
    .line 397
    :cond_c
    iput-object v2, p0, Lio/flutter/view/i;->i:Lio/flutter/view/h;

    .line 398
    .line 399
    sget-object p2, Lio/flutter/view/f;->u:Lio/flutter/view/f;

    .line 400
    .line 401
    invoke-virtual {v9, p1, p2}, LB2/a;->q(ILio/flutter/view/f;)V

    .line 402
    .line 403
    .line 404
    new-instance p2, Ljava/util/HashMap;

    .line 405
    .line 406
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 407
    .line 408
    .line 409
    const-string p3, "type"

    .line 410
    .line 411
    const-string v1, "didGainFocus"

    .line 412
    .line 413
    invoke-virtual {p2, p3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 414
    .line 415
    .line 416
    iget p3, v2, Lio/flutter/view/h;->b:I

    .line 417
    .line 418
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 419
    .line 420
    .line 421
    move-result-object p3

    .line 422
    const-string v1, "nodeId"

    .line 423
    .line 424
    invoke-virtual {p2, v1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 425
    .line 426
    .line 427
    iget-object p3, v9, LB2/a;->f:Ljava/lang/Object;

    .line 428
    .line 429
    check-cast p3, LV1/y;

    .line 430
    .line 431
    invoke-virtual {p3, p2, v0}, LV1/y;->v(Ljava/io/Serializable;Lk3/c;)V

    .line 432
    .line 433
    .line 434
    const p2, 0x8000

    .line 435
    .line 436
    .line 437
    invoke-virtual {p0, p1, p2}, Lio/flutter/view/i;->h(II)V

    .line 438
    .line 439
    .line 440
    invoke-static {v2, v5}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 441
    .line 442
    .line 443
    move-result p2

    .line 444
    if-nez p2, :cond_e

    .line 445
    .line 446
    invoke-static {v2, v6}, Lio/flutter/view/h;->a(Lio/flutter/view/h;Lio/flutter/view/f;)Z

    .line 447
    .line 448
    .line 449
    move-result p2

    .line 450
    if-eqz p2, :cond_d

    .line 451
    .line 452
    goto :goto_3

    .line 453
    :cond_d
    return v8

    .line 454
    :cond_e
    :goto_3
    invoke-virtual {p0, p1, v7}, Lio/flutter/view/i;->h(II)V

    .line 455
    .line 456
    .line 457
    return v8

    .line 458
    :sswitch_f
    sget-object p2, Lio/flutter/view/f;->g:Lio/flutter/view/f;

    .line 459
    .line 460
    invoke-virtual {v9, p1, p2}, LB2/a;->q(ILio/flutter/view/f;)V

    .line 461
    .line 462
    .line 463
    return v8

    .line 464
    :sswitch_10
    sget-object p2, Lio/flutter/view/f;->f:Lio/flutter/view/f;

    .line 465
    .line 466
    invoke-virtual {v9, p1, p2}, LB2/a;->q(ILio/flutter/view/f;)V

    .line 467
    .line 468
    .line 469
    return v8

    .line 470
    nop

    .line 471
    :sswitch_data_0
    .sparse-switch
        0x10 -> :sswitch_10
        0x20 -> :sswitch_f
        0x40 -> :sswitch_e
        0x80 -> :sswitch_d
        0x100 -> :sswitch_c
        0x200 -> :sswitch_b
        0x1000 -> :sswitch_a
        0x2000 -> :sswitch_9
        0x4000 -> :sswitch_8
        0x8000 -> :sswitch_7
        0x10000 -> :sswitch_6
        0x20000 -> :sswitch_5
        0x40000 -> :sswitch_4
        0x80000 -> :sswitch_3
        0x100000 -> :sswitch_2
        0x200000 -> :sswitch_1
        0x1020036 -> :sswitch_0
    .end sparse-switch
.end method
