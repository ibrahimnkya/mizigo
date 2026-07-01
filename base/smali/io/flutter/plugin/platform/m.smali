.class public final Lio/flutter/plugin/platform/m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj3/i;
.implements Lio/flutter/plugin/platform/g;


# instance fields
.field public final synthetic e:I

.field public f:Ljava/lang/Object;


# direct methods
.method public constructor <init>(I)V
    .locals 0

    iput p1, p0, Lio/flutter/plugin/platform/m;->e:I

    packed-switch p1, :pswitch_data_0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    return-void

    .line 4
    :pswitch_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_0
    .end packed-switch
.end method

.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, Lio/flutter/plugin/platform/m;->e:I

    iput-object p2, p0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/view/TextureRegistry$SurfaceProducer;

    .line 4
    .line 5
    invoke-interface {v0, p1, p2}, Lio/flutter/view/TextureRegistry$SurfaceProducer;->setSize(II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/plugin/platform/p;

    .line 4
    .line 5
    iput-boolean p1, v0, Lio/flutter/plugin/platform/p;->v:Z

    .line 6
    .line 7
    return-void
.end method

.method public c(Lj3/c;)Ljava/lang/CharSequence;
    .locals 8

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LR/j;

    .line 4
    .line 5
    const-string v1, "PlatformPlugin"

    .line 6
    .line 7
    const-string v2, "Clipboard item contains a Uri with scheme \'"

    .line 8
    .line 9
    iget-object v0, v0, LR/j;->c:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Landroid/app/Activity;

    .line 12
    .line 13
    const-string v3, "clipboard"

    .line 14
    .line 15
    invoke-virtual {v0, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    check-cast v3, Landroid/content/ClipboardManager;

    .line 20
    .line 21
    invoke-virtual {v3}, Landroid/content/ClipboardManager;->hasPrimaryClip()Z

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    const/4 v5, 0x0

    .line 26
    if-nez v4, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    :try_start_0
    invoke-virtual {v3}, Landroid/content/ClipboardManager;->getPrimaryClip()Landroid/content/ClipData;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    if-nez v3, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    if-eqz p1, :cond_3

    .line 37
    .line 38
    sget-object v4, Lj3/c;->e:Lj3/c;

    .line 39
    .line 40
    if-ne p1, v4, :cond_2

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_2
    :goto_0
    return-object v5

    .line 44
    :catch_0
    move-exception p1

    .line 45
    goto :goto_2

    .line 46
    :catch_1
    move-exception p1

    .line 47
    goto :goto_3

    .line 48
    :cond_3
    :goto_1
    const/4 p1, 0x0

    .line 49
    invoke-virtual {v3, p1}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Landroid/content/ClipData$Item;->getText()Ljava/lang/CharSequence;

    .line 54
    .line 55
    .line 56
    move-result-object v3
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    if-nez v3, :cond_7

    .line 58
    .line 59
    :try_start_1
    invoke-virtual {p1}, Landroid/content/ClipData$Item;->getUri()Landroid/net/Uri;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    if-nez v4, :cond_4

    .line 64
    .line 65
    const-string p1, "Clipboard item contained no textual content nor a URI to retrieve it from."

    .line 66
    .line 67
    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    return-object v5

    .line 71
    :catch_2
    move-exception p1

    .line 72
    move-object v5, v3

    .line 73
    goto :goto_2

    .line 74
    :cond_4
    invoke-virtual {v4}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v6

    .line 78
    const-string v7, "content"

    .line 79
    .line 80
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v7

    .line 84
    if-nez v7, :cond_5

    .line 85
    .line 86
    new-instance p1, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string v0, "\'that is unhandled."

    .line 95
    .line 96
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    .line 105
    .line 106
    return-object v5

    .line 107
    :cond_5
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    const-string v6, "text/*"

    .line 112
    .line 113
    invoke-virtual {v2, v4, v6, v5}, Landroid/content/ContentResolver;->openTypedAssetFileDescriptor(Landroid/net/Uri;Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/res/AssetFileDescriptor;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    invoke-virtual {p1, v0}, Landroid/content/ClipData$Item;->coerceToText(Landroid/content/Context;)Ljava/lang/CharSequence;

    .line 118
    .line 119
    .line 120
    move-result-object p1
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 121
    if-eqz v2, :cond_6

    .line 122
    .line 123
    :try_start_2
    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    .line 124
    .line 125
    .line 126
    return-object p1

    .line 127
    :catch_3
    move-exception v0

    .line 128
    move-object v5, p1

    .line 129
    move-object p1, v0

    .line 130
    goto :goto_2

    .line 131
    :cond_6
    return-object p1

    .line 132
    :cond_7
    return-object v3

    .line 133
    :goto_2
    const-string v0, "Failed to close AssetFileDescriptor while trying to read text from URI."

    .line 134
    .line 135
    invoke-static {v1, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 136
    .line 137
    .line 138
    goto :goto_4

    .line 139
    :catch_4
    const-string p1, "Clipboard text was unable to be received from content URI."

    .line 140
    .line 141
    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    .line 143
    .line 144
    goto :goto_4

    .line 145
    :goto_3
    const-string v0, "Attempted to get clipboard data that requires additional permission(s).\nSee the exception details for which permission(s) are required, and consider adding them to your Android Manifest as described in:\nhttps://developer.android.com/guide/topics/permissions/overview"

    .line 146
    .line 147
    invoke-static {v1, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 148
    .line 149
    .line 150
    :goto_4
    return-object v5
.end method

.method public d(IDD)V
    .locals 2

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/plugin/platform/p;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lio/flutter/plugin/platform/p;->g(I)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v1, v0, Lio/flutter/plugin/platform/p;->s:Landroid/util/SparseArray;

    .line 13
    .line 14
    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Lio/flutter/plugin/platform/h;

    .line 19
    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    new-instance p2, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string p3, "Setting offset for unknown platform view with id: "

    .line 25
    .line 26
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const-string p2, "PlatformViewsController"

    .line 37
    .line 38
    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    invoke-virtual {v0, p2, p3}, Lio/flutter/plugin/platform/p;->o(D)I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    invoke-virtual {v0, p4, p5}, Lio/flutter/plugin/platform/p;->o(D)I

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    check-cast p3, Landroid/widget/FrameLayout$LayoutParams;

    .line 55
    .line 56
    iput p1, p3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 57
    .line 58
    iput p2, p3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 59
    .line 60
    invoke-virtual {v1, p3}, Lio/flutter/plugin/platform/h;->setLayoutParams(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public e(II)V
    .locals 3

    .line 1
    iget v0, p0, Lio/flutter/plugin/platform/m;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lio/flutter/plugin/platform/o;

    .line 9
    .line 10
    iget-object v0, v0, Lio/flutter/plugin/platform/o;->m:Landroid/util/SparseArray;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lio/flutter/plugin/platform/e;

    .line 17
    .line 18
    const-string v1, "PlatformViewsController2"

    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    new-instance p2, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v0, "Setting direction to an unknown view with id: "

    .line 25
    .line 26
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-interface {v0}, Lio/flutter/plugin/platform/e;->u()Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    new-instance p2, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v0, "Setting direction to a null view with id: "

    .line 49
    .line 50
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    invoke-virtual {v0, p2}, Landroid/view/View;->setLayoutDirection(I)V

    .line 65
    .line 66
    .line 67
    :goto_0
    return-void

    .line 68
    :pswitch_0
    iget-object v0, p0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 69
    .line 70
    check-cast v0, Lio/flutter/plugin/platform/p;

    .line 71
    .line 72
    if-eqz p2, :cond_3

    .line 73
    .line 74
    const/4 v1, 0x1

    .line 75
    if-ne p2, v1, :cond_2

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 79
    .line 80
    new-instance v1, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    const-string v2, "Trying to set unknown direction value: "

    .line 83
    .line 84
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string p2, "(view id: "

    .line 91
    .line 92
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    const-string p1, ")"

    .line 99
    .line 100
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    throw v0

    .line 111
    :cond_3
    :goto_1
    invoke-virtual {v0, p1}, Lio/flutter/plugin/platform/p;->g(I)Z

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    const-string v2, "PlatformViewsController"

    .line 116
    .line 117
    if-eqz v1, :cond_4

    .line 118
    .line 119
    iget-object v0, v0, Lio/flutter/plugin/platform/p;->n:Ljava/util/HashMap;

    .line 120
    .line 121
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    check-cast v0, Lio/flutter/plugin/platform/B;

    .line 130
    .line 131
    invoke-virtual {v0}, Lio/flutter/plugin/platform/B;->a()Landroid/view/View;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    goto :goto_2

    .line 136
    :cond_4
    iget-object v0, v0, Lio/flutter/plugin/platform/p;->p:Landroid/util/SparseArray;

    .line 137
    .line 138
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    check-cast v0, Lio/flutter/plugin/platform/e;

    .line 143
    .line 144
    if-nez v0, :cond_5

    .line 145
    .line 146
    new-instance p2, Ljava/lang/StringBuilder;

    .line 147
    .line 148
    const-string v0, "Setting direction to an unknown view with id: "

    .line 149
    .line 150
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    .line 162
    .line 163
    goto :goto_3

    .line 164
    :cond_5
    invoke-interface {v0}, Lio/flutter/plugin/platform/e;->u()Landroid/view/View;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    :goto_2
    if-nez v0, :cond_6

    .line 169
    .line 170
    new-instance p2, Ljava/lang/StringBuilder;

    .line 171
    .line 172
    const-string v0, "Setting direction to a null view with id: "

    .line 173
    .line 174
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    .line 186
    .line 187
    goto :goto_3

    .line 188
    :cond_6
    invoke-virtual {v0, p2}, Landroid/view/View;->setLayoutDirection(I)V

    .line 189
    .line 190
    .line 191
    :goto_3
    return-void

    .line 192
    nop

    .line 193
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public f(Lj3/h;Lj3/g;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    iget-object v3, v0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v3, Lio/flutter/plugin/platform/p;

    .line 10
    .line 11
    iget-wide v4, v1, Lj3/h;->b:D

    .line 12
    .line 13
    invoke-virtual {v3, v4, v5}, Lio/flutter/plugin/platform/p;->o(D)I

    .line 14
    .line 15
    .line 16
    move-result v8

    .line 17
    iget-wide v4, v1, Lj3/h;->c:D

    .line 18
    .line 19
    invoke-virtual {v3, v4, v5}, Lio/flutter/plugin/platform/p;->o(D)I

    .line 20
    .line 21
    .line 22
    move-result v9

    .line 23
    iget v1, v1, Lj3/h;->a:I

    .line 24
    .line 25
    invoke-virtual {v3, v1}, Lio/flutter/plugin/platform/p;->g(I)Z

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    if-eqz v4, :cond_6

    .line 30
    .line 31
    invoke-virtual {v3}, Lio/flutter/plugin/platform/p;->i()F

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    iget-object v5, v3, Lio/flutter/plugin/platform/p;->n:Ljava/util/HashMap;

    .line 36
    .line 37
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Lio/flutter/plugin/platform/B;

    .line 46
    .line 47
    iget-object v3, v3, Lio/flutter/plugin/platform/p;->k:Lio/flutter/plugin/editing/k;

    .line 48
    .line 49
    if-nez v3, :cond_0

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    iget-object v5, v3, Lio/flutter/plugin/editing/k;->e:LB2/e;

    .line 53
    .line 54
    iget v5, v5, LB2/e;->b:I

    .line 55
    .line 56
    const/4 v6, 0x3

    .line 57
    if-ne v5, v6, :cond_1

    .line 58
    .line 59
    const/4 v5, 0x1

    .line 60
    iput-boolean v5, v3, Lio/flutter/plugin/editing/k;->p:Z

    .line 61
    .line 62
    :cond_1
    iget-object v3, v1, Lio/flutter/plugin/platform/B;->a:Lio/flutter/plugin/platform/SingleViewPresentation;

    .line 63
    .line 64
    if-eqz v3, :cond_3

    .line 65
    .line 66
    invoke-virtual {v3}, Lio/flutter/plugin/platform/SingleViewPresentation;->getView()Lio/flutter/plugin/platform/e;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    if-nez v3, :cond_2

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_2
    iget-object v3, v1, Lio/flutter/plugin/platform/B;->a:Lio/flutter/plugin/platform/SingleViewPresentation;

    .line 74
    .line 75
    invoke-virtual {v3}, Lio/flutter/plugin/platform/SingleViewPresentation;->getView()Lio/flutter/plugin/platform/e;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 80
    .line 81
    .line 82
    :cond_3
    :goto_0
    new-instance v3, Lio/flutter/plugin/platform/l;

    .line 83
    .line 84
    invoke-direct {v3, v0, v1, v4, v2}, Lio/flutter/plugin/platform/l;-><init>(Lio/flutter/plugin/platform/m;Lio/flutter/plugin/platform/B;FLj3/g;)V

    .line 85
    .line 86
    .line 87
    iget-object v2, v1, Lio/flutter/plugin/platform/B;->f:Lio/flutter/plugin/platform/g;

    .line 88
    .line 89
    invoke-interface {v2}, Lio/flutter/plugin/platform/g;->getWidth()I

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    const-wide/16 v5, 0x0

    .line 94
    .line 95
    if-ne v8, v4, :cond_4

    .line 96
    .line 97
    iget-object v4, v1, Lio/flutter/plugin/platform/B;->f:Lio/flutter/plugin/platform/g;

    .line 98
    .line 99
    invoke-interface {v4}, Lio/flutter/plugin/platform/g;->getHeight()I

    .line 100
    .line 101
    .line 102
    move-result v4

    .line 103
    if-ne v9, v4, :cond_4

    .line 104
    .line 105
    invoke-virtual {v1}, Lio/flutter/plugin/platform/B;->a()Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-virtual {v1, v3, v5, v6}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_4
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 114
    .line 115
    const/16 v7, 0x1f

    .line 116
    .line 117
    if-lt v4, v7, :cond_5

    .line 118
    .line 119
    invoke-virtual {v1}, Lio/flutter/plugin/platform/B;->a()Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    invoke-interface {v2, v8, v9}, Lio/flutter/plugin/platform/g;->a(II)V

    .line 124
    .line 125
    .line 126
    iget-object v7, v1, Lio/flutter/plugin/platform/B;->h:Landroid/hardware/display/VirtualDisplay;

    .line 127
    .line 128
    iget v10, v1, Lio/flutter/plugin/platform/B;->d:I

    .line 129
    .line 130
    invoke-virtual {v7, v8, v9, v10}, Landroid/hardware/display/VirtualDisplay;->resize(III)V

    .line 131
    .line 132
    .line 133
    iget-object v1, v1, Lio/flutter/plugin/platform/B;->h:Landroid/hardware/display/VirtualDisplay;

    .line 134
    .line 135
    invoke-interface {v2}, Lio/flutter/plugin/platform/g;->getSurface()Landroid/view/Surface;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    invoke-virtual {v1, v2}, Landroid/hardware/display/VirtualDisplay;->setSurface(Landroid/view/Surface;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v4, v3, v5, v6}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_5
    invoke-virtual {v1}, Lio/flutter/plugin/platform/B;->a()Landroid/view/View;

    .line 147
    .line 148
    .line 149
    move-result-object v4

    .line 150
    invoke-virtual {v4}, Landroid/view/View;->isFocused()Z

    .line 151
    .line 152
    .line 153
    move-result v16

    .line 154
    iget-object v4, v1, Lio/flutter/plugin/platform/B;->a:Lio/flutter/plugin/platform/SingleViewPresentation;

    .line 155
    .line 156
    invoke-virtual {v4}, Lio/flutter/plugin/platform/SingleViewPresentation;->detachState()Lio/flutter/plugin/platform/u;

    .line 157
    .line 158
    .line 159
    move-result-object v4

    .line 160
    iget-object v5, v1, Lio/flutter/plugin/platform/B;->h:Landroid/hardware/display/VirtualDisplay;

    .line 161
    .line 162
    const/4 v6, 0x0

    .line 163
    invoke-virtual {v5, v6}, Landroid/hardware/display/VirtualDisplay;->setSurface(Landroid/view/Surface;)V

    .line 164
    .line 165
    .line 166
    iget-object v5, v1, Lio/flutter/plugin/platform/B;->h:Landroid/hardware/display/VirtualDisplay;

    .line 167
    .line 168
    invoke-virtual {v5}, Landroid/hardware/display/VirtualDisplay;->release()V

    .line 169
    .line 170
    .line 171
    iget-object v5, v1, Lio/flutter/plugin/platform/B;->b:Landroid/content/Context;

    .line 172
    .line 173
    const-string v6, "display"

    .line 174
    .line 175
    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v5

    .line 179
    move-object v6, v5

    .line 180
    check-cast v6, Landroid/hardware/display/DisplayManager;

    .line 181
    .line 182
    invoke-interface {v2, v8, v9}, Lio/flutter/plugin/platform/g;->a(II)V

    .line 183
    .line 184
    .line 185
    new-instance v5, Ljava/lang/StringBuilder;

    .line 186
    .line 187
    const-string v7, "flutter-vd#"

    .line 188
    .line 189
    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    iget v7, v1, Lio/flutter/plugin/platform/B;->e:I

    .line 193
    .line 194
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v7

    .line 201
    iget v10, v1, Lio/flutter/plugin/platform/B;->d:I

    .line 202
    .line 203
    invoke-interface {v2}, Lio/flutter/plugin/platform/g;->getSurface()Landroid/view/Surface;

    .line 204
    .line 205
    .line 206
    move-result-object v11

    .line 207
    sget-object v13, Lio/flutter/plugin/platform/B;->i:Lio/flutter/plugin/platform/x;

    .line 208
    .line 209
    const/4 v14, 0x0

    .line 210
    const/4 v12, 0x0

    .line 211
    invoke-virtual/range {v6 .. v14}, Landroid/hardware/display/DisplayManager;->createVirtualDisplay(Ljava/lang/String;IIILandroid/view/Surface;ILandroid/hardware/display/VirtualDisplay$Callback;Landroid/os/Handler;)Landroid/hardware/display/VirtualDisplay;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    iput-object v2, v1, Lio/flutter/plugin/platform/B;->h:Landroid/hardware/display/VirtualDisplay;

    .line 216
    .line 217
    invoke-virtual {v1}, Lio/flutter/plugin/platform/B;->a()Landroid/view/View;

    .line 218
    .line 219
    .line 220
    move-result-object v2

    .line 221
    new-instance v5, Lio/flutter/plugin/platform/z;

    .line 222
    .line 223
    invoke-direct {v5, v2, v3}, Lio/flutter/plugin/platform/z;-><init>(Landroid/view/View;Lio/flutter/plugin/platform/l;)V

    .line 224
    .line 225
    .line 226
    invoke-virtual {v2, v5}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 227
    .line 228
    .line 229
    new-instance v10, Lio/flutter/plugin/platform/SingleViewPresentation;

    .line 230
    .line 231
    iget-object v11, v1, Lio/flutter/plugin/platform/B;->b:Landroid/content/Context;

    .line 232
    .line 233
    iget-object v2, v1, Lio/flutter/plugin/platform/B;->h:Landroid/hardware/display/VirtualDisplay;

    .line 234
    .line 235
    invoke-virtual {v2}, Landroid/hardware/display/VirtualDisplay;->getDisplay()Landroid/view/Display;

    .line 236
    .line 237
    .line 238
    move-result-object v12

    .line 239
    iget-object v13, v1, Lio/flutter/plugin/platform/B;->c:Lio/flutter/plugin/platform/a;

    .line 240
    .line 241
    iget-object v15, v1, Lio/flutter/plugin/platform/B;->g:Lio/flutter/plugin/platform/k;

    .line 242
    .line 243
    move-object v14, v4

    .line 244
    invoke-direct/range {v10 .. v16}, Lio/flutter/plugin/platform/SingleViewPresentation;-><init>(Landroid/content/Context;Landroid/view/Display;Lio/flutter/plugin/platform/a;Lio/flutter/plugin/platform/u;Landroid/view/View$OnFocusChangeListener;Z)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {v10}, Landroid/app/Dialog;->show()V

    .line 248
    .line 249
    .line 250
    iget-object v2, v1, Lio/flutter/plugin/platform/B;->a:Lio/flutter/plugin/platform/SingleViewPresentation;

    .line 251
    .line 252
    invoke-virtual {v2}, Landroid/app/Dialog;->cancel()V

    .line 253
    .line 254
    .line 255
    iput-object v10, v1, Lio/flutter/plugin/platform/B;->a:Lio/flutter/plugin/platform/SingleViewPresentation;

    .line 256
    .line 257
    return-void

    .line 258
    :cond_6
    iget-object v4, v3, Lio/flutter/plugin/platform/p;->p:Landroid/util/SparseArray;

    .line 259
    .line 260
    invoke-virtual {v4, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    move-result-object v4

    .line 264
    check-cast v4, Lio/flutter/plugin/platform/e;

    .line 265
    .line 266
    iget-object v5, v3, Lio/flutter/plugin/platform/p;->s:Landroid/util/SparseArray;

    .line 267
    .line 268
    invoke-virtual {v5, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 269
    .line 270
    .line 271
    move-result-object v5

    .line 272
    check-cast v5, Lio/flutter/plugin/platform/h;

    .line 273
    .line 274
    if-eqz v4, :cond_b

    .line 275
    .line 276
    if-nez v5, :cond_7

    .line 277
    .line 278
    goto :goto_1

    .line 279
    :cond_7
    invoke-virtual {v5}, Lio/flutter/plugin/platform/h;->getRenderTargetWidth()I

    .line 280
    .line 281
    .line 282
    move-result v1

    .line 283
    if-gt v8, v1, :cond_8

    .line 284
    .line 285
    invoke-virtual {v5}, Lio/flutter/plugin/platform/h;->getRenderTargetHeight()I

    .line 286
    .line 287
    .line 288
    move-result v1

    .line 289
    if-le v9, v1, :cond_9

    .line 290
    .line 291
    :cond_8
    iget-object v1, v5, Lio/flutter/plugin/platform/h;->j:Lio/flutter/plugin/platform/g;

    .line 292
    .line 293
    if-eqz v1, :cond_9

    .line 294
    .line 295
    invoke-interface {v1, v8, v9}, Lio/flutter/plugin/platform/g;->a(II)V

    .line 296
    .line 297
    .line 298
    :cond_9
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 299
    .line 300
    .line 301
    move-result-object v1

    .line 302
    iput v8, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 303
    .line 304
    iput v9, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 305
    .line 306
    invoke-virtual {v5, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 307
    .line 308
    .line 309
    invoke-interface {v4}, Lio/flutter/plugin/platform/e;->u()Landroid/view/View;

    .line 310
    .line 311
    .line 312
    move-result-object v1

    .line 313
    if-eqz v1, :cond_a

    .line 314
    .line 315
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 316
    .line 317
    .line 318
    move-result-object v4

    .line 319
    iput v8, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 320
    .line 321
    iput v9, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 322
    .line 323
    invoke-virtual {v1, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 324
    .line 325
    .line 326
    :cond_a
    invoke-virtual {v5}, Lio/flutter/plugin/platform/h;->getRenderTargetWidth()I

    .line 327
    .line 328
    .line 329
    move-result v1

    .line 330
    int-to-double v6, v1

    .line 331
    invoke-virtual {v3}, Lio/flutter/plugin/platform/p;->i()F

    .line 332
    .line 333
    .line 334
    move-result v1

    .line 335
    float-to-double v8, v1

    .line 336
    div-double/2addr v6, v8

    .line 337
    invoke-static {v6, v7}, Ljava/lang/Math;->round(D)J

    .line 338
    .line 339
    .line 340
    move-result-wide v6

    .line 341
    long-to-int v1, v6

    .line 342
    invoke-virtual {v5}, Lio/flutter/plugin/platform/h;->getRenderTargetHeight()I

    .line 343
    .line 344
    .line 345
    move-result v4

    .line 346
    int-to-double v4, v4

    .line 347
    invoke-virtual {v3}, Lio/flutter/plugin/platform/p;->i()F

    .line 348
    .line 349
    .line 350
    move-result v3

    .line 351
    float-to-double v6, v3

    .line 352
    div-double/2addr v4, v6

    .line 353
    invoke-static {v4, v5}, Ljava/lang/Math;->round(D)J

    .line 354
    .line 355
    .line 356
    move-result-wide v3

    .line 357
    long-to-int v3, v3

    .line 358
    iget-object v2, v2, Lj3/g;->e:LQ2/g;

    .line 359
    .line 360
    new-instance v4, Ljava/util/HashMap;

    .line 361
    .line 362
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 363
    .line 364
    .line 365
    int-to-double v5, v1

    .line 366
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 367
    .line 368
    .line 369
    move-result-object v1

    .line 370
    const-string v5, "width"

    .line 371
    .line 372
    invoke-virtual {v4, v5, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 373
    .line 374
    .line 375
    int-to-double v5, v3

    .line 376
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 377
    .line 378
    .line 379
    move-result-object v1

    .line 380
    const-string v3, "height"

    .line 381
    .line 382
    invoke-virtual {v4, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 383
    .line 384
    .line 385
    invoke-virtual {v2, v4}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 386
    .line 387
    .line 388
    return-void

    .line 389
    :cond_b
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 390
    .line 391
    const-string v3, "Resizing unknown platform view with id: "

    .line 392
    .line 393
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 394
    .line 395
    .line 396
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 397
    .line 398
    .line 399
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 400
    .line 401
    .line 402
    move-result-object v1

    .line 403
    const-string v2, "PlatformViewsController"

    .line 404
    .line 405
    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 406
    .line 407
    .line 408
    return-void
.end method

.method public g(Ljava/util/ArrayList;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LR/j;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const/16 v1, 0x1706

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/16 v1, 0x706

    .line 15
    .line 16
    :goto_0
    const/4 v2, 0x0

    .line 17
    :goto_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-ge v2, v3, :cond_3

    .line 22
    .line 23
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    check-cast v3, Lj3/d;

    .line 28
    .line 29
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-eqz v3, :cond_2

    .line 34
    .line 35
    const/4 v4, 0x1

    .line 36
    if-eq v3, v4, :cond_1

    .line 37
    .line 38
    goto :goto_2

    .line 39
    :cond_1
    and-int/lit16 v1, v1, -0x203

    .line 40
    .line 41
    goto :goto_2

    .line 42
    :cond_2
    and-int/lit8 v1, v1, -0x5

    .line 43
    .line 44
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_3
    iput v1, v0, LR/j;->b:I

    .line 48
    .line 49
    invoke-virtual {v0}, LR/j;->j()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public getHeight()I
    .locals 1

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/view/TextureRegistry$SurfaceProducer;

    .line 4
    .line 5
    invoke-interface {v0}, Lio/flutter/view/TextureRegistry$SurfaceProducer;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    return v0
.end method

.method public getId()J
    .locals 2

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/view/TextureRegistry$SurfaceProducer;

    .line 4
    .line 5
    invoke-interface {v0}, Lio/flutter/view/TextureRegistry$SurfaceProducer;->id()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getSurface()Landroid/view/Surface;
    .locals 1

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/view/TextureRegistry$SurfaceProducer;

    .line 4
    .line 5
    invoke-interface {v0}, Lio/flutter/view/TextureRegistry$SurfaceProducer;->getSurface()Landroid/view/Surface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public getWidth()I
    .locals 1

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/view/TextureRegistry$SurfaceProducer;

    .line 4
    .line 5
    invoke-interface {v0}, Lio/flutter/view/TextureRegistry$SurfaceProducer;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    return v0
.end method

.method public h(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LR/j;

    .line 4
    .line 5
    iget-object v0, v0, LR/j;->c:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, Landroid/app/Activity;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {p1}, LL/i;->b(I)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    const/4 v1, 0x3

    .line 22
    const/16 v2, 0x1e

    .line 23
    .line 24
    packed-switch p1, :pswitch_data_0

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :pswitch_0
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 29
    .line 30
    if-lt p1, v2, :cond_0

    .line 31
    .line 32
    const/16 p1, 0x11

    .line 33
    .line 34
    invoke-virtual {v0, p1}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :pswitch_1
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 39
    .line 40
    if-lt p1, v2, :cond_0

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :pswitch_2
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 47
    .line 48
    if-lt p1, v2, :cond_0

    .line 49
    .line 50
    const/16 p1, 0x10

    .line 51
    .line 52
    invoke-virtual {v0, p1}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 53
    .line 54
    .line 55
    :cond_0
    :goto_0
    return-void

    .line 56
    :pswitch_3
    const/4 p1, 0x4

    .line 57
    invoke-virtual {v0, p1}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :pswitch_4
    const/4 p1, 0x6

    .line 62
    invoke-virtual {v0, p1}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :pswitch_5
    invoke-virtual {v0, v1}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :pswitch_6
    const/4 p1, 0x1

    .line 71
    invoke-virtual {v0, p1}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :pswitch_7
    const/4 p1, 0x0

    .line 76
    invoke-virtual {v0, p1}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    nop

    .line 81
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public i(Lj3/e;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/plugin/platform/p;

    .line 4
    .line 5
    const/16 v1, 0x13

    .line 6
    .line 7
    invoke-static {v1}, Lio/flutter/plugin/platform/p;->e(I)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, p1}, Lio/flutter/plugin/platform/p;->a(Lio/flutter/plugin/platform/p;Lj3/e;)V

    .line 11
    .line 12
    .line 13
    iget-object v2, v0, Lio/flutter/plugin/platform/p;->i:Lio/flutter/embedding/engine/FlutterJNI;

    .line 14
    .line 15
    invoke-virtual {v2}, Lio/flutter/embedding/engine/FlutterJNI;->IsSurfaceControlEnabled()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const-string v3, "Trying to create a Hybrid Composition view with HC++ enabled."

    .line 20
    .line 21
    if-nez v2, :cond_1

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-virtual {v0, p1, v2}, Lio/flutter/plugin/platform/p;->b(Lj3/e;Z)Lio/flutter/plugin/platform/e;

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Lio/flutter/plugin/platform/p;->e(I)V

    .line 28
    .line 29
    .line 30
    iget-object p1, v0, Lio/flutter/plugin/platform/p;->i:Lio/flutter/embedding/engine/FlutterJNI;

    .line 31
    .line 32
    invoke-virtual {p1}, Lio/flutter/embedding/engine/FlutterJNI;->IsSurfaceControlEnabled()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 40
    .line 41
    invoke-direct {p1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    throw p1

    .line 45
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 46
    .line 47
    invoke-direct {p1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    throw p1
.end method

.method public j(I)V
    .locals 3

    .line 1
    iget v0, p0, Lio/flutter/plugin/platform/m;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lio/flutter/plugin/platform/o;

    .line 9
    .line 10
    iget-object v0, v0, Lio/flutter/plugin/platform/o;->m:Landroid/util/SparseArray;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lio/flutter/plugin/platform/e;

    .line 17
    .line 18
    const-string v1, "PlatformViewsController2"

    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    new-instance v0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v2, "Clearing focus on an unknown view with id: "

    .line 25
    .line 26
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-interface {v0}, Lio/flutter/plugin/platform/e;->u()Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v2, "Clearing focus on a null view with id: "

    .line 49
    .line 50
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->clearFocus()V

    .line 65
    .line 66
    .line 67
    :goto_0
    return-void

    .line 68
    :pswitch_0
    iget-object v0, p0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 69
    .line 70
    check-cast v0, Lio/flutter/plugin/platform/p;

    .line 71
    .line 72
    invoke-virtual {v0, p1}, Lio/flutter/plugin/platform/p;->g(I)Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    const-string v2, "PlatformViewsController"

    .line 77
    .line 78
    if-eqz v1, :cond_2

    .line 79
    .line 80
    iget-object v0, v0, Lio/flutter/plugin/platform/p;->n:Ljava/util/HashMap;

    .line 81
    .line 82
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Lio/flutter/plugin/platform/B;

    .line 91
    .line 92
    invoke-virtual {v0}, Lio/flutter/plugin/platform/B;->a()Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    goto :goto_1

    .line 97
    :cond_2
    iget-object v0, v0, Lio/flutter/plugin/platform/p;->p:Landroid/util/SparseArray;

    .line 98
    .line 99
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    check-cast v0, Lio/flutter/plugin/platform/e;

    .line 104
    .line 105
    if-nez v0, :cond_3

    .line 106
    .line 107
    new-instance v0, Ljava/lang/StringBuilder;

    .line 108
    .line 109
    const-string v1, "Clearing focus on an unknown view with id: "

    .line 110
    .line 111
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_3
    invoke-interface {v0}, Lio/flutter/plugin/platform/e;->u()Landroid/view/View;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    :goto_1
    if-nez v0, :cond_4

    .line 130
    .line 131
    new-instance v0, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    const-string v1, "Clearing focus on a null view with id: "

    .line 134
    .line 135
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_4
    invoke-virtual {v0}, Landroid/view/View;->clearFocus()V

    .line 150
    .line 151
    .line 152
    :goto_2
    return-void

    .line 153
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public k(Lj3/e;)J
    .locals 25

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    iget-object v2, v1, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v2, Lio/flutter/plugin/platform/p;

    .line 8
    .line 9
    invoke-static {v2, v0}, Lio/flutter/plugin/platform/p;->a(Lio/flutter/plugin/platform/p;Lj3/e;)V

    .line 10
    .line 11
    .line 12
    iget-wide v3, v0, Lj3/e;->d:D

    .line 13
    .line 14
    iget-wide v5, v0, Lj3/e;->c:D

    .line 15
    .line 16
    iget v7, v0, Lj3/e;->a:I

    .line 17
    .line 18
    iget-object v8, v2, Lio/flutter/plugin/platform/p;->s:Landroid/util/SparseArray;

    .line 19
    .line 20
    invoke-virtual {v8, v7}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v9

    .line 24
    if-nez v9, :cond_d

    .line 25
    .line 26
    iget-object v9, v2, Lio/flutter/plugin/platform/p;->j:Lio/flutter/embedding/engine/renderer/j;

    .line 27
    .line 28
    if-eqz v9, :cond_c

    .line 29
    .line 30
    iget-object v9, v2, Lio/flutter/plugin/platform/p;->h:LZ2/p;

    .line 31
    .line 32
    if-eqz v9, :cond_b

    .line 33
    .line 34
    const/4 v9, 0x1

    .line 35
    invoke-virtual {v2, v0, v9}, Lio/flutter/plugin/platform/p;->b(Lj3/e;Z)Lio/flutter/plugin/platform/e;

    .line 36
    .line 37
    .line 38
    move-result-object v14

    .line 39
    invoke-interface {v14}, Lio/flutter/plugin/platform/e;->u()Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v10

    .line 43
    invoke-virtual {v10}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 44
    .line 45
    .line 46
    move-result-object v11

    .line 47
    if-nez v11, :cond_a

    .line 48
    .line 49
    new-instance v11, LD1/a;

    .line 50
    .line 51
    const/16 v12, 0x10

    .line 52
    .line 53
    sget-object v13, Lio/flutter/plugin/platform/p;->B:[Ljava/lang/Class;

    .line 54
    .line 55
    invoke-direct {v11, v12, v13}, LD1/a;-><init>(ILjava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v10, v11}, Lc1/g;->L(Landroid/view/View;Lw3/c;)Z

    .line 59
    .line 60
    .line 61
    move-result v10

    .line 62
    if-eqz v10, :cond_6

    .line 63
    .line 64
    iget v10, v0, Lj3/e;->h:I

    .line 65
    .line 66
    const/4 v11, 0x2

    .line 67
    if-ne v10, v11, :cond_1

    .line 68
    .line 69
    const/16 v0, 0x13

    .line 70
    .line 71
    invoke-static {v0}, Lio/flutter/plugin/platform/p;->e(I)V

    .line 72
    .line 73
    .line 74
    iget-object v0, v2, Lio/flutter/plugin/platform/p;->i:Lio/flutter/embedding/engine/FlutterJNI;

    .line 75
    .line 76
    invoke-virtual {v0}, Lio/flutter/embedding/engine/FlutterJNI;->IsSurfaceControlEnabled()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-nez v0, :cond_0

    .line 81
    .line 82
    const-wide/16 v2, -0x2

    .line 83
    .line 84
    return-wide v2

    .line 85
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 86
    .line 87
    const-string v2, "Trying to create a Hybrid Composition view with HC++ enabled."

    .line 88
    .line 89
    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    throw v0

    .line 93
    :cond_1
    iget-boolean v10, v2, Lio/flutter/plugin/platform/p;->z:Z

    .line 94
    .line 95
    if-nez v10, :cond_6

    .line 96
    .line 97
    const/16 v8, 0x14

    .line 98
    .line 99
    invoke-static {v8}, Lio/flutter/plugin/platform/p;->e(I)V

    .line 100
    .line 101
    .line 102
    iget-object v8, v2, Lio/flutter/plugin/platform/p;->j:Lio/flutter/embedding/engine/renderer/j;

    .line 103
    .line 104
    invoke-static {v8}, Lio/flutter/plugin/platform/p;->k(Lio/flutter/embedding/engine/renderer/j;)Lio/flutter/plugin/platform/g;

    .line 105
    .line 106
    .line 107
    move-result-object v15

    .line 108
    invoke-virtual {v2, v5, v6}, Lio/flutter/plugin/platform/p;->o(D)I

    .line 109
    .line 110
    .line 111
    move-result v5

    .line 112
    invoke-virtual {v2, v3, v4}, Lio/flutter/plugin/platform/p;->o(D)I

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    iget-object v11, v2, Lio/flutter/plugin/platform/p;->g:LZ2/d;

    .line 117
    .line 118
    iget-object v12, v2, Lio/flutter/plugin/platform/p;->m:Lio/flutter/plugin/platform/a;

    .line 119
    .line 120
    iget v4, v0, Lj3/e;->a:I

    .line 121
    .line 122
    new-instance v6, Lio/flutter/plugin/platform/k;

    .line 123
    .line 124
    invoke-direct {v6, v2, v0, v9}, Lio/flutter/plugin/platform/k;-><init>(Lio/flutter/plugin/platform/p;Lj3/e;I)V

    .line 125
    .line 126
    .line 127
    sget-object v8, Lio/flutter/plugin/platform/B;->i:Lio/flutter/plugin/platform/x;

    .line 128
    .line 129
    const/4 v8, 0x0

    .line 130
    if-eqz v5, :cond_4

    .line 131
    .line 132
    if-nez v3, :cond_2

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_2
    const-string v9, "display"

    .line 136
    .line 137
    invoke-virtual {v11, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v9

    .line 141
    move-object/from16 v16, v9

    .line 142
    .line 143
    check-cast v16, Landroid/hardware/display/DisplayManager;

    .line 144
    .line 145
    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 146
    .line 147
    .line 148
    move-result-object v9

    .line 149
    invoke-virtual {v9}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 150
    .line 151
    .line 152
    move-result-object v9

    .line 153
    invoke-interface {v15, v5, v3}, Lio/flutter/plugin/platform/g;->a(II)V

    .line 154
    .line 155
    .line 156
    const-string v10, "flutter-vd#"

    .line 157
    .line 158
    invoke-static {v10, v4}, LE1/j;->j(Ljava/lang/String;I)Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v17

    .line 162
    iget v9, v9, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 163
    .line 164
    invoke-interface {v15}, Lio/flutter/plugin/platform/g;->getSurface()Landroid/view/Surface;

    .line 165
    .line 166
    .line 167
    move-result-object v21

    .line 168
    sget-object v23, Lio/flutter/plugin/platform/B;->i:Lio/flutter/plugin/platform/x;

    .line 169
    .line 170
    const/16 v24, 0x0

    .line 171
    .line 172
    const/16 v22, 0x0

    .line 173
    .line 174
    move/from16 v19, v3

    .line 175
    .line 176
    move/from16 v18, v5

    .line 177
    .line 178
    move/from16 v20, v9

    .line 179
    .line 180
    invoke-virtual/range {v16 .. v24}, Landroid/hardware/display/DisplayManager;->createVirtualDisplay(Ljava/lang/String;IIILandroid/view/Surface;ILandroid/hardware/display/VirtualDisplay$Callback;Landroid/os/Handler;)Landroid/hardware/display/VirtualDisplay;

    .line 181
    .line 182
    .line 183
    move-result-object v13

    .line 184
    if-nez v13, :cond_3

    .line 185
    .line 186
    goto :goto_0

    .line 187
    :cond_3
    new-instance v10, Lio/flutter/plugin/platform/B;

    .line 188
    .line 189
    move/from16 v17, v4

    .line 190
    .line 191
    move-object/from16 v16, v6

    .line 192
    .line 193
    invoke-direct/range {v10 .. v17}, Lio/flutter/plugin/platform/B;-><init>(LZ2/d;Lio/flutter/plugin/platform/a;Landroid/hardware/display/VirtualDisplay;Lio/flutter/plugin/platform/e;Lio/flutter/plugin/platform/g;Lio/flutter/plugin/platform/k;I)V

    .line 194
    .line 195
    .line 196
    move-object v8, v10

    .line 197
    :cond_4
    :goto_0
    if-eqz v8, :cond_5

    .line 198
    .line 199
    iget-object v0, v2, Lio/flutter/plugin/platform/p;->n:Ljava/util/HashMap;

    .line 200
    .line 201
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    invoke-virtual {v0, v3, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    invoke-interface {v14}, Lio/flutter/plugin/platform/e;->u()Landroid/view/View;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    iget-object v2, v2, Lio/flutter/plugin/platform/p;->o:Ljava/util/HashMap;

    .line 213
    .line 214
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 215
    .line 216
    .line 217
    move-result-object v3

    .line 218
    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    invoke-interface {v15}, Lio/flutter/plugin/platform/g;->getId()J

    .line 222
    .line 223
    .line 224
    move-result-wide v2

    .line 225
    return-wide v2

    .line 226
    :cond_5
    new-instance v2, Ljava/lang/IllegalStateException;

    .line 227
    .line 228
    new-instance v3, Ljava/lang/StringBuilder;

    .line 229
    .line 230
    const-string v4, "Failed creating virtual display for a "

    .line 231
    .line 232
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    iget-object v0, v0, Lj3/e;->b:Ljava/lang/String;

    .line 236
    .line 237
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    const-string v0, " with id: "

    .line 241
    .line 242
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v0

    .line 252
    invoke-direct {v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    throw v2

    .line 256
    :cond_6
    const/16 v9, 0x17

    .line 257
    .line 258
    invoke-static {v9}, Lio/flutter/plugin/platform/p;->e(I)V

    .line 259
    .line 260
    .line 261
    invoke-virtual {v2, v5, v6}, Lio/flutter/plugin/platform/p;->o(D)I

    .line 262
    .line 263
    .line 264
    move-result v5

    .line 265
    invoke-virtual {v2, v3, v4}, Lio/flutter/plugin/platform/p;->o(D)I

    .line 266
    .line 267
    .line 268
    move-result v3

    .line 269
    iget-boolean v4, v2, Lio/flutter/plugin/platform/p;->z:Z

    .line 270
    .line 271
    const/4 v6, 0x0

    .line 272
    if-eqz v4, :cond_7

    .line 273
    .line 274
    new-instance v4, Lio/flutter/plugin/platform/h;

    .line 275
    .line 276
    iget-object v9, v2, Lio/flutter/plugin/platform/p;->g:LZ2/d;

    .line 277
    .line 278
    invoke-direct {v4, v9}, Lio/flutter/plugin/platform/h;-><init>(LZ2/d;)V

    .line 279
    .line 280
    .line 281
    const-wide/16 v9, -0x1

    .line 282
    .line 283
    goto :goto_2

    .line 284
    :cond_7
    iget-object v4, v2, Lio/flutter/plugin/platform/p;->j:Lio/flutter/embedding/engine/renderer/j;

    .line 285
    .line 286
    invoke-static {v4}, Lio/flutter/plugin/platform/p;->k(Lio/flutter/embedding/engine/renderer/j;)Lio/flutter/plugin/platform/g;

    .line 287
    .line 288
    .line 289
    move-result-object v4

    .line 290
    new-instance v9, Lio/flutter/plugin/platform/h;

    .line 291
    .line 292
    iget-object v10, v2, Lio/flutter/plugin/platform/p;->g:LZ2/d;

    .line 293
    .line 294
    invoke-direct {v9, v10}, Lio/flutter/plugin/platform/h;-><init>(LZ2/d;)V

    .line 295
    .line 296
    .line 297
    iput-object v4, v9, Lio/flutter/plugin/platform/h;->j:Lio/flutter/plugin/platform/g;

    .line 298
    .line 299
    invoke-interface {v4}, Lio/flutter/plugin/platform/g;->getSurface()Landroid/view/Surface;

    .line 300
    .line 301
    .line 302
    move-result-object v10

    .line 303
    if-eqz v10, :cond_8

    .line 304
    .line 305
    invoke-virtual {v10}, Landroid/view/Surface;->lockHardwareCanvas()Landroid/graphics/Canvas;

    .line 306
    .line 307
    .line 308
    move-result-object v11

    .line 309
    :try_start_0
    sget-object v12, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 310
    .line 311
    invoke-virtual {v11, v6, v12}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 312
    .line 313
    .line 314
    invoke-virtual {v10, v11}, Landroid/view/Surface;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    .line 315
    .line 316
    .line 317
    goto :goto_1

    .line 318
    :catchall_0
    move-exception v0

    .line 319
    invoke-virtual {v10, v11}, Landroid/view/Surface;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    .line 320
    .line 321
    .line 322
    throw v0

    .line 323
    :cond_8
    :goto_1
    invoke-interface {v4}, Lio/flutter/plugin/platform/g;->getId()J

    .line 324
    .line 325
    .line 326
    move-result-wide v10

    .line 327
    move-object v4, v9

    .line 328
    move-wide v9, v10

    .line 329
    :goto_2
    iget-object v11, v2, Lio/flutter/plugin/platform/p;->f:LZ2/a;

    .line 330
    .line 331
    invoke-virtual {v4, v11}, Lio/flutter/plugin/platform/h;->setTouchProcessor(LZ2/a;)V

    .line 332
    .line 333
    .line 334
    iget-object v11, v4, Lio/flutter/plugin/platform/h;->j:Lio/flutter/plugin/platform/g;

    .line 335
    .line 336
    if-eqz v11, :cond_9

    .line 337
    .line 338
    invoke-interface {v11, v5, v3}, Lio/flutter/plugin/platform/g;->a(II)V

    .line 339
    .line 340
    .line 341
    :cond_9
    new-instance v11, Landroid/widget/FrameLayout$LayoutParams;

    .line 342
    .line 343
    invoke-direct {v11, v5, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 344
    .line 345
    .line 346
    iget-wide v12, v0, Lj3/e;->e:D

    .line 347
    .line 348
    invoke-virtual {v2, v12, v13}, Lio/flutter/plugin/platform/p;->o(D)I

    .line 349
    .line 350
    .line 351
    move-result v12

    .line 352
    move v13, v7

    .line 353
    iget-wide v6, v0, Lj3/e;->f:D

    .line 354
    .line 355
    invoke-virtual {v2, v6, v7}, Lio/flutter/plugin/platform/p;->o(D)I

    .line 356
    .line 357
    .line 358
    move-result v6

    .line 359
    iput v12, v11, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 360
    .line 361
    iput v6, v11, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 362
    .line 363
    invoke-virtual {v4, v11}, Lio/flutter/plugin/platform/h;->setLayoutParams(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 364
    .line 365
    .line 366
    invoke-interface {v14}, Lio/flutter/plugin/platform/e;->u()Landroid/view/View;

    .line 367
    .line 368
    .line 369
    move-result-object v6

    .line 370
    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    .line 371
    .line 372
    invoke-direct {v7, v5, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 373
    .line 374
    .line 375
    invoke-virtual {v6, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 376
    .line 377
    .line 378
    const/4 v3, 0x4

    .line 379
    invoke-virtual {v6, v3}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 380
    .line 381
    .line 382
    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 383
    .line 384
    .line 385
    new-instance v3, Lio/flutter/plugin/platform/k;

    .line 386
    .line 387
    const/4 v15, 0x0

    .line 388
    invoke-direct {v3, v2, v0, v15}, Lio/flutter/plugin/platform/k;-><init>(Lio/flutter/plugin/platform/p;Lj3/e;I)V

    .line 389
    .line 390
    .line 391
    invoke-virtual {v4, v3}, Lio/flutter/plugin/platform/h;->setOnDescendantFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 392
    .line 393
    .line 394
    iget-object v0, v2, Lio/flutter/plugin/platform/p;->h:LZ2/p;

    .line 395
    .line 396
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 397
    .line 398
    .line 399
    invoke-virtual {v8, v13, v4}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 400
    .line 401
    .line 402
    return-wide v9

    .line 403
    :cond_a
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 404
    .line 405
    const-string v2, "The Android view returned from PlatformView#getView() was already added to a parent view."

    .line 406
    .line 407
    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 408
    .line 409
    .line 410
    throw v0

    .line 411
    :cond_b
    move v13, v7

    .line 412
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 413
    .line 414
    const-string v2, "Flutter view is null. This means the platform views controller doesn\'t have an attached view, view id: "

    .line 415
    .line 416
    invoke-static {v2, v13}, LE1/j;->j(Ljava/lang/String;I)Ljava/lang/String;

    .line 417
    .line 418
    .line 419
    move-result-object v2

    .line 420
    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 421
    .line 422
    .line 423
    throw v0

    .line 424
    :cond_c
    move v13, v7

    .line 425
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 426
    .line 427
    const-string v2, "Texture registry is null. This means that platform views controller was detached, view id: "

    .line 428
    .line 429
    invoke-static {v2, v13}, LE1/j;->j(Ljava/lang/String;I)Ljava/lang/String;

    .line 430
    .line 431
    .line 432
    move-result-object v2

    .line 433
    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 434
    .line 435
    .line 436
    throw v0

    .line 437
    :cond_d
    move v13, v7

    .line 438
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 439
    .line 440
    const-string v2, "Trying to create an already created platform view, view id: "

    .line 441
    .line 442
    invoke-static {v2, v13}, LE1/j;->j(Ljava/lang/String;I)Ljava/lang/String;

    .line 443
    .line 444
    .line 445
    move-result-object v2

    .line 446
    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 447
    .line 448
    .line 449
    throw v0
.end method

.method public m(Lj3/f;)V
    .locals 27

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget v2, v0, Lio/flutter/plugin/platform/m;->e:I

    .line 6
    .line 7
    packed-switch v2, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    iget v2, v1, Lj3/f;->a:I

    .line 11
    .line 12
    iget-object v3, v0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v3, Lio/flutter/plugin/platform/o;

    .line 15
    .line 16
    iget-object v4, v3, Lio/flutter/plugin/platform/o;->g:LZ2/d;

    .line 17
    .line 18
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    iget v4, v4, Landroid/util/DisplayMetrics;->density:F

    .line 27
    .line 28
    iget-object v5, v3, Lio/flutter/plugin/platform/o;->m:Landroid/util/SparseArray;

    .line 29
    .line 30
    invoke-virtual {v5, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    check-cast v5, Lio/flutter/plugin/platform/e;

    .line 35
    .line 36
    const-string v6, "PlatformViewsController2"

    .line 37
    .line 38
    if-nez v5, :cond_0

    .line 39
    .line 40
    new-instance v1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v3, "Sending touch to an unknown view with id: "

    .line 43
    .line 44
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-static {v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    goto/16 :goto_3

    .line 58
    .line 59
    :cond_0
    invoke-interface {v5}, Lio/flutter/plugin/platform/e;->u()Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    if-nez v5, :cond_1

    .line 64
    .line 65
    new-instance v1, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    const-string v3, "Sending touch to a null view with id: "

    .line 68
    .line 69
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-static {v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    goto/16 :goto_3

    .line 83
    .line 84
    :cond_1
    iget-wide v6, v1, Lj3/f;->p:J

    .line 85
    .line 86
    iget v2, v1, Lj3/f;->e:I

    .line 87
    .line 88
    new-instance v8, LZ2/D;

    .line 89
    .line 90
    invoke-direct {v8, v6, v7}, LZ2/D;-><init>(J)V

    .line 91
    .line 92
    .line 93
    iget-object v3, v3, Lio/flutter/plugin/platform/o;->o:LZ2/s;

    .line 94
    .line 95
    invoke-virtual {v3, v8}, LZ2/s;->B(LZ2/D;)Landroid/view/MotionEvent;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    iget-object v6, v1, Lj3/f;->g:Ljava/lang/Object;

    .line 100
    .line 101
    check-cast v6, Ljava/util/List;

    .line 102
    .line 103
    new-instance v7, Ljava/util/ArrayList;

    .line 104
    .line 105
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 109
    .line 110
    .line 111
    move-result-object v6

    .line 112
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 113
    .line 114
    .line 115
    move-result v8

    .line 116
    const/4 v9, 0x1

    .line 117
    const/4 v10, 0x0

    .line 118
    if-eqz v8, :cond_2

    .line 119
    .line 120
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v8

    .line 124
    check-cast v8, Ljava/util/List;

    .line 125
    .line 126
    new-instance v11, Landroid/view/MotionEvent$PointerCoords;

    .line 127
    .line 128
    invoke-direct {v11}, Landroid/view/MotionEvent$PointerCoords;-><init>()V

    .line 129
    .line 130
    .line 131
    invoke-interface {v8, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v10

    .line 135
    check-cast v10, Ljava/lang/Double;

    .line 136
    .line 137
    invoke-virtual {v10}, Ljava/lang/Double;->doubleValue()D

    .line 138
    .line 139
    .line 140
    move-result-wide v12

    .line 141
    double-to-float v10, v12

    .line 142
    iput v10, v11, Landroid/view/MotionEvent$PointerCoords;->orientation:F

    .line 143
    .line 144
    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v9

    .line 148
    check-cast v9, Ljava/lang/Double;

    .line 149
    .line 150
    invoke-virtual {v9}, Ljava/lang/Double;->doubleValue()D

    .line 151
    .line 152
    .line 153
    move-result-wide v9

    .line 154
    double-to-float v9, v9

    .line 155
    iput v9, v11, Landroid/view/MotionEvent$PointerCoords;->pressure:F

    .line 156
    .line 157
    const/4 v9, 0x2

    .line 158
    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object v9

    .line 162
    check-cast v9, Ljava/lang/Double;

    .line 163
    .line 164
    invoke-virtual {v9}, Ljava/lang/Double;->doubleValue()D

    .line 165
    .line 166
    .line 167
    move-result-wide v9

    .line 168
    double-to-float v9, v9

    .line 169
    iput v9, v11, Landroid/view/MotionEvent$PointerCoords;->size:F

    .line 170
    .line 171
    const/4 v9, 0x3

    .line 172
    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v9

    .line 176
    check-cast v9, Ljava/lang/Double;

    .line 177
    .line 178
    invoke-virtual {v9}, Ljava/lang/Double;->doubleValue()D

    .line 179
    .line 180
    .line 181
    move-result-wide v9

    .line 182
    float-to-double v12, v4

    .line 183
    mul-double/2addr v9, v12

    .line 184
    double-to-float v9, v9

    .line 185
    iput v9, v11, Landroid/view/MotionEvent$PointerCoords;->toolMajor:F

    .line 186
    .line 187
    const/4 v9, 0x4

    .line 188
    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object v9

    .line 192
    check-cast v9, Ljava/lang/Double;

    .line 193
    .line 194
    invoke-virtual {v9}, Ljava/lang/Double;->doubleValue()D

    .line 195
    .line 196
    .line 197
    move-result-wide v9

    .line 198
    mul-double/2addr v9, v12

    .line 199
    double-to-float v9, v9

    .line 200
    iput v9, v11, Landroid/view/MotionEvent$PointerCoords;->toolMinor:F

    .line 201
    .line 202
    const/4 v9, 0x5

    .line 203
    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object v9

    .line 207
    check-cast v9, Ljava/lang/Double;

    .line 208
    .line 209
    invoke-virtual {v9}, Ljava/lang/Double;->doubleValue()D

    .line 210
    .line 211
    .line 212
    move-result-wide v9

    .line 213
    mul-double/2addr v9, v12

    .line 214
    double-to-float v9, v9

    .line 215
    iput v9, v11, Landroid/view/MotionEvent$PointerCoords;->touchMajor:F

    .line 216
    .line 217
    const/4 v9, 0x6

    .line 218
    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object v9

    .line 222
    check-cast v9, Ljava/lang/Double;

    .line 223
    .line 224
    invoke-virtual {v9}, Ljava/lang/Double;->doubleValue()D

    .line 225
    .line 226
    .line 227
    move-result-wide v9

    .line 228
    mul-double/2addr v9, v12

    .line 229
    double-to-float v9, v9

    .line 230
    iput v9, v11, Landroid/view/MotionEvent$PointerCoords;->touchMinor:F

    .line 231
    .line 232
    const/4 v9, 0x7

    .line 233
    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    move-result-object v9

    .line 237
    check-cast v9, Ljava/lang/Double;

    .line 238
    .line 239
    invoke-virtual {v9}, Ljava/lang/Double;->doubleValue()D

    .line 240
    .line 241
    .line 242
    move-result-wide v9

    .line 243
    mul-double/2addr v9, v12

    .line 244
    double-to-float v9, v9

    .line 245
    iput v9, v11, Landroid/view/MotionEvent$PointerCoords;->x:F

    .line 246
    .line 247
    const/16 v9, 0x8

    .line 248
    .line 249
    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 250
    .line 251
    .line 252
    move-result-object v8

    .line 253
    check-cast v8, Ljava/lang/Double;

    .line 254
    .line 255
    invoke-virtual {v8}, Ljava/lang/Double;->doubleValue()D

    .line 256
    .line 257
    .line 258
    move-result-wide v8

    .line 259
    mul-double/2addr v8, v12

    .line 260
    double-to-float v8, v8

    .line 261
    iput v8, v11, Landroid/view/MotionEvent$PointerCoords;->y:F

    .line 262
    .line 263
    invoke-virtual {v7, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 264
    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :cond_2
    new-array v4, v2, [Landroid/view/MotionEvent$PointerCoords;

    .line 269
    .line 270
    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 271
    .line 272
    .line 273
    move-result-object v4

    .line 274
    check-cast v4, [Landroid/view/MotionEvent$PointerCoords;

    .line 275
    .line 276
    if-eqz v3, :cond_4

    .line 277
    .line 278
    array-length v1, v4

    .line 279
    if-ge v1, v9, :cond_3

    .line 280
    .line 281
    goto/16 :goto_2

    .line 282
    .line 283
    :cond_3
    aget-object v1, v4, v10

    .line 284
    .line 285
    iget v1, v1, Landroid/view/MotionEvent$PointerCoords;->x:F

    .line 286
    .line 287
    invoke-virtual {v3}, Landroid/view/MotionEvent;->getX()F

    .line 288
    .line 289
    .line 290
    move-result v2

    .line 291
    sub-float/2addr v1, v2

    .line 292
    aget-object v2, v4, v10

    .line 293
    .line 294
    iget v2, v2, Landroid/view/MotionEvent$PointerCoords;->y:F

    .line 295
    .line 296
    invoke-virtual {v3}, Landroid/view/MotionEvent;->getY()F

    .line 297
    .line 298
    .line 299
    move-result v4

    .line 300
    sub-float/2addr v2, v4

    .line 301
    invoke-virtual {v3, v1, v2}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 302
    .line 303
    .line 304
    goto/16 :goto_2

    .line 305
    .line 306
    :cond_4
    iget-object v3, v1, Lj3/f;->f:Ljava/lang/Object;

    .line 307
    .line 308
    check-cast v3, Ljava/util/List;

    .line 309
    .line 310
    new-instance v6, Ljava/util/ArrayList;

    .line 311
    .line 312
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 313
    .line 314
    .line 315
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 316
    .line 317
    .line 318
    move-result-object v3

    .line 319
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 320
    .line 321
    .line 322
    move-result v7

    .line 323
    if-eqz v7, :cond_5

    .line 324
    .line 325
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 326
    .line 327
    .line 328
    move-result-object v7

    .line 329
    check-cast v7, Ljava/util/List;

    .line 330
    .line 331
    new-instance v8, Landroid/view/MotionEvent$PointerProperties;

    .line 332
    .line 333
    invoke-direct {v8}, Landroid/view/MotionEvent$PointerProperties;-><init>()V

    .line 334
    .line 335
    .line 336
    invoke-interface {v7, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 337
    .line 338
    .line 339
    move-result-object v11

    .line 340
    check-cast v11, Ljava/lang/Integer;

    .line 341
    .line 342
    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    .line 343
    .line 344
    .line 345
    move-result v11

    .line 346
    iput v11, v8, Landroid/view/MotionEvent$PointerProperties;->id:I

    .line 347
    .line 348
    invoke-interface {v7, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 349
    .line 350
    .line 351
    move-result-object v7

    .line 352
    check-cast v7, Ljava/lang/Integer;

    .line 353
    .line 354
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 355
    .line 356
    .line 357
    move-result v7

    .line 358
    iput v7, v8, Landroid/view/MotionEvent$PointerProperties;->toolType:I

    .line 359
    .line 360
    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 361
    .line 362
    .line 363
    goto :goto_1

    .line 364
    :cond_5
    new-array v2, v2, [Landroid/view/MotionEvent$PointerProperties;

    .line 365
    .line 366
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 367
    .line 368
    .line 369
    move-result-object v2

    .line 370
    move-object/from16 v17, v2

    .line 371
    .line 372
    check-cast v17, [Landroid/view/MotionEvent$PointerProperties;

    .line 373
    .line 374
    iget-object v2, v1, Lj3/f;->b:Ljava/lang/Number;

    .line 375
    .line 376
    invoke-virtual {v2}, Ljava/lang/Number;->longValue()J

    .line 377
    .line 378
    .line 379
    move-result-wide v11

    .line 380
    iget-object v2, v1, Lj3/f;->c:Ljava/lang/Number;

    .line 381
    .line 382
    invoke-virtual {v2}, Ljava/lang/Number;->longValue()J

    .line 383
    .line 384
    .line 385
    move-result-wide v13

    .line 386
    iget v15, v1, Lj3/f;->d:I

    .line 387
    .line 388
    iget v2, v1, Lj3/f;->e:I

    .line 389
    .line 390
    iget v3, v1, Lj3/f;->h:I

    .line 391
    .line 392
    iget v6, v1, Lj3/f;->i:I

    .line 393
    .line 394
    iget v7, v1, Lj3/f;->j:F

    .line 395
    .line 396
    iget v8, v1, Lj3/f;->k:F

    .line 397
    .line 398
    iget v9, v1, Lj3/f;->l:I

    .line 399
    .line 400
    iget v10, v1, Lj3/f;->m:I

    .line 401
    .line 402
    move/from16 v16, v2

    .line 403
    .line 404
    iget v2, v1, Lj3/f;->n:I

    .line 405
    .line 406
    iget v1, v1, Lj3/f;->o:I

    .line 407
    .line 408
    move/from16 v26, v1

    .line 409
    .line 410
    move/from16 v25, v2

    .line 411
    .line 412
    move/from16 v19, v3

    .line 413
    .line 414
    move-object/from16 v18, v4

    .line 415
    .line 416
    move/from16 v20, v6

    .line 417
    .line 418
    move/from16 v21, v7

    .line 419
    .line 420
    move/from16 v22, v8

    .line 421
    .line 422
    move/from16 v23, v9

    .line 423
    .line 424
    move/from16 v24, v10

    .line 425
    .line 426
    invoke-static/range {v11 .. v26}, Landroid/view/MotionEvent;->obtain(JJII[Landroid/view/MotionEvent$PointerProperties;[Landroid/view/MotionEvent$PointerCoords;IIFFIIII)Landroid/view/MotionEvent;

    .line 427
    .line 428
    .line 429
    move-result-object v3

    .line 430
    :goto_2
    invoke-virtual {v5, v3}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 431
    .line 432
    .line 433
    :goto_3
    return-void

    .line 434
    :pswitch_0
    iget v2, v1, Lj3/f;->a:I

    .line 435
    .line 436
    iget-object v3, v0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 437
    .line 438
    check-cast v3, Lio/flutter/plugin/platform/p;

    .line 439
    .line 440
    iget-object v4, v3, Lio/flutter/plugin/platform/p;->g:LZ2/d;

    .line 441
    .line 442
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 443
    .line 444
    .line 445
    move-result-object v4

    .line 446
    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 447
    .line 448
    .line 449
    move-result-object v4

    .line 450
    iget v4, v4, Landroid/util/DisplayMetrics;->density:F

    .line 451
    .line 452
    invoke-virtual {v3, v2}, Lio/flutter/plugin/platform/p;->g(I)Z

    .line 453
    .line 454
    .line 455
    move-result v5

    .line 456
    if-eqz v5, :cond_7

    .line 457
    .line 458
    iget-object v5, v3, Lio/flutter/plugin/platform/p;->n:Ljava/util/HashMap;

    .line 459
    .line 460
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 461
    .line 462
    .line 463
    move-result-object v2

    .line 464
    invoke-virtual {v5, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 465
    .line 466
    .line 467
    move-result-object v2

    .line 468
    check-cast v2, Lio/flutter/plugin/platform/B;

    .line 469
    .line 470
    const/4 v5, 0x1

    .line 471
    invoke-virtual {v3, v4, v1, v5}, Lio/flutter/plugin/platform/p;->n(FLj3/f;Z)Landroid/view/MotionEvent;

    .line 472
    .line 473
    .line 474
    move-result-object v1

    .line 475
    iget-object v2, v2, Lio/flutter/plugin/platform/B;->a:Lio/flutter/plugin/platform/SingleViewPresentation;

    .line 476
    .line 477
    if-nez v2, :cond_6

    .line 478
    .line 479
    goto :goto_4

    .line 480
    :cond_6
    invoke-virtual {v2, v1}, Landroid/app/Dialog;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 481
    .line 482
    .line 483
    goto :goto_4

    .line 484
    :cond_7
    iget-object v5, v3, Lio/flutter/plugin/platform/p;->p:Landroid/util/SparseArray;

    .line 485
    .line 486
    invoke-virtual {v5, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 487
    .line 488
    .line 489
    move-result-object v5

    .line 490
    check-cast v5, Lio/flutter/plugin/platform/e;

    .line 491
    .line 492
    const-string v6, "PlatformViewsController"

    .line 493
    .line 494
    if-nez v5, :cond_8

    .line 495
    .line 496
    new-instance v1, Ljava/lang/StringBuilder;

    .line 497
    .line 498
    const-string v3, "Sending touch to an unknown view with id: "

    .line 499
    .line 500
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 501
    .line 502
    .line 503
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 504
    .line 505
    .line 506
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 507
    .line 508
    .line 509
    move-result-object v1

    .line 510
    invoke-static {v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 511
    .line 512
    .line 513
    goto :goto_4

    .line 514
    :cond_8
    invoke-interface {v5}, Lio/flutter/plugin/platform/e;->u()Landroid/view/View;

    .line 515
    .line 516
    .line 517
    move-result-object v5

    .line 518
    if-nez v5, :cond_9

    .line 519
    .line 520
    new-instance v1, Ljava/lang/StringBuilder;

    .line 521
    .line 522
    const-string v3, "Sending touch to a null view with id: "

    .line 523
    .line 524
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 525
    .line 526
    .line 527
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 528
    .line 529
    .line 530
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 531
    .line 532
    .line 533
    move-result-object v1

    .line 534
    invoke-static {v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 535
    .line 536
    .line 537
    goto :goto_4

    .line 538
    :cond_9
    const/4 v2, 0x0

    .line 539
    invoke-virtual {v3, v4, v1, v2}, Lio/flutter/plugin/platform/p;->n(FLj3/f;Z)Landroid/view/MotionEvent;

    .line 540
    .line 541
    .line 542
    move-result-object v1

    .line 543
    invoke-virtual {v5, v1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 544
    .line 545
    .line 546
    :goto_4
    return-void

    .line 547
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public n(I)V
    .locals 9

    .line 1
    iget v0, p0, Lio/flutter/plugin/platform/m;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lio/flutter/plugin/platform/o;

    .line 9
    .line 10
    iget-object v1, v0, Lio/flutter/plugin/platform/o;->n:Landroid/util/SparseArray;

    .line 11
    .line 12
    iget-object v0, v0, Lio/flutter/plugin/platform/o;->m:Landroid/util/SparseArray;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Lio/flutter/plugin/platform/e;

    .line 19
    .line 20
    const-string v3, "PlatformViewsController2"

    .line 21
    .line 22
    if-nez v2, :cond_0

    .line 23
    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v1, "Disposing unknown platform view with id: "

    .line 27
    .line 28
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {v3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_0
    invoke-interface {v2}, Lio/flutter/plugin/platform/e;->u()Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    if-eqz v4, :cond_1

    .line 47
    .line 48
    invoke-interface {v2}, Lio/flutter/plugin/platform/e;->u()Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    invoke-virtual {v4}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    check-cast v5, Landroid/view/ViewGroup;

    .line 57
    .line 58
    if-eqz v5, :cond_1

    .line 59
    .line 60
    invoke-virtual {v5, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 64
    .line 65
    .line 66
    :try_start_0
    invoke-interface {v2}, Lio/flutter/plugin/platform/e;->a()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :catch_0
    move-exception v0

    .line 71
    const-string v2, "Disposing platform view threw an exception"

    .line 72
    .line 73
    invoke-static {v3, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 74
    .line 75
    .line 76
    :goto_0
    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Lf3/b;

    .line 81
    .line 82
    if-eqz v0, :cond_3

    .line 83
    .line 84
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0}, Lf3/b;->a()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    check-cast v2, Landroid/view/ViewGroup;

    .line 95
    .line 96
    if-eqz v2, :cond_2

    .line 97
    .line 98
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 99
    .line 100
    .line 101
    :cond_2
    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 102
    .line 103
    .line 104
    :cond_3
    :goto_1
    return-void

    .line 105
    :pswitch_0
    iget-object v0, p0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 106
    .line 107
    check-cast v0, Lio/flutter/plugin/platform/p;

    .line 108
    .line 109
    iget-object v1, v0, Lio/flutter/plugin/platform/p;->q:Landroid/util/SparseArray;

    .line 110
    .line 111
    iget-object v2, v0, Lio/flutter/plugin/platform/p;->s:Landroid/util/SparseArray;

    .line 112
    .line 113
    iget-object v3, v0, Lio/flutter/plugin/platform/p;->n:Ljava/util/HashMap;

    .line 114
    .line 115
    iget-object v4, v0, Lio/flutter/plugin/platform/p;->p:Landroid/util/SparseArray;

    .line 116
    .line 117
    invoke-virtual {v4, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v5

    .line 121
    check-cast v5, Lio/flutter/plugin/platform/e;

    .line 122
    .line 123
    const-string v6, "PlatformViewsController"

    .line 124
    .line 125
    if-nez v5, :cond_4

    .line 126
    .line 127
    new-instance v0, Ljava/lang/StringBuilder;

    .line 128
    .line 129
    const-string v1, "Disposing unknown platform view with id: "

    .line 130
    .line 131
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-static {v6, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    .line 143
    .line 144
    goto/16 :goto_3

    .line 145
    .line 146
    :cond_4
    invoke-interface {v5}, Lio/flutter/plugin/platform/e;->u()Landroid/view/View;

    .line 147
    .line 148
    .line 149
    move-result-object v7

    .line 150
    if-eqz v7, :cond_5

    .line 151
    .line 152
    invoke-interface {v5}, Lio/flutter/plugin/platform/e;->u()Landroid/view/View;

    .line 153
    .line 154
    .line 155
    move-result-object v7

    .line 156
    invoke-virtual {v7}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 157
    .line 158
    .line 159
    move-result-object v8

    .line 160
    check-cast v8, Landroid/view/ViewGroup;

    .line 161
    .line 162
    if-eqz v8, :cond_5

    .line 163
    .line 164
    invoke-virtual {v8, v7}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 165
    .line 166
    .line 167
    :cond_5
    invoke-virtual {v4, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 168
    .line 169
    .line 170
    :try_start_1
    invoke-interface {v5}, Lio/flutter/plugin/platform/e;->a()V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    .line 171
    .line 172
    .line 173
    goto :goto_2

    .line 174
    :catch_1
    move-exception v4

    .line 175
    const-string v5, "Disposing platform view threw an exception"

    .line 176
    .line 177
    invoke-static {v6, v5, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 178
    .line 179
    .line 180
    :goto_2
    invoke-virtual {v0, p1}, Lio/flutter/plugin/platform/p;->g(I)Z

    .line 181
    .line 182
    .line 183
    move-result v4

    .line 184
    if-eqz v4, :cond_7

    .line 185
    .line 186
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    check-cast v1, Lio/flutter/plugin/platform/B;

    .line 195
    .line 196
    invoke-virtual {v1}, Lio/flutter/plugin/platform/B;->a()Landroid/view/View;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    if-eqz v2, :cond_6

    .line 201
    .line 202
    iget-object v0, v0, Lio/flutter/plugin/platform/p;->o:Ljava/util/HashMap;

    .line 203
    .line 204
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 205
    .line 206
    .line 207
    move-result-object v2

    .line 208
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    :cond_6
    iget-object v0, v1, Lio/flutter/plugin/platform/B;->a:Lio/flutter/plugin/platform/SingleViewPresentation;

    .line 212
    .line 213
    invoke-virtual {v0}, Landroid/app/Dialog;->cancel()V

    .line 214
    .line 215
    .line 216
    iget-object v0, v1, Lio/flutter/plugin/platform/B;->a:Lio/flutter/plugin/platform/SingleViewPresentation;

    .line 217
    .line 218
    invoke-virtual {v0}, Lio/flutter/plugin/platform/SingleViewPresentation;->detachState()Lio/flutter/plugin/platform/u;

    .line 219
    .line 220
    .line 221
    iget-object v0, v1, Lio/flutter/plugin/platform/B;->h:Landroid/hardware/display/VirtualDisplay;

    .line 222
    .line 223
    invoke-virtual {v0}, Landroid/hardware/display/VirtualDisplay;->release()V

    .line 224
    .line 225
    .line 226
    iget-object v0, v1, Lio/flutter/plugin/platform/B;->f:Lio/flutter/plugin/platform/g;

    .line 227
    .line 228
    invoke-interface {v0}, Lio/flutter/plugin/platform/g;->release()V

    .line 229
    .line 230
    .line 231
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    invoke-virtual {v3, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    goto :goto_3

    .line 239
    :cond_7
    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    check-cast v0, Lio/flutter/plugin/platform/h;

    .line 244
    .line 245
    if-eqz v0, :cond_b

    .line 246
    .line 247
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 248
    .line 249
    .line 250
    iget-object v1, v0, Lio/flutter/plugin/platform/h;->j:Lio/flutter/plugin/platform/g;

    .line 251
    .line 252
    const/4 v3, 0x0

    .line 253
    if-eqz v1, :cond_8

    .line 254
    .line 255
    invoke-interface {v1}, Lio/flutter/plugin/platform/g;->release()V

    .line 256
    .line 257
    .line 258
    iput-object v3, v0, Lio/flutter/plugin/platform/h;->j:Lio/flutter/plugin/platform/g;

    .line 259
    .line 260
    :cond_8
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    invoke-virtual {v1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    .line 265
    .line 266
    .line 267
    move-result v4

    .line 268
    if-eqz v4, :cond_9

    .line 269
    .line 270
    iget-object v4, v0, Lio/flutter/plugin/platform/h;->k:Lf3/a;

    .line 271
    .line 272
    if-eqz v4, :cond_9

    .line 273
    .line 274
    iput-object v3, v0, Lio/flutter/plugin/platform/h;->k:Lf3/a;

    .line 275
    .line 276
    invoke-virtual {v1, v4}, Landroid/view/ViewTreeObserver;->removeOnGlobalFocusChangeListener(Landroid/view/ViewTreeObserver$OnGlobalFocusChangeListener;)V

    .line 277
    .line 278
    .line 279
    :cond_9
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 280
    .line 281
    .line 282
    move-result-object v1

    .line 283
    check-cast v1, Landroid/view/ViewGroup;

    .line 284
    .line 285
    if-eqz v1, :cond_a

    .line 286
    .line 287
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 288
    .line 289
    .line 290
    :cond_a
    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 291
    .line 292
    .line 293
    goto :goto_3

    .line 294
    :cond_b
    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 295
    .line 296
    .line 297
    move-result-object v0

    .line 298
    check-cast v0, Lf3/b;

    .line 299
    .line 300
    if-eqz v0, :cond_d

    .line 301
    .line 302
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 303
    .line 304
    .line 305
    invoke-virtual {v0}, Lf3/b;->a()V

    .line 306
    .line 307
    .line 308
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 309
    .line 310
    .line 311
    move-result-object v2

    .line 312
    check-cast v2, Landroid/view/ViewGroup;

    .line 313
    .line 314
    if-eqz v2, :cond_c

    .line 315
    .line 316
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 317
    .line 318
    .line 319
    :cond_c
    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 320
    .line 321
    .line 322
    :cond_d
    :goto_3
    return-void

    .line 323
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/view/TextureRegistry$SurfaceProducer;

    .line 4
    .line 5
    invoke-interface {v0}, Lio/flutter/view/TextureRegistry$SurfaceProducer;->release()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 10
    .line 11
    return-void
.end method

.method public scheduleFrame()V
    .locals 1

    .line 1
    iget-object v0, p0, Lio/flutter/plugin/platform/m;->f:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lio/flutter/view/TextureRegistry$SurfaceProducer;

    .line 4
    .line 5
    invoke-interface {v0}, Lio/flutter/view/TextureRegistry$SurfaceProducer;->scheduleFrame()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
