.class public final Lc2/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LZ1/t;


# instance fields
.field public final synthetic e:I

.field public final f:LZ2/s;


# direct methods
.method public synthetic constructor <init>(LZ2/s;I)V
    .locals 0

    .line 1
    iput p2, p0, Lc2/d;->e:I

    iput-object p1, p0, Lc2/d;->f:LZ2/s;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final create(LZ1/e;Lg2/a;)LZ1/s;
    .locals 12

    .line 1
    iget v3, p0, Lc2/d;->e:I

    .line 2
    .line 3
    iget-object v4, p0, Lc2/d;->f:LZ2/s;

    .line 4
    .line 5
    const-class v5, Ljava/lang/Object;

    .line 6
    .line 7
    const/4 v6, 0x0

    .line 8
    const/4 v7, 0x0

    .line 9
    packed-switch v3, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    iget-object v3, p2, Lg2/a;->b:Ljava/lang/reflect/Type;

    .line 13
    .line 14
    iget-object v8, p2, Lg2/a;->a:Ljava/lang/Class;

    .line 15
    .line 16
    const-class v9, Ljava/util/Map;

    .line 17
    .line 18
    invoke-virtual {v9, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 19
    .line 20
    .line 21
    move-result v10

    .line 22
    if-nez v10, :cond_0

    .line 23
    .line 24
    goto/16 :goto_3

    .line 25
    .line 26
    :cond_0
    const-class v6, Ljava/util/Properties;

    .line 27
    .line 28
    invoke-virtual {v6, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 29
    .line 30
    .line 31
    move-result v6

    .line 32
    const/4 v10, 0x2

    .line 33
    const/4 v11, 0x1

    .line 34
    if-eqz v6, :cond_1

    .line 35
    .line 36
    new-array v3, v10, [Ljava/lang/reflect/Type;

    .line 37
    .line 38
    const-class v5, Ljava/lang/String;

    .line 39
    .line 40
    aput-object v5, v3, v7

    .line 41
    .line 42
    aput-object v5, v3, v11

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    instance-of v6, v3, Ljava/lang/reflect/WildcardType;

    .line 46
    .line 47
    if-eqz v6, :cond_2

    .line 48
    .line 49
    check-cast v3, Ljava/lang/reflect/WildcardType;

    .line 50
    .line 51
    invoke-interface {v3}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    aget-object v3, v3, v7

    .line 56
    .line 57
    :cond_2
    invoke-virtual {v9, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 58
    .line 59
    .line 60
    move-result v6

    .line 61
    invoke-static {v6}, Lb2/d;->b(Z)V

    .line 62
    .line 63
    .line 64
    invoke-static {v3, v8, v9}, Lb2/d;->g(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/reflect/Type;

    .line 65
    .line 66
    .line 67
    move-result-object v6

    .line 68
    new-instance v9, Ljava/util/HashMap;

    .line 69
    .line 70
    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-static {v3, v8, v6, v9}, Lb2/d;->k(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/util/HashMap;)Ljava/lang/reflect/Type;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    instance-of v6, v3, Ljava/lang/reflect/ParameterizedType;

    .line 78
    .line 79
    if-eqz v6, :cond_3

    .line 80
    .line 81
    check-cast v3, Ljava/lang/reflect/ParameterizedType;

    .line 82
    .line 83
    invoke-interface {v3}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    goto :goto_0

    .line 88
    :cond_3
    new-array v3, v10, [Ljava/lang/reflect/Type;

    .line 89
    .line 90
    aput-object v5, v3, v7

    .line 91
    .line 92
    aput-object v5, v3, v11

    .line 93
    .line 94
    :goto_0
    aget-object v5, v3, v7

    .line 95
    .line 96
    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 97
    .line 98
    if-eq v5, v6, :cond_5

    .line 99
    .line 100
    const-class v6, Ljava/lang/Boolean;

    .line 101
    .line 102
    if-ne v5, v6, :cond_4

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_4
    new-instance v6, Lg2/a;

    .line 106
    .line 107
    invoke-direct {v6, v5}, Lg2/a;-><init>(Ljava/lang/reflect/Type;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1, v6}, LZ1/e;->c(Lg2/a;)LZ1/s;

    .line 111
    .line 112
    .line 113
    move-result-object v5

    .line 114
    goto :goto_2

    .line 115
    :cond_5
    :goto_1
    sget-object v5, Lc2/i0;->c:Lc2/c0;

    .line 116
    .line 117
    :goto_2
    aget-object v6, v3, v11

    .line 118
    .line 119
    new-instance v8, Lg2/a;

    .line 120
    .line 121
    invoke-direct {v8, v6}, Lg2/a;-><init>(Ljava/lang/reflect/Type;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1, v8}, LZ1/e;->c(Lg2/a;)LZ1/s;

    .line 125
    .line 126
    .line 127
    move-result-object v6

    .line 128
    move v8, v7

    .line 129
    invoke-virtual {v4, p2}, LZ2/s;->z(Lg2/a;)Lb2/o;

    .line 130
    .line 131
    .line 132
    move-result-object v7

    .line 133
    new-instance v0, Lc2/r;

    .line 134
    .line 135
    move-object v4, v3

    .line 136
    aget-object v3, v4, v8

    .line 137
    .line 138
    aget-object v4, v4, v11

    .line 139
    .line 140
    move-object v1, v5

    .line 141
    move-object v5, v4

    .line 142
    move-object v4, v1

    .line 143
    move-object v1, p0

    .line 144
    move-object v2, p1

    .line 145
    invoke-direct/range {v0 .. v7}, Lc2/r;-><init>(Lc2/d;LZ1/e;Ljava/lang/reflect/Type;LZ1/s;Ljava/lang/reflect/Type;LZ1/s;Lb2/o;)V

    .line 146
    .line 147
    .line 148
    move-object v6, v0

    .line 149
    :goto_3
    return-object v6

    .line 150
    :pswitch_0
    move v8, v7

    .line 151
    iget-object v1, p2, Lg2/a;->b:Ljava/lang/reflect/Type;

    .line 152
    .line 153
    iget-object v3, p2, Lg2/a;->a:Ljava/lang/Class;

    .line 154
    .line 155
    const-class v7, Ljava/util/Collection;

    .line 156
    .line 157
    invoke-virtual {v7, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 158
    .line 159
    .line 160
    move-result v9

    .line 161
    if-nez v9, :cond_6

    .line 162
    .line 163
    goto :goto_4

    .line 164
    :cond_6
    instance-of v6, v1, Ljava/lang/reflect/WildcardType;

    .line 165
    .line 166
    if-eqz v6, :cond_7

    .line 167
    .line 168
    check-cast v1, Ljava/lang/reflect/WildcardType;

    .line 169
    .line 170
    invoke-interface {v1}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    aget-object v1, v1, v8

    .line 175
    .line 176
    :cond_7
    invoke-virtual {v7, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 177
    .line 178
    .line 179
    move-result v6

    .line 180
    invoke-static {v6}, Lb2/d;->b(Z)V

    .line 181
    .line 182
    .line 183
    invoke-static {v1, v3, v7}, Lb2/d;->g(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/reflect/Type;

    .line 184
    .line 185
    .line 186
    move-result-object v6

    .line 187
    new-instance v7, Ljava/util/HashMap;

    .line 188
    .line 189
    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 190
    .line 191
    .line 192
    invoke-static {v1, v3, v6, v7}, Lb2/d;->k(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/util/HashMap;)Ljava/lang/reflect/Type;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    instance-of v3, v1, Ljava/lang/reflect/ParameterizedType;

    .line 197
    .line 198
    if-eqz v3, :cond_8

    .line 199
    .line 200
    check-cast v1, Ljava/lang/reflect/ParameterizedType;

    .line 201
    .line 202
    invoke-interface {v1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    aget-object v5, v1, v8

    .line 207
    .line 208
    :cond_8
    new-instance v1, Lg2/a;

    .line 209
    .line 210
    invoke-direct {v1, v5}, Lg2/a;-><init>(Ljava/lang/reflect/Type;)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {p1, v1}, LZ1/e;->c(Lg2/a;)LZ1/s;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    invoke-virtual {v4, p2}, LZ2/s;->z(Lg2/a;)Lb2/o;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    new-instance v6, Lc2/c;

    .line 222
    .line 223
    invoke-direct {v6, p1, v5, v1, v0}, Lc2/c;-><init>(LZ1/e;Ljava/lang/reflect/Type;LZ1/s;Lb2/o;)V

    .line 224
    .line 225
    .line 226
    :goto_4
    return-object v6

    .line 227
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
