.class public final Lh0/d;
.super LI3/i;
.source "SourceFile"

# interfaces
.implements LH3/a;


# instance fields
.field public final synthetic f:I

.field public final synthetic g:Lh0/e;


# direct methods
.method public synthetic constructor <init>(Lh0/e;I)V
    .locals 0

    .line 1
    iput p2, p0, Lh0/d;->f:I

    iput-object p1, p0, Lh0/d;->g:Lh0/e;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, LI3/i;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .locals 5

    .line 1
    iget v0, p0, Lh0/d;->f:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lh0/d;->g:Lh0/e;

    .line 7
    .line 8
    iget-object v1, v0, Lh0/e;->c:Ld0/a;

    .line 9
    .line 10
    iget-object v1, v1, Ld0/a;->a:Ljava/lang/ClassLoader;

    .line 11
    .line 12
    const-string v2, "androidx.window.extensions.WindowExtensions"

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const-string v2, "loader.loadClass(WindowE\u2026.WINDOW_EXTENSIONS_CLASS)"

    .line 19
    .line 20
    invoke-static {v1, v2}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const-string v2, "getWindowLayoutComponent"

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object v0, v0, Lh0/e;->a:Ljava/lang/ClassLoader;

    .line 31
    .line 32
    const-string v2, "androidx.window.extensions.layout.WindowLayoutComponent"

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v2, "loader.loadClass(WINDOW_LAYOUT_COMPONENT_CLASS)"

    .line 39
    .line 40
    invoke-static {v0, v2}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    const-string v2, "getWindowLayoutComponentMethod"

    .line 44
    .line 45
    invoke-static {v1, v2}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getModifiers()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    invoke-static {v2}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-eqz v2, :cond_0

    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_0

    .line 67
    .line 68
    const/4 v0, 0x1

    .line 69
    goto :goto_0

    .line 70
    :cond_0
    const/4 v0, 0x0

    .line 71
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    return-object v0

    .line 76
    :pswitch_0
    iget-object v0, p0, Lh0/d;->g:Lh0/e;

    .line 77
    .line 78
    iget-object v0, v0, Lh0/e;->a:Ljava/lang/ClassLoader;

    .line 79
    .line 80
    const-string v1, "androidx.window.extensions.layout.WindowLayoutComponent"

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    const-string v1, "loader.loadClass(WINDOW_LAYOUT_COMPONENT_CLASS)"

    .line 87
    .line 88
    invoke-static {v0, v1}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    const-class v1, Landroid/content/Context;

    .line 92
    .line 93
    const-class v2, Landroidx/window/extensions/core/util/function/Consumer;

    .line 94
    .line 95
    filled-new-array {v1, v2}, [Ljava/lang/Class;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    const-string v3, "addWindowLayoutInfoListener"

    .line 100
    .line 101
    invoke-virtual {v0, v3, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    const-string v3, "removeWindowLayoutInfoListener"

    .line 106
    .line 107
    filled-new-array {v2}, [Ljava/lang/Class;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    const-string v2, "addListenerMethod"

    .line 116
    .line 117
    invoke-static {v1, v2}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getModifiers()I

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    invoke-static {v1}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    if-eqz v1, :cond_1

    .line 129
    .line 130
    const-string v1, "removeListenerMethod"

    .line 131
    .line 132
    invoke-static {v0, v1}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getModifiers()I

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_1

    .line 144
    .line 145
    const/4 v0, 0x1

    .line 146
    goto :goto_1

    .line 147
    :cond_1
    const/4 v0, 0x0

    .line 148
    :goto_1
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    return-object v0

    .line 153
    :pswitch_1
    iget-object v0, p0, Lh0/d;->g:Lh0/e;

    .line 154
    .line 155
    iget-object v1, v0, Lh0/e;->b:Ld0/a;

    .line 156
    .line 157
    :try_start_0
    invoke-virtual {v1}, Ld0/a;->b()Ljava/lang/Class;

    .line 158
    .line 159
    .line 160
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    goto :goto_2

    .line 162
    :catch_0
    const/4 v1, 0x0

    .line 163
    :goto_2
    if-nez v1, :cond_2

    .line 164
    .line 165
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 166
    .line 167
    goto :goto_4

    .line 168
    :cond_2
    iget-object v0, v0, Lh0/e;->a:Ljava/lang/ClassLoader;

    .line 169
    .line 170
    const-string v2, "androidx.window.extensions.layout.WindowLayoutComponent"

    .line 171
    .line 172
    invoke-virtual {v0, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    const-string v2, "loader.loadClass(WINDOW_LAYOUT_COMPONENT_CLASS)"

    .line 177
    .line 178
    invoke-static {v0, v2}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    const-class v2, Landroid/app/Activity;

    .line 182
    .line 183
    filled-new-array {v2, v1}, [Ljava/lang/Class;

    .line 184
    .line 185
    .line 186
    move-result-object v2

    .line 187
    const-string v3, "addWindowLayoutInfoListener"

    .line 188
    .line 189
    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 190
    .line 191
    .line 192
    move-result-object v2

    .line 193
    const-string v3, "removeWindowLayoutInfoListener"

    .line 194
    .line 195
    filled-new-array {v1}, [Ljava/lang/Class;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    invoke-virtual {v0, v3, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    const-string v1, "addListenerMethod"

    .line 204
    .line 205
    invoke-static {v2, v1}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getModifiers()I

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    invoke-static {v1}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    if-eqz v1, :cond_3

    .line 217
    .line 218
    const-string v1, "removeListenerMethod"

    .line 219
    .line 220
    invoke-static {v0, v1}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getModifiers()I

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    if-eqz v0, :cond_3

    .line 232
    .line 233
    const/4 v0, 0x1

    .line 234
    goto :goto_3

    .line 235
    :cond_3
    const/4 v0, 0x0

    .line 236
    :goto_3
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    :goto_4
    return-object v0

    .line 241
    :pswitch_2
    iget-object v0, p0, Lh0/d;->g:Lh0/e;

    .line 242
    .line 243
    iget-object v0, v0, Lh0/e;->a:Ljava/lang/ClassLoader;

    .line 244
    .line 245
    const-string v1, "androidx.window.extensions.layout.FoldingFeature"

    .line 246
    .line 247
    invoke-virtual {v0, v1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    const-string v1, "loader.loadClass(FOLDING_FEATURE_CLASS)"

    .line 252
    .line 253
    invoke-static {v0, v1}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    const-string v1, "getBounds"

    .line 257
    .line 258
    const/4 v2, 0x0

    .line 259
    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 260
    .line 261
    .line 262
    move-result-object v1

    .line 263
    const-string v3, "getType"

    .line 264
    .line 265
    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 266
    .line 267
    .line 268
    move-result-object v3

    .line 269
    const-string v4, "getState"

    .line 270
    .line 271
    invoke-virtual {v0, v4, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    const-string v2, "getBoundsMethod"

    .line 276
    .line 277
    invoke-static {v1, v2}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 278
    .line 279
    .line 280
    const-class v2, Landroid/graphics/Rect;

    .line 281
    .line 282
    invoke-static {v2}, LI3/q;->a(Ljava/lang/Class;)LI3/e;

    .line 283
    .line 284
    .line 285
    move-result-object v2

    .line 286
    invoke-static {v1, v2}, Lc1/g;->s(Ljava/lang/reflect/Method;LI3/e;)Z

    .line 287
    .line 288
    .line 289
    move-result v2

    .line 290
    if-eqz v2, :cond_4

    .line 291
    .line 292
    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getModifiers()I

    .line 293
    .line 294
    .line 295
    move-result v1

    .line 296
    invoke-static {v1}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    .line 297
    .line 298
    .line 299
    move-result v1

    .line 300
    if-eqz v1, :cond_4

    .line 301
    .line 302
    const-string v1, "getTypeMethod"

    .line 303
    .line 304
    invoke-static {v3, v1}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 305
    .line 306
    .line 307
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 308
    .line 309
    invoke-static {v1}, LI3/q;->a(Ljava/lang/Class;)LI3/e;

    .line 310
    .line 311
    .line 312
    move-result-object v2

    .line 313
    invoke-static {v3, v2}, Lc1/g;->s(Ljava/lang/reflect/Method;LI3/e;)Z

    .line 314
    .line 315
    .line 316
    move-result v2

    .line 317
    if-eqz v2, :cond_4

    .line 318
    .line 319
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getModifiers()I

    .line 320
    .line 321
    .line 322
    move-result v2

    .line 323
    invoke-static {v2}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    .line 324
    .line 325
    .line 326
    move-result v2

    .line 327
    if-eqz v2, :cond_4

    .line 328
    .line 329
    const-string v2, "getStateMethod"

    .line 330
    .line 331
    invoke-static {v0, v2}, LI3/h;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 332
    .line 333
    .line 334
    invoke-static {v1}, LI3/q;->a(Ljava/lang/Class;)LI3/e;

    .line 335
    .line 336
    .line 337
    move-result-object v1

    .line 338
    invoke-static {v0, v1}, Lc1/g;->s(Ljava/lang/reflect/Method;LI3/e;)Z

    .line 339
    .line 340
    .line 341
    move-result v1

    .line 342
    if-eqz v1, :cond_4

    .line 343
    .line 344
    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getModifiers()I

    .line 345
    .line 346
    .line 347
    move-result v0

    .line 348
    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    .line 349
    .line 350
    .line 351
    move-result v0

    .line 352
    if-eqz v0, :cond_4

    .line 353
    .line 354
    const/4 v0, 0x1

    .line 355
    goto :goto_5

    .line 356
    :cond_4
    const/4 v0, 0x0

    .line 357
    :goto_5
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 358
    .line 359
    .line 360
    move-result-object v0

    .line 361
    return-object v0

    .line 362
    nop

    .line 363
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
