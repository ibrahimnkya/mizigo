.class public final Lcom/google/crypto/tink/shaded/protobuf/V;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Lcom/google/crypto/tink/shaded/protobuf/V;


# instance fields
.field public final a:Lcom/google/crypto/tink/shaded/protobuf/I;

.field public final b:Ljava/util/concurrent/ConcurrentHashMap;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/crypto/tink/shaded/protobuf/V;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/crypto/tink/shaded/protobuf/V;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/crypto/tink/shaded/protobuf/V;->c:Lcom/google/crypto/tink/shaded/protobuf/V;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/V;->b:Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    new-instance v0, Lcom/google/crypto/tink/shaded/protobuf/I;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/google/crypto/tink/shaded/protobuf/I;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/V;->a:Lcom/google/crypto/tink/shaded/protobuf/I;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Class;)Lcom/google/crypto/tink/shaded/protobuf/Y;
    .locals 9

    .line 1
    const-string v0, "messageType"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/google/crypto/tink/shaded/protobuf/A;->a(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/google/crypto/tink/shaded/protobuf/V;->b:Ljava/util/concurrent/ConcurrentHashMap;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 13
    .line 14
    if-nez v1, :cond_c

    .line 15
    .line 16
    iget-object v1, p0, Lcom/google/crypto/tink/shaded/protobuf/V;->a:Lcom/google/crypto/tink/shaded/protobuf/I;

    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    sget-object v2, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 22
    .line 23
    const-class v2, Lcom/google/crypto/tink/shaded/protobuf/w;

    .line 24
    .line 25
    invoke-virtual {v2, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-nez v3, :cond_1

    .line 30
    .line 31
    sget-object v3, Lcom/google/crypto/tink/shaded/protobuf/Z;->a:Ljava/lang/Class;

    .line 32
    .line 33
    if-eqz v3, :cond_1

    .line 34
    .line 35
    invoke-virtual {v3, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-eqz v3, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 43
    .line 44
    const-string v0, "Message classes must extend GeneratedMessage or GeneratedMessageLite"

    .line 45
    .line 46
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    throw p1

    .line 50
    :cond_1
    :goto_0
    iget-object v1, v1, Lcom/google/crypto/tink/shaded/protobuf/I;->a:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast v1, Lcom/google/crypto/tink/shaded/protobuf/H;

    .line 53
    .line 54
    invoke-virtual {v1, p1}, Lcom/google/crypto/tink/shaded/protobuf/H;->a(Ljava/lang/Class;)Lcom/google/crypto/tink/shaded/protobuf/X;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    iget v1, v3, Lcom/google/crypto/tink/shaded/protobuf/X;->d:I

    .line 59
    .line 60
    iget-object v4, v3, Lcom/google/crypto/tink/shaded/protobuf/X;->a:Lcom/google/crypto/tink/shaded/protobuf/a;

    .line 61
    .line 62
    const/4 v5, 0x2

    .line 63
    and-int/2addr v1, v5

    .line 64
    const-string v6, "Protobuf runtime is not correctly loaded."

    .line 65
    .line 66
    if-ne v1, v5, :cond_4

    .line 67
    .line 68
    invoke-virtual {v2, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-eqz v1, :cond_2

    .line 73
    .line 74
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/Z;->c:Lcom/google/crypto/tink/shaded/protobuf/c0;

    .line 75
    .line 76
    sget-object v2, Lcom/google/crypto/tink/shaded/protobuf/q;->a:Lcom/google/crypto/tink/shaded/protobuf/p;

    .line 77
    .line 78
    new-instance v3, Lcom/google/crypto/tink/shaded/protobuf/Q;

    .line 79
    .line 80
    invoke-direct {v3, v1, v2, v4}, Lcom/google/crypto/tink/shaded/protobuf/Q;-><init>(Lcom/google/crypto/tink/shaded/protobuf/c0;Lcom/google/crypto/tink/shaded/protobuf/p;Lcom/google/crypto/tink/shaded/protobuf/a;)V

    .line 81
    .line 82
    .line 83
    goto/16 :goto_2

    .line 84
    .line 85
    :cond_2
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/Z;->b:Lcom/google/crypto/tink/shaded/protobuf/c0;

    .line 86
    .line 87
    sget-object v2, Lcom/google/crypto/tink/shaded/protobuf/q;->b:Lcom/google/crypto/tink/shaded/protobuf/p;

    .line 88
    .line 89
    if-eqz v2, :cond_3

    .line 90
    .line 91
    new-instance v3, Lcom/google/crypto/tink/shaded/protobuf/Q;

    .line 92
    .line 93
    invoke-direct {v3, v1, v2, v4}, Lcom/google/crypto/tink/shaded/protobuf/Q;-><init>(Lcom/google/crypto/tink/shaded/protobuf/c0;Lcom/google/crypto/tink/shaded/protobuf/p;Lcom/google/crypto/tink/shaded/protobuf/a;)V

    .line 94
    .line 95
    .line 96
    goto :goto_2

    .line 97
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 98
    .line 99
    invoke-direct {p1, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    throw p1

    .line 103
    :cond_4
    invoke-virtual {v2, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    const/4 v2, 0x1

    .line 108
    const/4 v4, 0x0

    .line 109
    if-eqz v1, :cond_7

    .line 110
    .line 111
    move-object v1, v4

    .line 112
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/T;->b:Lcom/google/crypto/tink/shaded/protobuf/S;

    .line 113
    .line 114
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/F;->b:Lcom/google/crypto/tink/shaded/protobuf/E;

    .line 115
    .line 116
    sget-object v6, Lcom/google/crypto/tink/shaded/protobuf/Z;->c:Lcom/google/crypto/tink/shaded/protobuf/c0;

    .line 117
    .line 118
    invoke-virtual {v3}, Lcom/google/crypto/tink/shaded/protobuf/X;->a()I

    .line 119
    .line 120
    .line 121
    move-result v7

    .line 122
    invoke-static {v7}, LL/i;->b(I)I

    .line 123
    .line 124
    .line 125
    move-result v7

    .line 126
    if-eq v7, v2, :cond_5

    .line 127
    .line 128
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/q;->a:Lcom/google/crypto/tink/shaded/protobuf/p;

    .line 129
    .line 130
    :cond_5
    move-object v7, v1

    .line 131
    sget-object v8, Lcom/google/crypto/tink/shaded/protobuf/L;->b:Lcom/google/crypto/tink/shaded/protobuf/K;

    .line 132
    .line 133
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/P;->n:[I

    .line 134
    .line 135
    instance-of v1, v3, Lcom/google/crypto/tink/shaded/protobuf/X;

    .line 136
    .line 137
    if-eqz v1, :cond_6

    .line 138
    .line 139
    invoke-static/range {v3 .. v8}, Lcom/google/crypto/tink/shaded/protobuf/P;->z(Lcom/google/crypto/tink/shaded/protobuf/X;Lcom/google/crypto/tink/shaded/protobuf/S;Lcom/google/crypto/tink/shaded/protobuf/E;Lcom/google/crypto/tink/shaded/protobuf/c0;Lcom/google/crypto/tink/shaded/protobuf/p;Lcom/google/crypto/tink/shaded/protobuf/K;)Lcom/google/crypto/tink/shaded/protobuf/P;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    goto :goto_2

    .line 144
    :cond_6
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 145
    .line 146
    .line 147
    new-instance p1, Ljava/lang/ClassCastException;

    .line 148
    .line 149
    invoke-direct {p1}, Ljava/lang/ClassCastException;-><init>()V

    .line 150
    .line 151
    .line 152
    throw p1

    .line 153
    :cond_7
    move-object v1, v4

    .line 154
    sget-object v4, Lcom/google/crypto/tink/shaded/protobuf/T;->a:Lcom/google/crypto/tink/shaded/protobuf/S;

    .line 155
    .line 156
    sget-object v5, Lcom/google/crypto/tink/shaded/protobuf/F;->a:Lcom/google/crypto/tink/shaded/protobuf/E;

    .line 157
    .line 158
    move-object v7, v6

    .line 159
    sget-object v6, Lcom/google/crypto/tink/shaded/protobuf/Z;->b:Lcom/google/crypto/tink/shaded/protobuf/c0;

    .line 160
    .line 161
    invoke-virtual {v3}, Lcom/google/crypto/tink/shaded/protobuf/X;->a()I

    .line 162
    .line 163
    .line 164
    move-result v8

    .line 165
    invoke-static {v8}, LL/i;->b(I)I

    .line 166
    .line 167
    .line 168
    move-result v8

    .line 169
    if-eq v8, v2, :cond_8

    .line 170
    .line 171
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/q;->b:Lcom/google/crypto/tink/shaded/protobuf/p;

    .line 172
    .line 173
    if-eqz v1, :cond_9

    .line 174
    .line 175
    :cond_8
    move-object v7, v1

    .line 176
    goto :goto_1

    .line 177
    :cond_9
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 178
    .line 179
    invoke-direct {p1, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    throw p1

    .line 183
    :goto_1
    sget-object v8, Lcom/google/crypto/tink/shaded/protobuf/L;->a:Lcom/google/crypto/tink/shaded/protobuf/K;

    .line 184
    .line 185
    sget-object v1, Lcom/google/crypto/tink/shaded/protobuf/P;->n:[I

    .line 186
    .line 187
    instance-of v1, v3, Lcom/google/crypto/tink/shaded/protobuf/X;

    .line 188
    .line 189
    if-eqz v1, :cond_b

    .line 190
    .line 191
    invoke-static/range {v3 .. v8}, Lcom/google/crypto/tink/shaded/protobuf/P;->z(Lcom/google/crypto/tink/shaded/protobuf/X;Lcom/google/crypto/tink/shaded/protobuf/S;Lcom/google/crypto/tink/shaded/protobuf/E;Lcom/google/crypto/tink/shaded/protobuf/c0;Lcom/google/crypto/tink/shaded/protobuf/p;Lcom/google/crypto/tink/shaded/protobuf/K;)Lcom/google/crypto/tink/shaded/protobuf/P;

    .line 192
    .line 193
    .line 194
    move-result-object v3

    .line 195
    :goto_2
    invoke-virtual {v0, p1, v3}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    check-cast p1, Lcom/google/crypto/tink/shaded/protobuf/Y;

    .line 200
    .line 201
    if-eqz p1, :cond_a

    .line 202
    .line 203
    return-object p1

    .line 204
    :cond_a
    return-object v3

    .line 205
    :cond_b
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 206
    .line 207
    .line 208
    new-instance p1, Ljava/lang/ClassCastException;

    .line 209
    .line 210
    invoke-direct {p1}, Ljava/lang/ClassCastException;-><init>()V

    .line 211
    .line 212
    .line 213
    throw p1

    .line 214
    :cond_c
    return-object v1
.end method
