.class public final Lp/k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field public synthetic e:[I

.field public synthetic f:[Ljava/lang/Object;

.field public synthetic g:I


# virtual methods
.method public final a(ILjava/lang/Object;)V
    .locals 6

    .line 1
    iget v0, p0, Lp/k;->g:I

    .line 2
    .line 3
    if-eqz v0, :cond_6

    .line 4
    .line 5
    iget-object v1, p0, Lp/k;->e:[I

    .line 6
    .line 7
    add-int/lit8 v2, v0, -0x1

    .line 8
    .line 9
    aget v1, v1, v2

    .line 10
    .line 11
    if-gt p1, v1, :cond_6

    .line 12
    .line 13
    iget-object v0, p0, Lp/k;->e:[I

    .line 14
    .line 15
    iget v1, p0, Lp/k;->g:I

    .line 16
    .line 17
    invoke-static {v1, p1, v0}, Lq/a;->a(II[I)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-ltz v0, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Lp/k;->f:[Ljava/lang/Object;

    .line 24
    .line 25
    aput-object p2, p1, v0

    .line 26
    .line 27
    goto :goto_2

    .line 28
    :cond_0
    not-int v0, v0

    .line 29
    iget v1, p0, Lp/k;->g:I

    .line 30
    .line 31
    if-ge v0, v1, :cond_1

    .line 32
    .line 33
    iget-object v2, p0, Lp/k;->f:[Ljava/lang/Object;

    .line 34
    .line 35
    aget-object v3, v2, v0

    .line 36
    .line 37
    sget-object v4, Lp/h;->b:Ljava/lang/Object;

    .line 38
    .line 39
    if-ne v3, v4, :cond_1

    .line 40
    .line 41
    iget-object v1, p0, Lp/k;->e:[I

    .line 42
    .line 43
    aput p1, v1, v0

    .line 44
    .line 45
    aput-object p2, v2, v0

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_1
    iget-object v2, p0, Lp/k;->e:[I

    .line 49
    .line 50
    array-length v2, v2

    .line 51
    const/4 v3, 0x1

    .line 52
    if-lt v1, v2, :cond_4

    .line 53
    .line 54
    add-int/2addr v1, v3

    .line 55
    const/4 v2, 0x4

    .line 56
    mul-int/2addr v1, v2

    .line 57
    move v4, v2

    .line 58
    :goto_0
    const/16 v5, 0x20

    .line 59
    .line 60
    if-ge v4, v5, :cond_3

    .line 61
    .line 62
    shl-int v5, v3, v4

    .line 63
    .line 64
    add-int/lit8 v5, v5, -0xc

    .line 65
    .line 66
    if-gt v1, v5, :cond_2

    .line 67
    .line 68
    move v1, v5

    .line 69
    goto :goto_1

    .line 70
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    :goto_1
    div-int/2addr v1, v2

    .line 74
    iget-object v2, p0, Lp/k;->e:[I

    .line 75
    .line 76
    invoke-static {v2, v1}, Ljava/util/Arrays;->copyOf([II)[I

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    const-string v4, "copyOf(this, newSize)"

    .line 81
    .line 82
    invoke-static {v2, v4}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    iput-object v2, p0, Lp/k;->e:[I

    .line 86
    .line 87
    iget-object v2, p0, Lp/k;->f:[Ljava/lang/Object;

    .line 88
    .line 89
    invoke-static {v2, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-static {v1, v4}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    iput-object v1, p0, Lp/k;->f:[Ljava/lang/Object;

    .line 97
    .line 98
    :cond_4
    iget v1, p0, Lp/k;->g:I

    .line 99
    .line 100
    sub-int v2, v1, v0

    .line 101
    .line 102
    if-eqz v2, :cond_5

    .line 103
    .line 104
    iget-object v2, p0, Lp/k;->e:[I

    .line 105
    .line 106
    add-int/lit8 v4, v0, 0x1

    .line 107
    .line 108
    invoke-static {v4, v0, v1, v2, v2}, Lz3/c;->I(III[I[I)V

    .line 109
    .line 110
    .line 111
    iget-object v1, p0, Lp/k;->f:[Ljava/lang/Object;

    .line 112
    .line 113
    iget v2, p0, Lp/k;->g:I

    .line 114
    .line 115
    invoke-static {v1, v1, v4, v0, v2}, Lz3/c;->J([Ljava/lang/Object;[Ljava/lang/Object;III)V

    .line 116
    .line 117
    .line 118
    :cond_5
    iget-object v1, p0, Lp/k;->e:[I

    .line 119
    .line 120
    aput p1, v1, v0

    .line 121
    .line 122
    iget-object p1, p0, Lp/k;->f:[Ljava/lang/Object;

    .line 123
    .line 124
    aput-object p2, p1, v0

    .line 125
    .line 126
    iget p1, p0, Lp/k;->g:I

    .line 127
    .line 128
    add-int/2addr p1, v3

    .line 129
    iput p1, p0, Lp/k;->g:I

    .line 130
    .line 131
    :goto_2
    return-void

    .line 132
    :cond_6
    iget-object v1, p0, Lp/k;->e:[I

    .line 133
    .line 134
    array-length v1, v1

    .line 135
    const/4 v2, 0x1

    .line 136
    if-lt v0, v1, :cond_9

    .line 137
    .line 138
    add-int/lit8 v1, v0, 0x1

    .line 139
    .line 140
    const/4 v3, 0x4

    .line 141
    mul-int/2addr v1, v3

    .line 142
    move v4, v3

    .line 143
    :goto_3
    const/16 v5, 0x20

    .line 144
    .line 145
    if-ge v4, v5, :cond_8

    .line 146
    .line 147
    shl-int v5, v2, v4

    .line 148
    .line 149
    add-int/lit8 v5, v5, -0xc

    .line 150
    .line 151
    if-gt v1, v5, :cond_7

    .line 152
    .line 153
    move v1, v5

    .line 154
    goto :goto_4

    .line 155
    :cond_7
    add-int/lit8 v4, v4, 0x1

    .line 156
    .line 157
    goto :goto_3

    .line 158
    :cond_8
    :goto_4
    div-int/2addr v1, v3

    .line 159
    iget-object v3, p0, Lp/k;->e:[I

    .line 160
    .line 161
    invoke-static {v3, v1}, Ljava/util/Arrays;->copyOf([II)[I

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    const-string v4, "copyOf(this, newSize)"

    .line 166
    .line 167
    invoke-static {v3, v4}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    iput-object v3, p0, Lp/k;->e:[I

    .line 171
    .line 172
    iget-object v3, p0, Lp/k;->f:[Ljava/lang/Object;

    .line 173
    .line 174
    invoke-static {v3, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    invoke-static {v1, v4}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    iput-object v1, p0, Lp/k;->f:[Ljava/lang/Object;

    .line 182
    .line 183
    :cond_9
    iget-object v1, p0, Lp/k;->e:[I

    .line 184
    .line 185
    aput p1, v1, v0

    .line 186
    .line 187
    iget-object p1, p0, Lp/k;->f:[Ljava/lang/Object;

    .line 188
    .line 189
    aput-object p2, p1, v0

    .line 190
    .line 191
    add-int/2addr v0, v2

    .line 192
    iput v0, p0, Lp/k;->g:I

    .line 193
    .line 194
    return-void
.end method

.method public final clone()Ljava/lang/Object;
    .locals 2

    .line 1
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "null cannot be cast to non-null type androidx.collection.SparseArrayCompat<E of androidx.collection.SparseArrayCompat>"

    .line 6
    .line 7
    invoke-static {v0, v1}, LI3/h;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    check-cast v0, Lp/k;

    .line 11
    .line 12
    iget-object v1, p0, Lp/k;->e:[I

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, [I

    .line 19
    .line 20
    iput-object v1, v0, Lp/k;->e:[I

    .line 21
    .line 22
    iget-object v1, p0, Lp/k;->f:[Ljava/lang/Object;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, [Ljava/lang/Object;

    .line 29
    .line 30
    iput-object v1, v0, Lp/k;->f:[Ljava/lang/Object;

    .line 31
    .line 32
    return-object v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 4

    .line 1
    iget v0, p0, Lp/k;->g:I

    .line 2
    .line 3
    if-gtz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "{}"

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    mul-int/lit8 v0, v0, 0x1c

    .line 11
    .line 12
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 13
    .line 14
    .line 15
    const/16 v0, 0x7b

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget v0, p0, Lp/k;->g:I

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    :goto_0
    if-ge v2, v0, :cond_3

    .line 24
    .line 25
    if-lez v2, :cond_1

    .line 26
    .line 27
    const-string v3, ", "

    .line 28
    .line 29
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    :cond_1
    iget-object v3, p0, Lp/k;->e:[I

    .line 33
    .line 34
    aget v3, v3, v2

    .line 35
    .line 36
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const/16 v3, 0x3d

    .line 40
    .line 41
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget-object v3, p0, Lp/k;->f:[Ljava/lang/Object;

    .line 45
    .line 46
    aget-object v3, v3, v2

    .line 47
    .line 48
    if-eq v3, p0, :cond_2

    .line 49
    .line 50
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_2
    const-string v3, "(this Map)"

    .line 55
    .line 56
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_3
    const/16 v0, 0x7d

    .line 63
    .line 64
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const-string v1, "buffer.toString()"

    .line 72
    .line 73
    invoke-static {v0, v1}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return-object v0
.end method
