.class public final synthetic LM3/k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LH3/p;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, LM3/k;->e:I

    iput-object p2, p0, LM3/k;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9

    .line 1
    iget v0, p0, LM3/k;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LM3/k;->f:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, LR3/l;

    .line 9
    .line 10
    check-cast p1, Ljava/lang/Integer;

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    check-cast p2, LA3/g;

    .line 17
    .line 18
    invoke-interface {p2}, LA3/g;->getKey()LA3/h;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object v0, v0, LR3/l;->i:LA3/i;

    .line 23
    .line 24
    invoke-interface {v0, p1}, LA3/i;->m(LA3/h;)LA3/g;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v2, LN3/s;->f:LN3/s;

    .line 29
    .line 30
    if-eq p1, v2, :cond_1

    .line 31
    .line 32
    if-eq p2, v0, :cond_0

    .line 33
    .line 34
    const/high16 v1, -0x80000000

    .line 35
    .line 36
    goto :goto_2

    .line 37
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_1
    check-cast v0, LN3/P;

    .line 41
    .line 42
    check-cast p2, LN3/P;

    .line 43
    .line 44
    :goto_0
    const/4 p1, 0x0

    .line 45
    if-nez p2, :cond_2

    .line 46
    .line 47
    move-object p2, p1

    .line 48
    goto :goto_1

    .line 49
    :cond_2
    if-ne p2, v0, :cond_3

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_3
    instance-of v2, p2, LS3/r;

    .line 53
    .line 54
    if-nez v2, :cond_5

    .line 55
    .line 56
    :goto_1
    if-ne p2, v0, :cond_4

    .line 57
    .line 58
    if-nez v0, :cond_0

    .line 59
    .line 60
    :goto_2
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    return-object p1

    .line 65
    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 66
    .line 67
    new-instance v1, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    const-string v2, "Flow invariant is violated:\n\t\tEmission from another coroutine is detected.\n\t\tChild of "

    .line 70
    .line 71
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string p2, ", expected child of "

    .line 78
    .line 79
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string p2, ".\n\t\tFlowCollector is not thread-safe and concurrent emissions are prohibited.\n\t\tTo mitigate this restriction please use \'channelFlow\' builder instead of \'flow\'"

    .line 86
    .line 87
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    throw p1

    .line 102
    :cond_5
    check-cast p2, LS3/r;

    .line 103
    .line 104
    sget-object v2, LN3/Y;->f:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 105
    .line 106
    invoke-virtual {v2, p2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    check-cast p2, LN3/j;

    .line 111
    .line 112
    if-eqz p2, :cond_6

    .line 113
    .line 114
    invoke-interface {p2}, LN3/j;->getParent()LN3/P;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    :cond_6
    move-object p2, p1

    .line 119
    goto :goto_0

    .line 120
    :pswitch_0
    iget-object v0, p0, LM3/k;->f:Ljava/lang/Object;

    .line 121
    .line 122
    check-cast v0, Ljava/util/List;

    .line 123
    .line 124
    check-cast p1, Ljava/lang/CharSequence;

    .line 125
    .line 126
    check-cast p2, Ljava/lang/Integer;

    .line 127
    .line 128
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 129
    .line 130
    .line 131
    move-result p2

    .line 132
    const-string v1, "$this$DelimitedRangesSequence"

    .line 133
    .line 134
    invoke-static {p1, v1}, LI3/h;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    const/4 v2, 0x0

    .line 142
    const/4 v3, 0x1

    .line 143
    const/4 v4, 0x0

    .line 144
    if-ne v1, v3, :cond_b

    .line 145
    .line 146
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    if-eqz v1, :cond_a

    .line 151
    .line 152
    if-ne v1, v3, :cond_9

    .line 153
    .line 154
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    check-cast v0, Ljava/lang/String;

    .line 159
    .line 160
    const/4 v1, 0x4

    .line 161
    invoke-static {p1, v0, p2, v1}, LM3/l;->f0(Ljava/lang/CharSequence;Ljava/lang/String;II)I

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    if-gez p1, :cond_8

    .line 166
    .line 167
    :cond_7
    :goto_3
    move-object p2, v4

    .line 168
    goto/16 :goto_8

    .line 169
    .line 170
    :cond_8
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    new-instance p2, Ly3/c;

    .line 175
    .line 176
    invoke-direct {p2, p1, v0}, Ly3/c;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 177
    .line 178
    .line 179
    goto/16 :goto_8

    .line 180
    .line 181
    :cond_9
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 182
    .line 183
    const-string p2, "List has more than one element."

    .line 184
    .line 185
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    throw p1

    .line 189
    :cond_a
    new-instance p1, Ljava/util/NoSuchElementException;

    .line 190
    .line 191
    const-string p2, "List is empty."

    .line 192
    .line 193
    invoke-direct {p1, p2}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    throw p1

    .line 197
    :cond_b
    new-instance v1, LJ3/c;

    .line 198
    .line 199
    if-gez p2, :cond_c

    .line 200
    .line 201
    move p2, v2

    .line 202
    :cond_c
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 203
    .line 204
    .line 205
    move-result v5

    .line 206
    invoke-direct {v1, p2, v5, v3}, LJ3/a;-><init>(III)V

    .line 207
    .line 208
    .line 209
    instance-of v3, p1, Ljava/lang/String;

    .line 210
    .line 211
    iget v1, v1, LJ3/a;->f:I

    .line 212
    .line 213
    if-eqz v3, :cond_11

    .line 214
    .line 215
    if-le p2, v1, :cond_d

    .line 216
    .line 217
    goto :goto_3

    .line 218
    :cond_d
    :goto_4
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 219
    .line 220
    .line 221
    move-result-object v3

    .line 222
    :cond_e
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 223
    .line 224
    .line 225
    move-result v5

    .line 226
    if-eqz v5, :cond_f

    .line 227
    .line 228
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 229
    .line 230
    .line 231
    move-result-object v5

    .line 232
    move-object v6, v5

    .line 233
    check-cast v6, Ljava/lang/String;

    .line 234
    .line 235
    move-object v7, p1

    .line 236
    check-cast v7, Ljava/lang/String;

    .line 237
    .line 238
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 239
    .line 240
    .line 241
    move-result v8

    .line 242
    invoke-static {v6, v7, p2, v8, v2}, LM3/l;->h0(Ljava/lang/String;Ljava/lang/String;IIZ)Z

    .line 243
    .line 244
    .line 245
    move-result v6

    .line 246
    if-eqz v6, :cond_e

    .line 247
    .line 248
    goto :goto_5

    .line 249
    :cond_f
    move-object v5, v4

    .line 250
    :goto_5
    check-cast v5, Ljava/lang/String;

    .line 251
    .line 252
    if-eqz v5, :cond_10

    .line 253
    .line 254
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 255
    .line 256
    .line 257
    move-result-object p1

    .line 258
    new-instance p2, Ly3/c;

    .line 259
    .line 260
    invoke-direct {p2, p1, v5}, Ly3/c;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 261
    .line 262
    .line 263
    goto :goto_8

    .line 264
    :cond_10
    if-eq p2, v1, :cond_7

    .line 265
    .line 266
    add-int/lit8 p2, p2, 0x1

    .line 267
    .line 268
    goto :goto_4

    .line 269
    :cond_11
    if-le p2, v1, :cond_12

    .line 270
    .line 271
    goto :goto_3

    .line 272
    :cond_12
    :goto_6
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 273
    .line 274
    .line 275
    move-result-object v3

    .line 276
    :cond_13
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 277
    .line 278
    .line 279
    move-result v5

    .line 280
    if-eqz v5, :cond_14

    .line 281
    .line 282
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    move-result-object v5

    .line 286
    move-object v6, v5

    .line 287
    check-cast v6, Ljava/lang/String;

    .line 288
    .line 289
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 290
    .line 291
    .line 292
    move-result v7

    .line 293
    invoke-static {v6, p1, p2, v7, v2}, LM3/l;->i0(Ljava/lang/CharSequence;Ljava/lang/CharSequence;IIZ)Z

    .line 294
    .line 295
    .line 296
    move-result v6

    .line 297
    if-eqz v6, :cond_13

    .line 298
    .line 299
    goto :goto_7

    .line 300
    :cond_14
    move-object v5, v4

    .line 301
    :goto_7
    check-cast v5, Ljava/lang/String;

    .line 302
    .line 303
    if-eqz v5, :cond_15

    .line 304
    .line 305
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 306
    .line 307
    .line 308
    move-result-object p1

    .line 309
    new-instance p2, Ly3/c;

    .line 310
    .line 311
    invoke-direct {p2, p1, v5}, Ly3/c;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 312
    .line 313
    .line 314
    goto :goto_8

    .line 315
    :cond_15
    if-eq p2, v1, :cond_7

    .line 316
    .line 317
    add-int/lit8 p2, p2, 0x1

    .line 318
    .line 319
    goto :goto_6

    .line 320
    :goto_8
    if-eqz p2, :cond_16

    .line 321
    .line 322
    iget-object p1, p2, Ly3/c;->e:Ljava/lang/Object;

    .line 323
    .line 324
    iget-object p2, p2, Ly3/c;->f:Ljava/lang/Object;

    .line 325
    .line 326
    check-cast p2, Ljava/lang/String;

    .line 327
    .line 328
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 329
    .line 330
    .line 331
    move-result p2

    .line 332
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 333
    .line 334
    .line 335
    move-result-object p2

    .line 336
    new-instance v4, Ly3/c;

    .line 337
    .line 338
    invoke-direct {v4, p1, p2}, Ly3/c;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 339
    .line 340
    .line 341
    :cond_16
    return-object v4

    .line 342
    nop

    .line 343
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
