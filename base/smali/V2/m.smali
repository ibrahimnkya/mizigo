.class public LV2/m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lg3/b;
.implements Lk3/m;


# static fields
.field public static final g:Ljava/util/HashMap;

.field public static final h:Ljava/util/HashMap;

.field public static final i:Ljava/lang/Object;

.field public static final j:Ljava/lang/Object;

.field public static k:I

.field public static l:Ljava/lang/String;

.field public static m:I

.field public static n:I

.field public static o:I

.field public static p:LV2/h;


# instance fields
.field public e:Landroid/content/Context;

.field public f:Lk3/o;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LV2/m;->g:Ljava/util/HashMap;

    .line 7
    .line 8
    new-instance v0, Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, LV2/m;->h:Ljava/util/HashMap;

    .line 14
    .line 15
    new-instance v0, Ljava/lang/Object;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, LV2/m;->i:Ljava/lang/Object;

    .line 21
    .line 22
    new-instance v0, Ljava/lang/Object;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, LV2/m;->j:Ljava/lang/Object;

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    sput v0, LV2/m;->k:I

    .line 31
    .line 32
    sput v0, LV2/m;->m:I

    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    sput v1, LV2/m;->n:I

    .line 36
    .line 37
    sput v0, LV2/m;->o:I

    .line 38
    .line 39
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

.method public static a(LV2/m;LV2/e;)V
    .locals 4

    .line 1
    const/4 p0, 0x1

    .line 2
    :try_start_0
    iget v0, p1, LV2/e;->d:I

    .line 3
    .line 4
    if-lt v0, p0, :cond_0

    .line 5
    .line 6
    const-string v0, "Sqflite"

    .line 7
    .line 8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, LV2/e;->i()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v2, "closing database "

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catch_0
    move-exception v0

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    :goto_0
    invoke-virtual {p1}, LV2/e;->b()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    .line 38
    goto :goto_2

    .line 39
    :goto_1
    const-string v1, "Sqflite"

    .line 40
    .line 41
    new-instance v2, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v3, "error "

    .line 44
    .line 45
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v0, " while closing database "

    .line 52
    .line 53
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    sget v0, LV2/m;->o:I

    .line 57
    .line 58
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    :goto_2
    sget-object v0, LV2/m;->i:Ljava/lang/Object;

    .line 69
    .line 70
    monitor-enter v0

    .line 71
    :try_start_1
    sget-object v1, LV2/m;->h:Ljava/util/HashMap;

    .line 72
    .line 73
    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-eqz v1, :cond_2

    .line 78
    .line 79
    sget-object v1, LV2/m;->p:LV2/h;

    .line 80
    .line 81
    if-eqz v1, :cond_2

    .line 82
    .line 83
    iget v1, p1, LV2/e;->d:I

    .line 84
    .line 85
    if-lt v1, p0, :cond_1

    .line 86
    .line 87
    const-string p0, "Sqflite"

    .line 88
    .line 89
    new-instance v1, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1}, LV2/e;->i()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string p1, "stopping thread"

    .line 102
    .line 103
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    goto :goto_3

    .line 114
    :catchall_0
    move-exception p0

    .line 115
    goto :goto_4

    .line 116
    :cond_1
    :goto_3
    sget-object p0, LV2/m;->p:LV2/h;

    .line 117
    .line 118
    invoke-interface {p0}, LV2/h;->c()V

    .line 119
    .line 120
    .line 121
    const/4 p0, 0x0

    .line 122
    sput-object p0, LV2/m;->p:LV2/h;

    .line 123
    .line 124
    :cond_2
    monitor-exit v0

    .line 125
    return-void

    .line 126
    :goto_4
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 127
    throw p0
.end method

.method public static b(Lk3/l;LQ2/g;)LV2/e;
    .locals 2

    .line 1
    const-string v0, "id"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    sget-object v1, LV2/m;->h:Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, LV2/e;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v1, "database_closed "

    .line 27
    .line 28
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string v0, "sqlite_error"

    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    invoke-virtual {p1, v0, p0, v1}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    return-object v1
.end method

.method public static c(IZZ)Ljava/util/HashMap;
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "id"

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    const-string p0, "recovered"

    .line 18
    .line 19
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    :cond_0
    if-eqz p2, :cond_1

    .line 25
    .line 26
    const-string p0, "recoveredInTransaction"

    .line 27
    .line 28
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    :cond_1
    return-object v0
.end method


# virtual methods
.method public final onAttachedToEngine(Lg3/a;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lg3/a;->a:Landroid/content/Context;

    .line 2
    .line 3
    iget-object p1, p1, Lg3/a;->b:Lk3/f;

    .line 4
    .line 5
    iput-object v0, p0, LV2/m;->e:Landroid/content/Context;

    .line 6
    .line 7
    new-instance v0, Lk3/o;

    .line 8
    .line 9
    sget-object v1, Lk3/v;->a:Lk3/v;

    .line 10
    .line 11
    invoke-interface {p1}, Lk3/f;->e()LN1/e;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string v3, "com.tekartik.sqflite"

    .line 16
    .line 17
    invoke-direct {v0, p1, v3, v1, v2}, Lk3/o;-><init>(Lk3/f;Ljava/lang/String;Lk3/p;LN1/e;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, LV2/m;->f:Lk3/o;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Lk3/o;->b(Lk3/m;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final onDetachedFromEngine(Lg3/a;)V
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, LV2/m;->e:Landroid/content/Context;

    .line 3
    .line 4
    iget-object v0, p0, LV2/m;->f:Lk3/o;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lk3/o;->b(Lk3/m;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, LV2/m;->f:Lk3/o;

    .line 10
    .line 11
    return-void
.end method

.method public final onMethodCall(Lk3/l;Lk3/n;)V
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v8, p1

    .line 4
    .line 5
    iget-object v0, v8, Lk3/l;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    const/4 v3, 0x5

    .line 15
    const/4 v4, 0x4

    .line 16
    const/4 v5, 0x3

    .line 17
    const/4 v6, 0x2

    .line 18
    const/4 v7, 0x1

    .line 19
    const/4 v9, 0x0

    .line 20
    const/4 v10, -0x1

    .line 21
    sparse-switch v2, :sswitch_data_0

    .line 22
    .line 23
    .line 24
    goto/16 :goto_0

    .line 25
    .line 26
    :sswitch_0
    const-string v2, "getDatabasesPath"

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    goto/16 :goto_0

    .line 35
    .line 36
    :cond_0
    const/16 v10, 0xf

    .line 37
    .line 38
    goto/16 :goto_0

    .line 39
    .line 40
    :sswitch_1
    const-string v2, "getPlatformVersion"

    .line 41
    .line 42
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    goto/16 :goto_0

    .line 49
    .line 50
    :cond_1
    const/16 v10, 0xe

    .line 51
    .line 52
    goto/16 :goto_0

    .line 53
    .line 54
    :sswitch_2
    const-string v2, "queryCursorNext"

    .line 55
    .line 56
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-nez v0, :cond_2

    .line 61
    .line 62
    goto/16 :goto_0

    .line 63
    .line 64
    :cond_2
    const/16 v10, 0xd

    .line 65
    .line 66
    goto/16 :goto_0

    .line 67
    .line 68
    :sswitch_3
    const-string v2, "databaseExists"

    .line 69
    .line 70
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-nez v0, :cond_3

    .line 75
    .line 76
    goto/16 :goto_0

    .line 77
    .line 78
    :cond_3
    const/16 v10, 0xc

    .line 79
    .line 80
    goto/16 :goto_0

    .line 81
    .line 82
    :sswitch_4
    const-string v2, "query"

    .line 83
    .line 84
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-nez v0, :cond_4

    .line 89
    .line 90
    goto/16 :goto_0

    .line 91
    .line 92
    :cond_4
    const/16 v10, 0xb

    .line 93
    .line 94
    goto/16 :goto_0

    .line 95
    .line 96
    :sswitch_5
    const-string v2, "debug"

    .line 97
    .line 98
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-nez v0, :cond_5

    .line 103
    .line 104
    goto/16 :goto_0

    .line 105
    .line 106
    :cond_5
    const/16 v10, 0xa

    .line 107
    .line 108
    goto/16 :goto_0

    .line 109
    .line 110
    :sswitch_6
    const-string v2, "batch"

    .line 111
    .line 112
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-nez v0, :cond_6

    .line 117
    .line 118
    goto/16 :goto_0

    .line 119
    .line 120
    :cond_6
    const/16 v10, 0x9

    .line 121
    .line 122
    goto/16 :goto_0

    .line 123
    .line 124
    :sswitch_7
    const-string v2, "openDatabase"

    .line 125
    .line 126
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    if-nez v0, :cond_7

    .line 131
    .line 132
    goto/16 :goto_0

    .line 133
    .line 134
    :cond_7
    const/16 v10, 0x8

    .line 135
    .line 136
    goto/16 :goto_0

    .line 137
    .line 138
    :sswitch_8
    const-string v2, "debugMode"

    .line 139
    .line 140
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    if-nez v0, :cond_8

    .line 145
    .line 146
    goto/16 :goto_0

    .line 147
    .line 148
    :cond_8
    const/4 v10, 0x7

    .line 149
    goto :goto_0

    .line 150
    :sswitch_9
    const-string v2, "deleteDatabase"

    .line 151
    .line 152
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    if-nez v0, :cond_9

    .line 157
    .line 158
    goto :goto_0

    .line 159
    :cond_9
    const/4 v10, 0x6

    .line 160
    goto :goto_0

    .line 161
    :sswitch_a
    const-string v2, "androidSetLocale"

    .line 162
    .line 163
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    if-nez v0, :cond_a

    .line 168
    .line 169
    goto :goto_0

    .line 170
    :cond_a
    move v10, v3

    .line 171
    goto :goto_0

    .line 172
    :sswitch_b
    const-string v2, "update"

    .line 173
    .line 174
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    if-nez v0, :cond_b

    .line 179
    .line 180
    goto :goto_0

    .line 181
    :cond_b
    move v10, v4

    .line 182
    goto :goto_0

    .line 183
    :sswitch_c
    const-string v2, "insert"

    .line 184
    .line 185
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-nez v0, :cond_c

    .line 190
    .line 191
    goto :goto_0

    .line 192
    :cond_c
    move v10, v5

    .line 193
    goto :goto_0

    .line 194
    :sswitch_d
    const-string v2, "options"

    .line 195
    .line 196
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    if-nez v0, :cond_d

    .line 201
    .line 202
    goto :goto_0

    .line 203
    :cond_d
    move v10, v6

    .line 204
    goto :goto_0

    .line 205
    :sswitch_e
    const-string v2, "closeDatabase"

    .line 206
    .line 207
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    move-result v0

    .line 211
    if-nez v0, :cond_e

    .line 212
    .line 213
    goto :goto_0

    .line 214
    :cond_e
    move v10, v7

    .line 215
    goto :goto_0

    .line 216
    :sswitch_f
    const-string v2, "execute"

    .line 217
    .line 218
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    if-nez v0, :cond_f

    .line 223
    .line 224
    goto :goto_0

    .line 225
    :cond_f
    move v10, v9

    .line 226
    :goto_0
    const/4 v0, 0x0

    .line 227
    packed-switch v10, :pswitch_data_0

    .line 228
    .line 229
    .line 230
    move-object/from16 v0, p2

    .line 231
    .line 232
    check-cast v0, LQ2/g;

    .line 233
    .line 234
    invoke-virtual {v0}, LQ2/g;->b()V

    .line 235
    .line 236
    .line 237
    return-void

    .line 238
    :pswitch_0
    sget-object v0, LV2/m;->l:Ljava/lang/String;

    .line 239
    .line 240
    if-nez v0, :cond_10

    .line 241
    .line 242
    const-string v0, "tekartik_sqflite.db"

    .line 243
    .line 244
    iget-object v2, v1, LV2/m;->e:Landroid/content/Context;

    .line 245
    .line 246
    invoke-virtual {v2, v0}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    sput-object v0, LV2/m;->l:Ljava/lang/String;

    .line 255
    .line 256
    :cond_10
    sget-object v0, LV2/m;->l:Ljava/lang/String;

    .line 257
    .line 258
    move-object/from16 v2, p2

    .line 259
    .line 260
    check-cast v2, LQ2/g;

    .line 261
    .line 262
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 263
    .line 264
    .line 265
    return-void

    .line 266
    :pswitch_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 267
    .line 268
    const-string v2, "Android "

    .line 269
    .line 270
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    sget-object v2, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 274
    .line 275
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    move-object/from16 v2, p2

    .line 283
    .line 284
    check-cast v2, LQ2/g;

    .line 285
    .line 286
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 287
    .line 288
    .line 289
    return-void

    .line 290
    :pswitch_2
    move-object/from16 v0, p2

    .line 291
    .line 292
    check-cast v0, LQ2/g;

    .line 293
    .line 294
    invoke-static {v8, v0}, LV2/m;->b(Lk3/l;LQ2/g;)LV2/e;

    .line 295
    .line 296
    .line 297
    move-result-object v2

    .line 298
    if-nez v2, :cond_11

    .line 299
    .line 300
    goto/16 :goto_14

    .line 301
    .line 302
    :cond_11
    sget-object v3, LV2/m;->p:LV2/h;

    .line 303
    .line 304
    new-instance v4, LV2/j;

    .line 305
    .line 306
    invoke-direct {v4, v8, v0, v2, v9}, LV2/j;-><init>(Lk3/l;LQ2/g;LV2/e;I)V

    .line 307
    .line 308
    .line 309
    invoke-interface {v3, v2, v4}, LV2/h;->b(LV2/e;Ljava/lang/Runnable;)V

    .line 310
    .line 311
    .line 312
    return-void

    .line 313
    :pswitch_3
    const-string v0, "path"

    .line 314
    .line 315
    invoke-virtual {v8, v0}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 316
    .line 317
    .line 318
    move-result-object v0

    .line 319
    check-cast v0, Ljava/lang/String;

    .line 320
    .line 321
    :try_start_0
    new-instance v2, Ljava/io/File;

    .line 322
    .line 323
    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 324
    .line 325
    .line 326
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 327
    .line 328
    .line 329
    move-result v9
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 330
    :catch_0
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 331
    .line 332
    .line 333
    move-result-object v0

    .line 334
    move-object/from16 v2, p2

    .line 335
    .line 336
    check-cast v2, LQ2/g;

    .line 337
    .line 338
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 339
    .line 340
    .line 341
    return-void

    .line 342
    :pswitch_4
    move-object/from16 v0, p2

    .line 343
    .line 344
    check-cast v0, LQ2/g;

    .line 345
    .line 346
    invoke-static {v8, v0}, LV2/m;->b(Lk3/l;LQ2/g;)LV2/e;

    .line 347
    .line 348
    .line 349
    move-result-object v2

    .line 350
    if-nez v2, :cond_12

    .line 351
    .line 352
    goto/16 :goto_14

    .line 353
    .line 354
    :cond_12
    sget-object v3, LV2/m;->p:LV2/h;

    .line 355
    .line 356
    new-instance v4, LV2/j;

    .line 357
    .line 358
    invoke-direct {v4, v8, v0, v2, v6}, LV2/j;-><init>(Lk3/l;LQ2/g;LV2/e;I)V

    .line 359
    .line 360
    .line 361
    invoke-interface {v3, v2, v4}, LV2/h;->b(LV2/e;Ljava/lang/Runnable;)V

    .line 362
    .line 363
    .line 364
    return-void

    .line 365
    :pswitch_5
    const-string v0, "logLevel"

    .line 366
    .line 367
    const-string v2, "cmd"

    .line 368
    .line 369
    invoke-virtual {v8, v2}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 370
    .line 371
    .line 372
    move-result-object v2

    .line 373
    check-cast v2, Ljava/lang/String;

    .line 374
    .line 375
    new-instance v3, Ljava/util/HashMap;

    .line 376
    .line 377
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 378
    .line 379
    .line 380
    const-string v4, "get"

    .line 381
    .line 382
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 383
    .line 384
    .line 385
    move-result v2

    .line 386
    if-eqz v2, :cond_16

    .line 387
    .line 388
    sget v2, LV2/m;->k:I

    .line 389
    .line 390
    if-lez v2, :cond_13

    .line 391
    .line 392
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 393
    .line 394
    .line 395
    move-result-object v2

    .line 396
    invoke-virtual {v3, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 397
    .line 398
    .line 399
    :cond_13
    sget-object v2, LV2/m;->h:Ljava/util/HashMap;

    .line 400
    .line 401
    invoke-virtual {v2}, Ljava/util/HashMap;->isEmpty()Z

    .line 402
    .line 403
    .line 404
    move-result v4

    .line 405
    if-nez v4, :cond_16

    .line 406
    .line 407
    new-instance v4, Ljava/util/HashMap;

    .line 408
    .line 409
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 410
    .line 411
    .line 412
    invoke-virtual {v2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 413
    .line 414
    .line 415
    move-result-object v2

    .line 416
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 417
    .line 418
    .line 419
    move-result-object v2

    .line 420
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 421
    .line 422
    .line 423
    move-result v5

    .line 424
    if-eqz v5, :cond_15

    .line 425
    .line 426
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 427
    .line 428
    .line 429
    move-result-object v5

    .line 430
    check-cast v5, Ljava/util/Map$Entry;

    .line 431
    .line 432
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 433
    .line 434
    .line 435
    move-result-object v6

    .line 436
    check-cast v6, LV2/e;

    .line 437
    .line 438
    new-instance v7, Ljava/util/HashMap;

    .line 439
    .line 440
    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 441
    .line 442
    .line 443
    const-string v8, "path"

    .line 444
    .line 445
    iget-object v9, v6, LV2/e;->b:Ljava/lang/String;

    .line 446
    .line 447
    invoke-virtual {v7, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 448
    .line 449
    .line 450
    const-string v8, "singleInstance"

    .line 451
    .line 452
    iget-boolean v9, v6, LV2/e;->a:Z

    .line 453
    .line 454
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 455
    .line 456
    .line 457
    move-result-object v9

    .line 458
    invoke-virtual {v7, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 459
    .line 460
    .line 461
    iget v6, v6, LV2/e;->d:I

    .line 462
    .line 463
    if-lez v6, :cond_14

    .line 464
    .line 465
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 466
    .line 467
    .line 468
    move-result-object v6

    .line 469
    invoke-virtual {v7, v0, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 470
    .line 471
    .line 472
    :cond_14
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 473
    .line 474
    .line 475
    move-result-object v5

    .line 476
    check-cast v5, Ljava/lang/Integer;

    .line 477
    .line 478
    invoke-virtual {v5}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    .line 479
    .line 480
    .line 481
    move-result-object v5

    .line 482
    invoke-virtual {v4, v5, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 483
    .line 484
    .line 485
    goto :goto_1

    .line 486
    :cond_15
    const-string v0, "databases"

    .line 487
    .line 488
    invoke-virtual {v3, v0, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 489
    .line 490
    .line 491
    :cond_16
    move-object/from16 v0, p2

    .line 492
    .line 493
    check-cast v0, LQ2/g;

    .line 494
    .line 495
    invoke-virtual {v0, v3}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 496
    .line 497
    .line 498
    return-void

    .line 499
    :pswitch_6
    move-object/from16 v0, p2

    .line 500
    .line 501
    check-cast v0, LQ2/g;

    .line 502
    .line 503
    invoke-static {v8, v0}, LV2/m;->b(Lk3/l;LQ2/g;)LV2/e;

    .line 504
    .line 505
    .line 506
    move-result-object v2

    .line 507
    if-nez v2, :cond_17

    .line 508
    .line 509
    goto/16 :goto_14

    .line 510
    .line 511
    :cond_17
    sget-object v3, LV2/m;->p:LV2/h;

    .line 512
    .line 513
    new-instance v4, LV2/j;

    .line 514
    .line 515
    invoke-direct {v4, v2, v8, v0}, LV2/j;-><init>(LV2/e;Lk3/l;LQ2/g;)V

    .line 516
    .line 517
    .line 518
    invoke-interface {v3, v2, v4}, LV2/h;->b(LV2/e;Ljava/lang/Runnable;)V

    .line 519
    .line 520
    .line 521
    return-void

    .line 522
    :pswitch_7
    const-string v0, "Look for "

    .line 523
    .line 524
    const-string v2, "path"

    .line 525
    .line 526
    invoke-virtual {v8, v2}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 527
    .line 528
    .line 529
    move-result-object v2

    .line 530
    move-object v4, v2

    .line 531
    check-cast v4, Ljava/lang/String;

    .line 532
    .line 533
    const-string v2, "readOnly"

    .line 534
    .line 535
    invoke-virtual {v8, v2}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 536
    .line 537
    .line 538
    move-result-object v2

    .line 539
    move-object v6, v2

    .line 540
    check-cast v6, Ljava/lang/Boolean;

    .line 541
    .line 542
    if-eqz v4, :cond_19

    .line 543
    .line 544
    const-string v2, ":memory:"

    .line 545
    .line 546
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 547
    .line 548
    .line 549
    move-result v2

    .line 550
    if-eqz v2, :cond_18

    .line 551
    .line 552
    goto :goto_2

    .line 553
    :cond_18
    move v3, v9

    .line 554
    goto :goto_3

    .line 555
    :cond_19
    :goto_2
    move v3, v7

    .line 556
    :goto_3
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 557
    .line 558
    const-string v5, "singleInstance"

    .line 559
    .line 560
    invoke-virtual {v8, v5}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 561
    .line 562
    .line 563
    move-result-object v5

    .line 564
    invoke-virtual {v2, v5}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 565
    .line 566
    .line 567
    move-result v2

    .line 568
    if-nez v2, :cond_1a

    .line 569
    .line 570
    if-nez v3, :cond_1a

    .line 571
    .line 572
    move v14, v7

    .line 573
    goto :goto_4

    .line 574
    :cond_1a
    move v14, v9

    .line 575
    :goto_4
    if-eqz v14, :cond_20

    .line 576
    .line 577
    sget-object v2, LV2/m;->i:Ljava/lang/Object;

    .line 578
    .line 579
    monitor-enter v2

    .line 580
    :try_start_1
    sget v5, LV2/m;->k:I

    .line 581
    .line 582
    invoke-static {v5}, LV2/a;->a(I)Z

    .line 583
    .line 584
    .line 585
    move-result v5

    .line 586
    if-eqz v5, :cond_1b

    .line 587
    .line 588
    const-string v5, "Sqflite"

    .line 589
    .line 590
    new-instance v9, Ljava/lang/StringBuilder;

    .line 591
    .line 592
    invoke-direct {v9, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 593
    .line 594
    .line 595
    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 596
    .line 597
    .line 598
    const-string v0, " in "

    .line 599
    .line 600
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 601
    .line 602
    .line 603
    sget-object v0, LV2/m;->g:Ljava/util/HashMap;

    .line 604
    .line 605
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 606
    .line 607
    .line 608
    move-result-object v0

    .line 609
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 610
    .line 611
    .line 612
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 613
    .line 614
    .line 615
    move-result-object v0

    .line 616
    invoke-static {v5, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 617
    .line 618
    .line 619
    goto :goto_5

    .line 620
    :catchall_0
    move-exception v0

    .line 621
    goto/16 :goto_8

    .line 622
    .line 623
    :cond_1b
    :goto_5
    sget-object v0, LV2/m;->g:Ljava/util/HashMap;

    .line 624
    .line 625
    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 626
    .line 627
    .line 628
    move-result-object v0

    .line 629
    check-cast v0, Ljava/lang/Integer;

    .line 630
    .line 631
    if-eqz v0, :cond_1f

    .line 632
    .line 633
    sget-object v5, LV2/m;->h:Ljava/util/HashMap;

    .line 634
    .line 635
    invoke-virtual {v5, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 636
    .line 637
    .line 638
    move-result-object v5

    .line 639
    check-cast v5, LV2/e;

    .line 640
    .line 641
    if-eqz v5, :cond_1f

    .line 642
    .line 643
    iget-object v9, v5, LV2/e;->i:Landroid/database/sqlite/SQLiteDatabase;

    .line 644
    .line 645
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    .line 646
    .line 647
    .line 648
    move-result v9

    .line 649
    if-nez v9, :cond_1c

    .line 650
    .line 651
    sget v0, LV2/m;->k:I

    .line 652
    .line 653
    invoke-static {v0}, LV2/a;->a(I)Z

    .line 654
    .line 655
    .line 656
    move-result v0

    .line 657
    if-eqz v0, :cond_1f

    .line 658
    .line 659
    const-string v0, "Sqflite"

    .line 660
    .line 661
    new-instance v9, Ljava/lang/StringBuilder;

    .line 662
    .line 663
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 664
    .line 665
    .line 666
    invoke-virtual {v5}, LV2/e;->i()Ljava/lang/String;

    .line 667
    .line 668
    .line 669
    move-result-object v5

    .line 670
    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 671
    .line 672
    .line 673
    const-string v5, "single instance database of "

    .line 674
    .line 675
    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 676
    .line 677
    .line 678
    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 679
    .line 680
    .line 681
    const-string v5, " not opened"

    .line 682
    .line 683
    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 684
    .line 685
    .line 686
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 687
    .line 688
    .line 689
    move-result-object v5

    .line 690
    invoke-static {v0, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 691
    .line 692
    .line 693
    goto :goto_7

    .line 694
    :cond_1c
    sget v3, LV2/m;->k:I

    .line 695
    .line 696
    invoke-static {v3}, LV2/a;->a(I)Z

    .line 697
    .line 698
    .line 699
    move-result v3

    .line 700
    if-eqz v3, :cond_1e

    .line 701
    .line 702
    const-string v3, "Sqflite"

    .line 703
    .line 704
    new-instance v6, Ljava/lang/StringBuilder;

    .line 705
    .line 706
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 707
    .line 708
    .line 709
    invoke-virtual {v5}, LV2/e;->i()Ljava/lang/String;

    .line 710
    .line 711
    .line 712
    move-result-object v8

    .line 713
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 714
    .line 715
    .line 716
    const-string v8, "re-opened single instance "

    .line 717
    .line 718
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 719
    .line 720
    .line 721
    invoke-virtual {v5}, LV2/e;->k()Z

    .line 722
    .line 723
    .line 724
    move-result v8

    .line 725
    if-eqz v8, :cond_1d

    .line 726
    .line 727
    const-string v8, "(in transaction) "

    .line 728
    .line 729
    goto :goto_6

    .line 730
    :cond_1d
    const-string v8, ""

    .line 731
    .line 732
    :goto_6
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 733
    .line 734
    .line 735
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 736
    .line 737
    .line 738
    const-string v8, " "

    .line 739
    .line 740
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 741
    .line 742
    .line 743
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 744
    .line 745
    .line 746
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 747
    .line 748
    .line 749
    move-result-object v4

    .line 750
    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 751
    .line 752
    .line 753
    :cond_1e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 754
    .line 755
    .line 756
    move-result v0

    .line 757
    invoke-virtual {v5}, LV2/e;->k()Z

    .line 758
    .line 759
    .line 760
    move-result v3

    .line 761
    invoke-static {v0, v7, v3}, LV2/m;->c(IZZ)Ljava/util/HashMap;

    .line 762
    .line 763
    .line 764
    move-result-object v0

    .line 765
    move-object/from16 v3, p2

    .line 766
    .line 767
    check-cast v3, LQ2/g;

    .line 768
    .line 769
    invoke-virtual {v3, v0}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 770
    .line 771
    .line 772
    monitor-exit v2

    .line 773
    return-void

    .line 774
    :cond_1f
    :goto_7
    monitor-exit v2

    .line 775
    goto :goto_9

    .line 776
    :goto_8
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 777
    throw v0

    .line 778
    :cond_20
    :goto_9
    sget-object v16, LV2/m;->i:Ljava/lang/Object;

    .line 779
    .line 780
    monitor-enter v16

    .line 781
    :try_start_2
    sget v0, LV2/m;->o:I

    .line 782
    .line 783
    add-int/lit8 v13, v0, 0x1

    .line 784
    .line 785
    sput v13, LV2/m;->o:I

    .line 786
    .line 787
    monitor-exit v16
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 788
    new-instance v10, LV2/e;

    .line 789
    .line 790
    iget-object v11, v1, LV2/m;->e:Landroid/content/Context;

    .line 791
    .line 792
    sget v15, LV2/m;->k:I

    .line 793
    .line 794
    move-object v12, v4

    .line 795
    invoke-direct/range {v10 .. v15}, LV2/e;-><init>(Landroid/content/Context;Ljava/lang/String;IZI)V

    .line 796
    .line 797
    .line 798
    monitor-enter v16

    .line 799
    :try_start_3
    sget-object v0, LV2/m;->p:LV2/h;

    .line 800
    .line 801
    if-nez v0, :cond_22

    .line 802
    .line 803
    sget v0, LV2/m;->n:I

    .line 804
    .line 805
    sget v2, LV2/m;->m:I

    .line 806
    .line 807
    if-ne v0, v7, :cond_21

    .line 808
    .line 809
    new-instance v0, LM2/b;

    .line 810
    .line 811
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 812
    .line 813
    .line 814
    iput v2, v0, LM2/b;->a:I

    .line 815
    .line 816
    goto :goto_a

    .line 817
    :cond_21
    new-instance v5, LD1/b;

    .line 818
    .line 819
    invoke-direct {v5, v0, v2}, LD1/b;-><init>(II)V

    .line 820
    .line 821
    .line 822
    move-object v0, v5

    .line 823
    :goto_a
    sput-object v0, LV2/m;->p:LV2/h;

    .line 824
    .line 825
    invoke-interface {v0}, LV2/h;->start()V

    .line 826
    .line 827
    .line 828
    iget v0, v10, LV2/e;->d:I

    .line 829
    .line 830
    if-lt v0, v7, :cond_22

    .line 831
    .line 832
    const-string v0, "Sqflite"

    .line 833
    .line 834
    new-instance v2, Ljava/lang/StringBuilder;

    .line 835
    .line 836
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 837
    .line 838
    .line 839
    invoke-virtual {v10}, LV2/e;->i()Ljava/lang/String;

    .line 840
    .line 841
    .line 842
    move-result-object v5

    .line 843
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 844
    .line 845
    .line 846
    const-string v5, "starting worker pool with priority "

    .line 847
    .line 848
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 849
    .line 850
    .line 851
    sget v5, LV2/m;->m:I

    .line 852
    .line 853
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 854
    .line 855
    .line 856
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 857
    .line 858
    .line 859
    move-result-object v2

    .line 860
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 861
    .line 862
    .line 863
    goto :goto_b

    .line 864
    :catchall_1
    move-exception v0

    .line 865
    goto :goto_c

    .line 866
    :cond_22
    :goto_b
    sget-object v0, LV2/m;->p:LV2/h;

    .line 867
    .line 868
    iput-object v0, v10, LV2/e;->h:LV2/h;

    .line 869
    .line 870
    iget v0, v10, LV2/e;->d:I

    .line 871
    .line 872
    if-lt v0, v7, :cond_23

    .line 873
    .line 874
    const-string v0, "Sqflite"

    .line 875
    .line 876
    new-instance v2, Ljava/lang/StringBuilder;

    .line 877
    .line 878
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 879
    .line 880
    .line 881
    invoke-virtual {v10}, LV2/e;->i()Ljava/lang/String;

    .line 882
    .line 883
    .line 884
    move-result-object v5

    .line 885
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 886
    .line 887
    .line 888
    const-string v5, "opened "

    .line 889
    .line 890
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 891
    .line 892
    .line 893
    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 894
    .line 895
    .line 896
    const-string v5, " "

    .line 897
    .line 898
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 899
    .line 900
    .line 901
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 902
    .line 903
    .line 904
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 905
    .line 906
    .line 907
    move-result-object v2

    .line 908
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 909
    .line 910
    .line 911
    :cond_23
    sget-object v0, LV2/m;->p:LV2/h;

    .line 912
    .line 913
    new-instance v2, LV2/k;

    .line 914
    .line 915
    move-object/from16 v5, p2

    .line 916
    .line 917
    check-cast v5, LQ2/g;

    .line 918
    .line 919
    move-object v7, v10

    .line 920
    move v10, v13

    .line 921
    move v9, v14

    .line 922
    invoke-direct/range {v2 .. v10}, LV2/k;-><init>(ZLjava/lang/String;LQ2/g;Ljava/lang/Boolean;LV2/e;Lk3/l;ZI)V

    .line 923
    .line 924
    .line 925
    move-object v10, v7

    .line 926
    invoke-interface {v0, v10, v2}, LV2/h;->b(LV2/e;Ljava/lang/Runnable;)V

    .line 927
    .line 928
    .line 929
    monitor-exit v16

    .line 930
    return-void

    .line 931
    :goto_c
    monitor-exit v16
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 932
    throw v0

    .line 933
    :catchall_2
    move-exception v0

    .line 934
    :try_start_4
    monitor-exit v16
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 935
    throw v0

    .line 936
    :pswitch_8
    iget-object v2, v8, Lk3/l;->b:Ljava/lang/Object;

    .line 937
    .line 938
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 939
    .line 940
    invoke-virtual {v3, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 941
    .line 942
    .line 943
    move-result v2

    .line 944
    if-eqz v2, :cond_24

    .line 945
    .line 946
    if-eqz v2, :cond_25

    .line 947
    .line 948
    sput v7, LV2/m;->k:I

    .line 949
    .line 950
    goto :goto_d

    .line 951
    :cond_24
    sput v9, LV2/m;->k:I

    .line 952
    .line 953
    :cond_25
    :goto_d
    move-object/from16 v2, p2

    .line 954
    .line 955
    check-cast v2, LQ2/g;

    .line 956
    .line 957
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 958
    .line 959
    .line 960
    return-void

    .line 961
    :pswitch_9
    const-string v2, "Look for "

    .line 962
    .line 963
    const-string v3, "path"

    .line 964
    .line 965
    invoke-virtual {v8, v3}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 966
    .line 967
    .line 968
    move-result-object v3

    .line 969
    check-cast v3, Ljava/lang/String;

    .line 970
    .line 971
    sget-object v4, LV2/m;->i:Ljava/lang/Object;

    .line 972
    .line 973
    monitor-enter v4

    .line 974
    :try_start_5
    sget v5, LV2/m;->k:I

    .line 975
    .line 976
    invoke-static {v5}, LV2/a;->a(I)Z

    .line 977
    .line 978
    .line 979
    move-result v5

    .line 980
    if-eqz v5, :cond_26

    .line 981
    .line 982
    const-string v5, "Sqflite"

    .line 983
    .line 984
    new-instance v6, Ljava/lang/StringBuilder;

    .line 985
    .line 986
    invoke-direct {v6, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 987
    .line 988
    .line 989
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 990
    .line 991
    .line 992
    const-string v2, " in "

    .line 993
    .line 994
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 995
    .line 996
    .line 997
    sget-object v2, LV2/m;->g:Ljava/util/HashMap;

    .line 998
    .line 999
    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 1000
    .line 1001
    .line 1002
    move-result-object v2

    .line 1003
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1004
    .line 1005
    .line 1006
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1007
    .line 1008
    .line 1009
    move-result-object v2

    .line 1010
    invoke-static {v5, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1011
    .line 1012
    .line 1013
    goto :goto_e

    .line 1014
    :catchall_3
    move-exception v0

    .line 1015
    goto/16 :goto_11

    .line 1016
    .line 1017
    :cond_26
    :goto_e
    sget-object v2, LV2/m;->g:Ljava/util/HashMap;

    .line 1018
    .line 1019
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1020
    .line 1021
    .line 1022
    move-result-object v5

    .line 1023
    check-cast v5, Ljava/lang/Integer;

    .line 1024
    .line 1025
    if-eqz v5, :cond_29

    .line 1026
    .line 1027
    sget-object v6, LV2/m;->h:Ljava/util/HashMap;

    .line 1028
    .line 1029
    invoke-virtual {v6, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1030
    .line 1031
    .line 1032
    move-result-object v7

    .line 1033
    check-cast v7, LV2/e;

    .line 1034
    .line 1035
    if-eqz v7, :cond_29

    .line 1036
    .line 1037
    iget-object v8, v7, LV2/e;->i:Landroid/database/sqlite/SQLiteDatabase;

    .line 1038
    .line 1039
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    .line 1040
    .line 1041
    .line 1042
    move-result v8

    .line 1043
    if-eqz v8, :cond_29

    .line 1044
    .line 1045
    sget v0, LV2/m;->k:I

    .line 1046
    .line 1047
    invoke-static {v0}, LV2/a;->a(I)Z

    .line 1048
    .line 1049
    .line 1050
    move-result v0

    .line 1051
    if-eqz v0, :cond_28

    .line 1052
    .line 1053
    const-string v0, "Sqflite"

    .line 1054
    .line 1055
    new-instance v8, Ljava/lang/StringBuilder;

    .line 1056
    .line 1057
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 1058
    .line 1059
    .line 1060
    invoke-virtual {v7}, LV2/e;->i()Ljava/lang/String;

    .line 1061
    .line 1062
    .line 1063
    move-result-object v9

    .line 1064
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1065
    .line 1066
    .line 1067
    const-string v9, "found single instance "

    .line 1068
    .line 1069
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1070
    .line 1071
    .line 1072
    invoke-virtual {v7}, LV2/e;->k()Z

    .line 1073
    .line 1074
    .line 1075
    move-result v9

    .line 1076
    if-eqz v9, :cond_27

    .line 1077
    .line 1078
    const-string v9, "(in transaction) "

    .line 1079
    .line 1080
    goto :goto_f

    .line 1081
    :cond_27
    const-string v9, ""

    .line 1082
    .line 1083
    :goto_f
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1084
    .line 1085
    .line 1086
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1087
    .line 1088
    .line 1089
    const-string v9, " "

    .line 1090
    .line 1091
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1092
    .line 1093
    .line 1094
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1095
    .line 1096
    .line 1097
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1098
    .line 1099
    .line 1100
    move-result-object v8

    .line 1101
    invoke-static {v0, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1102
    .line 1103
    .line 1104
    :cond_28
    invoke-virtual {v6, v5}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1105
    .line 1106
    .line 1107
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1108
    .line 1109
    .line 1110
    move-object v2, v7

    .line 1111
    goto :goto_10

    .line 1112
    :cond_29
    move-object v2, v0

    .line 1113
    :goto_10
    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 1114
    new-instance v0, LV2/l;

    .line 1115
    .line 1116
    move-object/from16 v4, p2

    .line 1117
    .line 1118
    check-cast v4, LQ2/g;

    .line 1119
    .line 1120
    const/4 v5, 0x0

    .line 1121
    invoke-direct/range {v0 .. v5}, LV2/l;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 1122
    .line 1123
    .line 1124
    sget-object v3, LV2/m;->p:LV2/h;

    .line 1125
    .line 1126
    if-eqz v3, :cond_2a

    .line 1127
    .line 1128
    invoke-interface {v3, v2, v0}, LV2/h;->b(LV2/e;Ljava/lang/Runnable;)V

    .line 1129
    .line 1130
    .line 1131
    return-void

    .line 1132
    :cond_2a
    invoke-virtual {v0}, LV2/l;->run()V

    .line 1133
    .line 1134
    .line 1135
    return-void

    .line 1136
    :goto_11
    :try_start_6
    monitor-exit v4
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 1137
    throw v0

    .line 1138
    :pswitch_a
    move-object/from16 v0, p2

    .line 1139
    .line 1140
    check-cast v0, LQ2/g;

    .line 1141
    .line 1142
    invoke-static {v8, v0}, LV2/m;->b(Lk3/l;LQ2/g;)LV2/e;

    .line 1143
    .line 1144
    .line 1145
    move-result-object v2

    .line 1146
    if-nez v2, :cond_2b

    .line 1147
    .line 1148
    goto/16 :goto_14

    .line 1149
    .line 1150
    :cond_2b
    sget-object v3, LV2/m;->p:LV2/h;

    .line 1151
    .line 1152
    new-instance v4, LV2/j;

    .line 1153
    .line 1154
    invoke-direct {v4, v8, v2, v0}, LV2/j;-><init>(Lk3/l;LV2/e;LQ2/g;)V

    .line 1155
    .line 1156
    .line 1157
    invoke-interface {v3, v2, v4}, LV2/h;->b(LV2/e;Ljava/lang/Runnable;)V

    .line 1158
    .line 1159
    .line 1160
    return-void

    .line 1161
    :pswitch_b
    move-object/from16 v0, p2

    .line 1162
    .line 1163
    check-cast v0, LQ2/g;

    .line 1164
    .line 1165
    invoke-static {v8, v0}, LV2/m;->b(Lk3/l;LQ2/g;)LV2/e;

    .line 1166
    .line 1167
    .line 1168
    move-result-object v2

    .line 1169
    if-nez v2, :cond_2c

    .line 1170
    .line 1171
    goto/16 :goto_14

    .line 1172
    .line 1173
    :cond_2c
    sget-object v4, LV2/m;->p:LV2/h;

    .line 1174
    .line 1175
    new-instance v5, LV2/j;

    .line 1176
    .line 1177
    invoke-direct {v5, v8, v0, v2, v3}, LV2/j;-><init>(Lk3/l;LQ2/g;LV2/e;I)V

    .line 1178
    .line 1179
    .line 1180
    invoke-interface {v4, v2, v5}, LV2/h;->b(LV2/e;Ljava/lang/Runnable;)V

    .line 1181
    .line 1182
    .line 1183
    return-void

    .line 1184
    :pswitch_c
    move-object/from16 v0, p2

    .line 1185
    .line 1186
    check-cast v0, LQ2/g;

    .line 1187
    .line 1188
    invoke-static {v8, v0}, LV2/m;->b(Lk3/l;LQ2/g;)LV2/e;

    .line 1189
    .line 1190
    .line 1191
    move-result-object v2

    .line 1192
    if-nez v2, :cond_2d

    .line 1193
    .line 1194
    goto/16 :goto_14

    .line 1195
    .line 1196
    :cond_2d
    sget-object v3, LV2/m;->p:LV2/h;

    .line 1197
    .line 1198
    new-instance v4, LV2/j;

    .line 1199
    .line 1200
    invoke-direct {v4, v8, v0, v2, v7}, LV2/j;-><init>(Lk3/l;LQ2/g;LV2/e;I)V

    .line 1201
    .line 1202
    .line 1203
    invoke-interface {v3, v2, v4}, LV2/h;->b(LV2/e;Ljava/lang/Runnable;)V

    .line 1204
    .line 1205
    .line 1206
    return-void

    .line 1207
    :pswitch_d
    const-string v2, "androidThreadPriority"

    .line 1208
    .line 1209
    invoke-virtual {v8, v2}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 1210
    .line 1211
    .line 1212
    move-result-object v2

    .line 1213
    if-eqz v2, :cond_2e

    .line 1214
    .line 1215
    check-cast v2, Ljava/lang/Integer;

    .line 1216
    .line 1217
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 1218
    .line 1219
    .line 1220
    move-result v2

    .line 1221
    sput v2, LV2/m;->m:I

    .line 1222
    .line 1223
    :cond_2e
    const-string v2, "androidThreadCount"

    .line 1224
    .line 1225
    invoke-virtual {v8, v2}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 1226
    .line 1227
    .line 1228
    move-result-object v2

    .line 1229
    if-eqz v2, :cond_2f

    .line 1230
    .line 1231
    sget v3, LV2/m;->n:I

    .line 1232
    .line 1233
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1234
    .line 1235
    .line 1236
    move-result-object v3

    .line 1237
    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 1238
    .line 1239
    .line 1240
    move-result v3

    .line 1241
    if-nez v3, :cond_2f

    .line 1242
    .line 1243
    check-cast v2, Ljava/lang/Integer;

    .line 1244
    .line 1245
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 1246
    .line 1247
    .line 1248
    move-result v2

    .line 1249
    sput v2, LV2/m;->n:I

    .line 1250
    .line 1251
    sget-object v2, LV2/m;->p:LV2/h;

    .line 1252
    .line 1253
    if-eqz v2, :cond_2f

    .line 1254
    .line 1255
    invoke-interface {v2}, LV2/h;->c()V

    .line 1256
    .line 1257
    .line 1258
    sput-object v0, LV2/m;->p:LV2/h;

    .line 1259
    .line 1260
    :cond_2f
    const-string v2, "logLevel"

    .line 1261
    .line 1262
    invoke-virtual {v8, v2}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 1263
    .line 1264
    .line 1265
    move-result-object v2

    .line 1266
    check-cast v2, Ljava/lang/Integer;

    .line 1267
    .line 1268
    if-eqz v2, :cond_30

    .line 1269
    .line 1270
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 1271
    .line 1272
    .line 1273
    move-result v2

    .line 1274
    sput v2, LV2/m;->k:I

    .line 1275
    .line 1276
    :cond_30
    move-object/from16 v2, p2

    .line 1277
    .line 1278
    check-cast v2, LQ2/g;

    .line 1279
    .line 1280
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 1281
    .line 1282
    .line 1283
    return-void

    .line 1284
    :pswitch_e
    const-string v0, "id"

    .line 1285
    .line 1286
    invoke-virtual {v8, v0}, Lk3/l;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 1287
    .line 1288
    .line 1289
    move-result-object v0

    .line 1290
    check-cast v0, Ljava/lang/Integer;

    .line 1291
    .line 1292
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 1293
    .line 1294
    .line 1295
    move-result v2

    .line 1296
    move-object/from16 v3, p2

    .line 1297
    .line 1298
    check-cast v3, LQ2/g;

    .line 1299
    .line 1300
    invoke-static {v8, v3}, LV2/m;->b(Lk3/l;LQ2/g;)LV2/e;

    .line 1301
    .line 1302
    .line 1303
    move-result-object v4

    .line 1304
    if-nez v4, :cond_31

    .line 1305
    .line 1306
    goto :goto_14

    .line 1307
    :cond_31
    iget v6, v4, LV2/e;->d:I

    .line 1308
    .line 1309
    if-lt v6, v7, :cond_32

    .line 1310
    .line 1311
    const-string v6, "Sqflite"

    .line 1312
    .line 1313
    new-instance v7, Ljava/lang/StringBuilder;

    .line 1314
    .line 1315
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 1316
    .line 1317
    .line 1318
    invoke-virtual {v4}, LV2/e;->i()Ljava/lang/String;

    .line 1319
    .line 1320
    .line 1321
    move-result-object v8

    .line 1322
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1323
    .line 1324
    .line 1325
    const-string v8, "closing "

    .line 1326
    .line 1327
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1328
    .line 1329
    .line 1330
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1331
    .line 1332
    .line 1333
    const-string v2, " "

    .line 1334
    .line 1335
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1336
    .line 1337
    .line 1338
    iget-object v2, v4, LV2/e;->b:Ljava/lang/String;

    .line 1339
    .line 1340
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1341
    .line 1342
    .line 1343
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1344
    .line 1345
    .line 1346
    move-result-object v2

    .line 1347
    invoke-static {v6, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1348
    .line 1349
    .line 1350
    :cond_32
    iget-object v2, v4, LV2/e;->b:Ljava/lang/String;

    .line 1351
    .line 1352
    sget-object v6, LV2/m;->i:Ljava/lang/Object;

    .line 1353
    .line 1354
    monitor-enter v6

    .line 1355
    :try_start_7
    sget-object v7, LV2/m;->h:Ljava/util/HashMap;

    .line 1356
    .line 1357
    invoke-virtual {v7, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1358
    .line 1359
    .line 1360
    iget-boolean v0, v4, LV2/e;->a:Z

    .line 1361
    .line 1362
    if-eqz v0, :cond_33

    .line 1363
    .line 1364
    sget-object v0, LV2/m;->g:Ljava/util/HashMap;

    .line 1365
    .line 1366
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1367
    .line 1368
    .line 1369
    goto :goto_12

    .line 1370
    :catchall_4
    move-exception v0

    .line 1371
    goto :goto_13

    .line 1372
    :cond_33
    :goto_12
    monitor-exit v6
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 1373
    sget-object v0, LV2/m;->p:LV2/h;

    .line 1374
    .line 1375
    new-instance v2, LA/q;

    .line 1376
    .line 1377
    invoke-direct {v2, v1, v4, v3, v5}, LA/q;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lk3/n;I)V

    .line 1378
    .line 1379
    .line 1380
    invoke-interface {v0, v4, v2}, LV2/h;->b(LV2/e;Ljava/lang/Runnable;)V

    .line 1381
    .line 1382
    .line 1383
    return-void

    .line 1384
    :goto_13
    :try_start_8
    monitor-exit v6
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 1385
    throw v0

    .line 1386
    :pswitch_f
    move-object/from16 v0, p2

    .line 1387
    .line 1388
    check-cast v0, LQ2/g;

    .line 1389
    .line 1390
    invoke-static {v8, v0}, LV2/m;->b(Lk3/l;LQ2/g;)LV2/e;

    .line 1391
    .line 1392
    .line 1393
    move-result-object v2

    .line 1394
    if-nez v2, :cond_34

    .line 1395
    .line 1396
    :goto_14
    return-void

    .line 1397
    :cond_34
    sget-object v3, LV2/m;->p:LV2/h;

    .line 1398
    .line 1399
    new-instance v5, LV2/j;

    .line 1400
    .line 1401
    invoke-direct {v5, v8, v0, v2, v4}, LV2/j;-><init>(Lk3/l;LQ2/g;LV2/e;I)V

    .line 1402
    .line 1403
    .line 1404
    invoke-interface {v3, v2, v5}, LV2/h;->b(LV2/e;Ljava/lang/Runnable;)V

    .line 1405
    .line 1406
    .line 1407
    return-void

    .line 1408
    nop

    .line 1409
    :sswitch_data_0
    .sparse-switch
        -0x4ea7088b -> :sswitch_f
        -0x4ab8246d -> :sswitch_e
        -0x4a797962 -> :sswitch_d
        -0x468f3d47 -> :sswitch_c
        -0x31ffc737 -> :sswitch_b
        -0x179ee453 -> :sswitch_a
        -0xfb4dfba -> :sswitch_9
        -0xbd41d6a -> :sswitch_8
        -0x1064e1b -> :sswitch_7
        0x592d73a -> :sswitch_6
        0x5b09653 -> :sswitch_5
        0x66f18c8 -> :sswitch_4
        0x3901a9b7 -> :sswitch_3
        0x47241251 -> :sswitch_2
        0x529446af -> :sswitch_1
        0x6f17c6e7 -> :sswitch_0
    .end sparse-switch

    .line 1410
    .line 1411
    .line 1412
    .line 1413
    .line 1414
    .line 1415
    .line 1416
    .line 1417
    .line 1418
    .line 1419
    .line 1420
    .line 1421
    .line 1422
    .line 1423
    .line 1424
    .line 1425
    .line 1426
    .line 1427
    .line 1428
    .line 1429
    .line 1430
    .line 1431
    .line 1432
    .line 1433
    .line 1434
    .line 1435
    .line 1436
    .line 1437
    .line 1438
    .line 1439
    .line 1440
    .line 1441
    .line 1442
    .line 1443
    .line 1444
    .line 1445
    .line 1446
    .line 1447
    .line 1448
    .line 1449
    .line 1450
    .line 1451
    .line 1452
    .line 1453
    .line 1454
    .line 1455
    .line 1456
    .line 1457
    .line 1458
    .line 1459
    .line 1460
    .line 1461
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
    .line 1472
    .line 1473
    .line 1474
    .line 1475
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
