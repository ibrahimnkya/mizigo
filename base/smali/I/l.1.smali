.class public final LI/l;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:LV3/a;

.field public final synthetic b:LI3/n;

.field public final synthetic c:LI3/p;

.field public final synthetic d:LI/O;


# direct methods
.method public constructor <init>(LV3/a;LI3/n;LI3/p;LI/O;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LI/l;->a:LV3/a;

    .line 5
    .line 6
    iput-object p2, p0, LI/l;->b:LI3/n;

    .line 7
    .line 8
    iput-object p3, p0, LI/l;->c:LI3/p;

    .line 9
    .line 10
    iput-object p4, p0, LI/l;->d:LI/O;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a(LI/h;LC3/c;)Ljava/lang/Object;
    .locals 9

    .line 1
    instance-of v0, p2, LI/k;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, LI/k;

    .line 7
    .line 8
    iget v1, v0, LI/k;->o:I

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
    iput v1, v0, LI/k;->o:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LI/k;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, LI/k;-><init>(LI/l;LC3/c;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, LI/k;->m:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, LI/k;->o:I

    .line 28
    .line 29
    const/4 v2, 0x3

    .line 30
    const/4 v3, 0x2

    .line 31
    const/4 v4, 0x1

    .line 32
    const/4 v5, 0x0

    .line 33
    sget-object v6, LB3/a;->e:LB3/a;

    .line 34
    .line 35
    if-eqz v1, :cond_4

    .line 36
    .line 37
    if-eq v1, v4, :cond_3

    .line 38
    .line 39
    if-eq v1, v3, :cond_2

    .line 40
    .line 41
    if-ne v1, v2, :cond_1

    .line 42
    .line 43
    iget-object p1, v0, LI/k;->j:Ljava/lang/Object;

    .line 44
    .line 45
    iget-object v1, v0, LI/k;->i:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast v1, LI3/p;

    .line 48
    .line 49
    iget-object v0, v0, LI/k;->h:Ljava/lang/Object;

    .line 50
    .line 51
    check-cast v0, LV3/a;

    .line 52
    .line 53
    :try_start_0
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    .line 55
    .line 56
    goto/16 :goto_4

    .line 57
    .line 58
    :catchall_0
    move-exception p1

    .line 59
    goto/16 :goto_6

    .line 60
    .line 61
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 62
    .line 63
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 64
    .line 65
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    throw p1

    .line 69
    :cond_2
    iget-object p1, v0, LI/k;->j:Ljava/lang/Object;

    .line 70
    .line 71
    check-cast p1, LI/O;

    .line 72
    .line 73
    iget-object v1, v0, LI/k;->i:Ljava/lang/Object;

    .line 74
    .line 75
    check-cast v1, LI3/p;

    .line 76
    .line 77
    iget-object v3, v0, LI/k;->h:Ljava/lang/Object;

    .line 78
    .line 79
    check-cast v3, LV3/a;

    .line 80
    .line 81
    :try_start_1
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 82
    .line 83
    .line 84
    goto :goto_2

    .line 85
    :catchall_1
    move-exception p1

    .line 86
    move-object v0, v3

    .line 87
    goto/16 :goto_6

    .line 88
    .line 89
    :cond_3
    iget-object p1, v0, LI/k;->l:LI/O;

    .line 90
    .line 91
    iget-object v1, v0, LI/k;->k:LI3/p;

    .line 92
    .line 93
    iget-object v4, v0, LI/k;->j:Ljava/lang/Object;

    .line 94
    .line 95
    check-cast v4, LI3/n;

    .line 96
    .line 97
    iget-object v7, v0, LI/k;->i:Ljava/lang/Object;

    .line 98
    .line 99
    check-cast v7, LV3/a;

    .line 100
    .line 101
    iget-object v8, v0, LI/k;->h:Ljava/lang/Object;

    .line 102
    .line 103
    check-cast v8, LH3/p;

    .line 104
    .line 105
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 106
    .line 107
    .line 108
    move-object p2, v8

    .line 109
    move-object v8, p1

    .line 110
    move-object p1, p2

    .line 111
    move-object p2, v7

    .line 112
    goto :goto_1

    .line 113
    :cond_4
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    iput-object p1, v0, LI/k;->h:Ljava/lang/Object;

    .line 117
    .line 118
    iget-object p2, p0, LI/l;->a:LV3/a;

    .line 119
    .line 120
    iput-object p2, v0, LI/k;->i:Ljava/lang/Object;

    .line 121
    .line 122
    iget-object v1, p0, LI/l;->b:LI3/n;

    .line 123
    .line 124
    iput-object v1, v0, LI/k;->j:Ljava/lang/Object;

    .line 125
    .line 126
    iget-object v7, p0, LI/l;->c:LI3/p;

    .line 127
    .line 128
    iput-object v7, v0, LI/k;->k:LI3/p;

    .line 129
    .line 130
    iget-object v8, p0, LI/l;->d:LI/O;

    .line 131
    .line 132
    iput-object v8, v0, LI/k;->l:LI/O;

    .line 133
    .line 134
    iput v4, v0, LI/k;->o:I

    .line 135
    .line 136
    check-cast p2, LV3/c;

    .line 137
    .line 138
    invoke-virtual {p2, v0}, LV3/c;->c(LC3/c;)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v4

    .line 142
    if-ne v4, v6, :cond_5

    .line 143
    .line 144
    goto :goto_3

    .line 145
    :cond_5
    move-object v4, v1

    .line 146
    move-object v1, v7

    .line 147
    :goto_1
    :try_start_2
    iget-boolean v4, v4, LI3/n;->e:Z

    .line 148
    .line 149
    if-nez v4, :cond_9

    .line 150
    .line 151
    iget-object v4, v1, LI3/p;->e:Ljava/lang/Object;

    .line 152
    .line 153
    iput-object p2, v0, LI/k;->h:Ljava/lang/Object;

    .line 154
    .line 155
    iput-object v1, v0, LI/k;->i:Ljava/lang/Object;

    .line 156
    .line 157
    iput-object v8, v0, LI/k;->j:Ljava/lang/Object;

    .line 158
    .line 159
    iput-object v5, v0, LI/k;->k:LI3/p;

    .line 160
    .line 161
    iput-object v5, v0, LI/k;->l:LI/O;

    .line 162
    .line 163
    iput v3, v0, LI/k;->o:I

    .line 164
    .line 165
    invoke-interface {p1, v4, v0}, LH3/p;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 169
    if-ne p1, v6, :cond_6

    .line 170
    .line 171
    goto :goto_3

    .line 172
    :cond_6
    move-object v3, p2

    .line 173
    move-object p2, p1

    .line 174
    move-object p1, v8

    .line 175
    :goto_2
    :try_start_3
    iget-object v4, v1, LI3/p;->e:Ljava/lang/Object;

    .line 176
    .line 177
    invoke-static {p2, v4}, LI3/h;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    move-result v4

    .line 181
    if-nez v4, :cond_8

    .line 182
    .line 183
    iput-object v3, v0, LI/k;->h:Ljava/lang/Object;

    .line 184
    .line 185
    iput-object v1, v0, LI/k;->i:Ljava/lang/Object;

    .line 186
    .line 187
    iput-object p2, v0, LI/k;->j:Ljava/lang/Object;

    .line 188
    .line 189
    iput v2, v0, LI/k;->o:I

    .line 190
    .line 191
    const/4 v2, 0x0

    .line 192
    invoke-virtual {p1, p2, v2, v0}, LI/O;->k(Ljava/lang/Object;ZLC3/c;)Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 196
    if-ne p1, v6, :cond_7

    .line 197
    .line 198
    :goto_3
    return-object v6

    .line 199
    :cond_7
    move-object p1, p2

    .line 200
    move-object v0, v3

    .line 201
    :goto_4
    :try_start_4
    iput-object p1, v1, LI3/p;->e:Ljava/lang/Object;

    .line 202
    .line 203
    goto :goto_5

    .line 204
    :cond_8
    move-object v0, v3

    .line 205
    :goto_5
    iget-object p1, v1, LI3/p;->e:Ljava/lang/Object;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 206
    .line 207
    check-cast v0, LV3/c;

    .line 208
    .line 209
    invoke-virtual {v0, v5}, LV3/c;->e(Ljava/lang/Object;)V

    .line 210
    .line 211
    .line 212
    return-object p1

    .line 213
    :catchall_2
    move-exception p1

    .line 214
    move-object v0, p2

    .line 215
    goto :goto_6

    .line 216
    :cond_9
    :try_start_5
    const-string p1, "InitializerApi.updateData should not be called after initialization is complete."

    .line 217
    .line 218
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 219
    .line 220
    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 224
    :goto_6
    check-cast v0, LV3/c;

    .line 225
    .line 226
    invoke-virtual {v0, v5}, LV3/c;->e(Ljava/lang/Object;)V

    .line 227
    .line 228
    .line 229
    throw p1
.end method
