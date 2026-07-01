.class public Lcom/google/firebase/concurrent/ExecutorsRegistrar;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/firebase/components/ComponentRegistrar;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ThreadPoolCreation"
    }
.end annotation


# static fields
.field public static final a:LD1/r;

.field public static final b:LD1/r;

.field public static final c:LD1/r;

.field public static final d:LD1/r;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, LD1/r;

    .line 2
    .line 3
    new-instance v1, LD1/g;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    invoke-direct {v1, v2}, LD1/g;-><init>(I)V

    .line 7
    .line 8
    .line 9
    invoke-direct {v0, v1}, LD1/r;-><init>(LP1/a;)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->a:LD1/r;

    .line 13
    .line 14
    new-instance v0, LD1/r;

    .line 15
    .line 16
    new-instance v1, LD1/g;

    .line 17
    .line 18
    const/4 v2, 0x3

    .line 19
    invoke-direct {v1, v2}, LD1/g;-><init>(I)V

    .line 20
    .line 21
    .line 22
    invoke-direct {v0, v1}, LD1/r;-><init>(LP1/a;)V

    .line 23
    .line 24
    .line 25
    sput-object v0, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->b:LD1/r;

    .line 26
    .line 27
    new-instance v0, LD1/r;

    .line 28
    .line 29
    new-instance v1, LD1/g;

    .line 30
    .line 31
    const/4 v2, 0x4

    .line 32
    invoke-direct {v1, v2}, LD1/g;-><init>(I)V

    .line 33
    .line 34
    .line 35
    invoke-direct {v0, v1}, LD1/r;-><init>(LP1/a;)V

    .line 36
    .line 37
    .line 38
    sput-object v0, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->c:LD1/r;

    .line 39
    .line 40
    new-instance v0, LD1/r;

    .line 41
    .line 42
    new-instance v1, LD1/g;

    .line 43
    .line 44
    const/4 v2, 0x5

    .line 45
    invoke-direct {v1, v2}, LD1/g;-><init>(I)V

    .line 46
    .line 47
    .line 48
    invoke-direct {v0, v1}, LD1/r;-><init>(LP1/a;)V

    .line 49
    .line 50
    .line 51
    sput-object v0, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->d:LD1/r;

    .line 52
    .line 53
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final getComponents()Ljava/util/List;
    .locals 24

    .line 1
    new-instance v0, LD1/v;

    .line 2
    .line 3
    const-class v1, LC1/a;

    .line 4
    .line 5
    const-class v2, Ljava/util/concurrent/ScheduledExecutorService;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, LD1/v;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 8
    .line 9
    .line 10
    new-instance v3, LD1/v;

    .line 11
    .line 12
    const-class v4, Ljava/util/concurrent/ExecutorService;

    .line 13
    .line 14
    invoke-direct {v3, v1, v4}, LD1/v;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 15
    .line 16
    .line 17
    new-instance v5, LD1/v;

    .line 18
    .line 19
    const-class v6, Ljava/util/concurrent/Executor;

    .line 20
    .line 21
    invoke-direct {v5, v1, v6}, LD1/v;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 22
    .line 23
    .line 24
    filled-new-array {v3, v5}, [LD1/v;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    new-instance v3, Ljava/util/HashSet;

    .line 29
    .line 30
    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 31
    .line 32
    .line 33
    new-instance v5, Ljava/util/HashSet;

    .line 34
    .line 35
    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 36
    .line 37
    .line 38
    new-instance v14, Ljava/util/HashSet;

    .line 39
    .line 40
    invoke-direct {v14}, Ljava/util/HashSet;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v3, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    array-length v0, v1

    .line 47
    const/4 v11, 0x0

    .line 48
    move v7, v11

    .line 49
    :goto_0
    const-string v15, "Null interface"

    .line 50
    .line 51
    if-ge v7, v0, :cond_0

    .line 52
    .line 53
    aget-object v8, v1, v7

    .line 54
    .line 55
    invoke-static {v8, v15}, LT0/a;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    add-int/lit8 v7, v7, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    invoke-static {v3, v1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    new-instance v13, LA1/h;

    .line 65
    .line 66
    const/4 v0, 0x7

    .line 67
    invoke-direct {v13, v0}, LA1/h;-><init>(I)V

    .line 68
    .line 69
    .line 70
    new-instance v7, LD1/c;

    .line 71
    .line 72
    new-instance v9, Ljava/util/HashSet;

    .line 73
    .line 74
    invoke-direct {v9, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 75
    .line 76
    .line 77
    new-instance v10, Ljava/util/HashSet;

    .line 78
    .line 79
    invoke-direct {v10, v5}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 80
    .line 81
    .line 82
    const/4 v8, 0x0

    .line 83
    move v12, v11

    .line 84
    invoke-direct/range {v7 .. v14}, LD1/c;-><init>(Ljava/lang/String;Ljava/util/Set;Ljava/util/Set;IILD1/f;Ljava/util/Set;)V

    .line 85
    .line 86
    .line 87
    new-instance v0, LD1/v;

    .line 88
    .line 89
    const-class v1, LC1/b;

    .line 90
    .line 91
    invoke-direct {v0, v1, v2}, LD1/v;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 92
    .line 93
    .line 94
    new-instance v3, LD1/v;

    .line 95
    .line 96
    invoke-direct {v3, v1, v4}, LD1/v;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 97
    .line 98
    .line 99
    new-instance v5, LD1/v;

    .line 100
    .line 101
    invoke-direct {v5, v1, v6}, LD1/v;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 102
    .line 103
    .line 104
    filled-new-array {v3, v5}, [LD1/v;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    new-instance v3, Ljava/util/HashSet;

    .line 109
    .line 110
    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 111
    .line 112
    .line 113
    new-instance v5, Ljava/util/HashSet;

    .line 114
    .line 115
    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 116
    .line 117
    .line 118
    new-instance v23, Ljava/util/HashSet;

    .line 119
    .line 120
    invoke-direct/range {v23 .. v23}, Ljava/util/HashSet;-><init>()V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v3, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    array-length v0, v1

    .line 127
    const/16 v20, 0x0

    .line 128
    .line 129
    move/from16 v8, v20

    .line 130
    .line 131
    :goto_1
    if-ge v8, v0, :cond_1

    .line 132
    .line 133
    aget-object v9, v1, v8

    .line 134
    .line 135
    invoke-static {v9, v15}, LT0/a;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    add-int/lit8 v8, v8, 0x1

    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_1
    invoke-static {v3, v1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    new-instance v0, LA1/h;

    .line 145
    .line 146
    const/16 v1, 0x8

    .line 147
    .line 148
    invoke-direct {v0, v1}, LA1/h;-><init>(I)V

    .line 149
    .line 150
    .line 151
    new-instance v16, LD1/c;

    .line 152
    .line 153
    new-instance v1, Ljava/util/HashSet;

    .line 154
    .line 155
    invoke-direct {v1, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 156
    .line 157
    .line 158
    new-instance v3, Ljava/util/HashSet;

    .line 159
    .line 160
    invoke-direct {v3, v5}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 161
    .line 162
    .line 163
    const/16 v17, 0x0

    .line 164
    .line 165
    move/from16 v21, v20

    .line 166
    .line 167
    move-object/from16 v22, v0

    .line 168
    .line 169
    move-object/from16 v18, v1

    .line 170
    .line 171
    move-object/from16 v19, v3

    .line 172
    .line 173
    invoke-direct/range {v16 .. v23}, LD1/c;-><init>(Ljava/lang/String;Ljava/util/Set;Ljava/util/Set;IILD1/f;Ljava/util/Set;)V

    .line 174
    .line 175
    .line 176
    move-object/from16 v0, v16

    .line 177
    .line 178
    new-instance v1, LD1/v;

    .line 179
    .line 180
    const-class v3, LC1/c;

    .line 181
    .line 182
    invoke-direct {v1, v3, v2}, LD1/v;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 183
    .line 184
    .line 185
    new-instance v2, LD1/v;

    .line 186
    .line 187
    invoke-direct {v2, v3, v4}, LD1/v;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 188
    .line 189
    .line 190
    new-instance v4, LD1/v;

    .line 191
    .line 192
    invoke-direct {v4, v3, v6}, LD1/v;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 193
    .line 194
    .line 195
    filled-new-array {v2, v4}, [LD1/v;

    .line 196
    .line 197
    .line 198
    move-result-object v2

    .line 199
    new-instance v3, Ljava/util/HashSet;

    .line 200
    .line 201
    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 202
    .line 203
    .line 204
    new-instance v4, Ljava/util/HashSet;

    .line 205
    .line 206
    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 207
    .line 208
    .line 209
    new-instance v23, Ljava/util/HashSet;

    .line 210
    .line 211
    invoke-direct/range {v23 .. v23}, Ljava/util/HashSet;-><init>()V

    .line 212
    .line 213
    .line 214
    invoke-virtual {v3, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 215
    .line 216
    .line 217
    array-length v1, v2

    .line 218
    const/16 v20, 0x0

    .line 219
    .line 220
    move/from16 v5, v20

    .line 221
    .line 222
    :goto_2
    if-ge v5, v1, :cond_2

    .line 223
    .line 224
    aget-object v8, v2, v5

    .line 225
    .line 226
    invoke-static {v8, v15}, LT0/a;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    add-int/lit8 v5, v5, 0x1

    .line 230
    .line 231
    goto :goto_2

    .line 232
    :cond_2
    invoke-static {v3, v2}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 233
    .line 234
    .line 235
    new-instance v1, LA1/h;

    .line 236
    .line 237
    const/16 v2, 0x9

    .line 238
    .line 239
    invoke-direct {v1, v2}, LA1/h;-><init>(I)V

    .line 240
    .line 241
    .line 242
    new-instance v16, LD1/c;

    .line 243
    .line 244
    new-instance v2, Ljava/util/HashSet;

    .line 245
    .line 246
    invoke-direct {v2, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 247
    .line 248
    .line 249
    new-instance v3, Ljava/util/HashSet;

    .line 250
    .line 251
    invoke-direct {v3, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 252
    .line 253
    .line 254
    const/16 v17, 0x0

    .line 255
    .line 256
    move/from16 v21, v20

    .line 257
    .line 258
    move-object/from16 v22, v1

    .line 259
    .line 260
    move-object/from16 v18, v2

    .line 261
    .line 262
    move-object/from16 v19, v3

    .line 263
    .line 264
    invoke-direct/range {v16 .. v23}, LD1/c;-><init>(Ljava/lang/String;Ljava/util/Set;Ljava/util/Set;IILD1/f;Ljava/util/Set;)V

    .line 265
    .line 266
    .line 267
    move-object/from16 v1, v16

    .line 268
    .line 269
    new-instance v2, LD1/v;

    .line 270
    .line 271
    const-class v3, LC1/d;

    .line 272
    .line 273
    invoke-direct {v2, v3, v6}, LD1/v;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 274
    .line 275
    .line 276
    invoke-static {v2}, LD1/c;->a(LD1/v;)LD1/b;

    .line 277
    .line 278
    .line 279
    move-result-object v2

    .line 280
    new-instance v3, LA1/h;

    .line 281
    .line 282
    const/16 v4, 0xa

    .line 283
    .line 284
    invoke-direct {v3, v4}, LA1/h;-><init>(I)V

    .line 285
    .line 286
    .line 287
    iput-object v3, v2, LD1/b;->g:Ljava/lang/Object;

    .line 288
    .line 289
    invoke-virtual {v2}, LD1/b;->e()LD1/c;

    .line 290
    .line 291
    .line 292
    move-result-object v2

    .line 293
    filled-new-array {v7, v0, v1, v2}, [LD1/c;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 298
    .line 299
    .line 300
    move-result-object v0

    .line 301
    return-object v0
.end method
