.class public Lcom/google/firebase/FirebaseCommonRegistrar;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/firebase/components/ComponentRegistrar;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    const/16 v0, 0x20

    .line 2
    .line 3
    const/16 v1, 0x5f

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/16 v0, 0x2f

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method


# virtual methods
.method public final getComponents()Ljava/util/List;
    .locals 15

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    new-array v2, v1, [Ljava/lang/Class;

    .line 8
    .line 9
    new-instance v3, Ljava/util/HashSet;

    .line 10
    .line 11
    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance v4, Ljava/util/HashSet;

    .line 15
    .line 16
    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 17
    .line 18
    .line 19
    new-instance v12, Ljava/util/HashSet;

    .line 20
    .line 21
    invoke-direct {v12}, Ljava/util/HashSet;-><init>()V

    .line 22
    .line 23
    .line 24
    const-class v13, LX1/b;

    .line 25
    .line 26
    invoke-static {v13}, LD1/v;->a(Ljava/lang/Class;)LD1/v;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    invoke-virtual {v3, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    array-length v5, v2

    .line 34
    const/4 v9, 0x0

    .line 35
    move v6, v9

    .line 36
    :goto_0
    if-ge v6, v5, :cond_0

    .line 37
    .line 38
    aget-object v7, v2, v6

    .line 39
    .line 40
    const-string v8, "Null interface"

    .line 41
    .line 42
    invoke-static {v7, v8}, LT0/a;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v7}, LD1/v;->a(Ljava/lang/Class;)LD1/v;

    .line 46
    .line 47
    .line 48
    move-result-object v7

    .line 49
    invoke-virtual {v3, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    add-int/lit8 v6, v6, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    new-instance v2, LD1/l;

    .line 56
    .line 57
    const/4 v14, 0x2

    .line 58
    const-class v5, LX1/a;

    .line 59
    .line 60
    invoke-direct {v2, v14, v1, v5}, LD1/l;-><init>(IILjava/lang/Class;)V

    .line 61
    .line 62
    .line 63
    iget-object v5, v2, LD1/l;->a:LD1/v;

    .line 64
    .line 65
    invoke-virtual {v3, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v5

    .line 69
    if-nez v5, :cond_2

    .line 70
    .line 71
    invoke-virtual {v4, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    new-instance v11, LA1/h;

    .line 75
    .line 76
    const/16 v2, 0x18

    .line 77
    .line 78
    invoke-direct {v11, v2}, LA1/h;-><init>(I)V

    .line 79
    .line 80
    .line 81
    new-instance v5, LD1/c;

    .line 82
    .line 83
    new-instance v7, Ljava/util/HashSet;

    .line 84
    .line 85
    invoke-direct {v7, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 86
    .line 87
    .line 88
    new-instance v8, Ljava/util/HashSet;

    .line 89
    .line 90
    invoke-direct {v8, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 91
    .line 92
    .line 93
    const/4 v6, 0x0

    .line 94
    move v10, v9

    .line 95
    invoke-direct/range {v5 .. v12}, LD1/c;-><init>(Ljava/lang/String;Ljava/util/Set;Ljava/util/Set;IILD1/f;Ljava/util/Set;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    new-instance v2, LD1/v;

    .line 102
    .line 103
    const-class v3, LC1/a;

    .line 104
    .line 105
    const-class v4, Ljava/util/concurrent/Executor;

    .line 106
    .line 107
    invoke-direct {v2, v3, v4}, LD1/v;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 108
    .line 109
    .line 110
    const-class v3, LN1/f;

    .line 111
    .line 112
    const-class v4, LN1/g;

    .line 113
    .line 114
    filled-new-array {v3, v4}, [Ljava/lang/Class;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    new-instance v4, LD1/b;

    .line 119
    .line 120
    const-class v5, LN1/d;

    .line 121
    .line 122
    invoke-direct {v4, v5, v3}, LD1/b;-><init>(Ljava/lang/Class;[Ljava/lang/Class;)V

    .line 123
    .line 124
    .line 125
    const-class v3, Landroid/content/Context;

    .line 126
    .line 127
    invoke-static {v3}, LD1/l;->a(Ljava/lang/Class;)LD1/l;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    invoke-virtual {v4, v3}, LD1/b;->d(LD1/l;)V

    .line 132
    .line 133
    .line 134
    const-class v3, LA1/g;

    .line 135
    .line 136
    invoke-static {v3}, LD1/l;->a(Ljava/lang/Class;)LD1/l;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    invoke-virtual {v4, v3}, LD1/b;->d(LD1/l;)V

    .line 141
    .line 142
    .line 143
    new-instance v3, LD1/l;

    .line 144
    .line 145
    const-class v5, LN1/e;

    .line 146
    .line 147
    invoke-direct {v3, v14, v1, v5}, LD1/l;-><init>(IILjava/lang/Class;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v4, v3}, LD1/b;->d(LD1/l;)V

    .line 151
    .line 152
    .line 153
    new-instance v3, LD1/l;

    .line 154
    .line 155
    const/4 v5, 0x1

    .line 156
    invoke-direct {v3, v5, v5, v13}, LD1/l;-><init>(IILjava/lang/Class;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v4, v3}, LD1/b;->d(LD1/l;)V

    .line 160
    .line 161
    .line 162
    new-instance v3, LD1/l;

    .line 163
    .line 164
    invoke-direct {v3, v2, v5, v1}, LD1/l;-><init>(LD1/v;II)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v4, v3}, LD1/b;->d(LD1/l;)V

    .line 168
    .line 169
    .line 170
    new-instance v1, LN1/b;

    .line 171
    .line 172
    const/4 v3, 0x0

    .line 173
    invoke-direct {v1, v2, v3}, LN1/b;-><init>(LD1/v;I)V

    .line 174
    .line 175
    .line 176
    iput-object v1, v4, LD1/b;->g:Ljava/lang/Object;

    .line 177
    .line 178
    invoke-virtual {v4}, LD1/b;->e()LD1/c;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 186
    .line 187
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    const-string v2, "fire-android"

    .line 192
    .line 193
    invoke-static {v2, v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->f(Ljava/lang/String;Ljava/lang/String;)LD1/c;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    const-string v1, "fire-core"

    .line 201
    .line 202
    const-string v2, "22.0.1"

    .line 203
    .line 204
    invoke-static {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/i0;->f(Ljava/lang/String;Ljava/lang/String;)LD1/c;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    sget-object v1, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    .line 212
    .line 213
    invoke-static {v1}, Lcom/google/firebase/FirebaseCommonRegistrar;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    const-string v2, "device-name"

    .line 218
    .line 219
    invoke-static {v2, v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->f(Ljava/lang/String;Ljava/lang/String;)LD1/c;

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    sget-object v1, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    .line 227
    .line 228
    invoke-static {v1}, Lcom/google/firebase/FirebaseCommonRegistrar;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v1

    .line 232
    const-string v2, "device-model"

    .line 233
    .line 234
    invoke-static {v2, v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->f(Ljava/lang/String;Ljava/lang/String;)LD1/c;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 242
    .line 243
    invoke-static {v1}, Lcom/google/firebase/FirebaseCommonRegistrar;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    const-string v2, "device-brand"

    .line 248
    .line 249
    invoke-static {v2, v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->f(Ljava/lang/String;Ljava/lang/String;)LD1/c;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 254
    .line 255
    .line 256
    new-instance v1, LA1/h;

    .line 257
    .line 258
    const/4 v2, 0x0

    .line 259
    invoke-direct {v1, v2}, LA1/h;-><init>(I)V

    .line 260
    .line 261
    .line 262
    const-string v2, "android-target-sdk"

    .line 263
    .line 264
    invoke-static {v2, v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->s(Ljava/lang/String;LA1/h;)LD1/c;

    .line 265
    .line 266
    .line 267
    move-result-object v1

    .line 268
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 269
    .line 270
    .line 271
    new-instance v1, LA1/h;

    .line 272
    .line 273
    const/4 v2, 0x1

    .line 274
    invoke-direct {v1, v2}, LA1/h;-><init>(I)V

    .line 275
    .line 276
    .line 277
    const-string v2, "android-min-sdk"

    .line 278
    .line 279
    invoke-static {v2, v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->s(Ljava/lang/String;LA1/h;)LD1/c;

    .line 280
    .line 281
    .line 282
    move-result-object v1

    .line 283
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    new-instance v1, LA1/h;

    .line 287
    .line 288
    const/4 v2, 0x2

    .line 289
    invoke-direct {v1, v2}, LA1/h;-><init>(I)V

    .line 290
    .line 291
    .line 292
    const-string v2, "android-platform"

    .line 293
    .line 294
    invoke-static {v2, v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->s(Ljava/lang/String;LA1/h;)LD1/c;

    .line 295
    .line 296
    .line 297
    move-result-object v1

    .line 298
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 299
    .line 300
    .line 301
    new-instance v1, LA1/h;

    .line 302
    .line 303
    const/4 v2, 0x3

    .line 304
    invoke-direct {v1, v2}, LA1/h;-><init>(I)V

    .line 305
    .line 306
    .line 307
    const-string v2, "android-installer"

    .line 308
    .line 309
    invoke-static {v2, v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->s(Ljava/lang/String;LA1/h;)LD1/c;

    .line 310
    .line 311
    .line 312
    move-result-object v1

    .line 313
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 314
    .line 315
    .line 316
    :try_start_0
    sget-object v1, Ly3/b;->f:Ly3/b;

    .line 317
    .line 318
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 319
    .line 320
    .line 321
    const-string v1, "2.3.10"
    :try_end_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_0

    .line 322
    .line 323
    goto :goto_1

    .line 324
    :catch_0
    const/4 v1, 0x0

    .line 325
    :goto_1
    if-eqz v1, :cond_1

    .line 326
    .line 327
    const-string v2, "kotlin"

    .line 328
    .line 329
    invoke-static {v2, v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->f(Ljava/lang/String;Ljava/lang/String;)LD1/c;

    .line 330
    .line 331
    .line 332
    move-result-object v1

    .line 333
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 334
    .line 335
    .line 336
    :cond_1
    return-object v0

    .line 337
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 338
    .line 339
    const-string v1, "Components are not allowed to depend on interfaces they themselves provide."

    .line 340
    .line 341
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 342
    .line 343
    .line 344
    throw v0
.end method
