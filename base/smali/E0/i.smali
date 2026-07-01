.class public final synthetic LE0/i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LG0/b;
.implements LE1/g;


# instance fields
.field public final synthetic e:I

.field public final synthetic f:J

.field public final synthetic g:Ljava/lang/Object;

.field public final synthetic h:Ljava/lang/Object;

.field public final synthetic i:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(LE0/l;Ljava/lang/Iterable;Ly0/i;J)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    iput v0, p0, LE0/i;->e:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LE0/i;->g:Ljava/lang/Object;

    iput-object p2, p0, LE0/i;->h:Ljava/lang/Object;

    iput-object p3, p0, LE0/i;->i:Ljava/lang/Object;

    iput-wide p4, p0, LE0/i;->f:J

    return-void
.end method

.method public synthetic constructor <init>(LE1/f;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;I)V
    .locals 0

    .line 2
    iput p6, p0, LE0/i;->e:I

    iput-object p1, p0, LE0/i;->g:Ljava/lang/Object;

    iput-object p2, p0, LE0/i;->h:Ljava/lang/Object;

    iput-wide p3, p0, LE0/i;->f:J

    iput-object p5, p0, LE0/i;->i:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(LA0/c;)Ljava/util/concurrent/ScheduledFuture;
    .locals 6

    .line 1
    iget v0, p0, LE0/i;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LE0/i;->g:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, LE1/f;

    .line 9
    .line 10
    iget-object v1, p0, LE0/i;->h:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v1, Ljava/util/concurrent/Callable;

    .line 13
    .line 14
    iget-object v2, p0, LE0/i;->i:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v2, Ljava/util/concurrent/TimeUnit;

    .line 17
    .line 18
    iget-object v3, v0, LE1/f;->f:Ljava/util/concurrent/ScheduledExecutorService;

    .line 19
    .line 20
    new-instance v4, LE1/e;

    .line 21
    .line 22
    invoke-direct {v4, v0, v1, p1}, LE1/e;-><init>(LE1/f;Ljava/util/concurrent/Callable;LA0/c;)V

    .line 23
    .line 24
    .line 25
    iget-wide v0, p0, LE0/i;->f:J

    .line 26
    .line 27
    invoke-interface {v3, v4, v0, v1, v2}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/util/concurrent/Callable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    return-object p1

    .line 32
    :pswitch_0
    iget-object v0, p0, LE0/i;->g:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v0, LE1/f;

    .line 35
    .line 36
    iget-object v1, p0, LE0/i;->h:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v1, Ljava/lang/Runnable;

    .line 39
    .line 40
    iget-object v2, p0, LE0/i;->i:Ljava/lang/Object;

    .line 41
    .line 42
    check-cast v2, Ljava/util/concurrent/TimeUnit;

    .line 43
    .line 44
    iget-object v3, v0, LE1/f;->f:Ljava/util/concurrent/ScheduledExecutorService;

    .line 45
    .line 46
    new-instance v4, LE1/d;

    .line 47
    .line 48
    const/4 v5, 0x1

    .line 49
    invoke-direct {v4, v0, v1, p1, v5}, LE1/d;-><init>(LE1/f;Ljava/lang/Runnable;LA0/c;I)V

    .line 50
    .line 51
    .line 52
    iget-wide v0, p0, LE0/i;->f:J

    .line 53
    .line 54
    invoke-interface {v3, v4, v0, v1, v2}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    return-object p1

    .line 59
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public b()Ljava/lang/Object;
    .locals 10

    .line 1
    iget-object v0, p0, LE0/i;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, LE0/l;

    .line 4
    .line 5
    iget-object v1, p0, LE0/i;->h:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ljava/lang/Iterable;

    .line 8
    .line 9
    iget-object v2, p0, LE0/i;->i:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v2, Ly0/i;

    .line 12
    .line 13
    iget-object v3, v0, LE0/l;->c:LF0/d;

    .line 14
    .line 15
    check-cast v3, LF0/h;

    .line 16
    .line 17
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    const/4 v5, 0x0

    .line 29
    if-nez v4, :cond_0

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v6, "UPDATE events SET num_attempts = num_attempts + 1 WHERE _id in "

    .line 35
    .line 36
    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v1}, LF0/h;->g(Ljava/lang/Iterable;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const-string v4, "SELECT COUNT(*), transport_name FROM events WHERE num_attempts >= 16 GROUP BY transport_name"

    .line 51
    .line 52
    invoke-virtual {v3}, LF0/h;->a()Landroid/database/sqlite/SQLiteDatabase;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 57
    .line 58
    .line 59
    :try_start_0
    invoke-virtual {v6, v1}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v6, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    .line 67
    .line 68
    .line 69
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    :goto_0
    :try_start_1
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    if-eqz v4, :cond_1

    .line 75
    .line 76
    const/4 v4, 0x0

    .line 77
    invoke-interface {v1, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    const/4 v7, 0x1

    .line 82
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v7

    .line 86
    int-to-long v8, v4

    .line 87
    sget-object v4, LB0/c;->j:LB0/c;

    .line 88
    .line 89
    invoke-virtual {v3, v8, v9, v4, v7}, LF0/h;->e(JLB0/c;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_1
    :try_start_2
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 94
    .line 95
    .line 96
    const-string v1, "DELETE FROM events WHERE num_attempts >= 16"

    .line 97
    .line 98
    invoke-virtual {v6, v1}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 106
    .line 107
    .line 108
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 109
    .line 110
    .line 111
    :goto_1
    iget-object v0, v0, LE0/l;->g:LH0/a;

    .line 112
    .line 113
    invoke-interface {v0}, LH0/a;->e()J

    .line 114
    .line 115
    .line 116
    move-result-wide v0

    .line 117
    iget-wide v6, p0, LE0/i;->f:J

    .line 118
    .line 119
    add-long/2addr v0, v6

    .line 120
    new-instance v4, LF0/e;

    .line 121
    .line 122
    invoke-direct {v4, v0, v1, v2}, LF0/e;-><init>(JLy0/i;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v3, v4}, LF0/h;->c(LF0/f;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    return-object v5

    .line 129
    :catchall_0
    move-exception v0

    .line 130
    goto :goto_2

    .line 131
    :catchall_1
    move-exception v0

    .line 132
    :try_start_3
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 133
    .line 134
    .line 135
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 136
    :goto_2
    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 137
    .line 138
    .line 139
    throw v0
.end method
