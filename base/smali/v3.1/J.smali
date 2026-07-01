.class public final Lv3/J;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lg3/b;
.implements Lv3/g;


# instance fields
.field public e:Landroid/content/Context;

.field public f:Lm/x0;

.field public final g:LK0/h;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, LK0/h;

    .line 5
    .line 6
    const/16 v1, 0x13

    .line 7
    .line 8
    invoke-direct {v0, v1}, LK0/h;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lv3/J;->g:LK0/h;

    .line 12
    .line 13
    return-void
.end method

.method public static final c(Lv3/J;Ljava/lang/String;Ljava/lang/String;LC3/g;)Ljava/lang/Object;
    .locals 2

    .line 1
    invoke-static {p1}, LV0/g;->C(Ljava/lang/String;)LM/d;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lv3/J;->e:Landroid/content/Context;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    invoke-static {p0}, Lv3/K;->a(Landroid/content/Context;)LI/i;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance v1, Lv3/k;

    .line 15
    .line 16
    invoke-direct {v1, p1, p2, v0}, Lv3/k;-><init>(LM/d;Ljava/lang/String;LA3/d;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p0, v1, p3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->n(LI/i;LH3/p;LC3/g;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    sget-object p1, LB3/a;->e:LB3/a;

    .line 24
    .line 25
    if-ne p0, p1, :cond_0

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_0
    sget-object p0, Ly3/h;->a:Ly3/h;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_1
    const-string p0, "context"

    .line 32
    .line 33
    invoke-static {p0}, LI3/h;->g(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    throw v0
.end method

.method public static final j(Lv3/J;Ljava/util/List;LC3/c;)Ljava/lang/Object;
    .locals 11

    .line 1
    instance-of v0, p2, Lv3/v;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Lv3/v;

    .line 7
    .line 8
    iget v1, v0, Lv3/v;->o:I

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
    iput v1, v0, Lv3/v;->o:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lv3/v;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, Lv3/v;-><init>(Lv3/J;LC3/c;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, Lv3/v;->m:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, Lv3/v;->o:I

    .line 28
    .line 29
    const-string v2, "context"

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
    if-eqz v1, :cond_3

    .line 37
    .line 38
    if-eq v1, v4, :cond_2

    .line 39
    .line 40
    if-ne v1, v3, :cond_1

    .line 41
    .line 42
    iget p1, v0, Lv3/v;->l:I

    .line 43
    .line 44
    iget-object v1, v0, Lv3/v;->k:LM/d;

    .line 45
    .line 46
    iget-object v4, v0, Lv3/v;->j:Ljava/util/Iterator;

    .line 47
    .line 48
    iget-object v7, v0, Lv3/v;->i:Ljava/util/Map;

    .line 49
    .line 50
    iget-object v8, v0, Lv3/v;->h:Ljava/util/Set;

    .line 51
    .line 52
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    goto/16 :goto_5

    .line 56
    .line 57
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 58
    .line 59
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 60
    .line 61
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    throw p0

    .line 65
    :cond_2
    iget-object p1, v0, Lv3/v;->i:Ljava/util/Map;

    .line 66
    .line 67
    iget-object v1, v0, Lv3/v;->h:Ljava/util/Set;

    .line 68
    .line 69
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_3
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    if-eqz p1, :cond_4

    .line 77
    .line 78
    invoke-static {p1}, Lz3/d;->Z(Ljava/lang/Iterable;)Ljava/util/Set;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    move-object v1, p1

    .line 83
    goto :goto_1

    .line 84
    :cond_4
    move-object v1, v5

    .line 85
    :goto_1
    new-instance p1, Ljava/util/LinkedHashMap;

    .line 86
    .line 87
    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 88
    .line 89
    .line 90
    iput-object v1, v0, Lv3/v;->h:Ljava/util/Set;

    .line 91
    .line 92
    iput-object p1, v0, Lv3/v;->i:Ljava/util/Map;

    .line 93
    .line 94
    iput v4, v0, Lv3/v;->o:I

    .line 95
    .line 96
    iget-object p2, p0, Lv3/J;->e:Landroid/content/Context;

    .line 97
    .line 98
    if-eqz p2, :cond_b

    .line 99
    .line 100
    invoke-static {p2}, Lv3/K;->a(Landroid/content/Context;)LI/i;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    check-cast p2, LE/i;

    .line 105
    .line 106
    iget-object p2, p2, LE/i;->f:Ljava/lang/Object;

    .line 107
    .line 108
    check-cast p2, LI/i;

    .line 109
    .line 110
    invoke-interface {p2}, LI/i;->d()LQ3/d;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    new-instance v4, Lj3/b;

    .line 115
    .line 116
    const/16 v7, 0x12

    .line 117
    .line 118
    invoke-direct {v4, v7, p2}, Lj3/b;-><init>(ILjava/lang/Object;)V

    .line 119
    .line 120
    .line 121
    invoke-static {v4, v0}, LQ3/r;->c(LQ3/d;LC3/c;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    if-ne p2, v6, :cond_5

    .line 126
    .line 127
    goto :goto_4

    .line 128
    :cond_5
    :goto_2
    check-cast p2, Ljava/util/Set;

    .line 129
    .line 130
    if-eqz p2, :cond_a

    .line 131
    .line 132
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 133
    .line 134
    .line 135
    move-result-object p2

    .line 136
    const/4 v4, 0x0

    .line 137
    move-object v7, p1

    .line 138
    move-object v8, v1

    .line 139
    move p1, v4

    .line 140
    move-object v4, p2

    .line 141
    :cond_6
    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 142
    .line 143
    .line 144
    move-result p2

    .line 145
    if-eqz p2, :cond_9

    .line 146
    .line 147
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object p2

    .line 151
    move-object v1, p2

    .line 152
    check-cast v1, LM/d;

    .line 153
    .line 154
    iput-object v8, v0, Lv3/v;->h:Ljava/util/Set;

    .line 155
    .line 156
    iput-object v7, v0, Lv3/v;->i:Ljava/util/Map;

    .line 157
    .line 158
    iput-object v4, v0, Lv3/v;->j:Ljava/util/Iterator;

    .line 159
    .line 160
    iput-object v1, v0, Lv3/v;->k:LM/d;

    .line 161
    .line 162
    iput p1, v0, Lv3/v;->l:I

    .line 163
    .line 164
    iput v3, v0, Lv3/v;->o:I

    .line 165
    .line 166
    iget-object p2, p0, Lv3/J;->e:Landroid/content/Context;

    .line 167
    .line 168
    if-eqz p2, :cond_8

    .line 169
    .line 170
    invoke-static {p2}, Lv3/K;->a(Landroid/content/Context;)LI/i;

    .line 171
    .line 172
    .line 173
    move-result-object p2

    .line 174
    check-cast p2, LE/i;

    .line 175
    .line 176
    iget-object p2, p2, LE/i;->f:Ljava/lang/Object;

    .line 177
    .line 178
    check-cast p2, LI/i;

    .line 179
    .line 180
    invoke-interface {p2}, LI/i;->d()LQ3/d;

    .line 181
    .line 182
    .line 183
    move-result-object p2

    .line 184
    new-instance v9, Lv3/o;

    .line 185
    .line 186
    const/4 v10, 0x3

    .line 187
    invoke-direct {v9, p2, v1, v10}, Lv3/o;-><init>(LQ3/d;LM/d;I)V

    .line 188
    .line 189
    .line 190
    invoke-static {v9, v0}, LQ3/r;->c(LQ3/d;LC3/c;)Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object p2

    .line 194
    if-ne p2, v6, :cond_7

    .line 195
    .line 196
    :goto_4
    return-object v6

    .line 197
    :cond_7
    :goto_5
    iget-object v9, v1, LM/d;->a:Ljava/lang/String;

    .line 198
    .line 199
    invoke-static {v9, p2, v8}, Lv3/K;->b(Ljava/lang/String;Ljava/lang/Object;Ljava/util/Set;)Z

    .line 200
    .line 201
    .line 202
    move-result v9

    .line 203
    if-eqz v9, :cond_6

    .line 204
    .line 205
    iget-object v9, p0, Lv3/J;->g:LK0/h;

    .line 206
    .line 207
    invoke-static {p2, v9}, Lv3/K;->c(Ljava/lang/Object;LK0/h;)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object p2

    .line 211
    if-eqz p2, :cond_6

    .line 212
    .line 213
    iget-object v1, v1, LM/d;->a:Ljava/lang/String;

    .line 214
    .line 215
    invoke-interface {v7, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    goto :goto_3

    .line 219
    :cond_8
    invoke-static {v2}, LI3/h;->g(Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    throw v5

    .line 223
    :cond_9
    return-object v7

    .line 224
    :cond_a
    return-object p1

    .line 225
    :cond_b
    invoke-static {v2}, LI3/h;->g(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    throw v5
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lv3/h;)Lv3/N;
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Lv3/J;->f(Ljava/lang/String;Lv3/h;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 p2, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    const-string v0, "VGhpcyBpcyB0aGUgcHJlZml4IGZvciBhIGxpc3Qu!"

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    new-instance p2, Lv3/N;

    .line 17
    .line 18
    sget-object v0, Lv3/L;->h:Lv3/L;

    .line 19
    .line 20
    invoke-direct {p2, p1, v0}, Lv3/N;-><init>(Ljava/lang/String;Lv3/L;)V

    .line 21
    .line 22
    .line 23
    return-object p2

    .line 24
    :cond_0
    const-string v0, "VGhpcyBpcyB0aGUgcHJlZml4IGZvciBhIGxpc3Qu"

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    new-instance p1, Lv3/N;

    .line 33
    .line 34
    sget-object v0, Lv3/L;->g:Lv3/L;

    .line 35
    .line 36
    invoke-direct {p1, p2, v0}, Lv3/N;-><init>(Ljava/lang/String;Lv3/L;)V

    .line 37
    .line 38
    .line 39
    return-object p1

    .line 40
    :cond_1
    new-instance p1, Lv3/N;

    .line 41
    .line 42
    sget-object v0, Lv3/L;->i:Lv3/L;

    .line 43
    .line 44
    invoke-direct {p1, p2, v0}, Lv3/N;-><init>(Ljava/lang/String;Lv3/L;)V

    .line 45
    .line 46
    .line 47
    return-object p1

    .line 48
    :cond_2
    return-object p2
.end method

.method public final b(Ljava/util/List;Lv3/h;)V
    .locals 1

    .line 1
    new-instance p2, Lv3/j;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p2, p0, p1, v0}, Lv3/j;-><init>(Lv3/J;Ljava/util/List;LA3/d;)V

    .line 5
    .line 6
    .line 7
    invoke-static {p2}, LN3/v;->j(LH3/p;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final d(Ljava/lang/String;JLv3/h;)V
    .locals 6

    .line 1
    new-instance v0, Lv3/H;

    .line 2
    .line 3
    const/4 v5, 0x0

    .line 4
    move-object v2, p0

    .line 5
    move-object v1, p1

    .line 6
    move-wide v3, p2

    .line 7
    invoke-direct/range {v0 .. v5}, Lv3/H;-><init>(Ljava/lang/String;Lv3/J;JLA3/d;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, LN3/v;->j(LH3/p;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final e(Ljava/lang/String;Lv3/h;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    new-instance p2, LI3/p;

    .line 2
    .line 3
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lv3/p;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-direct {v0, p1, p0, p2, v1}, Lv3/p;-><init>(Ljava/lang/String;Lv3/J;LI3/p;LA3/d;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, LN3/v;->j(LH3/p;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    iget-object p1, p2, LI3/p;->e:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p1, Ljava/lang/Boolean;

    .line 18
    .line 19
    return-object p1
.end method

.method public final f(Ljava/lang/String;Lv3/h;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance p2, LI3/p;

    .line 2
    .line 3
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lv3/x;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-direct {v0, p1, p0, p2, v1}, Lv3/x;-><init>(Ljava/lang/String;Lv3/J;LI3/p;LA3/d;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, LN3/v;->j(LH3/p;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    iget-object p1, p2, LI3/p;->e:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p1, Ljava/lang/String;

    .line 18
    .line 19
    return-object p1
.end method

.method public final g(Ljava/lang/String;Lv3/h;)Ljava/util/ArrayList;
    .locals 2

    .line 1
    invoke-virtual {p0, p1, p2}, Lv3/J;->f(Ljava/lang/String;Lv3/h;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_2

    .line 6
    .line 7
    const-string p2, "VGhpcyBpcyB0aGUgcHJlZml4IGZvciBhIGxpc3Qu!"

    .line 8
    .line 9
    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-nez p2, :cond_2

    .line 14
    .line 15
    const-string p2, "VGhpcyBpcyB0aGUgcHJlZml4IGZvciBhIGxpc3Qu"

    .line 16
    .line 17
    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-eqz p2, :cond_2

    .line 22
    .line 23
    iget-object p2, p0, Lv3/J;->g:LK0/h;

    .line 24
    .line 25
    invoke-static {p1, p2}, Lv3/K;->c(Ljava/lang/Object;LK0/h;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Ljava/util/List;

    .line 30
    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    new-instance p2, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    instance-of v1, v0, Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v1, :cond_0

    .line 55
    .line 56
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    return-object p2

    .line 61
    :cond_2
    const/4 p1, 0x0

    .line 62
    return-object p1
.end method

.method public final h(Ljava/lang/String;Ljava/util/List;Lv3/h;)V
    .locals 1

    .line 1
    iget-object p3, p0, Lv3/J;->g:LK0/h;

    .line 2
    .line 3
    invoke-virtual {p3, p2}, LK0/h;->i(Ljava/util/List;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const-string p3, "VGhpcyBpcyB0aGUgcHJlZml4IGZvciBhIGxpc3Qu"

    .line 8
    .line 9
    invoke-virtual {p3, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    new-instance p3, Lv3/C;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-direct {p3, p0, p1, p2, v0}, Lv3/C;-><init>(Lv3/J;Ljava/lang/String;Ljava/lang/String;LA3/d;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p3}, LN3/v;->j(LH3/p;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final i(Ljava/util/List;Lv3/h;)Ljava/util/Map;
    .locals 1

    .line 1
    new-instance p2, Lv3/l;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p2, p0, p1, v0}, Lv3/l;-><init>(Lv3/J;Ljava/util/List;LA3/d;)V

    .line 5
    .line 6
    .line 7
    invoke-static {p2}, LN3/v;->j(LH3/p;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ljava/util/Map;

    .line 12
    .line 13
    return-object p1
.end method

.method public final k(Ljava/util/List;Lv3/h;)Ljava/util/List;
    .locals 1

    .line 1
    new-instance p2, Lv3/u;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p2, p0, p1, v0}, Lv3/u;-><init>(Lv3/J;Ljava/util/List;LA3/d;)V

    .line 5
    .line 6
    .line 7
    invoke-static {p2}, LN3/v;->j(LH3/p;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ljava/util/Map;

    .line 12
    .line 13
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p1}, Lz3/d;->X(Ljava/lang/Iterable;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    return-object p1
.end method

.method public final l(Ljava/lang/String;Ljava/lang/String;Lv3/h;)V
    .locals 1

    .line 1
    new-instance p3, Lv3/I;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p3, p0, p1, p2, v0}, Lv3/I;-><init>(Lv3/J;Ljava/lang/String;Ljava/lang/String;LA3/d;)V

    .line 5
    .line 6
    .line 7
    invoke-static {p3}, LN3/v;->j(LH3/p;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final m(Ljava/lang/String;ZLv3/h;)V
    .locals 1

    .line 1
    new-instance p3, Lv3/B;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p3, p1, p0, p2, v0}, Lv3/B;-><init>(Ljava/lang/String;Lv3/J;ZLA3/d;)V

    .line 5
    .line 6
    .line 7
    invoke-static {p3}, LN3/v;->j(LH3/p;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final n(Ljava/lang/String;Lv3/h;)Ljava/lang/Double;
    .locals 2

    .line 1
    new-instance p2, LI3/p;

    .line 2
    .line 3
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lv3/r;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-direct {v0, p1, p0, p2, v1}, Lv3/r;-><init>(Ljava/lang/String;Lv3/J;LI3/p;LA3/d;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, LN3/v;->j(LH3/p;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    iget-object p1, p2, LI3/p;->e:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p1, Ljava/lang/Double;

    .line 18
    .line 19
    return-object p1
.end method

.method public final o(Ljava/lang/String;Lv3/h;)Ljava/lang/Long;
    .locals 2

    .line 1
    new-instance p2, LI3/p;

    .line 2
    .line 3
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lv3/t;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-direct {v0, p1, p0, p2, v1}, Lv3/t;-><init>(Ljava/lang/String;Lv3/J;LI3/p;LA3/d;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, LN3/v;->j(LH3/p;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    iget-object p1, p2, LI3/p;->e:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p1, Ljava/lang/Long;

    .line 18
    .line 19
    return-object p1
.end method

.method public final onAttachedToEngine(Lg3/a;)V
    .locals 4

    .line 1
    const-string v0, "binding"

    .line 2
    .line 3
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lg3/a;->b:Lk3/f;

    .line 7
    .line 8
    const-string v1, "getBinaryMessenger(...)"

    .line 9
    .line 10
    invoke-static {v0, v1}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p1, Lg3/a;->a:Landroid/content/Context;

    .line 14
    .line 15
    const-string v2, "getApplicationContext(...)"

    .line 16
    .line 17
    invoke-static {v1, v2}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Lv3/J;->e:Landroid/content/Context;

    .line 21
    .line 22
    :try_start_0
    sget-object v2, Lv3/g;->d:Lv3/f;

    .line 23
    .line 24
    const-string v3, "data_store"

    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    invoke-static {v0, p0, v3}, Lv3/f;->b(Lk3/f;Lv3/g;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    new-instance v2, Lm/x0;

    .line 33
    .line 34
    iget-object v3, p0, Lv3/J;->g:LK0/h;

    .line 35
    .line 36
    invoke-direct {v2, v0, v1, v3}, Lm/x0;-><init>(Lk3/f;Landroid/content/Context;LK0/h;)V

    .line 37
    .line 38
    .line 39
    iput-object v2, p0, Lv3/J;->f:Lm/x0;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catch_0
    move-exception v0

    .line 43
    const-string v1, "SharedPreferencesPlugin"

    .line 44
    .line 45
    const-string v2, "Received exception while setting up SharedPreferencesPlugin"

    .line 46
    .line 47
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 48
    .line 49
    .line 50
    :goto_0
    new-instance v0, Lv3/a;

    .line 51
    .line 52
    invoke-direct {v0}, Lv3/a;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, p1}, Lv3/a;->onAttachedToEngine(Lg3/a;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final onDetachedFromEngine(Lg3/a;)V
    .locals 2

    .line 1
    const-string v0, "binding"

    .line 2
    .line 3
    invoke-static {p1, v0}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p1, Lg3/a;->b:Lk3/f;

    .line 7
    .line 8
    const-string v0, "getBinaryMessenger(...)"

    .line 9
    .line 10
    invoke-static {p1, v0}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object v0, Lv3/g;->d:Lv3/f;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    const-string v1, "data_store"

    .line 20
    .line 21
    invoke-static {p1, v0, v1}, Lv3/f;->b(Lk3/f;Lv3/g;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lv3/J;->f:Lm/x0;

    .line 25
    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    iget-object p1, p1, Lm/x0;->g:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast p1, Lk3/f;

    .line 31
    .line 32
    const-string v1, "shared_preferences"

    .line 33
    .line 34
    invoke-static {p1, v0, v1}, Lv3/f;->b(Lk3/f;Lv3/g;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    iput-object v0, p0, Lv3/J;->f:Lm/x0;

    .line 38
    .line 39
    return-void
.end method

.method public final p(Ljava/lang/String;Ljava/lang/String;Lv3/h;)V
    .locals 1

    .line 1
    new-instance p3, Lv3/F;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p3, p0, p1, p2, v0}, Lv3/F;-><init>(Lv3/J;Ljava/lang/String;Ljava/lang/String;LA3/d;)V

    .line 5
    .line 6
    .line 7
    invoke-static {p3}, LN3/v;->j(LH3/p;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final q(Ljava/lang/String;DLv3/h;)V
    .locals 6

    .line 1
    new-instance v0, Lv3/E;

    .line 2
    .line 3
    const/4 v5, 0x0

    .line 4
    move-object v2, p0

    .line 5
    move-object v1, p1

    .line 6
    move-wide v3, p2

    .line 7
    invoke-direct/range {v0 .. v5}, Lv3/E;-><init>(Ljava/lang/String;Lv3/J;DLA3/d;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, LN3/v;->j(LH3/p;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    return-void
.end method
