.class public final LI/e0;
.super LI3/i;
.source "SourceFile"

# interfaces
.implements LH3/l;


# instance fields
.field public final synthetic f:LI/K;

.field public final synthetic g:LV1/y;


# direct methods
.method public constructor <init>(LI/K;LV1/y;)V
    .locals 0

    .line 1
    iput-object p1, p0, LI/e0;->f:LI/K;

    .line 2
    .line 3
    iput-object p2, p0, LI/e0;->g:LV1/y;

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-direct {p0, p1}, LI3/i;-><init>(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final i(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    check-cast v1, Ljava/lang/Throwable;

    .line 6
    .line 7
    iget-object v2, v0, LI/e0;->f:LI/K;

    .line 8
    .line 9
    invoke-virtual {v2, v1}, LI/K;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    iget-object v2, v0, LI/e0;->g:LV1/y;

    .line 13
    .line 14
    iget-object v2, v2, LV1/y;->h:Ljava/lang/Object;

    .line 15
    .line 16
    move-object v3, v2

    .line 17
    check-cast v3, LP3/c;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {v3, v1, v2}, LP3/c;->f(Ljava/lang/Throwable;Z)Z

    .line 21
    .line 22
    .line 23
    :cond_0
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    sget-object v9, LP3/c;->g:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 27
    .line 28
    invoke-virtual {v9, v3}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 29
    .line 30
    .line 31
    move-result-wide v4

    .line 32
    sget-object v10, LP3/c;->f:Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;

    .line 33
    .line 34
    invoke-virtual {v10, v3}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 35
    .line 36
    .line 37
    move-result-wide v6

    .line 38
    const/4 v11, 0x1

    .line 39
    invoke-virtual {v3, v6, v7, v11}, LP3/c;->r(JZ)Z

    .line 40
    .line 41
    .line 42
    move-result v8

    .line 43
    if-eqz v8, :cond_1

    .line 44
    .line 45
    invoke-virtual {v3}, LP3/c;->k()Ljava/lang/Throwable;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    new-instance v5, LP3/h;

    .line 50
    .line 51
    invoke-direct {v5, v4}, LP3/h;-><init>(Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    goto/16 :goto_3

    .line 55
    .line 56
    :cond_1
    const-wide v12, 0xfffffffffffffffL

    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    and-long/2addr v6, v12

    .line 62
    cmp-long v4, v4, v6

    .line 63
    .line 64
    sget-object v12, LP3/j;->a:LP3/i;

    .line 65
    .line 66
    if-ltz v4, :cond_2

    .line 67
    .line 68
    move-object v5, v12

    .line 69
    goto/16 :goto_3

    .line 70
    .line 71
    :cond_2
    sget-object v8, LP3/e;->k:LE/i;

    .line 72
    .line 73
    sget-object v4, LP3/c;->k:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 74
    .line 75
    invoke-virtual {v4, v3}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    check-cast v4, LP3/k;

    .line 80
    .line 81
    :goto_0
    invoke-virtual {v10, v3}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->get(Ljava/lang/Object;)J

    .line 82
    .line 83
    .line 84
    move-result-wide v5

    .line 85
    invoke-virtual {v3, v5, v6, v11}, LP3/c;->r(JZ)Z

    .line 86
    .line 87
    .line 88
    move-result v5

    .line 89
    if-eqz v5, :cond_3

    .line 90
    .line 91
    invoke-virtual {v3}, LP3/c;->k()Ljava/lang/Throwable;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    new-instance v5, LP3/h;

    .line 96
    .line 97
    invoke-direct {v5, v4}, LP3/h;-><init>(Ljava/lang/Throwable;)V

    .line 98
    .line 99
    .line 100
    goto :goto_3

    .line 101
    :cond_3
    invoke-virtual {v9, v3}, Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;->getAndIncrement(Ljava/lang/Object;)J

    .line 102
    .line 103
    .line 104
    move-result-wide v6

    .line 105
    sget v5, LP3/e;->b:I

    .line 106
    .line 107
    int-to-long v13, v5

    .line 108
    move-object v15, v12

    .line 109
    div-long v11, v6, v13

    .line 110
    .line 111
    rem-long v13, v6, v13

    .line 112
    .line 113
    long-to-int v5, v13

    .line 114
    iget-wide v13, v4, LS3/s;->c:J

    .line 115
    .line 116
    cmp-long v13, v13, v11

    .line 117
    .line 118
    if-eqz v13, :cond_6

    .line 119
    .line 120
    invoke-virtual {v3, v11, v12, v4}, LP3/c;->j(JLP3/k;)LP3/k;

    .line 121
    .line 122
    .line 123
    move-result-object v11

    .line 124
    if-nez v11, :cond_5

    .line 125
    .line 126
    :cond_4
    :goto_1
    move-object v12, v15

    .line 127
    const/4 v11, 0x1

    .line 128
    goto :goto_0

    .line 129
    :cond_5
    move-object v4, v11

    .line 130
    :cond_6
    invoke-virtual/range {v3 .. v8}, LP3/c;->A(LP3/k;IJLjava/lang/Object;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v11

    .line 134
    sget-object v12, LP3/e;->m:LE/i;

    .line 135
    .line 136
    if-ne v11, v12, :cond_9

    .line 137
    .line 138
    instance-of v9, v8, LN3/l0;

    .line 139
    .line 140
    if-eqz v9, :cond_7

    .line 141
    .line 142
    check-cast v8, LN3/l0;

    .line 143
    .line 144
    goto :goto_2

    .line 145
    :cond_7
    const/4 v8, 0x0

    .line 146
    :goto_2
    if-eqz v8, :cond_8

    .line 147
    .line 148
    invoke-interface {v8, v4, v5}, LN3/l0;->a(LS3/s;I)V

    .line 149
    .line 150
    .line 151
    :cond_8
    invoke-virtual {v3, v6, v7}, LP3/c;->C(J)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v4}, LS3/s;->h()V

    .line 155
    .line 156
    .line 157
    move-object v5, v15

    .line 158
    goto :goto_3

    .line 159
    :cond_9
    sget-object v5, LP3/e;->o:LE/i;

    .line 160
    .line 161
    if-ne v11, v5, :cond_a

    .line 162
    .line 163
    invoke-virtual {v3}, LP3/c;->o()J

    .line 164
    .line 165
    .line 166
    move-result-wide v11

    .line 167
    cmp-long v5, v6, v11

    .line 168
    .line 169
    if-gez v5, :cond_4

    .line 170
    .line 171
    invoke-virtual {v4}, LS3/c;->a()V

    .line 172
    .line 173
    .line 174
    goto :goto_1

    .line 175
    :cond_a
    sget-object v5, LP3/e;->n:LE/i;

    .line 176
    .line 177
    if-eq v11, v5, :cond_e

    .line 178
    .line 179
    invoke-virtual {v4}, LS3/c;->a()V

    .line 180
    .line 181
    .line 182
    move-object v5, v11

    .line 183
    :goto_3
    instance-of v4, v5, LP3/i;

    .line 184
    .line 185
    const/4 v6, 0x0

    .line 186
    if-nez v4, :cond_b

    .line 187
    .line 188
    goto :goto_4

    .line 189
    :cond_b
    move-object v5, v6

    .line 190
    :goto_4
    sget-object v4, Ly3/h;->a:Ly3/h;

    .line 191
    .line 192
    if-eqz v5, :cond_d

    .line 193
    .line 194
    check-cast v5, LI/b0;

    .line 195
    .line 196
    iget-object v5, v5, LI/b0;->b:LN3/m;

    .line 197
    .line 198
    if-nez v1, :cond_c

    .line 199
    .line 200
    new-instance v6, Ljava/util/concurrent/CancellationException;

    .line 201
    .line 202
    const-string v7, "DataStore scope was cancelled before updateData could complete"

    .line 203
    .line 204
    invoke-direct {v6, v7}, Ljava/util/concurrent/CancellationException;-><init>(Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    goto :goto_5

    .line 208
    :cond_c
    move-object v6, v1

    .line 209
    :goto_5
    new-instance v7, LN3/o;

    .line 210
    .line 211
    invoke-direct {v7, v6, v2}, LN3/o;-><init>(Ljava/lang/Throwable;Z)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {v5, v7}, LN3/Y;->K(Ljava/lang/Object;)Z

    .line 215
    .line 216
    .line 217
    move-object v6, v4

    .line 218
    :cond_d
    if-nez v6, :cond_0

    .line 219
    .line 220
    return-object v4

    .line 221
    :cond_e
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 222
    .line 223
    const-string v2, "unexpected"

    .line 224
    .line 225
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    throw v1
.end method
