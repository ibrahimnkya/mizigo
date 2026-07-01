.class public abstract LK2/g;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:LE/i;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LE/i;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-direct {v0, v1}, LE/i;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LK2/g;->a:LE/i;

    .line 8
    .line 9
    return-void
.end method

.method public static a(LK2/e;)LK2/c;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    iget-boolean v2, v0, LK2/e;->h:Z

    .line 8
    .line 9
    iget-object v3, v0, LA/c;->f:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v3, LK2/c;

    .line 12
    .line 13
    iget-object v4, v0, LA/c;->g:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v4, [LK2/a;

    .line 16
    .line 17
    invoke-virtual {v0}, LK2/e;->V()LK2/a;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    const/4 v6, -0x1

    .line 22
    const/4 v7, 0x1

    .line 23
    const/4 v8, 0x0

    .line 24
    if-nez v5, :cond_1

    .line 25
    .line 26
    move-object v0, v1

    .line 27
    goto/16 :goto_6

    .line 28
    .line 29
    :cond_1
    iget v5, v5, LK2/a;->f:I

    .line 30
    .line 31
    if-eqz v2, :cond_2

    .line 32
    .line 33
    iget-object v9, v3, LK2/c;->b:Lr2/o;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    iget-object v9, v3, LK2/c;->d:Lr2/o;

    .line 37
    .line 38
    :goto_0
    if-eqz v2, :cond_3

    .line 39
    .line 40
    iget-object v10, v3, LK2/c;->c:Lr2/o;

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_3
    iget-object v10, v3, LK2/c;->e:Lr2/o;

    .line 44
    .line 45
    :goto_1
    iget v9, v9, Lr2/o;->b:F

    .line 46
    .line 47
    float-to-int v9, v9

    .line 48
    invoke-virtual {v0, v9}, LA/c;->C(I)I

    .line 49
    .line 50
    .line 51
    move-result v9

    .line 52
    iget v10, v10, Lr2/o;->b:F

    .line 53
    .line 54
    float-to-int v10, v10

    .line 55
    invoke-virtual {v0, v10}, LA/c;->C(I)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    move v10, v6

    .line 60
    move v12, v7

    .line 61
    move v11, v8

    .line 62
    :goto_2
    if-ge v9, v0, :cond_8

    .line 63
    .line 64
    aget-object v13, v4, v9

    .line 65
    .line 66
    if-nez v13, :cond_4

    .line 67
    .line 68
    goto :goto_3

    .line 69
    :cond_4
    invoke-virtual {v13}, LK2/a;->c()V

    .line 70
    .line 71
    .line 72
    iget v14, v13, LK2/a;->f:I

    .line 73
    .line 74
    sub-int v15, v14, v10

    .line 75
    .line 76
    if-nez v15, :cond_5

    .line 77
    .line 78
    add-int/lit8 v11, v11, 0x1

    .line 79
    .line 80
    goto :goto_3

    .line 81
    :cond_5
    if-ne v15, v7, :cond_6

    .line 82
    .line 83
    invoke-static {v12, v11}, Ljava/lang/Math;->max(II)I

    .line 84
    .line 85
    .line 86
    move-result v12

    .line 87
    iget v10, v13, LK2/a;->f:I

    .line 88
    .line 89
    move v11, v7

    .line 90
    goto :goto_3

    .line 91
    :cond_6
    if-lt v14, v5, :cond_7

    .line 92
    .line 93
    aput-object v1, v4, v9

    .line 94
    .line 95
    goto :goto_3

    .line 96
    :cond_7
    move v11, v7

    .line 97
    move v10, v14

    .line 98
    :goto_3
    add-int/lit8 v9, v9, 0x1

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_8
    new-array v0, v5, [I

    .line 102
    .line 103
    array-length v9, v4

    .line 104
    move v10, v8

    .line 105
    :goto_4
    if-ge v10, v9, :cond_b

    .line 106
    .line 107
    aget-object v11, v4, v10

    .line 108
    .line 109
    if-eqz v11, :cond_a

    .line 110
    .line 111
    iget v11, v11, LK2/a;->f:I

    .line 112
    .line 113
    if-lt v11, v5, :cond_9

    .line 114
    .line 115
    goto :goto_5

    .line 116
    :cond_9
    aget v12, v0, v11

    .line 117
    .line 118
    add-int/2addr v12, v7

    .line 119
    aput v12, v0, v11

    .line 120
    .line 121
    :cond_a
    :goto_5
    add-int/lit8 v10, v10, 0x1

    .line 122
    .line 123
    goto :goto_4

    .line 124
    :cond_b
    :goto_6
    if-nez v0, :cond_c

    .line 125
    .line 126
    return-object v1

    .line 127
    :cond_c
    array-length v1, v0

    .line 128
    move v5, v8

    .line 129
    :goto_7
    if-ge v5, v1, :cond_d

    .line 130
    .line 131
    aget v9, v0, v5

    .line 132
    .line 133
    invoke-static {v6, v9}, Ljava/lang/Math;->max(II)I

    .line 134
    .line 135
    .line 136
    move-result v6

    .line 137
    add-int/lit8 v5, v5, 0x1

    .line 138
    .line 139
    goto :goto_7

    .line 140
    :cond_d
    array-length v1, v0

    .line 141
    move v5, v8

    .line 142
    move v9, v5

    .line 143
    :goto_8
    if-ge v5, v1, :cond_f

    .line 144
    .line 145
    aget v10, v0, v5

    .line 146
    .line 147
    sub-int v11, v6, v10

    .line 148
    .line 149
    add-int/2addr v9, v11

    .line 150
    if-lez v10, :cond_e

    .line 151
    .line 152
    goto :goto_9

    .line 153
    :cond_e
    add-int/lit8 v5, v5, 0x1

    .line 154
    .line 155
    goto :goto_8

    .line 156
    :cond_f
    :goto_9
    move v1, v8

    .line 157
    :goto_a
    if-lez v9, :cond_10

    .line 158
    .line 159
    aget-object v5, v4, v1

    .line 160
    .line 161
    if-nez v5, :cond_10

    .line 162
    .line 163
    add-int/lit8 v9, v9, -0x1

    .line 164
    .line 165
    add-int/lit8 v1, v1, 0x1

    .line 166
    .line 167
    goto :goto_a

    .line 168
    :cond_10
    array-length v1, v0

    .line 169
    sub-int/2addr v1, v7

    .line 170
    move v5, v8

    .line 171
    :goto_b
    if-ltz v1, :cond_12

    .line 172
    .line 173
    aget v10, v0, v1

    .line 174
    .line 175
    sub-int v11, v6, v10

    .line 176
    .line 177
    add-int/2addr v5, v11

    .line 178
    if-lez v10, :cond_11

    .line 179
    .line 180
    goto :goto_c

    .line 181
    :cond_11
    add-int/lit8 v1, v1, -0x1

    .line 182
    .line 183
    goto :goto_b

    .line 184
    :cond_12
    :goto_c
    array-length v0, v4

    .line 185
    sub-int/2addr v0, v7

    .line 186
    :goto_d
    if-lez v5, :cond_13

    .line 187
    .line 188
    aget-object v1, v4, v0

    .line 189
    .line 190
    if-nez v1, :cond_13

    .line 191
    .line 192
    add-int/lit8 v5, v5, -0x1

    .line 193
    .line 194
    add-int/lit8 v0, v0, -0x1

    .line 195
    .line 196
    goto :goto_d

    .line 197
    :cond_13
    iget-object v0, v3, LK2/c;->b:Lr2/o;

    .line 198
    .line 199
    iget-object v1, v3, LK2/c;->c:Lr2/o;

    .line 200
    .line 201
    iget-object v4, v3, LK2/c;->d:Lr2/o;

    .line 202
    .line 203
    iget-object v6, v3, LK2/c;->e:Lr2/o;

    .line 204
    .line 205
    if-lez v9, :cond_17

    .line 206
    .line 207
    if-eqz v2, :cond_14

    .line 208
    .line 209
    move-object v10, v0

    .line 210
    goto :goto_e

    .line 211
    :cond_14
    move-object v10, v4

    .line 212
    :goto_e
    iget v11, v10, Lr2/o;->b:F

    .line 213
    .line 214
    float-to-int v11, v11

    .line 215
    sub-int/2addr v11, v9

    .line 216
    if-gez v11, :cond_15

    .line 217
    .line 218
    goto :goto_f

    .line 219
    :cond_15
    move v8, v11

    .line 220
    :goto_f
    new-instance v9, Lr2/o;

    .line 221
    .line 222
    iget v10, v10, Lr2/o;->a:F

    .line 223
    .line 224
    int-to-float v8, v8

    .line 225
    invoke-direct {v9, v10, v8}, Lr2/o;-><init>(FF)V

    .line 226
    .line 227
    .line 228
    if-eqz v2, :cond_16

    .line 229
    .line 230
    move-object v15, v4

    .line 231
    move-object v13, v9

    .line 232
    goto :goto_10

    .line 233
    :cond_16
    move-object v13, v0

    .line 234
    move-object v15, v9

    .line 235
    goto :goto_10

    .line 236
    :cond_17
    move-object v13, v0

    .line 237
    move-object v15, v4

    .line 238
    :goto_10
    if-lez v5, :cond_1b

    .line 239
    .line 240
    if-eqz v2, :cond_18

    .line 241
    .line 242
    move-object v0, v1

    .line 243
    goto :goto_11

    .line 244
    :cond_18
    move-object v0, v6

    .line 245
    :goto_11
    iget v4, v0, Lr2/o;->b:F

    .line 246
    .line 247
    float-to-int v4, v4

    .line 248
    add-int/2addr v4, v5

    .line 249
    iget-object v5, v3, LK2/c;->a:Lx2/b;

    .line 250
    .line 251
    iget v5, v5, Lx2/b;->f:I

    .line 252
    .line 253
    if-lt v4, v5, :cond_19

    .line 254
    .line 255
    add-int/lit8 v4, v5, -0x1

    .line 256
    .line 257
    :cond_19
    new-instance v5, Lr2/o;

    .line 258
    .line 259
    iget v0, v0, Lr2/o;->a:F

    .line 260
    .line 261
    int-to-float v4, v4

    .line 262
    invoke-direct {v5, v0, v4}, Lr2/o;-><init>(FF)V

    .line 263
    .line 264
    .line 265
    if-eqz v2, :cond_1a

    .line 266
    .line 267
    move-object v14, v5

    .line 268
    :goto_12
    move-object/from16 v16, v6

    .line 269
    .line 270
    goto :goto_13

    .line 271
    :cond_1a
    move-object v14, v1

    .line 272
    move-object/from16 v16, v5

    .line 273
    .line 274
    goto :goto_13

    .line 275
    :cond_1b
    move-object v14, v1

    .line 276
    goto :goto_12

    .line 277
    :goto_13
    new-instance v11, LK2/c;

    .line 278
    .line 279
    iget-object v12, v3, LK2/c;->a:Lx2/b;

    .line 280
    .line 281
    invoke-direct/range {v11 .. v16}, LK2/c;-><init>(Lx2/b;Lr2/o;Lr2/o;Lr2/o;Lr2/o;)V

    .line 282
    .line 283
    .line 284
    return-object v11
.end method

.method public static b([II[I)Lx2/d;
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    array-length v2, v0

    .line 6
    if-eqz v2, :cond_49

    .line 7
    .line 8
    add-int/lit8 v2, p1, 0x1

    .line 9
    .line 10
    const/4 v3, 0x1

    .line 11
    shl-int v2, v3, v2

    .line 12
    .line 13
    array-length v4, v1

    .line 14
    div-int/lit8 v5, v2, 0x2

    .line 15
    .line 16
    add-int/lit8 v5, v5, 0x3

    .line 17
    .line 18
    if-gt v4, v5, :cond_48

    .line 19
    .line 20
    if-ltz v2, :cond_48

    .line 21
    .line 22
    const/16 v4, 0x200

    .line 23
    .line 24
    if-gt v2, v4, :cond_48

    .line 25
    .line 26
    sget-object v4, LK2/g;->a:LE/i;

    .line 27
    .line 28
    iget-object v4, v4, LE/i;->f:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v4, LL2/a;

    .line 31
    .line 32
    array-length v5, v0

    .line 33
    if-eqz v5, :cond_47

    .line 34
    .line 35
    array-length v5, v0

    .line 36
    const/4 v6, 0x0

    .line 37
    if-le v5, v3, :cond_2

    .line 38
    .line 39
    aget v7, v0, v6

    .line 40
    .line 41
    if-nez v7, :cond_2

    .line 42
    .line 43
    move v7, v3

    .line 44
    :goto_0
    if-ge v7, v5, :cond_0

    .line 45
    .line 46
    aget v8, v0, v7

    .line 47
    .line 48
    if-nez v8, :cond_0

    .line 49
    .line 50
    add-int/lit8 v7, v7, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    if-ne v7, v5, :cond_1

    .line 54
    .line 55
    filled-new-array {v6}, [I

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    goto :goto_1

    .line 60
    :cond_1
    sub-int/2addr v5, v7

    .line 61
    new-array v8, v5, [I

    .line 62
    .line 63
    invoke-static {v0, v7, v8, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 64
    .line 65
    .line 66
    move-object v5, v8

    .line 67
    goto :goto_1

    .line 68
    :cond_2
    move-object v5, v0

    .line 69
    :goto_1
    new-array v7, v2, [I

    .line 70
    .line 71
    move v8, v2

    .line 72
    move v9, v6

    .line 73
    :goto_2
    if-lez v8, :cond_7

    .line 74
    .line 75
    iget-object v10, v4, LL2/a;->a:[I

    .line 76
    .line 77
    aget v10, v10, v8

    .line 78
    .line 79
    if-nez v10, :cond_3

    .line 80
    .line 81
    array-length v10, v5

    .line 82
    sub-int/2addr v10, v3

    .line 83
    aget v10, v5, v10

    .line 84
    .line 85
    goto :goto_5

    .line 86
    :cond_3
    if-ne v10, v3, :cond_5

    .line 87
    .line 88
    array-length v10, v5

    .line 89
    move v11, v6

    .line 90
    move v12, v11

    .line 91
    :goto_3
    if-ge v12, v10, :cond_4

    .line 92
    .line 93
    aget v13, v5, v12

    .line 94
    .line 95
    invoke-virtual {v4, v11, v13}, LL2/a;->a(II)I

    .line 96
    .line 97
    .line 98
    move-result v11

    .line 99
    add-int/lit8 v12, v12, 0x1

    .line 100
    .line 101
    goto :goto_3

    .line 102
    :cond_4
    move v10, v11

    .line 103
    goto :goto_5

    .line 104
    :cond_5
    aget v11, v5, v6

    .line 105
    .line 106
    array-length v12, v5

    .line 107
    move v13, v3

    .line 108
    :goto_4
    if-ge v13, v12, :cond_4

    .line 109
    .line 110
    invoke-virtual {v4, v10, v11}, LL2/a;->c(II)I

    .line 111
    .line 112
    .line 113
    move-result v11

    .line 114
    aget v14, v5, v13

    .line 115
    .line 116
    invoke-virtual {v4, v11, v14}, LL2/a;->a(II)I

    .line 117
    .line 118
    .line 119
    move-result v11

    .line 120
    add-int/lit8 v13, v13, 0x1

    .line 121
    .line 122
    goto :goto_4

    .line 123
    :goto_5
    sub-int v11, v2, v8

    .line 124
    .line 125
    aput v10, v7, v11

    .line 126
    .line 127
    if-eqz v10, :cond_6

    .line 128
    .line 129
    move v9, v3

    .line 130
    :cond_6
    add-int/lit8 v8, v8, -0x1

    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_7
    if-nez v9, :cond_8

    .line 134
    .line 135
    move v3, v6

    .line 136
    goto/16 :goto_18

    .line 137
    .line 138
    :cond_8
    iget-object v5, v4, LL2/a;->d:LA/c;

    .line 139
    .line 140
    iget-object v8, v4, LL2/a;->c:LA/c;

    .line 141
    .line 142
    array-length v9, v1

    .line 143
    move v10, v6

    .line 144
    :goto_6
    const/16 v11, 0x3a1

    .line 145
    .line 146
    if-ge v10, v9, :cond_9

    .line 147
    .line 148
    aget v12, v1, v10

    .line 149
    .line 150
    array-length v13, v0

    .line 151
    sub-int/2addr v13, v3

    .line 152
    sub-int/2addr v13, v12

    .line 153
    iget-object v12, v4, LL2/a;->a:[I

    .line 154
    .line 155
    aget v12, v12, v13

    .line 156
    .line 157
    new-instance v13, LA/c;

    .line 158
    .line 159
    rsub-int v12, v12, 0x3a1

    .line 160
    .line 161
    rem-int/2addr v12, v11

    .line 162
    filled-new-array {v12, v3}, [I

    .line 163
    .line 164
    .line 165
    move-result-object v11

    .line 166
    invoke-direct {v13, v4, v11}, LA/c;-><init>(LL2/a;[I)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v5, v13}, LA/c;->J(LA/c;)LA/c;

    .line 170
    .line 171
    .line 172
    move-result-object v5

    .line 173
    add-int/lit8 v10, v10, 0x1

    .line 174
    .line 175
    goto :goto_6

    .line 176
    :cond_9
    new-instance v5, LA/c;

    .line 177
    .line 178
    invoke-direct {v5, v4, v7}, LA/c;-><init>(LL2/a;[I)V

    .line 179
    .line 180
    .line 181
    if-ltz v2, :cond_46

    .line 182
    .line 183
    add-int/lit8 v7, v2, 0x1

    .line 184
    .line 185
    new-array v7, v7, [I

    .line 186
    .line 187
    aput v3, v7, v6

    .line 188
    .line 189
    new-instance v9, LA/c;

    .line 190
    .line 191
    invoke-direct {v9, v4, v7}, LA/c;-><init>(LL2/a;[I)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v9}, LA/c;->z()I

    .line 195
    .line 196
    .line 197
    move-result v7

    .line 198
    invoke-virtual {v5}, LA/c;->z()I

    .line 199
    .line 200
    .line 201
    move-result v10

    .line 202
    if-ge v7, v10, :cond_a

    .line 203
    .line 204
    goto :goto_7

    .line 205
    :cond_a
    move-object/from16 v21, v9

    .line 206
    .line 207
    move-object v9, v5

    .line 208
    move-object/from16 v5, v21

    .line 209
    .line 210
    :goto_7
    iget-object v7, v4, LL2/a;->d:LA/c;

    .line 211
    .line 212
    move-object v10, v7

    .line 213
    move-object v7, v5

    .line 214
    move-object v5, v9

    .line 215
    move-object v9, v10

    .line 216
    move-object v10, v8

    .line 217
    :goto_8
    invoke-virtual {v5}, LA/c;->z()I

    .line 218
    .line 219
    .line 220
    move-result v12

    .line 221
    div-int/lit8 v13, v2, 0x2

    .line 222
    .line 223
    if-lt v12, v13, :cond_13

    .line 224
    .line 225
    invoke-virtual {v5}, LA/c;->F()Z

    .line 226
    .line 227
    .line 228
    move-result v12

    .line 229
    if-nez v12, :cond_12

    .line 230
    .line 231
    invoke-virtual {v5}, LA/c;->z()I

    .line 232
    .line 233
    .line 234
    move-result v12

    .line 235
    invoke-virtual {v5, v12}, LA/c;->x(I)I

    .line 236
    .line 237
    .line 238
    move-result v12

    .line 239
    invoke-virtual {v4, v12}, LL2/a;->b(I)I

    .line 240
    .line 241
    .line 242
    move-result v12

    .line 243
    move-object v13, v8

    .line 244
    :goto_9
    invoke-virtual {v7}, LA/c;->z()I

    .line 245
    .line 246
    .line 247
    move-result v14

    .line 248
    invoke-virtual {v5}, LA/c;->z()I

    .line 249
    .line 250
    .line 251
    move-result v15

    .line 252
    if-lt v14, v15, :cond_10

    .line 253
    .line 254
    invoke-virtual {v7}, LA/c;->F()Z

    .line 255
    .line 256
    .line 257
    move-result v14

    .line 258
    if-nez v14, :cond_10

    .line 259
    .line 260
    invoke-virtual {v7}, LA/c;->z()I

    .line 261
    .line 262
    .line 263
    move-result v14

    .line 264
    invoke-virtual {v5}, LA/c;->z()I

    .line 265
    .line 266
    .line 267
    move-result v15

    .line 268
    sub-int/2addr v14, v15

    .line 269
    invoke-virtual {v7}, LA/c;->z()I

    .line 270
    .line 271
    .line 272
    move-result v15

    .line 273
    invoke-virtual {v7, v15}, LA/c;->x(I)I

    .line 274
    .line 275
    .line 276
    move-result v15

    .line 277
    invoke-virtual {v4, v15, v12}, LL2/a;->c(II)I

    .line 278
    .line 279
    .line 280
    move-result v15

    .line 281
    if-ltz v14, :cond_f

    .line 282
    .line 283
    if-nez v15, :cond_b

    .line 284
    .line 285
    move/from16 v16, v3

    .line 286
    .line 287
    move-object v6, v8

    .line 288
    goto :goto_a

    .line 289
    :cond_b
    move/from16 v16, v3

    .line 290
    .line 291
    add-int/lit8 v3, v14, 0x1

    .line 292
    .line 293
    new-array v3, v3, [I

    .line 294
    .line 295
    aput v15, v3, v6

    .line 296
    .line 297
    new-instance v6, LA/c;

    .line 298
    .line 299
    invoke-direct {v6, v4, v3}, LA/c;-><init>(LL2/a;[I)V

    .line 300
    .line 301
    .line 302
    :goto_a
    invoke-virtual {v13, v6}, LA/c;->n(LA/c;)LA/c;

    .line 303
    .line 304
    .line 305
    move-result-object v13

    .line 306
    iget-object v3, v5, LA/c;->g:Ljava/lang/Object;

    .line 307
    .line 308
    check-cast v3, [I

    .line 309
    .line 310
    iget-object v6, v5, LA/c;->f:Ljava/lang/Object;

    .line 311
    .line 312
    check-cast v6, LL2/a;

    .line 313
    .line 314
    if-ltz v14, :cond_e

    .line 315
    .line 316
    if-nez v15, :cond_c

    .line 317
    .line 318
    iget-object v3, v6, LL2/a;->c:LA/c;

    .line 319
    .line 320
    goto :goto_c

    .line 321
    :cond_c
    array-length v11, v3

    .line 322
    add-int/2addr v14, v11

    .line 323
    new-array v14, v14, [I

    .line 324
    .line 325
    move-object/from16 v19, v3

    .line 326
    .line 327
    const/4 v3, 0x0

    .line 328
    :goto_b
    if-ge v3, v11, :cond_d

    .line 329
    .line 330
    move/from16 v20, v3

    .line 331
    .line 332
    aget v3, v19, v20

    .line 333
    .line 334
    invoke-virtual {v6, v3, v15}, LL2/a;->c(II)I

    .line 335
    .line 336
    .line 337
    move-result v3

    .line 338
    aput v3, v14, v20

    .line 339
    .line 340
    add-int/lit8 v3, v20, 0x1

    .line 341
    .line 342
    goto :goto_b

    .line 343
    :cond_d
    new-instance v3, LA/c;

    .line 344
    .line 345
    invoke-direct {v3, v6, v14}, LA/c;-><init>(LL2/a;[I)V

    .line 346
    .line 347
    .line 348
    :goto_c
    invoke-virtual {v7, v3}, LA/c;->T(LA/c;)LA/c;

    .line 349
    .line 350
    .line 351
    move-result-object v7

    .line 352
    move/from16 v3, v16

    .line 353
    .line 354
    const/4 v6, 0x0

    .line 355
    const/16 v11, 0x3a1

    .line 356
    .line 357
    goto :goto_9

    .line 358
    :cond_e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 359
    .line 360
    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 361
    .line 362
    .line 363
    throw v0

    .line 364
    :cond_f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 365
    .line 366
    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 367
    .line 368
    .line 369
    throw v0

    .line 370
    :cond_10
    move/from16 v16, v3

    .line 371
    .line 372
    invoke-virtual {v13, v9}, LA/c;->J(LA/c;)LA/c;

    .line 373
    .line 374
    .line 375
    move-result-object v3

    .line 376
    invoke-virtual {v3, v10}, LA/c;->T(LA/c;)LA/c;

    .line 377
    .line 378
    .line 379
    move-result-object v3

    .line 380
    iget-object v6, v3, LA/c;->f:Ljava/lang/Object;

    .line 381
    .line 382
    check-cast v6, LL2/a;

    .line 383
    .line 384
    iget-object v3, v3, LA/c;->g:Ljava/lang/Object;

    .line 385
    .line 386
    check-cast v3, [I

    .line 387
    .line 388
    array-length v10, v3

    .line 389
    new-array v11, v10, [I

    .line 390
    .line 391
    const/4 v12, 0x0

    .line 392
    :goto_d
    if-ge v12, v10, :cond_11

    .line 393
    .line 394
    aget v13, v3, v12

    .line 395
    .line 396
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 397
    .line 398
    .line 399
    const/16 v14, 0x3a1

    .line 400
    .line 401
    rsub-int v13, v13, 0x3a1

    .line 402
    .line 403
    rem-int/2addr v13, v14

    .line 404
    aput v13, v11, v12

    .line 405
    .line 406
    add-int/lit8 v12, v12, 0x1

    .line 407
    .line 408
    goto :goto_d

    .line 409
    :cond_11
    new-instance v3, LA/c;

    .line 410
    .line 411
    invoke-direct {v3, v6, v11}, LA/c;-><init>(LL2/a;[I)V

    .line 412
    .line 413
    .line 414
    move-object v6, v7

    .line 415
    move-object v7, v5

    .line 416
    move-object v5, v6

    .line 417
    move-object v10, v9

    .line 418
    const/4 v6, 0x0

    .line 419
    const/16 v11, 0x3a1

    .line 420
    .line 421
    move-object v9, v3

    .line 422
    move/from16 v3, v16

    .line 423
    .line 424
    goto/16 :goto_8

    .line 425
    .line 426
    :cond_12
    invoke-static {}, Lr2/c;->a()Lr2/c;

    .line 427
    .line 428
    .line 429
    move-result-object v0

    .line 430
    throw v0

    .line 431
    :cond_13
    move/from16 v16, v3

    .line 432
    .line 433
    move v3, v6

    .line 434
    invoke-virtual {v9, v3}, LA/c;->x(I)I

    .line 435
    .line 436
    .line 437
    move-result v6

    .line 438
    if-eqz v6, :cond_45

    .line 439
    .line 440
    invoke-virtual {v4, v6}, LL2/a;->b(I)I

    .line 441
    .line 442
    .line 443
    move-result v6

    .line 444
    invoke-virtual {v9, v6}, LA/c;->I(I)LA/c;

    .line 445
    .line 446
    .line 447
    move-result-object v7

    .line 448
    invoke-virtual {v5, v6}, LA/c;->I(I)LA/c;

    .line 449
    .line 450
    .line 451
    move-result-object v5

    .line 452
    filled-new-array {v7, v5}, [LA/c;

    .line 453
    .line 454
    .line 455
    move-result-object v5

    .line 456
    aget-object v6, v5, v3

    .line 457
    .line 458
    aget-object v3, v5, v16

    .line 459
    .line 460
    invoke-virtual {v6}, LA/c;->z()I

    .line 461
    .line 462
    .line 463
    move-result v5

    .line 464
    new-array v7, v5, [I

    .line 465
    .line 466
    move/from16 v8, v16

    .line 467
    .line 468
    const/4 v9, 0x0

    .line 469
    :goto_e
    const/16 v14, 0x3a1

    .line 470
    .line 471
    if-ge v8, v14, :cond_15

    .line 472
    .line 473
    if-ge v9, v5, :cond_15

    .line 474
    .line 475
    invoke-virtual {v6, v8}, LA/c;->r(I)I

    .line 476
    .line 477
    .line 478
    move-result v10

    .line 479
    if-nez v10, :cond_14

    .line 480
    .line 481
    invoke-virtual {v4, v8}, LL2/a;->b(I)I

    .line 482
    .line 483
    .line 484
    move-result v10

    .line 485
    aput v10, v7, v9

    .line 486
    .line 487
    add-int/lit8 v9, v9, 0x1

    .line 488
    .line 489
    :cond_14
    add-int/lit8 v8, v8, 0x1

    .line 490
    .line 491
    goto :goto_e

    .line 492
    :cond_15
    if-ne v9, v5, :cond_44

    .line 493
    .line 494
    invoke-virtual {v6}, LA/c;->z()I

    .line 495
    .line 496
    .line 497
    move-result v8

    .line 498
    move/from16 v9, v16

    .line 499
    .line 500
    if-ge v8, v9, :cond_16

    .line 501
    .line 502
    const/4 v9, 0x0

    .line 503
    new-array v3, v9, [I

    .line 504
    .line 505
    goto/16 :goto_16

    .line 506
    .line 507
    :cond_16
    new-array v9, v8, [I

    .line 508
    .line 509
    const/4 v10, 0x1

    .line 510
    :goto_f
    if-gt v10, v8, :cond_17

    .line 511
    .line 512
    sub-int v11, v8, v10

    .line 513
    .line 514
    invoke-virtual {v6, v10}, LA/c;->x(I)I

    .line 515
    .line 516
    .line 517
    move-result v12

    .line 518
    invoke-virtual {v4, v10, v12}, LL2/a;->c(II)I

    .line 519
    .line 520
    .line 521
    move-result v12

    .line 522
    aput v12, v9, v11

    .line 523
    .line 524
    add-int/lit8 v10, v10, 0x1

    .line 525
    .line 526
    goto :goto_f

    .line 527
    :cond_17
    if-eqz v8, :cond_43

    .line 528
    .line 529
    const/4 v6, 0x1

    .line 530
    if-le v8, v6, :cond_1a

    .line 531
    .line 532
    const/16 v17, 0x0

    .line 533
    .line 534
    aget v6, v9, v17

    .line 535
    .line 536
    if-nez v6, :cond_1a

    .line 537
    .line 538
    const/4 v6, 0x1

    .line 539
    :goto_10
    if-ge v6, v8, :cond_18

    .line 540
    .line 541
    aget v10, v9, v6

    .line 542
    .line 543
    if-nez v10, :cond_18

    .line 544
    .line 545
    add-int/lit8 v6, v6, 0x1

    .line 546
    .line 547
    goto :goto_10

    .line 548
    :cond_18
    if-ne v6, v8, :cond_19

    .line 549
    .line 550
    const/4 v10, 0x0

    .line 551
    filled-new-array {v10}, [I

    .line 552
    .line 553
    .line 554
    move-result-object v9

    .line 555
    goto :goto_11

    .line 556
    :cond_19
    const/4 v10, 0x0

    .line 557
    sub-int/2addr v8, v6

    .line 558
    new-array v11, v8, [I

    .line 559
    .line 560
    invoke-static {v9, v6, v11, v10, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 561
    .line 562
    .line 563
    move-object v9, v11

    .line 564
    :cond_1a
    :goto_11
    new-array v6, v5, [I

    .line 565
    .line 566
    const/4 v8, 0x0

    .line 567
    :goto_12
    if-ge v8, v5, :cond_1f

    .line 568
    .line 569
    aget v10, v7, v8

    .line 570
    .line 571
    invoke-virtual {v4, v10}, LL2/a;->b(I)I

    .line 572
    .line 573
    .line 574
    move-result v10

    .line 575
    invoke-virtual {v3, v10}, LA/c;->r(I)I

    .line 576
    .line 577
    .line 578
    move-result v11

    .line 579
    const/16 v14, 0x3a1

    .line 580
    .line 581
    rsub-int v11, v11, 0x3a1

    .line 582
    .line 583
    rem-int/2addr v11, v14

    .line 584
    if-nez v10, :cond_1b

    .line 585
    .line 586
    array-length v10, v9

    .line 587
    const/4 v12, 0x1

    .line 588
    sub-int/2addr v10, v12

    .line 589
    aget v10, v9, v10

    .line 590
    .line 591
    goto :goto_15

    .line 592
    :cond_1b
    const/4 v12, 0x1

    .line 593
    if-ne v10, v12, :cond_1d

    .line 594
    .line 595
    array-length v10, v9

    .line 596
    const/4 v12, 0x0

    .line 597
    const/4 v13, 0x0

    .line 598
    :goto_13
    if-ge v12, v10, :cond_1c

    .line 599
    .line 600
    aget v14, v9, v12

    .line 601
    .line 602
    invoke-virtual {v4, v13, v14}, LL2/a;->a(II)I

    .line 603
    .line 604
    .line 605
    move-result v13

    .line 606
    add-int/lit8 v12, v12, 0x1

    .line 607
    .line 608
    goto :goto_13

    .line 609
    :cond_1c
    move v10, v13

    .line 610
    goto :goto_15

    .line 611
    :cond_1d
    const/16 v17, 0x0

    .line 612
    .line 613
    aget v12, v9, v17

    .line 614
    .line 615
    array-length v13, v9

    .line 616
    const/4 v14, 0x1

    .line 617
    :goto_14
    if-ge v14, v13, :cond_1e

    .line 618
    .line 619
    invoke-virtual {v4, v10, v12}, LL2/a;->c(II)I

    .line 620
    .line 621
    .line 622
    move-result v12

    .line 623
    aget v15, v9, v14

    .line 624
    .line 625
    invoke-virtual {v4, v12, v15}, LL2/a;->a(II)I

    .line 626
    .line 627
    .line 628
    move-result v12

    .line 629
    add-int/lit8 v14, v14, 0x1

    .line 630
    .line 631
    goto :goto_14

    .line 632
    :cond_1e
    move v10, v12

    .line 633
    :goto_15
    invoke-virtual {v4, v10}, LL2/a;->b(I)I

    .line 634
    .line 635
    .line 636
    move-result v10

    .line 637
    invoke-virtual {v4, v11, v10}, LL2/a;->c(II)I

    .line 638
    .line 639
    .line 640
    move-result v10

    .line 641
    aput v10, v6, v8

    .line 642
    .line 643
    add-int/lit8 v8, v8, 0x1

    .line 644
    .line 645
    goto :goto_12

    .line 646
    :cond_1f
    move-object v3, v6

    .line 647
    :goto_16
    const/4 v6, 0x0

    .line 648
    :goto_17
    if-ge v6, v5, :cond_22

    .line 649
    .line 650
    array-length v8, v0

    .line 651
    const/16 v16, 0x1

    .line 652
    .line 653
    add-int/lit8 v8, v8, -0x1

    .line 654
    .line 655
    aget v9, v7, v6

    .line 656
    .line 657
    if-eqz v9, :cond_21

    .line 658
    .line 659
    iget-object v10, v4, LL2/a;->b:[I

    .line 660
    .line 661
    aget v9, v10, v9

    .line 662
    .line 663
    sub-int/2addr v8, v9

    .line 664
    if-ltz v8, :cond_20

    .line 665
    .line 666
    aget v9, v0, v8

    .line 667
    .line 668
    aget v10, v3, v6

    .line 669
    .line 670
    const/16 v14, 0x3a1

    .line 671
    .line 672
    add-int v11, v14, v9

    .line 673
    .line 674
    sub-int/2addr v11, v10

    .line 675
    rem-int/2addr v11, v14

    .line 676
    aput v11, v0, v8

    .line 677
    .line 678
    add-int/lit8 v6, v6, 0x1

    .line 679
    .line 680
    goto :goto_17

    .line 681
    :cond_20
    invoke-static {}, Lr2/c;->a()Lr2/c;

    .line 682
    .line 683
    .line 684
    move-result-object v0

    .line 685
    throw v0

    .line 686
    :cond_21
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 687
    .line 688
    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 689
    .line 690
    .line 691
    throw v0

    .line 692
    :cond_22
    move v3, v5

    .line 693
    :goto_18
    array-length v4, v0

    .line 694
    const/4 v5, 0x4

    .line 695
    if-lt v4, v5, :cond_42

    .line 696
    .line 697
    const/16 v17, 0x0

    .line 698
    .line 699
    aget v4, v0, v17

    .line 700
    .line 701
    array-length v5, v0

    .line 702
    if-gt v4, v5, :cond_41

    .line 703
    .line 704
    if-nez v4, :cond_24

    .line 705
    .line 706
    array-length v4, v0

    .line 707
    if-ge v2, v4, :cond_23

    .line 708
    .line 709
    array-length v4, v0

    .line 710
    sub-int/2addr v4, v2

    .line 711
    aput v4, v0, v17

    .line 712
    .line 713
    goto :goto_19

    .line 714
    :cond_23
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 715
    .line 716
    .line 717
    move-result-object v0

    .line 718
    throw v0

    .line 719
    :cond_24
    :goto_19
    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 720
    .line 721
    .line 722
    move-result-object v2

    .line 723
    sget-object v4, LK2/d;->a:[C

    .line 724
    .line 725
    new-instance v4, Lm/x0;

    .line 726
    .line 727
    array-length v5, v0

    .line 728
    const/4 v6, 0x2

    .line 729
    mul-int/2addr v5, v6

    .line 730
    invoke-direct {v4, v5}, Lm/x0;-><init>(I)V

    .line 731
    .line 732
    .line 733
    const/4 v9, 0x1

    .line 734
    invoke-static {v0, v9, v4}, LK2/d;->d([IILm/x0;)I

    .line 735
    .line 736
    .line 737
    move-result v5

    .line 738
    new-instance v7, LJ2/c;

    .line 739
    .line 740
    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    .line 741
    .line 742
    .line 743
    const/16 v17, 0x0

    .line 744
    .line 745
    :goto_1a
    aget v8, v0, v17

    .line 746
    .line 747
    if-ge v5, v8, :cond_3d

    .line 748
    .line 749
    add-int/lit8 v9, v5, 0x1

    .line 750
    .line 751
    aget v10, v0, v5

    .line 752
    .line 753
    const/16 v11, 0x391

    .line 754
    .line 755
    if-eq v10, v11, :cond_3c

    .line 756
    .line 757
    packed-switch v10, :pswitch_data_0

    .line 758
    .line 759
    .line 760
    packed-switch v10, :pswitch_data_1

    .line 761
    .line 762
    .line 763
    invoke-static {v0, v5, v4}, LK2/d;->d([IILm/x0;)I

    .line 764
    .line 765
    .line 766
    move-result v5

    .line 767
    :goto_1b
    move-object/from16 v18, v7

    .line 768
    .line 769
    :goto_1c
    const/16 v16, 0x1

    .line 770
    .line 771
    const/16 v17, 0x0

    .line 772
    .line 773
    goto/16 :goto_2c

    .line 774
    .line 775
    :pswitch_0
    add-int/lit8 v5, v5, 0x3

    .line 776
    .line 777
    if-gt v5, v8, :cond_2f

    .line 778
    .line 779
    new-array v5, v6, [I

    .line 780
    .line 781
    const/4 v8, 0x0

    .line 782
    :goto_1d
    if-ge v8, v6, :cond_25

    .line 783
    .line 784
    aget v10, v0, v9

    .line 785
    .line 786
    aput v10, v5, v8

    .line 787
    .line 788
    add-int/lit8 v8, v8, 0x1

    .line 789
    .line 790
    add-int/lit8 v9, v9, 0x1

    .line 791
    .line 792
    goto :goto_1d

    .line 793
    :cond_25
    invoke-static {v5, v6}, LK2/d;->a([II)Ljava/lang/String;

    .line 794
    .line 795
    .line 796
    move-result-object v5

    .line 797
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 798
    .line 799
    .line 800
    move-result v8

    .line 801
    if-eqz v8, :cond_26

    .line 802
    .line 803
    goto :goto_1e

    .line 804
    :cond_26
    :try_start_0
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_4

    .line 805
    .line 806
    .line 807
    :goto_1e
    new-instance v5, Ljava/lang/StringBuilder;

    .line 808
    .line 809
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 810
    .line 811
    .line 812
    :goto_1f
    const/16 v17, 0x0

    .line 813
    .line 814
    aget v8, v0, v17

    .line 815
    .line 816
    const/16 v10, 0x39a

    .line 817
    .line 818
    const/16 v11, 0x39b

    .line 819
    .line 820
    if-ge v9, v8, :cond_27

    .line 821
    .line 822
    array-length v8, v0

    .line 823
    if-ge v9, v8, :cond_27

    .line 824
    .line 825
    aget v8, v0, v9

    .line 826
    .line 827
    if-eq v8, v10, :cond_27

    .line 828
    .line 829
    if-eq v8, v11, :cond_27

    .line 830
    .line 831
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 832
    .line 833
    .line 834
    move-result-object v8

    .line 835
    filled-new-array {v8}, [Ljava/lang/Object;

    .line 836
    .line 837
    .line 838
    move-result-object v8

    .line 839
    const-string v10, "%03d"

    .line 840
    .line 841
    invoke-static {v10, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 842
    .line 843
    .line 844
    move-result-object v8

    .line 845
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 846
    .line 847
    .line 848
    add-int/lit8 v9, v9, 0x1

    .line 849
    .line 850
    goto :goto_1f

    .line 851
    :cond_27
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    .line 852
    .line 853
    .line 854
    move-result v8

    .line 855
    if-eqz v8, :cond_2e

    .line 856
    .line 857
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 858
    .line 859
    .line 860
    move-result-object v5

    .line 861
    iput-object v5, v7, LJ2/c;->a:Ljava/lang/String;

    .line 862
    .line 863
    aget v5, v0, v9

    .line 864
    .line 865
    const/4 v8, -0x1

    .line 866
    if-ne v5, v11, :cond_28

    .line 867
    .line 868
    add-int/lit8 v5, v9, 0x1

    .line 869
    .line 870
    :goto_20
    const/16 v17, 0x0

    .line 871
    .line 872
    goto :goto_21

    .line 873
    :cond_28
    move v5, v8

    .line 874
    goto :goto_20

    .line 875
    :goto_21
    aget v12, v0, v17

    .line 876
    .line 877
    if-ge v9, v12, :cond_2b

    .line 878
    .line 879
    aget v12, v0, v9

    .line 880
    .line 881
    if-eq v12, v10, :cond_2a

    .line 882
    .line 883
    if-ne v12, v11, :cond_29

    .line 884
    .line 885
    add-int/lit8 v12, v9, 0x1

    .line 886
    .line 887
    aget v12, v0, v12

    .line 888
    .line 889
    const/16 v13, 0xd

    .line 890
    .line 891
    packed-switch v12, :pswitch_data_2

    .line 892
    .line 893
    .line 894
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 895
    .line 896
    .line 897
    move-result-object v0

    .line 898
    throw v0

    .line 899
    :pswitch_1
    new-instance v12, Lm/x0;

    .line 900
    .line 901
    const/4 v14, 0x0

    .line 902
    invoke-direct {v12, v13, v14}, Lm/x0;-><init>(IB)V

    .line 903
    .line 904
    .line 905
    add-int/lit8 v9, v9, 0x2

    .line 906
    .line 907
    invoke-static {v0, v9, v12}, LK2/d;->c([IILm/x0;)I

    .line 908
    .line 909
    .line 910
    move-result v9

    .line 911
    :try_start_1
    invoke-virtual {v12}, Lm/x0;->toString()Ljava/lang/String;

    .line 912
    .line 913
    .line 914
    move-result-object v12

    .line 915
    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 916
    .line 917
    .line 918
    goto :goto_20

    .line 919
    :catch_0
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 920
    .line 921
    .line 922
    move-result-object v0

    .line 923
    throw v0

    .line 924
    :pswitch_2
    new-instance v12, Lm/x0;

    .line 925
    .line 926
    const/4 v14, 0x0

    .line 927
    invoke-direct {v12, v13, v14}, Lm/x0;-><init>(IB)V

    .line 928
    .line 929
    .line 930
    add-int/lit8 v9, v9, 0x2

    .line 931
    .line 932
    invoke-static {v0, v9, v12}, LK2/d;->c([IILm/x0;)I

    .line 933
    .line 934
    .line 935
    move-result v9

    .line 936
    :try_start_2
    invoke-virtual {v12}, Lm/x0;->toString()Ljava/lang/String;

    .line 937
    .line 938
    .line 939
    move-result-object v12

    .line 940
    invoke-static {v12}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_1

    .line 941
    .line 942
    .line 943
    goto :goto_20

    .line 944
    :catch_1
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 945
    .line 946
    .line 947
    move-result-object v0

    .line 948
    throw v0

    .line 949
    :pswitch_3
    new-instance v12, Lm/x0;

    .line 950
    .line 951
    const/4 v14, 0x0

    .line 952
    invoke-direct {v12, v13, v14}, Lm/x0;-><init>(IB)V

    .line 953
    .line 954
    .line 955
    add-int/lit8 v9, v9, 0x2

    .line 956
    .line 957
    invoke-static {v0, v9, v12}, LK2/d;->d([IILm/x0;)I

    .line 958
    .line 959
    .line 960
    move-result v9

    .line 961
    invoke-virtual {v12}, Lm/x0;->toString()Ljava/lang/String;

    .line 962
    .line 963
    .line 964
    :goto_22
    move/from16 v17, v14

    .line 965
    .line 966
    goto :goto_21

    .line 967
    :pswitch_4
    const/4 v14, 0x0

    .line 968
    new-instance v12, Lm/x0;

    .line 969
    .line 970
    invoke-direct {v12, v13, v14}, Lm/x0;-><init>(IB)V

    .line 971
    .line 972
    .line 973
    add-int/lit8 v9, v9, 0x2

    .line 974
    .line 975
    invoke-static {v0, v9, v12}, LK2/d;->d([IILm/x0;)I

    .line 976
    .line 977
    .line 978
    move-result v9

    .line 979
    invoke-virtual {v12}, Lm/x0;->toString()Ljava/lang/String;

    .line 980
    .line 981
    .line 982
    goto :goto_22

    .line 983
    :pswitch_5
    const/4 v14, 0x0

    .line 984
    new-instance v12, Lm/x0;

    .line 985
    .line 986
    invoke-direct {v12, v13, v14}, Lm/x0;-><init>(IB)V

    .line 987
    .line 988
    .line 989
    add-int/lit8 v9, v9, 0x2

    .line 990
    .line 991
    invoke-static {v0, v9, v12}, LK2/d;->c([IILm/x0;)I

    .line 992
    .line 993
    .line 994
    move-result v9

    .line 995
    :try_start_3
    invoke-virtual {v12}, Lm/x0;->toString()Ljava/lang/String;

    .line 996
    .line 997
    .line 998
    move-result-object v12

    .line 999
    invoke-static {v12}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_2

    .line 1000
    .line 1001
    .line 1002
    goto/16 :goto_20

    .line 1003
    .line 1004
    :catch_2
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 1005
    .line 1006
    .line 1007
    move-result-object v0

    .line 1008
    throw v0

    .line 1009
    :pswitch_6
    new-instance v12, Lm/x0;

    .line 1010
    .line 1011
    const/4 v14, 0x0

    .line 1012
    invoke-direct {v12, v13, v14}, Lm/x0;-><init>(IB)V

    .line 1013
    .line 1014
    .line 1015
    add-int/lit8 v9, v9, 0x2

    .line 1016
    .line 1017
    invoke-static {v0, v9, v12}, LK2/d;->c([IILm/x0;)I

    .line 1018
    .line 1019
    .line 1020
    move-result v9

    .line 1021
    :try_start_4
    invoke-virtual {v12}, Lm/x0;->toString()Ljava/lang/String;

    .line 1022
    .line 1023
    .line 1024
    move-result-object v12

    .line 1025
    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_3

    .line 1026
    .line 1027
    .line 1028
    goto/16 :goto_20

    .line 1029
    .line 1030
    :catch_3
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 1031
    .line 1032
    .line 1033
    move-result-object v0

    .line 1034
    throw v0

    .line 1035
    :pswitch_7
    new-instance v12, Lm/x0;

    .line 1036
    .line 1037
    const/4 v14, 0x0

    .line 1038
    invoke-direct {v12, v13, v14}, Lm/x0;-><init>(IB)V

    .line 1039
    .line 1040
    .line 1041
    add-int/lit8 v9, v9, 0x2

    .line 1042
    .line 1043
    invoke-static {v0, v9, v12}, LK2/d;->d([IILm/x0;)I

    .line 1044
    .line 1045
    .line 1046
    move-result v9

    .line 1047
    invoke-virtual {v12}, Lm/x0;->toString()Ljava/lang/String;

    .line 1048
    .line 1049
    .line 1050
    goto/16 :goto_20

    .line 1051
    .line 1052
    :cond_29
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 1053
    .line 1054
    .line 1055
    move-result-object v0

    .line 1056
    throw v0

    .line 1057
    :cond_2a
    add-int/lit8 v9, v9, 0x1

    .line 1058
    .line 1059
    const/4 v12, 0x1

    .line 1060
    iput-boolean v12, v7, LJ2/c;->b:Z

    .line 1061
    .line 1062
    goto/16 :goto_20

    .line 1063
    .line 1064
    :cond_2b
    if-eq v5, v8, :cond_2d

    .line 1065
    .line 1066
    sub-int v8, v9, v5

    .line 1067
    .line 1068
    iget-boolean v10, v7, LJ2/c;->b:Z

    .line 1069
    .line 1070
    if-eqz v10, :cond_2c

    .line 1071
    .line 1072
    add-int/lit8 v8, v8, -0x1

    .line 1073
    .line 1074
    :cond_2c
    if-lez v8, :cond_2d

    .line 1075
    .line 1076
    add-int/2addr v8, v5

    .line 1077
    invoke-static {v0, v5, v8}, Ljava/util/Arrays;->copyOfRange([III)[I

    .line 1078
    .line 1079
    .line 1080
    :cond_2d
    move-object/from16 v18, v7

    .line 1081
    .line 1082
    move v5, v9

    .line 1083
    goto/16 :goto_1c

    .line 1084
    .line 1085
    :cond_2e
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 1086
    .line 1087
    .line 1088
    move-result-object v0

    .line 1089
    throw v0

    .line 1090
    :catch_4
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 1091
    .line 1092
    .line 1093
    move-result-object v0

    .line 1094
    throw v0

    .line 1095
    :cond_2f
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 1096
    .line 1097
    .line 1098
    move-result-object v0

    .line 1099
    throw v0

    .line 1100
    :pswitch_8
    add-int/lit8 v5, v5, 0x2

    .line 1101
    .line 1102
    aget v8, v0, v9

    .line 1103
    .line 1104
    invoke-virtual {v4, v8}, Lm/x0;->t(I)V

    .line 1105
    .line 1106
    .line 1107
    goto/16 :goto_1b

    .line 1108
    .line 1109
    :pswitch_9
    add-int/lit8 v5, v5, 0x3

    .line 1110
    .line 1111
    goto/16 :goto_1b

    .line 1112
    .line 1113
    :pswitch_a
    add-int/lit8 v5, v5, 0x2

    .line 1114
    .line 1115
    goto/16 :goto_1b

    .line 1116
    .line 1117
    :pswitch_b
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 1118
    .line 1119
    .line 1120
    move-result-object v0

    .line 1121
    throw v0

    .line 1122
    :pswitch_c
    invoke-static {v0, v9, v4}, LK2/d;->c([IILm/x0;)I

    .line 1123
    .line 1124
    .line 1125
    move-result v5

    .line 1126
    goto/16 :goto_1b

    .line 1127
    .line 1128
    :pswitch_d
    const/4 v5, 0x0

    .line 1129
    const/16 v17, 0x0

    .line 1130
    .line 1131
    :goto_23
    aget v8, v0, v17

    .line 1132
    .line 1133
    if-ge v9, v8, :cond_3b

    .line 1134
    .line 1135
    if-nez v5, :cond_3b

    .line 1136
    .line 1137
    :goto_24
    aget v8, v0, v17

    .line 1138
    .line 1139
    const/16 v11, 0x39f

    .line 1140
    .line 1141
    if-ge v9, v8, :cond_30

    .line 1142
    .line 1143
    aget v12, v0, v9

    .line 1144
    .line 1145
    if-ne v12, v11, :cond_30

    .line 1146
    .line 1147
    add-int/lit8 v8, v9, 0x1

    .line 1148
    .line 1149
    aget v8, v0, v8

    .line 1150
    .line 1151
    invoke-virtual {v4, v8}, Lm/x0;->t(I)V

    .line 1152
    .line 1153
    .line 1154
    add-int/lit8 v9, v9, 0x2

    .line 1155
    .line 1156
    const/16 v17, 0x0

    .line 1157
    .line 1158
    goto :goto_24

    .line 1159
    :cond_30
    if-ge v9, v8, :cond_31

    .line 1160
    .line 1161
    aget v8, v0, v9

    .line 1162
    .line 1163
    const/16 v12, 0x384

    .line 1164
    .line 1165
    if-lt v8, v12, :cond_32

    .line 1166
    .line 1167
    :cond_31
    move-object/from16 v18, v7

    .line 1168
    .line 1169
    const/16 v16, 0x1

    .line 1170
    .line 1171
    const/16 v17, 0x0

    .line 1172
    .line 1173
    goto/16 :goto_2b

    .line 1174
    .line 1175
    :cond_32
    const-wide/16 v13, 0x0

    .line 1176
    .line 1177
    const/4 v8, 0x0

    .line 1178
    :goto_25
    const-wide/16 v18, 0x384

    .line 1179
    .line 1180
    mul-long v13, v13, v18

    .line 1181
    .line 1182
    add-int/lit8 v15, v9, 0x1

    .line 1183
    .line 1184
    aget v9, v0, v9

    .line 1185
    .line 1186
    move-object/from16 v18, v7

    .line 1187
    .line 1188
    int-to-long v6, v9

    .line 1189
    add-long/2addr v13, v6

    .line 1190
    const/16 v16, 0x1

    .line 1191
    .line 1192
    add-int/lit8 v8, v8, 0x1

    .line 1193
    .line 1194
    const/4 v6, 0x5

    .line 1195
    if-ge v8, v6, :cond_34

    .line 1196
    .line 1197
    const/16 v17, 0x0

    .line 1198
    .line 1199
    aget v7, v0, v17

    .line 1200
    .line 1201
    if-ge v15, v7, :cond_34

    .line 1202
    .line 1203
    aget v7, v0, v15

    .line 1204
    .line 1205
    if-lt v7, v12, :cond_33

    .line 1206
    .line 1207
    goto :goto_26

    .line 1208
    :cond_33
    move v9, v15

    .line 1209
    move-object/from16 v7, v18

    .line 1210
    .line 1211
    const/4 v6, 0x2

    .line 1212
    goto :goto_25

    .line 1213
    :cond_34
    :goto_26
    if-ne v8, v6, :cond_37

    .line 1214
    .line 1215
    const/16 v6, 0x39c

    .line 1216
    .line 1217
    if-eq v10, v6, :cond_35

    .line 1218
    .line 1219
    const/16 v17, 0x0

    .line 1220
    .line 1221
    aget v6, v0, v17

    .line 1222
    .line 1223
    if-ge v15, v6, :cond_37

    .line 1224
    .line 1225
    aget v6, v0, v15

    .line 1226
    .line 1227
    if-ge v6, v12, :cond_37

    .line 1228
    .line 1229
    :cond_35
    const/4 v6, 0x0

    .line 1230
    :goto_27
    const/4 v7, 0x6

    .line 1231
    if-ge v6, v7, :cond_36

    .line 1232
    .line 1233
    rsub-int/lit8 v7, v6, 0x5

    .line 1234
    .line 1235
    mul-int/lit8 v7, v7, 0x8

    .line 1236
    .line 1237
    shr-long v7, v13, v7

    .line 1238
    .line 1239
    long-to-int v7, v7

    .line 1240
    int-to-byte v7, v7

    .line 1241
    iget-object v8, v4, Lm/x0;->f:Ljava/lang/Object;

    .line 1242
    .line 1243
    check-cast v8, Ljava/lang/StringBuilder;

    .line 1244
    .line 1245
    and-int/lit16 v7, v7, 0xff

    .line 1246
    .line 1247
    int-to-char v7, v7

    .line 1248
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1249
    .line 1250
    .line 1251
    add-int/lit8 v6, v6, 0x1

    .line 1252
    .line 1253
    goto :goto_27

    .line 1254
    :cond_36
    const/16 v17, 0x0

    .line 1255
    .line 1256
    :goto_28
    move v9, v15

    .line 1257
    goto :goto_2a

    .line 1258
    :cond_37
    sub-int/2addr v15, v8

    .line 1259
    move v9, v5

    .line 1260
    const/16 v17, 0x0

    .line 1261
    .line 1262
    :goto_29
    aget v5, v0, v17

    .line 1263
    .line 1264
    if-ge v15, v5, :cond_3a

    .line 1265
    .line 1266
    if-nez v9, :cond_3a

    .line 1267
    .line 1268
    add-int/lit8 v5, v15, 0x1

    .line 1269
    .line 1270
    aget v6, v0, v15

    .line 1271
    .line 1272
    if-ge v6, v12, :cond_38

    .line 1273
    .line 1274
    int-to-byte v6, v6

    .line 1275
    iget-object v7, v4, Lm/x0;->f:Ljava/lang/Object;

    .line 1276
    .line 1277
    check-cast v7, Ljava/lang/StringBuilder;

    .line 1278
    .line 1279
    and-int/lit16 v6, v6, 0xff

    .line 1280
    .line 1281
    int-to-char v6, v6

    .line 1282
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1283
    .line 1284
    .line 1285
    move v15, v5

    .line 1286
    goto :goto_29

    .line 1287
    :cond_38
    if-ne v6, v11, :cond_39

    .line 1288
    .line 1289
    add-int/lit8 v15, v15, 0x2

    .line 1290
    .line 1291
    aget v5, v0, v5

    .line 1292
    .line 1293
    invoke-virtual {v4, v5}, Lm/x0;->t(I)V

    .line 1294
    .line 1295
    .line 1296
    goto :goto_29

    .line 1297
    :cond_39
    move/from16 v9, v16

    .line 1298
    .line 1299
    goto :goto_29

    .line 1300
    :cond_3a
    move v5, v9

    .line 1301
    goto :goto_28

    .line 1302
    :goto_2a
    move-object/from16 v7, v18

    .line 1303
    .line 1304
    const/4 v6, 0x2

    .line 1305
    goto/16 :goto_23

    .line 1306
    .line 1307
    :goto_2b
    move/from16 v5, v16

    .line 1308
    .line 1309
    goto :goto_2a

    .line 1310
    :cond_3b
    move-object/from16 v18, v7

    .line 1311
    .line 1312
    const/16 v16, 0x1

    .line 1313
    .line 1314
    move v5, v9

    .line 1315
    goto :goto_2c

    .line 1316
    :pswitch_e
    move-object/from16 v18, v7

    .line 1317
    .line 1318
    const/16 v16, 0x1

    .line 1319
    .line 1320
    const/16 v17, 0x0

    .line 1321
    .line 1322
    invoke-static {v0, v9, v4}, LK2/d;->d([IILm/x0;)I

    .line 1323
    .line 1324
    .line 1325
    move-result v5

    .line 1326
    goto :goto_2c

    .line 1327
    :cond_3c
    move-object/from16 v18, v7

    .line 1328
    .line 1329
    const/16 v16, 0x1

    .line 1330
    .line 1331
    const/16 v17, 0x0

    .line 1332
    .line 1333
    add-int/lit8 v5, v5, 0x2

    .line 1334
    .line 1335
    aget v6, v0, v9

    .line 1336
    .line 1337
    int-to-char v6, v6

    .line 1338
    invoke-virtual {v4, v6}, Lm/x0;->s(C)V

    .line 1339
    .line 1340
    .line 1341
    :goto_2c
    move-object/from16 v7, v18

    .line 1342
    .line 1343
    const/4 v6, 0x2

    .line 1344
    goto/16 :goto_1a

    .line 1345
    .line 1346
    :cond_3d
    move-object/from16 v18, v7

    .line 1347
    .line 1348
    iget-object v0, v4, Lm/x0;->f:Ljava/lang/Object;

    .line 1349
    .line 1350
    check-cast v0, Ljava/lang/StringBuilder;

    .line 1351
    .line 1352
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 1353
    .line 1354
    .line 1355
    move-result v0

    .line 1356
    if-nez v0, :cond_3f

    .line 1357
    .line 1358
    iget-object v0, v4, Lm/x0;->g:Ljava/lang/Object;

    .line 1359
    .line 1360
    check-cast v0, Ljava/lang/StringBuilder;

    .line 1361
    .line 1362
    if-eqz v0, :cond_3e

    .line 1363
    .line 1364
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 1365
    .line 1366
    .line 1367
    move-result v0

    .line 1368
    if-nez v0, :cond_3f

    .line 1369
    .line 1370
    :cond_3e
    move-object/from16 v0, v18

    .line 1371
    .line 1372
    goto :goto_2d

    .line 1373
    :cond_3f
    move-object/from16 v0, v18

    .line 1374
    .line 1375
    goto :goto_2e

    .line 1376
    :goto_2d
    iget-object v5, v0, LJ2/c;->a:Ljava/lang/String;

    .line 1377
    .line 1378
    if-eqz v5, :cond_40

    .line 1379
    .line 1380
    goto :goto_2e

    .line 1381
    :cond_40
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 1382
    .line 1383
    .line 1384
    move-result-object v0

    .line 1385
    throw v0

    .line 1386
    :goto_2e
    new-instance v5, Lx2/d;

    .line 1387
    .line 1388
    invoke-virtual {v4}, Lm/x0;->toString()Ljava/lang/String;

    .line 1389
    .line 1390
    .line 1391
    move-result-object v4

    .line 1392
    const/4 v6, 0x0

    .line 1393
    invoke-direct {v5, v4, v2, v6}, Lx2/d;-><init>(Ljava/lang/String;Ljava/lang/String;[B)V

    .line 1394
    .line 1395
    .line 1396
    iput-object v0, v5, Lx2/d;->g:Ljava/lang/Object;

    .line 1397
    .line 1398
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1399
    .line 1400
    .line 1401
    move-result-object v0

    .line 1402
    iput-object v0, v5, Lx2/d;->e:Ljava/lang/Integer;

    .line 1403
    .line 1404
    array-length v0, v1

    .line 1405
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1406
    .line 1407
    .line 1408
    move-result-object v0

    .line 1409
    iput-object v0, v5, Lx2/d;->f:Ljava/lang/Integer;

    .line 1410
    .line 1411
    return-object v5

    .line 1412
    :cond_41
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 1413
    .line 1414
    .line 1415
    move-result-object v0

    .line 1416
    throw v0

    .line 1417
    :cond_42
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 1418
    .line 1419
    .line 1420
    move-result-object v0

    .line 1421
    throw v0

    .line 1422
    :cond_43
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 1423
    .line 1424
    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 1425
    .line 1426
    .line 1427
    throw v0

    .line 1428
    :cond_44
    invoke-static {}, Lr2/c;->a()Lr2/c;

    .line 1429
    .line 1430
    .line 1431
    move-result-object v0

    .line 1432
    throw v0

    .line 1433
    :cond_45
    invoke-static {}, Lr2/c;->a()Lr2/c;

    .line 1434
    .line 1435
    .line 1436
    move-result-object v0

    .line 1437
    throw v0

    .line 1438
    :cond_46
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 1439
    .line 1440
    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 1441
    .line 1442
    .line 1443
    throw v0

    .line 1444
    :cond_47
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 1445
    .line 1446
    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 1447
    .line 1448
    .line 1449
    throw v0

    .line 1450
    :cond_48
    invoke-static {}, Lr2/c;->a()Lr2/c;

    .line 1451
    .line 1452
    .line 1453
    move-result-object v0

    .line 1454
    throw v0

    .line 1455
    :cond_49
    invoke-static {}, Lr2/e;->a()Lr2/e;

    .line 1456
    .line 1457
    .line 1458
    move-result-object v0

    .line 1459
    throw v0

    .line 1460
    nop

    .line 1461
    :pswitch_data_0
    .packed-switch 0x384
        :pswitch_e
        :pswitch_d
        :pswitch_c
    .end packed-switch

    .line 1462
    .line 1463
    .line 1464
    .line 1465
    .line 1466
    .line 1467
    .line 1468
    .line 1469
    .line 1470
    .line 1471
    :pswitch_data_1
    .packed-switch 0x39a
        :pswitch_b
        :pswitch_b
        :pswitch_d
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_0
    .end packed-switch

    .line 1472
    .line 1473
    .line 1474
    .line 1475
    .line 1476
    .line 1477
    .line 1478
    .line 1479
    .line 1480
    .line 1481
    .line 1482
    .line 1483
    .line 1484
    .line 1485
    .line 1486
    .line 1487
    .line 1488
    .line 1489
    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static c(Lx2/b;IIZIIII)LK2/a;
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    move/from16 v3, p5

    .line 8
    .line 9
    const/4 v4, -0x1

    .line 10
    const/4 v5, 0x1

    .line 11
    if-eqz p3, :cond_0

    .line 12
    .line 13
    move v6, v4

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v6, v5

    .line 16
    :goto_0
    const/4 v7, 0x0

    .line 17
    move/from16 v10, p3

    .line 18
    .line 19
    move/from16 v9, p4

    .line 20
    .line 21
    move v8, v7

    .line 22
    :goto_1
    const/4 v11, 0x2

    .line 23
    if-ge v8, v11, :cond_4

    .line 24
    .line 25
    :goto_2
    if-eqz v10, :cond_1

    .line 26
    .line 27
    if-lt v9, v1, :cond_3

    .line 28
    .line 29
    goto :goto_3

    .line 30
    :cond_1
    if-ge v9, v2, :cond_3

    .line 31
    .line 32
    :goto_3
    invoke-virtual {v0, v9, v3}, Lx2/b;->b(II)Z

    .line 33
    .line 34
    .line 35
    move-result v12

    .line 36
    if-ne v10, v12, :cond_3

    .line 37
    .line 38
    sub-int v12, p4, v9

    .line 39
    .line 40
    invoke-static {v12}, Ljava/lang/Math;->abs(I)I

    .line 41
    .line 42
    .line 43
    move-result v12

    .line 44
    if-le v12, v11, :cond_2

    .line 45
    .line 46
    move/from16 v9, p4

    .line 47
    .line 48
    goto :goto_4

    .line 49
    :cond_2
    add-int/2addr v9, v6

    .line 50
    goto :goto_2

    .line 51
    :cond_3
    neg-int v6, v6

    .line 52
    xor-int/lit8 v10, v10, 0x1

    .line 53
    .line 54
    add-int/lit8 v8, v8, 0x1

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_4
    :goto_4
    const/16 v6, 0x8

    .line 58
    .line 59
    new-array v8, v6, [I

    .line 60
    .line 61
    if-eqz p3, :cond_5

    .line 62
    .line 63
    move v10, v5

    .line 64
    goto :goto_5

    .line 65
    :cond_5
    move v10, v4

    .line 66
    :goto_5
    move/from16 v14, p3

    .line 67
    .line 68
    move v13, v7

    .line 69
    move v12, v9

    .line 70
    :goto_6
    if-eqz p3, :cond_6

    .line 71
    .line 72
    if-ge v12, v2, :cond_8

    .line 73
    .line 74
    goto :goto_7

    .line 75
    :cond_6
    if-lt v12, v1, :cond_8

    .line 76
    .line 77
    :goto_7
    if-ge v13, v6, :cond_8

    .line 78
    .line 79
    invoke-virtual {v0, v12, v3}, Lx2/b;->b(II)Z

    .line 80
    .line 81
    .line 82
    move-result v15

    .line 83
    if-ne v15, v14, :cond_7

    .line 84
    .line 85
    aget v15, v8, v13

    .line 86
    .line 87
    add-int/2addr v15, v5

    .line 88
    aput v15, v8, v13

    .line 89
    .line 90
    add-int/2addr v12, v10

    .line 91
    goto :goto_6

    .line 92
    :cond_7
    add-int/lit8 v13, v13, 0x1

    .line 93
    .line 94
    xor-int/lit8 v14, v14, 0x1

    .line 95
    .line 96
    goto :goto_6

    .line 97
    :cond_8
    const/4 v0, 0x7

    .line 98
    if-eq v13, v6, :cond_b

    .line 99
    .line 100
    if-eqz p3, :cond_9

    .line 101
    .line 102
    move v1, v2

    .line 103
    :cond_9
    if-ne v12, v1, :cond_a

    .line 104
    .line 105
    if-ne v13, v0, :cond_a

    .line 106
    .line 107
    goto :goto_8

    .line 108
    :cond_a
    const/4 v8, 0x0

    .line 109
    :cond_b
    :goto_8
    if-nez v8, :cond_d

    .line 110
    .line 111
    :cond_c
    const/16 p4, 0x0

    .line 112
    .line 113
    goto/16 :goto_17

    .line 114
    .line 115
    :cond_d
    invoke-static {v8}, Ld1/d;->B([I)I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-eqz p3, :cond_e

    .line 120
    .line 121
    add-int v2, v9, v1

    .line 122
    .line 123
    goto :goto_a

    .line 124
    :cond_e
    move v2, v7

    .line 125
    :goto_9
    array-length v10, v8

    .line 126
    div-int/2addr v10, v11

    .line 127
    if-ge v2, v10, :cond_f

    .line 128
    .line 129
    aget v10, v8, v2

    .line 130
    .line 131
    array-length v12, v8

    .line 132
    sub-int/2addr v12, v5

    .line 133
    sub-int/2addr v12, v2

    .line 134
    aget v12, v8, v12

    .line 135
    .line 136
    aput v12, v8, v2

    .line 137
    .line 138
    array-length v12, v8

    .line 139
    sub-int/2addr v12, v5

    .line 140
    sub-int/2addr v12, v2

    .line 141
    aput v10, v8, v12

    .line 142
    .line 143
    add-int/lit8 v2, v2, 0x1

    .line 144
    .line 145
    goto :goto_9

    .line 146
    :cond_f
    sub-int v2, v9, v1

    .line 147
    .line 148
    move/from16 v18, v9

    .line 149
    .line 150
    move v9, v2

    .line 151
    move/from16 v2, v18

    .line 152
    .line 153
    :goto_a
    add-int/lit8 v10, p6, -0x2

    .line 154
    .line 155
    if-gt v10, v1, :cond_c

    .line 156
    .line 157
    add-int/lit8 v10, p7, 0x2

    .line 158
    .line 159
    if-gt v1, v10, :cond_c

    .line 160
    .line 161
    sget-object v1, LK2/f;->a:[[F

    .line 162
    .line 163
    invoke-static {v8}, Ld1/d;->B([I)I

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    int-to-float v1, v1

    .line 168
    new-array v10, v6, [I

    .line 169
    .line 170
    move v12, v7

    .line 171
    move v13, v12

    .line 172
    move v14, v13

    .line 173
    :goto_b
    const/16 v15, 0x11

    .line 174
    .line 175
    if-ge v12, v15, :cond_11

    .line 176
    .line 177
    const/high16 v15, 0x42080000    # 34.0f

    .line 178
    .line 179
    div-float v15, v1, v15

    .line 180
    .line 181
    int-to-float v0, v12

    .line 182
    mul-float/2addr v0, v1

    .line 183
    const/high16 v16, 0x41880000    # 17.0f

    .line 184
    .line 185
    div-float v0, v0, v16

    .line 186
    .line 187
    add-float/2addr v0, v15

    .line 188
    aget v15, v8, v14

    .line 189
    .line 190
    add-int/2addr v15, v13

    .line 191
    const/16 p4, 0x0

    .line 192
    .line 193
    int-to-float v3, v15

    .line 194
    cmpg-float v0, v3, v0

    .line 195
    .line 196
    if-gtz v0, :cond_10

    .line 197
    .line 198
    add-int/lit8 v14, v14, 0x1

    .line 199
    .line 200
    move v13, v15

    .line 201
    :cond_10
    aget v0, v10, v14

    .line 202
    .line 203
    add-int/2addr v0, v5

    .line 204
    aput v0, v10, v14

    .line 205
    .line 206
    add-int/lit8 v12, v12, 0x1

    .line 207
    .line 208
    const/4 v0, 0x7

    .line 209
    goto :goto_b

    .line 210
    :cond_11
    const/16 p4, 0x0

    .line 211
    .line 212
    const-wide/16 v0, 0x0

    .line 213
    .line 214
    move v3, v7

    .line 215
    :goto_c
    if-ge v3, v6, :cond_14

    .line 216
    .line 217
    move v12, v7

    .line 218
    :goto_d
    aget v13, v10, v3

    .line 219
    .line 220
    if-ge v12, v13, :cond_13

    .line 221
    .line 222
    shl-long/2addr v0, v5

    .line 223
    rem-int/lit8 v13, v3, 0x2

    .line 224
    .line 225
    if-nez v13, :cond_12

    .line 226
    .line 227
    move v13, v5

    .line 228
    goto :goto_e

    .line 229
    :cond_12
    move v13, v7

    .line 230
    :goto_e
    int-to-long v13, v13

    .line 231
    or-long/2addr v0, v13

    .line 232
    add-int/lit8 v12, v12, 0x1

    .line 233
    .line 234
    goto :goto_d

    .line 235
    :cond_13
    add-int/lit8 v3, v3, 0x1

    .line 236
    .line 237
    goto :goto_c

    .line 238
    :cond_14
    long-to-int v0, v0

    .line 239
    const v1, 0x3ffff

    .line 240
    .line 241
    .line 242
    and-int v3, v0, v1

    .line 243
    .line 244
    sget-object v10, LJ2/a;->b:[I

    .line 245
    .line 246
    invoke-static {v10, v3}, Ljava/util/Arrays;->binarySearch([II)I

    .line 247
    .line 248
    .line 249
    move-result v3

    .line 250
    sget-object v12, LJ2/a;->c:[I

    .line 251
    .line 252
    if-gez v3, :cond_15

    .line 253
    .line 254
    move v3, v4

    .line 255
    goto :goto_f

    .line 256
    :cond_15
    aget v3, v12, v3

    .line 257
    .line 258
    sub-int/2addr v3, v5

    .line 259
    rem-int/lit16 v3, v3, 0x3a1

    .line 260
    .line 261
    :goto_f
    if-ne v3, v4, :cond_16

    .line 262
    .line 263
    move v0, v4

    .line 264
    :cond_16
    if-eq v0, v4, :cond_18

    .line 265
    .line 266
    :cond_17
    move/from16 p1, v1

    .line 267
    .line 268
    goto :goto_14

    .line 269
    :cond_18
    invoke-static {v8}, Ld1/d;->B([I)I

    .line 270
    .line 271
    .line 272
    move-result v0

    .line 273
    new-array v3, v6, [F

    .line 274
    .line 275
    if-le v0, v5, :cond_19

    .line 276
    .line 277
    move v13, v7

    .line 278
    :goto_10
    if-ge v13, v6, :cond_19

    .line 279
    .line 280
    aget v14, v8, v13

    .line 281
    .line 282
    int-to-float v14, v14

    .line 283
    int-to-float v15, v0

    .line 284
    div-float/2addr v14, v15

    .line 285
    aput v14, v3, v13

    .line 286
    .line 287
    add-int/lit8 v13, v13, 0x1

    .line 288
    .line 289
    goto :goto_10

    .line 290
    :cond_19
    const v0, 0x7f7fffff    # Float.MAX_VALUE

    .line 291
    .line 292
    .line 293
    move v8, v0

    .line 294
    move v0, v4

    .line 295
    move v13, v7

    .line 296
    :goto_11
    sget-object v14, LK2/f;->a:[[F

    .line 297
    .line 298
    array-length v15, v14

    .line 299
    if-ge v13, v15, :cond_17

    .line 300
    .line 301
    aget-object v14, v14, v13

    .line 302
    .line 303
    const/4 v15, 0x0

    .line 304
    move/from16 p1, v1

    .line 305
    .line 306
    move v1, v7

    .line 307
    :goto_12
    if-ge v1, v6, :cond_1b

    .line 308
    .line 309
    aget v16, v14, v1

    .line 310
    .line 311
    aget v17, v3, v1

    .line 312
    .line 313
    sub-float v16, v16, v17

    .line 314
    .line 315
    mul-float v16, v16, v16

    .line 316
    .line 317
    add-float v15, v16, v15

    .line 318
    .line 319
    cmpl-float v16, v15, v8

    .line 320
    .line 321
    if-ltz v16, :cond_1a

    .line 322
    .line 323
    goto :goto_13

    .line 324
    :cond_1a
    add-int/lit8 v1, v1, 0x1

    .line 325
    .line 326
    goto :goto_12

    .line 327
    :cond_1b
    :goto_13
    cmpg-float v1, v15, v8

    .line 328
    .line 329
    if-gez v1, :cond_1c

    .line 330
    .line 331
    aget v0, v10, v13

    .line 332
    .line 333
    move v8, v15

    .line 334
    :cond_1c
    add-int/lit8 v13, v13, 0x1

    .line 335
    .line 336
    move/from16 v1, p1

    .line 337
    .line 338
    goto :goto_11

    .line 339
    :goto_14
    and-int v1, v0, p1

    .line 340
    .line 341
    invoke-static {v10, v1}, Ljava/util/Arrays;->binarySearch([II)I

    .line 342
    .line 343
    .line 344
    move-result v1

    .line 345
    if-gez v1, :cond_1d

    .line 346
    .line 347
    move v1, v4

    .line 348
    goto :goto_15

    .line 349
    :cond_1d
    aget v1, v12, v1

    .line 350
    .line 351
    sub-int/2addr v1, v5

    .line 352
    rem-int/lit16 v1, v1, 0x3a1

    .line 353
    .line 354
    :goto_15
    if-ne v1, v4, :cond_1e

    .line 355
    .line 356
    goto :goto_17

    .line 357
    :cond_1e
    new-instance v3, LK2/a;

    .line 358
    .line 359
    new-array v4, v6, [I

    .line 360
    .line 361
    move v8, v7

    .line 362
    const/4 v6, 0x7

    .line 363
    :goto_16
    and-int/lit8 v10, v0, 0x1

    .line 364
    .line 365
    if-eq v10, v8, :cond_20

    .line 366
    .line 367
    add-int/lit8 v6, v6, -0x1

    .line 368
    .line 369
    if-gez v6, :cond_1f

    .line 370
    .line 371
    aget v0, v4, v7

    .line 372
    .line 373
    aget v5, v4, v11

    .line 374
    .line 375
    sub-int/2addr v0, v5

    .line 376
    const/4 v5, 0x4

    .line 377
    aget v5, v4, v5

    .line 378
    .line 379
    add-int/2addr v0, v5

    .line 380
    const/4 v5, 0x6

    .line 381
    aget v4, v4, v5

    .line 382
    .line 383
    sub-int/2addr v0, v4

    .line 384
    add-int/lit8 v0, v0, 0x9

    .line 385
    .line 386
    rem-int/lit8 v0, v0, 0x9

    .line 387
    .line 388
    const/4 v4, 0x1

    .line 389
    move/from16 p3, v0

    .line 390
    .line 391
    move/from16 p4, v1

    .line 392
    .line 393
    move/from16 p2, v2

    .line 394
    .line 395
    move-object/from16 p0, v3

    .line 396
    .line 397
    move/from16 p5, v4

    .line 398
    .line 399
    move/from16 p1, v9

    .line 400
    .line 401
    invoke-direct/range {p0 .. p5}, LK2/a;-><init>(IIIII)V

    .line 402
    .line 403
    .line 404
    move-object/from16 v1, p0

    .line 405
    .line 406
    return-object v1

    .line 407
    :cond_1f
    move v8, v10

    .line 408
    :cond_20
    move-object/from16 v18, v3

    .line 409
    .line 410
    move v3, v1

    .line 411
    move-object/from16 v1, v18

    .line 412
    .line 413
    aget v10, v4, v6

    .line 414
    .line 415
    add-int/2addr v10, v5

    .line 416
    aput v10, v4, v6

    .line 417
    .line 418
    shr-int/lit8 v0, v0, 0x1

    .line 419
    .line 420
    move/from16 v18, v3

    .line 421
    .line 422
    move-object v3, v1

    .line 423
    move/from16 v1, v18

    .line 424
    .line 425
    goto :goto_16

    .line 426
    :goto_17
    return-object p4
.end method

.method public static d(Lx2/b;LK2/c;Lr2/o;ZII)LK2/e;
    .locals 11

    .line 1
    move v3, p3

    .line 2
    new-instance v8, LK2/e;

    .line 3
    .line 4
    invoke-direct {v8, p1, p3}, LK2/e;-><init>(LK2/c;Z)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    move v9, v0

    .line 9
    :goto_0
    const/4 v0, 0x2

    .line 10
    if-ge v9, v0, :cond_4

    .line 11
    .line 12
    if-nez v9, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    :goto_1
    move v10, v0

    .line 16
    goto :goto_2

    .line 17
    :cond_0
    const/4 v0, -0x1

    .line 18
    goto :goto_1

    .line 19
    :goto_2
    iget v0, p2, Lr2/o;->a:F

    .line 20
    .line 21
    float-to-int v0, v0

    .line 22
    iget v1, p2, Lr2/o;->b:F

    .line 23
    .line 24
    float-to-int v1, v1

    .line 25
    move v4, v0

    .line 26
    move v5, v1

    .line 27
    :goto_3
    iget v0, p1, LK2/c;->i:I

    .line 28
    .line 29
    if-gt v5, v0, :cond_3

    .line 30
    .line 31
    iget v0, p1, LK2/c;->h:I

    .line 32
    .line 33
    if-lt v5, v0, :cond_3

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    iget v2, p0, Lx2/b;->e:I

    .line 37
    .line 38
    move-object v0, p0

    .line 39
    move v6, p4

    .line 40
    move/from16 v7, p5

    .line 41
    .line 42
    invoke-static/range {v0 .. v7}, LK2/g;->c(Lx2/b;IIZIIII)LK2/a;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    if-eqz v1, :cond_2

    .line 47
    .line 48
    iget-object v0, v8, LA/c;->g:Ljava/lang/Object;

    .line 49
    .line 50
    check-cast v0, [LK2/a;

    .line 51
    .line 52
    invoke-virtual {v8, v5}, LA/c;->C(I)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    aput-object v1, v0, v2

    .line 57
    .line 58
    if-eqz p3, :cond_1

    .line 59
    .line 60
    iget v0, v1, LK2/a;->b:I

    .line 61
    .line 62
    :goto_4
    move v4, v0

    .line 63
    goto :goto_5

    .line 64
    :cond_1
    iget v0, v1, LK2/a;->c:I

    .line 65
    .line 66
    goto :goto_4

    .line 67
    :cond_2
    :goto_5
    add-int/2addr v5, v10

    .line 68
    move v3, p3

    .line 69
    goto :goto_3

    .line 70
    :cond_3
    add-int/lit8 v9, v9, 0x1

    .line 71
    .line 72
    move v3, p3

    .line 73
    goto :goto_0

    .line 74
    :cond_4
    return-object v8
.end method
