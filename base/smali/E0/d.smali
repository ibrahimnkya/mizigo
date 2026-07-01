.class public final LE0/d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:LF0/d;

.field public final c:LE0/b;


# direct methods
.method public constructor <init>(Landroid/content/Context;LF0/d;LE0/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LE0/d;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, LE0/d;->b:LF0/d;

    .line 7
    .line 8
    iput-object p3, p0, LE0/d;->c:LE0/b;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Ly0/i;IZ)V
    .locals 16

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    new-instance v3, Landroid/content/ComponentName;

    .line 8
    .line 9
    const-class v4, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/JobInfoSchedulerService;

    .line 10
    .line 11
    iget-object v5, v1, LE0/d;->a:Landroid/content/Context;

    .line 12
    .line 13
    invoke-direct {v3, v5, v4}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 14
    .line 15
    .line 16
    const-string v4, "jobscheduler"

    .line 17
    .line 18
    invoke-virtual {v5, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    check-cast v4, Landroid/app/job/JobScheduler;

    .line 23
    .line 24
    new-instance v6, Ljava/util/zip/Adler32;

    .line 25
    .line 26
    invoke-direct {v6}, Ljava/util/zip/Adler32;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    const-string v7, "UTF-8"

    .line 34
    .line 35
    invoke-static {v7}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    .line 36
    .line 37
    .line 38
    move-result-object v8

    .line 39
    invoke-virtual {v5, v8}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    invoke-virtual {v6, v5}, Ljava/util/zip/Adler32;->update([B)V

    .line 44
    .line 45
    .line 46
    iget-object v5, v0, Ly0/i;->a:Ljava/lang/String;

    .line 47
    .line 48
    iget-object v8, v0, Ly0/i;->a:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v7}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    .line 51
    .line 52
    .line 53
    move-result-object v7

    .line 54
    invoke-virtual {v5, v7}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    invoke-virtual {v6, v5}, Ljava/util/zip/Adler32;->update([B)V

    .line 59
    .line 60
    .line 61
    const/4 v5, 0x4

    .line 62
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    iget-object v7, v0, Ly0/i;->c:Lv0/d;

    .line 67
    .line 68
    invoke-static {v7}, LI0/a;->a(Lv0/d;)I

    .line 69
    .line 70
    .line 71
    move-result v9

    .line 72
    invoke-virtual {v5, v9}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->array()[B

    .line 77
    .line 78
    .line 79
    move-result-object v5

    .line 80
    invoke-virtual {v6, v5}, Ljava/util/zip/Adler32;->update([B)V

    .line 81
    .line 82
    .line 83
    iget-object v5, v0, Ly0/i;->b:[B

    .line 84
    .line 85
    if-eqz v5, :cond_0

    .line 86
    .line 87
    invoke-virtual {v6, v5}, Ljava/util/zip/Adler32;->update([B)V

    .line 88
    .line 89
    .line 90
    :cond_0
    invoke-virtual {v6}, Ljava/util/zip/Adler32;->getValue()J

    .line 91
    .line 92
    .line 93
    move-result-wide v9

    .line 94
    long-to-int v6, v9

    .line 95
    const-string v9, "JobInfoScheduler"

    .line 96
    .line 97
    const-string v10, "attemptNumber"

    .line 98
    .line 99
    if-nez p3, :cond_2

    .line 100
    .line 101
    invoke-virtual {v4}, Landroid/app/job/JobScheduler;->getAllPendingJobs()Ljava/util/List;

    .line 102
    .line 103
    .line 104
    move-result-object v11

    .line 105
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 106
    .line 107
    .line 108
    move-result-object v11

    .line 109
    :cond_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    .line 110
    .line 111
    .line 112
    move-result v12

    .line 113
    if-eqz v12, :cond_2

    .line 114
    .line 115
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v12

    .line 119
    check-cast v12, Landroid/app/job/JobInfo;

    .line 120
    .line 121
    invoke-virtual {v12}, Landroid/app/job/JobInfo;->getExtras()Landroid/os/PersistableBundle;

    .line 122
    .line 123
    .line 124
    move-result-object v13

    .line 125
    invoke-virtual {v13, v10}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    move-result v13

    .line 129
    invoke-virtual {v12}, Landroid/app/job/JobInfo;->getId()I

    .line 130
    .line 131
    .line 132
    move-result v12

    .line 133
    if-ne v12, v6, :cond_1

    .line 134
    .line 135
    if-lt v13, v2, :cond_2

    .line 136
    .line 137
    const-string v2, "Upload for context %s is already scheduled. Returning..."

    .line 138
    .line 139
    invoke-static {v9, v2, v0}, Landroid/support/v4/media/session/a;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :cond_2
    iget-object v11, v1, LE0/d;->b:LF0/d;

    .line 144
    .line 145
    check-cast v11, LF0/h;

    .line 146
    .line 147
    invoke-virtual {v11}, LF0/h;->a()Landroid/database/sqlite/SQLiteDatabase;

    .line 148
    .line 149
    .line 150
    move-result-object v11

    .line 151
    invoke-static {v7}, LI0/a;->a(Lv0/d;)I

    .line 152
    .line 153
    .line 154
    move-result v12

    .line 155
    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v12

    .line 159
    filled-new-array {v8, v12}, [Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v12

    .line 163
    const-string v13, "SELECT next_request_ms FROM transport_contexts WHERE backend_name = ? and priority = ?"

    .line 164
    .line 165
    invoke-virtual {v11, v13, v12}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 166
    .line 167
    .line 168
    move-result-object v11

    .line 169
    :try_start_0
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    .line 170
    .line 171
    .line 172
    move-result v12

    .line 173
    const/4 v13, 0x0

    .line 174
    if-eqz v12, :cond_3

    .line 175
    .line 176
    invoke-interface {v11, v13}, Landroid/database/Cursor;->getLong(I)J

    .line 177
    .line 178
    .line 179
    move-result-wide v14

    .line 180
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 181
    .line 182
    .line 183
    move-result-object v12

    .line 184
    goto :goto_0

    .line 185
    :cond_3
    const-wide/16 v14, 0x0

    .line 186
    .line 187
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 188
    .line 189
    .line 190
    move-result-object v12
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 191
    :goto_0
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v12}, Ljava/lang/Long;->longValue()J

    .line 195
    .line 196
    .line 197
    move-result-wide v14

    .line 198
    new-instance v11, Landroid/app/job/JobInfo$Builder;

    .line 199
    .line 200
    invoke-direct {v11, v6, v3}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    .line 201
    .line 202
    .line 203
    iget-object v3, v1, LE0/d;->c:LE0/b;

    .line 204
    .line 205
    invoke-virtual {v3, v7, v14, v15, v2}, LE0/b;->a(Lv0/d;JI)J

    .line 206
    .line 207
    .line 208
    move-result-wide v0

    .line 209
    invoke-virtual {v11, v0, v1}, Landroid/app/job/JobInfo$Builder;->setMinimumLatency(J)Landroid/app/job/JobInfo$Builder;

    .line 210
    .line 211
    .line 212
    iget-object v0, v3, LE0/b;->b:Ljava/util/HashMap;

    .line 213
    .line 214
    invoke-virtual {v0, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    check-cast v0, LE0/c;

    .line 219
    .line 220
    iget-object v0, v0, LE0/c;->c:Ljava/util/Set;

    .line 221
    .line 222
    sget-object v1, LE0/e;->e:LE0/e;

    .line 223
    .line 224
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 225
    .line 226
    .line 227
    move-result v1

    .line 228
    const/4 v13, 0x1

    .line 229
    if-eqz v1, :cond_4

    .line 230
    .line 231
    const/4 v1, 0x2

    .line 232
    invoke-virtual {v11, v1}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    .line 233
    .line 234
    .line 235
    goto :goto_1

    .line 236
    :cond_4
    invoke-virtual {v11, v13}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    .line 237
    .line 238
    .line 239
    :goto_1
    sget-object v1, LE0/e;->g:LE0/e;

    .line 240
    .line 241
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    move-result v1

    .line 245
    if-eqz v1, :cond_5

    .line 246
    .line 247
    invoke-virtual {v11, v13}, Landroid/app/job/JobInfo$Builder;->setRequiresCharging(Z)Landroid/app/job/JobInfo$Builder;

    .line 248
    .line 249
    .line 250
    :cond_5
    sget-object v1, LE0/e;->f:LE0/e;

    .line 251
    .line 252
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 253
    .line 254
    .line 255
    move-result v0

    .line 256
    if-eqz v0, :cond_6

    .line 257
    .line 258
    invoke-virtual {v11, v13}, Landroid/app/job/JobInfo$Builder;->setRequiresDeviceIdle(Z)Landroid/app/job/JobInfo$Builder;

    .line 259
    .line 260
    .line 261
    :cond_6
    new-instance v0, Landroid/os/PersistableBundle;

    .line 262
    .line 263
    invoke-direct {v0}, Landroid/os/PersistableBundle;-><init>()V

    .line 264
    .line 265
    .line 266
    invoke-virtual {v0, v10, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 267
    .line 268
    .line 269
    const-string v1, "backendName"

    .line 270
    .line 271
    invoke-virtual {v0, v1, v8}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    const-string v1, "priority"

    .line 275
    .line 276
    invoke-static {v7}, LI0/a;->a(Lv0/d;)I

    .line 277
    .line 278
    .line 279
    move-result v8

    .line 280
    invoke-virtual {v0, v1, v8}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 281
    .line 282
    .line 283
    if-eqz v5, :cond_7

    .line 284
    .line 285
    const-string v1, "extras"

    .line 286
    .line 287
    const/4 v8, 0x0

    .line 288
    invoke-static {v5, v8}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v5

    .line 292
    invoke-virtual {v0, v1, v5}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    .line 294
    .line 295
    :cond_7
    invoke-virtual {v11, v0}, Landroid/app/job/JobInfo$Builder;->setExtras(Landroid/os/PersistableBundle;)Landroid/app/job/JobInfo$Builder;

    .line 296
    .line 297
    .line 298
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    invoke-virtual {v3, v7, v14, v15, v2}, LE0/b;->a(Lv0/d;JI)J

    .line 303
    .line 304
    .line 305
    move-result-wide v5

    .line 306
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 307
    .line 308
    .line 309
    move-result-object v1

    .line 310
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 311
    .line 312
    .line 313
    move-result-object v2

    .line 314
    move-object/from16 v3, p1

    .line 315
    .line 316
    filled-new-array {v3, v0, v1, v12, v2}, [Ljava/lang/Object;

    .line 317
    .line 318
    .line 319
    move-result-object v0

    .line 320
    invoke-static {v9}, Landroid/support/v4/media/session/a;->s(Ljava/lang/String;)Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object v1

    .line 324
    const/4 v2, 0x3

    .line 325
    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 326
    .line 327
    .line 328
    move-result v2

    .line 329
    if-eqz v2, :cond_8

    .line 330
    .line 331
    const-string v2, "Scheduling upload for context %s with jobId=%d in %dms(Backend next call timestamp %d). Attempt %d"

    .line 332
    .line 333
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 334
    .line 335
    .line 336
    move-result-object v0

    .line 337
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 338
    .line 339
    .line 340
    :cond_8
    invoke-virtual {v11}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    .line 341
    .line 342
    .line 343
    move-result-object v0

    .line 344
    invoke-virtual {v4, v0}, Landroid/app/job/JobScheduler;->schedule(Landroid/app/job/JobInfo;)I

    .line 345
    .line 346
    .line 347
    return-void

    .line 348
    :catchall_0
    move-exception v0

    .line 349
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 350
    .line 351
    .line 352
    throw v0
.end method
