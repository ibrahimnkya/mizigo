.class public final Lp1/h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ls1/F;


# static fields
.field public static final a:Lp1/h;

.field public static final b:Ls1/B;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lp1/h;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lp1/h;->a:Lp1/h;

    .line 7
    .line 8
    new-instance v0, Ll1/b;

    .line 9
    .line 10
    const/16 v1, 0x19

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ll1/b;-><init>(I)V

    .line 13
    .line 14
    .line 15
    new-instance v1, Ls1/B;

    .line 16
    .line 17
    const-class v2, Ls1/i;

    .line 18
    .line 19
    const-class v3, Lj1/b;

    .line 20
    .line 21
    invoke-direct {v1, v2, v3, v0}, Ls1/B;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ls1/C;)V

    .line 22
    .line 23
    .line 24
    sput-object v1, Lp1/h;->b:Ls1/B;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Class;
    .locals 1

    .line 1
    const-class v0, Lj1/b;

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
    invoke-virtual {p3, v2}, LE0/j;->a(Lj1/f;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    check-cast v3, Lj1/b;

    .line 36
    .line 37
    invoke-virtual {v2}, Lj1/f;->a()Landroid/support/v4/media/session/a;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    instance-of v5, v4, Lp1/a;

    .line 42
    .line 43
    if-eqz v5, :cond_0

    .line 44
    .line 45
    check-cast v4, Lp1/a;

    .line 46
    .line 47
    iget-object v4, v4, Lp1/a;->f:Lz1/a;

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_0
    instance-of v5, v4, Ls1/i;

    .line 51
    .line 52
    if-eqz v5, :cond_4

    .line 53
    .line 54
    check-cast v4, Ls1/i;

    .line 55
    .line 56
    invoke-virtual {v4}, Ls1/i;->c0()Lz1/a;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    :goto_1
    new-instance v5, Lp1/f;

    .line 61
    .line 62
    iget v2, v2, Lj1/f;->d:I

    .line 63
    .line 64
    invoke-direct {v5, v3, v2}, Lp1/f;-><init>(Lj1/b;I)V

    .line 65
    .line 66
    .line 67
    iget-object v2, v4, Lz1/a;->a:[B

    .line 68
    .line 69
    array-length v3, v2

    .line 70
    if-eqz v3, :cond_2

    .line 71
    .line 72
    array-length v2, v2

    .line 73
    const/4 v3, 0x5

    .line 74
    if-ne v2, v3, :cond_1

    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_1
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 78
    .line 79
    const-string p2, "PrefixMap only supports 0 and 5 byte prefixes"

    .line 80
    .line 81
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    throw p1

    .line 85
    :cond_2
    :goto_2
    invoke-virtual {v0, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    if-eqz v2, :cond_3

    .line 90
    .line 91
    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    check-cast v2, Ljava/util/List;

    .line 96
    .line 97
    goto :goto_3

    .line 98
    :cond_3
    new-instance v2, Ljava/util/ArrayList;

    .line 99
    .line 100
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    :goto_3
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    goto :goto_4

    .line 110
    :cond_4
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 111
    .line 112
    new-instance p2, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    const-string p3, "Cannot get output prefix for key of class "

    .line 115
    .line 116
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 120
    .line 121
    .line 122
    move-result-object p3

    .line 123
    invoke-virtual {p3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p3

    .line 127
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    const-string p3, " with parameters "

    .line 131
    .line 132
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v4}, Landroid/support/v4/media/session/a;->p()Lj1/i;

    .line 136
    .line 137
    .line 138
    move-result-object p3

    .line 139
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    throw p1

    .line 150
    :cond_5
    :goto_4
    add-int/lit8 v1, v1, 0x1

    .line 151
    .line 152
    goto/16 :goto_0

    .line 153
    .line 154
    :cond_6
    iget-object p2, p2, Ls1/k;->a:Ljava/util/Map;

    .line 155
    .line 156
    invoke-interface {p2}, Ljava/util/Map;->isEmpty()Z

    .line 157
    .line 158
    .line 159
    move-result p2

    .line 160
    if-nez p2, :cond_8

    .line 161
    .line 162
    sget-object p2, Ls1/o;->b:Ls1/o;

    .line 163
    .line 164
    iget-object p2, p2, Ls1/o;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 165
    .line 166
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object p2

    .line 170
    check-cast p2, Ls1/n;

    .line 171
    .line 172
    if-nez p2, :cond_7

    .line 173
    .line 174
    sget-object p2, Ls1/o;->c:Ls1/n;

    .line 175
    .line 176
    :cond_7
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 177
    .line 178
    .line 179
    :cond_8
    new-instance p2, Lp1/g;

    .line 180
    .line 181
    new-instance v1, Lp1/f;

    .line 182
    .line 183
    invoke-virtual {p1}, LB2/a;->A()Lj1/f;

    .line 184
    .line 185
    .line 186
    move-result-object v2

    .line 187
    invoke-virtual {p3, v2}, LE0/j;->a(Lj1/f;)Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object p3

    .line 191
    check-cast p3, Lj1/b;

    .line 192
    .line 193
    invoke-virtual {p1}, LB2/a;->A()Lj1/f;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    iget p1, p1, Lj1/f;->d:I

    .line 198
    .line 199
    invoke-direct {v1, p3, p1}, Lp1/f;-><init>(Lj1/b;I)V

    .line 200
    .line 201
    .line 202
    new-instance p1, Ls1/A;

    .line 203
    .line 204
    invoke-direct {p1, v0}, Ls1/A;-><init>(Ljava/util/HashMap;)V

    .line 205
    .line 206
    .line 207
    invoke-direct {p2, v1, p1}, Lp1/g;-><init>(Lp1/f;Ls1/A;)V

    .line 208
    .line 209
    .line 210
    return-object p2
.end method

.method public final c()Ljava/lang/Class;
    .locals 1

    .line 1
    const-class v0, Lj1/b;

    .line 2
    .line 3
    return-object v0
.end method
