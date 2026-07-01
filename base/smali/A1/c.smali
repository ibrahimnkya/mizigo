.class public final synthetic LA1/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LP1/a;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, LA1/c;->a:I

    iput-object p2, p0, LA1/c;->b:Ljava/lang/Object;

    iput-object p3, p0, LA1/c;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 2
    const/4 v0, 0x2

    iput v0, p0, LA1/c;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LA1/c;->c:Ljava/lang/Object;

    iput-object p2, p0, LA1/c;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 15

    .line 1
    iget v0, p0, LA1/c;->a:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LA1/c;->c:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Landroid/content/Context;

    .line 9
    .line 10
    iget-object v1, p0, LA1/c;->b:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v1, Ljava/lang/String;

    .line 13
    .line 14
    new-instance v2, LN1/l;

    .line 15
    .line 16
    invoke-direct {v2, v0, v1}, LN1/l;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-object v2

    .line 20
    :pswitch_0
    iget-object v0, p0, LA1/c;->b:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast v0, LD1/i;

    .line 23
    .line 24
    iget-object v1, p0, LA1/c;->c:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v1, LD1/c;

    .line 27
    .line 28
    iget-object v2, v1, LD1/c;->f:LD1/f;

    .line 29
    .line 30
    new-instance v3, LD1/x;

    .line 31
    .line 32
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 33
    .line 34
    .line 35
    new-instance v4, Ljava/util/HashSet;

    .line 36
    .line 37
    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 38
    .line 39
    .line 40
    new-instance v5, Ljava/util/HashSet;

    .line 41
    .line 42
    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 43
    .line 44
    .line 45
    new-instance v6, Ljava/util/HashSet;

    .line 46
    .line 47
    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    .line 48
    .line 49
    .line 50
    new-instance v7, Ljava/util/HashSet;

    .line 51
    .line 52
    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    .line 53
    .line 54
    .line 55
    new-instance v8, Ljava/util/HashSet;

    .line 56
    .line 57
    invoke-direct {v8}, Ljava/util/HashSet;-><init>()V

    .line 58
    .line 59
    .line 60
    iget-object v9, v1, LD1/c;->c:Ljava/util/Set;

    .line 61
    .line 62
    iget-object v1, v1, LD1/c;->g:Ljava/util/Set;

    .line 63
    .line 64
    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 65
    .line 66
    .line 67
    move-result-object v9

    .line 68
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 69
    .line 70
    .line 71
    move-result v10

    .line 72
    if-eqz v10, :cond_5

    .line 73
    .line 74
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v10

    .line 78
    check-cast v10, LD1/l;

    .line 79
    .line 80
    iget v11, v10, LD1/l;->c:I

    .line 81
    .line 82
    iget v12, v10, LD1/l;->b:I

    .line 83
    .line 84
    if-nez v11, :cond_0

    .line 85
    .line 86
    const/4 v13, 0x1

    .line 87
    goto :goto_1

    .line 88
    :cond_0
    const/4 v13, 0x0

    .line 89
    :goto_1
    iget-object v10, v10, LD1/l;->a:LD1/v;

    .line 90
    .line 91
    const/4 v14, 0x2

    .line 92
    if-eqz v13, :cond_2

    .line 93
    .line 94
    if-ne v12, v14, :cond_1

    .line 95
    .line 96
    invoke-virtual {v7, v10}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_1
    invoke-virtual {v4, v10}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_2
    if-ne v11, v14, :cond_3

    .line 105
    .line 106
    invoke-virtual {v6, v10}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_3
    if-ne v12, v14, :cond_4

    .line 111
    .line 112
    invoke-virtual {v8, v10}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_4
    invoke-virtual {v5, v10}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_5
    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    .line 121
    .line 122
    .line 123
    move-result v9

    .line 124
    if-nez v9, :cond_6

    .line 125
    .line 126
    const-class v9, LM1/b;

    .line 127
    .line 128
    invoke-static {v9}, LD1/v;->a(Ljava/lang/Class;)LD1/v;

    .line 129
    .line 130
    .line 131
    move-result-object v9

    .line 132
    invoke-virtual {v4, v9}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    :cond_6
    invoke-static {v4}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 136
    .line 137
    .line 138
    move-result-object v4

    .line 139
    iput-object v4, v3, LD1/x;->a:Ljava/lang/Object;

    .line 140
    .line 141
    invoke-static {v5}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 142
    .line 143
    .line 144
    move-result-object v4

    .line 145
    iput-object v4, v3, LD1/x;->b:Ljava/lang/Object;

    .line 146
    .line 147
    invoke-static {v6}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 148
    .line 149
    .line 150
    invoke-static {v7}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 151
    .line 152
    .line 153
    move-result-object v4

    .line 154
    iput-object v4, v3, LD1/x;->c:Ljava/lang/Object;

    .line 155
    .line 156
    invoke-static {v8}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 157
    .line 158
    .line 159
    move-result-object v4

    .line 160
    iput-object v4, v3, LD1/x;->d:Ljava/lang/Object;

    .line 161
    .line 162
    iput-object v1, v3, LD1/x;->e:Ljava/lang/Object;

    .line 163
    .line 164
    iput-object v0, v3, LD1/x;->f:Ljava/lang/Object;

    .line 165
    .line 166
    invoke-interface {v2, v3}, LD1/f;->c(LD1/x;)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    return-object v0

    .line 171
    :pswitch_1
    iget-object v0, p0, LA1/c;->b:Ljava/lang/Object;

    .line 172
    .line 173
    check-cast v0, LA1/g;

    .line 174
    .line 175
    iget-object v1, p0, LA1/c;->c:Ljava/lang/Object;

    .line 176
    .line 177
    check-cast v1, Landroid/content/Context;

    .line 178
    .line 179
    new-instance v2, LU1/a;

    .line 180
    .line 181
    invoke-virtual {v0}, LA1/g;->f()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v3

    .line 185
    iget-object v0, v0, LA1/g;->d:LD1/i;

    .line 186
    .line 187
    const-class v4, LM1/b;

    .line 188
    .line 189
    invoke-interface {v0, v4}, LD1/d;->a(Ljava/lang/Class;)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    check-cast v0, LM1/b;

    .line 194
    .line 195
    invoke-direct {v2, v1, v3, v0}, LU1/a;-><init>(Landroid/content/Context;Ljava/lang/String;LM1/b;)V

    .line 196
    .line 197
    .line 198
    return-object v2

    .line 199
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
