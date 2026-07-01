.class public final LI/m;
.super LC3/g;
.source "SourceFile"

# interfaces
.implements LH3/l;


# instance fields
.field public i:Ljava/lang/Object;

.field public j:Ljava/io/Serializable;

.field public k:Ljava/lang/Object;

.field public l:Ljava/lang/Object;

.field public m:Ljava/util/Iterator;

.field public n:I

.field public o:I

.field public final synthetic p:LI/O;

.field public final synthetic q:LV1/y;


# direct methods
.method public constructor <init>(LI/O;LV1/y;LA3/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, LI/m;->p:LI/O;

    .line 2
    .line 3
    iput-object p2, p0, LI/m;->q:LV1/y;

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-direct {p0, p1, p3}, LC3/g;-><init>(ILA3/d;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final i(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    check-cast p1, LA3/d;

    .line 2
    .line 3
    new-instance v0, LI/m;

    .line 4
    .line 5
    iget-object v1, p0, LI/m;->p:LI/O;

    .line 6
    .line 7
    iget-object v2, p0, LI/m;->q:LV1/y;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2, p1}, LI/m;-><init>(LI/O;LV1/y;LA3/d;)V

    .line 10
    .line 11
    .line 12
    sget-object p1, Ly3/h;->a:Ly3/h;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, LI/m;->m(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    return-object p1
.end method

.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 13

    .line 1
    iget v0, p0, LI/m;->o:I

    .line 2
    .line 3
    iget-object v1, p0, LI/m;->q:LV1/y;

    .line 4
    .line 5
    const/4 v2, 0x4

    .line 6
    const/4 v3, 0x3

    .line 7
    const/4 v4, 0x2

    .line 8
    iget-object v5, p0, LI/m;->p:LI/O;

    .line 9
    .line 10
    const/4 v6, 0x1

    .line 11
    const/4 v7, 0x0

    .line 12
    sget-object v8, LB3/a;->e:LB3/a;

    .line 13
    .line 14
    if-eqz v0, :cond_4

    .line 15
    .line 16
    if-eq v0, v6, :cond_3

    .line 17
    .line 18
    if-eq v0, v4, :cond_2

    .line 19
    .line 20
    if-eq v0, v3, :cond_1

    .line 21
    .line 22
    if-ne v0, v2, :cond_0

    .line 23
    .line 24
    iget v0, p0, LI/m;->n:I

    .line 25
    .line 26
    iget-object v1, p0, LI/m;->i:Ljava/lang/Object;

    .line 27
    .line 28
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    goto/16 :goto_6

    .line 32
    .line 33
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 34
    .line 35
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 36
    .line 37
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    throw p1

    .line 41
    :cond_1
    iget-object v0, p0, LI/m;->k:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast v0, LV3/a;

    .line 44
    .line 45
    iget-object v1, p0, LI/m;->j:Ljava/io/Serializable;

    .line 46
    .line 47
    check-cast v1, LI3/p;

    .line 48
    .line 49
    iget-object v3, p0, LI/m;->i:Ljava/lang/Object;

    .line 50
    .line 51
    check-cast v3, LI3/n;

    .line 52
    .line 53
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    goto/16 :goto_2

    .line 57
    .line 58
    :cond_2
    iget-object v0, p0, LI/m;->m:Ljava/util/Iterator;

    .line 59
    .line 60
    iget-object v9, p0, LI/m;->l:Ljava/lang/Object;

    .line 61
    .line 62
    check-cast v9, LI/l;

    .line 63
    .line 64
    iget-object v10, p0, LI/m;->k:Ljava/lang/Object;

    .line 65
    .line 66
    check-cast v10, LI3/p;

    .line 67
    .line 68
    iget-object v11, p0, LI/m;->j:Ljava/io/Serializable;

    .line 69
    .line 70
    check-cast v11, LI3/n;

    .line 71
    .line 72
    iget-object v12, p0, LI/m;->i:Ljava/lang/Object;

    .line 73
    .line 74
    check-cast v12, LV3/a;

    .line 75
    .line 76
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_3
    iget-object v0, p0, LI/m;->l:Ljava/lang/Object;

    .line 81
    .line 82
    check-cast v0, LI3/p;

    .line 83
    .line 84
    iget-object v9, p0, LI/m;->k:Ljava/lang/Object;

    .line 85
    .line 86
    check-cast v9, LI3/p;

    .line 87
    .line 88
    iget-object v10, p0, LI/m;->j:Ljava/io/Serializable;

    .line 89
    .line 90
    check-cast v10, LI3/n;

    .line 91
    .line 92
    iget-object v11, p0, LI/m;->i:Ljava/lang/Object;

    .line 93
    .line 94
    check-cast v11, LV3/a;

    .line 95
    .line 96
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_4
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    new-instance v11, LV3/c;

    .line 104
    .line 105
    invoke-direct {v11}, LV3/c;-><init>()V

    .line 106
    .line 107
    .line 108
    new-instance v10, LI3/n;

    .line 109
    .line 110
    invoke-direct {v10}, Ljava/lang/Object;-><init>()V

    .line 111
    .line 112
    .line 113
    new-instance v0, LI3/p;

    .line 114
    .line 115
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 116
    .line 117
    .line 118
    iput-object v11, p0, LI/m;->i:Ljava/lang/Object;

    .line 119
    .line 120
    iput-object v10, p0, LI/m;->j:Ljava/io/Serializable;

    .line 121
    .line 122
    iput-object v0, p0, LI/m;->k:Ljava/lang/Object;

    .line 123
    .line 124
    iput-object v0, p0, LI/m;->l:Ljava/lang/Object;

    .line 125
    .line 126
    iput v6, p0, LI/m;->o:I

    .line 127
    .line 128
    invoke-static {v5, v6, p0}, LI/O;->g(LI/O;ZLC3/c;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    if-ne p1, v8, :cond_5

    .line 133
    .line 134
    goto/16 :goto_5

    .line 135
    .line 136
    :cond_5
    move-object v9, v0

    .line 137
    :goto_0
    check-cast p1, LI/d;

    .line 138
    .line 139
    iget-object p1, p1, LI/d;->b:Ljava/lang/Object;

    .line 140
    .line 141
    iput-object p1, v0, LI3/p;->e:Ljava/lang/Object;

    .line 142
    .line 143
    new-instance p1, LI/l;

    .line 144
    .line 145
    invoke-direct {p1, v11, v10, v9, v5}, LI/l;-><init>(LV3/a;LI3/n;LI3/p;LI/O;)V

    .line 146
    .line 147
    .line 148
    iget-object v0, v1, LV1/y;->h:Ljava/lang/Object;

    .line 149
    .line 150
    check-cast v0, Ljava/util/List;

    .line 151
    .line 152
    if-eqz v0, :cond_8

    .line 153
    .line 154
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    move-object v12, v11

    .line 159
    move-object v11, v10

    .line 160
    move-object v10, v9

    .line 161
    move-object v9, p1

    .line 162
    :cond_6
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 163
    .line 164
    .line 165
    move-result p1

    .line 166
    if-eqz p1, :cond_7

    .line 167
    .line 168
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    check-cast p1, LH3/p;

    .line 173
    .line 174
    iput-object v12, p0, LI/m;->i:Ljava/lang/Object;

    .line 175
    .line 176
    iput-object v11, p0, LI/m;->j:Ljava/io/Serializable;

    .line 177
    .line 178
    iput-object v10, p0, LI/m;->k:Ljava/lang/Object;

    .line 179
    .line 180
    iput-object v9, p0, LI/m;->l:Ljava/lang/Object;

    .line 181
    .line 182
    iput-object v0, p0, LI/m;->m:Ljava/util/Iterator;

    .line 183
    .line 184
    iput v4, p0, LI/m;->o:I

    .line 185
    .line 186
    invoke-interface {p1, v9, p0}, LH3/p;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    if-ne p1, v8, :cond_6

    .line 191
    .line 192
    goto :goto_5

    .line 193
    :cond_7
    move-object v9, v10

    .line 194
    move-object v10, v11

    .line 195
    move-object v11, v12

    .line 196
    :cond_8
    iput-object v7, v1, LV1/y;->h:Ljava/lang/Object;

    .line 197
    .line 198
    iput-object v10, p0, LI/m;->i:Ljava/lang/Object;

    .line 199
    .line 200
    iput-object v9, p0, LI/m;->j:Ljava/io/Serializable;

    .line 201
    .line 202
    iput-object v11, p0, LI/m;->k:Ljava/lang/Object;

    .line 203
    .line 204
    iput-object v7, p0, LI/m;->l:Ljava/lang/Object;

    .line 205
    .line 206
    iput-object v7, p0, LI/m;->m:Ljava/util/Iterator;

    .line 207
    .line 208
    iput v3, p0, LI/m;->o:I

    .line 209
    .line 210
    move-object v0, v11

    .line 211
    check-cast v0, LV3/c;

    .line 212
    .line 213
    invoke-virtual {v0, p0}, LV3/c;->c(LC3/c;)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    if-ne p1, v8, :cond_9

    .line 218
    .line 219
    goto :goto_5

    .line 220
    :cond_9
    move-object v1, v9

    .line 221
    move-object v3, v10

    .line 222
    :goto_2
    :try_start_0
    iput-boolean v6, v3, LI3/n;->e:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 223
    .line 224
    check-cast v0, LV3/c;

    .line 225
    .line 226
    invoke-virtual {v0, v7}, LV3/c;->e(Ljava/lang/Object;)V

    .line 227
    .line 228
    .line 229
    iget-object v1, v1, LI3/p;->e:Ljava/lang/Object;

    .line 230
    .line 231
    if-eqz v1, :cond_a

    .line 232
    .line 233
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 234
    .line 235
    .line 236
    move-result p1

    .line 237
    :goto_3
    move v0, p1

    .line 238
    goto :goto_4

    .line 239
    :cond_a
    const/4 p1, 0x0

    .line 240
    goto :goto_3

    .line 241
    :goto_4
    invoke-virtual {v5}, LI/O;->h()LI/j0;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    iput-object v1, p0, LI/m;->i:Ljava/lang/Object;

    .line 246
    .line 247
    iput-object v7, p0, LI/m;->j:Ljava/io/Serializable;

    .line 248
    .line 249
    iput-object v7, p0, LI/m;->k:Ljava/lang/Object;

    .line 250
    .line 251
    iput v0, p0, LI/m;->n:I

    .line 252
    .line 253
    iput v2, p0, LI/m;->o:I

    .line 254
    .line 255
    invoke-virtual {p1}, LI/j0;->a()Ljava/lang/Integer;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    if-ne p1, v8, :cond_b

    .line 260
    .line 261
    :goto_5
    return-object v8

    .line 262
    :cond_b
    :goto_6
    check-cast p1, Ljava/lang/Number;

    .line 263
    .line 264
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    .line 265
    .line 266
    .line 267
    move-result p1

    .line 268
    new-instance v2, LI/d;

    .line 269
    .line 270
    invoke-direct {v2, v1, v0, p1}, LI/d;-><init>(Ljava/lang/Object;II)V

    .line 271
    .line 272
    .line 273
    return-object v2

    .line 274
    :catchall_0
    move-exception p1

    .line 275
    check-cast v0, LV3/c;

    .line 276
    .line 277
    invoke-virtual {v0, v7}, LV3/c;->e(Ljava/lang/Object;)V

    .line 278
    .line 279
    .line 280
    throw p1
.end method
