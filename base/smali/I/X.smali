.class public final LI/X;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LI/a;


# instance fields
.field public final a:Ljava/io/File;

.field public final b:LI/j0;

.field public final c:LI/T;

.field public final d:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final e:LV3/c;


# direct methods
.method public constructor <init>(Ljava/io/File;LI/j0;LI/T;)V
    .locals 1

    .line 1
    const-string v0, "coordinator"

    .line 2
    .line 3
    invoke-static {p2, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, LI/X;->a:Ljava/io/File;

    .line 10
    .line 11
    iput-object p2, p0, LI/X;->b:LI/j0;

    .line 12
    .line 13
    iput-object p3, p0, LI/X;->c:LI/T;

    .line 14
    .line 15
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 16
    .line 17
    const/4 p2, 0x0

    .line 18
    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, LI/X;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 22
    .line 23
    new-instance p1, LV3/c;

    .line 24
    .line 25
    invoke-direct {p1}, LV3/c;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, LI/X;->e:LV3/c;

    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public final a(LI/r;LC3/c;)Ljava/lang/Object;
    .locals 5

    .line 1
    instance-of v0, p2, LI/V;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, LI/V;

    .line 7
    .line 8
    iget v1, v0, LI/V;->m:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, LI/V;->m:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LI/V;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, LI/V;-><init>(LI/X;LC3/c;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, LI/V;->k:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, LI/V;->m:I

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    const/4 v3, 0x0

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    if-ne v1, v2, :cond_1

    .line 34
    .line 35
    iget-boolean p1, v0, LI/V;->j:Z

    .line 36
    .line 37
    iget-object v1, v0, LI/V;->i:LI/Q;

    .line 38
    .line 39
    iget-object v0, v0, LI/V;->h:LI/X;

    .line 40
    .line 41
    :try_start_0
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :catchall_0
    move-exception p2

    .line 46
    goto :goto_3

    .line 47
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 48
    .line 49
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 50
    .line 51
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    throw p1

    .line 55
    :cond_2
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    iget-object p2, p0, LI/X;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 59
    .line 60
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    if-nez p2, :cond_7

    .line 65
    .line 66
    iget-object p2, p0, LI/X;->e:LV3/c;

    .line 67
    .line 68
    invoke-virtual {p2}, LV3/c;->d()Z

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    :try_start_1
    new-instance v1, LI/Q;

    .line 73
    .line 74
    iget-object v4, p0, LI/X;->a:Ljava/io/File;

    .line 75
    .line 76
    invoke-direct {v1, v4}, LI/Q;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_5

    .line 77
    .line 78
    .line 79
    :try_start_2
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    iput-object p0, v0, LI/V;->h:LI/X;

    .line 84
    .line 85
    iput-object v1, v0, LI/V;->i:LI/Q;

    .line 86
    .line 87
    iput-boolean p2, v0, LI/V;->j:Z

    .line 88
    .line 89
    iput v2, v0, LI/V;->m:I

    .line 90
    .line 91
    invoke-virtual {p1, v1, v4, v0}, LI/r;->f(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 95
    sget-object v0, LB3/a;->e:LB3/a;

    .line 96
    .line 97
    if-ne p1, v0, :cond_3

    .line 98
    .line 99
    return-object v0

    .line 100
    :cond_3
    move v0, p2

    .line 101
    move-object p2, p1

    .line 102
    move p1, v0

    .line 103
    move-object v0, p0

    .line 104
    :goto_1
    :try_start_3
    invoke-interface {v1}, LI/a;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 105
    .line 106
    .line 107
    move-object v1, v3

    .line 108
    goto :goto_2

    .line 109
    :catchall_1
    move-exception v1

    .line 110
    :goto_2
    if-nez v1, :cond_5

    .line 111
    .line 112
    if-eqz p1, :cond_4

    .line 113
    .line 114
    iget-object p1, v0, LI/X;->e:LV3/c;

    .line 115
    .line 116
    invoke-virtual {p1, v3}, LV3/c;->e(Ljava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    :cond_4
    return-object p2

    .line 120
    :cond_5
    :try_start_4
    throw v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 121
    :catchall_2
    move-exception p2

    .line 122
    goto :goto_5

    .line 123
    :catchall_3
    move-exception p1

    .line 124
    move v0, p2

    .line 125
    move-object p2, p1

    .line 126
    move p1, v0

    .line 127
    move-object v0, p0

    .line 128
    :goto_3
    :try_start_5
    invoke-interface {v1}, LI/a;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 129
    .line 130
    .line 131
    goto :goto_4

    .line 132
    :catchall_4
    move-exception v1

    .line 133
    :try_start_6
    invoke-static {p2, v1}, LT0/a;->b(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 134
    .line 135
    .line 136
    :goto_4
    throw p2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 137
    :catchall_5
    move-exception p1

    .line 138
    move v0, p2

    .line 139
    move-object p2, p1

    .line 140
    move p1, v0

    .line 141
    move-object v0, p0

    .line 142
    :goto_5
    if-eqz p1, :cond_6

    .line 143
    .line 144
    iget-object p1, v0, LI/X;->e:LV3/c;

    .line 145
    .line 146
    invoke-virtual {p1, v3}, LV3/c;->e(Ljava/lang/Object;)V

    .line 147
    .line 148
    .line 149
    :cond_6
    throw p2

    .line 150
    :cond_7
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 151
    .line 152
    const-string p2, "StorageConnection has already been disposed."

    .line 153
    .line 154
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    throw p1
.end method

.method public final b(LI/N;LC3/c;)Ljava/lang/Object;
    .locals 9

    .line 1
    const-string v0, "Unable to rename "

    .line 2
    .line 3
    instance-of v1, p2, LI/W;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    move-object v1, p2

    .line 8
    check-cast v1, LI/W;

    .line 9
    .line 10
    iget v2, v1, LI/W;->n:I

    .line 11
    .line 12
    const/high16 v3, -0x80000000

    .line 13
    .line 14
    and-int v4, v2, v3

    .line 15
    .line 16
    if-eqz v4, :cond_0

    .line 17
    .line 18
    sub-int/2addr v2, v3

    .line 19
    iput v2, v1, LI/W;->n:I

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-instance v1, LI/W;

    .line 23
    .line 24
    invoke-direct {v1, p0, p2}, LI/W;-><init>(LI/X;LC3/c;)V

    .line 25
    .line 26
    .line 27
    :goto_0
    iget-object p2, v1, LI/W;->l:Ljava/lang/Object;

    .line 28
    .line 29
    iget v2, v1, LI/W;->n:I

    .line 30
    .line 31
    const/4 v3, 0x2

    .line 32
    const/4 v4, 0x1

    .line 33
    const/4 v5, 0x0

    .line 34
    sget-object v6, LB3/a;->e:LB3/a;

    .line 35
    .line 36
    if-eqz v2, :cond_3

    .line 37
    .line 38
    if-eq v2, v4, :cond_2

    .line 39
    .line 40
    if-ne v2, v3, :cond_1

    .line 41
    .line 42
    iget-object p1, v1, LI/W;->k:LI/Z;

    .line 43
    .line 44
    iget-object v2, v1, LI/W;->j:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast v2, Ljava/io/File;

    .line 47
    .line 48
    iget-object v3, v1, LI/W;->i:Ljava/lang/Object;

    .line 49
    .line 50
    check-cast v3, LV3/a;

    .line 51
    .line 52
    iget-object v1, v1, LI/W;->h:LI/X;

    .line 53
    .line 54
    :try_start_0
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    .line 56
    .line 57
    goto/16 :goto_4

    .line 58
    .line 59
    :catchall_0
    move-exception p2

    .line 60
    goto/16 :goto_8

    .line 61
    .line 62
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 63
    .line 64
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 65
    .line 66
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    throw p1

    .line 70
    :cond_2
    iget-object p1, v1, LI/W;->j:Ljava/lang/Object;

    .line 71
    .line 72
    check-cast p1, LV3/a;

    .line 73
    .line 74
    iget-object v2, v1, LI/W;->i:Ljava/lang/Object;

    .line 75
    .line 76
    check-cast v2, LH3/p;

    .line 77
    .line 78
    iget-object v4, v1, LI/W;->h:LI/X;

    .line 79
    .line 80
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    move-object p2, p1

    .line 84
    move-object p1, v2

    .line 85
    goto :goto_2

    .line 86
    :cond_3
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    iget-object p2, p0, LI/X;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 90
    .line 91
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    if-nez p2, :cond_d

    .line 96
    .line 97
    iget-object p2, p0, LI/X;->a:Ljava/io/File;

    .line 98
    .line 99
    invoke-virtual {p2}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    if-eqz v2, :cond_5

    .line 108
    .line 109
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 110
    .line 111
    .line 112
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    if-eqz v2, :cond_4

    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_4
    new-instance p1, Ljava/io/IOException;

    .line 120
    .line 121
    new-instance v0, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    const-string v1, "Unable to create parent directories of "

    .line 124
    .line 125
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p2

    .line 135
    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    throw p1

    .line 139
    :cond_5
    :goto_1
    iput-object p0, v1, LI/W;->h:LI/X;

    .line 140
    .line 141
    iput-object p1, v1, LI/W;->i:Ljava/lang/Object;

    .line 142
    .line 143
    iget-object p2, p0, LI/X;->e:LV3/c;

    .line 144
    .line 145
    iput-object p2, v1, LI/W;->j:Ljava/lang/Object;

    .line 146
    .line 147
    iput v4, v1, LI/W;->n:I

    .line 148
    .line 149
    invoke-virtual {p2, v1}, LV3/c;->c(LC3/c;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    if-ne v2, v6, :cond_6

    .line 154
    .line 155
    goto :goto_3

    .line 156
    :cond_6
    move-object v4, p0

    .line 157
    :goto_2
    :try_start_1
    new-instance v2, Ljava/io/File;

    .line 158
    .line 159
    new-instance v7, Ljava/lang/StringBuilder;

    .line 160
    .line 161
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 162
    .line 163
    .line 164
    iget-object v8, v4, LI/X;->a:Ljava/io/File;

    .line 165
    .line 166
    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v8

    .line 170
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    const-string v8, ".tmp"

    .line 174
    .line 175
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v7

    .line 182
    invoke-direct {v2, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_5

    .line 183
    .line 184
    .line 185
    :try_start_2
    new-instance v7, LI/Z;

    .line 186
    .line 187
    invoke-direct {v7, v2}, LI/Q;-><init>(Ljava/io/File;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_5

    .line 188
    .line 189
    .line 190
    :try_start_3
    iput-object v4, v1, LI/W;->h:LI/X;

    .line 191
    .line 192
    iput-object p2, v1, LI/W;->i:Ljava/lang/Object;

    .line 193
    .line 194
    iput-object v2, v1, LI/W;->j:Ljava/lang/Object;

    .line 195
    .line 196
    iput-object v7, v1, LI/W;->k:LI/Z;

    .line 197
    .line 198
    iput v3, v1, LI/W;->n:I

    .line 199
    .line 200
    invoke-interface {p1, v7, v1}, LH3/p;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    .line 202
    .line 203
    move-result-object p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 204
    if-ne p1, v6, :cond_7

    .line 205
    .line 206
    :goto_3
    return-object v6

    .line 207
    :cond_7
    move-object v3, p2

    .line 208
    move-object v1, v4

    .line 209
    move-object p1, v7

    .line 210
    :goto_4
    :try_start_4
    invoke-interface {p1}, LI/a;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 211
    .line 212
    .line 213
    move-object p1, v5

    .line 214
    goto :goto_5

    .line 215
    :catchall_1
    move-exception p1

    .line 216
    :goto_5
    if-nez p1, :cond_b

    .line 217
    .line 218
    :try_start_5
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 219
    .line 220
    .line 221
    move-result p1

    .line 222
    if-eqz p1, :cond_a

    .line 223
    .line 224
    iget-object p1, v1, LI/X;->a:Ljava/io/File;

    .line 225
    .line 226
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 227
    .line 228
    const/16 v4, 0x1a

    .line 229
    .line 230
    if-lt p2, v4, :cond_8

    .line 231
    .line 232
    invoke-static {v2, p1}, LD/f;->f(Ljava/io/File;Ljava/io/File;)Z

    .line 233
    .line 234
    .line 235
    move-result p1

    .line 236
    goto :goto_6

    .line 237
    :cond_8
    invoke-virtual {v2, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 238
    .line 239
    .line 240
    move-result p1

    .line 241
    :goto_6
    if-eqz p1, :cond_9

    .line 242
    .line 243
    goto :goto_7

    .line 244
    :cond_9
    new-instance p1, Ljava/io/IOException;

    .line 245
    .line 246
    new-instance p2, Ljava/lang/StringBuilder;

    .line 247
    .line 248
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    const-string v0, " to "

    .line 255
    .line 256
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 257
    .line 258
    .line 259
    iget-object v0, v1, LI/X;->a:Ljava/io/File;

    .line 260
    .line 261
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    const-string v0, ". This likely means that there are multiple instances of DataStore for this file. Ensure that you are only creating a single instance of datastore for this file."

    .line 265
    .line 266
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    .line 268
    .line 269
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object p2

    .line 273
    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    throw p1
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 277
    :catchall_2
    move-exception p1

    .line 278
    move-object p2, v3

    .line 279
    goto :goto_b

    .line 280
    :catch_0
    move-exception p1

    .line 281
    move-object p2, v3

    .line 282
    goto :goto_a

    .line 283
    :cond_a
    :goto_7
    check-cast v3, LV3/c;

    .line 284
    .line 285
    invoke-virtual {v3, v5}, LV3/c;->e(Ljava/lang/Object;)V

    .line 286
    .line 287
    .line 288
    sget-object p1, Ly3/h;->a:Ly3/h;

    .line 289
    .line 290
    return-object p1

    .line 291
    :cond_b
    :try_start_6
    throw p1
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 292
    :catchall_3
    move-exception p1

    .line 293
    move-object v3, p2

    .line 294
    move-object p2, p1

    .line 295
    move-object p1, v7

    .line 296
    :goto_8
    :try_start_7
    invoke-interface {p1}, LI/a;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 297
    .line 298
    .line 299
    goto :goto_9

    .line 300
    :catchall_4
    move-exception p1

    .line 301
    :try_start_8
    invoke-static {p2, p1}, LT0/a;->b(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 302
    .line 303
    .line 304
    :goto_9
    throw p2
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 305
    :catchall_5
    move-exception p1

    .line 306
    goto :goto_b

    .line 307
    :catch_1
    move-exception p1

    .line 308
    :goto_a
    :try_start_9
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 309
    .line 310
    .line 311
    move-result v0

    .line 312
    if-eqz v0, :cond_c

    .line 313
    .line 314
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 315
    .line 316
    .line 317
    :cond_c
    throw p1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    .line 318
    :goto_b
    check-cast p2, LV3/c;

    .line 319
    .line 320
    invoke-virtual {p2, v5}, LV3/c;->e(Ljava/lang/Object;)V

    .line 321
    .line 322
    .line 323
    throw p1

    .line 324
    :cond_d
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 325
    .line 326
    const-string p2, "StorageConnection has already been disposed."

    .line 327
    .line 328
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 329
    .line 330
    .line 331
    throw p1
.end method

.method public final close()V
    .locals 2

    .line 1
    iget-object v0, p0, LI/X;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, LI/X;->c:LI/T;

    .line 8
    .line 9
    invoke-virtual {v0}, LI/T;->a()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    return-void
.end method
