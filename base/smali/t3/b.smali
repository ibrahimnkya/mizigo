.class public final synthetic Lt3/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Ljava/lang/Object;

.field public final synthetic g:I


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;II)V
    .locals 0

    .line 1
    iput p3, p0, Lt3/b;->e:I

    iput-object p1, p0, Lt3/b;->f:Ljava/lang/Object;

    iput p2, p0, Lt3/b;->g:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget v0, p0, Lt3/b;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lt3/b;->f:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lio/flutter/plugin/platform/d;

    .line 9
    .line 10
    iget-object v0, v0, Lio/flutter/plugin/platform/d;->b:LR/j;

    .line 11
    .line 12
    iget-object v0, v0, LR/j;->d:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, LZ2/s;

    .line 15
    .line 16
    iget v1, p0, Lt3/b;->g:I

    .line 17
    .line 18
    and-int/lit8 v1, v1, 0x4

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    const-string v3, "SystemChrome.systemUIChange"

    .line 22
    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    iget-object v0, v0, LZ2/s;->f:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v0, Lk3/o;

    .line 28
    .line 29
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 30
    .line 31
    filled-new-array {v1}, [Ljava/lang/Boolean;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v3, v1, v2}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iget-object v0, v0, LZ2/s;->f:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v0, Lk3/o;

    .line 46
    .line 47
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 48
    .line 49
    filled-new-array {v1}, [Ljava/lang/Boolean;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v3, v1, v2}, Lk3/o;->a(Ljava/lang/String;Ljava/lang/Object;Lk3/n;)V

    .line 58
    .line 59
    .line 60
    :goto_0
    return-void

    .line 61
    :pswitch_0
    iget-object v0, p0, Lt3/b;->f:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast v0, Lt3/f;

    .line 64
    .line 65
    iget v1, p0, Lt3/b;->g:I

    .line 66
    .line 67
    const/4 v2, -0x1

    .line 68
    const/4 v3, 0x0

    .line 69
    if-ne v1, v2, :cond_3

    .line 70
    .line 71
    iget-object v1, v0, Lt3/f;->n:Landroid/net/Uri;

    .line 72
    .line 73
    iget-object v2, v0, Lt3/f;->j:Lj3/b;

    .line 74
    .line 75
    const-string v4, ""

    .line 76
    .line 77
    if-eqz v1, :cond_1

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_1
    iget-object v1, v0, Lt3/f;->h:LN/m;

    .line 81
    .line 82
    iget-object v1, v1, LN/m;->a:Landroid/content/Context;

    .line 83
    .line 84
    const-string v5, "flutter_image_picker_shared_preference"

    .line 85
    .line 86
    const/4 v6, 0x0

    .line 87
    invoke-virtual {v1, v5, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    const-string v5, "flutter_image_picker_pending_image_uri"

    .line 92
    .line 93
    invoke-interface {v1, v5, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    :goto_1
    new-instance v5, Lt3/c;

    .line 102
    .line 103
    const/4 v6, 0x1

    .line 104
    invoke-direct {v5, v0, v6}, Lt3/c;-><init>(Lt3/f;I)V

    .line 105
    .line 106
    .line 107
    iget-object v0, v2, Lj3/b;->f:Ljava/lang/Object;

    .line 108
    .line 109
    check-cast v0, Landroid/app/Activity;

    .line 110
    .line 111
    if-eqz v1, :cond_2

    .line 112
    .line 113
    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v4

    .line 117
    :cond_2
    filled-new-array {v4}, [Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    new-instance v2, Lt3/d;

    .line 122
    .line 123
    invoke-direct {v2, v5}, Lt3/d;-><init>(Lt3/c;)V

    .line 124
    .line 125
    .line 126
    invoke-static {v0, v1, v3, v2}, Landroid/media/MediaScannerConnection;->scanFile(Landroid/content/Context;[Ljava/lang/String;[Ljava/lang/String;Landroid/media/MediaScannerConnection$OnScanCompletedListener;)V

    .line 127
    .line 128
    .line 129
    goto :goto_2

    .line 130
    :cond_3
    invoke-virtual {v0, v3}, Lt3/f;->d(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    :goto_2
    return-void

    .line 134
    :pswitch_1
    iget-object v0, p0, Lt3/b;->f:Ljava/lang/Object;

    .line 135
    .line 136
    check-cast v0, Lt3/f;

    .line 137
    .line 138
    iget v1, p0, Lt3/b;->g:I

    .line 139
    .line 140
    const/4 v2, -0x1

    .line 141
    const/4 v3, 0x0

    .line 142
    if-ne v1, v2, :cond_6

    .line 143
    .line 144
    iget-object v1, v0, Lt3/f;->n:Landroid/net/Uri;

    .line 145
    .line 146
    iget-object v2, v0, Lt3/f;->j:Lj3/b;

    .line 147
    .line 148
    const-string v4, ""

    .line 149
    .line 150
    if-eqz v1, :cond_4

    .line 151
    .line 152
    goto :goto_3

    .line 153
    :cond_4
    iget-object v1, v0, Lt3/f;->h:LN/m;

    .line 154
    .line 155
    iget-object v1, v1, LN/m;->a:Landroid/content/Context;

    .line 156
    .line 157
    const-string v5, "flutter_image_picker_shared_preference"

    .line 158
    .line 159
    const/4 v6, 0x0

    .line 160
    invoke-virtual {v1, v5, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    const-string v5, "flutter_image_picker_pending_image_uri"

    .line 165
    .line 166
    invoke-interface {v1, v5, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    :goto_3
    new-instance v5, Lt3/c;

    .line 175
    .line 176
    const/4 v6, 0x0

    .line 177
    invoke-direct {v5, v0, v6}, Lt3/c;-><init>(Lt3/f;I)V

    .line 178
    .line 179
    .line 180
    iget-object v0, v2, Lj3/b;->f:Ljava/lang/Object;

    .line 181
    .line 182
    check-cast v0, Landroid/app/Activity;

    .line 183
    .line 184
    if-eqz v1, :cond_5

    .line 185
    .line 186
    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v4

    .line 190
    :cond_5
    filled-new-array {v4}, [Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    new-instance v2, Lt3/d;

    .line 195
    .line 196
    invoke-direct {v2, v5}, Lt3/d;-><init>(Lt3/c;)V

    .line 197
    .line 198
    .line 199
    invoke-static {v0, v1, v3, v2}, Landroid/media/MediaScannerConnection;->scanFile(Landroid/content/Context;[Ljava/lang/String;[Ljava/lang/String;Landroid/media/MediaScannerConnection$OnScanCompletedListener;)V

    .line 200
    .line 201
    .line 202
    goto :goto_4

    .line 203
    :cond_6
    invoke-virtual {v0, v3}, Lt3/f;->d(Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    :goto_4
    return-void

    .line 207
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
