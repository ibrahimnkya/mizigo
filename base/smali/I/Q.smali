.class public LI/Q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LI/a;


# instance fields
.field public final a:Ljava/io/File;

.field public final b:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LI/Q;->a:Ljava/io/File;

    .line 5
    .line 6
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, LI/Q;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 13
    .line 14
    return-void
.end method

.method public static a(LI/Q;LC3/c;)Ljava/lang/Object;
    .locals 9

    .line 1
    instance-of v0, p1, LI/P;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, LI/P;

    .line 7
    .line 8
    iget v1, v0, LI/P;->l:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, LI/P;->l:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LI/P;

    .line 21
    .line 22
    invoke-direct {v0, p0, p1}, LI/P;-><init>(LI/Q;LC3/c;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p1, v0, LI/P;->j:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, LI/P;->l:I

    .line 28
    .line 29
    sget-object v2, LM/g;->a:LM/g;

    .line 30
    .line 31
    const/4 v3, 0x2

    .line 32
    const/4 v4, 0x1

    .line 33
    const/4 v5, 0x0

    .line 34
    sget-object v6, LB3/a;->e:LB3/a;

    .line 35
    .line 36
    if-eqz v1, :cond_3

    .line 37
    .line 38
    if-eq v1, v4, :cond_2

    .line 39
    .line 40
    if-ne v1, v3, :cond_1

    .line 41
    .line 42
    iget-object p0, v0, LI/P;->h:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast p0, Ljava/io/Closeable;

    .line 45
    .line 46
    :try_start_0
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    .line 48
    .line 49
    goto/16 :goto_5

    .line 50
    .line 51
    :catchall_0
    move-exception p1

    .line 52
    goto/16 :goto_6

    .line 53
    .line 54
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 55
    .line 56
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 57
    .line 58
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    throw p0

    .line 62
    :cond_2
    iget-object p0, v0, LI/P;->i:Ljava/io/FileInputStream;

    .line 63
    .line 64
    iget-object v1, v0, LI/P;->h:Ljava/lang/Object;

    .line 65
    .line 66
    check-cast v1, LI/Q;

    .line 67
    .line 68
    :try_start_1
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :catchall_1
    move-exception p1

    .line 73
    goto :goto_2

    .line 74
    :cond_3
    invoke-static {p1}, LV0/g;->E(Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, LI/Q;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 78
    .line 79
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-nez p1, :cond_7

    .line 84
    .line 85
    :try_start_2
    new-instance p1, Ljava/io/FileInputStream;

    .line 86
    .line 87
    iget-object v1, p0, LI/Q;->a:Ljava/io/File;

    .line 88
    .line 89
    invoke-direct {p1, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_1

    .line 90
    .line 91
    .line 92
    :try_start_3
    iput-object p0, v0, LI/P;->h:Ljava/lang/Object;

    .line 93
    .line 94
    iput-object p1, v0, LI/P;->i:Ljava/io/FileInputStream;

    .line 95
    .line 96
    iput v4, v0, LI/P;->l:I

    .line 97
    .line 98
    invoke-virtual {v2, p1}, LM/g;->a(Ljava/io/FileInputStream;)LM/b;

    .line 99
    .line 100
    .line 101
    move-result-object v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 102
    if-ne v1, v6, :cond_4

    .line 103
    .line 104
    goto :goto_4

    .line 105
    :cond_4
    move-object v8, v1

    .line 106
    move-object v1, p0

    .line 107
    move-object p0, p1

    .line 108
    move-object p1, v8

    .line 109
    :goto_1
    :try_start_4
    invoke-static {p0, v5}, Lc1/g;->d(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_4
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_0

    .line 110
    .line 111
    .line 112
    return-object p1

    .line 113
    :catch_0
    move-object p0, v1

    .line 114
    goto :goto_3

    .line 115
    :catchall_2
    move-exception v1

    .line 116
    move-object v8, v1

    .line 117
    move-object v1, p0

    .line 118
    move-object p0, p1

    .line 119
    move-object p1, v8

    .line 120
    :goto_2
    :try_start_5
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 121
    :catchall_3
    move-exception v7

    .line 122
    :try_start_6
    invoke-static {p0, p1}, Lc1/g;->d(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 123
    .line 124
    .line 125
    throw v7
    :try_end_6
    .catch Ljava/io/FileNotFoundException; {:try_start_6 .. :try_end_6} :catch_0

    .line 126
    :catch_1
    :goto_3
    iget-object p1, p0, LI/Q;->a:Ljava/io/File;

    .line 127
    .line 128
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    if-eqz p1, :cond_6

    .line 133
    .line 134
    new-instance p1, Ljava/io/FileInputStream;

    .line 135
    .line 136
    iget-object p0, p0, LI/Q;->a:Ljava/io/File;

    .line 137
    .line 138
    invoke-direct {p1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 139
    .line 140
    .line 141
    :try_start_7
    iput-object p1, v0, LI/P;->h:Ljava/lang/Object;

    .line 142
    .line 143
    iput-object v5, v0, LI/P;->i:Ljava/io/FileInputStream;

    .line 144
    .line 145
    iput v3, v0, LI/P;->l:I

    .line 146
    .line 147
    invoke-virtual {v2, p1}, LM/g;->a(Ljava/io/FileInputStream;)LM/b;

    .line 148
    .line 149
    .line 150
    move-result-object p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 151
    if-ne p0, v6, :cond_5

    .line 152
    .line 153
    :goto_4
    return-object v6

    .line 154
    :cond_5
    move-object v8, p1

    .line 155
    move-object p1, p0

    .line 156
    move-object p0, v8

    .line 157
    :goto_5
    invoke-static {p0, v5}, Lc1/g;->d(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 158
    .line 159
    .line 160
    return-object p1

    .line 161
    :catchall_4
    move-exception p0

    .line 162
    move-object v8, p1

    .line 163
    move-object p1, p0

    .line 164
    move-object p0, v8

    .line 165
    :goto_6
    :try_start_8
    throw p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    .line 166
    :catchall_5
    move-exception v0

    .line 167
    invoke-static {p0, p1}, Lc1/g;->d(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 168
    .line 169
    .line 170
    throw v0

    .line 171
    :cond_6
    new-instance p0, LM/b;

    .line 172
    .line 173
    invoke-direct {p0, v4}, LM/b;-><init>(Z)V

    .line 174
    .line 175
    .line 176
    return-object p0

    .line 177
    :cond_7
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 178
    .line 179
    const-string p1, "This scope has already been closed."

    .line 180
    .line 181
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    throw p0
.end method


# virtual methods
.method public final close()V
    .locals 2

    .line 1
    iget-object v0, p0, LI/Q;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
