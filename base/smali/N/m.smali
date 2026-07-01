.class public final LN/m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LN/i;


# instance fields
.field public a:Landroid/content/Context;


# virtual methods
.method public a(Ld1/d;)V
    .locals 8

    .line 1
    new-instance v7, LN/a;

    .line 2
    .line 3
    const-string v0, "EmojiCompatInitializer"

    .line 4
    .line 5
    invoke-direct {v7, v0}, LN/a;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 9
    .line 10
    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 11
    .line 12
    new-instance v6, Ljava/util/concurrent/LinkedBlockingDeque;

    .line 13
    .line 14
    invoke-direct {v6}, Ljava/util/concurrent/LinkedBlockingDeque;-><init>()V

    .line 15
    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    const/4 v2, 0x1

    .line 19
    const-wide/16 v3, 0xf

    .line 20
    .line 21
    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 26
    .line 27
    .line 28
    new-instance v1, LD0/a;

    .line 29
    .line 30
    invoke-direct {v1, p0, p1, v0, v2}, LD0/a;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public b()Ly0/j;
    .locals 11

    .line 1
    iget-object v0, p0, LN/m;->a:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ly0/j;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    sget-object v2, Ly0/m;->a:LK0/h;

    .line 11
    .line 12
    invoke-static {v2}, LA0/a;->a(LA0/b;)Lx3/a;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    iput-object v2, v1, Ly0/j;->e:Lx3/a;

    .line 17
    .line 18
    new-instance v2, LA0/c;

    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    invoke-direct {v2, v3, v0}, LA0/c;-><init>(ILjava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iput-object v2, v1, Ly0/j;->f:LA0/c;

    .line 25
    .line 26
    new-instance v0, Lj3/b;

    .line 27
    .line 28
    const/16 v3, 0x14

    .line 29
    .line 30
    invoke-direct {v0, v3, v2}, Lj3/b;-><init>(ILjava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    new-instance v3, Lw1/b;

    .line 34
    .line 35
    const/4 v4, 0x3

    .line 36
    invoke-direct {v3, v2, v0, v4}, Lw1/b;-><init>(Ljava/lang/Object;LA0/b;I)V

    .line 37
    .line 38
    .line 39
    invoke-static {v3}, LA0/a;->a(LA0/b;)Lx3/a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, v1, Ly0/j;->g:Lx3/a;

    .line 44
    .line 45
    iget-object v0, v1, Ly0/j;->f:LA0/c;

    .line 46
    .line 47
    new-instance v2, LE/i;

    .line 48
    .line 49
    const/4 v3, 0x1

    .line 50
    invoke-direct {v2, v3, v0}, LE/i;-><init>(ILjava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    iput-object v2, v1, Ly0/j;->h:LE/i;

    .line 54
    .line 55
    new-instance v2, LA0/c;

    .line 56
    .line 57
    const/4 v3, 0x3

    .line 58
    invoke-direct {v2, v3, v0}, LA0/c;-><init>(ILjava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v2}, LA0/a;->a(LA0/b;)Lx3/a;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-object v2, v1, Ly0/j;->h:LE/i;

    .line 66
    .line 67
    new-instance v3, LA/c;

    .line 68
    .line 69
    const/4 v4, 0x2

    .line 70
    invoke-direct {v3, v4, v2, v0}, LA/c;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v3}, LA0/a;->a(LA0/b;)Lx3/a;

    .line 74
    .line 75
    .line 76
    move-result-object v9

    .line 77
    iput-object v9, v1, Ly0/j;->i:Lx3/a;

    .line 78
    .line 79
    new-instance v0, LN0/f;

    .line 80
    .line 81
    const/4 v2, 0x1

    .line 82
    invoke-direct {v0, v2}, LN0/f;-><init>(I)V

    .line 83
    .line 84
    .line 85
    iget-object v2, v1, Ly0/j;->f:LA0/c;

    .line 86
    .line 87
    new-instance v8, LB2/a;

    .line 88
    .line 89
    const/4 v3, 0x2

    .line 90
    invoke-direct {v8, v2, v9, v0, v3}, LB2/a;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 91
    .line 92
    .line 93
    iget-object v6, v1, Ly0/j;->e:Lx3/a;

    .line 94
    .line 95
    iget-object v7, v1, Ly0/j;->g:Lx3/a;

    .line 96
    .line 97
    new-instance v5, LD0/d;

    .line 98
    .line 99
    move-object v10, v9

    .line 100
    invoke-direct/range {v5 .. v10}, LD0/d;-><init>(Lx3/a;Lx3/a;LB2/a;Lx3/a;Lx3/a;)V

    .line 101
    .line 102
    .line 103
    new-instance v0, Lm/J0;

    .line 104
    .line 105
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 106
    .line 107
    .line 108
    iput-object v2, v0, Lm/J0;->e:Ljava/lang/Object;

    .line 109
    .line 110
    iput-object v7, v0, Lm/J0;->f:Ljava/lang/Object;

    .line 111
    .line 112
    iput-object v9, v0, Lm/J0;->g:Ljava/lang/Object;

    .line 113
    .line 114
    iput-object v8, v0, Lm/J0;->h:Ljava/lang/Object;

    .line 115
    .line 116
    iput-object v6, v0, Lm/J0;->i:Ljava/lang/Object;

    .line 117
    .line 118
    iput-object v9, v0, Lm/J0;->j:Ljava/lang/Object;

    .line 119
    .line 120
    iput-object v9, v0, Lm/J0;->k:Ljava/lang/Object;

    .line 121
    .line 122
    new-instance v2, LV1/y;

    .line 123
    .line 124
    invoke-direct {v2, v6, v9, v8, v9}, LV1/y;-><init>(Lx3/a;Lx3/a;LB2/a;Lx3/a;)V

    .line 125
    .line 126
    .line 127
    new-instance v3, Lm/x0;

    .line 128
    .line 129
    const/16 v4, 0x10

    .line 130
    .line 131
    invoke-direct {v3, v5, v0, v2, v4}, Lm/x0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 132
    .line 133
    .line 134
    invoke-static {v3}, LA0/a;->a(LA0/b;)Lx3/a;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    iput-object v0, v1, Ly0/j;->j:Lx3/a;

    .line 139
    .line 140
    return-object v1

    .line 141
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 142
    .line 143
    new-instance v1, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 146
    .line 147
    .line 148
    const-class v2, Landroid/content/Context;

    .line 149
    .line 150
    invoke-virtual {v2}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    const-string v2, " must be set"

    .line 158
    .line 159
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    throw v0
.end method

.method public c(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, LN/m;->a:Landroid/content/Context;

    .line 2
    .line 3
    const-string v1, "flutter_image_picker_shared_preference"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    new-instance v1, Ljava/util/HashSet;

    .line 17
    .line 18
    invoke-direct {v1, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 19
    .line 20
    .line 21
    const-string p1, "flutter_image_picker_image_path"

    .line 22
    .line 23
    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    .line 24
    .line 25
    .line 26
    :cond_0
    if-eqz p2, :cond_1

    .line 27
    .line 28
    const-string p1, "flutter_image_picker_error_code"

    .line 29
    .line 30
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 31
    .line 32
    .line 33
    :cond_1
    if-eqz p3, :cond_2

    .line 34
    .line 35
    const-string p1, "flutter_image_picker_error_message"

    .line 36
    .line 37
    invoke-interface {v0, p1, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 38
    .line 39
    .line 40
    :cond_2
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 41
    .line 42
    .line 43
    return-void
.end method
