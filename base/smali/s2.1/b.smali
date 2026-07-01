.class public final Ls2/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr2/k;


# virtual methods
.method public final a(Lr2/b;Ljava/util/Map;)Lr2/m;
    .locals 9

    .line 1
    new-instance v1, Lu2/a;

    .line 2
    .line 3
    invoke-virtual {p1}, Lr2/b;->a()Lx2/b;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {v1, p1}, Lu2/a;-><init>(Lx2/b;)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    const/4 v2, 0x0

    .line 12
    :try_start_0
    invoke-virtual {v1, v2}, Lu2/a;->a(Z)Ls2/a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v3, v0, Ls2/a;->b:[Lr2/o;
    :try_end_0
    .catch Lr2/i; {:try_start_0 .. :try_end_0} :catch_5
    .catch Lr2/e; {:try_start_0 .. :try_end_0} :catch_4

    .line 17
    .line 18
    :try_start_1
    iget v4, v0, Ls2/a;->f:I
    :try_end_1
    .catch Lr2/i; {:try_start_1 .. :try_end_1} :catch_3
    .catch Lr2/e; {:try_start_1 .. :try_end_1} :catch_2

    .line 19
    .line 20
    :try_start_2
    new-instance v5, Lt2/a;

    .line 21
    .line 22
    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v5, v0}, Lt2/a;->a(Ls2/a;)Lx2/d;

    .line 26
    .line 27
    .line 28
    move-result-object v0
    :try_end_2
    .catch Lr2/i; {:try_start_2 .. :try_end_2} :catch_1
    .catch Lr2/e; {:try_start_2 .. :try_end_2} :catch_0

    .line 29
    move v5, v4

    .line 30
    move-object v4, p1

    .line 31
    move-object p1, v0

    .line 32
    move-object v0, v3

    .line 33
    move-object v3, v4

    .line 34
    goto :goto_4

    .line 35
    :catch_0
    move-exception v0

    .line 36
    goto :goto_2

    .line 37
    :catch_1
    move-exception v0

    .line 38
    goto :goto_3

    .line 39
    :catch_2
    move-exception v0

    .line 40
    :goto_0
    move v4, v2

    .line 41
    goto :goto_2

    .line 42
    :catch_3
    move-exception v0

    .line 43
    :goto_1
    move v4, v2

    .line 44
    goto :goto_3

    .line 45
    :catch_4
    move-exception v0

    .line 46
    move-object v3, p1

    .line 47
    goto :goto_0

    .line 48
    :catch_5
    move-exception v0

    .line 49
    move-object v3, p1

    .line 50
    goto :goto_1

    .line 51
    :goto_2
    move v5, v4

    .line 52
    move-object v4, v0

    .line 53
    move-object v0, v3

    .line 54
    move-object v3, p1

    .line 55
    goto :goto_4

    .line 56
    :goto_3
    move-object v5, v3

    .line 57
    move-object v3, v0

    .line 58
    move-object v0, v5

    .line 59
    move v5, v4

    .line 60
    move-object v4, p1

    .line 61
    :goto_4
    if-nez p1, :cond_0

    .line 62
    .line 63
    const/4 p1, 0x1

    .line 64
    :try_start_3
    invoke-virtual {v1, p1}, Lu2/a;->a(Z)Ls2/a;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iget-object v0, p1, Ls2/a;->b:[Lr2/o;

    .line 69
    .line 70
    iget v5, p1, Ls2/a;->f:I

    .line 71
    .line 72
    new-instance v1, Lt2/a;

    .line 73
    .line 74
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v1, p1}, Lt2/a;->a(Ls2/a;)Lx2/d;

    .line 78
    .line 79
    .line 80
    move-result-object p1
    :try_end_3
    .catch Lr2/i; {:try_start_3 .. :try_end_3} :catch_7
    .catch Lr2/e; {:try_start_3 .. :try_end_3} :catch_6

    .line 81
    :cond_0
    move-object v6, v0

    .line 82
    move v0, v5

    .line 83
    goto :goto_7

    .line 84
    :catch_6
    move-exception v0

    .line 85
    :goto_5
    move-object p1, v0

    .line 86
    goto :goto_6

    .line 87
    :catch_7
    move-exception v0

    .line 88
    goto :goto_5

    .line 89
    :goto_6
    if-nez v3, :cond_2

    .line 90
    .line 91
    if-eqz v4, :cond_1

    .line 92
    .line 93
    throw v4

    .line 94
    :cond_1
    throw p1

    .line 95
    :cond_2
    throw v3

    .line 96
    :goto_7
    if-eqz p2, :cond_3

    .line 97
    .line 98
    sget-object v1, Lr2/d;->n:Lr2/d;

    .line 99
    .line 100
    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    check-cast p2, Lr2/p;

    .line 105
    .line 106
    if-eqz p2, :cond_3

    .line 107
    .line 108
    array-length v1, v6

    .line 109
    :goto_8
    if-ge v2, v1, :cond_3

    .line 110
    .line 111
    aget-object v3, v6, v2

    .line 112
    .line 113
    invoke-interface {p2, v3}, Lr2/p;->a(Lr2/o;)V

    .line 114
    .line 115
    .line 116
    add-int/lit8 v2, v2, 0x1

    .line 117
    .line 118
    goto :goto_8

    .line 119
    :cond_3
    new-instance v3, Lr2/m;

    .line 120
    .line 121
    iget-object v4, p1, Lx2/d;->b:Ljava/lang/String;

    .line 122
    .line 123
    iget-object v5, p1, Lx2/d;->a:[B

    .line 124
    .line 125
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 126
    .line 127
    .line 128
    const/4 v8, 0x0

    .line 129
    sget-object v7, Lr2/a;->e:Lr2/a;

    .line 130
    .line 131
    invoke-direct/range {v3 .. v8}, Lr2/m;-><init>(Ljava/lang/String;[B[Lr2/o;Lr2/a;I)V

    .line 132
    .line 133
    .line 134
    iget-object p2, p1, Lx2/d;->c:Ljava/util/List;

    .line 135
    .line 136
    if-eqz p2, :cond_4

    .line 137
    .line 138
    sget-object v1, Lr2/n;->f:Lr2/n;

    .line 139
    .line 140
    invoke-virtual {v3, v1, p2}, Lr2/m;->b(Lr2/n;Ljava/lang/Object;)V

    .line 141
    .line 142
    .line 143
    :cond_4
    iget-object p2, p1, Lx2/d;->d:Ljava/lang/String;

    .line 144
    .line 145
    if-eqz p2, :cond_5

    .line 146
    .line 147
    sget-object v1, Lr2/n;->g:Lr2/n;

    .line 148
    .line 149
    invoke-virtual {v3, v1, p2}, Lr2/m;->b(Lr2/n;Ljava/lang/Object;)V

    .line 150
    .line 151
    .line 152
    :cond_5
    iget-object p2, p1, Lx2/d;->e:Ljava/lang/Integer;

    .line 153
    .line 154
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 155
    .line 156
    .line 157
    move-result p2

    .line 158
    add-int/2addr p2, v0

    .line 159
    sget-object v0, Lr2/n;->h:Lr2/n;

    .line 160
    .line 161
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 162
    .line 163
    .line 164
    move-result-object p2

    .line 165
    invoke-virtual {v3, v0, p2}, Lr2/m;->b(Lr2/n;Ljava/lang/Object;)V

    .line 166
    .line 167
    .line 168
    new-instance p2, Ljava/lang/StringBuilder;

    .line 169
    .line 170
    const-string v0, "]z"

    .line 171
    .line 172
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    iget p1, p1, Lx2/d;->j:I

    .line 176
    .line 177
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    sget-object p2, Lr2/n;->q:Lr2/n;

    .line 185
    .line 186
    invoke-virtual {v3, p2, p1}, Lr2/m;->b(Lr2/n;Ljava/lang/Object;)V

    .line 187
    .line 188
    .line 189
    return-object v3
.end method

.method public final reset()V
    .locals 0

    .line 1
    return-void
.end method
