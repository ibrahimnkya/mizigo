.class public final LQ3/l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements LQ3/e;


# instance fields
.field public final synthetic e:I

.field public final f:Ljava/lang/Object;

.field public final g:Ljava/lang/Object;

.field public final h:Ljava/lang/Object;


# direct methods
.method public constructor <init>(LI3/n;LQ3/e;LI/q;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, LQ3/l;->e:I

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LQ3/l;->f:Ljava/lang/Object;

    iput-object p2, p0, LQ3/l;->g:Ljava/lang/Object;

    iput-object p3, p0, LQ3/l;->h:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(LQ3/e;LA3/i;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, LQ3/l;->e:I

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    iput-object p2, p0, LQ3/l;->f:Ljava/lang/Object;

    .line 5
    invoke-static {p2}, LS3/b;->l(LA3/i;)Ljava/lang/Object;

    move-result-object p2

    iput-object p2, p0, LQ3/l;->g:Ljava/lang/Object;

    .line 6
    new-instance p2, LR3/q;

    const/4 v0, 0x0

    invoke-direct {p2, p1, v0}, LR3/q;-><init>(LQ3/e;LA3/d;)V

    iput-object p2, p0, LQ3/l;->h:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(LQ3/e;LM/d;Lv3/J;)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, LQ3/l;->e:I

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LQ3/l;->g:Ljava/lang/Object;

    iput-object p2, p0, LQ3/l;->f:Ljava/lang/Object;

    iput-object p3, p0, LQ3/l;->h:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;LA3/d;)Ljava/lang/Object;
    .locals 7

    .line 1
    iget v0, p0, LQ3/l;->e:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    instance-of v0, p2, Lv3/q;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    move-object v0, p2

    .line 11
    check-cast v0, Lv3/q;

    .line 12
    .line 13
    iget v1, v0, Lv3/q;->i:I

    .line 14
    .line 15
    const/high16 v2, -0x80000000

    .line 16
    .line 17
    and-int v3, v1, v2

    .line 18
    .line 19
    if-eqz v3, :cond_0

    .line 20
    .line 21
    sub-int/2addr v1, v2

    .line 22
    iput v1, v0, Lv3/q;->i:I

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    new-instance v0, Lv3/q;

    .line 26
    .line 27
    invoke-direct {v0, p0, p2}, Lv3/q;-><init>(LQ3/l;LA3/d;)V

    .line 28
    .line 29
    .line 30
    :goto_0
    iget-object p2, v0, Lv3/q;->h:Ljava/lang/Object;

    .line 31
    .line 32
    iget v1, v0, Lv3/q;->i:I

    .line 33
    .line 34
    const/4 v2, 0x1

    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    if-ne v1, v2, :cond_1

    .line 38
    .line 39
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 44
    .line 45
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 46
    .line 47
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    throw p1

    .line 51
    :cond_2
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    iget-object p2, p0, LQ3/l;->g:Ljava/lang/Object;

    .line 55
    .line 56
    check-cast p2, LQ3/e;

    .line 57
    .line 58
    check-cast p1, LM/b;

    .line 59
    .line 60
    iget-object v1, p0, LQ3/l;->f:Ljava/lang/Object;

    .line 61
    .line 62
    check-cast v1, LM/d;

    .line 63
    .line 64
    invoke-virtual {p1, v1}, LM/b;->c(LM/d;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iget-object v1, p0, LQ3/l;->h:Ljava/lang/Object;

    .line 69
    .line 70
    check-cast v1, Lv3/J;

    .line 71
    .line 72
    iget-object v1, v1, Lv3/J;->g:LK0/h;

    .line 73
    .line 74
    invoke-static {p1, v1}, Lv3/K;->c(Ljava/lang/Object;LK0/h;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    check-cast p1, Ljava/lang/Double;

    .line 79
    .line 80
    iput v2, v0, Lv3/q;->i:I

    .line 81
    .line 82
    invoke-interface {p2, p1, v0}, LQ3/e;->b(Ljava/lang/Object;LA3/d;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    sget-object p2, LB3/a;->e:LB3/a;

    .line 87
    .line 88
    if-ne p1, p2, :cond_3

    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_3
    :goto_1
    sget-object p2, Ly3/h;->a:Ly3/h;

    .line 92
    .line 93
    :goto_2
    return-object p2

    .line 94
    :pswitch_0
    iget-object v0, p0, LQ3/l;->f:Ljava/lang/Object;

    .line 95
    .line 96
    check-cast v0, LA3/i;

    .line 97
    .line 98
    iget-object v1, p0, LQ3/l;->h:Ljava/lang/Object;

    .line 99
    .line 100
    check-cast v1, LR3/q;

    .line 101
    .line 102
    iget-object v2, p0, LQ3/l;->g:Ljava/lang/Object;

    .line 103
    .line 104
    invoke-static {v0, p1, v2, v1, p2}, LR3/k;->b(LA3/i;Ljava/lang/Object;Ljava/lang/Object;LH3/p;LA3/d;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    sget-object p2, LB3/a;->e:LB3/a;

    .line 109
    .line 110
    if-ne p1, p2, :cond_4

    .line 111
    .line 112
    goto :goto_3

    .line 113
    :cond_4
    sget-object p1, Ly3/h;->a:Ly3/h;

    .line 114
    .line 115
    :goto_3
    return-object p1

    .line 116
    :pswitch_1
    instance-of v0, p2, LQ3/k;

    .line 117
    .line 118
    if-eqz v0, :cond_5

    .line 119
    .line 120
    move-object v0, p2

    .line 121
    check-cast v0, LQ3/k;

    .line 122
    .line 123
    iget v1, v0, LQ3/k;->l:I

    .line 124
    .line 125
    const/high16 v2, -0x80000000

    .line 126
    .line 127
    and-int v3, v1, v2

    .line 128
    .line 129
    if-eqz v3, :cond_5

    .line 130
    .line 131
    sub-int/2addr v1, v2

    .line 132
    iput v1, v0, LQ3/k;->l:I

    .line 133
    .line 134
    goto :goto_4

    .line 135
    :cond_5
    new-instance v0, LQ3/k;

    .line 136
    .line 137
    invoke-direct {v0, p0, p2}, LQ3/k;-><init>(LQ3/l;LA3/d;)V

    .line 138
    .line 139
    .line 140
    :goto_4
    iget-object p2, v0, LQ3/k;->j:Ljava/lang/Object;

    .line 141
    .line 142
    iget v1, v0, LQ3/k;->l:I

    .line 143
    .line 144
    const/4 v2, 0x3

    .line 145
    const/4 v3, 0x2

    .line 146
    sget-object v4, Ly3/h;->a:Ly3/h;

    .line 147
    .line 148
    const/4 v5, 0x1

    .line 149
    sget-object v6, LB3/a;->e:LB3/a;

    .line 150
    .line 151
    if-eqz v1, :cond_9

    .line 152
    .line 153
    if-eq v1, v5, :cond_6

    .line 154
    .line 155
    if-eq v1, v3, :cond_8

    .line 156
    .line 157
    if-ne v1, v2, :cond_7

    .line 158
    .line 159
    :cond_6
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 160
    .line 161
    .line 162
    goto :goto_7

    .line 163
    :cond_7
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 164
    .line 165
    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 166
    .line 167
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    throw p1

    .line 171
    :cond_8
    iget-object p1, v0, LQ3/k;->i:Ljava/lang/Object;

    .line 172
    .line 173
    iget-object v1, v0, LQ3/k;->h:LQ3/l;

    .line 174
    .line 175
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 176
    .line 177
    .line 178
    goto :goto_5

    .line 179
    :cond_9
    invoke-static {p2}, LV0/g;->E(Ljava/lang/Object;)V

    .line 180
    .line 181
    .line 182
    iget-object p2, p0, LQ3/l;->f:Ljava/lang/Object;

    .line 183
    .line 184
    check-cast p2, LI3/n;

    .line 185
    .line 186
    iget-boolean p2, p2, LI3/n;->e:Z

    .line 187
    .line 188
    if-eqz p2, :cond_a

    .line 189
    .line 190
    iget-object p2, p0, LQ3/l;->g:Ljava/lang/Object;

    .line 191
    .line 192
    check-cast p2, LQ3/e;

    .line 193
    .line 194
    iput v5, v0, LQ3/k;->l:I

    .line 195
    .line 196
    invoke-interface {p2, p1, v0}, LQ3/e;->b(Ljava/lang/Object;LA3/d;)Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    if-ne p1, v6, :cond_c

    .line 201
    .line 202
    goto :goto_6

    .line 203
    :cond_a
    iget-object p2, p0, LQ3/l;->h:Ljava/lang/Object;

    .line 204
    .line 205
    check-cast p2, LI/q;

    .line 206
    .line 207
    iput-object p0, v0, LQ3/k;->h:LQ3/l;

    .line 208
    .line 209
    iput-object p1, v0, LQ3/k;->i:Ljava/lang/Object;

    .line 210
    .line 211
    iput v3, v0, LQ3/k;->l:I

    .line 212
    .line 213
    invoke-virtual {p2, p1, v0}, LI/q;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object p2

    .line 217
    if-ne p2, v6, :cond_b

    .line 218
    .line 219
    goto :goto_6

    .line 220
    :cond_b
    move-object v1, p0

    .line 221
    :goto_5
    check-cast p2, Ljava/lang/Boolean;

    .line 222
    .line 223
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 224
    .line 225
    .line 226
    move-result p2

    .line 227
    if-nez p2, :cond_c

    .line 228
    .line 229
    iget-object p2, v1, LQ3/l;->f:Ljava/lang/Object;

    .line 230
    .line 231
    check-cast p2, LI3/n;

    .line 232
    .line 233
    iput-boolean v5, p2, LI3/n;->e:Z

    .line 234
    .line 235
    iget-object p2, v1, LQ3/l;->g:Ljava/lang/Object;

    .line 236
    .line 237
    check-cast p2, LQ3/e;

    .line 238
    .line 239
    const/4 v1, 0x0

    .line 240
    iput-object v1, v0, LQ3/k;->h:LQ3/l;

    .line 241
    .line 242
    iput-object v1, v0, LQ3/k;->i:Ljava/lang/Object;

    .line 243
    .line 244
    iput v2, v0, LQ3/k;->l:I

    .line 245
    .line 246
    invoke-interface {p2, p1, v0}, LQ3/e;->b(Ljava/lang/Object;LA3/d;)Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    if-ne p1, v6, :cond_c

    .line 251
    .line 252
    :goto_6
    move-object v4, v6

    .line 253
    :cond_c
    :goto_7
    return-object v4

    .line 254
    nop

    .line 255
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
