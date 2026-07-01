.class public abstract Lu1/c;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:LM0/f;

.field public static final b:LM0/f;

.field public static final c:Ls1/w;

.field public static final d:Ls1/u;

.field public static final e:Ls1/e;

.field public static final f:Ls1/c;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    const-string v0, "type.googleapis.com/google.crypto.tink.HmacKey"

    .line 2
    .line 3
    invoke-static {v0}, Ls1/N;->c(Ljava/lang/String;)Lz1/a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v2, Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 15
    .line 16
    .line 17
    sget-object v3, Lx1/t0;->i:Lx1/t0;

    .line 18
    .line 19
    sget-object v4, Lt1/k;->e:Lt1/k;

    .line 20
    .line 21
    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    sget-object v3, Lx1/t0;->g:Lx1/t0;

    .line 28
    .line 29
    sget-object v4, Lt1/k;->b:Lt1/k;

    .line 30
    .line 31
    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    sget-object v3, Lx1/t0;->h:Lx1/t0;

    .line 38
    .line 39
    sget-object v4, Lt1/k;->d:Lt1/k;

    .line 40
    .line 41
    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    sget-object v3, Lx1/t0;->j:Lx1/t0;

    .line 48
    .line 49
    sget-object v4, Lt1/k;->c:Lt1/k;

    .line 50
    .line 51
    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    new-instance v3, LM0/f;

    .line 58
    .line 59
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-direct {v3, v1, v2}, LM0/f;-><init>(Ljava/util/Map;Ljava/util/Map;)V

    .line 68
    .line 69
    .line 70
    sput-object v3, Lu1/c;->a:LM0/f;

    .line 71
    .line 72
    new-instance v1, Ljava/util/HashMap;

    .line 73
    .line 74
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 75
    .line 76
    .line 77
    new-instance v2, Ljava/util/HashMap;

    .line 78
    .line 79
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 80
    .line 81
    .line 82
    sget-object v3, Lx1/O;->g:Lx1/O;

    .line 83
    .line 84
    sget-object v4, Lt1/j;->b:Lt1/j;

    .line 85
    .line 86
    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v2, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    sget-object v3, Lx1/O;->k:Lx1/O;

    .line 93
    .line 94
    sget-object v4, Lt1/j;->c:Lt1/j;

    .line 95
    .line 96
    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v2, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    sget-object v3, Lx1/O;->i:Lx1/O;

    .line 103
    .line 104
    sget-object v4, Lt1/j;->d:Lt1/j;

    .line 105
    .line 106
    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v2, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    sget-object v3, Lx1/O;->h:Lx1/O;

    .line 113
    .line 114
    sget-object v4, Lt1/j;->e:Lt1/j;

    .line 115
    .line 116
    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v2, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    sget-object v3, Lx1/O;->j:Lx1/O;

    .line 123
    .line 124
    sget-object v4, Lt1/j;->f:Lt1/j;

    .line 125
    .line 126
    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v2, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    new-instance v3, LM0/f;

    .line 133
    .line 134
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    invoke-direct {v3, v1, v2}, LM0/f;-><init>(Ljava/util/Map;Ljava/util/Map;)V

    .line 143
    .line 144
    .line 145
    sput-object v3, Lu1/c;->b:LM0/f;

    .line 146
    .line 147
    new-instance v1, Ls1/r;

    .line 148
    .line 149
    const/16 v2, 0xa

    .line 150
    .line 151
    invoke-direct {v1, v2}, Ls1/r;-><init>(I)V

    .line 152
    .line 153
    .line 154
    new-instance v2, Ls1/w;

    .line 155
    .line 156
    const-class v3, Lt1/l;

    .line 157
    .line 158
    invoke-direct {v2, v3, v1}, Ls1/w;-><init>(Ljava/lang/Class;Ls1/x;)V

    .line 159
    .line 160
    .line 161
    sput-object v2, Lu1/c;->c:Ls1/w;

    .line 162
    .line 163
    new-instance v1, Ls1/r;

    .line 164
    .line 165
    const/16 v2, 0xb

    .line 166
    .line 167
    invoke-direct {v1, v2}, Ls1/r;-><init>(I)V

    .line 168
    .line 169
    .line 170
    new-instance v2, Ls1/u;

    .line 171
    .line 172
    invoke-direct {v2, v0, v1}, Ls1/u;-><init>(Lz1/a;Ls1/v;)V

    .line 173
    .line 174
    .line 175
    sput-object v2, Lu1/c;->d:Ls1/u;

    .line 176
    .line 177
    new-instance v1, Ls1/r;

    .line 178
    .line 179
    const/16 v2, 0xc

    .line 180
    .line 181
    invoke-direct {v1, v2}, Ls1/r;-><init>(I)V

    .line 182
    .line 183
    .line 184
    new-instance v2, Ls1/e;

    .line 185
    .line 186
    const-class v3, Lt1/h;

    .line 187
    .line 188
    invoke-direct {v2, v3, v1}, Ls1/e;-><init>(Ljava/lang/Class;Ls1/f;)V

    .line 189
    .line 190
    .line 191
    sput-object v2, Lu1/c;->e:Ls1/e;

    .line 192
    .line 193
    new-instance v1, Ls1/r;

    .line 194
    .line 195
    const/16 v2, 0xd

    .line 196
    .line 197
    invoke-direct {v1, v2}, Ls1/r;-><init>(I)V

    .line 198
    .line 199
    .line 200
    new-instance v2, Ls1/c;

    .line 201
    .line 202
    invoke-direct {v2, v0, v1}, Ls1/c;-><init>(Lz1/a;Ls1/d;)V

    .line 203
    .line 204
    .line 205
    sput-object v2, Lu1/c;->f:Ls1/c;

    .line 206
    .line 207
    return-void
.end method
