.class public final synthetic LV2/k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic e:Z

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:LQ2/g;

.field public final synthetic h:Ljava/lang/Boolean;

.field public final synthetic i:LV2/e;

.field public final synthetic j:Lk3/l;

.field public final synthetic k:Z

.field public final synthetic l:I


# direct methods
.method public synthetic constructor <init>(ZLjava/lang/String;LQ2/g;Ljava/lang/Boolean;LV2/e;Lk3/l;ZI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, LV2/k;->e:Z

    iput-object p2, p0, LV2/k;->f:Ljava/lang/String;

    iput-object p3, p0, LV2/k;->g:LQ2/g;

    iput-object p4, p0, LV2/k;->h:Ljava/lang/Boolean;

    iput-object p5, p0, LV2/k;->i:LV2/e;

    iput-object p6, p0, LV2/k;->j:Lk3/l;

    iput-boolean p7, p0, LV2/k;->k:Z

    iput p8, p0, LV2/k;->l:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 12

    .line 1
    iget-boolean v0, p0, LV2/k;->e:Z

    .line 2
    .line 3
    iget-object v1, p0, LV2/k;->f:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, LV2/k;->g:LQ2/g;

    .line 6
    .line 7
    iget-object v3, p0, LV2/k;->h:Ljava/lang/Boolean;

    .line 8
    .line 9
    iget-object v4, p0, LV2/k;->i:LV2/e;

    .line 10
    .line 11
    iget-object v5, p0, LV2/k;->j:Lk3/l;

    .line 12
    .line 13
    iget-boolean v6, p0, LV2/k;->k:Z

    .line 14
    .line 15
    iget v7, p0, LV2/k;->l:I

    .line 16
    .line 17
    const-string v8, "open_failed "

    .line 18
    .line 19
    sget-object v9, LV2/m;->j:Ljava/lang/Object;

    .line 20
    .line 21
    monitor-enter v9

    .line 22
    const/4 v10, 0x0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    :try_start_0
    new-instance v0, Ljava/io/File;

    .line 26
    .line 27
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    new-instance v11, Ljava/io/File;

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-direct {v11, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    invoke-virtual {v11}, Ljava/io/File;->mkdirs()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_0

    .line 50
    .line 51
    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_0

    .line 56
    .line 57
    const-string v0, "sqlite_error"

    .line 58
    .line 59
    new-instance v3, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {v3, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v2, v0, v1, v10}, LQ2/g;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    monitor-exit v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    return-void

    .line 76
    :catchall_0
    move-exception v0

    .line 77
    goto/16 :goto_3

    .line 78
    .line 79
    :cond_0
    :try_start_1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 80
    .line 81
    invoke-virtual {v0, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    const/4 v3, 0x1

    .line 86
    if-eqz v0, :cond_1

    .line 87
    .line 88
    iget-object v0, v4, LV2/e;->b:Ljava/lang/String;

    .line 89
    .line 90
    new-instance v8, LV2/d;

    .line 91
    .line 92
    invoke-direct {v8}, Ljava/lang/Object;-><init>()V

    .line 93
    .line 94
    .line 95
    invoke-static {v0, v10, v3, v8}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;ILandroid/database/DatabaseErrorHandler;)Landroid/database/sqlite/SQLiteDatabase;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iput-object v0, v4, LV2/e;->i:Landroid/database/sqlite/SQLiteDatabase;

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_1
    invoke-virtual {v4}, LV2/e;->l()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 103
    .line 104
    .line 105
    :goto_0
    :try_start_2
    sget-object v0, LV2/m;->i:Ljava/lang/Object;

    .line 106
    .line 107
    monitor-enter v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 108
    if-eqz v6, :cond_2

    .line 109
    .line 110
    :try_start_3
    sget-object v5, LV2/m;->g:Ljava/util/HashMap;

    .line 111
    .line 112
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 113
    .line 114
    .line 115
    move-result-object v6

    .line 116
    invoke-virtual {v5, v1, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    goto :goto_1

    .line 120
    :catchall_1
    move-exception v1

    .line 121
    goto :goto_2

    .line 122
    :cond_2
    :goto_1
    sget-object v5, LV2/m;->h:Ljava/util/HashMap;

    .line 123
    .line 124
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 125
    .line 126
    .line 127
    move-result-object v6

    .line 128
    invoke-virtual {v5, v6, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 132
    :try_start_4
    iget v0, v4, LV2/e;->d:I

    .line 133
    .line 134
    if-lt v0, v3, :cond_3

    .line 135
    .line 136
    const-string v0, "Sqflite"

    .line 137
    .line 138
    new-instance v3, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v4}, LV2/e;->i()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v4

    .line 147
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    const-string v4, "opened "

    .line 151
    .line 152
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    const-string v4, " "

    .line 159
    .line 160
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    .line 172
    .line 173
    :cond_3
    monitor-exit v9
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 174
    const/4 v0, 0x0

    .line 175
    invoke-static {v7, v0, v0}, LV2/m;->c(IZZ)Ljava/util/HashMap;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    invoke-virtual {v2, v0}, LQ2/g;->a(Ljava/lang/Object;)V

    .line 180
    .line 181
    .line 182
    return-void

    .line 183
    :goto_2
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 184
    :try_start_6
    throw v1

    .line 185
    :catch_0
    move-exception v0

    .line 186
    new-instance v1, LW2/c;

    .line 187
    .line 188
    invoke-direct {v1, v5, v2}, LW2/c;-><init>(Lk3/l;Lk3/n;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v4, v0, v1}, LV2/e;->j(Ljava/lang/Exception;LT0/a;)V

    .line 192
    .line 193
    .line 194
    monitor-exit v9

    .line 195
    return-void

    .line 196
    :goto_3
    monitor-exit v9
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 197
    throw v0
.end method
