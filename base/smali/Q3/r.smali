.class public abstract LQ3/r;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:LE/i;

.field public static final b:LE/i;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, LE/i;

    .line 2
    .line 3
    const-string v1, "NONE"

    .line 4
    .line 5
    const/16 v2, 0xb

    .line 6
    .line 7
    invoke-direct {v0, v2, v1}, LE/i;-><init>(ILjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, LQ3/r;->a:LE/i;

    .line 11
    .line 12
    new-instance v0, LE/i;

    .line 13
    .line 14
    const-string v1, "PENDING"

    .line 15
    .line 16
    invoke-direct {v0, v2, v1}, LE/i;-><init>(ILjava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    sput-object v0, LQ3/r;->b:LE/i;

    .line 20
    .line 21
    return-void
.end method

.method public static final a(LQ3/t;LI/r;Ljava/lang/Throwable;LC3/c;)Ljava/lang/Object;
    .locals 4

    .line 1
    instance-of v0, p3, LQ3/g;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p3

    .line 6
    check-cast v0, LQ3/g;

    .line 7
    .line 8
    iget v1, v0, LQ3/g;->j:I

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
    iput v1, v0, LQ3/g;->j:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LQ3/g;

    .line 21
    .line 22
    invoke-direct {v0, p3}, LC3/c;-><init>(LA3/d;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p3, v0, LQ3/g;->i:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, LQ3/g;->j:I

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
    iget-object p2, v0, LQ3/g;->h:Ljava/lang/Throwable;

    .line 35
    .line 36
    :try_start_0
    invoke-static {p3}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :catchall_0
    move-exception p0

    .line 41
    goto :goto_2

    .line 42
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 43
    .line 44
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 45
    .line 46
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    throw p0

    .line 50
    :cond_2
    invoke-static {p3}, LV0/g;->E(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    :try_start_1
    iput-object p2, v0, LQ3/g;->h:Ljava/lang/Throwable;

    .line 54
    .line 55
    iput v2, v0, LQ3/g;->j:I

    .line 56
    .line 57
    invoke-virtual {p1, p0, p2, v0}, LI/r;->f(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    sget-object p1, LB3/a;->e:LB3/a;

    .line 62
    .line 63
    if-ne p0, p1, :cond_3

    .line 64
    .line 65
    return-object p1

    .line 66
    :cond_3
    :goto_1
    sget-object p0, Ly3/h;->a:Ly3/h;

    .line 67
    .line 68
    return-object p0

    .line 69
    :goto_2
    if-eqz p2, :cond_4

    .line 70
    .line 71
    if-eq p2, p0, :cond_4

    .line 72
    .line 73
    invoke-static {p0, p2}, LT0/a;->b(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 74
    .line 75
    .line 76
    :cond_4
    throw p0
.end method

.method public static final b(LQ3/e;LP3/q;ZLC3/c;)Ljava/lang/Object;
    .locals 8

    .line 1
    instance-of v0, p3, LQ3/f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p3

    .line 6
    check-cast v0, LQ3/f;

    .line 7
    .line 8
    iget v1, v0, LQ3/f;->m:I

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
    iput v1, v0, LQ3/f;->m:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LQ3/f;

    .line 21
    .line 22
    invoke-direct {v0, p3}, LC3/c;-><init>(LA3/d;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p3, v0, LQ3/f;->l:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, LQ3/f;->m:I

    .line 28
    .line 29
    const/4 v2, 0x0

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
    if-ne v1, v3, :cond_2

    .line 39
    .line 40
    iget-boolean p2, v0, LQ3/f;->k:Z

    .line 41
    .line 42
    iget-object p0, v0, LQ3/f;->j:LP3/b;

    .line 43
    .line 44
    iget-object p1, v0, LQ3/f;->i:LP3/s;

    .line 45
    .line 46
    iget-object v1, v0, LQ3/f;->h:LQ3/e;

    .line 47
    .line 48
    :try_start_0
    invoke-static {p3}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    .line 50
    .line 51
    :cond_1
    move-object v7, v1

    .line 52
    move-object v1, p0

    .line 53
    move-object p0, v7

    .line 54
    goto :goto_1

    .line 55
    :catchall_0
    move-exception p0

    .line 56
    goto/16 :goto_4

    .line 57
    .line 58
    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 59
    .line 60
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 61
    .line 62
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    throw p0

    .line 66
    :cond_3
    iget-boolean p2, v0, LQ3/f;->k:Z

    .line 67
    .line 68
    iget-object p0, v0, LQ3/f;->j:LP3/b;

    .line 69
    .line 70
    iget-object p1, v0, LQ3/f;->i:LP3/s;

    .line 71
    .line 72
    iget-object v1, v0, LQ3/f;->h:LQ3/e;

    .line 73
    .line 74
    :try_start_1
    invoke-static {p3}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 75
    .line 76
    .line 77
    goto :goto_2

    .line 78
    :cond_4
    invoke-static {p3}, LV0/g;->E(Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    instance-of p3, p0, LQ3/t;

    .line 82
    .line 83
    if-nez p3, :cond_d

    .line 84
    .line 85
    :try_start_2
    iget-object p3, p1, LP3/q;->h:LP3/c;

    .line 86
    .line 87
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 88
    .line 89
    .line 90
    new-instance v1, LP3/b;

    .line 91
    .line 92
    invoke-direct {v1, p3}, LP3/b;-><init>(LP3/c;)V

    .line 93
    .line 94
    .line 95
    :goto_1
    iput-object p0, v0, LQ3/f;->h:LQ3/e;

    .line 96
    .line 97
    iput-object p1, v0, LQ3/f;->i:LP3/s;

    .line 98
    .line 99
    iput-object v1, v0, LQ3/f;->j:LP3/b;

    .line 100
    .line 101
    iput-boolean p2, v0, LQ3/f;->k:Z

    .line 102
    .line 103
    iput v4, v0, LQ3/f;->m:I

    .line 104
    .line 105
    invoke-virtual {v1, v0}, LP3/b;->b(LQ3/f;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object p3

    .line 109
    if-ne p3, v5, :cond_5

    .line 110
    .line 111
    goto :goto_3

    .line 112
    :cond_5
    move-object v7, v1

    .line 113
    move-object v1, p0

    .line 114
    move-object p0, v7

    .line 115
    :goto_2
    check-cast p3, Ljava/lang/Boolean;

    .line 116
    .line 117
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 118
    .line 119
    .line 120
    move-result p3

    .line 121
    if-eqz p3, :cond_8

    .line 122
    .line 123
    iget-object p3, p0, LP3/b;->e:Ljava/lang/Object;

    .line 124
    .line 125
    sget-object v6, LP3/e;->p:LE/i;

    .line 126
    .line 127
    if-eq p3, v6, :cond_7

    .line 128
    .line 129
    iput-object v6, p0, LP3/b;->e:Ljava/lang/Object;

    .line 130
    .line 131
    sget-object v6, LP3/e;->l:LE/i;

    .line 132
    .line 133
    if-eq p3, v6, :cond_6

    .line 134
    .line 135
    iput-object v1, v0, LQ3/f;->h:LQ3/e;

    .line 136
    .line 137
    iput-object p1, v0, LQ3/f;->i:LP3/s;

    .line 138
    .line 139
    iput-object p0, v0, LQ3/f;->j:LP3/b;

    .line 140
    .line 141
    iput-boolean p2, v0, LQ3/f;->k:Z

    .line 142
    .line 143
    iput v3, v0, LQ3/f;->m:I

    .line 144
    .line 145
    invoke-interface {v1, p3, v0}, LQ3/e;->b(Ljava/lang/Object;LA3/d;)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object p3

    .line 149
    if-ne p3, v5, :cond_1

    .line 150
    .line 151
    :goto_3
    return-object v5

    .line 152
    :cond_6
    iget-object p0, p0, LP3/b;->g:LP3/c;

    .line 153
    .line 154
    invoke-virtual {p0}, LP3/c;->l()Ljava/lang/Throwable;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    sget p3, LS3/t;->a:I

    .line 159
    .line 160
    throw p0

    .line 161
    :cond_7
    const-string p0, "`hasNext()` has not been invoked"

    .line 162
    .line 163
    new-instance p3, Ljava/lang/IllegalStateException;

    .line 164
    .line 165
    invoke-direct {p3, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    throw p3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 169
    :cond_8
    if-eqz p2, :cond_9

    .line 170
    .line 171
    invoke-interface {p1, v2}, LP3/s;->a(Ljava/util/concurrent/CancellationException;)V

    .line 172
    .line 173
    .line 174
    :cond_9
    sget-object p0, Ly3/h;->a:Ly3/h;

    .line 175
    .line 176
    return-object p0

    .line 177
    :goto_4
    :try_start_3
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 178
    :catchall_1
    move-exception p3

    .line 179
    if-eqz p2, :cond_c

    .line 180
    .line 181
    instance-of p2, p0, Ljava/util/concurrent/CancellationException;

    .line 182
    .line 183
    if-eqz p2, :cond_a

    .line 184
    .line 185
    move-object v2, p0

    .line 186
    check-cast v2, Ljava/util/concurrent/CancellationException;

    .line 187
    .line 188
    :cond_a
    if-nez v2, :cond_b

    .line 189
    .line 190
    new-instance v2, Ljava/util/concurrent/CancellationException;

    .line 191
    .line 192
    const-string p2, "Channel was consumed, consumer had failed"

    .line 193
    .line 194
    invoke-direct {v2, p2}, Ljava/util/concurrent/CancellationException;-><init>(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v2, p0}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 198
    .line 199
    .line 200
    :cond_b
    invoke-interface {p1, v2}, LP3/s;->a(Ljava/util/concurrent/CancellationException;)V

    .line 201
    .line 202
    .line 203
    :cond_c
    throw p3

    .line 204
    :cond_d
    check-cast p0, LQ3/t;

    .line 205
    .line 206
    iget-object p0, p0, LQ3/t;->e:Ljava/lang/Throwable;

    .line 207
    .line 208
    throw p0
.end method

.method public static final c(LQ3/d;LC3/c;)Ljava/lang/Object;
    .locals 5

    .line 1
    instance-of v0, p1, LQ3/o;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, LQ3/o;

    .line 7
    .line 8
    iget v1, v0, LQ3/o;->k:I

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
    iput v1, v0, LQ3/o;->k:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LQ3/o;

    .line 21
    .line 22
    invoke-direct {v0, p1}, LC3/c;-><init>(LA3/d;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p1, v0, LQ3/o;->j:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, LQ3/o;->k:I

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
    iget-object p0, v0, LQ3/o;->i:LI/y;

    .line 35
    .line 36
    iget-object v1, v0, LQ3/o;->h:LI3/p;

    .line 37
    .line 38
    :try_start_0
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_0
    .catch LR3/a; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    .line 40
    .line 41
    goto :goto_2

    .line 42
    :catch_0
    move-exception p1

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
    new-instance v1, LI3/p;

    .line 56
    .line 57
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 58
    .line 59
    .line 60
    new-instance p1, LI/y;

    .line 61
    .line 62
    const/4 v3, 0x1

    .line 63
    invoke-direct {p1, v3, v1}, LI/y;-><init>(ILjava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    :try_start_1
    iput-object v1, v0, LQ3/o;->h:LI3/p;

    .line 67
    .line 68
    iput-object p1, v0, LQ3/o;->i:LI/y;

    .line 69
    .line 70
    iput v2, v0, LQ3/o;->k:I

    .line 71
    .line 72
    invoke-interface {p0, p1, v0}, LQ3/d;->c(LQ3/e;LA3/d;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p0
    :try_end_1
    .catch LR3/a; {:try_start_1 .. :try_end_1} :catch_1

    .line 76
    sget-object p1, LB3/a;->e:LB3/a;

    .line 77
    .line 78
    if-ne p0, p1, :cond_3

    .line 79
    .line 80
    return-object p1

    .line 81
    :catch_1
    move-exception p0

    .line 82
    move-object v4, p1

    .line 83
    move-object p1, p0

    .line 84
    move-object p0, v4

    .line 85
    :goto_1
    iget-object v2, p1, LR3/a;->e:Ljava/lang/Object;

    .line 86
    .line 87
    if-ne v2, p0, :cond_4

    .line 88
    .line 89
    iget-object p0, v0, LC3/c;->f:LA3/i;

    .line 90
    .line 91
    invoke-static {p0}, LI3/h;->b(Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    invoke-static {p0}, LN3/v;->a(LA3/i;)V

    .line 95
    .line 96
    .line 97
    :cond_3
    :goto_2
    iget-object p0, v1, LI3/p;->e:Ljava/lang/Object;

    .line 98
    .line 99
    return-object p0

    .line 100
    :cond_4
    throw p1
.end method
