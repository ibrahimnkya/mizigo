.class public final synthetic Lt3/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Ljava/lang/Object;

.field public final synthetic g:I

.field public final synthetic h:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(IILjava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput p2, p0, Lt3/a;->e:I

    iput-object p3, p0, Lt3/a;->f:Ljava/lang/Object;

    iput p1, p0, Lt3/a;->g:I

    iput-object p4, p0, Lt3/a;->h:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 1
    iget v0, p0, Lt3/a;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lt3/a;->f:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, LV/a;

    .line 9
    .line 10
    iget-object v1, p0, Lt3/a;->h:Ljava/lang/Object;

    .line 11
    .line 12
    iget-object v0, v0, LV/a;->b:LV/d;

    .line 13
    .line 14
    iget v2, p0, Lt3/a;->g:I

    .line 15
    .line 16
    invoke-interface {v0, v2, v1}, LV/d;->j(ILjava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :pswitch_0
    iget-object v0, p0, Lt3/a;->f:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast v0, Lt3/f;

    .line 23
    .line 24
    iget-object v1, p0, Lt3/a;->h:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v1, Landroid/content/Intent;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    const/4 v2, -0x1

    .line 32
    iget v3, p0, Lt3/a;->g:I

    .line 33
    .line 34
    if-ne v3, v2, :cond_2

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    const/4 v2, 0x0

    .line 39
    invoke-virtual {v0, v1, v2}, Lt3/f;->e(Landroid/content/Intent;Z)Ljava/util/ArrayList;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    const/4 v4, 0x1

    .line 50
    if-ge v3, v4, :cond_0

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Lt3/e;

    .line 58
    .line 59
    iget-object v1, v1, Lt3/e;->a:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Lt3/f;->d(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_1
    :goto_0
    const-string v1, "no_valid_video_uri"

    .line 66
    .line 67
    const-string v2, "Cannot find the selected video."

    .line 68
    .line 69
    invoke-virtual {v0, v1, v2}, Lt3/f;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_2
    const/4 v1, 0x0

    .line 74
    invoke-virtual {v0, v1}, Lt3/f;->d(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :goto_1
    return-void

    .line 78
    :pswitch_1
    iget-object v0, p0, Lt3/a;->f:Ljava/lang/Object;

    .line 79
    .line 80
    check-cast v0, Lt3/f;

    .line 81
    .line 82
    iget-object v1, p0, Lt3/a;->h:Ljava/lang/Object;

    .line 83
    .line 84
    check-cast v1, Landroid/content/Intent;

    .line 85
    .line 86
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 87
    .line 88
    .line 89
    const/4 v2, -0x1

    .line 90
    iget v3, p0, Lt3/a;->g:I

    .line 91
    .line 92
    if-ne v3, v2, :cond_4

    .line 93
    .line 94
    if-eqz v1, :cond_4

    .line 95
    .line 96
    const/4 v2, 0x1

    .line 97
    invoke-virtual {v0, v1, v2}, Lt3/f;->e(Landroid/content/Intent;Z)Ljava/util/ArrayList;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    if-nez v1, :cond_3

    .line 102
    .line 103
    const-string v1, "no_valid_media_uri"

    .line 104
    .line 105
    const-string v2, "Cannot find the selected media."

    .line 106
    .line 107
    invoke-virtual {v0, v1, v2}, Lt3/f;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_3
    invoke-virtual {v0, v1}, Lt3/f;->g(Ljava/util/ArrayList;)V

    .line 112
    .line 113
    .line 114
    goto :goto_2

    .line 115
    :cond_4
    const/4 v1, 0x0

    .line 116
    invoke-virtual {v0, v1}, Lt3/f;->d(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    :goto_2
    return-void

    .line 120
    :pswitch_2
    iget-object v0, p0, Lt3/a;->f:Ljava/lang/Object;

    .line 121
    .line 122
    check-cast v0, Lt3/f;

    .line 123
    .line 124
    iget-object v1, p0, Lt3/a;->h:Ljava/lang/Object;

    .line 125
    .line 126
    check-cast v1, Landroid/content/Intent;

    .line 127
    .line 128
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 129
    .line 130
    .line 131
    const/4 v2, -0x1

    .line 132
    iget v3, p0, Lt3/a;->g:I

    .line 133
    .line 134
    if-ne v3, v2, :cond_6

    .line 135
    .line 136
    if-eqz v1, :cond_6

    .line 137
    .line 138
    const/4 v2, 0x0

    .line 139
    invoke-virtual {v0, v1, v2}, Lt3/f;->e(Landroid/content/Intent;Z)Ljava/util/ArrayList;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    if-nez v1, :cond_5

    .line 144
    .line 145
    const-string v1, "missing_valid_video_uri"

    .line 146
    .line 147
    const-string v2, "Cannot find at least one of the selected videos."

    .line 148
    .line 149
    invoke-virtual {v0, v1, v2}, Lt3/f;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    goto :goto_3

    .line 153
    :cond_5
    invoke-virtual {v0, v1}, Lt3/f;->g(Ljava/util/ArrayList;)V

    .line 154
    .line 155
    .line 156
    goto :goto_3

    .line 157
    :cond_6
    const/4 v1, 0x0

    .line 158
    invoke-virtual {v0, v1}, Lt3/f;->d(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    :goto_3
    return-void

    .line 162
    :pswitch_3
    iget-object v0, p0, Lt3/a;->f:Ljava/lang/Object;

    .line 163
    .line 164
    check-cast v0, Lt3/f;

    .line 165
    .line 166
    iget-object v1, p0, Lt3/a;->h:Ljava/lang/Object;

    .line 167
    .line 168
    check-cast v1, Landroid/content/Intent;

    .line 169
    .line 170
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 171
    .line 172
    .line 173
    const/4 v2, -0x1

    .line 174
    iget v3, p0, Lt3/a;->g:I

    .line 175
    .line 176
    if-ne v3, v2, :cond_8

    .line 177
    .line 178
    if-eqz v1, :cond_8

    .line 179
    .line 180
    const/4 v2, 0x0

    .line 181
    invoke-virtual {v0, v1, v2}, Lt3/f;->e(Landroid/content/Intent;Z)Ljava/util/ArrayList;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    if-nez v1, :cond_7

    .line 186
    .line 187
    const-string v1, "missing_valid_image_uri"

    .line 188
    .line 189
    const-string v2, "Cannot find at least one of the selected images."

    .line 190
    .line 191
    invoke-virtual {v0, v1, v2}, Lt3/f;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    goto :goto_4

    .line 195
    :cond_7
    invoke-virtual {v0, v1}, Lt3/f;->g(Ljava/util/ArrayList;)V

    .line 196
    .line 197
    .line 198
    goto :goto_4

    .line 199
    :cond_8
    const/4 v1, 0x0

    .line 200
    invoke-virtual {v0, v1}, Lt3/f;->d(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    :goto_4
    return-void

    .line 204
    :pswitch_4
    iget-object v0, p0, Lt3/a;->f:Ljava/lang/Object;

    .line 205
    .line 206
    check-cast v0, Lt3/f;

    .line 207
    .line 208
    iget-object v1, p0, Lt3/a;->h:Ljava/lang/Object;

    .line 209
    .line 210
    check-cast v1, Landroid/content/Intent;

    .line 211
    .line 212
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 213
    .line 214
    .line 215
    const/4 v2, -0x1

    .line 216
    iget v3, p0, Lt3/a;->g:I

    .line 217
    .line 218
    if-ne v3, v2, :cond_a

    .line 219
    .line 220
    if-eqz v1, :cond_a

    .line 221
    .line 222
    const/4 v2, 0x0

    .line 223
    invoke-virtual {v0, v1, v2}, Lt3/f;->e(Landroid/content/Intent;Z)Ljava/util/ArrayList;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    if-nez v1, :cond_9

    .line 228
    .line 229
    const-string v1, "no_valid_image_uri"

    .line 230
    .line 231
    const-string v2, "Cannot find the selected image."

    .line 232
    .line 233
    invoke-virtual {v0, v1, v2}, Lt3/f;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    goto :goto_5

    .line 237
    :cond_9
    invoke-virtual {v0, v1}, Lt3/f;->g(Ljava/util/ArrayList;)V

    .line 238
    .line 239
    .line 240
    goto :goto_5

    .line 241
    :cond_a
    const/4 v1, 0x0

    .line 242
    invoke-virtual {v0, v1}, Lt3/f;->d(Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    :goto_5
    return-void

    .line 246
    nop

    .line 247
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
