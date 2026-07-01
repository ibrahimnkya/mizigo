.class public Lc2/m;
.super LZ1/s;
.source "SourceFile"


# static fields
.field public static final a:Lc2/m;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lc2/m;

    .line 2
    .line 3
    invoke-direct {v0}, Lc2/m;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lc2/m;->a:Lc2/m;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static d(Lh2/a;I)LZ1/h;
    .locals 2

    .line 1
    invoke-static {p1}, LL/i;->b(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x5

    .line 6
    if-eq v0, v1, :cond_3

    .line 7
    .line 8
    const/4 v1, 0x6

    .line 9
    if-eq v0, v1, :cond_2

    .line 10
    .line 11
    const/4 v1, 0x7

    .line 12
    if-eq v0, v1, :cond_1

    .line 13
    .line 14
    const/16 v1, 0x8

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Lh2/a;->t()V

    .line 19
    .line 20
    .line 21
    sget-object p0, LZ1/j;->e:LZ1/j;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 25
    .line 26
    invoke-static {p1}, LE1/j;->q(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string v0, "Unexpected token: "

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    throw p0

    .line 40
    :cond_1
    new-instance p1, LZ1/l;

    .line 41
    .line 42
    invoke-virtual {p0}, Lh2/a;->n()Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-direct {p1, p0}, LZ1/l;-><init>(Ljava/lang/Boolean;)V

    .line 51
    .line 52
    .line 53
    return-object p1

    .line 54
    :cond_2
    invoke-virtual {p0}, Lh2/a;->v()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    new-instance p1, LZ1/l;

    .line 59
    .line 60
    new-instance v0, Lb2/j;

    .line 61
    .line 62
    invoke-direct {v0, p0}, Lb2/j;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-direct {p1, v0}, LZ1/l;-><init>(Ljava/lang/Number;)V

    .line 66
    .line 67
    .line 68
    return-object p1

    .line 69
    :cond_3
    new-instance p1, LZ1/l;

    .line 70
    .line 71
    invoke-virtual {p0}, Lh2/a;->v()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-direct {p1, p0}, LZ1/l;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return-object p1
.end method

.method public static e(Lh2/b;LZ1/h;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_a

    .line 2
    .line 3
    instance-of v0, p1, LZ1/j;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_2

    .line 8
    .line 9
    :cond_0
    instance-of v0, p1, LZ1/l;

    .line 10
    .line 11
    if-eqz v0, :cond_4

    .line 12
    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    check-cast p1, LZ1/l;

    .line 16
    .line 17
    iget-object v0, p1, LZ1/l;->e:Ljava/io/Serializable;

    .line 18
    .line 19
    instance-of v1, v0, Ljava/lang/Number;

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p1}, LZ1/l;->g()Ljava/lang/Number;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Lh2/b;->q(Ljava/lang/Number;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    instance-of v0, v0, Ljava/lang/Boolean;

    .line 32
    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    invoke-virtual {p1}, LZ1/l;->b()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-virtual {p0, p1}, Lh2/b;->s(Z)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    invoke-virtual {p1}, LZ1/l;->d()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p0, p1}, Lh2/b;->r(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_3
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 52
    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string v1, "Not a JSON Primitive: "

    .line 56
    .line 57
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    throw p0

    .line 71
    :cond_4
    instance-of v0, p1, LZ1/f;

    .line 72
    .line 73
    if-eqz v0, :cond_7

    .line 74
    .line 75
    invoke-virtual {p0}, Lh2/b;->b()V

    .line 76
    .line 77
    .line 78
    if-eqz v0, :cond_6

    .line 79
    .line 80
    check-cast p1, LZ1/f;

    .line 81
    .line 82
    iget-object p1, p1, LZ1/f;->e:Ljava/util/ArrayList;

    .line 83
    .line 84
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    const/4 v1, 0x0

    .line 89
    :goto_0
    if-ge v1, v0, :cond_5

    .line 90
    .line 91
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    add-int/lit8 v1, v1, 0x1

    .line 96
    .line 97
    check-cast v2, LZ1/h;

    .line 98
    .line 99
    invoke-static {p0, v2}, Lc2/m;->e(Lh2/b;LZ1/h;)V

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_5
    invoke-virtual {p0}, Lh2/b;->e()V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_6
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 108
    .line 109
    new-instance v0, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    const-string v1, "Not a JSON Array: "

    .line 112
    .line 113
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    throw p0

    .line 127
    :cond_7
    instance-of v0, p1, LZ1/k;

    .line 128
    .line 129
    if-eqz v0, :cond_9

    .line 130
    .line 131
    invoke-virtual {p0}, Lh2/b;->c()V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p1}, LZ1/h;->c()LZ1/k;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    iget-object p1, p1, LZ1/k;->e:Lb2/n;

    .line 139
    .line 140
    invoke-virtual {p1}, Lb2/n;->entrySet()Ljava/util/Set;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    check-cast p1, Lb2/l;

    .line 145
    .line 146
    invoke-virtual {p1}, Lb2/l;->iterator()Ljava/util/Iterator;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    :goto_1
    move-object v0, p1

    .line 151
    check-cast v0, Lb2/k;

    .line 152
    .line 153
    invoke-virtual {v0}, Lb2/k;->hasNext()Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-eqz v0, :cond_8

    .line 158
    .line 159
    move-object v0, p1

    .line 160
    check-cast v0, Lb2/k;

    .line 161
    .line 162
    invoke-virtual {v0}, Lb2/k;->b()Lb2/m;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    check-cast v1, Ljava/lang/String;

    .line 171
    .line 172
    invoke-virtual {p0, v1}, Lh2/b;->g(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    check-cast v0, LZ1/h;

    .line 180
    .line 181
    invoke-static {p0, v0}, Lc2/m;->e(Lh2/b;LZ1/h;)V

    .line 182
    .line 183
    .line 184
    goto :goto_1

    .line 185
    :cond_8
    invoke-virtual {p0}, Lh2/b;->f()V

    .line 186
    .line 187
    .line 188
    return-void

    .line 189
    :cond_9
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 190
    .line 191
    new-instance v0, Ljava/lang/StringBuilder;

    .line 192
    .line 193
    const-string v1, "Couldn\'t write "

    .line 194
    .line 195
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    throw p0

    .line 213
    :cond_a
    :goto_2
    invoke-virtual {p0}, Lh2/b;->i()Lh2/b;

    .line 214
    .line 215
    .line 216
    return-void
.end method


# virtual methods
.method public final b(Lh2/a;)Ljava/lang/Object;
    .locals 8

    .line 1
    instance-of v0, p1, Lc2/o;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    check-cast p1, Lc2/o;

    .line 7
    .line 8
    invoke-virtual {p1}, Lc2/o;->x()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v2, 0x5

    .line 13
    if-eq v0, v2, :cond_0

    .line 14
    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    const/4 v1, 0x4

    .line 18
    if-eq v0, v1, :cond_0

    .line 19
    .line 20
    const/16 v1, 0xa

    .line 21
    .line 22
    if-eq v0, v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1}, Lc2/o;->K()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, LZ1/h;

    .line 29
    .line 30
    invoke-virtual {p1}, Lc2/o;->D()V

    .line 31
    .line 32
    .line 33
    return-object v0

    .line 34
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 35
    .line 36
    new-instance v1, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    const-string v2, "Unexpected "

    .line 39
    .line 40
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v0}, LE1/j;->q(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v0, " when reading a JsonElement."

    .line 51
    .line 52
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    throw p1

    .line 63
    :cond_1
    invoke-virtual {p1}, Lh2/a;->x()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    invoke-static {v0}, LL/i;->b(I)I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    const/4 v3, 0x0

    .line 72
    if-eqz v2, :cond_3

    .line 73
    .line 74
    if-eq v2, v1, :cond_2

    .line 75
    .line 76
    move-object v2, v3

    .line 77
    goto :goto_0

    .line 78
    :cond_2
    invoke-virtual {p1}, Lh2/a;->b()V

    .line 79
    .line 80
    .line 81
    new-instance v2, LZ1/k;

    .line 82
    .line 83
    invoke-direct {v2}, LZ1/k;-><init>()V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_3
    invoke-virtual {p1}, Lh2/a;->a()V

    .line 88
    .line 89
    .line 90
    new-instance v2, LZ1/f;

    .line 91
    .line 92
    invoke-direct {v2}, LZ1/f;-><init>()V

    .line 93
    .line 94
    .line 95
    :goto_0
    if-nez v2, :cond_4

    .line 96
    .line 97
    invoke-static {p1, v0}, Lc2/m;->d(Lh2/a;I)LZ1/h;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    return-object p1

    .line 102
    :cond_4
    new-instance v0, Ljava/util/ArrayDeque;

    .line 103
    .line 104
    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    .line 105
    .line 106
    .line 107
    :cond_5
    :goto_1
    invoke-virtual {p1}, Lh2/a;->k()Z

    .line 108
    .line 109
    .line 110
    move-result v4

    .line 111
    if-eqz v4, :cond_c

    .line 112
    .line 113
    instance-of v4, v2, LZ1/k;

    .line 114
    .line 115
    if-eqz v4, :cond_6

    .line 116
    .line 117
    invoke-virtual {p1}, Lh2/a;->r()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    goto :goto_2

    .line 122
    :cond_6
    move-object v4, v3

    .line 123
    :goto_2
    invoke-virtual {p1}, Lh2/a;->x()I

    .line 124
    .line 125
    .line 126
    move-result v5

    .line 127
    invoke-static {v5}, LL/i;->b(I)I

    .line 128
    .line 129
    .line 130
    move-result v6

    .line 131
    if-eqz v6, :cond_8

    .line 132
    .line 133
    if-eq v6, v1, :cond_7

    .line 134
    .line 135
    move-object v6, v3

    .line 136
    goto :goto_3

    .line 137
    :cond_7
    invoke-virtual {p1}, Lh2/a;->b()V

    .line 138
    .line 139
    .line 140
    new-instance v6, LZ1/k;

    .line 141
    .line 142
    invoke-direct {v6}, LZ1/k;-><init>()V

    .line 143
    .line 144
    .line 145
    goto :goto_3

    .line 146
    :cond_8
    invoke-virtual {p1}, Lh2/a;->a()V

    .line 147
    .line 148
    .line 149
    new-instance v6, LZ1/f;

    .line 150
    .line 151
    invoke-direct {v6}, LZ1/f;-><init>()V

    .line 152
    .line 153
    .line 154
    :goto_3
    if-eqz v6, :cond_9

    .line 155
    .line 156
    const/4 v7, 0x1

    .line 157
    goto :goto_4

    .line 158
    :cond_9
    const/4 v7, 0x0

    .line 159
    :goto_4
    if-nez v6, :cond_a

    .line 160
    .line 161
    invoke-static {p1, v5}, Lc2/m;->d(Lh2/a;I)LZ1/h;

    .line 162
    .line 163
    .line 164
    move-result-object v6

    .line 165
    :cond_a
    instance-of v5, v2, LZ1/f;

    .line 166
    .line 167
    if-eqz v5, :cond_b

    .line 168
    .line 169
    move-object v4, v2

    .line 170
    check-cast v4, LZ1/f;

    .line 171
    .line 172
    iget-object v4, v4, LZ1/f;->e:Ljava/util/ArrayList;

    .line 173
    .line 174
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    goto :goto_5

    .line 178
    :cond_b
    move-object v5, v2

    .line 179
    check-cast v5, LZ1/k;

    .line 180
    .line 181
    iget-object v5, v5, LZ1/k;->e:Lb2/n;

    .line 182
    .line 183
    invoke-virtual {v5, v4, v6}, Lb2/n;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    :goto_5
    if-eqz v7, :cond_5

    .line 187
    .line 188
    invoke-virtual {v0, v2}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V

    .line 189
    .line 190
    .line 191
    move-object v2, v6

    .line 192
    goto :goto_1

    .line 193
    :cond_c
    instance-of v4, v2, LZ1/f;

    .line 194
    .line 195
    if-eqz v4, :cond_d

    .line 196
    .line 197
    invoke-virtual {p1}, Lh2/a;->e()V

    .line 198
    .line 199
    .line 200
    goto :goto_6

    .line 201
    :cond_d
    invoke-virtual {p1}, Lh2/a;->f()V

    .line 202
    .line 203
    .line 204
    :goto_6
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 205
    .line 206
    .line 207
    move-result v4

    .line 208
    if-eqz v4, :cond_e

    .line 209
    .line 210
    return-object v2

    .line 211
    :cond_e
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->removeLast()Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    check-cast v2, LZ1/h;

    .line 216
    .line 217
    goto :goto_1
.end method

.method public final bridge synthetic c(Lh2/b;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p2, LZ1/h;

    .line 2
    .line 3
    invoke-static {p1, p2}, Lc2/m;->e(Lh2/b;LZ1/h;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
