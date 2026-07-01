.class public final synthetic LD0/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LG0/b;
.implements LF0/f;
.implements Li1/g;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Ljava/lang/Object;

.field public final synthetic g:Ljava/lang/Object;

.field public final synthetic h:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(LF0/h;Ljava/lang/Object;Ly0/i;I)V
    .locals 0

    .line 1
    iput p4, p0, LD0/b;->e:I

    iput-object p1, p0, LD0/b;->g:Ljava/lang/Object;

    iput-object p2, p0, LD0/b;->h:Ljava/lang/Object;

    iput-object p3, p0, LD0/b;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 0

    .line 2
    iput p4, p0, LD0/b;->e:I

    iput-object p1, p0, LD0/b;->g:Ljava/lang/Object;

    iput-object p2, p0, LD0/b;->f:Ljava/lang/Object;

    iput-object p3, p0, LD0/b;->h:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;)Li1/p;
    .locals 8

    .line 1
    iget-object v0, p0, LD0/b;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/google/firebase/messaging/FirebaseMessaging;

    .line 4
    .line 5
    iget-object v1, p0, LD0/b;->f:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ljava/lang/String;

    .line 8
    .line 9
    iget-object v2, p0, LD0/b;->h:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v2, LV1/z;

    .line 12
    .line 13
    check-cast p1, Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->b:Landroid/content/Context;

    .line 16
    .line 17
    invoke-static {v3}, Lcom/google/firebase/messaging/FirebaseMessaging;->d(Landroid/content/Context;)LA0/c;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-virtual {v0}, Lcom/google/firebase/messaging/FirebaseMessaging;->e()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    iget-object v5, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->i:LV1/s;

    .line 26
    .line 27
    invoke-virtual {v5}, LV1/s;->a()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    monitor-enter v3

    .line 32
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 33
    .line 34
    .line 35
    move-result-wide v6

    .line 36
    invoke-static {p1, v5, v6, v7}, LV1/z;->a(Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    if-nez v5, :cond_0

    .line 41
    .line 42
    monitor-exit v3

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    :try_start_1
    iget-object v6, v3, LA0/c;->f:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast v6, Landroid/content/SharedPreferences;

    .line 47
    .line 48
    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 49
    .line 50
    .line 51
    move-result-object v6

    .line 52
    invoke-static {v4, v1}, LA0/c;->v(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-interface {v6, v1, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 57
    .line 58
    .line 59
    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    .line 61
    .line 62
    monitor-exit v3

    .line 63
    :goto_0
    if-eqz v2, :cond_1

    .line 64
    .line 65
    iget-object v1, v2, LV1/z;->a:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-nez v1, :cond_3

    .line 72
    .line 73
    :cond_1
    const-string v1, "FirebaseMessaging"

    .line 74
    .line 75
    const-string v2, "[DEFAULT]"

    .line 76
    .line 77
    iget-object v3, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->a:LA1/g;

    .line 78
    .line 79
    invoke-virtual {v3}, LA1/g;->a()V

    .line 80
    .line 81
    .line 82
    iget-object v4, v3, LA1/g;->b:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    if-eqz v2, :cond_3

    .line 89
    .line 90
    const/4 v2, 0x3

    .line 91
    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    if-eqz v2, :cond_2

    .line 96
    .line 97
    new-instance v2, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    const-string v4, "Invoking onNewToken for app: "

    .line 100
    .line 101
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v3}, LA1/g;->a()V

    .line 105
    .line 106
    .line 107
    iget-object v3, v3, LA1/g;->b:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    .line 118
    .line 119
    :cond_2
    new-instance v1, Landroid/content/Intent;

    .line 120
    .line 121
    const-string v2, "com.google.firebase.messaging.NEW_TOKEN"

    .line 122
    .line 123
    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    const-string v2, "token"

    .line 127
    .line 128
    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 129
    .line 130
    .line 131
    new-instance v2, LV1/j;

    .line 132
    .line 133
    iget-object v0, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->b:Landroid/content/Context;

    .line 134
    .line 135
    invoke-direct {v2, v0}, LV1/j;-><init>(Landroid/content/Context;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v2, v1}, LV1/j;->b(Landroid/content/Intent;)Li1/p;

    .line 139
    .line 140
    .line 141
    :cond_3
    invoke-static {p1}, LV0/g;->o(Ljava/lang/Object;)Li1/p;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    return-object p1

    .line 146
    :catchall_0
    move-exception p1

    .line 147
    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 148
    throw p1
.end method

.method public apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 27

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget v0, v1, LD0/b;->e:I

    .line 4
    .line 5
    const-string v2, "bytes"

    .line 6
    .line 7
    const-string v4, "PRAGMA page_size"

    .line 8
    .line 9
    const-string v5, "PRAGMA page_count"

    .line 10
    .line 11
    const/4 v6, 0x6

    .line 12
    const/4 v7, 0x5

    .line 13
    const/4 v8, 0x4

    .line 14
    const/4 v9, 0x3

    .line 15
    sget-object v10, LB0/c;->h:LB0/c;

    .line 16
    .line 17
    const/4 v11, 0x2

    .line 18
    const/4 v12, 0x1

    .line 19
    iget-object v13, v1, LD0/b;->h:Ljava/lang/Object;

    .line 20
    .line 21
    iget-object v14, v1, LD0/b;->f:Ljava/lang/Object;

    .line 22
    .line 23
    iget-object v15, v1, LD0/b;->g:Ljava/lang/Object;

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    check-cast v15, LF0/h;

    .line 27
    .line 28
    packed-switch v0, :pswitch_data_0

    .line 29
    .line 30
    .line 31
    check-cast v14, Ljava/util/HashMap;

    .line 32
    .line 33
    check-cast v13, LV1/y;

    .line 34
    .line 35
    move-object/from16 v0, p1

    .line 36
    .line 37
    check-cast v0, Landroid/database/Cursor;

    .line 38
    .line 39
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_8

    .line 47
    .line 48
    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-interface {v0, v12}, Landroid/database/Cursor;->getInt(I)I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    sget-object v16, LB0/c;->f:LB0/c;

    .line 57
    .line 58
    if-nez v3, :cond_0

    .line 59
    .line 60
    :goto_1
    move-object/from16 v3, v16

    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_0
    if-ne v3, v12, :cond_1

    .line 64
    .line 65
    sget-object v16, LB0/c;->g:LB0/c;

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_1
    if-ne v3, v11, :cond_2

    .line 69
    .line 70
    move-object v3, v10

    .line 71
    goto :goto_2

    .line 72
    :cond_2
    if-ne v3, v9, :cond_3

    .line 73
    .line 74
    sget-object v16, LB0/c;->i:LB0/c;

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_3
    if-ne v3, v8, :cond_4

    .line 78
    .line 79
    sget-object v16, LB0/c;->j:LB0/c;

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_4
    if-ne v3, v7, :cond_5

    .line 83
    .line 84
    sget-object v16, LB0/c;->k:LB0/c;

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_5
    if-ne v3, v6, :cond_6

    .line 88
    .line 89
    sget-object v16, LB0/c;->l:LB0/c;

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_6
    const-string v6, "%n is not valid. No matched LogEventDropped-Reason found. Treated it as REASON_UNKNOWN"

    .line 93
    .line 94
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    const-string v7, "SQLiteEventStore"

    .line 99
    .line 100
    invoke-static {v7, v6, v3}, Landroid/support/v4/media/session/a;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    goto :goto_1

    .line 104
    :goto_2
    invoke-interface {v0, v11}, Landroid/database/Cursor;->getLong(I)J

    .line 105
    .line 106
    .line 107
    move-result-wide v6

    .line 108
    invoke-virtual {v14, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v16

    .line 112
    if-nez v16, :cond_7

    .line 113
    .line 114
    new-instance v8, Ljava/util/ArrayList;

    .line 115
    .line 116
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v14, v2, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    :cond_7
    invoke-virtual {v14, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    check-cast v2, Ljava/util/List;

    .line 127
    .line 128
    new-instance v8, LB0/d;

    .line 129
    .line 130
    invoke-direct {v8, v6, v7, v3}, LB0/d;-><init>(JLB0/c;)V

    .line 131
    .line 132
    .line 133
    invoke-interface {v2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    const/4 v3, 0x0

    .line 137
    const/4 v6, 0x6

    .line 138
    const/4 v7, 0x5

    .line 139
    const/4 v8, 0x4

    .line 140
    goto :goto_0

    .line 141
    :cond_8
    invoke-virtual {v14}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 150
    .line 151
    .line 152
    move-result v2

    .line 153
    if-eqz v2, :cond_9

    .line 154
    .line 155
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    check-cast v2, Ljava/util/Map$Entry;

    .line 160
    .line 161
    sget v3, LB0/e;->c:I

    .line 162
    .line 163
    new-instance v3, Ljava/util/ArrayList;

    .line 164
    .line 165
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 166
    .line 167
    .line 168
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v3

    .line 172
    check-cast v3, Ljava/lang/String;

    .line 173
    .line 174
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    check-cast v2, Ljava/util/List;

    .line 179
    .line 180
    new-instance v6, LB0/e;

    .line 181
    .line 182
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    invoke-direct {v6, v3, v2}, LB0/e;-><init>(Ljava/lang/String;Ljava/util/List;)V

    .line 187
    .line 188
    .line 189
    iget-object v2, v13, LV1/y;->h:Ljava/lang/Object;

    .line 190
    .line 191
    check-cast v2, Ljava/util/ArrayList;

    .line 192
    .line 193
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    goto :goto_3

    .line 197
    :cond_9
    iget-object v0, v15, LF0/h;->f:LH0/a;

    .line 198
    .line 199
    invoke-interface {v0}, LH0/a;->e()J

    .line 200
    .line 201
    .line 202
    move-result-wide v2

    .line 203
    invoke-virtual {v15}, LF0/h;->a()Landroid/database/sqlite/SQLiteDatabase;

    .line 204
    .line 205
    .line 206
    move-result-object v6

    .line 207
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 208
    .line 209
    .line 210
    :try_start_0
    const-string v0, "SELECT last_metrics_upload_ms FROM global_log_event_state LIMIT 1"

    .line 211
    .line 212
    const/4 v7, 0x0

    .line 213
    new-array v8, v7, [Ljava/lang/String;

    .line 214
    .line 215
    invoke-virtual {v6, v0, v8}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 216
    .line 217
    .line 218
    move-result-object v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 219
    :try_start_1
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    .line 220
    .line 221
    .line 222
    invoke-interface {v8, v7}, Landroid/database/Cursor;->getLong(I)J

    .line 223
    .line 224
    .line 225
    move-result-wide v9

    .line 226
    new-instance v0, LB0/g;

    .line 227
    .line 228
    invoke-direct {v0, v9, v10, v2, v3}, LB0/g;-><init>(JJ)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 229
    .line 230
    .line 231
    :try_start_2
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 232
    .line 233
    .line 234
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 235
    .line 236
    .line 237
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 238
    .line 239
    .line 240
    iput-object v0, v13, LV1/y;->g:Ljava/lang/Object;

    .line 241
    .line 242
    invoke-virtual {v15}, LF0/h;->a()Landroid/database/sqlite/SQLiteDatabase;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    invoke-virtual {v0, v5}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J

    .line 251
    .line 252
    .line 253
    move-result-wide v2

    .line 254
    invoke-virtual {v15}, LF0/h;->a()Landroid/database/sqlite/SQLiteDatabase;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    invoke-virtual {v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J

    .line 263
    .line 264
    .line 265
    move-result-wide v4

    .line 266
    mul-long/2addr v4, v2

    .line 267
    sget-object v0, LF0/a;->f:LF0/a;

    .line 268
    .line 269
    iget-wide v2, v0, LF0/a;->a:J

    .line 270
    .line 271
    new-instance v0, LB0/f;

    .line 272
    .line 273
    invoke-direct {v0, v4, v5, v2, v3}, LB0/f;-><init>(JJ)V

    .line 274
    .line 275
    .line 276
    new-instance v2, LB0/b;

    .line 277
    .line 278
    invoke-direct {v2, v0}, LB0/b;-><init>(LB0/f;)V

    .line 279
    .line 280
    .line 281
    iput-object v2, v13, LV1/y;->i:Ljava/lang/Object;

    .line 282
    .line 283
    iget-object v0, v15, LF0/h;->i:Lx3/a;

    .line 284
    .line 285
    invoke-interface {v0}, Lx3/a;->get()Ljava/lang/Object;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    check-cast v0, Ljava/lang/String;

    .line 290
    .line 291
    iput-object v0, v13, LV1/y;->f:Ljava/lang/Object;

    .line 292
    .line 293
    new-instance v0, LB0/a;

    .line 294
    .line 295
    iget-object v2, v13, LV1/y;->g:Ljava/lang/Object;

    .line 296
    .line 297
    check-cast v2, LB0/g;

    .line 298
    .line 299
    iget-object v3, v13, LV1/y;->h:Ljava/lang/Object;

    .line 300
    .line 301
    check-cast v3, Ljava/util/ArrayList;

    .line 302
    .line 303
    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 304
    .line 305
    .line 306
    move-result-object v3

    .line 307
    iget-object v4, v13, LV1/y;->i:Ljava/lang/Object;

    .line 308
    .line 309
    check-cast v4, LB0/b;

    .line 310
    .line 311
    iget-object v5, v13, LV1/y;->f:Ljava/lang/Object;

    .line 312
    .line 313
    check-cast v5, Ljava/lang/String;

    .line 314
    .line 315
    invoke-direct {v0, v2, v3, v4, v5}, LB0/a;-><init>(LB0/g;Ljava/util/List;LB0/b;Ljava/lang/String;)V

    .line 316
    .line 317
    .line 318
    return-object v0

    .line 319
    :catchall_0
    move-exception v0

    .line 320
    goto :goto_4

    .line 321
    :catchall_1
    move-exception v0

    .line 322
    :try_start_3
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 323
    .line 324
    .line 325
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 326
    :goto_4
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 327
    .line 328
    .line 329
    throw v0

    .line 330
    :pswitch_0
    check-cast v13, Ly0/h;

    .line 331
    .line 332
    iget-object v0, v13, Ly0/h;->c:Ly0/l;

    .line 333
    .line 334
    iget-object v3, v13, Ly0/h;->a:Ljava/lang/String;

    .line 335
    .line 336
    check-cast v14, Ly0/i;

    .line 337
    .line 338
    move-object/from16 v6, p1

    .line 339
    .line 340
    check-cast v6, Landroid/database/sqlite/SQLiteDatabase;

    .line 341
    .line 342
    const/16 v17, 0x0

    .line 343
    .line 344
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 345
    .line 346
    .line 347
    move-result-object v7

    .line 348
    invoke-virtual {v15}, LF0/h;->a()Landroid/database/sqlite/SQLiteDatabase;

    .line 349
    .line 350
    .line 351
    move-result-object v8

    .line 352
    invoke-virtual {v8, v5}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    .line 353
    .line 354
    .line 355
    move-result-object v5

    .line 356
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J

    .line 357
    .line 358
    .line 359
    move-result-wide v8

    .line 360
    invoke-virtual {v15}, LF0/h;->a()Landroid/database/sqlite/SQLiteDatabase;

    .line 361
    .line 362
    .line 363
    move-result-object v5

    .line 364
    invoke-virtual {v5, v4}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    .line 365
    .line 366
    .line 367
    move-result-object v4

    .line 368
    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J

    .line 369
    .line 370
    .line 371
    move-result-wide v4

    .line 372
    mul-long/2addr v4, v8

    .line 373
    iget-object v8, v15, LF0/h;->h:LF0/a;

    .line 374
    .line 375
    move-object v9, v13

    .line 376
    iget-wide v12, v8, LF0/a;->a:J

    .line 377
    .line 378
    cmp-long v4, v4, v12

    .line 379
    .line 380
    if-ltz v4, :cond_a

    .line 381
    .line 382
    const-wide/16 v4, 0x1

    .line 383
    .line 384
    invoke-virtual {v15, v4, v5, v10, v3}, LF0/h;->e(JLB0/c;Ljava/lang/String;)V

    .line 385
    .line 386
    .line 387
    const-wide/16 v2, -0x1

    .line 388
    .line 389
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 390
    .line 391
    .line 392
    move-result-object v0

    .line 393
    goto/16 :goto_a

    .line 394
    .line 395
    :cond_a
    invoke-static {v6, v14}, LF0/h;->b(Landroid/database/sqlite/SQLiteDatabase;Ly0/i;)Ljava/lang/Long;

    .line 396
    .line 397
    .line 398
    move-result-object v4

    .line 399
    if-eqz v4, :cond_b

    .line 400
    .line 401
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 402
    .line 403
    .line 404
    move-result-wide v4

    .line 405
    goto :goto_5

    .line 406
    :cond_b
    new-instance v4, Landroid/content/ContentValues;

    .line 407
    .line 408
    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 409
    .line 410
    .line 411
    const-string v5, "backend_name"

    .line 412
    .line 413
    iget-object v10, v14, Ly0/i;->a:Ljava/lang/String;

    .line 414
    .line 415
    invoke-virtual {v4, v5, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 416
    .line 417
    .line 418
    iget-object v5, v14, Ly0/i;->c:Lv0/d;

    .line 419
    .line 420
    invoke-static {v5}, LI0/a;->a(Lv0/d;)I

    .line 421
    .line 422
    .line 423
    move-result v5

    .line 424
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 425
    .line 426
    .line 427
    move-result-object v5

    .line 428
    const-string v10, "priority"

    .line 429
    .line 430
    invoke-virtual {v4, v10, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 431
    .line 432
    .line 433
    const-string v5, "next_request_ms"

    .line 434
    .line 435
    invoke-virtual {v4, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 436
    .line 437
    .line 438
    iget-object v5, v14, Ly0/i;->b:[B

    .line 439
    .line 440
    if-eqz v5, :cond_c

    .line 441
    .line 442
    const-string v10, "extras"

    .line 443
    .line 444
    const/4 v11, 0x0

    .line 445
    invoke-static {v5, v11}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 446
    .line 447
    .line 448
    move-result-object v5

    .line 449
    invoke-virtual {v4, v10, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 450
    .line 451
    .line 452
    :cond_c
    const-string v5, "transport_contexts"

    .line 453
    .line 454
    const/4 v10, 0x0

    .line 455
    invoke-virtual {v6, v5, v10, v4}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 456
    .line 457
    .line 458
    move-result-wide v4

    .line 459
    :goto_5
    iget v8, v8, LF0/a;->e:I

    .line 460
    .line 461
    iget-object v10, v0, Ly0/l;->b:[B

    .line 462
    .line 463
    array-length v11, v10

    .line 464
    if-gt v11, v8, :cond_d

    .line 465
    .line 466
    const/4 v11, 0x1

    .line 467
    goto :goto_6

    .line 468
    :cond_d
    const/4 v11, 0x0

    .line 469
    :goto_6
    new-instance v12, Landroid/content/ContentValues;

    .line 470
    .line 471
    invoke-direct {v12}, Landroid/content/ContentValues;-><init>()V

    .line 472
    .line 473
    .line 474
    const-string v13, "context_id"

    .line 475
    .line 476
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 477
    .line 478
    .line 479
    move-result-object v4

    .line 480
    invoke-virtual {v12, v13, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 481
    .line 482
    .line 483
    const-string v4, "transport_name"

    .line 484
    .line 485
    invoke-virtual {v12, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 486
    .line 487
    .line 488
    iget-wide v3, v9, Ly0/h;->d:J

    .line 489
    .line 490
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 491
    .line 492
    .line 493
    move-result-object v3

    .line 494
    const-string v4, "timestamp_ms"

    .line 495
    .line 496
    invoke-virtual {v12, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 497
    .line 498
    .line 499
    iget-wide v3, v9, Ly0/h;->e:J

    .line 500
    .line 501
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 502
    .line 503
    .line 504
    move-result-object v3

    .line 505
    const-string v4, "uptime_ms"

    .line 506
    .line 507
    invoke-virtual {v12, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 508
    .line 509
    .line 510
    iget-object v0, v0, Ly0/l;->a:Lv0/c;

    .line 511
    .line 512
    iget-object v0, v0, Lv0/c;->a:Ljava/lang/String;

    .line 513
    .line 514
    const-string v3, "payload_encoding"

    .line 515
    .line 516
    invoke-virtual {v12, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 517
    .line 518
    .line 519
    const-string v0, "code"

    .line 520
    .line 521
    iget-object v3, v9, Ly0/h;->b:Ljava/lang/Integer;

    .line 522
    .line 523
    invoke-virtual {v12, v0, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 524
    .line 525
    .line 526
    const-string v0, "num_attempts"

    .line 527
    .line 528
    invoke-virtual {v12, v0, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 529
    .line 530
    .line 531
    const-string v0, "inline"

    .line 532
    .line 533
    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 534
    .line 535
    .line 536
    move-result-object v3

    .line 537
    invoke-virtual {v12, v0, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 538
    .line 539
    .line 540
    if-eqz v11, :cond_e

    .line 541
    .line 542
    move-object v0, v10

    .line 543
    goto :goto_7

    .line 544
    :cond_e
    const/4 v7, 0x0

    .line 545
    new-array v0, v7, [B

    .line 546
    .line 547
    :goto_7
    const-string v3, "payload"

    .line 548
    .line 549
    invoke-virtual {v12, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 550
    .line 551
    .line 552
    const-string v0, "events"

    .line 553
    .line 554
    const/4 v3, 0x0

    .line 555
    invoke-virtual {v6, v0, v3, v12}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 556
    .line 557
    .line 558
    move-result-wide v4

    .line 559
    const-string v0, "event_id"

    .line 560
    .line 561
    if-nez v11, :cond_f

    .line 562
    .line 563
    array-length v3, v10

    .line 564
    int-to-double v11, v3

    .line 565
    int-to-double v13, v8

    .line 566
    div-double/2addr v11, v13

    .line 567
    invoke-static {v11, v12}, Ljava/lang/Math;->ceil(D)D

    .line 568
    .line 569
    .line 570
    move-result-wide v11

    .line 571
    double-to-int v3, v11

    .line 572
    const/4 v12, 0x1

    .line 573
    :goto_8
    if-gt v12, v3, :cond_f

    .line 574
    .line 575
    add-int/lit8 v7, v12, -0x1

    .line 576
    .line 577
    mul-int/2addr v7, v8

    .line 578
    mul-int v11, v12, v8

    .line 579
    .line 580
    array-length v13, v10

    .line 581
    invoke-static {v11, v13}, Ljava/lang/Math;->min(II)I

    .line 582
    .line 583
    .line 584
    move-result v11

    .line 585
    invoke-static {v10, v7, v11}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 586
    .line 587
    .line 588
    move-result-object v7

    .line 589
    new-instance v11, Landroid/content/ContentValues;

    .line 590
    .line 591
    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    .line 592
    .line 593
    .line 594
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 595
    .line 596
    .line 597
    move-result-object v13

    .line 598
    invoke-virtual {v11, v0, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 599
    .line 600
    .line 601
    const-string v13, "sequence_num"

    .line 602
    .line 603
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 604
    .line 605
    .line 606
    move-result-object v14

    .line 607
    invoke-virtual {v11, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 608
    .line 609
    .line 610
    invoke-virtual {v11, v2, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 611
    .line 612
    .line 613
    const-string v7, "event_payloads"

    .line 614
    .line 615
    const/4 v13, 0x0

    .line 616
    invoke-virtual {v6, v7, v13, v11}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 617
    .line 618
    .line 619
    add-int/lit8 v12, v12, 0x1

    .line 620
    .line 621
    goto :goto_8

    .line 622
    :cond_f
    iget-object v2, v9, Ly0/h;->f:Ljava/util/Map;

    .line 623
    .line 624
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 625
    .line 626
    .line 627
    move-result-object v2

    .line 628
    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 629
    .line 630
    .line 631
    move-result-object v2

    .line 632
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 633
    .line 634
    .line 635
    move-result-object v2

    .line 636
    :goto_9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 637
    .line 638
    .line 639
    move-result v3

    .line 640
    if-eqz v3, :cond_10

    .line 641
    .line 642
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 643
    .line 644
    .line 645
    move-result-object v3

    .line 646
    check-cast v3, Ljava/util/Map$Entry;

    .line 647
    .line 648
    new-instance v7, Landroid/content/ContentValues;

    .line 649
    .line 650
    invoke-direct {v7}, Landroid/content/ContentValues;-><init>()V

    .line 651
    .line 652
    .line 653
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 654
    .line 655
    .line 656
    move-result-object v8

    .line 657
    invoke-virtual {v7, v0, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 658
    .line 659
    .line 660
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 661
    .line 662
    .line 663
    move-result-object v8

    .line 664
    check-cast v8, Ljava/lang/String;

    .line 665
    .line 666
    const-string v9, "name"

    .line 667
    .line 668
    invoke-virtual {v7, v9, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 669
    .line 670
    .line 671
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 672
    .line 673
    .line 674
    move-result-object v3

    .line 675
    check-cast v3, Ljava/lang/String;

    .line 676
    .line 677
    const-string v8, "value"

    .line 678
    .line 679
    invoke-virtual {v7, v8, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 680
    .line 681
    .line 682
    const-string v3, "event_metadata"

    .line 683
    .line 684
    const/4 v10, 0x0

    .line 685
    invoke-virtual {v6, v3, v10, v7}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 686
    .line 687
    .line 688
    goto :goto_9

    .line 689
    :cond_10
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 690
    .line 691
    .line 692
    move-result-object v0

    .line 693
    :goto_a
    return-object v0

    .line 694
    :pswitch_1
    check-cast v13, Ljava/util/ArrayList;

    .line 695
    .line 696
    check-cast v14, Ly0/i;

    .line 697
    .line 698
    move-object/from16 v0, p1

    .line 699
    .line 700
    check-cast v0, Landroid/database/Cursor;

    .line 701
    .line 702
    :goto_b
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    .line 703
    .line 704
    .line 705
    move-result v3

    .line 706
    if-eqz v3, :cond_19

    .line 707
    .line 708
    const/4 v7, 0x0

    .line 709
    invoke-interface {v0, v7}, Landroid/database/Cursor;->getLong(I)J

    .line 710
    .line 711
    .line 712
    move-result-wide v3

    .line 713
    const/4 v5, 0x7

    .line 714
    invoke-interface {v0, v5}, Landroid/database/Cursor;->getInt(I)I

    .line 715
    .line 716
    .line 717
    move-result v5

    .line 718
    if-eqz v5, :cond_11

    .line 719
    .line 720
    const/4 v5, 0x1

    .line 721
    goto :goto_c

    .line 722
    :cond_11
    const/4 v5, 0x0

    .line 723
    :goto_c
    new-instance v6, LD1/x;

    .line 724
    .line 725
    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    .line 726
    .line 727
    .line 728
    new-instance v7, Ljava/util/HashMap;

    .line 729
    .line 730
    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 731
    .line 732
    .line 733
    iput-object v7, v6, LD1/x;->f:Ljava/lang/Object;

    .line 734
    .line 735
    const/4 v7, 0x1

    .line 736
    invoke-interface {v0, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 737
    .line 738
    .line 739
    move-result-object v8

    .line 740
    if-eqz v8, :cond_18

    .line 741
    .line 742
    iput-object v8, v6, LD1/x;->a:Ljava/lang/Object;

    .line 743
    .line 744
    invoke-interface {v0, v11}, Landroid/database/Cursor;->getLong(I)J

    .line 745
    .line 746
    .line 747
    move-result-wide v18

    .line 748
    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 749
    .line 750
    .line 751
    move-result-object v8

    .line 752
    iput-object v8, v6, LD1/x;->d:Ljava/lang/Object;

    .line 753
    .line 754
    invoke-interface {v0, v9}, Landroid/database/Cursor;->getLong(I)J

    .line 755
    .line 756
    .line 757
    move-result-wide v18

    .line 758
    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 759
    .line 760
    .line 761
    move-result-object v8

    .line 762
    iput-object v8, v6, LD1/x;->e:Ljava/lang/Object;

    .line 763
    .line 764
    if-eqz v5, :cond_13

    .line 765
    .line 766
    new-instance v5, Ly0/l;

    .line 767
    .line 768
    const/4 v8, 0x4

    .line 769
    invoke-interface {v0, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 770
    .line 771
    .line 772
    move-result-object v10

    .line 773
    if-nez v10, :cond_12

    .line 774
    .line 775
    sget-object v8, LF0/h;->j:Lv0/c;

    .line 776
    .line 777
    :goto_d
    const/4 v10, 0x5

    .line 778
    goto :goto_e

    .line 779
    :cond_12
    new-instance v8, Lv0/c;

    .line 780
    .line 781
    invoke-direct {v8, v10}, Lv0/c;-><init>(Ljava/lang/String;)V

    .line 782
    .line 783
    .line 784
    goto :goto_d

    .line 785
    :goto_e
    invoke-interface {v0, v10}, Landroid/database/Cursor;->getBlob(I)[B

    .line 786
    .line 787
    .line 788
    move-result-object v12

    .line 789
    invoke-direct {v5, v8, v12}, Ly0/l;-><init>(Lv0/c;[B)V

    .line 790
    .line 791
    .line 792
    iput-object v5, v6, LD1/x;->c:Ljava/lang/Object;

    .line 793
    .line 794
    move-object/from16 v21, v2

    .line 795
    .line 796
    const/4 v7, 0x0

    .line 797
    :goto_f
    const/4 v1, 0x6

    .line 798
    goto/16 :goto_13

    .line 799
    .line 800
    :cond_13
    const/4 v10, 0x5

    .line 801
    new-instance v5, Ly0/l;

    .line 802
    .line 803
    const/4 v8, 0x4

    .line 804
    invoke-interface {v0, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 805
    .line 806
    .line 807
    move-result-object v12

    .line 808
    if-nez v12, :cond_14

    .line 809
    .line 810
    sget-object v12, LF0/h;->j:Lv0/c;

    .line 811
    .line 812
    goto :goto_10

    .line 813
    :cond_14
    new-instance v7, Lv0/c;

    .line 814
    .line 815
    invoke-direct {v7, v12}, Lv0/c;-><init>(Ljava/lang/String;)V

    .line 816
    .line 817
    .line 818
    move-object v12, v7

    .line 819
    :goto_10
    invoke-virtual {v15}, LF0/h;->a()Landroid/database/sqlite/SQLiteDatabase;

    .line 820
    .line 821
    .line 822
    move-result-object v19

    .line 823
    filled-new-array {v2}, [Ljava/lang/String;

    .line 824
    .line 825
    .line 826
    move-result-object v21

    .line 827
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 828
    .line 829
    .line 830
    move-result-object v7

    .line 831
    filled-new-array {v7}, [Ljava/lang/String;

    .line 832
    .line 833
    .line 834
    move-result-object v23

    .line 835
    const/16 v25, 0x0

    .line 836
    .line 837
    const-string v26, "sequence_num"

    .line 838
    .line 839
    const-string v20, "event_payloads"

    .line 840
    .line 841
    const-string v22, "event_id = ?"

    .line 842
    .line 843
    const/16 v24, 0x0

    .line 844
    .line 845
    invoke-virtual/range {v19 .. v26}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 846
    .line 847
    .line 848
    move-result-object v7

    .line 849
    :try_start_4
    new-instance v8, Ljava/util/ArrayList;

    .line 850
    .line 851
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 852
    .line 853
    .line 854
    const/4 v9, 0x0

    .line 855
    :goto_11
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    .line 856
    .line 857
    .line 858
    move-result v19

    .line 859
    if-eqz v19, :cond_15

    .line 860
    .line 861
    const/4 v10, 0x0

    .line 862
    invoke-interface {v7, v10}, Landroid/database/Cursor;->getBlob(I)[B

    .line 863
    .line 864
    .line 865
    move-result-object v11

    .line 866
    invoke-virtual {v8, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 867
    .line 868
    .line 869
    array-length v10, v11

    .line 870
    add-int/2addr v9, v10

    .line 871
    const/4 v10, 0x5

    .line 872
    const/4 v11, 0x2

    .line 873
    goto :goto_11

    .line 874
    :cond_15
    new-array v9, v9, [B

    .line 875
    .line 876
    const/4 v10, 0x0

    .line 877
    const/4 v11, 0x0

    .line 878
    :goto_12
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    .line 879
    .line 880
    .line 881
    move-result v1

    .line 882
    if-ge v10, v1, :cond_16

    .line 883
    .line 884
    invoke-virtual {v8, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 885
    .line 886
    .line 887
    move-result-object v1

    .line 888
    check-cast v1, [B

    .line 889
    .line 890
    move-object/from16 v21, v2

    .line 891
    .line 892
    array-length v2, v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 893
    move-object/from16 p1, v7

    .line 894
    .line 895
    const/4 v7, 0x0

    .line 896
    :try_start_5
    invoke-static {v1, v7, v9, v11, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 897
    .line 898
    .line 899
    array-length v1, v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 900
    add-int/2addr v11, v1

    .line 901
    add-int/lit8 v10, v10, 0x1

    .line 902
    .line 903
    move-object/from16 v7, p1

    .line 904
    .line 905
    move-object/from16 v2, v21

    .line 906
    .line 907
    goto :goto_12

    .line 908
    :catchall_2
    move-exception v0

    .line 909
    goto :goto_14

    .line 910
    :cond_16
    move-object/from16 v21, v2

    .line 911
    .line 912
    move-object/from16 p1, v7

    .line 913
    .line 914
    const/4 v7, 0x0

    .line 915
    invoke-interface/range {p1 .. p1}, Landroid/database/Cursor;->close()V

    .line 916
    .line 917
    .line 918
    invoke-direct {v5, v12, v9}, Ly0/l;-><init>(Lv0/c;[B)V

    .line 919
    .line 920
    .line 921
    iput-object v5, v6, LD1/x;->c:Ljava/lang/Object;

    .line 922
    .line 923
    goto :goto_f

    .line 924
    :goto_13
    invoke-interface {v0, v1}, Landroid/database/Cursor;->isNull(I)Z

    .line 925
    .line 926
    .line 927
    move-result v2

    .line 928
    if-nez v2, :cond_17

    .line 929
    .line 930
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    .line 931
    .line 932
    .line 933
    move-result v2

    .line 934
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 935
    .line 936
    .line 937
    move-result-object v2

    .line 938
    iput-object v2, v6, LD1/x;->b:Ljava/lang/Object;

    .line 939
    .line 940
    :cond_17
    invoke-virtual {v6}, LD1/x;->j()Ly0/h;

    .line 941
    .line 942
    .line 943
    move-result-object v2

    .line 944
    new-instance v5, LF0/b;

    .line 945
    .line 946
    invoke-direct {v5, v3, v4, v14, v2}, LF0/b;-><init>(JLy0/i;Ly0/h;)V

    .line 947
    .line 948
    .line 949
    invoke-virtual {v13, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 950
    .line 951
    .line 952
    move-object/from16 v1, p0

    .line 953
    .line 954
    move-object/from16 v2, v21

    .line 955
    .line 956
    const/4 v9, 0x3

    .line 957
    const/4 v11, 0x2

    .line 958
    goto/16 :goto_b

    .line 959
    .line 960
    :catchall_3
    move-exception v0

    .line 961
    move-object/from16 p1, v7

    .line 962
    .line 963
    :goto_14
    invoke-interface/range {p1 .. p1}, Landroid/database/Cursor;->close()V

    .line 964
    .line 965
    .line 966
    throw v0

    .line 967
    :cond_18
    new-instance v0, Ljava/lang/NullPointerException;

    .line 968
    .line 969
    const-string v1, "Null transportName"

    .line 970
    .line 971
    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 972
    .line 973
    .line 974
    throw v0

    .line 975
    :cond_19
    const/16 v16, 0x0

    .line 976
    .line 977
    return-object v16

    .line 978
    nop

    .line 979
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public b()Ljava/lang/Object;
    .locals 10

    .line 1
    iget-object v0, p0, LD0/b;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LD0/c;

    .line 4
    .line 5
    iget-object v1, p0, LD0/b;->f:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ly0/i;

    .line 8
    .line 9
    iget-object v2, p0, LD0/b;->h:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v2, Ly0/h;

    .line 12
    .line 13
    iget-object v3, v0, LD0/c;->d:LF0/d;

    .line 14
    .line 15
    check-cast v3, LF0/h;

    .line 16
    .line 17
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    iget-object v4, v1, Ly0/i;->c:Lv0/d;

    .line 21
    .line 22
    iget-object v5, v2, Ly0/h;->a:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v6, v1, Ly0/i;->a:Ljava/lang/String;

    .line 25
    .line 26
    const-string v7, "SQLiteEventStore"

    .line 27
    .line 28
    invoke-static {v7}, Landroid/support/v4/media/session/a;->s(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v7

    .line 32
    const/4 v8, 0x3

    .line 33
    invoke-static {v7, v8}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 34
    .line 35
    .line 36
    move-result v8

    .line 37
    if-eqz v8, :cond_0

    .line 38
    .line 39
    new-instance v8, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v9, "Storing event with priority="

    .line 42
    .line 43
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v4, ", name="

    .line 50
    .line 51
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v4, " for destination "

    .line 58
    .line 59
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-static {v7, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    :cond_0
    new-instance v4, LD0/b;

    .line 73
    .line 74
    const/4 v5, 0x2

    .line 75
    invoke-direct {v4, v3, v2, v1, v5}, LD0/b;-><init>(LF0/h;Ljava/lang/Object;Ly0/i;I)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v3, v4}, LF0/h;->c(LF0/f;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    check-cast v2, Ljava/lang/Long;

    .line 83
    .line 84
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 85
    .line 86
    .line 87
    iget-object v0, v0, LD0/c;->a:LE0/d;

    .line 88
    .line 89
    const/4 v2, 0x0

    .line 90
    const/4 v3, 0x1

    .line 91
    invoke-virtual {v0, v1, v3, v2}, LE0/d;->a(Ly0/i;IZ)V

    .line 92
    .line 93
    .line 94
    const/4 v0, 0x0

    .line 95
    return-object v0
.end method
