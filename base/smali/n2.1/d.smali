.class public final Ln2/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Le1/E;


# static fields
.field public static final o:LM2/b;


# instance fields
.field public e:Ljava/util/Collection;

.field public f:I

.field public g:LM2/b;

.field public h:D

.field public i:D

.field public j:Lp2/b;

.field public k:Lm2/a;

.field public l:[I

.field public m:[D

.field public n:[D


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const/16 v0, 0x66

    .line 2
    .line 3
    const/16 v1, 0xe1

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/16 v1, 0xff

    .line 11
    .line 12
    invoke-static {v1, v2, v2}, Landroid/graphics/Color;->rgb(III)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    filled-new-array {v0, v1}, [I

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v1, 0x2

    .line 21
    new-array v1, v1, [F

    .line 22
    .line 23
    fill-array-data v1, :array_0

    .line 24
    .line 25
    .line 26
    new-instance v2, LM2/b;

    .line 27
    .line 28
    const/16 v3, 0x3e8

    .line 29
    .line 30
    invoke-direct {v2, v0, v1, v3}, LM2/b;-><init>([I[FI)V

    .line 31
    .line 32
    .line 33
    sput-object v2, Ln2/d;->o:LM2/b;

    .line 34
    .line 35
    return-void

    .line 36
    nop

    .line 37
    :array_0
    .array-data 4
        0x3e4ccccd    # 0.2f
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public final a(I)[D
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/16 v1, 0x16

    .line 4
    .line 5
    new-array v2, v1, [D

    .line 6
    .line 7
    iget-wide v3, v0, Ln2/d;->i:D

    .line 8
    .line 9
    const-wide/16 v5, 0x0

    .line 10
    .line 11
    cmpg-double v3, v3, v5

    .line 12
    .line 13
    if-nez v3, :cond_9

    .line 14
    .line 15
    const/4 v3, 0x5

    .line 16
    move v7, v3

    .line 17
    :goto_0
    const/16 v8, 0xb

    .line 18
    .line 19
    if-ge v7, v8, :cond_8

    .line 20
    .line 21
    iget-object v8, v0, Ln2/d;->e:Ljava/util/Collection;

    .line 22
    .line 23
    iget-object v9, v0, Ln2/d;->k:Lm2/a;

    .line 24
    .line 25
    if-eqz v9, :cond_7

    .line 26
    .line 27
    const/16 v11, 0x500

    .line 28
    .line 29
    int-to-double v11, v11

    .line 30
    add-int/lit8 v13, v7, -0x3

    .line 31
    .line 32
    int-to-double v13, v13

    .line 33
    move-wide v15, v5

    .line 34
    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    .line 35
    .line 36
    invoke-static {v4, v5, v13, v14}, Ljava/lang/Math;->pow(DD)D

    .line 37
    .line 38
    .line 39
    move-result-wide v4

    .line 40
    mul-double/2addr v4, v11

    .line 41
    double-to-int v4, v4

    .line 42
    const-string v5, "points"

    .line 43
    .line 44
    invoke-static {v8, v5}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-wide v11, v9, Lm2/a;->a:D

    .line 48
    .line 49
    iget-wide v13, v9, Lm2/a;->b:D

    .line 50
    .line 51
    move-wide/from16 v17, v11

    .line 52
    .line 53
    const/4 v5, 0x0

    .line 54
    iget-wide v10, v9, Lm2/a;->c:D

    .line 55
    .line 56
    move-object/from16 v19, v5

    .line 57
    .line 58
    iget-wide v5, v9, Lm2/a;->d:D

    .line 59
    .line 60
    sub-double v13, v13, v17

    .line 61
    .line 62
    sub-double/2addr v5, v10

    .line 63
    cmpg-double v9, v13, v5

    .line 64
    .line 65
    if-gez v9, :cond_0

    .line 66
    .line 67
    move-wide v13, v5

    .line 68
    :cond_0
    mul-int/lit8 v5, p1, 0x2

    .line 69
    .line 70
    div-int/2addr v4, v5

    .line 71
    int-to-double v4, v4

    .line 72
    const-wide/high16 v20, 0x3fe0000000000000L    # 0.5

    .line 73
    .line 74
    add-double v4, v4, v20

    .line 75
    .line 76
    double-to-int v4, v4

    .line 77
    int-to-double v4, v4

    .line 78
    div-double/2addr v4, v13

    .line 79
    new-instance v6, Ljava/util/LinkedHashMap;

    .line 80
    .line 81
    invoke-direct {v6}, Ljava/util/LinkedHashMap;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 85
    .line 86
    .line 87
    move-result-object v8

    .line 88
    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 89
    .line 90
    .line 91
    move-result v9

    .line 92
    if-eqz v9, :cond_2

    .line 93
    .line 94
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v9

    .line 98
    check-cast v9, Ln2/e;

    .line 99
    .line 100
    iget-object v13, v9, Ln2/e;->b:Lo2/a;

    .line 101
    .line 102
    move-object/from16 v20, v2

    .line 103
    .line 104
    iget-wide v1, v13, Lo2/a;->a:D

    .line 105
    .line 106
    iget-wide v12, v13, Lo2/a;->b:D

    .line 107
    .line 108
    sub-double v1, v1, v17

    .line 109
    .line 110
    mul-double/2addr v1, v4

    .line 111
    double-to-int v1, v1

    .line 112
    sub-double/2addr v12, v10

    .line 113
    mul-double/2addr v12, v4

    .line 114
    double-to-int v2, v12

    .line 115
    new-instance v12, Ln2/c;

    .line 116
    .line 117
    invoke-direct {v12, v1, v2}, Ln2/c;-><init>(II)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v6, v12}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    if-nez v1, :cond_1

    .line 125
    .line 126
    invoke-static/range {v15 .. v16}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-interface {v6, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    :cond_1
    check-cast v1, Ljava/lang/Number;

    .line 134
    .line 135
    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    .line 136
    .line 137
    .line 138
    move-result-wide v1

    .line 139
    iget-wide v14, v9, Ln2/e;->c:D

    .line 140
    .line 141
    add-double/2addr v1, v14

    .line 142
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-interface {v6, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-object/from16 v2, v20

    .line 150
    .line 151
    const/16 v1, 0x16

    .line 152
    .line 153
    const-wide/16 v15, 0x0

    .line 154
    .line 155
    goto :goto_1

    .line 156
    :cond_2
    move-object/from16 v20, v2

    .line 157
    .line 158
    invoke-virtual {v6}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    const-string v2, "<this>"

    .line 163
    .line 164
    invoke-static {v1, v2}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 172
    .line 173
    .line 174
    move-result v2

    .line 175
    if-nez v2, :cond_3

    .line 176
    .line 177
    move-object/from16 v10, v19

    .line 178
    .line 179
    goto :goto_3

    .line 180
    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    check-cast v2, Ljava/lang/Number;

    .line 185
    .line 186
    invoke-virtual {v2}, Ljava/lang/Number;->doubleValue()D

    .line 187
    .line 188
    .line 189
    move-result-wide v4

    .line 190
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 191
    .line 192
    .line 193
    move-result v2

    .line 194
    if-eqz v2, :cond_4

    .line 195
    .line 196
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    check-cast v2, Ljava/lang/Number;

    .line 201
    .line 202
    invoke-virtual {v2}, Ljava/lang/Number;->doubleValue()D

    .line 203
    .line 204
    .line 205
    move-result-wide v8

    .line 206
    invoke-static {v4, v5, v8, v9}, Ljava/lang/Math;->max(DD)D

    .line 207
    .line 208
    .line 209
    move-result-wide v4

    .line 210
    goto :goto_2

    .line 211
    :cond_4
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 212
    .line 213
    .line 214
    move-result-object v10

    .line 215
    :goto_3
    if-eqz v10, :cond_5

    .line 216
    .line 217
    invoke-virtual {v10}, Ljava/lang/Double;->doubleValue()D

    .line 218
    .line 219
    .line 220
    move-result-wide v1

    .line 221
    goto :goto_4

    .line 222
    :cond_5
    const-wide/16 v1, 0x0

    .line 223
    .line 224
    :goto_4
    aput-wide v1, v20, v7

    .line 225
    .line 226
    if-ne v7, v3, :cond_6

    .line 227
    .line 228
    const/4 v1, 0x0

    .line 229
    :goto_5
    if-ge v1, v7, :cond_6

    .line 230
    .line 231
    aget-wide v4, v20, v7

    .line 232
    .line 233
    aput-wide v4, v20, v1

    .line 234
    .line 235
    add-int/lit8 v1, v1, 0x1

    .line 236
    .line 237
    goto :goto_5

    .line 238
    :cond_6
    add-int/lit8 v7, v7, 0x1

    .line 239
    .line 240
    move-object/from16 v2, v20

    .line 241
    .line 242
    const/16 v1, 0x16

    .line 243
    .line 244
    const-wide/16 v5, 0x0

    .line 245
    .line 246
    goto/16 :goto_0

    .line 247
    .line 248
    :cond_7
    const/16 v19, 0x0

    .line 249
    .line 250
    const-string v1, "bounds"

    .line 251
    .line 252
    invoke-static {v1}, LI3/h;->g(Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    throw v19

    .line 256
    :cond_8
    move-object/from16 v20, v2

    .line 257
    .line 258
    move v14, v1

    .line 259
    :goto_6
    if-ge v8, v14, :cond_a

    .line 260
    .line 261
    const/16 v1, 0xa

    .line 262
    .line 263
    aget-wide v1, v20, v1

    .line 264
    .line 265
    aput-wide v1, v20, v8

    .line 266
    .line 267
    add-int/lit8 v8, v8, 0x1

    .line 268
    .line 269
    goto :goto_6

    .line 270
    :cond_9
    move v14, v1

    .line 271
    move-object/from16 v20, v2

    .line 272
    .line 273
    const/4 v4, 0x0

    .line 274
    :goto_7
    if-ge v4, v14, :cond_a

    .line 275
    .line 276
    iget-wide v1, v0, Ln2/d;->i:D

    .line 277
    .line 278
    aput-wide v1, v20, v4

    .line 279
    .line 280
    add-int/lit8 v4, v4, 0x1

    .line 281
    .line 282
    goto :goto_7

    .line 283
    :cond_a
    return-object v20
.end method

.method public final b(LM2/b;)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const-string v2, "gradient"

    .line 6
    .line 7
    invoke-static {v1, v2}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iput-object v1, v0, Ln2/d;->g:LM2/b;

    .line 11
    .line 12
    iget-wide v2, v0, Ln2/d;->h:D

    .line 13
    .line 14
    iget v4, v1, LM2/b;->a:I

    .line 15
    .line 16
    iget-object v5, v1, LM2/b;->b:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v5, [I

    .line 19
    .line 20
    new-instance v6, Ljava/util/HashMap;

    .line 21
    .line 22
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 23
    .line 24
    .line 25
    iget-object v1, v1, LM2/b;->c:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v1, [F

    .line 28
    .line 29
    const/4 v7, 0x0

    .line 30
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v8

    .line 34
    aget v9, v1, v7

    .line 35
    .line 36
    const/4 v10, 0x0

    .line 37
    cmpg-float v9, v9, v10

    .line 38
    .line 39
    if-nez v9, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    aget v9, v5, v7

    .line 43
    .line 44
    invoke-static {v9}, Landroid/graphics/Color;->red(I)I

    .line 45
    .line 46
    .line 47
    move-result v9

    .line 48
    aget v10, v5, v7

    .line 49
    .line 50
    invoke-static {v10}, Landroid/graphics/Color;->green(I)I

    .line 51
    .line 52
    .line 53
    move-result v10

    .line 54
    aget v11, v5, v7

    .line 55
    .line 56
    invoke-static {v11}, Landroid/graphics/Color;->blue(I)I

    .line 57
    .line 58
    .line 59
    move-result v11

    .line 60
    invoke-static {v7, v9, v10, v11}, Landroid/graphics/Color;->argb(IIII)I

    .line 61
    .line 62
    .line 63
    move-result v9

    .line 64
    new-instance v10, Ln2/a;

    .line 65
    .line 66
    aget v11, v5, v7

    .line 67
    .line 68
    int-to-float v12, v4

    .line 69
    aget v13, v1, v7

    .line 70
    .line 71
    mul-float/2addr v12, v13

    .line 72
    invoke-direct {v10, v9, v11, v12}, Ln2/a;-><init>(IIF)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v6, v8, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    :goto_0
    array-length v9, v5

    .line 79
    const/4 v10, 0x1

    .line 80
    move v11, v10

    .line 81
    :goto_1
    if-ge v11, v9, :cond_1

    .line 82
    .line 83
    int-to-float v12, v4

    .line 84
    add-int/lit8 v13, v11, -0x1

    .line 85
    .line 86
    aget v14, v1, v13

    .line 87
    .line 88
    mul-float v15, v12, v14

    .line 89
    .line 90
    float-to-int v15, v15

    .line 91
    aget v16, v1, v11

    .line 92
    .line 93
    sub-float v16, v16, v14

    .line 94
    .line 95
    mul-float v12, v12, v16

    .line 96
    .line 97
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 98
    .line 99
    .line 100
    move-result-object v14

    .line 101
    new-instance v15, Ln2/a;

    .line 102
    .line 103
    aget v13, v5, v13

    .line 104
    .line 105
    move/from16 p1, v7

    .line 106
    .line 107
    aget v7, v5, v11

    .line 108
    .line 109
    invoke-direct {v15, v13, v7, v12}, Ln2/a;-><init>(IIF)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v6, v14, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    add-int/lit8 v11, v11, 0x1

    .line 116
    .line 117
    move/from16 v7, p1

    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_1
    move/from16 p1, v7

    .line 121
    .line 122
    array-length v7, v1

    .line 123
    if-eqz v7, :cond_a

    .line 124
    .line 125
    array-length v7, v1

    .line 126
    sub-int/2addr v7, v10

    .line 127
    aget v7, v1, v7

    .line 128
    .line 129
    const/high16 v9, 0x3f800000    # 1.0f

    .line 130
    .line 131
    cmpg-float v7, v7, v9

    .line 132
    .line 133
    if-nez v7, :cond_2

    .line 134
    .line 135
    goto :goto_2

    .line 136
    :cond_2
    array-length v7, v1

    .line 137
    sub-int/2addr v7, v10

    .line 138
    int-to-float v9, v4

    .line 139
    aget v11, v1, v7

    .line 140
    .line 141
    mul-float/2addr v11, v9

    .line 142
    float-to-int v11, v11

    .line 143
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 144
    .line 145
    .line 146
    move-result-object v11

    .line 147
    new-instance v12, Ln2/a;

    .line 148
    .line 149
    aget v5, v5, v7

    .line 150
    .line 151
    int-to-float v10, v10

    .line 152
    aget v1, v1, v7

    .line 153
    .line 154
    sub-float/2addr v10, v1

    .line 155
    mul-float/2addr v10, v9

    .line 156
    invoke-direct {v12, v5, v5, v10}, Ln2/a;-><init>(IIF)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v6, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    :goto_2
    new-array v1, v4, [I

    .line 163
    .line 164
    invoke-virtual {v6, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v5

    .line 168
    check-cast v5, Ln2/a;

    .line 169
    .line 170
    move/from16 v7, p1

    .line 171
    .line 172
    move v8, v7

    .line 173
    :goto_3
    if-ge v7, v4, :cond_7

    .line 174
    .line 175
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 176
    .line 177
    .line 178
    move-result-object v9

    .line 179
    invoke-virtual {v6, v9}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v9

    .line 183
    if-eqz v9, :cond_3

    .line 184
    .line 185
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 186
    .line 187
    .line 188
    move-result-object v5

    .line 189
    invoke-virtual {v6, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v5

    .line 193
    check-cast v5, Ln2/a;

    .line 194
    .line 195
    move v8, v7

    .line 196
    :cond_3
    sub-int v9, v7, v8

    .line 197
    .line 198
    int-to-float v9, v9

    .line 199
    invoke-static {v5}, LI3/h;->b(Ljava/lang/Object;)V

    .line 200
    .line 201
    .line 202
    iget v10, v5, Ln2/a;->c:F

    .line 203
    .line 204
    div-float/2addr v9, v10

    .line 205
    iget v10, v5, Ln2/a;->a:I

    .line 206
    .line 207
    iget v11, v5, Ln2/a;->b:I

    .line 208
    .line 209
    invoke-static {v11}, Landroid/graphics/Color;->alpha(I)I

    .line 210
    .line 211
    .line 212
    move-result v12

    .line 213
    invoke-static {v10}, Landroid/graphics/Color;->alpha(I)I

    .line 214
    .line 215
    .line 216
    move-result v13

    .line 217
    sub-int/2addr v12, v13

    .line 218
    int-to-float v12, v12

    .line 219
    mul-float/2addr v12, v9

    .line 220
    invoke-static {v10}, Landroid/graphics/Color;->alpha(I)I

    .line 221
    .line 222
    .line 223
    move-result v13

    .line 224
    int-to-float v13, v13

    .line 225
    add-float/2addr v12, v13

    .line 226
    float-to-int v12, v12

    .line 227
    const/4 v13, 0x3

    .line 228
    new-array v14, v13, [F

    .line 229
    .line 230
    invoke-static {v10}, Landroid/graphics/Color;->red(I)I

    .line 231
    .line 232
    .line 233
    move-result v15

    .line 234
    invoke-static {v10}, Landroid/graphics/Color;->green(I)I

    .line 235
    .line 236
    .line 237
    move-result v13

    .line 238
    invoke-static {v10}, Landroid/graphics/Color;->blue(I)I

    .line 239
    .line 240
    .line 241
    move-result v10

    .line 242
    invoke-static {v15, v13, v10, v14}, Landroid/graphics/Color;->RGBToHSV(III[F)V

    .line 243
    .line 244
    .line 245
    const/4 v10, 0x3

    .line 246
    new-array v13, v10, [F

    .line 247
    .line 248
    invoke-static {v11}, Landroid/graphics/Color;->red(I)I

    .line 249
    .line 250
    .line 251
    move-result v10

    .line 252
    invoke-static {v11}, Landroid/graphics/Color;->green(I)I

    .line 253
    .line 254
    .line 255
    move-result v15

    .line 256
    invoke-static {v11}, Landroid/graphics/Color;->blue(I)I

    .line 257
    .line 258
    .line 259
    move-result v11

    .line 260
    invoke-static {v10, v15, v11, v13}, Landroid/graphics/Color;->RGBToHSV(III[F)V

    .line 261
    .line 262
    .line 263
    aget v10, v14, p1

    .line 264
    .line 265
    aget v11, v13, p1

    .line 266
    .line 267
    sub-float v15, v10, v11

    .line 268
    .line 269
    const/high16 v17, 0x43340000    # 180.0f

    .line 270
    .line 271
    cmpl-float v15, v15, v17

    .line 272
    .line 273
    const/high16 v18, 0x43b40000    # 360.0f

    .line 274
    .line 275
    if-lez v15, :cond_5

    .line 276
    .line 277
    add-float v11, v11, v18

    .line 278
    .line 279
    aput v11, v13, p1

    .line 280
    .line 281
    :cond_4
    :goto_4
    const/4 v10, 0x3

    .line 282
    goto :goto_5

    .line 283
    :cond_5
    sub-float/2addr v11, v10

    .line 284
    cmpl-float v11, v11, v17

    .line 285
    .line 286
    if-lez v11, :cond_4

    .line 287
    .line 288
    add-float v10, v10, v18

    .line 289
    .line 290
    aput v10, v14, p1

    .line 291
    .line 292
    goto :goto_4

    .line 293
    :goto_5
    new-array v11, v10, [F

    .line 294
    .line 295
    move/from16 v15, p1

    .line 296
    .line 297
    :goto_6
    if-ge v15, v10, :cond_6

    .line 298
    .line 299
    aget v16, v13, v15

    .line 300
    .line 301
    aget v17, v14, v15

    .line 302
    .line 303
    sub-float v16, v16, v17

    .line 304
    .line 305
    mul-float v16, v16, v9

    .line 306
    .line 307
    add-float v16, v16, v17

    .line 308
    .line 309
    aput v16, v11, v15

    .line 310
    .line 311
    add-int/lit8 v15, v15, 0x1

    .line 312
    .line 313
    goto :goto_6

    .line 314
    :cond_6
    invoke-static {v12, v11}, Landroid/graphics/Color;->HSVToColor(I[F)I

    .line 315
    .line 316
    .line 317
    move-result v9

    .line 318
    aput v9, v1, v7

    .line 319
    .line 320
    add-int/lit8 v7, v7, 0x1

    .line 321
    .line 322
    goto/16 :goto_3

    .line 323
    .line 324
    :cond_7
    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    .line 325
    .line 326
    cmpg-double v5, v2, v5

    .line 327
    .line 328
    if-nez v5, :cond_8

    .line 329
    .line 330
    goto :goto_8

    .line 331
    :cond_8
    move/from16 v7, p1

    .line 332
    .line 333
    :goto_7
    if-ge v7, v4, :cond_9

    .line 334
    .line 335
    aget v5, v1, v7

    .line 336
    .line 337
    invoke-static {v5}, Landroid/graphics/Color;->alpha(I)I

    .line 338
    .line 339
    .line 340
    move-result v6

    .line 341
    int-to-double v8, v6

    .line 342
    mul-double/2addr v8, v2

    .line 343
    double-to-int v6, v8

    .line 344
    invoke-static {v5}, Landroid/graphics/Color;->red(I)I

    .line 345
    .line 346
    .line 347
    move-result v8

    .line 348
    invoke-static {v5}, Landroid/graphics/Color;->green(I)I

    .line 349
    .line 350
    .line 351
    move-result v9

    .line 352
    invoke-static {v5}, Landroid/graphics/Color;->blue(I)I

    .line 353
    .line 354
    .line 355
    move-result v5

    .line 356
    invoke-static {v6, v8, v9, v5}, Landroid/graphics/Color;->argb(IIII)I

    .line 357
    .line 358
    .line 359
    move-result v5

    .line 360
    aput v5, v1, v7

    .line 361
    .line 362
    add-int/lit8 v7, v7, 0x1

    .line 363
    .line 364
    goto :goto_7

    .line 365
    :cond_9
    :goto_8
    iput-object v1, v0, Ln2/d;->l:[I

    .line 366
    .line 367
    return-void

    .line 368
    :cond_a
    new-instance v1, Ljava/util/NoSuchElementException;

    .line 369
    .line 370
    const-string v2, "Array is empty."

    .line 371
    .line 372
    invoke-direct {v1, v2}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 373
    .line 374
    .line 375
    throw v1
.end method

.method public final c(Ljava/util/Collection;)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const-string v2, "data"

    .line 6
    .line 7
    invoke-static {v1, v2}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iput-object v1, v0, Ln2/d;->e:Ljava/util/Collection;

    .line 11
    .line 12
    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_18

    .line 17
    .line 18
    iget-object v1, v0, Ln2/d;->e:Ljava/util/Collection;

    .line 19
    .line 20
    const-string v2, "points"

    .line 21
    .line 22
    invoke-static {v1, v2}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    instance-of v2, v1, Ljava/util/List;

    .line 26
    .line 27
    const-string v3, "List is empty."

    .line 28
    .line 29
    const/4 v4, 0x0

    .line 30
    const-string v5, "Collection is empty."

    .line 31
    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    move-object v6, v1

    .line 35
    check-cast v6, Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    .line 38
    .line 39
    .line 40
    move-result v7

    .line 41
    if-nez v7, :cond_0

    .line 42
    .line 43
    invoke-interface {v6, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v6

    .line 47
    goto :goto_0

    .line 48
    :cond_0
    new-instance v1, Ljava/util/NoSuchElementException;

    .line 49
    .line 50
    invoke-direct {v1, v3}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    throw v1

    .line 54
    :cond_1
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 55
    .line 56
    .line 57
    move-result-object v6

    .line 58
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 59
    .line 60
    .line 61
    move-result v7

    .line 62
    if-eqz v7, :cond_17

    .line 63
    .line 64
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v6

    .line 68
    :goto_0
    check-cast v6, Ln2/e;

    .line 69
    .line 70
    iget-object v6, v6, Ln2/e;->b:Lo2/a;

    .line 71
    .line 72
    iget-wide v7, v6, Lo2/a;->a:D

    .line 73
    .line 74
    iget-wide v9, v6, Lo2/a;->b:D

    .line 75
    .line 76
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    .line 77
    .line 78
    .line 79
    move-result v6

    .line 80
    const/4 v11, 0x1

    .line 81
    sub-int/2addr v6, v11

    .line 82
    sget-object v12, Lz3/l;->e:Lz3/l;

    .line 83
    .line 84
    if-gtz v6, :cond_2

    .line 85
    .line 86
    goto/16 :goto_7

    .line 87
    .line 88
    :cond_2
    if-ne v6, v11, :cond_7

    .line 89
    .line 90
    if-eqz v2, :cond_4

    .line 91
    .line 92
    check-cast v1, Ljava/util/List;

    .line 93
    .line 94
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-nez v2, :cond_3

    .line 99
    .line 100
    invoke-static {v1}, Lz3/e;->R(Ljava/util/List;)I

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    goto :goto_2

    .line 109
    :cond_3
    new-instance v1, Ljava/util/NoSuchElementException;

    .line 110
    .line 111
    invoke-direct {v1, v3}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    throw v1

    .line 115
    :cond_4
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    if-eqz v2, :cond_6

    .line 124
    .line 125
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 130
    .line 131
    .line 132
    move-result v3

    .line 133
    if-eqz v3, :cond_5

    .line 134
    .line 135
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    goto :goto_1

    .line 140
    :cond_5
    move-object v1, v2

    .line 141
    :goto_2
    invoke-static {v1}, LT0/a;->C(Ljava/lang/Object;)Ljava/util/List;

    .line 142
    .line 143
    .line 144
    move-result-object v12

    .line 145
    goto :goto_7

    .line 146
    :cond_6
    new-instance v1, Ljava/util/NoSuchElementException;

    .line 147
    .line 148
    invoke-direct {v1, v5}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    throw v1

    .line 152
    :cond_7
    new-instance v3, Ljava/util/ArrayList;

    .line 153
    .line 154
    invoke-direct {v3, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 155
    .line 156
    .line 157
    if-eqz v2, :cond_a

    .line 158
    .line 159
    instance-of v2, v1, Ljava/util/RandomAccess;

    .line 160
    .line 161
    if-eqz v2, :cond_8

    .line 162
    .line 163
    check-cast v1, Ljava/util/List;

    .line 164
    .line 165
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 166
    .line 167
    .line 168
    move-result v2

    .line 169
    :goto_3
    if-ge v11, v2, :cond_9

    .line 170
    .line 171
    invoke-interface {v1, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object v4

    .line 175
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    add-int/lit8 v11, v11, 0x1

    .line 179
    .line 180
    goto :goto_3

    .line 181
    :cond_8
    check-cast v1, Ljava/util/List;

    .line 182
    .line 183
    invoke-interface {v1, v11}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 188
    .line 189
    .line 190
    move-result v2

    .line 191
    if-eqz v2, :cond_9

    .line 192
    .line 193
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    goto :goto_4

    .line 201
    :cond_9
    :goto_5
    move-object v12, v3

    .line 202
    goto :goto_7

    .line 203
    :cond_a
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 204
    .line 205
    .line 206
    move-result-object v1

    .line 207
    move v2, v4

    .line 208
    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 209
    .line 210
    .line 211
    move-result v5

    .line 212
    if-eqz v5, :cond_c

    .line 213
    .line 214
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object v5

    .line 218
    if-lt v2, v11, :cond_b

    .line 219
    .line 220
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 221
    .line 222
    .line 223
    goto :goto_6

    .line 224
    :cond_b
    add-int/lit8 v2, v2, 0x1

    .line 225
    .line 226
    goto :goto_6

    .line 227
    :cond_c
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 228
    .line 229
    .line 230
    move-result v1

    .line 231
    if-eqz v1, :cond_e

    .line 232
    .line 233
    if-eq v1, v11, :cond_d

    .line 234
    .line 235
    goto :goto_5

    .line 236
    :cond_d
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    invoke-static {v1}, LT0/a;->C(Ljava/lang/Object;)Ljava/util/List;

    .line 241
    .line 242
    .line 243
    move-result-object v12

    .line 244
    :cond_e
    :goto_7
    invoke-interface {v12}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    move-wide v12, v7

    .line 249
    move-wide v14, v12

    .line 250
    move-wide/from16 v16, v9

    .line 251
    .line 252
    move-wide/from16 v18, v16

    .line 253
    .line 254
    :cond_f
    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 255
    .line 256
    .line 257
    move-result v2

    .line 258
    if-eqz v2, :cond_13

    .line 259
    .line 260
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    move-result-object v2

    .line 264
    check-cast v2, Ln2/e;

    .line 265
    .line 266
    iget-object v2, v2, Ln2/e;->b:Lo2/a;

    .line 267
    .line 268
    iget-wide v3, v2, Lo2/a;->a:D

    .line 269
    .line 270
    iget-wide v5, v2, Lo2/a;->b:D

    .line 271
    .line 272
    cmpg-double v2, v3, v12

    .line 273
    .line 274
    if-gez v2, :cond_10

    .line 275
    .line 276
    move-wide v12, v3

    .line 277
    :cond_10
    cmpl-double v2, v3, v14

    .line 278
    .line 279
    if-lez v2, :cond_11

    .line 280
    .line 281
    move-wide v14, v3

    .line 282
    :cond_11
    cmpg-double v2, v5, v16

    .line 283
    .line 284
    if-gez v2, :cond_12

    .line 285
    .line 286
    move-wide/from16 v16, v5

    .line 287
    .line 288
    :cond_12
    cmpl-double v2, v5, v18

    .line 289
    .line 290
    if-lez v2, :cond_f

    .line 291
    .line 292
    move-wide/from16 v18, v5

    .line 293
    .line 294
    goto :goto_8

    .line 295
    :cond_13
    new-instance v11, Lm2/a;

    .line 296
    .line 297
    invoke-direct/range {v11 .. v19}, Lm2/a;-><init>(DDDD)V

    .line 298
    .line 299
    .line 300
    iput-object v11, v0, Ln2/d;->k:Lm2/a;

    .line 301
    .line 302
    new-instance v1, Lp2/b;

    .line 303
    .line 304
    invoke-direct {v1, v11}, Lp2/b;-><init>(Lm2/a;)V

    .line 305
    .line 306
    .line 307
    iput-object v1, v0, Ln2/d;->j:Lp2/b;

    .line 308
    .line 309
    iget-object v1, v0, Ln2/d;->e:Ljava/util/Collection;

    .line 310
    .line 311
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 312
    .line 313
    .line 314
    move-result-object v1

    .line 315
    :cond_14
    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 316
    .line 317
    .line 318
    move-result v2

    .line 319
    if-eqz v2, :cond_16

    .line 320
    .line 321
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 322
    .line 323
    .line 324
    move-result-object v2

    .line 325
    move-object v8, v2

    .line 326
    check-cast v8, Ln2/e;

    .line 327
    .line 328
    iget-object v3, v0, Ln2/d;->j:Lp2/b;

    .line 329
    .line 330
    if-eqz v3, :cond_15

    .line 331
    .line 332
    const-string v2, "item"

    .line 333
    .line 334
    invoke-static {v8, v2}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 335
    .line 336
    .line 337
    invoke-virtual {v8}, Ln2/e;->a()Lo2/a;

    .line 338
    .line 339
    .line 340
    move-result-object v2

    .line 341
    iget-object v4, v3, Lp2/b;->a:Lm2/a;

    .line 342
    .line 343
    iget-wide v5, v2, Lo2/a;->a:D

    .line 344
    .line 345
    iget-wide v9, v2, Lo2/a;->b:D

    .line 346
    .line 347
    invoke-virtual {v4, v5, v6, v9, v10}, Lm2/a;->a(DD)Z

    .line 348
    .line 349
    .line 350
    move-result v4

    .line 351
    if-eqz v4, :cond_14

    .line 352
    .line 353
    iget-wide v4, v2, Lo2/a;->a:D

    .line 354
    .line 355
    iget-wide v6, v2, Lo2/a;->b:D

    .line 356
    .line 357
    invoke-virtual/range {v3 .. v8}, Lp2/b;->a(DDLp2/a;)V

    .line 358
    .line 359
    .line 360
    goto :goto_9

    .line 361
    :cond_15
    const-string v1, "tree"

    .line 362
    .line 363
    invoke-static {v1}, LI3/h;->g(Ljava/lang/String;)V

    .line 364
    .line 365
    .line 366
    const/4 v1, 0x0

    .line 367
    throw v1

    .line 368
    :cond_16
    iget v1, v0, Ln2/d;->f:I

    .line 369
    .line 370
    invoke-virtual {v0, v1}, Ln2/d;->a(I)[D

    .line 371
    .line 372
    .line 373
    move-result-object v1

    .line 374
    iput-object v1, v0, Ln2/d;->n:[D

    .line 375
    .line 376
    return-void

    .line 377
    :cond_17
    new-instance v1, Ljava/util/NoSuchElementException;

    .line 378
    .line 379
    invoke-direct {v1, v5}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 380
    .line 381
    .line 382
    throw v1

    .line 383
    :cond_18
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 384
    .line 385
    const-string v2, "No input points."

    .line 386
    .line 387
    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 388
    .line 389
    .line 390
    throw v1
.end method

.method public final j(III)Le1/B;
    .locals 40

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
    move/from16 v3, p3

    .line 8
    .line 9
    int-to-double v4, v3

    .line 10
    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    .line 11
    .line 12
    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->pow(DD)D

    .line 13
    .line 14
    .line 15
    move-result-wide v4

    .line 16
    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    .line 17
    .line 18
    div-double v4, v8, v4

    .line 19
    .line 20
    iget v10, v0, Ln2/d;->f:I

    .line 21
    .line 22
    int-to-double v11, v10

    .line 23
    mul-double/2addr v11, v4

    .line 24
    const/16 v13, 0x200

    .line 25
    .line 26
    int-to-double v14, v13

    .line 27
    div-double/2addr v11, v14

    .line 28
    const/4 v14, 0x2

    .line 29
    move-wide v15, v6

    .line 30
    int-to-double v6, v14

    .line 31
    mul-double/2addr v6, v11

    .line 32
    add-double/2addr v6, v4

    .line 33
    mul-int/2addr v10, v14

    .line 34
    add-int/2addr v10, v13

    .line 35
    move-wide/from16 v17, v8

    .line 36
    .line 37
    int-to-double v8, v10

    .line 38
    div-double/2addr v6, v8

    .line 39
    int-to-double v8, v1

    .line 40
    mul-double/2addr v8, v4

    .line 41
    sub-double v20, v8, v11

    .line 42
    .line 43
    add-int/lit8 v1, v1, 0x1

    .line 44
    .line 45
    int-to-double v8, v1

    .line 46
    mul-double/2addr v8, v4

    .line 47
    add-double v22, v8, v11

    .line 48
    .line 49
    int-to-double v8, v2

    .line 50
    mul-double/2addr v8, v4

    .line 51
    sub-double v29, v8, v11

    .line 52
    .line 53
    add-int/lit8 v1, v2, 0x1

    .line 54
    .line 55
    int-to-double v1, v1

    .line 56
    mul-double/2addr v1, v4

    .line 57
    add-double v31, v1, v11

    .line 58
    .line 59
    const-wide/16 v1, 0x0

    .line 60
    .line 61
    cmpg-double v4, v20, v1

    .line 62
    .line 63
    const/4 v5, 0x0

    .line 64
    const-string v8, "tree"

    .line 65
    .line 66
    if-gez v4, :cond_1

    .line 67
    .line 68
    new-instance v24, Lm2/a;

    .line 69
    .line 70
    add-double v25, v20, v17

    .line 71
    .line 72
    const-wide/high16 v27, 0x3ff0000000000000L    # 1.0

    .line 73
    .line 74
    invoke-direct/range {v24 .. v32}, Lm2/a;-><init>(DDDD)V

    .line 75
    .line 76
    .line 77
    move-object/from16 v4, v24

    .line 78
    .line 79
    iget-object v9, v0, Ln2/d;->j:Lp2/b;

    .line 80
    .line 81
    if-eqz v9, :cond_0

    .line 82
    .line 83
    new-instance v10, Ljava/util/ArrayList;

    .line 84
    .line 85
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v9, v4, v10}, Lp2/b;->c(Lm2/a;Ljava/util/ArrayList;)V

    .line 89
    .line 90
    .line 91
    const-wide/high16 v17, -0x4010000000000000L    # -1.0

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_0
    invoke-static {v8}, LI3/h;->g(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    throw v5

    .line 98
    :cond_1
    cmpl-double v4, v22, v17

    .line 99
    .line 100
    if-lez v4, :cond_3

    .line 101
    .line 102
    new-instance v24, Lm2/a;

    .line 103
    .line 104
    const-wide/16 v25, 0x0

    .line 105
    .line 106
    sub-double v27, v22, v17

    .line 107
    .line 108
    invoke-direct/range {v24 .. v32}, Lm2/a;-><init>(DDDD)V

    .line 109
    .line 110
    .line 111
    move-object/from16 v4, v24

    .line 112
    .line 113
    iget-object v9, v0, Ln2/d;->j:Lp2/b;

    .line 114
    .line 115
    if-eqz v9, :cond_2

    .line 116
    .line 117
    new-instance v10, Ljava/util/ArrayList;

    .line 118
    .line 119
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v9, v4, v10}, Lp2/b;->c(Lm2/a;Ljava/util/ArrayList;)V

    .line 123
    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_2
    invoke-static {v8}, LI3/h;->g(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    throw v5

    .line 130
    :cond_3
    sget-object v10, Lz3/l;->e:Lz3/l;

    .line 131
    .line 132
    move-wide/from16 v17, v1

    .line 133
    .line 134
    :goto_0
    new-instance v19, Lm2/a;

    .line 135
    .line 136
    move-wide/from16 v24, v29

    .line 137
    .line 138
    move-wide/from16 v26, v31

    .line 139
    .line 140
    invoke-direct/range {v19 .. v27}, Lm2/a;-><init>(DDDD)V

    .line 141
    .line 142
    .line 143
    move-object/from16 v4, v19

    .line 144
    .line 145
    new-instance v31, Lm2/a;

    .line 146
    .line 147
    iget-object v9, v0, Ln2/d;->k:Lm2/a;

    .line 148
    .line 149
    if-eqz v9, :cond_1f

    .line 150
    .line 151
    move-wide/from16 p1, v1

    .line 152
    .line 153
    iget-wide v1, v9, Lm2/a;->a:D

    .line 154
    .line 155
    sub-double v32, v1, v11

    .line 156
    .line 157
    iget-wide v1, v9, Lm2/a;->b:D

    .line 158
    .line 159
    add-double v34, v1, v11

    .line 160
    .line 161
    iget-wide v1, v9, Lm2/a;->c:D

    .line 162
    .line 163
    sub-double v36, v1, v11

    .line 164
    .line 165
    iget-wide v1, v9, Lm2/a;->d:D

    .line 166
    .line 167
    add-double v38, v1, v11

    .line 168
    .line 169
    invoke-direct/range {v31 .. v39}, Lm2/a;-><init>(DDDD)V

    .line 170
    .line 171
    .line 172
    move-object/from16 v1, v31

    .line 173
    .line 174
    invoke-virtual {v4, v1}, Lm2/a;->b(Lm2/a;)Z

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    if-nez v1, :cond_4

    .line 179
    .line 180
    goto :goto_1

    .line 181
    :cond_4
    iget-object v1, v0, Ln2/d;->j:Lp2/b;

    .line 182
    .line 183
    if-eqz v1, :cond_1e

    .line 184
    .line 185
    new-instance v2, Ljava/util/ArrayList;

    .line 186
    .line 187
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v1, v4, v2}, Lp2/b;->c(Lm2/a;Ljava/util/ArrayList;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    if-eqz v1, :cond_5

    .line 198
    .line 199
    :goto_1
    sget-object v1, Le1/E;->b:Le1/B;

    .line 200
    .line 201
    return-object v1

    .line 202
    :cond_5
    iget v1, v0, Ln2/d;->f:I

    .line 203
    .line 204
    mul-int/2addr v1, v14

    .line 205
    add-int/2addr v1, v13

    .line 206
    new-array v4, v1, [[D

    .line 207
    .line 208
    const/4 v9, 0x0

    .line 209
    :goto_2
    if-ge v9, v1, :cond_6

    .line 210
    .line 211
    iget v11, v0, Ln2/d;->f:I

    .line 212
    .line 213
    mul-int/2addr v11, v14

    .line 214
    add-int/2addr v11, v13

    .line 215
    new-array v11, v11, [D

    .line 216
    .line 217
    aput-object v11, v4, v9

    .line 218
    .line 219
    add-int/lit8 v9, v9, 0x1

    .line 220
    .line 221
    goto :goto_2

    .line 222
    :cond_6
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 223
    .line 224
    .line 225
    move-result v9

    .line 226
    const/4 v11, 0x0

    .line 227
    :goto_3
    if-ge v11, v9, :cond_7

    .line 228
    .line 229
    invoke-virtual {v2, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object v12

    .line 233
    add-int/lit8 v11, v11, 0x1

    .line 234
    .line 235
    check-cast v12, Ln2/e;

    .line 236
    .line 237
    iget-object v14, v12, Ln2/e;->b:Lo2/a;

    .line 238
    .line 239
    move-wide/from16 v22, v6

    .line 240
    .line 241
    move-object v7, v5

    .line 242
    iget-wide v5, v14, Lo2/a;->a:D

    .line 243
    .line 244
    sub-double v5, v5, v20

    .line 245
    .line 246
    div-double v5, v5, v22

    .line 247
    .line 248
    double-to-int v5, v5

    .line 249
    move-object/from16 v19, v7

    .line 250
    .line 251
    iget-wide v7, v14, Lo2/a;->b:D

    .line 252
    .line 253
    sub-double v7, v7, v29

    .line 254
    .line 255
    div-double v7, v7, v22

    .line 256
    .line 257
    double-to-int v7, v7

    .line 258
    aget-object v5, v4, v5

    .line 259
    .line 260
    aget-wide v24, v5, v7

    .line 261
    .line 262
    move v14, v7

    .line 263
    iget-wide v6, v12, Ln2/e;->c:D

    .line 264
    .line 265
    add-double v24, v24, v6

    .line 266
    .line 267
    aput-wide v24, v5, v14

    .line 268
    .line 269
    move-object/from16 v5, v19

    .line 270
    .line 271
    move-wide/from16 v6, v22

    .line 272
    .line 273
    goto :goto_3

    .line 274
    :cond_7
    move-object/from16 v19, v5

    .line 275
    .line 276
    move-wide/from16 v22, v6

    .line 277
    .line 278
    invoke-interface {v10}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 279
    .line 280
    .line 281
    move-result-object v2

    .line 282
    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 283
    .line 284
    .line 285
    move-result v5

    .line 286
    if-eqz v5, :cond_8

    .line 287
    .line 288
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 289
    .line 290
    .line 291
    move-result-object v5

    .line 292
    check-cast v5, Ln2/e;

    .line 293
    .line 294
    iget-object v6, v5, Ln2/e;->b:Lo2/a;

    .line 295
    .line 296
    iget-wide v9, v6, Lo2/a;->a:D

    .line 297
    .line 298
    add-double v9, v9, v17

    .line 299
    .line 300
    sub-double v9, v9, v20

    .line 301
    .line 302
    div-double v9, v9, v22

    .line 303
    .line 304
    double-to-int v7, v9

    .line 305
    iget-wide v9, v6, Lo2/a;->b:D

    .line 306
    .line 307
    sub-double v9, v9, v29

    .line 308
    .line 309
    div-double v9, v9, v22

    .line 310
    .line 311
    double-to-int v6, v9

    .line 312
    aget-object v7, v4, v7

    .line 313
    .line 314
    aget-wide v9, v7, v6

    .line 315
    .line 316
    iget-wide v11, v5, Ln2/e;->c:D

    .line 317
    .line 318
    add-double/2addr v9, v11

    .line 319
    aput-wide v9, v7, v6

    .line 320
    .line 321
    goto :goto_4

    .line 322
    :cond_8
    iget-object v2, v0, Ln2/d;->m:[D

    .line 323
    .line 324
    const-string v5, "kernel"

    .line 325
    .line 326
    invoke-static {v2, v5}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    array-length v5, v2

    .line 330
    int-to-double v5, v5

    .line 331
    div-double/2addr v5, v15

    .line 332
    invoke-static {v5, v6}, Ljava/lang/Math;->floor(D)D

    .line 333
    .line 334
    .line 335
    move-result-wide v5

    .line 336
    double-to-int v5, v5

    .line 337
    mul-int/lit8 v6, v5, 0x2

    .line 338
    .line 339
    sub-int v6, v1, v6

    .line 340
    .line 341
    add-int v7, v5, v6

    .line 342
    .line 343
    add-int/lit8 v7, v7, -0x1

    .line 344
    .line 345
    new-array v9, v1, [[D

    .line 346
    .line 347
    const/4 v10, 0x0

    .line 348
    :goto_5
    if-ge v10, v1, :cond_9

    .line 349
    .line 350
    new-array v11, v1, [D

    .line 351
    .line 352
    aput-object v11, v9, v10

    .line 353
    .line 354
    add-int/lit8 v10, v10, 0x1

    .line 355
    .line 356
    goto :goto_5

    .line 357
    :cond_9
    const/4 v10, 0x0

    .line 358
    :goto_6
    if-ge v10, v1, :cond_f

    .line 359
    .line 360
    const/4 v11, 0x0

    .line 361
    :goto_7
    if-ge v11, v1, :cond_e

    .line 362
    .line 363
    aget-object v12, v4, v10

    .line 364
    .line 365
    aget-wide v14, v12, v11

    .line 366
    .line 367
    cmpg-double v12, v14, p1

    .line 368
    .line 369
    if-nez v12, :cond_a

    .line 370
    .line 371
    goto :goto_a

    .line 372
    :cond_a
    add-int v12, v10, v5

    .line 373
    .line 374
    if-le v12, v7, :cond_b

    .line 375
    .line 376
    move v12, v7

    .line 377
    :cond_b
    sub-int v8, v10, v5

    .line 378
    .line 379
    if-ge v8, v5, :cond_c

    .line 380
    .line 381
    move v13, v5

    .line 382
    goto :goto_8

    .line 383
    :cond_c
    move v13, v8

    .line 384
    :goto_8
    if-gt v13, v12, :cond_d

    .line 385
    .line 386
    :goto_9
    aget-object v18, v9, v13

    .line 387
    .line 388
    aget-wide v20, v18, v11

    .line 389
    .line 390
    sub-int v22, v13, v8

    .line 391
    .line 392
    aget-wide v22, v2, v22

    .line 393
    .line 394
    mul-double v22, v22, v14

    .line 395
    .line 396
    add-double v22, v22, v20

    .line 397
    .line 398
    aput-wide v22, v18, v11

    .line 399
    .line 400
    if-eq v13, v12, :cond_d

    .line 401
    .line 402
    add-int/lit8 v13, v13, 0x1

    .line 403
    .line 404
    goto :goto_9

    .line 405
    :cond_d
    :goto_a
    add-int/lit8 v11, v11, 0x1

    .line 406
    .line 407
    const/16 v13, 0x200

    .line 408
    .line 409
    goto :goto_7

    .line 410
    :cond_e
    add-int/lit8 v10, v10, 0x1

    .line 411
    .line 412
    const/16 v13, 0x200

    .line 413
    .line 414
    goto :goto_6

    .line 415
    :cond_f
    new-array v4, v6, [[D

    .line 416
    .line 417
    const/4 v8, 0x0

    .line 418
    :goto_b
    if-ge v8, v6, :cond_10

    .line 419
    .line 420
    new-array v10, v6, [D

    .line 421
    .line 422
    aput-object v10, v4, v8

    .line 423
    .line 424
    add-int/lit8 v8, v8, 0x1

    .line 425
    .line 426
    goto :goto_b

    .line 427
    :cond_10
    if-gt v5, v7, :cond_16

    .line 428
    .line 429
    move v8, v5

    .line 430
    :goto_c
    const/4 v10, 0x0

    .line 431
    :goto_d
    if-ge v10, v1, :cond_15

    .line 432
    .line 433
    aget-object v11, v9, v8

    .line 434
    .line 435
    aget-wide v12, v11, v10

    .line 436
    .line 437
    cmpg-double v11, v12, p1

    .line 438
    .line 439
    if-nez v11, :cond_11

    .line 440
    .line 441
    goto :goto_10

    .line 442
    :cond_11
    add-int v11, v10, v5

    .line 443
    .line 444
    if-le v11, v7, :cond_12

    .line 445
    .line 446
    move v11, v7

    .line 447
    :cond_12
    sub-int v14, v10, v5

    .line 448
    .line 449
    if-ge v14, v5, :cond_13

    .line 450
    .line 451
    move v15, v5

    .line 452
    goto :goto_e

    .line 453
    :cond_13
    move v15, v14

    .line 454
    :goto_e
    if-gt v15, v11, :cond_14

    .line 455
    .line 456
    :goto_f
    sub-int v18, v8, v5

    .line 457
    .line 458
    aget-object v18, v4, v18

    .line 459
    .line 460
    sub-int v20, v15, v5

    .line 461
    .line 462
    aget-wide v21, v18, v20

    .line 463
    .line 464
    sub-int v23, v15, v14

    .line 465
    .line 466
    aget-wide v23, v2, v23

    .line 467
    .line 468
    mul-double v23, v23, v12

    .line 469
    .line 470
    add-double v23, v23, v21

    .line 471
    .line 472
    aput-wide v23, v18, v20

    .line 473
    .line 474
    if-eq v15, v11, :cond_14

    .line 475
    .line 476
    add-int/lit8 v15, v15, 0x1

    .line 477
    .line 478
    goto :goto_f

    .line 479
    :cond_14
    :goto_10
    add-int/lit8 v10, v10, 0x1

    .line 480
    .line 481
    goto :goto_d

    .line 482
    :cond_15
    if-eq v8, v7, :cond_16

    .line 483
    .line 484
    add-int/lit8 v8, v8, 0x1

    .line 485
    .line 486
    goto :goto_c

    .line 487
    :cond_16
    iget-object v1, v0, Ln2/d;->l:[I

    .line 488
    .line 489
    if-eqz v1, :cond_1d

    .line 490
    .line 491
    iget-object v2, v0, Ln2/d;->n:[D

    .line 492
    .line 493
    if-eqz v2, :cond_1c

    .line 494
    .line 495
    aget-wide v7, v2, v3

    .line 496
    .line 497
    array-length v2, v1

    .line 498
    if-eqz v2, :cond_1b

    .line 499
    .line 500
    array-length v2, v1

    .line 501
    add-int/lit8 v2, v2, -0x1

    .line 502
    .line 503
    aget v2, v1, v2

    .line 504
    .line 505
    array-length v3, v1

    .line 506
    add-int/lit8 v3, v3, -0x1

    .line 507
    .line 508
    int-to-double v9, v3

    .line 509
    div-double/2addr v9, v7

    .line 510
    mul-int v3, v6, v6

    .line 511
    .line 512
    new-array v3, v3, [I

    .line 513
    .line 514
    const/4 v5, 0x0

    .line 515
    :goto_11
    if-ge v5, v6, :cond_1a

    .line 516
    .line 517
    const/4 v7, 0x0

    .line 518
    :goto_12
    if-ge v7, v6, :cond_19

    .line 519
    .line 520
    aget-object v8, v4, v7

    .line 521
    .line 522
    aget-wide v11, v8, v5

    .line 523
    .line 524
    mul-int v8, v5, v6

    .line 525
    .line 526
    add-int/2addr v8, v7

    .line 527
    mul-double v13, v11, v9

    .line 528
    .line 529
    double-to-int v13, v13

    .line 530
    cmpg-double v11, v11, p1

    .line 531
    .line 532
    if-nez v11, :cond_17

    .line 533
    .line 534
    const/4 v11, 0x0

    .line 535
    goto :goto_13

    .line 536
    :cond_17
    array-length v11, v1

    .line 537
    if-ge v13, v11, :cond_18

    .line 538
    .line 539
    aget v11, v1, v13

    .line 540
    .line 541
    goto :goto_13

    .line 542
    :cond_18
    move v11, v2

    .line 543
    :goto_13
    aput v11, v3, v8

    .line 544
    .line 545
    add-int/lit8 v7, v7, 0x1

    .line 546
    .line 547
    goto :goto_12

    .line 548
    :cond_19
    add-int/lit8 v5, v5, 0x1

    .line 549
    .line 550
    goto :goto_11

    .line 551
    :cond_1a
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 552
    .line 553
    invoke-static {v6, v6, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 554
    .line 555
    .line 556
    move-result-object v20

    .line 557
    const/16 v24, 0x0

    .line 558
    .line 559
    const/16 v25, 0x0

    .line 560
    .line 561
    const/16 v22, 0x0

    .line 562
    .line 563
    move/from16 v26, v6

    .line 564
    .line 565
    move/from16 v27, v6

    .line 566
    .line 567
    move-object/from16 v21, v3

    .line 568
    .line 569
    move/from16 v23, v6

    .line 570
    .line 571
    invoke-virtual/range {v20 .. v27}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    .line 572
    .line 573
    .line 574
    move-object/from16 v1, v20

    .line 575
    .line 576
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    .line 577
    .line 578
    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 579
    .line 580
    .line 581
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    .line 582
    .line 583
    const/16 v4, 0x64

    .line 584
    .line 585
    invoke-virtual {v1, v3, v4, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 586
    .line 587
    .line 588
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 589
    .line 590
    .line 591
    move-result-object v1

    .line 592
    new-instance v2, Le1/B;

    .line 593
    .line 594
    const/16 v3, 0x200

    .line 595
    .line 596
    invoke-direct {v2, v1, v3, v3}, Le1/B;-><init>([BII)V

    .line 597
    .line 598
    .line 599
    return-object v2

    .line 600
    :cond_1b
    new-instance v1, Ljava/util/NoSuchElementException;

    .line 601
    .line 602
    const-string v2, "Array is empty."

    .line 603
    .line 604
    invoke-direct {v1, v2}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 605
    .line 606
    .line 607
    throw v1

    .line 608
    :cond_1c
    const-string v1, "maxIntensity"

    .line 609
    .line 610
    invoke-static {v1}, LI3/h;->g(Ljava/lang/String;)V

    .line 611
    .line 612
    .line 613
    throw v19

    .line 614
    :cond_1d
    const-string v1, "colorMap"

    .line 615
    .line 616
    invoke-static {v1}, LI3/h;->g(Ljava/lang/String;)V

    .line 617
    .line 618
    .line 619
    throw v19

    .line 620
    :cond_1e
    move-object/from16 v19, v5

    .line 621
    .line 622
    invoke-static {v8}, LI3/h;->g(Ljava/lang/String;)V

    .line 623
    .line 624
    .line 625
    throw v19

    .line 626
    :cond_1f
    move-object/from16 v19, v5

    .line 627
    .line 628
    const-string v1, "bounds"

    .line 629
    .line 630
    invoke-static {v1}, LI3/h;->g(Ljava/lang/String;)V

    .line 631
    .line 632
    .line 633
    throw v19
.end method
