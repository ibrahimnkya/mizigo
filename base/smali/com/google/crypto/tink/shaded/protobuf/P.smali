.class public final Lcom/google/crypto/tink/shaded/protobuf/P;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/crypto/tink/shaded/protobuf/Y;


# static fields
.field public static final n:[I

.field public static final o:Lsun/misc/Unsafe;


# instance fields
.field public final a:[I

.field public final b:[Ljava/lang/Object;

.field public final c:I

.field public final d:I

.field public final e:Lcom/google/crypto/tink/shaded/protobuf/a;

.field public final f:Z

.field public final g:[I

.field public final h:I

.field public final i:I

.field public final j:Lcom/google/crypto/tink/shaded/protobuf/S;

.field public final k:Lcom/google/crypto/tink/shaded/protobuf/E;

.field public final l:Lcom/google/crypto/tink/shaded/protobuf/c0;

.field public final m:Lcom/google/crypto/tink/shaded/protobuf/K;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    sput-object v0, Lcom/google/crypto/tink/shaded/protobuf/P;->n:[I

    .line 5
    .line 6
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/h0;->j()Lsun/misc/Unsafe;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Lcom/google/crypto/tink/shaded/protobuf/P;->o:Lsun/misc/Unsafe;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>([I[Ljava/lang/Object;IILcom/google/crypto/tink/shaded/protobuf/a;[IIILcom/google/crypto/tink/shaded/protobuf/S;Lcom/google/crypto/tink/shaded/protobuf/E;Lcom/google/crypto/tink/shaded/protobuf/c0;Lcom/google/crypto/tink/shaded/protobuf/p;Lcom/google/crypto/tink/shaded/protobuf/K;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->a:[I

    .line 5
    .line 6
    iput-object p2, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->b:[Ljava/lang/Object;

    .line 7
    .line 8
    iput p3, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->c:I

    .line 9
    .line 10
    iput p4, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->d:I

    .line 11
    .line 12
    instance-of p1, p5, Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 13
    .line 14
    iput-boolean p1, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->f:Z

    .line 15
    .line 16
    iput-object p6, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->g:[I

    .line 17
    .line 18
    iput p7, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->h:I

    .line 19
    .line 20
    iput p8, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->i:I

    .line 21
    .line 22
    iput-object p9, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->j:Lcom/google/crypto/tink/shaded/protobuf/S;

    .line 23
    .line 24
    iput-object p10, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->k:Lcom/google/crypto/tink/shaded/protobuf/E;

    .line 25
    .line 26
    iput-object p11, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->l:Lcom/google/crypto/tink/shaded/protobuf/c0;

    .line 27
    .line 28
    iput-object p5, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->e:Lcom/google/crypto/tink/shaded/protobuf/a;

    .line 29
    .line 30
    iput-object p13, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->m:Lcom/google/crypto/tink/shaded/protobuf/K;

    .line 31
    .line 32
    return-void
.end method

.method public static A(I)J
    .locals 2

    .line 1
    const v0, 0xfffff

    and-int/2addr p0, v0

    int-to-long v0, p0

    return-wide v0
.end method

.method public static B(JLjava/lang/Object;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

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
    move-result p0

    .line 13
    return p0
.end method

.method public static C(JLjava/lang/Object;)J
    .locals 1

    .line 1
    sget-object v0, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 2
    .line 3
    invoke-virtual {v0, p0, p1, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    return-wide p0
.end method

.method public static L(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .locals 6

    .line 1
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object p0

    .line 6
    :catch_0
    move-exception v0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    array-length v2, v1

    .line 12
    const/4 v3, 0x0

    .line 13
    :goto_0
    if-ge v3, v2, :cond_1

    .line 14
    .line 15
    aget-object v4, v1, v3

    .line 16
    .line 17
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    if-eqz v5, :cond_0

    .line 26
    .line 27
    return-object v4

    .line 28
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    new-instance v2, Ljava/lang/RuntimeException;

    .line 32
    .line 33
    new-instance v3, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v4, "Field "

    .line 36
    .line 37
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string p1, " for "

    .line 44
    .line 45
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string p0, " not found. Known fields are "

    .line 56
    .line 57
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-direct {v2, p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 72
    .line 73
    .line 74
    throw v2
.end method

.method public static R(I)I
    .locals 1

    .line 1
    const/high16 v0, 0xff00000

    and-int/2addr p0, v0

    ushr-int/lit8 p0, p0, 0x14

    return p0
.end method

.method public static l(Ljava/lang/Object;)V
    .locals 3

    .line 1
    invoke-static {p0}, Lcom/google/crypto/tink/shaded/protobuf/P;->s(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 9
    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v2, "Mutating immutable message: "

    .line 13
    .line 14
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    throw v0
.end method

.method public static s(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    instance-of v0, p0, Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    check-cast p0, Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/google/crypto/tink/shaded/protobuf/w;->p()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_1
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public static z(Lcom/google/crypto/tink/shaded/protobuf/X;Lcom/google/crypto/tink/shaded/protobuf/S;Lcom/google/crypto/tink/shaded/protobuf/E;Lcom/google/crypto/tink/shaded/protobuf/c0;Lcom/google/crypto/tink/shaded/protobuf/p;Lcom/google/crypto/tink/shaded/protobuf/K;)Lcom/google/crypto/tink/shaded/protobuf/P;
    .locals 34

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/google/crypto/tink/shaded/protobuf/X;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    const/4 v3, 0x0

    .line 10
    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    .line 11
    .line 12
    .line 13
    move-result v4

    .line 14
    const v6, 0xd800

    .line 15
    .line 16
    .line 17
    if-lt v4, v6, :cond_0

    .line 18
    .line 19
    const/4 v4, 0x1

    .line 20
    :goto_0
    add-int/lit8 v7, v4, 0x1

    .line 21
    .line 22
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    if-lt v4, v6, :cond_1

    .line 27
    .line 28
    move v4, v7

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 v7, 0x1

    .line 31
    :cond_1
    add-int/lit8 v4, v7, 0x1

    .line 32
    .line 33
    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    .line 34
    .line 35
    .line 36
    move-result v7

    .line 37
    if-lt v7, v6, :cond_3

    .line 38
    .line 39
    and-int/lit16 v7, v7, 0x1fff

    .line 40
    .line 41
    const/16 v9, 0xd

    .line 42
    .line 43
    :goto_1
    add-int/lit8 v10, v4, 0x1

    .line 44
    .line 45
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    if-lt v4, v6, :cond_2

    .line 50
    .line 51
    and-int/lit16 v4, v4, 0x1fff

    .line 52
    .line 53
    shl-int/2addr v4, v9

    .line 54
    or-int/2addr v7, v4

    .line 55
    add-int/lit8 v9, v9, 0xd

    .line 56
    .line 57
    move v4, v10

    .line 58
    goto :goto_1

    .line 59
    :cond_2
    shl-int/2addr v4, v9

    .line 60
    or-int/2addr v7, v4

    .line 61
    move v4, v10

    .line 62
    :cond_3
    if-nez v7, :cond_4

    .line 63
    .line 64
    sget-object v7, Lcom/google/crypto/tink/shaded/protobuf/P;->n:[I

    .line 65
    .line 66
    move v9, v3

    .line 67
    move v10, v9

    .line 68
    move v11, v10

    .line 69
    move v12, v11

    .line 70
    move v13, v12

    .line 71
    move/from16 v16, v13

    .line 72
    .line 73
    move-object v15, v7

    .line 74
    move/from16 v7, v16

    .line 75
    .line 76
    goto/16 :goto_a

    .line 77
    .line 78
    :cond_4
    add-int/lit8 v7, v4, 0x1

    .line 79
    .line 80
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    if-lt v4, v6, :cond_6

    .line 85
    .line 86
    and-int/lit16 v4, v4, 0x1fff

    .line 87
    .line 88
    const/16 v9, 0xd

    .line 89
    .line 90
    :goto_2
    add-int/lit8 v10, v7, 0x1

    .line 91
    .line 92
    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    .line 93
    .line 94
    .line 95
    move-result v7

    .line 96
    if-lt v7, v6, :cond_5

    .line 97
    .line 98
    and-int/lit16 v7, v7, 0x1fff

    .line 99
    .line 100
    shl-int/2addr v7, v9

    .line 101
    or-int/2addr v4, v7

    .line 102
    add-int/lit8 v9, v9, 0xd

    .line 103
    .line 104
    move v7, v10

    .line 105
    goto :goto_2

    .line 106
    :cond_5
    shl-int/2addr v7, v9

    .line 107
    or-int/2addr v4, v7

    .line 108
    move v7, v10

    .line 109
    :cond_6
    add-int/lit8 v9, v7, 0x1

    .line 110
    .line 111
    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    .line 112
    .line 113
    .line 114
    move-result v7

    .line 115
    if-lt v7, v6, :cond_8

    .line 116
    .line 117
    and-int/lit16 v7, v7, 0x1fff

    .line 118
    .line 119
    const/16 v10, 0xd

    .line 120
    .line 121
    :goto_3
    add-int/lit8 v11, v9, 0x1

    .line 122
    .line 123
    invoke-virtual {v1, v9}, Ljava/lang/String;->charAt(I)C

    .line 124
    .line 125
    .line 126
    move-result v9

    .line 127
    if-lt v9, v6, :cond_7

    .line 128
    .line 129
    and-int/lit16 v9, v9, 0x1fff

    .line 130
    .line 131
    shl-int/2addr v9, v10

    .line 132
    or-int/2addr v7, v9

    .line 133
    add-int/lit8 v10, v10, 0xd

    .line 134
    .line 135
    move v9, v11

    .line 136
    goto :goto_3

    .line 137
    :cond_7
    shl-int/2addr v9, v10

    .line 138
    or-int/2addr v7, v9

    .line 139
    move v9, v11

    .line 140
    :cond_8
    add-int/lit8 v10, v9, 0x1

    .line 141
    .line 142
    invoke-virtual {v1, v9}, Ljava/lang/String;->charAt(I)C

    .line 143
    .line 144
    .line 145
    move-result v9

    .line 146
    if-lt v9, v6, :cond_a

    .line 147
    .line 148
    and-int/lit16 v9, v9, 0x1fff

    .line 149
    .line 150
    const/16 v11, 0xd

    .line 151
    .line 152
    :goto_4
    add-int/lit8 v12, v10, 0x1

    .line 153
    .line 154
    invoke-virtual {v1, v10}, Ljava/lang/String;->charAt(I)C

    .line 155
    .line 156
    .line 157
    move-result v10

    .line 158
    if-lt v10, v6, :cond_9

    .line 159
    .line 160
    and-int/lit16 v10, v10, 0x1fff

    .line 161
    .line 162
    shl-int/2addr v10, v11

    .line 163
    or-int/2addr v9, v10

    .line 164
    add-int/lit8 v11, v11, 0xd

    .line 165
    .line 166
    move v10, v12

    .line 167
    goto :goto_4

    .line 168
    :cond_9
    shl-int/2addr v10, v11

    .line 169
    or-int/2addr v9, v10

    .line 170
    move v10, v12

    .line 171
    :cond_a
    add-int/lit8 v11, v10, 0x1

    .line 172
    .line 173
    invoke-virtual {v1, v10}, Ljava/lang/String;->charAt(I)C

    .line 174
    .line 175
    .line 176
    move-result v10

    .line 177
    if-lt v10, v6, :cond_c

    .line 178
    .line 179
    and-int/lit16 v10, v10, 0x1fff

    .line 180
    .line 181
    const/16 v12, 0xd

    .line 182
    .line 183
    :goto_5
    add-int/lit8 v13, v11, 0x1

    .line 184
    .line 185
    invoke-virtual {v1, v11}, Ljava/lang/String;->charAt(I)C

    .line 186
    .line 187
    .line 188
    move-result v11

    .line 189
    if-lt v11, v6, :cond_b

    .line 190
    .line 191
    and-int/lit16 v11, v11, 0x1fff

    .line 192
    .line 193
    shl-int/2addr v11, v12

    .line 194
    or-int/2addr v10, v11

    .line 195
    add-int/lit8 v12, v12, 0xd

    .line 196
    .line 197
    move v11, v13

    .line 198
    goto :goto_5

    .line 199
    :cond_b
    shl-int/2addr v11, v12

    .line 200
    or-int/2addr v10, v11

    .line 201
    move v11, v13

    .line 202
    :cond_c
    add-int/lit8 v12, v11, 0x1

    .line 203
    .line 204
    invoke-virtual {v1, v11}, Ljava/lang/String;->charAt(I)C

    .line 205
    .line 206
    .line 207
    move-result v11

    .line 208
    if-lt v11, v6, :cond_e

    .line 209
    .line 210
    and-int/lit16 v11, v11, 0x1fff

    .line 211
    .line 212
    const/16 v13, 0xd

    .line 213
    .line 214
    :goto_6
    add-int/lit8 v14, v12, 0x1

    .line 215
    .line 216
    invoke-virtual {v1, v12}, Ljava/lang/String;->charAt(I)C

    .line 217
    .line 218
    .line 219
    move-result v12

    .line 220
    if-lt v12, v6, :cond_d

    .line 221
    .line 222
    and-int/lit16 v12, v12, 0x1fff

    .line 223
    .line 224
    shl-int/2addr v12, v13

    .line 225
    or-int/2addr v11, v12

    .line 226
    add-int/lit8 v13, v13, 0xd

    .line 227
    .line 228
    move v12, v14

    .line 229
    goto :goto_6

    .line 230
    :cond_d
    shl-int/2addr v12, v13

    .line 231
    or-int/2addr v11, v12

    .line 232
    move v12, v14

    .line 233
    :cond_e
    add-int/lit8 v13, v12, 0x1

    .line 234
    .line 235
    invoke-virtual {v1, v12}, Ljava/lang/String;->charAt(I)C

    .line 236
    .line 237
    .line 238
    move-result v12

    .line 239
    if-lt v12, v6, :cond_10

    .line 240
    .line 241
    and-int/lit16 v12, v12, 0x1fff

    .line 242
    .line 243
    const/16 v14, 0xd

    .line 244
    .line 245
    :goto_7
    add-int/lit8 v15, v13, 0x1

    .line 246
    .line 247
    invoke-virtual {v1, v13}, Ljava/lang/String;->charAt(I)C

    .line 248
    .line 249
    .line 250
    move-result v13

    .line 251
    if-lt v13, v6, :cond_f

    .line 252
    .line 253
    and-int/lit16 v13, v13, 0x1fff

    .line 254
    .line 255
    shl-int/2addr v13, v14

    .line 256
    or-int/2addr v12, v13

    .line 257
    add-int/lit8 v14, v14, 0xd

    .line 258
    .line 259
    move v13, v15

    .line 260
    goto :goto_7

    .line 261
    :cond_f
    shl-int/2addr v13, v14

    .line 262
    or-int/2addr v12, v13

    .line 263
    move v13, v15

    .line 264
    :cond_10
    add-int/lit8 v14, v13, 0x1

    .line 265
    .line 266
    invoke-virtual {v1, v13}, Ljava/lang/String;->charAt(I)C

    .line 267
    .line 268
    .line 269
    move-result v13

    .line 270
    if-lt v13, v6, :cond_12

    .line 271
    .line 272
    and-int/lit16 v13, v13, 0x1fff

    .line 273
    .line 274
    const/16 v15, 0xd

    .line 275
    .line 276
    :goto_8
    add-int/lit8 v16, v14, 0x1

    .line 277
    .line 278
    invoke-virtual {v1, v14}, Ljava/lang/String;->charAt(I)C

    .line 279
    .line 280
    .line 281
    move-result v14

    .line 282
    if-lt v14, v6, :cond_11

    .line 283
    .line 284
    and-int/lit16 v14, v14, 0x1fff

    .line 285
    .line 286
    shl-int/2addr v14, v15

    .line 287
    or-int/2addr v13, v14

    .line 288
    add-int/lit8 v15, v15, 0xd

    .line 289
    .line 290
    move/from16 v14, v16

    .line 291
    .line 292
    goto :goto_8

    .line 293
    :cond_11
    shl-int/2addr v14, v15

    .line 294
    or-int/2addr v13, v14

    .line 295
    move/from16 v14, v16

    .line 296
    .line 297
    :cond_12
    add-int/lit8 v15, v14, 0x1

    .line 298
    .line 299
    invoke-virtual {v1, v14}, Ljava/lang/String;->charAt(I)C

    .line 300
    .line 301
    .line 302
    move-result v14

    .line 303
    if-lt v14, v6, :cond_14

    .line 304
    .line 305
    and-int/lit16 v14, v14, 0x1fff

    .line 306
    .line 307
    const/16 v16, 0xd

    .line 308
    .line 309
    :goto_9
    add-int/lit8 v17, v15, 0x1

    .line 310
    .line 311
    invoke-virtual {v1, v15}, Ljava/lang/String;->charAt(I)C

    .line 312
    .line 313
    .line 314
    move-result v15

    .line 315
    if-lt v15, v6, :cond_13

    .line 316
    .line 317
    and-int/lit16 v15, v15, 0x1fff

    .line 318
    .line 319
    shl-int v15, v15, v16

    .line 320
    .line 321
    or-int/2addr v14, v15

    .line 322
    add-int/lit8 v16, v16, 0xd

    .line 323
    .line 324
    move/from16 v15, v17

    .line 325
    .line 326
    goto :goto_9

    .line 327
    :cond_13
    shl-int v15, v15, v16

    .line 328
    .line 329
    or-int/2addr v14, v15

    .line 330
    move/from16 v15, v17

    .line 331
    .line 332
    :cond_14
    add-int v16, v14, v12

    .line 333
    .line 334
    add-int v13, v16, v13

    .line 335
    .line 336
    new-array v13, v13, [I

    .line 337
    .line 338
    mul-int/lit8 v16, v4, 0x2

    .line 339
    .line 340
    add-int v16, v16, v7

    .line 341
    .line 342
    move v7, v12

    .line 343
    move v12, v9

    .line 344
    move v9, v7

    .line 345
    move v7, v4

    .line 346
    move v4, v15

    .line 347
    move-object v15, v13

    .line 348
    move v13, v10

    .line 349
    move/from16 v10, v16

    .line 350
    .line 351
    move/from16 v16, v14

    .line 352
    .line 353
    :goto_a
    sget-object v14, Lcom/google/crypto/tink/shaded/protobuf/P;->o:Lsun/misc/Unsafe;

    .line 354
    .line 355
    iget-object v3, v0, Lcom/google/crypto/tink/shaded/protobuf/X;->c:[Ljava/lang/Object;

    .line 356
    .line 357
    iget-object v8, v0, Lcom/google/crypto/tink/shaded/protobuf/X;->a:Lcom/google/crypto/tink/shaded/protobuf/a;

    .line 358
    .line 359
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 360
    .line 361
    .line 362
    move-result-object v8

    .line 363
    mul-int/lit8 v5, v11, 0x3

    .line 364
    .line 365
    new-array v5, v5, [I

    .line 366
    .line 367
    mul-int/lit8 v11, v11, 0x2

    .line 368
    .line 369
    new-array v11, v11, [Ljava/lang/Object;

    .line 370
    .line 371
    add-int v9, v16, v9

    .line 372
    .line 373
    move/from16 v23, v9

    .line 374
    .line 375
    move/from16 v22, v16

    .line 376
    .line 377
    const/16 v20, 0x0

    .line 378
    .line 379
    const/16 v21, 0x0

    .line 380
    .line 381
    :goto_b
    if-ge v4, v2, :cond_35

    .line 382
    .line 383
    add-int/lit8 v24, v4, 0x1

    .line 384
    .line 385
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    .line 386
    .line 387
    .line 388
    move-result v4

    .line 389
    if-lt v4, v6, :cond_16

    .line 390
    .line 391
    and-int/lit16 v4, v4, 0x1fff

    .line 392
    .line 393
    move/from16 v6, v24

    .line 394
    .line 395
    const/16 v24, 0xd

    .line 396
    .line 397
    :goto_c
    add-int/lit8 v26, v6, 0x1

    .line 398
    .line 399
    invoke-virtual {v1, v6}, Ljava/lang/String;->charAt(I)C

    .line 400
    .line 401
    .line 402
    move-result v6

    .line 403
    move/from16 v27, v2

    .line 404
    .line 405
    const v2, 0xd800

    .line 406
    .line 407
    .line 408
    if-lt v6, v2, :cond_15

    .line 409
    .line 410
    and-int/lit16 v2, v6, 0x1fff

    .line 411
    .line 412
    shl-int v2, v2, v24

    .line 413
    .line 414
    or-int/2addr v4, v2

    .line 415
    add-int/lit8 v24, v24, 0xd

    .line 416
    .line 417
    move/from16 v6, v26

    .line 418
    .line 419
    move/from16 v2, v27

    .line 420
    .line 421
    goto :goto_c

    .line 422
    :cond_15
    shl-int v2, v6, v24

    .line 423
    .line 424
    or-int/2addr v4, v2

    .line 425
    move/from16 v2, v26

    .line 426
    .line 427
    goto :goto_d

    .line 428
    :cond_16
    move/from16 v27, v2

    .line 429
    .line 430
    move/from16 v2, v24

    .line 431
    .line 432
    :goto_d
    add-int/lit8 v6, v2, 0x1

    .line 433
    .line 434
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    .line 435
    .line 436
    .line 437
    move-result v2

    .line 438
    move-object/from16 v24, v3

    .line 439
    .line 440
    const v3, 0xd800

    .line 441
    .line 442
    .line 443
    if-lt v2, v3, :cond_18

    .line 444
    .line 445
    and-int/lit16 v2, v2, 0x1fff

    .line 446
    .line 447
    const/16 v26, 0xd

    .line 448
    .line 449
    :goto_e
    add-int/lit8 v28, v6, 0x1

    .line 450
    .line 451
    invoke-virtual {v1, v6}, Ljava/lang/String;->charAt(I)C

    .line 452
    .line 453
    .line 454
    move-result v6

    .line 455
    if-lt v6, v3, :cond_17

    .line 456
    .line 457
    and-int/lit16 v3, v6, 0x1fff

    .line 458
    .line 459
    shl-int v3, v3, v26

    .line 460
    .line 461
    or-int/2addr v2, v3

    .line 462
    add-int/lit8 v26, v26, 0xd

    .line 463
    .line 464
    move/from16 v6, v28

    .line 465
    .line 466
    const v3, 0xd800

    .line 467
    .line 468
    .line 469
    goto :goto_e

    .line 470
    :cond_17
    shl-int v3, v6, v26

    .line 471
    .line 472
    or-int/2addr v2, v3

    .line 473
    move/from16 v6, v28

    .line 474
    .line 475
    :cond_18
    and-int/lit16 v3, v2, 0xff

    .line 476
    .line 477
    move/from16 v26, v4

    .line 478
    .line 479
    and-int/lit16 v4, v2, 0x400

    .line 480
    .line 481
    if-eqz v4, :cond_19

    .line 482
    .line 483
    add-int/lit8 v4, v20, 0x1

    .line 484
    .line 485
    aput v21, v15, v20

    .line 486
    .line 487
    move/from16 v20, v4

    .line 488
    .line 489
    :cond_19
    const/16 v4, 0x33

    .line 490
    .line 491
    move-object/from16 v30, v5

    .line 492
    .line 493
    if-lt v3, v4, :cond_22

    .line 494
    .line 495
    add-int/lit8 v4, v6, 0x1

    .line 496
    .line 497
    invoke-virtual {v1, v6}, Ljava/lang/String;->charAt(I)C

    .line 498
    .line 499
    .line 500
    move-result v6

    .line 501
    const v5, 0xd800

    .line 502
    .line 503
    .line 504
    if-lt v6, v5, :cond_1b

    .line 505
    .line 506
    and-int/lit16 v6, v6, 0x1fff

    .line 507
    .line 508
    const/16 v31, 0xd

    .line 509
    .line 510
    :goto_f
    add-int/lit8 v32, v4, 0x1

    .line 511
    .line 512
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    .line 513
    .line 514
    .line 515
    move-result v4

    .line 516
    if-lt v4, v5, :cond_1a

    .line 517
    .line 518
    and-int/lit16 v4, v4, 0x1fff

    .line 519
    .line 520
    shl-int v4, v4, v31

    .line 521
    .line 522
    or-int/2addr v6, v4

    .line 523
    add-int/lit8 v31, v31, 0xd

    .line 524
    .line 525
    move/from16 v4, v32

    .line 526
    .line 527
    const v5, 0xd800

    .line 528
    .line 529
    .line 530
    goto :goto_f

    .line 531
    :cond_1a
    shl-int v4, v4, v31

    .line 532
    .line 533
    or-int/2addr v6, v4

    .line 534
    move/from16 v4, v32

    .line 535
    .line 536
    :cond_1b
    add-int/lit8 v5, v3, -0x33

    .line 537
    .line 538
    move/from16 v31, v4

    .line 539
    .line 540
    const/16 v4, 0x9

    .line 541
    .line 542
    if-eq v5, v4, :cond_1e

    .line 543
    .line 544
    const/16 v4, 0x11

    .line 545
    .line 546
    if-ne v5, v4, :cond_1c

    .line 547
    .line 548
    goto :goto_11

    .line 549
    :cond_1c
    const/16 v4, 0xc

    .line 550
    .line 551
    if-ne v5, v4, :cond_1f

    .line 552
    .line 553
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/X;->a()I

    .line 554
    .line 555
    .line 556
    move-result v4

    .line 557
    const/4 v5, 0x1

    .line 558
    invoke-static {v4, v5}, LL/i;->a(II)Z

    .line 559
    .line 560
    .line 561
    move-result v4

    .line 562
    if-nez v4, :cond_1d

    .line 563
    .line 564
    and-int/lit16 v4, v2, 0x800

    .line 565
    .line 566
    if-eqz v4, :cond_1f

    .line 567
    .line 568
    :cond_1d
    div-int/lit8 v4, v21, 0x3

    .line 569
    .line 570
    mul-int/lit8 v4, v4, 0x2

    .line 571
    .line 572
    add-int/2addr v4, v5

    .line 573
    add-int/lit8 v5, v10, 0x1

    .line 574
    .line 575
    aget-object v10, v24, v10

    .line 576
    .line 577
    aput-object v10, v11, v4

    .line 578
    .line 579
    :goto_10
    move v10, v5

    .line 580
    goto :goto_12

    .line 581
    :cond_1e
    :goto_11
    div-int/lit8 v4, v21, 0x3

    .line 582
    .line 583
    mul-int/lit8 v4, v4, 0x2

    .line 584
    .line 585
    const/16 v19, 0x1

    .line 586
    .line 587
    add-int/lit8 v4, v4, 0x1

    .line 588
    .line 589
    add-int/lit8 v5, v10, 0x1

    .line 590
    .line 591
    aget-object v10, v24, v10

    .line 592
    .line 593
    aput-object v10, v11, v4

    .line 594
    .line 595
    goto :goto_10

    .line 596
    :cond_1f
    :goto_12
    mul-int/lit8 v6, v6, 0x2

    .line 597
    .line 598
    aget-object v4, v24, v6

    .line 599
    .line 600
    instance-of v5, v4, Ljava/lang/reflect/Field;

    .line 601
    .line 602
    if-eqz v5, :cond_20

    .line 603
    .line 604
    check-cast v4, Ljava/lang/reflect/Field;

    .line 605
    .line 606
    goto :goto_13

    .line 607
    :cond_20
    check-cast v4, Ljava/lang/String;

    .line 608
    .line 609
    invoke-static {v8, v4}, Lcom/google/crypto/tink/shaded/protobuf/P;->L(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 610
    .line 611
    .line 612
    move-result-object v4

    .line 613
    aput-object v4, v24, v6

    .line 614
    .line 615
    :goto_13
    invoke-virtual {v14, v4}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    .line 616
    .line 617
    .line 618
    move-result-wide v4

    .line 619
    long-to-int v4, v4

    .line 620
    add-int/lit8 v6, v6, 0x1

    .line 621
    .line 622
    aget-object v5, v24, v6

    .line 623
    .line 624
    move/from16 v28, v4

    .line 625
    .line 626
    instance-of v4, v5, Ljava/lang/reflect/Field;

    .line 627
    .line 628
    if-eqz v4, :cond_21

    .line 629
    .line 630
    check-cast v5, Ljava/lang/reflect/Field;

    .line 631
    .line 632
    goto :goto_14

    .line 633
    :cond_21
    check-cast v5, Ljava/lang/String;

    .line 634
    .line 635
    invoke-static {v8, v5}, Lcom/google/crypto/tink/shaded/protobuf/P;->L(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 636
    .line 637
    .line 638
    move-result-object v5

    .line 639
    aput-object v5, v24, v6

    .line 640
    .line 641
    :goto_14
    invoke-virtual {v14, v5}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    .line 642
    .line 643
    .line 644
    move-result-wide v4

    .line 645
    long-to-int v4, v4

    .line 646
    move v5, v7

    .line 647
    move v7, v4

    .line 648
    move/from16 v4, v28

    .line 649
    .line 650
    move/from16 v28, v5

    .line 651
    .line 652
    move v5, v10

    .line 653
    move/from16 v29, v31

    .line 654
    .line 655
    const/4 v6, 0x0

    .line 656
    move-object v10, v8

    .line 657
    goto/16 :goto_1f

    .line 658
    .line 659
    :cond_22
    add-int/lit8 v4, v10, 0x1

    .line 660
    .line 661
    aget-object v5, v24, v10

    .line 662
    .line 663
    check-cast v5, Ljava/lang/String;

    .line 664
    .line 665
    invoke-static {v8, v5}, Lcom/google/crypto/tink/shaded/protobuf/P;->L(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 666
    .line 667
    .line 668
    move-result-object v5

    .line 669
    move/from16 v31, v4

    .line 670
    .line 671
    const/16 v4, 0x9

    .line 672
    .line 673
    if-eq v3, v4, :cond_23

    .line 674
    .line 675
    const/16 v4, 0x11

    .line 676
    .line 677
    if-ne v3, v4, :cond_24

    .line 678
    .line 679
    :cond_23
    move/from16 v28, v7

    .line 680
    .line 681
    const/4 v7, 0x1

    .line 682
    goto/16 :goto_18

    .line 683
    .line 684
    :cond_24
    const/16 v4, 0x1b

    .line 685
    .line 686
    if-eq v3, v4, :cond_25

    .line 687
    .line 688
    const/16 v4, 0x31

    .line 689
    .line 690
    if-ne v3, v4, :cond_26

    .line 691
    .line 692
    :cond_25
    move/from16 v28, v7

    .line 693
    .line 694
    const/4 v7, 0x1

    .line 695
    goto :goto_17

    .line 696
    :cond_26
    const/16 v4, 0xc

    .line 697
    .line 698
    if-eq v3, v4, :cond_2a

    .line 699
    .line 700
    const/16 v4, 0x1e

    .line 701
    .line 702
    if-eq v3, v4, :cond_2a

    .line 703
    .line 704
    const/16 v4, 0x2c

    .line 705
    .line 706
    if-ne v3, v4, :cond_27

    .line 707
    .line 708
    goto :goto_15

    .line 709
    :cond_27
    const/16 v4, 0x32

    .line 710
    .line 711
    if-ne v3, v4, :cond_29

    .line 712
    .line 713
    add-int/lit8 v4, v22, 0x1

    .line 714
    .line 715
    aput v21, v15, v22

    .line 716
    .line 717
    div-int/lit8 v22, v21, 0x3

    .line 718
    .line 719
    mul-int/lit8 v22, v22, 0x2

    .line 720
    .line 721
    add-int/lit8 v28, v10, 0x2

    .line 722
    .line 723
    aget-object v29, v24, v31

    .line 724
    .line 725
    aput-object v29, v11, v22

    .line 726
    .line 727
    move/from16 v29, v4

    .line 728
    .line 729
    and-int/lit16 v4, v2, 0x800

    .line 730
    .line 731
    if-eqz v4, :cond_28

    .line 732
    .line 733
    add-int/lit8 v22, v22, 0x1

    .line 734
    .line 735
    add-int/lit8 v4, v10, 0x3

    .line 736
    .line 737
    aget-object v10, v24, v28

    .line 738
    .line 739
    aput-object v10, v11, v22

    .line 740
    .line 741
    move/from16 v28, v7

    .line 742
    .line 743
    move-object v10, v8

    .line 744
    move/from16 v22, v29

    .line 745
    .line 746
    goto :goto_1a

    .line 747
    :cond_28
    move-object v10, v8

    .line 748
    move/from16 v4, v28

    .line 749
    .line 750
    move/from16 v22, v29

    .line 751
    .line 752
    move/from16 v28, v7

    .line 753
    .line 754
    goto :goto_1a

    .line 755
    :cond_29
    move/from16 v28, v7

    .line 756
    .line 757
    const/4 v7, 0x1

    .line 758
    goto :goto_19

    .line 759
    :cond_2a
    :goto_15
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/X;->a()I

    .line 760
    .line 761
    .line 762
    move-result v4

    .line 763
    move/from16 v28, v7

    .line 764
    .line 765
    const/4 v7, 0x1

    .line 766
    if-eq v4, v7, :cond_2b

    .line 767
    .line 768
    and-int/lit16 v4, v2, 0x800

    .line 769
    .line 770
    if-eqz v4, :cond_2c

    .line 771
    .line 772
    :cond_2b
    div-int/lit8 v4, v21, 0x3

    .line 773
    .line 774
    mul-int/lit8 v4, v4, 0x2

    .line 775
    .line 776
    add-int/2addr v4, v7

    .line 777
    add-int/lit8 v10, v10, 0x2

    .line 778
    .line 779
    aget-object v19, v24, v31

    .line 780
    .line 781
    aput-object v19, v11, v4

    .line 782
    .line 783
    :goto_16
    move v4, v10

    .line 784
    move-object v10, v8

    .line 785
    goto :goto_1a

    .line 786
    :goto_17
    div-int/lit8 v4, v21, 0x3

    .line 787
    .line 788
    mul-int/lit8 v4, v4, 0x2

    .line 789
    .line 790
    add-int/2addr v4, v7

    .line 791
    add-int/lit8 v10, v10, 0x2

    .line 792
    .line 793
    aget-object v19, v24, v31

    .line 794
    .line 795
    aput-object v19, v11, v4

    .line 796
    .line 797
    goto :goto_16

    .line 798
    :goto_18
    div-int/lit8 v4, v21, 0x3

    .line 799
    .line 800
    mul-int/lit8 v4, v4, 0x2

    .line 801
    .line 802
    add-int/2addr v4, v7

    .line 803
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    .line 804
    .line 805
    .line 806
    move-result-object v10

    .line 807
    aput-object v10, v11, v4

    .line 808
    .line 809
    :cond_2c
    :goto_19
    move-object v10, v8

    .line 810
    move/from16 v4, v31

    .line 811
    .line 812
    :goto_1a
    invoke-virtual {v14, v5}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    .line 813
    .line 814
    .line 815
    move-result-wide v7

    .line 816
    long-to-int v5, v7

    .line 817
    and-int/lit16 v7, v2, 0x1000

    .line 818
    .line 819
    if-eqz v7, :cond_30

    .line 820
    .line 821
    const/16 v7, 0x11

    .line 822
    .line 823
    if-gt v3, v7, :cond_30

    .line 824
    .line 825
    add-int/lit8 v7, v6, 0x1

    .line 826
    .line 827
    invoke-virtual {v1, v6}, Ljava/lang/String;->charAt(I)C

    .line 828
    .line 829
    .line 830
    move-result v6

    .line 831
    const v8, 0xd800

    .line 832
    .line 833
    .line 834
    if-lt v6, v8, :cond_2e

    .line 835
    .line 836
    and-int/lit16 v6, v6, 0x1fff

    .line 837
    .line 838
    const/16 v25, 0xd

    .line 839
    .line 840
    :goto_1b
    add-int/lit8 v29, v7, 0x1

    .line 841
    .line 842
    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    .line 843
    .line 844
    .line 845
    move-result v7

    .line 846
    if-lt v7, v8, :cond_2d

    .line 847
    .line 848
    and-int/lit16 v7, v7, 0x1fff

    .line 849
    .line 850
    shl-int v7, v7, v25

    .line 851
    .line 852
    or-int/2addr v6, v7

    .line 853
    add-int/lit8 v25, v25, 0xd

    .line 854
    .line 855
    move/from16 v7, v29

    .line 856
    .line 857
    goto :goto_1b

    .line 858
    :cond_2d
    shl-int v7, v7, v25

    .line 859
    .line 860
    or-int/2addr v6, v7

    .line 861
    goto :goto_1c

    .line 862
    :cond_2e
    move/from16 v29, v7

    .line 863
    .line 864
    :goto_1c
    mul-int/lit8 v7, v28, 0x2

    .line 865
    .line 866
    div-int/lit8 v25, v6, 0x20

    .line 867
    .line 868
    add-int v25, v25, v7

    .line 869
    .line 870
    aget-object v7, v24, v25

    .line 871
    .line 872
    instance-of v8, v7, Ljava/lang/reflect/Field;

    .line 873
    .line 874
    if-eqz v8, :cond_2f

    .line 875
    .line 876
    check-cast v7, Ljava/lang/reflect/Field;

    .line 877
    .line 878
    goto :goto_1d

    .line 879
    :cond_2f
    check-cast v7, Ljava/lang/String;

    .line 880
    .line 881
    invoke-static {v10, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->L(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 882
    .line 883
    .line 884
    move-result-object v7

    .line 885
    aput-object v7, v24, v25

    .line 886
    .line 887
    :goto_1d
    invoke-virtual {v14, v7}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    .line 888
    .line 889
    .line 890
    move-result-wide v7

    .line 891
    long-to-int v7, v7

    .line 892
    rem-int/lit8 v6, v6, 0x20

    .line 893
    .line 894
    goto :goto_1e

    .line 895
    :cond_30
    const v7, 0xfffff

    .line 896
    .line 897
    .line 898
    move/from16 v29, v6

    .line 899
    .line 900
    const/4 v6, 0x0

    .line 901
    :goto_1e
    const/16 v8, 0x12

    .line 902
    .line 903
    if-lt v3, v8, :cond_31

    .line 904
    .line 905
    const/16 v8, 0x31

    .line 906
    .line 907
    if-gt v3, v8, :cond_31

    .line 908
    .line 909
    add-int/lit8 v8, v23, 0x1

    .line 910
    .line 911
    aput v5, v15, v23

    .line 912
    .line 913
    move/from16 v23, v5

    .line 914
    .line 915
    move v5, v4

    .line 916
    move/from16 v4, v23

    .line 917
    .line 918
    move/from16 v23, v8

    .line 919
    .line 920
    goto :goto_1f

    .line 921
    :cond_31
    move/from16 v33, v5

    .line 922
    .line 923
    move v5, v4

    .line 924
    move/from16 v4, v33

    .line 925
    .line 926
    :goto_1f
    add-int/lit8 v8, v21, 0x1

    .line 927
    .line 928
    aput v26, v30, v21

    .line 929
    .line 930
    add-int/lit8 v25, v21, 0x2

    .line 931
    .line 932
    move-object/from16 v26, v1

    .line 933
    .line 934
    and-int/lit16 v1, v2, 0x200

    .line 935
    .line 936
    if-eqz v1, :cond_32

    .line 937
    .line 938
    const/high16 v1, 0x20000000

    .line 939
    .line 940
    goto :goto_20

    .line 941
    :cond_32
    const/4 v1, 0x0

    .line 942
    :goto_20
    move/from16 v31, v1

    .line 943
    .line 944
    and-int/lit16 v1, v2, 0x100

    .line 945
    .line 946
    if-eqz v1, :cond_33

    .line 947
    .line 948
    const/high16 v1, 0x10000000

    .line 949
    .line 950
    goto :goto_21

    .line 951
    :cond_33
    const/4 v1, 0x0

    .line 952
    :goto_21
    or-int v1, v31, v1

    .line 953
    .line 954
    and-int/lit16 v2, v2, 0x800

    .line 955
    .line 956
    if-eqz v2, :cond_34

    .line 957
    .line 958
    const/high16 v2, -0x80000000

    .line 959
    .line 960
    goto :goto_22

    .line 961
    :cond_34
    const/4 v2, 0x0

    .line 962
    :goto_22
    or-int/2addr v1, v2

    .line 963
    shl-int/lit8 v2, v3, 0x14

    .line 964
    .line 965
    or-int/2addr v1, v2

    .line 966
    or-int/2addr v1, v4

    .line 967
    aput v1, v30, v8

    .line 968
    .line 969
    add-int/lit8 v21, v21, 0x3

    .line 970
    .line 971
    shl-int/lit8 v1, v6, 0x14

    .line 972
    .line 973
    or-int/2addr v1, v7

    .line 974
    aput v1, v30, v25

    .line 975
    .line 976
    move-object v8, v10

    .line 977
    move-object/from16 v3, v24

    .line 978
    .line 979
    move-object/from16 v1, v26

    .line 980
    .line 981
    move/from16 v2, v27

    .line 982
    .line 983
    move/from16 v7, v28

    .line 984
    .line 985
    move/from16 v4, v29

    .line 986
    .line 987
    const v6, 0xd800

    .line 988
    .line 989
    .line 990
    move v10, v5

    .line 991
    move-object/from16 v5, v30

    .line 992
    .line 993
    goto/16 :goto_b

    .line 994
    .line 995
    :cond_35
    move-object/from16 v30, v5

    .line 996
    .line 997
    new-instance v1, Lcom/google/crypto/tink/shaded/protobuf/P;

    .line 998
    .line 999
    iget-object v14, v0, Lcom/google/crypto/tink/shaded/protobuf/X;->a:Lcom/google/crypto/tink/shaded/protobuf/a;

    .line 1000
    .line 1001
    move-object/from16 v18, p1

    .line 1002
    .line 1003
    move-object/from16 v19, p2

    .line 1004
    .line 1005
    move-object/from16 v20, p3

    .line 1006
    .line 1007
    move-object/from16 v21, p4

    .line 1008
    .line 1009
    move-object/from16 v22, p5

    .line 1010
    .line 1011
    move/from16 v17, v9

    .line 1012
    .line 1013
    move-object/from16 v10, v30

    .line 1014
    .line 1015
    move-object v9, v1

    .line 1016
    invoke-direct/range {v9 .. v22}, Lcom/google/crypto/tink/shaded/protobuf/P;-><init>([I[Ljava/lang/Object;IILcom/google/crypto/tink/shaded/protobuf/a;[IIILcom/google/crypto/tink/shaded/protobuf/S;Lcom/google/crypto/tink/shaded/protobuf/E;Lcom/google/crypto/tink/shaded/protobuf/c0;Lcom/google/crypto/tink/shaded/protobuf/p;Lcom/google/crypto/tink/shaded/protobuf/K;)V

    .line 1017
    .line 1018
    .line 1019
    return-object v9
.end method


# virtual methods
.method public final D(IJLjava/lang/Object;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/google/crypto/tink/shaded/protobuf/P;->o:Lsun/misc/Unsafe;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->o(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {v0, p4, p2, p3}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v2, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->m:Lcom/google/crypto/tink/shaded/protobuf/K;

    .line 12
    .line 13
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    move-object v2, v1

    .line 17
    check-cast v2, Lcom/google/crypto/tink/shaded/protobuf/J;

    .line 18
    .line 19
    iget-boolean v2, v2, Lcom/google/crypto/tink/shaded/protobuf/J;->e:Z

    .line 20
    .line 21
    if-nez v2, :cond_0

    .line 22
    .line 23
    sget-object v2, Lcom/google/crypto/tink/shaded/protobuf/J;->f:Lcom/google/crypto/tink/shaded/protobuf/J;

    .line 24
    .line 25
    invoke-virtual {v2}, Lcom/google/crypto/tink/shaded/protobuf/J;->c()Lcom/google/crypto/tink/shaded/protobuf/J;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-static {v2, v1}, Lcom/google/crypto/tink/shaded/protobuf/K;->a(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/J;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p4, p2, p3, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    invoke-static {p1}, LE1/j;->n(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    const/4 p1, 0x0

    .line 39
    throw p1
.end method

.method public final E(Ljava/lang/Object;[BIIILcom/google/crypto/tink/shaded/protobuf/d;)I
    .locals 29

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    move-object/from16 v3, p2

    .line 6
    .line 7
    move/from16 v4, p4

    .line 8
    .line 9
    move/from16 v14, p5

    .line 10
    .line 11
    move-object/from16 v13, p6

    .line 12
    .line 13
    invoke-static {v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->l(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/P;->o:Lsun/misc/Unsafe;

    .line 17
    .line 18
    move/from16 v5, p3

    .line 19
    .line 20
    const/4 v6, -0x1

    .line 21
    const/4 v7, 0x0

    .line 22
    const v8, 0xfffff

    .line 23
    .line 24
    .line 25
    const/4 v9, 0x0

    .line 26
    const/4 v12, 0x0

    .line 27
    :goto_0
    const v16, 0xfffff

    .line 28
    .line 29
    .line 30
    :goto_1
    if-ge v5, v4, :cond_22

    .line 31
    .line 32
    add-int/lit8 v12, v5, 0x1

    .line 33
    .line 34
    aget-byte v5, v3, v5

    .line 35
    .line 36
    if-gez v5, :cond_0

    .line 37
    .line 38
    invoke-static {v5, v3, v12, v13}, Lc1/g;->m(I[BILcom/google/crypto/tink/shaded/protobuf/d;)I

    .line 39
    .line 40
    .line 41
    move-result v12

    .line 42
    iget v5, v13, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    .line 43
    .line 44
    :cond_0
    move/from16 v26, v12

    .line 45
    .line 46
    move v12, v5

    .line 47
    move/from16 v5, v26

    .line 48
    .line 49
    const/16 p3, 0x0

    .line 50
    .line 51
    ushr-int/lit8 v15, v12, 0x3

    .line 52
    .line 53
    and-int/lit8 v11, v12, 0x7

    .line 54
    .line 55
    iget v10, v0, Lcom/google/crypto/tink/shaded/protobuf/P;->d:I

    .line 56
    .line 57
    iget v3, v0, Lcom/google/crypto/tink/shaded/protobuf/P;->c:I

    .line 58
    .line 59
    const/4 v4, 0x3

    .line 60
    if-le v15, v6, :cond_2

    .line 61
    .line 62
    div-int/2addr v7, v4

    .line 63
    if-lt v15, v3, :cond_1

    .line 64
    .line 65
    if-gt v15, v10, :cond_1

    .line 66
    .line 67
    invoke-virtual {v0, v15, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->O(II)I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    goto :goto_2

    .line 72
    :cond_1
    const/4 v3, -0x1

    .line 73
    :goto_2
    const/4 v10, 0x0

    .line 74
    :goto_3
    const/4 v6, -0x1

    .line 75
    goto :goto_4

    .line 76
    :cond_2
    if-lt v15, v3, :cond_3

    .line 77
    .line 78
    if-gt v15, v10, :cond_3

    .line 79
    .line 80
    const/4 v10, 0x0

    .line 81
    invoke-virtual {v0, v15, v10}, Lcom/google/crypto/tink/shaded/protobuf/P;->O(II)I

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    goto :goto_3

    .line 86
    :cond_3
    const/4 v10, 0x0

    .line 87
    const/4 v3, -0x1

    .line 88
    goto :goto_3

    .line 89
    :goto_4
    if-ne v3, v6, :cond_4

    .line 90
    .line 91
    move/from16 v20, v6

    .line 92
    .line 93
    move v7, v10

    .line 94
    move/from16 v19, v7

    .line 95
    .line 96
    move/from16 v18, v15

    .line 97
    .line 98
    move-object v6, v0

    .line 99
    move-object v15, v1

    .line 100
    move-object v10, v2

    .line 101
    move v2, v12

    .line 102
    goto/16 :goto_18

    .line 103
    .line 104
    :cond_4
    add-int/lit8 v7, v3, 0x1

    .line 105
    .line 106
    iget-object v6, v0, Lcom/google/crypto/tink/shaded/protobuf/P;->a:[I

    .line 107
    .line 108
    aget v7, v6, v7

    .line 109
    .line 110
    move/from16 v18, v10

    .line 111
    .line 112
    invoke-static {v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->R(I)I

    .line 113
    .line 114
    .line 115
    move-result v10

    .line 116
    and-int v4, v7, v16

    .line 117
    .line 118
    move/from16 v20, v5

    .line 119
    .line 120
    int-to-long v4, v4

    .line 121
    move-wide/from16 v21, v4

    .line 122
    .line 123
    const/16 v4, 0x11

    .line 124
    .line 125
    if-gt v10, v4, :cond_16

    .line 126
    .line 127
    add-int/lit8 v4, v3, 0x2

    .line 128
    .line 129
    aget v4, v6, v4

    .line 130
    .line 131
    ushr-int/lit8 v6, v4, 0x14

    .line 132
    .line 133
    const/4 v5, 0x1

    .line 134
    shl-int v23, v5, v6

    .line 135
    .line 136
    and-int v4, v4, v16

    .line 137
    .line 138
    if-eq v4, v8, :cond_7

    .line 139
    .line 140
    move/from16 v6, v16

    .line 141
    .line 142
    if-eq v8, v6, :cond_5

    .line 143
    .line 144
    int-to-long v5, v8

    .line 145
    invoke-virtual {v1, v2, v5, v6, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 146
    .line 147
    .line 148
    const v6, 0xfffff

    .line 149
    .line 150
    .line 151
    :cond_5
    if-ne v4, v6, :cond_6

    .line 152
    .line 153
    move/from16 v9, v18

    .line 154
    .line 155
    goto :goto_5

    .line 156
    :cond_6
    int-to-long v5, v4

    .line 157
    invoke-virtual {v1, v2, v5, v6}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 158
    .line 159
    .line 160
    move-result v5

    .line 161
    move v9, v5

    .line 162
    :goto_5
    move/from16 v24, v4

    .line 163
    .line 164
    :goto_6
    move/from16 v25, v9

    .line 165
    .line 166
    goto :goto_7

    .line 167
    :cond_7
    move/from16 v24, v8

    .line 168
    .line 169
    goto :goto_6

    .line 170
    :goto_7
    const/4 v4, 0x5

    .line 171
    packed-switch v10, :pswitch_data_0

    .line 172
    .line 173
    .line 174
    move-object/from16 v9, p2

    .line 175
    .line 176
    move-object v10, v1

    .line 177
    move-object v1, v2

    .line 178
    move-object v7, v13

    .line 179
    move/from16 v8, v20

    .line 180
    .line 181
    const/16 v17, -0x1

    .line 182
    .line 183
    move v13, v3

    .line 184
    goto/16 :goto_14

    .line 185
    .line 186
    :pswitch_0
    const/4 v4, 0x3

    .line 187
    if-ne v11, v4, :cond_8

    .line 188
    .line 189
    invoke-virtual {v0, v3, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->x(ILjava/lang/Object;)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v4

    .line 193
    shl-int/lit8 v5, v15, 0x3

    .line 194
    .line 195
    or-int/lit8 v8, v5, 0x4

    .line 196
    .line 197
    move-object v5, v4

    .line 198
    invoke-virtual {v0, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 199
    .line 200
    .line 201
    move-result-object v4

    .line 202
    move/from16 v7, p4

    .line 203
    .line 204
    move-object v9, v13

    .line 205
    move/from16 v6, v20

    .line 206
    .line 207
    const/16 v17, -0x1

    .line 208
    .line 209
    move v13, v3

    .line 210
    move-object v3, v5

    .line 211
    move-object/from16 v5, p2

    .line 212
    .line 213
    invoke-static/range {v3 .. v9}, Lc1/g;->C(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Y;[BIIILcom/google/crypto/tink/shaded/protobuf/d;)I

    .line 214
    .line 215
    .line 216
    move-result v4

    .line 217
    move-object v7, v5

    .line 218
    invoke-virtual {v0, v13, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->P(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 219
    .line 220
    .line 221
    or-int v3, v25, v23

    .line 222
    .line 223
    move-object v5, v9

    .line 224
    move v9, v3

    .line 225
    move-object v3, v7

    .line 226
    move v7, v13

    .line 227
    move-object v13, v5

    .line 228
    move v5, v4

    .line 229
    move v6, v15

    .line 230
    move/from16 v8, v24

    .line 231
    .line 232
    const v16, 0xfffff

    .line 233
    .line 234
    .line 235
    move/from16 v4, p4

    .line 236
    .line 237
    goto/16 :goto_1

    .line 238
    .line 239
    :cond_8
    move-object v9, v13

    .line 240
    const/16 v17, -0x1

    .line 241
    .line 242
    move v13, v3

    .line 243
    move-object v10, v1

    .line 244
    move-object v1, v2

    .line 245
    move-object v7, v9

    .line 246
    move/from16 v8, v20

    .line 247
    .line 248
    move-object/from16 v9, p2

    .line 249
    .line 250
    goto/16 :goto_14

    .line 251
    .line 252
    :pswitch_1
    move-object/from16 v7, p2

    .line 253
    .line 254
    move-object v9, v13

    .line 255
    const/16 v17, -0x1

    .line 256
    .line 257
    move v13, v3

    .line 258
    move/from16 v3, v20

    .line 259
    .line 260
    if-nez v11, :cond_9

    .line 261
    .line 262
    invoke-static {v7, v3, v9}, Lc1/g;->p([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    .line 263
    .line 264
    .line 265
    move-result v8

    .line 266
    iget-wide v3, v9, Lcom/google/crypto/tink/shaded/protobuf/d;->b:J

    .line 267
    .line 268
    invoke-static {v3, v4}, Landroidx/datastore/preferences/protobuf/j;->e(J)J

    .line 269
    .line 270
    .line 271
    move-result-wide v5

    .line 272
    move-wide/from16 v3, v21

    .line 273
    .line 274
    invoke-virtual/range {v1 .. v6}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    .line 275
    .line 276
    .line 277
    move-object v10, v2

    .line 278
    or-int v2, v25, v23

    .line 279
    .line 280
    move/from16 v4, p4

    .line 281
    .line 282
    move-object v3, v7

    .line 283
    move v5, v8

    .line 284
    move v7, v13

    .line 285
    move v6, v15

    .line 286
    move/from16 v8, v24

    .line 287
    .line 288
    const v16, 0xfffff

    .line 289
    .line 290
    .line 291
    move-object v13, v9

    .line 292
    move v9, v2

    .line 293
    :goto_8
    move-object v2, v10

    .line 294
    goto/16 :goto_1

    .line 295
    .line 296
    :cond_9
    move-object v8, v9

    .line 297
    move-object v9, v7

    .line 298
    move-object v7, v8

    .line 299
    move-object v10, v1

    .line 300
    move-object v1, v2

    .line 301
    :goto_9
    move v8, v3

    .line 302
    goto/16 :goto_14

    .line 303
    .line 304
    :pswitch_2
    move-object/from16 v7, p2

    .line 305
    .line 306
    move-object v10, v2

    .line 307
    move-object v9, v13

    .line 308
    move-wide/from16 v5, v21

    .line 309
    .line 310
    const/16 v17, -0x1

    .line 311
    .line 312
    move v13, v3

    .line 313
    move/from16 v3, v20

    .line 314
    .line 315
    if-nez v11, :cond_a

    .line 316
    .line 317
    invoke-static {v7, v3, v9}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    .line 318
    .line 319
    .line 320
    move-result v2

    .line 321
    iget v3, v9, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    .line 322
    .line 323
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/j;->d(I)I

    .line 324
    .line 325
    .line 326
    move-result v3

    .line 327
    invoke-virtual {v1, v10, v5, v6, v3}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 328
    .line 329
    .line 330
    :goto_a
    or-int v3, v25, v23

    .line 331
    .line 332
    move-object v4, v9

    .line 333
    move v9, v3

    .line 334
    move-object v3, v7

    .line 335
    move v7, v13

    .line 336
    move-object v13, v4

    .line 337
    move/from16 v4, p4

    .line 338
    .line 339
    move v5, v2

    .line 340
    move-object v2, v10

    .line 341
    :goto_b
    move v6, v15

    .line 342
    move/from16 v8, v24

    .line 343
    .line 344
    goto/16 :goto_0

    .line 345
    .line 346
    :cond_a
    move-object v8, v10

    .line 347
    move-object v10, v1

    .line 348
    move-object v1, v8

    .line 349
    move-object v8, v9

    .line 350
    move-object v9, v7

    .line 351
    move-object v7, v8

    .line 352
    goto :goto_9

    .line 353
    :pswitch_3
    move-object/from16 v7, p2

    .line 354
    .line 355
    move-object v10, v2

    .line 356
    move-object v9, v13

    .line 357
    move-wide/from16 v5, v21

    .line 358
    .line 359
    const/16 v17, -0x1

    .line 360
    .line 361
    move v13, v3

    .line 362
    move/from16 v3, v20

    .line 363
    .line 364
    if-nez v11, :cond_a

    .line 365
    .line 366
    invoke-static {v7, v3, v9}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    .line 367
    .line 368
    .line 369
    move-result v2

    .line 370
    iget v3, v9, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    .line 371
    .line 372
    invoke-virtual {v0, v13}, Lcom/google/crypto/tink/shaded/protobuf/P;->n(I)V

    .line 373
    .line 374
    .line 375
    invoke-virtual {v1, v10, v5, v6, v3}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 376
    .line 377
    .line 378
    goto :goto_a

    .line 379
    :pswitch_4
    move-object/from16 v7, p2

    .line 380
    .line 381
    move-object v10, v2

    .line 382
    move-object v9, v13

    .line 383
    move-wide/from16 v5, v21

    .line 384
    .line 385
    const/4 v2, 0x2

    .line 386
    const/16 v17, -0x1

    .line 387
    .line 388
    move v13, v3

    .line 389
    move/from16 v3, v20

    .line 390
    .line 391
    if-ne v11, v2, :cond_a

    .line 392
    .line 393
    invoke-static {v7, v3, v9}, Lc1/g;->h([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    .line 394
    .line 395
    .line 396
    move-result v2

    .line 397
    iget-object v3, v9, Lcom/google/crypto/tink/shaded/protobuf/d;->c:Ljava/lang/Object;

    .line 398
    .line 399
    invoke-virtual {v1, v10, v5, v6, v3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 400
    .line 401
    .line 402
    goto :goto_a

    .line 403
    :pswitch_5
    move-object/from16 v7, p2

    .line 404
    .line 405
    move-object v10, v2

    .line 406
    move-object v9, v13

    .line 407
    const/4 v2, 0x2

    .line 408
    const/16 v17, -0x1

    .line 409
    .line 410
    move v13, v3

    .line 411
    move/from16 v3, v20

    .line 412
    .line 413
    if-ne v11, v2, :cond_b

    .line 414
    .line 415
    move-object v2, v1

    .line 416
    invoke-virtual {v0, v13, v10}, Lcom/google/crypto/tink/shaded/protobuf/P;->x(ILjava/lang/Object;)Ljava/lang/Object;

    .line 417
    .line 418
    .line 419
    move-result-object v1

    .line 420
    move-object v4, v2

    .line 421
    invoke-virtual {v0, v13}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 422
    .line 423
    .line 424
    move-result-object v2

    .line 425
    move/from16 v5, p4

    .line 426
    .line 427
    move-object v8, v4

    .line 428
    move-object v6, v9

    .line 429
    move v4, v3

    .line 430
    move-object v3, v7

    .line 431
    invoke-static/range {v1 .. v6}, Lc1/g;->D(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Y;[BIILcom/google/crypto/tink/shaded/protobuf/d;)I

    .line 432
    .line 433
    .line 434
    move-result v2

    .line 435
    move-object v9, v3

    .line 436
    move-object v3, v1

    .line 437
    move-object v1, v6

    .line 438
    invoke-virtual {v0, v13, v10, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->P(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 439
    .line 440
    .line 441
    :goto_c
    or-int v3, v25, v23

    .line 442
    .line 443
    move-object v4, v9

    .line 444
    move v9, v3

    .line 445
    move-object v3, v4

    .line 446
    move/from16 v4, p4

    .line 447
    .line 448
    move v5, v2

    .line 449
    move-object v2, v10

    .line 450
    move v7, v13

    .line 451
    move v6, v15

    .line 452
    const v16, 0xfffff

    .line 453
    .line 454
    .line 455
    move-object v13, v1

    .line 456
    move-object v1, v8

    .line 457
    :goto_d
    move/from16 v8, v24

    .line 458
    .line 459
    goto/16 :goto_1

    .line 460
    .line 461
    :cond_b
    move-object v8, v1

    .line 462
    move-object v1, v9

    .line 463
    move-object v9, v7

    .line 464
    :cond_c
    move-object v7, v1

    .line 465
    move-object v1, v10

    .line 466
    move-object v10, v8

    .line 467
    goto/16 :goto_9

    .line 468
    .line 469
    :pswitch_6
    move-object/from16 v9, p2

    .line 470
    .line 471
    move-object v8, v1

    .line 472
    move-object v10, v2

    .line 473
    move-object v1, v13

    .line 474
    move-wide/from16 v5, v21

    .line 475
    .line 476
    const/4 v2, 0x2

    .line 477
    const/16 v17, -0x1

    .line 478
    .line 479
    move v13, v3

    .line 480
    move/from16 v3, v20

    .line 481
    .line 482
    if-ne v11, v2, :cond_c

    .line 483
    .line 484
    const/high16 v2, 0x20000000

    .line 485
    .line 486
    and-int/2addr v2, v7

    .line 487
    const-string v4, ""

    .line 488
    .line 489
    if-eqz v2, :cond_f

    .line 490
    .line 491
    invoke-static {v9, v3, v1}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    .line 492
    .line 493
    .line 494
    move-result v2

    .line 495
    iget v3, v1, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    .line 496
    .line 497
    if-ltz v3, :cond_e

    .line 498
    .line 499
    if-nez v3, :cond_d

    .line 500
    .line 501
    iput-object v4, v1, Lcom/google/crypto/tink/shaded/protobuf/d;->c:Ljava/lang/Object;

    .line 502
    .line 503
    goto :goto_f

    .line 504
    :cond_d
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/k0;->a:Lcom/google/crypto/tink/shaded/protobuf/i0;

    .line 505
    .line 506
    invoke-virtual {v4, v9, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/i0;->m([BII)Ljava/lang/String;

    .line 507
    .line 508
    .line 509
    move-result-object v4

    .line 510
    iput-object v4, v1, Lcom/google/crypto/tink/shaded/protobuf/d;->c:Ljava/lang/Object;

    .line 511
    .line 512
    :goto_e
    add-int/2addr v2, v3

    .line 513
    goto :goto_f

    .line 514
    :cond_e
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->e()Lcom/google/crypto/tink/shaded/protobuf/C;

    .line 515
    .line 516
    .line 517
    move-result-object v1

    .line 518
    throw v1

    .line 519
    :cond_f
    invoke-static {v9, v3, v1}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    .line 520
    .line 521
    .line 522
    move-result v2

    .line 523
    iget v3, v1, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    .line 524
    .line 525
    if-ltz v3, :cond_11

    .line 526
    .line 527
    if-nez v3, :cond_10

    .line 528
    .line 529
    iput-object v4, v1, Lcom/google/crypto/tink/shaded/protobuf/d;->c:Ljava/lang/Object;

    .line 530
    .line 531
    goto :goto_f

    .line 532
    :cond_10
    new-instance v4, Ljava/lang/String;

    .line 533
    .line 534
    sget-object v7, Lcom/google/crypto/tink/shaded/protobuf/A;->a:Ljava/nio/charset/Charset;

    .line 535
    .line 536
    invoke-direct {v4, v9, v2, v3, v7}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 537
    .line 538
    .line 539
    iput-object v4, v1, Lcom/google/crypto/tink/shaded/protobuf/d;->c:Ljava/lang/Object;

    .line 540
    .line 541
    goto :goto_e

    .line 542
    :goto_f
    iget-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/d;->c:Ljava/lang/Object;

    .line 543
    .line 544
    invoke-virtual {v8, v10, v5, v6, v3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 545
    .line 546
    .line 547
    goto :goto_c

    .line 548
    :cond_11
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->e()Lcom/google/crypto/tink/shaded/protobuf/C;

    .line 549
    .line 550
    .line 551
    move-result-object v1

    .line 552
    throw v1

    .line 553
    :pswitch_7
    move-object/from16 v9, p2

    .line 554
    .line 555
    move-object v8, v1

    .line 556
    move-object v10, v2

    .line 557
    move-object v1, v13

    .line 558
    move-wide/from16 v5, v21

    .line 559
    .line 560
    const/16 v17, -0x1

    .line 561
    .line 562
    move v13, v3

    .line 563
    move/from16 v3, v20

    .line 564
    .line 565
    if-nez v11, :cond_c

    .line 566
    .line 567
    invoke-static {v9, v3, v1}, Lc1/g;->p([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    .line 568
    .line 569
    .line 570
    move-result v2

    .line 571
    iget-wide v3, v1, Lcom/google/crypto/tink/shaded/protobuf/d;->b:J

    .line 572
    .line 573
    const-wide/16 v19, 0x0

    .line 574
    .line 575
    cmp-long v3, v3, v19

    .line 576
    .line 577
    if-eqz v3, :cond_12

    .line 578
    .line 579
    const/4 v3, 0x1

    .line 580
    goto :goto_10

    .line 581
    :cond_12
    move/from16 v3, v18

    .line 582
    .line 583
    :goto_10
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 584
    .line 585
    invoke-virtual {v4, v10, v5, v6, v3}, Lcom/google/crypto/tink/shaded/protobuf/g0;->k(Ljava/lang/Object;JZ)V

    .line 586
    .line 587
    .line 588
    goto/16 :goto_c

    .line 589
    .line 590
    :pswitch_8
    move-object/from16 v9, p2

    .line 591
    .line 592
    move-object v8, v1

    .line 593
    move-object v10, v2

    .line 594
    move-object v1, v13

    .line 595
    move-wide/from16 v5, v21

    .line 596
    .line 597
    const/16 v17, -0x1

    .line 598
    .line 599
    move v13, v3

    .line 600
    move/from16 v3, v20

    .line 601
    .line 602
    if-ne v11, v4, :cond_c

    .line 603
    .line 604
    invoke-static {v3, v9}, Lc1/g;->i(I[B)I

    .line 605
    .line 606
    .line 607
    move-result v2

    .line 608
    invoke-virtual {v8, v10, v5, v6, v2}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 609
    .line 610
    .line 611
    add-int/lit8 v5, v3, 0x4

    .line 612
    .line 613
    or-int v2, v25, v23

    .line 614
    .line 615
    move/from16 v4, p4

    .line 616
    .line 617
    move-object v3, v9

    .line 618
    move v7, v13

    .line 619
    move v6, v15

    .line 620
    const v16, 0xfffff

    .line 621
    .line 622
    .line 623
    move-object v13, v1

    .line 624
    move v9, v2

    .line 625
    move-object v1, v8

    .line 626
    move-object v2, v10

    .line 627
    goto/16 :goto_d

    .line 628
    .line 629
    :pswitch_9
    move-object/from16 v9, p2

    .line 630
    .line 631
    move-object v8, v1

    .line 632
    move-object v10, v2

    .line 633
    move-object v1, v13

    .line 634
    move-wide/from16 v5, v21

    .line 635
    .line 636
    const/4 v2, 0x1

    .line 637
    const/16 v17, -0x1

    .line 638
    .line 639
    move v13, v3

    .line 640
    move/from16 v3, v20

    .line 641
    .line 642
    if-ne v11, v2, :cond_13

    .line 643
    .line 644
    move-wide/from16 v21, v5

    .line 645
    .line 646
    invoke-static {v3, v9}, Lc1/g;->j(I[B)J

    .line 647
    .line 648
    .line 649
    move-result-wide v5

    .line 650
    move-object v7, v1

    .line 651
    move-object v1, v8

    .line 652
    move-object v2, v10

    .line 653
    move v8, v3

    .line 654
    move-wide/from16 v3, v21

    .line 655
    .line 656
    invoke-virtual/range {v1 .. v6}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    .line 657
    .line 658
    .line 659
    add-int/lit8 v5, v8, 0x8

    .line 660
    .line 661
    :goto_11
    or-int v3, v25, v23

    .line 662
    .line 663
    move-object v4, v9

    .line 664
    move v9, v3

    .line 665
    move-object v3, v4

    .line 666
    move v4, v13

    .line 667
    move-object v13, v7

    .line 668
    move v7, v4

    .line 669
    move/from16 v4, p4

    .line 670
    .line 671
    goto/16 :goto_b

    .line 672
    .line 673
    :cond_13
    move-object v7, v1

    .line 674
    move-object v1, v8

    .line 675
    move v8, v3

    .line 676
    move-object/from16 v26, v10

    .line 677
    .line 678
    move-object v10, v1

    .line 679
    move-object/from16 v1, v26

    .line 680
    .line 681
    goto/16 :goto_14

    .line 682
    .line 683
    :pswitch_a
    move-object/from16 v9, p2

    .line 684
    .line 685
    move-object v7, v13

    .line 686
    move/from16 v8, v20

    .line 687
    .line 688
    const/16 v17, -0x1

    .line 689
    .line 690
    move v13, v3

    .line 691
    move-wide/from16 v3, v21

    .line 692
    .line 693
    if-nez v11, :cond_14

    .line 694
    .line 695
    invoke-static {v9, v8, v7}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    .line 696
    .line 697
    .line 698
    move-result v5

    .line 699
    iget v6, v7, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    .line 700
    .line 701
    invoke-virtual {v1, v2, v3, v4, v6}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 702
    .line 703
    .line 704
    goto :goto_11

    .line 705
    :cond_14
    move-object v10, v1

    .line 706
    :cond_15
    move-object v1, v2

    .line 707
    goto/16 :goto_14

    .line 708
    .line 709
    :pswitch_b
    move-object/from16 v9, p2

    .line 710
    .line 711
    move-object v7, v13

    .line 712
    move/from16 v8, v20

    .line 713
    .line 714
    const/16 v17, -0x1

    .line 715
    .line 716
    move v13, v3

    .line 717
    move-wide/from16 v3, v21

    .line 718
    .line 719
    if-nez v11, :cond_14

    .line 720
    .line 721
    invoke-static {v9, v8, v7}, Lc1/g;->p([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    .line 722
    .line 723
    .line 724
    move-result v8

    .line 725
    iget-wide v5, v7, Lcom/google/crypto/tink/shaded/protobuf/d;->b:J

    .line 726
    .line 727
    invoke-virtual/range {v1 .. v6}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    .line 728
    .line 729
    .line 730
    move-object v10, v1

    .line 731
    or-int v1, v25, v23

    .line 732
    .line 733
    move v3, v13

    .line 734
    move-object v13, v7

    .line 735
    move v7, v3

    .line 736
    move/from16 v4, p4

    .line 737
    .line 738
    move v5, v8

    .line 739
    :goto_12
    move-object v3, v9

    .line 740
    move v6, v15

    .line 741
    move/from16 v8, v24

    .line 742
    .line 743
    const v16, 0xfffff

    .line 744
    .line 745
    .line 746
    move v9, v1

    .line 747
    :goto_13
    move-object v1, v10

    .line 748
    goto/16 :goto_1

    .line 749
    .line 750
    :pswitch_c
    move-object/from16 v9, p2

    .line 751
    .line 752
    move-object v10, v1

    .line 753
    move-object v7, v13

    .line 754
    move/from16 v8, v20

    .line 755
    .line 756
    move-wide/from16 v5, v21

    .line 757
    .line 758
    const/16 v17, -0x1

    .line 759
    .line 760
    move v13, v3

    .line 761
    if-ne v11, v4, :cond_15

    .line 762
    .line 763
    invoke-static {v8, v9}, Lc1/g;->i(I[B)I

    .line 764
    .line 765
    .line 766
    move-result v1

    .line 767
    invoke-static {v1}, Ljava/lang/Float;->intBitsToFloat(I)F

    .line 768
    .line 769
    .line 770
    move-result v1

    .line 771
    sget-object v3, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 772
    .line 773
    invoke-virtual {v3, v2, v5, v6, v1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->n(Ljava/lang/Object;JF)V

    .line 774
    .line 775
    .line 776
    add-int/lit8 v5, v8, 0x4

    .line 777
    .line 778
    or-int v1, v25, v23

    .line 779
    .line 780
    move v3, v13

    .line 781
    move-object v13, v7

    .line 782
    move v7, v3

    .line 783
    move/from16 v4, p4

    .line 784
    .line 785
    goto :goto_12

    .line 786
    :pswitch_d
    move-object/from16 v9, p2

    .line 787
    .line 788
    move-object v10, v1

    .line 789
    move-object v7, v13

    .line 790
    move/from16 v8, v20

    .line 791
    .line 792
    move-wide/from16 v5, v21

    .line 793
    .line 794
    const/4 v1, 0x1

    .line 795
    const/16 v17, -0x1

    .line 796
    .line 797
    move v13, v3

    .line 798
    if-ne v11, v1, :cond_15

    .line 799
    .line 800
    invoke-static {v8, v9}, Lc1/g;->j(I[B)J

    .line 801
    .line 802
    .line 803
    move-result-wide v3

    .line 804
    invoke-static {v3, v4}, Ljava/lang/Double;->longBitsToDouble(J)D

    .line 805
    .line 806
    .line 807
    move-result-wide v3

    .line 808
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 809
    .line 810
    move-wide/from16 v26, v5

    .line 811
    .line 812
    move-wide v5, v3

    .line 813
    move-wide/from16 v3, v26

    .line 814
    .line 815
    invoke-virtual/range {v1 .. v6}, Lcom/google/crypto/tink/shaded/protobuf/g0;->m(Ljava/lang/Object;JD)V

    .line 816
    .line 817
    .line 818
    move-object v1, v2

    .line 819
    add-int/lit8 v5, v8, 0x8

    .line 820
    .line 821
    or-int v2, v25, v23

    .line 822
    .line 823
    move v3, v13

    .line 824
    move-object v13, v7

    .line 825
    move v7, v3

    .line 826
    move/from16 v4, p4

    .line 827
    .line 828
    move-object v3, v9

    .line 829
    move v6, v15

    .line 830
    move/from16 v8, v24

    .line 831
    .line 832
    const v16, 0xfffff

    .line 833
    .line 834
    .line 835
    move v9, v2

    .line 836
    move-object v2, v1

    .line 837
    goto :goto_13

    .line 838
    :goto_14
    move-object v6, v0

    .line 839
    move v5, v8

    .line 840
    move v2, v12

    .line 841
    move v7, v13

    .line 842
    move/from16 v20, v17

    .line 843
    .line 844
    move/from16 v19, v18

    .line 845
    .line 846
    move/from16 v8, v24

    .line 847
    .line 848
    move/from16 v9, v25

    .line 849
    .line 850
    move/from16 v18, v15

    .line 851
    .line 852
    move-object v15, v10

    .line 853
    move-object v10, v1

    .line 854
    goto/16 :goto_18

    .line 855
    .line 856
    :cond_16
    move-object v5, v2

    .line 857
    move-object v2, v1

    .line 858
    move-object v1, v5

    .line 859
    move v13, v3

    .line 860
    move/from16 v3, v20

    .line 861
    .line 862
    move-wide/from16 v5, v21

    .line 863
    .line 864
    const/16 v17, -0x1

    .line 865
    .line 866
    const/16 v4, 0x1b

    .line 867
    .line 868
    if-ne v10, v4, :cond_1a

    .line 869
    .line 870
    const/4 v4, 0x2

    .line 871
    if-ne v11, v4, :cond_19

    .line 872
    .line 873
    invoke-virtual {v2, v1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 874
    .line 875
    .line 876
    move-result-object v4

    .line 877
    check-cast v4, Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 878
    .line 879
    move-object v7, v4

    .line 880
    check-cast v7, Lcom/google/crypto/tink/shaded/protobuf/b;

    .line 881
    .line 882
    iget-boolean v7, v7, Lcom/google/crypto/tink/shaded/protobuf/b;->e:Z

    .line 883
    .line 884
    if-nez v7, :cond_18

    .line 885
    .line 886
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 887
    .line 888
    .line 889
    move-result v7

    .line 890
    if-nez v7, :cond_17

    .line 891
    .line 892
    const/16 v7, 0xa

    .line 893
    .line 894
    goto :goto_15

    .line 895
    :cond_17
    mul-int/lit8 v7, v7, 0x2

    .line 896
    .line 897
    :goto_15
    invoke-interface {v4, v7}, Lcom/google/crypto/tink/shaded/protobuf/z;->a(I)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 898
    .line 899
    .line 900
    move-result-object v4

    .line 901
    invoke-virtual {v2, v1, v5, v6, v4}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 902
    .line 903
    .line 904
    :cond_18
    move-object v6, v4

    .line 905
    invoke-virtual {v0, v13}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 906
    .line 907
    .line 908
    move-result-object v1

    .line 909
    move v4, v12

    .line 910
    move-object v12, v2

    .line 911
    move v2, v4

    .line 912
    move/from16 v5, p4

    .line 913
    .line 914
    move-object/from16 v7, p6

    .line 915
    .line 916
    move v4, v3

    .line 917
    move-object/from16 v3, p2

    .line 918
    .line 919
    invoke-static/range {v1 .. v7}, Lc1/g;->k(Lcom/google/crypto/tink/shaded/protobuf/Y;I[BIILcom/google/crypto/tink/shaded/protobuf/z;Lcom/google/crypto/tink/shaded/protobuf/d;)I

    .line 920
    .line 921
    .line 922
    move-result v1

    .line 923
    move/from16 v4, p4

    .line 924
    .line 925
    move v5, v1

    .line 926
    move-object v1, v12

    .line 927
    move v7, v13

    .line 928
    move v6, v15

    .line 929
    const v16, 0xfffff

    .line 930
    .line 931
    .line 932
    move-object/from16 v13, p6

    .line 933
    .line 934
    move v12, v2

    .line 935
    move-object/from16 v2, p1

    .line 936
    .line 937
    goto/16 :goto_1

    .line 938
    .line 939
    :cond_19
    move/from16 v26, v12

    .line 940
    .line 941
    move-object v12, v2

    .line 942
    move/from16 v2, v26

    .line 943
    .line 944
    move-object/from16 v1, p1

    .line 945
    .line 946
    move/from16 v24, v8

    .line 947
    .line 948
    move/from16 v20, v17

    .line 949
    .line 950
    move/from16 v19, v18

    .line 951
    .line 952
    move/from16 v17, v9

    .line 953
    .line 954
    move/from16 v18, v15

    .line 955
    .line 956
    move-object v15, v12

    .line 957
    move v12, v13

    .line 958
    goto/16 :goto_16

    .line 959
    .line 960
    :cond_1a
    move/from16 v26, v12

    .line 961
    .line 962
    move-object v12, v2

    .line 963
    move/from16 v2, v26

    .line 964
    .line 965
    const/16 v1, 0x31

    .line 966
    .line 967
    if-gt v10, v1, :cond_1c

    .line 968
    .line 969
    move/from16 v24, v8

    .line 970
    .line 971
    move v1, v9

    .line 972
    int-to-long v8, v7

    .line 973
    move/from16 v4, p4

    .line 974
    .line 975
    move v7, v13

    .line 976
    move/from16 v20, v17

    .line 977
    .line 978
    move/from16 v19, v18

    .line 979
    .line 980
    move-object/from16 v13, p6

    .line 981
    .line 982
    move/from16 v17, v1

    .line 983
    .line 984
    move/from16 v18, v15

    .line 985
    .line 986
    move-object/from16 v1, p1

    .line 987
    .line 988
    move-object v15, v12

    .line 989
    move/from16 v26, v2

    .line 990
    .line 991
    move-object/from16 v2, p2

    .line 992
    .line 993
    move-wide/from16 v27, v5

    .line 994
    .line 995
    move/from16 v5, v26

    .line 996
    .line 997
    move v6, v11

    .line 998
    move-wide/from16 v11, v27

    .line 999
    .line 1000
    invoke-virtual/range {v0 .. v13}, Lcom/google/crypto/tink/shaded/protobuf/P;->G(Ljava/lang/Object;[BIIIIIJIJLcom/google/crypto/tink/shaded/protobuf/d;)I

    .line 1001
    .line 1002
    .line 1003
    move-result v6

    .line 1004
    move v2, v5

    .line 1005
    move v12, v7

    .line 1006
    if-eq v6, v3, :cond_1b

    .line 1007
    .line 1008
    move-object/from16 v3, p2

    .line 1009
    .line 1010
    move/from16 v4, p4

    .line 1011
    .line 1012
    move-object/from16 v13, p6

    .line 1013
    .line 1014
    move v5, v6

    .line 1015
    move v7, v12

    .line 1016
    move/from16 v9, v17

    .line 1017
    .line 1018
    move/from16 v6, v18

    .line 1019
    .line 1020
    move/from16 v8, v24

    .line 1021
    .line 1022
    const v16, 0xfffff

    .line 1023
    .line 1024
    .line 1025
    move v12, v2

    .line 1026
    move-object v2, v1

    .line 1027
    move-object v1, v15

    .line 1028
    goto/16 :goto_1

    .line 1029
    .line 1030
    :cond_1b
    move-object v10, v1

    .line 1031
    move v5, v6

    .line 1032
    move v7, v12

    .line 1033
    move/from16 v9, v17

    .line 1034
    .line 1035
    move/from16 v8, v24

    .line 1036
    .line 1037
    move-object v6, v0

    .line 1038
    goto/16 :goto_18

    .line 1039
    .line 1040
    :cond_1c
    move-object/from16 v1, p1

    .line 1041
    .line 1042
    move/from16 v24, v8

    .line 1043
    .line 1044
    move/from16 v20, v17

    .line 1045
    .line 1046
    move/from16 v19, v18

    .line 1047
    .line 1048
    move/from16 v17, v9

    .line 1049
    .line 1050
    move v9, v10

    .line 1051
    move/from16 v18, v15

    .line 1052
    .line 1053
    move-object v15, v12

    .line 1054
    move v12, v13

    .line 1055
    move-wide/from16 v26, v5

    .line 1056
    .line 1057
    move v6, v11

    .line 1058
    move-wide/from16 v10, v26

    .line 1059
    .line 1060
    const/16 v4, 0x32

    .line 1061
    .line 1062
    if-ne v9, v4, :cond_1e

    .line 1063
    .line 1064
    const/4 v4, 0x2

    .line 1065
    if-eq v6, v4, :cond_1d

    .line 1066
    .line 1067
    :goto_16
    move-object v6, v0

    .line 1068
    move-object v10, v1

    .line 1069
    move v5, v3

    .line 1070
    :goto_17
    move v7, v12

    .line 1071
    move/from16 v9, v17

    .line 1072
    .line 1073
    move/from16 v8, v24

    .line 1074
    .line 1075
    goto :goto_18

    .line 1076
    :cond_1d
    invoke-virtual {v0, v12, v10, v11, v1}, Lcom/google/crypto/tink/shaded/protobuf/P;->D(IJLjava/lang/Object;)V

    .line 1077
    .line 1078
    .line 1079
    throw p3

    .line 1080
    :cond_1e
    move/from16 v4, p4

    .line 1081
    .line 1082
    move-object/from16 v13, p6

    .line 1083
    .line 1084
    move v5, v2

    .line 1085
    move v8, v7

    .line 1086
    move-object/from16 v2, p2

    .line 1087
    .line 1088
    move v7, v6

    .line 1089
    move/from16 v6, v18

    .line 1090
    .line 1091
    invoke-virtual/range {v0 .. v13}, Lcom/google/crypto/tink/shaded/protobuf/P;->F(Ljava/lang/Object;[BIIIIIIIJILcom/google/crypto/tink/shaded/protobuf/d;)I

    .line 1092
    .line 1093
    .line 1094
    move-result v7

    .line 1095
    move-object v10, v1

    .line 1096
    move v2, v5

    .line 1097
    move-object v6, v0

    .line 1098
    if-eq v7, v3, :cond_1f

    .line 1099
    .line 1100
    move-object/from16 v3, p2

    .line 1101
    .line 1102
    move/from16 v4, p4

    .line 1103
    .line 1104
    move-object/from16 v13, p6

    .line 1105
    .line 1106
    move-object v0, v6

    .line 1107
    move v5, v7

    .line 1108
    move v7, v12

    .line 1109
    move-object v1, v15

    .line 1110
    move/from16 v9, v17

    .line 1111
    .line 1112
    move/from16 v6, v18

    .line 1113
    .line 1114
    move/from16 v8, v24

    .line 1115
    .line 1116
    const v16, 0xfffff

    .line 1117
    .line 1118
    .line 1119
    move v12, v2

    .line 1120
    goto/16 :goto_8

    .line 1121
    .line 1122
    :cond_1f
    move v5, v7

    .line 1123
    goto :goto_17

    .line 1124
    :goto_18
    if-ne v2, v14, :cond_20

    .line 1125
    .line 1126
    if-eqz v14, :cond_20

    .line 1127
    .line 1128
    move/from16 v4, p4

    .line 1129
    .line 1130
    move v12, v2

    .line 1131
    :goto_19
    const v0, 0xfffff

    .line 1132
    .line 1133
    .line 1134
    goto :goto_1a

    .line 1135
    :cond_20
    move-object v0, v10

    .line 1136
    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 1137
    .line 1138
    iget-object v1, v0, Lcom/google/crypto/tink/shaded/protobuf/w;->unknownFields:Lcom/google/crypto/tink/shaded/protobuf/b0;

    .line 1139
    .line 1140
    sget-object v3, Lcom/google/crypto/tink/shaded/protobuf/b0;->f:Lcom/google/crypto/tink/shaded/protobuf/b0;

    .line 1141
    .line 1142
    if-ne v1, v3, :cond_21

    .line 1143
    .line 1144
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/b0;->c()Lcom/google/crypto/tink/shaded/protobuf/b0;

    .line 1145
    .line 1146
    .line 1147
    move-result-object v1

    .line 1148
    iput-object v1, v0, Lcom/google/crypto/tink/shaded/protobuf/w;->unknownFields:Lcom/google/crypto/tink/shaded/protobuf/b0;

    .line 1149
    .line 1150
    :cond_21
    move/from16 v3, p4

    .line 1151
    .line 1152
    move-object v4, v1

    .line 1153
    move v0, v2

    .line 1154
    move v2, v5

    .line 1155
    move-object/from16 v1, p2

    .line 1156
    .line 1157
    move-object/from16 v5, p6

    .line 1158
    .line 1159
    invoke-static/range {v0 .. v5}, Lc1/g;->l(I[BIILcom/google/crypto/tink/shaded/protobuf/b0;Lcom/google/crypto/tink/shaded/protobuf/d;)I

    .line 1160
    .line 1161
    .line 1162
    move-result v2

    .line 1163
    move v5, v0

    .line 1164
    move-object/from16 v13, p6

    .line 1165
    .line 1166
    move v4, v3

    .line 1167
    move v12, v5

    .line 1168
    move-object v0, v6

    .line 1169
    move-object v1, v15

    .line 1170
    move/from16 v6, v18

    .line 1171
    .line 1172
    const v16, 0xfffff

    .line 1173
    .line 1174
    .line 1175
    move-object/from16 v3, p2

    .line 1176
    .line 1177
    move v5, v2

    .line 1178
    goto/16 :goto_8

    .line 1179
    .line 1180
    :cond_22
    move-object v6, v0

    .line 1181
    move-object v15, v1

    .line 1182
    move-object v10, v2

    .line 1183
    move/from16 v24, v8

    .line 1184
    .line 1185
    move/from16 v17, v9

    .line 1186
    .line 1187
    const/16 p3, 0x0

    .line 1188
    .line 1189
    goto :goto_19

    .line 1190
    :goto_1a
    if-eq v8, v0, :cond_23

    .line 1191
    .line 1192
    int-to-long v0, v8

    .line 1193
    invoke-virtual {v15, v10, v0, v1, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 1194
    .line 1195
    .line 1196
    :cond_23
    iget v0, v6, Lcom/google/crypto/tink/shaded/protobuf/P;->h:I

    .line 1197
    .line 1198
    :goto_1b
    iget v1, v6, Lcom/google/crypto/tink/shaded/protobuf/P;->i:I

    .line 1199
    .line 1200
    if-ge v0, v1, :cond_24

    .line 1201
    .line 1202
    iget-object v1, v6, Lcom/google/crypto/tink/shaded/protobuf/P;->g:[I

    .line 1203
    .line 1204
    aget v1, v1, v0

    .line 1205
    .line 1206
    move-object/from16 v2, p3

    .line 1207
    .line 1208
    invoke-virtual {v6, v1, v10, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->m(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 1209
    .line 1210
    .line 1211
    add-int/lit8 v0, v0, 0x1

    .line 1212
    .line 1213
    goto :goto_1b

    .line 1214
    :cond_24
    if-nez v14, :cond_26

    .line 1215
    .line 1216
    if-ne v5, v4, :cond_25

    .line 1217
    .line 1218
    goto :goto_1c

    .line 1219
    :cond_25
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->f()Lcom/google/crypto/tink/shaded/protobuf/C;

    .line 1220
    .line 1221
    .line 1222
    move-result-object v0

    .line 1223
    throw v0

    .line 1224
    :cond_26
    if-gt v5, v4, :cond_27

    .line 1225
    .line 1226
    if-ne v12, v14, :cond_27

    .line 1227
    .line 1228
    :goto_1c
    return v5

    .line 1229
    :cond_27
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->f()Lcom/google/crypto/tink/shaded/protobuf/C;

    .line 1230
    .line 1231
    .line 1232
    move-result-object v0

    .line 1233
    throw v0

    .line 1234
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_a
        :pswitch_3
        :pswitch_8
        :pswitch_9
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final F(Ljava/lang/Object;[BIIIIIIIJILcom/google/crypto/tink/shaded/protobuf/d;)I
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v9, p6

    move/from16 v2, p7

    move-wide/from16 v3, p10

    move/from16 v10, p12

    .line 1
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/P;->o:Lsun/misc/Unsafe;

    add-int/lit8 v6, v10, 0x2

    .line 2
    iget-object v7, v0, Lcom/google/crypto/tink/shaded/protobuf/P;->a:[I

    aget v6, v7, v6

    const v7, 0xfffff

    and-int/2addr v6, v7

    int-to-long v6, v6

    const/4 v8, 0x5

    const/4 v11, 0x1

    const/4 v12, 0x2

    packed-switch p9, :pswitch_data_0

    :cond_0
    move/from16 v10, p3

    goto/16 :goto_3

    :pswitch_0
    const/4 v3, 0x3

    if-ne v2, v3, :cond_0

    .line 3
    invoke-virtual {v0, v1, v9, v10}, Lcom/google/crypto/tink/shaded/protobuf/P;->y(Ljava/lang/Object;II)Ljava/lang/Object;

    move-result-object v2

    and-int/lit8 v3, p5, -0x8

    or-int/lit8 v7, v3, 0x4

    .line 4
    invoke-virtual {v0, v10}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    move-result-object v3

    move-object/from16 v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    move-object/from16 v8, p13

    .line 5
    invoke-static/range {v2 .. v8}, Lc1/g;->C(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Y;[BIIILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v3

    .line 6
    invoke-virtual {v0, v9, v10, v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->Q(IILjava/lang/Object;Ljava/lang/Object;)V

    return v3

    :pswitch_1
    move-object/from16 v11, p2

    move/from16 v8, p3

    move-object/from16 v13, p13

    if-nez v2, :cond_1

    .line 7
    invoke-static {v11, v8, v13}, Lc1/g;->p([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v2

    .line 8
    iget-wide v10, v13, Lcom/google/crypto/tink/shaded/protobuf/d;->b:J

    invoke-static {v10, v11}, Landroidx/datastore/preferences/protobuf/j;->e(J)J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v5, v1, v3, v4, v8}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 9
    invoke-virtual {v5, v1, v6, v7, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    return v2

    :cond_1
    move v10, v8

    goto/16 :goto_3

    :pswitch_2
    move-object/from16 v11, p2

    move/from16 v8, p3

    move-object/from16 v13, p13

    if-nez v2, :cond_1

    .line 10
    invoke-static {v11, v8, v13}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v2

    .line 11
    iget v8, v13, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    invoke-static {v8}, Landroidx/datastore/preferences/protobuf/j;->d(I)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v5, v1, v3, v4, v8}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 12
    invoke-virtual {v5, v1, v6, v7, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    return v2

    :pswitch_3
    move-object/from16 v11, p2

    move/from16 v8, p3

    move-object/from16 v13, p13

    if-nez v2, :cond_1

    .line 13
    invoke-static {v11, v8, v13}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v2

    .line 14
    iget v8, v13, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    .line 15
    invoke-virtual {v0, v10}, Lcom/google/crypto/tink/shaded/protobuf/P;->n(I)V

    .line 16
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v5, v1, v3, v4, v8}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 17
    invoke-virtual {v5, v1, v6, v7, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    return v2

    :pswitch_4
    move-object/from16 v11, p2

    move/from16 v8, p3

    move-object/from16 v13, p13

    if-ne v2, v12, :cond_1

    .line 18
    invoke-static {v11, v8, v13}, Lc1/g;->h([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v2

    .line 19
    iget-object v8, v13, Lcom/google/crypto/tink/shaded/protobuf/d;->c:Ljava/lang/Object;

    invoke-virtual {v5, v1, v3, v4, v8}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 20
    invoke-virtual {v5, v1, v6, v7, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    return v2

    :pswitch_5
    move-object/from16 v11, p2

    move/from16 v8, p3

    move-object/from16 v13, p13

    if-ne v2, v12, :cond_1

    .line 21
    invoke-virtual {v0, v1, v9, v10}, Lcom/google/crypto/tink/shaded/protobuf/P;->y(Ljava/lang/Object;II)Ljava/lang/Object;

    move-result-object v2

    .line 22
    invoke-virtual {v0, v10}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    move-result-object v3

    move/from16 v6, p4

    move v5, v8

    move-object v4, v11

    move-object v7, v13

    .line 23
    invoke-static/range {v2 .. v7}, Lc1/g;->D(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Y;[BIILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v3

    .line 24
    invoke-virtual {v0, v9, v10, v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->Q(IILjava/lang/Object;Ljava/lang/Object;)V

    return v3

    :pswitch_6
    move-object/from16 v13, p2

    move/from16 v10, p3

    move-object/from16 v8, p13

    if-ne v2, v12, :cond_6

    .line 25
    invoke-static {v13, v10, v8}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v2

    .line 26
    iget v8, v8, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    if-nez v8, :cond_2

    .line 27
    const-string v8, ""

    invoke-virtual {v5, v1, v3, v4, v8}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_1

    :cond_2
    const/high16 v10, 0x20000000

    and-int v10, p8, v10

    if-eqz v10, :cond_4

    add-int v10, v2, v8

    .line 28
    sget-object v11, Lcom/google/crypto/tink/shaded/protobuf/k0;->a:Lcom/google/crypto/tink/shaded/protobuf/i0;

    .line 29
    invoke-virtual {v11, v13, v2, v10}, Lcom/google/crypto/tink/shaded/protobuf/i0;->z([BII)I

    move-result v10

    if-nez v10, :cond_3

    goto :goto_0

    .line 30
    :cond_3
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->b()Lcom/google/crypto/tink/shaded/protobuf/C;

    move-result-object v1

    throw v1

    .line 31
    :cond_4
    :goto_0
    new-instance v10, Ljava/lang/String;

    sget-object v11, Lcom/google/crypto/tink/shaded/protobuf/A;->a:Ljava/nio/charset/Charset;

    invoke-direct {v10, v13, v2, v8, v11}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 32
    invoke-virtual {v5, v1, v3, v4, v10}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    add-int/2addr v2, v8

    .line 33
    :goto_1
    invoke-virtual {v5, v1, v6, v7, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    return v2

    :pswitch_7
    move-object/from16 v13, p2

    move/from16 v10, p3

    move-object/from16 v8, p13

    if-nez v2, :cond_6

    .line 34
    invoke-static {v13, v10, v8}, Lc1/g;->p([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v2

    .line 35
    iget-wide v12, v8, Lcom/google/crypto/tink/shaded/protobuf/d;->b:J

    const-wide/16 v14, 0x0

    cmp-long v8, v12, v14

    if-eqz v8, :cond_5

    goto :goto_2

    :cond_5
    const/4 v11, 0x0

    :goto_2
    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v5, v1, v3, v4, v8}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 36
    invoke-virtual {v5, v1, v6, v7, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    return v2

    :pswitch_8
    move-object/from16 v13, p2

    move/from16 v10, p3

    if-ne v2, v8, :cond_6

    .line 37
    invoke-static {v10, v13}, Lc1/g;->i(I[B)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v5, v1, v3, v4, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    add-int/lit8 v2, v10, 0x4

    .line 38
    invoke-virtual {v5, v1, v6, v7, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    return v2

    :pswitch_9
    move-object/from16 v13, p2

    move/from16 v10, p3

    if-ne v2, v11, :cond_6

    .line 39
    invoke-static {v10, v13}, Lc1/g;->j(I[B)J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v5, v1, v3, v4, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    add-int/lit8 v2, v10, 0x8

    .line 40
    invoke-virtual {v5, v1, v6, v7, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    return v2

    :pswitch_a
    move-object/from16 v13, p2

    move/from16 v10, p3

    move-object/from16 v8, p13

    if-nez v2, :cond_6

    .line 41
    invoke-static {v13, v10, v8}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v2

    .line 42
    iget v8, v8, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v5, v1, v3, v4, v8}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 43
    invoke-virtual {v5, v1, v6, v7, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    return v2

    :pswitch_b
    move-object/from16 v13, p2

    move/from16 v10, p3

    move-object/from16 v8, p13

    if-nez v2, :cond_6

    .line 44
    invoke-static {v13, v10, v8}, Lc1/g;->p([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v2

    .line 45
    iget-wide v10, v8, Lcom/google/crypto/tink/shaded/protobuf/d;->b:J

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v5, v1, v3, v4, v8}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 46
    invoke-virtual {v5, v1, v6, v7, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    return v2

    :pswitch_c
    move-object/from16 v13, p2

    move/from16 v10, p3

    if-ne v2, v8, :cond_6

    .line 47
    invoke-static {v10, v13}, Lc1/g;->i(I[B)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v2

    .line 48
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v5, v1, v3, v4, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    add-int/lit8 v2, v10, 0x4

    .line 49
    invoke-virtual {v5, v1, v6, v7, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    return v2

    :pswitch_d
    move-object/from16 v13, p2

    move/from16 v10, p3

    if-ne v2, v11, :cond_6

    .line 50
    invoke-static {v10, v13}, Lc1/g;->j(I[B)J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v11

    .line 51
    invoke-static {v11, v12}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v5, v1, v3, v4, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    add-int/lit8 v2, v10, 0x8

    .line 52
    invoke-virtual {v5, v1, v6, v7, v9}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    return v2

    :cond_6
    :goto_3
    return v10

    :pswitch_data_0
    .packed-switch 0x33
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_a
        :pswitch_3
        :pswitch_8
        :pswitch_9
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final G(Ljava/lang/Object;[BIIIIIJIJLcom/google/crypto/tink/shaded/protobuf/d;)I
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p5

    move/from16 v3, p6

    move/from16 v7, p7

    move-wide/from16 v4, p11

    .line 1
    sget-object v6, Lcom/google/crypto/tink/shaded/protobuf/P;->o:Lsun/misc/Unsafe;

    invoke-virtual {v6, v1, v4, v5}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 2
    move-object v9, v8

    check-cast v9, Lcom/google/crypto/tink/shaded/protobuf/b;

    .line 3
    iget-boolean v9, v9, Lcom/google/crypto/tink/shaded/protobuf/b;->e:Z

    const/4 v10, 0x2

    if-nez v9, :cond_0

    .line 4
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v9

    mul-int/2addr v9, v10

    .line 5
    invoke-interface {v8, v9}, Lcom/google/crypto/tink/shaded/protobuf/z;->a(I)Lcom/google/crypto/tink/shaded/protobuf/z;

    move-result-object v8

    .line 6
    invoke-virtual {v6, v1, v4, v5, v8}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    :cond_0
    move-object v5, v8

    const/16 v4, 0xa

    const/4 v6, 0x3

    const/4 v8, 0x5

    const-wide/16 v11, 0x0

    const/4 v9, 0x1

    packed-switch p10, :pswitch_data_0

    :cond_1
    move/from16 v1, p3

    goto/16 :goto_2c

    :pswitch_0
    if-ne v3, v6, :cond_1

    .line 7
    invoke-virtual {v0, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    move-result-object v1

    and-int/lit8 v3, v2, -0x8

    or-int/lit8 v3, v3, 0x4

    .line 8
    invoke-interface {v1}, Lcom/google/crypto/tink/shaded/protobuf/Y;->d()Ljava/lang/Object;

    move-result-object v4

    move-object/from16 p8, p2

    move/from16 p9, p3

    move/from16 p10, p4

    move-object/from16 p12, p13

    move-object/from16 p7, v1

    move/from16 p11, v3

    move-object/from16 p6, v4

    .line 9
    invoke-static/range {p6 .. p12}, Lc1/g;->C(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Y;[BIIILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    move-object/from16 v9, p6

    move-object/from16 v7, p7

    move-object/from16 v3, p8

    move/from16 v4, p10

    move/from16 v8, p11

    move-object/from16 v6, p12

    .line 10
    invoke-interface {v7, v9}, Lcom/google/crypto/tink/shaded/protobuf/Y;->b(Ljava/lang/Object;)V

    .line 11
    iput-object v9, v6, Lcom/google/crypto/tink/shaded/protobuf/d;->c:Ljava/lang/Object;

    .line 12
    invoke-interface {v5, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_0
    if-ge v1, v4, :cond_3

    .line 13
    invoke-static {v3, v1, v6}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v9

    .line 14
    iget v10, v6, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    if-eq v2, v10, :cond_2

    goto :goto_1

    .line 15
    :cond_2
    invoke-interface {v7}, Lcom/google/crypto/tink/shaded/protobuf/Y;->d()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 p6, v1

    move-object/from16 p8, v3

    move/from16 p10, v4

    move-object/from16 p12, v6

    move-object/from16 p7, v7

    move/from16 p11, v8

    move/from16 p9, v9

    .line 16
    invoke-static/range {p6 .. p12}, Lc1/g;->C(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Y;[BIIILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    move-object/from16 v9, p6

    move-object/from16 v4, p8

    move/from16 v6, p10

    move/from16 v3, p11

    move-object/from16 v8, p12

    .line 17
    invoke-interface {v7, v9}, Lcom/google/crypto/tink/shaded/protobuf/Y;->b(Ljava/lang/Object;)V

    .line 18
    iput-object v9, v8, Lcom/google/crypto/tink/shaded/protobuf/d;->c:Ljava/lang/Object;

    .line 19
    invoke-interface {v5, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object/from16 v16, v8

    move v8, v3

    move-object v3, v4

    move v4, v6

    move-object/from16 v6, v16

    goto :goto_0

    :cond_3
    :goto_1
    return v1

    :pswitch_1
    move-object/from16 v4, p2

    move/from16 v1, p3

    move/from16 v6, p4

    move-object/from16 v8, p13

    if-ne v3, v10, :cond_6

    .line 20
    check-cast v5, Lcom/google/crypto/tink/shaded/protobuf/G;

    .line 21
    invoke-static {v4, v1, v8}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    .line 22
    iget v2, v8, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    add-int/2addr v2, v1

    :goto_2
    if-ge v1, v2, :cond_4

    .line 23
    invoke-static {v4, v1, v8}, Lc1/g;->p([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    .line 24
    iget-wide v6, v8, Lcom/google/crypto/tink/shaded/protobuf/d;->b:J

    invoke-static {v6, v7}, Landroidx/datastore/preferences/protobuf/j;->e(J)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lcom/google/crypto/tink/shaded/protobuf/G;->c(J)V

    goto :goto_2

    :cond_4
    if-ne v1, v2, :cond_5

    return v1

    .line 25
    :cond_5
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->g()Lcom/google/crypto/tink/shaded/protobuf/C;

    move-result-object v1

    throw v1

    :cond_6
    if-nez v3, :cond_5c

    .line 26
    check-cast v5, Lcom/google/crypto/tink/shaded/protobuf/G;

    .line 27
    invoke-static {v4, v1, v8}, Lc1/g;->p([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    .line 28
    iget-wide v9, v8, Lcom/google/crypto/tink/shaded/protobuf/d;->b:J

    invoke-static {v9, v10}, Landroidx/datastore/preferences/protobuf/j;->e(J)J

    move-result-wide v9

    invoke-virtual {v5, v9, v10}, Lcom/google/crypto/tink/shaded/protobuf/G;->c(J)V

    :goto_3
    if-ge v1, v6, :cond_8

    .line 29
    invoke-static {v4, v1, v8}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v3

    .line 30
    iget v7, v8, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    if-eq v2, v7, :cond_7

    goto :goto_4

    .line 31
    :cond_7
    invoke-static {v4, v3, v8}, Lc1/g;->p([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    .line 32
    iget-wide v9, v8, Lcom/google/crypto/tink/shaded/protobuf/d;->b:J

    invoke-static {v9, v10}, Landroidx/datastore/preferences/protobuf/j;->e(J)J

    move-result-wide v9

    invoke-virtual {v5, v9, v10}, Lcom/google/crypto/tink/shaded/protobuf/G;->c(J)V

    goto :goto_3

    :cond_8
    :goto_4
    return v1

    :pswitch_2
    move-object/from16 v4, p2

    move/from16 v1, p3

    move/from16 v6, p4

    move-object/from16 v8, p13

    if-ne v3, v10, :cond_b

    .line 33
    check-cast v5, Lcom/google/crypto/tink/shaded/protobuf/x;

    .line 34
    invoke-static {v4, v1, v8}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    .line 35
    iget v2, v8, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    add-int/2addr v2, v1

    :goto_5
    if-ge v1, v2, :cond_9

    .line 36
    invoke-static {v4, v1, v8}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    .line 37
    iget v3, v8, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/j;->d(I)I

    move-result v3

    invoke-virtual {v5, v3}, Lcom/google/crypto/tink/shaded/protobuf/x;->c(I)V

    goto :goto_5

    :cond_9
    if-ne v1, v2, :cond_a

    return v1

    .line 38
    :cond_a
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->g()Lcom/google/crypto/tink/shaded/protobuf/C;

    move-result-object v1

    throw v1

    :cond_b
    if-nez v3, :cond_5c

    .line 39
    check-cast v5, Lcom/google/crypto/tink/shaded/protobuf/x;

    .line 40
    invoke-static {v4, v1, v8}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    .line 41
    iget v3, v8, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/j;->d(I)I

    move-result v3

    invoke-virtual {v5, v3}, Lcom/google/crypto/tink/shaded/protobuf/x;->c(I)V

    :goto_6
    if-ge v1, v6, :cond_d

    .line 42
    invoke-static {v4, v1, v8}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v3

    .line 43
    iget v7, v8, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    if-eq v2, v7, :cond_c

    goto :goto_7

    .line 44
    :cond_c
    invoke-static {v4, v3, v8}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    .line 45
    iget v3, v8, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/j;->d(I)I

    move-result v3

    invoke-virtual {v5, v3}, Lcom/google/crypto/tink/shaded/protobuf/x;->c(I)V

    goto :goto_6

    :cond_d
    :goto_7
    return v1

    :pswitch_3
    move-object/from16 v4, p2

    move/from16 v1, p3

    move/from16 v6, p4

    move-object/from16 v8, p13

    if-ne v3, v10, :cond_10

    .line 46
    check-cast v5, Lcom/google/crypto/tink/shaded/protobuf/x;

    .line 47
    invoke-static {v4, v1, v8}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    .line 48
    iget v2, v8, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    add-int/2addr v2, v1

    :goto_8
    if-ge v1, v2, :cond_e

    .line 49
    invoke-static {v4, v1, v8}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    .line 50
    iget v3, v8, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    invoke-virtual {v5, v3}, Lcom/google/crypto/tink/shaded/protobuf/x;->c(I)V

    goto :goto_8

    :cond_e
    if-ne v1, v2, :cond_f

    goto :goto_9

    .line 51
    :cond_f
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->g()Lcom/google/crypto/tink/shaded/protobuf/C;

    move-result-object v1

    throw v1

    :cond_10
    if-nez v3, :cond_5c

    move v3, v1

    move v1, v2

    move-object v2, v4

    move v4, v6

    move-object v6, v8

    .line 52
    invoke-static/range {v1 .. v6}, Lc1/g;->o(I[BIILcom/google/crypto/tink/shaded/protobuf/z;Lcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    .line 53
    :goto_9
    invoke-virtual {v0, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->n(I)V

    .line 54
    sget-object v2, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    return v1

    :pswitch_4
    move/from16 v1, p3

    move/from16 v4, p4

    move-object/from16 v6, p13

    move-object v8, v5

    move v5, v2

    move-object/from16 v2, p2

    if-ne v3, v10, :cond_5c

    .line 55
    invoke-static {v2, v1, v6}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    .line 56
    iget v3, v6, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    if-ltz v3, :cond_18

    .line 57
    array-length v7, v2

    sub-int/2addr v7, v1

    if-gt v3, v7, :cond_17

    if-nez v3, :cond_11

    .line 58
    sget-object v3, Lcom/google/crypto/tink/shaded/protobuf/i;->f:Lcom/google/crypto/tink/shaded/protobuf/h;

    invoke-interface {v8, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 59
    :cond_11
    invoke-static {v2, v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i;->d([BII)Lcom/google/crypto/tink/shaded/protobuf/h;

    move-result-object v7

    invoke-interface {v8, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_a
    add-int/2addr v1, v3

    :goto_b
    if-ge v1, v4, :cond_16

    .line 60
    invoke-static {v2, v1, v6}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v3

    .line 61
    iget v7, v6, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    if-eq v5, v7, :cond_12

    goto :goto_c

    .line 62
    :cond_12
    invoke-static {v2, v3, v6}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    .line 63
    iget v3, v6, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    if-ltz v3, :cond_15

    .line 64
    array-length v7, v2

    sub-int/2addr v7, v1

    if-gt v3, v7, :cond_14

    if-nez v3, :cond_13

    .line 65
    sget-object v3, Lcom/google/crypto/tink/shaded/protobuf/i;->f:Lcom/google/crypto/tink/shaded/protobuf/h;

    invoke-interface {v8, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 66
    :cond_13
    invoke-static {v2, v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/i;->d([BII)Lcom/google/crypto/tink/shaded/protobuf/h;

    move-result-object v7

    invoke-interface {v8, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_a

    .line 67
    :cond_14
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->g()Lcom/google/crypto/tink/shaded/protobuf/C;

    move-result-object v1

    throw v1

    .line 68
    :cond_15
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->e()Lcom/google/crypto/tink/shaded/protobuf/C;

    move-result-object v1

    throw v1

    :cond_16
    :goto_c
    return v1

    .line 69
    :cond_17
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->g()Lcom/google/crypto/tink/shaded/protobuf/C;

    move-result-object v1

    throw v1

    .line 70
    :cond_18
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->e()Lcom/google/crypto/tink/shaded/protobuf/C;

    move-result-object v1

    throw v1

    :pswitch_5
    move/from16 v1, p3

    move/from16 v4, p4

    move-object/from16 v6, p13

    move-object v8, v5

    move v5, v2

    move-object/from16 v2, p2

    if-ne v3, v10, :cond_5c

    .line 71
    invoke-virtual {v0, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    move-result-object v3

    move/from16 p9, v1

    move-object/from16 p8, v2

    move-object/from16 p6, v3

    move/from16 p10, v4

    move/from16 p7, v5

    move-object/from16 p12, v6

    move-object/from16 p11, v8

    .line 72
    invoke-static/range {p6 .. p12}, Lc1/g;->k(Lcom/google/crypto/tink/shaded/protobuf/Y;I[BIILcom/google/crypto/tink/shaded/protobuf/z;Lcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    return v1

    :pswitch_6
    move/from16 v7, p4

    move-object/from16 v14, p13

    move v13, v2

    move-object v15, v5

    move-object/from16 v5, p2

    move/from16 v2, p3

    if-ne v3, v10, :cond_28

    const-wide/32 v3, 0x20000000

    and-long v3, p8, v3

    cmp-long v1, v3, v11

    .line 73
    const-string v3, ""

    if-nez v1, :cond_1f

    .line 74
    invoke-static {v5, v2, v14}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    .line 75
    iget v2, v14, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    if-ltz v2, :cond_1e

    if-nez v2, :cond_19

    .line 76
    invoke-interface {v15, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_e

    .line 77
    :cond_19
    new-instance v4, Ljava/lang/String;

    sget-object v6, Lcom/google/crypto/tink/shaded/protobuf/A;->a:Ljava/nio/charset/Charset;

    invoke-direct {v4, v5, v1, v2, v6}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 78
    invoke-interface {v15, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_d
    add-int/2addr v1, v2

    :goto_e
    if-ge v1, v7, :cond_1d

    .line 79
    invoke-static {v5, v1, v14}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v2

    .line 80
    iget v4, v14, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    if-eq v13, v4, :cond_1a

    goto :goto_f

    .line 81
    :cond_1a
    invoke-static {v5, v2, v14}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    .line 82
    iget v2, v14, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    if-ltz v2, :cond_1c

    if-nez v2, :cond_1b

    .line 83
    invoke-interface {v15, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_e

    .line 84
    :cond_1b
    new-instance v4, Ljava/lang/String;

    sget-object v6, Lcom/google/crypto/tink/shaded/protobuf/A;->a:Ljava/nio/charset/Charset;

    invoke-direct {v4, v5, v1, v2, v6}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 85
    invoke-interface {v15, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_d

    .line 86
    :cond_1c
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->e()Lcom/google/crypto/tink/shaded/protobuf/C;

    move-result-object v1

    throw v1

    :cond_1d
    :goto_f
    return v1

    .line 87
    :cond_1e
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->e()Lcom/google/crypto/tink/shaded/protobuf/C;

    move-result-object v1

    throw v1

    .line 88
    :cond_1f
    invoke-static {v5, v2, v14}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    .line 89
    iget v2, v14, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    if-ltz v2, :cond_27

    if-nez v2, :cond_20

    .line 90
    invoke-interface {v15, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_11

    :cond_20
    add-int v4, v1, v2

    .line 91
    sget-object v6, Lcom/google/crypto/tink/shaded/protobuf/k0;->a:Lcom/google/crypto/tink/shaded/protobuf/i0;

    .line 92
    invoke-virtual {v6, v5, v1, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->z([BII)I

    move-result v6

    if-nez v6, :cond_26

    .line 93
    new-instance v6, Ljava/lang/String;

    sget-object v8, Lcom/google/crypto/tink/shaded/protobuf/A;->a:Ljava/nio/charset/Charset;

    invoke-direct {v6, v5, v1, v2, v8}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 94
    invoke-interface {v15, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_10
    move v1, v4

    :goto_11
    if-ge v1, v7, :cond_25

    .line 95
    invoke-static {v5, v1, v14}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v2

    .line 96
    iget v4, v14, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    if-eq v13, v4, :cond_21

    goto :goto_12

    .line 97
    :cond_21
    invoke-static {v5, v2, v14}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    .line 98
    iget v2, v14, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    if-ltz v2, :cond_24

    if-nez v2, :cond_22

    .line 99
    invoke-interface {v15, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_11

    :cond_22
    add-int v4, v1, v2

    .line 100
    sget-object v6, Lcom/google/crypto/tink/shaded/protobuf/k0;->a:Lcom/google/crypto/tink/shaded/protobuf/i0;

    .line 101
    invoke-virtual {v6, v5, v1, v4}, Lcom/google/crypto/tink/shaded/protobuf/i0;->z([BII)I

    move-result v6

    if-nez v6, :cond_23

    .line 102
    new-instance v6, Ljava/lang/String;

    sget-object v8, Lcom/google/crypto/tink/shaded/protobuf/A;->a:Ljava/nio/charset/Charset;

    invoke-direct {v6, v5, v1, v2, v8}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 103
    invoke-interface {v15, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_10

    .line 104
    :cond_23
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->b()Lcom/google/crypto/tink/shaded/protobuf/C;

    move-result-object v1

    throw v1

    .line 105
    :cond_24
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->e()Lcom/google/crypto/tink/shaded/protobuf/C;

    move-result-object v1

    throw v1

    :cond_25
    :goto_12
    return v1

    .line 106
    :cond_26
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->b()Lcom/google/crypto/tink/shaded/protobuf/C;

    move-result-object v1

    throw v1

    .line 107
    :cond_27
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->e()Lcom/google/crypto/tink/shaded/protobuf/C;

    move-result-object v1

    throw v1

    :cond_28
    move v1, v2

    goto/16 :goto_2c

    :pswitch_7
    move/from16 v7, p4

    move-object/from16 v14, p13

    move v13, v2

    move-object v15, v5

    move-object/from16 v5, p2

    move/from16 v2, p3

    if-ne v3, v10, :cond_2c

    .line 108
    move-object v3, v15

    check-cast v3, Lcom/google/crypto/tink/shaded/protobuf/e;

    .line 109
    invoke-static {v5, v2, v14}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v2

    .line 110
    iget v4, v14, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    add-int/2addr v4, v2

    :goto_13
    if-ge v2, v4, :cond_2a

    .line 111
    invoke-static {v5, v2, v14}, Lc1/g;->p([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v2

    .line 112
    iget-wide v6, v14, Lcom/google/crypto/tink/shaded/protobuf/d;->b:J

    cmp-long v6, v6, v11

    if-eqz v6, :cond_29

    move v6, v9

    goto :goto_14

    :cond_29
    const/4 v6, 0x0

    :goto_14
    invoke-virtual {v3, v6}, Lcom/google/crypto/tink/shaded/protobuf/e;->c(Z)V

    goto :goto_13

    :cond_2a
    if-ne v2, v4, :cond_2b

    return v2

    .line 113
    :cond_2b
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->g()Lcom/google/crypto/tink/shaded/protobuf/C;

    move-result-object v1

    throw v1

    :cond_2c
    if-nez v3, :cond_28

    .line 114
    move-object v3, v15

    check-cast v3, Lcom/google/crypto/tink/shaded/protobuf/e;

    .line 115
    invoke-static {v5, v2, v14}, Lc1/g;->p([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v2

    move/from16 p3, v2

    const/16 p1, 0x0

    .line 116
    iget-wide v1, v14, Lcom/google/crypto/tink/shaded/protobuf/d;->b:J

    cmp-long v1, v1, v11

    if-eqz v1, :cond_2d

    move v1, v9

    goto :goto_15

    :cond_2d
    move/from16 v1, p1

    :goto_15
    invoke-virtual {v3, v1}, Lcom/google/crypto/tink/shaded/protobuf/e;->c(Z)V

    move/from16 v2, p3

    :goto_16
    if-ge v2, v7, :cond_30

    .line 117
    invoke-static {v5, v2, v14}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    .line 118
    iget v4, v14, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    if-eq v13, v4, :cond_2e

    goto :goto_18

    .line 119
    :cond_2e
    invoke-static {v5, v1, v14}, Lc1/g;->p([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v2

    move-wide/from16 p11, v11

    .line 120
    iget-wide v11, v14, Lcom/google/crypto/tink/shaded/protobuf/d;->b:J

    cmp-long v1, v11, p11

    if-eqz v1, :cond_2f

    move v1, v9

    goto :goto_17

    :cond_2f
    move/from16 v1, p1

    :goto_17
    invoke-virtual {v3, v1}, Lcom/google/crypto/tink/shaded/protobuf/e;->c(Z)V

    move-wide/from16 v11, p11

    goto :goto_16

    :cond_30
    :goto_18
    return v2

    :pswitch_8
    move/from16 v7, p4

    move-object/from16 v14, p13

    move v13, v2

    move-object v15, v5

    const/16 p1, 0x0

    move-object/from16 v5, p2

    move/from16 v2, p3

    if-ne v3, v10, :cond_37

    .line 121
    move-object v1, v15

    check-cast v1, Lcom/google/crypto/tink/shaded/protobuf/x;

    .line 122
    invoke-static {v5, v2, v14}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v2

    .line 123
    iget v3, v14, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    add-int v7, v2, v3

    .line 124
    array-length v8, v5

    if-gt v7, v8, :cond_36

    .line 125
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 126
    div-int/lit8 v3, v3, 0x4

    add-int/lit8 v3, v3, 0x0

    .line 127
    iget-object v8, v1, Lcom/google/crypto/tink/shaded/protobuf/x;->f:[I

    array-length v11, v8

    if-gt v3, v11, :cond_31

    goto :goto_1a

    .line 128
    :cond_31
    array-length v11, v8

    if-nez v11, :cond_32

    .line 129
    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    new-array v3, v3, [I

    iput-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/x;->f:[I

    goto :goto_1a

    .line 130
    :cond_32
    array-length v8, v8

    :goto_19
    if-ge v8, v3, :cond_33

    .line 131
    invoke-static {v8, v6, v10, v9, v4}, LE1/j;->h(IIIII)I

    move-result v8

    goto :goto_19

    .line 132
    :cond_33
    iget-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/x;->f:[I

    invoke-static {v3, v8}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v3

    iput-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/x;->f:[I

    :goto_1a
    if-ge v2, v7, :cond_34

    .line 133
    invoke-static {v2, v5}, Lc1/g;->i(I[B)I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/x;->c(I)V

    add-int/lit8 v2, v2, 0x4

    goto :goto_1a

    :cond_34
    if-ne v2, v7, :cond_35

    return v2

    .line 134
    :cond_35
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->g()Lcom/google/crypto/tink/shaded/protobuf/C;

    move-result-object v1

    throw v1

    .line 135
    :cond_36
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->g()Lcom/google/crypto/tink/shaded/protobuf/C;

    move-result-object v1

    throw v1

    :cond_37
    if-ne v3, v8, :cond_28

    .line 136
    move-object v1, v15

    check-cast v1, Lcom/google/crypto/tink/shaded/protobuf/x;

    .line 137
    invoke-static {v2, v5}, Lc1/g;->i(I[B)I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/x;->c(I)V

    add-int/lit8 v2, v2, 0x4

    :goto_1b
    if-ge v2, v7, :cond_39

    .line 138
    invoke-static {v5, v2, v14}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v3

    .line 139
    iget v4, v14, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    if-eq v13, v4, :cond_38

    goto :goto_1c

    .line 140
    :cond_38
    invoke-static {v3, v5}, Lc1/g;->i(I[B)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/x;->c(I)V

    add-int/lit8 v2, v3, 0x4

    goto :goto_1b

    :cond_39
    :goto_1c
    return v2

    :pswitch_9
    move/from16 v7, p4

    move-object/from16 v14, p13

    move v13, v2

    move-object v15, v5

    const/16 p1, 0x0

    move-object/from16 v5, p2

    move/from16 v2, p3

    if-ne v3, v10, :cond_40

    .line 141
    move-object v1, v15

    check-cast v1, Lcom/google/crypto/tink/shaded/protobuf/G;

    .line 142
    invoke-static {v5, v2, v14}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v2

    .line 143
    iget v3, v14, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    add-int v7, v2, v3

    .line 144
    array-length v8, v5

    if-gt v7, v8, :cond_3f

    .line 145
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 146
    div-int/lit8 v3, v3, 0x8

    add-int/lit8 v3, v3, 0x0

    .line 147
    iget-object v8, v1, Lcom/google/crypto/tink/shaded/protobuf/G;->f:[J

    array-length v11, v8

    if-gt v3, v11, :cond_3a

    goto :goto_1e

    .line 148
    :cond_3a
    array-length v11, v8

    if-nez v11, :cond_3b

    .line 149
    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    new-array v3, v3, [J

    iput-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/G;->f:[J

    goto :goto_1e

    .line 150
    :cond_3b
    array-length v8, v8

    :goto_1d
    if-ge v8, v3, :cond_3c

    .line 151
    invoke-static {v8, v6, v10, v9, v4}, LE1/j;->h(IIIII)I

    move-result v8

    goto :goto_1d

    .line 152
    :cond_3c
    iget-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/G;->f:[J

    invoke-static {v3, v8}, Ljava/util/Arrays;->copyOf([JI)[J

    move-result-object v3

    iput-object v3, v1, Lcom/google/crypto/tink/shaded/protobuf/G;->f:[J

    :goto_1e
    if-ge v2, v7, :cond_3d

    .line 153
    invoke-static {v2, v5}, Lc1/g;->j(I[B)J

    move-result-wide v3

    invoke-virtual {v1, v3, v4}, Lcom/google/crypto/tink/shaded/protobuf/G;->c(J)V

    add-int/lit8 v2, v2, 0x8

    goto :goto_1e

    :cond_3d
    if-ne v2, v7, :cond_3e

    return v2

    .line 154
    :cond_3e
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->g()Lcom/google/crypto/tink/shaded/protobuf/C;

    move-result-object v1

    throw v1

    .line 155
    :cond_3f
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->g()Lcom/google/crypto/tink/shaded/protobuf/C;

    move-result-object v1

    throw v1

    :cond_40
    if-ne v3, v9, :cond_28

    .line 156
    move-object v1, v15

    check-cast v1, Lcom/google/crypto/tink/shaded/protobuf/G;

    .line 157
    invoke-static {v2, v5}, Lc1/g;->j(I[B)J

    move-result-wide v3

    invoke-virtual {v1, v3, v4}, Lcom/google/crypto/tink/shaded/protobuf/G;->c(J)V

    add-int/lit8 v2, v2, 0x8

    :goto_1f
    if-ge v2, v7, :cond_42

    .line 158
    invoke-static {v5, v2, v14}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v3

    .line 159
    iget v4, v14, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    if-eq v13, v4, :cond_41

    goto :goto_20

    .line 160
    :cond_41
    invoke-static {v3, v5}, Lc1/g;->j(I[B)J

    move-result-wide v8

    invoke-virtual {v1, v8, v9}, Lcom/google/crypto/tink/shaded/protobuf/G;->c(J)V

    add-int/lit8 v2, v3, 0x8

    goto :goto_1f

    :cond_42
    :goto_20
    return v2

    :pswitch_a
    move/from16 v7, p4

    move-object/from16 v14, p13

    move v13, v2

    move-object v15, v5

    move-object/from16 v5, p2

    move/from16 v2, p3

    if-ne v3, v10, :cond_45

    .line 161
    move-object v1, v15

    check-cast v1, Lcom/google/crypto/tink/shaded/protobuf/x;

    .line 162
    invoke-static {v5, v2, v14}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v2

    .line 163
    iget v3, v14, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    add-int/2addr v3, v2

    :goto_21
    if-ge v2, v3, :cond_43

    .line 164
    invoke-static {v5, v2, v14}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v2

    .line 165
    iget v4, v14, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    invoke-virtual {v1, v4}, Lcom/google/crypto/tink/shaded/protobuf/x;->c(I)V

    goto :goto_21

    :cond_43
    if-ne v2, v3, :cond_44

    return v2

    .line 166
    :cond_44
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->g()Lcom/google/crypto/tink/shaded/protobuf/C;

    move-result-object v1

    throw v1

    :cond_45
    if-nez v3, :cond_28

    move/from16 p8, v2

    move-object/from16 p7, v5

    move/from16 p9, v7

    move/from16 p6, v13

    move-object/from16 p11, v14

    move-object/from16 p10, v15

    .line 167
    invoke-static/range {p6 .. p11}, Lc1/g;->o(I[BIILcom/google/crypto/tink/shaded/protobuf/z;Lcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    return v1

    :pswitch_b
    move/from16 v1, p3

    move/from16 v7, p4

    move-object/from16 v14, p13

    move-object v15, v5

    move v5, v2

    move-object/from16 v2, p2

    if-ne v3, v10, :cond_48

    .line 168
    move-object v5, v15

    check-cast v5, Lcom/google/crypto/tink/shaded/protobuf/G;

    .line 169
    invoke-static {v2, v1, v14}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    .line 170
    iget v3, v14, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    add-int/2addr v3, v1

    :goto_22
    if-ge v1, v3, :cond_46

    .line 171
    invoke-static {v2, v1, v14}, Lc1/g;->p([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    .line 172
    iget-wide v6, v14, Lcom/google/crypto/tink/shaded/protobuf/d;->b:J

    invoke-virtual {v5, v6, v7}, Lcom/google/crypto/tink/shaded/protobuf/G;->c(J)V

    goto :goto_22

    :cond_46
    if-ne v1, v3, :cond_47

    return v1

    .line 173
    :cond_47
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->g()Lcom/google/crypto/tink/shaded/protobuf/C;

    move-result-object v1

    throw v1

    :cond_48
    if-nez v3, :cond_5c

    .line 174
    move-object v3, v15

    check-cast v3, Lcom/google/crypto/tink/shaded/protobuf/G;

    .line 175
    invoke-static {v2, v1, v14}, Lc1/g;->p([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    .line 176
    iget-wide v8, v14, Lcom/google/crypto/tink/shaded/protobuf/d;->b:J

    invoke-virtual {v3, v8, v9}, Lcom/google/crypto/tink/shaded/protobuf/G;->c(J)V

    :goto_23
    if-ge v1, v7, :cond_4a

    .line 177
    invoke-static {v2, v1, v14}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v4

    .line 178
    iget v6, v14, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    if-eq v5, v6, :cond_49

    goto :goto_24

    .line 179
    :cond_49
    invoke-static {v2, v4, v14}, Lc1/g;->p([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    .line 180
    iget-wide v8, v14, Lcom/google/crypto/tink/shaded/protobuf/d;->b:J

    invoke-virtual {v3, v8, v9}, Lcom/google/crypto/tink/shaded/protobuf/G;->c(J)V

    goto :goto_23

    :cond_4a
    :goto_24
    return v1

    :pswitch_c
    move/from16 v1, p3

    move/from16 v7, p4

    move-object/from16 v14, p13

    move-object v15, v5

    const/16 p1, 0x0

    move v5, v2

    move-object/from16 v2, p2

    if-ne v3, v10, :cond_51

    .line 181
    move-object v5, v15

    check-cast v5, Lcom/google/crypto/tink/shaded/protobuf/s;

    .line 182
    invoke-static {v2, v1, v14}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    .line 183
    iget v3, v14, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    add-int v7, v1, v3

    .line 184
    array-length v8, v2

    if-gt v7, v8, :cond_50

    .line 185
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 186
    div-int/lit8 v3, v3, 0x4

    add-int/lit8 v3, v3, 0x0

    .line 187
    iget-object v8, v5, Lcom/google/crypto/tink/shaded/protobuf/s;->f:[F

    array-length v11, v8

    if-gt v3, v11, :cond_4b

    goto :goto_26

    .line 188
    :cond_4b
    array-length v11, v8

    if-nez v11, :cond_4c

    .line 189
    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    new-array v3, v3, [F

    iput-object v3, v5, Lcom/google/crypto/tink/shaded/protobuf/s;->f:[F

    goto :goto_26

    .line 190
    :cond_4c
    array-length v8, v8

    :goto_25
    if-ge v8, v3, :cond_4d

    .line 191
    invoke-static {v8, v6, v10, v9, v4}, LE1/j;->h(IIIII)I

    move-result v8

    goto :goto_25

    .line 192
    :cond_4d
    iget-object v3, v5, Lcom/google/crypto/tink/shaded/protobuf/s;->f:[F

    invoke-static {v3, v8}, Ljava/util/Arrays;->copyOf([FI)[F

    move-result-object v3

    iput-object v3, v5, Lcom/google/crypto/tink/shaded/protobuf/s;->f:[F

    :goto_26
    if-ge v1, v7, :cond_4e

    .line 193
    invoke-static {v1, v2}, Lc1/g;->i(I[B)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v3

    .line 194
    invoke-virtual {v5, v3}, Lcom/google/crypto/tink/shaded/protobuf/s;->c(F)V

    add-int/lit8 v1, v1, 0x4

    goto :goto_26

    :cond_4e
    if-ne v1, v7, :cond_4f

    return v1

    .line 195
    :cond_4f
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->g()Lcom/google/crypto/tink/shaded/protobuf/C;

    move-result-object v1

    throw v1

    .line 196
    :cond_50
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->g()Lcom/google/crypto/tink/shaded/protobuf/C;

    move-result-object v1

    throw v1

    :cond_51
    if-ne v3, v8, :cond_5c

    .line 197
    move-object v3, v15

    check-cast v3, Lcom/google/crypto/tink/shaded/protobuf/s;

    .line 198
    invoke-static {v1, v2}, Lc1/g;->i(I[B)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v4

    .line 199
    invoke-virtual {v3, v4}, Lcom/google/crypto/tink/shaded/protobuf/s;->c(F)V

    add-int/lit8 v1, v1, 0x4

    :goto_27
    if-ge v1, v7, :cond_53

    .line 200
    invoke-static {v2, v1, v14}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v4

    .line 201
    iget v6, v14, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    if-eq v5, v6, :cond_52

    goto :goto_28

    .line 202
    :cond_52
    invoke-static {v4, v2}, Lc1/g;->i(I[B)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v1

    .line 203
    invoke-virtual {v3, v1}, Lcom/google/crypto/tink/shaded/protobuf/s;->c(F)V

    add-int/lit8 v1, v4, 0x4

    goto :goto_27

    :cond_53
    :goto_28
    return v1

    :pswitch_d
    move/from16 v1, p3

    move/from16 v7, p4

    move-object/from16 v14, p13

    move-object v15, v5

    const/16 p1, 0x0

    move v5, v2

    move-object/from16 v2, p2

    if-ne v3, v10, :cond_5a

    .line 204
    move-object v5, v15

    check-cast v5, Lcom/google/crypto/tink/shaded/protobuf/m;

    .line 205
    invoke-static {v2, v1, v14}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v1

    .line 206
    iget v3, v14, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    add-int v7, v1, v3

    .line 207
    array-length v8, v2

    if-gt v7, v8, :cond_59

    .line 208
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 209
    div-int/lit8 v3, v3, 0x8

    add-int/lit8 v3, v3, 0x0

    .line 210
    iget-object v8, v5, Lcom/google/crypto/tink/shaded/protobuf/m;->f:[D

    array-length v11, v8

    if-gt v3, v11, :cond_54

    goto :goto_2a

    .line 211
    :cond_54
    array-length v11, v8

    if-nez v11, :cond_55

    .line 212
    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    new-array v3, v3, [D

    iput-object v3, v5, Lcom/google/crypto/tink/shaded/protobuf/m;->f:[D

    goto :goto_2a

    .line 213
    :cond_55
    array-length v8, v8

    :goto_29
    if-ge v8, v3, :cond_56

    .line 214
    invoke-static {v8, v6, v10, v9, v4}, LE1/j;->h(IIIII)I

    move-result v8

    goto :goto_29

    .line 215
    :cond_56
    iget-object v3, v5, Lcom/google/crypto/tink/shaded/protobuf/m;->f:[D

    invoke-static {v3, v8}, Ljava/util/Arrays;->copyOf([DI)[D

    move-result-object v3

    iput-object v3, v5, Lcom/google/crypto/tink/shaded/protobuf/m;->f:[D

    :goto_2a
    if-ge v1, v7, :cond_57

    .line 216
    invoke-static {v1, v2}, Lc1/g;->j(I[B)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v3

    .line 217
    invoke-virtual {v5, v3, v4}, Lcom/google/crypto/tink/shaded/protobuf/m;->c(D)V

    add-int/lit8 v1, v1, 0x8

    goto :goto_2a

    :cond_57
    if-ne v1, v7, :cond_58

    return v1

    .line 218
    :cond_58
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->g()Lcom/google/crypto/tink/shaded/protobuf/C;

    move-result-object v1

    throw v1

    .line 219
    :cond_59
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->g()Lcom/google/crypto/tink/shaded/protobuf/C;

    move-result-object v1

    throw v1

    :cond_5a
    if-ne v3, v9, :cond_5c

    .line 220
    move-object v3, v15

    check-cast v3, Lcom/google/crypto/tink/shaded/protobuf/m;

    .line 221
    invoke-static {v1, v2}, Lc1/g;->j(I[B)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v8

    .line 222
    invoke-virtual {v3, v8, v9}, Lcom/google/crypto/tink/shaded/protobuf/m;->c(D)V

    add-int/lit8 v1, v1, 0x8

    :goto_2b
    if-ge v1, v7, :cond_5c

    .line 223
    invoke-static {v2, v1, v14}, Lc1/g;->n([BILcom/google/crypto/tink/shaded/protobuf/d;)I

    move-result v4

    .line 224
    iget v6, v14, Lcom/google/crypto/tink/shaded/protobuf/d;->a:I

    if-eq v5, v6, :cond_5b

    goto :goto_2c

    .line 225
    :cond_5b
    invoke-static {v4, v2}, Lc1/g;->j(I[B)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v8

    .line 226
    invoke-virtual {v3, v8, v9}, Lcom/google/crypto/tink/shaded/protobuf/m;->c(D)V

    add-int/lit8 v1, v4, 0x8

    goto :goto_2b

    :cond_5c
    :goto_2c
    return v1

    :pswitch_data_0
    .packed-switch 0x12
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_a
        :pswitch_3
        :pswitch_8
        :pswitch_9
        :pswitch_2
        :pswitch_1
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_a
        :pswitch_3
        :pswitch_8
        :pswitch_9
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final H(Ljava/lang/Object;JLandroidx/datastore/preferences/protobuf/k;Lcom/google/crypto/tink/shaded/protobuf/Y;Lcom/google/crypto/tink/shaded/protobuf/o;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->k:Lcom/google/crypto/tink/shaded/protobuf/E;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-static {p2, p3, p1}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object p2, p4, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p2, Landroidx/datastore/preferences/protobuf/j;

    .line 13
    .line 14
    iget p3, p4, Landroidx/datastore/preferences/protobuf/k;->b:I

    .line 15
    .line 16
    and-int/lit8 v0, p3, 0x7

    .line 17
    .line 18
    const/4 v1, 0x3

    .line 19
    if-ne v0, v1, :cond_3

    .line 20
    .line 21
    :cond_0
    invoke-interface {p5}, Lcom/google/crypto/tink/shaded/protobuf/Y;->d()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p4, v0, p5, p6}, Landroidx/datastore/preferences/protobuf/k;->c(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Y;Lcom/google/crypto/tink/shaded/protobuf/o;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {p5, v0}, Lcom/google/crypto/tink/shaded/protobuf/Y;->b(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    invoke-virtual {p2}, Landroidx/datastore/preferences/protobuf/j;->g()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_2

    .line 39
    .line 40
    iget v0, p4, Landroidx/datastore/preferences/protobuf/k;->d:I

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    invoke-virtual {p2}, Landroidx/datastore/preferences/protobuf/j;->C()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eq v0, p3, :cond_0

    .line 50
    .line 51
    iput v0, p4, Landroidx/datastore/preferences/protobuf/k;->d:I

    .line 52
    .line 53
    :cond_2
    :goto_0
    return-void

    .line 54
    :cond_3
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->c()Lcom/google/crypto/tink/shaded/protobuf/B;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    throw p1
.end method

.method public final I(Ljava/lang/Object;ILandroidx/datastore/preferences/protobuf/k;Lcom/google/crypto/tink/shaded/protobuf/Y;Lcom/google/crypto/tink/shaded/protobuf/o;)V
    .locals 3

    .line 1
    const v0, 0xfffff

    .line 2
    .line 3
    .line 4
    and-int/2addr p2, v0

    .line 5
    int-to-long v0, p2

    .line 6
    iget-object p2, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->k:Lcom/google/crypto/tink/shaded/protobuf/E;

    .line 7
    .line 8
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    invoke-static {v0, v1, p1}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p2, p3, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p2, Landroidx/datastore/preferences/protobuf/j;

    .line 18
    .line 19
    iget v0, p3, Landroidx/datastore/preferences/protobuf/k;->b:I

    .line 20
    .line 21
    and-int/lit8 v1, v0, 0x7

    .line 22
    .line 23
    const/4 v2, 0x2

    .line 24
    if-ne v1, v2, :cond_3

    .line 25
    .line 26
    :cond_0
    invoke-interface {p4}, Lcom/google/crypto/tink/shaded/protobuf/Y;->d()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p3, v1, p4, p5}, Landroidx/datastore/preferences/protobuf/k;->e(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Y;Lcom/google/crypto/tink/shaded/protobuf/o;)V

    .line 31
    .line 32
    .line 33
    invoke-interface {p4, v1}, Lcom/google/crypto/tink/shaded/protobuf/Y;->b(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    invoke-virtual {p2}, Landroidx/datastore/preferences/protobuf/j;->g()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_2

    .line 44
    .line 45
    iget v1, p3, Landroidx/datastore/preferences/protobuf/k;->d:I

    .line 46
    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    invoke-virtual {p2}, Landroidx/datastore/preferences/protobuf/j;->C()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eq v1, v0, :cond_0

    .line 55
    .line 56
    iput v1, p3, Landroidx/datastore/preferences/protobuf/k;->d:I

    .line 57
    .line 58
    :cond_2
    :goto_0
    return-void

    .line 59
    :cond_3
    invoke-static {}, Lcom/google/crypto/tink/shaded/protobuf/C;->c()Lcom/google/crypto/tink/shaded/protobuf/B;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    throw p1
.end method

.method public final J(ILandroidx/datastore/preferences/protobuf/k;Ljava/lang/Object;)V
    .locals 5

    .line 1
    iget-object v0, p2, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroidx/datastore/preferences/protobuf/j;

    .line 4
    .line 5
    const/high16 v1, 0x20000000

    .line 6
    .line 7
    and-int/2addr v1, p1

    .line 8
    const/4 v2, 0x2

    .line 9
    const v3, 0xfffff

    .line 10
    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    and-int/2addr p1, v3

    .line 15
    int-to-long v3, p1

    .line 16
    invoke-virtual {p2, v2}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Landroidx/datastore/preferences/protobuf/j;->B()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {v3, v4, p3, p1}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-boolean v1, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->f:Z

    .line 28
    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    and-int/2addr p1, v3

    .line 32
    int-to-long v3, p1

    .line 33
    invoke-virtual {p2, v2}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Landroidx/datastore/preferences/protobuf/j;->A()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-static {v3, v4, p3, p1}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    and-int/2addr p1, v3

    .line 45
    int-to-long v0, p1

    .line 46
    invoke-virtual {p2}, Landroidx/datastore/preferences/protobuf/k;->i()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-static {v0, v1, p3, p1}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final K(ILandroidx/datastore/preferences/protobuf/k;Ljava/lang/Object;)V
    .locals 3

    .line 1
    const/high16 v0, 0x20000000

    .line 2
    .line 3
    and-int/2addr v0, p1

    .line 4
    const v1, 0xfffff

    .line 5
    .line 6
    .line 7
    iget-object v2, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->k:Lcom/google/crypto/tink/shaded/protobuf/E;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    and-int/2addr p1, v1

    .line 12
    int-to-long v0, p1

    .line 13
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1, p3}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const/4 p3, 0x1

    .line 21
    invoke-virtual {p2, p1, p3}, Landroidx/datastore/preferences/protobuf/k;->J(Lcom/google/crypto/tink/shaded/protobuf/z;Z)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    and-int/2addr p1, v1

    .line 26
    int-to-long v0, p1

    .line 27
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1, p3}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const/4 p3, 0x0

    .line 35
    invoke-virtual {p2, p1, p3}, Landroidx/datastore/preferences/protobuf/k;->J(Lcom/google/crypto/tink/shaded/protobuf/z;Z)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final M(ILjava/lang/Object;)V
    .locals 4

    .line 1
    add-int/lit8 p1, p1, 0x2

    .line 2
    .line 3
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->a:[I

    .line 4
    .line 5
    aget p1, v0, p1

    .line 6
    .line 7
    const v0, 0xfffff

    .line 8
    .line 9
    .line 10
    and-int/2addr v0, p1

    .line 11
    int-to-long v0, v0

    .line 12
    const-wide/32 v2, 0xfffff

    .line 13
    .line 14
    .line 15
    cmp-long v2, v0, v2

    .line 16
    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    ushr-int/lit8 p1, p1, 0x14

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    shl-int p1, v2, p1

    .line 24
    .line 25
    sget-object v2, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 26
    .line 27
    invoke-virtual {v2, v0, v1, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    or-int/2addr p1, v2

    .line 32
    invoke-static {p1, v0, v1, p2}, Lcom/google/crypto/tink/shaded/protobuf/h0;->n(IJLjava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final N(Ljava/lang/Object;II)V
    .locals 2

    .line 1
    add-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->a:[I

    .line 4
    .line 5
    aget p3, v0, p3

    .line 6
    .line 7
    const v0, 0xfffff

    .line 8
    .line 9
    .line 10
    and-int/2addr p3, v0

    .line 11
    int-to-long v0, p3

    .line 12
    invoke-static {p2, v0, v1, p1}, Lcom/google/crypto/tink/shaded/protobuf/h0;->n(IJLjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final O(II)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->a:[I

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    div-int/lit8 v1, v1, 0x3

    .line 5
    .line 6
    add-int/lit8 v1, v1, -0x1

    .line 7
    .line 8
    :goto_0
    if-gt p2, v1, :cond_2

    .line 9
    .line 10
    add-int v2, v1, p2

    .line 11
    .line 12
    ushr-int/lit8 v2, v2, 0x1

    .line 13
    .line 14
    mul-int/lit8 v3, v2, 0x3

    .line 15
    .line 16
    aget v4, v0, v3

    .line 17
    .line 18
    if-ne p1, v4, :cond_0

    .line 19
    .line 20
    return v3

    .line 21
    :cond_0
    if-ge p1, v4, :cond_1

    .line 22
    .line 23
    add-int/lit8 v2, v2, -0x1

    .line 24
    .line 25
    move v1, v2

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 28
    .line 29
    move p2, v2

    .line 30
    goto :goto_0

    .line 31
    :cond_2
    const/4 p1, -0x1

    .line 32
    return p1
.end method

.method public final P(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/google/crypto/tink/shaded/protobuf/P;->o:Lsun/misc/Unsafe;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->S(I)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const v2, 0xfffff

    .line 8
    .line 9
    .line 10
    and-int/2addr v1, v2

    .line 11
    int-to-long v1, v1

    .line 12
    invoke-virtual {v0, p2, v1, v2, p3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final Q(IILjava/lang/Object;Ljava/lang/Object;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/google/crypto/tink/shaded/protobuf/P;->o:Lsun/misc/Unsafe;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->S(I)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const v2, 0xfffff

    .line 8
    .line 9
    .line 10
    and-int/2addr v1, v2

    .line 11
    int-to-long v1, v1

    .line 12
    invoke-virtual {v0, p3, v1, v2, p4}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p3, p1, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->N(Ljava/lang/Object;II)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final S(I)I
    .locals 1

    .line 1
    add-int/lit8 p1, p1, 0x1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->a:[I

    .line 4
    .line 5
    aget p1, v0, p1

    .line 6
    .line 7
    return p1
.end method

.method public final T(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/I;)V
    .locals 24

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    move-object/from16 v7, p2

    .line 6
    .line 7
    iget-object v8, v1, Lcom/google/crypto/tink/shaded/protobuf/P;->a:[I

    .line 8
    .line 9
    array-length v9, v8

    .line 10
    sget-object v10, Lcom/google/crypto/tink/shaded/protobuf/P;->o:Lsun/misc/Unsafe;

    .line 11
    .line 12
    const v11, 0xfffff

    .line 13
    .line 14
    .line 15
    move v0, v11

    .line 16
    const/4 v3, 0x0

    .line 17
    const/4 v4, 0x0

    .line 18
    :goto_0
    if-ge v3, v9, :cond_f

    .line 19
    .line 20
    invoke-virtual {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->S(I)I

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    aget v13, v8, v3

    .line 25
    .line 26
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/P;->R(I)I

    .line 27
    .line 28
    .line 29
    move-result v6

    .line 30
    const/16 v14, 0x11

    .line 31
    .line 32
    if-gt v6, v14, :cond_2

    .line 33
    .line 34
    add-int/lit8 v14, v3, 0x2

    .line 35
    .line 36
    aget v14, v8, v14

    .line 37
    .line 38
    const/16 v16, 0x1

    .line 39
    .line 40
    and-int v15, v14, v11

    .line 41
    .line 42
    if-eq v15, v0, :cond_1

    .line 43
    .line 44
    if-ne v15, v11, :cond_0

    .line 45
    .line 46
    move/from16 v17, v11

    .line 47
    .line 48
    const/4 v4, 0x0

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    move/from16 v17, v11

    .line 51
    .line 52
    int-to-long v11, v15

    .line 53
    invoke-virtual {v10, v2, v11, v12}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    move v4, v0

    .line 58
    :goto_1
    move v0, v15

    .line 59
    goto :goto_2

    .line 60
    :cond_1
    move/from16 v17, v11

    .line 61
    .line 62
    :goto_2
    ushr-int/lit8 v11, v14, 0x14

    .line 63
    .line 64
    shl-int v11, v16, v11

    .line 65
    .line 66
    move/from16 v23, v4

    .line 67
    .line 68
    move v4, v0

    .line 69
    move v0, v5

    .line 70
    move/from16 v5, v23

    .line 71
    .line 72
    move/from16 v23, v11

    .line 73
    .line 74
    move v11, v6

    .line 75
    move/from16 v6, v23

    .line 76
    .line 77
    goto :goto_3

    .line 78
    :cond_2
    move/from16 v17, v11

    .line 79
    .line 80
    const/16 v16, 0x1

    .line 81
    .line 82
    move v11, v4

    .line 83
    move v4, v0

    .line 84
    move v0, v5

    .line 85
    move v5, v11

    .line 86
    move v11, v6

    .line 87
    const/4 v6, 0x0

    .line 88
    :goto_3
    and-int v0, v0, v17

    .line 89
    .line 90
    int-to-long v14, v0

    .line 91
    const/16 v0, 0x3f

    .line 92
    .line 93
    const-string v12, "Converting ill-formed UTF-16. Your Protocol Buffer will not round trip correctly!"

    .line 94
    .line 95
    move-object/from16 v18, v8

    .line 96
    .line 97
    const/4 v8, 0x2

    .line 98
    packed-switch v11, :pswitch_data_0

    .line 99
    .line 100
    .line 101
    :cond_3
    :goto_4
    const/4 v8, 0x0

    .line 102
    goto/16 :goto_15

    .line 103
    .line 104
    :pswitch_0
    invoke-virtual {v1, v2, v13, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-eqz v0, :cond_3

    .line 109
    .line 110
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 115
    .line 116
    .line 117
    move-result-object v6

    .line 118
    invoke-virtual {v7, v13, v0, v6}, Lcom/google/crypto/tink/shaded/protobuf/I;->a(ILjava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Y;)V

    .line 119
    .line 120
    .line 121
    goto :goto_4

    .line 122
    :pswitch_1
    invoke-virtual {v1, v2, v13, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 123
    .line 124
    .line 125
    move-result v6

    .line 126
    if-eqz v6, :cond_3

    .line 127
    .line 128
    invoke-static {v14, v15, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->C(JLjava/lang/Object;)J

    .line 129
    .line 130
    .line 131
    move-result-wide v11

    .line 132
    iget-object v6, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 133
    .line 134
    check-cast v6, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 135
    .line 136
    shl-long v14, v11, v16

    .line 137
    .line 138
    shr-long/2addr v11, v0

    .line 139
    xor-long/2addr v11, v14

    .line 140
    invoke-virtual {v6, v11, v12, v13}, Lcom/google/crypto/tink/shaded/protobuf/l;->a0(JI)V

    .line 141
    .line 142
    .line 143
    goto :goto_4

    .line 144
    :pswitch_2
    invoke-virtual {v1, v2, v13, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    if-eqz v0, :cond_3

    .line 149
    .line 150
    invoke-static {v14, v15, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->B(JLjava/lang/Object;)I

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    iget-object v6, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 155
    .line 156
    check-cast v6, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 157
    .line 158
    shl-int/lit8 v8, v0, 0x1

    .line 159
    .line 160
    shr-int/lit8 v0, v0, 0x1f

    .line 161
    .line 162
    xor-int/2addr v0, v8

    .line 163
    invoke-virtual {v6, v13, v0}, Lcom/google/crypto/tink/shaded/protobuf/l;->Y(II)V

    .line 164
    .line 165
    .line 166
    goto :goto_4

    .line 167
    :pswitch_3
    invoke-virtual {v1, v2, v13, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    if-eqz v0, :cond_3

    .line 172
    .line 173
    invoke-static {v14, v15, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->C(JLjava/lang/Object;)J

    .line 174
    .line 175
    .line 176
    move-result-wide v11

    .line 177
    iget-object v0, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 178
    .line 179
    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 180
    .line 181
    invoke-virtual {v0, v11, v12, v13}, Lcom/google/crypto/tink/shaded/protobuf/l;->T(JI)V

    .line 182
    .line 183
    .line 184
    goto :goto_4

    .line 185
    :pswitch_4
    invoke-virtual {v1, v2, v13, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-eqz v0, :cond_3

    .line 190
    .line 191
    invoke-static {v14, v15, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->B(JLjava/lang/Object;)I

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    iget-object v6, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 196
    .line 197
    check-cast v6, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 198
    .line 199
    invoke-virtual {v6, v13, v0}, Lcom/google/crypto/tink/shaded/protobuf/l;->R(II)V

    .line 200
    .line 201
    .line 202
    goto :goto_4

    .line 203
    :pswitch_5
    invoke-virtual {v1, v2, v13, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    if-eqz v0, :cond_3

    .line 208
    .line 209
    invoke-static {v14, v15, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->B(JLjava/lang/Object;)I

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    iget-object v6, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 214
    .line 215
    check-cast v6, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 216
    .line 217
    invoke-virtual {v6, v13, v0}, Lcom/google/crypto/tink/shaded/protobuf/l;->V(II)V

    .line 218
    .line 219
    .line 220
    goto :goto_4

    .line 221
    :pswitch_6
    invoke-virtual {v1, v2, v13, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-eqz v0, :cond_3

    .line 226
    .line 227
    invoke-static {v14, v15, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->B(JLjava/lang/Object;)I

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    iget-object v6, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 232
    .line 233
    check-cast v6, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 234
    .line 235
    invoke-virtual {v6, v13, v0}, Lcom/google/crypto/tink/shaded/protobuf/l;->Y(II)V

    .line 236
    .line 237
    .line 238
    goto/16 :goto_4

    .line 239
    .line 240
    :pswitch_7
    invoke-virtual {v1, v2, v13, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 241
    .line 242
    .line 243
    move-result v0

    .line 244
    if-eqz v0, :cond_3

    .line 245
    .line 246
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 251
    .line 252
    iget-object v6, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 253
    .line 254
    check-cast v6, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 255
    .line 256
    invoke-virtual {v6, v13, v8}, Lcom/google/crypto/tink/shaded/protobuf/l;->X(II)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/i;->size()I

    .line 260
    .line 261
    .line 262
    move-result v8

    .line 263
    invoke-virtual {v6, v8}, Lcom/google/crypto/tink/shaded/protobuf/l;->Z(I)V

    .line 264
    .line 265
    .line 266
    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 267
    .line 268
    iget-object v8, v0, Lcom/google/crypto/tink/shaded/protobuf/h;->h:[B

    .line 269
    .line 270
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/h;->g()I

    .line 271
    .line 272
    .line 273
    move-result v11

    .line 274
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/h;->size()I

    .line 275
    .line 276
    .line 277
    move-result v0

    .line 278
    invoke-virtual {v6, v8, v11, v0}, Lcom/google/crypto/tink/shaded/protobuf/l;->Q([BII)V

    .line 279
    .line 280
    .line 281
    goto/16 :goto_4

    .line 282
    .line 283
    :pswitch_8
    invoke-virtual {v1, v2, v13, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 284
    .line 285
    .line 286
    move-result v0

    .line 287
    if-eqz v0, :cond_3

    .line 288
    .line 289
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 290
    .line 291
    .line 292
    move-result-object v0

    .line 293
    invoke-virtual {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 294
    .line 295
    .line 296
    move-result-object v6

    .line 297
    invoke-virtual {v7, v13, v0, v6}, Lcom/google/crypto/tink/shaded/protobuf/I;->b(ILjava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Y;)V

    .line 298
    .line 299
    .line 300
    goto/16 :goto_4

    .line 301
    .line 302
    :pswitch_9
    invoke-virtual {v1, v2, v13, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 303
    .line 304
    .line 305
    move-result v0

    .line 306
    if-eqz v0, :cond_3

    .line 307
    .line 308
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    instance-of v6, v0, Ljava/lang/String;

    .line 313
    .line 314
    if-eqz v6, :cond_5

    .line 315
    .line 316
    move-object v6, v0

    .line 317
    check-cast v6, Ljava/lang/String;

    .line 318
    .line 319
    iget-object v0, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 320
    .line 321
    move-object v11, v0

    .line 322
    check-cast v11, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 323
    .line 324
    invoke-virtual {v11, v13, v8}, Lcom/google/crypto/tink/shaded/protobuf/l;->X(II)V

    .line 325
    .line 326
    .line 327
    iget v0, v11, Lcom/google/crypto/tink/shaded/protobuf/l;->d:I

    .line 328
    .line 329
    iget-object v8, v11, Lcom/google/crypto/tink/shaded/protobuf/l;->c:[B

    .line 330
    .line 331
    iget v13, v11, Lcom/google/crypto/tink/shaded/protobuf/l;->e:I

    .line 332
    .line 333
    :try_start_0
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 334
    .line 335
    .line 336
    move-result v14

    .line 337
    mul-int/lit8 v14, v14, 0x3

    .line 338
    .line 339
    invoke-static {v14}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 340
    .line 341
    .line 342
    move-result v14

    .line 343
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 344
    .line 345
    .line 346
    move-result v15

    .line 347
    invoke-static {v15}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 348
    .line 349
    .line 350
    move-result v15

    .line 351
    if-ne v15, v14, :cond_4

    .line 352
    .line 353
    add-int v14, v13, v15

    .line 354
    .line 355
    iput v14, v11, Lcom/google/crypto/tink/shaded/protobuf/l;->e:I
    :try_end_0
    .catch Lcom/google/crypto/tink/shaded/protobuf/j0; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 356
    .line 357
    sub-int/2addr v0, v14

    .line 358
    move/from16 v19, v4

    .line 359
    .line 360
    :try_start_1
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/k0;->a:Lcom/google/crypto/tink/shaded/protobuf/i0;

    .line 361
    .line 362
    invoke-virtual {v4, v6, v8, v14, v0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->o(Ljava/lang/String;[BII)I

    .line 363
    .line 364
    .line 365
    move-result v0

    .line 366
    iput v13, v11, Lcom/google/crypto/tink/shaded/protobuf/l;->e:I

    .line 367
    .line 368
    sub-int v4, v0, v13

    .line 369
    .line 370
    sub-int/2addr v4, v15

    .line 371
    invoke-virtual {v11, v4}, Lcom/google/crypto/tink/shaded/protobuf/l;->Z(I)V

    .line 372
    .line 373
    .line 374
    iput v0, v11, Lcom/google/crypto/tink/shaded/protobuf/l;->e:I

    .line 375
    .line 376
    goto :goto_7

    .line 377
    :catch_0
    move-exception v0

    .line 378
    goto :goto_5

    .line 379
    :catch_1
    move-exception v0

    .line 380
    goto :goto_6

    .line 381
    :catch_2
    move-exception v0

    .line 382
    move/from16 v19, v4

    .line 383
    .line 384
    goto :goto_6

    .line 385
    :cond_4
    move/from16 v19, v4

    .line 386
    .line 387
    invoke-static {v6}, Lcom/google/crypto/tink/shaded/protobuf/k0;->b(Ljava/lang/String;)I

    .line 388
    .line 389
    .line 390
    move-result v4

    .line 391
    invoke-virtual {v11, v4}, Lcom/google/crypto/tink/shaded/protobuf/l;->Z(I)V

    .line 392
    .line 393
    .line 394
    iget v4, v11, Lcom/google/crypto/tink/shaded/protobuf/l;->e:I

    .line 395
    .line 396
    sub-int/2addr v0, v4

    .line 397
    sget-object v14, Lcom/google/crypto/tink/shaded/protobuf/k0;->a:Lcom/google/crypto/tink/shaded/protobuf/i0;

    .line 398
    .line 399
    invoke-virtual {v14, v6, v8, v4, v0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->o(Ljava/lang/String;[BII)I

    .line 400
    .line 401
    .line 402
    move-result v0

    .line 403
    iput v0, v11, Lcom/google/crypto/tink/shaded/protobuf/l;->e:I
    :try_end_1
    .catch Lcom/google/crypto/tink/shaded/protobuf/j0; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_0

    .line 404
    .line 405
    goto :goto_7

    .line 406
    :goto_5
    new-instance v2, Landroidx/datastore/preferences/protobuf/l;

    .line 407
    .line 408
    invoke-direct {v2, v0}, Landroidx/datastore/preferences/protobuf/l;-><init>(Ljava/lang/IndexOutOfBoundsException;)V

    .line 409
    .line 410
    .line 411
    throw v2

    .line 412
    :goto_6
    iput v13, v11, Lcom/google/crypto/tink/shaded/protobuf/l;->e:I

    .line 413
    .line 414
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/l;->f:Ljava/util/logging/Logger;

    .line 415
    .line 416
    sget-object v8, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 417
    .line 418
    invoke-virtual {v4, v8, v12, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 419
    .line 420
    .line 421
    sget-object v0, Lcom/google/crypto/tink/shaded/protobuf/A;->a:Ljava/nio/charset/Charset;

    .line 422
    .line 423
    invoke-virtual {v6, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 424
    .line 425
    .line 426
    move-result-object v0

    .line 427
    :try_start_2
    array-length v4, v0

    .line 428
    invoke-virtual {v11, v4}, Lcom/google/crypto/tink/shaded/protobuf/l;->Z(I)V

    .line 429
    .line 430
    .line 431
    array-length v4, v0

    .line 432
    const/4 v6, 0x0

    .line 433
    invoke-virtual {v11, v0, v6, v4}, Lcom/google/crypto/tink/shaded/protobuf/l;->Q([BII)V
    :try_end_2
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_2 .. :try_end_2} :catch_3

    .line 434
    .line 435
    .line 436
    goto :goto_7

    .line 437
    :catch_3
    move-exception v0

    .line 438
    new-instance v2, Landroidx/datastore/preferences/protobuf/l;

    .line 439
    .line 440
    invoke-direct {v2, v0}, Landroidx/datastore/preferences/protobuf/l;-><init>(Ljava/lang/IndexOutOfBoundsException;)V

    .line 441
    .line 442
    .line 443
    throw v2

    .line 444
    :cond_5
    move/from16 v19, v4

    .line 445
    .line 446
    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 447
    .line 448
    iget-object v4, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 449
    .line 450
    check-cast v4, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 451
    .line 452
    invoke-virtual {v4, v13, v8}, Lcom/google/crypto/tink/shaded/protobuf/l;->X(II)V

    .line 453
    .line 454
    .line 455
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/i;->size()I

    .line 456
    .line 457
    .line 458
    move-result v6

    .line 459
    invoke-virtual {v4, v6}, Lcom/google/crypto/tink/shaded/protobuf/l;->Z(I)V

    .line 460
    .line 461
    .line 462
    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 463
    .line 464
    iget-object v6, v0, Lcom/google/crypto/tink/shaded/protobuf/h;->h:[B

    .line 465
    .line 466
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/h;->g()I

    .line 467
    .line 468
    .line 469
    move-result v8

    .line 470
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/h;->size()I

    .line 471
    .line 472
    .line 473
    move-result v0

    .line 474
    invoke-virtual {v4, v6, v8, v0}, Lcom/google/crypto/tink/shaded/protobuf/l;->Q([BII)V

    .line 475
    .line 476
    .line 477
    :cond_6
    :goto_7
    move/from16 v4, v19

    .line 478
    .line 479
    goto/16 :goto_4

    .line 480
    .line 481
    :pswitch_a
    move/from16 v19, v4

    .line 482
    .line 483
    invoke-virtual {v1, v2, v13, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 484
    .line 485
    .line 486
    move-result v0

    .line 487
    if-eqz v0, :cond_6

    .line 488
    .line 489
    sget-object v0, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 490
    .line 491
    invoke-virtual {v0, v14, v15, v2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 492
    .line 493
    .line 494
    move-result-object v0

    .line 495
    check-cast v0, Ljava/lang/Boolean;

    .line 496
    .line 497
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 498
    .line 499
    .line 500
    move-result v0

    .line 501
    iget-object v4, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 502
    .line 503
    check-cast v4, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 504
    .line 505
    const/4 v6, 0x0

    .line 506
    invoke-virtual {v4, v13, v6}, Lcom/google/crypto/tink/shaded/protobuf/l;->X(II)V

    .line 507
    .line 508
    .line 509
    int-to-byte v0, v0

    .line 510
    invoke-virtual {v4, v0}, Lcom/google/crypto/tink/shaded/protobuf/l;->P(B)V

    .line 511
    .line 512
    .line 513
    goto :goto_7

    .line 514
    :pswitch_b
    move/from16 v19, v4

    .line 515
    .line 516
    invoke-virtual {v1, v2, v13, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 517
    .line 518
    .line 519
    move-result v0

    .line 520
    if-eqz v0, :cond_6

    .line 521
    .line 522
    invoke-static {v14, v15, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->B(JLjava/lang/Object;)I

    .line 523
    .line 524
    .line 525
    move-result v0

    .line 526
    iget-object v4, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 527
    .line 528
    check-cast v4, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 529
    .line 530
    invoke-virtual {v4, v13, v0}, Lcom/google/crypto/tink/shaded/protobuf/l;->R(II)V

    .line 531
    .line 532
    .line 533
    goto :goto_7

    .line 534
    :pswitch_c
    move/from16 v19, v4

    .line 535
    .line 536
    invoke-virtual {v1, v2, v13, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 537
    .line 538
    .line 539
    move-result v0

    .line 540
    if-eqz v0, :cond_6

    .line 541
    .line 542
    invoke-static {v14, v15, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->C(JLjava/lang/Object;)J

    .line 543
    .line 544
    .line 545
    move-result-wide v11

    .line 546
    iget-object v0, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 547
    .line 548
    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 549
    .line 550
    invoke-virtual {v0, v11, v12, v13}, Lcom/google/crypto/tink/shaded/protobuf/l;->T(JI)V

    .line 551
    .line 552
    .line 553
    goto :goto_7

    .line 554
    :pswitch_d
    move/from16 v19, v4

    .line 555
    .line 556
    invoke-virtual {v1, v2, v13, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 557
    .line 558
    .line 559
    move-result v0

    .line 560
    if-eqz v0, :cond_6

    .line 561
    .line 562
    invoke-static {v14, v15, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->B(JLjava/lang/Object;)I

    .line 563
    .line 564
    .line 565
    move-result v0

    .line 566
    iget-object v4, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 567
    .line 568
    check-cast v4, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 569
    .line 570
    invoke-virtual {v4, v13, v0}, Lcom/google/crypto/tink/shaded/protobuf/l;->V(II)V

    .line 571
    .line 572
    .line 573
    goto :goto_7

    .line 574
    :pswitch_e
    move/from16 v19, v4

    .line 575
    .line 576
    invoke-virtual {v1, v2, v13, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 577
    .line 578
    .line 579
    move-result v0

    .line 580
    if-eqz v0, :cond_6

    .line 581
    .line 582
    invoke-static {v14, v15, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->C(JLjava/lang/Object;)J

    .line 583
    .line 584
    .line 585
    move-result-wide v11

    .line 586
    iget-object v0, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 587
    .line 588
    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 589
    .line 590
    invoke-virtual {v0, v11, v12, v13}, Lcom/google/crypto/tink/shaded/protobuf/l;->a0(JI)V

    .line 591
    .line 592
    .line 593
    goto :goto_7

    .line 594
    :pswitch_f
    move/from16 v19, v4

    .line 595
    .line 596
    invoke-virtual {v1, v2, v13, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 597
    .line 598
    .line 599
    move-result v0

    .line 600
    if-eqz v0, :cond_6

    .line 601
    .line 602
    invoke-static {v14, v15, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->C(JLjava/lang/Object;)J

    .line 603
    .line 604
    .line 605
    move-result-wide v11

    .line 606
    iget-object v0, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 607
    .line 608
    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 609
    .line 610
    invoke-virtual {v0, v11, v12, v13}, Lcom/google/crypto/tink/shaded/protobuf/l;->a0(JI)V

    .line 611
    .line 612
    .line 613
    goto/16 :goto_7

    .line 614
    .line 615
    :pswitch_10
    move/from16 v19, v4

    .line 616
    .line 617
    invoke-virtual {v1, v2, v13, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 618
    .line 619
    .line 620
    move-result v0

    .line 621
    if-eqz v0, :cond_6

    .line 622
    .line 623
    sget-object v0, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 624
    .line 625
    invoke-virtual {v0, v14, v15, v2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 626
    .line 627
    .line 628
    move-result-object v0

    .line 629
    check-cast v0, Ljava/lang/Float;

    .line 630
    .line 631
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 632
    .line 633
    .line 634
    move-result v0

    .line 635
    iget-object v4, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 636
    .line 637
    check-cast v4, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 638
    .line 639
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 640
    .line 641
    .line 642
    invoke-static {v0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    .line 643
    .line 644
    .line 645
    move-result v0

    .line 646
    invoke-virtual {v4, v13, v0}, Lcom/google/crypto/tink/shaded/protobuf/l;->R(II)V

    .line 647
    .line 648
    .line 649
    goto/16 :goto_7

    .line 650
    .line 651
    :pswitch_11
    move/from16 v19, v4

    .line 652
    .line 653
    invoke-virtual {v1, v2, v13, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 654
    .line 655
    .line 656
    move-result v0

    .line 657
    if-eqz v0, :cond_6

    .line 658
    .line 659
    sget-object v0, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 660
    .line 661
    invoke-virtual {v0, v14, v15, v2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 662
    .line 663
    .line 664
    move-result-object v0

    .line 665
    check-cast v0, Ljava/lang/Double;

    .line 666
    .line 667
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 668
    .line 669
    .line 670
    move-result-wide v11

    .line 671
    iget-object v0, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 672
    .line 673
    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 674
    .line 675
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 676
    .line 677
    .line 678
    invoke-static {v11, v12}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    .line 679
    .line 680
    .line 681
    move-result-wide v11

    .line 682
    invoke-virtual {v0, v11, v12, v13}, Lcom/google/crypto/tink/shaded/protobuf/l;->T(JI)V

    .line 683
    .line 684
    .line 685
    goto/16 :goto_7

    .line 686
    .line 687
    :pswitch_12
    move/from16 v19, v4

    .line 688
    .line 689
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 690
    .line 691
    .line 692
    move-result-object v0

    .line 693
    if-nez v0, :cond_7

    .line 694
    .line 695
    goto/16 :goto_7

    .line 696
    .line 697
    :cond_7
    invoke-virtual {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->o(I)Ljava/lang/Object;

    .line 698
    .line 699
    .line 700
    move-result-object v0

    .line 701
    iget-object v2, v1, Lcom/google/crypto/tink/shaded/protobuf/P;->m:Lcom/google/crypto/tink/shaded/protobuf/K;

    .line 702
    .line 703
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 704
    .line 705
    .line 706
    invoke-static {v0}, LE1/j;->n(Ljava/lang/Object;)V

    .line 707
    .line 708
    .line 709
    const/4 v0, 0x0

    .line 710
    throw v0

    .line 711
    :pswitch_13
    move/from16 v19, v4

    .line 712
    .line 713
    aget v0, v18, v3

    .line 714
    .line 715
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 716
    .line 717
    .line 718
    move-result-object v4

    .line 719
    check-cast v4, Ljava/util/List;

    .line 720
    .line 721
    invoke-virtual {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 722
    .line 723
    .line 724
    move-result-object v6

    .line 725
    sget-object v8, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 726
    .line 727
    if-eqz v4, :cond_6

    .line 728
    .line 729
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    .line 730
    .line 731
    .line 732
    move-result v8

    .line 733
    if-nez v8, :cond_6

    .line 734
    .line 735
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 736
    .line 737
    .line 738
    const/4 v8, 0x0

    .line 739
    :goto_8
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 740
    .line 741
    .line 742
    move-result v11

    .line 743
    if-ge v8, v11, :cond_6

    .line 744
    .line 745
    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 746
    .line 747
    .line 748
    move-result-object v11

    .line 749
    invoke-virtual {v7, v0, v11, v6}, Lcom/google/crypto/tink/shaded/protobuf/I;->a(ILjava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Y;)V

    .line 750
    .line 751
    .line 752
    add-int/lit8 v8, v8, 0x1

    .line 753
    .line 754
    goto :goto_8

    .line 755
    :pswitch_14
    move/from16 v19, v4

    .line 756
    .line 757
    aget v0, v18, v3

    .line 758
    .line 759
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 760
    .line 761
    .line 762
    move-result-object v4

    .line 763
    check-cast v4, Ljava/util/List;

    .line 764
    .line 765
    move/from16 v6, v16

    .line 766
    .line 767
    invoke-static {v0, v4, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->x(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 768
    .line 769
    .line 770
    goto/16 :goto_7

    .line 771
    .line 772
    :pswitch_15
    move/from16 v19, v4

    .line 773
    .line 774
    move/from16 v6, v16

    .line 775
    .line 776
    aget v0, v18, v3

    .line 777
    .line 778
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 779
    .line 780
    .line 781
    move-result-object v4

    .line 782
    check-cast v4, Ljava/util/List;

    .line 783
    .line 784
    invoke-static {v0, v4, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->w(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 785
    .line 786
    .line 787
    goto/16 :goto_7

    .line 788
    .line 789
    :pswitch_16
    move/from16 v19, v4

    .line 790
    .line 791
    move/from16 v6, v16

    .line 792
    .line 793
    aget v0, v18, v3

    .line 794
    .line 795
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 796
    .line 797
    .line 798
    move-result-object v4

    .line 799
    check-cast v4, Ljava/util/List;

    .line 800
    .line 801
    invoke-static {v0, v4, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->v(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 802
    .line 803
    .line 804
    goto/16 :goto_7

    .line 805
    .line 806
    :pswitch_17
    move/from16 v19, v4

    .line 807
    .line 808
    move/from16 v6, v16

    .line 809
    .line 810
    aget v0, v18, v3

    .line 811
    .line 812
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 813
    .line 814
    .line 815
    move-result-object v4

    .line 816
    check-cast v4, Ljava/util/List;

    .line 817
    .line 818
    invoke-static {v0, v4, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->u(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 819
    .line 820
    .line 821
    goto/16 :goto_7

    .line 822
    .line 823
    :pswitch_18
    move/from16 v19, v4

    .line 824
    .line 825
    move/from16 v6, v16

    .line 826
    .line 827
    aget v0, v18, v3

    .line 828
    .line 829
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 830
    .line 831
    .line 832
    move-result-object v4

    .line 833
    check-cast v4, Ljava/util/List;

    .line 834
    .line 835
    invoke-static {v0, v4, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->o(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 836
    .line 837
    .line 838
    goto/16 :goto_7

    .line 839
    .line 840
    :pswitch_19
    move/from16 v19, v4

    .line 841
    .line 842
    move/from16 v6, v16

    .line 843
    .line 844
    aget v0, v18, v3

    .line 845
    .line 846
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 847
    .line 848
    .line 849
    move-result-object v4

    .line 850
    check-cast v4, Ljava/util/List;

    .line 851
    .line 852
    invoke-static {v0, v4, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->y(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 853
    .line 854
    .line 855
    goto/16 :goto_7

    .line 856
    .line 857
    :pswitch_1a
    move/from16 v19, v4

    .line 858
    .line 859
    move/from16 v6, v16

    .line 860
    .line 861
    aget v0, v18, v3

    .line 862
    .line 863
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 864
    .line 865
    .line 866
    move-result-object v4

    .line 867
    check-cast v4, Ljava/util/List;

    .line 868
    .line 869
    invoke-static {v0, v4, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->m(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 870
    .line 871
    .line 872
    goto/16 :goto_7

    .line 873
    .line 874
    :pswitch_1b
    move/from16 v19, v4

    .line 875
    .line 876
    move/from16 v6, v16

    .line 877
    .line 878
    aget v0, v18, v3

    .line 879
    .line 880
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 881
    .line 882
    .line 883
    move-result-object v4

    .line 884
    check-cast v4, Ljava/util/List;

    .line 885
    .line 886
    invoke-static {v0, v4, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->p(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 887
    .line 888
    .line 889
    goto/16 :goto_7

    .line 890
    .line 891
    :pswitch_1c
    move/from16 v19, v4

    .line 892
    .line 893
    move/from16 v6, v16

    .line 894
    .line 895
    aget v0, v18, v3

    .line 896
    .line 897
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 898
    .line 899
    .line 900
    move-result-object v4

    .line 901
    check-cast v4, Ljava/util/List;

    .line 902
    .line 903
    invoke-static {v0, v4, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->q(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 904
    .line 905
    .line 906
    goto/16 :goto_7

    .line 907
    .line 908
    :pswitch_1d
    move/from16 v19, v4

    .line 909
    .line 910
    move/from16 v6, v16

    .line 911
    .line 912
    aget v0, v18, v3

    .line 913
    .line 914
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 915
    .line 916
    .line 917
    move-result-object v4

    .line 918
    check-cast v4, Ljava/util/List;

    .line 919
    .line 920
    invoke-static {v0, v4, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->s(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 921
    .line 922
    .line 923
    goto/16 :goto_7

    .line 924
    .line 925
    :pswitch_1e
    move/from16 v19, v4

    .line 926
    .line 927
    move/from16 v6, v16

    .line 928
    .line 929
    aget v0, v18, v3

    .line 930
    .line 931
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 932
    .line 933
    .line 934
    move-result-object v4

    .line 935
    check-cast v4, Ljava/util/List;

    .line 936
    .line 937
    invoke-static {v0, v4, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->z(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 938
    .line 939
    .line 940
    goto/16 :goto_7

    .line 941
    .line 942
    :pswitch_1f
    move/from16 v19, v4

    .line 943
    .line 944
    move/from16 v6, v16

    .line 945
    .line 946
    aget v0, v18, v3

    .line 947
    .line 948
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 949
    .line 950
    .line 951
    move-result-object v4

    .line 952
    check-cast v4, Ljava/util/List;

    .line 953
    .line 954
    invoke-static {v0, v4, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->t(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 955
    .line 956
    .line 957
    goto/16 :goto_7

    .line 958
    .line 959
    :pswitch_20
    move/from16 v19, v4

    .line 960
    .line 961
    move/from16 v6, v16

    .line 962
    .line 963
    aget v0, v18, v3

    .line 964
    .line 965
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 966
    .line 967
    .line 968
    move-result-object v4

    .line 969
    check-cast v4, Ljava/util/List;

    .line 970
    .line 971
    invoke-static {v0, v4, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->r(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 972
    .line 973
    .line 974
    goto/16 :goto_7

    .line 975
    .line 976
    :pswitch_21
    move/from16 v19, v4

    .line 977
    .line 978
    move/from16 v6, v16

    .line 979
    .line 980
    aget v0, v18, v3

    .line 981
    .line 982
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 983
    .line 984
    .line 985
    move-result-object v4

    .line 986
    check-cast v4, Ljava/util/List;

    .line 987
    .line 988
    invoke-static {v0, v4, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->n(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 989
    .line 990
    .line 991
    goto/16 :goto_7

    .line 992
    .line 993
    :pswitch_22
    move/from16 v19, v4

    .line 994
    .line 995
    aget v0, v18, v3

    .line 996
    .line 997
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 998
    .line 999
    .line 1000
    move-result-object v4

    .line 1001
    check-cast v4, Ljava/util/List;

    .line 1002
    .line 1003
    const/4 v6, 0x0

    .line 1004
    invoke-static {v0, v4, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->x(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 1005
    .line 1006
    .line 1007
    :goto_9
    move v8, v6

    .line 1008
    move/from16 v4, v19

    .line 1009
    .line 1010
    goto/16 :goto_15

    .line 1011
    .line 1012
    :pswitch_23
    move/from16 v19, v4

    .line 1013
    .line 1014
    const/4 v6, 0x0

    .line 1015
    aget v0, v18, v3

    .line 1016
    .line 1017
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1018
    .line 1019
    .line 1020
    move-result-object v4

    .line 1021
    check-cast v4, Ljava/util/List;

    .line 1022
    .line 1023
    invoke-static {v0, v4, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->w(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 1024
    .line 1025
    .line 1026
    goto :goto_9

    .line 1027
    :pswitch_24
    move/from16 v19, v4

    .line 1028
    .line 1029
    const/4 v6, 0x0

    .line 1030
    aget v0, v18, v3

    .line 1031
    .line 1032
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1033
    .line 1034
    .line 1035
    move-result-object v4

    .line 1036
    check-cast v4, Ljava/util/List;

    .line 1037
    .line 1038
    invoke-static {v0, v4, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->v(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 1039
    .line 1040
    .line 1041
    goto :goto_9

    .line 1042
    :pswitch_25
    move/from16 v19, v4

    .line 1043
    .line 1044
    const/4 v6, 0x0

    .line 1045
    aget v0, v18, v3

    .line 1046
    .line 1047
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1048
    .line 1049
    .line 1050
    move-result-object v4

    .line 1051
    check-cast v4, Ljava/util/List;

    .line 1052
    .line 1053
    invoke-static {v0, v4, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->u(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 1054
    .line 1055
    .line 1056
    goto :goto_9

    .line 1057
    :pswitch_26
    move/from16 v19, v4

    .line 1058
    .line 1059
    const/4 v6, 0x0

    .line 1060
    aget v0, v18, v3

    .line 1061
    .line 1062
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1063
    .line 1064
    .line 1065
    move-result-object v4

    .line 1066
    check-cast v4, Ljava/util/List;

    .line 1067
    .line 1068
    invoke-static {v0, v4, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->o(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 1069
    .line 1070
    .line 1071
    goto :goto_9

    .line 1072
    :pswitch_27
    move/from16 v19, v4

    .line 1073
    .line 1074
    const/4 v6, 0x0

    .line 1075
    aget v0, v18, v3

    .line 1076
    .line 1077
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1078
    .line 1079
    .line 1080
    move-result-object v4

    .line 1081
    check-cast v4, Ljava/util/List;

    .line 1082
    .line 1083
    invoke-static {v0, v4, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->y(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 1084
    .line 1085
    .line 1086
    goto :goto_9

    .line 1087
    :pswitch_28
    move/from16 v19, v4

    .line 1088
    .line 1089
    aget v0, v18, v3

    .line 1090
    .line 1091
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1092
    .line 1093
    .line 1094
    move-result-object v4

    .line 1095
    check-cast v4, Ljava/util/List;

    .line 1096
    .line 1097
    sget-object v6, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 1098
    .line 1099
    if-eqz v4, :cond_6

    .line 1100
    .line 1101
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    .line 1102
    .line 1103
    .line 1104
    move-result v6

    .line 1105
    if-nez v6, :cond_6

    .line 1106
    .line 1107
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1108
    .line 1109
    .line 1110
    const/4 v6, 0x0

    .line 1111
    :goto_a
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 1112
    .line 1113
    .line 1114
    move-result v11

    .line 1115
    if-ge v6, v11, :cond_6

    .line 1116
    .line 1117
    iget-object v11, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 1118
    .line 1119
    check-cast v11, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 1120
    .line 1121
    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1122
    .line 1123
    .line 1124
    move-result-object v12

    .line 1125
    check-cast v12, Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 1126
    .line 1127
    invoke-virtual {v11, v0, v8}, Lcom/google/crypto/tink/shaded/protobuf/l;->X(II)V

    .line 1128
    .line 1129
    .line 1130
    invoke-virtual {v12}, Lcom/google/crypto/tink/shaded/protobuf/i;->size()I

    .line 1131
    .line 1132
    .line 1133
    move-result v13

    .line 1134
    invoke-virtual {v11, v13}, Lcom/google/crypto/tink/shaded/protobuf/l;->Z(I)V

    .line 1135
    .line 1136
    .line 1137
    check-cast v12, Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 1138
    .line 1139
    iget-object v13, v12, Lcom/google/crypto/tink/shaded/protobuf/h;->h:[B

    .line 1140
    .line 1141
    invoke-virtual {v12}, Lcom/google/crypto/tink/shaded/protobuf/h;->g()I

    .line 1142
    .line 1143
    .line 1144
    move-result v14

    .line 1145
    invoke-virtual {v12}, Lcom/google/crypto/tink/shaded/protobuf/h;->size()I

    .line 1146
    .line 1147
    .line 1148
    move-result v12

    .line 1149
    invoke-virtual {v11, v13, v14, v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->Q([BII)V

    .line 1150
    .line 1151
    .line 1152
    add-int/lit8 v6, v6, 0x1

    .line 1153
    .line 1154
    goto :goto_a

    .line 1155
    :pswitch_29
    move/from16 v19, v4

    .line 1156
    .line 1157
    aget v0, v18, v3

    .line 1158
    .line 1159
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1160
    .line 1161
    .line 1162
    move-result-object v4

    .line 1163
    check-cast v4, Ljava/util/List;

    .line 1164
    .line 1165
    invoke-virtual {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 1166
    .line 1167
    .line 1168
    move-result-object v6

    .line 1169
    sget-object v8, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 1170
    .line 1171
    if-eqz v4, :cond_6

    .line 1172
    .line 1173
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    .line 1174
    .line 1175
    .line 1176
    move-result v8

    .line 1177
    if-nez v8, :cond_6

    .line 1178
    .line 1179
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1180
    .line 1181
    .line 1182
    const/4 v8, 0x0

    .line 1183
    :goto_b
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 1184
    .line 1185
    .line 1186
    move-result v11

    .line 1187
    if-ge v8, v11, :cond_6

    .line 1188
    .line 1189
    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1190
    .line 1191
    .line 1192
    move-result-object v11

    .line 1193
    invoke-virtual {v7, v0, v11, v6}, Lcom/google/crypto/tink/shaded/protobuf/I;->b(ILjava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Y;)V

    .line 1194
    .line 1195
    .line 1196
    add-int/lit8 v8, v8, 0x1

    .line 1197
    .line 1198
    goto :goto_b

    .line 1199
    :pswitch_2a
    move/from16 v19, v4

    .line 1200
    .line 1201
    aget v4, v18, v3

    .line 1202
    .line 1203
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1204
    .line 1205
    .line 1206
    move-result-object v0

    .line 1207
    move-object v6, v0

    .line 1208
    check-cast v6, Ljava/util/List;

    .line 1209
    .line 1210
    sget-object v0, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 1211
    .line 1212
    if-eqz v6, :cond_9

    .line 1213
    .line 1214
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    .line 1215
    .line 1216
    .line 1217
    move-result v0

    .line 1218
    if-nez v0, :cond_9

    .line 1219
    .line 1220
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1221
    .line 1222
    .line 1223
    const/4 v11, 0x0

    .line 1224
    :goto_c
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 1225
    .line 1226
    .line 1227
    move-result v0

    .line 1228
    if-ge v11, v0, :cond_9

    .line 1229
    .line 1230
    iget-object v0, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 1231
    .line 1232
    move-object v13, v0

    .line 1233
    check-cast v13, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 1234
    .line 1235
    invoke-interface {v6, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1236
    .line 1237
    .line 1238
    move-result-object v0

    .line 1239
    move-object v14, v0

    .line 1240
    check-cast v14, Ljava/lang/String;

    .line 1241
    .line 1242
    invoke-virtual {v13, v4, v8}, Lcom/google/crypto/tink/shaded/protobuf/l;->X(II)V

    .line 1243
    .line 1244
    .line 1245
    iget v0, v13, Lcom/google/crypto/tink/shaded/protobuf/l;->d:I

    .line 1246
    .line 1247
    iget-object v15, v13, Lcom/google/crypto/tink/shaded/protobuf/l;->c:[B

    .line 1248
    .line 1249
    iget v8, v13, Lcom/google/crypto/tink/shaded/protobuf/l;->e:I

    .line 1250
    .line 1251
    :try_start_3
    invoke-virtual {v14}, Ljava/lang/String;->length()I

    .line 1252
    .line 1253
    .line 1254
    move-result v20

    .line 1255
    mul-int/lit8 v20, v20, 0x3

    .line 1256
    .line 1257
    move/from16 v21, v0

    .line 1258
    .line 1259
    invoke-static/range {v20 .. v20}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 1260
    .line 1261
    .line 1262
    move-result v0

    .line 1263
    invoke-virtual {v14}, Ljava/lang/String;->length()I

    .line 1264
    .line 1265
    .line 1266
    move-result v20

    .line 1267
    invoke-static/range {v20 .. v20}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 1268
    .line 1269
    .line 1270
    move-result v1

    .line 1271
    if-ne v1, v0, :cond_8

    .line 1272
    .line 1273
    add-int v0, v8, v1

    .line 1274
    .line 1275
    iput v0, v13, Lcom/google/crypto/tink/shaded/protobuf/l;->e:I
    :try_end_3
    .catch Lcom/google/crypto/tink/shaded/protobuf/j0; {:try_start_3 .. :try_end_3} :catch_6
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_3 .. :try_end_3} :catch_4

    .line 1276
    .line 1277
    move/from16 v20, v1

    .line 1278
    .line 1279
    sub-int v1, v21, v0

    .line 1280
    .line 1281
    move/from16 v22, v3

    .line 1282
    .line 1283
    :try_start_4
    sget-object v3, Lcom/google/crypto/tink/shaded/protobuf/k0;->a:Lcom/google/crypto/tink/shaded/protobuf/i0;

    .line 1284
    .line 1285
    invoke-virtual {v3, v14, v15, v0, v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->o(Ljava/lang/String;[BII)I

    .line 1286
    .line 1287
    .line 1288
    move-result v0

    .line 1289
    iput v8, v13, Lcom/google/crypto/tink/shaded/protobuf/l;->e:I

    .line 1290
    .line 1291
    sub-int v1, v0, v8

    .line 1292
    .line 1293
    sub-int v1, v1, v20

    .line 1294
    .line 1295
    invoke-virtual {v13, v1}, Lcom/google/crypto/tink/shaded/protobuf/l;->Z(I)V

    .line 1296
    .line 1297
    .line 1298
    iput v0, v13, Lcom/google/crypto/tink/shaded/protobuf/l;->e:I

    .line 1299
    .line 1300
    goto :goto_f

    .line 1301
    :catch_4
    move-exception v0

    .line 1302
    goto :goto_d

    .line 1303
    :catch_5
    move-exception v0

    .line 1304
    goto :goto_e

    .line 1305
    :catch_6
    move-exception v0

    .line 1306
    move/from16 v22, v3

    .line 1307
    .line 1308
    goto :goto_e

    .line 1309
    :cond_8
    move/from16 v22, v3

    .line 1310
    .line 1311
    invoke-static {v14}, Lcom/google/crypto/tink/shaded/protobuf/k0;->b(Ljava/lang/String;)I

    .line 1312
    .line 1313
    .line 1314
    move-result v0

    .line 1315
    invoke-virtual {v13, v0}, Lcom/google/crypto/tink/shaded/protobuf/l;->Z(I)V

    .line 1316
    .line 1317
    .line 1318
    iget v0, v13, Lcom/google/crypto/tink/shaded/protobuf/l;->e:I

    .line 1319
    .line 1320
    sub-int v1, v21, v0

    .line 1321
    .line 1322
    sget-object v3, Lcom/google/crypto/tink/shaded/protobuf/k0;->a:Lcom/google/crypto/tink/shaded/protobuf/i0;

    .line 1323
    .line 1324
    invoke-virtual {v3, v14, v15, v0, v1}, Lcom/google/crypto/tink/shaded/protobuf/i0;->o(Ljava/lang/String;[BII)I

    .line 1325
    .line 1326
    .line 1327
    move-result v0

    .line 1328
    iput v0, v13, Lcom/google/crypto/tink/shaded/protobuf/l;->e:I
    :try_end_4
    .catch Lcom/google/crypto/tink/shaded/protobuf/j0; {:try_start_4 .. :try_end_4} :catch_5
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_4 .. :try_end_4} :catch_4

    .line 1329
    .line 1330
    goto :goto_f

    .line 1331
    :goto_d
    new-instance v1, Landroidx/datastore/preferences/protobuf/l;

    .line 1332
    .line 1333
    invoke-direct {v1, v0}, Landroidx/datastore/preferences/protobuf/l;-><init>(Ljava/lang/IndexOutOfBoundsException;)V

    .line 1334
    .line 1335
    .line 1336
    throw v1

    .line 1337
    :goto_e
    iput v8, v13, Lcom/google/crypto/tink/shaded/protobuf/l;->e:I

    .line 1338
    .line 1339
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/l;->f:Ljava/util/logging/Logger;

    .line 1340
    .line 1341
    sget-object v3, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 1342
    .line 1343
    invoke-virtual {v1, v3, v12, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1344
    .line 1345
    .line 1346
    sget-object v0, Lcom/google/crypto/tink/shaded/protobuf/A;->a:Ljava/nio/charset/Charset;

    .line 1347
    .line 1348
    invoke-virtual {v14, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 1349
    .line 1350
    .line 1351
    move-result-object v0

    .line 1352
    :try_start_5
    array-length v1, v0

    .line 1353
    invoke-virtual {v13, v1}, Lcom/google/crypto/tink/shaded/protobuf/l;->Z(I)V

    .line 1354
    .line 1355
    .line 1356
    array-length v1, v0

    .line 1357
    const/4 v3, 0x0

    .line 1358
    invoke-virtual {v13, v0, v3, v1}, Lcom/google/crypto/tink/shaded/protobuf/l;->Q([BII)V
    :try_end_5
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_5 .. :try_end_5} :catch_7

    .line 1359
    .line 1360
    .line 1361
    :goto_f
    add-int/lit8 v11, v11, 0x1

    .line 1362
    .line 1363
    const/4 v8, 0x2

    .line 1364
    move-object/from16 v1, p0

    .line 1365
    .line 1366
    move/from16 v3, v22

    .line 1367
    .line 1368
    goto/16 :goto_c

    .line 1369
    .line 1370
    :catch_7
    move-exception v0

    .line 1371
    new-instance v1, Landroidx/datastore/preferences/protobuf/l;

    .line 1372
    .line 1373
    invoke-direct {v1, v0}, Landroidx/datastore/preferences/protobuf/l;-><init>(Ljava/lang/IndexOutOfBoundsException;)V

    .line 1374
    .line 1375
    .line 1376
    throw v1

    .line 1377
    :cond_9
    move/from16 v22, v3

    .line 1378
    .line 1379
    const/4 v8, 0x0

    .line 1380
    move-object/from16 v1, p0

    .line 1381
    .line 1382
    move/from16 v4, v19

    .line 1383
    .line 1384
    move/from16 v3, v22

    .line 1385
    .line 1386
    goto/16 :goto_15

    .line 1387
    .line 1388
    :pswitch_2b
    move/from16 v22, v3

    .line 1389
    .line 1390
    move/from16 v19, v4

    .line 1391
    .line 1392
    aget v0, v18, v22

    .line 1393
    .line 1394
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1395
    .line 1396
    .line 1397
    move-result-object v1

    .line 1398
    check-cast v1, Ljava/util/List;

    .line 1399
    .line 1400
    const/4 v6, 0x0

    .line 1401
    invoke-static {v0, v1, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->m(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 1402
    .line 1403
    .line 1404
    :goto_10
    move-object/from16 v1, p0

    .line 1405
    .line 1406
    move v8, v6

    .line 1407
    goto/16 :goto_15

    .line 1408
    .line 1409
    :pswitch_2c
    move/from16 v22, v3

    .line 1410
    .line 1411
    move/from16 v19, v4

    .line 1412
    .line 1413
    const/4 v6, 0x0

    .line 1414
    aget v0, v18, v22

    .line 1415
    .line 1416
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1417
    .line 1418
    .line 1419
    move-result-object v1

    .line 1420
    check-cast v1, Ljava/util/List;

    .line 1421
    .line 1422
    invoke-static {v0, v1, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->p(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 1423
    .line 1424
    .line 1425
    goto :goto_10

    .line 1426
    :pswitch_2d
    move/from16 v22, v3

    .line 1427
    .line 1428
    move/from16 v19, v4

    .line 1429
    .line 1430
    const/4 v6, 0x0

    .line 1431
    aget v0, v18, v22

    .line 1432
    .line 1433
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1434
    .line 1435
    .line 1436
    move-result-object v1

    .line 1437
    check-cast v1, Ljava/util/List;

    .line 1438
    .line 1439
    invoke-static {v0, v1, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->q(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 1440
    .line 1441
    .line 1442
    goto :goto_10

    .line 1443
    :pswitch_2e
    move/from16 v22, v3

    .line 1444
    .line 1445
    move/from16 v19, v4

    .line 1446
    .line 1447
    const/4 v6, 0x0

    .line 1448
    aget v0, v18, v22

    .line 1449
    .line 1450
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1451
    .line 1452
    .line 1453
    move-result-object v1

    .line 1454
    check-cast v1, Ljava/util/List;

    .line 1455
    .line 1456
    invoke-static {v0, v1, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->s(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 1457
    .line 1458
    .line 1459
    goto :goto_10

    .line 1460
    :pswitch_2f
    move/from16 v22, v3

    .line 1461
    .line 1462
    move/from16 v19, v4

    .line 1463
    .line 1464
    const/4 v6, 0x0

    .line 1465
    aget v0, v18, v22

    .line 1466
    .line 1467
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1468
    .line 1469
    .line 1470
    move-result-object v1

    .line 1471
    check-cast v1, Ljava/util/List;

    .line 1472
    .line 1473
    invoke-static {v0, v1, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->z(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 1474
    .line 1475
    .line 1476
    goto :goto_10

    .line 1477
    :pswitch_30
    move/from16 v22, v3

    .line 1478
    .line 1479
    move/from16 v19, v4

    .line 1480
    .line 1481
    const/4 v6, 0x0

    .line 1482
    aget v0, v18, v22

    .line 1483
    .line 1484
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1485
    .line 1486
    .line 1487
    move-result-object v1

    .line 1488
    check-cast v1, Ljava/util/List;

    .line 1489
    .line 1490
    invoke-static {v0, v1, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->t(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 1491
    .line 1492
    .line 1493
    goto :goto_10

    .line 1494
    :pswitch_31
    move/from16 v22, v3

    .line 1495
    .line 1496
    move/from16 v19, v4

    .line 1497
    .line 1498
    const/4 v6, 0x0

    .line 1499
    aget v0, v18, v22

    .line 1500
    .line 1501
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1502
    .line 1503
    .line 1504
    move-result-object v1

    .line 1505
    check-cast v1, Ljava/util/List;

    .line 1506
    .line 1507
    invoke-static {v0, v1, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->r(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 1508
    .line 1509
    .line 1510
    goto :goto_10

    .line 1511
    :pswitch_32
    move/from16 v22, v3

    .line 1512
    .line 1513
    move/from16 v19, v4

    .line 1514
    .line 1515
    const/4 v6, 0x0

    .line 1516
    aget v0, v18, v22

    .line 1517
    .line 1518
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1519
    .line 1520
    .line 1521
    move-result-object v1

    .line 1522
    check-cast v1, Ljava/util/List;

    .line 1523
    .line 1524
    invoke-static {v0, v1, v7, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->n(ILjava/util/List;Lcom/google/crypto/tink/shaded/protobuf/I;Z)V

    .line 1525
    .line 1526
    .line 1527
    goto :goto_10

    .line 1528
    :pswitch_33
    invoke-virtual/range {v1 .. v6}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1529
    .line 1530
    .line 1531
    move-result v0

    .line 1532
    if-eqz v0, :cond_3

    .line 1533
    .line 1534
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1535
    .line 1536
    .line 1537
    move-result-object v0

    .line 1538
    invoke-virtual {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 1539
    .line 1540
    .line 1541
    move-result-object v6

    .line 1542
    invoke-virtual {v7, v13, v0, v6}, Lcom/google/crypto/tink/shaded/protobuf/I;->a(ILjava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Y;)V

    .line 1543
    .line 1544
    .line 1545
    goto/16 :goto_4

    .line 1546
    .line 1547
    :pswitch_34
    invoke-virtual/range {v1 .. v6}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1548
    .line 1549
    .line 1550
    move-result v6

    .line 1551
    if-eqz v6, :cond_a

    .line 1552
    .line 1553
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1554
    .line 1555
    .line 1556
    move-result-wide v11

    .line 1557
    iget-object v1, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 1558
    .line 1559
    check-cast v1, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 1560
    .line 1561
    const/16 v16, 0x1

    .line 1562
    .line 1563
    shl-long v14, v11, v16

    .line 1564
    .line 1565
    shr-long/2addr v11, v0

    .line 1566
    xor-long/2addr v11, v14

    .line 1567
    invoke-virtual {v1, v11, v12, v13}, Lcom/google/crypto/tink/shaded/protobuf/l;->a0(JI)V

    .line 1568
    .line 1569
    .line 1570
    :cond_a
    :goto_11
    const/4 v8, 0x0

    .line 1571
    :cond_b
    :goto_12
    move-object/from16 v1, p0

    .line 1572
    .line 1573
    goto/16 :goto_15

    .line 1574
    .line 1575
    :pswitch_35
    invoke-virtual/range {v1 .. v6}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1576
    .line 1577
    .line 1578
    move-result v0

    .line 1579
    if-eqz v0, :cond_a

    .line 1580
    .line 1581
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1582
    .line 1583
    .line 1584
    move-result v0

    .line 1585
    iget-object v1, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 1586
    .line 1587
    check-cast v1, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 1588
    .line 1589
    shl-int/lit8 v6, v0, 0x1

    .line 1590
    .line 1591
    shr-int/lit8 v0, v0, 0x1f

    .line 1592
    .line 1593
    xor-int/2addr v0, v6

    .line 1594
    invoke-virtual {v1, v13, v0}, Lcom/google/crypto/tink/shaded/protobuf/l;->Y(II)V

    .line 1595
    .line 1596
    .line 1597
    goto :goto_11

    .line 1598
    :pswitch_36
    invoke-virtual/range {v1 .. v6}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1599
    .line 1600
    .line 1601
    move-result v0

    .line 1602
    if-eqz v0, :cond_a

    .line 1603
    .line 1604
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1605
    .line 1606
    .line 1607
    move-result-wide v0

    .line 1608
    iget-object v6, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 1609
    .line 1610
    check-cast v6, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 1611
    .line 1612
    invoke-virtual {v6, v0, v1, v13}, Lcom/google/crypto/tink/shaded/protobuf/l;->T(JI)V

    .line 1613
    .line 1614
    .line 1615
    goto :goto_11

    .line 1616
    :pswitch_37
    invoke-virtual/range {v1 .. v6}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1617
    .line 1618
    .line 1619
    move-result v0

    .line 1620
    if-eqz v0, :cond_a

    .line 1621
    .line 1622
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1623
    .line 1624
    .line 1625
    move-result v0

    .line 1626
    iget-object v1, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 1627
    .line 1628
    check-cast v1, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 1629
    .line 1630
    invoke-virtual {v1, v13, v0}, Lcom/google/crypto/tink/shaded/protobuf/l;->R(II)V

    .line 1631
    .line 1632
    .line 1633
    goto :goto_11

    .line 1634
    :pswitch_38
    invoke-virtual/range {v1 .. v6}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1635
    .line 1636
    .line 1637
    move-result v0

    .line 1638
    if-eqz v0, :cond_a

    .line 1639
    .line 1640
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1641
    .line 1642
    .line 1643
    move-result v0

    .line 1644
    iget-object v1, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 1645
    .line 1646
    check-cast v1, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 1647
    .line 1648
    invoke-virtual {v1, v13, v0}, Lcom/google/crypto/tink/shaded/protobuf/l;->V(II)V

    .line 1649
    .line 1650
    .line 1651
    goto :goto_11

    .line 1652
    :pswitch_39
    invoke-virtual/range {v1 .. v6}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1653
    .line 1654
    .line 1655
    move-result v0

    .line 1656
    if-eqz v0, :cond_a

    .line 1657
    .line 1658
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1659
    .line 1660
    .line 1661
    move-result v0

    .line 1662
    iget-object v1, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 1663
    .line 1664
    check-cast v1, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 1665
    .line 1666
    invoke-virtual {v1, v13, v0}, Lcom/google/crypto/tink/shaded/protobuf/l;->Y(II)V

    .line 1667
    .line 1668
    .line 1669
    goto :goto_11

    .line 1670
    :pswitch_3a
    invoke-virtual/range {v1 .. v6}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1671
    .line 1672
    .line 1673
    move-result v0

    .line 1674
    if-eqz v0, :cond_a

    .line 1675
    .line 1676
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1677
    .line 1678
    .line 1679
    move-result-object v0

    .line 1680
    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 1681
    .line 1682
    iget-object v1, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 1683
    .line 1684
    check-cast v1, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 1685
    .line 1686
    const/4 v6, 0x2

    .line 1687
    invoke-virtual {v1, v13, v6}, Lcom/google/crypto/tink/shaded/protobuf/l;->X(II)V

    .line 1688
    .line 1689
    .line 1690
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/i;->size()I

    .line 1691
    .line 1692
    .line 1693
    move-result v6

    .line 1694
    invoke-virtual {v1, v6}, Lcom/google/crypto/tink/shaded/protobuf/l;->Z(I)V

    .line 1695
    .line 1696
    .line 1697
    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 1698
    .line 1699
    iget-object v6, v0, Lcom/google/crypto/tink/shaded/protobuf/h;->h:[B

    .line 1700
    .line 1701
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/h;->g()I

    .line 1702
    .line 1703
    .line 1704
    move-result v8

    .line 1705
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/h;->size()I

    .line 1706
    .line 1707
    .line 1708
    move-result v0

    .line 1709
    invoke-virtual {v1, v6, v8, v0}, Lcom/google/crypto/tink/shaded/protobuf/l;->Q([BII)V

    .line 1710
    .line 1711
    .line 1712
    goto/16 :goto_11

    .line 1713
    .line 1714
    :pswitch_3b
    invoke-virtual/range {v1 .. v6}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1715
    .line 1716
    .line 1717
    move-result v0

    .line 1718
    if-eqz v0, :cond_3

    .line 1719
    .line 1720
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1721
    .line 1722
    .line 1723
    move-result-object v0

    .line 1724
    invoke-virtual {v1, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 1725
    .line 1726
    .line 1727
    move-result-object v6

    .line 1728
    invoke-virtual {v7, v13, v0, v6}, Lcom/google/crypto/tink/shaded/protobuf/I;->b(ILjava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Y;)V

    .line 1729
    .line 1730
    .line 1731
    goto/16 :goto_4

    .line 1732
    .line 1733
    :pswitch_3c
    invoke-virtual/range {v1 .. v6}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1734
    .line 1735
    .line 1736
    move-result v0

    .line 1737
    if-eqz v0, :cond_a

    .line 1738
    .line 1739
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1740
    .line 1741
    .line 1742
    move-result-object v0

    .line 1743
    instance-of v1, v0, Ljava/lang/String;

    .line 1744
    .line 1745
    if-eqz v1, :cond_d

    .line 1746
    .line 1747
    move-object v1, v0

    .line 1748
    check-cast v1, Ljava/lang/String;

    .line 1749
    .line 1750
    iget-object v0, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 1751
    .line 1752
    move-object v6, v0

    .line 1753
    check-cast v6, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 1754
    .line 1755
    const/4 v8, 0x2

    .line 1756
    invoke-virtual {v6, v13, v8}, Lcom/google/crypto/tink/shaded/protobuf/l;->X(II)V

    .line 1757
    .line 1758
    .line 1759
    iget v0, v6, Lcom/google/crypto/tink/shaded/protobuf/l;->d:I

    .line 1760
    .line 1761
    iget-object v8, v6, Lcom/google/crypto/tink/shaded/protobuf/l;->c:[B

    .line 1762
    .line 1763
    iget v11, v6, Lcom/google/crypto/tink/shaded/protobuf/l;->e:I

    .line 1764
    .line 1765
    :try_start_6
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 1766
    .line 1767
    .line 1768
    move-result v13

    .line 1769
    mul-int/lit8 v13, v13, 0x3

    .line 1770
    .line 1771
    invoke-static {v13}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 1772
    .line 1773
    .line 1774
    move-result v13

    .line 1775
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 1776
    .line 1777
    .line 1778
    move-result v14

    .line 1779
    invoke-static {v14}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 1780
    .line 1781
    .line 1782
    move-result v14

    .line 1783
    if-ne v14, v13, :cond_c

    .line 1784
    .line 1785
    add-int v13, v11, v14

    .line 1786
    .line 1787
    iput v13, v6, Lcom/google/crypto/tink/shaded/protobuf/l;->e:I

    .line 1788
    .line 1789
    sub-int/2addr v0, v13

    .line 1790
    sget-object v15, Lcom/google/crypto/tink/shaded/protobuf/k0;->a:Lcom/google/crypto/tink/shaded/protobuf/i0;

    .line 1791
    .line 1792
    invoke-virtual {v15, v1, v8, v13, v0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->o(Ljava/lang/String;[BII)I

    .line 1793
    .line 1794
    .line 1795
    move-result v0

    .line 1796
    iput v11, v6, Lcom/google/crypto/tink/shaded/protobuf/l;->e:I

    .line 1797
    .line 1798
    sub-int v8, v0, v11

    .line 1799
    .line 1800
    sub-int/2addr v8, v14

    .line 1801
    invoke-virtual {v6, v8}, Lcom/google/crypto/tink/shaded/protobuf/l;->Z(I)V

    .line 1802
    .line 1803
    .line 1804
    iput v0, v6, Lcom/google/crypto/tink/shaded/protobuf/l;->e:I

    .line 1805
    .line 1806
    goto/16 :goto_11

    .line 1807
    .line 1808
    :catch_8
    move-exception v0

    .line 1809
    goto :goto_13

    .line 1810
    :catch_9
    move-exception v0

    .line 1811
    goto :goto_14

    .line 1812
    :cond_c
    invoke-static {v1}, Lcom/google/crypto/tink/shaded/protobuf/k0;->b(Ljava/lang/String;)I

    .line 1813
    .line 1814
    .line 1815
    move-result v13

    .line 1816
    invoke-virtual {v6, v13}, Lcom/google/crypto/tink/shaded/protobuf/l;->Z(I)V

    .line 1817
    .line 1818
    .line 1819
    iget v13, v6, Lcom/google/crypto/tink/shaded/protobuf/l;->e:I

    .line 1820
    .line 1821
    sub-int/2addr v0, v13

    .line 1822
    sget-object v14, Lcom/google/crypto/tink/shaded/protobuf/k0;->a:Lcom/google/crypto/tink/shaded/protobuf/i0;

    .line 1823
    .line 1824
    invoke-virtual {v14, v1, v8, v13, v0}, Lcom/google/crypto/tink/shaded/protobuf/i0;->o(Ljava/lang/String;[BII)I

    .line 1825
    .line 1826
    .line 1827
    move-result v0

    .line 1828
    iput v0, v6, Lcom/google/crypto/tink/shaded/protobuf/l;->e:I
    :try_end_6
    .catch Lcom/google/crypto/tink/shaded/protobuf/j0; {:try_start_6 .. :try_end_6} :catch_9
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_6 .. :try_end_6} :catch_8

    .line 1829
    .line 1830
    goto/16 :goto_11

    .line 1831
    .line 1832
    :goto_13
    new-instance v1, Landroidx/datastore/preferences/protobuf/l;

    .line 1833
    .line 1834
    invoke-direct {v1, v0}, Landroidx/datastore/preferences/protobuf/l;-><init>(Ljava/lang/IndexOutOfBoundsException;)V

    .line 1835
    .line 1836
    .line 1837
    throw v1

    .line 1838
    :goto_14
    iput v11, v6, Lcom/google/crypto/tink/shaded/protobuf/l;->e:I

    .line 1839
    .line 1840
    sget-object v8, Lcom/google/crypto/tink/shaded/protobuf/l;->f:Ljava/util/logging/Logger;

    .line 1841
    .line 1842
    sget-object v11, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 1843
    .line 1844
    invoke-virtual {v8, v11, v12, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1845
    .line 1846
    .line 1847
    sget-object v0, Lcom/google/crypto/tink/shaded/protobuf/A;->a:Ljava/nio/charset/Charset;

    .line 1848
    .line 1849
    invoke-virtual {v1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 1850
    .line 1851
    .line 1852
    move-result-object v0

    .line 1853
    :try_start_7
    array-length v1, v0

    .line 1854
    invoke-virtual {v6, v1}, Lcom/google/crypto/tink/shaded/protobuf/l;->Z(I)V

    .line 1855
    .line 1856
    .line 1857
    array-length v1, v0

    .line 1858
    const/4 v8, 0x0

    .line 1859
    invoke-virtual {v6, v0, v8, v1}, Lcom/google/crypto/tink/shaded/protobuf/l;->Q([BII)V
    :try_end_7
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_7 .. :try_end_7} :catch_a

    .line 1860
    .line 1861
    .line 1862
    goto/16 :goto_11

    .line 1863
    .line 1864
    :catch_a
    move-exception v0

    .line 1865
    new-instance v1, Landroidx/datastore/preferences/protobuf/l;

    .line 1866
    .line 1867
    invoke-direct {v1, v0}, Landroidx/datastore/preferences/protobuf/l;-><init>(Ljava/lang/IndexOutOfBoundsException;)V

    .line 1868
    .line 1869
    .line 1870
    throw v1

    .line 1871
    :cond_d
    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 1872
    .line 1873
    iget-object v1, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 1874
    .line 1875
    check-cast v1, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 1876
    .line 1877
    const/4 v6, 0x2

    .line 1878
    invoke-virtual {v1, v13, v6}, Lcom/google/crypto/tink/shaded/protobuf/l;->X(II)V

    .line 1879
    .line 1880
    .line 1881
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/i;->size()I

    .line 1882
    .line 1883
    .line 1884
    move-result v6

    .line 1885
    invoke-virtual {v1, v6}, Lcom/google/crypto/tink/shaded/protobuf/l;->Z(I)V

    .line 1886
    .line 1887
    .line 1888
    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 1889
    .line 1890
    iget-object v6, v0, Lcom/google/crypto/tink/shaded/protobuf/h;->h:[B

    .line 1891
    .line 1892
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/h;->g()I

    .line 1893
    .line 1894
    .line 1895
    move-result v8

    .line 1896
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/h;->size()I

    .line 1897
    .line 1898
    .line 1899
    move-result v0

    .line 1900
    invoke-virtual {v1, v6, v8, v0}, Lcom/google/crypto/tink/shaded/protobuf/l;->Q([BII)V

    .line 1901
    .line 1902
    .line 1903
    goto/16 :goto_11

    .line 1904
    .line 1905
    :pswitch_3d
    invoke-virtual/range {v1 .. v6}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1906
    .line 1907
    .line 1908
    move-result v0

    .line 1909
    if-eqz v0, :cond_a

    .line 1910
    .line 1911
    sget-object v0, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 1912
    .line 1913
    invoke-virtual {v0, v14, v15, v2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->c(JLjava/lang/Object;)Z

    .line 1914
    .line 1915
    .line 1916
    move-result v0

    .line 1917
    iget-object v1, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 1918
    .line 1919
    check-cast v1, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 1920
    .line 1921
    const/4 v8, 0x0

    .line 1922
    invoke-virtual {v1, v13, v8}, Lcom/google/crypto/tink/shaded/protobuf/l;->X(II)V

    .line 1923
    .line 1924
    .line 1925
    int-to-byte v0, v0

    .line 1926
    invoke-virtual {v1, v0}, Lcom/google/crypto/tink/shaded/protobuf/l;->P(B)V

    .line 1927
    .line 1928
    .line 1929
    goto/16 :goto_12

    .line 1930
    .line 1931
    :pswitch_3e
    const/4 v8, 0x0

    .line 1932
    invoke-virtual/range {v1 .. v6}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1933
    .line 1934
    .line 1935
    move-result v0

    .line 1936
    if-eqz v0, :cond_b

    .line 1937
    .line 1938
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1939
    .line 1940
    .line 1941
    move-result v0

    .line 1942
    iget-object v1, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 1943
    .line 1944
    check-cast v1, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 1945
    .line 1946
    invoke-virtual {v1, v13, v0}, Lcom/google/crypto/tink/shaded/protobuf/l;->R(II)V

    .line 1947
    .line 1948
    .line 1949
    goto/16 :goto_12

    .line 1950
    .line 1951
    :pswitch_3f
    const/4 v8, 0x0

    .line 1952
    invoke-virtual/range {v1 .. v6}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1953
    .line 1954
    .line 1955
    move-result v0

    .line 1956
    if-eqz v0, :cond_b

    .line 1957
    .line 1958
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1959
    .line 1960
    .line 1961
    move-result-wide v0

    .line 1962
    iget-object v6, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 1963
    .line 1964
    check-cast v6, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 1965
    .line 1966
    invoke-virtual {v6, v0, v1, v13}, Lcom/google/crypto/tink/shaded/protobuf/l;->T(JI)V

    .line 1967
    .line 1968
    .line 1969
    goto/16 :goto_12

    .line 1970
    .line 1971
    :pswitch_40
    const/4 v8, 0x0

    .line 1972
    invoke-virtual/range {v1 .. v6}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1973
    .line 1974
    .line 1975
    move-result v0

    .line 1976
    if-eqz v0, :cond_b

    .line 1977
    .line 1978
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1979
    .line 1980
    .line 1981
    move-result v0

    .line 1982
    iget-object v1, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 1983
    .line 1984
    check-cast v1, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 1985
    .line 1986
    invoke-virtual {v1, v13, v0}, Lcom/google/crypto/tink/shaded/protobuf/l;->V(II)V

    .line 1987
    .line 1988
    .line 1989
    goto/16 :goto_12

    .line 1990
    .line 1991
    :pswitch_41
    const/4 v8, 0x0

    .line 1992
    invoke-virtual/range {v1 .. v6}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1993
    .line 1994
    .line 1995
    move-result v0

    .line 1996
    if-eqz v0, :cond_b

    .line 1997
    .line 1998
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1999
    .line 2000
    .line 2001
    move-result-wide v0

    .line 2002
    iget-object v6, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 2003
    .line 2004
    check-cast v6, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 2005
    .line 2006
    invoke-virtual {v6, v0, v1, v13}, Lcom/google/crypto/tink/shaded/protobuf/l;->a0(JI)V

    .line 2007
    .line 2008
    .line 2009
    goto/16 :goto_12

    .line 2010
    .line 2011
    :pswitch_42
    const/4 v8, 0x0

    .line 2012
    invoke-virtual/range {v1 .. v6}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 2013
    .line 2014
    .line 2015
    move-result v0

    .line 2016
    if-eqz v0, :cond_b

    .line 2017
    .line 2018
    invoke-virtual {v10, v2, v14, v15}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 2019
    .line 2020
    .line 2021
    move-result-wide v0

    .line 2022
    iget-object v6, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 2023
    .line 2024
    check-cast v6, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 2025
    .line 2026
    invoke-virtual {v6, v0, v1, v13}, Lcom/google/crypto/tink/shaded/protobuf/l;->a0(JI)V

    .line 2027
    .line 2028
    .line 2029
    goto/16 :goto_12

    .line 2030
    .line 2031
    :pswitch_43
    const/4 v8, 0x0

    .line 2032
    invoke-virtual/range {v1 .. v6}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 2033
    .line 2034
    .line 2035
    move-result v0

    .line 2036
    if-eqz v0, :cond_b

    .line 2037
    .line 2038
    sget-object v0, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 2039
    .line 2040
    invoke-virtual {v0, v14, v15, v2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->f(JLjava/lang/Object;)F

    .line 2041
    .line 2042
    .line 2043
    move-result v0

    .line 2044
    iget-object v1, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 2045
    .line 2046
    check-cast v1, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 2047
    .line 2048
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2049
    .line 2050
    .line 2051
    invoke-static {v0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    .line 2052
    .line 2053
    .line 2054
    move-result v0

    .line 2055
    invoke-virtual {v1, v13, v0}, Lcom/google/crypto/tink/shaded/protobuf/l;->R(II)V

    .line 2056
    .line 2057
    .line 2058
    goto/16 :goto_12

    .line 2059
    .line 2060
    :pswitch_44
    const/4 v8, 0x0

    .line 2061
    invoke-virtual/range {v1 .. v6}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 2062
    .line 2063
    .line 2064
    move-result v0

    .line 2065
    if-eqz v0, :cond_e

    .line 2066
    .line 2067
    sget-object v0, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 2068
    .line 2069
    invoke-virtual {v0, v14, v15, v2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->e(JLjava/lang/Object;)D

    .line 2070
    .line 2071
    .line 2072
    move-result-wide v11

    .line 2073
    iget-object v0, v7, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 2074
    .line 2075
    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/l;

    .line 2076
    .line 2077
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2078
    .line 2079
    .line 2080
    invoke-static {v11, v12}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    .line 2081
    .line 2082
    .line 2083
    move-result-wide v11

    .line 2084
    invoke-virtual {v0, v11, v12, v13}, Lcom/google/crypto/tink/shaded/protobuf/l;->T(JI)V

    .line 2085
    .line 2086
    .line 2087
    :cond_e
    :goto_15
    add-int/lit8 v3, v3, 0x3

    .line 2088
    .line 2089
    move v0, v4

    .line 2090
    move v4, v5

    .line 2091
    move/from16 v11, v17

    .line 2092
    .line 2093
    move-object/from16 v8, v18

    .line 2094
    .line 2095
    goto/16 :goto_0

    .line 2096
    .line 2097
    :cond_f
    iget-object v0, v1, Lcom/google/crypto/tink/shaded/protobuf/P;->l:Lcom/google/crypto/tink/shaded/protobuf/c0;

    .line 2098
    .line 2099
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2100
    .line 2101
    .line 2102
    move-object v0, v2

    .line 2103
    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 2104
    .line 2105
    iget-object v0, v0, Lcom/google/crypto/tink/shaded/protobuf/w;->unknownFields:Lcom/google/crypto/tink/shaded/protobuf/b0;

    .line 2106
    .line 2107
    invoke-virtual {v0, v7}, Lcom/google/crypto/tink/shaded/protobuf/b0;->e(Lcom/google/crypto/tink/shaded/protobuf/I;)V

    .line 2108
    .line 2109
    .line 2110
    return-void

    .line 2111
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
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

.method public final a(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 10

    .line 1
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->l(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    :goto_0
    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->a:[I

    .line 9
    .line 10
    array-length v2, v1

    .line 11
    if-ge v0, v2, :cond_4

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/google/crypto/tink/shaded/protobuf/P;->S(I)I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const v3, 0xfffff

    .line 18
    .line 19
    .line 20
    and-int/2addr v3, v2

    .line 21
    int-to-long v6, v3

    .line 22
    aget v1, v1, v0

    .line 23
    .line 24
    invoke-static {v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->R(I)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    packed-switch v2, :pswitch_data_0

    .line 29
    .line 30
    .line 31
    goto :goto_1

    .line 32
    :pswitch_0
    invoke-virtual {p0, v0, p1, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->w(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    :goto_1
    move-object v5, p1

    .line 36
    goto/16 :goto_2

    .line 37
    .line 38
    :pswitch_1
    invoke-virtual {p0, p2, v1, v0}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_0

    .line 43
    .line 44
    sget-object v2, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 45
    .line 46
    invoke-virtual {v2, v6, v7, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-static {v6, v7, p1, v2}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, p1, v1, v0}, Lcom/google/crypto/tink/shaded/protobuf/P;->N(Ljava/lang/Object;II)V

    .line 54
    .line 55
    .line 56
    goto :goto_1

    .line 57
    :pswitch_2
    invoke-virtual {p0, v0, p1, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->w(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :pswitch_3
    invoke-virtual {p0, p2, v1, v0}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-eqz v2, :cond_0

    .line 66
    .line 67
    sget-object v2, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 68
    .line 69
    invoke-virtual {v2, v6, v7, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-static {v6, v7, p1, v2}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, p1, v1, v0}, Lcom/google/crypto/tink/shaded/protobuf/P;->N(Ljava/lang/Object;II)V

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :pswitch_4
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 81
    .line 82
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 83
    .line 84
    invoke-virtual {v1, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {v1, v6, v7, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    iget-object v3, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->m:Lcom/google/crypto/tink/shaded/protobuf/K;

    .line 93
    .line 94
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 95
    .line 96
    .line 97
    invoke-static {v2, v1}, Lcom/google/crypto/tink/shaded/protobuf/K;->a(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/J;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-static {v6, v7, p1, v1}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    goto :goto_1

    .line 105
    :pswitch_5
    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->k:Lcom/google/crypto/tink/shaded/protobuf/E;

    .line 106
    .line 107
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 108
    .line 109
    .line 110
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 111
    .line 112
    invoke-virtual {v1, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    check-cast v2, Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 117
    .line 118
    invoke-virtual {v1, v6, v7, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    check-cast v1, Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 123
    .line 124
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 125
    .line 126
    .line 127
    move-result v3

    .line 128
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 129
    .line 130
    .line 131
    move-result v4

    .line 132
    if-lez v3, :cond_2

    .line 133
    .line 134
    if-lez v4, :cond_2

    .line 135
    .line 136
    move-object v5, v2

    .line 137
    check-cast v5, Lcom/google/crypto/tink/shaded/protobuf/b;

    .line 138
    .line 139
    iget-boolean v5, v5, Lcom/google/crypto/tink/shaded/protobuf/b;->e:Z

    .line 140
    .line 141
    if-nez v5, :cond_1

    .line 142
    .line 143
    add-int/2addr v4, v3

    .line 144
    invoke-interface {v2, v4}, Lcom/google/crypto/tink/shaded/protobuf/z;->a(I)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    :cond_1
    invoke-interface {v2, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 149
    .line 150
    .line 151
    :cond_2
    if-lez v3, :cond_3

    .line 152
    .line 153
    move-object v1, v2

    .line 154
    :cond_3
    invoke-static {v6, v7, p1, v1}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 155
    .line 156
    .line 157
    goto :goto_1

    .line 158
    :pswitch_6
    invoke-virtual {p0, v0, p1, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->v(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 159
    .line 160
    .line 161
    goto :goto_1

    .line 162
    :pswitch_7
    invoke-virtual {p0, v0, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->q(ILjava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    if-eqz v1, :cond_0

    .line 167
    .line 168
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 169
    .line 170
    invoke-virtual {v1, v6, v7, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->h(JLjava/lang/Object;)J

    .line 171
    .line 172
    .line 173
    move-result-wide v1

    .line 174
    invoke-static {p1, v6, v7, v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/h0;->o(Ljava/lang/Object;JJ)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {p0, v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 178
    .line 179
    .line 180
    goto/16 :goto_1

    .line 181
    .line 182
    :pswitch_8
    invoke-virtual {p0, v0, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->q(ILjava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    if-eqz v1, :cond_0

    .line 187
    .line 188
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 189
    .line 190
    invoke-virtual {v1, v6, v7, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 191
    .line 192
    .line 193
    move-result v1

    .line 194
    invoke-static {v1, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/h0;->n(IJLjava/lang/Object;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {p0, v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 198
    .line 199
    .line 200
    goto/16 :goto_1

    .line 201
    .line 202
    :pswitch_9
    invoke-virtual {p0, v0, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->q(ILjava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    move-result v1

    .line 206
    if-eqz v1, :cond_0

    .line 207
    .line 208
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 209
    .line 210
    invoke-virtual {v1, v6, v7, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->h(JLjava/lang/Object;)J

    .line 211
    .line 212
    .line 213
    move-result-wide v1

    .line 214
    invoke-static {p1, v6, v7, v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/h0;->o(Ljava/lang/Object;JJ)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {p0, v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 218
    .line 219
    .line 220
    goto/16 :goto_1

    .line 221
    .line 222
    :pswitch_a
    invoke-virtual {p0, v0, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->q(ILjava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    move-result v1

    .line 226
    if-eqz v1, :cond_0

    .line 227
    .line 228
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 229
    .line 230
    invoke-virtual {v1, v6, v7, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 231
    .line 232
    .line 233
    move-result v1

    .line 234
    invoke-static {v1, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/h0;->n(IJLjava/lang/Object;)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {p0, v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 238
    .line 239
    .line 240
    goto/16 :goto_1

    .line 241
    .line 242
    :pswitch_b
    invoke-virtual {p0, v0, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->q(ILjava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    move-result v1

    .line 246
    if-eqz v1, :cond_0

    .line 247
    .line 248
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 249
    .line 250
    invoke-virtual {v1, v6, v7, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 251
    .line 252
    .line 253
    move-result v1

    .line 254
    invoke-static {v1, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/h0;->n(IJLjava/lang/Object;)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {p0, v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 258
    .line 259
    .line 260
    goto/16 :goto_1

    .line 261
    .line 262
    :pswitch_c
    invoke-virtual {p0, v0, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->q(ILjava/lang/Object;)Z

    .line 263
    .line 264
    .line 265
    move-result v1

    .line 266
    if-eqz v1, :cond_0

    .line 267
    .line 268
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 269
    .line 270
    invoke-virtual {v1, v6, v7, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 271
    .line 272
    .line 273
    move-result v1

    .line 274
    invoke-static {v1, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/h0;->n(IJLjava/lang/Object;)V

    .line 275
    .line 276
    .line 277
    invoke-virtual {p0, v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 278
    .line 279
    .line 280
    goto/16 :goto_1

    .line 281
    .line 282
    :pswitch_d
    invoke-virtual {p0, v0, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->q(ILjava/lang/Object;)Z

    .line 283
    .line 284
    .line 285
    move-result v1

    .line 286
    if-eqz v1, :cond_0

    .line 287
    .line 288
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 289
    .line 290
    invoke-virtual {v1, v6, v7, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 291
    .line 292
    .line 293
    move-result-object v1

    .line 294
    invoke-static {v6, v7, p1, v1}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 295
    .line 296
    .line 297
    invoke-virtual {p0, v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 298
    .line 299
    .line 300
    goto/16 :goto_1

    .line 301
    .line 302
    :pswitch_e
    invoke-virtual {p0, v0, p1, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->v(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 303
    .line 304
    .line 305
    goto/16 :goto_1

    .line 306
    .line 307
    :pswitch_f
    invoke-virtual {p0, v0, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->q(ILjava/lang/Object;)Z

    .line 308
    .line 309
    .line 310
    move-result v1

    .line 311
    if-eqz v1, :cond_0

    .line 312
    .line 313
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 314
    .line 315
    invoke-virtual {v1, v6, v7, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 316
    .line 317
    .line 318
    move-result-object v1

    .line 319
    invoke-static {v6, v7, p1, v1}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {p0, v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 323
    .line 324
    .line 325
    goto/16 :goto_1

    .line 326
    .line 327
    :pswitch_10
    invoke-virtual {p0, v0, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->q(ILjava/lang/Object;)Z

    .line 328
    .line 329
    .line 330
    move-result v1

    .line 331
    if-eqz v1, :cond_0

    .line 332
    .line 333
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 334
    .line 335
    invoke-virtual {v1, v6, v7, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->c(JLjava/lang/Object;)Z

    .line 336
    .line 337
    .line 338
    move-result v2

    .line 339
    invoke-virtual {v1, p1, v6, v7, v2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->k(Ljava/lang/Object;JZ)V

    .line 340
    .line 341
    .line 342
    invoke-virtual {p0, v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 343
    .line 344
    .line 345
    goto/16 :goto_1

    .line 346
    .line 347
    :pswitch_11
    invoke-virtual {p0, v0, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->q(ILjava/lang/Object;)Z

    .line 348
    .line 349
    .line 350
    move-result v1

    .line 351
    if-eqz v1, :cond_0

    .line 352
    .line 353
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 354
    .line 355
    invoke-virtual {v1, v6, v7, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 356
    .line 357
    .line 358
    move-result v1

    .line 359
    invoke-static {v1, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/h0;->n(IJLjava/lang/Object;)V

    .line 360
    .line 361
    .line 362
    invoke-virtual {p0, v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 363
    .line 364
    .line 365
    goto/16 :goto_1

    .line 366
    .line 367
    :pswitch_12
    invoke-virtual {p0, v0, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->q(ILjava/lang/Object;)Z

    .line 368
    .line 369
    .line 370
    move-result v1

    .line 371
    if-eqz v1, :cond_0

    .line 372
    .line 373
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 374
    .line 375
    invoke-virtual {v1, v6, v7, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->h(JLjava/lang/Object;)J

    .line 376
    .line 377
    .line 378
    move-result-wide v1

    .line 379
    invoke-static {p1, v6, v7, v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/h0;->o(Ljava/lang/Object;JJ)V

    .line 380
    .line 381
    .line 382
    invoke-virtual {p0, v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 383
    .line 384
    .line 385
    goto/16 :goto_1

    .line 386
    .line 387
    :pswitch_13
    invoke-virtual {p0, v0, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->q(ILjava/lang/Object;)Z

    .line 388
    .line 389
    .line 390
    move-result v1

    .line 391
    if-eqz v1, :cond_0

    .line 392
    .line 393
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 394
    .line 395
    invoke-virtual {v1, v6, v7, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 396
    .line 397
    .line 398
    move-result v1

    .line 399
    invoke-static {v1, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/h0;->n(IJLjava/lang/Object;)V

    .line 400
    .line 401
    .line 402
    invoke-virtual {p0, v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 403
    .line 404
    .line 405
    goto/16 :goto_1

    .line 406
    .line 407
    :pswitch_14
    invoke-virtual {p0, v0, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->q(ILjava/lang/Object;)Z

    .line 408
    .line 409
    .line 410
    move-result v1

    .line 411
    if-eqz v1, :cond_0

    .line 412
    .line 413
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 414
    .line 415
    invoke-virtual {v1, v6, v7, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->h(JLjava/lang/Object;)J

    .line 416
    .line 417
    .line 418
    move-result-wide v1

    .line 419
    invoke-static {p1, v6, v7, v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/h0;->o(Ljava/lang/Object;JJ)V

    .line 420
    .line 421
    .line 422
    invoke-virtual {p0, v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 423
    .line 424
    .line 425
    goto/16 :goto_1

    .line 426
    .line 427
    :pswitch_15
    invoke-virtual {p0, v0, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->q(ILjava/lang/Object;)Z

    .line 428
    .line 429
    .line 430
    move-result v1

    .line 431
    if-eqz v1, :cond_0

    .line 432
    .line 433
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 434
    .line 435
    invoke-virtual {v1, v6, v7, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->h(JLjava/lang/Object;)J

    .line 436
    .line 437
    .line 438
    move-result-wide v1

    .line 439
    invoke-static {p1, v6, v7, v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/h0;->o(Ljava/lang/Object;JJ)V

    .line 440
    .line 441
    .line 442
    invoke-virtual {p0, v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 443
    .line 444
    .line 445
    goto/16 :goto_1

    .line 446
    .line 447
    :pswitch_16
    invoke-virtual {p0, v0, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->q(ILjava/lang/Object;)Z

    .line 448
    .line 449
    .line 450
    move-result v1

    .line 451
    if-eqz v1, :cond_0

    .line 452
    .line 453
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 454
    .line 455
    invoke-virtual {v1, v6, v7, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->f(JLjava/lang/Object;)F

    .line 456
    .line 457
    .line 458
    move-result v2

    .line 459
    invoke-virtual {v1, p1, v6, v7, v2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->n(Ljava/lang/Object;JF)V

    .line 460
    .line 461
    .line 462
    invoke-virtual {p0, v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 463
    .line 464
    .line 465
    goto/16 :goto_1

    .line 466
    .line 467
    :pswitch_17
    invoke-virtual {p0, v0, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->q(ILjava/lang/Object;)Z

    .line 468
    .line 469
    .line 470
    move-result v1

    .line 471
    if-eqz v1, :cond_0

    .line 472
    .line 473
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 474
    .line 475
    invoke-virtual {v4, v6, v7, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->e(JLjava/lang/Object;)D

    .line 476
    .line 477
    .line 478
    move-result-wide v8

    .line 479
    move-object v5, p1

    .line 480
    invoke-virtual/range {v4 .. v9}, Lcom/google/crypto/tink/shaded/protobuf/g0;->m(Ljava/lang/Object;JD)V

    .line 481
    .line 482
    .line 483
    invoke-virtual {p0, v0, v5}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 484
    .line 485
    .line 486
    :goto_2
    add-int/lit8 v0, v0, 0x3

    .line 487
    .line 488
    move-object p1, v5

    .line 489
    goto/16 :goto_0

    .line 490
    .line 491
    :cond_4
    move-object v5, p1

    .line 492
    iget-object p1, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->l:Lcom/google/crypto/tink/shaded/protobuf/c0;

    .line 493
    .line 494
    invoke-static {p1, v5, p2}, Lcom/google/crypto/tink/shaded/protobuf/Z;->k(Lcom/google/crypto/tink/shaded/protobuf/c0;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 495
    .line 496
    .line 497
    return-void

    .line 498
    nop

    .line 499
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
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
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final b(Ljava/lang/Object;)V
    .locals 9

    .line 1
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->s(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_2

    .line 8
    .line 9
    :cond_0
    instance-of v0, p1, Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    move-object v0, p1

    .line 15
    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 16
    .line 17
    const v2, 0x7fffffff

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v2}, Lcom/google/crypto/tink/shaded/protobuf/w;->x(I)V

    .line 21
    .line 22
    .line 23
    iput v1, v0, Lcom/google/crypto/tink/shaded/protobuf/a;->memoizedHashCode:I

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/w;->q()V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->a:[I

    .line 29
    .line 30
    array-length v2, v0

    .line 31
    move v3, v1

    .line 32
    :goto_0
    if-ge v3, v2, :cond_5

    .line 33
    .line 34
    invoke-virtual {p0, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->S(I)I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    const v5, 0xfffff

    .line 39
    .line 40
    .line 41
    and-int/2addr v5, v4

    .line 42
    int-to-long v5, v5

    .line 43
    invoke-static {v4}, Lcom/google/crypto/tink/shaded/protobuf/P;->R(I)I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    const/16 v7, 0x9

    .line 48
    .line 49
    if-eq v4, v7, :cond_3

    .line 50
    .line 51
    const/16 v7, 0x3c

    .line 52
    .line 53
    if-eq v4, v7, :cond_2

    .line 54
    .line 55
    const/16 v7, 0x44

    .line 56
    .line 57
    if-eq v4, v7, :cond_2

    .line 58
    .line 59
    packed-switch v4, :pswitch_data_0

    .line 60
    .line 61
    .line 62
    goto :goto_1

    .line 63
    :pswitch_0
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/P;->o:Lsun/misc/Unsafe;

    .line 64
    .line 65
    invoke-virtual {v4, p1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v7

    .line 69
    if-eqz v7, :cond_4

    .line 70
    .line 71
    iget-object v8, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->m:Lcom/google/crypto/tink/shaded/protobuf/K;

    .line 72
    .line 73
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 74
    .line 75
    .line 76
    move-object v8, v7

    .line 77
    check-cast v8, Lcom/google/crypto/tink/shaded/protobuf/J;

    .line 78
    .line 79
    iput-boolean v1, v8, Lcom/google/crypto/tink/shaded/protobuf/J;->e:Z

    .line 80
    .line 81
    invoke-virtual {v4, p1, v5, v6, v7}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :pswitch_1
    iget-object v4, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->k:Lcom/google/crypto/tink/shaded/protobuf/E;

    .line 86
    .line 87
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 88
    .line 89
    .line 90
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 91
    .line 92
    invoke-virtual {v4, v5, v6, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    check-cast v4, Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 97
    .line 98
    check-cast v4, Lcom/google/crypto/tink/shaded/protobuf/b;

    .line 99
    .line 100
    iget-boolean v5, v4, Lcom/google/crypto/tink/shaded/protobuf/b;->e:Z

    .line 101
    .line 102
    if-eqz v5, :cond_4

    .line 103
    .line 104
    iput-boolean v1, v4, Lcom/google/crypto/tink/shaded/protobuf/b;->e:Z

    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_2
    aget v4, v0, v3

    .line 108
    .line 109
    invoke-virtual {p0, p1, v4, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 110
    .line 111
    .line 112
    move-result v4

    .line 113
    if-eqz v4, :cond_4

    .line 114
    .line 115
    invoke-virtual {p0, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    sget-object v7, Lcom/google/crypto/tink/shaded/protobuf/P;->o:Lsun/misc/Unsafe;

    .line 120
    .line 121
    invoke-virtual {v7, p1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v5

    .line 125
    invoke-interface {v4, v5}, Lcom/google/crypto/tink/shaded/protobuf/Y;->b(Ljava/lang/Object;)V

    .line 126
    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_3
    :pswitch_2
    invoke-virtual {p0, v3, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->q(ILjava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v4

    .line 133
    if-eqz v4, :cond_4

    .line 134
    .line 135
    invoke-virtual {p0, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 136
    .line 137
    .line 138
    move-result-object v4

    .line 139
    sget-object v7, Lcom/google/crypto/tink/shaded/protobuf/P;->o:Lsun/misc/Unsafe;

    .line 140
    .line 141
    invoke-virtual {v7, p1, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v5

    .line 145
    invoke-interface {v4, v5}, Lcom/google/crypto/tink/shaded/protobuf/Y;->b(Ljava/lang/Object;)V

    .line 146
    .line 147
    .line 148
    :cond_4
    :goto_1
    add-int/lit8 v3, v3, 0x3

    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_5
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->l:Lcom/google/crypto/tink/shaded/protobuf/c0;

    .line 152
    .line 153
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 154
    .line 155
    .line 156
    check-cast p1, Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 157
    .line 158
    iget-object p1, p1, Lcom/google/crypto/tink/shaded/protobuf/w;->unknownFields:Lcom/google/crypto/tink/shaded/protobuf/b0;

    .line 159
    .line 160
    iget-boolean v0, p1, Lcom/google/crypto/tink/shaded/protobuf/b0;->e:Z

    .line 161
    .line 162
    if-eqz v0, :cond_6

    .line 163
    .line 164
    iput-boolean v1, p1, Lcom/google/crypto/tink/shaded/protobuf/b0;->e:Z

    .line 165
    .line 166
    :cond_6
    :goto_2
    return-void

    .line 167
    :pswitch_data_0
    .packed-switch 0x11
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final c(Ljava/lang/Object;)Z
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const v6, 0xfffff

    .line 6
    .line 7
    .line 8
    const/4 v7, 0x0

    .line 9
    move v2, v6

    .line 10
    move v3, v7

    .line 11
    move v8, v3

    .line 12
    :goto_0
    iget v4, v0, Lcom/google/crypto/tink/shaded/protobuf/P;->h:I

    .line 13
    .line 14
    const/4 v5, 0x1

    .line 15
    if-ge v8, v4, :cond_b

    .line 16
    .line 17
    iget-object v4, v0, Lcom/google/crypto/tink/shaded/protobuf/P;->g:[I

    .line 18
    .line 19
    aget v4, v4, v8

    .line 20
    .line 21
    iget-object v9, v0, Lcom/google/crypto/tink/shaded/protobuf/P;->a:[I

    .line 22
    .line 23
    aget v10, v9, v4

    .line 24
    .line 25
    invoke-virtual {v0, v4}, Lcom/google/crypto/tink/shaded/protobuf/P;->S(I)I

    .line 26
    .line 27
    .line 28
    move-result v11

    .line 29
    add-int/lit8 v12, v4, 0x2

    .line 30
    .line 31
    aget v9, v9, v12

    .line 32
    .line 33
    and-int v12, v9, v6

    .line 34
    .line 35
    ushr-int/lit8 v9, v9, 0x14

    .line 36
    .line 37
    shl-int/2addr v5, v9

    .line 38
    if-eq v12, v2, :cond_1

    .line 39
    .line 40
    if-eq v12, v6, :cond_0

    .line 41
    .line 42
    sget-object v2, Lcom/google/crypto/tink/shaded/protobuf/P;->o:Lsun/misc/Unsafe;

    .line 43
    .line 44
    int-to-long v13, v12

    .line 45
    invoke-virtual {v2, v1, v13, v14}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    :cond_0
    move v2, v4

    .line 50
    move v4, v3

    .line 51
    move v3, v12

    .line 52
    goto :goto_1

    .line 53
    :cond_1
    move v15, v3

    .line 54
    move v3, v2

    .line 55
    move v2, v4

    .line 56
    move v4, v15

    .line 57
    :goto_1
    const/high16 v9, 0x10000000

    .line 58
    .line 59
    and-int/2addr v9, v11

    .line 60
    if-eqz v9, :cond_2

    .line 61
    .line 62
    invoke-virtual/range {v0 .. v5}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 63
    .line 64
    .line 65
    move-result v9

    .line 66
    if-nez v9, :cond_2

    .line 67
    .line 68
    goto/16 :goto_3

    .line 69
    .line 70
    :cond_2
    invoke-static {v11}, Lcom/google/crypto/tink/shaded/protobuf/P;->R(I)I

    .line 71
    .line 72
    .line 73
    move-result v9

    .line 74
    const/16 v12, 0x9

    .line 75
    .line 76
    if-eq v9, v12, :cond_9

    .line 77
    .line 78
    const/16 v12, 0x11

    .line 79
    .line 80
    if-eq v9, v12, :cond_9

    .line 81
    .line 82
    const/16 v5, 0x1b

    .line 83
    .line 84
    if-eq v9, v5, :cond_6

    .line 85
    .line 86
    const/16 v5, 0x3c

    .line 87
    .line 88
    if-eq v9, v5, :cond_5

    .line 89
    .line 90
    const/16 v5, 0x44

    .line 91
    .line 92
    if-eq v9, v5, :cond_5

    .line 93
    .line 94
    const/16 v5, 0x31

    .line 95
    .line 96
    if-eq v9, v5, :cond_6

    .line 97
    .line 98
    const/16 v5, 0x32

    .line 99
    .line 100
    if-eq v9, v5, :cond_3

    .line 101
    .line 102
    goto/16 :goto_4

    .line 103
    .line 104
    :cond_3
    and-int v5, v11, v6

    .line 105
    .line 106
    int-to-long v9, v5

    .line 107
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 108
    .line 109
    invoke-virtual {v5, v9, v10, v1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    iget-object v9, v0, Lcom/google/crypto/tink/shaded/protobuf/P;->m:Lcom/google/crypto/tink/shaded/protobuf/K;

    .line 114
    .line 115
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 116
    .line 117
    .line 118
    check-cast v5, Lcom/google/crypto/tink/shaded/protobuf/J;

    .line 119
    .line 120
    invoke-virtual {v5}, Ljava/util/HashMap;->isEmpty()Z

    .line 121
    .line 122
    .line 123
    move-result v5

    .line 124
    if-eqz v5, :cond_4

    .line 125
    .line 126
    goto :goto_4

    .line 127
    :cond_4
    invoke-virtual {v0, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->o(I)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-static {v1}, LE1/j;->n(Ljava/lang/Object;)V

    .line 132
    .line 133
    .line 134
    const/4 v1, 0x0

    .line 135
    throw v1

    .line 136
    :cond_5
    invoke-virtual {v0, v1, v10, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 137
    .line 138
    .line 139
    move-result v5

    .line 140
    if-eqz v5, :cond_a

    .line 141
    .line 142
    invoke-virtual {v0, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    and-int v5, v11, v6

    .line 147
    .line 148
    int-to-long v9, v5

    .line 149
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 150
    .line 151
    invoke-virtual {v5, v9, v10, v1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v5

    .line 155
    invoke-interface {v2, v5}, Lcom/google/crypto/tink/shaded/protobuf/Y;->c(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v2

    .line 159
    if-nez v2, :cond_a

    .line 160
    .line 161
    goto :goto_3

    .line 162
    :cond_6
    and-int v5, v11, v6

    .line 163
    .line 164
    int-to-long v9, v5

    .line 165
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 166
    .line 167
    invoke-virtual {v5, v9, v10, v1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v5

    .line 171
    check-cast v5, Ljava/util/List;

    .line 172
    .line 173
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    .line 174
    .line 175
    .line 176
    move-result v9

    .line 177
    if-eqz v9, :cond_7

    .line 178
    .line 179
    goto :goto_4

    .line 180
    :cond_7
    invoke-virtual {v0, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    move v9, v7

    .line 185
    :goto_2
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 186
    .line 187
    .line 188
    move-result v10

    .line 189
    if-ge v9, v10, :cond_a

    .line 190
    .line 191
    invoke-interface {v5, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object v10

    .line 195
    invoke-interface {v2, v10}, Lcom/google/crypto/tink/shaded/protobuf/Y;->c(Ljava/lang/Object;)Z

    .line 196
    .line 197
    .line 198
    move-result v10

    .line 199
    if-nez v10, :cond_8

    .line 200
    .line 201
    goto :goto_3

    .line 202
    :cond_8
    add-int/lit8 v9, v9, 0x1

    .line 203
    .line 204
    goto :goto_2

    .line 205
    :cond_9
    invoke-virtual/range {v0 .. v5}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 206
    .line 207
    .line 208
    move-result v5

    .line 209
    if-eqz v5, :cond_a

    .line 210
    .line 211
    invoke-virtual {v0, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    and-int v5, v11, v6

    .line 216
    .line 217
    int-to-long v9, v5

    .line 218
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 219
    .line 220
    invoke-virtual {v5, v9, v10, v1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    move-result-object v5

    .line 224
    invoke-interface {v2, v5}, Lcom/google/crypto/tink/shaded/protobuf/Y;->c(Ljava/lang/Object;)Z

    .line 225
    .line 226
    .line 227
    move-result v2

    .line 228
    if-nez v2, :cond_a

    .line 229
    .line 230
    :goto_3
    return v7

    .line 231
    :cond_a
    :goto_4
    add-int/lit8 v8, v8, 0x1

    .line 232
    .line 233
    move v2, v3

    .line 234
    move v3, v4

    .line 235
    goto/16 :goto_0

    .line 236
    .line 237
    :cond_b
    return v5
.end method

.method public final d()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->j:Lcom/google/crypto/tink/shaded/protobuf/S;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->e:Lcom/google/crypto/tink/shaded/protobuf/a;

    .line 7
    .line 8
    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/google/crypto/tink/shaded/protobuf/w;->s()Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    return-object v0
.end method

.method public final e(Lcom/google/crypto/tink/shaded/protobuf/w;)I
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    sget-object v6, Lcom/google/crypto/tink/shaded/protobuf/P;->o:Lsun/misc/Unsafe;

    .line 6
    .line 7
    const/4 v7, 0x0

    .line 8
    const v8, 0xfffff

    .line 9
    .line 10
    .line 11
    move v2, v7

    .line 12
    move v4, v2

    .line 13
    move v9, v4

    .line 14
    move v3, v8

    .line 15
    :goto_0
    iget-object v5, v0, Lcom/google/crypto/tink/shaded/protobuf/P;->a:[I

    .line 16
    .line 17
    array-length v10, v5

    .line 18
    if-ge v2, v10, :cond_1c

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->S(I)I

    .line 21
    .line 22
    .line 23
    move-result v10

    .line 24
    invoke-static {v10}, Lcom/google/crypto/tink/shaded/protobuf/P;->R(I)I

    .line 25
    .line 26
    .line 27
    move-result v11

    .line 28
    aget v12, v5, v2

    .line 29
    .line 30
    add-int/lit8 v13, v2, 0x2

    .line 31
    .line 32
    aget v5, v5, v13

    .line 33
    .line 34
    and-int v13, v5, v8

    .line 35
    .line 36
    const/16 v14, 0x11

    .line 37
    .line 38
    const/4 v15, 0x1

    .line 39
    if-gt v11, v14, :cond_2

    .line 40
    .line 41
    if-eq v13, v3, :cond_1

    .line 42
    .line 43
    if-ne v13, v8, :cond_0

    .line 44
    .line 45
    move v4, v7

    .line 46
    goto :goto_1

    .line 47
    :cond_0
    int-to-long v3, v13

    .line 48
    invoke-virtual {v6, v1, v3, v4}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    move v4, v3

    .line 53
    :goto_1
    move v3, v13

    .line 54
    :cond_1
    ushr-int/lit8 v5, v5, 0x14

    .line 55
    .line 56
    shl-int v5, v15, v5

    .line 57
    .line 58
    goto :goto_2

    .line 59
    :cond_2
    move v5, v7

    .line 60
    :goto_2
    and-int/2addr v10, v8

    .line 61
    int-to-long v13, v10

    .line 62
    sget-object v10, Lcom/google/crypto/tink/shaded/protobuf/r;->f:Lcom/google/crypto/tink/shaded/protobuf/r;

    .line 63
    .line 64
    iget v10, v10, Lcom/google/crypto/tink/shaded/protobuf/r;->e:I

    .line 65
    .line 66
    if-lt v11, v10, :cond_3

    .line 67
    .line 68
    sget-object v10, Lcom/google/crypto/tink/shaded/protobuf/r;->g:Lcom/google/crypto/tink/shaded/protobuf/r;

    .line 69
    .line 70
    iget v10, v10, Lcom/google/crypto/tink/shaded/protobuf/r;->e:I

    .line 71
    .line 72
    :cond_3
    packed-switch v11, :pswitch_data_0

    .line 73
    .line 74
    .line 75
    goto/16 :goto_20

    .line 76
    .line 77
    :pswitch_0
    invoke-virtual {v0, v1, v12, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    if-eqz v5, :cond_1b

    .line 82
    .line 83
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    check-cast v5, Lcom/google/crypto/tink/shaded/protobuf/a;

    .line 88
    .line 89
    invoke-virtual {v0, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 90
    .line 91
    .line 92
    move-result-object v10

    .line 93
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 94
    .line 95
    .line 96
    move-result v11

    .line 97
    mul-int/lit8 v11, v11, 0x2

    .line 98
    .line 99
    invoke-virtual {v5, v10}, Lcom/google/crypto/tink/shaded/protobuf/a;->b(Lcom/google/crypto/tink/shaded/protobuf/Y;)I

    .line 100
    .line 101
    .line 102
    move-result v5

    .line 103
    :goto_3
    add-int/2addr v5, v11

    .line 104
    :goto_4
    add-int/2addr v9, v5

    .line 105
    goto/16 :goto_20

    .line 106
    .line 107
    :pswitch_1
    invoke-virtual {v0, v1, v12, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 108
    .line 109
    .line 110
    move-result v5

    .line 111
    if-eqz v5, :cond_1b

    .line 112
    .line 113
    invoke-static {v13, v14, v1}, Lcom/google/crypto/tink/shaded/protobuf/P;->C(JLjava/lang/Object;)J

    .line 114
    .line 115
    .line 116
    move-result-wide v10

    .line 117
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 118
    .line 119
    .line 120
    move-result v5

    .line 121
    invoke-static {v10, v11}, Lcom/google/crypto/tink/shaded/protobuf/l;->K(J)I

    .line 122
    .line 123
    .line 124
    move-result v10

    .line 125
    :goto_5
    add-int/2addr v10, v5

    .line 126
    :goto_6
    add-int/2addr v9, v10

    .line 127
    goto/16 :goto_20

    .line 128
    .line 129
    :pswitch_2
    invoke-virtual {v0, v1, v12, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 130
    .line 131
    .line 132
    move-result v5

    .line 133
    if-eqz v5, :cond_1b

    .line 134
    .line 135
    invoke-static {v13, v14, v1}, Lcom/google/crypto/tink/shaded/protobuf/P;->B(JLjava/lang/Object;)I

    .line 136
    .line 137
    .line 138
    move-result v5

    .line 139
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 140
    .line 141
    .line 142
    move-result v10

    .line 143
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/l;->J(I)I

    .line 144
    .line 145
    .line 146
    move-result v5

    .line 147
    :goto_7
    add-int/2addr v5, v10

    .line 148
    goto :goto_4

    .line 149
    :pswitch_3
    invoke-virtual {v0, v1, v12, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 150
    .line 151
    .line 152
    move-result v5

    .line 153
    if-eqz v5, :cond_1b

    .line 154
    .line 155
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 156
    .line 157
    .line 158
    move-result v5

    .line 159
    :goto_8
    add-int/lit8 v5, v5, 0x8

    .line 160
    .line 161
    goto :goto_4

    .line 162
    :pswitch_4
    invoke-virtual {v0, v1, v12, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 163
    .line 164
    .line 165
    move-result v5

    .line 166
    if-eqz v5, :cond_1b

    .line 167
    .line 168
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 169
    .line 170
    .line 171
    move-result v5

    .line 172
    :goto_9
    add-int/lit8 v5, v5, 0x4

    .line 173
    .line 174
    goto :goto_4

    .line 175
    :pswitch_5
    invoke-virtual {v0, v1, v12, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 176
    .line 177
    .line 178
    move-result v5

    .line 179
    if-eqz v5, :cond_1b

    .line 180
    .line 181
    invoke-static {v13, v14, v1}, Lcom/google/crypto/tink/shaded/protobuf/P;->B(JLjava/lang/Object;)I

    .line 182
    .line 183
    .line 184
    move-result v5

    .line 185
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 186
    .line 187
    .line 188
    move-result v10

    .line 189
    int-to-long v11, v5

    .line 190
    invoke-static {v11, v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->O(J)I

    .line 191
    .line 192
    .line 193
    move-result v5

    .line 194
    goto :goto_7

    .line 195
    :pswitch_6
    invoke-virtual {v0, v1, v12, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 196
    .line 197
    .line 198
    move-result v5

    .line 199
    if-eqz v5, :cond_1b

    .line 200
    .line 201
    invoke-static {v13, v14, v1}, Lcom/google/crypto/tink/shaded/protobuf/P;->B(JLjava/lang/Object;)I

    .line 202
    .line 203
    .line 204
    move-result v5

    .line 205
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 206
    .line 207
    .line 208
    move-result v10

    .line 209
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 210
    .line 211
    .line 212
    move-result v5

    .line 213
    goto :goto_7

    .line 214
    :pswitch_7
    invoke-virtual {v0, v1, v12, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 215
    .line 216
    .line 217
    move-result v5

    .line 218
    if-eqz v5, :cond_1b

    .line 219
    .line 220
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    move-result-object v5

    .line 224
    check-cast v5, Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 225
    .line 226
    invoke-static {v12, v5}, Lcom/google/crypto/tink/shaded/protobuf/l;->I(ILcom/google/crypto/tink/shaded/protobuf/i;)I

    .line 227
    .line 228
    .line 229
    move-result v5

    .line 230
    goto :goto_4

    .line 231
    :pswitch_8
    invoke-virtual {v0, v1, v12, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 232
    .line 233
    .line 234
    move-result v5

    .line 235
    if-eqz v5, :cond_1b

    .line 236
    .line 237
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    move-result-object v5

    .line 241
    invoke-virtual {v0, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 242
    .line 243
    .line 244
    move-result-object v10

    .line 245
    sget-object v11, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 246
    .line 247
    check-cast v5, Lcom/google/crypto/tink/shaded/protobuf/a;

    .line 248
    .line 249
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 250
    .line 251
    .line 252
    move-result v11

    .line 253
    invoke-virtual {v5, v10}, Lcom/google/crypto/tink/shaded/protobuf/a;->b(Lcom/google/crypto/tink/shaded/protobuf/Y;)I

    .line 254
    .line 255
    .line 256
    move-result v5

    .line 257
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 258
    .line 259
    .line 260
    move-result v10

    .line 261
    :goto_a
    add-int/2addr v10, v5

    .line 262
    add-int/2addr v10, v11

    .line 263
    goto/16 :goto_6

    .line 264
    .line 265
    :pswitch_9
    invoke-virtual {v0, v1, v12, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 266
    .line 267
    .line 268
    move-result v5

    .line 269
    if-eqz v5, :cond_1b

    .line 270
    .line 271
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 272
    .line 273
    .line 274
    move-result-object v5

    .line 275
    instance-of v10, v5, Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 276
    .line 277
    if-eqz v10, :cond_4

    .line 278
    .line 279
    check-cast v5, Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 280
    .line 281
    invoke-static {v12, v5}, Lcom/google/crypto/tink/shaded/protobuf/l;->I(ILcom/google/crypto/tink/shaded/protobuf/i;)I

    .line 282
    .line 283
    .line 284
    move-result v5

    .line 285
    :goto_b
    add-int/2addr v5, v9

    .line 286
    move v9, v5

    .line 287
    goto/16 :goto_20

    .line 288
    .line 289
    :cond_4
    check-cast v5, Ljava/lang/String;

    .line 290
    .line 291
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 292
    .line 293
    .line 294
    move-result v10

    .line 295
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/l;->L(Ljava/lang/String;)I

    .line 296
    .line 297
    .line 298
    move-result v5

    .line 299
    add-int/2addr v5, v10

    .line 300
    goto :goto_b

    .line 301
    :pswitch_a
    invoke-virtual {v0, v1, v12, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 302
    .line 303
    .line 304
    move-result v5

    .line 305
    if-eqz v5, :cond_1b

    .line 306
    .line 307
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 308
    .line 309
    .line 310
    move-result v5

    .line 311
    add-int/2addr v5, v15

    .line 312
    goto/16 :goto_4

    .line 313
    .line 314
    :pswitch_b
    invoke-virtual {v0, v1, v12, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 315
    .line 316
    .line 317
    move-result v5

    .line 318
    if-eqz v5, :cond_1b

    .line 319
    .line 320
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 321
    .line 322
    .line 323
    move-result v5

    .line 324
    goto/16 :goto_9

    .line 325
    .line 326
    :pswitch_c
    invoke-virtual {v0, v1, v12, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 327
    .line 328
    .line 329
    move-result v5

    .line 330
    if-eqz v5, :cond_1b

    .line 331
    .line 332
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 333
    .line 334
    .line 335
    move-result v5

    .line 336
    goto/16 :goto_8

    .line 337
    .line 338
    :pswitch_d
    invoke-virtual {v0, v1, v12, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 339
    .line 340
    .line 341
    move-result v5

    .line 342
    if-eqz v5, :cond_1b

    .line 343
    .line 344
    invoke-static {v13, v14, v1}, Lcom/google/crypto/tink/shaded/protobuf/P;->B(JLjava/lang/Object;)I

    .line 345
    .line 346
    .line 347
    move-result v5

    .line 348
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 349
    .line 350
    .line 351
    move-result v10

    .line 352
    int-to-long v11, v5

    .line 353
    invoke-static {v11, v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->O(J)I

    .line 354
    .line 355
    .line 356
    move-result v5

    .line 357
    goto/16 :goto_7

    .line 358
    .line 359
    :pswitch_e
    invoke-virtual {v0, v1, v12, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 360
    .line 361
    .line 362
    move-result v5

    .line 363
    if-eqz v5, :cond_1b

    .line 364
    .line 365
    invoke-static {v13, v14, v1}, Lcom/google/crypto/tink/shaded/protobuf/P;->C(JLjava/lang/Object;)J

    .line 366
    .line 367
    .line 368
    move-result-wide v10

    .line 369
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 370
    .line 371
    .line 372
    move-result v5

    .line 373
    invoke-static {v10, v11}, Lcom/google/crypto/tink/shaded/protobuf/l;->O(J)I

    .line 374
    .line 375
    .line 376
    move-result v10

    .line 377
    goto/16 :goto_5

    .line 378
    .line 379
    :pswitch_f
    invoke-virtual {v0, v1, v12, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 380
    .line 381
    .line 382
    move-result v5

    .line 383
    if-eqz v5, :cond_1b

    .line 384
    .line 385
    invoke-static {v13, v14, v1}, Lcom/google/crypto/tink/shaded/protobuf/P;->C(JLjava/lang/Object;)J

    .line 386
    .line 387
    .line 388
    move-result-wide v10

    .line 389
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 390
    .line 391
    .line 392
    move-result v5

    .line 393
    invoke-static {v10, v11}, Lcom/google/crypto/tink/shaded/protobuf/l;->O(J)I

    .line 394
    .line 395
    .line 396
    move-result v10

    .line 397
    goto/16 :goto_5

    .line 398
    .line 399
    :pswitch_10
    invoke-virtual {v0, v1, v12, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 400
    .line 401
    .line 402
    move-result v5

    .line 403
    if-eqz v5, :cond_1b

    .line 404
    .line 405
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 406
    .line 407
    .line 408
    move-result v5

    .line 409
    goto/16 :goto_9

    .line 410
    .line 411
    :pswitch_11
    invoke-virtual {v0, v1, v12, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 412
    .line 413
    .line 414
    move-result v5

    .line 415
    if-eqz v5, :cond_1b

    .line 416
    .line 417
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 418
    .line 419
    .line 420
    move-result v5

    .line 421
    goto/16 :goto_8

    .line 422
    .line 423
    :pswitch_12
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 424
    .line 425
    .line 426
    move-result-object v5

    .line 427
    invoke-virtual {v0, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->o(I)Ljava/lang/Object;

    .line 428
    .line 429
    .line 430
    move-result-object v10

    .line 431
    iget-object v11, v0, Lcom/google/crypto/tink/shaded/protobuf/P;->m:Lcom/google/crypto/tink/shaded/protobuf/K;

    .line 432
    .line 433
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 434
    .line 435
    .line 436
    check-cast v5, Lcom/google/crypto/tink/shaded/protobuf/J;

    .line 437
    .line 438
    if-nez v10, :cond_7

    .line 439
    .line 440
    invoke-virtual {v5}, Ljava/util/AbstractMap;->isEmpty()Z

    .line 441
    .line 442
    .line 443
    move-result v10

    .line 444
    if-eqz v10, :cond_5

    .line 445
    .line 446
    goto/16 :goto_20

    .line 447
    .line 448
    :cond_5
    invoke-virtual {v5}, Lcom/google/crypto/tink/shaded/protobuf/J;->entrySet()Ljava/util/Set;

    .line 449
    .line 450
    .line 451
    move-result-object v5

    .line 452
    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 453
    .line 454
    .line 455
    move-result-object v5

    .line 456
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 457
    .line 458
    .line 459
    move-result v10

    .line 460
    if-nez v10, :cond_6

    .line 461
    .line 462
    goto/16 :goto_20

    .line 463
    .line 464
    :cond_6
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 465
    .line 466
    .line 467
    move-result-object v1

    .line 468
    check-cast v1, Ljava/util/Map$Entry;

    .line 469
    .line 470
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 471
    .line 472
    .line 473
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 474
    .line 475
    .line 476
    const/4 v1, 0x0

    .line 477
    throw v1

    .line 478
    :cond_7
    new-instance v1, Ljava/lang/ClassCastException;

    .line 479
    .line 480
    invoke-direct {v1}, Ljava/lang/ClassCastException;-><init>()V

    .line 481
    .line 482
    .line 483
    throw v1

    .line 484
    :pswitch_13
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 485
    .line 486
    .line 487
    move-result-object v5

    .line 488
    check-cast v5, Ljava/util/List;

    .line 489
    .line 490
    invoke-virtual {v0, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 491
    .line 492
    .line 493
    move-result-object v10

    .line 494
    sget-object v11, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 495
    .line 496
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 497
    .line 498
    .line 499
    move-result v11

    .line 500
    if-nez v11, :cond_8

    .line 501
    .line 502
    move v14, v7

    .line 503
    goto :goto_d

    .line 504
    :cond_8
    move v13, v7

    .line 505
    move v14, v13

    .line 506
    :goto_c
    if-ge v13, v11, :cond_9

    .line 507
    .line 508
    invoke-interface {v5, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 509
    .line 510
    .line 511
    move-result-object v15

    .line 512
    check-cast v15, Lcom/google/crypto/tink/shaded/protobuf/a;

    .line 513
    .line 514
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 515
    .line 516
    .line 517
    move-result v16

    .line 518
    mul-int/lit8 v16, v16, 0x2

    .line 519
    .line 520
    invoke-virtual {v15, v10}, Lcom/google/crypto/tink/shaded/protobuf/a;->b(Lcom/google/crypto/tink/shaded/protobuf/Y;)I

    .line 521
    .line 522
    .line 523
    move-result v15

    .line 524
    add-int v15, v15, v16

    .line 525
    .line 526
    add-int/2addr v14, v15

    .line 527
    add-int/lit8 v13, v13, 0x1

    .line 528
    .line 529
    goto :goto_c

    .line 530
    :cond_9
    :goto_d
    add-int/2addr v9, v14

    .line 531
    goto/16 :goto_20

    .line 532
    .line 533
    :pswitch_14
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 534
    .line 535
    .line 536
    move-result-object v5

    .line 537
    check-cast v5, Ljava/util/List;

    .line 538
    .line 539
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/Z;->g(Ljava/util/List;)I

    .line 540
    .line 541
    .line 542
    move-result v5

    .line 543
    if-lez v5, :cond_1b

    .line 544
    .line 545
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 546
    .line 547
    .line 548
    move-result v10

    .line 549
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 550
    .line 551
    .line 552
    move-result v11

    .line 553
    :goto_e
    add-int/2addr v11, v10

    .line 554
    add-int/2addr v11, v5

    .line 555
    add-int/2addr v9, v11

    .line 556
    goto/16 :goto_20

    .line 557
    .line 558
    :pswitch_15
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 559
    .line 560
    .line 561
    move-result-object v5

    .line 562
    check-cast v5, Ljava/util/List;

    .line 563
    .line 564
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/Z;->f(Ljava/util/List;)I

    .line 565
    .line 566
    .line 567
    move-result v5

    .line 568
    if-lez v5, :cond_1b

    .line 569
    .line 570
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 571
    .line 572
    .line 573
    move-result v10

    .line 574
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 575
    .line 576
    .line 577
    move-result v11

    .line 578
    goto :goto_e

    .line 579
    :pswitch_16
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 580
    .line 581
    .line 582
    move-result-object v5

    .line 583
    check-cast v5, Ljava/util/List;

    .line 584
    .line 585
    sget-object v10, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 586
    .line 587
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 588
    .line 589
    .line 590
    move-result v5

    .line 591
    mul-int/lit8 v5, v5, 0x8

    .line 592
    .line 593
    if-lez v5, :cond_1b

    .line 594
    .line 595
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 596
    .line 597
    .line 598
    move-result v10

    .line 599
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 600
    .line 601
    .line 602
    move-result v11

    .line 603
    goto :goto_e

    .line 604
    :pswitch_17
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 605
    .line 606
    .line 607
    move-result-object v5

    .line 608
    check-cast v5, Ljava/util/List;

    .line 609
    .line 610
    sget-object v10, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 611
    .line 612
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 613
    .line 614
    .line 615
    move-result v5

    .line 616
    mul-int/lit8 v5, v5, 0x4

    .line 617
    .line 618
    if-lez v5, :cond_1b

    .line 619
    .line 620
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 621
    .line 622
    .line 623
    move-result v10

    .line 624
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 625
    .line 626
    .line 627
    move-result v11

    .line 628
    goto :goto_e

    .line 629
    :pswitch_18
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 630
    .line 631
    .line 632
    move-result-object v5

    .line 633
    check-cast v5, Ljava/util/List;

    .line 634
    .line 635
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/Z;->a(Ljava/util/List;)I

    .line 636
    .line 637
    .line 638
    move-result v5

    .line 639
    if-lez v5, :cond_1b

    .line 640
    .line 641
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 642
    .line 643
    .line 644
    move-result v10

    .line 645
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 646
    .line 647
    .line 648
    move-result v11

    .line 649
    goto :goto_e

    .line 650
    :pswitch_19
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 651
    .line 652
    .line 653
    move-result-object v5

    .line 654
    check-cast v5, Ljava/util/List;

    .line 655
    .line 656
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/Z;->h(Ljava/util/List;)I

    .line 657
    .line 658
    .line 659
    move-result v5

    .line 660
    if-lez v5, :cond_1b

    .line 661
    .line 662
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 663
    .line 664
    .line 665
    move-result v10

    .line 666
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 667
    .line 668
    .line 669
    move-result v11

    .line 670
    goto :goto_e

    .line 671
    :pswitch_1a
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 672
    .line 673
    .line 674
    move-result-object v5

    .line 675
    check-cast v5, Ljava/util/List;

    .line 676
    .line 677
    sget-object v10, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 678
    .line 679
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 680
    .line 681
    .line 682
    move-result v5

    .line 683
    if-lez v5, :cond_1b

    .line 684
    .line 685
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 686
    .line 687
    .line 688
    move-result v10

    .line 689
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 690
    .line 691
    .line 692
    move-result v11

    .line 693
    goto/16 :goto_e

    .line 694
    .line 695
    :pswitch_1b
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 696
    .line 697
    .line 698
    move-result-object v5

    .line 699
    check-cast v5, Ljava/util/List;

    .line 700
    .line 701
    sget-object v10, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 702
    .line 703
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 704
    .line 705
    .line 706
    move-result v5

    .line 707
    mul-int/lit8 v5, v5, 0x4

    .line 708
    .line 709
    if-lez v5, :cond_1b

    .line 710
    .line 711
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 712
    .line 713
    .line 714
    move-result v10

    .line 715
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 716
    .line 717
    .line 718
    move-result v11

    .line 719
    goto/16 :goto_e

    .line 720
    .line 721
    :pswitch_1c
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 722
    .line 723
    .line 724
    move-result-object v5

    .line 725
    check-cast v5, Ljava/util/List;

    .line 726
    .line 727
    sget-object v10, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 728
    .line 729
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 730
    .line 731
    .line 732
    move-result v5

    .line 733
    mul-int/lit8 v5, v5, 0x8

    .line 734
    .line 735
    if-lez v5, :cond_1b

    .line 736
    .line 737
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 738
    .line 739
    .line 740
    move-result v10

    .line 741
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 742
    .line 743
    .line 744
    move-result v11

    .line 745
    goto/16 :goto_e

    .line 746
    .line 747
    :pswitch_1d
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 748
    .line 749
    .line 750
    move-result-object v5

    .line 751
    check-cast v5, Ljava/util/List;

    .line 752
    .line 753
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/Z;->d(Ljava/util/List;)I

    .line 754
    .line 755
    .line 756
    move-result v5

    .line 757
    if-lez v5, :cond_1b

    .line 758
    .line 759
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 760
    .line 761
    .line 762
    move-result v10

    .line 763
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 764
    .line 765
    .line 766
    move-result v11

    .line 767
    goto/16 :goto_e

    .line 768
    .line 769
    :pswitch_1e
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 770
    .line 771
    .line 772
    move-result-object v5

    .line 773
    check-cast v5, Ljava/util/List;

    .line 774
    .line 775
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/Z;->i(Ljava/util/List;)I

    .line 776
    .line 777
    .line 778
    move-result v5

    .line 779
    if-lez v5, :cond_1b

    .line 780
    .line 781
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 782
    .line 783
    .line 784
    move-result v10

    .line 785
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 786
    .line 787
    .line 788
    move-result v11

    .line 789
    goto/16 :goto_e

    .line 790
    .line 791
    :pswitch_1f
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 792
    .line 793
    .line 794
    move-result-object v5

    .line 795
    check-cast v5, Ljava/util/List;

    .line 796
    .line 797
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/Z;->e(Ljava/util/List;)I

    .line 798
    .line 799
    .line 800
    move-result v5

    .line 801
    if-lez v5, :cond_1b

    .line 802
    .line 803
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 804
    .line 805
    .line 806
    move-result v10

    .line 807
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 808
    .line 809
    .line 810
    move-result v11

    .line 811
    goto/16 :goto_e

    .line 812
    .line 813
    :pswitch_20
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 814
    .line 815
    .line 816
    move-result-object v5

    .line 817
    check-cast v5, Ljava/util/List;

    .line 818
    .line 819
    sget-object v10, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 820
    .line 821
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 822
    .line 823
    .line 824
    move-result v5

    .line 825
    mul-int/lit8 v5, v5, 0x4

    .line 826
    .line 827
    if-lez v5, :cond_1b

    .line 828
    .line 829
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 830
    .line 831
    .line 832
    move-result v10

    .line 833
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 834
    .line 835
    .line 836
    move-result v11

    .line 837
    goto/16 :goto_e

    .line 838
    .line 839
    :pswitch_21
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 840
    .line 841
    .line 842
    move-result-object v5

    .line 843
    check-cast v5, Ljava/util/List;

    .line 844
    .line 845
    sget-object v10, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 846
    .line 847
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 848
    .line 849
    .line 850
    move-result v5

    .line 851
    mul-int/lit8 v5, v5, 0x8

    .line 852
    .line 853
    if-lez v5, :cond_1b

    .line 854
    .line 855
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 856
    .line 857
    .line 858
    move-result v10

    .line 859
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 860
    .line 861
    .line 862
    move-result v11

    .line 863
    goto/16 :goto_e

    .line 864
    .line 865
    :pswitch_22
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 866
    .line 867
    .line 868
    move-result-object v5

    .line 869
    check-cast v5, Ljava/util/List;

    .line 870
    .line 871
    sget-object v10, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 872
    .line 873
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 874
    .line 875
    .line 876
    move-result v10

    .line 877
    if-nez v10, :cond_a

    .line 878
    .line 879
    :goto_f
    move v11, v7

    .line 880
    goto :goto_11

    .line 881
    :cond_a
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/Z;->g(Ljava/util/List;)I

    .line 882
    .line 883
    .line 884
    move-result v5

    .line 885
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 886
    .line 887
    .line 888
    move-result v11

    .line 889
    :goto_10
    mul-int/2addr v11, v10

    .line 890
    add-int/2addr v11, v5

    .line 891
    :cond_b
    :goto_11
    add-int/2addr v9, v11

    .line 892
    goto/16 :goto_20

    .line 893
    .line 894
    :pswitch_23
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 895
    .line 896
    .line 897
    move-result-object v5

    .line 898
    check-cast v5, Ljava/util/List;

    .line 899
    .line 900
    sget-object v10, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 901
    .line 902
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 903
    .line 904
    .line 905
    move-result v10

    .line 906
    if-nez v10, :cond_c

    .line 907
    .line 908
    goto :goto_f

    .line 909
    :cond_c
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/Z;->f(Ljava/util/List;)I

    .line 910
    .line 911
    .line 912
    move-result v5

    .line 913
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 914
    .line 915
    .line 916
    move-result v11

    .line 917
    goto :goto_10

    .line 918
    :pswitch_24
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 919
    .line 920
    .line 921
    move-result-object v5

    .line 922
    check-cast v5, Ljava/util/List;

    .line 923
    .line 924
    invoke-static {v12, v5}, Lcom/google/crypto/tink/shaded/protobuf/Z;->c(ILjava/util/List;)I

    .line 925
    .line 926
    .line 927
    move-result v5

    .line 928
    goto/16 :goto_4

    .line 929
    .line 930
    :pswitch_25
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 931
    .line 932
    .line 933
    move-result-object v5

    .line 934
    check-cast v5, Ljava/util/List;

    .line 935
    .line 936
    invoke-static {v12, v5}, Lcom/google/crypto/tink/shaded/protobuf/Z;->b(ILjava/util/List;)I

    .line 937
    .line 938
    .line 939
    move-result v5

    .line 940
    goto/16 :goto_4

    .line 941
    .line 942
    :pswitch_26
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 943
    .line 944
    .line 945
    move-result-object v5

    .line 946
    check-cast v5, Ljava/util/List;

    .line 947
    .line 948
    sget-object v10, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 949
    .line 950
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 951
    .line 952
    .line 953
    move-result v10

    .line 954
    if-nez v10, :cond_d

    .line 955
    .line 956
    goto :goto_f

    .line 957
    :cond_d
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/Z;->a(Ljava/util/List;)I

    .line 958
    .line 959
    .line 960
    move-result v5

    .line 961
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 962
    .line 963
    .line 964
    move-result v11

    .line 965
    goto :goto_10

    .line 966
    :pswitch_27
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 967
    .line 968
    .line 969
    move-result-object v5

    .line 970
    check-cast v5, Ljava/util/List;

    .line 971
    .line 972
    sget-object v10, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 973
    .line 974
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 975
    .line 976
    .line 977
    move-result v10

    .line 978
    if-nez v10, :cond_e

    .line 979
    .line 980
    goto :goto_f

    .line 981
    :cond_e
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/Z;->h(Ljava/util/List;)I

    .line 982
    .line 983
    .line 984
    move-result v5

    .line 985
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 986
    .line 987
    .line 988
    move-result v11

    .line 989
    goto :goto_10

    .line 990
    :pswitch_28
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 991
    .line 992
    .line 993
    move-result-object v5

    .line 994
    check-cast v5, Ljava/util/List;

    .line 995
    .line 996
    sget-object v10, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 997
    .line 998
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 999
    .line 1000
    .line 1001
    move-result v10

    .line 1002
    if-nez v10, :cond_f

    .line 1003
    .line 1004
    goto :goto_f

    .line 1005
    :cond_f
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 1006
    .line 1007
    .line 1008
    move-result v11

    .line 1009
    mul-int/2addr v11, v10

    .line 1010
    move v10, v7

    .line 1011
    :goto_12
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 1012
    .line 1013
    .line 1014
    move-result v12

    .line 1015
    if-ge v10, v12, :cond_b

    .line 1016
    .line 1017
    invoke-interface {v5, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1018
    .line 1019
    .line 1020
    move-result-object v12

    .line 1021
    check-cast v12, Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 1022
    .line 1023
    invoke-virtual {v12}, Lcom/google/crypto/tink/shaded/protobuf/i;->size()I

    .line 1024
    .line 1025
    .line 1026
    move-result v12

    .line 1027
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 1028
    .line 1029
    .line 1030
    move-result v13

    .line 1031
    add-int/2addr v13, v12

    .line 1032
    add-int/2addr v11, v13

    .line 1033
    add-int/lit8 v10, v10, 0x1

    .line 1034
    .line 1035
    goto :goto_12

    .line 1036
    :pswitch_29
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1037
    .line 1038
    .line 1039
    move-result-object v5

    .line 1040
    check-cast v5, Ljava/util/List;

    .line 1041
    .line 1042
    invoke-virtual {v0, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 1043
    .line 1044
    .line 1045
    move-result-object v10

    .line 1046
    sget-object v11, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 1047
    .line 1048
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 1049
    .line 1050
    .line 1051
    move-result v11

    .line 1052
    if-nez v11, :cond_10

    .line 1053
    .line 1054
    move v12, v7

    .line 1055
    goto :goto_14

    .line 1056
    :cond_10
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 1057
    .line 1058
    .line 1059
    move-result v12

    .line 1060
    mul-int/2addr v12, v11

    .line 1061
    move v13, v7

    .line 1062
    :goto_13
    if-ge v13, v11, :cond_11

    .line 1063
    .line 1064
    invoke-interface {v5, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1065
    .line 1066
    .line 1067
    move-result-object v14

    .line 1068
    check-cast v14, Lcom/google/crypto/tink/shaded/protobuf/a;

    .line 1069
    .line 1070
    invoke-virtual {v14, v10}, Lcom/google/crypto/tink/shaded/protobuf/a;->b(Lcom/google/crypto/tink/shaded/protobuf/Y;)I

    .line 1071
    .line 1072
    .line 1073
    move-result v14

    .line 1074
    invoke-static {v14}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 1075
    .line 1076
    .line 1077
    move-result v15

    .line 1078
    add-int/2addr v15, v14

    .line 1079
    add-int/2addr v12, v15

    .line 1080
    add-int/lit8 v13, v13, 0x1

    .line 1081
    .line 1082
    goto :goto_13

    .line 1083
    :cond_11
    :goto_14
    add-int/2addr v9, v12

    .line 1084
    goto/16 :goto_20

    .line 1085
    .line 1086
    :pswitch_2a
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1087
    .line 1088
    .line 1089
    move-result-object v5

    .line 1090
    check-cast v5, Ljava/util/List;

    .line 1091
    .line 1092
    sget-object v10, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 1093
    .line 1094
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 1095
    .line 1096
    .line 1097
    move-result v10

    .line 1098
    if-nez v10, :cond_12

    .line 1099
    .line 1100
    goto/16 :goto_f

    .line 1101
    .line 1102
    :cond_12
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 1103
    .line 1104
    .line 1105
    move-result v11

    .line 1106
    mul-int/2addr v11, v10

    .line 1107
    move v12, v7

    .line 1108
    :goto_15
    if-ge v12, v10, :cond_b

    .line 1109
    .line 1110
    invoke-interface {v5, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1111
    .line 1112
    .line 1113
    move-result-object v13

    .line 1114
    instance-of v14, v13, Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 1115
    .line 1116
    if-eqz v14, :cond_13

    .line 1117
    .line 1118
    check-cast v13, Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 1119
    .line 1120
    invoke-virtual {v13}, Lcom/google/crypto/tink/shaded/protobuf/i;->size()I

    .line 1121
    .line 1122
    .line 1123
    move-result v13

    .line 1124
    invoke-static {v13}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 1125
    .line 1126
    .line 1127
    move-result v14

    .line 1128
    add-int/2addr v14, v13

    .line 1129
    add-int/2addr v14, v11

    .line 1130
    move v11, v14

    .line 1131
    goto :goto_16

    .line 1132
    :cond_13
    check-cast v13, Ljava/lang/String;

    .line 1133
    .line 1134
    invoke-static {v13}, Lcom/google/crypto/tink/shaded/protobuf/l;->L(Ljava/lang/String;)I

    .line 1135
    .line 1136
    .line 1137
    move-result v13

    .line 1138
    add-int/2addr v13, v11

    .line 1139
    move v11, v13

    .line 1140
    :goto_16
    add-int/lit8 v12, v12, 0x1

    .line 1141
    .line 1142
    goto :goto_15

    .line 1143
    :pswitch_2b
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1144
    .line 1145
    .line 1146
    move-result-object v5

    .line 1147
    check-cast v5, Ljava/util/List;

    .line 1148
    .line 1149
    sget-object v10, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 1150
    .line 1151
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 1152
    .line 1153
    .line 1154
    move-result v5

    .line 1155
    if-nez v5, :cond_14

    .line 1156
    .line 1157
    move v10, v7

    .line 1158
    goto :goto_17

    .line 1159
    :cond_14
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 1160
    .line 1161
    .line 1162
    move-result v10

    .line 1163
    add-int/2addr v10, v15

    .line 1164
    mul-int/2addr v10, v5

    .line 1165
    :goto_17
    add-int/2addr v9, v10

    .line 1166
    goto/16 :goto_20

    .line 1167
    .line 1168
    :pswitch_2c
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1169
    .line 1170
    .line 1171
    move-result-object v5

    .line 1172
    check-cast v5, Ljava/util/List;

    .line 1173
    .line 1174
    invoke-static {v12, v5}, Lcom/google/crypto/tink/shaded/protobuf/Z;->b(ILjava/util/List;)I

    .line 1175
    .line 1176
    .line 1177
    move-result v5

    .line 1178
    goto/16 :goto_4

    .line 1179
    .line 1180
    :pswitch_2d
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1181
    .line 1182
    .line 1183
    move-result-object v5

    .line 1184
    check-cast v5, Ljava/util/List;

    .line 1185
    .line 1186
    invoke-static {v12, v5}, Lcom/google/crypto/tink/shaded/protobuf/Z;->c(ILjava/util/List;)I

    .line 1187
    .line 1188
    .line 1189
    move-result v5

    .line 1190
    goto/16 :goto_4

    .line 1191
    .line 1192
    :pswitch_2e
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1193
    .line 1194
    .line 1195
    move-result-object v5

    .line 1196
    check-cast v5, Ljava/util/List;

    .line 1197
    .line 1198
    sget-object v10, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 1199
    .line 1200
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 1201
    .line 1202
    .line 1203
    move-result v10

    .line 1204
    if-nez v10, :cond_15

    .line 1205
    .line 1206
    goto/16 :goto_f

    .line 1207
    .line 1208
    :cond_15
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/Z;->d(Ljava/util/List;)I

    .line 1209
    .line 1210
    .line 1211
    move-result v5

    .line 1212
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 1213
    .line 1214
    .line 1215
    move-result v11

    .line 1216
    goto/16 :goto_10

    .line 1217
    .line 1218
    :pswitch_2f
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1219
    .line 1220
    .line 1221
    move-result-object v5

    .line 1222
    check-cast v5, Ljava/util/List;

    .line 1223
    .line 1224
    sget-object v10, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 1225
    .line 1226
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 1227
    .line 1228
    .line 1229
    move-result v10

    .line 1230
    if-nez v10, :cond_16

    .line 1231
    .line 1232
    goto/16 :goto_f

    .line 1233
    .line 1234
    :cond_16
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/Z;->i(Ljava/util/List;)I

    .line 1235
    .line 1236
    .line 1237
    move-result v5

    .line 1238
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 1239
    .line 1240
    .line 1241
    move-result v11

    .line 1242
    goto/16 :goto_10

    .line 1243
    .line 1244
    :pswitch_30
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1245
    .line 1246
    .line 1247
    move-result-object v5

    .line 1248
    check-cast v5, Ljava/util/List;

    .line 1249
    .line 1250
    sget-object v10, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 1251
    .line 1252
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 1253
    .line 1254
    .line 1255
    move-result v10

    .line 1256
    if-nez v10, :cond_17

    .line 1257
    .line 1258
    goto/16 :goto_f

    .line 1259
    .line 1260
    :cond_17
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/Z;->e(Ljava/util/List;)I

    .line 1261
    .line 1262
    .line 1263
    move-result v10

    .line 1264
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 1265
    .line 1266
    .line 1267
    move-result v5

    .line 1268
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 1269
    .line 1270
    .line 1271
    move-result v11

    .line 1272
    mul-int/2addr v11, v5

    .line 1273
    add-int/2addr v11, v10

    .line 1274
    goto/16 :goto_11

    .line 1275
    .line 1276
    :pswitch_31
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1277
    .line 1278
    .line 1279
    move-result-object v5

    .line 1280
    check-cast v5, Ljava/util/List;

    .line 1281
    .line 1282
    invoke-static {v12, v5}, Lcom/google/crypto/tink/shaded/protobuf/Z;->b(ILjava/util/List;)I

    .line 1283
    .line 1284
    .line 1285
    move-result v5

    .line 1286
    goto/16 :goto_4

    .line 1287
    .line 1288
    :pswitch_32
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1289
    .line 1290
    .line 1291
    move-result-object v5

    .line 1292
    check-cast v5, Ljava/util/List;

    .line 1293
    .line 1294
    invoke-static {v12, v5}, Lcom/google/crypto/tink/shaded/protobuf/Z;->c(ILjava/util/List;)I

    .line 1295
    .line 1296
    .line 1297
    move-result v5

    .line 1298
    goto/16 :goto_4

    .line 1299
    .line 1300
    :pswitch_33
    invoke-virtual/range {v0 .. v5}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1301
    .line 1302
    .line 1303
    move-result v5

    .line 1304
    if-eqz v5, :cond_1b

    .line 1305
    .line 1306
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1307
    .line 1308
    .line 1309
    move-result-object v5

    .line 1310
    check-cast v5, Lcom/google/crypto/tink/shaded/protobuf/a;

    .line 1311
    .line 1312
    invoke-virtual {v0, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 1313
    .line 1314
    .line 1315
    move-result-object v10

    .line 1316
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 1317
    .line 1318
    .line 1319
    move-result v11

    .line 1320
    mul-int/lit8 v11, v11, 0x2

    .line 1321
    .line 1322
    invoke-virtual {v5, v10}, Lcom/google/crypto/tink/shaded/protobuf/a;->b(Lcom/google/crypto/tink/shaded/protobuf/Y;)I

    .line 1323
    .line 1324
    .line 1325
    move-result v5

    .line 1326
    goto/16 :goto_3

    .line 1327
    .line 1328
    :pswitch_34
    invoke-virtual/range {v0 .. v5}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1329
    .line 1330
    .line 1331
    move-result v5

    .line 1332
    if-eqz v5, :cond_18

    .line 1333
    .line 1334
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1335
    .line 1336
    .line 1337
    move-result-wide v10

    .line 1338
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 1339
    .line 1340
    .line 1341
    move-result v0

    .line 1342
    invoke-static {v10, v11}, Lcom/google/crypto/tink/shaded/protobuf/l;->K(J)I

    .line 1343
    .line 1344
    .line 1345
    move-result v5

    .line 1346
    :goto_18
    add-int/2addr v5, v0

    .line 1347
    add-int/2addr v9, v5

    .line 1348
    :cond_18
    :goto_19
    move-object/from16 v0, p0

    .line 1349
    .line 1350
    goto/16 :goto_20

    .line 1351
    .line 1352
    :pswitch_35
    invoke-virtual/range {v0 .. v5}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1353
    .line 1354
    .line 1355
    move-result v5

    .line 1356
    if-eqz v5, :cond_18

    .line 1357
    .line 1358
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1359
    .line 1360
    .line 1361
    move-result v0

    .line 1362
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 1363
    .line 1364
    .line 1365
    move-result v5

    .line 1366
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/l;->J(I)I

    .line 1367
    .line 1368
    .line 1369
    move-result v0

    .line 1370
    :goto_1a
    add-int/2addr v0, v5

    .line 1371
    :goto_1b
    add-int/2addr v9, v0

    .line 1372
    goto :goto_19

    .line 1373
    :pswitch_36
    invoke-virtual/range {v0 .. v5}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1374
    .line 1375
    .line 1376
    move-result v5

    .line 1377
    if-eqz v5, :cond_19

    .line 1378
    .line 1379
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 1380
    .line 1381
    .line 1382
    move-result v0

    .line 1383
    :goto_1c
    add-int/lit8 v0, v0, 0x8

    .line 1384
    .line 1385
    :goto_1d
    add-int/2addr v9, v0

    .line 1386
    :cond_19
    move-object/from16 v0, p0

    .line 1387
    .line 1388
    move-object/from16 v1, p1

    .line 1389
    .line 1390
    goto/16 :goto_20

    .line 1391
    .line 1392
    :pswitch_37
    invoke-virtual/range {v0 .. v5}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1393
    .line 1394
    .line 1395
    move-result v5

    .line 1396
    if-eqz v5, :cond_19

    .line 1397
    .line 1398
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 1399
    .line 1400
    .line 1401
    move-result v0

    .line 1402
    :goto_1e
    add-int/lit8 v0, v0, 0x4

    .line 1403
    .line 1404
    goto :goto_1d

    .line 1405
    :pswitch_38
    invoke-virtual/range {v0 .. v5}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1406
    .line 1407
    .line 1408
    move-result v5

    .line 1409
    if-eqz v5, :cond_18

    .line 1410
    .line 1411
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1412
    .line 1413
    .line 1414
    move-result v0

    .line 1415
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 1416
    .line 1417
    .line 1418
    move-result v5

    .line 1419
    int-to-long v10, v0

    .line 1420
    invoke-static {v10, v11}, Lcom/google/crypto/tink/shaded/protobuf/l;->O(J)I

    .line 1421
    .line 1422
    .line 1423
    move-result v0

    .line 1424
    goto :goto_1a

    .line 1425
    :pswitch_39
    invoke-virtual/range {v0 .. v5}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1426
    .line 1427
    .line 1428
    move-result v5

    .line 1429
    if-eqz v5, :cond_18

    .line 1430
    .line 1431
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1432
    .line 1433
    .line 1434
    move-result v0

    .line 1435
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 1436
    .line 1437
    .line 1438
    move-result v5

    .line 1439
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 1440
    .line 1441
    .line 1442
    move-result v0

    .line 1443
    goto :goto_1a

    .line 1444
    :pswitch_3a
    invoke-virtual/range {v0 .. v5}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1445
    .line 1446
    .line 1447
    move-result v5

    .line 1448
    if-eqz v5, :cond_18

    .line 1449
    .line 1450
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1451
    .line 1452
    .line 1453
    move-result-object v0

    .line 1454
    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 1455
    .line 1456
    invoke-static {v12, v0}, Lcom/google/crypto/tink/shaded/protobuf/l;->I(ILcom/google/crypto/tink/shaded/protobuf/i;)I

    .line 1457
    .line 1458
    .line 1459
    move-result v0

    .line 1460
    goto :goto_1b

    .line 1461
    :pswitch_3b
    invoke-virtual/range {v0 .. v5}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1462
    .line 1463
    .line 1464
    move-result v5

    .line 1465
    if-eqz v5, :cond_1b

    .line 1466
    .line 1467
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1468
    .line 1469
    .line 1470
    move-result-object v5

    .line 1471
    invoke-virtual {v0, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 1472
    .line 1473
    .line 1474
    move-result-object v10

    .line 1475
    sget-object v11, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 1476
    .line 1477
    check-cast v5, Lcom/google/crypto/tink/shaded/protobuf/a;

    .line 1478
    .line 1479
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 1480
    .line 1481
    .line 1482
    move-result v11

    .line 1483
    invoke-virtual {v5, v10}, Lcom/google/crypto/tink/shaded/protobuf/a;->b(Lcom/google/crypto/tink/shaded/protobuf/Y;)I

    .line 1484
    .line 1485
    .line 1486
    move-result v5

    .line 1487
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/l;->N(I)I

    .line 1488
    .line 1489
    .line 1490
    move-result v10

    .line 1491
    goto/16 :goto_a

    .line 1492
    .line 1493
    :pswitch_3c
    invoke-virtual/range {v0 .. v5}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1494
    .line 1495
    .line 1496
    move-result v5

    .line 1497
    if-eqz v5, :cond_18

    .line 1498
    .line 1499
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1500
    .line 1501
    .line 1502
    move-result-object v0

    .line 1503
    instance-of v5, v0, Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 1504
    .line 1505
    if-eqz v5, :cond_1a

    .line 1506
    .line 1507
    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 1508
    .line 1509
    invoke-static {v12, v0}, Lcom/google/crypto/tink/shaded/protobuf/l;->I(ILcom/google/crypto/tink/shaded/protobuf/i;)I

    .line 1510
    .line 1511
    .line 1512
    move-result v0

    .line 1513
    :goto_1f
    add-int/2addr v0, v9

    .line 1514
    move v9, v0

    .line 1515
    goto/16 :goto_19

    .line 1516
    .line 1517
    :cond_1a
    check-cast v0, Ljava/lang/String;

    .line 1518
    .line 1519
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 1520
    .line 1521
    .line 1522
    move-result v5

    .line 1523
    invoke-static {v0}, Lcom/google/crypto/tink/shaded/protobuf/l;->L(Ljava/lang/String;)I

    .line 1524
    .line 1525
    .line 1526
    move-result v0

    .line 1527
    add-int/2addr v0, v5

    .line 1528
    goto :goto_1f

    .line 1529
    :pswitch_3d
    invoke-virtual/range {v0 .. v5}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1530
    .line 1531
    .line 1532
    move-result v5

    .line 1533
    if-eqz v5, :cond_19

    .line 1534
    .line 1535
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 1536
    .line 1537
    .line 1538
    move-result v0

    .line 1539
    add-int/2addr v0, v15

    .line 1540
    goto/16 :goto_1d

    .line 1541
    .line 1542
    :pswitch_3e
    invoke-virtual/range {v0 .. v5}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1543
    .line 1544
    .line 1545
    move-result v5

    .line 1546
    if-eqz v5, :cond_19

    .line 1547
    .line 1548
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 1549
    .line 1550
    .line 1551
    move-result v0

    .line 1552
    goto/16 :goto_1e

    .line 1553
    .line 1554
    :pswitch_3f
    invoke-virtual/range {v0 .. v5}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1555
    .line 1556
    .line 1557
    move-result v5

    .line 1558
    if-eqz v5, :cond_19

    .line 1559
    .line 1560
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 1561
    .line 1562
    .line 1563
    move-result v0

    .line 1564
    goto/16 :goto_1c

    .line 1565
    .line 1566
    :pswitch_40
    invoke-virtual/range {v0 .. v5}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1567
    .line 1568
    .line 1569
    move-result v5

    .line 1570
    if-eqz v5, :cond_18

    .line 1571
    .line 1572
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1573
    .line 1574
    .line 1575
    move-result v0

    .line 1576
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 1577
    .line 1578
    .line 1579
    move-result v5

    .line 1580
    int-to-long v10, v0

    .line 1581
    invoke-static {v10, v11}, Lcom/google/crypto/tink/shaded/protobuf/l;->O(J)I

    .line 1582
    .line 1583
    .line 1584
    move-result v0

    .line 1585
    goto/16 :goto_1a

    .line 1586
    .line 1587
    :pswitch_41
    invoke-virtual/range {v0 .. v5}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1588
    .line 1589
    .line 1590
    move-result v5

    .line 1591
    if-eqz v5, :cond_18

    .line 1592
    .line 1593
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1594
    .line 1595
    .line 1596
    move-result-wide v10

    .line 1597
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 1598
    .line 1599
    .line 1600
    move-result v0

    .line 1601
    invoke-static {v10, v11}, Lcom/google/crypto/tink/shaded/protobuf/l;->O(J)I

    .line 1602
    .line 1603
    .line 1604
    move-result v5

    .line 1605
    goto/16 :goto_18

    .line 1606
    .line 1607
    :pswitch_42
    invoke-virtual/range {v0 .. v5}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1608
    .line 1609
    .line 1610
    move-result v5

    .line 1611
    if-eqz v5, :cond_18

    .line 1612
    .line 1613
    invoke-virtual {v6, v1, v13, v14}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1614
    .line 1615
    .line 1616
    move-result-wide v10

    .line 1617
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 1618
    .line 1619
    .line 1620
    move-result v0

    .line 1621
    invoke-static {v10, v11}, Lcom/google/crypto/tink/shaded/protobuf/l;->O(J)I

    .line 1622
    .line 1623
    .line 1624
    move-result v5

    .line 1625
    goto/16 :goto_18

    .line 1626
    .line 1627
    :pswitch_43
    invoke-virtual/range {v0 .. v5}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1628
    .line 1629
    .line 1630
    move-result v5

    .line 1631
    if-eqz v5, :cond_19

    .line 1632
    .line 1633
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 1634
    .line 1635
    .line 1636
    move-result v0

    .line 1637
    goto/16 :goto_1e

    .line 1638
    .line 1639
    :pswitch_44
    invoke-virtual/range {v0 .. v5}, Lcom/google/crypto/tink/shaded/protobuf/P;->r(Ljava/lang/Object;IIII)Z

    .line 1640
    .line 1641
    .line 1642
    move-result v5

    .line 1643
    if-eqz v5, :cond_1b

    .line 1644
    .line 1645
    invoke-static {v12}, Lcom/google/crypto/tink/shaded/protobuf/l;->M(I)I

    .line 1646
    .line 1647
    .line 1648
    move-result v5

    .line 1649
    goto/16 :goto_8

    .line 1650
    .line 1651
    :cond_1b
    :goto_20
    add-int/lit8 v2, v2, 0x3

    .line 1652
    .line 1653
    goto/16 :goto_0

    .line 1654
    .line 1655
    :cond_1c
    iget-object v2, v0, Lcom/google/crypto/tink/shaded/protobuf/P;->l:Lcom/google/crypto/tink/shaded/protobuf/c0;

    .line 1656
    .line 1657
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1658
    .line 1659
    .line 1660
    iget-object v1, v1, Lcom/google/crypto/tink/shaded/protobuf/w;->unknownFields:Lcom/google/crypto/tink/shaded/protobuf/b0;

    .line 1661
    .line 1662
    invoke-virtual {v1}, Lcom/google/crypto/tink/shaded/protobuf/b0;->b()I

    .line 1663
    .line 1664
    .line 1665
    move-result v1

    .line 1666
    add-int/2addr v1, v9

    .line 1667
    return v1

    .line 1668
    nop

    .line 1669
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
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

.method public final f(Ljava/lang/Object;[BIILcom/google/crypto/tink/shaded/protobuf/d;)V
    .locals 7

    .line 1
    const/4 v5, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move-object v6, p5

    .line 8
    invoke-virtual/range {v0 .. v6}, Lcom/google/crypto/tink/shaded/protobuf/P;->E(Ljava/lang/Object;[BIIILcom/google/crypto/tink/shaded/protobuf/d;)I

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final g(Lcom/google/crypto/tink/shaded/protobuf/w;Lcom/google/crypto/tink/shaded/protobuf/w;)Z
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->a:[I

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x0

    .line 5
    move v3, v2

    .line 6
    :goto_0
    const/4 v4, 0x1

    .line 7
    if-ge v3, v1, :cond_2

    .line 8
    .line 9
    invoke-virtual {p0, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->S(I)I

    .line 10
    .line 11
    .line 12
    move-result v5

    .line 13
    const v6, 0xfffff

    .line 14
    .line 15
    .line 16
    and-int v7, v5, v6

    .line 17
    .line 18
    int-to-long v7, v7

    .line 19
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/P;->R(I)I

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    packed-switch v5, :pswitch_data_0

    .line 24
    .line 25
    .line 26
    goto/16 :goto_1

    .line 27
    .line 28
    :pswitch_0
    add-int/lit8 v5, v3, 0x2

    .line 29
    .line 30
    aget v5, v0, v5

    .line 31
    .line 32
    and-int/2addr v5, v6

    .line 33
    int-to-long v5, v5

    .line 34
    sget-object v9, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 35
    .line 36
    invoke-virtual {v9, v5, v6, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 37
    .line 38
    .line 39
    move-result v10

    .line 40
    invoke-virtual {v9, v5, v6, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    if-ne v10, v5, :cond_0

    .line 45
    .line 46
    invoke-virtual {v9, v7, v8, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    invoke-virtual {v9, v7, v8, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    invoke-static {v5, v6}, Lcom/google/crypto/tink/shaded/protobuf/Z;->l(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    if-eqz v5, :cond_0

    .line 59
    .line 60
    goto/16 :goto_1

    .line 61
    .line 62
    :cond_0
    move v4, v2

    .line 63
    goto/16 :goto_1

    .line 64
    .line 65
    :pswitch_1
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 66
    .line 67
    invoke-virtual {v4, v7, v8, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    invoke-virtual {v4, v7, v8, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-static {v5, v4}, Lcom/google/crypto/tink/shaded/protobuf/Z;->l(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    goto/16 :goto_1

    .line 80
    .line 81
    :pswitch_2
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 82
    .line 83
    invoke-virtual {v4, v7, v8, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    invoke-virtual {v4, v7, v8, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    invoke-static {v5, v4}, Lcom/google/crypto/tink/shaded/protobuf/Z;->l(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    goto/16 :goto_1

    .line 96
    .line 97
    :pswitch_3
    invoke-virtual {p0, p1, p2, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->k(Lcom/google/crypto/tink/shaded/protobuf/w;Lcom/google/crypto/tink/shaded/protobuf/w;I)Z

    .line 98
    .line 99
    .line 100
    move-result v5

    .line 101
    if-eqz v5, :cond_0

    .line 102
    .line 103
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 104
    .line 105
    invoke-virtual {v5, v7, v8, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v6

    .line 109
    invoke-virtual {v5, v7, v8, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    invoke-static {v6, v5}, Lcom/google/crypto/tink/shaded/protobuf/Z;->l(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result v5

    .line 117
    if-eqz v5, :cond_0

    .line 118
    .line 119
    goto/16 :goto_1

    .line 120
    .line 121
    :pswitch_4
    invoke-virtual {p0, p1, p2, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->k(Lcom/google/crypto/tink/shaded/protobuf/w;Lcom/google/crypto/tink/shaded/protobuf/w;I)Z

    .line 122
    .line 123
    .line 124
    move-result v5

    .line 125
    if-eqz v5, :cond_0

    .line 126
    .line 127
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 128
    .line 129
    invoke-virtual {v5, v7, v8, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->h(JLjava/lang/Object;)J

    .line 130
    .line 131
    .line 132
    move-result-wide v9

    .line 133
    invoke-virtual {v5, v7, v8, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->h(JLjava/lang/Object;)J

    .line 134
    .line 135
    .line 136
    move-result-wide v5

    .line 137
    cmp-long v5, v9, v5

    .line 138
    .line 139
    if-nez v5, :cond_0

    .line 140
    .line 141
    goto/16 :goto_1

    .line 142
    .line 143
    :pswitch_5
    invoke-virtual {p0, p1, p2, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->k(Lcom/google/crypto/tink/shaded/protobuf/w;Lcom/google/crypto/tink/shaded/protobuf/w;I)Z

    .line 144
    .line 145
    .line 146
    move-result v5

    .line 147
    if-eqz v5, :cond_0

    .line 148
    .line 149
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 150
    .line 151
    invoke-virtual {v5, v7, v8, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 152
    .line 153
    .line 154
    move-result v6

    .line 155
    invoke-virtual {v5, v7, v8, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 156
    .line 157
    .line 158
    move-result v5

    .line 159
    if-ne v6, v5, :cond_0

    .line 160
    .line 161
    goto/16 :goto_1

    .line 162
    .line 163
    :pswitch_6
    invoke-virtual {p0, p1, p2, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->k(Lcom/google/crypto/tink/shaded/protobuf/w;Lcom/google/crypto/tink/shaded/protobuf/w;I)Z

    .line 164
    .line 165
    .line 166
    move-result v5

    .line 167
    if-eqz v5, :cond_0

    .line 168
    .line 169
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 170
    .line 171
    invoke-virtual {v5, v7, v8, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->h(JLjava/lang/Object;)J

    .line 172
    .line 173
    .line 174
    move-result-wide v9

    .line 175
    invoke-virtual {v5, v7, v8, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->h(JLjava/lang/Object;)J

    .line 176
    .line 177
    .line 178
    move-result-wide v5

    .line 179
    cmp-long v5, v9, v5

    .line 180
    .line 181
    if-nez v5, :cond_0

    .line 182
    .line 183
    goto/16 :goto_1

    .line 184
    .line 185
    :pswitch_7
    invoke-virtual {p0, p1, p2, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->k(Lcom/google/crypto/tink/shaded/protobuf/w;Lcom/google/crypto/tink/shaded/protobuf/w;I)Z

    .line 186
    .line 187
    .line 188
    move-result v5

    .line 189
    if-eqz v5, :cond_0

    .line 190
    .line 191
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 192
    .line 193
    invoke-virtual {v5, v7, v8, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 194
    .line 195
    .line 196
    move-result v6

    .line 197
    invoke-virtual {v5, v7, v8, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 198
    .line 199
    .line 200
    move-result v5

    .line 201
    if-ne v6, v5, :cond_0

    .line 202
    .line 203
    goto/16 :goto_1

    .line 204
    .line 205
    :pswitch_8
    invoke-virtual {p0, p1, p2, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->k(Lcom/google/crypto/tink/shaded/protobuf/w;Lcom/google/crypto/tink/shaded/protobuf/w;I)Z

    .line 206
    .line 207
    .line 208
    move-result v5

    .line 209
    if-eqz v5, :cond_0

    .line 210
    .line 211
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 212
    .line 213
    invoke-virtual {v5, v7, v8, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 214
    .line 215
    .line 216
    move-result v6

    .line 217
    invoke-virtual {v5, v7, v8, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 218
    .line 219
    .line 220
    move-result v5

    .line 221
    if-ne v6, v5, :cond_0

    .line 222
    .line 223
    goto/16 :goto_1

    .line 224
    .line 225
    :pswitch_9
    invoke-virtual {p0, p1, p2, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->k(Lcom/google/crypto/tink/shaded/protobuf/w;Lcom/google/crypto/tink/shaded/protobuf/w;I)Z

    .line 226
    .line 227
    .line 228
    move-result v5

    .line 229
    if-eqz v5, :cond_0

    .line 230
    .line 231
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 232
    .line 233
    invoke-virtual {v5, v7, v8, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 234
    .line 235
    .line 236
    move-result v6

    .line 237
    invoke-virtual {v5, v7, v8, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 238
    .line 239
    .line 240
    move-result v5

    .line 241
    if-ne v6, v5, :cond_0

    .line 242
    .line 243
    goto/16 :goto_1

    .line 244
    .line 245
    :pswitch_a
    invoke-virtual {p0, p1, p2, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->k(Lcom/google/crypto/tink/shaded/protobuf/w;Lcom/google/crypto/tink/shaded/protobuf/w;I)Z

    .line 246
    .line 247
    .line 248
    move-result v5

    .line 249
    if-eqz v5, :cond_0

    .line 250
    .line 251
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 252
    .line 253
    invoke-virtual {v5, v7, v8, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 254
    .line 255
    .line 256
    move-result-object v6

    .line 257
    invoke-virtual {v5, v7, v8, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    move-result-object v5

    .line 261
    invoke-static {v6, v5}, Lcom/google/crypto/tink/shaded/protobuf/Z;->l(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 262
    .line 263
    .line 264
    move-result v5

    .line 265
    if-eqz v5, :cond_0

    .line 266
    .line 267
    goto/16 :goto_1

    .line 268
    .line 269
    :pswitch_b
    invoke-virtual {p0, p1, p2, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->k(Lcom/google/crypto/tink/shaded/protobuf/w;Lcom/google/crypto/tink/shaded/protobuf/w;I)Z

    .line 270
    .line 271
    .line 272
    move-result v5

    .line 273
    if-eqz v5, :cond_0

    .line 274
    .line 275
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 276
    .line 277
    invoke-virtual {v5, v7, v8, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    move-result-object v6

    .line 281
    invoke-virtual {v5, v7, v8, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 282
    .line 283
    .line 284
    move-result-object v5

    .line 285
    invoke-static {v6, v5}, Lcom/google/crypto/tink/shaded/protobuf/Z;->l(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 286
    .line 287
    .line 288
    move-result v5

    .line 289
    if-eqz v5, :cond_0

    .line 290
    .line 291
    goto/16 :goto_1

    .line 292
    .line 293
    :pswitch_c
    invoke-virtual {p0, p1, p2, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->k(Lcom/google/crypto/tink/shaded/protobuf/w;Lcom/google/crypto/tink/shaded/protobuf/w;I)Z

    .line 294
    .line 295
    .line 296
    move-result v5

    .line 297
    if-eqz v5, :cond_0

    .line 298
    .line 299
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 300
    .line 301
    invoke-virtual {v5, v7, v8, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 302
    .line 303
    .line 304
    move-result-object v6

    .line 305
    invoke-virtual {v5, v7, v8, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 306
    .line 307
    .line 308
    move-result-object v5

    .line 309
    invoke-static {v6, v5}, Lcom/google/crypto/tink/shaded/protobuf/Z;->l(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 310
    .line 311
    .line 312
    move-result v5

    .line 313
    if-eqz v5, :cond_0

    .line 314
    .line 315
    goto/16 :goto_1

    .line 316
    .line 317
    :pswitch_d
    invoke-virtual {p0, p1, p2, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->k(Lcom/google/crypto/tink/shaded/protobuf/w;Lcom/google/crypto/tink/shaded/protobuf/w;I)Z

    .line 318
    .line 319
    .line 320
    move-result v5

    .line 321
    if-eqz v5, :cond_0

    .line 322
    .line 323
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 324
    .line 325
    invoke-virtual {v5, v7, v8, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->c(JLjava/lang/Object;)Z

    .line 326
    .line 327
    .line 328
    move-result v6

    .line 329
    invoke-virtual {v5, v7, v8, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->c(JLjava/lang/Object;)Z

    .line 330
    .line 331
    .line 332
    move-result v5

    .line 333
    if-ne v6, v5, :cond_0

    .line 334
    .line 335
    goto/16 :goto_1

    .line 336
    .line 337
    :pswitch_e
    invoke-virtual {p0, p1, p2, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->k(Lcom/google/crypto/tink/shaded/protobuf/w;Lcom/google/crypto/tink/shaded/protobuf/w;I)Z

    .line 338
    .line 339
    .line 340
    move-result v5

    .line 341
    if-eqz v5, :cond_0

    .line 342
    .line 343
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 344
    .line 345
    invoke-virtual {v5, v7, v8, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 346
    .line 347
    .line 348
    move-result v6

    .line 349
    invoke-virtual {v5, v7, v8, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 350
    .line 351
    .line 352
    move-result v5

    .line 353
    if-ne v6, v5, :cond_0

    .line 354
    .line 355
    goto/16 :goto_1

    .line 356
    .line 357
    :pswitch_f
    invoke-virtual {p0, p1, p2, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->k(Lcom/google/crypto/tink/shaded/protobuf/w;Lcom/google/crypto/tink/shaded/protobuf/w;I)Z

    .line 358
    .line 359
    .line 360
    move-result v5

    .line 361
    if-eqz v5, :cond_0

    .line 362
    .line 363
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 364
    .line 365
    invoke-virtual {v5, v7, v8, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->h(JLjava/lang/Object;)J

    .line 366
    .line 367
    .line 368
    move-result-wide v9

    .line 369
    invoke-virtual {v5, v7, v8, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->h(JLjava/lang/Object;)J

    .line 370
    .line 371
    .line 372
    move-result-wide v5

    .line 373
    cmp-long v5, v9, v5

    .line 374
    .line 375
    if-nez v5, :cond_0

    .line 376
    .line 377
    goto/16 :goto_1

    .line 378
    .line 379
    :pswitch_10
    invoke-virtual {p0, p1, p2, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->k(Lcom/google/crypto/tink/shaded/protobuf/w;Lcom/google/crypto/tink/shaded/protobuf/w;I)Z

    .line 380
    .line 381
    .line 382
    move-result v5

    .line 383
    if-eqz v5, :cond_0

    .line 384
    .line 385
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 386
    .line 387
    invoke-virtual {v5, v7, v8, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 388
    .line 389
    .line 390
    move-result v6

    .line 391
    invoke-virtual {v5, v7, v8, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 392
    .line 393
    .line 394
    move-result v5

    .line 395
    if-ne v6, v5, :cond_0

    .line 396
    .line 397
    goto :goto_1

    .line 398
    :pswitch_11
    invoke-virtual {p0, p1, p2, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->k(Lcom/google/crypto/tink/shaded/protobuf/w;Lcom/google/crypto/tink/shaded/protobuf/w;I)Z

    .line 399
    .line 400
    .line 401
    move-result v5

    .line 402
    if-eqz v5, :cond_0

    .line 403
    .line 404
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 405
    .line 406
    invoke-virtual {v5, v7, v8, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->h(JLjava/lang/Object;)J

    .line 407
    .line 408
    .line 409
    move-result-wide v9

    .line 410
    invoke-virtual {v5, v7, v8, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->h(JLjava/lang/Object;)J

    .line 411
    .line 412
    .line 413
    move-result-wide v5

    .line 414
    cmp-long v5, v9, v5

    .line 415
    .line 416
    if-nez v5, :cond_0

    .line 417
    .line 418
    goto :goto_1

    .line 419
    :pswitch_12
    invoke-virtual {p0, p1, p2, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->k(Lcom/google/crypto/tink/shaded/protobuf/w;Lcom/google/crypto/tink/shaded/protobuf/w;I)Z

    .line 420
    .line 421
    .line 422
    move-result v5

    .line 423
    if-eqz v5, :cond_0

    .line 424
    .line 425
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 426
    .line 427
    invoke-virtual {v5, v7, v8, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->h(JLjava/lang/Object;)J

    .line 428
    .line 429
    .line 430
    move-result-wide v9

    .line 431
    invoke-virtual {v5, v7, v8, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->h(JLjava/lang/Object;)J

    .line 432
    .line 433
    .line 434
    move-result-wide v5

    .line 435
    cmp-long v5, v9, v5

    .line 436
    .line 437
    if-nez v5, :cond_0

    .line 438
    .line 439
    goto :goto_1

    .line 440
    :pswitch_13
    invoke-virtual {p0, p1, p2, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->k(Lcom/google/crypto/tink/shaded/protobuf/w;Lcom/google/crypto/tink/shaded/protobuf/w;I)Z

    .line 441
    .line 442
    .line 443
    move-result v5

    .line 444
    if-eqz v5, :cond_0

    .line 445
    .line 446
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 447
    .line 448
    invoke-virtual {v5, v7, v8, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->f(JLjava/lang/Object;)F

    .line 449
    .line 450
    .line 451
    move-result v6

    .line 452
    invoke-static {v6}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 453
    .line 454
    .line 455
    move-result v6

    .line 456
    invoke-virtual {v5, v7, v8, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->f(JLjava/lang/Object;)F

    .line 457
    .line 458
    .line 459
    move-result v5

    .line 460
    invoke-static {v5}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 461
    .line 462
    .line 463
    move-result v5

    .line 464
    if-ne v6, v5, :cond_0

    .line 465
    .line 466
    goto :goto_1

    .line 467
    :pswitch_14
    invoke-virtual {p0, p1, p2, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->k(Lcom/google/crypto/tink/shaded/protobuf/w;Lcom/google/crypto/tink/shaded/protobuf/w;I)Z

    .line 468
    .line 469
    .line 470
    move-result v5

    .line 471
    if-eqz v5, :cond_0

    .line 472
    .line 473
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 474
    .line 475
    invoke-virtual {v5, v7, v8, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->e(JLjava/lang/Object;)D

    .line 476
    .line 477
    .line 478
    move-result-wide v9

    .line 479
    invoke-static {v9, v10}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 480
    .line 481
    .line 482
    move-result-wide v9

    .line 483
    invoke-virtual {v5, v7, v8, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->e(JLjava/lang/Object;)D

    .line 484
    .line 485
    .line 486
    move-result-wide v5

    .line 487
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 488
    .line 489
    .line 490
    move-result-wide v5

    .line 491
    cmp-long v5, v9, v5

    .line 492
    .line 493
    if-nez v5, :cond_0

    .line 494
    .line 495
    :goto_1
    if-nez v4, :cond_1

    .line 496
    .line 497
    goto :goto_2

    .line 498
    :cond_1
    add-int/lit8 v3, v3, 0x3

    .line 499
    .line 500
    goto/16 :goto_0

    .line 501
    .line 502
    :cond_2
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->l:Lcom/google/crypto/tink/shaded/protobuf/c0;

    .line 503
    .line 504
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 505
    .line 506
    .line 507
    iget-object p1, p1, Lcom/google/crypto/tink/shaded/protobuf/w;->unknownFields:Lcom/google/crypto/tink/shaded/protobuf/b0;

    .line 508
    .line 509
    iget-object p2, p2, Lcom/google/crypto/tink/shaded/protobuf/w;->unknownFields:Lcom/google/crypto/tink/shaded/protobuf/b0;

    .line 510
    .line 511
    invoke-virtual {p1, p2}, Lcom/google/crypto/tink/shaded/protobuf/b0;->equals(Ljava/lang/Object;)Z

    .line 512
    .line 513
    .line 514
    move-result p1

    .line 515
    if-nez p1, :cond_3

    .line 516
    .line 517
    :goto_2
    return v2

    .line 518
    :cond_3
    return v4

    .line 519
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
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
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public final h(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/I;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->T(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/I;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final i(Lcom/google/crypto/tink/shaded/protobuf/w;)I
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->a:[I

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x0

    .line 5
    move v3, v2

    .line 6
    :goto_0
    if-ge v2, v1, :cond_3

    .line 7
    .line 8
    invoke-virtual {p0, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->S(I)I

    .line 9
    .line 10
    .line 11
    move-result v4

    .line 12
    aget v5, v0, v2

    .line 13
    .line 14
    const v6, 0xfffff

    .line 15
    .line 16
    .line 17
    and-int/2addr v6, v4

    .line 18
    int-to-long v6, v6

    .line 19
    invoke-static {v4}, Lcom/google/crypto/tink/shaded/protobuf/P;->R(I)I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    const/16 v8, 0x4d5

    .line 24
    .line 25
    const/16 v9, 0x4cf

    .line 26
    .line 27
    const/16 v10, 0x25

    .line 28
    .line 29
    packed-switch v4, :pswitch_data_0

    .line 30
    .line 31
    .line 32
    goto/16 :goto_4

    .line 33
    .line 34
    :pswitch_0
    invoke-virtual {p0, p1, v5, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    if-eqz v4, :cond_2

    .line 39
    .line 40
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 41
    .line 42
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    mul-int/lit8 v3, v3, 0x35

    .line 47
    .line 48
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    :goto_1
    add-int/2addr v4, v3

    .line 53
    move v3, v4

    .line 54
    goto/16 :goto_4

    .line 55
    .line 56
    :pswitch_1
    invoke-virtual {p0, p1, v5, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    if-eqz v4, :cond_2

    .line 61
    .line 62
    mul-int/lit8 v3, v3, 0x35

    .line 63
    .line 64
    invoke-static {v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->C(JLjava/lang/Object;)J

    .line 65
    .line 66
    .line 67
    move-result-wide v4

    .line 68
    invoke-static {v4, v5}, Lcom/google/crypto/tink/shaded/protobuf/A;->b(J)I

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    goto :goto_1

    .line 73
    :pswitch_2
    invoke-virtual {p0, p1, v5, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    if-eqz v4, :cond_2

    .line 78
    .line 79
    mul-int/lit8 v3, v3, 0x35

    .line 80
    .line 81
    invoke-static {v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->B(JLjava/lang/Object;)I

    .line 82
    .line 83
    .line 84
    move-result v4

    .line 85
    goto :goto_1

    .line 86
    :pswitch_3
    invoke-virtual {p0, p1, v5, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    if-eqz v4, :cond_2

    .line 91
    .line 92
    mul-int/lit8 v3, v3, 0x35

    .line 93
    .line 94
    invoke-static {v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->C(JLjava/lang/Object;)J

    .line 95
    .line 96
    .line 97
    move-result-wide v4

    .line 98
    invoke-static {v4, v5}, Lcom/google/crypto/tink/shaded/protobuf/A;->b(J)I

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    goto :goto_1

    .line 103
    :pswitch_4
    invoke-virtual {p0, p1, v5, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    if-eqz v4, :cond_2

    .line 108
    .line 109
    mul-int/lit8 v3, v3, 0x35

    .line 110
    .line 111
    invoke-static {v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->B(JLjava/lang/Object;)I

    .line 112
    .line 113
    .line 114
    move-result v4

    .line 115
    goto :goto_1

    .line 116
    :pswitch_5
    invoke-virtual {p0, p1, v5, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 117
    .line 118
    .line 119
    move-result v4

    .line 120
    if-eqz v4, :cond_2

    .line 121
    .line 122
    mul-int/lit8 v3, v3, 0x35

    .line 123
    .line 124
    invoke-static {v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->B(JLjava/lang/Object;)I

    .line 125
    .line 126
    .line 127
    move-result v4

    .line 128
    goto :goto_1

    .line 129
    :pswitch_6
    invoke-virtual {p0, p1, v5, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 130
    .line 131
    .line 132
    move-result v4

    .line 133
    if-eqz v4, :cond_2

    .line 134
    .line 135
    mul-int/lit8 v3, v3, 0x35

    .line 136
    .line 137
    invoke-static {v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->B(JLjava/lang/Object;)I

    .line 138
    .line 139
    .line 140
    move-result v4

    .line 141
    goto :goto_1

    .line 142
    :pswitch_7
    invoke-virtual {p0, p1, v5, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 143
    .line 144
    .line 145
    move-result v4

    .line 146
    if-eqz v4, :cond_2

    .line 147
    .line 148
    mul-int/lit8 v3, v3, 0x35

    .line 149
    .line 150
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 151
    .line 152
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    .line 157
    .line 158
    .line 159
    move-result v4

    .line 160
    goto :goto_1

    .line 161
    :pswitch_8
    invoke-virtual {p0, p1, v5, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 162
    .line 163
    .line 164
    move-result v4

    .line 165
    if-eqz v4, :cond_2

    .line 166
    .line 167
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 168
    .line 169
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object v4

    .line 173
    mul-int/lit8 v3, v3, 0x35

    .line 174
    .line 175
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    .line 176
    .line 177
    .line 178
    move-result v4

    .line 179
    goto :goto_1

    .line 180
    :pswitch_9
    invoke-virtual {p0, p1, v5, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 181
    .line 182
    .line 183
    move-result v4

    .line 184
    if-eqz v4, :cond_2

    .line 185
    .line 186
    mul-int/lit8 v3, v3, 0x35

    .line 187
    .line 188
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 189
    .line 190
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object v4

    .line 194
    check-cast v4, Ljava/lang/String;

    .line 195
    .line 196
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    .line 197
    .line 198
    .line 199
    move-result v4

    .line 200
    goto/16 :goto_1

    .line 201
    .line 202
    :pswitch_a
    invoke-virtual {p0, p1, v5, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 203
    .line 204
    .line 205
    move-result v4

    .line 206
    if-eqz v4, :cond_2

    .line 207
    .line 208
    mul-int/lit8 v3, v3, 0x35

    .line 209
    .line 210
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 211
    .line 212
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object v4

    .line 216
    check-cast v4, Ljava/lang/Boolean;

    .line 217
    .line 218
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 219
    .line 220
    .line 221
    move-result v4

    .line 222
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/A;->a:Ljava/nio/charset/Charset;

    .line 223
    .line 224
    if-eqz v4, :cond_0

    .line 225
    .line 226
    :goto_2
    move v8, v9

    .line 227
    :cond_0
    add-int/2addr v8, v3

    .line 228
    move v3, v8

    .line 229
    goto/16 :goto_4

    .line 230
    .line 231
    :pswitch_b
    invoke-virtual {p0, p1, v5, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 232
    .line 233
    .line 234
    move-result v4

    .line 235
    if-eqz v4, :cond_2

    .line 236
    .line 237
    mul-int/lit8 v3, v3, 0x35

    .line 238
    .line 239
    invoke-static {v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->B(JLjava/lang/Object;)I

    .line 240
    .line 241
    .line 242
    move-result v4

    .line 243
    goto/16 :goto_1

    .line 244
    .line 245
    :pswitch_c
    invoke-virtual {p0, p1, v5, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 246
    .line 247
    .line 248
    move-result v4

    .line 249
    if-eqz v4, :cond_2

    .line 250
    .line 251
    mul-int/lit8 v3, v3, 0x35

    .line 252
    .line 253
    invoke-static {v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->C(JLjava/lang/Object;)J

    .line 254
    .line 255
    .line 256
    move-result-wide v4

    .line 257
    invoke-static {v4, v5}, Lcom/google/crypto/tink/shaded/protobuf/A;->b(J)I

    .line 258
    .line 259
    .line 260
    move-result v4

    .line 261
    goto/16 :goto_1

    .line 262
    .line 263
    :pswitch_d
    invoke-virtual {p0, p1, v5, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 264
    .line 265
    .line 266
    move-result v4

    .line 267
    if-eqz v4, :cond_2

    .line 268
    .line 269
    mul-int/lit8 v3, v3, 0x35

    .line 270
    .line 271
    invoke-static {v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->B(JLjava/lang/Object;)I

    .line 272
    .line 273
    .line 274
    move-result v4

    .line 275
    goto/16 :goto_1

    .line 276
    .line 277
    :pswitch_e
    invoke-virtual {p0, p1, v5, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 278
    .line 279
    .line 280
    move-result v4

    .line 281
    if-eqz v4, :cond_2

    .line 282
    .line 283
    mul-int/lit8 v3, v3, 0x35

    .line 284
    .line 285
    invoke-static {v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->C(JLjava/lang/Object;)J

    .line 286
    .line 287
    .line 288
    move-result-wide v4

    .line 289
    invoke-static {v4, v5}, Lcom/google/crypto/tink/shaded/protobuf/A;->b(J)I

    .line 290
    .line 291
    .line 292
    move-result v4

    .line 293
    goto/16 :goto_1

    .line 294
    .line 295
    :pswitch_f
    invoke-virtual {p0, p1, v5, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 296
    .line 297
    .line 298
    move-result v4

    .line 299
    if-eqz v4, :cond_2

    .line 300
    .line 301
    mul-int/lit8 v3, v3, 0x35

    .line 302
    .line 303
    invoke-static {v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->C(JLjava/lang/Object;)J

    .line 304
    .line 305
    .line 306
    move-result-wide v4

    .line 307
    invoke-static {v4, v5}, Lcom/google/crypto/tink/shaded/protobuf/A;->b(J)I

    .line 308
    .line 309
    .line 310
    move-result v4

    .line 311
    goto/16 :goto_1

    .line 312
    .line 313
    :pswitch_10
    invoke-virtual {p0, p1, v5, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 314
    .line 315
    .line 316
    move-result v4

    .line 317
    if-eqz v4, :cond_2

    .line 318
    .line 319
    mul-int/lit8 v3, v3, 0x35

    .line 320
    .line 321
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 322
    .line 323
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 324
    .line 325
    .line 326
    move-result-object v4

    .line 327
    check-cast v4, Ljava/lang/Float;

    .line 328
    .line 329
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    .line 330
    .line 331
    .line 332
    move-result v4

    .line 333
    invoke-static {v4}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 334
    .line 335
    .line 336
    move-result v4

    .line 337
    goto/16 :goto_1

    .line 338
    .line 339
    :pswitch_11
    invoke-virtual {p0, p1, v5, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 340
    .line 341
    .line 342
    move-result v4

    .line 343
    if-eqz v4, :cond_2

    .line 344
    .line 345
    mul-int/lit8 v3, v3, 0x35

    .line 346
    .line 347
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 348
    .line 349
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 350
    .line 351
    .line 352
    move-result-object v4

    .line 353
    check-cast v4, Ljava/lang/Double;

    .line 354
    .line 355
    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    .line 356
    .line 357
    .line 358
    move-result-wide v4

    .line 359
    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 360
    .line 361
    .line 362
    move-result-wide v4

    .line 363
    invoke-static {v4, v5}, Lcom/google/crypto/tink/shaded/protobuf/A;->b(J)I

    .line 364
    .line 365
    .line 366
    move-result v4

    .line 367
    goto/16 :goto_1

    .line 368
    .line 369
    :pswitch_12
    mul-int/lit8 v3, v3, 0x35

    .line 370
    .line 371
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 372
    .line 373
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 374
    .line 375
    .line 376
    move-result-object v4

    .line 377
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    .line 378
    .line 379
    .line 380
    move-result v4

    .line 381
    goto/16 :goto_1

    .line 382
    .line 383
    :pswitch_13
    mul-int/lit8 v3, v3, 0x35

    .line 384
    .line 385
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 386
    .line 387
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 388
    .line 389
    .line 390
    move-result-object v4

    .line 391
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    .line 392
    .line 393
    .line 394
    move-result v4

    .line 395
    goto/16 :goto_1

    .line 396
    .line 397
    :pswitch_14
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 398
    .line 399
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 400
    .line 401
    .line 402
    move-result-object v4

    .line 403
    if-eqz v4, :cond_1

    .line 404
    .line 405
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    .line 406
    .line 407
    .line 408
    move-result v10

    .line 409
    :cond_1
    :goto_3
    mul-int/lit8 v3, v3, 0x35

    .line 410
    .line 411
    add-int/2addr v3, v10

    .line 412
    goto/16 :goto_4

    .line 413
    .line 414
    :pswitch_15
    mul-int/lit8 v3, v3, 0x35

    .line 415
    .line 416
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 417
    .line 418
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->h(JLjava/lang/Object;)J

    .line 419
    .line 420
    .line 421
    move-result-wide v4

    .line 422
    invoke-static {v4, v5}, Lcom/google/crypto/tink/shaded/protobuf/A;->b(J)I

    .line 423
    .line 424
    .line 425
    move-result v4

    .line 426
    goto/16 :goto_1

    .line 427
    .line 428
    :pswitch_16
    mul-int/lit8 v3, v3, 0x35

    .line 429
    .line 430
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 431
    .line 432
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 433
    .line 434
    .line 435
    move-result v4

    .line 436
    goto/16 :goto_1

    .line 437
    .line 438
    :pswitch_17
    mul-int/lit8 v3, v3, 0x35

    .line 439
    .line 440
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 441
    .line 442
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->h(JLjava/lang/Object;)J

    .line 443
    .line 444
    .line 445
    move-result-wide v4

    .line 446
    invoke-static {v4, v5}, Lcom/google/crypto/tink/shaded/protobuf/A;->b(J)I

    .line 447
    .line 448
    .line 449
    move-result v4

    .line 450
    goto/16 :goto_1

    .line 451
    .line 452
    :pswitch_18
    mul-int/lit8 v3, v3, 0x35

    .line 453
    .line 454
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 455
    .line 456
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 457
    .line 458
    .line 459
    move-result v4

    .line 460
    goto/16 :goto_1

    .line 461
    .line 462
    :pswitch_19
    mul-int/lit8 v3, v3, 0x35

    .line 463
    .line 464
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 465
    .line 466
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 467
    .line 468
    .line 469
    move-result v4

    .line 470
    goto/16 :goto_1

    .line 471
    .line 472
    :pswitch_1a
    mul-int/lit8 v3, v3, 0x35

    .line 473
    .line 474
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 475
    .line 476
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 477
    .line 478
    .line 479
    move-result v4

    .line 480
    goto/16 :goto_1

    .line 481
    .line 482
    :pswitch_1b
    mul-int/lit8 v3, v3, 0x35

    .line 483
    .line 484
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 485
    .line 486
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 487
    .line 488
    .line 489
    move-result-object v4

    .line 490
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    .line 491
    .line 492
    .line 493
    move-result v4

    .line 494
    goto/16 :goto_1

    .line 495
    .line 496
    :pswitch_1c
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 497
    .line 498
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 499
    .line 500
    .line 501
    move-result-object v4

    .line 502
    if-eqz v4, :cond_1

    .line 503
    .line 504
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    .line 505
    .line 506
    .line 507
    move-result v10

    .line 508
    goto :goto_3

    .line 509
    :pswitch_1d
    mul-int/lit8 v3, v3, 0x35

    .line 510
    .line 511
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 512
    .line 513
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 514
    .line 515
    .line 516
    move-result-object v4

    .line 517
    check-cast v4, Ljava/lang/String;

    .line 518
    .line 519
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    .line 520
    .line 521
    .line 522
    move-result v4

    .line 523
    goto/16 :goto_1

    .line 524
    .line 525
    :pswitch_1e
    mul-int/lit8 v3, v3, 0x35

    .line 526
    .line 527
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 528
    .line 529
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->c(JLjava/lang/Object;)Z

    .line 530
    .line 531
    .line 532
    move-result v4

    .line 533
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/A;->a:Ljava/nio/charset/Charset;

    .line 534
    .line 535
    if-eqz v4, :cond_0

    .line 536
    .line 537
    goto/16 :goto_2

    .line 538
    .line 539
    :pswitch_1f
    mul-int/lit8 v3, v3, 0x35

    .line 540
    .line 541
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 542
    .line 543
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 544
    .line 545
    .line 546
    move-result v4

    .line 547
    goto/16 :goto_1

    .line 548
    .line 549
    :pswitch_20
    mul-int/lit8 v3, v3, 0x35

    .line 550
    .line 551
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 552
    .line 553
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->h(JLjava/lang/Object;)J

    .line 554
    .line 555
    .line 556
    move-result-wide v4

    .line 557
    invoke-static {v4, v5}, Lcom/google/crypto/tink/shaded/protobuf/A;->b(J)I

    .line 558
    .line 559
    .line 560
    move-result v4

    .line 561
    goto/16 :goto_1

    .line 562
    .line 563
    :pswitch_21
    mul-int/lit8 v3, v3, 0x35

    .line 564
    .line 565
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 566
    .line 567
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 568
    .line 569
    .line 570
    move-result v4

    .line 571
    goto/16 :goto_1

    .line 572
    .line 573
    :pswitch_22
    mul-int/lit8 v3, v3, 0x35

    .line 574
    .line 575
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 576
    .line 577
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->h(JLjava/lang/Object;)J

    .line 578
    .line 579
    .line 580
    move-result-wide v4

    .line 581
    invoke-static {v4, v5}, Lcom/google/crypto/tink/shaded/protobuf/A;->b(J)I

    .line 582
    .line 583
    .line 584
    move-result v4

    .line 585
    goto/16 :goto_1

    .line 586
    .line 587
    :pswitch_23
    mul-int/lit8 v3, v3, 0x35

    .line 588
    .line 589
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 590
    .line 591
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->h(JLjava/lang/Object;)J

    .line 592
    .line 593
    .line 594
    move-result-wide v4

    .line 595
    invoke-static {v4, v5}, Lcom/google/crypto/tink/shaded/protobuf/A;->b(J)I

    .line 596
    .line 597
    .line 598
    move-result v4

    .line 599
    goto/16 :goto_1

    .line 600
    .line 601
    :pswitch_24
    mul-int/lit8 v3, v3, 0x35

    .line 602
    .line 603
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 604
    .line 605
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->f(JLjava/lang/Object;)F

    .line 606
    .line 607
    .line 608
    move-result v4

    .line 609
    invoke-static {v4}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 610
    .line 611
    .line 612
    move-result v4

    .line 613
    goto/16 :goto_1

    .line 614
    .line 615
    :pswitch_25
    mul-int/lit8 v3, v3, 0x35

    .line 616
    .line 617
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 618
    .line 619
    invoke-virtual {v4, v6, v7, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->e(JLjava/lang/Object;)D

    .line 620
    .line 621
    .line 622
    move-result-wide v4

    .line 623
    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 624
    .line 625
    .line 626
    move-result-wide v4

    .line 627
    invoke-static {v4, v5}, Lcom/google/crypto/tink/shaded/protobuf/A;->b(J)I

    .line 628
    .line 629
    .line 630
    move-result v4

    .line 631
    goto/16 :goto_1

    .line 632
    .line 633
    :cond_2
    :goto_4
    add-int/lit8 v2, v2, 0x3

    .line 634
    .line 635
    goto/16 :goto_0

    .line 636
    .line 637
    :cond_3
    mul-int/lit8 v3, v3, 0x35

    .line 638
    .line 639
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->l:Lcom/google/crypto/tink/shaded/protobuf/c0;

    .line 640
    .line 641
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 642
    .line 643
    .line 644
    iget-object p1, p1, Lcom/google/crypto/tink/shaded/protobuf/w;->unknownFields:Lcom/google/crypto/tink/shaded/protobuf/b0;

    .line 645
    .line 646
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/b0;->hashCode()I

    .line 647
    .line 648
    .line 649
    move-result p1

    .line 650
    add-int/2addr p1, v3

    .line 651
    return p1

    .line 652
    nop

    .line 653
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
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

.method public final j(Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/k;Lcom/google/crypto/tink/shaded/protobuf/o;)V
    .locals 20

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    move-object/from16 v4, p2

    .line 6
    .line 7
    move-object/from16 v6, p3

    .line 8
    .line 9
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    invoke-static {v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->l(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iget-object v8, v1, Lcom/google/crypto/tink/shaded/protobuf/P;->l:Lcom/google/crypto/tink/shaded/protobuf/c0;

    .line 16
    .line 17
    iget-object v9, v1, Lcom/google/crypto/tink/shaded/protobuf/P;->g:[I

    .line 18
    .line 19
    iget v10, v1, Lcom/google/crypto/tink/shaded/protobuf/P;->i:I

    .line 20
    .line 21
    iget v11, v1, Lcom/google/crypto/tink/shaded/protobuf/P;->h:I

    .line 22
    .line 23
    const/4 v13, 0x0

    .line 24
    :goto_0
    :try_start_0
    invoke-virtual {v4}, Landroidx/datastore/preferences/protobuf/k;->a()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget v3, v1, Lcom/google/crypto/tink/shaded/protobuf/P;->c:I

    .line 29
    .line 30
    const/4 v14, 0x0

    .line 31
    if-lt v0, v3, :cond_0

    .line 32
    .line 33
    iget v3, v1, Lcom/google/crypto/tink/shaded/protobuf/P;->d:I

    .line 34
    .line 35
    if-gt v0, v3, :cond_0

    .line 36
    .line 37
    invoke-virtual {v1, v0, v14}, Lcom/google/crypto/tink/shaded/protobuf/P;->O(II)I

    .line 38
    .line 39
    .line 40
    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    :goto_1
    move v7, v3

    .line 42
    goto :goto_2

    .line 43
    :cond_0
    const/4 v3, -0x1

    .line 44
    goto :goto_1

    .line 45
    :goto_2
    if-gez v7, :cond_7

    .line 46
    .line 47
    const v3, 0x7fffffff

    .line 48
    .line 49
    .line 50
    if-ne v0, v3, :cond_3

    .line 51
    .line 52
    :goto_3
    if-ge v11, v10, :cond_1

    .line 53
    .line 54
    aget v0, v9, v11

    .line 55
    .line 56
    invoke-virtual {v1, v0, v2, v13}, Lcom/google/crypto/tink/shaded/protobuf/P;->m(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    add-int/lit8 v11, v11, 0x1

    .line 60
    .line 61
    goto :goto_3

    .line 62
    :cond_1
    if-eqz v13, :cond_2

    .line 63
    .line 64
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 65
    .line 66
    .line 67
    :goto_4
    move-object v0, v2

    .line 68
    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 69
    .line 70
    iput-object v13, v0, Lcom/google/crypto/tink/shaded/protobuf/w;->unknownFields:Lcom/google/crypto/tink/shaded/protobuf/b0;

    .line 71
    .line 72
    :cond_2
    move-object v6, v1

    .line 73
    goto/16 :goto_11

    .line 74
    .line 75
    :cond_3
    :try_start_1
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 76
    .line 77
    .line 78
    if-nez v13, :cond_4

    .line 79
    .line 80
    invoke-static {v2}, Lcom/google/crypto/tink/shaded/protobuf/c0;->a(Ljava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/b0;

    .line 81
    .line 82
    .line 83
    move-result-object v13

    .line 84
    goto :goto_5

    .line 85
    :catchall_0
    move-exception v0

    .line 86
    move-object v6, v1

    .line 87
    move/from16 v19, v11

    .line 88
    .line 89
    goto/16 :goto_13

    .line 90
    .line 91
    :cond_4
    :goto_5
    invoke-static {v14, v4, v13}, Lcom/google/crypto/tink/shaded/protobuf/c0;->b(ILandroidx/datastore/preferences/protobuf/k;Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 95
    if-eqz v0, :cond_5

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_5
    :goto_6
    if-ge v11, v10, :cond_6

    .line 99
    .line 100
    aget v0, v9, v11

    .line 101
    .line 102
    invoke-virtual {v1, v0, v2, v13}, Lcom/google/crypto/tink/shaded/protobuf/P;->m(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    add-int/lit8 v11, v11, 0x1

    .line 106
    .line 107
    goto :goto_6

    .line 108
    :cond_6
    if-eqz v13, :cond_2

    .line 109
    .line 110
    :goto_7
    goto :goto_4

    .line 111
    :cond_7
    :try_start_2
    invoke-virtual {v1, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->S(I)I

    .line 112
    .line 113
    .line 114
    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 115
    :try_start_3
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->R(I)I

    .line 116
    .line 117
    .line 118
    move-result v5
    :try_end_3
    .catch Lcom/google/crypto/tink/shaded/protobuf/B; {:try_start_3 .. :try_end_3} :catch_7
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 119
    const/16 v16, 0x0

    .line 120
    .line 121
    const/4 v12, 0x3

    .line 122
    iget-object v15, v1, Lcom/google/crypto/tink/shaded/protobuf/P;->k:Lcom/google/crypto/tink/shaded/protobuf/E;

    .line 123
    .line 124
    packed-switch v5, :pswitch_data_0

    .line 125
    .line 126
    .line 127
    if-nez v13, :cond_8

    .line 128
    .line 129
    :try_start_4
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 130
    .line 131
    .line 132
    invoke-static {v2}, Lcom/google/crypto/tink/shaded/protobuf/c0;->a(Ljava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/b0;

    .line 133
    .line 134
    .line 135
    move-result-object v13

    .line 136
    goto :goto_9

    .line 137
    :catch_0
    move-object v6, v1

    .line 138
    move/from16 v19, v11

    .line 139
    .line 140
    :goto_8
    move-object v11, v4

    .line 141
    goto/16 :goto_f

    .line 142
    .line 143
    :cond_8
    :goto_9
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 144
    .line 145
    .line 146
    invoke-static {v14, v4, v13}, Lcom/google/crypto/tink/shaded/protobuf/c0;->b(ILandroidx/datastore/preferences/protobuf/k;Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result v0
    :try_end_4
    .catch Lcom/google/crypto/tink/shaded/protobuf/B; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 150
    if-nez v0, :cond_a

    .line 151
    .line 152
    :goto_a
    if-ge v11, v10, :cond_9

    .line 153
    .line 154
    aget v0, v9, v11

    .line 155
    .line 156
    invoke-virtual {v1, v0, v2, v13}, Lcom/google/crypto/tink/shaded/protobuf/P;->m(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 157
    .line 158
    .line 159
    add-int/lit8 v11, v11, 0x1

    .line 160
    .line 161
    goto :goto_a

    .line 162
    :cond_9
    if-eqz v13, :cond_2

    .line 163
    .line 164
    goto :goto_7

    .line 165
    :pswitch_0
    :try_start_5
    invoke-virtual {v1, v2, v0, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->y(Ljava/lang/Object;II)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    check-cast v3, Lcom/google/crypto/tink/shaded/protobuf/a;

    .line 170
    .line 171
    invoke-virtual {v1, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 172
    .line 173
    .line 174
    move-result-object v5

    .line 175
    invoke-virtual {v4, v12}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v4, v3, v5, v6}, Landroidx/datastore/preferences/protobuf/k;->c(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Y;Lcom/google/crypto/tink/shaded/protobuf/o;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v1, v0, v7, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->Q(IILjava/lang/Object;Ljava/lang/Object;)V
    :try_end_5
    .catch Lcom/google/crypto/tink/shaded/protobuf/B; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 182
    .line 183
    .line 184
    :cond_a
    move-object v6, v1

    .line 185
    move/from16 v19, v11

    .line 186
    .line 187
    :goto_b
    move-object v11, v4

    .line 188
    goto/16 :goto_12

    .line 189
    .line 190
    :pswitch_1
    move/from16 v19, v11

    .line 191
    .line 192
    :try_start_6
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 193
    .line 194
    .line 195
    move-result-wide v11

    .line 196
    invoke-virtual {v4, v14}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 197
    .line 198
    .line 199
    iget-object v3, v4, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 200
    .line 201
    check-cast v3, Landroidx/datastore/preferences/protobuf/j;

    .line 202
    .line 203
    invoke-virtual {v3}, Landroidx/datastore/preferences/protobuf/j;->z()J

    .line 204
    .line 205
    .line 206
    move-result-wide v17

    .line 207
    invoke-static/range {v17 .. v18}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 208
    .line 209
    .line 210
    move-result-object v3

    .line 211
    invoke-static {v11, v12, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {v1, v2, v0, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->N(Ljava/lang/Object;II)V

    .line 215
    .line 216
    .line 217
    :goto_c
    move-object v6, v1

    .line 218
    goto :goto_b

    .line 219
    :catchall_1
    move-exception v0

    .line 220
    move-object v6, v1

    .line 221
    goto/16 :goto_13

    .line 222
    .line 223
    :catch_1
    :goto_d
    move-object v6, v1

    .line 224
    goto :goto_8

    .line 225
    :pswitch_2
    move/from16 v19, v11

    .line 226
    .line 227
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 228
    .line 229
    .line 230
    move-result-wide v11

    .line 231
    invoke-virtual {v4, v14}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 232
    .line 233
    .line 234
    iget-object v3, v4, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 235
    .line 236
    check-cast v3, Landroidx/datastore/preferences/protobuf/j;

    .line 237
    .line 238
    invoke-virtual {v3}, Landroidx/datastore/preferences/protobuf/j;->y()I

    .line 239
    .line 240
    .line 241
    move-result v3

    .line 242
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 243
    .line 244
    .line 245
    move-result-object v3

    .line 246
    invoke-static {v11, v12, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 247
    .line 248
    .line 249
    invoke-virtual {v1, v2, v0, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->N(Ljava/lang/Object;II)V

    .line 250
    .line 251
    .line 252
    goto :goto_c

    .line 253
    :pswitch_3
    move/from16 v19, v11

    .line 254
    .line 255
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 256
    .line 257
    .line 258
    move-result-wide v11

    .line 259
    const/4 v3, 0x1

    .line 260
    invoke-virtual {v4, v3}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 261
    .line 262
    .line 263
    iget-object v3, v4, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 264
    .line 265
    check-cast v3, Landroidx/datastore/preferences/protobuf/j;

    .line 266
    .line 267
    invoke-virtual {v3}, Landroidx/datastore/preferences/protobuf/j;->x()J

    .line 268
    .line 269
    .line 270
    move-result-wide v17

    .line 271
    invoke-static/range {v17 .. v18}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 272
    .line 273
    .line 274
    move-result-object v3

    .line 275
    invoke-static {v11, v12, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 276
    .line 277
    .line 278
    invoke-virtual {v1, v2, v0, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->N(Ljava/lang/Object;II)V

    .line 279
    .line 280
    .line 281
    goto :goto_c

    .line 282
    :pswitch_4
    move/from16 v19, v11

    .line 283
    .line 284
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 285
    .line 286
    .line 287
    move-result-wide v11

    .line 288
    const/4 v3, 0x5

    .line 289
    invoke-virtual {v4, v3}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 290
    .line 291
    .line 292
    iget-object v3, v4, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 293
    .line 294
    check-cast v3, Landroidx/datastore/preferences/protobuf/j;

    .line 295
    .line 296
    invoke-virtual {v3}, Landroidx/datastore/preferences/protobuf/j;->w()I

    .line 297
    .line 298
    .line 299
    move-result v3

    .line 300
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 301
    .line 302
    .line 303
    move-result-object v3

    .line 304
    invoke-static {v11, v12, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 305
    .line 306
    .line 307
    invoke-virtual {v1, v2, v0, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->N(Ljava/lang/Object;II)V

    .line 308
    .line 309
    .line 310
    goto :goto_c

    .line 311
    :pswitch_5
    move/from16 v19, v11

    .line 312
    .line 313
    invoke-virtual {v4, v14}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 314
    .line 315
    .line 316
    iget-object v5, v4, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 317
    .line 318
    check-cast v5, Landroidx/datastore/preferences/protobuf/j;

    .line 319
    .line 320
    invoke-virtual {v5}, Landroidx/datastore/preferences/protobuf/j;->q()I

    .line 321
    .line 322
    .line 323
    move-result v5

    .line 324
    invoke-virtual {v1, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->n(I)V

    .line 325
    .line 326
    .line 327
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 328
    .line 329
    .line 330
    move-result-wide v11

    .line 331
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 332
    .line 333
    .line 334
    move-result-object v3

    .line 335
    invoke-static {v11, v12, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 336
    .line 337
    .line 338
    invoke-virtual {v1, v2, v0, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->N(Ljava/lang/Object;II)V

    .line 339
    .line 340
    .line 341
    goto :goto_c

    .line 342
    :pswitch_6
    move/from16 v19, v11

    .line 343
    .line 344
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 345
    .line 346
    .line 347
    move-result-wide v11

    .line 348
    invoke-virtual {v4, v14}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 349
    .line 350
    .line 351
    iget-object v3, v4, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 352
    .line 353
    check-cast v3, Landroidx/datastore/preferences/protobuf/j;

    .line 354
    .line 355
    invoke-virtual {v3}, Landroidx/datastore/preferences/protobuf/j;->D()I

    .line 356
    .line 357
    .line 358
    move-result v3

    .line 359
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 360
    .line 361
    .line 362
    move-result-object v3

    .line 363
    invoke-static {v11, v12, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 364
    .line 365
    .line 366
    invoke-virtual {v1, v2, v0, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->N(Ljava/lang/Object;II)V

    .line 367
    .line 368
    .line 369
    goto/16 :goto_c

    .line 370
    .line 371
    :pswitch_7
    move/from16 v19, v11

    .line 372
    .line 373
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 374
    .line 375
    .line 376
    move-result-wide v11

    .line 377
    invoke-virtual {v4}, Landroidx/datastore/preferences/protobuf/k;->i()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 378
    .line 379
    .line 380
    move-result-object v3

    .line 381
    invoke-static {v11, v12, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 382
    .line 383
    .line 384
    invoke-virtual {v1, v2, v0, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->N(Ljava/lang/Object;II)V

    .line 385
    .line 386
    .line 387
    goto/16 :goto_c

    .line 388
    .line 389
    :pswitch_8
    move/from16 v19, v11

    .line 390
    .line 391
    invoke-virtual {v1, v2, v0, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->y(Ljava/lang/Object;II)Ljava/lang/Object;

    .line 392
    .line 393
    .line 394
    move-result-object v3

    .line 395
    check-cast v3, Lcom/google/crypto/tink/shaded/protobuf/a;

    .line 396
    .line 397
    invoke-virtual {v1, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 398
    .line 399
    .line 400
    move-result-object v5

    .line 401
    const/4 v11, 0x2

    .line 402
    invoke-virtual {v4, v11}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 403
    .line 404
    .line 405
    invoke-virtual {v4, v3, v5, v6}, Landroidx/datastore/preferences/protobuf/k;->e(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Y;Lcom/google/crypto/tink/shaded/protobuf/o;)V

    .line 406
    .line 407
    .line 408
    invoke-virtual {v1, v0, v7, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->Q(IILjava/lang/Object;Ljava/lang/Object;)V

    .line 409
    .line 410
    .line 411
    goto/16 :goto_c

    .line 412
    .line 413
    :pswitch_9
    move/from16 v19, v11

    .line 414
    .line 415
    invoke-virtual {v1, v3, v4, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->J(ILandroidx/datastore/preferences/protobuf/k;Ljava/lang/Object;)V

    .line 416
    .line 417
    .line 418
    invoke-virtual {v1, v2, v0, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->N(Ljava/lang/Object;II)V

    .line 419
    .line 420
    .line 421
    goto/16 :goto_c

    .line 422
    .line 423
    :pswitch_a
    move/from16 v19, v11

    .line 424
    .line 425
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 426
    .line 427
    .line 428
    move-result-wide v11

    .line 429
    invoke-virtual {v4, v14}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 430
    .line 431
    .line 432
    iget-object v3, v4, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 433
    .line 434
    check-cast v3, Landroidx/datastore/preferences/protobuf/j;

    .line 435
    .line 436
    invoke-virtual {v3}, Landroidx/datastore/preferences/protobuf/j;->m()Z

    .line 437
    .line 438
    .line 439
    move-result v3

    .line 440
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 441
    .line 442
    .line 443
    move-result-object v3

    .line 444
    invoke-static {v11, v12, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 445
    .line 446
    .line 447
    invoke-virtual {v1, v2, v0, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->N(Ljava/lang/Object;II)V

    .line 448
    .line 449
    .line 450
    goto/16 :goto_c

    .line 451
    .line 452
    :pswitch_b
    move/from16 v19, v11

    .line 453
    .line 454
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 455
    .line 456
    .line 457
    move-result-wide v11

    .line 458
    const/4 v3, 0x5

    .line 459
    invoke-virtual {v4, v3}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 460
    .line 461
    .line 462
    iget-object v3, v4, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 463
    .line 464
    check-cast v3, Landroidx/datastore/preferences/protobuf/j;

    .line 465
    .line 466
    invoke-virtual {v3}, Landroidx/datastore/preferences/protobuf/j;->r()I

    .line 467
    .line 468
    .line 469
    move-result v3

    .line 470
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 471
    .line 472
    .line 473
    move-result-object v3

    .line 474
    invoke-static {v11, v12, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 475
    .line 476
    .line 477
    invoke-virtual {v1, v2, v0, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->N(Ljava/lang/Object;II)V

    .line 478
    .line 479
    .line 480
    goto/16 :goto_c

    .line 481
    .line 482
    :pswitch_c
    move/from16 v19, v11

    .line 483
    .line 484
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 485
    .line 486
    .line 487
    move-result-wide v11

    .line 488
    const/4 v3, 0x1

    .line 489
    invoke-virtual {v4, v3}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 490
    .line 491
    .line 492
    iget-object v3, v4, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 493
    .line 494
    check-cast v3, Landroidx/datastore/preferences/protobuf/j;

    .line 495
    .line 496
    invoke-virtual {v3}, Landroidx/datastore/preferences/protobuf/j;->s()J

    .line 497
    .line 498
    .line 499
    move-result-wide v17

    .line 500
    invoke-static/range {v17 .. v18}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 501
    .line 502
    .line 503
    move-result-object v3

    .line 504
    invoke-static {v11, v12, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 505
    .line 506
    .line 507
    invoke-virtual {v1, v2, v0, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->N(Ljava/lang/Object;II)V

    .line 508
    .line 509
    .line 510
    goto/16 :goto_c

    .line 511
    .line 512
    :pswitch_d
    move/from16 v19, v11

    .line 513
    .line 514
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 515
    .line 516
    .line 517
    move-result-wide v11

    .line 518
    invoke-virtual {v4, v14}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 519
    .line 520
    .line 521
    iget-object v3, v4, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 522
    .line 523
    check-cast v3, Landroidx/datastore/preferences/protobuf/j;

    .line 524
    .line 525
    invoke-virtual {v3}, Landroidx/datastore/preferences/protobuf/j;->u()I

    .line 526
    .line 527
    .line 528
    move-result v3

    .line 529
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 530
    .line 531
    .line 532
    move-result-object v3

    .line 533
    invoke-static {v11, v12, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 534
    .line 535
    .line 536
    invoke-virtual {v1, v2, v0, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->N(Ljava/lang/Object;II)V

    .line 537
    .line 538
    .line 539
    goto/16 :goto_c

    .line 540
    .line 541
    :pswitch_e
    move/from16 v19, v11

    .line 542
    .line 543
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 544
    .line 545
    .line 546
    move-result-wide v11

    .line 547
    invoke-virtual {v4, v14}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 548
    .line 549
    .line 550
    iget-object v3, v4, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 551
    .line 552
    check-cast v3, Landroidx/datastore/preferences/protobuf/j;

    .line 553
    .line 554
    invoke-virtual {v3}, Landroidx/datastore/preferences/protobuf/j;->E()J

    .line 555
    .line 556
    .line 557
    move-result-wide v17

    .line 558
    invoke-static/range {v17 .. v18}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 559
    .line 560
    .line 561
    move-result-object v3

    .line 562
    invoke-static {v11, v12, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 563
    .line 564
    .line 565
    invoke-virtual {v1, v2, v0, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->N(Ljava/lang/Object;II)V

    .line 566
    .line 567
    .line 568
    goto/16 :goto_c

    .line 569
    .line 570
    :pswitch_f
    move/from16 v19, v11

    .line 571
    .line 572
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 573
    .line 574
    .line 575
    move-result-wide v11

    .line 576
    invoke-virtual {v4, v14}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 577
    .line 578
    .line 579
    iget-object v3, v4, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 580
    .line 581
    check-cast v3, Landroidx/datastore/preferences/protobuf/j;

    .line 582
    .line 583
    invoke-virtual {v3}, Landroidx/datastore/preferences/protobuf/j;->v()J

    .line 584
    .line 585
    .line 586
    move-result-wide v17

    .line 587
    invoke-static/range {v17 .. v18}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 588
    .line 589
    .line 590
    move-result-object v3

    .line 591
    invoke-static {v11, v12, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 592
    .line 593
    .line 594
    invoke-virtual {v1, v2, v0, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->N(Ljava/lang/Object;II)V

    .line 595
    .line 596
    .line 597
    goto/16 :goto_c

    .line 598
    .line 599
    :pswitch_10
    move/from16 v19, v11

    .line 600
    .line 601
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 602
    .line 603
    .line 604
    move-result-wide v11

    .line 605
    const/4 v3, 0x5

    .line 606
    invoke-virtual {v4, v3}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 607
    .line 608
    .line 609
    iget-object v3, v4, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 610
    .line 611
    check-cast v3, Landroidx/datastore/preferences/protobuf/j;

    .line 612
    .line 613
    invoke-virtual {v3}, Landroidx/datastore/preferences/protobuf/j;->t()F

    .line 614
    .line 615
    .line 616
    move-result v3

    .line 617
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 618
    .line 619
    .line 620
    move-result-object v3

    .line 621
    invoke-static {v11, v12, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 622
    .line 623
    .line 624
    invoke-virtual {v1, v2, v0, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->N(Ljava/lang/Object;II)V

    .line 625
    .line 626
    .line 627
    goto/16 :goto_c

    .line 628
    .line 629
    :pswitch_11
    move/from16 v19, v11

    .line 630
    .line 631
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 632
    .line 633
    .line 634
    move-result-wide v11

    .line 635
    const/4 v3, 0x1

    .line 636
    invoke-virtual {v4, v3}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 637
    .line 638
    .line 639
    iget-object v3, v4, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 640
    .line 641
    check-cast v3, Landroidx/datastore/preferences/protobuf/j;

    .line 642
    .line 643
    invoke-virtual {v3}, Landroidx/datastore/preferences/protobuf/j;->p()D

    .line 644
    .line 645
    .line 646
    move-result-wide v17

    .line 647
    invoke-static/range {v17 .. v18}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 648
    .line 649
    .line 650
    move-result-object v3

    .line 651
    invoke-static {v11, v12, v2, v3}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 652
    .line 653
    .line 654
    invoke-virtual {v1, v2, v0, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->N(Ljava/lang/Object;II)V

    .line 655
    .line 656
    .line 657
    goto/16 :goto_c

    .line 658
    .line 659
    :pswitch_12
    move/from16 v19, v11

    .line 660
    .line 661
    invoke-virtual {v1, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->o(I)Ljava/lang/Object;

    .line 662
    .line 663
    .line 664
    move-result-object v0

    .line 665
    invoke-virtual {v1, v7, v2, v0}, Lcom/google/crypto/tink/shaded/protobuf/P;->u(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 666
    .line 667
    .line 668
    throw v16
    :try_end_6
    .catch Lcom/google/crypto/tink/shaded/protobuf/B; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 669
    :pswitch_13
    move/from16 v19, v11

    .line 670
    .line 671
    :try_start_7
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 672
    .line 673
    .line 674
    move-result-wide v3

    .line 675
    invoke-virtual {v1, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 676
    .line 677
    .line 678
    move-result-object v6
    :try_end_7
    .catch Lcom/google/crypto/tink/shaded/protobuf/B; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 679
    move-object/from16 v5, p2

    .line 680
    .line 681
    move-object/from16 v7, p3

    .line 682
    .line 683
    :try_start_8
    invoke-virtual/range {v1 .. v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->H(Ljava/lang/Object;JLandroidx/datastore/preferences/protobuf/k;Lcom/google/crypto/tink/shaded/protobuf/Y;Lcom/google/crypto/tink/shaded/protobuf/o;)V
    :try_end_8
    .catch Lcom/google/crypto/tink/shaded/protobuf/B; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 684
    .line 685
    .line 686
    move-object v4, v5

    .line 687
    goto/16 :goto_c

    .line 688
    .line 689
    :catch_2
    move-object v6, v1

    .line 690
    move-object v11, v5

    .line 691
    goto/16 :goto_f

    .line 692
    .line 693
    :catch_3
    move-object/from16 v11, p2

    .line 694
    .line 695
    :goto_e
    move-object v6, v1

    .line 696
    goto/16 :goto_f

    .line 697
    .line 698
    :pswitch_14
    move/from16 v19, v11

    .line 699
    .line 700
    :try_start_9
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 701
    .line 702
    .line 703
    move-result-wide v5

    .line 704
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 705
    .line 706
    .line 707
    invoke-static {v5, v6, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 708
    .line 709
    .line 710
    move-result-object v0

    .line 711
    invoke-virtual {v4, v0}, Landroidx/datastore/preferences/protobuf/k;->H(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 712
    .line 713
    .line 714
    goto/16 :goto_c

    .line 715
    .line 716
    :pswitch_15
    move/from16 v19, v11

    .line 717
    .line 718
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 719
    .line 720
    .line 721
    move-result-wide v5

    .line 722
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 723
    .line 724
    .line 725
    invoke-static {v5, v6, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 726
    .line 727
    .line 728
    move-result-object v0

    .line 729
    invoke-virtual {v4, v0}, Landroidx/datastore/preferences/protobuf/k;->F(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 730
    .line 731
    .line 732
    goto/16 :goto_c

    .line 733
    .line 734
    :pswitch_16
    move/from16 v19, v11

    .line 735
    .line 736
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 737
    .line 738
    .line 739
    move-result-wide v5

    .line 740
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 741
    .line 742
    .line 743
    invoke-static {v5, v6, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 744
    .line 745
    .line 746
    move-result-object v0

    .line 747
    invoke-virtual {v4, v0}, Landroidx/datastore/preferences/protobuf/k;->D(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 748
    .line 749
    .line 750
    goto/16 :goto_c

    .line 751
    .line 752
    :pswitch_17
    move/from16 v19, v11

    .line 753
    .line 754
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 755
    .line 756
    .line 757
    move-result-wide v5

    .line 758
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 759
    .line 760
    .line 761
    invoke-static {v5, v6, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 762
    .line 763
    .line 764
    move-result-object v0

    .line 765
    invoke-virtual {v4, v0}, Landroidx/datastore/preferences/protobuf/k;->B(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 766
    .line 767
    .line 768
    goto/16 :goto_c

    .line 769
    .line 770
    :pswitch_18
    move/from16 v19, v11

    .line 771
    .line 772
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 773
    .line 774
    .line 775
    move-result-wide v5

    .line 776
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 777
    .line 778
    .line 779
    invoke-static {v5, v6, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 780
    .line 781
    .line 782
    move-result-object v3

    .line 783
    invoke-virtual {v4, v3}, Landroidx/datastore/preferences/protobuf/k;->o(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 784
    .line 785
    .line 786
    invoke-virtual {v1, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->n(I)V

    .line 787
    .line 788
    .line 789
    invoke-static {v2, v0, v3, v13, v8}, Lcom/google/crypto/tink/shaded/protobuf/Z;->j(Ljava/lang/Object;ILcom/google/crypto/tink/shaded/protobuf/z;Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/c0;)Ljava/lang/Object;

    .line 790
    .line 791
    .line 792
    goto/16 :goto_c

    .line 793
    .line 794
    :pswitch_19
    move/from16 v19, v11

    .line 795
    .line 796
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 797
    .line 798
    .line 799
    move-result-wide v5

    .line 800
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 801
    .line 802
    .line 803
    invoke-static {v5, v6, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 804
    .line 805
    .line 806
    move-result-object v0

    .line 807
    invoke-virtual {v4, v0}, Landroidx/datastore/preferences/protobuf/k;->L(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 808
    .line 809
    .line 810
    goto/16 :goto_c

    .line 811
    .line 812
    :pswitch_1a
    move/from16 v19, v11

    .line 813
    .line 814
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 815
    .line 816
    .line 817
    move-result-wide v5

    .line 818
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 819
    .line 820
    .line 821
    invoke-static {v5, v6, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 822
    .line 823
    .line 824
    move-result-object v0

    .line 825
    invoke-virtual {v4, v0}, Landroidx/datastore/preferences/protobuf/k;->g(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 826
    .line 827
    .line 828
    goto/16 :goto_c

    .line 829
    .line 830
    :pswitch_1b
    move/from16 v19, v11

    .line 831
    .line 832
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 833
    .line 834
    .line 835
    move-result-wide v5

    .line 836
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 837
    .line 838
    .line 839
    invoke-static {v5, v6, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 840
    .line 841
    .line 842
    move-result-object v0

    .line 843
    invoke-virtual {v4, v0}, Landroidx/datastore/preferences/protobuf/k;->r(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 844
    .line 845
    .line 846
    goto/16 :goto_c

    .line 847
    .line 848
    :pswitch_1c
    move/from16 v19, v11

    .line 849
    .line 850
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 851
    .line 852
    .line 853
    move-result-wide v5

    .line 854
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 855
    .line 856
    .line 857
    invoke-static {v5, v6, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 858
    .line 859
    .line 860
    move-result-object v0

    .line 861
    invoke-virtual {v4, v0}, Landroidx/datastore/preferences/protobuf/k;->t(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 862
    .line 863
    .line 864
    goto/16 :goto_c

    .line 865
    .line 866
    :pswitch_1d
    move/from16 v19, v11

    .line 867
    .line 868
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 869
    .line 870
    .line 871
    move-result-wide v5

    .line 872
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 873
    .line 874
    .line 875
    invoke-static {v5, v6, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 876
    .line 877
    .line 878
    move-result-object v0

    .line 879
    invoke-virtual {v4, v0}, Landroidx/datastore/preferences/protobuf/k;->x(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 880
    .line 881
    .line 882
    goto/16 :goto_c

    .line 883
    .line 884
    :pswitch_1e
    move/from16 v19, v11

    .line 885
    .line 886
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 887
    .line 888
    .line 889
    move-result-wide v5

    .line 890
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 891
    .line 892
    .line 893
    invoke-static {v5, v6, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 894
    .line 895
    .line 896
    move-result-object v0

    .line 897
    invoke-virtual {v4, v0}, Landroidx/datastore/preferences/protobuf/k;->N(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 898
    .line 899
    .line 900
    goto/16 :goto_c

    .line 901
    .line 902
    :pswitch_1f
    move/from16 v19, v11

    .line 903
    .line 904
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 905
    .line 906
    .line 907
    move-result-wide v5

    .line 908
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 909
    .line 910
    .line 911
    invoke-static {v5, v6, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 912
    .line 913
    .line 914
    move-result-object v0

    .line 915
    invoke-virtual {v4, v0}, Landroidx/datastore/preferences/protobuf/k;->z(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 916
    .line 917
    .line 918
    goto/16 :goto_c

    .line 919
    .line 920
    :pswitch_20
    move/from16 v19, v11

    .line 921
    .line 922
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 923
    .line 924
    .line 925
    move-result-wide v5

    .line 926
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 927
    .line 928
    .line 929
    invoke-static {v5, v6, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 930
    .line 931
    .line 932
    move-result-object v0

    .line 933
    invoke-virtual {v4, v0}, Landroidx/datastore/preferences/protobuf/k;->v(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 934
    .line 935
    .line 936
    goto/16 :goto_c

    .line 937
    .line 938
    :pswitch_21
    move/from16 v19, v11

    .line 939
    .line 940
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 941
    .line 942
    .line 943
    move-result-wide v5

    .line 944
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 945
    .line 946
    .line 947
    invoke-static {v5, v6, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 948
    .line 949
    .line 950
    move-result-object v0

    .line 951
    invoke-virtual {v4, v0}, Landroidx/datastore/preferences/protobuf/k;->m(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 952
    .line 953
    .line 954
    goto/16 :goto_c

    .line 955
    .line 956
    :pswitch_22
    move/from16 v19, v11

    .line 957
    .line 958
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 959
    .line 960
    .line 961
    move-result-wide v5

    .line 962
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 963
    .line 964
    .line 965
    invoke-static {v5, v6, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 966
    .line 967
    .line 968
    move-result-object v0

    .line 969
    invoke-virtual {v4, v0}, Landroidx/datastore/preferences/protobuf/k;->H(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 970
    .line 971
    .line 972
    goto/16 :goto_c

    .line 973
    .line 974
    :pswitch_23
    move/from16 v19, v11

    .line 975
    .line 976
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 977
    .line 978
    .line 979
    move-result-wide v5

    .line 980
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 981
    .line 982
    .line 983
    invoke-static {v5, v6, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 984
    .line 985
    .line 986
    move-result-object v0

    .line 987
    invoke-virtual {v4, v0}, Landroidx/datastore/preferences/protobuf/k;->F(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 988
    .line 989
    .line 990
    goto/16 :goto_c

    .line 991
    .line 992
    :pswitch_24
    move/from16 v19, v11

    .line 993
    .line 994
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 995
    .line 996
    .line 997
    move-result-wide v5

    .line 998
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 999
    .line 1000
    .line 1001
    invoke-static {v5, v6, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 1002
    .line 1003
    .line 1004
    move-result-object v0

    .line 1005
    invoke-virtual {v4, v0}, Landroidx/datastore/preferences/protobuf/k;->D(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 1006
    .line 1007
    .line 1008
    goto/16 :goto_c

    .line 1009
    .line 1010
    :pswitch_25
    move/from16 v19, v11

    .line 1011
    .line 1012
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1013
    .line 1014
    .line 1015
    move-result-wide v5

    .line 1016
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1017
    .line 1018
    .line 1019
    invoke-static {v5, v6, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 1020
    .line 1021
    .line 1022
    move-result-object v0

    .line 1023
    invoke-virtual {v4, v0}, Landroidx/datastore/preferences/protobuf/k;->B(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 1024
    .line 1025
    .line 1026
    goto/16 :goto_c

    .line 1027
    .line 1028
    :pswitch_26
    move/from16 v19, v11

    .line 1029
    .line 1030
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1031
    .line 1032
    .line 1033
    move-result-wide v5

    .line 1034
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1035
    .line 1036
    .line 1037
    invoke-static {v5, v6, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 1038
    .line 1039
    .line 1040
    move-result-object v3

    .line 1041
    invoke-virtual {v4, v3}, Landroidx/datastore/preferences/protobuf/k;->o(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 1042
    .line 1043
    .line 1044
    invoke-virtual {v1, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->n(I)V

    .line 1045
    .line 1046
    .line 1047
    invoke-static {v2, v0, v3, v13, v8}, Lcom/google/crypto/tink/shaded/protobuf/Z;->j(Ljava/lang/Object;ILcom/google/crypto/tink/shaded/protobuf/z;Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/c0;)Ljava/lang/Object;

    .line 1048
    .line 1049
    .line 1050
    goto/16 :goto_c

    .line 1051
    .line 1052
    :pswitch_27
    move/from16 v19, v11

    .line 1053
    .line 1054
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1055
    .line 1056
    .line 1057
    move-result-wide v5

    .line 1058
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1059
    .line 1060
    .line 1061
    invoke-static {v5, v6, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 1062
    .line 1063
    .line 1064
    move-result-object v0

    .line 1065
    invoke-virtual {v4, v0}, Landroidx/datastore/preferences/protobuf/k;->L(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 1066
    .line 1067
    .line 1068
    goto/16 :goto_c

    .line 1069
    .line 1070
    :pswitch_28
    move/from16 v19, v11

    .line 1071
    .line 1072
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1073
    .line 1074
    .line 1075
    move-result-wide v5

    .line 1076
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1077
    .line 1078
    .line 1079
    invoke-static {v5, v6, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 1080
    .line 1081
    .line 1082
    move-result-object v0

    .line 1083
    invoke-virtual {v4, v0}, Landroidx/datastore/preferences/protobuf/k;->k(Lcom/google/crypto/tink/shaded/protobuf/z;)V
    :try_end_9
    .catch Lcom/google/crypto/tink/shaded/protobuf/B; {:try_start_9 .. :try_end_9} :catch_1
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 1084
    .line 1085
    .line 1086
    goto/16 :goto_c

    .line 1087
    .line 1088
    :pswitch_29
    move/from16 v19, v11

    .line 1089
    .line 1090
    :try_start_a
    invoke-virtual {v1, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 1091
    .line 1092
    .line 1093
    move-result-object v5
    :try_end_a
    .catch Lcom/google/crypto/tink/shaded/protobuf/B; {:try_start_a .. :try_end_a} :catch_5
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 1094
    move-object/from16 v6, p3

    .line 1095
    .line 1096
    :try_start_b
    invoke-virtual/range {v1 .. v6}, Lcom/google/crypto/tink/shaded/protobuf/P;->I(Ljava/lang/Object;ILandroidx/datastore/preferences/protobuf/k;Lcom/google/crypto/tink/shaded/protobuf/Y;Lcom/google/crypto/tink/shaded/protobuf/o;)V
    :try_end_b
    .catch Lcom/google/crypto/tink/shaded/protobuf/B; {:try_start_b .. :try_end_b} :catch_4
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 1097
    .line 1098
    .line 1099
    move-object v11, v4

    .line 1100
    move-object v0, v6

    .line 1101
    move-object v6, v1

    .line 1102
    goto/16 :goto_12

    .line 1103
    .line 1104
    :catch_4
    move-object v11, v4

    .line 1105
    move-object v0, v6

    .line 1106
    goto/16 :goto_e

    .line 1107
    .line 1108
    :catch_5
    move-object/from16 v0, p3

    .line 1109
    .line 1110
    goto/16 :goto_d

    .line 1111
    .line 1112
    :pswitch_2a
    move-object v0, v6

    .line 1113
    move/from16 v19, v11

    .line 1114
    .line 1115
    move-object v6, v1

    .line 1116
    move-object v11, v4

    .line 1117
    :try_start_c
    invoke-virtual {v6, v3, v11, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->K(ILandroidx/datastore/preferences/protobuf/k;Ljava/lang/Object;)V

    .line 1118
    .line 1119
    .line 1120
    goto/16 :goto_12

    .line 1121
    .line 1122
    :catchall_2
    move-exception v0

    .line 1123
    goto/16 :goto_13

    .line 1124
    .line 1125
    :pswitch_2b
    move-object v0, v6

    .line 1126
    move/from16 v19, v11

    .line 1127
    .line 1128
    move-object v6, v1

    .line 1129
    move-object v11, v4

    .line 1130
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1131
    .line 1132
    .line 1133
    move-result-wide v3

    .line 1134
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1135
    .line 1136
    .line 1137
    invoke-static {v3, v4, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 1138
    .line 1139
    .line 1140
    move-result-object v1

    .line 1141
    invoke-virtual {v11, v1}, Landroidx/datastore/preferences/protobuf/k;->g(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 1142
    .line 1143
    .line 1144
    goto/16 :goto_12

    .line 1145
    .line 1146
    :pswitch_2c
    move-object v0, v6

    .line 1147
    move/from16 v19, v11

    .line 1148
    .line 1149
    move-object v6, v1

    .line 1150
    move-object v11, v4

    .line 1151
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1152
    .line 1153
    .line 1154
    move-result-wide v3

    .line 1155
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1156
    .line 1157
    .line 1158
    invoke-static {v3, v4, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 1159
    .line 1160
    .line 1161
    move-result-object v1

    .line 1162
    invoke-virtual {v11, v1}, Landroidx/datastore/preferences/protobuf/k;->r(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 1163
    .line 1164
    .line 1165
    goto/16 :goto_12

    .line 1166
    .line 1167
    :pswitch_2d
    move-object v0, v6

    .line 1168
    move/from16 v19, v11

    .line 1169
    .line 1170
    move-object v6, v1

    .line 1171
    move-object v11, v4

    .line 1172
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1173
    .line 1174
    .line 1175
    move-result-wide v3

    .line 1176
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1177
    .line 1178
    .line 1179
    invoke-static {v3, v4, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 1180
    .line 1181
    .line 1182
    move-result-object v1

    .line 1183
    invoke-virtual {v11, v1}, Landroidx/datastore/preferences/protobuf/k;->t(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 1184
    .line 1185
    .line 1186
    goto/16 :goto_12

    .line 1187
    .line 1188
    :pswitch_2e
    move-object v0, v6

    .line 1189
    move/from16 v19, v11

    .line 1190
    .line 1191
    move-object v6, v1

    .line 1192
    move-object v11, v4

    .line 1193
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1194
    .line 1195
    .line 1196
    move-result-wide v3

    .line 1197
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1198
    .line 1199
    .line 1200
    invoke-static {v3, v4, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 1201
    .line 1202
    .line 1203
    move-result-object v1

    .line 1204
    invoke-virtual {v11, v1}, Landroidx/datastore/preferences/protobuf/k;->x(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 1205
    .line 1206
    .line 1207
    goto/16 :goto_12

    .line 1208
    .line 1209
    :pswitch_2f
    move-object v0, v6

    .line 1210
    move/from16 v19, v11

    .line 1211
    .line 1212
    move-object v6, v1

    .line 1213
    move-object v11, v4

    .line 1214
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1215
    .line 1216
    .line 1217
    move-result-wide v3

    .line 1218
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1219
    .line 1220
    .line 1221
    invoke-static {v3, v4, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 1222
    .line 1223
    .line 1224
    move-result-object v1

    .line 1225
    invoke-virtual {v11, v1}, Landroidx/datastore/preferences/protobuf/k;->N(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 1226
    .line 1227
    .line 1228
    goto/16 :goto_12

    .line 1229
    .line 1230
    :pswitch_30
    move-object v0, v6

    .line 1231
    move/from16 v19, v11

    .line 1232
    .line 1233
    move-object v6, v1

    .line 1234
    move-object v11, v4

    .line 1235
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1236
    .line 1237
    .line 1238
    move-result-wide v3

    .line 1239
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1240
    .line 1241
    .line 1242
    invoke-static {v3, v4, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 1243
    .line 1244
    .line 1245
    move-result-object v1

    .line 1246
    invoke-virtual {v11, v1}, Landroidx/datastore/preferences/protobuf/k;->z(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 1247
    .line 1248
    .line 1249
    goto/16 :goto_12

    .line 1250
    .line 1251
    :pswitch_31
    move-object v0, v6

    .line 1252
    move/from16 v19, v11

    .line 1253
    .line 1254
    move-object v6, v1

    .line 1255
    move-object v11, v4

    .line 1256
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1257
    .line 1258
    .line 1259
    move-result-wide v3

    .line 1260
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1261
    .line 1262
    .line 1263
    invoke-static {v3, v4, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 1264
    .line 1265
    .line 1266
    move-result-object v1

    .line 1267
    invoke-virtual {v11, v1}, Landroidx/datastore/preferences/protobuf/k;->v(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 1268
    .line 1269
    .line 1270
    goto/16 :goto_12

    .line 1271
    .line 1272
    :pswitch_32
    move-object v0, v6

    .line 1273
    move/from16 v19, v11

    .line 1274
    .line 1275
    move-object v6, v1

    .line 1276
    move-object v11, v4

    .line 1277
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1278
    .line 1279
    .line 1280
    move-result-wide v3

    .line 1281
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1282
    .line 1283
    .line 1284
    invoke-static {v3, v4, v2}, Lcom/google/crypto/tink/shaded/protobuf/E;->a(JLjava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/z;

    .line 1285
    .line 1286
    .line 1287
    move-result-object v1

    .line 1288
    invoke-virtual {v11, v1}, Landroidx/datastore/preferences/protobuf/k;->m(Lcom/google/crypto/tink/shaded/protobuf/z;)V

    .line 1289
    .line 1290
    .line 1291
    goto/16 :goto_12

    .line 1292
    .line 1293
    :pswitch_33
    move-object v0, v6

    .line 1294
    move/from16 v19, v11

    .line 1295
    .line 1296
    move-object v6, v1

    .line 1297
    move-object v11, v4

    .line 1298
    invoke-virtual {v6, v7, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->x(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1299
    .line 1300
    .line 1301
    move-result-object v1

    .line 1302
    check-cast v1, Lcom/google/crypto/tink/shaded/protobuf/a;

    .line 1303
    .line 1304
    invoke-virtual {v6, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 1305
    .line 1306
    .line 1307
    move-result-object v3

    .line 1308
    invoke-virtual {v11, v12}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 1309
    .line 1310
    .line 1311
    invoke-virtual {v11, v1, v3, v0}, Landroidx/datastore/preferences/protobuf/k;->c(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Y;Lcom/google/crypto/tink/shaded/protobuf/o;)V

    .line 1312
    .line 1313
    .line 1314
    invoke-virtual {v6, v7, v2, v1}, Lcom/google/crypto/tink/shaded/protobuf/P;->P(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 1315
    .line 1316
    .line 1317
    goto/16 :goto_12

    .line 1318
    .line 1319
    :pswitch_34
    move-object v0, v6

    .line 1320
    move/from16 v19, v11

    .line 1321
    .line 1322
    move-object v6, v1

    .line 1323
    move-object v11, v4

    .line 1324
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1325
    .line 1326
    .line 1327
    move-result-wide v3

    .line 1328
    invoke-virtual {v11, v14}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 1329
    .line 1330
    .line 1331
    iget-object v1, v11, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 1332
    .line 1333
    check-cast v1, Landroidx/datastore/preferences/protobuf/j;

    .line 1334
    .line 1335
    invoke-virtual {v1}, Landroidx/datastore/preferences/protobuf/j;->z()J

    .line 1336
    .line 1337
    .line 1338
    move-result-wide v14

    .line 1339
    invoke-static {v2, v3, v4, v14, v15}, Lcom/google/crypto/tink/shaded/protobuf/h0;->o(Ljava/lang/Object;JJ)V

    .line 1340
    .line 1341
    .line 1342
    invoke-virtual {v6, v7, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 1343
    .line 1344
    .line 1345
    goto/16 :goto_12

    .line 1346
    .line 1347
    :pswitch_35
    move-object v0, v6

    .line 1348
    move/from16 v19, v11

    .line 1349
    .line 1350
    move-object v6, v1

    .line 1351
    move-object v11, v4

    .line 1352
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1353
    .line 1354
    .line 1355
    move-result-wide v3

    .line 1356
    const/4 v12, 0x0

    .line 1357
    invoke-virtual {v11, v12}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 1358
    .line 1359
    .line 1360
    iget-object v1, v11, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 1361
    .line 1362
    check-cast v1, Landroidx/datastore/preferences/protobuf/j;

    .line 1363
    .line 1364
    invoke-virtual {v1}, Landroidx/datastore/preferences/protobuf/j;->y()I

    .line 1365
    .line 1366
    .line 1367
    move-result v1

    .line 1368
    invoke-static {v1, v3, v4, v2}, Lcom/google/crypto/tink/shaded/protobuf/h0;->n(IJLjava/lang/Object;)V

    .line 1369
    .line 1370
    .line 1371
    invoke-virtual {v6, v7, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 1372
    .line 1373
    .line 1374
    goto/16 :goto_12

    .line 1375
    .line 1376
    :pswitch_36
    move-object v0, v6

    .line 1377
    move/from16 v19, v11

    .line 1378
    .line 1379
    move-object v6, v1

    .line 1380
    move-object v11, v4

    .line 1381
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1382
    .line 1383
    .line 1384
    move-result-wide v3

    .line 1385
    const/4 v1, 0x1

    .line 1386
    invoke-virtual {v11, v1}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 1387
    .line 1388
    .line 1389
    iget-object v1, v11, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 1390
    .line 1391
    check-cast v1, Landroidx/datastore/preferences/protobuf/j;

    .line 1392
    .line 1393
    invoke-virtual {v1}, Landroidx/datastore/preferences/protobuf/j;->x()J

    .line 1394
    .line 1395
    .line 1396
    move-result-wide v14

    .line 1397
    invoke-static {v2, v3, v4, v14, v15}, Lcom/google/crypto/tink/shaded/protobuf/h0;->o(Ljava/lang/Object;JJ)V

    .line 1398
    .line 1399
    .line 1400
    invoke-virtual {v6, v7, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 1401
    .line 1402
    .line 1403
    goto/16 :goto_12

    .line 1404
    .line 1405
    :pswitch_37
    move-object v0, v6

    .line 1406
    move/from16 v19, v11

    .line 1407
    .line 1408
    move-object v6, v1

    .line 1409
    move-object v11, v4

    .line 1410
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1411
    .line 1412
    .line 1413
    move-result-wide v3

    .line 1414
    const/4 v1, 0x5

    .line 1415
    invoke-virtual {v11, v1}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 1416
    .line 1417
    .line 1418
    iget-object v1, v11, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 1419
    .line 1420
    check-cast v1, Landroidx/datastore/preferences/protobuf/j;

    .line 1421
    .line 1422
    invoke-virtual {v1}, Landroidx/datastore/preferences/protobuf/j;->w()I

    .line 1423
    .line 1424
    .line 1425
    move-result v1

    .line 1426
    invoke-static {v1, v3, v4, v2}, Lcom/google/crypto/tink/shaded/protobuf/h0;->n(IJLjava/lang/Object;)V

    .line 1427
    .line 1428
    .line 1429
    invoke-virtual {v6, v7, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 1430
    .line 1431
    .line 1432
    goto/16 :goto_12

    .line 1433
    .line 1434
    :pswitch_38
    move-object v0, v6

    .line 1435
    move/from16 v19, v11

    .line 1436
    .line 1437
    move v12, v14

    .line 1438
    move-object v6, v1

    .line 1439
    move-object v11, v4

    .line 1440
    invoke-virtual {v11, v12}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 1441
    .line 1442
    .line 1443
    iget-object v1, v11, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 1444
    .line 1445
    check-cast v1, Landroidx/datastore/preferences/protobuf/j;

    .line 1446
    .line 1447
    invoke-virtual {v1}, Landroidx/datastore/preferences/protobuf/j;->q()I

    .line 1448
    .line 1449
    .line 1450
    move-result v1

    .line 1451
    invoke-virtual {v6, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->n(I)V

    .line 1452
    .line 1453
    .line 1454
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1455
    .line 1456
    .line 1457
    move-result-wide v3

    .line 1458
    invoke-static {v1, v3, v4, v2}, Lcom/google/crypto/tink/shaded/protobuf/h0;->n(IJLjava/lang/Object;)V

    .line 1459
    .line 1460
    .line 1461
    invoke-virtual {v6, v7, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 1462
    .line 1463
    .line 1464
    goto/16 :goto_12

    .line 1465
    .line 1466
    :pswitch_39
    move-object v0, v6

    .line 1467
    move/from16 v19, v11

    .line 1468
    .line 1469
    move-object v6, v1

    .line 1470
    move-object v11, v4

    .line 1471
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1472
    .line 1473
    .line 1474
    move-result-wide v3

    .line 1475
    const/4 v12, 0x0

    .line 1476
    invoke-virtual {v11, v12}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 1477
    .line 1478
    .line 1479
    iget-object v1, v11, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 1480
    .line 1481
    check-cast v1, Landroidx/datastore/preferences/protobuf/j;

    .line 1482
    .line 1483
    invoke-virtual {v1}, Landroidx/datastore/preferences/protobuf/j;->D()I

    .line 1484
    .line 1485
    .line 1486
    move-result v1

    .line 1487
    invoke-static {v1, v3, v4, v2}, Lcom/google/crypto/tink/shaded/protobuf/h0;->n(IJLjava/lang/Object;)V

    .line 1488
    .line 1489
    .line 1490
    invoke-virtual {v6, v7, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 1491
    .line 1492
    .line 1493
    goto/16 :goto_12

    .line 1494
    .line 1495
    :pswitch_3a
    move-object v0, v6

    .line 1496
    move/from16 v19, v11

    .line 1497
    .line 1498
    move-object v6, v1

    .line 1499
    move-object v11, v4

    .line 1500
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1501
    .line 1502
    .line 1503
    move-result-wide v3

    .line 1504
    invoke-virtual {v11}, Landroidx/datastore/preferences/protobuf/k;->i()Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 1505
    .line 1506
    .line 1507
    move-result-object v1

    .line 1508
    invoke-static {v3, v4, v2, v1}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 1509
    .line 1510
    .line 1511
    invoke-virtual {v6, v7, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 1512
    .line 1513
    .line 1514
    goto/16 :goto_12

    .line 1515
    .line 1516
    :pswitch_3b
    move-object v0, v6

    .line 1517
    move/from16 v19, v11

    .line 1518
    .line 1519
    move-object v6, v1

    .line 1520
    move-object v11, v4

    .line 1521
    invoke-virtual {v6, v7, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->x(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1522
    .line 1523
    .line 1524
    move-result-object v1

    .line 1525
    check-cast v1, Lcom/google/crypto/tink/shaded/protobuf/a;

    .line 1526
    .line 1527
    invoke-virtual {v6, v7}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 1528
    .line 1529
    .line 1530
    move-result-object v3

    .line 1531
    const/4 v4, 0x2

    .line 1532
    invoke-virtual {v11, v4}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 1533
    .line 1534
    .line 1535
    invoke-virtual {v11, v1, v3, v0}, Landroidx/datastore/preferences/protobuf/k;->e(Ljava/lang/Object;Lcom/google/crypto/tink/shaded/protobuf/Y;Lcom/google/crypto/tink/shaded/protobuf/o;)V

    .line 1536
    .line 1537
    .line 1538
    invoke-virtual {v6, v7, v2, v1}, Lcom/google/crypto/tink/shaded/protobuf/P;->P(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 1539
    .line 1540
    .line 1541
    goto/16 :goto_12

    .line 1542
    .line 1543
    :pswitch_3c
    move-object v0, v6

    .line 1544
    move/from16 v19, v11

    .line 1545
    .line 1546
    move-object v6, v1

    .line 1547
    move-object v11, v4

    .line 1548
    invoke-virtual {v6, v3, v11, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->J(ILandroidx/datastore/preferences/protobuf/k;Ljava/lang/Object;)V

    .line 1549
    .line 1550
    .line 1551
    invoke-virtual {v6, v7, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 1552
    .line 1553
    .line 1554
    goto/16 :goto_12

    .line 1555
    .line 1556
    :pswitch_3d
    move-object v0, v6

    .line 1557
    move/from16 v19, v11

    .line 1558
    .line 1559
    move-object v6, v1

    .line 1560
    move-object v11, v4

    .line 1561
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1562
    .line 1563
    .line 1564
    move-result-wide v3

    .line 1565
    const/4 v12, 0x0

    .line 1566
    invoke-virtual {v11, v12}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 1567
    .line 1568
    .line 1569
    iget-object v1, v11, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 1570
    .line 1571
    check-cast v1, Landroidx/datastore/preferences/protobuf/j;

    .line 1572
    .line 1573
    invoke-virtual {v1}, Landroidx/datastore/preferences/protobuf/j;->m()Z

    .line 1574
    .line 1575
    .line 1576
    move-result v1

    .line 1577
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 1578
    .line 1579
    invoke-virtual {v5, v2, v3, v4, v1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->k(Ljava/lang/Object;JZ)V

    .line 1580
    .line 1581
    .line 1582
    invoke-virtual {v6, v7, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 1583
    .line 1584
    .line 1585
    goto/16 :goto_12

    .line 1586
    .line 1587
    :pswitch_3e
    move-object v0, v6

    .line 1588
    move/from16 v19, v11

    .line 1589
    .line 1590
    move-object v6, v1

    .line 1591
    move-object v11, v4

    .line 1592
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1593
    .line 1594
    .line 1595
    move-result-wide v3

    .line 1596
    const/4 v1, 0x5

    .line 1597
    invoke-virtual {v11, v1}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 1598
    .line 1599
    .line 1600
    iget-object v1, v11, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 1601
    .line 1602
    check-cast v1, Landroidx/datastore/preferences/protobuf/j;

    .line 1603
    .line 1604
    invoke-virtual {v1}, Landroidx/datastore/preferences/protobuf/j;->r()I

    .line 1605
    .line 1606
    .line 1607
    move-result v1

    .line 1608
    invoke-static {v1, v3, v4, v2}, Lcom/google/crypto/tink/shaded/protobuf/h0;->n(IJLjava/lang/Object;)V

    .line 1609
    .line 1610
    .line 1611
    invoke-virtual {v6, v7, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 1612
    .line 1613
    .line 1614
    goto/16 :goto_12

    .line 1615
    .line 1616
    :pswitch_3f
    move-object v0, v6

    .line 1617
    move/from16 v19, v11

    .line 1618
    .line 1619
    move-object v6, v1

    .line 1620
    move-object v11, v4

    .line 1621
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1622
    .line 1623
    .line 1624
    move-result-wide v3

    .line 1625
    const/4 v1, 0x1

    .line 1626
    invoke-virtual {v11, v1}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 1627
    .line 1628
    .line 1629
    iget-object v1, v11, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 1630
    .line 1631
    check-cast v1, Landroidx/datastore/preferences/protobuf/j;

    .line 1632
    .line 1633
    invoke-virtual {v1}, Landroidx/datastore/preferences/protobuf/j;->s()J

    .line 1634
    .line 1635
    .line 1636
    move-result-wide v14

    .line 1637
    invoke-static {v2, v3, v4, v14, v15}, Lcom/google/crypto/tink/shaded/protobuf/h0;->o(Ljava/lang/Object;JJ)V

    .line 1638
    .line 1639
    .line 1640
    invoke-virtual {v6, v7, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 1641
    .line 1642
    .line 1643
    goto/16 :goto_12

    .line 1644
    .line 1645
    :pswitch_40
    move-object v0, v6

    .line 1646
    move/from16 v19, v11

    .line 1647
    .line 1648
    move-object v6, v1

    .line 1649
    move-object v11, v4

    .line 1650
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1651
    .line 1652
    .line 1653
    move-result-wide v3

    .line 1654
    const/4 v12, 0x0

    .line 1655
    invoke-virtual {v11, v12}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 1656
    .line 1657
    .line 1658
    iget-object v1, v11, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 1659
    .line 1660
    check-cast v1, Landroidx/datastore/preferences/protobuf/j;

    .line 1661
    .line 1662
    invoke-virtual {v1}, Landroidx/datastore/preferences/protobuf/j;->u()I

    .line 1663
    .line 1664
    .line 1665
    move-result v1

    .line 1666
    invoke-static {v1, v3, v4, v2}, Lcom/google/crypto/tink/shaded/protobuf/h0;->n(IJLjava/lang/Object;)V

    .line 1667
    .line 1668
    .line 1669
    invoke-virtual {v6, v7, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 1670
    .line 1671
    .line 1672
    goto/16 :goto_12

    .line 1673
    .line 1674
    :pswitch_41
    move-object v0, v6

    .line 1675
    move/from16 v19, v11

    .line 1676
    .line 1677
    move-object v6, v1

    .line 1678
    move-object v11, v4

    .line 1679
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1680
    .line 1681
    .line 1682
    move-result-wide v3

    .line 1683
    const/4 v12, 0x0

    .line 1684
    invoke-virtual {v11, v12}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 1685
    .line 1686
    .line 1687
    iget-object v1, v11, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 1688
    .line 1689
    check-cast v1, Landroidx/datastore/preferences/protobuf/j;

    .line 1690
    .line 1691
    invoke-virtual {v1}, Landroidx/datastore/preferences/protobuf/j;->E()J

    .line 1692
    .line 1693
    .line 1694
    move-result-wide v14

    .line 1695
    invoke-static {v2, v3, v4, v14, v15}, Lcom/google/crypto/tink/shaded/protobuf/h0;->o(Ljava/lang/Object;JJ)V

    .line 1696
    .line 1697
    .line 1698
    invoke-virtual {v6, v7, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 1699
    .line 1700
    .line 1701
    goto/16 :goto_12

    .line 1702
    .line 1703
    :pswitch_42
    move-object v0, v6

    .line 1704
    move/from16 v19, v11

    .line 1705
    .line 1706
    move-object v6, v1

    .line 1707
    move-object v11, v4

    .line 1708
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1709
    .line 1710
    .line 1711
    move-result-wide v3

    .line 1712
    const/4 v12, 0x0

    .line 1713
    invoke-virtual {v11, v12}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 1714
    .line 1715
    .line 1716
    iget-object v1, v11, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 1717
    .line 1718
    check-cast v1, Landroidx/datastore/preferences/protobuf/j;

    .line 1719
    .line 1720
    invoke-virtual {v1}, Landroidx/datastore/preferences/protobuf/j;->v()J

    .line 1721
    .line 1722
    .line 1723
    move-result-wide v14

    .line 1724
    invoke-static {v2, v3, v4, v14, v15}, Lcom/google/crypto/tink/shaded/protobuf/h0;->o(Ljava/lang/Object;JJ)V

    .line 1725
    .line 1726
    .line 1727
    invoke-virtual {v6, v7, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 1728
    .line 1729
    .line 1730
    goto/16 :goto_12

    .line 1731
    .line 1732
    :pswitch_43
    move-object v0, v6

    .line 1733
    move/from16 v19, v11

    .line 1734
    .line 1735
    move-object v6, v1

    .line 1736
    move-object v11, v4

    .line 1737
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1738
    .line 1739
    .line 1740
    move-result-wide v3

    .line 1741
    const/4 v1, 0x5

    .line 1742
    invoke-virtual {v11, v1}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 1743
    .line 1744
    .line 1745
    iget-object v1, v11, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 1746
    .line 1747
    check-cast v1, Landroidx/datastore/preferences/protobuf/j;

    .line 1748
    .line 1749
    invoke-virtual {v1}, Landroidx/datastore/preferences/protobuf/j;->t()F

    .line 1750
    .line 1751
    .line 1752
    move-result v1

    .line 1753
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 1754
    .line 1755
    invoke-virtual {v5, v2, v3, v4, v1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->n(Ljava/lang/Object;JF)V

    .line 1756
    .line 1757
    .line 1758
    invoke-virtual {v6, v7, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 1759
    .line 1760
    .line 1761
    goto :goto_12

    .line 1762
    :pswitch_44
    move-object v0, v6

    .line 1763
    move/from16 v19, v11

    .line 1764
    .line 1765
    move-object v6, v1

    .line 1766
    move-object v11, v4

    .line 1767
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->A(I)J

    .line 1768
    .line 1769
    .line 1770
    move-result-wide v3

    .line 1771
    const/4 v1, 0x1

    .line 1772
    invoke-virtual {v11, v1}, Landroidx/datastore/preferences/protobuf/k;->P(I)V

    .line 1773
    .line 1774
    .line 1775
    iget-object v1, v11, Landroidx/datastore/preferences/protobuf/k;->e:Ljava/lang/Object;

    .line 1776
    .line 1777
    check-cast v1, Landroidx/datastore/preferences/protobuf/j;

    .line 1778
    .line 1779
    invoke-virtual {v1}, Landroidx/datastore/preferences/protobuf/j;->p()D

    .line 1780
    .line 1781
    .line 1782
    move-result-wide v14

    .line 1783
    sget-object v0, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;
    :try_end_c
    .catch Lcom/google/crypto/tink/shaded/protobuf/B; {:try_start_c .. :try_end_c} :catch_8
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 1784
    .line 1785
    move-object v1, v2

    .line 1786
    move-wide v2, v3

    .line 1787
    move-wide v4, v14

    .line 1788
    :try_start_d
    invoke-virtual/range {v0 .. v5}, Lcom/google/crypto/tink/shaded/protobuf/g0;->m(Ljava/lang/Object;JD)V
    :try_end_d
    .catch Lcom/google/crypto/tink/shaded/protobuf/B; {:try_start_d .. :try_end_d} :catch_6
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    .line 1789
    .line 1790
    .line 1791
    move-object v2, v1

    .line 1792
    :try_start_e
    invoke-virtual {v6, v7, v2}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V
    :try_end_e
    .catch Lcom/google/crypto/tink/shaded/protobuf/B; {:try_start_e .. :try_end_e} :catch_8
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    .line 1793
    .line 1794
    .line 1795
    goto :goto_12

    .line 1796
    :catchall_3
    move-exception v0

    .line 1797
    move-object v2, v1

    .line 1798
    goto :goto_13

    .line 1799
    :catch_6
    move-object v2, v1

    .line 1800
    goto :goto_f

    .line 1801
    :catch_7
    move-object v6, v1

    .line 1802
    move/from16 v19, v11

    .line 1803
    .line 1804
    const/16 v16, 0x0

    .line 1805
    .line 1806
    goto/16 :goto_8

    .line 1807
    .line 1808
    :catch_8
    :goto_f
    :try_start_f
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1809
    .line 1810
    .line 1811
    if-nez v13, :cond_b

    .line 1812
    .line 1813
    invoke-static {v2}, Lcom/google/crypto/tink/shaded/protobuf/c0;->a(Ljava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/b0;

    .line 1814
    .line 1815
    .line 1816
    move-result-object v0

    .line 1817
    move-object v13, v0

    .line 1818
    :cond_b
    const/4 v12, 0x0

    .line 1819
    invoke-static {v12, v11, v13}, Lcom/google/crypto/tink/shaded/protobuf/c0;->b(ILandroidx/datastore/preferences/protobuf/k;Ljava/lang/Object;)Z

    .line 1820
    .line 1821
    .line 1822
    move-result v0
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_2

    .line 1823
    if-nez v0, :cond_e

    .line 1824
    .line 1825
    move/from16 v11, v19

    .line 1826
    .line 1827
    :goto_10
    if-ge v11, v10, :cond_c

    .line 1828
    .line 1829
    aget v0, v9, v11

    .line 1830
    .line 1831
    invoke-virtual {v6, v0, v2, v13}, Lcom/google/crypto/tink/shaded/protobuf/P;->m(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 1832
    .line 1833
    .line 1834
    add-int/lit8 v11, v11, 0x1

    .line 1835
    .line 1836
    goto :goto_10

    .line 1837
    :cond_c
    if-eqz v13, :cond_d

    .line 1838
    .line 1839
    move-object v0, v2

    .line 1840
    check-cast v0, Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 1841
    .line 1842
    iput-object v13, v0, Lcom/google/crypto/tink/shaded/protobuf/w;->unknownFields:Lcom/google/crypto/tink/shaded/protobuf/b0;

    .line 1843
    .line 1844
    :cond_d
    :goto_11
    return-void

    .line 1845
    :cond_e
    :goto_12
    move-object v1, v6

    .line 1846
    move-object v4, v11

    .line 1847
    move/from16 v11, v19

    .line 1848
    .line 1849
    move-object/from16 v6, p3

    .line 1850
    .line 1851
    goto/16 :goto_0

    .line 1852
    .line 1853
    :goto_13
    move/from16 v11, v19

    .line 1854
    .line 1855
    :goto_14
    if-ge v11, v10, :cond_f

    .line 1856
    .line 1857
    aget v1, v9, v11

    .line 1858
    .line 1859
    invoke-virtual {v6, v1, v2, v13}, Lcom/google/crypto/tink/shaded/protobuf/P;->m(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 1860
    .line 1861
    .line 1862
    add-int/lit8 v11, v11, 0x1

    .line 1863
    .line 1864
    goto :goto_14

    .line 1865
    :cond_f
    if-eqz v13, :cond_10

    .line 1866
    .line 1867
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1868
    .line 1869
    .line 1870
    move-object v1, v2

    .line 1871
    check-cast v1, Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 1872
    .line 1873
    iput-object v13, v1, Lcom/google/crypto/tink/shaded/protobuf/w;->unknownFields:Lcom/google/crypto/tink/shaded/protobuf/b0;

    .line 1874
    .line 1875
    :cond_10
    throw v0

    .line 1876
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
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

.method public final k(Lcom/google/crypto/tink/shaded/protobuf/w;Lcom/google/crypto/tink/shaded/protobuf/w;I)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p3, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->q(ILjava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p3, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->q(ILjava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-ne p1, p2, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    return p1

    .line 13
    :cond_0
    const/4 p1, 0x0

    .line 14
    return p1
.end method

.method public final m(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object p3, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->a:[I

    .line 2
    .line 3
    aget p3, p3, p1

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->S(I)I

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    const v0, 0xfffff

    .line 10
    .line 11
    .line 12
    and-int/2addr p3, v0

    .line 13
    int-to-long v0, p3

    .line 14
    sget-object p3, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 15
    .line 16
    invoke-virtual {p3, v0, v1, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    if-nez p2, :cond_0

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->n(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final n(I)V
    .locals 1

    .line 1
    div-int/lit8 p1, p1, 0x3

    .line 2
    .line 3
    mul-int/lit8 p1, p1, 0x2

    .line 4
    .line 5
    add-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->b:[Ljava/lang/Object;

    .line 8
    .line 9
    aget-object p1, v0, p1

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    new-instance p1, Ljava/lang/ClassCastException;

    .line 15
    .line 16
    invoke-direct {p1}, Ljava/lang/ClassCastException;-><init>()V

    .line 17
    .line 18
    .line 19
    throw p1
.end method

.method public final o(I)Ljava/lang/Object;
    .locals 1

    .line 1
    div-int/lit8 p1, p1, 0x3

    .line 2
    .line 3
    mul-int/lit8 p1, p1, 0x2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->b:[Ljava/lang/Object;

    .line 6
    .line 7
    aget-object p1, v0, p1

    .line 8
    .line 9
    return-object p1
.end method

.method public final p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;
    .locals 3

    .line 1
    div-int/lit8 p1, p1, 0x3

    .line 2
    .line 3
    mul-int/lit8 p1, p1, 0x2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->b:[Ljava/lang/Object;

    .line 6
    .line 7
    aget-object v1, v0, p1

    .line 8
    .line 9
    check-cast v1, Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    return-object v1

    .line 14
    :cond_0
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/V;->c:Lcom/google/crypto/tink/shaded/protobuf/V;

    .line 15
    .line 16
    add-int/lit8 v2, p1, 0x1

    .line 17
    .line 18
    aget-object v2, v0, v2

    .line 19
    .line 20
    check-cast v2, Ljava/lang/Class;

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Lcom/google/crypto/tink/shaded/protobuf/V;->a(Ljava/lang/Class;)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    aput-object v1, v0, p1

    .line 27
    .line 28
    return-object v1
.end method

.method public final q(ILjava/lang/Object;)Z
    .locals 6

    .line 1
    add-int/lit8 v0, p1, 0x2

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->a:[I

    .line 4
    .line 5
    aget v0, v1, v0

    .line 6
    .line 7
    const v1, 0xfffff

    .line 8
    .line 9
    .line 10
    and-int v2, v0, v1

    .line 11
    .line 12
    int-to-long v2, v2

    .line 13
    const-wide/32 v4, 0xfffff

    .line 14
    .line 15
    .line 16
    cmp-long v4, v2, v4

    .line 17
    .line 18
    const/4 v5, 0x1

    .line 19
    if-nez v4, :cond_2

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->S(I)I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    and-int v0, p1, v1

    .line 26
    .line 27
    int-to-long v0, v0

    .line 28
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->R(I)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    const-wide/16 v2, 0x0

    .line 33
    .line 34
    packed-switch p1, :pswitch_data_0

    .line 35
    .line 36
    .line 37
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 38
    .line 39
    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 40
    .line 41
    .line 42
    throw p1

    .line 43
    :pswitch_0
    sget-object p1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 44
    .line 45
    invoke-virtual {p1, v0, v1, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    goto/16 :goto_0

    .line 52
    .line 53
    :pswitch_1
    sget-object p1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 54
    .line 55
    invoke-virtual {p1, v0, v1, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->h(JLjava/lang/Object;)J

    .line 56
    .line 57
    .line 58
    move-result-wide p1

    .line 59
    cmp-long p1, p1, v2

    .line 60
    .line 61
    if-eqz p1, :cond_3

    .line 62
    .line 63
    goto/16 :goto_0

    .line 64
    .line 65
    :pswitch_2
    sget-object p1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 66
    .line 67
    invoke-virtual {p1, v0, v1, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_3

    .line 72
    .line 73
    goto/16 :goto_0

    .line 74
    .line 75
    :pswitch_3
    sget-object p1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 76
    .line 77
    invoke-virtual {p1, v0, v1, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->h(JLjava/lang/Object;)J

    .line 78
    .line 79
    .line 80
    move-result-wide p1

    .line 81
    cmp-long p1, p1, v2

    .line 82
    .line 83
    if-eqz p1, :cond_3

    .line 84
    .line 85
    goto/16 :goto_0

    .line 86
    .line 87
    :pswitch_4
    sget-object p1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 88
    .line 89
    invoke-virtual {p1, v0, v1, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-eqz p1, :cond_3

    .line 94
    .line 95
    goto/16 :goto_0

    .line 96
    .line 97
    :pswitch_5
    sget-object p1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 98
    .line 99
    invoke-virtual {p1, v0, v1, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-eqz p1, :cond_3

    .line 104
    .line 105
    goto/16 :goto_0

    .line 106
    .line 107
    :pswitch_6
    sget-object p1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 108
    .line 109
    invoke-virtual {p1, v0, v1, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-eqz p1, :cond_3

    .line 114
    .line 115
    goto/16 :goto_0

    .line 116
    .line 117
    :pswitch_7
    sget-object p1, Lcom/google/crypto/tink/shaded/protobuf/i;->f:Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 118
    .line 119
    sget-object v2, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 120
    .line 121
    invoke-virtual {v2, v0, v1, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    invoke-virtual {p1, p2}, Lcom/google/crypto/tink/shaded/protobuf/h;->equals(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    xor-int/2addr p1, v5

    .line 130
    return p1

    .line 131
    :pswitch_8
    sget-object p1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 132
    .line 133
    invoke-virtual {p1, v0, v1, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    if-eqz p1, :cond_3

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :pswitch_9
    sget-object p1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 142
    .line 143
    invoke-virtual {p1, v0, v1, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    instance-of p2, p1, Ljava/lang/String;

    .line 148
    .line 149
    if-eqz p2, :cond_0

    .line 150
    .line 151
    check-cast p1, Ljava/lang/String;

    .line 152
    .line 153
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    xor-int/2addr p1, v5

    .line 158
    return p1

    .line 159
    :cond_0
    instance-of p2, p1, Lcom/google/crypto/tink/shaded/protobuf/i;

    .line 160
    .line 161
    if-eqz p2, :cond_1

    .line 162
    .line 163
    sget-object p2, Lcom/google/crypto/tink/shaded/protobuf/i;->f:Lcom/google/crypto/tink/shaded/protobuf/h;

    .line 164
    .line 165
    invoke-virtual {p2, p1}, Lcom/google/crypto/tink/shaded/protobuf/h;->equals(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result p1

    .line 169
    xor-int/2addr p1, v5

    .line 170
    return p1

    .line 171
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 172
    .line 173
    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 174
    .line 175
    .line 176
    throw p1

    .line 177
    :pswitch_a
    sget-object p1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 178
    .line 179
    invoke-virtual {p1, v0, v1, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->c(JLjava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result p1

    .line 183
    return p1

    .line 184
    :pswitch_b
    sget-object p1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 185
    .line 186
    invoke-virtual {p1, v0, v1, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    if-eqz p1, :cond_3

    .line 191
    .line 192
    goto :goto_0

    .line 193
    :pswitch_c
    sget-object p1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 194
    .line 195
    invoke-virtual {p1, v0, v1, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->h(JLjava/lang/Object;)J

    .line 196
    .line 197
    .line 198
    move-result-wide p1

    .line 199
    cmp-long p1, p1, v2

    .line 200
    .line 201
    if-eqz p1, :cond_3

    .line 202
    .line 203
    goto :goto_0

    .line 204
    :pswitch_d
    sget-object p1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 205
    .line 206
    invoke-virtual {p1, v0, v1, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 207
    .line 208
    .line 209
    move-result p1

    .line 210
    if-eqz p1, :cond_3

    .line 211
    .line 212
    goto :goto_0

    .line 213
    :pswitch_e
    sget-object p1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 214
    .line 215
    invoke-virtual {p1, v0, v1, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->h(JLjava/lang/Object;)J

    .line 216
    .line 217
    .line 218
    move-result-wide p1

    .line 219
    cmp-long p1, p1, v2

    .line 220
    .line 221
    if-eqz p1, :cond_3

    .line 222
    .line 223
    goto :goto_0

    .line 224
    :pswitch_f
    sget-object p1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 225
    .line 226
    invoke-virtual {p1, v0, v1, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->h(JLjava/lang/Object;)J

    .line 227
    .line 228
    .line 229
    move-result-wide p1

    .line 230
    cmp-long p1, p1, v2

    .line 231
    .line 232
    if-eqz p1, :cond_3

    .line 233
    .line 234
    goto :goto_0

    .line 235
    :pswitch_10
    sget-object p1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 236
    .line 237
    invoke-virtual {p1, v0, v1, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->f(JLjava/lang/Object;)F

    .line 238
    .line 239
    .line 240
    move-result p1

    .line 241
    invoke-static {p1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    .line 242
    .line 243
    .line 244
    move-result p1

    .line 245
    if-eqz p1, :cond_3

    .line 246
    .line 247
    goto :goto_0

    .line 248
    :pswitch_11
    sget-object p1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 249
    .line 250
    invoke-virtual {p1, v0, v1, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->e(JLjava/lang/Object;)D

    .line 251
    .line 252
    .line 253
    move-result-wide p1

    .line 254
    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    .line 255
    .line 256
    .line 257
    move-result-wide p1

    .line 258
    cmp-long p1, p1, v2

    .line 259
    .line 260
    if-eqz p1, :cond_3

    .line 261
    .line 262
    goto :goto_0

    .line 263
    :cond_2
    ushr-int/lit8 p1, v0, 0x14

    .line 264
    .line 265
    shl-int p1, v5, p1

    .line 266
    .line 267
    sget-object v0, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 268
    .line 269
    invoke-virtual {v0, v2, v3, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 270
    .line 271
    .line 272
    move-result p2

    .line 273
    and-int/2addr p1, p2

    .line 274
    if-eqz p1, :cond_3

    .line 275
    .line 276
    :goto_0
    return v5

    .line 277
    :cond_3
    const/4 p1, 0x0

    .line 278
    return p1

    .line 279
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_11
        :pswitch_10
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

.method public final r(Ljava/lang/Object;IIII)Z
    .locals 1

    .line 1
    const v0, 0xfffff

    .line 2
    .line 3
    .line 4
    if-ne p3, v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, p2, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->q(ILjava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    return p1

    .line 11
    :cond_0
    and-int p1, p4, p5

    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    return p1

    .line 17
    :cond_1
    const/4 p1, 0x0

    .line 18
    return p1
.end method

.method public final t(Ljava/lang/Object;II)Z
    .locals 2

    .line 1
    add-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->a:[I

    .line 4
    .line 5
    aget p3, v0, p3

    .line 6
    .line 7
    const v0, 0xfffff

    .line 8
    .line 9
    .line 10
    and-int/2addr p3, v0

    .line 11
    int-to-long v0, p3

    .line 12
    sget-object p3, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 13
    .line 14
    invoke-virtual {p3, v0, v1, p1}, Lcom/google/crypto/tink/shaded/protobuf/g0;->g(JLjava/lang/Object;)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-ne p1, p2, :cond_0

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    return p1

    .line 22
    :cond_0
    const/4 p1, 0x0

    .line 23
    return p1
.end method

.method public final u(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->S(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const v0, 0xfffff

    .line 6
    .line 7
    .line 8
    and-int/2addr p1, v0

    .line 9
    int-to-long v0, p1

    .line 10
    sget-object p1, Lcom/google/crypto/tink/shaded/protobuf/h0;->c:Lcom/google/crypto/tink/shaded/protobuf/g0;

    .line 11
    .line 12
    invoke-virtual {p1, v0, v1, p2}, Lcom/google/crypto/tink/shaded/protobuf/g0;->i(JLjava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object v2, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->m:Lcom/google/crypto/tink/shaded/protobuf/K;

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    move-object v3, p1

    .line 24
    check-cast v3, Lcom/google/crypto/tink/shaded/protobuf/J;

    .line 25
    .line 26
    iget-boolean v3, v3, Lcom/google/crypto/tink/shaded/protobuf/J;->e:Z

    .line 27
    .line 28
    if-nez v3, :cond_1

    .line 29
    .line 30
    sget-object v3, Lcom/google/crypto/tink/shaded/protobuf/J;->f:Lcom/google/crypto/tink/shaded/protobuf/J;

    .line 31
    .line 32
    invoke-virtual {v3}, Lcom/google/crypto/tink/shaded/protobuf/J;->c()Lcom/google/crypto/tink/shaded/protobuf/J;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-static {v3, p1}, Lcom/google/crypto/tink/shaded/protobuf/K;->a(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/crypto/tink/shaded/protobuf/J;

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1, p2, v3}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    move-object p1, v3

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 45
    .line 46
    .line 47
    sget-object p1, Lcom/google/crypto/tink/shaded/protobuf/J;->f:Lcom/google/crypto/tink/shaded/protobuf/J;

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/google/crypto/tink/shaded/protobuf/J;->c()Lcom/google/crypto/tink/shaded/protobuf/J;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-static {v0, v1, p2, p1}, Lcom/google/crypto/tink/shaded/protobuf/h0;->p(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    :cond_1
    :goto_0
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 57
    .line 58
    .line 59
    check-cast p1, Lcom/google/crypto/tink/shaded/protobuf/J;

    .line 60
    .line 61
    invoke-static {p3}, LE1/j;->n(Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    const/4 p1, 0x0

    .line 65
    throw p1
.end method

.method public final v(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 5

    .line 1
    invoke-virtual {p0, p1, p3}, Lcom/google/crypto/tink/shaded/protobuf/P;->q(ILjava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->S(I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const v1, 0xfffff

    .line 13
    .line 14
    .line 15
    and-int/2addr v0, v1

    .line 16
    int-to-long v0, v0

    .line 17
    sget-object v2, Lcom/google/crypto/tink/shaded/protobuf/P;->o:Lsun/misc/Unsafe;

    .line 18
    .line 19
    invoke-virtual {v2, p3, v0, v1}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    if-eqz v3, :cond_4

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    invoke-virtual {p0, p1, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->q(ILjava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    if-nez v4, :cond_2

    .line 34
    .line 35
    invoke-static {v3}, Lcom/google/crypto/tink/shaded/protobuf/P;->s(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-nez v4, :cond_1

    .line 40
    .line 41
    invoke-virtual {v2, p2, v0, v1, v3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    invoke-interface {p3}, Lcom/google/crypto/tink/shaded/protobuf/Y;->d()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-interface {p3, v4, v3}, Lcom/google/crypto/tink/shaded/protobuf/Y;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2, p2, v0, v1, v4}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->M(ILjava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_2
    invoke-virtual {v2, p2, v0, v1}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->s(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    if-nez v4, :cond_3

    .line 68
    .line 69
    invoke-interface {p3}, Lcom/google/crypto/tink/shaded/protobuf/Y;->d()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-interface {p3, v4, p1}, Lcom/google/crypto/tink/shaded/protobuf/Y;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v2, p2, v0, v1, v4}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    move-object p1, v4

    .line 80
    :cond_3
    invoke-interface {p3, p1, v3}, Lcom/google/crypto/tink/shaded/protobuf/Y;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_4
    new-instance p2, Ljava/lang/IllegalStateException;

    .line 85
    .line 86
    new-instance v0, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    const-string v1, "Source subfield "

    .line 89
    .line 90
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->a:[I

    .line 94
    .line 95
    aget p1, v1, p1

    .line 96
    .line 97
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    const-string p1, " is present but null: "

    .line 101
    .line 102
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    throw p2
.end method

.method public final w(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/P;->a:[I

    .line 2
    .line 3
    aget v1, v0, p1

    .line 4
    .line 5
    invoke-virtual {p0, p3, v1, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->S(I)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    const v3, 0xfffff

    .line 17
    .line 18
    .line 19
    and-int/2addr v2, v3

    .line 20
    int-to-long v2, v2

    .line 21
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/P;->o:Lsun/misc/Unsafe;

    .line 22
    .line 23
    invoke-virtual {v4, p3, v2, v3}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    if-eqz v5, :cond_4

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    invoke-virtual {p0, p2, v1, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_2

    .line 38
    .line 39
    invoke-static {v5}, Lcom/google/crypto/tink/shaded/protobuf/P;->s(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_1

    .line 44
    .line 45
    invoke-virtual {v4, p2, v2, v3, v5}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    invoke-interface {p3}, Lcom/google/crypto/tink/shaded/protobuf/Y;->d()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-interface {p3, v0, v5}, Lcom/google/crypto/tink/shaded/protobuf/Y;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v4, p2, v2, v3, v0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    :goto_0
    invoke-virtual {p0, p2, v1, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->N(Ljava/lang/Object;II)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    invoke-virtual {v4, p2, v2, v3}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->s(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_3

    .line 72
    .line 73
    invoke-interface {p3}, Lcom/google/crypto/tink/shaded/protobuf/Y;->d()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-interface {p3, v0, p1}, Lcom/google/crypto/tink/shaded/protobuf/Y;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v4, p2, v2, v3, v0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    move-object p1, v0

    .line 84
    :cond_3
    invoke-interface {p3, p1, v5}, Lcom/google/crypto/tink/shaded/protobuf/Y;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_4
    new-instance p2, Ljava/lang/IllegalStateException;

    .line 89
    .line 90
    new-instance v1, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    const-string v2, "Source subfield "

    .line 93
    .line 94
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    aget p1, v0, p1

    .line 98
    .line 99
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string p1, " is present but null: "

    .line 103
    .line 104
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    throw p2
.end method

.method public final x(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->S(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const v2, 0xfffff

    .line 10
    .line 11
    .line 12
    and-int/2addr v1, v2

    .line 13
    int-to-long v1, v1

    .line 14
    invoke-virtual {p0, p1, p2}, Lcom/google/crypto/tink/shaded/protobuf/P;->q(ILjava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    invoke-interface {v0}, Lcom/google/crypto/tink/shaded/protobuf/Y;->d()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    return-object p1

    .line 25
    :cond_0
    sget-object p1, Lcom/google/crypto/tink/shaded/protobuf/P;->o:Lsun/misc/Unsafe;

    .line 26
    .line 27
    invoke-virtual {p1, p2, v1, v2}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->s(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-eqz p2, :cond_1

    .line 36
    .line 37
    return-object p1

    .line 38
    :cond_1
    invoke-interface {v0}, Lcom/google/crypto/tink/shaded/protobuf/Y;->d()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    if-eqz p1, :cond_2

    .line 43
    .line 44
    invoke-interface {v0, p2, p1}, Lcom/google/crypto/tink/shaded/protobuf/Y;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    :cond_2
    return-object p2
.end method

.method public final y(Ljava/lang/Object;II)Ljava/lang/Object;
    .locals 3

    .line 1
    invoke-virtual {p0, p3}, Lcom/google/crypto/tink/shaded/protobuf/P;->p(I)Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/crypto/tink/shaded/protobuf/P;->t(Ljava/lang/Object;II)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    invoke-interface {v0}, Lcom/google/crypto/tink/shaded/protobuf/Y;->d()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    return-object p1

    .line 16
    :cond_0
    sget-object p2, Lcom/google/crypto/tink/shaded/protobuf/P;->o:Lsun/misc/Unsafe;

    .line 17
    .line 18
    invoke-virtual {p0, p3}, Lcom/google/crypto/tink/shaded/protobuf/P;->S(I)I

    .line 19
    .line 20
    .line 21
    move-result p3

    .line 22
    const v1, 0xfffff

    .line 23
    .line 24
    .line 25
    and-int/2addr p3, v1

    .line 26
    int-to-long v1, p3

    .line 27
    invoke-virtual {p2, p1, v1, v2}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {p1}, Lcom/google/crypto/tink/shaded/protobuf/P;->s(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-eqz p2, :cond_1

    .line 36
    .line 37
    return-object p1

    .line 38
    :cond_1
    invoke-interface {v0}, Lcom/google/crypto/tink/shaded/protobuf/Y;->d()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    if-eqz p1, :cond_2

    .line 43
    .line 44
    invoke-interface {v0, p2, p1}, Lcom/google/crypto/tink/shaded/protobuf/Y;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    :cond_2
    return-object p2
.end method
