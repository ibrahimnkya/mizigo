.class public final Lk1/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ls1/F;


# static fields
.field public static final a:Lk1/f;

.field public static final b:Ls1/B;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lk1/f;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lk1/f;->a:Lk1/f;

    .line 7
    .line 8
    new-instance v0, Lb2/f;

    .line 9
    .line 10
    const/4 v1, 0x7

    .line 11
    invoke-direct {v0, v1}, Lb2/f;-><init>(I)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Ls1/B;

    .line 15
    .line 16
    const-class v2, Ls1/i;

    .line 17
    .line 18
    const-class v3, Lj1/a;

    .line 19
    .line 20
    invoke-direct {v1, v2, v3, v0}, Ls1/B;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ls1/C;)V

    .line 21
    .line 22
    .line 23
    sput-object v1, Lk1/f;->b:Ls1/B;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Class;
    .locals 1

    .line 1
    const-class v0, Lj1/a;

    .line 2
    .line 3
    return-object v0
.end method

.method public final b(LB2/a;Ls1/k;LE0/j;)Ljava/lang/Object;
    .locals 6

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    iget-object v2, p1, LB2/a;->f:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v2, Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-ge v1, v2, :cond_6

    .line 16
    .line 17
    invoke-virtual {p1, v1}, LB2/a;->w(I)Lj1/f;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget-object v3, v2, Lj1/f;->c:Lj1/c;

    .line 22
    .line 23
    sget-object v4, Lj1/c;->c:Lj1/c;

    .line 24
    .line 25
    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_5

    .line 30
    .line 31
    invoke-virtual {v2}, Lj1/f;->a()Landroid/support/v4/media/session/a;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    instance-of v4, v3, Lk1/b;

    .line 36
    .line 37
    if-eqz v4, :cond_0

    .line 38
    .line 39
    check-cast v3, Lk1/b;

    .line 40
    .line 41
    invoke-virtual {v3}, Lk1/b;->c0()Lz1/a;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    goto :goto_1

    .line 46
    :cond_0
    instance-of v4, v3, Ls1/i;

    .line 47
    .line 48
    if-eqz v4, :cond_4

    .line 49
    .line 50
    check-cast v3, Ls1/i;

    .line 51
    .line 52
    invoke-virtual {v3}, Ls1/i;->c0()Lz1/a;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    :goto_1
    new-instance v4, Lk1/d;

    .line 57
    .line 58
    invoke-virtual {p3, v2}, LE0/j;->a(Lj1/f;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    check-cast v5, Lj1/a;

    .line 63
    .line 64
    iget v2, v2, Lj1/f;->d:I

    .line 65
    .line 66
    invoke-direct {v4, v5, v2}, Lk1/d;-><init>(Lj1/a;I)V

    .line 67
    .line 68
    .line 69
    iget-object v2, v3, Lz1/a;->a:[B

    .line 70
    .line 71
    array-length v5, v2

    .line 72
    if-eqz v5, :cond_2

    .line 73
    .line 74
    array-length v2, v2

    .line 75
    const/4 v5, 0x5

    .line 76
    if-ne v2, v5, :cond_1

    .line 77
    .line 78
    goto :goto_2

    .line 79
    :cond_1
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 80
    .line 81
    const-string p2, "PrefixMap only supports 0 and 5 byte prefixes"

    .line 82
    .line 83
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    throw p1

    .line 87
    :cond_2
    :goto_2
    invoke-virtual {v0, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    if-eqz v2, :cond_3

    .line 92
    .line 93
    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    check-cast v2, Ljava/util/List;

    .line 98
    .line 99
    goto :goto_3

    .line 100
    :cond_3
    new-instance v2, Ljava/util/ArrayList;

    .line 101
    .line 102
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    :goto_3
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    goto :goto_4

    .line 112
    :cond_4
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 113
    .line 114
    new-instance p2, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    const-string p3, "Cannot get output prefix for key of class "

    .line 117
    .line 118
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 122
    .line 123
    .line 124
    move-result-object p3

    .line 125
    invoke-virtual {p3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p3

    .line 129
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    const-string p3, " with parameters "

    .line 133
    .line 134
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {v3}, Landroid/support/v4/media/session/a;->p()Lj1/i;

    .line 138
    .line 139
    .line 140
    move-result-object p3

    .line 141
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p2

    .line 148
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    throw p1

    .line 152
    :cond_5
    :goto_4
    add-int/lit8 v1, v1, 0x1

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :cond_6
    iget-object p2, p2, Ls1/k;->a:Ljava/util/Map;

    .line 157
    .line 158
    invoke-interface {p2}, Ljava/util/Map;->isEmpty()Z

    .line 159
    .line 160
    .line 161
    move-result p2

    .line 162
    if-nez p2, :cond_8

    .line 163
    .line 164
    sget-object p2, Ls1/o;->b:Ls1/o;

    .line 165
    .line 166
    iget-object p2, p2, Ls1/o;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 167
    .line 168
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object p2

    .line 172
    check-cast p2, Ls1/n;

    .line 173
    .line 174
    if-nez p2, :cond_7

    .line 175
    .line 176
    sget-object p2, Ls1/o;->c:Ls1/n;

    .line 177
    .line 178
    :cond_7
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 179
    .line 180
    .line 181
    :cond_8
    new-instance p2, Lk1/e;

    .line 182
    .line 183
    new-instance v1, Lk1/d;

    .line 184
    .line 185
    invoke-virtual {p1}, LB2/a;->A()Lj1/f;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    invoke-virtual {p3, v2}, LE0/j;->a(Lj1/f;)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object p3

    .line 193
    check-cast p3, Lj1/a;

    .line 194
    .line 195
    invoke-virtual {p1}, LB2/a;->A()Lj1/f;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    iget p1, p1, Lj1/f;->d:I

    .line 200
    .line 201
    invoke-direct {v1, p3, p1}, Lk1/d;-><init>(Lj1/a;I)V

    .line 202
    .line 203
    .line 204
    new-instance p1, Ls1/A;

    .line 205
    .line 206
    invoke-direct {p1, v0}, Ls1/A;-><init>(Ljava/util/HashMap;)V

    .line 207
    .line 208
    .line 209
    invoke-direct {p2, v1, p1}, Lk1/e;-><init>(Lk1/d;Ls1/A;)V

    .line 210
    .line 211
    .line 212
    return-object p2
.end method

.method public final c()Ljava/lang/Class;
    .locals 1

    .line 1
    const-class v0, Lj1/a;

    .line 2
    .line 3
    return-object v0
.end method
