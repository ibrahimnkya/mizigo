.class public final Lm/J0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LA0/b;
.implements Lh3/b;


# instance fields
.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;

.field public h:Ljava/lang/Object;

.field public i:Ljava/lang/Object;

.field public j:Ljava/lang/Object;

.field public k:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lm/J0;->e:Ljava/lang/Object;

    .line 6
    .line 7
    iput-object v0, p0, Lm/J0;->f:Ljava/lang/Object;

    .line 8
    .line 9
    iput-object v0, p0, Lm/J0;->g:Ljava/lang/Object;

    .line 10
    .line 11
    iput-object v0, p0, Lm/J0;->h:Ljava/lang/Object;

    .line 12
    .line 13
    iput-object v0, p0, Lm/J0;->i:Ljava/lang/Object;

    .line 14
    .line 15
    iput-object v0, p0, Lm/J0;->j:Ljava/lang/Object;

    .line 16
    .line 17
    return-void
.end method

.method public static f(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)[B
    .locals 1

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, p2, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    :goto_0
    const/4 p2, 0x0

    .line 20
    :try_start_0
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    if-nez p0, :cond_1

    .line 25
    .line 26
    return-object p2

    .line 27
    :cond_1
    invoke-static {p0}, Landroid/support/v4/media/session/a;->g(Ljava/lang/String;)[B

    .line 28
    .line 29
    .line 30
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    return-object p0

    .line 32
    :catch_0
    new-instance p0, Ljava/io/CharConversionException;

    .line 33
    .line 34
    const-string p2, "can\'t read keyset; the pref value "

    .line 35
    .line 36
    const-string v0, " is not a valid hex string"

    .line 37
    .line 38
    invoke-static {p2, p1, v0}, Lr/a;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-direct {p0, p1}, Ljava/io/CharConversionException;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    throw p0

    .line 46
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 47
    .line 48
    const-string p1, "keysetName cannot be null"

    .line 49
    .line 50
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    throw p0
.end method

.method public static g([B)Lj1/c;
    .locals 2

    .line 1
    new-instance v0, Ljava/io/ByteArrayInputStream;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/o;->a()Lcom/google/crypto/tink/shaded/protobuf/o;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {v0, p0}, Lx1/g0;->G(Ljava/io/ByteArrayInputStream;Lcom/google/crypto/tink/shaded/protobuf/o;)Lx1/g0;

    .line 11
    .line 12
    .line 13
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 15
    .line 16
    .line 17
    invoke-static {p0}, LB2/a;->v(Lx1/g0;)LB2/a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    new-instance v0, Lj1/c;

    .line 22
    .line 23
    invoke-virtual {p0}, LB2/a;->y()Lx1/g0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/w;->y()Lcom/google/crypto/tink/shaded/protobuf/u;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lx1/d0;

    .line 32
    .line 33
    const/4 v1, 0x3

    .line 34
    invoke-direct {v0, v1, p0}, Lj1/c;-><init>(ILjava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    return-object v0

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 40
    .line 41
    .line 42
    throw p0
.end method


# virtual methods
.method public a(Lk3/q;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lm/J0;->h:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/HashSet;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b(Lk3/s;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lm/J0;->g:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/HashSet;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public declared-synchronized c()Lr1/a;
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lm/J0;->f:Ljava/lang/Object;

    .line 3
    .line 4
    check-cast v0, Ljava/lang/String;

    .line 5
    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    sget-object v0, Lr1/a;->b:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 11
    :try_start_1
    iget-object v1, p0, Lm/J0;->e:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v1, Landroid/content/Context;

    .line 14
    .line 15
    iget-object v2, p0, Lm/J0;->f:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v2, Ljava/lang/String;

    .line 18
    .line 19
    iget-object v3, p0, Lm/J0;->g:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v3, Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1, v2, v3}, Lm/J0;->f(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)[B

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    iget-object v1, p0, Lm/J0;->h:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast v1, Ljava/lang/String;

    .line 32
    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0}, Lm/J0;->i()Lr1/b;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iput-object v1, p0, Lm/J0;->i:Ljava/lang/Object;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catchall_0
    move-exception v1

    .line 43
    goto :goto_2

    .line 44
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lm/J0;->d()Lj1/c;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iput-object v1, p0, Lm/J0;->k:Ljava/lang/Object;

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    iget-object v2, p0, Lm/J0;->h:Ljava/lang/Object;

    .line 52
    .line 53
    check-cast v2, Ljava/lang/String;

    .line 54
    .line 55
    if-eqz v2, :cond_2

    .line 56
    .line 57
    invoke-virtual {p0, v1}, Lm/J0;->h([B)Lj1/c;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    iput-object v1, p0, Lm/J0;->k:Ljava/lang/Object;

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_2
    invoke-static {v1}, Lm/J0;->g([B)Lj1/c;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iput-object v1, p0, Lm/J0;->k:Ljava/lang/Object;

    .line 69
    .line 70
    :goto_1
    new-instance v1, Lr1/a;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Lr1/a;-><init>(Lm/J0;)V

    .line 73
    .line 74
    .line 75
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 76
    monitor-exit p0

    .line 77
    return-object v1

    .line 78
    :goto_2
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 79
    :try_start_3
    throw v1

    .line 80
    :catchall_1
    move-exception v0

    .line 81
    goto :goto_3

    .line 82
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 83
    .line 84
    const-string v1, "keysetName cannot be null"

    .line 85
    .line 86
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    throw v0

    .line 90
    :goto_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 91
    throw v0
.end method

.method public d()Lj1/c;
    .locals 25

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget-object v0, v1, Lm/J0;->j:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Lj1/c;

    .line 6
    .line 7
    if-eqz v0, :cond_18

    .line 8
    .line 9
    iget-object v0, v0, Lj1/c;->b:Ljava/lang/Object;

    .line 10
    .line 11
    move-object v2, v0

    .line 12
    check-cast v2, Lj1/i;

    .line 13
    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_0
    :try_start_0
    instance-of v0, v2, Ls1/j;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    move-object v0, v2

    .line 22
    check-cast v0, Ls1/j;

    .line 23
    .line 24
    iget-object v0, v0, Ls1/j;->a:Ls1/H;

    .line 25
    .line 26
    iget-object v0, v0, Ls1/H;->b:Lx1/b0;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    sget-object v0, Ls1/s;->b:Ls1/s;

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Ls1/s;->h(Lj1/i;)Ls1/J;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ls1/H;

    .line 36
    .line 37
    iget-object v0, v0, Ls1/H;->b:Lx1/b0;
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_1

    .line 38
    .line 39
    :goto_0
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/a;->e()[B

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {v0}, LT0/a;->E([B)Lj1/i;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    :goto_1
    new-instance v0, Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .line 51
    .line 52
    sget-object v3, Ls1/k;->b:Ls1/k;

    .line 53
    .line 54
    new-instance v4, Lj1/d;

    .line 55
    .line 56
    invoke-direct {v4, v2}, Lj1/d;-><init>(Lj1/i;)V

    .line 57
    .line 58
    .line 59
    sget-object v2, Lj1/e;->a:Lj1/e;

    .line 60
    .line 61
    iput-object v2, v4, Lj1/d;->c:Lj1/e;

    .line 62
    .line 63
    const/4 v5, 0x1

    .line 64
    iput-boolean v5, v4, Lj1/d;->a:Z

    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 67
    .line 68
    .line 69
    move-result v6

    .line 70
    const/4 v7, 0x0

    .line 71
    move v8, v7

    .line 72
    :goto_2
    if-ge v8, v6, :cond_2

    .line 73
    .line 74
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v9

    .line 78
    add-int/lit8 v8, v8, 0x1

    .line 79
    .line 80
    check-cast v9, Lj1/d;

    .line 81
    .line 82
    iput-boolean v7, v9, Lj1/d;->a:Z

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_2
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    new-instance v4, Ljava/util/ArrayList;

    .line 89
    .line 90
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 95
    .line 96
    .line 97
    move v6, v7

    .line 98
    :goto_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 99
    .line 100
    .line 101
    move-result v8

    .line 102
    sub-int/2addr v8, v5

    .line 103
    if-ge v6, v8, :cond_5

    .line 104
    .line 105
    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v8

    .line 109
    check-cast v8, Lj1/d;

    .line 110
    .line 111
    iget-object v8, v8, Lj1/d;->c:Lj1/e;

    .line 112
    .line 113
    if-ne v8, v2, :cond_4

    .line 114
    .line 115
    add-int/lit8 v8, v6, 0x1

    .line 116
    .line 117
    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v8

    .line 121
    check-cast v8, Lj1/d;

    .line 122
    .line 123
    iget-object v8, v8, Lj1/d;->c:Lj1/e;

    .line 124
    .line 125
    if-ne v8, v2, :cond_3

    .line 126
    .line 127
    goto :goto_4

    .line 128
    :cond_3
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 129
    .line 130
    const-string v2, "Entries with \'withRandomId()\' may only be followed by other entries with \'withRandomId()\'."

    .line 131
    .line 132
    invoke-direct {v0, v2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    throw v0

    .line 136
    :cond_4
    :goto_4
    add-int/lit8 v6, v6, 0x1

    .line 137
    .line 138
    goto :goto_3

    .line 139
    :cond_5
    new-instance v6, Ljava/util/HashSet;

    .line 140
    .line 141
    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 145
    .line 146
    .line 147
    move-result v8

    .line 148
    move v11, v7

    .line 149
    const/4 v10, 0x0

    .line 150
    :goto_5
    const/4 v12, 0x3

    .line 151
    if-ge v11, v8, :cond_12

    .line 152
    .line 153
    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v13

    .line 157
    add-int/lit8 v11, v11, 0x1

    .line 158
    .line 159
    check-cast v13, Lj1/d;

    .line 160
    .line 161
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 162
    .line 163
    .line 164
    iget-object v14, v13, Lj1/d;->b:Lj1/i;

    .line 165
    .line 166
    iget-object v15, v13, Lj1/d;->c:Lj1/e;

    .line 167
    .line 168
    if-eqz v15, :cond_11

    .line 169
    .line 170
    if-ne v15, v2, :cond_9

    .line 171
    .line 172
    move v15, v7

    .line 173
    :goto_6
    move/from16 v16, v5

    .line 174
    .line 175
    if-eqz v15, :cond_7

    .line 176
    .line 177
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 178
    .line 179
    .line 180
    move-result-object v5

    .line 181
    invoke-virtual {v6, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result v5

    .line 185
    if-eqz v5, :cond_6

    .line 186
    .line 187
    goto :goto_7

    .line 188
    :cond_6
    move/from16 v21, v15

    .line 189
    .line 190
    goto :goto_9

    .line 191
    :cond_7
    :goto_7
    sget v5, Ls1/N;->a:I

    .line 192
    .line 193
    move v15, v7

    .line 194
    :goto_8
    if-nez v15, :cond_8

    .line 195
    .line 196
    const/4 v5, 0x4

    .line 197
    invoke-static {v5}, Ls1/I;->a(I)[B

    .line 198
    .line 199
    .line 200
    move-result-object v5

    .line 201
    aget-byte v15, v5, v7

    .line 202
    .line 203
    and-int/lit16 v15, v15, 0xff

    .line 204
    .line 205
    shl-int/lit8 v15, v15, 0x18

    .line 206
    .line 207
    aget-byte v9, v5, v16

    .line 208
    .line 209
    and-int/lit16 v9, v9, 0xff

    .line 210
    .line 211
    shl-int/lit8 v9, v9, 0x10

    .line 212
    .line 213
    or-int/2addr v9, v15

    .line 214
    const/4 v15, 0x2

    .line 215
    aget-byte v15, v5, v15

    .line 216
    .line 217
    and-int/lit16 v15, v15, 0xff

    .line 218
    .line 219
    shl-int/lit8 v15, v15, 0x8

    .line 220
    .line 221
    or-int/2addr v9, v15

    .line 222
    aget-byte v5, v5, v12

    .line 223
    .line 224
    and-int/lit16 v5, v5, 0xff

    .line 225
    .line 226
    or-int v15, v9, v5

    .line 227
    .line 228
    goto :goto_8

    .line 229
    :cond_8
    move/from16 v5, v16

    .line 230
    .line 231
    goto :goto_6

    .line 232
    :cond_9
    move/from16 v16, v5

    .line 233
    .line 234
    move/from16 v21, v7

    .line 235
    .line 236
    :goto_9
    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 237
    .line 238
    .line 239
    move-result-object v5

    .line 240
    invoke-virtual {v6, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    move-result v5

    .line 244
    if-nez v5, :cond_10

    .line 245
    .line 246
    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 247
    .line 248
    .line 249
    move-result-object v5

    .line 250
    invoke-virtual {v6, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    invoke-virtual {v14}, Lj1/i;->a()Z

    .line 254
    .line 255
    .line 256
    move-result v5

    .line 257
    if-eqz v5, :cond_a

    .line 258
    .line 259
    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 260
    .line 261
    .line 262
    move-result-object v5

    .line 263
    goto :goto_a

    .line 264
    :cond_a
    const/4 v5, 0x0

    .line 265
    :goto_a
    sget-object v9, Ls1/l;->b:Ls1/l;

    .line 266
    .line 267
    invoke-virtual {v9, v14, v5}, Ls1/l;->b(Lj1/i;Ljava/lang/Integer;)Landroid/support/v4/media/session/a;

    .line 268
    .line 269
    .line 270
    move-result-object v19

    .line 271
    new-instance v18, Lj1/f;

    .line 272
    .line 273
    sget-object v5, Lj1/c;->c:Lj1/c;

    .line 274
    .line 275
    invoke-virtual {v5, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 276
    .line 277
    .line 278
    move-result v9

    .line 279
    if-eqz v9, :cond_b

    .line 280
    .line 281
    sget-object v5, Lx1/Z;->g:Lx1/Z;

    .line 282
    .line 283
    :goto_b
    move-object/from16 v20, v5

    .line 284
    .line 285
    goto :goto_c

    .line 286
    :cond_b
    sget-object v9, Lj1/c;->d:Lj1/c;

    .line 287
    .line 288
    invoke-virtual {v9, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 289
    .line 290
    .line 291
    move-result v9

    .line 292
    if-eqz v9, :cond_c

    .line 293
    .line 294
    sget-object v5, Lx1/Z;->h:Lx1/Z;

    .line 295
    .line 296
    goto :goto_b

    .line 297
    :cond_c
    sget-object v9, Lj1/c;->e:Lj1/c;

    .line 298
    .line 299
    invoke-virtual {v9, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 300
    .line 301
    .line 302
    move-result v5

    .line 303
    if-eqz v5, :cond_f

    .line 304
    .line 305
    sget-object v5, Lx1/Z;->i:Lx1/Z;

    .line 306
    .line 307
    goto :goto_b

    .line 308
    :goto_c
    iget-boolean v5, v13, Lj1/d;->a:Z

    .line 309
    .line 310
    const/16 v23, 0x0

    .line 311
    .line 312
    sget-object v24, Lj1/f;->h:Lb2/f;

    .line 313
    .line 314
    move/from16 v22, v5

    .line 315
    .line 316
    invoke-direct/range {v18 .. v24}, Lj1/f;-><init>(Landroid/support/v4/media/session/a;Lx1/Z;IZZLb2/f;)V

    .line 317
    .line 318
    .line 319
    move-object/from16 v5, v18

    .line 320
    .line 321
    move/from16 v15, v21

    .line 322
    .line 323
    iget-boolean v9, v13, Lj1/d;->a:Z

    .line 324
    .line 325
    if-eqz v9, :cond_e

    .line 326
    .line 327
    if-nez v10, :cond_d

    .line 328
    .line 329
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 330
    .line 331
    .line 332
    move-result-object v10

    .line 333
    goto :goto_d

    .line 334
    :cond_d
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 335
    .line 336
    const-string v2, "Two primaries were set"

    .line 337
    .line 338
    invoke-direct {v0, v2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 339
    .line 340
    .line 341
    throw v0

    .line 342
    :cond_e
    :goto_d
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 343
    .line 344
    .line 345
    move/from16 v5, v16

    .line 346
    .line 347
    goto/16 :goto_5

    .line 348
    .line 349
    :cond_f
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 350
    .line 351
    const-string v2, "Unknown key status"

    .line 352
    .line 353
    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 354
    .line 355
    .line 356
    throw v0

    .line 357
    :cond_10
    move/from16 v15, v21

    .line 358
    .line 359
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 360
    .line 361
    const-string v2, "Id "

    .line 362
    .line 363
    const-string v3, " is used twice in the keyset"

    .line 364
    .line 365
    invoke-static {v15, v2, v3}, LE1/j;->i(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 366
    .line 367
    .line 368
    move-result-object v2

    .line 369
    invoke-direct {v0, v2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 370
    .line 371
    .line 372
    throw v0

    .line 373
    :cond_11
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 374
    .line 375
    const-string v2, "No ID was set (with withFixedId or withRandomId)"

    .line 376
    .line 377
    invoke-direct {v0, v2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 378
    .line 379
    .line 380
    throw v0

    .line 381
    :cond_12
    if-eqz v10, :cond_17

    .line 382
    .line 383
    new-instance v0, LB2/a;

    .line 384
    .line 385
    invoke-direct {v0, v4, v3}, LB2/a;-><init>(Ljava/util/List;Ls1/k;)V

    .line 386
    .line 387
    .line 388
    iget-object v2, v3, Ls1/k;->a:Ljava/util/Map;

    .line 389
    .line 390
    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    .line 391
    .line 392
    .line 393
    move-result v2

    .line 394
    if-eqz v2, :cond_13

    .line 395
    .line 396
    goto :goto_f

    .line 397
    :cond_13
    new-instance v2, Lb2/f;

    .line 398
    .line 399
    const/4 v5, 0x5

    .line 400
    invoke-direct {v2, v5}, Lb2/f;-><init>(I)V

    .line 401
    .line 402
    .line 403
    new-instance v5, Ljava/util/ArrayList;

    .line 404
    .line 405
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 406
    .line 407
    .line 408
    move-result v6

    .line 409
    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 410
    .line 411
    .line 412
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 413
    .line 414
    .line 415
    move-result v6

    .line 416
    move v8, v7

    .line 417
    :goto_e
    if-ge v8, v6, :cond_14

    .line 418
    .line 419
    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 420
    .line 421
    .line 422
    move-result-object v9

    .line 423
    add-int/lit8 v8, v8, 0x1

    .line 424
    .line 425
    check-cast v9, Lj1/f;

    .line 426
    .line 427
    new-instance v13, Lj1/f;

    .line 428
    .line 429
    iget-object v14, v9, Lj1/f;->a:Landroid/support/v4/media/session/a;

    .line 430
    .line 431
    iget-object v15, v9, Lj1/f;->b:Lx1/Z;

    .line 432
    .line 433
    iget v10, v9, Lj1/f;->d:I

    .line 434
    .line 435
    iget-boolean v11, v9, Lj1/f;->e:Z

    .line 436
    .line 437
    iget-boolean v9, v9, Lj1/f;->f:Z

    .line 438
    .line 439
    move-object/from16 v19, v2

    .line 440
    .line 441
    move/from16 v18, v9

    .line 442
    .line 443
    move/from16 v16, v10

    .line 444
    .line 445
    move/from16 v17, v11

    .line 446
    .line 447
    invoke-direct/range {v13 .. v19}, Lj1/f;-><init>(Landroid/support/v4/media/session/a;Lx1/Z;IZZLb2/f;)V

    .line 448
    .line 449
    .line 450
    invoke-virtual {v5, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 451
    .line 452
    .line 453
    goto :goto_e

    .line 454
    :cond_14
    new-instance v2, LB2/a;

    .line 455
    .line 456
    const/16 v4, 0x15

    .line 457
    .line 458
    invoke-direct {v2, v5, v3, v0, v4}, LB2/a;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 459
    .line 460
    .line 461
    move-object v0, v2

    .line 462
    :goto_f
    new-instance v2, LZ2/s;

    .line 463
    .line 464
    iget-object v3, v1, Lm/J0;->e:Ljava/lang/Object;

    .line 465
    .line 466
    check-cast v3, Landroid/content/Context;

    .line 467
    .line 468
    iget-object v4, v1, Lm/J0;->f:Ljava/lang/Object;

    .line 469
    .line 470
    check-cast v4, Ljava/lang/String;

    .line 471
    .line 472
    iget-object v5, v1, Lm/J0;->g:Ljava/lang/Object;

    .line 473
    .line 474
    check-cast v5, Ljava/lang/String;

    .line 475
    .line 476
    invoke-direct {v2, v3, v4, v5}, LZ2/s;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 477
    .line 478
    .line 479
    iget-object v3, v1, Lm/J0;->i:Ljava/lang/Object;

    .line 480
    .line 481
    check-cast v3, Lr1/b;

    .line 482
    .line 483
    if-eqz v3, :cond_15

    .line 484
    .line 485
    :try_start_1
    new-array v4, v7, [B

    .line 486
    .line 487
    invoke-static {v0, v2, v3, v4}, Ld1/d;->y(LB2/a;LZ2/s;Lr1/b;[B)V

    .line 488
    .line 489
    .line 490
    goto :goto_10

    .line 491
    :catch_0
    move-exception v0

    .line 492
    goto :goto_11

    .line 493
    :cond_15
    invoke-virtual {v0}, LB2/a;->y()Lx1/g0;

    .line 494
    .line 495
    .line 496
    move-result-object v3

    .line 497
    iget-object v2, v2, LZ2/s;->f:Ljava/lang/Object;

    .line 498
    .line 499
    check-cast v2, Landroid/content/SharedPreferences$Editor;

    .line 500
    .line 501
    invoke-virtual {v3}, Lcom/google/crypto/tink/shaded/protobuf/a;->e()[B

    .line 502
    .line 503
    .line 504
    move-result-object v3

    .line 505
    invoke-static {v3}, Landroid/support/v4/media/session/a;->j([B)Ljava/lang/String;

    .line 506
    .line 507
    .line 508
    move-result-object v3

    .line 509
    invoke-interface {v2, v4, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 510
    .line 511
    .line 512
    move-result-object v2

    .line 513
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 514
    .line 515
    .line 516
    move-result v2
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 517
    if-eqz v2, :cond_16

    .line 518
    .line 519
    :goto_10
    new-instance v2, Lj1/c;

    .line 520
    .line 521
    invoke-virtual {v0}, LB2/a;->y()Lx1/g0;

    .line 522
    .line 523
    .line 524
    move-result-object v0

    .line 525
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/w;->y()Lcom/google/crypto/tink/shaded/protobuf/u;

    .line 526
    .line 527
    .line 528
    move-result-object v0

    .line 529
    check-cast v0, Lx1/d0;

    .line 530
    .line 531
    invoke-direct {v2, v12, v0}, Lj1/c;-><init>(ILjava/lang/Object;)V

    .line 532
    .line 533
    .line 534
    return-object v2

    .line 535
    :cond_16
    :try_start_2
    new-instance v0, Ljava/io/IOException;

    .line 536
    .line 537
    const-string v2, "Failed to write to SharedPreferences"

    .line 538
    .line 539
    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 540
    .line 541
    .line 542
    throw v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 543
    :goto_11
    new-instance v2, Ljava/security/GeneralSecurityException;

    .line 544
    .line 545
    invoke-direct {v2, v0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/Throwable;)V

    .line 546
    .line 547
    .line 548
    throw v2

    .line 549
    :cond_17
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 550
    .line 551
    const-string v2, "No primary was set"

    .line 552
    .line 553
    invoke-direct {v0, v2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 554
    .line 555
    .line 556
    throw v0

    .line 557
    :catch_1
    move-exception v0

    .line 558
    new-instance v3, LD1/n;

    .line 559
    .line 560
    new-instance v4, Ljava/lang/StringBuilder;

    .line 561
    .line 562
    const-string v5, "Parsing parameters failed in getProto(). You probably want to call some Tink register function for "

    .line 563
    .line 564
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 565
    .line 566
    .line 567
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 568
    .line 569
    .line 570
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 571
    .line 572
    .line 573
    move-result-object v2

    .line 574
    invoke-direct {v3, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 575
    .line 576
    .line 577
    throw v3

    .line 578
    :cond_18
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 579
    .line 580
    const-string v2, "cannot read or generate keyset"

    .line 581
    .line 582
    invoke-direct {v0, v2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 583
    .line 584
    .line 585
    throw v0
.end method

.method public e(Landroid/os/Bundle;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lm/J0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/HashSet;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_4

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ls3/j;

    .line 20
    .line 21
    iget-boolean v2, v1, Ls3/j;->r:Z

    .line 22
    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iget-object v1, v1, Ls3/j;->i:Lc1/f;

    .line 27
    .line 28
    iget-object v1, v1, Lc1/f;->e:Lc1/j;

    .line 29
    .line 30
    iget-object v2, v1, Lc1/j;->a:LB2/a;

    .line 31
    .line 32
    if-eqz v2, :cond_3

    .line 33
    .line 34
    :try_start_0
    new-instance v1, Landroid/os/Bundle;

    .line 35
    .line 36
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {p1, v1}, Ld1/d;->E(Landroid/os/Bundle;Landroid/os/Bundle;)V

    .line 40
    .line 41
    .line 42
    iget-object v2, v2, LB2/a;->g:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v2, Ld1/h;

    .line 45
    .line 46
    invoke-virtual {v2}, LY0/a;->c()Landroid/os/Parcel;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-static {v3, v1}, LZ0/r;->c(Landroid/os/Parcel;Landroid/os/Parcelable;)V

    .line 51
    .line 52
    .line 53
    const/4 v4, 0x7

    .line 54
    invoke-virtual {v2, v3, v4}, LY0/a;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v2}, Landroid/os/Parcel;->readInt()I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-eqz v3, :cond_2

    .line 63
    .line 64
    invoke-virtual {v1, v2}, Landroid/os/Bundle;->readFromParcel(Landroid/os/Parcel;)V

    .line 65
    .line 66
    .line 67
    :cond_2
    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V

    .line 68
    .line 69
    .line 70
    invoke-static {v1, p1}, Ld1/d;->E(Landroid/os/Bundle;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :catch_0
    move-exception p1

    .line 75
    new-instance v0, Le1/x;

    .line 76
    .line 77
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    throw v0

    .line 81
    :cond_3
    iget-object v1, v1, Lc1/j;->b:Landroid/os/Bundle;

    .line 82
    .line 83
    if-eqz v1, :cond_0

    .line 84
    .line 85
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_4
    return-void
.end method

.method public get()Ljava/lang/Object;
    .locals 11

    .line 1
    iget-object v0, p0, Lm/J0;->e:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lx3/a;

    .line 4
    .line 5
    invoke-interface {v0}, Lx3/a;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    move-object v2, v0

    .line 10
    check-cast v2, Landroid/content/Context;

    .line 11
    .line 12
    iget-object v0, p0, Lm/J0;->f:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Lx3/a;

    .line 15
    .line 16
    invoke-interface {v0}, Lx3/a;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    move-object v3, v0

    .line 21
    check-cast v3, Lz0/e;

    .line 22
    .line 23
    iget-object v0, p0, Lm/J0;->g:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v0, Lx3/a;

    .line 26
    .line 27
    invoke-interface {v0}, Lx3/a;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    move-object v4, v0

    .line 32
    check-cast v4, LF0/d;

    .line 33
    .line 34
    iget-object v0, p0, Lm/J0;->h:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v0, LB2/a;

    .line 37
    .line 38
    invoke-virtual {v0}, LB2/a;->get()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    move-object v5, v0

    .line 43
    check-cast v5, LE0/d;

    .line 44
    .line 45
    iget-object v0, p0, Lm/J0;->i:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast v0, Lx3/a;

    .line 48
    .line 49
    invoke-interface {v0}, Lx3/a;->get()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    move-object v6, v0

    .line 54
    check-cast v6, Ljava/util/concurrent/Executor;

    .line 55
    .line 56
    iget-object v0, p0, Lm/J0;->j:Ljava/lang/Object;

    .line 57
    .line 58
    check-cast v0, Lx3/a;

    .line 59
    .line 60
    invoke-interface {v0}, Lx3/a;->get()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    move-object v7, v0

    .line 65
    check-cast v7, LG0/c;

    .line 66
    .line 67
    new-instance v8, LK0/h;

    .line 68
    .line 69
    const/4 v0, 0x2

    .line 70
    invoke-direct {v8, v0}, LK0/h;-><init>(I)V

    .line 71
    .line 72
    .line 73
    new-instance v9, LN1/e;

    .line 74
    .line 75
    const/4 v0, 0x1

    .line 76
    invoke-direct {v9, v0}, LN1/e;-><init>(I)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lm/J0;->k:Ljava/lang/Object;

    .line 80
    .line 81
    check-cast v0, Lx3/a;

    .line 82
    .line 83
    invoke-interface {v0}, Lx3/a;->get()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    move-object v10, v0

    .line 88
    check-cast v10, LF0/c;

    .line 89
    .line 90
    new-instance v1, LE0/l;

    .line 91
    .line 92
    invoke-direct/range {v1 .. v10}, LE0/l;-><init>(Landroid/content/Context;Lz0/e;LF0/d;LE0/d;Ljava/util/concurrent/Executor;LG0/c;LH0/a;LH0/a;LF0/c;)V

    .line 93
    .line 94
    .line 95
    return-object v1
.end method

.method public h([B)Lj1/c;
    .locals 4

    .line 1
    :try_start_0
    new-instance v0, Lr1/c;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lm/J0;->h:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v1, Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lr1/c;->b(Ljava/lang/String;)Lr1/b;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lm/J0;->i:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/security/ProviderException; {:try_start_0 .. :try_end_0} :catch_3

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    :try_start_1
    new-array v0, v0, [B

    .line 18
    .line 19
    new-instance v1, Lj1/c;

    .line 20
    .line 21
    new-instance v2, Ljava/io/ByteArrayInputStream;

    .line 22
    .line 23
    invoke-direct {v2, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 24
    .line 25
    .line 26
    const/4 v3, 0x1

    .line 27
    invoke-direct {v1, v3, v2}, Lj1/c;-><init>(ILjava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Lm/J0;->i:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v2, Lr1/b;

    .line 33
    .line 34
    invoke-static {v1, v2, v0}, Ld1/d;->u(Lj1/c;Lr1/b;[B)LB2/a;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Lj1/c;

    .line 39
    .line 40
    invoke-virtual {v0}, LB2/a;->y()Lx1/g0;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/w;->y()Lcom/google/crypto/tink/shaded/protobuf/u;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lx1/d0;

    .line 49
    .line 50
    const/4 v2, 0x3

    .line 51
    invoke-direct {v1, v2, v0}, Lj1/c;-><init>(ILjava/lang/Object;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/security/GeneralSecurityException; {:try_start_1 .. :try_end_1} :catch_0

    .line 52
    .line 53
    .line 54
    return-object v1

    .line 55
    :catch_0
    move-exception v0

    .line 56
    goto :goto_0

    .line 57
    :catch_1
    move-exception v0

    .line 58
    :goto_0
    :try_start_2
    invoke-static {p1}, Lm/J0;->g([B)Lj1/c;

    .line 59
    .line 60
    .line 61
    move-result-object p1
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 62
    return-object p1

    .line 63
    :catch_2
    throw v0

    .line 64
    :catch_3
    move-exception v0

    .line 65
    goto :goto_1

    .line 66
    :catch_4
    move-exception v0

    .line 67
    :goto_1
    :try_start_3
    invoke-static {p1}, Lm/J0;->g([B)Lj1/c;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    const-string v1, "a"

    .line 72
    .line 73
    const-string v2, "cannot use Android Keystore, it\'ll be disabled"

    .line 74
    .line 75
    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_5

    .line 76
    .line 77
    .line 78
    return-object p1

    .line 79
    :catch_5
    throw v0
.end method

.method public i()Lr1/b;
    .locals 6

    .line 1
    const-string v0, "cannot use Android Keystore, it\'ll be disabled"

    .line 2
    .line 3
    const-string v1, "a"

    .line 4
    .line 5
    new-instance v2, Lr1/c;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    :try_start_0
    iget-object v4, p0, Lm/J0;->h:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v4, Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v4}, Lr1/c;->a(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v4
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/security/ProviderException; {:try_start_0 .. :try_end_0} :catch_2

    .line 19
    :try_start_1
    iget-object v5, p0, Lm/J0;->h:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v5, Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v2, v5}, Lr1/c;->b(Ljava/lang/String;)Lr1/b;

    .line 24
    .line 25
    .line 26
    move-result-object v0
    :try_end_1
    .catch Ljava/security/GeneralSecurityException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/security/ProviderException; {:try_start_1 .. :try_end_1} :catch_0

    .line 27
    return-object v0

    .line 28
    :catch_0
    move-exception v2

    .line 29
    goto :goto_0

    .line 30
    :catch_1
    move-exception v2

    .line 31
    :goto_0
    if-eqz v4, :cond_0

    .line 32
    .line 33
    invoke-static {v1, v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 34
    .line 35
    .line 36
    return-object v3

    .line 37
    :cond_0
    new-instance v0, Ljava/security/KeyStoreException;

    .line 38
    .line 39
    iget-object v1, p0, Lm/J0;->h:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast v1, Ljava/lang/String;

    .line 42
    .line 43
    const-string v3, "the master key "

    .line 44
    .line 45
    const-string v4, " exists but is unusable"

    .line 46
    .line 47
    invoke-static {v3, v1, v4}, Lr/a;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-direct {v0, v1, v2}, Ljava/security/KeyStoreException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    throw v0

    .line 55
    :catch_2
    move-exception v2

    .line 56
    goto :goto_1

    .line 57
    :catch_3
    move-exception v2

    .line 58
    :goto_1
    invoke-static {v1, v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 59
    .line 60
    .line 61
    return-object v3
.end method
