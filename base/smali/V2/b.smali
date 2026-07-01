.class public final synthetic LV2/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:LV2/e;

.field public final synthetic g:LW2/c;


# direct methods
.method public synthetic constructor <init>(LV2/e;LW2/c;I)V
    .locals 0

    .line 1
    iput p3, p0, LV2/b;->e:I

    iput-object p1, p0, LV2/b;->f:LV2/e;

    iput-object p2, p0, LV2/b;->g:LW2/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 10

    .line 1
    iget v0, p0, LV2/b;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const-string v0, "inTransaction"

    .line 7
    .line 8
    iget-object v1, p0, LV2/b;->g:LW2/c;

    .line 9
    .line 10
    invoke-virtual {v1, v0}, LT0/a;->q(Ljava/lang/String;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    instance-of v2, v0, Ljava/lang/Boolean;

    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    check-cast v0, Ljava/lang/Boolean;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move-object v0, v3

    .line 23
    :goto_0
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-virtual {v2, v0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    const/4 v4, 0x1

    .line 30
    const-string v5, "transactionId"

    .line 31
    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    invoke-virtual {v1}, LT0/a;->B()Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-eqz v2, :cond_1

    .line 39
    .line 40
    invoke-virtual {v1, v5}, LT0/a;->q(Ljava/lang/String;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    check-cast v2, Ljava/lang/Integer;

    .line 45
    .line 46
    if-nez v2, :cond_1

    .line 47
    .line 48
    move v2, v4

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    const/4 v2, 0x0

    .line 51
    :goto_1
    iget-object v6, p0, LV2/b;->f:LV2/e;

    .line 52
    .line 53
    if-eqz v2, :cond_2

    .line 54
    .line 55
    iget v7, v6, LV2/e;->k:I

    .line 56
    .line 57
    add-int/2addr v7, v4

    .line 58
    iput v7, v6, LV2/e;->k:I

    .line 59
    .line 60
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    iput-object v4, v6, LV2/e;->l:Ljava/lang/Integer;

    .line 65
    .line 66
    :cond_2
    invoke-virtual {v6, v1}, LV2/e;->h(LT0/a;)Z

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    if-nez v4, :cond_3

    .line 71
    .line 72
    if-eqz v2, :cond_6

    .line 73
    .line 74
    iput-object v3, v6, LV2/e;->l:Ljava/lang/Integer;

    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_3
    if-eqz v2, :cond_4

    .line 78
    .line 79
    new-instance v0, Ljava/util/HashMap;

    .line 80
    .line 81
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 82
    .line 83
    .line 84
    iget-object v2, v6, LV2/e;->l:Ljava/lang/Integer;

    .line 85
    .line 86
    invoke-virtual {v0, v5, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1, v0}, LT0/a;->a(Ljava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_4
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 94
    .line 95
    invoke-virtual {v2, v0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_5

    .line 100
    .line 101
    iput-object v3, v6, LV2/e;->l:Ljava/lang/Integer;

    .line 102
    .line 103
    :cond_5
    invoke-virtual {v1, v3}, LT0/a;->a(Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    :cond_6
    :goto_2
    return-void

    .line 107
    :pswitch_0
    iget-object v0, p0, LV2/b;->f:LV2/e;

    .line 108
    .line 109
    iget-object v1, p0, LV2/b;->g:LW2/c;

    .line 110
    .line 111
    invoke-virtual {v0, v1}, LV2/e;->e(LT0/a;)Z

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :pswitch_1
    iget-object v0, p0, LV2/b;->f:LV2/e;

    .line 116
    .line 117
    iget-object v1, p0, LV2/b;->g:LW2/c;

    .line 118
    .line 119
    invoke-virtual {v0, v1}, LV2/e;->g(LT0/a;)Z

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :pswitch_2
    iget-object v0, p0, LV2/b;->f:LV2/e;

    .line 124
    .line 125
    iget-object v1, p0, LV2/b;->g:LW2/c;

    .line 126
    .line 127
    invoke-virtual {v0, v1}, LV2/e;->f(LT0/a;)Z

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :pswitch_3
    iget-object v0, p0, LV2/b;->f:LV2/e;

    .line 132
    .line 133
    iget-object v1, v0, LV2/e;->g:Ljava/util/HashMap;

    .line 134
    .line 135
    const-string v2, "Cursor "

    .line 136
    .line 137
    iget-object v3, p0, LV2/b;->g:LW2/c;

    .line 138
    .line 139
    iget-object v4, v3, LW2/c;->k:Lk3/l;

    .line 140
    .line 141
    const-string v5, "cursorId"

    .line 142
    .line 143
    invoke-virtual {v4, v5}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v6

    .line 147
    check-cast v6, Ljava/lang/Integer;

    .line 148
    .line 149
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 150
    .line 151
    .line 152
    move-result v7

    .line 153
    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 154
    .line 155
    const-string v9, "cancel"

    .line 156
    .line 157
    invoke-virtual {v4, v9}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object v4

    .line 161
    invoke-virtual {v8, v4}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result v4

    .line 165
    iget v8, v0, LV2/e;->d:I

    .line 166
    .line 167
    invoke-static {v8}, LV2/a;->a(I)Z

    .line 168
    .line 169
    .line 170
    move-result v8

    .line 171
    if-eqz v8, :cond_8

    .line 172
    .line 173
    new-instance v8, Ljava/lang/StringBuilder;

    .line 174
    .line 175
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v0}, LV2/e;->i()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v9

    .line 182
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    const-string v9, "cursor "

    .line 186
    .line 187
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    if-eqz v4, :cond_7

    .line 194
    .line 195
    const-string v9, " cancel"

    .line 196
    .line 197
    goto :goto_3

    .line 198
    :cond_7
    const-string v9, " next"

    .line 199
    .line 200
    :goto_3
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v8

    .line 207
    const-string v9, "Sqflite"

    .line 208
    .line 209
    invoke-static {v9, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    .line 211
    .line 212
    :cond_8
    const/4 v8, 0x0

    .line 213
    if-eqz v4, :cond_a

    .line 214
    .line 215
    invoke-virtual {v1, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    check-cast v1, LV2/i;

    .line 220
    .line 221
    if-eqz v1, :cond_9

    .line 222
    .line 223
    invoke-virtual {v0, v1}, LV2/e;->c(LV2/i;)V

    .line 224
    .line 225
    .line 226
    :cond_9
    invoke-virtual {v3, v8}, LT0/a;->a(Ljava/lang/Object;)V

    .line 227
    .line 228
    .line 229
    goto :goto_7

    .line 230
    :cond_a
    invoke-virtual {v1, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    check-cast v1, LV2/i;

    .line 235
    .line 236
    const/4 v4, 0x0

    .line 237
    if-eqz v1, :cond_d

    .line 238
    .line 239
    :try_start_0
    iget-object v2, v1, LV2/i;->c:Landroid/database/Cursor;

    .line 240
    .line 241
    iget v7, v1, LV2/i;->b:I

    .line 242
    .line 243
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 244
    .line 245
    .line 246
    move-result-object v7

    .line 247
    invoke-static {v2, v7}, LV2/e;->d(Landroid/database/Cursor;Ljava/lang/Integer;)Ljava/util/HashMap;

    .line 248
    .line 249
    .line 250
    move-result-object v7

    .line 251
    invoke-interface {v2}, Landroid/database/Cursor;->isLast()Z

    .line 252
    .line 253
    .line 254
    move-result v9

    .line 255
    if-nez v9, :cond_b

    .line 256
    .line 257
    invoke-interface {v2}, Landroid/database/Cursor;->isAfterLast()Z

    .line 258
    .line 259
    .line 260
    move-result v2

    .line 261
    if-nez v2, :cond_b

    .line 262
    .line 263
    const/4 v4, 0x1

    .line 264
    goto :goto_4

    .line 265
    :catchall_0
    move-exception v2

    .line 266
    goto :goto_8

    .line 267
    :catch_0
    move-exception v2

    .line 268
    goto :goto_5

    .line 269
    :cond_b
    :goto_4
    if-eqz v4, :cond_c

    .line 270
    .line 271
    invoke-interface {v7, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 272
    .line 273
    .line 274
    :cond_c
    invoke-virtual {v3, v7}, LT0/a;->a(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 275
    .line 276
    .line 277
    if-nez v4, :cond_f

    .line 278
    .line 279
    invoke-virtual {v0, v1}, LV2/e;->c(LV2/i;)V

    .line 280
    .line 281
    .line 282
    goto :goto_7

    .line 283
    :cond_d
    :try_start_1
    new-instance v5, Ljava/lang/IllegalStateException;

    .line 284
    .line 285
    new-instance v6, Ljava/lang/StringBuilder;

    .line 286
    .line 287
    invoke-direct {v6, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 291
    .line 292
    .line 293
    const-string v2, " not found"

    .line 294
    .line 295
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 296
    .line 297
    .line 298
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object v2

    .line 302
    invoke-direct {v5, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 303
    .line 304
    .line 305
    throw v5
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 306
    :goto_5
    :try_start_2
    invoke-virtual {v0, v2, v3}, LV2/e;->j(Ljava/lang/Exception;LT0/a;)V

    .line 307
    .line 308
    .line 309
    if-eqz v1, :cond_e

    .line 310
    .line 311
    invoke-virtual {v0, v1}, LV2/e;->c(LV2/i;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 312
    .line 313
    .line 314
    goto :goto_6

    .line 315
    :cond_e
    move-object v8, v1

    .line 316
    :goto_6
    if-nez v4, :cond_f

    .line 317
    .line 318
    if-eqz v8, :cond_f

    .line 319
    .line 320
    invoke-virtual {v0, v8}, LV2/e;->c(LV2/i;)V

    .line 321
    .line 322
    .line 323
    :cond_f
    :goto_7
    return-void

    .line 324
    :goto_8
    if-nez v4, :cond_10

    .line 325
    .line 326
    if-eqz v1, :cond_10

    .line 327
    .line 328
    invoke-virtual {v0, v1}, LV2/e;->c(LV2/i;)V

    .line 329
    .line 330
    .line 331
    :cond_10
    throw v2

    .line 332
    nop

    .line 333
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
