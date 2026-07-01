.class public final Lp2/b;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lm2/a;

.field public final b:I

.field public c:Ljava/util/LinkedHashSet;

.field public d:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Lm2/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lp2/b;->a:Lm2/a;

    const/4 p1, 0x0

    .line 3
    iput p1, p0, Lp2/b;->b:I

    return-void
.end method

.method public constructor <init>(Lm2/a;I)V
    .locals 0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    iput-object p1, p0, Lp2/b;->a:Lm2/a;

    .line 6
    iput p2, p0, Lp2/b;->b:I

    return-void
.end method


# virtual methods
.method public final a(DDLp2/a;)V
    .locals 14

    .line 1
    iget-object v0, p0, Lp2/b;->d:Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iget-object v2, p0, Lp2/b;->a:Lm2/a;

    .line 5
    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    iget-wide v3, v2, Lm2/a;->f:D

    .line 9
    .line 10
    iget-wide v5, v2, Lm2/a;->e:D

    .line 11
    .line 12
    cmpg-double v2, p3, v3

    .line 13
    .line 14
    if-gez v2, :cond_1

    .line 15
    .line 16
    cmpg-double v2, p1, v5

    .line 17
    .line 18
    if-gez v2, :cond_0

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    move-object v1, v0

    .line 26
    check-cast v1, Lp2/b;

    .line 27
    .line 28
    move-wide v2, p1

    .line 29
    move-wide/from16 v4, p3

    .line 30
    .line 31
    move-object/from16 v6, p5

    .line 32
    .line 33
    invoke-virtual/range {v1 .. v6}, Lp2/b;->a(DDLp2/a;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    move-object v2, v0

    .line 42
    check-cast v2, Lp2/b;

    .line 43
    .line 44
    move-wide v3, p1

    .line 45
    move-wide/from16 v5, p3

    .line 46
    .line 47
    move-object/from16 v7, p5

    .line 48
    .line 49
    invoke-virtual/range {v2 .. v7}, Lp2/b;->a(DDLp2/a;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    cmpg-double v1, p1, v5

    .line 54
    .line 55
    if-gez v1, :cond_2

    .line 56
    .line 57
    const/4 v1, 0x2

    .line 58
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    move-object v2, v0

    .line 63
    check-cast v2, Lp2/b;

    .line 64
    .line 65
    move-wide v3, p1

    .line 66
    move-wide/from16 v5, p3

    .line 67
    .line 68
    move-object/from16 v7, p5

    .line 69
    .line 70
    invoke-virtual/range {v2 .. v7}, Lp2/b;->a(DDLp2/a;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_2
    const/4 v1, 0x3

    .line 75
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    move-object v2, v0

    .line 80
    check-cast v2, Lp2/b;

    .line 81
    .line 82
    move-wide v3, p1

    .line 83
    move-wide/from16 v5, p3

    .line 84
    .line 85
    move-object/from16 v7, p5

    .line 86
    .line 87
    invoke-virtual/range {v2 .. v7}, Lp2/b;->a(DDLp2/a;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_3
    iget-object v0, p0, Lp2/b;->c:Ljava/util/LinkedHashSet;

    .line 92
    .line 93
    if-nez v0, :cond_4

    .line 94
    .line 95
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 96
    .line 97
    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 98
    .line 99
    .line 100
    iput-object v0, p0, Lp2/b;->c:Ljava/util/LinkedHashSet;

    .line 101
    .line 102
    :cond_4
    iget-object v0, p0, Lp2/b;->c:Ljava/util/LinkedHashSet;

    .line 103
    .line 104
    invoke-static {v0}, LI3/h;->b(Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    move-object/from16 v7, p5

    .line 108
    .line 109
    invoke-interface {v0, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Lp2/b;->c:Ljava/util/LinkedHashSet;

    .line 113
    .line 114
    invoke-static {v0}, LI3/h;->b(Ljava/lang/Object;)V

    .line 115
    .line 116
    .line 117
    invoke-interface {v0}, Ljava/util/Set;->size()I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    const/16 v3, 0x32

    .line 122
    .line 123
    if-le v0, v3, :cond_5

    .line 124
    .line 125
    const/16 v0, 0x28

    .line 126
    .line 127
    iget v3, p0, Lp2/b;->b:I

    .line 128
    .line 129
    if-ge v3, v0, :cond_5

    .line 130
    .line 131
    new-instance v0, Ljava/util/ArrayList;

    .line 132
    .line 133
    const/4 v4, 0x4

    .line 134
    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 135
    .line 136
    .line 137
    iput-object v0, p0, Lp2/b;->d:Ljava/util/ArrayList;

    .line 138
    .line 139
    new-instance v4, Lp2/b;

    .line 140
    .line 141
    new-instance v5, Lm2/a;

    .line 142
    .line 143
    iget-wide v6, v2, Lm2/a;->a:D

    .line 144
    .line 145
    iget-wide v8, v2, Lm2/a;->e:D

    .line 146
    .line 147
    iget-wide v10, v2, Lm2/a;->c:D

    .line 148
    .line 149
    iget-wide v12, v2, Lm2/a;->f:D

    .line 150
    .line 151
    invoke-direct/range {v5 .. v13}, Lm2/a;-><init>(DDDD)V

    .line 152
    .line 153
    .line 154
    add-int/2addr v3, v1

    .line 155
    invoke-direct {v4, v5, v3}, Lp2/b;-><init>(Lm2/a;I)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    iget-object v0, p0, Lp2/b;->d:Ljava/util/ArrayList;

    .line 162
    .line 163
    invoke-static {v0}, LI3/h;->b(Ljava/lang/Object;)V

    .line 164
    .line 165
    .line 166
    new-instance v1, Lp2/b;

    .line 167
    .line 168
    new-instance v4, Lm2/a;

    .line 169
    .line 170
    iget-wide v5, v2, Lm2/a;->e:D

    .line 171
    .line 172
    iget-wide v7, v2, Lm2/a;->b:D

    .line 173
    .line 174
    iget-wide v9, v2, Lm2/a;->c:D

    .line 175
    .line 176
    iget-wide v11, v2, Lm2/a;->f:D

    .line 177
    .line 178
    invoke-direct/range {v4 .. v12}, Lm2/a;-><init>(DDDD)V

    .line 179
    .line 180
    .line 181
    invoke-direct {v1, v4, v3}, Lp2/b;-><init>(Lm2/a;I)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    iget-object v0, p0, Lp2/b;->d:Ljava/util/ArrayList;

    .line 188
    .line 189
    invoke-static {v0}, LI3/h;->b(Ljava/lang/Object;)V

    .line 190
    .line 191
    .line 192
    new-instance v1, Lp2/b;

    .line 193
    .line 194
    new-instance v4, Lm2/a;

    .line 195
    .line 196
    iget-wide v5, v2, Lm2/a;->a:D

    .line 197
    .line 198
    iget-wide v7, v2, Lm2/a;->e:D

    .line 199
    .line 200
    iget-wide v9, v2, Lm2/a;->f:D

    .line 201
    .line 202
    iget-wide v11, v2, Lm2/a;->d:D

    .line 203
    .line 204
    invoke-direct/range {v4 .. v12}, Lm2/a;-><init>(DDDD)V

    .line 205
    .line 206
    .line 207
    invoke-direct {v1, v4, v3}, Lp2/b;-><init>(Lm2/a;I)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    iget-object v0, p0, Lp2/b;->d:Ljava/util/ArrayList;

    .line 214
    .line 215
    invoke-static {v0}, LI3/h;->b(Ljava/lang/Object;)V

    .line 216
    .line 217
    .line 218
    new-instance v1, Lp2/b;

    .line 219
    .line 220
    new-instance v4, Lm2/a;

    .line 221
    .line 222
    iget-wide v5, v2, Lm2/a;->e:D

    .line 223
    .line 224
    iget-wide v7, v2, Lm2/a;->b:D

    .line 225
    .line 226
    iget-wide v9, v2, Lm2/a;->f:D

    .line 227
    .line 228
    iget-wide v11, v2, Lm2/a;->d:D

    .line 229
    .line 230
    invoke-direct/range {v4 .. v12}, Lm2/a;-><init>(DDDD)V

    .line 231
    .line 232
    .line 233
    invoke-direct {v1, v4, v3}, Lp2/b;-><init>(Lm2/a;I)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 237
    .line 238
    .line 239
    iget-object v0, p0, Lp2/b;->c:Ljava/util/LinkedHashSet;

    .line 240
    .line 241
    const/4 v1, 0x0

    .line 242
    iput-object v1, p0, Lp2/b;->c:Ljava/util/LinkedHashSet;

    .line 243
    .line 244
    if-eqz v0, :cond_5

    .line 245
    .line 246
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 251
    .line 252
    .line 253
    move-result v1

    .line 254
    if-eqz v1, :cond_5

    .line 255
    .line 256
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    move-object v7, v1

    .line 261
    check-cast v7, Lp2/a;

    .line 262
    .line 263
    invoke-interface {v7}, Lp2/a;->a()Lo2/a;

    .line 264
    .line 265
    .line 266
    move-result-object v1

    .line 267
    iget-wide v3, v1, Lo2/a;->a:D

    .line 268
    .line 269
    invoke-interface {v7}, Lp2/a;->a()Lo2/a;

    .line 270
    .line 271
    .line 272
    move-result-object v1

    .line 273
    iget-wide v5, v1, Lo2/a;->b:D

    .line 274
    .line 275
    move-object v2, p0

    .line 276
    invoke-virtual/range {v2 .. v7}, Lp2/b;->a(DDLp2/a;)V

    .line 277
    .line 278
    .line 279
    goto :goto_0

    .line 280
    :cond_5
    return-void
.end method

.method public final b(DDLj2/a;)Z
    .locals 7

    .line 1
    iget-object v0, p0, Lp2/b;->d:Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    iget-object v2, p0, Lp2/b;->a:Lm2/a;

    .line 7
    .line 8
    iget-wide v3, v2, Lm2/a;->f:D

    .line 9
    .line 10
    iget-wide v5, v2, Lm2/a;->e:D

    .line 11
    .line 12
    cmpg-double v2, p3, v3

    .line 13
    .line 14
    if-gez v2, :cond_1

    .line 15
    .line 16
    cmpg-double v2, p1, v5

    .line 17
    .line 18
    if-gez v2, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    move-object v1, v0

    .line 25
    check-cast v1, Lp2/b;

    .line 26
    .line 27
    move-wide v2, p1

    .line 28
    move-wide v4, p3

    .line 29
    move-object v6, p5

    .line 30
    invoke-virtual/range {v1 .. v6}, Lp2/b;->b(DDLj2/a;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    return p1

    .line 35
    :cond_0
    move-wide v1, p1

    .line 36
    move-wide v3, p3

    .line 37
    move-object v5, p5

    .line 38
    const/4 p1, 0x1

    .line 39
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    move-object v0, p1

    .line 44
    check-cast v0, Lp2/b;

    .line 45
    .line 46
    invoke-virtual/range {v0 .. v5}, Lp2/b;->b(DDLj2/a;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    return p1

    .line 51
    :cond_1
    move-wide v1, p1

    .line 52
    move-wide v3, p3

    .line 53
    move-wide p1, v5

    .line 54
    move-object v5, p5

    .line 55
    cmpg-double p1, v1, p1

    .line 56
    .line 57
    if-gez p1, :cond_2

    .line 58
    .line 59
    const/4 p1, 0x2

    .line 60
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    move-object v0, p1

    .line 65
    check-cast v0, Lp2/b;

    .line 66
    .line 67
    invoke-virtual/range {v0 .. v5}, Lp2/b;->b(DDLj2/a;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    return p1

    .line 72
    :cond_2
    const/4 p1, 0x3

    .line 73
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    move-object v0, p1

    .line 78
    check-cast v0, Lp2/b;

    .line 79
    .line 80
    invoke-virtual/range {v0 .. v5}, Lp2/b;->b(DDLj2/a;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    return p1

    .line 85
    :cond_3
    move-object v5, p5

    .line 86
    iget-object p1, p0, Lp2/b;->c:Ljava/util/LinkedHashSet;

    .line 87
    .line 88
    if-nez p1, :cond_4

    .line 89
    .line 90
    return v1

    .line 91
    :cond_4
    invoke-interface {p1, v5}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    return p1
.end method

.method public final c(Lm2/a;Ljava/util/ArrayList;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lp2/b;->a:Lm2/a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lm2/a;->b(Lm2/a;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_2

    .line 10
    :cond_0
    iget-object v1, p0, Lp2/b;->d:Ljava/util/ArrayList;

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v2, 0x0

    .line 19
    :goto_0
    if-ge v2, v0, :cond_4

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    add-int/lit8 v2, v2, 0x1

    .line 26
    .line 27
    check-cast v3, Lp2/b;

    .line 28
    .line 29
    invoke-virtual {v3, p1, p2}, Lp2/b;->c(Lm2/a;Ljava/util/ArrayList;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-object v1, p0, Lp2/b;->c:Ljava/util/LinkedHashSet;

    .line 34
    .line 35
    if-eqz v1, :cond_4

    .line 36
    .line 37
    iget-wide v2, v0, Lm2/a;->a:D

    .line 38
    .line 39
    iget-wide v4, p1, Lm2/a;->a:D

    .line 40
    .line 41
    cmpl-double v2, v2, v4

    .line 42
    .line 43
    if-ltz v2, :cond_2

    .line 44
    .line 45
    iget-wide v2, v0, Lm2/a;->b:D

    .line 46
    .line 47
    iget-wide v4, p1, Lm2/a;->b:D

    .line 48
    .line 49
    cmpg-double v2, v2, v4

    .line 50
    .line 51
    if-gtz v2, :cond_2

    .line 52
    .line 53
    iget-wide v2, v0, Lm2/a;->c:D

    .line 54
    .line 55
    iget-wide v4, p1, Lm2/a;->c:D

    .line 56
    .line 57
    cmpl-double v2, v2, v4

    .line 58
    .line 59
    if-ltz v2, :cond_2

    .line 60
    .line 61
    iget-wide v2, v0, Lm2/a;->d:D

    .line 62
    .line 63
    iget-wide v4, p1, Lm2/a;->d:D

    .line 64
    .line 65
    cmpg-double v0, v2, v4

    .line 66
    .line 67
    if-gtz v0, :cond_2

    .line 68
    .line 69
    invoke-static {v1}, LI3/h;->b(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_2
    invoke-static {v1}, LI3/h;->b(Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    :cond_3
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-eqz v1, :cond_4

    .line 88
    .line 89
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    check-cast v1, Lp2/a;

    .line 94
    .line 95
    invoke-interface {v1}, Lp2/a;->a()Lo2/a;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    const-string v3, "point"

    .line 100
    .line 101
    invoke-static {v2, v3}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    iget-wide v3, v2, Lo2/a;->a:D

    .line 105
    .line 106
    iget-wide v5, v2, Lo2/a;->b:D

    .line 107
    .line 108
    invoke-virtual {p1, v3, v4, v5, v6}, Lm2/a;->a(DD)Z

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    if-eqz v2, :cond_3

    .line 113
    .line 114
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_4
    :goto_2
    return-void
.end method
