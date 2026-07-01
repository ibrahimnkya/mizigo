.class public final LI/O;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LI/i;


# instance fields
.field public final e:LI/U;

.field public final f:LI/c;

.field public final g:LN3/t;

.field public final h:LE/i;

.field public final i:LV3/c;

.field public j:I

.field public k:LN3/e0;

.field public final l:LE/i;

.field public final m:LV1/y;

.field public final n:Ly3/f;

.field public final o:Ly3/f;

.field public final p:LV1/y;


# direct methods
.method public constructor <init>(LI/U;Ljava/util/List;LI/c;LN3/t;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LI/O;->e:LI/U;

    .line 5
    .line 6
    iput-object p3, p0, LI/O;->f:LI/c;

    .line 7
    .line 8
    iput-object p4, p0, LI/O;->g:LN3/t;

    .line 9
    .line 10
    new-instance p1, LI/u;

    .line 11
    .line 12
    const/4 p3, 0x0

    .line 13
    invoke-direct {p1, p0, p3}, LI/u;-><init>(LI/O;LA3/d;)V

    .line 14
    .line 15
    .line 16
    new-instance v0, LE/i;

    .line 17
    .line 18
    invoke-direct {v0, p1}, LE/i;-><init>(LH3/p;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, LI/O;->h:LE/i;

    .line 22
    .line 23
    new-instance p1, LV3/c;

    .line 24
    .line 25
    invoke-direct {p1}, LV3/c;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, LI/O;->i:LV3/c;

    .line 29
    .line 30
    new-instance p1, LE/i;

    .line 31
    .line 32
    const/4 v0, 0x3

    .line 33
    invoke-direct {p1, v0}, LE/i;-><init>(I)V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, LI/O;->l:LE/i;

    .line 37
    .line 38
    new-instance p1, LV1/y;

    .line 39
    .line 40
    invoke-direct {p1, p0, p2}, LV1/y;-><init>(LI/O;Ljava/util/List;)V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, LI/O;->m:LV1/y;

    .line 44
    .line 45
    new-instance p1, LI/n;

    .line 46
    .line 47
    const/4 p2, 0x1

    .line 48
    invoke-direct {p1, p0, p2}, LI/n;-><init>(LI/O;I)V

    .line 49
    .line 50
    .line 51
    new-instance p2, Ly3/f;

    .line 52
    .line 53
    invoke-direct {p2, p1}, Ly3/f;-><init>(LH3/a;)V

    .line 54
    .line 55
    .line 56
    iput-object p2, p0, LI/O;->n:Ly3/f;

    .line 57
    .line 58
    new-instance p1, LI/n;

    .line 59
    .line 60
    const/4 p2, 0x0

    .line 61
    invoke-direct {p1, p0, p2}, LI/n;-><init>(LI/O;I)V

    .line 62
    .line 63
    .line 64
    new-instance p2, Ly3/f;

    .line 65
    .line 66
    invoke-direct {p2, p1}, Ly3/f;-><init>(LH3/a;)V

    .line 67
    .line 68
    .line 69
    iput-object p2, p0, LI/O;->o:Ly3/f;

    .line 70
    .line 71
    new-instance p1, LV1/y;

    .line 72
    .line 73
    new-instance p2, LI/K;

    .line 74
    .line 75
    invoke-direct {p2, p0}, LI/K;-><init>(LI/O;)V

    .line 76
    .line 77
    .line 78
    new-instance v0, LI/L;

    .line 79
    .line 80
    invoke-direct {v0, p0, p3}, LI/L;-><init>(LI/O;LA3/d;)V

    .line 81
    .line 82
    .line 83
    invoke-direct {p1, p4, p2, v0}, LV1/y;-><init>(LN3/t;LI/K;LI/L;)V

    .line 84
    .line 85
    .line 86
    iput-object p1, p0, LI/O;->p:LV1/y;

    .line 87
    .line 88
    return-void
.end method

.method public static final a(LI/O;LC3/c;)Ljava/lang/Object;
    .locals 4

    .line 1
    instance-of v0, p1, LI/v;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, LI/v;

    .line 7
    .line 8
    iget v1, v0, LI/v;->l:I

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
    iput v1, v0, LI/v;->l:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LI/v;

    .line 21
    .line 22
    invoke-direct {v0, p0, p1}, LI/v;-><init>(LI/O;LC3/c;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p1, v0, LI/v;->j:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, LI/v;->l:I

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    if-ne v1, v2, :cond_1

    .line 33
    .line 34
    iget-object p0, v0, LI/v;->i:LV3/c;

    .line 35
    .line 36
    iget-object v0, v0, LI/v;->h:LI/O;

    .line 37
    .line 38
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    move-object p1, p0

    .line 42
    move-object p0, v0

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 45
    .line 46
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 47
    .line 48
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    throw p0

    .line 52
    :cond_2
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, LI/O;->i:LV3/c;

    .line 56
    .line 57
    iput-object p0, v0, LI/v;->h:LI/O;

    .line 58
    .line 59
    iput-object p1, v0, LI/v;->i:LV3/c;

    .line 60
    .line 61
    iput v2, v0, LI/v;->l:I

    .line 62
    .line 63
    invoke-virtual {p1, v0}, LV3/c;->c(LC3/c;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    sget-object v1, LB3/a;->e:LB3/a;

    .line 68
    .line 69
    if-ne v0, v1, :cond_3

    .line 70
    .line 71
    return-object v1

    .line 72
    :cond_3
    :goto_1
    const/4 v0, 0x0

    .line 73
    :try_start_0
    iget v1, p0, LI/O;->j:I

    .line 74
    .line 75
    add-int/lit8 v1, v1, -0x1

    .line 76
    .line 77
    iput v1, p0, LI/O;->j:I

    .line 78
    .line 79
    if-nez v1, :cond_5

    .line 80
    .line 81
    iget-object v1, p0, LI/O;->k:LN3/e0;

    .line 82
    .line 83
    if-eqz v1, :cond_4

    .line 84
    .line 85
    invoke-virtual {v1, v0}, LN3/Y;->a(Ljava/util/concurrent/CancellationException;)V

    .line 86
    .line 87
    .line 88
    goto :goto_2

    .line 89
    :catchall_0
    move-exception p0

    .line 90
    goto :goto_3

    .line 91
    :cond_4
    :goto_2
    iput-object v0, p0, LI/O;->k:LN3/e0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    .line 93
    :cond_5
    invoke-virtual {p1, v0}, LV3/c;->e(Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    sget-object p0, Ly3/h;->a:Ly3/h;

    .line 97
    .line 98
    return-object p0

    .line 99
    :goto_3
    invoke-virtual {p1, v0}, LV3/c;->e(Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    throw p0
.end method

.method public static final b(LI/O;LI/b0;LC3/c;)Ljava/lang/Object;
    .locals 9

    .line 1
    instance-of v0, p2, LI/w;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, LI/w;

    .line 7
    .line 8
    iget v1, v0, LI/w;->m:I

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
    iput v1, v0, LI/w;->m:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LI/w;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, LI/w;-><init>(LI/O;LC3/c;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, LI/w;->k:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, LI/w;->m:I

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    const/4 v3, 0x3

    .line 31
    const/4 v4, 0x2

    .line 32
    const/4 v5, 0x1

    .line 33
    sget-object v6, LB3/a;->e:LB3/a;

    .line 34
    .line 35
    if-eqz v1, :cond_4

    .line 36
    .line 37
    if-eq v1, v5, :cond_3

    .line 38
    .line 39
    if-eq v1, v4, :cond_2

    .line 40
    .line 41
    if-ne v1, v3, :cond_1

    .line 42
    .line 43
    iget-object p0, v0, LI/w;->h:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast p0, LN3/l;

    .line 46
    .line 47
    :goto_1
    :try_start_0
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    .line 49
    .line 50
    goto/16 :goto_8

    .line 51
    .line 52
    :catchall_0
    move-exception p1

    .line 53
    goto/16 :goto_7

    .line 54
    .line 55
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 56
    .line 57
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 58
    .line 59
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    throw p0

    .line 63
    :cond_2
    iget-object p0, v0, LI/w;->j:LN3/m;

    .line 64
    .line 65
    iget-object p1, v0, LI/w;->i:LI/O;

    .line 66
    .line 67
    iget-object v1, v0, LI/w;->h:Ljava/lang/Object;

    .line 68
    .line 69
    check-cast v1, LI/b0;

    .line 70
    .line 71
    :try_start_1
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 72
    .line 73
    .line 74
    move-object p2, p0

    .line 75
    move-object p0, p1

    .line 76
    move-object p1, v1

    .line 77
    goto :goto_5

    .line 78
    :cond_3
    iget-object p0, v0, LI/w;->h:Ljava/lang/Object;

    .line 79
    .line 80
    check-cast p0, LN3/l;

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_4
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    iget-object p2, p1, LI/b0;->b:LN3/m;

    .line 87
    .line 88
    :try_start_2
    iget-object v1, p0, LI/O;->l:LE/i;

    .line 89
    .line 90
    invoke-virtual {v1}, LE/i;->l()LI/k0;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    instance-of v7, v1, LI/d;

    .line 95
    .line 96
    if-eqz v7, :cond_6

    .line 97
    .line 98
    iget-object v1, p1, LI/b0;->a:LC3/g;

    .line 99
    .line 100
    iget-object p1, p1, LI/b0;->d:LA3/i;

    .line 101
    .line 102
    iput-object p2, v0, LI/w;->h:Ljava/lang/Object;

    .line 103
    .line 104
    iput v5, v0, LI/w;->m:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 105
    .line 106
    :try_start_3
    invoke-virtual {p0}, LI/O;->h()LI/j0;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    new-instance v4, LI/G;

    .line 111
    .line 112
    invoke-direct {v4, p0, p1, v1, v2}, LI/G;-><init>(LI/O;LA3/i;LH3/p;LA3/d;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v3, v4, v0}, LI/j0;->b(LH3/l;LC3/c;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 119
    if-ne p0, v6, :cond_5

    .line 120
    .line 121
    goto :goto_6

    .line 122
    :cond_5
    move-object v8, p2

    .line 123
    move-object p2, p0

    .line 124
    move-object p0, v8

    .line 125
    goto :goto_8

    .line 126
    :goto_2
    move-object p1, p0

    .line 127
    goto :goto_3

    .line 128
    :catchall_1
    move-exception p0

    .line 129
    goto :goto_2

    .line 130
    :goto_3
    move-object p0, p2

    .line 131
    goto :goto_7

    .line 132
    :catchall_2
    move-exception p1

    .line 133
    goto :goto_3

    .line 134
    :cond_6
    :try_start_4
    instance-of v7, v1, LI/c0;

    .line 135
    .line 136
    if-eqz v7, :cond_7

    .line 137
    .line 138
    goto :goto_4

    .line 139
    :cond_7
    instance-of v5, v1, LI/l0;

    .line 140
    .line 141
    :goto_4
    if-eqz v5, :cond_a

    .line 142
    .line 143
    iget-object v5, p1, LI/b0;->c:LI/k0;

    .line 144
    .line 145
    if-ne v1, v5, :cond_9

    .line 146
    .line 147
    iput-object p1, v0, LI/w;->h:Ljava/lang/Object;

    .line 148
    .line 149
    iput-object p0, v0, LI/w;->i:LI/O;

    .line 150
    .line 151
    iput-object p2, v0, LI/w;->j:LN3/m;

    .line 152
    .line 153
    iput v4, v0, LI/w;->m:I

    .line 154
    .line 155
    invoke-virtual {p0, v0}, LI/O;->i(LC3/c;)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    if-ne v1, v6, :cond_8

    .line 160
    .line 161
    goto :goto_6

    .line 162
    :cond_8
    :goto_5
    iget-object v1, p1, LI/b0;->a:LC3/g;

    .line 163
    .line 164
    iget-object p1, p1, LI/b0;->d:LA3/i;

    .line 165
    .line 166
    iput-object p2, v0, LI/w;->h:Ljava/lang/Object;

    .line 167
    .line 168
    iput-object v2, v0, LI/w;->i:LI/O;

    .line 169
    .line 170
    iput-object v2, v0, LI/w;->j:LN3/m;

    .line 171
    .line 172
    iput v3, v0, LI/w;->m:I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 173
    .line 174
    :try_start_5
    invoke-virtual {p0}, LI/O;->h()LI/j0;

    .line 175
    .line 176
    .line 177
    move-result-object v3

    .line 178
    new-instance v4, LI/G;

    .line 179
    .line 180
    invoke-direct {v4, p0, p1, v1, v2}, LI/G;-><init>(LI/O;LA3/i;LH3/p;LA3/d;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {v3, v4, v0}, LI/j0;->b(LH3/l;LC3/c;)Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 187
    if-ne p0, v6, :cond_5

    .line 188
    .line 189
    :goto_6
    return-object v6

    .line 190
    :catchall_3
    move-exception p0

    .line 191
    goto :goto_2

    .line 192
    :cond_9
    :try_start_6
    const-string p0, "null cannot be cast to non-null type androidx.datastore.core.ReadException<T of androidx.datastore.core.DataStoreImpl.handleUpdate$lambda$2>"

    .line 193
    .line 194
    invoke-static {v1, p0}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    check-cast v1, LI/c0;

    .line 198
    .line 199
    iget-object p0, v1, LI/c0;->b:Ljava/lang/Throwable;

    .line 200
    .line 201
    throw p0

    .line 202
    :cond_a
    instance-of p0, v1, LI/a0;

    .line 203
    .line 204
    if-eqz p0, :cond_b

    .line 205
    .line 206
    check-cast v1, LI/a0;

    .line 207
    .line 208
    iget-object p0, v1, LI/a0;->b:Ljava/lang/Throwable;

    .line 209
    .line 210
    throw p0

    .line 211
    :cond_b
    new-instance p0, LD1/n;

    .line 212
    .line 213
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 214
    .line 215
    .line 216
    throw p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 217
    :goto_7
    invoke-static {p1}, LV0/g;->n(Ljava/lang/Throwable;)Ly3/d;

    .line 218
    .line 219
    .line 220
    move-result-object p2

    .line 221
    :goto_8
    invoke-static {p2}, Ly3/e;->a(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    check-cast p0, LN3/m;

    .line 226
    .line 227
    if-nez p1, :cond_c

    .line 228
    .line 229
    invoke-virtual {p0, p2}, LN3/Y;->K(Ljava/lang/Object;)Z

    .line 230
    .line 231
    .line 232
    goto :goto_9

    .line 233
    :cond_c
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 234
    .line 235
    .line 236
    new-instance p2, LN3/o;

    .line 237
    .line 238
    const/4 v0, 0x0

    .line 239
    invoke-direct {p2, p1, v0}, LN3/o;-><init>(Ljava/lang/Throwable;Z)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {p0, p2}, LN3/Y;->K(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    :goto_9
    sget-object p0, Ly3/h;->a:Ly3/h;

    .line 246
    .line 247
    return-object p0
.end method

.method public static final c(LI/O;LC3/c;)Ljava/lang/Object;
    .locals 4

    .line 1
    instance-of v0, p1, LI/x;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, LI/x;

    .line 7
    .line 8
    iget v1, v0, LI/x;->l:I

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
    iput v1, v0, LI/x;->l:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LI/x;

    .line 21
    .line 22
    invoke-direct {v0, p0, p1}, LI/x;-><init>(LI/O;LC3/c;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p1, v0, LI/x;->j:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, LI/x;->l:I

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    if-ne v1, v2, :cond_1

    .line 33
    .line 34
    iget-object p0, v0, LI/x;->i:LV3/c;

    .line 35
    .line 36
    iget-object v0, v0, LI/x;->h:LI/O;

    .line 37
    .line 38
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    move-object p1, p0

    .line 42
    move-object p0, v0

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 45
    .line 46
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 47
    .line 48
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    throw p0

    .line 52
    :cond_2
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, LI/O;->i:LV3/c;

    .line 56
    .line 57
    iput-object p0, v0, LI/x;->h:LI/O;

    .line 58
    .line 59
    iput-object p1, v0, LI/x;->i:LV3/c;

    .line 60
    .line 61
    iput v2, v0, LI/x;->l:I

    .line 62
    .line 63
    invoke-virtual {p1, v0}, LV3/c;->c(LC3/c;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    sget-object v1, LB3/a;->e:LB3/a;

    .line 68
    .line 69
    if-ne v0, v1, :cond_3

    .line 70
    .line 71
    return-object v1

    .line 72
    :cond_3
    :goto_1
    const/4 v0, 0x0

    .line 73
    :try_start_0
    iget v1, p0, LI/O;->j:I

    .line 74
    .line 75
    add-int/2addr v1, v2

    .line 76
    iput v1, p0, LI/O;->j:I

    .line 77
    .line 78
    if-ne v1, v2, :cond_4

    .line 79
    .line 80
    iget-object v1, p0, LI/O;->g:LN3/t;

    .line 81
    .line 82
    new-instance v2, LI/z;

    .line 83
    .line 84
    invoke-direct {v2, p0, v0}, LI/z;-><init>(LI/O;LA3/d;)V

    .line 85
    .line 86
    .line 87
    const/4 v3, 0x3

    .line 88
    invoke-static {v1, v0, v2, v3}, LN3/v;->g(LN3/t;LO3/c;LH3/p;I)LN3/e0;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    iput-object v1, p0, LI/O;->k:LN3/e0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 93
    .line 94
    goto :goto_2

    .line 95
    :catchall_0
    move-exception p0

    .line 96
    goto :goto_3

    .line 97
    :cond_4
    :goto_2
    invoke-virtual {p1, v0}, LV3/c;->e(Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    sget-object p0, Ly3/h;->a:Ly3/h;

    .line 101
    .line 102
    return-object p0

    .line 103
    :goto_3
    invoke-virtual {p1, v0}, LV3/c;->e(Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    throw p0
.end method

.method public static final f(LI/O;ZLA3/d;)Ljava/lang/Object;
    .locals 8

    .line 1
    instance-of v0, p2, LI/B;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, LI/B;

    .line 7
    .line 8
    iget v1, v0, LI/B;->m:I

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
    iput v1, v0, LI/B;->m:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LI/B;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, LI/B;-><init>(LI/O;LA3/d;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, LI/B;->k:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, LI/B;->m:I

    .line 28
    .line 29
    const/4 v2, 0x3

    .line 30
    const/4 v3, 0x2

    .line 31
    const/4 v4, 0x1

    .line 32
    sget-object v5, LB3/a;->e:LB3/a;

    .line 33
    .line 34
    if-eqz v1, :cond_4

    .line 35
    .line 36
    if-eq v1, v4, :cond_3

    .line 37
    .line 38
    if-eq v1, v3, :cond_2

    .line 39
    .line 40
    if-ne v1, v2, :cond_1

    .line 41
    .line 42
    iget-object p0, v0, LI/B;->h:LI/O;

    .line 43
    .line 44
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    goto/16 :goto_5

    .line 48
    .line 49
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 50
    .line 51
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 52
    .line 53
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    throw p0

    .line 57
    :cond_2
    iget-object p0, v0, LI/B;->h:LI/O;

    .line 58
    .line 59
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    goto :goto_3

    .line 63
    :cond_3
    iget-boolean p1, v0, LI/B;->j:Z

    .line 64
    .line 65
    iget-object p0, v0, LI/B;->i:LI/k0;

    .line 66
    .line 67
    iget-object v1, v0, LI/B;->h:LI/O;

    .line 68
    .line 69
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_4
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    iget-object p2, p0, LI/O;->l:LE/i;

    .line 77
    .line 78
    invoke-virtual {p2}, LE/i;->l()LI/k0;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    instance-of v1, p2, LI/l0;

    .line 83
    .line 84
    if-nez v1, :cond_c

    .line 85
    .line 86
    invoke-virtual {p0}, LI/O;->h()LI/j0;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    iput-object p0, v0, LI/B;->h:LI/O;

    .line 91
    .line 92
    iput-object p2, v0, LI/B;->i:LI/k0;

    .line 93
    .line 94
    iput-boolean p1, v0, LI/B;->j:Z

    .line 95
    .line 96
    iput v4, v0, LI/B;->m:I

    .line 97
    .line 98
    invoke-virtual {v1}, LI/j0;->a()Ljava/lang/Integer;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    if-ne v1, v5, :cond_5

    .line 103
    .line 104
    goto :goto_4

    .line 105
    :cond_5
    move-object v7, v1

    .line 106
    move-object v1, p0

    .line 107
    move-object p0, p2

    .line 108
    move-object p2, v7

    .line 109
    :goto_1
    check-cast p2, Ljava/lang/Number;

    .line 110
    .line 111
    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    .line 112
    .line 113
    .line 114
    move-result p2

    .line 115
    instance-of v4, p0, LI/d;

    .line 116
    .line 117
    if-eqz v4, :cond_6

    .line 118
    .line 119
    iget v6, p0, LI/k0;->a:I

    .line 120
    .line 121
    goto :goto_2

    .line 122
    :cond_6
    const/4 v6, -0x1

    .line 123
    :goto_2
    if-eqz v4, :cond_7

    .line 124
    .line 125
    if-ne p2, v6, :cond_7

    .line 126
    .line 127
    return-object p0

    .line 128
    :cond_7
    const/4 p0, 0x0

    .line 129
    if-eqz p1, :cond_9

    .line 130
    .line 131
    invoke-virtual {v1}, LI/O;->h()LI/j0;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    new-instance p2, LI/C;

    .line 136
    .line 137
    invoke-direct {p2, v1, p0}, LI/C;-><init>(LI/O;LA3/d;)V

    .line 138
    .line 139
    .line 140
    iput-object v1, v0, LI/B;->h:LI/O;

    .line 141
    .line 142
    iput-object p0, v0, LI/B;->i:LI/k0;

    .line 143
    .line 144
    iput v3, v0, LI/B;->m:I

    .line 145
    .line 146
    invoke-virtual {p1, p2, v0}, LI/j0;->b(LH3/l;LC3/c;)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    if-ne p2, v5, :cond_8

    .line 151
    .line 152
    goto :goto_4

    .line 153
    :cond_8
    move-object p0, v1

    .line 154
    :goto_3
    check-cast p2, Ly3/c;

    .line 155
    .line 156
    goto :goto_6

    .line 157
    :cond_9
    invoke-virtual {v1}, LI/O;->h()LI/j0;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    new-instance p2, LI/D;

    .line 162
    .line 163
    invoke-direct {p2, v1, v6, p0}, LI/D;-><init>(LI/O;ILA3/d;)V

    .line 164
    .line 165
    .line 166
    iput-object v1, v0, LI/B;->h:LI/O;

    .line 167
    .line 168
    iput-object p0, v0, LI/B;->i:LI/k0;

    .line 169
    .line 170
    iput v2, v0, LI/B;->m:I

    .line 171
    .line 172
    invoke-virtual {p1, p2, v0}, LI/j0;->c(LH3/p;LC3/c;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object p2

    .line 176
    if-ne p2, v5, :cond_a

    .line 177
    .line 178
    :goto_4
    return-object v5

    .line 179
    :cond_a
    move-object p0, v1

    .line 180
    :goto_5
    check-cast p2, Ly3/c;

    .line 181
    .line 182
    :goto_6
    iget-object p1, p2, Ly3/c;->e:Ljava/lang/Object;

    .line 183
    .line 184
    check-cast p1, LI/k0;

    .line 185
    .line 186
    iget-object p2, p2, Ly3/c;->f:Ljava/lang/Object;

    .line 187
    .line 188
    check-cast p2, Ljava/lang/Boolean;

    .line 189
    .line 190
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 191
    .line 192
    .line 193
    move-result p2

    .line 194
    if-eqz p2, :cond_b

    .line 195
    .line 196
    iget-object p0, p0, LI/O;->l:LE/i;

    .line 197
    .line 198
    invoke-virtual {p0, p1}, LE/i;->E(LI/k0;)V

    .line 199
    .line 200
    .line 201
    :cond_b
    return-object p1

    .line 202
    :cond_c
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 203
    .line 204
    const-string p1, "This is a bug in DataStore. Please file a bug at: https://issuetracker.google.com/issues/new?component=907884&template=1466542"

    .line 205
    .line 206
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    throw p0
.end method

.method public static final g(LI/O;ZLC3/c;)Ljava/lang/Object;
    .locals 9

    .line 1
    instance-of v0, p2, LI/E;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, LI/E;

    .line 7
    .line 8
    iget v1, v0, LI/E;->p:I

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
    iput v1, v0, LI/E;->p:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LI/E;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, LI/E;-><init>(LI/O;LC3/c;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, LI/E;->n:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, LI/E;->p:I

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    const/4 v3, 0x0

    .line 31
    sget-object v4, LB3/a;->e:LB3/a;

    .line 32
    .line 33
    packed-switch v1, :pswitch_data_0

    .line 34
    .line 35
    .line 36
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 37
    .line 38
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 39
    .line 40
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    throw p0

    .line 44
    :pswitch_0
    iget-object p0, v0, LI/E;->j:Ljava/io/Serializable;

    .line 45
    .line 46
    check-cast p0, LI3/o;

    .line 47
    .line 48
    iget-object p1, v0, LI/E;->i:Ljava/lang/Object;

    .line 49
    .line 50
    check-cast p1, LI3/p;

    .line 51
    .line 52
    iget-object v0, v0, LI/E;->h:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast v0, LI/b;

    .line 55
    .line 56
    :try_start_0
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    .line 58
    .line 59
    goto/16 :goto_9

    .line 60
    .line 61
    :catchall_0
    move-exception p0

    .line 62
    goto/16 :goto_c

    .line 63
    .line 64
    :pswitch_1
    iget-boolean p0, v0, LI/E;->l:Z

    .line 65
    .line 66
    iget-object p1, v0, LI/E;->k:LI3/p;

    .line 67
    .line 68
    iget-object v1, v0, LI/E;->j:Ljava/io/Serializable;

    .line 69
    .line 70
    check-cast v1, LI3/p;

    .line 71
    .line 72
    iget-object v5, v0, LI/E;->i:Ljava/lang/Object;

    .line 73
    .line 74
    check-cast v5, LI/b;

    .line 75
    .line 76
    iget-object v6, v0, LI/E;->h:Ljava/lang/Object;

    .line 77
    .line 78
    check-cast v6, LI/O;

    .line 79
    .line 80
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    goto/16 :goto_7

    .line 84
    .line 85
    :pswitch_2
    iget-boolean p1, v0, LI/E;->l:Z

    .line 86
    .line 87
    iget-object p0, v0, LI/E;->h:Ljava/lang/Object;

    .line 88
    .line 89
    check-cast p0, LI/O;

    .line 90
    .line 91
    :try_start_1
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_1
    .catch LI/b; {:try_start_1 .. :try_end_1} :catch_0

    .line 92
    .line 93
    .line 94
    goto/16 :goto_5

    .line 95
    .line 96
    :catch_0
    move-exception p2

    .line 97
    goto/16 :goto_6

    .line 98
    .line 99
    :pswitch_3
    iget-boolean p1, v0, LI/E;->l:Z

    .line 100
    .line 101
    iget-object p0, v0, LI/E;->h:Ljava/lang/Object;

    .line 102
    .line 103
    check-cast p0, LI/O;

    .line 104
    .line 105
    :try_start_2
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_2
    .catch LI/b; {:try_start_2 .. :try_end_2} :catch_0

    .line 106
    .line 107
    .line 108
    goto/16 :goto_4

    .line 109
    .line 110
    :pswitch_4
    iget p0, v0, LI/E;->m:I

    .line 111
    .line 112
    iget-boolean p1, v0, LI/E;->l:Z

    .line 113
    .line 114
    iget-object v1, v0, LI/E;->i:Ljava/lang/Object;

    .line 115
    .line 116
    iget-object v5, v0, LI/E;->h:Ljava/lang/Object;

    .line 117
    .line 118
    check-cast v5, LI/O;

    .line 119
    .line 120
    :try_start_3
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_3
    .catch LI/b; {:try_start_3 .. :try_end_3} :catch_1

    .line 121
    .line 122
    .line 123
    goto :goto_3

    .line 124
    :catch_1
    move-exception p2

    .line 125
    move-object p0, v5

    .line 126
    goto/16 :goto_6

    .line 127
    .line 128
    :pswitch_5
    iget-boolean p1, v0, LI/E;->l:Z

    .line 129
    .line 130
    iget-object p0, v0, LI/E;->h:Ljava/lang/Object;

    .line 131
    .line 132
    check-cast p0, LI/O;

    .line 133
    .line 134
    :try_start_4
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_4
    .catch LI/b; {:try_start_4 .. :try_end_4} :catch_0

    .line 135
    .line 136
    .line 137
    goto :goto_1

    .line 138
    :pswitch_6
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 139
    .line 140
    .line 141
    if-eqz p1, :cond_4

    .line 142
    .line 143
    :try_start_5
    iput-object p0, v0, LI/E;->h:Ljava/lang/Object;

    .line 144
    .line 145
    iput-boolean p1, v0, LI/E;->l:Z

    .line 146
    .line 147
    const/4 p2, 0x1

    .line 148
    iput p2, v0, LI/E;->p:I

    .line 149
    .line 150
    invoke-virtual {p0, v0}, LI/O;->j(LC3/c;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object p2

    .line 154
    if-ne p2, v4, :cond_1

    .line 155
    .line 156
    goto/16 :goto_a

    .line 157
    .line 158
    :cond_1
    :goto_1
    if-eqz p2, :cond_2

    .line 159
    .line 160
    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    goto :goto_2

    .line 165
    :cond_2
    move v1, v2

    .line 166
    :goto_2
    invoke-virtual {p0}, LI/O;->h()LI/j0;

    .line 167
    .line 168
    .line 169
    move-result-object v5

    .line 170
    iput-object p0, v0, LI/E;->h:Ljava/lang/Object;

    .line 171
    .line 172
    iput-object p2, v0, LI/E;->i:Ljava/lang/Object;

    .line 173
    .line 174
    iput-boolean p1, v0, LI/E;->l:Z

    .line 175
    .line 176
    iput v1, v0, LI/E;->m:I

    .line 177
    .line 178
    const/4 v6, 0x2

    .line 179
    iput v6, v0, LI/E;->p:I

    .line 180
    .line 181
    invoke-virtual {v5}, LI/j0;->a()Ljava/lang/Integer;

    .line 182
    .line 183
    .line 184
    move-result-object v5
    :try_end_5
    .catch LI/b; {:try_start_5 .. :try_end_5} :catch_0

    .line 185
    if-ne v5, v4, :cond_3

    .line 186
    .line 187
    goto/16 :goto_a

    .line 188
    .line 189
    :cond_3
    move-object v8, v5

    .line 190
    move-object v5, p0

    .line 191
    move p0, v1

    .line 192
    move-object v1, p2

    .line 193
    move-object p2, v8

    .line 194
    :goto_3
    :try_start_6
    check-cast p2, Ljava/lang/Number;

    .line 195
    .line 196
    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    .line 197
    .line 198
    .line 199
    move-result p2

    .line 200
    new-instance v6, LI/d;

    .line 201
    .line 202
    invoke-direct {v6, v1, p0, p2}, LI/d;-><init>(Ljava/lang/Object;II)V
    :try_end_6
    .catch LI/b; {:try_start_6 .. :try_end_6} :catch_1

    .line 203
    .line 204
    .line 205
    return-object v6

    .line 206
    :cond_4
    :try_start_7
    invoke-virtual {p0}, LI/O;->h()LI/j0;

    .line 207
    .line 208
    .line 209
    move-result-object p2

    .line 210
    iput-object p0, v0, LI/E;->h:Ljava/lang/Object;

    .line 211
    .line 212
    iput-boolean p1, v0, LI/E;->l:Z

    .line 213
    .line 214
    const/4 v1, 0x3

    .line 215
    iput v1, v0, LI/E;->p:I

    .line 216
    .line 217
    invoke-virtual {p2}, LI/j0;->a()Ljava/lang/Integer;

    .line 218
    .line 219
    .line 220
    move-result-object p2

    .line 221
    if-ne p2, v4, :cond_5

    .line 222
    .line 223
    goto/16 :goto_a

    .line 224
    .line 225
    :cond_5
    :goto_4
    check-cast p2, Ljava/lang/Number;

    .line 226
    .line 227
    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    .line 228
    .line 229
    .line 230
    move-result p2

    .line 231
    invoke-virtual {p0}, LI/O;->h()LI/j0;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    new-instance v5, LI/F;

    .line 236
    .line 237
    invoke-direct {v5, p0, p2, v3}, LI/F;-><init>(LI/O;ILA3/d;)V

    .line 238
    .line 239
    .line 240
    iput-object p0, v0, LI/E;->h:Ljava/lang/Object;

    .line 241
    .line 242
    iput-boolean p1, v0, LI/E;->l:Z

    .line 243
    .line 244
    const/4 p2, 0x4

    .line 245
    iput p2, v0, LI/E;->p:I

    .line 246
    .line 247
    invoke-virtual {v1, v5, v0}, LI/j0;->c(LH3/p;LC3/c;)Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    move-result-object p2

    .line 251
    if-ne p2, v4, :cond_6

    .line 252
    .line 253
    goto/16 :goto_a

    .line 254
    .line 255
    :cond_6
    :goto_5
    check-cast p2, LI/d;
    :try_end_7
    .catch LI/b; {:try_start_7 .. :try_end_7} :catch_0

    .line 256
    .line 257
    return-object p2

    .line 258
    :goto_6
    new-instance v1, LI3/p;

    .line 259
    .line 260
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 261
    .line 262
    .line 263
    iget-object v5, p0, LI/O;->f:LI/c;

    .line 264
    .line 265
    iput-object p0, v0, LI/E;->h:Ljava/lang/Object;

    .line 266
    .line 267
    iput-object p2, v0, LI/E;->i:Ljava/lang/Object;

    .line 268
    .line 269
    iput-object v1, v0, LI/E;->j:Ljava/io/Serializable;

    .line 270
    .line 271
    iput-object v1, v0, LI/E;->k:LI3/p;

    .line 272
    .line 273
    iput-boolean p1, v0, LI/E;->l:Z

    .line 274
    .line 275
    const/4 v6, 0x5

    .line 276
    iput v6, v0, LI/E;->p:I

    .line 277
    .line 278
    invoke-interface {v5, p2}, LI/c;->o(LI/b;)Ljava/lang/Object;

    .line 279
    .line 280
    .line 281
    move-result-object v5

    .line 282
    if-ne v5, v4, :cond_7

    .line 283
    .line 284
    goto :goto_a

    .line 285
    :cond_7
    move-object v6, v5

    .line 286
    move-object v5, p2

    .line 287
    move-object p2, v6

    .line 288
    move-object v6, p0

    .line 289
    move p0, p1

    .line 290
    move-object p1, v1

    .line 291
    :goto_7
    iput-object p2, p1, LI3/p;->e:Ljava/lang/Object;

    .line 292
    .line 293
    new-instance p1, LI3/o;

    .line 294
    .line 295
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 296
    .line 297
    .line 298
    :try_start_8
    new-instance p2, LI/G;

    .line 299
    .line 300
    invoke-direct {p2, v1, v6, p1, v3}, LI/G;-><init>(LI3/p;LI/O;LI3/o;LA3/d;)V

    .line 301
    .line 302
    .line 303
    iput-object v5, v0, LI/E;->h:Ljava/lang/Object;

    .line 304
    .line 305
    iput-object v1, v0, LI/E;->i:Ljava/lang/Object;

    .line 306
    .line 307
    iput-object p1, v0, LI/E;->j:Ljava/io/Serializable;

    .line 308
    .line 309
    iput-object v3, v0, LI/E;->k:LI3/p;

    .line 310
    .line 311
    const/4 v7, 0x6

    .line 312
    iput v7, v0, LI/E;->p:I

    .line 313
    .line 314
    if-eqz p0, :cond_8

    .line 315
    .line 316
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 317
    .line 318
    .line 319
    invoke-virtual {p2, v0}, LI/G;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 320
    .line 321
    .line 322
    move-result-object p0

    .line 323
    goto :goto_8

    .line 324
    :cond_8
    invoke-virtual {v6}, LI/O;->h()LI/j0;

    .line 325
    .line 326
    .line 327
    move-result-object p0

    .line 328
    new-instance v6, LI/g;

    .line 329
    .line 330
    const/4 v7, 0x1

    .line 331
    invoke-direct {v6, p2, v3, v7}, LI/g;-><init>(Ljava/lang/Object;LA3/d;I)V

    .line 332
    .line 333
    .line 334
    invoke-virtual {p0, v6, v0}, LI/j0;->b(LH3/l;LC3/c;)Ljava/lang/Object;

    .line 335
    .line 336
    .line 337
    move-result-object p0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 338
    :goto_8
    if-ne p0, v4, :cond_9

    .line 339
    .line 340
    goto :goto_a

    .line 341
    :cond_9
    move-object p0, p1

    .line 342
    move-object p1, v1

    .line 343
    :goto_9
    new-instance v4, LI/d;

    .line 344
    .line 345
    iget-object p1, p1, LI3/p;->e:Ljava/lang/Object;

    .line 346
    .line 347
    if-eqz p1, :cond_a

    .line 348
    .line 349
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 350
    .line 351
    .line 352
    move-result v2

    .line 353
    :cond_a
    iget p0, p0, LI3/o;->e:I

    .line 354
    .line 355
    invoke-direct {v4, p1, v2, p0}, LI/d;-><init>(Ljava/lang/Object;II)V

    .line 356
    .line 357
    .line 358
    :goto_a
    return-object v4

    .line 359
    :goto_b
    move-object v0, v5

    .line 360
    goto :goto_c

    .line 361
    :catchall_1
    move-exception p0

    .line 362
    goto :goto_b

    .line 363
    :goto_c
    invoke-static {v0, p0}, LT0/a;->b(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 364
    .line 365
    .line 366
    throw v0

    .line 367
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final d()LQ3/d;
    .locals 1

    .line 1
    iget-object v0, p0, LI/O;->h:LE/i;

    .line 2
    .line 3
    return-object v0
.end method

.method public final e(LH3/p;LC3/g;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p2, LC3/c;->f:LA3/i;

    .line 2
    .line 3
    invoke-static {v0}, LI3/h;->b(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    sget-object v1, LI/n0;->e:LI/n0;

    .line 7
    .line 8
    invoke-interface {v0, v1}, LA3/i;->m(LA3/h;)LA3/g;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, LI/o0;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0, p0}, LI/o0;->d(LI/O;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    new-instance v1, LI/o0;

    .line 20
    .line 21
    invoke-direct {v1, v0, p0}, LI/o0;-><init>(LI/o0;LI/O;)V

    .line 22
    .line 23
    .line 24
    new-instance v0, LI/J;

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-direct {v0, p0, p1, v2}, LI/J;-><init>(LI/O;LH3/p;LA3/d;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, v0, p2}, LN3/v;->n(LA3/i;LH3/p;LC3/g;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    return-object p1
.end method

.method public final h()LI/j0;
    .locals 1

    .line 1
    iget-object v0, p0, LI/O;->o:Ly3/f;

    .line 2
    .line 3
    invoke-virtual {v0}, Ly3/f;->a()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, LI/j0;

    .line 8
    .line 9
    return-object v0
.end method

.method public final i(LC3/c;)Ljava/lang/Object;
    .locals 6

    .line 1
    instance-of v0, p1, LI/A;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, LI/A;

    .line 7
    .line 8
    iget v1, v0, LI/A;->l:I

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
    iput v1, v0, LI/A;->l:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LI/A;

    .line 21
    .line 22
    invoke-direct {v0, p0, p1}, LI/A;-><init>(LI/O;LC3/c;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p1, v0, LI/A;->j:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, LI/A;->l:I

    .line 28
    .line 29
    const/4 v2, 0x2

    .line 30
    const/4 v3, 0x1

    .line 31
    sget-object v4, LB3/a;->e:LB3/a;

    .line 32
    .line 33
    if-eqz v1, :cond_3

    .line 34
    .line 35
    if-eq v1, v3, :cond_2

    .line 36
    .line 37
    if-ne v1, v2, :cond_1

    .line 38
    .line 39
    iget v1, v0, LI/A;->i:I

    .line 40
    .line 41
    iget-object v0, v0, LI/A;->h:LI/O;

    .line 42
    .line 43
    :try_start_0
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    .line 45
    .line 46
    goto :goto_3

    .line 47
    :catchall_0
    move-exception p1

    .line 48
    goto :goto_4

    .line 49
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 50
    .line 51
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 52
    .line 53
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    throw p1

    .line 57
    :cond_2
    iget-object v1, v0, LI/A;->h:LI/O;

    .line 58
    .line 59
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_3
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, LI/O;->h()LI/j0;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iput-object p0, v0, LI/A;->h:LI/O;

    .line 71
    .line 72
    iput v3, v0, LI/A;->l:I

    .line 73
    .line 74
    invoke-virtual {p1}, LI/j0;->a()Ljava/lang/Integer;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    if-ne p1, v4, :cond_4

    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_4
    move-object v1, p0

    .line 82
    :goto_1
    check-cast p1, Ljava/lang/Number;

    .line 83
    .line 84
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    :try_start_1
    iget-object v3, v1, LI/O;->m:LV1/y;

    .line 89
    .line 90
    iput-object v1, v0, LI/A;->h:LI/O;

    .line 91
    .line 92
    iput p1, v0, LI/A;->i:I

    .line 93
    .line 94
    iput v2, v0, LI/A;->l:I

    .line 95
    .line 96
    invoke-virtual {v3, v0}, LV1/y;->u(LC3/c;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 100
    if-ne p1, v4, :cond_5

    .line 101
    .line 102
    :goto_2
    return-object v4

    .line 103
    :cond_5
    :goto_3
    sget-object p1, Ly3/h;->a:Ly3/h;

    .line 104
    .line 105
    return-object p1

    .line 106
    :catchall_1
    move-exception v0

    .line 107
    move-object v5, v1

    .line 108
    move v1, p1

    .line 109
    move-object p1, v0

    .line 110
    move-object v0, v5

    .line 111
    :goto_4
    iget-object v0, v0, LI/O;->l:LE/i;

    .line 112
    .line 113
    new-instance v2, LI/c0;

    .line 114
    .line 115
    invoke-direct {v2, p1, v1}, LI/c0;-><init>(Ljava/lang/Throwable;I)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0, v2}, LE/i;->E(LI/k0;)V

    .line 119
    .line 120
    .line 121
    throw p1
.end method

.method public final j(LC3/c;)Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, LI/O;->n:Ly3/f;

    .line 2
    .line 3
    invoke-virtual {v0}, Ly3/f;->a()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, LI/X;

    .line 8
    .line 9
    new-instance v1, LI/r;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    const/4 v3, 0x3

    .line 13
    invoke-direct {v1, v3, v2}, LI/r;-><init>(ILA3/d;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1, p1}, LI/X;->a(LI/r;LC3/c;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    return-object p1
.end method

.method public final k(Ljava/lang/Object;ZLC3/c;)Ljava/lang/Object;
    .locals 9

    .line 1
    instance-of v0, p3, LI/M;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p3

    .line 6
    check-cast v0, LI/M;

    .line 7
    .line 8
    iget v1, v0, LI/M;->k:I

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
    iput v1, v0, LI/M;->k:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LI/M;

    .line 21
    .line 22
    invoke-direct {v0, p0, p3}, LI/M;-><init>(LI/O;LC3/c;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p3, v0, LI/M;->i:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, LI/M;->k:I

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    if-ne v1, v2, :cond_1

    .line 33
    .line 34
    iget-object p1, v0, LI/M;->h:LI3/o;

    .line 35
    .line 36
    invoke-static {p3}, LV0/g;->E(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 41
    .line 42
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 43
    .line 44
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    throw p1

    .line 48
    :cond_2
    invoke-static {p3}, LV0/g;->E(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    new-instance v4, LI3/o;

    .line 52
    .line 53
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 54
    .line 55
    .line 56
    iget-object p3, p0, LI/O;->n:Ly3/f;

    .line 57
    .line 58
    invoke-virtual {p3}, Ly3/f;->a()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    check-cast p3, LI/X;

    .line 63
    .line 64
    new-instance v3, LI/N;

    .line 65
    .line 66
    const/4 v8, 0x0

    .line 67
    move-object v5, p0

    .line 68
    move-object v6, p1

    .line 69
    move v7, p2

    .line 70
    invoke-direct/range {v3 .. v8}, LI/N;-><init>(LI3/o;LI/O;Ljava/lang/Object;ZLA3/d;)V

    .line 71
    .line 72
    .line 73
    iput-object v4, v0, LI/M;->h:LI3/o;

    .line 74
    .line 75
    iput v2, v0, LI/M;->k:I

    .line 76
    .line 77
    invoke-virtual {p3, v3, v0}, LI/X;->b(LI/N;LC3/c;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    sget-object p2, LB3/a;->e:LB3/a;

    .line 82
    .line 83
    if-ne p1, p2, :cond_3

    .line 84
    .line 85
    return-object p2

    .line 86
    :cond_3
    move-object p1, v4

    .line 87
    :goto_1
    iget p1, p1, LI3/o;->e:I

    .line 88
    .line 89
    new-instance p2, Ljava/lang/Integer;

    .line 90
    .line 91
    invoke-direct {p2, p1}, Ljava/lang/Integer;-><init>(I)V

    .line 92
    .line 93
    .line 94
    return-object p2
.end method
